From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 13/22] thermal: Convert to new X86 CPU match macros
Date: Fri, 20 Mar 2020 14:13:58 +0100
Message-ID: <20200320131509.967017771@linutronix.de>
References: <20200320131345.635023594@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, linux-pm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-edac@vger.kernel.org, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, Chanwoo
List-Id: platform-driver-x86.vger.kernel.org

The new macro set has a consistent namespace and uses C99 initializers
instead of the grufty C89 ones.

Get rid the of the local QUARK defines and use the proper ones.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Amit Kucheria <amit.kucheria@verdurent.com>
Cc: linux-pm@vger.kernel.org
---
 drivers/thermal/intel/intel_powerclamp.c        |    2 +-
 drivers/thermal/intel/intel_quark_dts_thermal.c |    5 +----
 drivers/thermal/intel/intel_soc_dts_thermal.c   |    3 +--
 drivers/thermal/intel/x86_pkg_temp_thermal.c    |    2 +-
 4 files changed, 4 insertions(+), 8 deletions(-)

--- a/drivers/thermal/intel/intel_powerclamp.c
+++ b/drivers/thermal/intel/intel_powerclamp.c
@@ -651,7 +651,7 @@ static struct thermal_cooling_device_ops
 };
 
 static const struct x86_cpu_id __initconst intel_powerclamp_ids[] = {
-	{ X86_VENDOR_INTEL, X86_FAMILY_ANY, X86_MODEL_ANY, X86_FEATURE_MWAIT },
+	X86_MATCH_VENDOR_FEATURE(INTEL, X86_FEATURE_MWAIT, NULL),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, intel_powerclamp_ids);
--- a/drivers/thermal/intel/intel_quark_dts_thermal.c
+++ b/drivers/thermal/intel/intel_quark_dts_thermal.c
@@ -64,9 +64,6 @@
 #include <asm/cpu_device_id.h>
 #include <asm/iosf_mbi.h>
 
-#define X86_FAMILY_QUARK	0x5
-#define X86_MODEL_QUARK_X1000	0x9
-
 /* DTS reset is programmed via QRK_MBI_UNIT_SOC */
 #define QRK_DTS_REG_OFFSET_RESET	0x34
 #define QRK_DTS_RESET_BIT		BIT(0)
@@ -433,7 +430,7 @@ static struct soc_sensor_entry *alloc_so
 }
 
 static const struct x86_cpu_id qrk_thermal_ids[] __initconst  = {
-	{ X86_VENDOR_INTEL, X86_FAMILY_QUARK, X86_MODEL_QUARK_X1000 },
+	X86_MATCH_VENDOR_FAM_MODEL(INTEL, 5, INTEL_FAM5_QUARK_X1000, NULL),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, qrk_thermal_ids);
--- a/drivers/thermal/intel/intel_soc_dts_thermal.c
+++ b/drivers/thermal/intel/intel_soc_dts_thermal.c
@@ -36,8 +36,7 @@ static irqreturn_t soc_irq_thread_fn(int
 }
 
 static const struct x86_cpu_id soc_thermal_ids[] = {
-	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ATOM_SILVERMONT, 0,
-		BYT_SOC_DTS_APIC_IRQ},
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT, BYT_SOC_DTS_APIC_IRQ),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, soc_thermal_ids);
--- a/drivers/thermal/intel/x86_pkg_temp_thermal.c
+++ b/drivers/thermal/intel/x86_pkg_temp_thermal.c
@@ -478,7 +478,7 @@ static int pkg_thermal_cpu_online(unsign
 }
 
 static const struct x86_cpu_id __initconst pkg_temp_thermal_ids[] = {
-	{ X86_VENDOR_INTEL, X86_FAMILY_ANY, X86_MODEL_ANY, X86_FEATURE_PTS },
+	X86_MATCH_VENDOR_FEATURE(INTEL, X86_FEATURE_PTS, NULL),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, pkg_temp_thermal_ids);
