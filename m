Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ECE4BB27F
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 17:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494099; cv=none; b=OYAEx+veKEB0tQnQBl/fWoRY+Gk9KuWdAjsNhUHUA96qpdMS7WdtkcCQ9qLLTwTZlufGMYAoaxKIk+sUts7m/LyUdWIp5nJ4AV+sfm3uMTTMgvjd0s/H0wfFNxdlqJChvyaKB3QwcSHYEI2OGIMEf0R58bljCsmA8RqTtUrzRgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494099; c=relaxed/simple;
	bh=KqrvaNzWNR8WvVI76kQ1FafPz3OW/UaLUaj6UxFIy8U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YVS4kcgOk/yq05Hbv/f1Q3awzmUin9g0idpBk9h88KSPvWw0ZDAZRETASBelkPtyctuqr7zIvIHOrQrhxQso48GfkKA/YKoJa71Zt6bs+NG3OQsVPVv9/1JjN7Pi6vZSj7H6Bbkh/Uv81CAO8Dt0Mwx/P423a4eVdW0XlG3EtEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=STEPWMQv; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="STEPWMQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1789494094; x=1789753294;
	bh=uFvzRZC7YNb2HGF0G9uvjG4DqaPPiPsfLbWh3+PkvHQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=STEPWMQvy1TQ6avws+YRlAN070E55fuB+fmJA6tXvdbrcqbh+F7WwcaN0bFu5Get3
	 OMuPFVgydtJHHG7v+teUhFqgaXMHpqRYsIbxlWSvay3deKW8EDGnoiEoyHjZR/8mqS
	 qhZMFE0d0xtgerlXErHgyubKimJ3JKUVjnj9rIRmplOuq93s7MEnLum3Qo1C/IOHnn
	 YO9KubtaJdqNu1RcN8F1Zxnw8dIzho8gQ57DjOepMeGg/K/kk0vaDcWKdh045hOybS
	 L+k/GfOKFp6PC6+hPbhITrSoxcGWkuDRBAoGNVpQY3nASMogvwOmO6Gv1/OkH+UvrB
	 /uXefs2N+ZSMQ==
Date: Tue, 15 Sep 2026 17:41:28 +0000
To: platform-driver-x86@vger.kernel.org
From: patryk.dankow@protonmail.com
Cc: =?utf-8?Q?Patryk_Da=C5=84k=C3=B3w?= <patryk.dankow@protonmail.com>, corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: asus-wmi: Add mute LED support
Message-ID: <20260915174110.67871-2-patryk.dankow@protonmail.com>
In-Reply-To: <20260915174110.67871-1-patryk.dankow@protonmail.com>
References: <20260915174110.67871-1-patryk.dankow@protonmail.com>
Feedback-ID: 221603438:user:proton
X-Pm-Message-ID: 19d809f29e67ca9cbaf4c5d377e332c2e08e2215
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Patryk Da=C5=84k=C3=B3w <patryk.dankow@protonmail.com>

Add support for WMI device 0x0004001c and register it as the
platform::mute LED using the audio-mute trigger.

The device ID is present in the PM3406CKA DSDT and is also used
by GHelper for controlling the same LED.

Tested on ASUS ExpertBook PM3406CKA.

Signed-off-by: Patryk Da=C5=84k=C3=B3w <patryk.dankow@protonmail.com>
---
 drivers/platform/x86/asus-wmi.c            | 26 +++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wm=
i.c
index a65090429ca7..d7c100dc2020 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -262,6 +262,7 @@ struct asus_wmi {
 =09struct led_classdev lightbar_led;
 =09int lightbar_led_wk;
 =09struct led_classdev micmute_led;
+=09struct led_classdev mute_led;
 =09struct led_classdev camera_led;
 =09struct workqueue_struct *led_workqueue;
 =09struct work_struct tpd_led_work;
@@ -2054,6 +2055,16 @@ static int micmute_led_set(struct led_classdev *led_=
cdev,
 =09return err < 0 ? err : 0;
 }
=20
+static int mute_led_set(struct led_classdev *led_cdev,
+=09=09=09enum led_brightness brightness)
+{
+=09int state =3D brightness !=3D LED_OFF;
+=09int err;
+
+=09err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_MUTE_LED, state, NULL);
+=09return err < 0 ? err : 0;
+}
+
 static enum led_brightness camera_led_get(struct led_classdev *led_cdev)
 {
 =09struct asus_wmi *asus;
@@ -2084,6 +2095,7 @@ static void asus_wmi_led_exit(struct asus_wmi *asus)
 =09led_classdev_unregister(&asus->wlan_led);
 =09led_classdev_unregister(&asus->lightbar_led);
 =09led_classdev_unregister(&asus->micmute_led);
+=09led_classdev_unregister(&asus->mute_led);
 =09led_classdev_unregister(&asus->camera_led);
=20
 =09if (asus->led_workqueue)
@@ -2176,7 +2188,19 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 =09=09asus->micmute_led.default_trigger =3D "audio-micmute";
=20
 =09=09rv =3D led_classdev_register(&asus->platform_device->dev,
-=09=09=09=09=09=09&asus->micmute_led);
+=09=09=09=09=09   &asus->micmute_led);
+=09=09if (rv)
+=09=09=09goto error;
+=09}
+
+=09if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MUTE_LED)) {
+=09=09asus->mute_led.name =3D "platform::mute";
+=09=09asus->mute_led.max_brightness =3D 1;
+=09=09asus->mute_led.brightness_set_blocking =3D mute_led_set;
+=09=09asus->mute_led.default_trigger =3D "audio-mute";
+
+=09=09rv =3D led_classdev_register(&asus->platform_device->dev,
+=09=09=09=09=09   &asus->mute_led);
 =09=09if (rv)
 =09=09=09goto error;
 =09}
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/pla=
tform_data/x86/asus-wmi.h
index b5ed8c83ace1..3810c4a0da23 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -54,6 +54,7 @@
 #define ASUS_WMI_DEVID_LED5=09=090x00020015
 #define ASUS_WMI_DEVID_LED6=09=090x00020016
 #define ASUS_WMI_DEVID_MICMUTE_LED=09=090x00040017
+#define ASUS_WMI_DEVID_MUTE_LED=090x0004001C
=20
 /* Disable Camera LED */
 #define ASUS_WMI_DEVID_CAMERA_LED_NEG=090x00060078 /* 0 =3D on (unused) */
--=20
2.55.0


