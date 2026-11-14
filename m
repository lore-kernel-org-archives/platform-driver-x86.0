Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794649800;
	b=lQFldId42LQEk+bN+SKWOdy4RmDqUV83g1/hD085RevhzAk6B89BmErSk0fY2OPUm37z
	 aqaYtf6GFkLWiBJbrpAsuXXAk/EJSi951Egh68wZYfbsTB4fF06BzXB1A+f6YxwdlTTb3
	 tYYHn3k6mLymllwkaz2LruX94fcFlTZRuuY7IvBwIMTSGtN7tVHuqpnijm9As4E/Eo1pz
	 M1oiq/ckfXPKpxnelWJy+cjPmFjgsqn7Bw0a83s2i6vYCfgiTDTZduACLE2ynTdZRg272
	 PJwKn7owdykh3iO8DUfZKeZzdPO7fq+AWBytM6xDISPV0Kijf4ie8nXMQ9qWioGv/7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794649800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=vFwNPlEvu7ATJx2EG10LnH49Nl5k3kRFQXgy8RBgj+w=;
	b=H3B7ci143w57DG2S9DmDVoBiWOtpELoTxgaGEIENRDrgMCrq8TnRVQWxFpEkbkNzzajY
	 eXWfWRqgJqLsTXG5+dn16Whlf4wOKOfGJy6E6/P+CXBU8coldypLgPKqbQ4HI1o0etT+2
	 sYx22UrJ/Cew+FKKgPGUafMFXGEfRagucruop0t9tIwSY0kaBrKupfM+hqWKqvEuuyuwo
	 +aY4mQaBtrcHCvp9+lV0tzwQ+ZIi6fS7GRPrCU6cbECpzcqgu36oUHi3AUsyN6QtExiOM
	 VgKFR9CJGOG/YOqwARBKJSLgChdM8t2XuNCoP8PX8LagflTNyUbLHtE33QNLf/h6jiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FKtyYQMr;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D355E606A338
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 09:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D355E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FKtyYQMr
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so24976305e9.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 01:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794649797; x=1795254597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vFwNPlEvu7ATJx2EG10LnH49Nl5k3kRFQXgy8RBgj+w=;
        b=FKtyYQMr88dRuaVS24n3JWXoFZvyck1jwLNNw2RJ4HXtbr3Ji7u4ODqcAueVsBOqgr
         gGKfAxqwCcR+RjTIj3ftjAwdeq8+RWgcg2zV5W8gucnn1baMmFK9fDItd2J97xTMI6M7
         A8sowWoWnGyzAccPK60xKdZtegGFdsSquCvnpAxTm5bNRgYR+fp9wfhj95Uz8sbFrvmK
         b2CvLzWMHtnB91mc58GSNkAJb/6fmchE1vUiFkjADCOUJM1O5EQ+v/WNeozTHjWyRKoZ
         v5gryE3UY9ZuCcT+PdxeQ4P4Im8eGC3WLp2JBvudJi6wflOAejr0vHGFUTG9Xt8r9LQv
         qs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794649797; x=1795254597;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vFwNPlEvu7ATJx2EG10LnH49Nl5k3kRFQXgy8RBgj+w=;
        b=OU1yBkXK1AK5Wph43TyYj61T0FzQHxNR+f8fr1jV83kaRgZ7yH3rXtHHv1tu7oAeA7
         O+8iRLcwgkHZMd3PEHfTml0RLnepAulnEJp5F7BiWCd/qLUc41lpAzsk+SgfLMYd1+Nr
         CDmRNjK9nnjeDDc4tra76UiVYoeIOtO8FqNdy5kUzcqBEfa+tzsi88LL/PIoQQAk7oQW
         N5OgAS5xDaRgJZAcGMXSu8UqQJEAnqkiYmU7ahMcQaEHUmIOIxvsSB9BlYPmaQQvZzrG
         BVce20B+s7nqKmteFf9K+NhF+j2QgrbYVpvZP4dpjTfKGTPQNFot9gdHt0nLsa0OrdOJ
         9kXQ==
X-Forwarded-Encrypted: i=1; AL+hErEGwvckavPmWNgA0t3KMR+i0njl9fFz7fAImX0BNlrfAdgA3WuspOynbsWmZ+lDS7n3YWrxPLRRvB95BAW/hfRyjLvy@vger.kernel.org
X-Gm-Message-State: APuU4Z+jAjPbh5b7lTeR4N/IPA4UEXkxR2pzoVH1FRQqOEh9VOtnTrqI
	/OhDjPy6wT9dYse7M5Vtvx8/pSO12dlfSIohIBQx/IVVHFmG+NIyme2V
X-Gm-Gg: AYBFou2xAJ+quPrie2EPIy2k0cmq3VJs/yushFH3CI96NGPJcu/3ucFZNFRXfCficMN
	OPcU7ag0665Fj7asg0/fxlF2Dt9IWGDmXHy6c+gOuU7kgco6KYGb1Jvq14iu8pSak4l37JQBB1Y
	ez+tpDLq1msuCpSMScA2x8OTEDl6PV9Zv3JaiONZvkue1WmVyBLmb1a0OiobCfD4cP8Ki3Tbi9D
	5wZp+JtknxpZ7DLOOrUKBGKGxHN6FQ6H80AKHffZbBlfVuvUPujrppsNYtV3nvfvr+FilGUhRLJ
	BVKiCT3iRXbbrO50oqRAajcy7HEELl+kBPyYPyaHrIh3RmdYyHNN/vbqWX/GbFZ5ohsuMa8EL56
	p156ODrd8Wp+8bTJud0eT91ZiU0InfOvKSQqW8nr7/zBerAEOp5NvqF8hdVgQd66hnvoHmPdWO0
	KqWlkVVlaIu9lHE1tvNpTaJZcmQmDbI3ATfVoyiUy27Y1RLFmMDm17AfB6iMXLrUf6Yr0YlQqI8
	CY/hhrbEjZVleWWueSCwjaB8QDIbe8J7xdOj0rAh+1legUE53j6Pz+CW7Eb5QveAM+oNbud/K3g
	tuh9euTNp49puuzY8ExBZKbQE+CtXdBrLfA=
X-Received: by 2002:a05:600c:1912:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4bb55ad45admr104726075e9.35.1794649797098;
        Sat, 14 Nov 2026 01:49:57 -0800 (PST)
Received: from cachyos-x8664 ([46.196.225.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm139612805e9.11.2026.11.14.01.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:49:56 -0800 (PST)
From: =?UTF-8?q?Batuhan=20G=C3=BCvener?= <tuugspeedman@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: hansg@kernel.org,
	jlee@suse.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	tuugspeedman@gmail.com
Subject: [PATCH v3] platform/x86: acer-wmi: Add 4-zone RGB keyboard support for Nitro AN515-58
Date: Sat, 14 Nov 2026 12:49:34 +0300
Message-ID: <20261114094934.5792-1-tuugspeedman@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <2e931d55-1705-414b-9477-ce7c677d89c9@linux.intel.com>
References: <2e931d55-1705-414b-9477-ce7c677d89c9@linux.intel.com>
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

Additionally, when the system resumes from a shutdown or power cycle
while brightness is set to 0, the hardware initializes with 0
brightness but cannot derive valid multi-intensity values. To ensure
consistent state evaluation, it defaults to max intensity
(255, 255, 255 - white).

This implementation builds upon initial findings and reverse-engineering
efforts by Dirga Yuza and open-source community driver implementations.

Link: https://lore.kernel.org/r/20260503062131.158944-1-dirgayuza123@gmail.com/
Link: https://github.com/0x7375646F/Linuwu-Sense
Link: https://github.com/JafarAkhondali/acer-predator-turbo-and-rgb-keyboard-linux-module

Signed-off-by: Batuhan Güvener <tuugspeedman@gmail.com>

---
Changes since v2:
- Remove redundant comments
- Place new #include headers near alphabetical neighbors
- Replace deprecated wmi_evaluate_method() with WMI_gaming_execute_buf() using __free(kfree)
- Use __packed structs for WMI command payloads
- Switch to guard(mutex), devm_mutex_init(), and FIELD_MAX()
- Use dev_warn() instead of pr_warn()
- Fix indentation and reverse xmas-tree variable ordering

Changes since v1:
- Clear non-English comments
- Rebase onto linux-next
---
 drivers/platform/x86/Kconfig    |   1 +
 drivers/platform/x86/acer-wmi.c | 305 ++++++++++++++++++++++++++++++++
 2 files changed, 306 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 741653432f57..ccb1651992b5 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -169,6 +169,7 @@ config ACER_WMI
 	select LEDS_CLASS
 	select NEW_LEDS
 	select PLATFORM_PROFILE
+	select LEDS_CLASS_MULTICOLOR
 	help
 	  This is a driver for newer Acer (and Wistron) laptops. It adds
 	  wireless radio and bluetooth control, and on some laptops,
diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 3a018fdf5138..4680b99001fa 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -14,11 +14,13 @@
 #include <linux/kernel.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/init.h>
 #include <linux/types.h>
 #include <linux/dmi.h>
 #include <linux/fixp-arith.h>
 #include <linux/backlight.h>
+#include <linux/led-class-multicolor.h>
 #include <linux/leds.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
@@ -36,6 +38,10 @@
 #include <linux/unaligned.h>
 #include <linux/bitfield.h>
 #include <linux/bitmap.h>
+#include <linux/bits.h>
+#include <linux/container_of.h>
+#include <linux/compiler_attributes.h>
+#include <linux/cleanup.h>
 
 MODULE_AUTHOR("Carlos Corbacho");
 MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
@@ -77,6 +83,21 @@ MODULE_LICENSE("GPL");
 #define ACER_WMID_SET_GAMING_MISC_SETTING_METHODID 22
 #define ACER_WMID_GET_GAMING_MISC_SETTING_METHODID 23
 
+#define ACER_WMID_SET_GAMING_STATIC_LED_METHODID 6
+#define ACER_WMID_SET_GAMING_KBD_BL_METHODID 20
+
+#define ACER_GAMING_LED_KBD_BL_ENABLE	BIT_ULL(3)
+#define ACER_GAMING_LED_KBD_BL_INTERFACE_MASK	GENMASK_ULL(43, 40)
+
+#define ACER_EC_KBD_BL_ZONE_COLOR_BASE_ADDR       0x3C
+
+#define ACER_KBD_STATIC_PREAMBLE_BRIGHTNESS 100
+#define ACER_KBD_RGB_MAX_INTENSITY         255
+#define ACER_KBD_NUM_ZONES                 4
+#define ACER_KBD_NUM_COLOR_CHANNELS        3
+
+#define ACER_KBD_MODE_STATIC               0
+
 #define ACER_GAMING_FAN_BEHAVIOR_CPU BIT(0)
 #define ACER_GAMING_FAN_BEHAVIOR_GPU BIT(3)
 
@@ -389,6 +410,136 @@ struct wmi_interface {
 /* The static interface pointer, points to the currently detected interface */
 static struct wmi_interface *interface;
 
+static acpi_status WMI_gaming_execute_u64(u32 method_id, u64 in, u64 *out);
+static int WMI_gaming_execute_buf(u32 method_id, const void *in, size_t in_size, u64 *out);
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
+struct acer_gaming_kbd_bl_input {
+	u8 mode;
+	u8 speed;
+	u8 brightness;
+	u8 reserved;
+	u8 direction;
+	u8 r;
+	u8 g;
+	u8 b;
+	u8 cmd_flags[2];
+	u8 padding[6];
+} __packed;
+
+static int acer_kbd_set_static_preamble(u8 ec_brightness)
+{
+	struct acer_gaming_kbd_bl_input gm_input = {
+		.mode = ACER_KBD_MODE_STATIC,
+		.brightness = ec_brightness,
+		.r = ACER_KBD_RGB_MAX_INTENSITY,
+		.g = ACER_KBD_RGB_MAX_INTENSITY,
+		.b = ACER_KBD_RGB_MAX_INTENSITY,
+		.cmd_flags = { 3, 1 },
+	};
+	u64 resp = 0;
+	int ret;
+
+	if (ec_read(ACER_EC_KBD_BL_ZONE_COLOR_BASE_ADDR, &gm_input.r) ||
+	    ec_read(ACER_EC_KBD_BL_ZONE_COLOR_BASE_ADDR + 1, &gm_input.g) ||
+	    ec_read(ACER_EC_KBD_BL_ZONE_COLOR_BASE_ADDR + 2, &gm_input.b)) {
+		gm_input.r = ACER_KBD_RGB_MAX_INTENSITY;
+		gm_input.g = ACER_KBD_RGB_MAX_INTENSITY;
+		gm_input.b = ACER_KBD_RGB_MAX_INTENSITY;
+	}
+
+	ret = WMI_gaming_execute_buf(ACER_WMID_SET_GAMING_KBD_BL_METHODID,
+				     &gm_input, sizeof(gm_input), &resp);
+	if (ret < 0 || resp)
+		return -EIO;
+
+	return 0;
+}
+
+struct acer_gaming_static_led_input {
+	u8 zone_bit;
+	u8 r;
+	u8 g;
+	u8 b;
+	u32 padding;
+} __packed;
+
+static int send_zone_color(u8 zone_bit, u8 r, u8 g, u8 b)
+{
+	struct acer_gaming_static_led_input input = {
+		.zone_bit = zone_bit,
+		.r = r,
+		.g = g,
+		.b = b,
+	};
+	acpi_status status;
+	u64 resp = 0;
+	u64 payload;
+
+	memcpy(&payload, &input, sizeof(payload));
+
+	status = WMI_gaming_execute_u64(ACER_WMID_SET_GAMING_STATIC_LED_METHODID,
+					payload, &resp);
+	if (ACPI_FAILURE(status) || resp)
+		return -EIO;
+
+	return 0;
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
+	guard(mutex)(&data->led_lock);
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
+	ret = send_zone_color(led_info->zone_id, r, g, b);
+	if (ret)
+		return ret;
+
+	led_info->current_brightness = brightness;
+	led_cdev->brightness = brightness;
+
+	return 0;
+}
+
 /*
  * Embedded Controller quirks
  * Some laptops require us to directly access the EC to either enable or query
@@ -406,10 +557,107 @@ struct quirk_entry {
 	bool hwmon;
 	bool platform_profile;
 	bool pwm;
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
+	acpi_status status;
+	u64 gaming_sysinfo;
+	u64 led_mode;
+	int ret, i;
+
+	if (!quirks || !quirks->kbl_four_zone)
+		return -ENODEV;
+
+	status = WMI_gaming_execute_u64(ACER_WMID_GET_GAMING_SYS_INFO_METHODID,
+					0, &gaming_sysinfo);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	led_mode = ACER_GAMING_LED_KBD_BL_ENABLE |
+		   FIELD_PREP(ACER_GAMING_LED_KBD_BL_INTERFACE_MASK,
+			      FIELD_MAX(ACER_GAMING_LED_KBD_BL_INTERFACE_MASK));
+
+	status = WMI_gaming_execute_u64(ACER_WMID_SET_GAMING_LED_METHODID,
+					led_mode, NULL);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	ret = acer_kbd_set_static_preamble(ACER_KBD_STATIC_PREAMBLE_BRIGHTNESS);
+	if (ret)
+		dev_warn(&device->dev, "Failed to set static preamble on init: %d\n", ret);
+
+	ret = devm_mutex_init(&device->dev, &rgb_data->led_lock);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ACER_KBD_NUM_ZONES; i++) {
+		u8 start_offset = ACER_EC_KBD_BL_ZONE_COLOR_BASE_ADDR +
+				  (i * ACER_KBD_NUM_COLOR_CHANNELS);
+		struct led_information *zone = &rgb_data->zones[i];
+		u8 r = 0, g = 0, b = 0;
+		u8 max_val;
+
+		zone->zone_id = BIT(i);
+		zone->parent = rgb_data;
+
+		if (ec_read(start_offset, &r) != 0 ||
+		    ec_read(start_offset + 1, &g) != 0 ||
+		    ec_read(start_offset + 2, &b) != 0) {
+			dev_warn(&device->dev,
+				 "Failed to read initial color for zone %d, defaulting to white\n",
+				 i);
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
+		zone->led_general.num_colors = ACER_KBD_NUM_COLOR_CHANNELS;
+
+		zone->led_general.led_cdev.name = zone_names[i];
+		zone->led_general.led_cdev.max_brightness = ACER_KBD_RGB_MAX_INTENSITY;
+		zone->led_general.led_cdev.brightness = zone->current_brightness;
+		zone->led_general.led_cdev.brightness_set_blocking = rgb_set;
+		zone->led_general.led_cdev.brightness_get = rgb_get;
+		zone->led_general.led_cdev.flags = LED_RETAIN_AT_SHUTDOWN;
+
+		ret = devm_led_classdev_multicolor_register(&device->dev,
+							    &zone->led_general);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
 static void __init set_quirks(void)
 {
 	if (quirks->mailled)
@@ -466,6 +714,7 @@ static struct quirk_entry quirk_acer_nitro_an515_58 = {
 	.hwmon = true,
 	.platform_profile = true,
 	.pwm = true,
+	.kbl_four_zone = 1,
 };
 
 static struct quirk_entry quirk_acer_predator_ph315_53 = {
@@ -1610,6 +1859,46 @@ WMI_gaming_execute_u64(u32 method_id, u64 in, u64 *out)
 	return status;
 }
 
+static int WMI_gaming_execute_buf(u32 method_id, const void *in, size_t in_size, u64 *out)
+{
+	struct acpi_buffer result = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer input = {
+		.length = in_size,
+		.pointer = (void *)in,
+	};
+	acpi_status status;
+
+	status = wmi_evaluate_method(WMID_GUID4, 0, method_id, &input, &result);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	union acpi_object *obj __free(kfree) = result.pointer;
+
+	if (!out)
+		return 0;
+
+	if (!obj)
+		return -ENOMSG;
+
+	switch (obj->type) {
+	case ACPI_TYPE_INTEGER:
+		*out = obj->integer.value;
+		return 0;
+	case ACPI_TYPE_BUFFER:
+		if (obj->buffer.length >= 8)
+			*out = get_unaligned_le64(obj->buffer.pointer);
+		else if (obj->buffer.length >= 4)
+			*out = get_unaligned_le32(obj->buffer.pointer);
+		else if (obj->buffer.length >= 1)
+			*out = ((u8 *)obj->buffer.pointer)[0];
+		else
+			return -ENOMSG;
+		return 0;
+	default:
+		return -ENOMSG;
+	}
+}
+
 static int WMI_gaming_execute_u32_u64(u32 method_id, u32 in, u64 *out)
 {
 	struct acpi_buffer result = { ACPI_ALLOCATE_BUFFER, NULL };
@@ -2815,6 +3104,8 @@ static int acer_wmi_hwmon_init(void);
 /*
  * Platform device
  */
+static struct rgb_wmi acer_rgb_data;
+
 static int acer_platform_probe(struct platform_device *device)
 {
 	int err;
@@ -2846,6 +3137,12 @@ static int acer_platform_probe(struct platform_device *device)
 		if (err)
 			goto error_hwmon;
 	}
+	if (quirks->kbl_four_zone) {
+		err = acer_kbd_rgb_init(device, &acer_rgb_data);
+		if (err)
+			dev_warn(&device->dev, "Failed to initialize 4-zone RGB keyboard: %d\n",
+				 err);
+	}
 
 	return 0;
 
@@ -2898,6 +3195,7 @@ static int acer_suspend(struct device *dev)
 static int acer_resume(struct device *dev)
 {
 	struct acer_data *data = &interface->data;
+	int ret;
 
 	if (!data)
 		return -ENOMEM;
@@ -2911,6 +3209,13 @@ static int acer_resume(struct device *dev)
 	if (acer_wmi_accel_dev)
 		acer_gsensor_init();
 
+	if (quirks && quirks->kbl_four_zone) {
+		ret = acer_kbd_set_static_preamble(ACER_KBD_STATIC_PREAMBLE_BRIGHTNESS);
+		if (ret)
+			dev_warn(dev, "Failed to restore keyboard static mode on resume: %d\n",
+				 ret);
+	}
+
 	return 0;
 }
 #else
-- 
2.56.1

