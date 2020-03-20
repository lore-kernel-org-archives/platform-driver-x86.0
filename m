From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 12/22] hwmon: Convert to new X86 CPU match macros
Date: Fri, 20 Mar 2020 14:13:57 +0100
Message-ID: <20200320131509.859324598@linutronix.de>
References: <20200320131345.635023594@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-edac@vger.kernel.org, platform-driver-x86@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Chanw
List-Id: platform-driver-x86.vger.kernel.org

The new macro set has a consistent namespace and uses C99 initializers
instead of the grufty C89 ones.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
---
 drivers/hwmon/coretemp.c    |    2 +-
 drivers/hwmon/via-cputemp.c |    8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -709,7 +709,7 @@ static int coretemp_cpu_offline(unsigned
 	return 0;
 }
 static const struct x86_cpu_id __initconst coretemp_ids[] = {
-	{ X86_VENDOR_INTEL, X86_FAMILY_ANY, X86_MODEL_ANY, X86_FEATURE_DTHERM },
+	X86_MATCH_VENDOR_FEATURE(INTEL, X86_FEATURE_DTHERM, NULL),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, coretemp_ids);
--- a/drivers/hwmon/via-cputemp.c
+++ b/drivers/hwmon/via-cputemp.c
@@ -270,10 +270,10 @@ static int via_cputemp_down_prep(unsigne
 }
 
 static const struct x86_cpu_id __initconst cputemp_ids[] = {
-	{ X86_VENDOR_CENTAUR, 6, 0xa, }, /* C7 A */
-	{ X86_VENDOR_CENTAUR, 6, 0xd, }, /* C7 D */
-	{ X86_VENDOR_CENTAUR, 6, 0xf, }, /* Nano */
-	{ X86_VENDOR_CENTAUR, 7, X86_MODEL_ANY, },
+	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_C7_A,	NULL),
+	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_C7_D,	NULL),
+	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 6, X86_CENTAUR_FAM6_NANO,	NULL),
+	X86_MATCH_VENDOR_FAM_MODEL(CENTAUR, 7, X86_MODEL_ANY,		NULL),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, cputemp_ids);
