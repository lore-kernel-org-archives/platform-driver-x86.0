From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 2/6] platform/x86: acerhdf: Enable ability to list supported systems
Date: Thu, 20 Sep 2018 21:44:17 -0400
Message-ID: <20180921014421.30804-3-paul.gortmaker@windriver.com>
References: <20180921014421.30804-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921014421.30804-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Peter Feuerer <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

This driver has two module parameters that allow an override of the
checks for matching model and BIOS version.  However, both parameters
expect you to choose an entry from the existing list of supported
systems, encoded within the driver itself.

Without the source, such as in a binary distribution, the end user
does not have access to this information, thus rendering the two
module parameters essentially useless.

Add a module parameter that allows the end user to dump the list
of make/model/versions so that they can then pick one that most
closely matches their own system.

Cc: Peter Feuerer <peter@piie.net>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/platform/x86/acerhdf.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index 3d5c4e183111..2735815c73c5 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -86,6 +86,7 @@ static unsigned int interval = 10;
 static unsigned int fanon = 60000;
 static unsigned int fanoff = 53000;
 static unsigned int verbose;
+static unsigned int list_supported;
 static unsigned int fanstate = ACERHDF_FAN_AUTO;
 static char force_bios[16];
 static char force_product[16];
@@ -104,6 +105,8 @@ module_param(fanoff, uint, 0600);
 MODULE_PARM_DESC(fanoff, "Turn the fan off below this temperature");
 module_param(verbose, uint, 0600);
 MODULE_PARM_DESC(verbose, "Enable verbose dmesg output");
+module_param(list_supported, uint, 0600);
+MODULE_PARM_DESC(list_supported, "List supported models and BIOS versions");
 module_param_string(force_bios, force_bios, 16, 0);
 MODULE_PARM_DESC(force_bios, "Pretend system has this known supported BIOS version");
 module_param_string(force_product, force_product, 16, 0);
@@ -632,6 +635,17 @@ static int acerhdf_check_hardware(void)
 
 	pr_info("Acer Aspire One Fan driver, v.%s\n", DRV_VER);
 
+	if (list_supported) {
+		pr_info("List of supported Manufacturer/Model/BIOS:\n");
+		pr_info("---------------------------------------------------\n");
+		for (bt = bios_tbl; bt->vendor[0]; bt++) {
+			pr_info("%-13s | %-17s | %-10s\n", bt->vendor,
+				bt->product, bt->version);
+		}
+		pr_info("---------------------------------------------------\n");
+		return -ECANCELED;
+	}
+
 	if (force_bios[0]) {
 		version = force_bios;
 		pr_info("forcing BIOS version: %s\n", version);
-- 
2.15.0
