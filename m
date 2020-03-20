From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 14/22] extcon: axp288: Convert to new X86 CPU match macros
Date: Fri, 20 Mar 2020 14:13:59 +0100
Message-ID: <20200320131510.075227793@linutronix.de>
References: <20200320131345.635023594@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, Chanwoo Choi <cw00.choi@samsung.com>, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-edac@vger.kernel.org, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit
List-Id: platform-driver-x86.vger.kernel.org

The new macro set has a consistent namespace and uses C99 initializers
instead of the grufty C89 ones.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/extcon/extcon-axp288.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/extcon/extcon-axp288.c
+++ b/drivers/extcon/extcon-axp288.c
@@ -107,7 +107,7 @@ struct axp288_extcon_info {
 };
 
 static const struct x86_cpu_id cherry_trail_cpu_ids[] = {
-	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ATOM_AIRMONT, X86_FEATURE_ANY },
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_AIRMONT,	NULL),
 	{}
 };
 
