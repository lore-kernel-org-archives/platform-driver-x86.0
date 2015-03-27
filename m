From: Kyle Evans <kvans32@gmail.com>
Subject: [PATCH] hp-wmi: limit hotkey enable
Date: Fri, 27 Mar 2015 13:33:11 -0500
Message-ID: <1427481191-4475-1-git-send-email-kvans32@gmail.com>
References: <20150313053325.GA22984@aaronlu.sh.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ig0-f176.google.com ([209.85.213.176]:36186 "EHLO
	mail-ig0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751745AbbC0Sep (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 27 Mar 2015 14:34:45 -0400
Received: by igbud6 with SMTP id ud6so28146526igb.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2015 11:34:44 -0700 (PDT)
In-Reply-To: <20150313053325.GA22984@aaronlu.sh.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Aaron Lu <aaron.lu@intel.com>, platform-driver-x86@vger.kernel.org, Bertrand Vieille <vieille.bertrand@free.Fr>
Cc: Kyle Evans <kvans32@gmail.com>

Do not attempt to initialize hotkeys if the query returns a value.
Furthermore, do not write initialize magic on systems that do not have
feature query 0xb.

Signed-off-by: Kyle Evans <kvans32@gmail.com>
---
 drivers/platform/x86/hp-wmi.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 0ab2b37..4a4d6e3 100644
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
+	int query;
+	int value = 0x6e;
 
-	ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &query, sizeof(query),
-				   0);
+	ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 0, &query,
+				   0, sizeof(query));
+
+	if (!ret && !query) {
+		if (!hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, 0, &query,
+					  0, sizeof(query)))
+		    ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &value,
+					       sizeof(value), 0);
+	}
 
 	if (ret)
 		return -EINVAL;
-- 
1.8.5.5
