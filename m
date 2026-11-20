Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218181;
	b=S7DhtxgROkfl11YexZ0FXmCSjI/NgQyZqFzldcuw8We4qdQefk617vPsKIXY9buTjkbz
	 4hN9arIZBya/W/tZYEZNyWzoV20UClxIhxR/oWHtoAYj9e7tOFLo82OIKpvhSFgCtPxIT
	 dD81f2tKkPiArLaqjQSqEmtLcK7YfspR1oosZ/oMXuzx7hN2kRhQPDI522dZlp3W+jCL6
	 vVRAYQv4JId/9F4XXz7UhWwsM36Xj7kTPYLTXA0sNDjQ2trTk75641zIDC0zLdEVbcalT
	 JmTdL3gn7nCj/cH3jS62dphIYVMezhOPxfUkkdXvfIN96R87be2J6uq1ae3yMpaNnDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/mVPhUNXoCA56KaLtR5xbl5KLypVc48RMjcE+btZlGg=;
	b=BxoaNGSRb6Hx3+4HCMstXmqMVY9Dx1YcaHr7I9C4w8TSz97aFVfgaIxsjUPz9Oc+p657
	 CJxJls4/Ih3KgiduP/x372FSrvtnH6ZtPYAnI3oGrGDlfs9aJxISOcmRp5BEQYVtg8nhL
	 HwI/NAPVjfrbJvofMbZrgrRjj5uaen2I6c49XuaAWb2/whqQ+UzOah7NJXNNVcFujhmVc
	 q7hD8vL/y0WwPQFasiyu4kUnmbbfSPayxC9Fn7t0GMQJ6rbHF83VlEEka+UyGIFlFWerf
	 vr8FUAH58gCEG2rHYFyXL6tVz64TV/sVt1BBYDr68QJYEc4X4+nZvCcL3J3lTVkYndQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IHWj7hVn;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33369606A68C
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 23:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33369606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IHWj7hVn
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a9be758734so913640f8f.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 15:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218169; x=1795822969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/mVPhUNXoCA56KaLtR5xbl5KLypVc48RMjcE+btZlGg=;
        b=IHWj7hVn+zpELdemFCWFjAvbNu2zXFQDCfpwASr7BjCK7+NIXTG0DhpAr5Gq2meyda
         uJznKSCadWmyzIY1FB/IjTmPrzJpkv0oWmT1HhlmGUwpn0sq+jpG7AVBRV3u0CUUUu6c
         AYy2Xo242i1+cjM7qBgqCbHTXZfQ3gAAx1yOy2d4om4vXb1zayofUJwMlK47JzXQrvcD
         gcUNJJI+vPfYqj9pQy53KkEytCj5KxEtJetuhiEW21hPOKQpQFnt7qGNpwkFgzQagdGL
         DNvzZJgvWBlVfAvnfvNuEGf2OEFCwqVZjpA8M6LU4sntxFkAwzaozoKfh654ugXAno1g
         2ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218169; x=1795822969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/mVPhUNXoCA56KaLtR5xbl5KLypVc48RMjcE+btZlGg=;
        b=yWJBdXawpEHCwrJFAkTVNKSmsuV0ipte0aH9V+qXo/cU65a2Dmy1nEr73GULccZtjS
         GURg0yfx5tbNDVGwwyw4xoTzFfmWJMAqPWTylZ8Q6aeyBdCRIOFRSUHTLGg23lFlrpoR
         19S227tItpE5IX3SaAbaADIYx1cqp2PAhhsrFawLHR/oIjKQNrs2d1YezQrHjf9XkAwO
         Dqg3S3Tx/ByF90jg50DC1Du6GBFtjkaVa1H1YUlGWG2pjg1NMFsUPIW2LzgkW9fZadjk
         MEsrdkoUlbism8M6nwMO5IY1Tim8Cw2EX/4umhf1QUMq/bg5gJwm2jVeZ8l5xEmbKNFs
         KTdQ==
X-Forwarded-Encrypted: i=1; AL+hErHxIuekNL4qa6n0dPgOml29QHVnVcGDmhMbTmFfA06dipGB55e2ihtxshxxfTMSTk0M1KaRorHJ+i2ARGzhs7y6tjYy@vger.kernel.org
X-Gm-Message-State: APuU4Z8bJwMw3QUd58Ez3UyPGvdxLwYcrlviCiOHUOhtksQs6/GV5uge
	tlqEaJdZoxxQR7z30pU/YKn22RGjqaJxreN6Rg3slM+l+7+B+1T0Nlkw
X-Gm-Gg: AZFdTZdk7M/hpjnQ/a0S8gMcKQ8OhiGtDmwRsoxhKmRBoScFUdB0BI1Ug+wXLe6z7N0
	Ovbbkq4wgARCjyH6Na04H/Ca9TfJlydZEaf483ICnC0u+RqTL1AV+FhAxxfmK6A4siZGVgjzk93
	t8vPJC/mj8//U8o9ATA9P3n4iKxoplCxpdFAab65T0iCPU5wGrsmnM5y6rz4jDTzOB1k+WeLmoB
	i+nMnmvlCrld5ZgP0Nz9pMom9nmUYZVbIevTB9Ugx0iK2XX8jzaIikj381bf61W82+GGdHynRxX
	+4F0z+JilyL60cJAoJLRJ3TY3aDs3aMDtr4UDMJcHmehKMyRMDeFz0DFqomvz7qr2QTeenVxVGV
	8ngnV79GDSLFS67hC5FkighFw05D2OZPeopnUxJEmv8y6r/qt0P1o1sczRmsLpcQ8+71ZHQjXQg
	fCorBtRrg1mHT8OawmLoumwKhUN7fMVJ6BpkzBrLq8npT1UX5vX3CS8czF7wNEKP4Gok1u01gsx
	1DpaJLcG7S/Shw9QM37eLWaU4X7yeq+7Z5jPSDfihPSn7KOo3qXkIfWJWwg+6Sh7eYbeYTwbujT
	TUEMYe4qcWBJXbfPnvcVmKQDIqc=
X-Received: by 2002:a05:6000:2883:b0:4a4:39bb:970d with SMTP id ffacd0b85a97d-4abab02c469mr9410317f8f.2.1795218169588;
        Fri, 20 Nov 2026 15:42:49 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm8085462f8f.7.2026.11.20.15.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:42:48 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Date: Sat, 21 Nov 2026 02:42:28 +0300
Subject: [PATCH v2 2/2] platform/asus: asus-wmi: unify WMI and HID keyboard
 brightness stepping
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-b4-asus-kbd-fixes-v2-2-52cda07d233f@gmail.com>
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
 Bartu Alev <bartualev@gmail.com>
X-Mailer: b4 0.15.2

The WMI notify handlers and asus_hid_event() each carry their own copy
of the brightness stepping arithmetic. The WMI path also reads
kbd_led_wk under asus_ref.lock, drops the lock, and re-acquires it in
kbd_led_set_by_kbd(), so a concurrent event between the two critical
sections can overwrite the newer state, and every WMI event pays for a
lock hold it does not need.

Move the arithmetic into asus_kbd_led_calc_next() and add
asus_kbd_led_step() to compute and store the new level under a single
asus_ref.lock hold. Route the WMI hotkey handlers through it, drop
kbd_led_set_by_kbd(), and reuse the helper in asus_hid_event().

Normalizing an unknown (-1) starting level to 0 before stepping also
makes the first brightness-up or toggle press turn the backlight on at
level 1 on devices where the WMI readout is unavailable, instead of
leaving it off.

Cc: Antheas Kapenekakis <lkml@antheas.dev>
Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/asus/asus-wmi.c | 79 ++++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 44 deletions(-)

diff --git a/drivers/platform/asus/asus-wmi.c b/drivers/platform/asus/asus-wmi.c
index f1a94bcdb0c0..c216f7166c2f 100644
--- a/drivers/platform/asus/asus-wmi.c
+++ b/drivers/platform/asus/asus-wmi.c
@@ -1811,6 +1811,37 @@ static void kbd_led_update_all(struct work_struct *work)
 		led_classdev_notify_brightness_hw_changed(&asus->kbd_led, value);
 }
 
+static int asus_kbd_led_calc_next(int cur, enum asus_hid_event event)
+{
+	/* -1 means the level is unknown; start stepping from off. */
+	if (cur < 0)
+		cur = 0;
+
+	switch (event) {
+	case ASUS_EV_BRTUP:
+		cur += 1;
+		break;
+	case ASUS_EV_BRTDOWN:
+		cur -= 1;
+		break;
+	case ASUS_EV_BRTTOGGLE:
+		cur = (cur >= ASUS_EV_MAX_BRIGHTNESS) ? 0 : cur + 1;
+		break;
+	}
+
+	return clamp(cur, 0, ASUS_EV_MAX_BRIGHTNESS);
+}
+
+static void asus_kbd_led_step(struct asus_wmi *asus, enum asus_hid_event event)
+{
+	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
+		asus->kbd_led_wk = asus_kbd_led_calc_next(asus->kbd_led_wk, event);
+		asus->kbd_led_notify = true;
+	}
+
+	queue_work(asus->led_workqueue, &asus->kbd_led_work);
+}
+
 /*
  * This function is called from hid-asus to inform asus-wmi of brightness
  * changes initiated by the keyboard backlight keys.
@@ -1818,31 +1849,13 @@ static void kbd_led_update_all(struct work_struct *work)
 int asus_hid_event(enum asus_hid_event event)
 {
 	struct asus_wmi *asus;
-	int brightness;
 
 	guard(spinlock_irqsave)(&asus_ref.lock);
 	asus = asus_ref.asus;
 	if (!asus || !asus->kbd_led_registered)
 		return -EBUSY;
 
-	brightness = asus->kbd_led_wk;
-
-	switch (event) {
-	case ASUS_EV_BRTUP:
-		brightness += 1;
-		break;
-	case ASUS_EV_BRTDOWN:
-		brightness -= 1;
-		break;
-	case ASUS_EV_BRTTOGGLE:
-		if (brightness >= ASUS_EV_MAX_BRIGHTNESS)
-			brightness = 0;
-		else
-			brightness += 1;
-		break;
-	}
-
-	asus->kbd_led_wk = clamp_val(brightness, 0, ASUS_EV_MAX_BRIGHTNESS);
+	asus->kbd_led_wk = asus_kbd_led_calc_next(asus->kbd_led_wk, event);
 	asus->kbd_led_notify = true;
 	queue_work(asus->led_workqueue, &asus->kbd_led_work);
 	return 0;
@@ -1956,21 +1969,6 @@ static int kbd_led_set(struct led_classdev *led_cdev, enum led_brightness value)
 	return 0;
 }
 
-static void kbd_led_set_by_kbd(struct asus_wmi *asus, int value)
-{
-	/*
-	 * The hotkey callers step the level by one, which must happen in
-	 * a signed type: enum led_brightness is an unsigned type in
-	 * practice, so -1 passed through it wraps to a value that clamps
-	 * to ASUS_EV_MAX_BRIGHTNESS instead of staying off.
-	 */
-	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
-		asus->kbd_led_wk = clamp_val(value, 0, ASUS_EV_MAX_BRIGHTNESS);
-		asus->kbd_led_notify = true;
-	}
-	queue_work(asus->led_workqueue, &asus->kbd_led_work);
-}
-
 static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
 {
 	struct asus_wmi *asus;
@@ -4681,7 +4679,6 @@ static int asus_wmi_get_event_code(union acpi_object *obj)
 
 static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 {
-	int led_value;
 	unsigned int key_value = 1;
 	bool autorelease = 1;
 
@@ -4698,22 +4695,16 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 	}
 
-	scoped_guard(spinlock_irqsave, &asus_ref.lock)
-		led_value = asus->kbd_led_wk;
-
 	if (code == NOTIFY_KBD_BRTUP) {
-		kbd_led_set_by_kbd(asus, led_value + 1);
+		asus_kbd_led_step(asus, ASUS_EV_BRTUP);
 		return;
 	}
 	if (code == NOTIFY_KBD_BRTDWN) {
-		kbd_led_set_by_kbd(asus, led_value - 1);
+		asus_kbd_led_step(asus, ASUS_EV_BRTDOWN);
 		return;
 	}
 	if (code == NOTIFY_KBD_BRTTOGGLE) {
-		if (led_value >= ASUS_EV_MAX_BRIGHTNESS)
-			kbd_led_set_by_kbd(asus, 0);
-		else
-			kbd_led_set_by_kbd(asus, led_value + 1);
+		asus_kbd_led_step(asus, ASUS_EV_BRTTOGGLE);
 		return;
 	}
 

-- 
2.56.1

