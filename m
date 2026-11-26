Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686473;
	b=FascYBiPIi2IrfMojzwHgjgRPRDBx0Gr6nUTcJRjC9fQrRMIY0+9acEjdR/pMzObeVof
	 Q09j5go8uHK3fvzQOVTRz5sm7UHKaoejBHLr7Q4X5Yez59p9RnXpbnz+FKJyAdZa3OBHv
	 +bHRqDuDEmvtWtVihGL4clYUMnfzzakGfc8gS+RSCLgQAZPnOGtpkokaj0nEB4aqhZwKE
	 9YfJZp5th6HOtEnFn+EWOV5nFGxp97KL41weqnIfhHc2Rotb9DdNmCQ0154lApRGUlSAG
	 4zhf/WPWR9daD4MyAT322UaJ16oTn3reInRJDU9AIIsrb6in3CEr5ZDiEclrc0pt5Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ifrp78woKYwXYCzKGgLa7zOZ6PG+dwpBd04vYiU5lZU=;
	b=ME+FeEtTRm3kcynkBaj1HPmI/SnH4BE2t9vUxOK2ETKsSXQYGPGAoxoIB6H1NuPWOLay
	 rAccNQjaU/9igYBpHznH9Bskro7fzeCkqnRHX+Nju+eVGsgfHq30iUCKXARPO7vXNYpaq
	 0APZwzSqCuDXlmoLfpJjcRTyi6a4lu5+WjKI/23V74gh2te+ubNrV00MXZzAhwEK6hThB
	 qr09jWT95pUnzxTh1gC5iplX9pWCGaxjmIUeQmSJfsxgj50fLMnpGxExoC0M22Dpvu5ar
	 g5LSZafzWtJLH09jXJV9u6ZD8HbDZKNVD0lGKhhW5e8GI4DTGqAPEYMR/5yYuvJkm5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="diChqe/k";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA27606A329
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 09:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECA27606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=diChqe/k
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4aa5833c263so6514155f8f.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 01:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795686471; x=1796291271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ifrp78woKYwXYCzKGgLa7zOZ6PG+dwpBd04vYiU5lZU=;
        b=diChqe/kLl1nkTZaqh88vKj0hNtQ89Iji/QQDxhFT7rmuIaYBCzBeWLkdux6Tc+8a8
         9PdoP+vz88eclV1+B07ZYtYECd69nqe3eavlDJLbh5ovfYdQc1aCCTYSq26iYWMD5EGG
         7t1rfih8lDQqDAN0XOum7FGkzatDXfmtDZFLKdqzEM8/USPCOmw4AxrdlTBX/6HuyPqU
         KnrQpNj0PtJeXPgxPWwSjkbmFs8zJKwfRFCK7MgOAVbFT9ccxF1mIvyjfUAdngbwUIG/
         FzLahpeOsDKEX0YCOy4Dp5SncttL6ZoaCQg3IcS32kSHA91lZyNIs61W9uIfVVk2Ru/g
         ul4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686471; x=1796291271;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ifrp78woKYwXYCzKGgLa7zOZ6PG+dwpBd04vYiU5lZU=;
        b=z7mtcCnIzn32Ru/F+QEr7LPxMHY1RSAd/48Gx+46E9isZfZc9I0Nq1HP2FXtzHkZ15
         ZOj60/oFz3jKYauiVUoW+JYclxbqy7MnKSoYXnyWWHdDHAFUQ5BZhFrGNKSjKPBi84vK
         IRPYEa+vZ9Nsuf2NramEFYzRRew0ZET2Z8ugBdH8yGVBZlJRUmnI8Zyyv7y1unax4Yyu
         /JRFeTuHxwVAG2q+ZhRt3t+USBZhYp0DeiPgPnVwwvfco9KhjtKAeZHOmdQpWWhPbLyW
         Y62GdgGvv7PAl9b1qc2sGKXdIGYOArnEnGhA+c5iFFqashsGSsttE8oCXqWhSkc8/Ga6
         jnlQ==
X-Forwarded-Encrypted: i=1; AL+hErHi1TFNEkbp6wnsnrNR/z8uWkV0FcCkmsxqP1BcKzyl9CZhD7wYY8ZHU1jJ4JF4Nj+qa4PZ7049hhdo9Wefx3bV8ZcY@vger.kernel.org
X-Gm-Message-State: APuU4Z/sc4fergNkPEl26VDmFgpRkXtPWnF3UNPPLPIR3pb4ZzSZXt/6
	Oobv+veOWOSipwTZMBnFMN/+dU2Na8Ot/wLDEctStUIFbEXZ5bNub9wA9OB4UE3t
X-Gm-Gg: AZFdTZeyoDGpGXLADj7q3AwadiSt2VrGL86rd8y9w3M+mlO8gQnWVwpyunRldk0xiFV
	meiLHQSVjotL/e6JPTKEu4rki8bQvSYp1ao0+HWknahomSGwtjrkBfVC9G2qxGONorvFXDaHZzF
	ua+xjTb7mbk6dXVKzaGX+vrIzl+F3BxLm9Xx7a0c3iJ0FLhCsliDaU0pbbHqrJvEBxnmkG81jW5
	IBZbbQzwhHzmtxwTpOLBKRQymcxHDRpi/kIf5qLvLxdvHClKhU1bTs/UeUE/0DMY9Q0/obYJNLY
	2FLLYjEUbtZv1aQK1jYpNj1CdJSk3XNjYbNPBt0BL8DtD/qZdO31lwwfEzQiGE6FvixhIZs79UN
	b93l2brbbWA+oNb0SvvIsh3PxnjoRwaW+wpMFxNuzQ4GeyOZVde4JqRJKsMnImJ6fvBN7mwONsC
	Jh3xWhBgLq+AX626JJEFz46H1y4n4pl6D6gdMdAoeJ1oSoRy+dCkMhBbkX3aOvP+flo68ioGs7p
	8A9Qbip6MW354esaWN2a0fAMNOaOo+yTsxe/KwZoA2kC5YmjDE6Z3on7Bn/SGzXDpmzXwVe7Y+Z
	hUGZorLE3kBSfuH+VlGJ7L8=
X-Received: by 2002:a05:6000:4a15:b0:49f:eb4b:faa3 with SMTP id ffacd0b85a97d-4abb2168f46mr39027846f8f.9.1795686471144;
        Thu, 26 Nov 2026 01:47:51 -0800 (PST)
Received: from acer ([46.196.225.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm30718938f8f.15.2026.11.26.01.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:47:50 -0800 (PST)
From: Batuhan <tuugspeedman@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Lee, Chun-Yi" <jlee@suse.com>
Cc: =?UTF-8?q?Batuhan=20G=C3=BCvener?= <tuugspeedman@gmail.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4] platform/x86: acer-wmi: Add 4-zone RGB keyboard support for Nitro AN515-58
Date: Thu, 26 Nov 2026 12:47:01 +0300
Message-ID: <20261126094703.6690-1-tuugspeedman@gmail.com>
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

From: Batuhan Güvener <tuugspeedman@gmail.com>

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

Since the Nitro AN515-58 SKU ships with both 4-zone RGB
and single-color red backlight options, add SMBIOS Type 0xAC checks
to ensure non-functional LED devices are not registered
on single-color models.

This implementation builds upon initial findings and reverse-engineering
efforts by Dirga Yuza and open-source community driver implementations.

Link: https://lore.kernel.org/r/20260503062131.158944-1-dirgayuza123@gmail.com/
Link: https://github.com/0x7375646F/Linuwu-Sense
Link: https://github.com/JafarAkhondali/acer-predator-turbo-and-rgb-keyboard-linux-module
Link: https://github.com/archivesteak/opensense

Signed-off-by: Batuhan Güvener <tuugspeedman@gmail.com>

---
The SMBIOS Type 0xAC parsing logic (type_ac_dmi_decode()) was written
with assistance from LLM, and was reviewed and verified against raw
DMI dumps from target hardware to ensure accurate capability detection.

Changes since v3:
- Instead of masking wmi_evaluate_method() with a helper, migrated to newer wmidev approach
- Added RGB capability checking on top of DMI checks based on archivesteak's findings
- Fix spacing on newly added #define lines
- Rename led_information struct to be more informative acer_kbd_zone_led
- Switch kbl_four_zone quirk into a boolean and rename it into kbd_bl_four_zone
- Separate AN16-41's quirks to set target hardware cleanly
- Initial zone colors are now read through WMI method 7 and not directly from EC
- Rebased onto next-20261125

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
 drivers/platform/x86/acer-wmi.c | 410 +++++++++++++++++++++++++++++++-
 2 files changed, 410 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 7daef6ad5dbe..a200fd3d5308 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -178,6 +178,7 @@ config ACER_WMI
 	select LEDS_CLASS
 	select NEW_LEDS
 	select PLATFORM_PROFILE
+	select LEDS_CLASS_MULTICOLOR
 	help
 	  This is a driver for newer Acer (and Wistron) laptops. It adds
 	  wireless radio and bluetooth control, and on some laptops,
diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 60028fe9f3e6..11c33e9b1346 100644
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
@@ -26,6 +28,7 @@
 #include <linux/i8042.h>
 #include <linux/rfkill.h>
 #include <linux/workqueue.h>
+#include <linux/wmi.h>
 #include <linux/debugfs.h>
 #include <linux/slab.h>
 #include <linux/input.h>
@@ -36,6 +39,10 @@
 #include <linux/unaligned.h>
 #include <linux/bitfield.h>
 #include <linux/bitmap.h>
+#include <linux/bits.h>
+#include <linux/container_of.h>
+#include <linux/compiler_attributes.h>
+#include <linux/cleanup.h>
 
 MODULE_AUTHOR("Carlos Corbacho");
 MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
@@ -77,6 +84,29 @@ MODULE_LICENSE("GPL");
 #define ACER_WMID_SET_GAMING_MISC_SETTING_METHODID 22
 #define ACER_WMID_GET_GAMING_MISC_SETTING_METHODID 23
 
+#define ACER_WMID_SET_GAMING_STATIC_LED_METHODID 6
+#define ACER_WMID_SET_GAMING_KBD_BL_METHODID 20
+
+#define ACER_GAMING_LED_KBD_BL_ENABLE	BIT_ULL(3)
+#define ACER_GAMING_LED_KBD_BL_INTERFACE_MASK	GENMASK_ULL(43, 40)
+
+#define ACER_KBD_STATIC_PREAMBLE_BRIGHTNESS	100
+#define ACER_KBD_RGB_MAX_INTENSITY		255
+#define ACER_KBD_NUM_ZONES			4
+#define ACER_KBD_NUM_COLOR_CHANNELS		3
+
+#define ACER_KBD_MODE_STATIC			0
+#define ACER_SMBIOS_TYPE_KBD_INFO		0xAC
+#define ACER_SMBIOS_KBD_TYPE_FOUR_ZONE		4
+#define ACER_SMBIOS_KBD_COLOR_RGB		2
+#define ACER_SMBIOS_KBD_RECORD_TYPE		0x08
+#define ACER_SMBIOS_KBD_RECORD_COLOR		0x0A
+
+#define ACER_WMID_GET_GAMING_STATIC_LED_METHODID 7
+#define ACER_KBD_COLOR_R_MASK GENMASK_ULL(15, 8)
+#define ACER_KBD_COLOR_G_MASK GENMASK_ULL(23, 16)
+#define ACER_KBD_COLOR_B_MASK GENMASK_ULL(31, 24)
+
 #define ACER_GAMING_FAN_BEHAVIOR_CPU BIT(0)
 #define ACER_GAMING_FAN_BEHAVIOR_GPU BIT(3)
 
@@ -389,6 +419,170 @@ struct wmi_interface {
 /* The static interface pointer, points to the currently detected interface */
 static struct wmi_interface *interface;
 
+struct acer_kbd_zone_led {
+	struct led_classdev_mc led_general;
+	struct mc_subled led_colors[3];
+	struct rgb_wmi *parent;
+	u8 zone_id;
+	u8 current_brightness;
+};
+
+struct rgb_wmi {
+	struct wmi_device *wdev;
+	struct mutex led_lock; /* making sure EC receives single command at a time */
+	struct acer_kbd_zone_led zones[ACER_KBD_NUM_ZONES];
+};
+
+static int acer_gaming_wmi_eval_buf(struct wmi_device *wdev, u32 method_id,
+				    const void *in, size_t in_size, u64 *out)
+{
+	struct acpi_buffer result = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer input = {
+		.length = in_size,
+		.pointer = (void *)in,
+	};
+	acpi_status status;
+
+	status = wmidev_evaluate_method(wdev, 0, method_id, &input, &result);
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
+static int acer_gaming_wmi_eval_u64(struct wmi_device *wdev, u32 method_id,
+				    u64 in, u64 *out)
+{
+	return acer_gaming_wmi_eval_buf(wdev, method_id, &in, sizeof(in), out);
+}
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
+static int acer_kbd_set_static_preamble(struct wmi_device *wdev, u8 ec_brightness)
+{
+	struct acer_gaming_kbd_bl_input gm_input = {
+		.mode = ACER_KBD_MODE_STATIC,
+		.brightness = ec_brightness,
+		.cmd_flags = { 3, 1 },
+	};
+	u64 resp = 0;
+	int ret;
+
+	ret = acer_gaming_wmi_eval_buf(wdev, ACER_WMID_SET_GAMING_KBD_BL_METHODID,
+				       &gm_input, sizeof(gm_input), &resp);
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
+static int send_zone_color(struct wmi_device *wdev, u8 zone_bit, u8 r, u8 g, u8 b)
+{
+	struct acer_gaming_static_led_input input = {
+		.zone_bit = zone_bit,
+		.r = r,
+		.g = g,
+		.b = b,
+	};
+	u64 resp = 0;
+	u64 payload;
+	int ret;
+
+	memcpy(&payload, &input, sizeof(payload));
+
+	ret = acer_gaming_wmi_eval_u64(wdev, ACER_WMID_SET_GAMING_STATIC_LED_METHODID,
+				       payload, &resp);
+	if (ret < 0 || resp)
+		return -EIO;
+
+	return 0;
+}
+
+static enum led_brightness rgb_get(struct led_classdev *led_cdev)
+{
+	struct led_classdev_mc *general_mcolor = lcdev_to_mccdev(led_cdev);
+	struct acer_kbd_zone_led *led_info = container_of(general_mcolor,
+							struct acer_kbd_zone_led,
+							led_general);
+	return led_info->current_brightness;
+}
+
+static int rgb_set(struct led_classdev *led_cdev, enum led_brightness brightness)
+{
+	struct led_classdev_mc *general_mcolor = lcdev_to_mccdev(led_cdev);
+	struct acer_kbd_zone_led *led_info = container_of(general_mcolor,
+							struct acer_kbd_zone_led,
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
+	ret = send_zone_color(data->wdev, led_info->zone_id, r, g, b);
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
@@ -407,10 +601,154 @@ struct quirk_entry {
 	bool platform_profile;
 	bool pwm;
 	bool commun_bluetooth;
+	bool kbd_bl_four_zone;
 };
 
 static struct quirk_entry *quirks;
 
+struct acer_smbios_type_ac {
+	struct dmi_header header;
+	u16 version;
+} __packed;
+
+struct acer_smbios_type_ac_entry {
+	u8 id;
+	u16 value;
+} __packed;
+
+static void type_ac_dmi_decode(const struct dmi_header *header, void *data)
+{
+	const u8 *ptr, *end;
+	bool has_four_zone = false;
+	bool has_rgb = false;
+	bool *supported = data;
+
+	if (header->type != ACER_SMBIOS_TYPE_KBD_INFO)
+		return;
+
+	if (header->length < sizeof(struct acer_smbios_type_ac))
+		return;
+
+	ptr = (const u8 *)header + sizeof(struct acer_smbios_type_ac);
+	end = (const u8 *)header + header->length;
+
+	while (ptr + sizeof(struct acer_smbios_type_ac_entry) <= end) {
+		const struct acer_smbios_type_ac_entry *entry =
+			(const struct acer_smbios_type_ac_entry *)ptr;
+
+		if (entry->id == ACER_SMBIOS_KBD_RECORD_TYPE &&
+		    le16_to_cpu(entry->value) == ACER_SMBIOS_KBD_TYPE_FOUR_ZONE)
+			has_four_zone = true;
+		else if (entry->id == ACER_SMBIOS_KBD_RECORD_COLOR &&
+			 le16_to_cpu(entry->value) == ACER_SMBIOS_KBD_COLOR_RGB)
+			has_rgb = true;
+
+		ptr += sizeof(*entry);
+	}
+
+	if (has_four_zone && has_rgb)
+		*supported = true;
+}
+
+static bool acer_kbd_four_zone_supported(void)
+{
+	bool supported = false;
+
+	dmi_walk(type_ac_dmi_decode, &supported);
+	return supported;
+}
+
+static int acer_kbd_rgb_init(struct wmi_device *wdev, struct rgb_wmi *rgb_data)
+{
+	static const char * const zone_names[] = {
+		"acer-wmi:rgb:kbd_backlight-left",
+		"acer-wmi:rgb:kbd_backlight-center-left",
+		"acer-wmi:rgb:kbd_backlight-center-right",
+		"acer-wmi:rgb:kbd_backlight-right",
+	};
+	u64 led_mode;
+	int ret;
+	int i;
+
+	led_mode = ACER_GAMING_LED_KBD_BL_ENABLE |
+		   FIELD_PREP(ACER_GAMING_LED_KBD_BL_INTERFACE_MASK,
+			      FIELD_MAX(ACER_GAMING_LED_KBD_BL_INTERFACE_MASK));
+
+	ret = acer_gaming_wmi_eval_u64(wdev, ACER_WMID_SET_GAMING_LED_METHODID,
+				       led_mode, NULL);
+	if (ret < 0)
+		return ret;
+
+	ret = acer_kbd_set_static_preamble(wdev, ACER_KBD_STATIC_PREAMBLE_BRIGHTNESS);
+	if (ret)
+		dev_warn(&wdev->dev, "Failed to set static preamble on init: %d\n", ret);
+
+	ret = devm_mutex_init(&wdev->dev, &rgb_data->led_lock);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ACER_KBD_NUM_ZONES; i++) {
+		struct acer_kbd_zone_led *zone = &rgb_data->zones[i];
+		u64 color_out = 0;
+		u8 r, g, b;
+		u8 max_val;
+
+		zone->zone_id = BIT(i);
+		zone->parent = rgb_data;
+
+		ret = acer_gaming_wmi_eval_u64(wdev,
+					       ACER_WMID_GET_GAMING_STATIC_LED_METHODID,
+					       zone->zone_id, &color_out);
+		if (ret) {
+			dev_warn(&wdev->dev,
+				 "Failed to read initial color for zone %d, defaulting to white\n",
+				 i);
+			r = ACER_KBD_RGB_MAX_INTENSITY;
+			g = ACER_KBD_RGB_MAX_INTENSITY;
+			b = ACER_KBD_RGB_MAX_INTENSITY;
+		} else {
+			r = FIELD_GET(ACER_KBD_COLOR_R_MASK, color_out);
+			g = FIELD_GET(ACER_KBD_COLOR_G_MASK, color_out);
+			b = FIELD_GET(ACER_KBD_COLOR_B_MASK, color_out);
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
+		ret = devm_led_classdev_multicolor_register(&wdev->dev,
+							    &zone->led_general);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static void __init set_quirks(void)
 {
 	if (quirks->mailled)
@@ -473,10 +811,17 @@ static struct quirk_entry quirk_acer_travelmate_2490 = {
 	.mailled = 1,
 };
 
+static struct quirk_entry quirk_acer_nitro_an16_41 = {
+	.hwmon = true,
+	.platform_profile = true,
+	.pwm = true,
+};
+
 static struct quirk_entry quirk_acer_nitro_an515_58 = {
 	.hwmon = true,
 	.platform_profile = true,
 	.pwm = true,
+	.kbd_bl_four_zone = true,
 };
 
 static struct quirk_entry quirk_acer_predator_ph315_53 = {
@@ -708,7 +1053,7 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN16-41"),
 		},
-		.driver_data = &quirk_acer_nitro_an515_58,
+		.driver_data = &quirk_acer_nitro_an16_41,
 	},
 	{
 		.callback = dmi_matched,
@@ -2835,6 +3180,7 @@ static int acer_wmi_hwmon_init(void);
 /*
  * Platform device
  */
+
 static int acer_platform_probe(struct platform_device *device)
 {
 	int err;
@@ -2933,11 +3279,64 @@ static int acer_resume(struct device *dev)
 
 	return 0;
 }
+
 #else
 #define acer_suspend	NULL
 #define acer_resume	NULL
 #endif
 
+static int acer_gaming_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct rgb_wmi *rgb_data;
+
+	if (!quirks || !quirks->kbd_bl_four_zone)
+		return -ENODEV;
+
+	if (!acer_kbd_four_zone_supported())
+		return -ENODEV;
+
+	rgb_data = devm_kzalloc(&wdev->dev, sizeof(*rgb_data), GFP_KERNEL);
+	if (!rgb_data)
+		return -ENOMEM;
+
+	rgb_data->wdev = wdev;
+	dev_set_drvdata(&wdev->dev, rgb_data);
+
+	return acer_kbd_rgb_init(wdev, rgb_data);
+}
+
+static int acer_gaming_wmi_resume(struct device *dev)
+{
+	struct rgb_wmi *rgb_data = dev_get_drvdata(dev);
+	int ret;
+
+	ret = acer_kbd_set_static_preamble(rgb_data->wdev,
+					   ACER_KBD_STATIC_PREAMBLE_BRIGHTNESS);
+	if (ret)
+		dev_warn(dev, "Failed to restore keyboard static mode on resume: %d\n",
+			 ret);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(acer_gaming_wmi_pm_ops, NULL,
+				acer_gaming_wmi_resume);
+
+static const struct wmi_device_id acer_gaming_wmi_id_table[] = {
+	{ WMID_GUID4, NULL },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, acer_gaming_wmi_id_table);
+
+static struct wmi_driver acer_gaming_wmi_driver = {
+	.driver = {
+		.name = "acer-gaming-wmi",
+		.pm = pm_sleep_ptr(&acer_gaming_wmi_pm_ops),
+	},
+	.id_table = acer_gaming_wmi_id_table,
+	.probe = acer_gaming_wmi_probe,
+};
+
 static SIMPLE_DEV_PM_OPS(acer_pm, acer_suspend, acer_resume);
 
 static void acer_platform_shutdown(struct platform_device *device)
@@ -3327,6 +3726,12 @@ static int __init acer_wmi_init(void)
 	if (err)
 		goto error_device_add;
 
+	err = wmi_driver_register(&acer_gaming_wmi_driver);
+	if (err) {
+		pr_err("Unable to register gaming WMI driver\n");
+		goto error_wmi_register;
+	}
+
 	if (wmi_has_guid(WMID_GUID2)) {
 		interface->debug.wmid_devices = get_wmid_devices();
 		create_debugfs();
@@ -3337,6 +3742,8 @@ static int __init acer_wmi_init(void)
 
 	return 0;
 
+error_wmi_register:
+	platform_device_del(acer_platform_device);
 error_device_add:
 	platform_device_put(acer_platform_device);
 error_device_alloc:
@@ -3361,6 +3768,7 @@ static void __exit acer_wmi_exit(void)
 	remove_debugfs();
 	platform_device_unregister(acer_platform_device);
 	platform_driver_unregister(&acer_platform_driver);
+	wmi_driver_unregister(&acer_gaming_wmi_driver);
 
 	pr_info("Acer Laptop WMI Extras unloaded\n");
 }
-- 
2.56.0

