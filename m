From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [PATCH] platform/x86: intel-hid: Use hp-wireless for rfkill on HP platforms
Date: Wed, 10 Jun 2020 23:37:47 +0800
Message-ID: <20200610153747.27040-1-kai.heng.feng@canonical.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: alex.hung@canonical.com
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:INTEL HID EVENT DRIVER" <platform-driver-x86@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Wireless hotkey on HP platforms can trigger two events, if both
hp-wireless and intel-hid are supported. Two events at the same time
renders wireless hotkey useless.

HP confirmed that hp-wireless (HPQ6001) should always be the canonical
source of wireless hotkey event, so skip registering rfkill hotkey if
HPQ6001 is present.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/platform/x86/intel-hid.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index 9ee79b74311c..31091c8faf70 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -25,6 +25,8 @@ static const struct acpi_device_id intel_hid_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, intel_hid_ids);
 
+static bool hp_wireless_present;
+
 /* In theory, these are HID usages. */
 static const struct key_entry intel_hid_keymap[] = {
 	/* 1: LSuper (Page 0x07, usage 0xE3) -- unclear what to do */
@@ -49,6 +51,29 @@ static const struct key_entry intel_hid_keymap[] = {
 	{ KE_END },
 };
 
+static const struct key_entry intel_hid_no_rfkill_keymap[] = {
+	/* 1: LSuper (Page 0x07, usage 0xE3) -- unclear what to do */
+	/* 2: Toggle SW_ROTATE_LOCK -- easy to implement if seen in wild */
+	{ KE_KEY, 3, { KEY_NUMLOCK } },
+	{ KE_KEY, 4, { KEY_HOME } },
+	{ KE_KEY, 5, { KEY_END } },
+	{ KE_KEY, 6, { KEY_PAGEUP } },
+	{ KE_KEY, 7, { KEY_PAGEDOWN } },
+	/* 8: rfkill -- use hp-wireless instead */
+	{ KE_KEY, 9, { KEY_POWER } },
+	{ KE_KEY, 11, { KEY_SLEEP } },
+	/* 13 has two different meanings in the spec -- ignore it. */
+	{ KE_KEY, 14, { KEY_STOPCD } },
+	{ KE_KEY, 15, { KEY_PLAYPAUSE } },
+	{ KE_KEY, 16, { KEY_MUTE } },
+	{ KE_KEY, 17, { KEY_VOLUMEUP } },
+	{ KE_KEY, 18, { KEY_VOLUMEDOWN } },
+	{ KE_KEY, 19, { KEY_BRIGHTNESSUP } },
+	{ KE_KEY, 20, { KEY_BRIGHTNESSDOWN } },
+	/* 27: wake -- needs special handling */
+	{ KE_END },
+};
+
 /* 5 button array notification value. */
 static const struct key_entry intel_array_keymap[] = {
 	{ KE_KEY,    0xC2, { KEY_LEFTMETA } },                /* Press */
@@ -317,7 +342,8 @@ static int intel_hid_input_setup(struct platform_device *device)
 	if (!priv->input_dev)
 		return -ENOMEM;
 
-	ret = sparse_keymap_setup(priv->input_dev, intel_hid_keymap, NULL);
+	ret = sparse_keymap_setup(priv->input_dev, hp_wireless_present ?
+			intel_hid_no_rfkill_keymap : intel_hid_keymap, NULL);
 	if (ret)
 		return ret;
 
@@ -575,6 +601,9 @@ check_acpi_dev(acpi_handle handle, u32 lvl, void *context, void **rv)
 			dev_info(&dev->dev,
 				 "intel-hid: created platform device\n");
 
+	if (!strcmp(acpi_device_hid(dev), "HPQ6001"))
+		hp_wireless_present = true;
+
 	return AE_OK;
 }
 
-- 
2.17.1
