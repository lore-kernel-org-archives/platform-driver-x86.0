Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795358511;
	b=bmQrbASx4tRAiXlIayrFrk1kdpfBBLqIQpobqAk/w1hZCcjwpcvSun2TqaNtVGBlmprS
	 kKsMPJcePqzgEY/okpFIYqehZSIII3pq/R/aeMeV1PggfBxwLMdZpWYTgTOMLfNBpoVjm
	 5uznPieJbWC09J/9WuxkboL7PHr4Pgi/f9kCqC9t/3pkj7KlTFX1xqIWc7Xt4cL0k9LmD
	 oRVPXX0fu686Wttj8soX02mHmI1Ru6NOt9G7CWsTht4HFPsSbrb7N7rTskKpBhQiXOmWm
	 1jNuJus7RBp7XKvvdpmxKqcx/9Ykky7FndmTwoXRng908+GehIbMz8hfaFZAM7RUsaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795358511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=xERMo4Mckb69iCr22daM0DRtscNUSXhO/M9VOz+C7tE=;
	b=dItDNusYJuZzuECXFIyulWWiiq6c08KqjXYi0CoBewgnq5Ky7Vom6Hs2Ype/z5C7EptB
	 47adLUTUalI6ZNuKp0r2GlhRAGNVuazLZDPf4xCkxnnRef7f314TIbLd0/f4ZTrqo91Sm
	 Mm09wh+mSwsZbO1NjTpog0T0w2n2rfzbGgJ24pLjBailbxvKU3ehes9rKfWIKyYTN6KHz
	 wmVQsuQK7gJSv6VD9mcA4NhRoS/GFXtofxYl58TkPOnXLmvhNLm/7VzTZQizCjaPBozEH
	 gGvp5VrQvEerE7KXmWdCva1CyQiu0MmcRsvZCiC3hp7WX1ccsYiyc15tpiQHSCu60FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fg7/Bw3W";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52767606A320
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 14:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52767606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fg7/Bw3W
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so2087144f8f.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 06:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795358510; x=1795963310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xERMo4Mckb69iCr22daM0DRtscNUSXhO/M9VOz+C7tE=;
        b=fg7/Bw3WbQudxYFzr7POyQ111gOMU1vwIZFh9z3XhB7iHPQApfIkW8BG62DKyyw8JC
         Sq726X4lcvcvnn5VQSMc+6AccmSPcXTk0aZ8NzrUUXrUcopWPbL1HbB3ZoHp1fmiA/Ve
         gYerflo0gI1s+mfedS6/ce9lNLepWuS7htHNLXl9HoWaZ4QG6g2iOHEI2Xh+ruRoFRg5
         +lD+cyfkRR9Bs+Kp8HZ6pVQVUacAyDI3bpoj5gOtANANw2D9hjuzuc3OI+Ki8rhq9+4s
         R23NtExJI8kxz8W2uqrdpGDzSad+SUfvC7kjXpS61yT4m5M/dD4wtoHL9UDaMLaY4KvS
         suKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795358510; x=1795963310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xERMo4Mckb69iCr22daM0DRtscNUSXhO/M9VOz+C7tE=;
        b=C497XsRfltFehoFoj1gRQVEDy07OSA5nVrOVAxqMF88GIomv0brCAWI32RbD6jnYkE
         YP3/CoZu8hduna/2bQLengKho63bgV1ik4w8xqhjEpeNLCHgS/JpywO6DeDAtEVI5NQ8
         ZHMaBb+5gxXd1plaV1dyfDTj3qIojdP/GM7OxqN+EAn9zUfFBUUyqJxhqUxuaoUsVzjY
         dEVzqhkCZwXqinewBRDnieIkcqc72NhJvRJ+HbpEYE7YpH5gGfX+JgF+rjzKLYAVJCvr
         +o5xLl3UEl+T+4wK79xLfLK/dWy4TJWXgqIYfyHGnsF6NEknyUtTRusH+qzR+nuSt2jE
         wd4w==
X-Gm-Message-State: APuU4Z8XdSDqZmhXdqdIbjtjq4DQxHCyz5L4+9S7snl4XYXvjIhynL4A
	Zj0QGld2Dp3ThoLRVrzRuIzSpit0IjzqYuTz8eXmyDHG2oImWe2y9hXHLW673wztwvM=
X-Gm-Gg: AZFdTZfdw23My20pyF2ovri1GTQsLacjH3U3EybQEHApkzxQZVezh761DuK282ot247
	XPhG/tXyh3mO2PxiR6l1CkLyTTq6p5rdX4zBrwXuHnEZ6jQF3sU89mKOkTEQRB+QkxZsD25++UK
	mtnBkEmPG0HlKg5a+fG4nZtv2fxIV9UGKmVSVtP9SlvesbGbAbMMGnicf9hqAmlGGd15dk7YOCF
	8T/QjOWKbA3SrcmSOA10Q9pDJEkG04dCKi09pAI5C9x8dXORFP6B9z3pSh34AQRDtOI11Jo3SFS
	GAYopozZhXFj2+9QW7QtKjiy5B1jmajM63WKDeAwmSMc+wdVlMY0tsXfrJ6ymkqq4sPVLiXXOos
	odv2t6txVA+Ea3juGoRQ7Lupaic4ZLZs6AWFmC8qRvBYn4nEt6WHK8cpI1HTVk1RLiGKVWKb8Q6
	fszLla4TWB3sUuyjollLFhV8zBXYsagbLWJrNHnz1lrVw9akRHODZOo49Ttszc3+Knp4yoLMjhP
	gacwOnRHpoN+2fbcfrehjmMqEQxkhcWk5Q96wYVWCECo0Oe4MowEfGXvCuTLK25ZR5oGspiUEEh
	JQa8GYUwS3jiwIMrvm5C/GRDBrvg3uFL/PS1ivxC3MCpmqNlQKZC4HKgWczw/AiEH8ymVwZ7rlF
	ELD/ISsyvuQmoPkmc0612aU0ItB9rk+mt5EUtz3titV2ghK3ZKoNolKrjKLL1gVhEI3uFzPXHYi
	lweA==
X-Received: by 2002:a5d:45c9:0:b0:49d:f98f:4666 with SMTP id ffacd0b85a97d-4abb0f3c85dmr13843232f8f.11.1795358509631;
        Sun, 22 Nov 2026 06:41:49 -0800 (PST)
Received: from telekom.ip (20014C4E24AF4C0067F24712333371AC.dsl.pool.telekom.hu. [2001:4c4e:24af:4c00:67f2:4712:3333:71ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm17017270f8f.58.2026.11.22.06.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 06:41:49 -0800 (PST)
From: Martin Szathmari <martin.szathmari@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/asus: asus-wmi: Add quirk for on/off-only keyboard backlight
Date: Sun, 22 Nov 2026 15:41:47 +0100
Message-ID: <20261122144147.7916-1-martin.szathmari@gmail.com>
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
Content-Transfer-Encoding: 8bit

asus-wmi always registers asus::kbd_backlight with max_brightness = 3
(ASUS_EV_MAX_BRIGHTNESS). On the ASUS ExpertBook B7402FEA the keyboard
backlight only supports two states: levels 1, 2 and 3 all produce the
same, full brightness. Userspace therefore shows a 4-step control where
the top three steps are identical, and the backlight hotkey cycles
through steps that visibly do nothing.

This matches the vendor-supplied review unit tested by Notebookcheck,
which describes the B7402FEA as having "single-level key illumination".

Add a kbd_led_on_off quirk which registers the LED with
max_brightness = 1, and use the LED's max_brightness instead of
ASUS_EV_MAX_BRIGHTNESS when clamping and when wrapping around on the
toggle hotkey. For quirked models, also clamp the level read back from
firmware to 1. Enable the quirk for the B7402FEA via an exact DMI board
name match, keeping the default wmi_backlight_set_devstate behaviour.

Behaviour on models without the quirk is unchanged.

I tested this personally on my own ASUS ExpertBook B7402FEA (BIOS WMI
version 9.0) with the change backported to v7.3.4: max_brightness reads
1, writing 1/0 turns the backlight fully on/off, the Fn backlight hotkey
toggles on/off, and KDE Plasma's keyboard brightness control shows
0%/100%.

Link: https://www.notebookcheck.net/Asus-ExpertBook-B7-Flip-in-review-2-in-1-laptop-with-5G-modem-and-long-battery-life.600053.0.html
Signed-off-by: Martin Szathmari <martin.szathmari@gmail.com>
---
Note: This patch was developed with the help of an AI coding assistant
(Claude Opus 5.5). I reviewed the change and tested it myself on my
ASUS ExpertBook B7402FEA as described above.

 drivers/platform/asus/asus-nb-wmi.c | 14 ++++++++++++++
 drivers/platform/asus/asus-wmi.c    | 16 ++++++++++------
 drivers/platform/asus/asus-wmi.h    |  2 ++
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/asus/asus-nb-wmi.c b/drivers/platform/asus/asus-nb-wmi.c
index 3b0f3346d..9204213be 100644
--- a/drivers/platform/asus/asus-nb-wmi.c
+++ b/drivers/platform/asus/asus-nb-wmi.c
@@ -154,6 +154,11 @@ static struct quirk_entry quirk_asus_zenbook_duo_kbd = {
 	.key_wlan_event = ASUS_WMI_KEY_IGNORE,
 };
 
+static struct quirk_entry quirk_asus_kbd_led_on_off = {
+	.wmi_backlight_set_devstate = true,
+	.kbd_led_on_off = true,
+};
+
 static struct quirk_entry quirk_asus_z13 = {
 	.key_wlan_event = ASUS_WMI_KEY_ARMOURY,
 	.tablet_switch_mode = asus_wmi_kbd_dock_devid,
@@ -585,6 +590,15 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_proart_px13,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUS ExpertBook B7402FEA",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "B7402FEA"),
+		},
+		.driver_data = &quirk_asus_kbd_led_on_off,
+	},
 	{},
 };
 
diff --git a/drivers/platform/asus/asus-wmi.c b/drivers/platform/asus/asus-wmi.c
index b33ebdb21..2e06aac9a 100644
--- a/drivers/platform/asus/asus-wmi.c
+++ b/drivers/platform/asus/asus-wmi.c
@@ -1837,14 +1837,14 @@ int asus_hid_event(enum asus_hid_event event)
 		brightness -= 1;
 		break;
 	case ASUS_EV_BRTTOGGLE:
-		if (brightness >= ASUS_EV_MAX_BRIGHTNESS)
+		if (brightness >= asus->kbd_led.max_brightness)
 			brightness = 0;
 		else
 			brightness += 1;
 		break;
 	}
 
-	asus->kbd_led_wk = clamp_val(brightness, 0, ASUS_EV_MAX_BRIGHTNESS);
+	asus->kbd_led_wk = clamp_val(brightness, 0, asus->kbd_led.max_brightness);
 	asus->kbd_led_notify = true;
 	queue_work(asus->led_workqueue, &asus->kbd_led_work);
 	return 0;
@@ -1922,8 +1922,11 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
 	if (retval < 0)
 		return retval;
 
-	if (level)
+	if (level) {
 		*level = retval & 0x7F;
+		if (asus->driver->quirks->kbd_led_on_off)
+			*level = min(*level, 1);
+	}
 	if (env)
 		*env = (retval >> 8) & 0x7F;
 	return 0;
@@ -1937,7 +1940,7 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
 	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
 
 	scoped_guard(spinlock_irqsave, &asus_ref.lock)
-		asus->kbd_led_wk = clamp_val(value, 0, ASUS_EV_MAX_BRIGHTNESS);
+		asus->kbd_led_wk = clamp_val(value, 0, led_cdev->max_brightness);
 
 	if (asus->kbd_led_avail)
 		kbd_led_update(asus);
@@ -2164,7 +2167,8 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 	asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
 	asus->kbd_led.brightness_set_blocking = kbd_led_set;
 	asus->kbd_led.brightness_get = kbd_led_get;
-	asus->kbd_led.max_brightness = ASUS_EV_MAX_BRIGHTNESS;
+	asus->kbd_led.max_brightness = asus->driver->quirks->kbd_led_on_off ?
+				       1 : ASUS_EV_MAX_BRIGHTNESS;
 	asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
 	INIT_WORK(&asus->kbd_led_work, kbd_led_update_all);
 
@@ -4706,7 +4710,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 	}
 	if (code == NOTIFY_KBD_BRTTOGGLE) {
-		if (led_value >= ASUS_EV_MAX_BRIGHTNESS)
+		if (led_value >= asus->kbd_led.max_brightness)
 			kbd_led_set_by_kbd(asus, 0);
 		else
 			kbd_led_set_by_kbd(asus, led_value + 1);
diff --git a/drivers/platform/asus/asus-wmi.h b/drivers/platform/asus/asus-wmi.h
index b45f81b38..2a9060b6e 100644
--- a/drivers/platform/asus/asus-wmi.h
+++ b/drivers/platform/asus/asus-wmi.h
@@ -41,6 +41,8 @@ struct quirk_entry {
 	bool wmi_force_als_set;
 	bool wmi_ignore_fan;
 	bool filter_i8042_e1_extended_codes;
+	/* Keyboard backlight only supports on/off, not 3 levels */
+	bool kbd_led_on_off;
 	int key_wlan_event;
 	enum asus_wmi_tablet_switch_mode tablet_switch_mode;
 	int wapf;
-- 
2.56.1

