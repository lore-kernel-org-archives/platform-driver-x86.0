Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365639;
	b=vOYc7vscmBpeXdViE+YCCyDqb1vy1U6/WPINYkls9vGLI114sXuft2FShNyWl5PVgg4r
	 DQ6hoy2w3/ytY1Fl7IG97qHLZh2kah2Rv8J6deqbW4eoeBaI3LjinMGQUm49a/PR1PiOK
	 pdX5SOxbioePZNDWcIqnhlfnmm52v5hVriKIFuNGypdoZvWz0cYkJmXAI7Xh484ArTT94
	 sVN+YoNeK6OcFR6CevPQqPZUVMkyfd0TiTKtfpnM2lizSUHKm0Dg9I909d0okF4WFlmiP
	 9UR4cRDNV4CbzLoVjPqQO9jDZfESqXmYPGZ6890ovmQlVFI+OWrixZCRsDw0rs7JfJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WIB87AR4Ci8Yg46+KBDp5HeJUfUvFEAxHY43K9bOqSE=;
	b=kULvb2HdMeQXjWlrlsYeXD6rigVJ2TztPDtr8Uh62sRyUmJs8ZxBzS0XmAeroXH4H+YK
	 o9phcDKcvvNpdKQtiyOWydIYXDPtLyXexUnRDPv0jcD1tSkEbz2hpcqrPe7jO7mQNPbwe
	 iIlXDpbfx66WWAcnWTdov5nN8JYkxbwjeyNmeO12SHaPseottyi/7NW7/mcZDVqS1ejVa
	 y3U5Lrd7L8YPt/POc/rQUsS0SqEduldqAR1l6tZRX9YsB1m0LGKpYDm3NiZoFjmokTsPj
	 zL8s36e2rATdmno9cqRQOjjRNIdf/gYbMV/5Yz7uJFeaHGpYfu1lN3fsKg4iD/yvskQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kjEYLRqU;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96766606A320
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 16:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96766606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kjEYLRqU
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so2085091f8f.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 08:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795365637; x=1795970437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WIB87AR4Ci8Yg46+KBDp5HeJUfUvFEAxHY43K9bOqSE=;
        b=kjEYLRqUC6/nzTbPq87LTR88+hfjhcCRC0DKtY1GfcOj0h4vah+2IRom/HYJCsjqhb
         w+WJbtcwC2fKlBuiHLbtRUNSrYLoy87nQYOAr3dOwJYdyik2PFUzp7zdctExiJFQXIdW
         Uy5d2uqVoW+NkecitLW5UqeLUwIBEtYcYjmWAekzTtmqTcDIpqWqI7F4e0Y3fhc538zT
         W/zpKhYAahkC0l5z+smQ9PZIOr5O6csnfTa0s10dNxXlFfk/OKXny5IO5UBw0Khvc87/
         ou9ucf0d7TDTaFCSlzkW6MBhGoEPxCBLm2itPC4Zl+dj59K/Vydi0+ngccVzk5jceCND
         /D8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795365637; x=1795970437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WIB87AR4Ci8Yg46+KBDp5HeJUfUvFEAxHY43K9bOqSE=;
        b=Ij0HvZajHzndiMAgajLErehtuB5xqaUTRj/VU28c5NPuRjAbZvtO0Wu7URc4U87/Ca
         crUg4JDFyLp+3GGALba6bBpYbmcCZ1QWwYVLMs9dP4TCN6TftgZk5KcIGUt4pLTwuhr6
         2jh0wGuOJhiLOY76mtt35SIQzx7GwqFmCILGfWeincGVdhUEFXCQy3Cpk7YZAGNwp5L5
         xdxQSFijw4NQdIgxbjo4mdwJM2EZlpYnvlKdvFXSwxqi93J9AfS1JCNfMpIF0wGOCCy5
         Wphba35bv+9aX9SnkpNXKq7Rfrjiz2VKdVlVVTMsZoiwtMrIChL6N6TQrMx7CfCbyH74
         mfCw==
X-Gm-Message-State: APuU4Z+QIa+PX/8xhzceKN/Bk7Tb8wyOhiLrEDmG72uOyCLGm67HUkqi
	81BN8bEZQBXnsk38WPLTKlKOjQbXOnpn4VROkun5Wdn3e8ldXhXF4+zw
X-Gm-Gg: AZFdTZccfWcB0Nfp+5kuvObVMFeW3kv6EuvaaRyBE1XX6rSRfZGaTGCb85EMbB8GJfK
	xf1xdAxxBi5TfFd/dC8xeBZPwozl/JC2X5xvvl6CLw+iyoWbGSgYj8hZV8cADfNRHc5w6yZTM8M
	IxsHM/YlgWDb9PnuTQc9IeiIcdhTtaYe2+4eQ938SppIC7rDUXNsnZyfIMDJQhRtTkqJOyXMUBu
	Re0WABzxKwLSecF1fk7guLA1YALldvAdL14Id+NPgAhitoBtpGA7eMdgrVRanKm64fZxe2kX8oQ
	hCB4AWOjr9CrqYTApDrTKPd2JQayjAXJ74d3zKAGgYjVWclTcuOBjDYwP9rtiSTkAS2LCkkllGD
	VgA8XVvckeWhS+6IXZJdXuT30Izs4rsHyhjrcqJ5bH+QnuI9HH7pyytyDlfczH5uzqIyWRkib4g
	FiN2qrxRQeQUeYuYYVRTjmYeDK05M11Kgz/cUU/M421ACPoF0uPpTbM+iXWTE+cQE8hfWV/nMqd
	OsZbcv682tjF2ROOtFgxA0+fXrkdBwTofW7mNKN87SPWPB7H572Z8umANoop2VqU2525TnL/hqm
	shikvsdmxmfezmyAhwlWQKfE7e+QUTLBb/YCjhANO7DyM4PhCQpNAbz2kA0nDC2xqqh4/8cYG3e
	DJZsfhE7wTkLJX6lvbIsr4QOF7ycNQyk82/YWtAC2p3ete++pd3PlX83W
X-Received: by 2002:a5d:5d03:0:b0:492:cd78:7137 with SMTP id ffacd0b85a97d-4abaa9764d3mr18639728f8f.8.1795365636696;
        Sun, 22 Nov 2026 08:40:36 -0800 (PST)
Received: from telekom.ip (20014C4E24AF4C0067F24712333371AC.dsl.pool.telekom.hu. [2001:4c4e:24af:4c00:67f2:4712:3333:71ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm16765646f8f.40.2026.11.22.08.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:40:36 -0800 (PST)
From: Martin Szathmari <martin.szathmari@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH v2] platform/asus: asus-wmi: Add quirk for on/off-only keyboard backlight
Date: Sun, 22 Nov 2026 17:40:34 +0100
Message-ID: <20261122164034.7175-1-martin.szathmari@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122144147.7916-1-martin.szathmari@gmail.com>
References: <20261122144147.7916-1-martin.szathmari@gmail.com>
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
Changes in v2:
- Use a ternary for the quirked clamp in kbd_led_read() (Denis Benato).
  I kept the clamp limited to quirked models so that behaviour on all
  other models stays strictly unchanged; happy to make it unconditional
  if you prefer.
- Drop the comment on the new quirk_entry field (Denis Benato)
- Re-tested on the B7402FEA

v1: https://lore.kernel.org/platform-driver-x86/20261122144147.7916-1-martin.szathmari@gmail.com/

Based on pdx86 for-next; happy to rebase if other keyboard lighting
changes need to go in first.

Note: This patch was developed with the help of an AI coding assistant
(Claude Opus 5.5). I reviewed the change and tested it myself on my
ASUS ExpertBook B7402FEA as described above.

 drivers/platform/asus/asus-nb-wmi.c | 14 ++++++++++++++
 drivers/platform/asus/asus-wmi.c    | 14 ++++++++------
 drivers/platform/asus/asus-wmi.h    |  1 +
 3 files changed, 23 insertions(+), 6 deletions(-)

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
index b33ebdb21..0b85308b8 100644
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
@@ -1923,7 +1923,8 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
 		return retval;
 
 	if (level)
-		*level = retval & 0x7F;
+		*level = asus->driver->quirks->kbd_led_on_off ?
+			 min(retval & 0x7F, 1) : retval & 0x7F;
 	if (env)
 		*env = (retval >> 8) & 0x7F;
 	return 0;
@@ -1937,7 +1938,7 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
 	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
 
 	scoped_guard(spinlock_irqsave, &asus_ref.lock)
-		asus->kbd_led_wk = clamp_val(value, 0, ASUS_EV_MAX_BRIGHTNESS);
+		asus->kbd_led_wk = clamp_val(value, 0, led_cdev->max_brightness);
 
 	if (asus->kbd_led_avail)
 		kbd_led_update(asus);
@@ -2164,7 +2165,8 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 	asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
 	asus->kbd_led.brightness_set_blocking = kbd_led_set;
 	asus->kbd_led.brightness_get = kbd_led_get;
-	asus->kbd_led.max_brightness = ASUS_EV_MAX_BRIGHTNESS;
+	asus->kbd_led.max_brightness = asus->driver->quirks->kbd_led_on_off ?
+				       1 : ASUS_EV_MAX_BRIGHTNESS;
 	asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
 	INIT_WORK(&asus->kbd_led_work, kbd_led_update_all);
 
@@ -4706,7 +4708,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
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

