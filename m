From: Kirill Tkhai <tkhai@yandex.ru>
Subject: [PATCH]hp-wmi: Fix gps support in hp_wmi_rfkill_setup()
Date: Sat, 01 Jun 2013 03:16:36 +0400
Message-ID: <1341451370042196@web8f.yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from forward14.mail.yandex.net ([95.108.130.92]:33829 "EHLO
	forward14.mail.yandex.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757517Ab3EaXYW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 31 May 2013 19:24:22 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <matthew.garrett@nebula.com>

Current gps support in hp_wmi_rfkill_setup() looks like bad copy/past.
It leads to kernel panic on my HP530 laptop. So I did:

1)Fix rfkill_set_hw_state() wrong argument in case of gps
2)Fix wwan/gps register_*_error label order and error handling

Signed-off-by: Kirill Tkhai <tkhai@yandex.ru>
CC: Matthew Garrett <matthew.garrett@nebula.com>
CC: Trep=C3=A1k Vilmos <trepo@netcomga.sk>
---
 drivers/platform/x86/hp-wmi.c |   30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)
diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wm=
i.c
index 45cacf7..ef81b92 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -640,7 +640,7 @@ static int hp_wmi_rfkill_setup(struct platform_devi=
ce *device)
 						(void *) HPWMI_BLUETOOTH);
 		if (!bluetooth_rfkill) {
 			err =3D -ENOMEM;
-			goto register_wifi_error;
+			goto register_bluetooth_error;
 		}
 		rfkill_init_sw_state(bluetooth_rfkill,
 				     hp_wmi_get_sw_state(HPWMI_BLUETOOTH));
@@ -658,7 +658,7 @@ static int hp_wmi_rfkill_setup(struct platform_devi=
ce *device)
 					   (void *) HPWMI_WWAN);
 		if (!wwan_rfkill) {
 			err =3D -ENOMEM;
-			goto register_gps_error;
+			goto register_wwan_error;
 		}
 		rfkill_init_sw_state(wwan_rfkill,
 				     hp_wmi_get_sw_state(HPWMI_WWAN));
@@ -666,7 +666,7 @@ static int hp_wmi_rfkill_setup(struct platform_devi=
ce *device)
 				    hp_wmi_get_hw_state(HPWMI_WWAN));
 		err =3D rfkill_register(wwan_rfkill);
 		if (err)
-			goto register_wwan_err;
+			goto register_wwan_error;
 	}
=20
 	if (wireless & 0x8) {
@@ -676,11 +676,11 @@ static int hp_wmi_rfkill_setup(struct platform_de=
vice *device)
 						(void *) HPWMI_GPS);
 		if (!gps_rfkill) {
 			err =3D -ENOMEM;
-			goto register_bluetooth_error;
+			goto register_gps_error;
 		}
 		rfkill_init_sw_state(gps_rfkill,
 				     hp_wmi_get_sw_state(HPWMI_GPS));
-		rfkill_set_hw_state(bluetooth_rfkill,
+		rfkill_set_hw_state(gps_rfkill,
 				    hp_wmi_get_hw_state(HPWMI_GPS));
 		err =3D rfkill_register(gps_rfkill);
 		if (err)
@@ -688,23 +688,27 @@ static int hp_wmi_rfkill_setup(struct platform_de=
vice *device)
 	}
=20
 	return 0;
-register_wwan_err:
-	rfkill_destroy(wwan_rfkill);
-	wwan_rfkill =3D NULL;
-	if (gps_rfkill)
-		rfkill_unregister(gps_rfkill);
 register_gps_error:
-	rfkill_destroy(gps_rfkill);
+	if (gps_rfkill)
+		rfkill_destroy(gps_rfkill);
 	gps_rfkill =3D NULL;
+	if (wwan_rfkill)
+		rfkill_unregister(wwan_rfkill);
+register_wwan_error:
+	if (wwan_rfkill)
+		rfkill_destroy(wwan_rfkill);
+	wwan_rfkill =3D NULL;
 	if (bluetooth_rfkill)
 		rfkill_unregister(bluetooth_rfkill);
 register_bluetooth_error:
-	rfkill_destroy(bluetooth_rfkill);
+	if (bluetooth_rfkill)
+		rfkill_destroy(bluetooth_rfkill);
 	bluetooth_rfkill =3D NULL;
 	if (wifi_rfkill)
 		rfkill_unregister(wifi_rfkill);
 register_wifi_error:
-	rfkill_destroy(wifi_rfkill);
+	if (wifi_rfkill)
+		rfkill_destroy(wifi_rfkill);
 	wifi_rfkill =3D NULL;
 	return err;
 }
