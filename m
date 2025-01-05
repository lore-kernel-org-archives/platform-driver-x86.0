Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6199E1552FA;
	Sun,  5 Jan 2025 15:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736091078; cv=none; b=qChU/E+TLQy2O8BXOpaQLXKGmt41vFeo3ZrsQnC3rC9NVC+ixkV5Tmd9y15WmvzPdjV8BeJTbCZhz1F733F5CfWmY6k3wZc+zaQmvXTWGOBFiopmaWW5/+EqoaQ67ZAhfS2wGIKjA4XI9jPQJLUM0iPUWTEHVV8HPk5hVKn/Sls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736091078; c=relaxed/simple;
	bh=HkjY6Ez9FRIN5INJ+IBdqHpMDRmMBUABEnbSBzmpGuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cZAy3Oqn5+Yl8iaqmuE7XZCUfETaTM07Vo2qTajD6fzVcrjPTKqHIQ306ktytB2YmhOzd21d4mC4tl048PVoURNbvW99dSKKAt1hjxMU37X9bW6rb6Q5XF7EfFJuxNv57x8dVHN5kSsIFbZNFdeWqu1QWIXaB/e8bBzzhTTbZgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQmwYBGC; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQmwYBGC"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5189105c5f5so7162565e0c.0;
        Sun, 05 Jan 2025 07:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736091073; x=1736695873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DU4TmM4leWVJU7DXQsu0FaAeIpL0mPnNsEC7E/7AJYU=;
        b=hQmwYBGCbDD88b3E3PHIdqiHUSz4/K26oxws/snEEsAjqrx30MF/oGI036rk7MAXon
         lUyxhtMMWCX0kuAdY6vGmyS6VFG2+3saMfpeld0QL0a/tVpndaJxmrUJt3KG8v6LZsY7
         D2Pb7LJg53J1+IvXIE2QJVz0oEjoSZSPb7Nv+5Q7iq8IDvh+TqLoYjWOkTwvEQhDaUwD
         Rb/xZjh8J8FHmjTCVGLKjwPqLY7POTs1DOAKI+zuEYwkzFlBJ1TBtDX74Odv4Z8YFVoK
         rryVhLiIaWtB3vYEUSX3zgsqqF5iwCqInrh+FViMegFso24pJ228ffsvjRPFzv+dc3Lk
         44DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736091073; x=1736695873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DU4TmM4leWVJU7DXQsu0FaAeIpL0mPnNsEC7E/7AJYU=;
        b=RxLq0LNHZHFiE7FJDxe+2+gJ7YaubNs9mzx0c++IZeQ07Rt54h6pHRC1xqFiE7YSej
         h//ND/dNJ4ExKTuMcQabG/wWB2RI6zm9WoCukamTUWkMdHt3YgwsQR/z/7Pr48XV1Bhi
         kmUwe91jAGKSlMFjbMwcT3rtmH7iCo5g53Uw93mi/lDCa7FzRnwHkA+myQnJEBPprnnS
         lxAgNos8Eupl+TYi9jFeLgsOD0uVprMvQUZ1+/djZ/xU/YeX+DLP/rgyskGMRfOEYMxA
         FJ6YTtpPdNW/83Z+gjEtoc8IEfNhWCFmx4KilRvTDuai3gC+lOVu2wC7O1zOMdjPJYsK
         yOhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBmLfJBn2Yznuu0TKn9+M9z1mrRhCU7/YMgw0kMaTtB/8TYtA/wZNJTRkoKXeeXfgk9EglaKRe9DNqamE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQf8+NaWo75bdUzYCI7rMNX28F34xDRvXwc+Lobu/US/wfS0Vj
	ev4X7zjrHZfRNIfK2dw1xaOWVET/Op/a9iUHAKislU7ZgrnCWhwzUH8R7A==
X-Gm-Gg: ASbGnctVplXUj1c4Ycytupo0/FgWanLDEZeqsdCOfDc4C3Mab6UEceBUB3RlzeLFE2s
	QDB5cgmvje584PYIUMmfwoP/HvWyi2CiHtzOqcCtLNmrrwvAt3MI8OuMwBUcD53kiIpdGP0a0Fk
	EwqBDDf+EdUgTFmC1q8MTY3EQtxV2PzMnqx6VBm3k7K6fUI2CbzeP6O2zewnzIvq42qbGshbFC5
	03qrWX+wxYPBWGwhn+Uff6EvDwgslhRmYngwVeyG0DlUIZUBsAZsaiF6qHeXzDc
X-Google-Smtp-Source: AGHT+IFfFMys1vlFGlHCZIud2T0e/7ei+t1Pgi3PdpJzM2tJumdQDQ6G18jUmkNardmmHCILnHCKWg==
X-Received: by 2002:a05:6122:4884:b0:518:89d9:dd99 with SMTP id 71dfb90a1353d-51b75c2a515mr44469325e0c.3.1736091072833;
        Sun, 05 Jan 2025 07:31:12 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3f34bsm6778975241.28.2025.01.05.07.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:31:12 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	w_armin@gmx.de,
	mario.limonciello@amd.com,
	hdegoede@redhat.com,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v3 05/20] platform/x86: alienware-wmi: Improve rgb-zones group creation
Date: Sun,  5 Jan 2025 10:30:05 -0500
Message-ID: <20250105153019.19206-7-kuurtb@gmail.com>
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

Define zone_attrs statically and initialize zone_attribute_group with
platform driver's .dev_groups.

Drop match_zone() and instead pass a `location` argument to previous
show/store methods to access the correct `zone` LED state. On top of
that rename zone_set() -> zone_store() to be more consistent with sysfs
conventions.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 212 +++++++++++-----------
 1 file changed, 105 insertions(+), 107 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 16a131cc9f11..418abf46b593 100644
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
@@ -578,6 +601,36 @@ static ssize_t lighting_control_state_store(struct device *dev,
 
 static DEVICE_ATTR_RW(lighting_control_state);
 
+static umode_t zone_attr_visible(struct kobject *kobj,
+				 struct attribute *attr, int n)
+{
+	if (n < quirks->num_zones + 1)
+		return attr->mode;
+
+	return 0;
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
@@ -606,7 +659,7 @@ static void global_led_set(struct led_classdev *led_cdev,
 	if (interface == WMAX)
 		ret = wmax_brightness(brightness);
 	else
-		ret = alienware_update_led(&zone_data[0]);
+		ret = alienware_update_led(0);
 	if (ret)
 		pr_err("LED brightness update failed\n");
 }
@@ -624,9 +677,6 @@ static struct led_classdev global_led = {
 
 static int alienware_zone_init(struct platform_device *dev)
 {
-	u8 zone;
-	char *name;
-
 	if (interface == WMAX) {
 		lighting_control_state = WMAX_RUNNING;
 	} else if (interface == LEGACY) {
@@ -635,65 +685,12 @@ static int alienware_zone_init(struct platform_device *dev)
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
@@ -1137,6 +1134,7 @@ static int create_thermal_profile(struct platform_device *platform_device)
  * Platform Driver
  */
 static const struct attribute_group *alienfx_groups[] = {
+	&zone_attribute_group,
 	&hdmi_attribute_group,
 	&amplifier_attribute_group,
 	&deepsleep_attribute_group,
-- 
2.47.1

