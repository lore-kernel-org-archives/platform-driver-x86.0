Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857584248C1;
	Mon, 20 Jul 2026 13:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784553989; cv=none; b=cz4njmtSqDz8bU5H4xWGWrXVczSfiFLdpF1pFg8XFh5SKKSUHo29Mt3M8IckBeRiLYUP81DpdU6I6iENh1iF2gjYaVyv5LuRZa+9A6g1xovuY91gTFSPfA6yIZOFLMYXU1d/IfaNEVlSgS8VOdsq4rcjdj05TEZJcgIA3BNXc0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784553989; c=relaxed/simple;
	bh=tZ27laQVAQihCe7BybnluqHMgRInlj7iSf6L74STA/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lF561+XSwkfsHjkeOyAJlEpGY0nqbWyMWExaGjauWDNMlzoi8OeThn/A6tPaUsYstrbteE7V0fc2BIUtRx3aX5x6kA/nIry1/rixKL0dD7mDeVAyKw5NdoMY09mRc/ZmuYvHbFfzURpovzSRE6AJ2YFLHa9wJPrUqxA1dZOipx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=EUAgwHNY; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="EUAgwHNY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784553982; x=1785158782; i=w_armin@gmx.de;
	bh=Ek8Pgdl012EG/8LBtHpp4va5zI8b8Sx/g+w8inTvl4c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EUAgwHNYoCiWXRBJ5yblp62IUZmFsT2XcVIid3abz5yR8Aw7bhhI7eKqFdbd2RKL
	 yeQ/DBpSCU+Q/2v/NCeh5d/6lGYdXdffCXRSC6D3cVXsUjl91tj2YGNUrq8sHu6Mb
	 QFIxUjcOBy/nc7xzp1fhfOezNCJca9qQbJilTb6BkF0G4cYUek2XSjKwS7CANaNTB
	 msVhz/BD4PWb5cyeFWkyFRDYI5ZJqC1JccGyOTfIFwAiksOV9f2r7j3bcoz3Be9o3
	 trXVOlC0p8KwjIGm/VyMqe41/Lwr0OXMniyAdFkceFpyUiYeOsdci+txKLqwMBlkW
	 JEVQBF4UTgXyjUTgiQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3se8-1xCNIs0yjA-0136TQ; Mon, 20
 Jul 2026 15:26:22 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	wse@tuxedocomputers.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] platform/x86: uniwill-laptop: Remove single color keyboard detection
Date: Mon, 20 Jul 2026 15:26:11 +0200
Message-Id: <20260720132611.374073-3-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:G9hSr2lVNSMqRZAVYHuuYHombaXsaaXrOIgFi7QtMQB6kQcazal
 /yjtbRV3/f9Qw9/sCy/+zk7VjZD3X/i5Fw1vZd4NeRyKWhF3jeFI+EZiM6XcfR+EMlIxGkE
 kowlEuhFC2tXiGYoLmgida4dTP9Dg8YLsMMCB2Ljax+ocKYLUEDwYe0iexVASLqT14bGyfQ
 zO3EEZeyZ/q99ebGX4ZCQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jy1ZOqpix+A=;r/kjufavl1hcKrwI1qGJyzZbFh3
 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
 StwgElFJ4nil

Having a ad-hoc device whitelist inside uniwill_kbd_led_init()
to work around unreliable KBD_WHITE_ONLY values conflicts with
the idea of the device descriptor infrastructure.

Remove the ad-hoc device whitelist and use the device descriptor
infrastructure instead.

Suggested-by: Werner Sembach <wse@tuxedocomputers.com>
Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 32 +++++++--------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index d27f316800f6..7a2eeaec4c96 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -255,6 +255,7 @@
 #define FAN_CURVE_LENGTH		5
=20
 #define EC_ADDR_KBD_STATUS		0x078C
+/* Unreliable on some models, use the device descriptor instead. */
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

