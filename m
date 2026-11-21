Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795270356;
	b=S3xtk+d4jRJmCbGEPTApZyFHKMJQiXQlWd7CVFGNC7ZpIDTzqbYOw3ZPCBf4uYyxufOL
	 ty6smQg2yNLh2W5+6sDaG7N8UsTvPpSTTX9qpyDPKr2PfpHXJn1XhhFbIqEKs06bLQ6Lv
	 CroLfIVe7q5YkFm77hA684OaZmjhijBMN569h1FclMtZKobiZHZT6L2Ke0X+ZI0N/jcGH
	 P/2RF+0qUlLYgeCUndG8ESpmmRl04xIBcf7pru8YumtnmskjOLb/JeZ49Od26Ib1jEVwM
	 yMSBpSi+nyLQp+z+4rAIHR7eO2/E+zY47Mm8kp7z4envUJtiwr0+PN/kalJS/F3Otxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795270356;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport;
	bh=VMDD5Uj//XuZBFgSklFPmHgSlGNcSfD/z37eCFmfXmw=;
	b=UQsn2e3+SL1ZCPYotd8JuYgVzYHHR/STAiApP1BzBNPl+bEB2T31/gSdOGRa4aEeAnFg
	 gyDqZHpgVwztGaQonLVwqB/xUAIGUBWYJdPVJUC8yOQ5koqr1YDX0xSo7nFpjBurCNDaF
	 RGP3FU2/+Kx5EWGSjO3hFLqi2t4kmu/gJ+57MQG29WpiIP6NndQnlw5B61BnmVw16XkBk
	 Ny3ODdmYkSoOijF+b90pnPpG+sDvMNBX6Cpy7EW8hmfWC9Hmfbr9eDG035rK+paRuTRZH
	 qndU1KKlLjcbTt1pOyMvUvFF6W2gDIY2whSwPuCwCQyWYSn0jq+1luuc2GTsZI0c++Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=KbBlY+pC;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44721606A33A
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Nov 2026 14:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44721606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=KbBlY+pC
DKIM2-Signature:  i=1; m=1; t=1795270353;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:Xxy1RvMQxsdLN31JKPdf4DKscL5l
   c69z5hOyeIKP7l5wW+5ATRCUo35oQkapo9JLxD5+/qjLrjcr548hKt7g4grFARJd4jU0KlHDOxf
   fOGzPv9L6Y5TZtBPLMEScMngaAxiNdk0VgveWosHLEuE2Rsm5d0+xrNW4FGAC5PNyvRkD9gPMRV
   x2ekuf4+O+g8c5c3MPMXvAPBG+rRJ7jS+UIMkYODKdBQi7vWMxZAEc4IadeN/sZuUYMtbpdy8GE
   VQKD6JsiRBs492ZDIT2aOGmy53tHVpbqxP3V2O7rApWhWwt4RaAXu8YjnkTBaSEa+sFwA2BgtJz
   XHKQHiXKDCfQXw==;
Message-Instance:  m=1;
 h=sha256:
   OzK4eqdUTaKZKlV/vwHr6Bfdv2oSlzRW7N/3A6klCiE=:
   bvqc2TYWmE5gOB0YvQjIQY32MjKAB/+wP2Om2qAJb1k=,
  sha512:
   9+KGKYW354c9xU2f2K2CPHwuj9E4CQboJ5cxyflEL5P/c/vfyz/SgfXRWSDwtUt9ikMpimDhKd7vxIE7pM2Piw==:
   fdRhHgMPFv1DznycDlNJvzEiFBN3G4sGBaNl0CWN4b8boWsLJobENCmLVCwFd9eyVtwrn5gcI9DOo3kHTfoOGA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795270345; x=1795875145; i=w_armin@gmx.de;
	bh=VMDD5Uj//XuZBFgSklFPmHgSlGNcSfD/z37eCFmfXmw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KbBlY+pCDY71UuoFX0ILUTCPcA0EVNlEtsBR254jwcuZDH9lTcMvjTJ64VncWeNy
	 3GKBNbK3upa971n9pur0dUFl6pJVdRCADX90ozHg4k8U5EG6IMaj/jgNgvQcoLVw3
	 GSea/aUURaVs5kfqcCOKmt03+8pZVJC3pkElhma94F7UFxJaDjH2kCC7pbeuZ9YBr
	 Seid9uuBIKevIJW3FCu99rTgwQ/ukgFKwRqqUM+aMxAvXhLFAI+RKX6KgzauKCXAG
	 NefhL6U1lvRkaMD80lDIGjBtFo/+9ZFBfyfTShCkuFFkk109ntwaNx1mHwajZOD7h
	 4CB3xEnBxQ0mMggh+w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ma24s-1y0iQX1XGO-00SgyD; Sat, 21
 Nov 2026 15:12:25 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: matan@svgalib.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daxter1992@gmail.com
Subject: [PATCH 1/2] platform/x86: lg-laptop: Fix possible LED deadlock
Date: Sat, 21 Nov 2026 15:12:01 +0100
Message-ID: <20261121141221.19245-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.1
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
X-Provags-ID: V03:K1:9Saw5plgCtYZbY49i7pIAfPA0SSvn35uDGN5UlnGpzB9MmzDIwZ
 +13ZzfC351bDUz/PSbCSWThmGZWDYBq5WBE0IlC40/L8N9uhm85b/EiBLCoL9vZkvN+rJkE
 v1F12MnPbRV8k/Q1urHVBQznYwm+D2CBN9czdSWC+EPCNHVVN/HFW4Yoqe74DC4brym3ebV
 6jyVXehveh7VOF3R9Et/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:g5Dp6acgp9w=;G4L/3WvN/QjSzcP06nXSPCw3Vxp
 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
 haISrKFUyRCb1b68Pw==

Calling ACPI control methods inside the .brightness_set callback
of a LED class device can cause deadlocks because this callback
must not sleep. Use .brightness_set_blocking instead.

Fixes: dbf0c5a6b1f8 ("platform/x86: Add LG Gram laptop special features dr=
iver")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/lg-laptop.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-la=
ptop.c
index 36ad1e269443..a784071de8b3 100644
=2D-- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -32,7 +32,7 @@
 #define LED_DEVICE(_name, max, flag) struct led_classdev _name =3D { \
 	.name           =3D __stringify(_name),   \
 	.max_brightness =3D max,                  \
-	.brightness_set =3D _name##_set,          \
+	.brightness_set_blocking =3D _name##_set, \
 	.brightness_get =3D _name##_get,          \
 	.flags =3D flag,                          \
 }
@@ -599,10 +599,9 @@ static const struct attribute_group dev_attribute_gro=
up =3D {
 	.attrs =3D dev_attributes,
 };
=20
-static void tpad_led_set(struct led_classdev *cdev,
-			 enum led_brightness brightness)
+static int tpad_led_set(struct led_classdev *cdev, enum led_brightness br=
ightness)
 {
-	lg_wmab_set(cdev->dev->parent, WM_TLED, brightness > LED_OFF);
+	return lg_wmab_set(cdev->dev->parent, WM_TLED, brightness > LED_OFF);
 }
=20
 static enum led_brightness tpad_led_get(struct led_classdev *cdev)
@@ -612,8 +611,7 @@ static enum led_brightness tpad_led_get(struct led_cla=
ssdev *cdev)
=20
 static LED_DEVICE(tpad_led, 1, 0);
=20
-static void kbd_backlight_set(struct led_classdev *cdev,
-			      enum led_brightness brightness)
+static int kbd_backlight_set(struct led_classdev *cdev, enum led_brightne=
ss brightness)
 {
 	/* Must always be written */
 	u32 value =3D KBD_LED_STATUS;
@@ -633,7 +631,7 @@ static void kbd_backlight_set(struct led_classdev *cde=
v,
 	value |=3D FIELD_PREP(KBD_LED_BRIGHTNESS_MASK, bright);
 	value |=3D FIELD_PREP(KBD_LED_MODE_MASK, mode);
=20
-	lg_wmab_set(cdev->dev->parent, WM_KEY_LIGHT, value);
+	return lg_wmab_set(cdev->dev->parent, WM_KEY_LIGHT, value);
 }
=20
 static enum led_brightness get_kbd_backlight_level(struct device *dev)
=2D-=20
2.56.1

