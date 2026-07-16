Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21BB377A9D;
	Thu, 16 Jul 2026 16:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219142; cv=none; b=o0u9ddjMLxKmv2LXnhnSdVIwX1amus8Oiaq5z4Jt2H1cYcWm/kf7c4XzWGbvcMbXwCWnKHR8a/m+/NoeP+P2TEG8QvXwAdwLWSiE2cVjXDkekEMKH7mbUimGZMsucsdffPq0BHyQaqw2UWaAoBJ/yc5zNPBytsze9QditiTo19I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219142; c=relaxed/simple;
	bh=biTnXKaVuwAKNercmwzsFQXqjiyi4ugmsUIIg30SLwY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XHYMegYX/uK5/f13qx4xbZWv0sr2IovKKvUj1+6NAQndT6ni7iXBrFzbE//1x59hAue39E+ckPiaECnNTfAiWSSmRDyK5yDL6KYnuXAhF4lLdG23o9/AhxJKZxSLv96SFSI2P/NmR7W2Vd85QZ+JouA5ipwvkwwnUxRe/fCvcWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=fZBN/bbO; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="fZBN/bbO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784219138; x=1784823938; i=w_armin@gmx.de;
	bh=7cMNzHmcyjJURfp74eKxW/fFb2RNncxcMzIG6zKWgzY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fZBN/bbOYm7A7sMNTP5F0zR//Gs8jlNVSZ5xK7Kfl/8px7qqfH1kWWB3RSareRWF
	 lZZBvlzRaVcovNaKf4PJQzoIRCEQQbRl06Sd+A4yXQj9X0MJkw1YH18NfI04EZWoI
	 Q6HO2k0Del0VtHQTvrZwF13BkkJ2RKV9T8TZ7Qf4P/qYFsSRiZMpw+FxsvbZxhrwx
	 bpnGhaZCU0aCUN1JT0fJGRqjYfH9mny2QF/gzvpHQBj/YXO/LmSlcFyVhgSC9MuXE
	 ItH4y1bEyRmw/sK+8WII1qPMFjvmMdK7ksHwwEEKWV72+xB7crQf5/n3H3eiLVrEj
	 5nKMKeNNlUab3gkBxg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQv8n-1wPrFe4BHj-00QmMw; Thu, 16
 Jul 2026 18:25:38 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	wse@tuxedocomputers.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] platform/x86: uniwill-laptop: Remove single color keyboard detection
Date: Thu, 16 Jul 2026 18:25:31 +0200
Message-Id: <20260716162531.5744-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260716162531.5744-1-W_Armin@gmx.de>
References: <20260716162531.5744-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1JITjxEpqRNCXDrgYFrxGAjmISFwMlh8u7aKxOIl5U1BpEpQgF5
 vIOiMFqWF4J4tCXCEoxRvjl8HXKhnl58i79wkCfBPl7SfTxSHS2iUgkrPnUhwcl9NgNFouW
 sdfkCvErGBjMyTB/JB03x99+KL123EjQpRwmqJTfYXIrwctcoqe5R20Hdht2mw0XGhJxcrn
 OWqRwxYKLnDjimOR3eSQg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sBn4hgzKxtM=;kvlVlsUtA913mdTtzL3pvfoSTpM
 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

Having a ad-hoc device whitelist inside uniwill_kbd_led_init()
to work around unreliable KBD_WHITE_ONLY values conflicts with
the idea of the device descriptor infrastructure.

Remove the ad-hoc device whitelist and use the device descriptor
infrastrcture instead.

Suggested-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 32 +++++++--------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index d27f316800f6..4591ee299a90 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -255,6 +255,7 @@
 #define FAN_CURVE_LENGTH		5
=20
 #define EC_ADDR_KBD_STATUS		0x078C
+/* Unreliable */
 #define KBD_WHITE_ONLY			BIT(0)
 #define KBD_POWER_OFF			BIT(1)
 #define KBD_TURBO_LEVEL_MASK		GENMASK(3, 2)
@@ -400,7 +401,7 @@ struct uniwill_data {
 	u8 lightbar_max_brightness;
 	struct led_classdev_mc led_mc_cdev;
 	struct mc_subled led_mc_subled_info[LED_CHANNELS];
-	bool single_color_kbd;
+	bool kbd_led_single_color;
 	u8 kbd_led_max_brightness;
 	unsigned int last_kbd_status;
 	union {
@@ -426,6 +427,7 @@ struct uniwill_battery_entry {
=20
 struct uniwill_device_descriptor {
 	unsigned int features;
+	bool kbd_led_single_color;
 	u8 kbd_led_max_brightness;
 	u8 lightbar_max_brightness;
 	/* Executed during driver probing */
@@ -1629,7 +1631,7 @@ static int uniwill_notify_kbd_led(struct uniwill_dat=
a *data, int brightness)
 	struct led_classdev *led_cdev;
 	int ret;
=20
-	if (data->single_color_kbd)
+	if (data->kbd_led_single_color)
 		led_cdev =3D &data->kbd_led_cdev;
 	else
 		led_cdev =3D &data->kbd_led_mc_cdev.led_cdev;
@@ -1858,24 +1860,7 @@ static int uniwill_kbd_led_init(struct uniwill_data=
 *data)
 	if (ret < 0)
 		return ret;
=20
-	switch (data->project_id) {
-	case PROJECT_ID_PF:
-	case PROJECT_ID_PF4MU_PF4MN_PF5MU:
-	case PROJECT_ID_PH4TRX1:
-	case PROJECT_ID_PH4TUX1:
-	case PROJECT_ID_PH4TQX1:
-	case PROJECT_ID_PH6TRX1:
-	case PROJECT_ID_PH6TQXX:
-	case PROJECT_ID_PHXAXXX:
-	case PROJECT_ID_PHXPXXX:
-		data->single_color_kbd =3D true;
-		break;
-	default:
-		data->single_color_kbd =3D regval & KBD_WHITE_ONLY;
-		break;
-	}
-
-	if (data->single_color_kbd)
+	if (data->kbd_led_single_color)
 		return uniwill_white_kbd_led_init(data);
=20
 	return uniwill_rgb_kbd_led_init(data);
@@ -2351,6 +2336,7 @@ static int uniwill_probe(struct platform_device *pde=
v)
 		return ret;
=20
 	data->features =3D device_descriptor.features;
+	data->kbd_led_single_color =3D device_descriptor.kbd_led_single_color;
 	data->kbd_led_max_brightness =3D device_descriptor.kbd_led_max_brightnes=
s;
 	data->lightbar_max_brightness =3D device_descriptor.lightbar_max_brightn=
ess;
=20
@@ -2580,7 +2566,7 @@ static int uniwill_resume_kbd_led(struct uniwill_dat=
a *data)
 	if (ret < 0)
 		return ret;
=20
-	if (data->single_color_kbd)
+	if (data->kbd_led_single_color)
 		return 0;
=20
 	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, RGB_APPLY_COLOR,=
 RGB_APPLY_COLOR);
@@ -2687,6 +2673,7 @@ static struct uniwill_device_descriptor machenike_l1=
6p_descriptor __initdata =3D {
 		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
 		    UNIWILL_FEATURE_AC_AUTO_BOOT |
 		    UNIWILL_FEATURE_USB_POWERSHARE,
+	.kbd_led_single_color =3D false,
 	.kbd_led_max_brightness =3D 4,
 };
=20
@@ -2869,6 +2856,7 @@ static struct uniwill_device_descriptor x4sp4nal_des=
criptor __initdata =3D {
 		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
 		    UNIWILL_FEATURE_AC_AUTO_BOOT |
 		    UNIWILL_FEATURE_USB_POWERSHARE,
+	.kbd_led_single_color =3D true,
 	.kbd_led_max_brightness =3D 2,
 };
=20
@@ -3363,6 +3351,8 @@ static int __init uniwill_init(void)
 	if (force) {
 		/* Assume that the device supports all features except the charge limit=
 */
 		device_descriptor.features =3D UINT_MAX & ~UNIWILL_FEATURE_BATTERY_CHAR=
GE_LIMIT;
+		/* Some models only have a (white) single color keyboard backlight */
+		device_descriptor.kbd_led_single_color =3D false;
 		/* Some models only support 3 brightness levels */
 		device_descriptor.kbd_led_max_brightness =3D 4;
 		/* Some models only support 36 brightness levels per color component */
=2D-=20
2.39.5

