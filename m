From: Lyude <lyude@redhat.com>
Subject: [PATCH v4 1/2] thinkpad_acpi: Move tablet detection into separate function
Date: Fri, 11 Nov 2016 15:15:02 -0500
Message-ID: <1478895304-31627-1-git-send-email-lyude@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:52526 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756014AbcKKUPM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Nov 2016 15:15:12 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Daniel Martin <consume.noise@gmail.com>
Cc: Lyude <lyude@redhat.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

The hotkey events and ACPI handles used for detecting tablet mode on a
few of the newer thinkpad models (Yoga X1 and the Yoga 260 specifically)
have been changed around, so unfortunately this means we're definitely
going to need to probe for multiple types of tablet mode support. Since
the hotkey_init() is already a lot larger than it should be, let's split
up this detection into its own function to make things a little easier
to read.

As well, since we're going to have multiple types of tablet modes, make
hotkey_tablet into an enum so we can also use it to indicate the type of
tablet mode reporting the machine supports.

Suggested by Daniel Martin <consume.noise@gmail.com>
Signed-off-by: Lyude <lyude@redhat.com>
Cc: Daniel Martin <consume.noise@gmail.com>
Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
---
Changes since v3:
 - Fix style nitpick

 drivers/platform/x86/thinkpad_acpi.c | 52 +++++++++++++++++++++++++-----------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index b65ce75..de4e734 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -302,7 +302,10 @@ static struct {
 	u32 hotkey:1;
 	u32 hotkey_mask:1;
 	u32 hotkey_wlsw:1;
-	u32 hotkey_tablet:1;
+	enum {
+		TP_HOTKEY_TABLET_NONE = 0,
+		TP_HOTKEY_TABLET_USES_MHKG,
+	} hotkey_tablet;
 	u32 kbdlight:1;
 	u32 light:1;
 	u32 light_status:1;
@@ -3117,6 +3120,32 @@ static const struct tpacpi_quirk tpacpi_hotkey_qtable[] __initconst = {
 typedef u16 tpacpi_keymap_entry_t;
 typedef tpacpi_keymap_entry_t tpacpi_keymap_t[TPACPI_HOTKEY_MAP_LEN];
 
+static int hotkey_init_tablet_mode(void)
+{
+	int in_tablet_mode, res;
+	char *type;
+
+	/* For X41t, X60t, X61t Tablets... */
+	if (acpi_evalf(hkey_handle, &res, "MHKG", "qd")) {
+		tp_features.hotkey_tablet = TP_HOTKEY_TABLET_USES_MHKG;
+		in_tablet_mode = !!(res & TP_HOTKEY_TABLET_MASK);
+		type = "MHKG";
+	}
+
+	if (!tp_features.hotkey_tablet)
+		return 0;
+
+	pr_info("Tablet mode switch found (type: %s), currently in %s mode\n",
+		type, in_tablet_mode ? "tablet" : "laptop");
+
+	res = add_to_attr_set(hotkey_dev_attributes,
+			      &dev_attr_hotkey_tablet_mode.attr);
+	if (res)
+		return -1;
+
+	return in_tablet_mode;
+}
+
 static int __init hotkey_init(struct ibm_init_struct *iibm)
 {
 	/* Requirements for changing the default keymaps:
@@ -3464,21 +3493,14 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		res = add_to_attr_set(hotkey_dev_attributes,
 				&dev_attr_hotkey_radio_sw.attr);
 
-	/* For X41t, X60t, X61t Tablets... */
-	if (!res && acpi_evalf(hkey_handle, &status, "MHKG", "qd")) {
-		tp_features.hotkey_tablet = 1;
-		tabletsw_state = !!(status & TP_HOTKEY_TABLET_MASK);
-		pr_info("possible tablet mode switch found; "
-			"ThinkPad in %s mode\n",
-			(tabletsw_state) ? "tablet" : "laptop");
-		res = add_to_attr_set(hotkey_dev_attributes,
-				&dev_attr_hotkey_tablet_mode.attr);
-	}
+	res = hotkey_init_tablet_mode();
+	if (res < 0)
+		goto err_exit;
 
-	if (!res)
-		res = register_attr_set_with_sysfs(
-				hotkey_dev_attributes,
-				&tpacpi_pdev->dev.kobj);
+	tabletsw_state = res;
+
+	res = register_attr_set_with_sysfs(hotkey_dev_attributes,
+					   &tpacpi_pdev->dev.kobj);
 	if (res)
 		goto err_exit;
 
-- 
2.7.4
