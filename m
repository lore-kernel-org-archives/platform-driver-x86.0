Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792952994;
	b=SZza/u2BZbYQpe5oZdu474lraHojQ3Nxb2KT67oi6bpKVQiPmBv/qnzqVOLGr75nzGGB
	 kuAU8ZxBh04uttyHv+igdDgdeB0GZ9NKEMoRJtIr5ehAwrblw8suS0gRJfOAscrSZTTxj
	 lQQCWsxl2Ou0iYkalm6+1zDwRzIU9XuJBIFCubQFOtycekkgeEoUkq5WikINadoOPIehR
	 johJUht4j9rwIFNJcbySotd42XsmvHlTZ98RMh0MVo6iFxfugCKIEex6YuOL26ueifTjB
	 wl/qFfyfxGQVPf5Rmv2fkwxKOJZ3iEAlDf/3T390p4nLG1ftHFpHGQfD9d0UFR7iCfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792952994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=y6FshiR99RFnuWN54Tkkwtj2Axc2lsc5KYS1qB/8moY=;
	b=0patOjXNVWKwa1+9tNp+6TzYnDVovoBBx0FSFq5wzSQJ49OOcHyEA1xFg6suaGnleL89
	 C3ogezEmb1Nlh4fJWKy3EnawGF33uDNtXJFvY7mXNnE/GfCFk5w1me04peJgKFIlJtw8B
	 GW01OQHa/RkbNIXszLXBqOvoWI/WJ3uaGZ598h69cQ2H1fAU9YGAlXpm68Lc93wItJsfL
	 is8AwTSgu2NqdPGzMjse7AtJjufjp3KlQk+cUsfNIwB3EFPvmwD16plTdGDwl7supIWY4
	 wLowzZms/rwBfnGNGxwpPq3iP8BrOduC0cx8qnKYabbw9gwc2oHtUSPhLD45++i1ZmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=phSLBhUU;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1AE606A31F
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 18:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC1AE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=phSLBhUU
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso18611855e9.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 11:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792952992; x=1793557792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6FshiR99RFnuWN54Tkkwtj2Axc2lsc5KYS1qB/8moY=;
        b=phSLBhUUP32B+FeF3l7cQFgwAFjxm5Z0IdxHhnEYceesOsrtlblC2GDX9JWWNO+MuJ
         Rscg+lV6RjIwFJIOVmJD1GJkEUBmhLTozub0+v5+HkvFyANlUYrDxjQ0nZVoQvStK2jk
         JFcqGyD0jXWQHbrH2x/2LS9QmjBFqVrOhgWwek7SaDKIbzMSptvC+atN4Z/XyYODgxDC
         sdFfCPJoZ9hwLjOxzlxxRwE4oQT4FatxP1/iyCoFgMaCUCYENI0r31M3afw1bagU4ca6
         fKuZOZbLMLiR4L0Nf56NtHY0NqO/I+ehPIoApatQrD1hOA6AoaqmVuZGLI5o2IBXarEl
         CJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792952992; x=1793557792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6FshiR99RFnuWN54Tkkwtj2Axc2lsc5KYS1qB/8moY=;
        b=GbS3IAyFgMxANMy0C4VKaGImh8wzNCIc/WI0+nerpnPSoXgSRuvBL2dY5qb+myIAhW
         RulSXtwY1hYeJVkJNu6nCPVPPH2OpXHPcwGm2uEK1axLXxsJM/6oyTN2P92kCr0CZnxe
         z4YBLS9osp24Qf73BpN/h31U+yCBS58am83KitPTkr+fIqUAComnv0TRxtTyD8c3vP4n
         bdbUHb0IzYIq4P1SlnKS09IA8WJQe8k5rRt5I1Jv0ZVztkc64BOLQ8rYf+iLA68SnGFJ
         yfjzRklQ3R2rDEKZRfvFVagxp2Ook9MYqLQ6xnO8B/4hI8LQC71SPok5NvQGybWkvkhw
         PIRw==
X-Forwarded-Encrypted: i=1; AKwUvByjxex+q21U+Hgdedtcb+dMjvj0ezxu3g0YvtgzbvzOjR4LOJ1V1cqMPfNth/rYPWINsE3Hjo7iOtMNH/bLiLCxGq3X@vger.kernel.org
X-Gm-Message-State: AFq9FYK2FP94Ke5+vIgTReBFdjT39qrBDL1ZeH30Yf5H/db0O8D3xvV6
	ReL9yx4TW1bT4YvkSJnWjHbuk3FM7ycvEWZiHpJOY7v1pWTTZcHJmPYR
X-Gm-Gg: AYBFou0M7hMSdQbIUvxv3y5cSP0K6KdY0hdWnsz2ndmYVUjXulSVKixfUJhxWujpB0y
	TlADvqoB9sqFZPS0MmGm9K9RSprpYTUekjp1VLpCXxOvYAmb6+CoDXdqqM776AEGY1f/IBm0ZaU
	IEa9z6I9fZE3grPSslyIlD0zkoHrbP7cIg2fKM9pN5XbtiKVMC5IVeU0MKlDm/snZsnVc8AulFP
	FL/b555/gTM1dwtnZVXv0C5yQkaGf9bN64rkD7RMF7aTIDzNoaINQI77X7FpJoaeq1DIZkAXrY9
	V+dSfY8bgWltQ7bek9fNnKA4pdKV2R8vJ63hJj6mNXF4Tyuvt2NQpBUbSevOsy/p2achThMKIpR
	2EoKPsOfIiT7yMCxXarRbRq2kEjotQJUNVaO54bXs27G5GUnmnVrtBAUWZ14aBr/zZgqGrlr7gu
	cyeAWb5EZ278npvfEnh8QRRx6ZuwWYWHDTan6H15ccto79sTuzUfpxd0UYAtf/2zzAv2kPV78lY
	5H7fEMbsy4RbGaLomyJsjdv/pFrSXM699BlNZKkRfYahJ3IuM2DBA==
X-Received: by 2002:a05:600c:34c9:b0:4a2:994:575c with SMTP id 5b1f17b1804b1-4a35acb994bmr84167185e9.34.1792952992058;
        Sun, 25 Oct 2026 11:29:52 -0700 (PDT)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2e8f25sm138255175e9.14.2026.10.25.11.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:29:51 -0700 (PDT)
From: Bartu Alev <bartualev@gmail.com>
Date: Sun, 25 Oct 2026 21:29:37 +0300
Subject: [PATCH 2/2] platform/x86: asus-wmi: unify WMI and HID keyboard
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
Message-Id: <20261025-b4-asus-kbd-fixes-v1-2-fa4dcf7d2a69@gmail.com>
References: <20261025-b4-asus-kbd-fixes-v1-0-fa4dcf7d2a69@gmail.com>
In-Reply-To: <20261025-b4-asus-kbd-fixes-v1-0-fa4dcf7d2a69@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Antheas Kapenekakis <lkml@antheas.dev>, 
 Benjamin Tissoires <bentiss@kernel.org>
Cc: Denis Benato <benato.denis96@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartu Alev <bartualev@gmail.com>
X-Mailer: b4 0.15.2

WMI notifications and USB HID event passes calculate brightness steps in
two separate functions: asus_wmi_handle_event_code() and asus_hid_event().
The WMI path reads asus->kbd_led_wk under asus_ref.lock in
asus_wmi_handle_event_code(), drops the lock, and then calls
kbd_led_set_by_kbd(), which re-acquires asus_ref.lock. A concurrent event
arriving between the two critical sections can overwrite the newer state.

Consolidate the step arithmetic into a helper, asus_kbd_led_calc_next(),
and add asus_kbd_led_step() to calculate and store the new brightness
level in a single asus_ref.lock critical section. Route the WMI notify
handlers through this helper and remove kbd_led_set_by_kbd(). In
asus_hid_event(), reuse asus_kbd_led_calc_next() under the existing
critical section to keep stepping logic identical across endpoints.

The step logic remains unchanged; locking is consolidated into a single
critical section.

Cc: Antheas Kapenekakis <lkml@antheas.dev>
Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 75 ++++++++++++++++++++---------------------
 1 file changed, 37 insertions(+), 38 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 2478361b9b531..533c50c1dba6e 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1815,6 +1815,39 @@ static void kbd_led_update_all(struct work_struct *work)
 	}
 }
 
+static inline int asus_kbd_led_calc_next(int cur, enum asus_hid_event event)
+{
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
+	default:
+		return cur;
+	}
+
+	return clamp_val(cur, 0, ASUS_EV_MAX_BRIGHTNESS);
+}
+
+static int asus_kbd_led_step(struct asus_wmi *asus, enum asus_hid_event event)
+{
+	if (!asus)
+		return -ENODEV;
+
+	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
+		asus->kbd_led_wk = asus_kbd_led_calc_next(asus->kbd_led_wk, event);
+		asus->kbd_led_notify = true;
+	}
+
+	queue_work(asus->led_workqueue, &asus->kbd_led_work);
+	return 0;
+}
+
 /*
  * This function is called from hid-asus to inform asus-wmi of brightness
  * changes initiated by the keyboard backlight keys.
@@ -1822,31 +1855,13 @@ static void kbd_led_update_all(struct work_struct *work)
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
@@ -1960,15 +1975,6 @@ static int kbd_led_set(struct led_classdev *led_cdev, enum led_brightness value)
 	return 0;
 }
 
-static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
-{
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
@@ -4679,7 +4685,6 @@ static int asus_wmi_get_event_code(union acpi_object *obj)
 
 static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 {
-	enum led_brightness led_value;
 	unsigned int key_value = 1;
 	bool autorelease = 1;
 
@@ -4696,22 +4701,16 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
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
2.56.0

