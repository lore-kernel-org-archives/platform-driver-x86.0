Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC2234A3AB;
	Mon, 22 Jun 2026 19:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782157182; cv=none; b=S9X4xZ9VRZ9uhHXWPkcjUQHKMa87zhsw9c8KDz6BJVgNw+JGyGBtM+fZASf/jt6c9LPI1tEGwVIeSy1BVgfAe67Rea8URfLsXSamzSnDnxztzpU3GtjForBuMtfRBCjbcdsaTw+5yVTvFIEalTwayJnKHbEc2E+HIr5hopH03Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782157182; c=relaxed/simple;
	bh=vNXxWh/AVUhEgzAYuWiBvUGmk4WWIyL2cmVwKx8i6h4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d5MjOVRjrpbXfbeFk3zCuyOEEBL9EaiLEmLO/ORURy2cZXZJYyksibBE4d40ZoooPZKybQEKhsIPPD4bGQMT5YQwRmDEKLHXDYH0FK83cUkG5HD1h2N7slTM18e+SF3gqKm/SLsJ5A+AnNgI2Rd1nQnwxhe2CDPQ26UzbfradGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=i/D1ENwg; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="i/D1ENwg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1782157172; x=1782761972; i=w_armin@gmx.de;
	bh=EfffxkweRWr3/qukJcG4aXD0Jr/7FBcl5jIU7g6+Wwc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=i/D1ENwgJWZZzQJkQ3Or8K3t5FmT6juHo05d9thyYD95jwIaBZVG2BaKVs9XRcPY
	 k93+Va2qpluY59CfQmg/1el2rR044kbITh4lyU1SXqXy3c4E5nzHcxmIc0nZyICM+
	 /5b4j5E+jwqaV62aVAa8szr1j8GPLcJJ1k+2nuzwGCivJMGJPlsTPsmZnzk3bstO7
	 ytq4AZTcZldufUs8JtcnnhboWSox98uuEolttd2Ioe1WhEV1TalV7MR8A/f6vmSbu
	 ZslmFgYi5tLCWXtZol3ypIuURCWaNLxlZ82AQhDmtyWyIDQE4FEikYX/BxDxPpeO/
	 yfzh763U+yU16Hqb8A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBm1e-1wRs3U2Aw8-009L7h; Mon, 22
 Jun 2026 21:39:32 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: matan@svgalib.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] platform/x86: lg-laptop: Fix keyboard backlight support on LG Gram 16T90SP
Date: Mon, 22 Jun 2026 21:39:14 +0200
Message-Id: <20260622193914.116999-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260622193914.116999-1-W_Armin@gmx.de>
References: <20260622193914.116999-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8XNMeALuslRYEJvoJRzntmyu+9JGBIY84z+Gq0yaMtFQUn4vxLU
 9tCLP7a2OxzH3NYioC+adXQVzR0xWMbPtccdl4rzTCWTvMVTqv9Ckk0y9NLX9y1F+5ufJ5V
 nI9bTw9FDGRxIr9eQLqZ5Ovv9SKRb2gbZGdXSQya35lROaoVVcfxAn5a05Xb85v/ibMcrfR
 kugfZqUlf8xjrjdwZLwJg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:08rIgtpQvwM=;cidOIGFHR7Rb6mr8bMR5Bz1qafN
 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
 vGx1il5K3wCiOTkr0c=

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
index d1b33a6b5206..22f8a6368f7c 100644
=2D-- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -86,6 +86,18 @@ MODULE_PARM_DESC(fw_debug, "Enable printing of firmware=
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
@@ -601,15 +613,25 @@ static LED_DEVICE(tpad_led, 1, 0);
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
@@ -621,13 +643,16 @@ static enum led_brightness get_kbd_backlight_level(s=
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

