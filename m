From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Subject: [PATCH 2/2] x86/quark: Add Quark embedded SRAM self-test
Date: Mon,  4 May 2015 03:17:55 +0100
Message-ID: <1430705875-6990-3-git-send-email-pure.logic@nexus-software.ie>
References: <1430705875-6990-1-git-send-email-pure.logic@nexus-software.ie>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430705875-6990-1-git-send-email-pure.logic@nexus-software.ie>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, dvhart@infradead.org, pure.logic@nexus-software.ie, andy.schevchenko@gmail.com, boon.leong.ong@intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: derek.browne@intel.com, josef.ahmad@intel.com, erik.nyquist@intel.com
List-Id: platform-driver-x86.vger.kernel.org

Quark X1000 contains an embedded SRAM (eSRAM) a fast access SRAM. This code
is a self-test routine to measure the performance of that SRAM for
different read-values. The tests are designed the performance gains
provided by eSRAM using different read-sizes and comparing the performance
of eSRAM overlayed DRAM to raw DRAM.

Signed-off-by: Bryan O'Donoghue <pure.logic@nexus-software.ie>
---
 arch/x86/Kconfig.debug                         |  13 ++
 arch/x86/platform/intel-quark/Makefile         |   1 +
 arch/x86/platform/intel-quark/esram_selftest.c | 159 +++++++++++++++++++++++++
 3 files changed, 173 insertions(+)
 create mode 100644 arch/x86/platform/intel-quark/esram_selftest.c

diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
index 72484a6..bb62174 100644
--- a/arch/x86/Kconfig.debug
+++ b/arch/x86/Kconfig.debug
@@ -322,6 +322,19 @@ config DEBUG_IMR_SELFTEST
 
 	  If unsure say N here.
 
+config DEBUG_ESRAM_SELFTEST
+	bool "Embedded SRAM self test"
+	default n
+	depends on INTEL_ESRAM
+	---help---
+	  This option enables automated sanity testing of the eSRAM driver
+	  on Quark X1000. A simple set of tests with performance metrics
+	  measured a DRAM baseline are run. These tests show the measured
+	  performance increase across a given memory size for a series of
+	  incrementing read sizes.
+
+	  If unsure say N here.
+
 config X86_DEBUG_STATIC_CPU_HAS
 	bool "Debug alternatives"
 	depends on DEBUG_KERNEL
diff --git a/arch/x86/platform/intel-quark/Makefile b/arch/x86/platform/intel-quark/Makefile
index 94adb0b..dc466be 100644
--- a/arch/x86/platform/intel-quark/Makefile
+++ b/arch/x86/platform/intel-quark/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_INTEL_IMR) += imr.o
 obj-$(CONFIG_INTEL_ESRAM) += esram.o
 obj-$(CONFIG_DEBUG_IMR_SELFTEST) += imr_selftest.o
+obj-$(CONFIG_DEBUG_ESRAM_SELFTEST) += esram_selftest.o
diff --git a/arch/x86/platform/intel-quark/esram_selftest.c b/arch/x86/platform/intel-quark/esram_selftest.c
new file mode 100644
index 0000000..7849dac
--- /dev/null
+++ b/arch/x86/platform/intel-quark/esram_selftest.c
@@ -0,0 +1,159 @@
+/**
+ * esram_selftest.c
+ *
+ * Copyright(c) 2015 Bryan O'Donoghue <pure.logic@nexus-software.ie>
+ *
+ * IMR self test. The purpose of this module is to run a set of tests on the
+ * IMR API to validate it's sanity. We check for overlapping, reserved
+ * addresses and setup/teardown sanity.
+ *
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <asm/cpu_device_id.h>
+#include <asm/esram.h>
+#include <linux/init.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+/**
+ * esram_self_test_time
+ *
+ * This function is carefully constructed to measure and verify the
+ * performance boost provided by eSRAM. We invalidate the cache with a
+ * wbinvd() and then perform a series of reads - each of which will cause a
+ * cacheline miss. We measure the aggregate time it takes to complete the
+ * series of reads and return the delta in cycles. The calling function will
+ * pass either a pointer to DRAM or a pointer to eSRAM.
+ *
+ * @param walker:	Pointer to RAM area to test.
+ * @return:		Number of cycles to complete test.
+ */
+static cycles_t esram_self_test_time(char *walker, ssize_t step, ssize_t size)
+{
+	volatile u32 dummy = 0;
+	int i;
+	int j;
+	cycle_t t1;
+	cycle_t t2;
+	u32 page_count = size / PAGE_SIZE;
+
+	local_irq_disable();
+	t1 = get_cycles();
+	for (i = 0; i < page_count; i++) {
+		for (j = 0; j < PAGE_SIZE/step; j++) {
+			dummy += *(u32 *)walker;
+			walker += step;
+		}
+	}
+	t2 = get_cycles();
+	local_irq_enable();
+
+	return t2 > t1 ? t2 - t1 : ULLONG_MAX - t2 + t1;
+}
+
+/**
+ * __get_percent - the the percentage that min is of max.
+ *
+ * @max:	The larger value.
+ * @min:	The smaller value.
+ * @return:	The % of the max that the min is.
+*/
+static inline u32 __get_percent(u32 max, u32 min)
+{
+	max = max/100UL;
+	return 100UL - (min/max);
+}
+
+/**
+ * esram_self_test
+ *
+ * Verify eSRAM self_test with some simple tests to verify overlap,
+ * zero sized allocations and 1 KiB sized areas.
+ *
+ * return:
+ */
+static void __init esram_self_test(void)
+{
+	bool pass;
+	size_t size = SZ_512K;
+	cycles_t t1;
+	cycles_t t2;
+	u32 percent;
+	char *dram_mem;
+	unsigned long esram_mem;
+	int i;
+	struct gen_pool *pool = esram_get_genpool();
+	size_t steps[] = { 8, 16, 32, 64, 128 };
+
+	if (pool == NULL) {
+		pr_err("unable to get esram_genpool pointer!\n");
+		return;
+	}
+
+	esram_mem = gen_pool_alloc(pool, size);
+	if (esram_mem == 0) {
+		pr_err("gen_pool_alloc of %d KiB fail!\n", size);
+		return;
+	}
+	dram_mem = kzalloc(GFP_KERNEL, size);
+	if (dram_mem == NULL)
+		goto err;
+
+	/* Cycle through a series of tests, measurng cycle times as we go. */
+	for (i = 0; i < sizeof(steps)/sizeof(size_t); i++) {
+		t1 = esram_self_test_time(dram_mem, steps[i], size);
+		t2 = esram_self_test_time((char *)esram_mem, steps[i], size);
+		pass = t2 < t1;
+		if (pass)
+			percent = __get_percent(t1, t2);
+		else
+			percent = __get_percent(t2, t1);
+		pr_info("%s, %d%% %s DRAM:%10llu cycles, eSRAM:%10llu cycles, step-size:%3d\n",
+			pass ? "pass" : "fail", percent, pass ? "better" : "worse",
+			t1, t2, steps[i]);
+	}
+err:
+	if (dram_mem != NULL)
+		kfree(dram_mem);
+	if (esram_mem != 0)
+		gen_pool_free(pool, esram_mem, size);
+}
+
+static const struct x86_cpu_id esram_ids[] __initconst = {
+	{ X86_VENDOR_INTEL, 5, 9 },	/* Intel Quark SoC X1000. */
+	{}
+};
+MODULE_DEVICE_TABLE(x86cpu, esram_ids);
+
+/**
+ * esram_self_test_init - entry point for IMR driver.
+ *
+ * return: -ENODEV for no IMR support 0 if good to go.
+ */
+static int __init esram_self_test_init(void)
+{
+	if (x86_match_cpu(esram_ids))
+		esram_self_test();
+	return 0;
+}
+
+/**
+ * esram_self_test_exit - exit point for IMR code.
+ *
+ * return:
+ */
+static void __exit esram_self_test_exit(void)
+{
+}
+
+module_init(esram_self_test_init);
+module_exit(esram_self_test_exit);
+
+MODULE_AUTHOR("Bryan O'Donoghue <pure.logic@nexus-software.ie>");
+MODULE_DESCRIPTION("Intel Quark eSRAM self-test driver");
+MODULE_LICENSE("Dual BSD/GPL");
-- 
1.9.1
