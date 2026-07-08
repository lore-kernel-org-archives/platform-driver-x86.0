Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9818E3E172F;
	Wed,  8 Jul 2026 19:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783540570; cv=none; b=nAs/vFTT81mQVaYaxji8xg8B6FEFOamVTJsSm32H9yf+HJCkWvaNt903at0uGWdTNcBy9XAOje3NQDY3Lsp0Wo7uo1YI0RtnBZ77almN0TrLDIUqKMq3sPGpJrjaIh0by6WpXFw7psOIjrg8ijvjIcgDmF6dx+epH/qjAN5L6oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783540570; c=relaxed/simple;
	bh=vIUHm60dXfvKrnu5kViKiCv1IF+D+3e84S5MvoznQhY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=no3EuuTChNmtXJV60PFQy+fIXubgXn2fnZqynXDzj8Gjo7WMTPptss6olR4/EqthumcefyhVzUfBzLL0ya0Foli6NAOxXny6NIVck1iz6DyAHI8/0z3Fb9NzjeQSVlUe3ISeBD8YXwwiZOWeOUIAWKIxw0sxo0h4XfRC7Erfynk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=GNouLi2d; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="GNouLi2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783540562; x=1784145362; i=w_armin@gmx.de;
	bh=NJkyE8+ATCjNuSVud/ZC0nbe+VBhxkz0YglLbmu4bjk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GNouLi2dySln9JoaTrBvudgNdqA4DzNCxjRpPCw6CE3U/bwHWCSJsgotLUphaUlD
	 wN97LXtFRtomIN3UiezySS53I6GKf5Z9ruKdU/tgDC/0af9n7WPba1iRJLq06l1Rg
	 Nd5YBiL8DvwsXOy5xhTIVpEKAJEDkgVYM50kdfnQdDyklaQuqTPeI39QGowJdFn9E
	 2+updXy8SqwzHThR0GWvqmgEXyQXtvH4WWm7l6eoXduE/tDtPqhHd6upJtBftDMoz
	 3NmVGcqzR5O8Apa3FUziFeTD9fFUetmvWhWe/V1HKNjS1IlAnIqTZMxmLp2gcu+6S
	 9BC5IxGfB01ifPkAcQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mi2Jt-1xLIyB31m5-00d26j; Wed, 08
 Jul 2026 21:56:02 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: matan@svgalib.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] platform/x86: lg-laptop: Fix LED resource handling
Date: Wed,  8 Jul 2026 21:55:49 +0200
Message-Id: <20260708195553.7762-2-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:CsevqOnNMzcEkGk6Ahkg1jN3LWGx0go3sNWm5d/MooAZLQrEMpA
 x7YLKhnSFtZPguvGfd7As+CXfg6MFjMTTWsvT+fw9izNz4p2f+51YV8bJKTtz8k2TPwPoYY
 KtXwAPxelZf4JqzJFEm9Nx4nscIjjMxV289+Xsvnjx9tjgo5nLzXH5iWGrbtsklG6Jc1MFh
 hyeqkbAJJj2q0RRBFeYmg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YndjSvnI6b0=;nSgoMBr7HGUvNFzoFdZ4+zNozzg
 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

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

