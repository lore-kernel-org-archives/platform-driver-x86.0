Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1133F155A30;
	Sun,  5 Jan 2025 15:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736091083; cv=none; b=mPQIsTqTg6eav53VjlOfSOisHI/Y0zIVRCkbqjdlMhqc3tih2NO8yaV1stqyl72P9G4RiI33QSI5zun82QgqoIXkcGiJTDb5O3J7v64c2DQgtMlMyWlWAOxoDDNW+FwcaCuTO0EHLF+vP8VT64EEk/+hYfR/VyVC7ArajcdxMfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736091083; c=relaxed/simple;
	bh=cuZXuHVXtkHgwdixzn6+UhTb7HfNTS22cGJVlOJjC4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IxYdh/15xtdc+BUIwIckq8tT4VzNgqXEMoKPCuL4+hwAOQgddHFBe2uHvzoB4+PRlJHrt5jztP3Axb3F2R1m2q1eAPKr4mrMpdzfpCrRQRtPSqeBAVDX6Vpv4wClKwux0i3a9WKl5UeLTtzZ5ltItU0IyTH2mJ2Q/3BE9ViEcts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3prNJ2/; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3prNJ2/"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-85ba92b3acfso5652068241.1;
        Sun, 05 Jan 2025 07:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736091078; x=1736695878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eczrdLgGeysgn3Gf5HP1ycGTqNNImmH5MgljjO1dCkc=;
        b=m3prNJ2/unnuBD+wBqRJDyyHJdB2+tyGt5CjPzHiAuasXhfth0HzW2xBR0o2Nn5Xkr
         bPEzlFTiP7FbcJo/Bo1c24w8FzPO3TOLpubyiOJcUWYPrEwQeYP/yCYWGGZSOc7DiP4E
         JD9+mwy0DvDsEkCad8bOHvX1FaBP5MsE51LVSpaYR1b75EVzKL2sAwqdpKmB+H64sd6z
         JXn9lFnhczu9jXmzV6hIvI5ohh12yYtbS+Nd8YPtSxb3N1JELh1X01AhXzw9tsS1xbb1
         AaIxrqOwFLGUTTYjpydBcT06E2nAfVNmFg+yV+l+uAHvGyxwEOyfRcBc/3HUvtYLNZM1
         lGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736091078; x=1736695878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eczrdLgGeysgn3Gf5HP1ycGTqNNImmH5MgljjO1dCkc=;
        b=cT6wDC6pI8UDPtrlrBEToS8e8JQ+sPawpD6rmbjT1aTpPFoUd/iIwftS+jaVsKXDrN
         fc4+PO6dcGP2YK0ZtcMAiVw9mhS6EonqbDwKhpDKfqOdZ4jF+iNd+XKEBNNolJMlN77Y
         WR/twXc7za/hEUfCnpHDK9vwqGHqu8wOMd89opFUV2+Uly7WhvjibKfpgsV7+6urT8YA
         Y22CfPnarKlJRNmEsaL8sCz3yPnB2uFWEhQ0qWD5FQtUmqWv9Kfdb7kpXzGbfZNyE3Pl
         WC7rvYGq8PWi814ZAfZfIgLnSciJRLCfvr7eaYtiU0zsl4qmE2BUYX/LSjzGsImOjaBY
         u3Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWhgXgq3jApURaB+1zet71dvKFqfv8rQsvLJE9M7NjpUQVlJfE+smhZkXGHeEMBD29kFpHubM1kKRb2x7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz255124OE+wiJpGvJMUDeOCgxP6UI7QSlVa265Z2/cmMIoJxuG
	QdHGjwHyl2+NEWWZ+59eX17tIPagyiNDm5ln+u5pnMwID0pPSeXS53UBtQ==
X-Gm-Gg: ASbGnctC2nubfesGx7U7H6jAdlDDiiWdFjsBd5xp4TyaerlOGvYgc0vJVAAbeh1rIeP
	ekM9kTTbVX196ldkyoTBLXg85J8Gq+0lH8b3vmNVXH2EDDXiBgXGVSlr3zshW8Bie0d+L8Uldjx
	lxOKjifNrKrkklOeAopENAzKeU2xOsbbmnaLniCeWF7mzNSJ0GCjd5tc8RokJMDD1ZrA8zaI8sI
	ceibblmomIkWphueBBM148fI+s4Uw0FZIn4YIMi7YhzKvCsTitSpMURYKJqEQ70
X-Google-Smtp-Source: AGHT+IF9wi4a8mUAiQHaCxOGGxSwv3nR1NFp/mZs6hT9XND7O4G9aLBOmfqF66ImuOoqsGS6i7m+yg==
X-Received: by 2002:a05:6102:440b:b0:4b2:49ff:e470 with SMTP id ada2fe7eead31-4b2cc449353mr35665817137.21.1736091078372;
        Sun, 05 Jan 2025 07:31:18 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3f34bsm6778975241.28.2025.01.05.07.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:31:17 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	w_armin@gmx.de,
	mario.limonciello@amd.com,
	hdegoede@redhat.com,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v3 07/20] platform/x86: alienware-wmi: Add a state container for LED control feature
Date: Sun,  5 Jan 2025 10:30:07 -0500
Message-ID: <20250105153019.19206-9-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105153019.19206-2-kuurtb@gmail.com>
References: <20250105153019.19206-2-kuurtb@gmail.com>
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
 drivers/platform/x86/dell/alienware-wmi.c | 119 ++++++++++++----------
 1 file changed, 67 insertions(+), 52 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 190fee7539bf..ca7b9f649541 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -404,14 +404,19 @@ struct wmax_u32_args {
 	u8 arg3;
 };
 
+struct alienfx_priv {
+	struct platform_device *pdev;
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
@@ -443,7 +448,7 @@ static int parse_rgb(const char *buf, struct color_platform *colors)
 /*
  * Individual RGB zone control
  */
-static int alienware_update_led(u8 location)
+static int alienware_update_led(struct alienfx_priv *priv, u8 location)
 {
 	int method_id;
 	acpi_status status;
@@ -453,21 +458,21 @@ static int alienware_update_led(u8 location)
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
@@ -486,22 +491,26 @@ static int alienware_update_led(u8 location)
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
@@ -569,9 +578,11 @@ static ssize_t lighting_control_state_show(struct device *dev,
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
@@ -581,6 +592,7 @@ static ssize_t lighting_control_state_store(struct device *dev,
 					    struct device_attribute *attr,
 					    const char *buf, size_t count)
 {
+	struct alienfx_priv *priv = dev_get_drvdata(dev);
 	u8 val;
 
 	if (strcmp(buf, "booting\n") == 0)
@@ -592,9 +604,9 @@ static ssize_t lighting_control_state_store(struct device *dev,
 	else
 		val = WMAX_RUNNING;
 
-	lighting_control_state = val;
+	priv->lighting_control_state = val;
 	pr_debug("alienware-wmi: updated control state to %d\n",
-		 lighting_control_state);
+		 priv->lighting_control_state);
 
 	return count;
 }
@@ -654,43 +666,26 @@ static int wmax_brightness(int brightness)
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
+	struct alienfx_priv *priv = container_of(led_cdev, struct alienfx_priv,
+						 global_led);
 
-static struct led_classdev global_led = {
-	.brightness_set = global_led_set,
-	.brightness_get = global_led_get,
-	.name = "alienware::global_brightness",
-};
-
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
@@ -1130,6 +1125,32 @@ static int create_thermal_profile(struct platform_device *platform_device)
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
@@ -1143,6 +1164,7 @@ static struct platform_driver platform_driver = {
 		.name = "alienware-wmi",
 		.dev_groups = alienfx_groups,
 	},
+	.probe = alienfx_probe,
 };
 
 static int __init alienware_wmi_init(void)
@@ -1190,14 +1212,8 @@ static int __init alienware_wmi_init(void)
 			goto fail_prep_thermal_profile;
 	}
 
-	ret = alienware_zone_init(platform_device);
-	if (ret)
-		goto fail_prep_zones;
-
 	return 0;
 
-fail_prep_zones:
-	alienware_zone_exit(platform_device);
 fail_prep_thermal_profile:
 	platform_device_del(platform_device);
 fail_platform_device2:
@@ -1212,7 +1228,6 @@ module_init(alienware_wmi_init);
 
 static void __exit alienware_wmi_exit(void)
 {
-	alienware_zone_exit(platform_device);
 	platform_device_unregister(platform_device);
 	platform_driver_unregister(&platform_driver);
 }
-- 
2.47.1

