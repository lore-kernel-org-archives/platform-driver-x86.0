From: Kyle Evans <kvans32@gmail.com>
Subject: [PATCH] hp-wmi: limit hotkey enable
Date: Fri,  7 Aug 2015 09:56:00 -0500
Message-ID: <1438959360-20901-1-git-send-email-kvans32@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:35485 "EHLO
	mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753525AbbHGO6g (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 7 Aug 2015 10:58:36 -0400
Received: by iodd187 with SMTP id d187so114083879iod.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Aug 2015 07:58:35 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Kyle Evans <kvans32@gmail.com>

Do not attempt to initialize hotkeys if the query returns a value.
Furthermore, do not write initialize magic on systems that do not have
feature query 0xb. Fixes Bug #82451.

Signed-off-by: Kyle Evans <kvans32@gmail.com>
---
 drivers/platform/x86/hp-wmi.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 0669731..557650f 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -54,6 +54,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
 #define HPWMI_HARDWARE_QUERY 0x4
 #define HPWMI_WIRELESS_QUERY 0x5
 #define HPWMI_BIOS_QUERY 0x9
+#define HPWMI_FEATURE2_QUERY 0xb
 #define HPWMI_HOTKEY_QUERY 0xc
 #define HPWMI_FEATURE_QUERY 0xd
 #define HPWMI_WIRELESS2_QUERY 0x1b
@@ -309,10 +310,18 @@ static int __init hp_wmi_bios_2009_later(void)
 static int hp_wmi_enable_hotkeys(void)
 {
 	int ret;
-	int query = 0x6e;
+	int query = 0xff;
+	int value = 0x6e;
 
-	ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &query, sizeof(query),
-				   0);
+	ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 0, &query,
+				   0, sizeof(query));
+
+	if (!query) {
+		if (!hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, 0, &query,
+					  0, sizeof(query)))
+		    ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &value,
+					       sizeof(value), 0);
+	}
 
 	if (ret)
 		return -EINVAL;
@@ -663,7 +672,7 @@ static int __init hp_wmi_input_setup(void)
 			    hp_wmi_tablet_state());
 	input_sync(hp_wmi_input_dev);
 
-	if (hp_wmi_bios_2009_later() == 4)
+	if (hp_wmi_bios_2009_later() == HPWMI_RET_UNKNOWN_CMDTYPE)
 		hp_wmi_enable_hotkeys();
 
 	status = wmi_install_notify_handler(HPWMI_EVENT_GUID, hp_wmi_notify, NULL);
-- 
1.8.5.5
