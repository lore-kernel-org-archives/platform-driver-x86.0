Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706279;
	b=fvMT0lVmDuddz2A2IROPmzQGPpstxkmtxIv62LesSiAOt8WKEa6dVgX6CSjetBzPPSUl
	 uLCvHg1ycG19W/FkGuRtTn9A3wOOnv2VTFcTn9Z46ubWv6aGpPttc/iGpcDdGRsG3ruH7
	 U9352ALMq/sLO6tUFD1eWAKfOHqr4teqWmVPhA7igur0x5z3CQ9CbyW4a06tgZvYogazE
	 fAEf+QY4X4KOC7u20k86LVClB1X+elUqnx7Qy2SWF/a6yWgtz15XkPDwnallaTtlZzhgY
	 4ASvvQse7OZcNNKeC/cmW6ySrmfistkWPZpvadDNLP2eewC62XmPVrP2I3xpFdBKdcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706279;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=cnypbvYZqrUfwSlWJO6RhHOOr07vvi7VQJvQzGakdOs=;
	b=qfAbgRZm2BKEp7XZ28BTb7BF950d1i1voQAzgSyQsbejmDYPqZ1fusRa66Mf6RgZUdHC
	 O5nst/Zij+RWRiOfaQwOJzP/fvcMagtE0Oi0VQltDNwfpQnsh1IWQaEYxKyXJRLgsT45e
	 IDQGnfH/SPV8ocuYUSbAHoYnlEJ8GuOVu8LlK8Iw7bSk1Cb4HlWxCDInvFoSaHOpvALi5
	 LWVsulJP/LQjHzB4GeWwx7Ldm3AGNw/TE7O45Hu2KJnULEOJfEyMO/edcRLS9liXaDjdi
	 MgGKbTVqOf6XpMDG5rEuykULzQafn5HfEWQskUwSAzI45Bmnga3tU+iz9ggKMlsRU1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=A9x5IkkQ;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445E0606A339
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 15:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 445E0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=A9x5IkkQ
DKIM2-Signature:  i=1; m=1; t=1795706276;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:li6BMLQ7xGRxPkhc90XYLlwDOquU
   I3JfYYCHRpgDWP7VvYpFyKHxsRQNKd/+t0J7zI0Hqce34nMPBAn6WTcRVCEioGM4TJS84TbyFM8
   NDKTsfZnyZs0vQ5PS57lUITJAG2xrBUHsn2lM6+YPECITooNWYU/6J71Tt+d7c309y7SmfY5wtw
   EFyxJ3zq+ID9tVq/nTvqNiDksT5s6XIxNmZSupSU6AI/W/7/7Wa7thxCvxNeiNFqCG5HUyBseff
   3SX3GfI20ZLqARuZpB2B4uQThcrNWheHbG5wIETGEzUUvWA/UAz3swCnPwz6YpHxGrRN/Y0P31G
   aP/XqfCV/5vWpA==;
Message-Instance:  m=1;
 h=sha256:
   OLKtv41Ej46KW6dxFvBLGtsKRj+pvE8NhCDdHOGgT90=:
   ngXNcFUAYpm0a7XCKxhwnXY5cjfbrrc0irydlXicMHw=,
  sha512:
   MPpsQf6rV2VsxqdFgrVE+8SAEXnk+V3dv57562jxXx2ig3i0FiVLk+0Sd3DhrGYKCXW5L8/vLSaHD6FzOpQZzQ==:
   08Ri058x879XzVGBXlXkBTfa5aeMLQvzykX1efvM8lZ+N3VqMUEHyQ1WQVp+5EoOMy0RCwYkh3DiDRlp700cyw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795706263; x=1796311063; i=w_armin@gmx.de;
	bh=cnypbvYZqrUfwSlWJO6RhHOOr07vvi7VQJvQzGakdOs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=A9x5IkkQDj8wtBQ+HfKZpBBlQz8OXeVVQZChhsMJV00inc29BhSUDG6jU5wNH41p
	 lRIho0v7sLaSODPPWyf4csjd49s/idyFmwAtVp29ppUlM0pdUM7Zjnu9IZeZMnxad
	 JGZuKI1+Car+5Zr4Z/AsCNEO+cOHuUe2YB2PxbxOGTNbcVWyfTqWMQtMNN/SInviU
	 kyz9k6aZJkyvEnlGdHmSOu24e7UZzNo98o4OgUxNLtjBwCJMjzUtY3RhziXuvaqp8
	 jvR2xGGySRmjAWCEDBlO5yiacllgiAAsz8lPZLabE0Dijb9HQx5Gq7X6FUuDkmNq1
	 QltZg2lsYBAeEcVH4A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4zAs-1yXOUt0ABI-00yW1J; Thu, 26
 Nov 2026 16:17:43 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: matan@svgalib.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daxter1992@gmail.com
Subject: [PATCH v3 2/2] platform/x86: lg-laptop: Improve keyboard backlight detection
Date: Thu, 26 Nov 2026 16:15:57 +0100
Message-ID: <20261126151735.442375-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126151735.442375-1-W_Armin@gmx.de>
References: <20261126151735.442375-1-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:gJjsbEoqL9D2MjcEBSQ8sgwA3a7C0ePgQfXzSbuXHDXE6gWrRZb
 FgTwdjrR2OnQEI3Xeewja2AYiqG/MmKVKxMiziZht66YVTIPmoumFExRizVXjAcTxZz9LJd
 Q46Fzmb59SJfXvG3wBCTCk29aPUX76B87ux6BMsy6Gn6lUbtntpf9ntkuFRkQZskGUPd01m
 AqMR+Psb1MZCJMNRFxixg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RlMdF/uieQM=;ZaK/5iRIPweg+RFDYKVaVA634nH
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
Changes since v2:
- make kbd_brightness signed

Changes since v1:
- fix error handling in lg_laptop_handle_input_event()
=2D--
 drivers/platform/x86/lg-laptop.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-la=
ptop.c
index a784071de8b3..d6d452a1dbe5 100644
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
@@ -703,7 +703,7 @@ static int lg_laptop_get_event_data(acpi_handle handle=
, u32 value, u32 *data)
=20
 static void lg_laptop_handle_input_event(struct input_dev *input_dev, u32=
 value, u32 data)
 {
-	unsigned int kbd_brightness;
+	int kbd_brightness;
=20
 	switch (value) {
 	case LG_NOTIFY_HOTKEY:
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

