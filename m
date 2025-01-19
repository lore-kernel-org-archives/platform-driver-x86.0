Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A996A1DFE03;
	Sun, 19 Jan 2025 22:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737324360; cv=none; b=Py68Snw6Ax4rp80FOZEsEcjpHAgzYEFJrxbFWFftp+zcECbobqu+34mGDZLgXgQmDspZCkyMyW40853MjYi5bOE8t17kY+xZ5kTFI5vS2fBkRcjyeR+zAgVg7yknG7H6r4nL9o2+myNhXzErJyW5hJcL0ujZ9W0EaQWpTiMghhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737324360; c=relaxed/simple;
	bh=OyM/dVSjT0Npr0iILPQFoi9HKOpxcLIKag0jUE/bjhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQcXABK5XpYaiMWr3Ewrnj0eTZMF8ko0v6dinJ+uDMiDemy69YKcf5tr6VDIb6cnViAn/lwGFqverm0Moj6jcmst/kRunCql4H7AxOCMUEXzlKlMpsvnjsyh03zqs+JSoyyGcs11HnEhORVoan7gnylRqr93hJJsPbhcYlyqyIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JbIjNnII; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JbIjNnII"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b7041273ddso305578485a.3;
        Sun, 19 Jan 2025 14:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737324357; x=1737929157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14fzd8omXgiDsWYm9jLGs9osZNuEWGaoObZu1p63Zi0=;
        b=JbIjNnIIBQZUKtaU3Al24mp1bYV9jkigbISUbHeJo/f+sA3LFdE3QyruR0QuRMLDdX
         eHdEmrRRg5+g8UBIG63Hrn1AY9NDEu2ihVRIQukSZLaIRVa54Xz1BlPbeD+XMR9jWbgd
         +ZqDPSKQziWUZhNMGEOoCI0W/7iHWiHib/k30jMsTR/odorI49wssbmGDg5cl2pQno8S
         bVZhabboy2birwKtClDxaV7Ko0bUVoM9Z5HfaRJ67AW/Yma7aaHthCKnHBSqoN85vsM1
         3cQ1B1Ng0MlpZ43nlHkRc8dZcioAxxHvf6Zfe6MSDnwM3Kks01XefFl7tn+YOLtVIr/S
         pnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737324357; x=1737929157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14fzd8omXgiDsWYm9jLGs9osZNuEWGaoObZu1p63Zi0=;
        b=iPzNpXB+jY0f7DghUc8mqW350S7/1/cMndoGsIl6tW2xba7B9ZHJhtsv858ImVw/Sm
         UX+HFMQYvtZ9jwxuUUkr76qLw8/3DXhYi1Qhc9p1hw+dlgyuXJh673KkZnQ+Ieq+Wi24
         xkVQ3gkFTM50WFeX/zhM3DqBIBk0hwzusHrpWMVvxLwiHHY/FNocQEvlY2lalTL31l+9
         Pzik+YT385sSDd4t+h20ePk4KlGEFsP0YS1UkUtrf9OzfJGbzMvTtru4YfW7WMlECrAk
         TM+EMDWYX0t9sfPpIGnUSkpaanS5jNB+7xBlJHQ9oC3cCteb3Z1KAiDiq9454/l5yvdI
         NXdw==
X-Forwarded-Encrypted: i=1; AJvYcCUklLY5YYIbNgplp3hTw+gxIrAuIF3Y3EBOc+4Xgllg80XPk9c1LwOKzOqGk1LL9GzTd7PYnmx8R9D7f0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKWOiD5HRoKjIURcth+4MrSOtHk9gP510RfvBYT9awoMQC/tck
	xijQ8KDrUOcczt5r/NU3YLmGtGHs+LdiZ/01/ZYSv9BMt751jGFscriQ4g==
X-Gm-Gg: ASbGncuqQN2FvMGevda/FhGC/R5SZ2lw2f1q7liIkovPedovbzjbrMtvANtx25bYhn+
	2GxbXVcDKc6CXsR4lypVaj4J65VUd5FpxZaKK+j5m+lzhbJxNNuwp0jHT/X9pYUwLlBAaXwNmO+
	7L52zsZUen+19NNkeWJoByqm5sAsbbJvpFipG2b8qBeXzXRBcAdpKOKG1ZNPzQXg13XnF1BP/us
	PscwXDJlDk1dLMoJIr5MRMzyLurvuDHTX3e51Y5z2CakLVu25VPYSvQcBwuTazho0/Vba4VWZ8W
	AA==
X-Google-Smtp-Source: AGHT+IEEFlvn7SQRzS6yS3PLLM0WgewDqrjGFZEGe4h7+a7XmZeshnCQIbQmUyayDBFOBhNKaJ3MVw==
X-Received: by 2002:a05:620a:3705:b0:7b6:f34a:c0db with SMTP id af79cd13be357-7be63276c14mr2000183885a.57.1737324356994;
        Sun, 19 Jan 2025 14:05:56 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be614f0096sm369243085a.112.2025.01.19.14.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 14:05:56 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v5 01/14] platform/x86: alienware-wmi: Add a state container for LED control feature
Date: Sun, 19 Jan 2025 17:05:29 -0500
Message-ID: <20250119220542.3136-2-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119220542.3136-1-kuurtb@gmail.com>
References: <20250119220542.3136-1-kuurtb@gmail.com>
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
longer needed.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 117 ++++++++++++----------
 1 file changed, 65 insertions(+), 52 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 63cf016bc912..5779b025761b 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -404,13 +404,18 @@ struct wmax_u32_args {
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
@@ -442,7 +447,7 @@ static int parse_rgb(const char *buf, struct color_platform *colors)
 /*
  * Individual RGB zone control
  */
-static int alienware_update_led(u8 location)
+static int alienware_update_led(struct alienfx_priv *priv, u8 location)
 {
 	int method_id;
 	acpi_status status;
@@ -452,21 +457,21 @@ static int alienware_update_led(u8 location)
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
@@ -485,22 +490,26 @@ static int alienware_update_led(u8 location)
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
@@ -568,9 +577,11 @@ static ssize_t lighting_control_state_show(struct device *dev,
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
@@ -580,6 +591,7 @@ static ssize_t lighting_control_state_store(struct device *dev,
 					    struct device_attribute *attr,
 					    const char *buf, size_t count)
 {
+	struct alienfx_priv *priv = dev_get_drvdata(dev);
 	u8 val;
 
 	if (strcmp(buf, "booting\n") == 0)
@@ -591,9 +603,9 @@ static ssize_t lighting_control_state_store(struct device *dev,
 	else
 		val = WMAX_RUNNING;
 
-	lighting_control_state = val;
+	priv->lighting_control_state = val;
 	pr_debug("alienware-wmi: updated control state to %d\n",
-		 lighting_control_state);
+		 priv->lighting_control_state);
 
 	return count;
 }
@@ -653,43 +665,26 @@ static int wmax_brightness(int brightness)
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
+	struct alienfx_priv *priv = container_of(led_cdev, struct alienfx_priv,
+						 global_led);
 
-	return led_classdev_register(&dev->dev, &global_led);
-}
-
-static void alienware_zone_exit(struct platform_device *dev)
-{
-	led_classdev_unregister(&global_led);
+	return priv->global_brightness;
 }
 
 static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
@@ -1145,6 +1140,30 @@ static int create_thermal_profile(struct platform_device *platform_device)
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
@@ -1158,6 +1177,7 @@ static struct platform_driver platform_driver = {
 		.name = "alienware-wmi",
 		.dev_groups = alienfx_groups,
 	},
+	.probe = alienfx_probe,
 };
 
 static int __init alienware_wmi_init(void)
@@ -1205,14 +1225,8 @@ static int __init alienware_wmi_init(void)
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
@@ -1227,7 +1241,6 @@ module_init(alienware_wmi_init);
 
 static void __exit alienware_wmi_exit(void)
 {
-	alienware_zone_exit(platform_device);
 	platform_device_unregister(platform_device);
 	platform_driver_unregister(&platform_driver);
 }
-- 
2.48.1

