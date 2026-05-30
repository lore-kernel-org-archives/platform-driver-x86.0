Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA163AC0FC;
	Sat, 30 May 2026 17:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780160913; cv=none; b=OFMJ8h1qFLXSJmooY8mR3ijWZbCY10M47fk9qVAcIPF7XkmVnUEf9rHRIJ7xV4SmK1MxUqFvSLq6Xrxrhdw2O0e6nwJ0CR3haMlYJiiQItyNXlsOt53S64t1qShrd0l9vMhl5YJgqVaIjqKecw93msCBUsrzBPUhcklJYv/3WM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780160913; c=relaxed/simple;
	bh=kZDruwbqreBpmWMBu6cZeEOviF7AR5rxDXQw3qTTtps=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o/eybfuujfT5/nsNZ6yphgzm1c64GrTxVOUgfo4rr1D2wkfveSRXydSn7IdihozCnN0/112lzJxkGGpcehtYVpeJEqUR0tTD239f1KxXATeGfVfjoNmvXYWBiw8Oi5vi8xpTp2I6vZQbxu4r/NX9NhLhlKQr9R8CFtSlg0DT3Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=SHsoXakD; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="SHsoXakD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780160907; x=1780765707; i=w_armin@gmx.de;
	bh=pgRvckvajwwmWE2WCmcugtHmnmfdX1fkxQlJFMFD1dQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SHsoXakDp5Bb5SILEDd5drHcIrPd2jAU58i8IQjdFOtLKRNjQxRMxdF7zraaxwIi
	 N1/Qq6Z7GwKaXkSMUAsMh5rCHn4bRPRFnzrW/TNHPOmi97Swj5gOuUmlAtbvRXxm1
	 FlBpIQu/oe9Fps/xrifcQ9PW34eZBroKZWki9JPNvedIiNCgsHKjwTXtTzd/nLwk0
	 WZ6Jy8q6ZuZ6SV2KioBtFY4xIOyauilVAuuxlW+O+G1GWJaUJQYG5KLxwcBFgg2un
	 EiTI6Pbvq+fMKrhmSQmapbNEHF8bf4QynQPV3UlXBs+kNaWTM7uOzgaOI6zKZquLf
	 TGBhnMj9zOEobvsG2g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6ll8-1wNItp0B3u-00FoAO; Sat, 30
 May 2026 19:08:27 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wse@tuxedocomputers.com
Subject: [PATCH 7/7] platform/x86: uniwill-laptop: Add lightbar support for LAPQC71A/B
Date: Sat, 30 May 2026 19:08:13 +0200
Message-Id: <20260530170813.10166-8-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260530170813.10166-1-W_Armin@gmx.de>
References: <20260530170813.10166-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MJCnMvgWkQnfYYOF3eEnvuPbVG4izEabA2qfmUOMrRQAfAau8Zg
 /VDdq0nc8RwvTqnZ3OvVOQ1TtgqqYm9xk4ZOBCF33LvfyMX6aEMoTe9daO02AasCY8ErtJF
 +QwyqhiRp53eoe4yYxxIzTAAPmNxB+cl2UZ01ib6FAu13tz+Uzm3YxvPErJB1Ms9joNIT9f
 WcDoUINb3y8X3AKqSrcWg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:P/H+TeSiBSw=;jIsCzLigIA/KqsUcgozD1wi/wIE
 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

The LAPQC71A and LAPQC71B both feature a RGB lightbar with 36
brightness levels per color component. Extend the device descriptor
to supply the maximum brightness of the lightbar and whitelist
both models for UNIWILL_FEATURE_LIGHTBAR.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index d688ffca3b5e..f55b239bd4d1 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -348,7 +348,6 @@
 #define FAN_TABLE_LENGTH	16
=20
 #define LED_CHANNELS		3
-#define LED_MAX_BRIGHTNESS	200
=20
 #define KBD_LED_CHANNELS	3
 #define KBD_LED_MAX_INTENSITY	50
@@ -398,6 +397,7 @@ struct uniwill_data {
 	struct mutex super_key_lock;	/* Protects the toggling of the super key l=
ock state */
 	struct list_head batteries;
 	struct mutex led_lock;		/* Protects writes to the lightbar registers */
+	u8 lightbar_max_brightness;
 	struct led_classdev_mc led_mc_cdev;
 	struct mc_subled led_mc_subled_info[LED_CHANNELS];
 	bool single_color_kbd;
@@ -427,6 +427,7 @@ struct uniwill_battery_entry {
 struct uniwill_device_descriptor {
 	unsigned int features;
 	u8 kbd_led_max_brightness;
+	u8 lightbar_max_brightness;
 	/* Executed during driver probing */
 	int (*probe)(struct uniwill_data *data);
 };
@@ -1514,7 +1515,7 @@ static int uniwill_led_brightness_set(struct led_cla=
ssdev *led_cdev, enum led_br
=20
 	for (int i =3D 0; i < LED_CHANNELS; i++) {
 		/* Prevent the brightness values from overflowing */
-		value =3D min(LED_MAX_BRIGHTNESS, data->led_mc_subled_info[i].brightnes=
s);
+		value =3D min(data->lightbar_max_brightness, data->led_mc_subled_info[i=
].brightness);
 		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], va=
lue);
 		if (ret < 0)
 			return ret;
@@ -1583,14 +1584,14 @@ static int uniwill_led_init(struct uniwill_data *d=
ata)
 		return ret;
=20
 	data->led_mc_cdev.led_cdev.color =3D LED_COLOR_ID_MULTI;
-	data->led_mc_cdev.led_cdev.max_brightness =3D LED_MAX_BRIGHTNESS;
+	data->led_mc_cdev.led_cdev.max_brightness =3D data->lightbar_max_brightn=
ess;
 	data->led_mc_cdev.led_cdev.flags =3D LED_REJECT_NAME_CONFLICT;
 	data->led_mc_cdev.led_cdev.brightness_set_blocking =3D uniwill_led_brigh=
tness_set;
=20
 	if (value & LIGHTBAR_S0_OFF)
 		data->led_mc_cdev.led_cdev.brightness =3D 0;
 	else
-		data->led_mc_cdev.led_cdev.brightness =3D LED_MAX_BRIGHTNESS;
+		data->led_mc_cdev.led_cdev.brightness =3D data->lightbar_max_brightness=
;
=20
 	for (int i =3D 0; i < LED_CHANNELS; i++) {
 		data->led_mc_subled_info[i].color_index =3D color_indices[i];
@@ -1603,7 +1604,7 @@ static int uniwill_led_init(struct uniwill_data *dat=
a)
 		 * Make sure that the initial intensity value is not greater than
 		 * the maximum brightness.
 		 */
-		value =3D min(LED_MAX_BRIGHTNESS, value);
+		value =3D min(data->lightbar_max_brightness, value);
 		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], va=
lue);
 		if (ret < 0)
 			return ret;
@@ -2334,6 +2335,7 @@ static int uniwill_probe(struct platform_device *pde=
v)
=20
 	data->features =3D device_descriptor.features;
 	data->kbd_led_max_brightness =3D device_descriptor.kbd_led_max_brightnes=
s;
+	data->lightbar_max_brightness =3D device_descriptor.lightbar_max_brightn=
ess;
=20
 	/*
 	 * Some devices might need to perform some device-specific initializatio=
n steps
@@ -2673,11 +2675,13 @@ static struct uniwill_device_descriptor machenike_=
l16p_descriptor __initdata =3D {
=20
 static struct uniwill_device_descriptor lapqc71a_lapqc71b_descriptor __in=
itdata =3D {
 	.features =3D UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_LIGHTBAR |
 		    UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
 		    UNIWILL_FEATURE_CPU_TEMP |
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN,
+	.lightbar_max_brightness =3D 36,
 };
=20
 static struct uniwill_device_descriptor lapac71h_descriptor __initdata =
=3D {
@@ -2701,6 +2705,7 @@ static struct uniwill_device_descriptor lapkc71f_des=
criptor __initdata =3D {
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN,
+	.lightbar_max_brightness =3D 200,
 };
=20
 /*
@@ -3321,6 +3326,8 @@ static int __init uniwill_init(void)
 		device_descriptor.features =3D UINT_MAX & ~UNIWILL_FEATURE_BATTERY_CHAR=
GE_LIMIT;
 		/* Some models only support 3 brightness levels */
 		device_descriptor.kbd_led_max_brightness =3D 4;
+		/* Some models only support 36 brightness levels per color component */
+		device_descriptor.lightbar_max_brightness =3D 200;
 		pr_warn("Enabling potentially unsupported features\n");
 	}
=20
=2D-=20
2.39.5

