From: Victor van den Elzen <victor.vde@gmail.com>
Subject: [PATCH] platform/x86: move rfkill for Dell Mini 1012 to
 compal-laptop
Date: Sun, 15 Aug 2010 01:19:33 +0200
Message-ID: <20100814231933.GA4404@archmini>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: Mario Limonciello <superm1@ubuntu.com>, Matthew Garrett <mjg@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

Like others in the Mini series, the Dell Mini 1012 does not support
the smbios hook required by dell-laptop.

Signed-off-by: Victor van den Elzen <victor.vde@gmail.com>
Cc: stable <stable@kernel.org>
---
 drivers/platform/x86/compal-laptop.c |    9 +++++++++
 drivers/platform/x86/dell-laptop.c   |    7 +++++++
 2 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index 71ff154..90111d7 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -259,6 +259,14 @@ static struct dmi_system_id __initdata compal_dmi_table[] = {
 		.callback = dmi_check_cb
 	},
 	{
+		.ident = "Dell Mini 1012",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 1012"),
+		},
+		.callback = dmi_check_cb
+	},
+	{
 		.ident = "Dell Inspiron 11z",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
@@ -375,5 +383,6 @@ MODULE_ALIAS("dmi:*:rnIFT00:rvrIFT00:*");
 MODULE_ALIAS("dmi:*:svnDellInc.:pnInspiron910:*");
 MODULE_ALIAS("dmi:*:svnDellInc.:pnInspiron1010:*");
 MODULE_ALIAS("dmi:*:svnDellInc.:pnInspiron1011:*");
+MODULE_ALIAS("dmi:*:svnDellInc.:pnInspiron1012:*");
 MODULE_ALIAS("dmi:*:svnDellInc.:pnInspiron1110:*");
 MODULE_ALIAS("dmi:*:svnDellInc.:pnInspiron1210:*");
diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 661e3ac..6110601 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -116,6 +116,13 @@ static struct dmi_system_id __devinitdata dell_blacklist[] = {
 		},
 	},
 	{
+		.ident = "Dell Mini 1012",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 1012"),
+		},
+	},
+	{
 		.ident = "Dell Inspiron 11z",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
--
1.7.2.1
