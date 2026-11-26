Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703626;
	b=zpKssmOz8uy4OB/dSk1CIsxijJBI78IVCreGYMVlyS5PQFXrJweFdZHUSisExRAtMmb9
	 QRQoh0XNjtQBiJVZHkDlnAR9K/G7CPlND2dlddyx+hKWCPx91+C+tzKQNlzkmIaBDpBw6
	 YRYPNELBiFToVw6zMdfO4X7fyeKMqtBOouoff/KTrZetycoclFPk2qQqZFOQTWeT5cg6o
	 ZGHhGQ5LaTmA3ZtFf2I8774GPkTLQ21Uwd7HW7a2CQ0PEWblVzcZeqByTN3Cf1G4IXXIj
	 1Tl2p/+J7J7nMb8IWBNlAOngBcezB0EMeJbZHn+k+wNiXAPh1NRuhAzEXFYD6HSe4Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703626;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=OdZbwpP/zDQdp9WYnj9Y3rkO79PVsL1DSsAoVUblECU=;
	b=rDL/UwFa95OB5Q7w9gqwLxn+6FIIyv0TsndDYhQaawgJTxndqjpEZTlGHkPpRAycWBDZ
	 RKaaaR0Ew04YGrBZlnBe9rrINUF+DuXKCJUCsZuFmrEEYaSpspFjT77P4E2wNvtQla/dh
	 RiyD4Gfk60y7zuMWf+8gspEjIxgIvYNPDSC53MLmAsokB3vV3YpeNUe6NSItQzH4HQk2L
	 ByIGf/oxxA/7JdWF0uFu4TDawCGc+LnITEBNA5x9mJtN8X7bOP5cnkdfc/PiQpjKyKbKK
	 Dlp9kV41TEMFA+wc+6SFG0uZMn4QYFIXuNJ73WrbJ3gKvmYuwlv5OO7m8yZauZvd3Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=hfhtWQhh;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD5F606A32A
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 14:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD5F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=hfhtWQhh
DKIM2-Signature:  i=1; m=1; t=1795703623;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:Y1UVag2ZF7aIKqybmhK9z8N477cP
   +ai9CL84akrzE6DGIU8mcP9PxfWGUjAx891+KyUvxdkUfb1CSGT++cSM3/Z9gmW1g5ZyXZ1oVPN
   iuXQ4Sa1OO7HvqRCvCycBtMkXzCmHyHxfrhRfHusZwoepwn8X1zgKQhbG0Qz/K9OOnMDpRnBd9v
   JaBNKEaSvwzR0WHIRHKQ9eDo1U8HI8iDfhJ+To5ixJC5UVurSLsPtKESnxrzKP2+4X73RI32wfd
   uD6vU0sPKeqNR+nid5BaKCkiaxKNUyt8cHA/GaVEmdzui+jwzHGOr2Yg0ho5xh1gJRgjWx6eSE9
   2/+hNNITJteT6g==;
Message-Instance:  m=1;
 h=sha256:
   DoPzZyvmG2JKlDuQpj4z52DDd7SX7xtS869YTZjr1BU=:
   QSB85PwWkGl3gs95ElQHB9OHXGf8tCPoISgJWKKJxwU=,
  sha512:
   1bDddrAGFxSihIG0lNOg4TigDAiz5TQHO+WMt+ZaZxlZWIE/JZ8m8dKmfRnT/O/CVTrQ1BYs0xoy7bFTR2mahA==:
   KK9yOUy8fYrHdPCrOxnlnIhrJmb5/TZ4QRJkuAIcNg6yv5LkQyB1MZ8hov+9kG6ZXZtFQSWWoNyVJjnfR7hgpQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795703619; x=1796308419; i=w_armin@gmx.de;
	bh=OdZbwpP/zDQdp9WYnj9Y3rkO79PVsL1DSsAoVUblECU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hfhtWQhh6eiYHCtz17XURouvFh9g8QAyKVv8t4XHthHJqiVueXRY2DOoqS0j0TZj
	 SPPNOFUQ0ywIF7g01Te0/Yx8U5oUXisfRfswAGFvUParGC7Y/qDd9R6QRjYJGtjuM
	 nErjLJWBRY92gIalYLbTyYSe+EVMxxBNecdHMo/+GblihT4I9GJ0ulqaIn2vZ2rY/
	 /NdFJJD6QECA+KHuW+mCiiPVfa0JNz/hLtpxnw8CwGHeZBLJsd60kcNrj1aPS5rKW
	 //fxJV98er1hMK+jAGbWHdJj2zSQ/cjkxcUASz/40TKBtbS7RybOIYTaopdWO68OO
	 E3Gslnw539iOzPjGlQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOiHl-1xsGnV3DTz-00SojK; Thu, 26
 Nov 2026 15:33:38 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: matan@svgalib.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daxter1992@gmail.com
Subject: [PATCH v2 2/2] platform/x86: lg-laptop: Improve keyboard backlight detection
Date: Thu, 26 Nov 2026 15:32:32 +0100
Message-ID: <20261126143327.419702-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126143327.419702-1-W_Armin@gmx.de>
References: <20261126143327.419702-1-W_Armin@gmx.de>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gZUB4u8LnFLMQ5NKFz7FORaQ6MaFnzS4y38MMYLJKCx9qIUfgZj
 AmltfQ9X9i4yjH7Kj+kyxbEVnRiousW+CHYoXQP3lu/Ods+slBAtteNKpMuTMdfTae3mjOO
 B8hhvnanS+0l9LPzhcBm94lJSbE5y42ak2N/zdFFd3TJBsC59m4WHHdKMevJM++DRbjKR7A
 hJUwdD9kFqOCQalqiG5XQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PHg+GZNcYJE=;P+djx9AkDvt9HwX+EZLkuhLFs1s
 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

Not all devices support the keyboard backlight feature, instead they
will return an error when trying to read/write the backlight level.

Avoid registering the associated LED class device on such devices
by first verifying that reading of the backlight level works. For
this the get_kbd_backlight_level() function has to be modified to
stop hiding any errors coming from the WMAB call.

Reported-by: Carlos Javier Alvarez <daxter1992@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D222275
Tested-by: Carlos Javier Alvarez <daxter1992@gmail.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
Changes since v1:
- fix error handling in lg_laptop_handle_input_event()
=2D--
 drivers/platform/x86/lg-laptop.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-la=
ptop.c
index a784071de8b3..43c4985da810 100644
=2D-- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -641,10 +641,10 @@ static enum led_brightness get_kbd_backlight_level(s=
truct device *dev)
=20
 	ret =3D lg_wmab_get(dev, WM_KEY_LIGHT, &value);
 	if (ret < 0)
-		return LED_OFF;
+		return ret;
=20
 	if (FIELD_GET(KBD_LED_MAGIC_MASK, value) !=3D KBD_LED_MAGIC)
-		return LED_OFF;
+		return -EIO;
=20
 	if (FIELD_GET(KBD_LED_MODE_MASK, value) =3D=3D KBD_LED_MODE_OFF)
 		return LED_OFF;
@@ -719,6 +719,9 @@ static void lg_laptop_handle_input_event(struct input_=
dev *input_dev, u32 value,
 				break;
=20
 			kbd_brightness =3D get_kbd_backlight_level(kbd_backlight.dev->parent);
+			if (kbd_brightness < 0)
+				kbd_brightness =3D LED_OFF;
+
 			led_classdev_notify_brightness_hw_changed(&kbd_backlight, kbd_brightne=
ss);
 			break;
 		default:
@@ -823,6 +826,21 @@ static int lg_laptop_input_init(struct device *dev, a=
cpi_handle handle)
 	return 0;
 }
=20
+static int lg_laptop_kbd_backlight_init(struct device *dev)
+{
+	int ret;
+
+	/*
+	 * Devices that do not support the keyboard backlight feature
+	 * usually return a error when trying to read the backlight level.
+	 */
+	ret =3D get_kbd_backlight_level(dev);
+	if (ret < 0)
+		return ret;
+
+	return devm_led_classdev_register(dev, &kbd_backlight);
+}
+
 static acpi_status lg_laptop_address_space_write(struct device *dev, acpi=
_physical_address address,
 						 size_t size, u64 value)
 {
@@ -1035,7 +1053,7 @@ static int acpi_probe(struct platform_device *pdev)
 		battery_limit_use_wmbb =3D 1;
=20
 	/* LEDs are optional */
-	ret =3D devm_led_classdev_register(&pdev->dev, &kbd_backlight);
+	ret =3D lg_laptop_kbd_backlight_init(&pdev->dev);
 	if (ret < 0)
 		kbd_backlight_available =3D false;
 	else
=2D-=20
2.56.1

