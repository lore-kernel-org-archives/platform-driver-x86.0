From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH 1/2] asus-wmi: control wlan-led if wapf > 0
Date: Wed,  2 Oct 2013 11:41:03 +0800
Message-ID: <1380685264-18619-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:44746 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752562Ab3JBDlJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 1 Oct 2013 23:41:09 -0400
Received: by mail-pd0-f179.google.com with SMTP id v10so300105pde.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Oct 2013 20:41:08 -0700 (PDT)
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
