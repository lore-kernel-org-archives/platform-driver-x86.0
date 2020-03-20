From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 10/22] EDAC: Convert to new X86 CPU match macros
Date: Fri, 20 Mar 2020 14:13:55 +0100
Message-ID: <20200320131509.673579000@linutronix.de>
References: <20200320131345.635023594@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Chanw
List-Id: platform-driver-x86.vger.kernel.org

The new macro set has a consistent namespace and uses C99 initializers
instead of the grufty C89 ones.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-edac@vger.kernel.org
---
 drivers/edac/amd64_edac.c |   14 +++++++-------
 drivers/edac/i10nm_base.c |    8 ++++----
 drivers/edac/pnd2_edac.c  |    4 ++--
 drivers/edac/sb_edac.c    |   14 +++++++-------
 drivers/edac/skx_base.c   |    2 +-
 5 files changed, 21 insertions(+), 21 deletions(-)

--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -3626,13 +3626,13 @@ static void setup_pci_device(void)
 }
 
 static const struct x86_cpu_id amd64_cpuids[] = {
-	{ X86_VENDOR_AMD, 0xF,	X86_MODEL_ANY,	X86_FEATURE_ANY, 0 },
-	{ X86_VENDOR_AMD, 0x10, X86_MODEL_ANY,	X86_FEATURE_ANY, 0 },
-	{ X86_VENDOR_AMD, 0x15, X86_MODEL_ANY,	X86_FEATURE_ANY, 0 },
-	{ X86_VENDOR_AMD, 0x16, X86_MODEL_ANY,	X86_FEATURE_ANY, 0 },
-	{ X86_VENDOR_AMD, 0x17, X86_MODEL_ANY,	X86_FEATURE_ANY, 0 },
-	{ X86_VENDOR_HYGON, 0x18, X86_MODEL_ANY, X86_FEATURE_ANY, 0 },
-	{ X86_VENDOR_AMD, 0x19, X86_MODEL_ANY,	X86_FEATURE_ANY, 0 },
+	X86_MATCH_VENDOR_FAM(AMD,	0x0F, NULL),
+	X86_MATCH_VENDOR_FAM(AMD,	0x10, NULL),
+	X86_MATCH_VENDOR_FAM(AMD,	0x15, NULL),
+	X86_MATCH_VENDOR_FAM(AMD,	0x16, NULL),
+	X86_MATCH_VENDOR_FAM(AMD,	0x17, NULL),
+	X86_MATCH_VENDOR_FAM(HYGON,	0x18, NULL),
+	X86_MATCH_VENDOR_FAM(AMD,	0x19, NULL),
 	{ }
 };
 MODULE_DEVICE_TABLE(x86cpu, amd64_cpuids);
--- a/drivers/edac/i10nm_base.c
+++ b/drivers/edac/i10nm_base.c
@@ -123,10 +123,10 @@ static int i10nm_get_all_munits(void)
 }
 
 static const struct x86_cpu_id i10nm_cpuids[] = {
-	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ATOM_TREMONT_D, 0, 0 },
-	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ICELAKE_X, 0, 0 },
-	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ICELAKE_D, 0, 0 },
-	{ }
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_TREMONT_D,	NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_X,		NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_D,		NULL),
+	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, i10nm_cpuids);
 
--- a/drivers/edac/pnd2_edac.c
+++ b/drivers/edac/pnd2_edac.c
@@ -1537,8 +1537,8 @@ static struct dunit_ops dnv_ops = {
 };
 
 static const struct x86_cpu_id pnd2_cpuids[] = {
-	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ATOM_GOLDMONT, 0, (kernel_ulong_t)&apl_ops },
-	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ATOM_GOLDMONT_D, 0, (kernel_ulong_t)&dnv_ops },
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT,	&apl_ops),
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT_D,	&dnv_ops),
 	{ }
 };
 MODULE_DEVICE_TABLE(x86cpu, pnd2_cpuids);
--- a/drivers/edac/sb_edac.c
+++ b/drivers/edac/sb_edac.c
@@ -3420,13 +3420,13 @@ static int sbridge_register_mci(struct s
 }
 
 static const struct x86_cpu_id sbridge_cpuids[] = {
-	INTEL_CPU_FAM6(SANDYBRIDGE_X,	  pci_dev_descr_sbridge_table),
-	INTEL_CPU_FAM6(IVYBRIDGE_X,	  pci_dev_descr_ibridge_table),
-	INTEL_CPU_FAM6(HASWELL_X,	  pci_dev_descr_haswell_table),
-	INTEL_CPU_FAM6(BROADWELL_X,	  pci_dev_descr_broadwell_table),
-	INTEL_CPU_FAM6(BROADWELL_D,	  pci_dev_descr_broadwell_table),
-	INTEL_CPU_FAM6(XEON_PHI_KNL,	  pci_dev_descr_knl_table),
-	INTEL_CPU_FAM6(XEON_PHI_KNM,	  pci_dev_descr_knl_table),
+	X86_MATCH_INTEL_FAM6_MODEL(SANDYBRIDGE_X, &pci_dev_descr_sbridge_table),
+	X86_MATCH_INTEL_FAM6_MODEL(IVYBRIDGE_X,	  &pci_dev_descr_ibridge_table),
+	X86_MATCH_INTEL_FAM6_MODEL(HASWELL_X,	  &pci_dev_descr_haswell_table),
+	X86_MATCH_INTEL_FAM6_MODEL(BROADWELL_X,	  &pci_dev_descr_broadwell_table),
+	X86_MATCH_INTEL_FAM6_MODEL(BROADWELL_D,	  &pci_dev_descr_broadwell_table),
+	X86_MATCH_INTEL_FAM6_MODEL(XEON_PHI_KNL,  &pci_dev_descr_knl_table),
+	X86_MATCH_INTEL_FAM6_MODEL(XEON_PHI_KNM,  &pci_dev_descr_knl_table),
 	{ }
 };
 MODULE_DEVICE_TABLE(x86cpu, sbridge_cpuids);
--- a/drivers/edac/skx_base.c
+++ b/drivers/edac/skx_base.c
@@ -158,7 +158,7 @@ static int get_all_munits(const struct m
 }
 
 static const struct x86_cpu_id skx_cpuids[] = {
-	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_SKYLAKE_X, 0, 0 },
+	X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE_X,	NULL),
 	{ }
 };
 MODULE_DEVICE_TABLE(x86cpu, skx_cpuids);
