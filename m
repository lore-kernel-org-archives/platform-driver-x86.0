Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218165;
	b=Bdky+avRf/vlry0V04+wfYCURPapBgkS5avLwYibchQXQGE9ZGOVOhgBxJZVERUsHN+V
	 9oKSv0pZyVD6q/aearwVFGLw2hSLnp+1Twm+PBq67vGSPRy7/116eHWXzSvhETZVIxciK
	 SWoFFhCx7spTitgBLh0q/OiCyw7R/SYPZ6GVjOcbxzXWvhyoUTuF2iwvc1EmU+LnV4oRd
	 /xBWF4rB9BmUgTL5m0RQR76p8c4TJhat5KatKd6vNH97S77DH9tCGqIc0HpEkz3xEKCZj
	 zAk3Yfjf/K6V6i8sDgbZbLc4c8gSl+Q2aOGcJfNO0Dbs4UssWTrSKrtDUhVz6WybbXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wwBraWobBItGeKC6KHMZfI8h4IHsYw6kjmjUtwXO9Sg=;
	b=IJTofH745OxkWszetEXXnJA2nXyMCsyP4WqTSEzsdNhRk6qLSKoucxQF3z3pUkCENCus
	 BxErpD6dwbK9qz+uxmUcS21ZmnT9HxjOj4NbdOYBoaRvukx4qLX+IvDtdAzdX4hB3BMXf
	 BG7FQWLynE85ijolHiAdQChZWWUOSwgrkuaYvv5G9gBgnLis2RLVPOz8wG1dwi2wv48H2
	 PABeG+GBsGpB28INxvnap8ERqoc3EB9k+mKD72UB5+xiQteVQH5H4CR7a2gC8i1rZBZfU
	 Xwu4xHOc/eSLBAy5goDOfHe/GnUHbYxLC5JXzeQl7yJTWXWG1on5/g0LFKnoRjI3EDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4GqLAnE;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E314606A6AB
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 23:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E314606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4GqLAnE
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso14043075e9.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 15:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218164; x=1795822964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwBraWobBItGeKC6KHMZfI8h4IHsYw6kjmjUtwXO9Sg=;
        b=I4GqLAnE/M95ySZsHhBdHSnjPCrJF4TlOlEqpQ0TQinAFRF9Y1SbCwa2D4Z8GyCNZW
         pNe626d8v1MaMNRcOP4M0OvVD2BTHhy8o0BAbYEgZ8z+WXzyI3+oXkILxJOLKWBqxjtN
         jdvksX7U/0Kup/J8qEwNz38vHpP+lDwKfmGZbr3x8wlEyC3qYzqGcebLrNxhRglc19cm
         Rb8ZIj2xvEdsgVlar0pkwDRSbCkJD4EGQA2167qzKCOh3FLgT8CotM0xW5GkD0fAwmnd
         LagK07e4d0RGmjnMEjTLTuN/R6AJIgQSdUMN/Gi6UJ7Y1rdZasFSazfdnk7Vv04kMIiw
         3D2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218164; x=1795822964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wwBraWobBItGeKC6KHMZfI8h4IHsYw6kjmjUtwXO9Sg=;
        b=NxmvSzuV2xF0R03C0qoTvYHCw54kx8KNQCshkUD8BA4JQFreyyr2sR/aw2wspZ8foF
         lYGrSkwlo33H86FbvO5/oK7FrtT2Lzxhny+zB0qQv3k4yqsCYRcm5oxqgw40w+10p+da
         8unxHi3wA2lFsfRLnDvrxkQy2PEF04ObFj9ExF4vNP/L+057pLy+FydjiUCsSDhVJvrR
         yWT/f8e6B2KnXMHHWXgGd4ArIkXW0gnJfNkJRtXTjAISh3c36wL6s2/jB5stnOvtOQsp
         LOziijJZMCGbG1vAip12tKywTvOdOIgX6nanaRJwjnffkIfSYLM6fxJxERfHIU0IkNOC
         ncxQ==
X-Forwarded-Encrypted: i=1; AL+hErHBnJK59GG5Dk3U7PpG7ZqyuakIEYDfF/zresVYsFAD9nrgH77LfnSiKf5ruh/zbdV1+U55PZAgY1vNk+irYO9V5Oip@vger.kernel.org
X-Gm-Message-State: APuU4Z+yKLePEDeZqr91A2wSk4jg5PsDpMcTutxW6yvawDWlW29Udm2Z
	qIYowQ6ZmO8cLVjL9IeQjneslXg1NDuLwHAIjWLM2+u9Y5bGIv2MDqAX
X-Gm-Gg: AYBFou1u4Ug4VpmoKiElPh83ZgqyYdh17u7PcsGEhX6GprnDuQJp+imc57cAk4zGWMN
	IxF6m3+UVJ3y80zLIxyeQ3dsEiqxFSZqsrISu1ZkbnHd93/lCLsDvK30npF02sRZ9Z6Qb8A198b
	uRb3MtAKBDNIbJeGcjdDXUDhz1egTt21QPAbCrLlaLGYtuKVnMCCsx19Eg4/jt5vnEUQNhwTC+p
	O6z99ckzsPSBz7OBiRr/ekSg20MPaBRJw2Rqkm6h5DDwEwAAICaFNYLeZ++IneZD2c6iiZ1OwB3
	HFSR1QJIhP3jw+lMfsDD7+/Ah1oC4oIxCEBLPd5jxLzRbFGuVEoblQPwgRoNtXBOoc85dNyXEdo
	E7FGZrXHxo2eSCUDUdctiu+D5UmZ4V7YSEolZak9ZBP2v7IAVCtTW9oX1CG81YUwFKH7C3993RQ
	m/CQJ3Pkq0FTZ2J09ZAYsAw2VWr6Yur6GvVe7ceyw3++SU7cXuX6rEwpL7S960LzOqL+uCujs23
	A6lTPN9aezjqNPHT3DzD7I+D6jE3fpebJSg0H/1XPSW30oGVZtJNmq4gXPT7y1YaI1UC/4QIGck
	b+h4gXtCcD7cyEJN5C9bKEguLoZW+JfLjpL8xlimK00iDXct
X-Received: by 2002:a05:600c:4e16:b0:4bb:6f77:1e35 with SMTP id 5b1f17b1804b1-4bb88810991mr114710275e9.21.1795218163665;
        Fri, 20 Nov 2026 15:42:43 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm8085462f8f.7.2026.11.20.15.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:42:42 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Date: Sat, 21 Nov 2026 02:42:27 +0300
Subject: [PATCH v2 1/2] platform/asus: asus-wmi: clamp keyboard brightness
 hotkey updates
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261121-b4-asus-kbd-fixes-v2-1-52cda07d233f@gmail.com>
References: <20261121-b4-asus-kbd-fixes-v2-0-52cda07d233f@gmail.com>
In-Reply-To: <20261121-b4-asus-kbd-fixes-v2-0-52cda07d233f@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Antheas Kapenekakis <lkml@antheas.dev>, 
 Benjamin Tissoires <bentiss@kernel.org>
Cc: Alex Bogusta <alex@bogusta.com>, 
 Denis Benato <benato.denis96@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartu Alev <bartualev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

The NOTIFY_KBD_BRTUP/DWN/TOGGLE handlers pass led_value ± 1 into
kbd_led_set_by_kbd(), which stores the value into asus->kbd_led_wk
without clamping it. Pressing brightness-down at level 0 drives the
cached level negative (-1, -2, ...); kbd_led_update_all() then drops
every hardware update on its "value >= 0" check while
led_classdev_notify_brightness_hw_changed() hands the wrapped negative
to userspace, so brightness_hw_changed reports 4294967294+ or ENODATA
and the brightness-up key appears dead until the counter climbs back
to 0. Pressing brightness-up at maximum reports 4, above
max_brightness.

Compute the level as int and clamp it in kbd_led_set_by_kbd(): the
stepping must happen in a signed type, because enum led_brightness is
an unsigned type in practice and 0 - 1 passed through it wraps to a
value that clamps to full brightness instead of staying off.

Also clear kbd_led_notify when snapshotting it in
kbd_led_update_all() instead of after updating the hardware, so a
keypress queued while the worker runs is not swallowed by the late
clear.

This addresses the same bug as Alex Bogusta's earlier patch
(reviewed by Denis Benato) [1], while also closing the kbd_led_notify
race in kbd_led_update_all()."

[1] https://lore.kernel.org/r/20261016015117.32174-1-alex@bogusta.com/

Fixes: fac55d29581f ("platform/x86: asus-wmi: Add support for multiple kbd led handlers")
Cc: stable@vger.kernel.org
Cc: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Alex Bogusta <alex@bogusta.com>
Cc: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/asus/asus-wmi.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/asus/asus-wmi.c b/drivers/platform/asus/asus-wmi.c
index b33ebdb21aa2..f1a94bcdb0c0 100644
--- a/drivers/platform/asus/asus-wmi.c
+++ b/drivers/platform/asus/asus-wmi.c
@@ -1784,6 +1784,7 @@ static void kbd_led_update_all(struct work_struct *work)
 		registered = asus->kbd_led_registered;
 		value = asus->kbd_led_wk;
 		notify = asus->kbd_led_notify;
+		asus->kbd_led_notify = false;
 	}
 
 	if (!registered) {
@@ -1806,11 +1807,8 @@ static void kbd_led_update_all(struct work_struct *work)
 
 	if (value >= 0)
 		do_kbd_led_set(&asus->kbd_led, value);
-	if (notify) {
-		scoped_guard(spinlock_irqsave, &asus_ref.lock)
-			asus->kbd_led_notify = false;
+	if (notify)
 		led_classdev_notify_brightness_hw_changed(&asus->kbd_led, value);
-	}
 }
 
 /*
@@ -1958,10 +1956,16 @@ static int kbd_led_set(struct led_classdev *led_cdev, enum led_brightness value)
 	return 0;
 }
 
-static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
+static void kbd_led_set_by_kbd(struct asus_wmi *asus, int value)
 {
+	/*
+	 * The hotkey callers step the level by one, which must happen in
+	 * a signed type: enum led_brightness is an unsigned type in
+	 * practice, so -1 passed through it wraps to a value that clamps
+	 * to ASUS_EV_MAX_BRIGHTNESS instead of staying off.
+	 */
 	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
-		asus->kbd_led_wk = value;
+		asus->kbd_led_wk = clamp_val(value, 0, ASUS_EV_MAX_BRIGHTNESS);
 		asus->kbd_led_notify = true;
 	}
 	queue_work(asus->led_workqueue, &asus->kbd_led_work);
@@ -4677,7 +4681,7 @@ static int asus_wmi_get_event_code(union acpi_object *obj)
 
 static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 {
-	enum led_brightness led_value;
+	int led_value;
 	unsigned int key_value = 1;
 	bool autorelease = 1;
 

-- 
2.56.1

