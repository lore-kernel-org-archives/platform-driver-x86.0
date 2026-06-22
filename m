Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DCF34B1B4;
	Mon, 22 Jun 2026 19:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782157194; cv=none; b=UI9ZOLaEFyffVxhNKNt/MQ3ZTNTcq5NkDQs0tb9/G3wZnXs45hyNgSK2zOI73SbxXZQUCWkMnbw3D3yjeKbe1BEgv+S/JnpFk/tgtxjnsHL4zXROe28GvvK+SkXxFMrbb80V3prY6+k15PFuES6lJsTkICa8azG2GflboVaeBfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782157194; c=relaxed/simple;
	bh=vIUHm60dXfvKrnu5kViKiCv1IF+D+3e84S5MvoznQhY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dG3DIeiTaa4ytfk0MtC9Ev6WauX0ASngCtFs59YOmlUa+4EWzxfWia56uAKKJIIW0lVHnBWpZgsOsgmN0v/Va9rQelSZdvmKEwE9NBu/FzG7awzsRYS8QzVO34dSRuCBvRioeQd++luDz4pb3tJdjVM3zhXxrK3nNmUcNa75ovw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=G4taLDWL; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="G4taLDWL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1782157170; x=1782761970; i=w_armin@gmx.de;
	bh=NJkyE8+ATCjNuSVud/ZC0nbe+VBhxkz0YglLbmu4bjk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=G4taLDWLPnFtW0Y3dCJzcGy2W4EBKTTXSdwVDrOSFzPx7aSPNry6yBqAOScKfzIZ
	 nPaGe8wEMN/PyOg+sGgRc7nlXGeJ/yAjGa+nAluRF1izcFLdWqkr1pp8pPy4vCJV+
	 FAcsQPVVNfwFO5v1hjGBmxXDvUqtgu0QsLVDtskygOp/3XAkHRwdz5Vb2VXXGgsN0
	 hlJCwb78HZbb+cOhSNppC/DxjqtX6UsACqYg4v7SSuYA80zskCbkbX2/CVm0SAxhn
	 NGEnrkRFnFnT2aMitF5ffnnDRFkPK4xvayxfJjYevadnnSBumaQFwRj4PeEyJLgjj
	 Gxysya/+b6FOOGFxfg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MeCtZ-1xCB2U2qz1-00cHkZ; Mon, 22
 Jun 2026 21:39:29 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: matan@svgalib.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] platform/x86: lg-laptop: Fix LED resource handling
Date: Mon, 22 Jun 2026 21:39:10 +0200
Message-Id: <20260622193914.116999-2-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:PymKuDNr3m2Ur0bnFXABshw4IHcJTAoM3+MTrDUs0XKWG2IIFqV
 8U5UDiSRcVQAkWs5ozU3Uus73WxsfB50i7vKfixP0J7zkxWWe1fg+Mgxd/7fBoAHD3b/UDs
 j1LIvus2Jqm3b0mkMSksY07ZT6YFqkgSXzG1RkBhuFqCwfEg7LngYmom+fG36AZGLRqBT2k
 DlrPfgVUZxOiEvJ3W1PkA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3oCGJ4Plmw4=;ksc3QNHgSxOuHrAIUvbcQOn2UmM
 +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
 pwJpOv0lUNIrpxhEoE=

The event notification callback might access kbd_backlight even
when it was not successfully registered with the LED subsystem.
The same happens inside acpi_remove(), where the LED devices are
unregistered unconditionally.

Fix this by tracking the availability of the kbd_backlight LED
device and use devm_led_classdev_register() to let devres take
care of unregistering the LED devices during removal. For this
the parent device of the LED devices is changed to the native
platform device.

Fixes: ae26278829a8 ("platform/x86: lg-laptop: Use correct event for keybo=
ard backlight FN-key")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/lg-laptop.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-la=
ptop.c
index a8f2f465ef3f..a2db9657027e 100644
=2D-- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -100,6 +100,7 @@ static u32 inited;
 #define INIT_SPARSE_KEYMAP      0x80
=20
 static int battery_limit_use_wmbb;
+static bool kbd_backlight_available;
 static struct led_classdev kbd_backlight;
 static enum led_brightness get_kbd_backlight_level(struct device *dev);
=20
@@ -214,6 +215,7 @@ static union acpi_object *lg_wmbb(struct device *dev, =
u32 method_id, u32 arg1, u
 static void wmi_notify(union acpi_object *obj, void *context)
 {
 	long data =3D (long)context;
+	unsigned int brightness;
=20
 	pr_debug("event guid %li\n", data);
 	if (!obj)
@@ -224,8 +226,11 @@ static void wmi_notify(union acpi_object *obj, void *=
context)
 		struct key_entry *key;
=20
 		if (eventcode =3D=3D 0x10000000) {
-			led_classdev_notify_brightness_hw_changed(
-				&kbd_backlight, get_kbd_backlight_level(kbd_backlight.dev->parent));
+			if (kbd_backlight_available) {
+				brightness =3D get_kbd_backlight_level(kbd_backlight.dev->parent);
+				led_classdev_notify_brightness_hw_changed(&kbd_backlight,
+									  brightness);
+			}
 		} else {
 			key =3D sparse_keymap_entry_from_scancode(
 				wmi_input_dev, eventcode);
@@ -865,8 +870,13 @@ static int acpi_probe(struct platform_device *pdev)
 		goto out_platform_device;
=20
 	/* LEDs are optional */
-	led_classdev_register(&pf_device->dev, &kbd_backlight);
-	led_classdev_register(&pf_device->dev, &tpad_led);
+	ret =3D devm_led_classdev_register(&pdev->dev, &kbd_backlight);
+	if (ret < 0)
+		kbd_backlight_available =3D false;
+	else
+		kbd_backlight_available =3D true;
+
+	devm_led_classdev_register(&pdev->dev, &tpad_led);
=20
 	wmi_input_setup();
 	battery_hook_register(&battery_hook);
@@ -884,9 +894,6 @@ static void acpi_remove(struct platform_device *pdev)
 {
 	sysfs_remove_group(&pf_device->dev.kobj, &dev_attribute_group);
=20
-	led_classdev_unregister(&tpad_led);
-	led_classdev_unregister(&kbd_backlight);
-
 	battery_hook_unregister(&battery_hook);
 	wmi_input_destroy();
 	platform_device_unregister(pf_device);
=2D-=20
2.39.5

