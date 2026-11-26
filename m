Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706268;
	b=uMpq0wHU0TTEWCU4rPgWezgC5bh1vtqSF2bofaKfSBQlyXUnF0U+6AX71TmA5r9+1mmI
	 3QQ80ZC/UPD9KBlRmlOyc/B6/FFejQF4HUJbj0RkF1fyViQlvnSQ5Ijv4qVbn3/87359i
	 8kMW86oVVNdmV9Sc1lg1Fbf2nOnMF0nLl3sjZBrnZIZiBVQgfcOhxUY9mfiXPvRVOWb0D
	 EFGKVCnsOAP5FoRB5KVPQ5eb9ZRVtOdyKecVN/CIIV0I0p0h0QcEzYSXTNCvZLIXa6jxu
	 OSX89CLKe1x/rr/nX+p8zS3OILHX3QtoL2pQqlmIeQ/oI9QZTz8lKlmj+5gGKa3Z/jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706268;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport;
	bh=2I++9dVYUQ9bi4XmmTeSrWLcwZpCnHfoDkUWRXe4cjA=;
	b=xFvZuwPZQqRs/YMjPW+uo7X5AA+8YH6Ngt0k4wob1+EeVzgRDZt7a//QDr0P3hk4rWMd
	 cd+o2/GFE3MECaIKmj4nj9kVdVKfH7Xqgtj6M0HtarEsk72vt3Jm42PqIKab3N/0BNXf8
	 qRXTt+I7zAGDTMdA7wsZHnJn9mhM3AvnpO2YryzqwifbE3CO+nQIbWz4ThAVZSU/oNQ+g
	 1GEwtWBYPfwryq10IJZX98sMdEcECOIM036n0CiecCQk7uWmxe0Aa7R9up7sG6rPV5tME
	 nsS62l8EKGkoytQg2Y96z2GBXjlS17SSLv+g2noT4nUzYpG81jhERmv7yi53yE3sdPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=mNuletI8;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C126606A333
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 15:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C126606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=mNuletI8
DKIM2-Signature:  i=1; m=1; t=1795706265;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:tBfXkhhLFGON+5Z5u9sl11JfvgO2
   gS/dmpLXPQF1zLLtyozoYxeTN8iKXrBGx809T0TXAWfs+zOx5UchWuwdQ7jUIFnGDc1HYh55Iwx
   JDtH1nak6KBGLUuY187of6TAbArxZiovAvGNMw2tfjEq7H4ZyDxyuuqKgdgbeYBy2XOBwDg9ysK
   QJVUsoMA2xSIgSWsh2v2nkaKgehg8gaMmKMkst54rOxKZnKwbj28Ml9K1QfFQl82fwcC0gWFlmn
   1kUcpvz2yPfV+wy4KHGmOrgaoxos8MEJWg4Gf3kAbzbkC3BqQPMFVgBxNkVVmawjKwS0MSwBF7Q
   9EdUGnEVHk2voQ==;
Message-Instance:  m=1;
 h=sha256:
   1Si852voLgRfzypR9j0gI03ZGwjX/Xd1ELa09aZbTTw=:
   oG0TaPlwwzRC19LE+UpyDtLP4kRqQ7RVKRWaUjnvUvw=,
  sha512:
   rrMtgV/IIYeB49e0MFM5Ye1IPqutXnfHSljGVjdUIDai0zEK9Nhtq/oPDhtygCVof33zlQmZDm5MJHB+PXhPJw==:
   3E1un9K/FYvHv0eAfUzl7ACwMmmPumWI7z3PiVPyFXFrM4MZyCuDP3WtwVqrpV2tFn3US21aH7tXQu6BHaOF9w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795706262; x=1796311062; i=w_armin@gmx.de;
	bh=2I++9dVYUQ9bi4XmmTeSrWLcwZpCnHfoDkUWRXe4cjA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mNuletI81dKSIrGGE3oe6jN9S1ulFUp6g//L2mWfGvj7jyYEFYDDg+bwhz6h0zLS
	 DrVAhpv81xUD7UB5JngtMPTSuDK2VWppDpI2xImAxNS7Niwen6Hx0nJcs4X8Hc76/
	 M8Td33hJ/vsBekwjFw9Wb+pj26p02oE2cQngIPnkL+SwDEhrg2k0WOx0rAiXBo9FC
	 QSxii/vOT8s3JrAthb5zDJ3aAOuZSnzHvAP7iY3ahYCAvRlxE9TGv9H87iIZI5R8T
	 XMuASMf9uejwMWorqKbdaFNjkeoxZYvORa/o/Z2BhMO8Hs3ORQSw9HfzKOkxc2aSF
	 v0pYA6l3varRfmt2MA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCKFk-1xfzAC0ISI-007NOU; Thu, 26
 Nov 2026 16:17:42 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: matan@svgalib.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daxter1992@gmail.com
Subject: [PATCH v3 1/2] platform/x86: lg-laptop: Fix possible LED deadlock
Date: Thu, 26 Nov 2026 16:15:56 +0100
Message-ID: <20261126151735.442375-1-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:qFo7qISLnnT4WFcEcEWTERvRizk+rpurODfFpruydqzPZOcFk2L
 IfPC/cWJmWXanqJm8lpbepT0v2cNVTK4GXdcYEVsdAkVurIz6j4h6Uy+0PfGv+kYwFi3h4K
 ede/RlHIEH6T8JXqyp6DDiUQ7qSITaXG54L/pZnVPP77hvwFtdhqIiIolmjNN48SlYnxgmh
 bosRLoEnArUy82lqB+A5Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uXNcnQnHAE0=;sXkyCb/c4jvCgFxyS8dSf8SFhGf
 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

Calling ACPI control methods inside the .brightness_set callback
of a LED class device can cause deadlocks because this callback
must not sleep. Use .brightness_set_blocking instead.

Fixes: dbf0c5a6b1f8 ("platform/x86: Add LG Gram laptop special features dr=
iver")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
Change since v2:
- none

Changes since v1:
- none
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

