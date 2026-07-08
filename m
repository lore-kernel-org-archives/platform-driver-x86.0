Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36AA3E2AD7;
	Wed,  8 Jul 2026 19:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783540578; cv=none; b=fTJY5ndSO+Sg2x3Iks1iG+V/lvT3MLaGLamihQxXIy8xCyuyqxuGOzaSDpmAha07SL1oG74gBG5pL65TIr/PIpU2hDFsUByS5zFzc6kdLR7i/tw7dLu0kuSzEr/ez8qGt1qq2FJQozddWowLa1EvZgleBb8eTqRXkrmd/tzQZvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783540578; c=relaxed/simple;
	bh=rsc2v1DxkioD++pJwcgRI7WGA0SANKZkbm3fnxsYmFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZwktZ4EAyOO/T/cWt/iWy+pLMOaHyyuk92LxF96Yul975IisR1QOJ66sE/TeZc/+Pl+U5ntEAdZ/vKX7W/5FlsMEO1aeVR/u+ISd6mgA9lz05AXTStDyUOkHOPvUN5rpo5bULiVt5bUXc9wSQuEYcMgzjxtMa7+NmGO8jCrvuQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=hBotk57H; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="hBotk57H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783540565; x=1784145365; i=w_armin@gmx.de;
	bh=mgb+jmTCQ4I6p2kLXR2RLQhplq3cGVvGS76ELCNRsVI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hBotk57HV3TF6NMq8Zup2hXrvW8XdJgkuzjwIKJHIXIuIU8N11dHPYV20y4L/yWL
	 jibxdhS49cLQjS7oy1ibmxuBZvu1dAxnNcgIV7Ni0LknAU8vAEZ7fVmMLQiEw8pJo
	 tK/QecDyLYOpzy06liNLux3ivse/UxtS5TUo2lgaTmp/BfOAlCEEfhZTf270cDjZ4
	 mnj214Int7zzeghDPvaUJG3RDeb10iIAMiOBoo9JdkG1wJ3xb0VoIpCv8j6c1PODz
	 nlhZTbDvnYkoafvNx5i1kpPwhjoRKwloMMb2X89EhbN8jaMOSy0k6oV/tZMKYdrz+
	 Yq91nJ3mOLd9EzRifA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnakX-1xOYdc25NF-00p5If; Wed, 08
 Jul 2026 21:56:05 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: matan@svgalib.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] platform/x86: lg-laptop: Fix keyboard backlight support on LG Gram 16T90SP
Date: Wed,  8 Jul 2026 21:55:53 +0200
Message-Id: <20260708195553.7762-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260708195553.7762-1-W_Armin@gmx.de>
References: <20260708195553.7762-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JN/2VmE/ddJ9+d+oh0emC8zF3ivBW1FWbwwC4txU3rfKuI3lNpM
 jfsEaXKUOprWz6BODOMeVJrvvmyFbk1Igq+a0eMrmVy+1VG3VMhgveiKFLN0LimTYS06Xhx
 T4J/h6VBeskHk4AzGv/CuJ3TXaKhyWvQXPGkeGKs5Dmq0azvKwLHGXBXz+EUwoQqiXi4xV4
 bPTgRHhCaW+N35F3uEfAA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EZK98okbEck=;rAd+iW/Pix/q/fakIppBy2DqWCf
 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
 UpkS5j67Ii0mwqpzu9+coHShFBxGUl

On the LG Gram 16T90SP, the ACPI firmware will only accept the values
0x80, 0xA2 and 0xA4 when setting the keyboard backlight. After a bit
of research using ACPI tables from older models it seems that bit 8
is supposed to be always written as 1.

Fix the keyboard backlight support on this model by always setting
bit 8 inside the argument passed to the WMAB ACPI control method.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/lg-laptop.c | 47 ++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-la=
ptop.c
index 164012c1c409..36ad1e269443 100644
=2D-- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -88,6 +88,18 @@ MODULE_PARM_DESC(fw_debug, "Enable printing of firmware=
 debug messages");
 #define WMBB_USB_CHARGE 0x10B
 #define WMBB_BATT_LIMIT 0x10C
=20
+#define KBD_LED_BRIGHTNESS_MASK GENMASK(4, 0)
+#define KBD_LED_BRIGHTNESS_OFF	0x0
+#define KBD_LED_BRIGHTNESS_HALF 0x2
+#define KBD_LED_BRIGHTNESS_FULL 0x4
+#define KBD_LED_MODE_MASK	GENMASK(6, 5)
+#define KBD_LED_MODE_OFF	0x0
+#define KBD_LED_MODE_ON		0x1
+#define KBD_LED_STATUS		BIT(7)
+#define KBD_LED_MAGIC_MASK	GENMASK(15, 8)
+/* Exact purpose is unknown, maybe some sort of brightness limit? */
+#define KBD_LED_MAGIC		0x05
+
 #define FAN_MODE_LOWER GENMASK(1, 0)
 #define FAN_MODE_UPPER GENMASK(5, 4)
=20
@@ -603,15 +615,25 @@ static LED_DEVICE(tpad_led, 1, 0);
 static void kbd_backlight_set(struct led_classdev *cdev,
 			      enum led_brightness brightness)
 {
-	u32 val;
+	/* Must always be written */
+	u32 value =3D KBD_LED_STATUS;
+	u32 mode, bright;
+
+	if (brightness <=3D LED_OFF) {
+		mode =3D KBD_LED_MODE_OFF;
+		bright =3D KBD_LED_BRIGHTNESS_OFF;
+	} else {
+		mode =3D KBD_LED_MODE_ON;
+		if (brightness >=3D LED_FULL)
+			bright =3D KBD_LED_BRIGHTNESS_FULL;
+		else
+			bright =3D KBD_LED_BRIGHTNESS_HALF;
+	}
=20
-	val =3D 0x22;
-	if (brightness <=3D LED_OFF)
-		val =3D 0;
-	if (brightness >=3D LED_FULL)
-		val =3D 0x24;
+	value |=3D FIELD_PREP(KBD_LED_BRIGHTNESS_MASK, bright);
+	value |=3D FIELD_PREP(KBD_LED_MODE_MASK, mode);
=20
-	lg_wmab_set(cdev->dev->parent, WM_KEY_LIGHT, val);
+	lg_wmab_set(cdev->dev->parent, WM_KEY_LIGHT, value);
 }
=20
 static enum led_brightness get_kbd_backlight_level(struct device *dev)
@@ -623,13 +645,16 @@ static enum led_brightness get_kbd_backlight_level(s=
truct device *dev)
 	if (ret < 0)
 		return LED_OFF;
=20
-	if ((value & 0xFF00) !=3D 0x0500)
+	if (FIELD_GET(KBD_LED_MAGIC_MASK, value) !=3D KBD_LED_MAGIC)
+		return LED_OFF;
+
+	if (FIELD_GET(KBD_LED_MODE_MASK, value) =3D=3D KBD_LED_MODE_OFF)
 		return LED_OFF;
=20
-	switch (value & 0x27) {
-	case 0x24:
+	switch (FIELD_GET(KBD_LED_BRIGHTNESS_MASK, value)) {
+	case KBD_LED_BRIGHTNESS_FULL:
 		return LED_FULL;
-	case 0x22:
+	case KBD_LED_BRIGHTNESS_HALF:
 		return LED_HALF;
 	default:
 		return LED_OFF;
=2D-=20
2.39.5

