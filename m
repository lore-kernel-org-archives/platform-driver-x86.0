From: Robert Gerlach <khnz@gmx.de>
Subject: [PATCH 3/3] fujitsu-tablet: correct quirks for Lifebook and Stylistic tablets
Date: Tue,  3 Apr 2012 22:34:35 +0200
Message-ID: <1333485275-2752-4-git-send-email-khnz@gmx.de>
References: <1333485275-2752-1-git-send-email-khnz@gmx.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.22]:45989 "HELO
	mailout-de.gmx.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753502Ab2DCUeo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 3 Apr 2012 16:34:44 -0400
Received: from localhost (localhost [127.0.0.1])
	by kolab.lan (Postfix) with ESMTP id 4776316692
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Apr 2012 22:34:42 +0200 (CEST)
Received: from kolab.lan ([127.0.0.1])
	by localhost (kolab.lan [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tY5mXWtePqTZ for <platform-driver-x86@vger.kernel.org>;
	Tue,  3 Apr 2012 22:34:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by kolab.lan (Postfix) with ESMTP id 6445D16693
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Apr 2012 22:34:38 +0200 (CEST)
In-Reply-To: <1333485275-2752-1-git-send-email-khnz@gmx.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Robert Gerlach <khnz@gmx.de>

This patch adds a quirk to fix the dock detection for Fujitsu Stylistic
devices and fixes an bug in which tablet mode state was not correctly
reported in Fujitsu Lifebook and Stylistic models.

Signed-off-by: Robert Gerlach <khnz@gmx.de>
---
 drivers/platform/x86/fujitsu-tablet.c |   27 ++++++++++++++++++---------
 1 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-tablet.c b/drivers/platform/x86/fujitsu-tablet.c
index 8b74fdf..da267ea 100644
--- a/drivers/platform/x86/fujitsu-tablet.c
+++ b/drivers/platform/x86/fujitsu-tablet.c
@@ -36,7 +36,8 @@
 #define ACPI_FUJITSU_CLASS "fujitsu"
 
 #define INVERT_TABLET_MODE_BIT      0x01
-#define FORCE_TABLET_MODE_IF_UNDOCK 0x02
+#define INVERT_DOCK_STATE_BIT       0x02
+#define FORCE_TABLET_MODE_IF_UNDOCK 0x04
 
 #define KEYMAP_LEN 16
 
@@ -163,6 +164,8 @@ static void fujitsu_send_state(void)
 	state = fujitsu_read_register(0xdd);
 
 	dock = state & 0x02;
+	if (fujitsu.config.quirks & INVERT_DOCK_STATE_BIT)
+		dock = !dock;
 
 	if ((fujitsu.config.quirks & FORCE_TABLET_MODE_IF_UNDOCK) && (!dock)) {
 		tablet_mode = 1;
@@ -274,25 +277,31 @@ static irqreturn_t fujitsu_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int __devinit fujitsu_dmi_default(const struct dmi_system_id *dmi)
+static void __devinit fujitsu_dmi_common(const struct dmi_system_id *dmi)
 {
 	pr_info("%s\n", dmi->ident);
 	memcpy(fujitsu.config.keymap, dmi->driver_data,
 			sizeof(fujitsu.config.keymap));
+}
+
+static int __devinit fujitsu_dmi_lifebook(const struct dmi_system_id *dmi)
+{
+	fujitsu_dmi_common(dmi);
+	fujitsu.config.quirks |= INVERT_TABLET_MODE_BIT;
 	return 1;
 }
 
 static int __devinit fujitsu_dmi_stylistic(const struct dmi_system_id *dmi)
 {
-	fujitsu_dmi_default(dmi);
+	fujitsu_dmi_common(dmi);
 	fujitsu.config.quirks |= FORCE_TABLET_MODE_IF_UNDOCK;
-	fujitsu.config.quirks |= INVERT_TABLET_MODE_BIT;
+	fujitsu.config.quirks |= INVERT_DOCK_STATE_BIT;
 	return 1;
 }
 
 static struct dmi_system_id dmi_ids[] __initconst = {
 	{
-		.callback = fujitsu_dmi_default,
+		.callback = fujitsu_dmi_lifebook,
 		.ident = "Fujitsu Siemens P/T Series",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
@@ -301,7 +310,7 @@ static struct dmi_system_id dmi_ids[] __initconst = {
 		.driver_data = keymap_Lifebook_Tseries
 	},
 	{
-		.callback = fujitsu_dmi_default,
+		.callback = fujitsu_dmi_lifebook,
 		.ident = "Fujitsu Lifebook T Series",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
@@ -319,7 +328,7 @@ static struct dmi_system_id dmi_ids[] __initconst = {
 		.driver_data = keymap_Stylistic_Tseries
 	},
 	{
-		.callback = fujitsu_dmi_default,
+		.callback = fujitsu_dmi_lifebook,
 		.ident = "Fujitsu LifeBook U810",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
@@ -346,7 +355,7 @@ static struct dmi_system_id dmi_ids[] __initconst = {
 		.driver_data = keymap_Stylistic_ST5xxx
 	},
 	{
-		.callback = fujitsu_dmi_default,
+		.callback = fujitsu_dmi_lifebook,
 		.ident = "Unknown (using defaults)",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, ""),
@@ -472,6 +481,6 @@ module_exit(fujitsu_module_exit);
 MODULE_AUTHOR("Robert Gerlach <khnz@gmx.de>");
 MODULE_DESCRIPTION("Fujitsu tablet pc extras driver");
 MODULE_LICENSE("GPL");
-MODULE_VERSION("2.4");
+MODULE_VERSION("2.5");
 
 MODULE_DEVICE_TABLE(acpi, fujitsu_ids);
-- 
1.7.9.1
