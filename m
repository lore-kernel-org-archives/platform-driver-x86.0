Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703638;
	b=VvyAX0eBgAbWObZhIFP8/F3jKZW4Eq8/OEgLBqJWw3wHJ//HMoxZbDTjgM5kc5DpRN/i
	 vVt1lUgCGjmPmK+qwAnizuAMFFWSHSvVlI1xIb99H9scGds0TvI85zVnr73F6/C6MKsh0
	 TeJslnWdhcNqclFj349Zh9cDjLApEownPP9mZybykKLDFxzE7B/5RTEz4jGueiQDyxKc/
	 aD9C7TIy/3zw1V9RpUSqaK8HveJ4FdQQEaXA56DQRl8MVYy8pJXpuYOKzB8bVdv9pV1w4
	 WgVgypuzHrce3qVO0LTqX7If+R2SsWqX+3heHZ3zJ4QOb4vkQcEoBiMzjAFv+DtGU6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703638;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport;
	bh=9YFMrjnUqgYZqRWB2nK5+HevVsC0bgkQ99o/FEc8sNU=;
	b=m9tQSNYB9Su8LTAZCSBTXVFWbg0od4jmmBPw+1Iwb9GpOgf9jjHV/Nj2LwDyrfDurM4m
	 xwQRK6f21n5NNTKMkXTnNsSTE/VYX0ZTky1fkzNdDjPCa68B9jMkcs6bTH8j/yQ/lzh7p
	 1LXDBmGKhbfXIf7F8C7BwmqbjftuPVsE6LOB3FbbV8AMl8RjF78cDKn1K70TGcfiSK9Ab
	 WPR9fu/SBmwn6CIrxH3M7993i6Yf0rF/SVQi1V2MVZ0M/F/5lrl6RvKErTnSWEa7DKTVW
	 iea5yG+fzxSPay2lFaKWFhSlr/wT7bVR1Q5Lppo8fLmPG0b/FJxyeNHfeliNIKIqx0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=rBN6Bt7d;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6249606A683
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 14:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6249606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=rBN6Bt7d
DKIM2-Signature:  i=1; m=1; t=1795703633;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:Z16boM48aoP3BUCsetLTnhhTsY5X
   +FZ1omF+P0i5JsRLQLsiikDdNnwPqDXxZ3RzS9oBTFcHedbTI0n/0kh71GJXRBOuaCgAixhOOVl
   uUfIvShjPxGxxT72pylES4kFws6bVt/Wm70IB6VfiRUwfHrj1zOgpuZXGciz9MLMlXfNv/IHZ8F
   hT5mHQRFarYuUPF1Yotog/y3QuMxTjCdo1swxtpAEFZCZPP9Jyy2KppzmXbpWJKgQckcKfkqVNc
   ifP4iU6bJAhshNPb4g34AwLVjPH/w1VSl4dD3K/32hpMOoAYTwhv9ZlI7I0C8zLeuG4A/cgfcbg
   vNVN4lV2M0xG/g==;
Message-Instance:  m=1;
 h=sha256:
   BICidAY5kLRvHYHPxOweXPQziNcOJeHMRGXWyCkX7Y0=:
   gMj/oyvT61rOJgNAQQTjvRVGQwmmC3QJS3PqoI/I26Q=,
  sha512:
   Es7U7HJd/fkMkR7OQbigJ4jj/ETJgNuPjJq+ZUsoYJHuZfEcQWtmYcQ9qY5mjAarSsU/3xuJzch5h4YRsohcpg==:
   ad8XjCJNYYEUVGYSVkZOmVyxf8P8rhAyMKuwew6GIypWgpNRRTQrOzNoDVGs6IaW/1MQ++MuKWW5kY6MyQZTvQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795703617; x=1796308417; i=w_armin@gmx.de;
	bh=9YFMrjnUqgYZqRWB2nK5+HevVsC0bgkQ99o/FEc8sNU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rBN6Bt7dSgAbw5vW+y0YiNEz0vRM7l7PA8vE20ilub7DMqNwUAziQWMU7DSY8VQ3
	 IQiF8noNHMI3WWB2PZRD2bhREd8e9UuX4CDcDIGTU9/pwlxpH6M0+PZTRsMvs5ZQn
	 2lHt8Xwkg67X0GFWj2P/TJdZsIZMVvj0oEu9baZ902FI3l6y3tiaXe8CPNsmSeapE
	 YeVcwt27mAmpWVlEoVFXx7V8LXEDyiHGrGZHm3k/hUHho0oG7VsyaB09RbC1oYVCM
	 7gwcMSbRC8d5mLpJh3eiydHaaFo+rnteDJqDuXwfiR1HADuu0oaUhdFEHKYN0CCvK
	 iwBvxO7sTvZKNrI0Ag==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MyKHm-1yQmfV0BFE-010kYc; Thu, 26
 Nov 2026 15:33:37 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: matan@svgalib.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daxter1992@gmail.com
Subject: [PATCH v2 1/2] platform/x86: lg-laptop: Fix possible LED deadlock
Date: Thu, 26 Nov 2026 15:32:31 +0100
Message-ID: <20261126143327.419702-1-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:I6PYZczqu36c1y5OCq6zyP19f9MJHBDxMQ+wBrc/WQlCTEE3eZB
 /V9enZDxFz/Sg+gN9cV+G0wNhXegjJpti598YS93XPToT4hU3AkrnpqJPOTByPOCQZ9NQ6W
 JbD5tKl3fuAUMW1LUdWcsaWreN86W2n4X2pdO/Eoy8yu8xnhABs9Q7ZJACqO4AzFmeBtnf1
 sZWGTaERXOwf+nWR2B+0g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:X1597kfqqRQ=;D6q0OEVJoIfevjG9D9fFg8bY7ML
 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

Calling ACPI control methods inside the .brightness_set callback
of a LED class device can cause deadlocks because this callback
must not sleep. Use .brightness_set_blocking instead.

Fixes: dbf0c5a6b1f8 ("platform/x86: Add LG Gram laptop special features dr=
iver")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
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

