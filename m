Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84834AA57C;
	Wed,  7 Oct 2026 14:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791384076; cv=none; b=ow2J3D4QlVkroVQGpoXPgNvFFFZJbRNiFpHRRwBW/2s4D2WSrDS6evr1Xd71MqgbYEsFb8hxsQbXkXWRCmcmD07QX/ngehSiV8aFHD1C8Lhfo43B3adLvhDiSZM6Or6v9zoEkZBUWCPdEA1bFzFJUL5L0It4xpJk5meGtfptV4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791384076; c=relaxed/simple;
	bh=8xqpsdXOd3uyiiUZy83XVjm83FAzfzvxanGuatUOZxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G89a4TD/iy60M1LJT383OqniA1Vv12aOpUvf5pWztZCkwe75VA29E2vBWWqJyqzdMMrVnlicr7j+dH+Vmjh1JT1oN9ej77CDkJ6bzTb0QES0dMxqKY56XOgSQNV4OITtuPEhWMq8b7utQA3WXPry60/8e1VHJOdkzZxy22CL9x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=DXUbYmYD; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="DXUbYmYD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1791384069; x=1791988869; i=w_armin@gmx.de;
	bh=hyYsL67M700isduxhzAISd4WW3zKBw85H5e0pzSpfEE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DXUbYmYDPEGpUvxIff+RT7GJpzZBVvd5S6VHuTcFmZEv5I4HQUufNIo66W5sDS9F
	 fDsPvxbzOawAKRIIxg2D5y/ORyhqqKwxW37HS+bGAkmOVA1Ey7zLKN98DcTY+0JEy
	 z/Up9CpIRHNJYNXRBS5vajhIk1Y3afQfLZAA783OKe63vV/0BaGHkQuCceHzsmnm/
	 t0Clnj6oZuONTYABDKN4wpJBFp3bzxsYVzm6oQfittNvKFPUkmCXm9FquRRxgC5Qq
	 BYTwLfZ6iE27pySFDMzqYhJUl1bq7TV9SVip0wjhDbMN9SwyRxWE8iB9pt055/ZEq
	 G1V02lGwr4ntI3C+HA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmjw-1x7Gms3Rjm-00OmYl; Wed, 07
 Oct 2026 16:41:08 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] platform/x86: uniwill-laptop: Fix breathing animation on Intel QC
Date: Wed,  7 Oct 2026 16:38:56 +0200
Message-ID: <20261007144101.323289-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007144101.323289-1-W_Armin@gmx.de>
References: <20261007144101.323289-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MjKHFBlxVbX0wSs9I89VsEYtykOD9wAeCQyNAJCzotILwRLx6ze
 V7ksY6dTGN9ha9tODrBvxJ2UQi2PIckusdfAFIgaIguzPHvgPpbbAxDY83rPOX+s7MFIFwb
 xHDy5rQ2KLeIJLpyOJ2PSf1vrK3ChNNQz7U1wdbGNV2kyGEJpbCmqla6534t5XRQIoqEsLC
 jiSifwg/zwNU5l6mqlmYw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:F7DR88ZyUVM=;Nqk8K27EG/8fSYwjeOj89U6HM8B
 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
 SZ2FfnIQ==

Intel NUC 9 Extreme (Queens County) devices have a separate bit
inside the EC_ADDR_LIGHTBAR_AC_CTRL register for enabling the
breathing animation in s2idle mode.

Add support for this additional setting.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../ABI/testing/sysfs-driver-uniwill-laptop   |  4 +--
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 27 ++++++++++++++-----
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Docum=
entation/ABI/testing/sysfs-driver-uniwill-laptop
index b9b9feebe2ed..f3060aaf8a76 100644
=2D-- a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
+++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
@@ -35,8 +35,8 @@ KernelVersion:	6.19
 Contact:	Armin Wolf <W_Armin@gmx.de>
 Description:
 		Causes the integrated lightbar to display a breathing animation when th=
e machine
-		has been suspended and is running on AC power. Writing "1"/"0" into thi=
s file
-		enables/disables this functionality.
+		has been suspended, is running on AC power and the lightbar brightness =
not zero.
+		Writing "1"/"0" into this file enables/disables this functionality.
=20
 		Reading this file returns the current status of the breathing animation
 		functionality.
diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 0fb0d267664a..29d3578213c6 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -165,9 +165,10 @@
 #define EC_ADDR_LIGHTBAR_AC_CTRL	0x0748
 #define LIGHTBAR_APP_EXISTS		BIT(0)
 #define LIGHTBAR_POWER_SAVE		BIT(1)
-#define LIGHTBAR_S0_OFF			BIT(2)
-#define LIGHTBAR_S3_OFF			BIT(3)	// Breathing animation when suspended
-#define LIGHTBAR_WELCOME		BIT(7)	// Rainbow animation
+#define LIGHTBAR_S0_OFF			BIT(2)	/* Also disables animations */
+#define LIGHTBAR_S3_OFF			BIT(3)	/* No breathing animation when in s2ram =
*/
+#define LIGHTBAR_MODERN_STANDBY_ON	BIT(6)	/* Breathing animation when in =
s2idle */
+#define LIGHTBAR_WELCOME		BIT(7)	/* Rainbow animation */
=20
 #define EC_ADDR_LIGHTBAR_AC_RED		0x0749
=20
@@ -306,7 +307,7 @@
 #define EC_ADDR_USB_C_POWER_PRIORITY	0x07CC
 #define USB_C_POWER_PRIORITY		BIT(7)
=20
-/* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF */
+/* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF and LIGHT=
BAR_MODERN_STANDBY_ON */
 #define EC_ADDR_LIGHTBAR_BAT_CTRL	0x07E2
=20
 #define EC_ADDR_LIGHTBAR_BAT_RED	0x07E3
@@ -913,12 +914,13 @@ static ssize_t breathing_in_suspend_store(struct dev=
ice *dev, struct device_attr
 		return ret;
=20
 	if (enable)
-		value =3D 0;
+		value =3D LIGHTBAR_MODERN_STANDBY_ON;
 	else
 		value =3D LIGHTBAR_S3_OFF;
=20
 	/* We only access a single register here, so we do not need to use data-=
>led_lock */
-	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LIGHT=
BAR_S3_OFF, value);
+	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL,
+				 LIGHTBAR_S3_OFF | LIGHTBAR_MODERN_STANDBY_ON, value);
 	if (ret < 0)
 		return ret;
=20
@@ -936,6 +938,10 @@ static ssize_t breathing_in_suspend_show(struct devic=
e *dev, struct device_attri
 	if (ret < 0)
 		return ret;
=20
+	/*
+	 * We only test LIGHTBAR_S3_OFF here, because LIGHTBAR_MODERN_STANDBY_ON
+	 * should have the exact opposite value.
+	 */
 	return sysfs_emit(buf, "%d\n", !(value & LIGHTBAR_S3_OFF));
 }
=20
@@ -1543,7 +1549,8 @@ static struct led_trigger uniwill_lightbar_trigger =
=3D {
 	.trigger_type =3D &uniwill_lightbar_trigger_type,
 };
=20
-#define LIGHTBAR_MASK	(LIGHTBAR_APP_EXISTS | LIGHTBAR_S0_OFF | LIGHTBAR_S=
3_OFF | LIGHTBAR_WELCOME)
+#define LIGHTBAR_MASK	(LIGHTBAR_APP_EXISTS | LIGHTBAR_S0_OFF | LIGHTBAR_S=
3_OFF | \
+			 LIGHTBAR_MODERN_STANDBY_ON | LIGHTBAR_WELCOME)
=20
 static int uniwill_led_init(struct uniwill_data *data)
 {
@@ -1576,6 +1583,11 @@ static int uniwill_led_init(struct uniwill_data *da=
ta)
 		return ret;
=20
 	value |=3D LIGHTBAR_APP_EXISTS;
+	if (value & LIGHTBAR_S3_OFF)
+		value &=3D ~LIGHTBAR_MODERN_STANDBY_ON;
+	else
+		value |=3D LIGHTBAR_MODERN_STANDBY_ON;
+
 	ret =3D regmap_write(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, value);
 	if (ret < 0)
 		return ret;
@@ -1585,6 +1597,7 @@ static int uniwill_led_init(struct uniwill_data *dat=
a)
 	 * running on battery power.
 	 */
 	value |=3D LIGHTBAR_S3_OFF;
+	value &=3D ~LIGHTBAR_MODERN_STANDBY_ON;
 	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LIGH=
TBAR_MASK, value);
 	if (ret < 0)
 		return ret;
=2D-=20
2.55.0

