Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FA53932C2;
	Fri, 10 Jul 2026 22:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722968; cv=none; b=qhXUj5aLcBBI67fzgEfI6byxEBMMxkSvARuU4AlA8DAjsGLcpr/l3HfsHP5D0lnolZ8CZyjNLFMirv6nKzl90toymVNcGdDcHCC39jbEUDvubnLlLUYY8g5ud+wj7Bqp68Ycg8+qVATB4e3Iu6VKB+4FQTW+IJz2EjgEaFP1y7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722968; c=relaxed/simple;
	bh=CDneiVgv3GgtJ6/m4yPr0NLPBcUgoeUXYgH/KGsbY9A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J04KQiGXIwrXUFz0k3gxThN3C54qIoDXAZa9sf4BMLaARmbk3u1Ipx0YyxL6824teGwJDVmt29WKmpcU9Bsj+P++XCZzPctqBiSUJKu9JWfumXWxN9yTgh98qGfgj6yQ/bKjpaJPLAglMAvh7XACUoEBsRBOuzgym29+otVW57I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=hG7r+KbV; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="hG7r+KbV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783722947; x=1784327747; i=w_armin@gmx.de;
	bh=gUKSUILR9JFx6mA6YCkweDsPYf1wSfiL6ZPXnsPq+4I=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hG7r+KbVWVP9H9YIP2jQNVcvBOmDHUS198+aLrOSfOgPXfGPHuDFKRiCVeg56kH5
	 Sm1lZy3b6aDDJ0MIg+3/IlJ9fUPX1tjX9C7VyttvC2dsbDo1HMli5zULQn/6Gudmu
	 bO6B4qDOYMVr/MWug6lDYhzRFsHgSuMWEDZ0I4SHhsXuVM6yejzbFlnf2Q9XKAyLE
	 2+q0sJ5/8wWQFKsMFZLmJn+WEJUjN6dXTAbyqQcHaLFL04FJJ0OmgKOjjEU50VFP2
	 H9Rh4z9eStLReqFuQaYynEQoUIPI4oqxZ+z+vtcr2AE/kyNalSiJrxGpD6DjQ9McG
	 /tkgPrN57UmBcWeV6g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlw3X-1xQgrZ3B2J-00qjuR; Sat, 11
 Jul 2026 00:35:46 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	wse@tuxedocomputers.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] platform/x86: uniwill-laptop: Split uniwill_kbd_led_init()
Date: Sat, 11 Jul 2026 00:35:42 +0200
Message-Id: <20260710223544.49602-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260710223544.49602-1-W_Armin@gmx.de>
References: <20260710223544.49602-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:u0L6BP4dKExiSdTB9trVCbktunyk3jGNQDq4aZS2mDDwC4J9Okq
 HD2UCT2MR24+xUTB5wD0wQTiOpc7tLF3wGwRDRFzBbUxprVBAQB9da5bqrdmUAAZCXBIuZ+
 8SjPJY39uMuFE0WGTJMmoGBAoFXLsHdhLhsGvAizRTN73/1ZpFDbOsM+4VO/bxd2Mv9CP2l
 6MPL2qFnxdwONmygd9mnQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EWBottQdd3w=;/SCEN7lBdXP1yhRH3RMZGvcLKmf
 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
 JPRXybKkZg2XummcnRiluzNhTNRvdl

The function uniwill_kbd_led_init() is quite large and doing multiple
things at once:
- general hardware initialisation
- single color keyboard backlight registration
- RGB keyboard backlight registration

Move the last two things into separate functions to increase the
maintainability of uniwill_kbd_led_init().

Suggested-by: Werner Sembach <wse@tuxedocomputers.com>
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

