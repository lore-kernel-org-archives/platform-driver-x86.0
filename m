From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH 04/14] thinkpad-acpi: move greeting messages out of the first subdriver (v2)
Date: Wed, 19 May 2010 00:26:14 -0300
Message-ID: <1274239584-17743-5-git-send-email-hmh@hmh.eng.br>
References: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:49463 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755691Ab0ESD0d (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 May 2010 23:26:33 -0400
In-Reply-To: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Move the driver initial greetings out of the first subdriver, as we do a
lot of other initialization before that point, and the initial greetings
should go as soon as the driver decides that it should load.

These greetings are not cosmetic, they make my life easier when users
report bugs.

Signed-off-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
---
 drivers/platform/x86/thinkpad_acpi.c |   56 ++++++++++++++++-----------------
 1 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 1f27b35..a768a69 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -1888,36 +1888,9 @@ static bool __init tpacpi_is_fw_known(void)
  ****************************************************************************/
 
 /*************************************************************************
- * thinkpad-acpi init subdriver
+ * thinkpad-acpi metadata subdriver
  */
 
-static int __init thinkpad_acpi_driver_init(struct ibm_init_struct *iibm)
-{
-	printk(TPACPI_INFO "%s v%s\n", TPACPI_DESC, TPACPI_VERSION);
-	printk(TPACPI_INFO "%s\n", TPACPI_URL);
-
-	printk(TPACPI_INFO "ThinkPad BIOS %s, EC %s\n",
-		(thinkpad_id.bios_version_str) ?
-			thinkpad_id.bios_version_str : "unknown",
-		(thinkpad_id.ec_version_str) ?
-			thinkpad_id.ec_version_str : "unknown");
-
-	BUG_ON(!thinkpad_id.vendor);
-
-	if (thinkpad_id.model_str)
-		printk(TPACPI_INFO "%s %s, model %s\n",
-			(thinkpad_id.vendor == PCI_VENDOR_ID_IBM) ?
-				"IBM" : ((thinkpad_id.vendor ==
-						PCI_VENDOR_ID_LENOVO) ?
-					"Lenovo" : "Unknown vendor"),
-			thinkpad_id.model_str,
-			(thinkpad_id.nummodel_str) ?
-				thinkpad_id.nummodel_str : "unknown");
-
-	tpacpi_check_outdated_fw();
-	return 0;
-}
-
 static int thinkpad_acpi_driver_read(struct seq_file *m)
 {
 	seq_printf(m, "driver:\t\t%s\n", TPACPI_DESC);
@@ -8753,12 +8726,34 @@ static int __init probe_for_thinkpad(void)
 	return 0;
 }
 
+static void __init thinkpad_acpi_init_banner(void)
+{
+	printk(TPACPI_INFO "%s v%s\n", TPACPI_DESC, TPACPI_VERSION);
+	printk(TPACPI_INFO "%s\n", TPACPI_URL);
+
+	printk(TPACPI_INFO "ThinkPad BIOS %s, EC %s\n",
+		(thinkpad_id.bios_version_str) ?
+			thinkpad_id.bios_version_str : "unknown",
+		(thinkpad_id.ec_version_str) ?
+			thinkpad_id.ec_version_str : "unknown");
+
+	BUG_ON(!thinkpad_id.vendor);
+
+	if (thinkpad_id.model_str)
+		printk(TPACPI_INFO "%s %s, model %s\n",
+			(thinkpad_id.vendor == PCI_VENDOR_ID_IBM) ?
+				"IBM" : ((thinkpad_id.vendor ==
+						PCI_VENDOR_ID_LENOVO) ?
+					"Lenovo" : "Unknown vendor"),
+			thinkpad_id.model_str,
+			(thinkpad_id.nummodel_str) ?
+				thinkpad_id.nummodel_str : "unknown");
+}
 
 /* Module init, exit, parameters */
 
 static struct ibm_init_struct ibms_init[] __initdata = {
 	{
-		.init = thinkpad_acpi_driver_init,
 		.data = &thinkpad_acpi_driver_data,
 	},
 	{
@@ -9028,6 +9023,9 @@ static int __init thinkpad_acpi_module_init(void)
 
 	/* Driver initialization */
 
+	thinkpad_acpi_init_banner();
+	tpacpi_check_outdated_fw();
+
 	TPACPI_ACPIHANDLE_INIT(ecrd);
 	TPACPI_ACPIHANDLE_INIT(ecwr);
 
-- 
1.7.1

