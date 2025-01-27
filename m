Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790A515ADB4;
	Mon, 27 Jan 2025 04:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737950662; cv=none; b=CHQqNGbLvFEHG4oo3Rm5mtPw79jzo5pCBA4w2WpmclcWfHVt0ESf73Ie2YrYgJ7FoKtsY89hBa+Vd/dxnCovIrnNDmr6g9qFNBkjeRNpc7CeDNMyII6D8xemQXUdwCPMYf3IFMVgzCUdZNirm47lm75LBiW9uffSfK6pK0lq3h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737950662; c=relaxed/simple;
	bh=49eKxDqQtP3po1mBGZJU1bNO+vDFpnsz8KG9NigI21E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZebJLY4yPItpgSPxdJhRmgfN2uxzfBWXfL9BkJAz9MbMNpxWEwvkEIW3Q700UNSo0nPLldMcPMUdOxbOwb3ovcVmbgFO24ERZQ8W0knnHad3MOz34FoNQZBJUizZX0AapgRE93MHG4IFCSR+Qq8vtKXli/jji3HbQ++TDnBD/Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tm+TelF5; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tm+TelF5"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4aff31b77e8so1433892137.1;
        Sun, 26 Jan 2025 20:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737950659; x=1738555459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78jUbb12GWv+OJbtaS4vNafGBdENBEI5UTnuBg/ppNE=;
        b=Tm+TelF5x6ofHANwK6TgRm1vQ3406lnIX9ArXfnulGhQhCe6qNwMAcUPH4ZDNmoNvu
         c6ucPWeQEreSE6LGbfbGNKoyMeF7Y04srCS5A5ycNRtt5jWCzszU+KPt2o2OLGmSDKnN
         oQuS1zjZsKoHO8h2CRo76VoiQ0nxlumMZ/62ruYFLeei0OMQs9DK/cNlk+l5OPdZyC6a
         RdHG8DL7BEcrT0L15YoLuH3iOCOXVXm6MvU/OTAh1TL/2592PM5RvZpJF2EpKCVIpKQn
         XVhfhOipFceUuwF4y99B4HR76iwfb5C0k/14U5wAJQd6sqhtto7g+F91UJI4pzewYFwQ
         LNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737950659; x=1738555459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78jUbb12GWv+OJbtaS4vNafGBdENBEI5UTnuBg/ppNE=;
        b=xCIGUvCCxFn7SDB6TEeVocKu3d08+DS2JkZM1eR4ol2CxJNWIx/Dpncv2AKZTGhu26
         rr7IpJ20ceHK5EkIrgu/WxejpX7Bjn9loelB8d7yszWXz7Fbw1Lhpxkszp42A3kJ4J5g
         6H4EfzDPx+oCs+zc36AIwPghslrx6P0K+2JQln1I02m61MyRVoT0qySeOUOU0MVWq7Fr
         sP3z0Dsl8Ru/w/lOkHG9LPSmTh00t73Ua/ruJhLB0Qkw4VlUV4f1tM2z+8rOV8tCrESp
         iZszx2VVe/HgQGsR/StE+czx/a72ComGkH0XZwgFdyu3Q9utHA5b49PMD/7HUF5GUkLA
         W80Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYoNdAyaYa4frkGD7ahd5gAcToN+CiQW2jdUuMdeJVpXxUUfC+JH5dn/MY2XGlmXYqZvBR1IKGleo4bB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyowrW3EUirMIlaaI+YVSZNfOXFMy1GZOST8u9I2Cg/KVyOmPbE
	82y17jvwvtnzqW0IdemY8qORdDk3wSDdYZhxPmUWF2ueV7oxpCgLbI5eig==
X-Gm-Gg: ASbGncvW0zY3ln7FVQsZcw1zSbxNhz+st6m4mKVqbiB14V3l07wFSQnJbtCBLfp5ZHk
	+ZoH/UIDuQhkXzeCBHcQpZCdc49AQvBaQri3ALNCmMpha6a7UFuvx6ycwIN6YrGA8gub/E9Su1/
	qhL9mmNa5CTCm4+0NaeTFZ53A0gjmzrd6OeaWanuLcrcaajMdDH+PI+AJzDWzXID7mUT4W1YOM5
	eGhPTKB7EcDEdp0Ei6ARDkqLPK1M+BCqf4+QexLIEmkvaX/57BEZ1sj4OBJFsBmWzhRYPRsgtlg
	fDAmPjTD7G7T
X-Google-Smtp-Source: AGHT+IEc+xeWMI2ykjEDCMmWhbs2BlLl1rxoHtNVb/MHBRu59yWf8HoHapThFymraTfwTWNG8FPXxg==
X-Received: by 2002:a05:6102:38c9:b0:4b2:5d16:f75 with SMTP id ada2fe7eead31-4b690b8b049mr31130465137.4.1737950658838;
        Sun, 26 Jan 2025 20:04:18 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c176f0sm1733758241.23.2025.01.26.20.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 20:04:18 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v6 01/14] platform/x86: alienware-wmi: Add a state container for LED control feature
Date: Sun, 26 Jan 2025 23:03:53 -0500
Message-ID: <20250127040406.17112-2-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250127040406.17112-1-kuurtb@gmail.com>
References: <20250127040406.17112-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a state container for the "alienware-wmi" platform device and
initialize it on the new alienfx_probe(). Migrate all LED control functions
to use this state container to support upcoming file split.

Additionally move the led_classdev registration to the platform driver
probe and make it device managed.

Drop alienware_zone_init() and alienware_zone_exit() because they are no
longer needed and mimic the `quirks->num_zone > 0` check by failing the
platform device probe.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 125 ++++++++++++----------
 1 file changed, 68 insertions(+), 57 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index e252e0cf47ef..ab86deb1adb9 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -413,13 +413,18 @@ struct wmax_u32_args {
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
 static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
 
 static u8 interface;
-static u8 lighting_control_state;
-static u8 global_brightness;
 
 /*
  * Helpers used for zone control
@@ -451,7 +456,7 @@ static int parse_rgb(const char *buf, struct color_platform *colors)
 /*
  * Individual RGB zone control
  */
-static int alienware_update_led(u8 location)
+static int alienware_update_led(struct alienfx_priv *priv, u8 location)
 {
 	int method_id;
 	acpi_status status;
@@ -461,21 +466,21 @@ static int alienware_update_led(u8 location)
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
@@ -494,22 +499,26 @@ static int alienware_update_led(u8 location)
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
@@ -577,9 +586,11 @@ static ssize_t lighting_control_state_show(struct device *dev,
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
@@ -589,6 +600,7 @@ static ssize_t lighting_control_state_store(struct device *dev,
 					    struct device_attribute *attr,
 					    const char *buf, size_t count)
 {
+	struct alienfx_priv *priv = dev_get_drvdata(dev);
 	u8 val;
 
 	if (strcmp(buf, "booting\n") == 0)
@@ -600,9 +612,9 @@ static ssize_t lighting_control_state_store(struct device *dev,
 	else
 		val = WMAX_RUNNING;
 
-	lighting_control_state = val;
+	priv->lighting_control_state = val;
 	pr_debug("alienware-wmi: updated control state to %d\n",
-		 lighting_control_state);
+		 priv->lighting_control_state);
 
 	return count;
 }
@@ -662,46 +674,26 @@ static int wmax_brightness(int brightness)
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
-	if (!quirks->num_zones)
-		return;
-
-	led_classdev_unregister(&global_led);
+	return priv->global_brightness;
 }
 
 static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
@@ -1157,6 +1149,33 @@ static int create_thermal_profile(struct platform_device *platform_device)
 /*
  * Platform Driver
  */
+static int alienfx_probe(struct platform_device *pdev)
+{
+	struct alienfx_priv *priv;
+
+	if (!quirks->num_zones)
+		return -ENODEV;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	if (interface == WMAX)
+		priv->lighting_control_state = WMAX_RUNNING;
+	else
+		priv->lighting_control_state = LEGACY_RUNNING;
+
+	priv->pdev = pdev;
+	priv->global_led.name = "alienware::global_brightness";
+	priv->global_led.brightness_set = global_led_set;
+	priv->global_led.brightness_get = global_led_get;
+	priv->global_led.max_brightness = 0x0F;
+	priv->global_brightness = priv->global_led.max_brightness;
+	platform_set_drvdata(pdev, priv);
+
+	return devm_led_classdev_register(&pdev->dev, &priv->global_led);
+}
+
 static const struct attribute_group *alienfx_groups[] = {
 	&zone_attribute_group,
 	&hdmi_attribute_group,
@@ -1170,6 +1189,7 @@ static struct platform_driver platform_driver = {
 		.name = "alienware-wmi",
 		.dev_groups = alienfx_groups,
 	},
+	.probe = alienfx_probe,
 };
 
 static int __init alienware_wmi_init(void)
@@ -1217,16 +1237,8 @@ static int __init alienware_wmi_init(void)
 			goto fail_prep_thermal_profile;
 	}
 
-	if (quirks->num_zones > 0) {
-		ret = alienware_zone_init(platform_device);
-		if (ret)
-			goto fail_prep_zones;
-	}
-
 	return 0;
 
-fail_prep_zones:
-	alienware_zone_exit(platform_device);
 fail_prep_thermal_profile:
 	platform_device_del(platform_device);
 fail_platform_device2:
@@ -1241,7 +1253,6 @@ module_init(alienware_wmi_init);
 
 static void __exit alienware_wmi_exit(void)
 {
-	alienware_zone_exit(platform_device);
 	platform_device_unregister(platform_device);
 	platform_driver_unregister(&platform_driver);
 }
-- 
2.48.1

