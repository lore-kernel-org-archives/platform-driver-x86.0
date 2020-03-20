From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 18/22] powercap/intel_rapl: Convert to new X86 CPU match
 macros
Date: Fri, 20 Mar 2020 14:14:03 +0100
Message-ID: <20200320131510.501728797@linutronix.de>
References: <20200320131345.635023594@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-edac@vger.kernel.org, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Chanwoo
List-Id: platform-driver-x86.vger.kernel.org

The new macro set has a consistent namespace and uses C99 initializers
instead of the grufty C89 ones.

Get rid the of the local macro wrappers for consistency.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-pm@vger.kernel.org
---
 drivers/powercap/intel_rapl_common.c |   81 +++++++++++++++++------------------
 1 file changed, 40 insertions(+), 41 deletions(-)

--- a/drivers/powercap/intel_rapl_common.c
+++ b/drivers/powercap/intel_rapl_common.c
@@ -951,52 +951,51 @@ static const struct rapl_defaults rapl_d
 };
 
 static const struct x86_cpu_id rapl_ids[] __initconst = {
-	INTEL_CPU_FAM6(SANDYBRIDGE, rapl_defaults_core),
-	INTEL_CPU_FAM6(SANDYBRIDGE_X, rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(SANDYBRIDGE,		&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(SANDYBRIDGE_X,	&rapl_defaults_core),
 
-	INTEL_CPU_FAM6(IVYBRIDGE, rapl_defaults_core),
-	INTEL_CPU_FAM6(IVYBRIDGE_X, rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(IVYBRIDGE,		&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(IVYBRIDGE_X,		&rapl_defaults_core),
 
-	INTEL_CPU_FAM6(HASWELL, rapl_defaults_core),
-	INTEL_CPU_FAM6(HASWELL_L, rapl_defaults_core),
-	INTEL_CPU_FAM6(HASWELL_G, rapl_defaults_core),
-	INTEL_CPU_FAM6(HASWELL_X, rapl_defaults_hsw_server),
-
-	INTEL_CPU_FAM6(BROADWELL, rapl_defaults_core),
-	INTEL_CPU_FAM6(BROADWELL_G, rapl_defaults_core),
-	INTEL_CPU_FAM6(BROADWELL_D, rapl_defaults_core),
-	INTEL_CPU_FAM6(BROADWELL_X, rapl_defaults_hsw_server),
-
-	INTEL_CPU_FAM6(SKYLAKE, rapl_defaults_core),
-	INTEL_CPU_FAM6(SKYLAKE_L, rapl_defaults_core),
-	INTEL_CPU_FAM6(SKYLAKE_X, rapl_defaults_hsw_server),
-	INTEL_CPU_FAM6(KABYLAKE_L, rapl_defaults_core),
-	INTEL_CPU_FAM6(KABYLAKE, rapl_defaults_core),
-	INTEL_CPU_FAM6(CANNONLAKE_L, rapl_defaults_core),
-	INTEL_CPU_FAM6(ICELAKE_L, rapl_defaults_core),
-	INTEL_CPU_FAM6(ICELAKE, rapl_defaults_core),
-	INTEL_CPU_FAM6(ICELAKE_NNPI, rapl_defaults_core),
-	INTEL_CPU_FAM6(ICELAKE_X, rapl_defaults_hsw_server),
-	INTEL_CPU_FAM6(ICELAKE_D, rapl_defaults_hsw_server),
-	INTEL_CPU_FAM6(COMETLAKE_L, rapl_defaults_core),
-	INTEL_CPU_FAM6(COMETLAKE, rapl_defaults_core),
-	INTEL_CPU_FAM6(TIGERLAKE_L, rapl_defaults_core),
-
-	INTEL_CPU_FAM6(ATOM_SILVERMONT, rapl_defaults_byt),
-	INTEL_CPU_FAM6(ATOM_AIRMONT, rapl_defaults_cht),
-	INTEL_CPU_FAM6(ATOM_SILVERMONT_MID, rapl_defaults_tng),
-	INTEL_CPU_FAM6(ATOM_AIRMONT_MID, rapl_defaults_ann),
-	INTEL_CPU_FAM6(ATOM_GOLDMONT, rapl_defaults_core),
-	INTEL_CPU_FAM6(ATOM_GOLDMONT_PLUS, rapl_defaults_core),
-	INTEL_CPU_FAM6(ATOM_GOLDMONT_D, rapl_defaults_core),
-	INTEL_CPU_FAM6(ATOM_TREMONT_D, rapl_defaults_core),
-	INTEL_CPU_FAM6(ATOM_TREMONT_L, rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(HASWELL,		&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(HASWELL_L,		&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(HASWELL_G,		&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(HASWELL_X,		&rapl_defaults_hsw_server),
+
+	X86_MATCH_INTEL_FAM6_MODEL(BROADWELL,		&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(BROADWELL_G,		&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(BROADWELL_D,		&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(BROADWELL_X,		&rapl_defaults_hsw_server),
+
+	X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE,		&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE_L,		&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE_X,		&rapl_defaults_hsw_server),
+	X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE_L,		&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE,		&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(CANNONLAKE_L,	&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_L,		&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE,		&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_NNPI,	&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_X,		&rapl_defaults_hsw_server),
+	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_D,		&rapl_defaults_hsw_server),
+	X86_MATCH_INTEL_FAM6_MODEL(COMETLAKE_L,		&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(COMETLAKE,		&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(TIGERLAKE_L,		&rapl_defaults_core),
+
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT,	&rapl_defaults_byt),
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_AIRMONT,	&rapl_defaults_cht),
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT_MID,	&rapl_defaults_tng),
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_AIRMONT_MID,	&rapl_defaults_ann),
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT,	&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT_PLUS,	&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT_D,	&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_TREMONT_D,	&rapl_defaults_core),
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_TREMONT_L,	&rapl_defaults_core),
 
-	INTEL_CPU_FAM6(XEON_PHI_KNL, rapl_defaults_hsw_server),
-	INTEL_CPU_FAM6(XEON_PHI_KNM, rapl_defaults_hsw_server),
+	X86_MATCH_INTEL_FAM6_MODEL(XEON_PHI_KNL,	&rapl_defaults_hsw_server),
+	X86_MATCH_INTEL_FAM6_MODEL(XEON_PHI_KNM,	&rapl_defaults_hsw_server),
 	{}
 };
-
 MODULE_DEVICE_TABLE(x86cpu, rapl_ids);
 
 /* Read once for all raw primitive data for domains */
