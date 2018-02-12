From: Jan-Marek Glogowski <glogow@fbihome.de>
Subject: [PATCH] platform/x86: fujitsu-laptop: Support Lifebook U7x7 hotkeys
Date: Mon, 12 Feb 2018 13:08:51 +0100
Message-ID: <1518437331-25451-1-git-send-email-glogow@fbihome.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ironchief.h-da.de ([141.100.10.235]:62523 "EHLO
        ironchief.h-da.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933160AbeBLMJE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Feb 2018 07:09:04 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>, platform-driver-x86@vger.kernel.org

Generate input events for hotkeys present in Fujitsu Lifebook
U727 and U757 laptops: Fn+F1 (KEY_MICMUTE) and Fn+F5
(KEY_RFKILL).

Signed-off-by: Jan-Marek Glogowski <glogow@fbihome.de>
---
 drivers/platform/x86/fujitsu-laptop.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 2cfbd3f..4294c64 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -455,7 +455,9 @@ static const struct key_entry keymap_default[] = {
 	{ KE_KEY, KEY3_CODE, { KEY_PROG3 } },
 	{ KE_KEY, KEY4_CODE, { KEY_PROG4 } },
 	{ KE_KEY, KEY5_CODE, { KEY_RFKILL } },
+	{ KE_KEY, BIT(5),    { KEY_RFKILL } },
 	{ KE_KEY, BIT(26),   { KEY_TOUCHPAD_TOGGLE } },
+	{ KE_KEY, BIT(29),   { KEY_MICMUTE } },
 	{ KE_END, 0 }
 };
 
@@ -899,7 +901,7 @@ static void acpi_fujitsu_laptop_release(struct acpi_device *device)
 static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
 {
 	struct fujitsu_laptop *priv = acpi_driver_data(device);
-	int scancode, i = 0;
+	int scancode, i = 0, ret;
 	unsigned int irb;
 
 	if (event != ACPI_FUJITSU_NOTIFY_CODE1) {
@@ -930,9 +932,18 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
 	 * E736/E746/E756), the touchpad toggle hotkey (Fn+F4) is
 	 * handled in software; its state is queried using FUNC_FLAGS
 	 */
-	if ((priv->flags_supported & BIT(26)) &&
-	    (call_fext_func(device, FUNC_FLAGS, 0x1, 0x0, 0x0) & BIT(26)))
-		sparse_keymap_report_event(priv->input, BIT(26), 1, true);
+	if (priv->flags_supported & (BIT(5) | BIT(26) | BIT(29))) {
+		ret = call_fext_func(device, FUNC_FLAGS, 0x1, 0x0, 0x0);
+		if (ret & BIT(5))
+			sparse_keymap_report_event(priv->input,
+						   BIT(5), 1, true);
+		if (ret & BIT(26))
+			sparse_keymap_report_event(priv->input,
+						   BIT(26), 1, true);
+		if (ret & BIT(29))
+			sparse_keymap_report_event(priv->input,
+						   BIT(29), 1, true);
+	}
 }
 
 /* Initialization */
-- 
2.1.4
