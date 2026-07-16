Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B92B37F737;
	Thu, 16 Jul 2026 16:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219148; cv=none; b=CY+FNfVPtrA/gNNx8CSYxE1whji8K84aWIBF5cCZ+WOk7thQWJdLbURlKsF5psevS2s4TP8PWXFgGGMtyKmbYvp5cKmLzJk7Tkk6c4TtiYgzYFtHzWvIxbAhNZrorRkqAl05yiXL+aCrNnRx6zTi6euC9JIbrl2HZ0S8ENEt2qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219148; c=relaxed/simple;
	bh=LYzP1POdw5a8yQvN2W2giofafmG+0KdWcbaPKgHCpnM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fgGIDtLbTLHajYHmjo0f2bsimF9NuDUq59p9XVOk90f3nf8Cgiy49hHQliJOFrasrRd5HDa/eITZc3eN1HnfPtFetLg/lgrWK8G+Ntgp7zFodZHRDYL7b28ZT6kpnGvSzDxkeaf3+Pv2cHMnOkooxZyQ89/hpflq662uPomT1f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=eZ76ZqU5; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="eZ76ZqU5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784219136; x=1784823936; i=w_armin@gmx.de;
	bh=I3QLeFOpVdZz+WqxOEz/DExYIgT0mE3i9ktSQa08Fbs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=eZ76ZqU5BZBXFeN8nPR3F+EhqLa7OJA7ZNrkqQGY/RvPZbv2M2xFInCsRY6bw97m
	 XerWmxmTbtDIHbRuwDMNtW7cE+HTBmfyMMrTfIPMrh+DFxqv5zu4CKuRvdoHs7ASb
	 u/ryxbYd/3UohUmcJ6ZtKlEuljLetzxyOXhgmRYzdqVypj3Ir6MbXyeuFT0Z+TsE8
	 inDmfPqrMqGu+TnXZKIoj5iNCPYmlVMwl7xtISlz7N54ECD4y5Cge2HAXgsNQNFT7
	 6VPq0K3NNnpul7Wc1kW/OkpYYCS1HHImdLToRtzrNup1vMAxrYRYSTrdC9EQnzW51
	 aQZ0VFbyKmTJ3qxhfw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N95iH-1x81m32xwF-00rcSE; Thu, 16
 Jul 2026 18:25:36 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	wse@tuxedocomputers.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] platform/x86: uniwill-laptop: Split uniwill_kbd_led_init()
Date: Thu, 16 Jul 2026 18:25:30 +0200
Message-Id: <20260716162531.5744-2-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:a40xJJ3v2s7WbAA+a3wHb/7x8RXnXITMMlb8sR2IdlMTXBm4W9x
 JPY+djWLrXgvyQZ3B2IJNvybBp5z98jRLhyeneYgEgkX/pxRQuh0de+kAnv3nYUeoZBdRWf
 E7c9YoHXEOMS+zlGC+xMHQEEIxJR99kiVhYkyQq79xeR/f7VzSjmIj5WHD9PS6RnsS6AfFn
 nxNmSpoihMnNr/ndzdv2g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:T3C1Cl3Ribk=;TcTphrm0LhkocFj+I9IcMfuF7//
 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

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

