Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F98319CD13;
	Sun, 29 Dec 2024 19:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735501628; cv=none; b=h3ptJEzsSsL2hSUFxNxhfG+jPaH0bzcSU9EM/EPcFXuTIVGtn9LT8+mehBNBUZvyCROK+yUUDERO4jLhtaOxAS9sBkespCUjRrsUKsstaF93vTMlYnG+Vd4stloD0RKZXjHBHj6ENBQTfXL+AGqRfui3lZSzcisEEvStsPvZiQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735501628; c=relaxed/simple;
	bh=8FAziCPJLkU0QinpAknZ9D7G4QoHmGla1DA10dlYoLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jij6w9OCiLinASCF58vq/qh31zfYH9QFQJbypqx0zMT8Sdre+CL7UsHqrrIRTEqaT+n3rdAwXqT2VG1/iKyiY4feH1/BS+gz1xARnNR7aHwqk9AqpaF87PgCZRNxyHheRj+G81wN6PpYJK+SEQvlB4lczs6I8yvM+YjJBLmg4Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikwIyN6B; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikwIyN6B"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4b11a110e4eso2429418137.1;
        Sun, 29 Dec 2024 11:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735501626; x=1736106426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Hhx93SvZhgpcRgAG1QATC59kcQxwf7HYzGHwNDNrdM=;
        b=ikwIyN6BHh/qG5zijup5Sw4yLBG0prc2QTsV5izb0jG2+nsW06iwMPd5mkr2W6XIML
         zC3lFoJOQIh3fxWASVu9LJuO8llnxJa3FOiBCRfQnxzpV4hedFz2Y2JRfikBPigjy+Wo
         1s6U5V9kIjG78VFCYWrCNLcU1D/dE945q3FYbKAtYMSwSPY7CA2gutubW6TY0ZD+PKkF
         LwQfw8t2uJ54iyibNQrl2a70dCdB9TjSx9r3d+aGGfe1Vm0NPBXQ0vD2YcQqdedblFMB
         YwDznp0TlPe76SPtr6YoISw7S2+nXLDUec+PwmB7bShHyTo+kk2L7yXP7h3Uq14Mv63h
         slVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735501626; x=1736106426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Hhx93SvZhgpcRgAG1QATC59kcQxwf7HYzGHwNDNrdM=;
        b=nwuxQZ0AZK/BPPjbqpOqp8a5vKtKtrQovpAf9K5XtPn+HVzJ2hnZKG3P9XCGTg//YS
         rq/pgG2fVcQfK92NZeWMNVwhqNxQULzYe9eSx0LshQyig0VST2gH9JLLF96Y8R2DqAZP
         04tZNsDAPxTzXeAXlQ49W5458j7gfMfrK8NQJuLgEPxpArbbGIdGTv9v+/HR8s2KfX+G
         AA02a51D+uWILw2S/9sbf+jbDci2eNeV90Gcq6nnQVjD31XiW+EtdFe+mXahCc3Bl36/
         7ww0CcQAUcen1cAIJhBzkjVC73lnjJv4Vn4rGoxKpcCGucLTrOS0q952d//pIFR0bl2o
         kxzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+4P0+i1iHNIocL/evlLM6thyBe1fl9Rqq30DHH9jwo7ApZUpmvM4/H5thYRkrj3rWgpBNZQaij5fdt2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlD/7QAsyhcBhUsD8rp3OGDeirYP8347uKKVQcvApgmSUiag2J
	/1JV9nAxuHcBfzq5O3Xfk7Xn3bp0V7mZWw+DPlnk0iAz941ct5GRJ3KZZA==
X-Gm-Gg: ASbGncv0pjyLxGDSifvmANiTD1+9cua32VXeLi38ydJeN0lSM39pzrUhMEv8dJ7CGNu
	wN4OCId933QrnU47dlEnBKcdirjEfQWZjQjuJjVNBMWQTMwEOGKhVbsjM+azsSkIFNI1gaDmIcR
	c6Vuo+HXqH8RbeByuJmLypOXeljPf69gZlU/fseji3JrBHtVduc7OogTgUUvPs5mDOiXA1TPLFt
	PWdB158FFUykZbuaPNXabwPyo8uTNyfNmbGgU5ioO1Lut2Ls3JGFn3pOoB624nf
X-Google-Smtp-Source: AGHT+IFjlaxXWyUFNJtM0jCSn1oDTCidamCszddcboR4w6a3h99/XQNtmYxczWsNHxs2KLFhn3MyqQ==
X-Received: by 2002:a05:6102:41a3:b0:4b2:7446:fc18 with SMTP id ada2fe7eead31-4b2cc4597f3mr28325917137.17.1735501625809;
        Sun, 29 Dec 2024 11:47:05 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98ce0fsm3753555137.3.2024.12.29.11.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 11:47:05 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v2 07/20] alienware-wmi: Add a state container for LED control feature
Date: Sun, 29 Dec 2024 14:44:54 -0500
Message-ID: <20241229194506.8268-9-kuurtb@gmail.com>
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

Add a state container for the "alienware-wmi" platform device and
initialize it on the new alienfx_probe(). Migrate all LED control functions
to use this state container, as well as hdmi, amplifier, deepslp group
visibility methods, to support upcoming file split.

Additionally move the led_classdev registration to the platform driver
probe and make it device managed.

Drop alienware_zone_init() and alienware_zone_exit() because they are no
longer needed.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 135 +++++++++++++---------
 1 file changed, 79 insertions(+), 56 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 2c17160473a6..88d4046ed45f 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -404,14 +404,20 @@ struct wmax_u32_args {
 	u8 arg3;
 };
 
+struct alienfx_priv {
+	struct platform_device *pdev;
+	struct quirk_entry *quirks;
+	struct led_classdev global_led;
+	struct color_platform colors[4];
+	u8 global_brightness;
+	u8 lighting_control_state;
+};
+
 static struct platform_device *platform_device;
-static struct color_platform colors[4];
 static struct platform_profile_handler pp_handler;
 static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
 
 static u8 interface;
-static u8 lighting_control_state;
-static u8 global_brightness;
 
 /*
  * Helpers used for zone control
@@ -443,7 +449,7 @@ static int parse_rgb(const char *buf, struct color_platform *colors)
 /*
  * Individual RGB zone control
  */
-static int alienware_update_led(u8 location)
+static int alienware_update_led(struct alienfx_priv *priv, u8 location)
 {
 	int method_id;
 	acpi_status status;
@@ -453,21 +459,21 @@ static int alienware_update_led(u8 location)
 	struct wmax_led_args wmax_basic_args;
 	if (interface == WMAX) {
 		wmax_basic_args.led_mask = 1 << location;
-		wmax_basic_args.colors = colors[location];
-		wmax_basic_args.state = lighting_control_state;
+		wmax_basic_args.colors = priv->colors[location];
+		wmax_basic_args.state = priv->lighting_control_state;
 		guid = WMAX_CONTROL_GUID;
 		method_id = WMAX_METHOD_ZONE_CONTROL;
 
 		input.length = sizeof(wmax_basic_args);
 		input.pointer = &wmax_basic_args;
 	} else {
-		legacy_args.colors = colors[location];
-		legacy_args.brightness = global_brightness;
+		legacy_args.colors = priv->colors[location];
+		legacy_args.brightness = priv->global_brightness;
 		legacy_args.state = 0;
-		if (lighting_control_state == LEGACY_BOOTING ||
-		    lighting_control_state == LEGACY_SUSPEND) {
+		if (priv->lighting_control_state == LEGACY_BOOTING ||
+		    priv->lighting_control_state == LEGACY_SUSPEND) {
 			guid = LEGACY_POWER_CONTROL_GUID;
-			legacy_args.state = lighting_control_state;
+			legacy_args.state = priv->lighting_control_state;
 		} else
 			guid = LEGACY_CONTROL_GUID;
 		method_id = location + 1;
@@ -486,22 +492,26 @@ static int alienware_update_led(u8 location)
 static ssize_t zone_show(struct device *dev, struct device_attribute *attr,
 			 char *buf, u8 location)
 {
+	struct alienfx_priv *priv = dev_get_drvdata(dev);
+	struct color_platform *colors = &priv->colors[location];
+
 	return sprintf(buf, "red: %d, green: %d, blue: %d\n",
-		       colors[location].red, colors[location].green,
-		       colors[location].blue);
+		       colors->red, colors->green, colors->blue);
 
 }
 
 static ssize_t zone_store(struct device *dev, struct device_attribute *attr,
 			  const char *buf, size_t count, u8 location)
 {
+	struct alienfx_priv *priv = dev_get_drvdata(dev);
+	struct color_platform *colors = &priv->colors[location];
 	int ret;
 
-	ret = parse_rgb(buf, &colors[location]);
+	ret = parse_rgb(buf, colors);
 	if (ret)
 		return ret;
 
-	ret = alienware_update_led(location);
+	ret = alienware_update_led(priv, location);
 
 	return ret ? ret : count;
 }
@@ -569,9 +579,11 @@ static ssize_t lighting_control_state_show(struct device *dev,
 					   struct device_attribute *attr,
 					   char *buf)
 {
-	if (lighting_control_state == LEGACY_BOOTING)
+	struct alienfx_priv *priv = dev_get_drvdata(dev);
+
+	if (priv->lighting_control_state == LEGACY_BOOTING)
 		return sysfs_emit(buf, "[booting] running suspend\n");
-	else if (lighting_control_state == LEGACY_SUSPEND)
+	else if (priv->lighting_control_state == LEGACY_SUSPEND)
 		return sysfs_emit(buf, "booting running [suspend]\n");
 
 	return sysfs_emit(buf, "booting [running] suspend\n");
@@ -581,6 +593,7 @@ static ssize_t lighting_control_state_store(struct device *dev,
 					    struct device_attribute *attr,
 					    const char *buf, size_t count)
 {
+	struct alienfx_priv *priv = dev_get_drvdata(dev);
 	u8 val;
 
 	if (strcmp(buf, "booting\n") == 0)
@@ -592,9 +605,9 @@ static ssize_t lighting_control_state_store(struct device *dev,
 	else
 		val = WMAX_RUNNING;
 
-	lighting_control_state = val;
+	priv->lighting_control_state = val;
 	pr_debug("alienware-wmi: updated control state to %d\n",
-		 lighting_control_state);
+		 priv->lighting_control_state);
 
 	return count;
 }
@@ -651,43 +664,26 @@ static int wmax_brightness(int brightness)
 static void global_led_set(struct led_classdev *led_cdev,
 			   enum led_brightness brightness)
 {
+	struct alienfx_priv *priv = container_of(led_cdev, struct alienfx_priv,
+						 global_led);
 	int ret;
-	global_brightness = brightness;
+
+	priv->global_brightness = brightness;
+
 	if (interface == WMAX)
 		ret = wmax_brightness(brightness);
 	else
-		ret = alienware_update_led(0);
+		ret = alienware_update_led(priv, 0);
 	if (ret)
 		pr_err("LED brightness update failed\n");
 }
 
 static enum led_brightness global_led_get(struct led_classdev *led_cdev)
 {
-	return global_brightness;
-}
-
-static struct led_classdev global_led = {
-	.brightness_set = global_led_set,
-	.brightness_get = global_led_get,
-	.name = "alienware::global_brightness",
-};
+	struct alienfx_priv *priv = container_of(led_cdev, struct alienfx_priv,
+						 global_led);
 
-static int alienware_zone_init(struct platform_device *dev)
-{
-	if (interface == WMAX) {
-		lighting_control_state = WMAX_RUNNING;
-	} else if (interface == LEGACY) {
-		lighting_control_state = LEGACY_RUNNING;
-	}
-	global_led.max_brightness = 0x0F;
-	global_brightness = global_led.max_brightness;
-
-	return led_classdev_register(&dev->dev, &global_led);
-}
-
-static void alienware_zone_exit(struct platform_device *dev)
-{
-	led_classdev_unregister(&global_led);
+	return priv->global_brightness;
 }
 
 static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
@@ -792,7 +788,9 @@ static DEVICE_ATTR_RW(source);
 
 static bool hdmi_group_visible(struct kobject *kobj)
 {
-	return quirks->hdmi_mux;
+	struct alienfx_priv *priv = dev_get_drvdata(kobj_to_dev(kobj));
+
+	return priv->quirks->hdmi_mux;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
 
@@ -838,7 +836,9 @@ static DEVICE_ATTR_RO(status);
 
 static bool amplifier_group_visible(struct kobject *kobj)
 {
-	return quirks->amplifier;
+	struct alienfx_priv *priv = dev_get_drvdata(kobj_to_dev(kobj));
+
+	return priv->quirks->amplifier;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
 
@@ -906,7 +906,9 @@ static DEVICE_ATTR_RW(deepsleep);
 
 static bool deepsleep_group_visible(struct kobject *kobj)
 {
-	return quirks->deepslp;
+	struct alienfx_priv *priv = dev_get_drvdata(kobj_to_dev(kobj));
+
+	return priv->quirks->deepslp;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
 
@@ -1133,6 +1135,33 @@ static void remove_thermal_profile(void)
 /*
  * Platform Driver
  */
+static int alienfx_probe(struct platform_device *pdev)
+{
+	struct alienfx_priv *priv;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+	priv->pdev = pdev;
+	priv->quirks = quirks;
+
+	if (interface == WMAX)
+		priv->lighting_control_state = WMAX_RUNNING;
+	else if (interface == LEGACY)
+		priv->lighting_control_state = LEGACY_RUNNING;
+
+	priv->global_led.name = "alienware::global_brightness";
+	priv->global_led.brightness_set = global_led_set;
+	priv->global_led.brightness_get = global_led_get;
+	priv->global_led.max_brightness = 0x0F;
+
+	priv->global_brightness = priv->global_led.max_brightness;
+
+	return devm_led_classdev_register(&pdev->dev, &priv->global_led);
+}
+
 static const struct attribute_group *alienfx_groups[] = {
 	&zone_attribute_group,
 	&hdmi_attribute_group,
@@ -1145,7 +1174,9 @@ static struct platform_driver platform_driver = {
 	.driver = {
 		.name = "alienware-wmi",
 		.dev_groups = alienfx_groups,
+		.probe_type = PROBE_FORCE_SYNCHRONOUS,
 	},
+	.probe = alienfx_probe,
 };
 
 static int __init alienware_wmi_init(void)
@@ -1193,15 +1224,8 @@ static int __init alienware_wmi_init(void)
 			goto fail_prep_thermal_profile;
 	}
 
-	ret = alienware_zone_init(platform_device);
-	if (ret)
-		goto fail_prep_zones;
-
 	return 0;
 
-fail_prep_zones:
-	alienware_zone_exit(platform_device);
-	remove_thermal_profile();
 fail_prep_thermal_profile:
 	platform_device_del(platform_device);
 fail_platform_device2:
@@ -1216,7 +1240,6 @@ module_init(alienware_wmi_init);
 
 static void __exit alienware_wmi_exit(void)
 {
-	alienware_zone_exit(platform_device);
 	remove_thermal_profile();
 	platform_device_unregister(platform_device);
 	platform_driver_unregister(&platform_driver);
-- 
2.47.1

