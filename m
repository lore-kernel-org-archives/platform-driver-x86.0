From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH] fujitsu-laptop: Support radio toggle button
Date: Wed, 24 Feb 2016 14:23:32 +0100
Message-ID: <1456320212-18127-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:35806 "EHLO
	mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756162AbcBXNWh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 24 Feb 2016 08:22:37 -0500
Received: by mail-lf0-f51.google.com with SMTP id l143so11613114lfe.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Feb 2016 05:22:36 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Lifebook E734/E744/E754 has a radio toggle button which uses code 0x420=
=2E
Map it to KEY_RFKILL.

Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
Tested on a Lifebook E744.

 drivers/platform/x86/fujitsu-laptop.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x=
86/fujitsu-laptop.c
index 1c62caf..ffc84cc 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -114,6 +114,7 @@
 #define KEY2_CODE	0x411
 #define KEY3_CODE	0x412
 #define KEY4_CODE	0x413
+#define KEY5_CODE	0x420
=20
 #define MAX_HOTKEY_RINGBUFFER_SIZE 100
 #define RINGBUFFERSIZE 40
@@ -149,7 +150,7 @@ struct fujitsu_t {
 	char phys[32];
 	struct backlight_device *bl_device;
 	struct platform_device *pf_device;
-	int keycode1, keycode2, keycode3, keycode4;
+	int keycode1, keycode2, keycode3, keycode4, keycode5;
=20
 	unsigned int max_brightness;
 	unsigned int brightness_changed;
@@ -823,6 +824,7 @@ static int acpi_fujitsu_hotkey_add(struct acpi_devi=
ce *device)
 	set_bit(fujitsu->keycode2, input->keybit);
 	set_bit(fujitsu->keycode3, input->keybit);
 	set_bit(fujitsu->keycode4, input->keybit);
+	set_bit(fujitsu->keycode5, input->keybit);
 	set_bit(KEY_UNKNOWN, input->keybit);
=20
 	error =3D input_register_device(input);
@@ -962,6 +964,9 @@ static void acpi_fujitsu_hotkey_notify(struct acpi_=
device *device, u32 event)
 			case KEY4_CODE:
 				keycode =3D fujitsu->keycode4;
 				break;
+			case KEY5_CODE:
+				keycode =3D fujitsu->keycode5;
+				break;
 			case 0:
 				keycode =3D 0;
 				break;
@@ -1072,6 +1077,7 @@ static int __init fujitsu_init(void)
 	fujitsu->keycode2 =3D KEY_PROG2;
 	fujitsu->keycode3 =3D KEY_PROG3;
 	fujitsu->keycode4 =3D KEY_PROG4;
+	fujitsu->keycode5 =3D KEY_RFKILL;
 	dmi_check_system(fujitsu_dmi_table);
=20
 	result =3D acpi_bus_register_driver(&acpi_fujitsu_driver);
--=20
1.7.10.4
