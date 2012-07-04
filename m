From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] asus-nb-wmi: add wapf quirk for ASUS machines
Date: Wed,  4 Jul 2012 11:19:08 +0800
Message-ID: <1341371948-15255-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:64446 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756744Ab2GDDTO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 3 Jul 2012 23:19:14 -0400
Received: by pbbrp8 with SMTP id rp8so10300547pbb.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Jul 2012 20:19:14 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

The BIOS of these machines will try to enable/disable wifi/bt in
their own sqeuence. It won't read the enable/disable parameter
in WMI command, but just iterates the wifi/bt's status described below
1st. enable wifi, enable bt
2nd. disable wifi, enable bt
3rd. enable wifi, disable bt
4th. disable wifi, disable bt
That will totally mess up the rfkill status, since we will try to read
wifi and bt's status and reset it again while booting up.

To avoid this, these machines should set the wapf value to 4,
that will let software totally control the wifi/bt's status and
BIOS will do nothing instead of sending out the 0x88(KEY_RFKILL) event
instead of 0x5e(wifi enable), 0x5f(wifi diable), 0x7d(bt enable), and
0x7e(bt disable) through WMI.

With this patch[1], it will handle the KEY_RFKILL event correctly and
will block/unblock wifi and bt together.

1. https://lkml.org/lkml/2012/5/21/75

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-nb-wmi.c |  104 ++++++++++++++++++++++++++++++++++--
 1 file changed, 101 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 99a30b5..57712ff 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -26,6 +26,7 @@
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
 #include <linux/fb.h>
+#include <linux/dmi.h>
 
 #include "asus-wmi.h"
 
@@ -48,18 +49,115 @@ MODULE_ALIAS("wmi:"ASUS_NB_WMI_EVENT_GUID);
  *  1  | Hardware  | Software
  *  4  | Software  | Software
  */
-static uint wapf;
+static int wapf = -1;
 module_param(wapf, uint, 0444);
 MODULE_PARM_DESC(wapf, "WAPF value");
 
+static struct quirk_entry *quirks;
+
 static struct quirk_entry quirk_asus_unknown = {
+	.wapf = 0,
+};
+
+static struct quirk_entry quirk_asus_x401u = {
+	.wapf = 4,
+};
+
+static int dmi_matched(const struct dmi_system_id *dmi)
+{
+	quirks = dmi->driver_data;
+	return 1;
+}
+
+static struct dmi_system_id asus_quirks[] = {
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X401U",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X401U"),
+		},
+		.driver_data = &quirk_asus_x401u,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X401A1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X401A1"),
+		},
+		.driver_data = &quirk_asus_x401u,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X501U",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X501U"),
+		},
+		.driver_data = &quirk_asus_x401u,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X501A1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X501A1"),
+		},
+		.driver_data = &quirk_asus_x401u,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X55A",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X55A"),
+		},
+		.driver_data = &quirk_asus_x401u,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X55C",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X55C"),
+		},
+		.driver_data = &quirk_asus_x401u,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X55U",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X55U"),
+		},
+		.driver_data = &quirk_asus_x401u,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X55VD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X55VD"),
+		},
+		.driver_data = &quirk_asus_x401u,
+	},
+	{},
 };
 
 static void asus_nb_wmi_quirks(struct asus_wmi_driver *driver)
 {
-	driver->quirks = &quirk_asus_unknown;
-	driver->quirks->wapf = wapf;
+	quirks = &quirk_asus_unknown;
+	dmi_check_system(asus_quirks);
+
+	driver->quirks = quirks;
 	driver->panel_power = FB_BLANK_UNBLANK;
+
+	/* overwrite the wapf setting if the wapf paramater is specified */
+	if (wapf != -1)
+		quirks->wapf = wapf;
+	else
+		wapf = quirks->wapf;
 }
 
 static const struct key_entry asus_nb_wmi_keymap[] = {
-- 
1.7.9.5
