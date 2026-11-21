Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795270364;
	b=gveCUkKvVfIY0SG9NfgHoiR6ciUskh5UfP4EOa9RwWezUyJwO9Oh+ZSx6w7vrS4B5XGB
	 W6xT/5AdNe/AEz3vfx2GZ75pB4m81xJYr7MGvH3s7IIJCYW1UJb/JpgcQZ0QFgh9lFW9H
	 /wbBnRzCrcohtDjp+6nLrTi/GzGoJFPq7TO9VcG/yYXeF7zaZ4NpcZtDXytvsajgzM7Xm
	 IGMJ+CjShrmp3lfIc8+5azuIWbgcX66X6hRI+14P2lM5bHJ2G90hmtCXgNROkeXr1JJZf
	 JOrRce2wRvhdVt8E52/rjuzGYs3XToz4vOrgjipgCuJduW+6r+ZoKi+ItJUDl12naYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795270364;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=06WqgNS+KrbXyzc0HgSh3HZqbfSkImpBpD7Jn3ha2lM=;
	b=oeS1sRSoYTsSKSsXGS/ehIn1CY/K2SX+3svk0TqK4Z9oBLytzEITjrjpxzR8gKmY6zRR
	 fU1PJ/Hl1gRRuSREc6Os/wWOUc2vAv3+OFUQuny+NsAVWzesIpIba+UGU+8bEyu2p3qur
	 /I78mm7An546awLArivMgY/1fLxdB/9D9Rkq77MpVMtMIqSAO12MRT5kmfYyz0SnfTJGC
	 r+9Evcs/wNV3pUkKQoNw3ZxDwxaz0YF4QgIc+P7dBQtSyS4M8QNr8g82ndUETyHO92u1F
	 ljrgaSGUtLuEe3bbJT77oLrrNCeHhBg8Ruen4duoBQGtjdHtgV9oZEAi2/gbeLsoRhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b="GVvfY/HU";
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22740606A32A
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Nov 2026 14:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22740606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=GVvfY/HU
DKIM2-Signature:  i=1; m=1; t=1795270361;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:ZNRmIiBUr6R/yHuqoO3MFmM4esFx
   CRGU+NYiM7nesnKqJli+ui9CfLNZvEEaNzLA7ttZIp0YL1Unti2jC225qoS/+5vYjdV/3L7F+Ck
   CGLA6HYlmsF34CHTx6SqaS2JCMbqp2JEpLi9yFcPPF1lNm7NwLWsrRfk2xjkiY/QIkirstRio01
   RUAdcXycCD6n8ILU0JV3uWZpdhkcvNM5aCs9KCV5vFuViglxywxtWbzjxcEX87k/BC9Vn2qhFNQ
   T3hn2rbi94F+0vuHSdmsNS5pqcLBr+JjGRtc8mNG9KJmZo7dQQUVsIr5YX2+JxsXv0r/qXUORU9
   Tm45CTNMmFg/hQ==;
Message-Instance:  m=1;
 h=sha256:
   1PLhS0NLP3Z8+dP5s5fIHOt/Ate1Y3fNTvZrTUsnAO0=:
   Co+DFF3ICq8s5B6HmP59vaSCMTsh36Z7b1ojzyWpvbc=,
  sha512:
   rv0D2DoRDloxEFTZHx/9VKklF6zTFVR/7IaWKvxhACtup5stGfYNAlSdNzXhynfn8/KMjZutJieQq5H/aYmNVQ==:
   7BpYX5fXq+TIUXONbYThFfhY/c87+e2BEzO5lmWN/bvBNo1qdtimaeXgKQszRc6dgT3VWv7euxfXjZoszGDW6w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795270348; x=1795875148; i=w_armin@gmx.de;
	bh=06WqgNS+KrbXyzc0HgSh3HZqbfSkImpBpD7Jn3ha2lM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GVvfY/HUncuJ9KTQRxo/4gRzkrcgDOlIeapjigmCNItuNwd0MQZHoAvLC6fbefSy
	 kuKrt/2DkAqm1q+EQXUp6TdM2KwmoCv7fT0GudPbklfepHMWHJx6M01EunRP3uCsP
	 gzkdjvTn/mGN3NhpvMvnMSoWsM4a6hzaZ5+NMKsqGwAVt1tf55vcZa5hMfX1P7csN
	 hRcwdOj7CjWCuU7zhxE6V7eNg1xQRy+KcjmRQIt6qg4aOwtRI4H+A/gZ+eQipe1ED
	 4IcQavVbUqj72eaOhJ0tk5dHJ5Mucl1jD2GTB9f5HKA9Wovf79YGj8oGw+LnbcDxh
	 ljywKDvtkqseY8f3Ew==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRmfi-1xxxX408U6-00NyAg; Sat, 21
 Nov 2026 15:12:28 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: matan@svgalib.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daxter1992@gmail.com
Subject: [PATCH 2/2] platform/x86: lg-laptop: Improve keyboard backlight detection
Date: Sat, 21 Nov 2026 15:12:02 +0100
Message-ID: <20261121141221.19245-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121141221.19245-1-W_Armin@gmx.de>
References: <20261121141221.19245-1-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:WvLjPCcm99dyHF43KQdpDOBlmoHtqISidjfOI/JEGbGRZVQ+qVj
 c0aLA+Mvi0+WaZJqqDEsFo/zNGhr1PQsEF1QgXjKoPx4Viviu7s4xC0IS0JnAiWLQZcS/k5
 w/cD+7Zonr8SiI9AXpfiMOk8gJ1Me4YG7WvPwfh21fh91fZOYN1ycblBPgEJNxAKZ4SKSiz
 grkPj+2bfEzh9HQ6auZZg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Vte+nfIdam4=;xWBPaGuLBKgLMJ+QJWzkuTJYHDx
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
 drivers/platform/x86/lg-laptop.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-la=
ptop.c
index a784071de8b3..72955fc868af 100644
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
@@ -823,6 +823,21 @@ static int lg_laptop_input_init(struct device *dev, a=
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
@@ -1035,7 +1050,7 @@ static int acpi_probe(struct platform_device *pdev)
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

