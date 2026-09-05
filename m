Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0396F33B6FC;
	Sat,  5 Sep 2026 13:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613316; cv=none; b=LpK3JimKFWK9KbcntYbwtkHYPCRW41JV4tE6Cq33Bi2tXItiLNk8LFzncfc6S2daE3LjxY43mOR+LL6eFh/LTVkLUFLwDafn443xRITJcqPqXJf0Kridq49fGGJBX3/Jfwr5eEtLfFtnBJZqcWdNZz+PSNrZ6g0VT9vLTbCCIyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613316; c=relaxed/simple;
	bh=Hz4SqLdtwt/c7MIdIVuRVUAvUWg4XE+OonNNKfq67DM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GK8AM7Jd3/GWQaPY+Q9HtkAATolXc3ukLxOEEK8joFNuz+d16pN1gh2mzdCcQjCLnKCsyJBNMe1P+NJVVOJ/1z9TSKleXw3eUR0p+AzeLAHI3q22bVIKK1/UeOJklldvHKN1l8kPppZHTVKCf8EzhrJh/54YKP+3A7sw+7yi3vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=guasex9e; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="guasex9e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788613304; x=1789218104; i=w_armin@gmx.de;
	bh=8XQ+M2DDSW5Xlpd+r6N5pwARPqksaKG1chuysndIQgw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=guasex9eE+ydh88tkHPRXwhVTRdVgqLja590hLYBzariveIpo8zySKk3uOPjb8r/
	 vXecIXskgF+oa2Dp0zDmDPIjMGCaUjKMfq0UrQPn1ugHh+0QGWGp7ib5pONgu8hy7
	 1BLoQVz5mXD/tGvBfxOasis81XiHgKG6sC6zipuHJSYENLmVQD8g34rMEfoIYBQxK
	 AQxKGqglPvJMph8NUWme7Tmr4euNChwZIB1j9+no985S+hPeuI3jKARILwkVp+ACa
	 dBZOSWEKW9Mn47+hWjluwxbA7UU6Tp4ujjmuO7GYLiFqK8betq6RMOksYd9sq5FZj
	 CTcZRlOIajRC93JeBg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2E1M-1wrXWw10Oc-011Rza; Sat, 05
 Sep 2026 15:01:44 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] platform/x86: uniwill-laptop: Label multicolor LEDs correctly
Date: Sat,  5 Sep 2026 15:01:37 +0200
Message-Id: <20260905130138.6814-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260905130138.6814-1-W_Armin@gmx.de>
References: <20260905130138.6814-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:daw/24kcOlblx242LKi24J4xcmc+7h1gCP0ZkAXT2i3N0vl5+Hz
 TcO0HUKPdm0SkQpzfYoo+96b3os5TFX1Rw6MPNe1FNP0DQM0pbCgNwTRpGWWOw9QMROqC2T
 tC7CKQEzM7NB82Ut1T2ny6+1gfFIlVc21mRzpZ6DzV4SElUxD86hZnli5d9hB+CGJWyFd4f
 ardqjwR5MpnEQFE62sAsg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9UljdnIbBHc=;wqXcHyUoDnu0NpynZpOJ6yQ/uvt
 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
 xmTT7mOfVa9lF

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
index e527ed7461c3..27d5e54f0e1c 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1554,7 +1554,7 @@ static int uniwill_led_init(struct uniwill_data *dat=
a)
 {
 	struct led_init_data init_data =3D {
 		.devicename =3D DRIVER_NAME,
-		.default_label =3D "multicolor:" LED_FUNCTION_STATUS,
+		.default_label =3D "rgb:" LED_FUNCTION_STATUS,
 		.devname_mandatory =3D true,
 	};
 	unsigned int color_indices[3] =3D {
@@ -1600,7 +1600,7 @@ static int uniwill_led_init(struct uniwill_data *dat=
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
@@ -1782,7 +1782,7 @@ static int uniwill_rgb_kbd_led_init(struct uniwill_d=
ata *data)
 		LED_COLOR_ID_BLUE,
 	};
 	struct led_init_data init_data =3D {
-		.default_label =3D "multicolor:" LED_FUNCTION_KBD_BACKLIGHT,
+		.default_label =3D "rgb:" LED_FUNCTION_KBD_BACKLIGHT,
 		.devicename =3D DRIVER_NAME,
 		.devname_mandatory =3D true,
 	};
@@ -1843,7 +1843,7 @@ static int uniwill_rgb_kbd_led_init(struct uniwill_d=
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
2.39.5

