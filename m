Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EE449E13F;
	Wed,  7 Oct 2026 14:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791384082; cv=none; b=QtzRiLjLTRyivZlA7ZraqkBnfxFYa00K3UBPYEeGEEQ94FgMkoAItPOCJeIXLJE1JuN2haxMyAQGPrWxHnzD7vd8NSanepzVqw1u/aGQJNLQnXPmCTBHap5FUQQgmdoTBTIVHN2/xxXXislt0oshK8VK6yjk1Vyd4NRFvpl6Nuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791384082; c=relaxed/simple;
	bh=i2Wsmnad2YBiLNNPaDxFsW7jz4ez9oDQpkoc+f9gy7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eb3I3RBWkd9Ls0KpJhbjj8w4a3eHT+tvZuM0gIJwaDcR8+1pecifjL/8BglzfI2nsim6ghrpBAdARiyIYHq+M5BScVBE3e0L5oMP9Drt6aPbE9Cxau1IyMxJI1x6+Drv2OvYCd9UFHmcy9AdMQWw+96Cb/0newPn4aRjKS5wTvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=KtCpOEok; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="KtCpOEok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1791384069; x=1791988869; i=w_armin@gmx.de;
	bh=kcKBwUTO4+Fg/Ey6YUO6HJnaOrhlisomcG3vV+yphP8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KtCpOEokFLU4UesSTRb6B2cr0omEhECms1PnkCzAIKybHEtKI1TIHCffGvu3n+1/
	 siCZY4xIsCb6pT7b6XEP5lGvaoKtMvVbFzhDeRpxMJhZMNcVJ+TGuLASS7Yd7UQpn
	 XwH3hSjnNk7QiM2zB9drNAflrnW8FSPRn9QAH3M+FDSj12+7oSQbgmPX7OcuXex7N
	 I0Of3DU40nK+ZFXASqNumOZiwtAa3QkNUtLnbZ7eUee8DKJb3aH6qgdv8anmlUSnl
	 AZAGaS+2UQhBdcIbqy8wYZmfnqzBM+MRA8RCc+q5D6uyOMbobDgSiiIFR3XV0rXXp
	 tLRskDvjvuN+8Z/chQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFKGZ-1xU9EK2E0H-002bLC; Wed, 07
 Oct 2026 16:41:09 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] platform/x86: uniwill-laptop: Label multicolor LEDs correctly
Date: Wed,  7 Oct 2026 16:38:57 +0200
Message-ID: <20261007144101.323289-5-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:bsJ2cdhVeUTAbS5IB1Rg8IvbaVlNvJLjd6tQXCUl9gGjAcblJr+
 M+w18ytXqd4LmQc6rSRrvitPVI4Zk7jmWXioLiYI0wpYfdZafYHbH0wSGp42mArv6jwAwAl
 lPR162cXNBhLd78Z3CjblbmJNWuJToLUZOeBvKTzbxTi6BcmgUeiXfYHkU3XsSs9qZScGXT
 YqQ6a8IEAuX3dWrLmFOZw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EomIpGpPzWA=;LNn5MxvG6BDkLUJeerhlZ7WWft+
 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
 MDJN+xd6ksbjKnMtdtAKoHOGW6nqs=

The LED subsystem specifies that LEDs capable of producing arbitrary
colors (like RGB) should label themselfs as "rgb" instead of
"multicolor".

Use the "rgb" label instead of the "multicolor" label to fix
detection by userspace applications.

Reported-by: Werner Sembach <wse@tuxedocomputers.com>
Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/18
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/admin-guide/laptops/uniwill-laptop.rst | 4 ++--
 drivers/platform/x86/uniwill/uniwill-acpi.c          | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Docume=
ntation/admin-guide/laptops/uniwill-laptop.rst
index aaf50e3074c1..d8ce30f10d7c 100644
=2D-- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
+++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
@@ -72,7 +72,7 @@ Lightbar
 --------
=20
 The ``uniwill-laptop`` driver exposes the lightbar found on some models a=
s a standard multicolor
-LED class device. The default name of this LED class device is ``uniwill:=
multicolor:status``.
+LED class device. The default name of this LED class device is ``uniwill:=
rgb:status``.
=20
 The lightbar supports a separate rainbow animation mode that can be enabl=
ed by selecting the
 `uniwill-rainbow` LED trigger. To enable a breathing animation during sus=
pend, see
@@ -83,7 +83,7 @@ Keyboard Backlight
=20
 The ``uniwill-laptop`` driver supports controlling the keyboard backlight=
 using the standard
 LED class interface. The default name of this LED class device is ``uniwi=
ll:white:kbd_backlight``
-when the keyboard backlight supports only a single color, or ``uniwill:mu=
lticolor:kbd_backlight``
+when the keyboard backlight supports only a single color, or ``uniwill:rg=
b:kbd_backlight``
 when the keyboard backlight supports RGB colors. The maximum intensity fo=
r each color channel
 in RGB mode is 50.
=20
diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 29d3578213c6..ff07bc33c6cc 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1556,7 +1556,7 @@ static int uniwill_led_init(struct uniwill_data *dat=
a)
 {
 	struct led_init_data init_data =3D {
 		.devicename =3D DRIVER_NAME,
-		.default_label =3D "multicolor:" LED_FUNCTION_STATUS,
+		.default_label =3D "rgb:" LED_FUNCTION_STATUS,
 		.devname_mandatory =3D true,
 	};
 	unsigned int color_indices[3] =3D {
@@ -1602,7 +1602,7 @@ static int uniwill_led_init(struct uniwill_data *dat=
a)
 	if (ret < 0)
 		return ret;
=20
-	data->led_mc_cdev.led_cdev.color =3D LED_COLOR_ID_MULTI;
+	data->led_mc_cdev.led_cdev.color =3D LED_COLOR_ID_RGB;
 	data->led_mc_cdev.led_cdev.max_brightness =3D 1;
 	data->led_mc_cdev.led_cdev.flags =3D LED_REJECT_NAME_CONFLICT;
 	data->led_mc_cdev.led_cdev.brightness_set_blocking =3D uniwill_led_brigh=
tness_set;
@@ -1810,7 +1810,7 @@ static int uniwill_rgb_kbd_led_init(struct uniwill_d=
ata *data)
 		LED_COLOR_ID_BLUE,
 	};
 	struct led_init_data init_data =3D {
-		.default_label =3D "multicolor:" LED_FUNCTION_KBD_BACKLIGHT,
+		.default_label =3D "rgb:" LED_FUNCTION_KBD_BACKLIGHT,
 		.devicename =3D DRIVER_NAME,
 		.devname_mandatory =3D true,
 	};
@@ -1871,7 +1871,7 @@ static int uniwill_rgb_kbd_led_init(struct uniwill_d=
ata *data)
 		return ret;
=20
 	data->kbd_led_mc_cdev.led_cdev.max_brightness =3D data->kbd_led_max_brig=
htness;
-	data->kbd_led_mc_cdev.led_cdev.color =3D LED_COLOR_ID_MULTI;
+	data->kbd_led_mc_cdev.led_cdev.color =3D LED_COLOR_ID_RGB;
 	data->kbd_led_mc_cdev.led_cdev.flags =3D LED_BRIGHT_HW_CHANGED | LED_REJ=
ECT_NAME_CONFLICT;
 	data->kbd_led_mc_cdev.led_cdev.brightness_set_blocking =3D uniwill_kbd_l=
ed_mc_brightness_set;
 	data->kbd_led_mc_cdev.led_cdev.brightness_get =3D uniwill_kbd_led_mc_bri=
ghtness_get;
=2D-=20
2.55.0

