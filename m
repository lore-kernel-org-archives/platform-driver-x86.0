From: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH] acer-wmi: deactive mail led when power off
Date: Sat, 26 Feb 2011 21:18:58 +0100
Message-ID: <AANLkTinMFGRJkcLgLgNgf7M4fe1yyNJVeqJdX8qh=hec@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:63001 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752393Ab1BZUTi convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 26 Feb 2011 15:19:38 -0500
Received: by iwn34 with SMTP id 34so2020933iwn.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Feb 2011 12:19:38 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, carlos@strangeworlds.co.uk

This patch deactive mail led when laptop is going to hibernete/suspend
or power off. After resume from hibernate/suspend correctly restore
mail led state.

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
Tested-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>

--- a/drivers/platform/x86/acer-wmi.c/acer-wmi.c	2011-01-30
00:28:04.000000000 +0100
+++ b/drivers/platform/x86/acer-wmi.c/acer-wmi.c	2011-01-30
01:30:02.000000000 +0100
@@ -887,6 +887,7 @@ static int __devinit acer_led_init(struc

 static void acer_led_exit(void)
 {
+	set_u32(LED_OFF, ACER_CAP_MAILLED);
 	led_classdev_unregister(&mail_led);
 }

@@ -1166,6 +1167,7 @@ pm_message_t state)

 	if (has_cap(ACER_CAP_MAILLED)) {
 		get_u32(&value, ACER_CAP_MAILLED);
+		set_u32(LED_OFF, ACER_CAP_MAILLED);
 		data->mailled =3D value;
 	}

@@ -1193,6 +1195,17 @@ static int acer_platform_resume(struct p
 	return 0;
 }

+static void acer_platform_shutdown(struct platform_device *device)
+{
+	struct acer_data *data =3D &interface->data;
+
+	if (!data)
+		return;
+
+	if (has_cap(ACER_CAP_MAILLED))
+		set_u32(LED_OFF, ACER_CAP_MAILLED);
+}
+
 static struct platform_driver acer_platform_driver =3D {
 	.driver =3D {
 		.name =3D "acer-wmi",
@@ -1202,6 +1215,7 @@ static struct platform_driver acer_platf
 	.remove =3D acer_platform_remove,
 	.suspend =3D acer_platform_suspend,
 	.resume =3D acer_platform_resume,
+	.shutdown =3D acer_platform_shutdown,
 };

 static struct platform_device *acer_platform_device;


--
Pali Roh=C3=A1r
pali.rohar@gmail.com
