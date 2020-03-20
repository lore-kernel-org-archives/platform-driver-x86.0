From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 16/22] mmc: sdhci-acpi: Convert to new X86 CPU match macros
Date: Fri, 20 Mar 2020 14:14:01 +0100
Message-ID: <20200320131510.285691129@linutronix.de>
References: <20200320131345.635023594@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-edac@vger.kernel.org, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, Zhang Rui <rui.zhang@intel.co>
List-Id: platform-driver-x86.vger.kernel.org

The new macro set has a consistent namespace and uses C99 initializers
instead of the grufty C89 ones.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org
---
 drivers/mmc/host/sdhci-acpi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/drivers/mmc/host/sdhci-acpi.c
+++ b/drivers/mmc/host/sdhci-acpi.c
@@ -234,7 +234,7 @@ static const struct sdhci_acpi_chip sdhc
 static bool sdhci_acpi_byt(void)
 {
 	static const struct x86_cpu_id byt[] = {
-		{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ATOM_SILVERMONT },
+		X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT, NULL),
 		{}
 	};
 
@@ -244,7 +244,7 @@ static bool sdhci_acpi_byt(void)
 static bool sdhci_acpi_cht(void)
 {
 	static const struct x86_cpu_id cht[] = {
-		{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ATOM_AIRMONT },
+		X86_MATCH_INTEL_FAM6_MODEL(ATOM_AIRMONT, NULL),
 		{}
 	};
 
