Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF243BE645;
	Fri, 10 Jul 2026 22:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722720; cv=none; b=jAbkf/EiNzCY1YHBna9Wh+8198ulF3U+0erQ5qXP/O3l4D0w+1bp2B4VcrZtaRVjtqiK6MzO5pZHKG0FeGYNjIYk9c0y5SJc81JKHOcoA+1Zu6326ljorbLNMLcrNWYNoMHiNddW3CzMyLRxIZ4DJ5SA6bOL/DGYaops0avJX8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722720; c=relaxed/simple;
	bh=FZmf0nEiSR2wSUu6KdkFvJiT1Kyxo36q2TkEM7mw2+k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SHjBTjCsCOBSW2QRtGhhrEASuWJZ7hAyMxsHAXUrixsg8yrJpIRiniQtTqadtv42KjerR4xOVTv1Sa8EXEEB4JFqj/BEiQD2pNDOeKZb8cB6jRBGUA8oK0kALTCQDD8391iZ+VJq0QnAca0vKDQAQD4x9Au2UreTQKddqLRVZQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=TA9tNfN2; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="TA9tNfN2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783722716; x=1784327516; i=w_armin@gmx.de;
	bh=m8UkffatOc1in7hnlv7/O1FwxoMQI3u31i5mh/GRx8I=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TA9tNfN2fFAdVA0Gok503J1/XEldZ0SREKaGslftKzoSrzi9PcV3JBCa0QGhq8nI
	 PBebwccqffUvWehCA7JT+hHd6MGtWicOMCjx5Q1dMuyPGBWS3Ey/VQ5Z4iuUPC+A/
	 n/BBErfkO43rUADhhuNZACU2qeHPhQ8jsD2vMEBFg/rOEIs2U8KrZDF2Oddna54AX
	 XVTUygt3RnyyU86b0Skbid/VMFEhLSP+iiA43yi9OLAWCmFMxgN/npjs1Z4osT5MZ
	 nL9QFspW7jWfamwEWApkqRe2AgVGunGqP4kTHczNlZUFK+2BDi+gjTwwdE29uIKgy
	 RJvDGx3jTvY7jfb4EQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ma24y-1wW6P93arc-00ScCh; Sat, 11
 Jul 2026 00:31:55 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	wse@tuxedocomputers.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] platform/x86: uniwill-laptop: Split uniwill_kbd_led_init()
Date: Sat, 11 Jul 2026 00:31:48 +0200
Message-Id: <20260710223150.48661-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260710223150.48661-1-W_Armin@gmx.de>
References: <20260710223150.48661-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7+a6yGzDlCj1NnmWwl9TSAp0wj1zFs94KIhSP5maWAC2a3IDmPP
 D2nme6pT0fw1HDWwiA/mBvSIPBk542aA4Cfjy68pe9p94u+A043CbAVtbR58j+aMYegy3dj
 gqCa1a2Q412e8+O3MPE98n8mLcB/TpezhjjLTAK8S6bAV5RWiz7dGtSTz+7h/G8Nz8b2iO4
 PWI2ca/6uoOW3V5X4muAQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:E0ebOO5vsWA=;f3Fz5TWkRviB4jLqaUmv8ZQrlH3
 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
 FOT71GykOPVV4cox2w/NG4ztHJYbJ/

The function uniwill_kbd_led_init() is quite large and doing multiple
things at once:
- general hardware initialisation
- single color keyboard backlight registration
- RGB keyboard backlight registration

Move the last two things into separate functions to increase the
maintainability of uniwill_kbd_led_init().

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

