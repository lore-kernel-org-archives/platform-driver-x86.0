From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2] platform: x86: Support Turbo Boost Max 3.0 for non HWP systems
Date: Wed, 18 Jan 2017 10:29:15 -0800
Message-ID: <1484764155-183890-1-git-send-email-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andriy.shevchenko@intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On platforms supporting Intel Turbo Boost Max Technology 3.0, the
maximum turbo frequencies (turbo ratio) of some cores in a CPU package
may be higher than the other cores in the same package.  In that case,
better performance can be achieved by making the scheduler prefer to run
tasks on the CPUs with higher max turbo frequencies.

On Intel® Broadwell Xeon systems, it is optional to turn on HWP
(Hardware P-States). When HWP is not turned on, the BIOS doesn't
present required CPPC (Collaborative Processor Performance Control)
tables. This table is used to get the per CPU core maximum performance
ratio and inform scheduler (in cpufreq/intel_pstate driver).

On such systems the maximum performance ratio can be read via over
clocking (OC) mailbox interface for each CPU. This interface is not
architectural and can change for every model of processors.

This driver reads maximum performance ratio of each CPU and set up
the scheduler priority metrics. In this way scheduler can prefer CPU
with higher performance to schedule tasks.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
Change log:
v2:
- No functional change
- Config renamed from INTEL_TURBO_BOOST_MAX_ENUMERATION to INTEL_TURBO_MAX_3
- file renamed from intel_turbo_boost_max_enum.c to intel_turbo_max_3.c
- Add "All rights reserved." in copyright header
- Shorten lines by combining variable definition to single lines

 drivers/platform/x86/Kconfig             |  10 ++
 drivers/platform/x86/Makefile            |   1 +
 drivers/platform/x86/intel_turbo_max_3.c | 152 +++++++++++++++++++++++++++++++
 3 files changed, 163 insertions(+)
 create mode 100644 drivers/platform/x86/intel_turbo_max_3.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 59aa8e3..081f07a 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1076,4 +1076,14 @@ config MLX_CPLD_PLATFORM
 	  This driver handles hot-plug events for the power suppliers, power
 	  cables and fans on the wide range Mellanox IB and Ethernet systems.
 
+config INTEL_TURBO_MAX_3
+	bool "Intel Turbo Boost Max Technology 3.0 enumeration driver"
+	depends on X86_64 && SCHED_MC_PRIO
+	---help---
+	  This driver reads maximum performance ratio of each CPU and set up
+	  the scheduler priority metrics. In this way scheduler can prefer
+	  CPU with higher performance to schedule tasks.
+	  This driver is only required when the system is not using Hardware
+	  P-States (HWP). In HWP mode, priority can be read from ACPI tables.
+
 endif # X86_PLATFORM_DEVICES
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index d4111f0..cde7b4f 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -76,3 +76,4 @@ obj-$(CONFIG_INTEL_TELEMETRY)	+= intel_telemetry_core.o \
 obj-$(CONFIG_INTEL_PMC_CORE)    += intel_pmc_core.o
 obj-$(CONFIG_MLX_PLATFORM)	+= mlx-platform.o
 obj-$(CONFIG_MLX_CPLD_PLATFORM)	+= mlxcpld-hotplug.o
+obj-$(CONFIG_INTEL_TURBO_MAX_3) += intel_turbo_max_3.o
diff --git a/drivers/platform/x86/intel_turbo_max_3.c b/drivers/platform/x86/intel_turbo_max_3.c
new file mode 100644
index 0000000..0103f5b
--- /dev/null
+++ b/drivers/platform/x86/intel_turbo_max_3.c
@@ -0,0 +1,152 @@
+/*
+ * Intel Turbo Boost Max Technology 3.0 legacy (non HWP) enumeration driver
+ * Copyright (c) 2017, Intel Corporation.
+ * All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/cpuhotplug.h>
+#include <linux/cpufeature.h>
+#include <asm/cpu_device_id.h>
+#include <asm/intel-family.h>
+
+#define MSR_OC_MAILBOX			0x150
+#define MSR_OC_MAILBOX_CMD_OFFSET	32
+#define MSR_OC_MAILBOX_RSP_OFFSET	32
+#define MSR_OC_MAILBOX_BUSY_BIT		63
+#define OC_MAILBOX_FC_CONTROL_CMD	0x1C
+
+/*
+ * Typical latency to get mail box response is ~3us, It takes +3 us to
+ * process reading mailbox after issuing mailbox write on a Broadwell 3.4 GHz
+ * system. So for most of the time, the first mailbox read should have the
+ * response, but to avoid some boundary cases retry twice.
+ */
+#define OC_MAILBOX_RETRY_COUNT		2
+
+static int get_oc_core_priority(unsigned int cpu)
+{
+	u64 value, cmd = OC_MAILBOX_FC_CONTROL_CMD;
+	int ret, i;
+
+	/* Issue favored core read command */
+	value = cmd << MSR_OC_MAILBOX_CMD_OFFSET;
+	/* Set the busy bit to indicate OS is trying to issue command */
+	value |=  BIT_ULL(MSR_OC_MAILBOX_BUSY_BIT);
+	ret = wrmsrl_safe(MSR_OC_MAILBOX, value);
+	if (ret) {
+		pr_debug("cpu %d OC mailbox write failed\n", cpu);
+		return ret;
+	}
+
+	for (i = 0; i < OC_MAILBOX_RETRY_COUNT; ++i) {
+		ret = rdmsrl_safe(MSR_OC_MAILBOX, &value);
+		if (ret) {
+			pr_debug("cpu %d OC mailbox read failed\n", cpu);
+			break;
+		}
+
+		if (value & BIT_ULL(MSR_OC_MAILBOX_BUSY_BIT)) {
+			pr_debug("cpu %d OC mailbox still processing\n", cpu);
+			ret = -EBUSY;
+			continue;
+		}
+
+		if ((value >> MSR_OC_MAILBOX_RSP_OFFSET) & 0xff) {
+			pr_debug("cpu %d OC mailbox cmd failed\n", cpu);
+			ret = -ENXIO;
+			break;
+		}
+
+		ret = value & 0xff;
+		pr_debug("cpu %d max_ratio %d\n", cpu, ret);
+		break;
+	}
+
+	return ret;
+}
+
+/*
+ * The work item is needed to avoid CPU hotplug locking issues. The function
+ * itmt_legacy_set_priority() is called from CPU online callback, so can't
+ * call sched_set_itmt_support() from there as this function will aquire
+ * hotplug locks in its path.
+ */
+static void itmt_legacy_work_fn(struct work_struct *work)
+{
+	sched_set_itmt_support();
+}
+
+static DECLARE_WORK(sched_itmt_work, itmt_legacy_work_fn);
+
+static int itmt_legacy_cpu_online(unsigned int cpu)
+{
+	static u32 max_highest_perf = 0, min_highest_perf = U32_MAX;
+	int priority;
+
+	priority = get_oc_core_priority(cpu);
+	if (priority < 0)
+		return 0;
+
+	sched_set_itmt_core_prio(priority, cpu);
+
+	/* Enable ITMT feature when a core with different priority is found */
+	if (max_highest_perf <= min_highest_perf) {
+		if (priority > max_highest_perf)
+			max_highest_perf = priority;
+
+		if (priority < min_highest_perf)
+			min_highest_perf = priority;
+
+		if (max_highest_perf > min_highest_perf)
+			schedule_work(&sched_itmt_work);
+	}
+
+	return 0;
+}
+
+#define ICPU(model)     { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
+
+static const struct x86_cpu_id itmt_legacy_cpu_ids[] = {
+	ICPU(INTEL_FAM6_BROADWELL_X),
+	{}
+};
+MODULE_DEVICE_TABLE(x86cpu, itmt_legacy_cpu_ids);
+
+static int __init itmt_legacy_init(void)
+{
+	const struct x86_cpu_id *id;
+	int ret;
+
+	id = x86_match_cpu(itmt_legacy_cpu_ids);
+	if (!id)
+		return -ENODEV;
+
+	if (boot_cpu_has(X86_FEATURE_HWP))
+		return -ENODEV;
+
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+				"platform/x86/turbo_max_3:online",
+				itmt_legacy_cpu_online,	NULL);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+late_initcall(itmt_legacy_init)
+
+MODULE_DESCRIPTION("Intel Turbo Boost Max 3.0 enumeration driver");
+MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4
