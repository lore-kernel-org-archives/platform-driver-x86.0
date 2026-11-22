Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367903;
	b=TgQo2ljoacCETSIoSAnYXfZ6FeV+cDRSZzOgk7Zc5AKi1yKLBOiJtDqKfQ8UwJl5yxsK
	 AIu2cXzlIChurdqgYH+6a9yiTmCTB65T77BMoXlzgho0ZSUb4vjr4fHHGdQhFFJQxqQQd
	 wieVtbpxc1/6AIuG3wBmUlVhWhAAzKip8JAWNE0d6pEZrbqCh9F0GkZ4wS8YfkxUU82xX
	 AFVIr+4GJ/Y7wc4Js1NhZUQBk9wLUlKrI8Ez9d8DdwowJ2FDuqA1zA9GlWm6nzJe02K2w
	 hdcfxEAQ5TfDoUyO7e+UGmaBH6s8HnU5ZcPMwvy/JJMpqWlZfhodrrOuBioTHkHYOVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sEbpzqYle1+1CNvbQdV+3O1FMcroPvvy10KKZHvyPl4=;
	b=juNIjQ4YwgK/wQbG9L+eGvFeBeWhQ3cHIihrI/uodvCBsf1ZR8qwuD6EfeKRyQb8Ov6x
	 42fjagqV2SwI/6DruM7i1noyPZUVlfzmlv7UoAZH2UvpgPOFreBygOncJvlMn6jyathrC
	 uc9jpVYgdoNFAQbKlTQ9JmM6JWUmtEB6XgLKTaPjhgjm1Qm7VKrR1j1ZhWBd/cHNLL7Np
	 pD82C7Ij7T53UUQ7IkYPP34lXk/yUT4L1pDzCnPGO8T6bJBY09U/w2f8BRT0XJpYHTdQ2
	 yDxtsL3ES0n/pw17WdK5bt+kzMgdANlCswov5gaSQZHk5SrUbGyPFvdXQkPXyOAaHcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oG6MDCTe;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E8F606A320
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 17:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09E8F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oG6MDCTe
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so30417515e9.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 09:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795367901; x=1795972701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sEbpzqYle1+1CNvbQdV+3O1FMcroPvvy10KKZHvyPl4=;
        b=oG6MDCTeRA3HXz0PGTpY2L+QdDG4yIUr+m8WuI3Wyz4HHEuiWKZCVvnYyELMZBBVZ1
         h+NHGgzHsy9Rvg/ytuI7ZnB2W5e4uMpHqKPG4FVNmS3jwU3deLU9/IqFquIYdR+FQT4Y
         JV4+qE+YZQRS/GAi8L8LEF8R28lYe3Nuoa5tFg/5I/vU7vvKHNCtsdAIwq07WXx+WqIN
         kL3Kcr86nCoEvfpZUPZkzX+vXSXyZ30/m2OJAGjfi0Sl3fJ5n6yn6DVJfbseqye5qn1d
         uiwIQcT1M4GMQ+2FkTAWAhUMQcP1JEwWwpW1Wy5IChptSjxpqwAwK0D8AZS/+jNJJ45g
         4TpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795367901; x=1795972701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sEbpzqYle1+1CNvbQdV+3O1FMcroPvvy10KKZHvyPl4=;
        b=F/AlgsxpWNLPc3BsnDCS8unM9H1+oQa4b+92nHYrR9mEYUC3CPH5hWp7tQ8tKS1fBd
         p8NEwIBF2tClVT6NLkya+yxxTvMHnwTctgUhwO2cRD9Pq9rQiMO2np5oTjuXfi+tiroU
         glZLcOAwc6h5XnUdTmJZ2JjPl+PSxIjyLfSxSKcu9cC+N45vxiefPqdXe/2sQFWVk/yU
         z2PFK7BSkYkndGa/kq9h9Xqy792WoY/EVWnm3I6K5QaoIVGDZVBu/a5DmCnlDSLcdPQA
         9BoV+vA43zJjkUqmDR/hJljTpH+bbEvuQ+fr3aiGu5pcBQnE4m6VEJ0MmhCwtxCpWgST
         UW/w==
X-Forwarded-Encrypted: i=1; AL+hErHfFz4HdGYi0lTHuAlMp3N1nuwrWjv7UfiCLYE1qgBIUpYNm6LYHwhCmLLFRzE9XUpAgZeulHsOK0AFcnMxQ+S0z8CH@vger.kernel.org
X-Gm-Message-State: APuU4Z9IQCDDeHhLWjMDR8AeGiYIM/khMFr6UhxRL0WNucdOagASfvPK
	SkyxlUfurSNA5+pPG3e7JKQllBSzDZwEaWf1ozTgiB23lR5LU6gl2CwW
X-Gm-Gg: AZFdTZeKXpIp4vWeffzKznR2jZbCulYvW/VZrQSWFVtNWMGadybUC8C5984uCqEJAUm
	8Uf06hQcqO7/RscMALhJgDYXak4oIENkvgFE0DugmQyIbN9cJ4pqANZvxHVAFU2ukulgTe1duAr
	eS347eecB9YUm8qk2xd6OFh+8lrj1Pwj0WyDCf87sohjKfJlfHIrLSrvPFGrtuA6nV6yx2Vl5FA
	aIn9Y5u+cdKGbVRNipJm6NCeLuHtESjTHzjsdVBW8G9h9oAbYR3RGwP7fk2cXWgC/9OjuffvjH+
	y9KDZHbJX+Hf2lJC7iuy8/cHOMLkJWbHp2NdSmui4p1Pi+3b570XFuoQIuw3o8zo+nb9nghUFXX
	s5hpaDkreduMvYzxhVpqNcjyuPMuWSmzg4sBMQU8YPfxGDEvrYgfEYbDPu1prkNcH1kQVTEQ7wE
	SuFl2xA2PXwTtbIutqIefLaksCudf5cm1grDijy8xv1DGWRD/yCswnG7X6VdLVvDGvJ1N/o0QZP
	dJ2lxn8Jo3CYQBW0Py3KSRWbs4JHO3IlzKk5Y05qS82sQHm9OH5zTpADhbZEiaa14hGOssLy/IM
	w9YhBqPLxc0L1yOvexWyAeGJ90Jp4MfrorF09GJeILrj/rTOtOxSkYV4FGDskxNmnsRu7/1hj1x
	34liZWqj/zK0J04mAAipr6ht+HVavIO5ic0Fh5l3QdbeY/eyq6T6Z2h6S
X-Received: by 2002:a05:600c:a085:b0:4bb:85d9:156e with SMTP id 5b1f17b1804b1-4bb8880fe46mr198290445e9.11.1795367901207;
        Sun, 22 Nov 2026 09:18:21 -0800 (PST)
Received: from telekom.ip (20014C4E24AF4C0067F24712333371AC.dsl.pool.telekom.hu. [2001:4c4e:24af:4c00:67f2:4712:3333:71ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm137810385e9.4.2026.11.22.09.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:18:20 -0800 (PST)
From: Martin Szathmari <martin.szathmari@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3] platform/asus: asus-wmi: Add quirk for on/off-only keyboard backlight
Date: Sun, 22 Nov 2026 18:18:18 +0100
Message-ID: <20261122171818.9948-1-martin.szathmari@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122164034.7175-1-martin.szathmari@gmail.com>
References: <20261122164034.7175-1-martin.szathmari@gmail.com>
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
toggle hotkey. Also clamp the level read back from firmware to the LED's
max_brightness. Enable the quirk for the B7402FEA via an exact DMI board
name match, keeping the default wmi_backlight_set_devstate behaviour.

On models without the quirk the clamp is to 3, so it only has an
effect if firmware reports an out-of-range level.

I tested this personally on my own ASUS ExpertBook B7402FEA (BIOS WMI
version 9.0) with the change backported to v7.3.4: max_brightness reads
1, writing 1/0 turns the backlight fully on/off, the Fn backlight hotkey
toggles on/off, and KDE Plasma's keyboard brightness control shows
0%/100%.

Link: https://www.notebookcheck.net/Asus-ExpertBook-B7-Flip-in-review-2-in-1-laptop-with-5G-modem-and-long-battery-life.600053.0.html
Signed-off-by: Martin Szathmari <martin.szathmari@gmail.com>
---
Changes in v3:
- Clamp the level read back in kbd_led_read() to max_brightness
  unconditionally instead of only for quirked models (Denis Benato)
- Re-tested on the B7402FEA

v2: https://lore.kernel.org/platform-driver-x86/20261122164034.7175-1-martin.szathmari@gmail.com/

Changes in v2:
- Use a ternary for the quirked clamp in kbd_led_read() (Denis Benato)
- Drop the comment on the new quirk_entry field (Denis Benato)
- Re-tested on the B7402FEA

v1: https://lore.kernel.org/platform-driver-x86/20261122144147.7916-1-martin.szathmari@gmail.com/

Based on pdx86 for-next; happy to rebase if other keyboard lighting
changes need to go in first.

Note: This patch was developed with the help of an AI coding assistant
(Claude Opus 5.5). I reviewed the change and tested it myself on my
ASUS ExpertBook B7402FEA as described above.

 drivers/platform/asus/asus-nb-wmi.c | 14 ++++++++++++++
 drivers/platform/asus/asus-wmi.c    | 13 +++++++------
 drivers/platform/asus/asus-wmi.h    |  1 +
 3 files changed, 22 insertions(+), 6 deletions(-)

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
index b33ebdb21..f99512d29 100644
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
@@ -1923,7 +1923,7 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
 		return retval;
 
 	if (level)
-		*level = retval & 0x7F;
+		*level = min(retval & 0x7F, asus->kbd_led.max_brightness);
 	if (env)
 		*env = (retval >> 8) & 0x7F;
 	return 0;
@@ -1937,7 +1937,7 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
 	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
 
 	scoped_guard(spinlock_irqsave, &asus_ref.lock)
-		asus->kbd_led_wk = clamp_val(value, 0, ASUS_EV_MAX_BRIGHTNESS);
+		asus->kbd_led_wk = clamp_val(value, 0, led_cdev->max_brightness);
 
 	if (asus->kbd_led_avail)
 		kbd_led_update(asus);
@@ -2164,7 +2164,8 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 	asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
 	asus->kbd_led.brightness_set_blocking = kbd_led_set;
 	asus->kbd_led.brightness_get = kbd_led_get;
-	asus->kbd_led.max_brightness = ASUS_EV_MAX_BRIGHTNESS;
+	asus->kbd_led.max_brightness = asus->driver->quirks->kbd_led_on_off ?
+				       1 : ASUS_EV_MAX_BRIGHTNESS;
 	asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
 	INIT_WORK(&asus->kbd_led_work, kbd_led_update_all);
 
@@ -4706,7 +4707,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 	}
 	if (code == NOTIFY_KBD_BRTTOGGLE) {
-		if (led_value >= ASUS_EV_MAX_BRIGHTNESS)
+		if (led_value >= asus->kbd_led.max_brightness)
 			kbd_led_set_by_kbd(asus, 0);
 		else
 			kbd_led_set_by_kbd(asus, led_value + 1);
diff --git a/drivers/platform/asus/asus-wmi.h b/drivers/platform/asus/asus-wmi.h
index b45f81b38..74e30a2d7 100644
--- a/drivers/platform/asus/asus-wmi.h
+++ b/drivers/platform/asus/asus-wmi.h
@@ -41,6 +41,7 @@ struct quirk_entry {
 	bool wmi_force_als_set;
 	bool wmi_ignore_fan;
 	bool filter_i8042_e1_extended_codes;
+	bool kbd_led_on_off;
 	int key_wlan_event;
 	enum asus_wmi_tablet_switch_mode tablet_switch_mode;
 	int wapf;
-- 
2.56.1

