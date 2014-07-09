From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH 1/2] asus-wmi: control wlan-led if wapf > 0
Date: Wed,  9 Jul 2014 16:18:18 +0800
Message-ID: <1404893899-10082-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:55037 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751574AbaGIISY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Jul 2014 04:18:24 -0400
Received: by mail-pa0-f46.google.com with SMTP id eu11so8713304pac.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Jul 2014 01:18:24 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Corentin Chary <corentin.chary@gmail.com>

Wifi will be controlled by asus-wmi driver when wapf > 0
So, controls the wifi-led when wapf > 0

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 19c313b..cb22d3f 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -558,7 +558,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 			goto error;
 	}
 
-	if (wlan_led_presence(asus) && (asus->driver->quirks->wapf == 4)) {
+	if (wlan_led_presence(asus) && (asus->driver->quirks->wapf > 0)) {
 		INIT_WORK(&asus->wlan_led_work, wlan_led_update);
 
 		asus->wlan_led.name = "asus::wlan";
@@ -887,7 +887,7 @@ static int asus_new_rfkill(struct asus_wmi *asus,
 		return -EINVAL;
 
 	if ((dev_id == ASUS_WMI_DEVID_WLAN) &&
-			(asus->driver->quirks->wapf == 4))
+			(asus->driver->quirks->wapf > 0))
 		rfkill_set_led_trigger_name(*rfkill, "asus-wlan");
 
 	rfkill_init_sw_state(*rfkill, !result);
-- 
1.8.3.2
