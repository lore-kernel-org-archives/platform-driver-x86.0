Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A2051992F
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 16:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748145; cv=none; b=a6TRykBT6QqtZfYgJiNYgHyOHXtI9N9qZjINO9YtwBAGE7nsbqLc3xvy6fGQiX+K4mGUr1A6smdbO2YWwZPxG2usMbpbt8JZRyUvVnDJ521/TL9DTjHV/MyLxAT4U+ucw5wrVXYmG8lrwvS6fOQz2MA4XtCN6XOx3NYiCifVJ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748145; c=relaxed/simple;
	bh=Xr6yKrvpQiSL5y8LPYXivptqaJm2seL3RtleYqLmvdk=;
	h=Message-ID:From:Date:Subject:To:Cc; b=ud+btve1Ap0LpopOlIwHDgOw/RAJnTmgS93QUCnP20mdnBkfGshUOBQJYJu2xoQ0Ixsltsf/ouA0Spc8iUUdHbxrIpOCQnK5ayd/ndPcDiJ4qUIEAxNUTtyZJqLEd7ufVrPwHvADRMqzXEYK/aQMf/ZtdmOKrPT6TDTmh8nxDKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDiFkzip; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDiFkzip"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4ab4fe290so247440a12.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 09:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789748138; x=1790352938; darn=vger.kernel.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kyeW9arD28Ii5rWr9Hl/X5dSjpKPdcmdYAN1HWylrLg=;
        b=fDiFkzipSSoE3pA8wo20OGeWT0cC2yR/jnnuHUZTJPFrCHGkjgECsOluBXaQCjAVFw
         YhUr8gI5VN3bcmSEySdSdvEq9u3x9uceP8NwOwgufRyVmRcR6Wg3/kx2ydYF7kYHPUM4
         RIvba2fd2mdT3un7mnfZB7jy8IOl0AyVTbuIYqFI3wTGPA/9ihhV53A+Tn2tNnWdpwla
         QxUDzL8/xfN5I7+d+x9iMct9QLvdACZeFv6p5M5v3M7m4T6CtfD9Na0RmiBJ7lk50DBG
         PtxReQMceI5JH++FVT74LgNbdmUSU7RDDYrLIZhpzYkUBEUb29qqu95ygF7eK28htL74
         j3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789748138; x=1790352938;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kyeW9arD28Ii5rWr9Hl/X5dSjpKPdcmdYAN1HWylrLg=;
        b=wbCeVkZH0tpSiABw64bL3JeFA6OEeJSI+cPfRGq7HHaid1stBCcZd7D2HCtBuB2ZNJ
         VFYwlmRm2rX4AFFuoGFFTkjlitZPDiz3jls43w/YsWwI4zbBGeNjVUVz5Xi2JA413yhD
         92fD84lkquL91O914Vw89vnQqgOp7LOk2ir34XP2YvYl6RJh7GATsR8XhahXrDSbxuEk
         NXxTaYz3XwbdTM3+8CKqmcY9PKKp4/h7LMPTFt7OAZEKaH52GB5auz5TZv/wJ/zn4+gd
         N5bBSgsII2diXHXr4vzvarf7q6qA/nsA+Pwq7oTShLy4CefNfSghpMzBuR4L2VCegJLA
         R7BQ==
X-Gm-Message-State: AFuF++kyBf5CEn4BxWoS2pJvjcWLEgFluS67Jqba+vZRFVv76t/fEopF
	Wcd2uszR5uY046KPM6RY+l3tPzsBWs+EvWWr88kVD5VWo66jVHYF8BZsEJl69OdHWZtbuRdruko
	=
X-Gm-Gg: AYBFou3dh62iQDvFtrK7whbK5rDi3Sy6nlq8GWqoa1BxIGa2sGfI+Jb4F9lTPLwvair
	95xbRavsKl14Kzek5s+SXN0RDXW/3Qx/AWXv92YXL3vJLIgbCyOFDbHmXEGAzLJbkGrvgZUoKMY
	7rQtDnQL3NUSBXjRnTiJtmAhneOJxFjb24V8dw6y1P6bOg+xBvHcBcnCAiKclaH+7J/1nKE19Zd
	yDgPtN3cesGCTf0Sz8l7PDHfSqxpVI2Jjg+yyfJeVfbYNewhgLxRqBf+obu4z8T3LH2fm5JoJvh
	7f5OivSnk43WyVEWM/nSuD4jkweXd4/xeqq88BUq15vRKZMoOu7toTtnnXukXKb47baVoBHbhZA
	FbWOYuPKEZYRGnSZz51syq9DlIrMMu+rK0uVrY0eyYlVsi23cYPQwZcWP+m0kMG4Kpl196H3PKO
	u2UvDY6AsoB6Fn5JsZ3Gt2VkoKl0FANOx4crFZwWqHLyoiogAEm72tbp2OXk2uF8aXUEjR0nQP7
	pT48yg/85gw/Mc=
X-Received: by 2002:a17:90b:3c4f:b0:39e:6c68:fd94 with SMTP id 98e67ed59e1d1-39e6c68ff00mr154843a91.41.1789748137965;
        Fri, 18 Sep 2026 09:15:37 -0700 (PDT)
Received: from [192.168.1.61] ([2a01:e0a:e4e:4410:678f:20fd:fad6:8c30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55a0e7e2sm1828570a91.4.2026.09.18.09.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:15:37 -0700 (PDT)
Message-ID: <6aad63a9.f9180b46.32931.492b@mx.google.com>
From: Lucas Gillard <mirsella1@gmail.com>
Date: Fri, 18 Sep 2026 17:55:04 +0200
Subject: [PATCH] platform/x86: acer-wmi: support PH317-51 hwmon and kbd
 backlight
To: platform-driver-x86@vger.kernel.org
Cc: jlee@suse.com, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de,
	Lucas Gillard <mirsella1@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The Predator Helios 300 PH317-51 (2017) has the Predator gaming WMI
interface, but an early revision of it. Sensor queries and fan control
answer; the platform-profile and OC methods (22/23) do not exist. So it
gets a quirk that turns on HWMON without predator_v4.

The keyboard backlight has no WMI method behind it on this machine. I
probed the LED methods (2/4) every way I could and they neither report
nor change its state. The EC owns it instead, in RAM at 0x30/0x31, the
same bytes Fn+F9 flips. The read hook reports the live EC value, so the
Fn key and sysfs never disagree.

The code is mine, written with help from an AI coding assistant to
understand the codebase and how this kind of change is usually done;
this is my first kernel contribution. I verified every behavior
claimed here myself, on the machine.

Tested on a PH317-51: both temperatures, both fans, and the light going
on and off from sysfs.

Signed-off-by: Lucas Gillard <mirsella1@gmail.com>
Assisted-by: LLM
---
 drivers/platform/x86/acer-wmi.c | 87 +++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 61ae622..f14b6e4 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -310,6 +310,7 @@ struct hotkey_function_type_aa {
 #define ACER_CAP_PLATFORM_PROFILE	BIT(10)
 #define ACER_CAP_HWMON			BIT(11)
 #define ACER_CAP_PWM			BIT(12)
+#define ACER_CAP_KBD_BACKLIGHT		BIT(13)
 
 /*
  * Interface type flags
@@ -359,6 +360,7 @@ struct acer_data {
 	int mailled;
 	int threeg;
 	int brightness;
+	int kbd_backlight;
 };
 
 struct acer_debug {
@@ -405,6 +407,8 @@ struct quirk_entry {
 	u8 gpu_fans;
 	u8 predator_v4;
 	u8 pwm;
+	u8 hwmon;
+	u8 kbd_backlight;
 };
 
 static struct quirk_entry *quirks;
@@ -425,6 +429,12 @@ static void __init set_quirks(void)
 		interface->capability |= ACER_CAP_PLATFORM_PROFILE |
 					 ACER_CAP_HWMON;
 
+	if (quirks->hwmon)
+		interface->capability |= ACER_CAP_HWMON;
+
+	if (quirks->kbd_backlight)
+		interface->capability |= ACER_CAP_KBD_BACKLIGHT;
+
 	if (quirks->pwm)
 		interface->capability |= ACER_CAP_PWM;
 }
@@ -466,6 +476,12 @@ static struct quirk_entry quirk_acer_predator_ph315_53 = {
 	.gpu_fans = 1,
 };
 
+/* Firmware lacks the profile/OC methods, so no predator_v4. */
+static struct quirk_entry quirk_acer_predator_ph317_51 = {
+	.hwmon = 1,
+	.kbd_backlight = 1,
+};
+
 static struct quirk_entry quirk_acer_predator_ph16_72 = {
 	.turbo = 1,
 	.cpu_fans = 1,
@@ -671,6 +687,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_predator_ph315_53,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Acer Predator PH317-51",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Predator PH317-51"),
+		},
+		.driver_data = &quirk_acer_predator_ph317_51,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "Acer Predator PHN16-71",
@@ -1947,6 +1972,45 @@ static void acer_led_exit(void)
 	led_classdev_unregister(&mail_led);
 }
 
+/*
+ * No WMI method drives the backlight on this model; the EC keeps the
+ * state mirrored in both 0x30 and 0x31, so write both.
+ */
+static void kbd_led_set(struct led_classdev *led_cdev,
+			enum led_brightness value)
+{
+	value = !!value;
+	ec_write(0x30, value);
+	ec_write(0x31, value);
+}
+
+static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
+{
+	u8 result;
+
+	if (ec_read(0x30, &result))
+		return LED_OFF;
+	return (result & 0x1) ? LED_ON : LED_OFF;
+}
+
+static struct led_classdev kbd_led = {
+	.name = "acer-wmi::kbd_backlight",
+	.brightness_set = kbd_led_set,
+	.brightness_get = kbd_led_get,
+	.max_brightness = 1,
+};
+
+static int acer_kbd_led_init(struct device *dev)
+{
+	return led_classdev_register(dev, &kbd_led);
+}
+
+static void acer_kbd_led_exit(void)
+{
+	kbd_led_set(&kbd_led, LED_OFF);
+	led_classdev_unregister(&kbd_led);
+}
+
 /*
  * Backlight device
  */
@@ -2799,8 +2863,15 @@ static int acer_platform_probe(struct platform_device *device)
 			goto error_hwmon;
 	}
 
+	if (has_cap(ACER_CAP_KBD_BACKLIGHT)) {
+		err = acer_kbd_led_init(&device->dev);
+		if (err)
+			goto error_kbd_backlight;
+	}
+
 	return 0;
 
+error_kbd_backlight:
 error_hwmon:
 error_platform_profile:
 	acer_rfkill_exit();
@@ -2816,6 +2887,8 @@ static int acer_platform_probe(struct platform_device *device)
 
 static void acer_platform_remove(struct platform_device *device)
 {
+	if (has_cap(ACER_CAP_KBD_BACKLIGHT))
+		acer_kbd_led_exit();
 	if (has_cap(ACER_CAP_MAILLED))
 		acer_led_exit();
 	if (has_cap(ACER_CAP_BRIGHTNESS))
@@ -2844,6 +2917,14 @@ static int acer_suspend(struct device *dev)
 		data->brightness = value;
 	}
 
+	if (has_cap(ACER_CAP_KBD_BACKLIGHT)) {
+		u8 state;
+
+		if (!ec_read(0x30, &state))
+			data->kbd_backlight = state & 0x1;
+		kbd_led_set(&kbd_led, LED_OFF);
+	}
+
 	return 0;
 }
 
@@ -2860,6 +2941,9 @@ static int acer_resume(struct device *dev)
 	if (has_cap(ACER_CAP_BRIGHTNESS))
 		set_u32(data->brightness, ACER_CAP_BRIGHTNESS);
 
+	if (has_cap(ACER_CAP_KBD_BACKLIGHT))
+		kbd_led_set(&kbd_led, data->kbd_backlight);
+
 	if (acer_wmi_accel_dev)
 		acer_gsensor_init();
 
@@ -2881,6 +2965,9 @@ static void acer_platform_shutdown(struct platform_device *device)
 
 	if (has_cap(ACER_CAP_MAILLED))
 		set_u32(LED_OFF, ACER_CAP_MAILLED);
+
+	if (has_cap(ACER_CAP_KBD_BACKLIGHT))
+		kbd_led_set(&kbd_led, LED_OFF);
 }
 
 static struct platform_driver acer_platform_driver = {
-- 
2.55.0


