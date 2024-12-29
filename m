Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA5E19C56C;
	Sun, 29 Dec 2024 19:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735501623; cv=none; b=qpm996MvslXay4e6U9L9Wkk4sUNqys6+sM0Au6dR+4WTev4v1qv9StqcN041bbetcXuRl+IN3AyxWQa00lxG8+jee+tm0OzDU4hvvXKftZZGpC5CnlS+RDNTz1nphAL80MeTNeRVQuT967wht+mQ/TIkQhHySgvFGDLwEAmNaJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735501623; c=relaxed/simple;
	bh=YPxGGxYGLmQUdJVPrF8iAyR9HVQUFEHiYx2S7aYtXzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JTIUS9m2zwcd+zJYjKVrhXLP+yzTUu9brly3n52CEFEqH1gOu157EIOEqfdq3f7bptJnEBR6j/Mw/M+MUu7bXiFGs+5XaHT5LosDkyROln1Z+IlphBrH7XeQIBlA1TgJFneOM6v9/hJoBAH43FX2sP5Kmd+sAjdxA2zCYQ+86TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eorF/RcL; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eorF/RcL"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4aff31b77e8so2749307137.1;
        Sun, 29 Dec 2024 11:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735501620; x=1736106420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0a1ow32G2O43OWWRFNpHI/zcLjB01w85//2cAnS+EA=;
        b=eorF/RcL2GmdKvrR1jrvHxeK8AAUsMaWger8b9ha2tgXgIU6SmpATx/e+ZJeP8iL/7
         jdzksNRHtXWe0yuq3SQtLQdL0+AvJ+3XiRa685xf0uAYjeW3yRnNGh0xBX/X4PoRAMJx
         otBBC2clSjcClyPbBzJCkZZUFRMOn00cWv1ibdNsCIFLeb5Q395PU1eFJ0Tw9E4mf2aK
         ZC+HroHYxSq02IZnQBXdzx9EzNVCCwIM2Sa466oJaqcIgZ4WxGM2/jxxDgmQIuVoA97r
         qAIvULWHzP4OaK+7H6KIZh0kPa9Y4pgLTKY123HgQAqnCwCjmWRa4HUR6r2CUcHjQuYp
         dVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735501620; x=1736106420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0a1ow32G2O43OWWRFNpHI/zcLjB01w85//2cAnS+EA=;
        b=ZyZGqvkgW1It5xc2JXYpUKopUisQMN6M71lIH7nekc1nvk7cx/bcrySUNHT2XDYWS1
         wZ9Mtrk/5k4Kzzs9B2ZncexqeH9zUikBBFm0DmxLgMlTmc3qQcX5+/0caUyT/cDtJCN7
         wWLTdzbh86iG9y/lmCKDLAuFRYCueRtySx+jUV0pUh0OdBY2lLP3zDSSvCUuv87cBLTI
         Kzu5iAs0cmVuBVdKIlrESvy6Wd0wAd6gyko97SzO0as80i6xGFXCsG19aPiQq2Z37TWn
         gcNQ18hxTlLlATlzAVePF2JCyh4ImUUdjnSkdWENyC8OVK49E+PW/3Qfg+H9kcTwjZ82
         paEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnonI5J8ioF00wXGXxYzuMpr/s1AUcR7tH61oCQwGIu07JEBXHFEXwgSZd4SYf2jjVaNvkTXQ9FNAeTk0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+VF/7QdHdnJ/wWDCgYZ3elyV35L1qhGlRYLkjzdUxczKmf0ia
	2ZP89tbhKa1x0b1ZlCN2RpnXRGHsZT9Wg/qPgdoHLDmEj2QG4rVY1EOjqg==
X-Gm-Gg: ASbGnctBrSovDfPAdWfIPtNA7A7d01QXvNfyVJadPNoGEKNQkynG7YWe0oWRMLQQ6Pb
	NWwWv4WAB4cqw7eEoqCe8ouPmme/rci1N01JAFIdIdK5DKXmOwkLtm0U/aw34r8ahhN7jRVOJbM
	MoMC+FnC0YdtElBbG22zM/xd7ds6xu9nHOYN4PJWXFuYv0KVmz57qkM6cQI512Rcck6JP1eCA2u
	ZKNxOFeYRdOVL1rLSX2eAvBlGLSe5/P4nr+wiw6XV6i7lQu2Q6d2dG8GpPUQFR9
X-Google-Smtp-Source: AGHT+IEcPPLMwdorAltgf3274hKlsLjY0N0SQnZ6nBFDUKGhPQSX2du7M5G21b8SqO0m9BLqBj7aKw==
X-Received: by 2002:a05:6102:1493:b0:4af:af20:516a with SMTP id ada2fe7eead31-4b2cc31c290mr27440509137.1.1735501619942;
        Sun, 29 Dec 2024 11:46:59 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98ce0fsm3753555137.3.2024.12.29.11.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 11:46:59 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v2 05/20] alienware-wmi: Improve rgb-zones group creation
Date: Sun, 29 Dec 2024 14:44:52 -0500
Message-ID: <20241229194506.8268-7-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229194506.8268-2-kuurtb@gmail.com>
References: <20241229194506.8268-2-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define zone_attrs statically and initialize zone_attribute_group with
platform driver's .dev_groups.

Drop match_zone() and instead pass a `location` argument to previous
show/store methods to access the correct `zone` LED state. On top of
that rename zone_set() -> zone_store() to be more consistent with sysfs
conventions.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 209 +++++++++++-----------
 1 file changed, 102 insertions(+), 107 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index e010c94555e8..d97e5e15a8f2 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -376,12 +376,6 @@ struct color_platform {
 	u8 red;
 } __packed;
 
-struct platform_zone {
-	u8 location;
-	struct device_attribute *attr;
-	struct color_platform colors;
-};
-
 struct wmax_brightness_args {
 	u32 led_mask;
 	u32 percentage;
@@ -411,16 +405,10 @@ struct wmax_u32_args {
 };
 
 static struct platform_device *platform_device;
-static struct device_attribute *zone_dev_attrs;
-static struct attribute **zone_attrs;
-static struct platform_zone *zone_data;
+static struct color_platform colors[4];
 static struct platform_profile_handler pp_handler;
 static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
 
-static struct attribute_group zone_attribute_group = {
-	.name = "rgb_zones",
-};
-
 static u8 interface;
 static u8 lighting_control_state;
 static u8 global_brightness;
@@ -452,24 +440,10 @@ static int parse_rgb(const char *buf, struct color_platform *colors)
 	return 0;
 }
 
-static struct platform_zone *match_zone(struct device_attribute *attr)
-{
-	u8 zone;
-
-	for (zone = 0; zone < quirks->num_zones; zone++) {
-		if ((struct device_attribute *)zone_data[zone].attr == attr) {
-			pr_debug("alienware-wmi: matched zone location: %d\n",
-				 zone_data[zone].location);
-			return &zone_data[zone];
-		}
-	}
-	return NULL;
-}
-
 /*
  * Individual RGB zone control
  */
-static int alienware_update_led(struct platform_zone *zone)
+static int alienware_update_led(u8 location)
 {
 	int method_id;
 	acpi_status status;
@@ -478,8 +452,8 @@ static int alienware_update_led(struct platform_zone *zone)
 	struct legacy_led_args legacy_args;
 	struct wmax_led_args wmax_basic_args;
 	if (interface == WMAX) {
-		wmax_basic_args.led_mask = 1 << zone->location;
-		wmax_basic_args.colors = zone->colors;
+		wmax_basic_args.led_mask = 1 << location;
+		wmax_basic_args.colors = colors[location];
 		wmax_basic_args.state = lighting_control_state;
 		guid = WMAX_CONTROL_GUID;
 		method_id = WMAX_METHOD_ZONE_CONTROL;
@@ -487,7 +461,7 @@ static int alienware_update_led(struct platform_zone *zone)
 		input.length = sizeof(wmax_basic_args);
 		input.pointer = &wmax_basic_args;
 	} else {
-		legacy_args.colors = zone->colors;
+		legacy_args.colors = colors[location];
 		legacy_args.brightness = global_brightness;
 		legacy_args.state = 0;
 		if (lighting_control_state == LEGACY_BOOTING ||
@@ -496,7 +470,7 @@ static int alienware_update_led(struct platform_zone *zone)
 			legacy_args.state = lighting_control_state;
 		} else
 			guid = LEGACY_CONTROL_GUID;
-		method_id = zone->location + 1;
+		method_id = location + 1;
 
 		input.length = sizeof(legacy_args);
 		input.pointer = &legacy_args;
@@ -510,35 +484,84 @@ static int alienware_update_led(struct platform_zone *zone)
 }
 
 static ssize_t zone_show(struct device *dev, struct device_attribute *attr,
-			 char *buf)
+			 char *buf, u8 location)
 {
-	struct platform_zone *target_zone;
-	target_zone = match_zone(attr);
-	if (target_zone == NULL)
-		return sprintf(buf, "red: -1, green: -1, blue: -1\n");
 	return sprintf(buf, "red: %d, green: %d, blue: %d\n",
-		       target_zone->colors.red,
-		       target_zone->colors.green, target_zone->colors.blue);
+		       colors[location].red, colors[location].green,
+		       colors[location].blue);
 
 }
 
-static ssize_t zone_set(struct device *dev, struct device_attribute *attr,
-			const char *buf, size_t count)
+static ssize_t zone_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count, u8 location)
 {
-	struct platform_zone *target_zone;
 	int ret;
-	target_zone = match_zone(attr);
-	if (target_zone == NULL) {
-		pr_err("alienware-wmi: invalid target zone\n");
-		return 1;
-	}
-	ret = parse_rgb(buf, &target_zone->colors);
+
+	ret = parse_rgb(buf, &colors[location]);
 	if (ret)
 		return ret;
-	ret = alienware_update_led(target_zone);
+
+	ret = alienware_update_led(location);
+
 	return ret ? ret : count;
 }
 
+static ssize_t zone00_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	return zone_show(dev, attr, buf, 0);
+}
+
+static ssize_t zone00_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	return zone_store(dev, attr, buf, count, 0);
+}
+
+DEVICE_ATTR_RW(zone00);
+
+static ssize_t zone01_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	return zone_show(dev, attr, buf, 1);
+}
+
+static ssize_t zone01_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	return zone_store(dev, attr, buf, count, 1);
+}
+
+DEVICE_ATTR_RW(zone01);
+
+static ssize_t zone02_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	return zone_show(dev, attr, buf, 2);
+}
+
+static ssize_t zone02_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	return zone_store(dev, attr, buf, count, 2);
+}
+
+DEVICE_ATTR_RW(zone02);
+
+static ssize_t zone03_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	return zone_show(dev, attr, buf, 3);
+}
+
+static ssize_t zone03_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	return zone_store(dev, attr, buf, count, 3);
+}
+
+DEVICE_ATTR_RW(zone03);
+
 /*
  * Lighting control state device attribute (Global)
  */
@@ -578,6 +601,33 @@ static ssize_t lighting_control_state_store(struct device *dev,
 
 static DEVICE_ATTR_RW(lighting_control_state);
 
+static umode_t zone_attr_visible(struct kobject *kobj,
+				 struct attribute *attr, int n)
+{
+	return n < quirks->num_zones + 1 ? 0644 : 0;
+}
+
+static bool zone_group_visible(struct kobject *kobj)
+{
+	return quirks->num_zones > 0;
+}
+DEFINE_SYSFS_GROUP_VISIBLE(zone);
+
+static struct attribute *zone_attrs[] = {
+	&dev_attr_lighting_control_state.attr,
+	&dev_attr_zone00.attr,
+	&dev_attr_zone01.attr,
+	&dev_attr_zone02.attr,
+	&dev_attr_zone03.attr,
+	NULL
+};
+
+static struct attribute_group zone_attribute_group = {
+	.name = "rgb_zones",
+	.is_visible = SYSFS_GROUP_VISIBLE(zone),
+	.attrs = zone_attrs,
+};
+
 /*
  * LED Brightness (Global)
  */
@@ -606,7 +656,7 @@ static void global_led_set(struct led_classdev *led_cdev,
 	if (interface == WMAX)
 		ret = wmax_brightness(brightness);
 	else
-		ret = alienware_update_led(&zone_data[0]);
+		ret = alienware_update_led(0);
 	if (ret)
 		pr_err("LED brightness update failed\n");
 }
@@ -624,9 +674,6 @@ static struct led_classdev global_led = {
 
 static int alienware_zone_init(struct platform_device *dev)
 {
-	u8 zone;
-	char *name;
-
 	if (interface == WMAX) {
 		lighting_control_state = WMAX_RUNNING;
 	} else if (interface == LEGACY) {
@@ -635,65 +682,12 @@ static int alienware_zone_init(struct platform_device *dev)
 	global_led.max_brightness = 0x0F;
 	global_brightness = global_led.max_brightness;
 
-	/*
-	 *      - zone_dev_attrs num_zones + 1 is for individual zones and then
-	 *        null terminated
-	 *      - zone_attrs num_zones + 2 is for all attrs in zone_dev_attrs +
-	 *        the lighting control + null terminated
-	 *      - zone_data num_zones is for the distinct zones
-	 */
-	zone_dev_attrs =
-	    kcalloc(quirks->num_zones + 1, sizeof(struct device_attribute),
-		    GFP_KERNEL);
-	if (!zone_dev_attrs)
-		return -ENOMEM;
-
-	zone_attrs =
-	    kcalloc(quirks->num_zones + 2, sizeof(struct attribute *),
-		    GFP_KERNEL);
-	if (!zone_attrs)
-		return -ENOMEM;
-
-	zone_data =
-	    kcalloc(quirks->num_zones, sizeof(struct platform_zone),
-		    GFP_KERNEL);
-	if (!zone_data)
-		return -ENOMEM;
-
-	for (zone = 0; zone < quirks->num_zones; zone++) {
-		name = kasprintf(GFP_KERNEL, "zone%02hhX", zone);
-		if (name == NULL)
-			return 1;
-		sysfs_attr_init(&zone_dev_attrs[zone].attr);
-		zone_dev_attrs[zone].attr.name = name;
-		zone_dev_attrs[zone].attr.mode = 0644;
-		zone_dev_attrs[zone].show = zone_show;
-		zone_dev_attrs[zone].store = zone_set;
-		zone_data[zone].location = zone;
-		zone_attrs[zone] = &zone_dev_attrs[zone].attr;
-		zone_data[zone].attr = &zone_dev_attrs[zone];
-	}
-	zone_attrs[quirks->num_zones] = &dev_attr_lighting_control_state.attr;
-	zone_attribute_group.attrs = zone_attrs;
-
-	led_classdev_register(&dev->dev, &global_led);
-
-	return sysfs_create_group(&dev->dev.kobj, &zone_attribute_group);
+	return led_classdev_register(&dev->dev, &global_led);
 }
 
 static void alienware_zone_exit(struct platform_device *dev)
 {
-	u8 zone;
-
-	sysfs_remove_group(&dev->dev.kobj, &zone_attribute_group);
 	led_classdev_unregister(&global_led);
-	if (zone_dev_attrs) {
-		for (zone = 0; zone < quirks->num_zones; zone++)
-			kfree(zone_dev_attrs[zone].attr.name);
-	}
-	kfree(zone_dev_attrs);
-	kfree(zone_data);
-	kfree(zone_attrs);
 }
 
 static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
@@ -1143,6 +1137,7 @@ static void remove_thermal_profile(void)
  * Platform Driver
  */
 static const struct attribute_group *alienfx_groups[] = {
+	&zone_attribute_group,
 	&hdmi_attribute_group,
 	&amplifier_attribute_group,
 	&deepsleep_attribute_group,
-- 
2.47.1

