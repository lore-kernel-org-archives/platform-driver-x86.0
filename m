Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C5A1F1911;
	Sat, 21 Dec 2024 06:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734760812; cv=none; b=YppyhLEdwjRAXTq8a1E6V5wqf+L46HVSCwBcJqYt7sMKhAWo4eEBhtNrQqg785+2634jnW7XhOg3Jf3KXm2frw8WwTHev/irEBHyQONggRTeBheqtD9fjysUbSY11Xx4S2HdFiGuTpCXxr2Z/RaEnXzzVMRC/JEdegx9JDM0O8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734760812; c=relaxed/simple;
	bh=U64X1LlDQuseKDIy4JNNUn6PtImjDcHyVETZJ74LskU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NhX3x79yW0pDEwJ+SL5zD2SrVtQOMfEmUpCyPHkzYZRZf2/+FXzSt9EDN1iqm4T9gwph7cxqfnh/mM+W+a7UXJu8dgUEwFFeFLU1qNIUuKgVEd04Ov/6vAh2y8Zdslg6jXO3i1T9F/XhiH90U+cUMszjc9nwWLAPDYML6sS2gv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZ5fe9uo; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZ5fe9uo"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e3983426f80so2091804276.1;
        Fri, 20 Dec 2024 22:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734760809; x=1735365609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ssL+X/fFHGV+LQbx4dvwp2ckIrGOZB1LfrUOjyCS0g=;
        b=NZ5fe9uoWwBfZkz3B1+fHsSu8fSLyfB6KQnil1jn0uMR2ko8GnzneF7tdmRGVVEciZ
         ip45beJe8wSptaD/0/nGbAMVAvsV9Ch7ePjdH6K/G2IjULB0XfC9jlMZpVw7AAiTnfN/
         V+TQwrmFaTdOcqRMNJnoJB9efWDghYuG1FLOKrYQK8WZIlibXQHO71G8W5r6YhEqH5cr
         8PxNQmoEeCcweWVFTCDsFWxxIU1ySk+vl0e7aiY2cB+qljGTnfEn4kktVh24vxStmzue
         rytAObQXisDBagAy8ij965JsZwlctUPBA5DP7krjvKvOZ4k4j9ADIcTIgScTxdY6gxii
         df3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734760809; x=1735365609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ssL+X/fFHGV+LQbx4dvwp2ckIrGOZB1LfrUOjyCS0g=;
        b=Bwzm0fF9jTe++m4tzlcL7J82QegRieRovh67J1F94UoY52cMrw9x9wJp1BC4Cdjy8+
         3TUwB5BIsmdd0ojJ7MKDWUNiQvpMV2/SwsUezg6NmquKjB4tHjAjNQ765lbYEUv5U4gC
         e1UNpi1W32zRjl+Qmq3Gj+8kFS6BopFjnhrM1l79lKfzmkVM2+TzrbodIw8+KmOkirSO
         4vMBOsjlajsyGVpdNGA1u7U5G2t5Rsd6wpWUJwXSSvIPzaDujmQ8dHki8OMLFkjrgJnh
         /Hr07IB848zbUA0AjW6F/Wj+PbrHOJe21hrvaO1bDCThV7nqWM8epEicMCdKWk/d248U
         N4cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcwbCAFOdHn+nOfCwb8Xug3tSVq11T5rJ3p/EiQ5BtijezhuofmNr20nSMhkU+M99Cd4zE81RKOGmKQao=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg3LLcKDK7FsDsIdSkINprvMzg+uF+oX19NchG03paSf0y2j/y
	TUoQ5cJ1dAFQjHT04bIU4hbeZpUaieZMWWHjdSQ1A4PkM5bV5x0itG7+qQ==
X-Gm-Gg: ASbGncuHqzClPRxbK4LGgOg1QEqnDrWB06X6uv5pLygPlvc0knEBgejhed6fK8fiMTR
	dykiWcplgMOenQkjw5cGvnQ2Hf3JdYhzm0EedF3RqbOMQlCL2hhH9bVduRJUFWwyMf+SSoWgjGF
	UjT4eRCTw5M/Ej5kAYCUcDKnaZi56S5ng1XXTOUsotFY8JDRXKqRljU2EVC6hTpX40HQHv5iis9
	qTrftw07tBUAV2KRB0Jwvwj0DIbmwJz5DcNjd+jFB3jtN9O2qbSqkO88ZZPqqeW
X-Google-Smtp-Source: AGHT+IH9Ic6HBIkT5QNFK1pF+puaz8lS7wFYcTx2IFB2x3FwwRYQ4TpL1qGPjgFfUBYo5kuRX9F+yg==
X-Received: by 2002:a05:690c:7249:b0:6ef:6c57:ddc6 with SMTP id 00721157ae682-6f3f8216b49mr44484657b3.34.1734760808699;
        Fri, 20 Dec 2024 22:00:08 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783ab9dsm12164077b3.119.2024.12.20.22.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 22:00:07 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 07/20] alienware-wmi: Add a state container for LED control feature
Date: Sat, 21 Dec 2024 00:59:04 -0500
Message-ID: <20241221055917.10555-8-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241221055917.10555-1-kuurtb@gmail.com>
References: <20241221055917.10555-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a state container for the "alienware-wmi" platform device and
initialize it on the new alienfx_probe(). Migrate all LED control functions
to use this state container.

Additionally move the led_classdev registration to the platform driver
probe and make it device managed.

Drop alienware_zone_init() and alienware_zone_exit() because they are no
longer needed.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 128 +++++++++++++---------
 1 file changed, 76 insertions(+), 52 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 67cf376df0f5..4b68d64bd742 100644
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
@@ -486,22 +491,32 @@ static int alienware_update_led(u8 location)
 static ssize_t zone_show(struct device *dev, struct device_attribute *attr,
 			 char *buf, u8 location)
 {
+	struct color_platform *colors;
+	struct alienfx_priv *priv;
+
+	priv = dev_get_drvdata(dev);
+	colors = &priv->colors[location];
+
 	return sprintf(buf, "red: %d, green: %d, blue: %d\n",
-		       colors[location].red, colors[location].green,
-		       colors[location].blue);
+		       colors->red, colors->green, colors->blue);
 
 }
 
 static ssize_t zone_store(struct device *dev, struct device_attribute *attr,
 			  const char *buf, size_t count, u8 location)
 {
+	struct color_platform *colors;
+	struct alienfx_priv *priv;
 	int ret;
 
-	ret = parse_rgb(buf, &colors[location]);
+	priv = dev_get_drvdata(dev);
+	colors = &priv->colors[location];
+
+	ret = parse_rgb(buf, colors);
 	if (ret)
 		return ret;
 
-	ret = alienware_update_led(location);
+	ret = alienware_update_led(priv, location);
 
 	return ret ? ret : count;
 }
@@ -539,9 +554,13 @@ static ssize_t lighting_control_state_show(struct device *dev,
 					   struct device_attribute *attr,
 					   char *buf)
 {
-	if (lighting_control_state == LEGACY_BOOTING)
+	struct alienfx_priv *priv;
+
+	priv = dev_get_drvdata(dev);
+
+	if (priv->lighting_control_state == LEGACY_BOOTING)
 		return sysfs_emit(buf, "[booting] running suspend\n");
-	else if (lighting_control_state == LEGACY_SUSPEND)
+	else if (priv->lighting_control_state == LEGACY_SUSPEND)
 		return sysfs_emit(buf, "booting running [suspend]\n");
 
 	return sysfs_emit(buf, "booting [running] suspend\n");
@@ -551,8 +570,11 @@ static ssize_t lighting_control_state_store(struct device *dev,
 					    struct device_attribute *attr,
 					    const char *buf, size_t count)
 {
+	struct alienfx_priv *priv;
 	u8 val;
 
+	priv = dev_get_drvdata(dev);
+
 	if (strcmp(buf, "booting\n") == 0)
 		val = LEGACY_BOOTING;
 	else if (strcmp(buf, "suspend\n") == 0)
@@ -562,9 +584,9 @@ static ssize_t lighting_control_state_store(struct device *dev,
 	else
 		val = WMAX_RUNNING;
 
-	lighting_control_state = val;
+	priv->lighting_control_state = val;
 	pr_debug("alienware-wmi: updated control state to %d\n",
-		 lighting_control_state);
+		 priv->lighting_control_state);
 
 	return count;
 }
@@ -621,43 +643,26 @@ static int wmax_brightness(int brightness)
 static void global_led_set(struct led_classdev *led_cdev,
 			   enum led_brightness brightness)
 {
+	struct alienfx_priv *priv;
 	int ret;
-	global_brightness = brightness;
+
+	priv = container_of(led_cdev, struct alienfx_priv, global_led);
+	priv->global_brightness = brightness;
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
+	struct alienfx_priv *priv;
 
-	return led_classdev_register(&dev->dev, &global_led);
-}
+	priv = container_of(led_cdev, struct alienfx_priv, global_led);
 
-static void alienware_zone_exit(struct platform_device *dev)
-{
-	led_classdev_unregister(&global_led);
+	return priv->global_brightness;
 }
 
 static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
@@ -1106,6 +1111,32 @@ static void remove_thermal_profile(void)
 /*
  * Platform Driver
  */
+static int alienfx_probe(struct platform_device *pdev)
+{
+	struct alienfx_priv *priv;
+	struct led_classdev *leds;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	platform_set_drvdata(pdev, priv);
+
+	priv->pdev = pdev;
+
+	if (interface == WMAX)
+		priv->lighting_control_state = WMAX_RUNNING;
+	else if (interface == LEGACY)
+		priv->lighting_control_state = LEGACY_RUNNING;
+
+	leds = &priv->global_led;
+	leds->name = "alienware::global_brightness";
+	leds->brightness_set = global_led_set;
+	leds->brightness_get = global_led_get;
+	leds->max_brightness = 0x0F;
+
+	priv->global_brightness = priv->global_led.max_brightness;
+
+	return devm_led_classdev_register(&pdev->dev, &priv->global_led);
+}
+
 static const struct attribute_group *alienfx_groups[] = {
 	&zone_attribute_group,
 	&hdmi_attribute_group,
@@ -1119,6 +1150,7 @@ static struct platform_driver platform_driver = {
 		.name = "alienware-wmi",
 		.dev_groups = alienfx_groups,
 	},
+	.probe = alienfx_probe,
 };
 
 static int __init alienware_wmi_init(void)
@@ -1166,15 +1198,8 @@ static int __init alienware_wmi_init(void)
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
@@ -1189,7 +1214,6 @@ module_init(alienware_wmi_init);
 
 static void __exit alienware_wmi_exit(void)
 {
-	alienware_zone_exit(platform_device);
 	remove_thermal_profile();
 	platform_device_unregister(platform_device);
 	platform_driver_unregister(&platform_driver);
-- 
2.47.1

