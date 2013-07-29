From: Kirill Tkhai <tkhai@yandex.ru>
Subject: [PATCH]hp_wmi: Fix unregister order in hp_wmi_rfkill_setup()
Date: Mon, 29 Jul 2013 17:34:37 +0400
Message-ID: <3838581375104877@web14g.yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from forward17.mail.yandex.net ([95.108.253.142]:45435 "EHLO
	forward17.mail.yandex.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752126Ab3G2Nll (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Jul 2013 09:41:41 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Garrett Matthew <matthew.garrett@nebula.com>

Register order is:
			wifi
			bluetooth
			wwan
			gps

So unregister order must be:
			gps
			wwan
			bluetiith
			wifi

But currently gps and wwan are swapped. Fix that.
Also fix goto links.

Signed-off-by: Kirill Tkhai <tkhai@yandex.ru>
CC: Matthew Garrett <matthew.garrett@nebula.com>
---
 drivers/platform/x86/hp-wmi.c |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)
diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 97bb05e..aa5d0de 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -739,7 +739,7 @@ static int hp_wmi_rfkill_setup(struct platform_device *device)
 					   (void *) HPWMI_WWAN);
 		if (!wwan_rfkill) {
 			err = -ENOMEM;
-			goto register_gps_error;
+			goto register_bluetooth_error;
 		}
 		rfkill_init_sw_state(wwan_rfkill,
 				     hp_wmi_get_sw_state(HPWMI_WWAN));
@@ -747,7 +747,7 @@ static int hp_wmi_rfkill_setup(struct platform_device *device)
 				    hp_wmi_get_hw_state(HPWMI_WWAN));
 		err = rfkill_register(wwan_rfkill);
 		if (err)
-			goto register_wwan_err;
+			goto register_wwan_error;
 	}
 
 	if (wireless & 0x8) {
@@ -757,7 +757,7 @@ static int hp_wmi_rfkill_setup(struct platform_device *device)
 						(void *) HPWMI_GPS);
 		if (!gps_rfkill) {
 			err = -ENOMEM;
-			goto register_bluetooth_error;
+			goto register_wwan_error;
 		}
 		rfkill_init_sw_state(gps_rfkill,
 				     hp_wmi_get_sw_state(HPWMI_GPS));
@@ -769,16 +769,16 @@ static int hp_wmi_rfkill_setup(struct platform_device *device)
 	}
 
 	return 0;
-register_wwan_err:
-	rfkill_destroy(wwan_rfkill);
-	wwan_rfkill = NULL;
-	if (gps_rfkill)
-		rfkill_unregister(gps_rfkill);
 register_gps_error:
 	rfkill_destroy(gps_rfkill);
 	gps_rfkill = NULL;
 	if (bluetooth_rfkill)
 		rfkill_unregister(bluetooth_rfkill);
+register_wwan_error:
+	rfkill_destroy(wwan_rfkill);
+	wwan_rfkill = NULL;
+	if (gps_rfkill)
+		rfkill_unregister(gps_rfkill);
 register_bluetooth_error:
 	rfkill_destroy(bluetooth_rfkill);
 	bluetooth_rfkill = NULL;
