From: Kyle Evans <kvans32@gmail.com>
Subject: [PATCH] hp-wmi: Enable hotkeys on some systems
Date: Mon,  9 Jun 2014 12:26:06 -0500
Message-ID: <1402334766-6014-1-git-send-email-kvans32@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:42296 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754847AbaFIR1S (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Jun 2014 13:27:18 -0400
Received: by mail-ig0-f175.google.com with SMTP id uq10so4108065igb.14
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Jun 2014 10:27:17 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Kyle Evans <kvans32@gmail.com>

This is a third attempt to enable these buttons. The new variable being
commit 997daa1bd9aca412ab97955a35b26c460c0ec7a4 (i.e. hp-wmi: detect
"2009 BIOS or later"). Older systems that do not have the 2009 BIOS query
method respond with a dummy value, in this case 4. Using that, we can
target a fairly narrow group of systems. i.e. old enough to not have
HPWMI_FEATURE_QUERY 0xd, but new enough to have HPWMI_BIOS_QUERY 0x9.
This group may be further limited if some systems respond with something
other than 4 to non-existant feature queries.

Signed-off-by: Kyle Evans <kvans32@gmail.com>
---
 drivers/platform/x86/hp-wmi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 8ba8956..484a867 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -53,6 +53,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
 #define HPWMI_ALS_QUERY 0x3
 #define HPWMI_HARDWARE_QUERY 0x4
 #define HPWMI_WIRELESS_QUERY 0x5
+#define HPWMI_BIOS_QUERY 0x9
 #define HPWMI_HOTKEY_QUERY 0xc
 #define HPWMI_FEATURE_QUERY 0xd
 #define HPWMI_WIRELESS2_QUERY 0x1b
@@ -144,6 +145,7 @@ static const struct key_entry hp_wmi_keymap[] = {
 	{ KE_KEY, 0x2142, { KEY_MEDIA } },
 	{ KE_KEY, 0x213b, { KEY_INFO } },
 	{ KE_KEY, 0x2169, { KEY_DIRECTION } },
+	{ KE_KEY, 0x216a, { KEY_SETUP } },
 	{ KE_KEY, 0x231b, { KEY_HELP } },
 	{ KE_END, 0 }
 };
@@ -304,6 +306,19 @@ static int hp_wmi_bios_2009_later(void)
 	return (state & 0x10) ? 1 : 0;
 }
 
+static int hp_wmi_enable_hotkeys(void)
+{
+	int ret;
+	int query = 0x6e;
+
+	ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &query, sizeof(query),
+				   0);
+
+	if (ret)
+		return -EINVAL;
+	return 0;
+}
+
 static int hp_wmi_set_block(void *data, bool blocked)
 {
 	enum hp_wmi_radio r = (enum hp_wmi_radio) data;
@@ -648,6 +663,9 @@ static int __init hp_wmi_input_setup(void)
 			    hp_wmi_tablet_state());
 	input_sync(hp_wmi_input_dev);
 
+	if (hp_wmi_bios_2009_later() == 4)
+		hp_wmi_enable_hotkeys();
+
 	status = wmi_install_notify_handler(HPWMI_EVENT_GUID, hp_wmi_notify, NULL);
 	if (ACPI_FAILURE(status)) {
 		err = -EIO;
-- 
1.8.3.2
