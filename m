Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793528111;
	b=qusPODgDqzBl3cDPIX2PsX5cpKO2nlpVR+o+U2rlsrjQr511/YZQQbJqzkeol7hJ9Bl5
	 tIT9+XVB/fzHQLBniOcx3g0q3YUzjJ1mT1KLLJI29ymDroM+6sS6jH463UWiKIDU6Ize8
	 TfcxT101o+JPvR2OdB0ap94ZKWMsARxez7eTom/NiJRw7Xpsk8yIlX6q4P7KE2cnlnUxd
	 zVdb6D06CKqte+5j3zkDIhmfNFfPrKk79XOB+8KgzY115pHfnLkY9M7et4KpCScwbFn83
	 BpHTGDsFB4lKrDESGUqsmEcmfQH5jtn82nj3EfBoc0qs7V5APq5YS52OFDSO2NchlJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793528111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dkwNpvCq5ohLlIoaUDQf94qmxPKjqeSRY8ZXrN91ges=;
	b=ZiJhpnO9uoo51HpDjqMjcxlSj+w7Rxkeeapz4MYm+3CGhZ/r5oPTAOsQ7qzPIsxmOXmj
	 qpOcj3NHJRTaBC/DwOI0HHtmQsgBCsc0U9jkwqDxcYMCpv/Kc0gj1W/ugNdtlOxvvQfeX
	 RjCO5S+My+6n4uvQOYgneFrcHBALAYMKcDS22tFZinhKIWsZbYh+LLav51AlK3aDaUn3O
	 ce466xZLOFpIWUdyJRvXv5mOSoI2dif9WB/Q4odZ3iDmsgoZfbqFplqorvdoJynrdgOTU
	 uPC/J8x8pZJ9nZr34Z4UD473ZnIT5knLodByVVTpDL1KgkKkEoORe91YwCe1C8v6F6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OjfV1W3R;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3EE606A325
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 10:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E3EE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OjfV1W3R
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso24488025e9.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Nov 2026 02:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793528110; x=1794132910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dkwNpvCq5ohLlIoaUDQf94qmxPKjqeSRY8ZXrN91ges=;
        b=OjfV1W3RMh1X30DqTdn+Vx526D8owwZ4TfpH4ognNBe2pQ9nzm+delnClbKpAA4Nwq
         rp1hof3IsVPJbTPWoLBaj0CNub61ltv0aabAXv+CHg2Vyhd/17kAOomowc6dKiB5AqYD
         kYA1XOFZYQPG1TzC4q7jx1FJAElCRscXT07ksP1pQ8gRVgGpek/QxbGZ3Xh4dahj1+sy
         JtddUTfHpG2/wGVnP2aCUQpjLVkA6i39iW8CGuEXJYVWjz0eaB3pzbkOZVyyMNu2Unrg
         lDWFPXP1ZG7ZrFv8B3wKpq+MEXUkzkcRCjg9By56HfYexskX6hn1BS7ZY662BmK3ntcr
         6W0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793528110; x=1794132910;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dkwNpvCq5ohLlIoaUDQf94qmxPKjqeSRY8ZXrN91ges=;
        b=XIL0qi2NAPbaCBFcrPIm88hPDYrwOjSGUfmtCcSGn+cs/tOfzOjBqxWN7dFcSSIzj3
         /lq/HZ5qhBG+MOQW36wKRD8856b9B6lABWiaasOJmiIUspluKR8RyTiAnhvVJkAxJ8nE
         pGFRfH4lLHl4J/8tsfAmv3oKCDZZttDaHQWCDhbDeEmSLWvc/SDhLVZnR3LVxADUxSVm
         o0QQ52/XkBihbNFzRASO5Ya/lGh1sYJ9/FSIW/7qSwk34VJuw83sRif7pV/Sb4sHtZ0c
         be4ODLMZEi1fz/Vzy+mgCVv77jJvhz2BSx/gYZjWML5iv1GxDbQ8QOzTArTbuvTfGgUu
         tcQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmTRzTES0sOF1xazA831WKe40k9fLia55tQuH0+GHl5P+MFeu29LUMPedJ6lXJCANLU52OsHIre5f/pNytKsIwkCE9@vger.kernel.org
X-Gm-Message-State: AFq9FYKiI4VCVm52eh9li07zPmcMV63yhDldlIKdGVUooWEkvUx039IU
	HhCbF6b9Cl2JBjFW11JWNAxs/ffoxjfjW1IIEzjpAvCvz1b/1Kxl0aiS/ZDORg==
X-Gm-Gg: AYBFou31wf04FqEuV7EKll2lIGgkY5ptHuAxKGZFMlmPXmM6IojnP+HMt37g2TxZLGd
	zXRutZwW1wgmHq5htJdbD/2weuCQMbMWW+ZF7dsW4XLdRlEiI5mf0znZ4Y6QMX0jrFbexbGsu5v
	OM161/kjHT9CqcXUj1ue0X8RO2REXMf/U5ga8tVzzC8pRsyconrpz+57mUwwwZmmd5sV3/OfARH
	tIlOrp9ZkUhdaLxWDxdkatTJFzp6SiV3IOcxlI6+WVFsYRWQVA4SCi/xwDDz0urPDxaO/AvX2zD
	KteWRi3jao5OkIR5zfBI+MwAGQkSqbGmuSvdamDbTg77EABJTVpHvpgRIVk5rry1GIyNwvzHm6W
	LOY8NSKiFq9xTr11LfH8xKPExdlVYw9+Y1a0xBsAIPycSX2M37WVSFn//WRJtEdUKm+cCmcIqvc
	LTclhwOmWIuZmvmCqJyVwL/wkmpELJlv2wRSch9ZrBtNWyz3vOyXhgoaHoqOsowZnDjTrOGds22
	Zl9Ar6rj+/OVO+WYYJGxARTokqd+rGWR6itIVrILg0LtyOoSn3e0OVis0D5DwAR46YSGuaFidDx
	QK6rrTArXwLpLIYnPsv/GxQ796kn3M3SdQ==
X-Received: by 2002:a05:600c:3556:b0:4a7:6bc7:f778 with SMTP id 5b1f17b1804b1-4ac1932a355mr149860705e9.30.1793528109650;
        Sun, 01 Nov 2026 02:15:09 -0800 (PST)
Received: from cachyos-x8664 ([46.196.224.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abebe33e79sm141697295e9.2.2026.11.01.02.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:15:08 -0800 (PST)
From: =?UTF-8?q?Batuhan=20G=C3=BCvener?= <tuugspeedman@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: =?UTF-8?q?Batuhan=20G=C3=BCvener?= <tuugspeedman@gmail.com>,
	"Lee, Chun-Yi" <jlee@suse.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC] platform/x86: acer-wmi: Add 4-zone RGB keyboard support for Nitro AN515-58
Date: Sun,  1 Nov 2026 13:13:36 +0300
Message-ID: <20261101101337.16852-1-tuugspeedman@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for the 4-zone RGB keyboard backlights found on Acer Nitro
AN515-58 laptops.

The hardware operates via a dual-control mechanism: global hardware
brightness is managed by the EC via RAM offset 0x31 with a range of 0 to 4
(where 0x04 is maximum intensity), while per-zone RGB color control is
handled via WMI Method 6.

Exposing max_brightness = 4 to match the EC hardware level causes the
led-class-multicolor subsystem to scale color components down, restricting
the palette to 5x5x5 (125) total color combinations. Keeping max_brightness
at 255 allows fine-grained 8-bit per-channel control from userspace, though
it creates a dual-control scenario where hardware EC brightness and
userspace multicolor brightness operate concurrently (e.g. EC brightness at
4 while userspace intensity is 0).

This implementation builds upon initial findings and reverse-engineering
efforts by Dirga Yuza and open-source community driver implementations.

Link: https://lore.kernel.org/r/20260503062131.158944-1-dirgayuza123@gmail.com/
Link: https://github.com/0x7375646F/Linuwu-Sense
Link: https://github.com/JafarAkhondali/acer-predator-turbo-and-rgb-keyboard-linux-module

Signed-off-by: Batuhan Güvener <tuugspeedman@gmail.com>
---
 drivers/platform/x86/Kconfig    |   1 +
 drivers/platform/x86/acer-wmi.c | 357 +++++++++++++++++++++++++-------
 2 files changed, 288 insertions(+), 70 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 9ce384e04..7428ada5e 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -168,6 +168,7 @@ config ACER_WMI
 	select INPUT_SPARSEKMAP
 	select LEDS_CLASS
 	select NEW_LEDS
+	select LEDS_CLASS_MULTICOLOR
 	select ACPI_PLATFORM_PROFILE
 	help
 	  This is a driver for newer Acer (and Wistron) laptops. It adds
diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 3a018fdf5..2a45a1cb2 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -20,6 +20,7 @@
 #include <linux/fixp-arith.h>
 #include <linux/backlight.h>
 #include <linux/leds.h>
+#include <linux/led-class-multicolor.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
 #include <linux/acpi.h>
@@ -36,6 +37,9 @@
 #include <linux/unaligned.h>
 #include <linux/bitfield.h>
 #include <linux/bitmap.h>
+#include <linux/bits.h>
+#include <linux/container_of.h>
+#include <linux/mutex.h>
 
 MODULE_AUTHOR("Carlos Corbacho");
 MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
@@ -76,6 +80,39 @@ MODULE_LICENSE("GPL");
 #define ACER_WMID_GET_GAMING_FAN_SPEED_METHODID 17
 #define ACER_WMID_SET_GAMING_MISC_SETTING_METHODID 22
 #define ACER_WMID_GET_GAMING_MISC_SETTING_METHODID 23
+#define WMID_GUID4 "7A4DDFE7-5B5D-40B4-8595-4408E0CC7F56"
+#define ACER_WMID_SET_GAMING_STATIC_LED_METHODID 6
+#define ACER_WMID_SET_GAMING_DYNAMIC_LED_METHODID 5
+#define ACER_WMID_SET_GAMINGKBBL_METHODID 20
+
+/*
+ * Gaming keyboard backlight enable command payload:
+ * Bit 3: Controller enable flag
+ * Bits [43:40]: Target 4-zone keyboard backlight interface
+ */
+#define ACER_GAMING_LED_KBBL_ENABLE	(BIT_ULL(3) | (15ULL << 40))
+
+/*
+ * Method 6 Gaming Static LED payload format:
+ * Bits [23:16]: Red intensity
+ * Bits [15:8]:  Green intensity
+ * Bits [7:0]:   Blue intensity
+ */
+#define ACER_GAMING_STATIC_LED_RED_MASK   GENMASK(23, 16)
+#define ACER_GAMING_STATIC_LED_GREEN_MASK GENMASK(15, 8)
+#define ACER_GAMING_STATIC_LED_BLUE_MASK  GENMASK(7, 0)
+
+/* 4-Zone RGB Keyboard EC RAM Offsets */
+#define ACER_EC_ZONE_COLOR_BASE_ADDR       0x3C
+
+/* 4-Zone RGB Keyboard Protocol Constants */
+#define ACER_KBD_STATIC_PREAMBLE_BRIGHTNESS 100
+#define ACER_KBD_RGB_MAX_INTENSITY         255
+#define ACER_KBD_NUM_ZONES                 4
+#define ACER_KBD_NUM_COLOR_CHANNELS        3
+
+/* Keyboard Backlight Modes */
+#define ACER_KBD_MODE_STATIC               0
 
 #define ACER_GAMING_FAN_BEHAVIOR_CPU BIT(0)
 #define ACER_GAMING_FAN_BEHAVIOR_GPU BIT(3)
@@ -389,6 +426,131 @@ struct wmi_interface {
 /* The static interface pointer, points to the currently detected interface */
 static struct wmi_interface *interface;
 
+/*Defining payload packages, zone information and general LED protocols */
+static acpi_status WMI_gaming_execute_u64(u32 method_id, u64 in, u64 *out);
+
+struct led_information {
+	struct led_classdev_mc led_general;
+	struct mc_subled led_colors[3];
+	struct rgb_wmi *parent;
+	u8 zone_id;
+	u8 current_brightness;
+};
+
+struct rgb_wmi {
+	struct mutex led_lock; /* making sure EC receives single command at a time */
+	struct led_information zones[4];
+};
+
+static int acer_kbd_set_static_preamble(u8 ec_brightness)
+{
+	u8 r = ACER_KBD_RGB_MAX_INTENSITY;
+	u8 g = ACER_KBD_RGB_MAX_INTENSITY;
+	u8 b = ACER_KBD_RGB_MAX_INTENSITY;
+
+	ec_read(ACER_EC_ZONE_COLOR_BASE_ADDR, &r);
+	ec_read(ACER_EC_ZONE_COLOR_BASE_ADDR + 1, &g);
+	ec_read(ACER_EC_ZONE_COLOR_BASE_ADDR + 2, &b);
+
+	u8 gm_input[16] = {
+		ACER_KBD_MODE_STATIC,   /* mode = static */
+		0,                      /* speed */
+		ec_brightness,          /* brightness, 0-100 */
+		0,                      /* reserved */
+		0,                      /* direction */
+		r, g, b,                /* color readings from EC */
+		3, 1, 0, 0, 0, 0, 0, 0
+	};
+	struct acpi_buffer input = { .length = sizeof(gm_input), .pointer = gm_input };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	acpi_status status;
+	u64 resp = 0;
+
+	status = wmi_evaluate_method(WMID_GUID4, 0,
+				     ACER_WMID_SET_GAMINGKBBL_METHODID,
+				     &input, &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	obj = output.pointer;
+	if (obj && obj->type == ACPI_TYPE_BUFFER) {
+		if (obj->buffer.length >= 8)
+			resp = get_unaligned_le64(obj->buffer.pointer);
+		else if (obj->buffer.length >= 4)
+			resp = get_unaligned_le32(obj->buffer.pointer);
+		else if (obj->buffer.length >= 1)
+			resp = ((u8 *)obj->buffer.pointer)[0];
+	}
+
+	kfree(obj);
+
+	return resp ? -EIO : 0;
+}
+
+static int send_zone_color(u8 zone_bit, u8 r, u8 g, u8 b)
+{
+	acpi_status status;
+	u64 resp = 0;
+	u64 payload;
+	u32 rgb;
+
+	rgb = FIELD_PREP(ACER_GAMING_STATIC_LED_RED_MASK, r) |
+	      FIELD_PREP(ACER_GAMING_STATIC_LED_GREEN_MASK, g) |
+	      FIELD_PREP(ACER_GAMING_STATIC_LED_BLUE_MASK, b);
+
+	payload = (u64)cpu_to_be32(rgb) | zone_bit;
+
+	status = WMI_gaming_execute_u64(ACER_WMID_SET_GAMING_STATIC_LED_METHODID,
+					payload, &resp);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return resp ? -EIO : 0;
+}
+
+static enum led_brightness rgb_get(struct led_classdev *led_cdev)
+{
+	struct led_classdev_mc *general_mcolor = lcdev_to_mccdev(led_cdev);
+	struct led_information *led_info = container_of(general_mcolor,
+							struct led_information,
+							led_general);
+	return led_info->current_brightness;
+}
+
+static int rgb_set(struct led_classdev *led_cdev, enum led_brightness brightness)
+{
+	struct led_classdev_mc *general_mcolor = lcdev_to_mccdev(led_cdev);
+	struct led_information *led_info = container_of(general_mcolor,
+							struct led_information,
+							led_general);
+	struct rgb_wmi *data = led_info->parent;
+	u8 r, g, b;
+	int ret;
+
+	mutex_lock(&data->led_lock);
+
+	if (brightness == 0) {
+		r = 0;
+		g = 0;
+		b = 0;
+	} else {
+		led_mc_calc_color_components(general_mcolor, brightness);
+		r = led_info->led_colors[0].brightness;
+		g = led_info->led_colors[1].brightness;
+		b = led_info->led_colors[2].brightness;
+	}
+
+	ret = send_zone_color((u8)led_info->zone_id, r, g, b);
+
+	if (!ret) {
+		led_info->current_brightness = brightness;
+		led_cdev->brightness = brightness;
+	}
+
+	mutex_unlock(&data->led_lock);
+	return ret;
+}
 /*
  * Embedded Controller quirks
  * Some laptops require us to directly access the EC to either enable or query
@@ -400,16 +562,98 @@ struct quirk_entry {
 	u8 mailled;
 	s8 brightness;
 	u8 bluetooth;
-	bool turbo;
+	u8 turbo;
 	u8 cpu_fans;
 	u8 gpu_fans;
-	bool hwmon;
-	bool platform_profile;
-	bool pwm;
+	u8 predator_v4;
+	u8 pwm;
+	u8 kbl_four_zone;
 };
 
 static struct quirk_entry *quirks;
 
+static int acer_kbd_rgb_init(struct platform_device *device, struct rgb_wmi *rgb_data)
+{
+	static const char * const zone_names[] = {
+		"acer-wmi:rgb:kbd_backlight-left",
+		"acer-wmi:rgb:kbd_backlight-center-left",
+		"acer-wmi:rgb:kbd_backlight-center-right",
+		"acer-wmi:rgb:kbd_backlight-right",
+	};
+	u64 gaming_sysinfo;
+	acpi_status status;
+	int ret, i;
+
+	if (!quirks || !quirks->kbl_four_zone)
+		return -ENODEV;
+
+	status = WMI_gaming_execute_u64(ACER_WMID_GET_GAMING_SYS_INFO_METHODID, 0, &gaming_sysinfo);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	status = WMI_gaming_execute_u64(ACER_WMID_SET_GAMING_LED_METHODID,
+					ACER_GAMING_LED_KBBL_ENABLE, NULL);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	ret = acer_kbd_set_static_preamble(ACER_KBD_STATIC_PREAMBLE_BRIGHTNESS);
+	if (ret)
+		pr_warn("Failed to set static preamble on init: %d\n", ret);
+
+	mutex_init(&rgb_data->led_lock);
+
+	for (i = 0; i < ACER_KBD_NUM_ZONES; i++) {
+		struct led_information *zone = &rgb_data->zones[i];
+		u8 r = 0, g = 0, b = 0;
+		u8 max_val;
+		u8 start_offset = ACER_EC_ZONE_COLOR_BASE_ADDR + (i * ACER_KBD_NUM_COLOR_CHANNELS);
+
+		zone->zone_id = BIT(i);
+		zone->parent  = rgb_data;
+
+		if (ec_read(start_offset, &r) != 0 ||
+		    ec_read(start_offset + 1, &g) != 0 ||
+		    ec_read(start_offset + 2, &b) != 0) {
+			r = ACER_KBD_RGB_MAX_INTENSITY;
+			g = ACER_KBD_RGB_MAX_INTENSITY;
+			b = ACER_KBD_RGB_MAX_INTENSITY;
+		}
+
+		max_val = max3(r, g, b);
+
+		if (max_val == 0) {
+			zone->led_colors[0].intensity = ACER_KBD_RGB_MAX_INTENSITY;
+			zone->led_colors[1].intensity = ACER_KBD_RGB_MAX_INTENSITY;
+			zone->led_colors[2].intensity = ACER_KBD_RGB_MAX_INTENSITY;
+			zone->current_brightness = 0;
+		} else {
+			zone->led_colors[0].intensity = (r * ACER_KBD_RGB_MAX_INTENSITY) / max_val;
+			zone->led_colors[1].intensity = (g * ACER_KBD_RGB_MAX_INTENSITY) / max_val;
+			zone->led_colors[2].intensity = (b * ACER_KBD_RGB_MAX_INTENSITY) / max_val;
+			zone->current_brightness = max_val;
+		}
+
+		zone->led_colors[0].color_index = LED_COLOR_ID_RED;
+		zone->led_colors[1].color_index = LED_COLOR_ID_GREEN;
+		zone->led_colors[2].color_index = LED_COLOR_ID_BLUE;
+
+		zone->led_general.subled_info = zone->led_colors;
+		zone->led_general.num_colors  = ACER_KBD_NUM_COLOR_CHANNELS;
+
+		zone->led_general.led_cdev.name = zone_names[i];
+		zone->led_general.led_cdev.max_brightness = ACER_KBD_RGB_MAX_INTENSITY;
+		zone->led_general.led_cdev.brightness = zone->current_brightness;
+		zone->led_general.led_cdev.brightness_set_blocking = rgb_set;
+		zone->led_general.led_cdev.brightness_get = rgb_get; /* GET eklendi */
+		zone->led_general.led_cdev.flags = LED_RETAIN_AT_SHUTDOWN;
+
+		ret = devm_led_classdev_multicolor_register(&device->dev,
+							    &zone->led_general);
+		if (ret)
+			return ret;
+	}
+		return 0;
+}
 static void __init set_quirks(void)
 {
 	if (quirks->mailled)
@@ -422,11 +666,9 @@ static void __init set_quirks(void)
 		interface->capability |= ACER_CAP_TURBO_OC | ACER_CAP_TURBO_LED
 					 | ACER_CAP_TURBO_FAN;
 
-	if (quirks->hwmon)
-		interface->capability |= ACER_CAP_HWMON;
-
-	if (quirks->platform_profile)
-		interface->capability |= ACER_CAP_PLATFORM_PROFILE;
+	if (quirks->predator_v4)
+		interface->capability |= ACER_CAP_PLATFORM_PROFILE |
+					 ACER_CAP_HWMON;
 
 	if (quirks->pwm)
 		interface->capability |= ACER_CAP_PWM;
@@ -454,55 +696,42 @@ static struct quirk_entry quirk_acer_aspire_1520 = {
 	.brightness = -1,
 };
 
-static struct quirk_entry quirk_acer_aspire_a315_58g = {
-	.hwmon = true,
-};
-
 static struct quirk_entry quirk_acer_travelmate_2490 = {
 	.mailled = 1,
 };
 
 static struct quirk_entry quirk_acer_nitro_an515_58 = {
-	.hwmon = true,
-	.platform_profile = true,
-	.pwm = true,
-};
-
-static struct quirk_entry quirk_acer_predator_ph315_53 = {
-	.turbo = true,
+	.predator_v4 = 1,
+	.pwm = 1,
 	.cpu_fans = 1,
 	.gpu_fans = 1,
+	.kbl_four_zone = 1,
 };
 
-static struct quirk_entry quirk_acer_nitro_anv15_51 = {
+static struct quirk_entry quirk_acer_predator_ph315_53 = {
+	.turbo = 1,
 	.cpu_fans = 1,
 	.gpu_fans = 1,
-	.hwmon = true,
-	.platform_profile = true,
-	.pwm = true,
 };
 
 static struct quirk_entry quirk_acer_predator_ph16_72 = {
-	.turbo = true,
+	.turbo = 1,
 	.cpu_fans = 1,
 	.gpu_fans = 1,
-	.hwmon = true,
-	.platform_profile = true,
-	.pwm = true,
+	.predator_v4 = 1,
+	.pwm = 1,
 };
 
 static struct quirk_entry quirk_acer_predator_pt14_51 = {
-	.turbo = true,
+	.turbo = 1,
 	.cpu_fans = 1,
 	.gpu_fans = 1,
-	.hwmon = true,
-	.platform_profile = true,
-	.pwm = true,
+	.predator_v4 = 1,
+	.pwm = 1,
 };
 
 static struct quirk_entry quirk_acer_predator_v4 = {
-	.hwmon = true,
-	.platform_profile = true,
+	.predator_v4 = 1,
 };
 
 /* This AMW0 laptop has no bluetooth */
@@ -654,15 +883,6 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_travelmate_2490,
 	},
-	{
-		.callback = dmi_matched,
-		.ident = "Acer Aspire A315-58G",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-58G"),
-		},
-		.driver_data = &quirk_acer_aspire_a315_58g,
-	},
 	{
 		.callback = dmi_matched,
 		.ident = "Acer TravelMate 2490",
@@ -681,15 +901,6 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_travelmate_2490,
 	},
-	{
-		.callback = dmi_matched,
-		.ident = "Acer Nitro AN16-41",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN16-41"),
-		},
-		.driver_data = &quirk_acer_nitro_an515_58,
-	},
 	{
 		.callback = dmi_matched,
 		.ident = "Acer Nitro AN515-58",
@@ -699,15 +910,6 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_nitro_an515_58,
 	},
-	{
-		.callback = dmi_matched,
-		.ident = "Acer Nitro ANV15-51",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro ANV15-51"),
-		},
-		.driver_data = &quirk_acer_nitro_anv15_51,
-	},
 	{
 		.callback = dmi_matched,
 		.ident = "Acer Predator PH315-53",
@@ -885,6 +1087,7 @@ static const struct dmi_system_id non_acer_quirks[] __initconst = {
 };
 
 static struct device *platform_profile_device;
+static bool platform_profile_support;
 
 /*
  * The profile used before turbo mode. This variable is needed for
@@ -2239,11 +2442,13 @@ static const struct platform_profile_ops acer_predator_v4_platform_profile_ops =
 
 static int acer_platform_profile_setup(struct platform_device *device)
 {
-	if (quirks->platform_profile) {
+	if (quirks->predator_v4) {
 		platform_profile_device = devm_platform_profile_register(
 			&device->dev, "acer-wmi", NULL, &acer_predator_v4_platform_profile_ops);
 		if (IS_ERR(platform_profile_device))
 			return PTR_ERR(platform_profile_device);
+
+		platform_profile_support = true;
 	}
 	return 0;
 }
@@ -2254,7 +2459,7 @@ static int acer_thermal_profile_change(void)
 	 * This mode key will either cycle through each mode or toggle the
 	 * most performant profile.
 	 */
-	if (quirks->platform_profile) {
+	if (quirks->predator_v4) {
 		u8 current_tp;
 		int err, tp;
 
@@ -2573,13 +2778,8 @@ static void acer_wmi_notify(union acpi_object *obj, void *context)
 		acer_kbd_dock_event(&return_value);
 		break;
 	case WMID_GAMING_TURBO_KEY_EVENT:
-		if (return_value.key_num == 0x4) {
-			/* Models without a turbo button report their mode key as 0x4 */
-			if (has_cap(ACER_CAP_TURBO_LED))
-				acer_toggle_turbo();
-			else if (has_cap(ACER_CAP_PLATFORM_PROFILE))
-				acer_thermal_profile_change();
-		}
+		if (return_value.key_num == 0x4)
+			acer_toggle_turbo();
 		if (return_value.key_num == 0x5 && has_cap(ACER_CAP_PLATFORM_PROFILE))
 			acer_thermal_profile_change();
 		break;
@@ -2815,6 +3015,8 @@ static int acer_wmi_hwmon_init(void);
 /*
  * Platform device
  */
+static struct rgb_wmi acer_rgb_data;
+
 static int acer_platform_probe(struct platform_device *device)
 {
 	int err;
@@ -2847,6 +3049,13 @@ static int acer_platform_probe(struct platform_device *device)
 			goto error_hwmon;
 	}
 
+	/*Defining 4 zone RGB quirk.*/
+	if (quirks->kbl_four_zone) {
+		err = acer_kbd_rgb_init(device, &acer_rgb_data);
+		if (err)
+			pr_warn("Failed to initialize 4-zone RGB keyboard: %d\n", err);
+	}
+
 	return 0;
 
 error_hwmon:
@@ -2898,6 +3107,7 @@ static int acer_suspend(struct device *dev)
 static int acer_resume(struct device *dev)
 {
 	struct acer_data *data = &interface->data;
+	int ret;
 
 	if (!data)
 		return -ENOMEM;
@@ -2911,8 +3121,15 @@ static int acer_resume(struct device *dev)
 	if (acer_wmi_accel_dev)
 		acer_gsensor_init();
 
+	/* Ensuring keyboard is at static mode after resuming from sleep. */
+	if (quirks && quirks->kbl_four_zone) {
+		ret = acer_kbd_set_static_preamble(100);
+		if (ret)
+			pr_warn("Failed to restore keyboard static mode on resume: %d\n", ret);
+	}
 	return 0;
 }
+
 #else
 #define acer_suspend	NULL
 #define acer_resume	NULL
-- 
2.56.0

