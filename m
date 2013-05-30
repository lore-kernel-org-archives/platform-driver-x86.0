From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] asus-wmi: control wlan-led only if wapf == 4
Date: Thu, 30 May 2013 10:31:50 +0800
Message-ID: <1369881110-16538-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pb0-f47.google.com ([209.85.160.47]:63011 "EHLO
	mail-pb0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S967053Ab3E3Cbz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 May 2013 22:31:55 -0400
Received: by mail-pb0-f47.google.com with SMTP id rr4so10176831pbb.34
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 May 2013 19:31:55 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Corentin Chary <corentin.chary@gmail.com>

Controlling the wlan led seems to have some side effects to the machines
with wapf value is not equal to 4. It will make the keyboard backlight
out of order.
So, the patch will enable the wlan led function only if the wapf == 4.

Bug: https://bugzilla.kernel.org/show_bug.cgi?id=46791

Reported-by: Mirto Silvio Busico <m.busico@ieee.org>
Tested-by: Karol Herbst <karolherbst@me.com>
Tested-by: drunkenbatman <drunkenbatman@gmail.com>
Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-wmi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index c11b242..8084a6f 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -558,7 +558,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 			goto error;
 	}
 
-	if (wlan_led_presence(asus)) {
+	if (wlan_led_presence(asus) && (asus->driver->quirks->wapf == 4)) {
 		INIT_WORK(&asus->wlan_led_work, wlan_led_update);
 
 		asus->wlan_led.name = "asus::wlan";
@@ -886,7 +886,8 @@ static int asus_new_rfkill(struct asus_wmi *asus,
 	if (!*rfkill)
 		return -EINVAL;
 
-	if (dev_id == ASUS_WMI_DEVID_WLAN)
+	if ((dev_id == ASUS_WMI_DEVID_WLAN) &&
+			(asus->driver->quirks->wapf == 4))
 		rfkill_set_led_trigger_name(*rfkill, "asus-wlan");
 
 	rfkill_init_sw_state(*rfkill, !result);
-- 
1.8.1.2
