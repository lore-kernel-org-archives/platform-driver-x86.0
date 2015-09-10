From: Kyle Evans <kvans32@gmail.com>
Subject: [PATCHv3] hp-wmi: limit hotkey enable
Date: Thu, 10 Sep 2015 11:45:05 -0500
Message-ID: <55F1B391.7020601@gmail.com>
References: <1438959360-20901-1-git-send-email-kvans32@gmail.com> <20150828184228.GA64484@vmdeb7> <55E1CF30.10501@gmail.com> <20150906180339.GC90062@vmdeb7> <55EF2913.2090902@gmail.com> <20150908202232.GD90062@vmdeb7> <55F09762.3070101@gmail.com> <20150910030330.GE90062@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qg0-f45.google.com ([209.85.192.45]:33701 "EHLO
	mail-qg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752602AbbIJQpI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 10 Sep 2015 12:45:08 -0400
Received: by qgev79 with SMTP id v79so40228188qge.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2015 09:45:07 -0700 (PDT)
In-Reply-To: <20150910030330.GE90062@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, Rafael Wysocki <rjw@rjwysocki.net>

 From 0e2c0ae37e1fbc326c54a60b2845eb0c7566d389 Mon Sep 17 00:00:00 2001
From: Kyle Evans <kvans32@gmail.com>
Date: Tue, 1 Sep 2015 18:50:45 -0500
Subject: [PATCH] hp-wmi: limit hotkey enable

Do not write initialize magic on systems that do not have
feature query 0xb. Fixes Bug #82451.

Redefine FEATURE_QUERY to align with 0xb and FEATURE2 with 0xd
for code clearity.

Add a new test function, hp_wmi_bios_2008_later() & simplify
hp_wmi_bios_2009_later(), which fixes a bug in cases where
an improper value is returned. May also fix Bug #69131.

Signed-off-by: Kyle Evans <kvans32@gmail.com>
---

Since v1:
  - Refactored feature query 0xb into separate function
  - Redefine FEATURE_QUERY to align with 0xb and FEATURE2 with 0xd

Since v2:
  - Simplify hp_wmi_bios_200x_later functions. No longer returns true 
(4) when the test fails. However, if state is somehow useful, that is lost.

  drivers/platform/x86/hp-wmi.c | 31 ++++++++++++++++++++-----------
  1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 0669731..45a9eaa 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -54,8 +54,9 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
  #define HPWMI_HARDWARE_QUERY 0x4
  #define HPWMI_WIRELESS_QUERY 0x5
  #define HPWMI_BIOS_QUERY 0x9
+#define HPWMI_FEATURE_QUERY 0xb
  #define HPWMI_HOTKEY_QUERY 0xc
-#define HPWMI_FEATURE_QUERY 0xd
+#define HPWMI_FEATURE2_QUERY 0xd
  #define HPWMI_WIRELESS2_QUERY 0x1b
  #define HPWMI_POSTCODEERROR_QUERY 0x2a

@@ -295,25 +296,33 @@ static int hp_wmi_tablet_state(void)
  	return (state & 0x4) ? 1 : 0;
  }

-static int __init hp_wmi_bios_2009_later(void)
+static int __init hp_wmi_bios_2008_later(void)
  {
  	int state = 0;
  	int ret = hp_wmi_perform_query(HPWMI_FEATURE_QUERY, 0, &state,
  				       sizeof(state), sizeof(state));
-	if (ret)
-		return ret;
+	if (!ret)
+		return 1;

-	return (state & 0x10) ? 1 : 0;
+	return (ret == HPWMI_RET_UNKNOWN_CMDTYPE) ? 0 : -ENXIO;
  }

-static int hp_wmi_enable_hotkeys(void)
+static int __init hp_wmi_bios_2009_later(void)
  {
-	int ret;
-	int query = 0x6e;
+	int state = 0;
+	int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, 0, &state,
+				       sizeof(state), sizeof(state));
+	if (!ret)
+		return 1;

-	ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &query, sizeof(query),
-				   0);
+	return (ret == HPWMI_RET_UNKNOWN_CMDTYPE) ? 0 : -ENXIO;
+}

+static int hp_wmi_enable_hotkeys(void)
+{
+	int value = 0x6e;
+	int ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &value,
+				       sizeof(value), 0);
  	if (ret)
  		return -EINVAL;
  	return 0;
@@ -663,7 +672,7 @@ static int __init hp_wmi_input_setup(void)
  			    hp_wmi_tablet_state());
  	input_sync(hp_wmi_input_dev);

-	if (hp_wmi_bios_2009_later() == 4)
+	if (!hp_wmi_bios_2009_later() && hp_wmi_2008_later())
  		hp_wmi_enable_hotkeys();

  	status = wmi_install_notify_handler(HPWMI_EVENT_GUID, hp_wmi_notify, 
NULL);
-- 
1.8.5.5
