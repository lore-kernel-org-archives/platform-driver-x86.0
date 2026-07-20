Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C973330D2A;
	Mon, 20 Jul 2026 13:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784553994; cv=none; b=XbEcS+EQzScDDbC6ZrOMIR7VU9nw6H+Jf6PgekliuyidTrc2vDDz3MVlrACsaM1JLJVyFCCWyXTTASFI1WSINnwkkmE0E7y2HXuRPyaFrt/gWK7QZQY53+OYmrcRcnoOXFebYGaDmLezvNEmx3ejDkj+JeNcqHBafFdM4uXddgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784553994; c=relaxed/simple;
	bh=LYzP1POdw5a8yQvN2W2giofafmG+0KdWcbaPKgHCpnM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lbd+HGBNHzcvT6Eh8aSKjs63e8juvoaidIdDvjZZ+DMOQUcbciKw4b8iBwVEPgMbaaI7ozf5DIRRoBPQvQ6n1HfE7BPROaBD1guG63GmlpYPCrho8TV+Rdy/8Qxq4ltkdnmSp/JAxkh5XukicSOTpKWneQUyklNeZjj014BwHTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=r9vHHlun; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="r9vHHlun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784553981; x=1785158781; i=w_armin@gmx.de;
	bh=I3QLeFOpVdZz+WqxOEz/DExYIgT0mE3i9ktSQa08Fbs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=r9vHHlunSJsV9tsoWo6UnQr05CZnCafxVYQ7kJ291xA3SEVtIGh9j3lLRpHekbyg
	 5yEb6lHwOy5C73sfLo2Pqa6LZ8obWMvF0jAIG0Jv8txmY2KR5z9ihnkKci7vsZzYp
	 sSi7UYuXG9V56XMQqPif5xFP/t4Tj8QkygQ8DjdbDNjb+5Jdm8EWLACj9mnx5VJbL
	 7MUJ8HZJkcwi9H8CYoKBjB5eC2JeZYU8D7Y7SBln0OIh8+A8NgrEG8Li1Jvm+WStC
	 3I21Igz9NdqDkqAxXoyuJAQIbC3IxWpcP0g/klrC1JvfPgmDCyJDvsWcPiNPnhgE8
	 Ot/mYypfZLWXmTlYpg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1fmq-1xABRU3QVM-017Y0y; Mon, 20
 Jul 2026 15:26:20 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	wse@tuxedocomputers.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] platform/x86: uniwill-laptop: Split uniwill_kbd_led_init()
Date: Mon, 20 Jul 2026 15:26:10 +0200
Message-Id: <20260720132611.374073-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260720132611.374073-1-W_Armin@gmx.de>
References: <20260720132611.374073-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JruQYaSm3H8OQcxAg2c2OJXGSA9oqW5S6xMvAbPnRQ4NL2VUIgy
 bGlonUsH2IsWhwVxnAE8GI1Al0oTTbE0wx2INagp89n/fCd+xD1in2h/7laXKMYY9Qxgbh+
 aNsmN1j0KreavsFCPLC6ajrXKc2c3HEfuMPoo11bdfIM+9dmILFSk/w6aCQsfWkapmkq8Mp
 mU5ate41yWQb5Z16dW0HQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5NIJdMHUzZU=;89MLcl0EwBMzsrZzDXP2fBdIEaM
 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
 =

The function uniwill_kbd_led_init() is quite large and doing multiple
things at once:
- general hardware initialisation
- single color keyboard backlight registration
- RGB keyboard backlight registration

Move the last two things into separate functions to increase the
maintainability of uniwill_kbd_led_init().

Suggested-by: Werner Sembach <wse@tuxedocomputers.com>
Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 123 +++++++++++---------
 1 file changed, 70 insertions(+), 53 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 310445583832..d27f316800f6 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1733,7 +1733,24 @@ static enum led_brightness uniwill_kbd_led_mc_brigh=
tness_get(struct led_classdev
 	return uniwill_kbd_led_read_brightness(data);
 }
=20
-static int uniwill_kbd_led_init(struct uniwill_data *data)
+static int uniwill_white_kbd_led_init(struct uniwill_data *data)
+{
+	struct led_init_data init_data =3D {
+		.default_label =3D "white:" LED_FUNCTION_KBD_BACKLIGHT,
+		.devicename =3D DRIVER_NAME,
+		.devname_mandatory =3D true,
+	};
+
+	data->kbd_led_cdev.max_brightness =3D data->kbd_led_max_brightness;
+	data->kbd_led_cdev.color =3D LED_COLOR_ID_WHITE;
+	data->kbd_led_cdev.flags =3D LED_BRIGHT_HW_CHANGED | LED_REJECT_NAME_CON=
FLICT;
+	data->kbd_led_cdev.brightness_set_blocking =3D uniwill_kbd_led_brightnes=
s_set;
+	data->kbd_led_cdev.brightness_get =3D uniwill_kbd_led_brightness_get;
+
+	return devm_led_classdev_register_ext(data->dev, &data->kbd_led_cdev, &i=
nit_data);
+}
+
+static int uniwill_rgb_kbd_led_init(struct uniwill_data *data)
 {
 	unsigned int color_indices[KBD_LED_CHANNELS] =3D {
 		LED_COLOR_ID_RED,
@@ -1741,6 +1758,7 @@ static int uniwill_kbd_led_init(struct uniwill_data =
*data)
 		LED_COLOR_ID_BLUE,
 	};
 	struct led_init_data init_data =3D {
+		.default_label =3D "multicolor:" LED_FUNCTION_KBD_BACKLIGHT,
 		.devicename =3D DRIVER_NAME,
 		.devname_mandatory =3D true,
 	};
@@ -1749,57 +1767,6 @@ static int uniwill_kbd_led_init(struct uniwill_data=
 *data)
 	unsigned int regval;
 	int ret;
=20
-	if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
-		return 0;
-
-	ret =3D regmap_read(data->regmap, EC_ADDR_SUPPORT_2, &regval);
-	if (ret < 0)
-		return ret;
-
-	if (!(regval & CHINA_MODE)) {
-		ret =3D regmap_set_bits(data->regmap, EC_ADDR_BIOS_OEM_2, ENABLE_CHINA_=
MODE);
-		if (ret < 0)
-			return ret;
-	}
-
-	ret =3D regmap_read(data->regmap, EC_ADDR_KBD_STATUS, &regval);
-	if (ret < 0)
-		return ret;
-
-	regval |=3D KBD_APPLY;
-	regval &=3D ~KBD_POWER_OFF;
-	ret =3D regmap_write(data->regmap, EC_ADDR_KBD_STATUS, regval);
-	if (ret < 0)
-		return ret;
-
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
-	if (data->single_color_kbd) {
-		init_data.default_label =3D "white:" LED_FUNCTION_KBD_BACKLIGHT;
-		data->kbd_led_cdev.max_brightness =3D data->kbd_led_max_brightness;
-		data->kbd_led_cdev.color =3D LED_COLOR_ID_WHITE;
-		data->kbd_led_cdev.flags =3D LED_BRIGHT_HW_CHANGED | LED_REJECT_NAME_CO=
NFLICT;
-		data->kbd_led_cdev.brightness_set_blocking =3D uniwill_kbd_led_brightne=
ss_set;
-		data->kbd_led_cdev.brightness_get =3D uniwill_kbd_led_brightness_get;
-
-		return devm_led_classdev_register_ext(data->dev, &data->kbd_led_cdev, &=
init_data);
-	}
-
 	for (int i =3D 0; i < KBD_LED_CHANNELS; i++) {
 		data->kbd_led_mc_subled_info[i].color_index =3D color_indices[i];
=20
@@ -1851,7 +1818,6 @@ static int uniwill_kbd_led_init(struct uniwill_data =
*data)
 	if (ret < 0)
 		return ret;
=20
-	init_data.default_label =3D "multicolor:" LED_FUNCTION_KBD_BACKLIGHT;
 	data->kbd_led_mc_cdev.led_cdev.max_brightness =3D data->kbd_led_max_brig=
htness;
 	data->kbd_led_mc_cdev.led_cdev.color =3D LED_COLOR_ID_MULTI;
 	data->kbd_led_mc_cdev.led_cdev.flags =3D LED_BRIGHT_HW_CHANGED | LED_REJ=
ECT_NAME_CONFLICT;
@@ -1864,6 +1830,57 @@ static int uniwill_kbd_led_init(struct uniwill_data=
 *data)
 							 &init_data);
 }
=20
+static int uniwill_kbd_led_init(struct uniwill_data *data)
+{
+	unsigned int regval;
+	int ret;
+
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
+		return 0;
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_SUPPORT_2, &regval);
+	if (ret < 0)
+		return ret;
+
+	if (!(regval & CHINA_MODE)) {
+		ret =3D regmap_set_bits(data->regmap, EC_ADDR_BIOS_OEM_2, ENABLE_CHINA_=
MODE);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret =3D regmap_read(data->regmap, EC_ADDR_KBD_STATUS, &regval);
+	if (ret < 0)
+		return ret;
+
+	regval |=3D KBD_APPLY;
+	regval &=3D ~KBD_POWER_OFF;
+	ret =3D regmap_write(data->regmap, EC_ADDR_KBD_STATUS, regval);
+	if (ret < 0)
+		return ret;
+
+	switch (data->project_id) {
+	case PROJECT_ID_PF:
+	case PROJECT_ID_PF4MU_PF4MN_PF5MU:
+	case PROJECT_ID_PH4TRX1:
+	case PROJECT_ID_PH4TUX1:
+	case PROJECT_ID_PH4TQX1:
+	case PROJECT_ID_PH6TRX1:
+	case PROJECT_ID_PH6TQXX:
+	case PROJECT_ID_PHXAXXX:
+	case PROJECT_ID_PHXPXXX:
+		data->single_color_kbd =3D true;
+		break;
+	default:
+		data->single_color_kbd =3D regval & KBD_WHITE_ONLY;
+		break;
+	}
+
+	if (data->single_color_kbd)
+		return uniwill_white_kbd_led_init(data);
+
+	return uniwill_rgb_kbd_led_init(data);
+}
+
 static unsigned int uniwill_sanitize_battery_threshold(unsigned int value=
)
 {
 	/* 0 means "charging threshold not active" */
=2D-=20
2.39.5

