Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577D43F825F;
	Fri, 10 Jul 2026 22:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722721; cv=none; b=fgfiWgGZE+YJQHrqD44iuaT/KCUgOw1/PpEM1DHea+amqJxrUYyeh53SMPsVVKE+CV5W+g+AkJBH6Su2jGobZ61aP29T/UgS1pp4xL/yokBA3+K0cUJa4B4w2dtY6Fsrr7sPp0PAnwY07Mk8olBNgz66Sp/FTJ3vuyQzfPSRlzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722721; c=relaxed/simple;
	bh=G+ndQJ96QbSBPn0u0AlbptL0ZM3DJ/5/qGtDziExvHk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LVh2JjNO4pyCZc2HZn+JyVj37N55G+59CCQOFxqqI7Lu+1oY8Xfkc9NvU24m5RlLuP511w32zHOBd2RcBDkC7YX9UQ6VPFR9wEeaTI5NGIRW8BVREB/QCqoh21xMaSClcsGcKNt99gONCpbNOOJytcBjOw6jIdwcGkPVNZ/84hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=jyDgx+/n; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="jyDgx+/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783722716; x=1784327516; i=w_armin@gmx.de;
	bh=EsW7Gtc8FLBZ/L8Fu7jmTcFNIKy9kpKvL69q5/rliN8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jyDgx+/nmIdrAYpgKeBsqd62ZXCthbmUf33qoUI6/Be7sfZ27GKXI2m8eV6PKhsI
	 4H8roFsROglrEcKkz0POydD5o2ZDupBcJapz7G4c/iM9p5Q5rR7mq/5iR/DCyAB+2
	 EM5S8YM27Q4or6f1X6g0KmqdkGRtA9irYB/p33gVDCE8dEJEqsdG46uv0hsYqMsBH
	 fsIqA7WQk/VHLrUekSPvXkUmWXRe5N2Gr4mZgeGO7CdG2hnnDMekyG23S5MI3Lw5T
	 ykVvk5+UG93GFHTlaLHby5Ov7Htltu1zqYPbdzIAdK3dnSIL7r7RMq9z5BO6d2gfb
	 U2Yo+lc6weT63gg68Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhlGq-1xDEey2XTM-00aa91; Sat, 11
 Jul 2026 00:31:56 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	wse@tuxedocomputers.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] platform/x86: uniwill-laptop: Remove single color keyboard detection
Date: Sat, 11 Jul 2026 00:31:49 +0200
Message-Id: <20260710223150.48661-3-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:cJEscUj0u6+O71yMHQ5fgmTGAFwoB+cQMoTUvS1KhCWAIZKyaID
 Yjcs1ZYp6exvPSxiP81I7sDu/9Bacuv9cSfiVP0YaB6FyX6JYmvDUX1BAkixf7uogN5En3P
 9JYVc1bVTAOix53wtJJhXXOF2IIj7Ebjl/dpp6FVdK/+uzVsknpMTTbwPCtQN20QPx51VQB
 T6h1KelbRvzqludvNvXsw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sAM9qShbDuQ=;CFYHSopCUWA3qyvfygKl7vb0oSM
 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
 2ZRISGvsWqhtUj0F2hmFIgYrzI/7/O

It turns out that the code for detecting single color keyboards
might not work correctly on future models. Remove it and use the
device descriptor instead.

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

