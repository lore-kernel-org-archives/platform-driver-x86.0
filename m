From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 07/22] x86/platform: Convert to new CPU match macros
Date: Fri, 20 Mar 2020 14:13:52 +0100
Message-ID: <20200320131509.359448901@linutronix.de>
References: <20200320131345.635023594@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-edac@vger.kernel.org, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Chanw
List-Id: platform-driver-x86.vger.kernel.org

The new macro set has a consistent namespace and uses C99 initializers
instead of the grufty C89 ones.

Get rid the of the local macro wrappers for consistency.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
---
 arch/x86/platform/atom/punit_atom_debug.c             |   13 ++++++-------
 arch/x86/platform/efi/quirks.c                        |    7 ++-----
 arch/x86/platform/intel-mid/device_libs/platform_bt.c |    5 +----
 arch/x86/platform/intel-quark/imr.c                   |    2 +-
 arch/x86/platform/intel-quark/imr_selftest.c          |    2 +-
 5 files changed, 11 insertions(+), 18 deletions(-)

--- a/arch/x86/platform/atom/punit_atom_debug.c
+++ b/arch/x86/platform/atom/punit_atom_debug.c
@@ -117,17 +117,16 @@ static void punit_dbgfs_unregister(void)
 	debugfs_remove_recursive(punit_dbg_file);
 }
 
-#define ICPU(model, drv_data) \
-	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_MWAIT,\
-	  (kernel_ulong_t)&drv_data }
+#define X86_MATCH(model, data)						 \
+	X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL, 6, INTEL_FAM6_##model, \
+					   X86_FEATURE_MWAIT, data)
 
 static const struct x86_cpu_id intel_punit_cpu_ids[] = {
-	ICPU(INTEL_FAM6_ATOM_SILVERMONT, punit_device_byt),
-	ICPU(INTEL_FAM6_ATOM_SILVERMONT_MID,  punit_device_tng),
-	ICPU(INTEL_FAM6_ATOM_AIRMONT,	  punit_device_cht),
+	X86_MATCH(ATOM_SILVERMONT,		&punit_device_byt),
+	X86_MATCH(ATOM_SILVERMONT_MID,		&punit_device_tng),
+	X86_MATCH(ATOM_AIRMONT,			&punit_device_cht),
 	{}
 };
-
 MODULE_DEVICE_TABLE(x86cpu, intel_punit_cpu_ids);
 
 static int __init punit_atom_debug_init(void)
--- a/arch/x86/platform/efi/quirks.c
+++ b/arch/x86/platform/efi/quirks.c
@@ -659,12 +659,9 @@ static int qrk_capsule_setup_info(struct
 	return 1;
 }
 
-#define ICPU(family, model, quirk_handler) \
-	{ X86_VENDOR_INTEL, family, model, X86_FEATURE_ANY, \
-	  (unsigned long)&quirk_handler }
-
 static const struct x86_cpu_id efi_capsule_quirk_ids[] = {
-	ICPU(5, 9, qrk_capsule_setup_info),	/* Intel Quark X1000 */
+	X86_MATCH_VENDOR_FAM_MODEL(INTEL, 5, INTEL_FAM5_QUARK_X1000,
+				   &qrk_capsule_setup_info),
 	{ }
 };
 
--- a/arch/x86/platform/intel-mid/device_libs/platform_bt.c
+++ b/arch/x86/platform/intel-mid/device_libs/platform_bt.c
@@ -60,11 +60,8 @@ static struct bt_sfi_data tng_bt_sfi_dat
 	.setup	= tng_bt_sfi_setup,
 };
 
-#define ICPU(model, ddata)	\
-	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (kernel_ulong_t)&ddata }
-
 static const struct x86_cpu_id bt_sfi_cpu_ids[] = {
-	ICPU(INTEL_FAM6_ATOM_SILVERMONT_MID, tng_bt_sfi_data),
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT_MID,	&tng_bt_sfi_data),
 	{}
 };
 
--- a/arch/x86/platform/intel-quark/imr.c
+++ b/arch/x86/platform/intel-quark/imr.c
@@ -569,7 +569,7 @@ static void __init imr_fixup_memmap(stru
 }
 
 static const struct x86_cpu_id imr_ids[] __initconst = {
-	{ X86_VENDOR_INTEL, 5, 9 },	/* Intel Quark SoC X1000. */
+	X86_MATCH_VENDOR_FAM_MODEL(INTEL, 5, INTEL_FAM5_QUARK_X1000, NULL),
 	{}
 };
 
--- a/arch/x86/platform/intel-quark/imr_selftest.c
+++ b/arch/x86/platform/intel-quark/imr_selftest.c
@@ -105,7 +105,7 @@ static void __init imr_self_test(void)
 }
 
 static const struct x86_cpu_id imr_ids[] __initconst = {
-	{ X86_VENDOR_INTEL, 5, 9 },	/* Intel Quark SoC X1000. */
+	X86_MATCH_VENDOR_FAM_MODEL(INTEL, 5, INTEL_FAM5_QUARK_X1000, NULL),
 	{}
 };
 
