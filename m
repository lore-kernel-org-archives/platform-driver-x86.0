From: Kyle Evans <kvans32@gmail.com>
Subject: Re: [PATCH] hp-wmi: limit hotkey enable
Date: Tue, 08 Sep 2015 13:29:39 -0500
Message-ID: <55EF2913.2090902@gmail.com>
References: <1438959360-20901-1-git-send-email-kvans32@gmail.com> <20150828184228.GA64484@vmdeb7> <55E1CF30.10501@gmail.com> <20150906180339.GC90062@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:34283 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753460AbbIHS3l (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Sep 2015 14:29:41 -0400
Received: by igcpb10 with SMTP id pb10so85936007igc.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Sep 2015 11:29:41 -0700 (PDT)
In-Reply-To: <20150906180339.GC90062@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, Rafael Wysocki <rjw@rjwysocki.net>

 From 7d11e942d2c84919ded37b46a72be59f34141c5d Mon Sep 17 00:00:00 2001
From: Kyle Evans <kvans32@gmail.com>
Date: Tue, 1 Sep 2015 18:50:45 -0500
Subject: [PATCH] hp-wmi: limit hotkey enable

Do not write initialize magic on systems that do not have
feature query 0xb. Fixes Bug #82451.

Define a new feature query to differentiate older systems and rename
FEATURE_QUERY, 0xd, to FEATURE2_QUERY for code consistency.
Also, some return value magic number cleanup.
---
  drivers/platform/x86/hp-wmi.c | 28 +++++++++++++++++++---------
  1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 0669731..c0a7817 100644
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

@@ -295,7 +296,7 @@ static int hp_wmi_tablet_state(void)
  	return (state & 0x4) ? 1 : 0;
  }

-static int __init hp_wmi_bios_2009_later(void)
+static int __init hp_wmi_bios_2008_later(void)
  {
  	int state = 0;
  	int ret = hp_wmi_perform_query(HPWMI_FEATURE_QUERY, 0, &state,
@@ -306,14 +307,22 @@ static int __init hp_wmi_bios_2009_later(void)
  	return (state & 0x10) ? 1 : 0;
  }

-static int hp_wmi_enable_hotkeys(void)
+static int __init hp_wmi_bios_2009_later(void)
  {
-	int ret;
-	int query = 0x6e;
+	int state = 0;
+	int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, 0, &state,
+				       sizeof(state), sizeof(state));
+	if (ret)
+		return ret;

-	ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &query, sizeof(query),
-				   0);
+	return (state & 0x10) ? 1 : 0;
+}

+static int hp_wmi_enable_hotkeys(void)
+{
+	int value = 0x6e;
+	int ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, 1, &value,
+				       sizeof(value), 0);
  	if (ret)
  		return -EINVAL;
  	return 0;
@@ -663,8 +672,9 @@ static int __init hp_wmi_input_setup(void)
  			    hp_wmi_tablet_state());
  	input_sync(hp_wmi_input_dev);

-	if (hp_wmi_bios_2009_later() == 4)
-		hp_wmi_enable_hotkeys();
+	if (hp_wmi_bios_2009_later() == HPWMI_RET_UNKNOWN_CMDTYPE)
+		if !(hp_wmi_2008_later() == HPWMI_RET_UNKNOWN_CMDTYPE)
+			hp_wmi_enable_hotkeys();

  	status = wmi_install_notify_handler(HPWMI_EVENT_GUID, hp_wmi_notify, 
NULL);
  	if (ACPI_FAILURE(status)) {
-- 
1.8.5.5


If this is ok I'll add my sign-off and resend. I agree that the return 
state of hp_wmi_enable_hotkeys is lacking, but the only thing that I see 
error handling realistically doing in this case is adding code cruft and 
processing cycles. If you would like anything further, let me know.
