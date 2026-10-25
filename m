Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792952990;
	b=pzcGGX+Ew7jB9uG7FgFVlp1LYmpMtU995DRg3czwjbdkv7RGcS4tVN9w8wncW93FuinZ
	 fQTB7n846qTIzHlZUX82XSE1TGbL2bNgUJ8tp4TjJa+eYIiPDGqIh97HH1oJfsuOm7dcv
	 0lEVoKv69uJtplqULH1gD4lcgsJuidVygxLDp8RGOvL9nM++xJpATKaNAtudz5E6zpbj7
	 JCVVkk6WB//VjQUMaKmiUY9/Y5TnGP39JiN1wK25y+4HXRf4F1X/SSJ2bCbe8AIMPO0IK
	 fsvV5WOtTGKgLzvld1xX885uD2/FJAIFvS3U9UK9oSilIugnaHRO0xpTwhl7uuirxOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792952990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=lVd5+YIpZRZ9srRM38HUZhphNHJ8MrugQ9WKD9A3pC0=;
	b=bDFQQd1s2yjim3iIgow4bnFHvxJ/gFbxfDvyqn4RB674M9SXWQZLmI1ogGvpxs+w5c7K
	 EouqB07POAJhC5vYGxEnwrOLLZqHDLJLU6RMEhAwDm1FQQ/O9gT8X48RU+qhjFRpaWxxS
	 DengBTrYzp1mjiVjTKHNyNYpwQMLi8A1yHR6f1D5EfY+f/EPYVEdEszZAwqgLw+rsM3jQ
	 AE6THZnKDhBYP2OE9Tq/ffjcGa+VXiURmIH1UGUykSoTKq9SSl7y15bd/k2UmXIgFli0i
	 dMQaCqTlFGeGSaoybcWrd2D9/q8+xAB13YVk8d8dP2RNFwsp6DBbLS752EiR86d7gJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oHxVPat5;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6BE606A321
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 18:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB6BE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oHxVPat5
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso23987625e9.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 11:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792952988; x=1793557788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lVd5+YIpZRZ9srRM38HUZhphNHJ8MrugQ9WKD9A3pC0=;
        b=oHxVPat5bjbLKGMUYB16oqlsUm26HDldeAfuK/vg1wzG7yu2moRUuj0VDuZ8y3d1/+
         pfCnRvPMWmBqaDT3rz+oJTDyUf8JexK+2d9tATmkw2TIF4IuQpFvkr8mL/t/ZntCG524
         WRISs0WslGmjSQxXU+jMXmxWWHAp7ZmI7y3yzloA15P791hbEShWUClIQcF3NKWVE6JS
         gpe7WC7IRpLEUKxvs0w6J36Bb0vnxH7mfpLu9pGtcanohpAWtqH18CohXBBw2lXlLlTR
         21cRv96PqEZp7AqJzKTasLTOZZI/qcdNPfEk6LAyPaSt+AaBd2qVUUwpbUFDOHZifyBJ
         hxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792952988; x=1793557788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVd5+YIpZRZ9srRM38HUZhphNHJ8MrugQ9WKD9A3pC0=;
        b=taCCQn91hAft6ni5YuMW0iGSPEqUzzeR/xJRVUFMiA+PU0NgbHvguBWNhjVtP8u8kw
         GOHKfXtXuB5jFm1ZtvAZ2ntsrx6S/LoOuOCiyCJsvRi5b9+XfI/Qjo0P1LYIWTdz9bsD
         S3K0IyFocF6HD8sRGLNDFmkaG2hNXXn19GlHGwI27hY8HALxm1oXcSB89R2ZANXNutZE
         JgwhlQdpA03UH0zEHVSrHXP9iUKlmzKVwlJtudNzfpyapZWlBTcfOxaalDEYtcWtJe9R
         bBDQDEwcPJzpBs45nDhMwTrglQtK6omp0zenxqcj/URh1gwqjw4Tj/CMajz4oVqiD2H5
         vNVg==
X-Forwarded-Encrypted: i=1; AKwUvBzMvM+TCfvPg1+RTkJ/kdnr2GA+Krqja7fje1DnvdUf6o2/KhNgIkWjKrz/gNJ2CVsDOE15hJNt652AG0+56sPYzMZ7@vger.kernel.org
X-Gm-Message-State: AFq9FYL5WQ27lS3mg8tL1sN7xnJlcoitd5e4J0QfPeQrnV50O8g8w7MI
	ZsMmCQF4aPV+PkC1DzWE2/20V11VwtF9S8V1dLBrRcEx5np/OA9H2/r+
X-Gm-Gg: AYBFou2qEi8TViRAHpTSx0ndC72SjI+8b2wrT6CeDVmnuEhU8L+iVLaVJDYsfAHk5ED
	1+TWggKnKHIUicCFtzDByi89+G/fi1F+zPVe2n0j7IsjOObklt7VQv/8+cEb7Q/t3+AZ0UAu0GT
	IweO/g24UJ/0cTTZVYYKOeoMIqhSdwbSKs/JjhEAdaDLT3KAcaMgKHLXDGtzAKRkhh63fjdNouF
	T/db+3dwl19raOPLd9yOba/XZmN0mau7tgCmUA3Pz65+NMJqyAQpTNnqyFAZc2h7PcLKDg+DShS
	EodRGnuPPSE0adNJleDpfFgZdfia4t9owj3HUX8RuKAYNYH4/a34yLNhHMFd+QR8sItm14YAsXe
	g1OMRWnlK5QLm0rj03i/YhAJPMOqtsfIb4wVA17coorml5H6OcPO87hy8smHvE08r8AACb8VFt1
	yH6lmNaWTVE0savaO7j1vTWn+bBEWrSXOsBTwBeFfads4Atsplzv13ARETI72iZmRr7l8s3YpMl
	H90Xf/n5+qVSHg3GV4Vyl1tswssym+nb2WfiAKu5tC2jczA4xwNO8o=
X-Received: by 2002:a05:600c:1f94:b0:4a1:e774:370c with SMTP id 5b1f17b1804b1-4a35acbcaf1mr81227785e9.30.1792952988059;
        Sun, 25 Oct 2026 11:29:48 -0700 (PDT)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2e8f25sm138255175e9.14.2026.10.25.11.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:29:47 -0700 (PDT)
From: Bartu Alev <bartualev@gmail.com>
Date: Sun, 25 Oct 2026 21:29:36 +0300
Subject: [PATCH 1/2] platform/x86: asus-wmi: clamp keyboard brightness
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261025-b4-asus-kbd-fixes-v1-1-fa4dcf7d2a69@gmail.com>
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
 Bartu Alev <bartualev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

Brightness hotkeys (NOTIFY_KBD_BRTUP and NOTIFY_KBD_BRTDWN) pass an
incremented or decremented level into kbd_led_set_by_kbd(). The driver
assumes the new level stays within valid bounds before queuing work to
update the hardware register:

   scoped_guard(spinlock_irqsave, &asus_ref.lock) {
      asus->kbd_led_wk = value;
      asus->kbd_led_notify = true;
   }

Unlike asus_hid_event(), kbd_led_set_by_kbd() never clamps this value.
Pressing brightness-down while the backlight is already off stores -1
in asus->kbd_led_wk. Subsequent presses decrement the counter further
(-2, -3, and so on). When kbd_led_update_all() runs, its "value >= 0"
check drops the work item, leaving the hardware state untouched while
clearing asus->kbd_led_notify.

Userspace listeners receive the unclamped value through
led_classdev_notify_brightness_hw_changed(). Because that interface takes
an unsigned int, the negative integer wraps to 4294967295, returning
-ENODATA to sysfs readers. The keyboard remains unresponsive to upward
brightness hotkeys until the user presses brightness-up enough times to
cancel every negative decrement. At maximum brightness, brightness-up
leaks 4 to userspace, which exceeds max_brightness (3).

Clamp the input in kbd_led_set_by_kbd() to [0, ASUS_EV_MAX_BRIGHTNESS].
In kbd_led_update_all(), refresh the local value from asus->kbd_led_wk
under asus_ref.lock before notifying userspace, so coalesced work items
emit the clamped state instead of the initial snapshot. Stable trees
need this because negative values break sysfs reporting and make the
brightness hotkeys appear dead until the counter climbs back to zero.

Fixes: 7525566abd360 ("platform/x86: asus-wmi: add keyboard brightness event handler")
Cc: stable@vger.kernel.org
Cc: Antheas Kapenekakis <lkml@antheas.dev>
Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index b33ebdb21aa21..2478361b9b531 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1807,8 +1807,10 @@ static void kbd_led_update_all(struct work_struct *work)
 	if (value >= 0)
 		do_kbd_led_set(&asus->kbd_led, value);
 	if (notify) {
-		scoped_guard(spinlock_irqsave, &asus_ref.lock)
+		scoped_guard(spinlock_irqsave, &asus_ref.lock) {
 			asus->kbd_led_notify = false;
+			value = asus->kbd_led_wk;
+		}
 		led_classdev_notify_brightness_hw_changed(&asus->kbd_led, value);
 	}
 }
@@ -1961,7 +1963,7 @@ static int kbd_led_set(struct led_classdev *led_cdev, enum led_brightness value)
 static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
 {
 	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
-		asus->kbd_led_wk = value;
+		asus->kbd_led_wk = clamp_val(value, 0, ASUS_EV_MAX_BRIGHTNESS);
 		asus->kbd_led_notify = true;
 	}
 	queue_work(asus->led_workqueue, &asus->kbd_led_work);

-- 
2.56.0

