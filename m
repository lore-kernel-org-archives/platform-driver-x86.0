Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8437B1DF244;
	Sat, 21 Dec 2024 06:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734760807; cv=none; b=FWvTd4Tx8P0PnH0/tL2G5IfgPL6zFmlL88+mhjOTmD22bCDZOj56RaYBQ5sPdH4YvLqMMbvYN7lguNd7cvXV/10hiv1B4ADK6EjE0tZ36GRYzO9WscIuXAEHcozBk8eaJtosdhN0Afhn8pwBViwc9qoSU5EgEoDrL+4KHCbYC9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734760807; c=relaxed/simple;
	bh=wulRflbPUaW6RKQwczJ+LtaxsUrFR1aLiz6pwPtoGfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I60R0sw0ifK/dm/maiO8X1Zo9LNB4tzSzwErkBhn1yquDYnPhlq4VaSLCxRjocZQfbr9GBHVaV9+QO6xrdKR6EG16KIramjyDvoLJEjVDvsGYtyfaFO9E1Faur4xREmqLd17YyOikZJF7uvnyLrM4tYe+6wyNcN0f3TtqBDp4sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJniPTyq; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJniPTyq"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6eff8289d0eso24499387b3.0;
        Fri, 20 Dec 2024 22:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734760804; x=1735365604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7nffjsnSIqpBs0PqW9iXhHcMwuHRA//bqv2uuGdZOM=;
        b=LJniPTyqdvV6yZ6WrXxK7dsVy8tHANToGAywU7W1C0Iy6cdO+ojxY0+vJ9tWaW/MQB
         3EEn9v1oP7IguRC8c/UInxZ76H3xyRQ/OKGDXq2ibzjwloAyI4Emv0XoT8HNiIPsTERs
         tDqAtoVKoF+QhoWW4PHpA9IvvKxHTeH2pGrrMyVRTYOutHkVujtM7YL7ROlu3MTQxXLj
         ETIVgZZfcPbcMSZapdaYjKHmV8xcv32zaPD4H/Ik+ZYbETvug3rsupqSUDHoVsuCPbbo
         t87piQv4RYdsNuNnZF5LtKoZQYVnaZlnTgx0UZ16J2hhwhPh0c3TKxd6UYtD/DVQ2uPJ
         xeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734760804; x=1735365604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7nffjsnSIqpBs0PqW9iXhHcMwuHRA//bqv2uuGdZOM=;
        b=fR4LddqoBy2sPKjNptMMYqVEwzyTgHqwJE9AvRD8ENscywWNb6NkNrlSuIZS7Cqe2b
         aruJWDJppcNV+PM2QHGse7lMakW96ElXOTGghk941Jx8Lc2fYU7Rf4SGqZT5r3b9tBSZ
         WSUq3Q1CFPUndSfIvKMbq47HJ6b2vxQfnxbjjpp4QMW93jUnZvtDjXC+TCE1nJjhzFX7
         kuDVEd07hGwiO5mT5nJcl/LPAZT/hJKJ/3wH2974LP9YMU2FYBKDmGHxzQrNCAXDFC/2
         m2RKlSZ2IQ7zv32qb0YLCRciQCguCRiG8sFui0voLHjwLqCLyMAFxcNw9whgnuyxvNFM
         kQ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwxTvsehh7bShhH5DPyNnAnqm8t7oPerXXpvzPAxMddIcemr2XSrabdblrXVlGpNIZ56oAMKAkykGH9+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxefxQwewotfGXRrfqB91XzW02dw0H0HezzqRYW4AT+YvR1+m4s
	qCn0hjHdDai1efZVrx8qms9XwutwnH0zHoxfCwXMpU8Y95JAELFKkiVWOA==
X-Gm-Gg: ASbGncv2bUEU0VKFpsuQGGPDS7bJGmGAX0o7OjyG1GPE5+bxMFJRAJm5cnwbu4Q/ad/
	mPi1Uu48h3rE5ZEAqkpAcGl38DoN5CKweHopeBHIM7QA9huyvCw9hSqOTc2ie0smq176mnRrS38
	xKxQqUNHv1U9bjLaCX5nu3laCfW8KhgXZyN96Uc/Bq/LQ+2cR8VQTKo7P74hZrH9aig78Z3TXfP
	ZVIwShMcL168LaMRjsPXmvdAVVOtfByvdL7Vb47snKaZa4RjotyGM94nXt1vNco
X-Google-Smtp-Source: AGHT+IEpYmvkqphZrc0H3b+ITTob8eIY5aGbdroyb/RQKprXcVQj2U4T1UOAu6JGCtTBa8JvuZkaOw==
X-Received: by 2002:a05:690c:7203:b0:6ee:b6b6:dcac with SMTP id 00721157ae682-6f3f8145f99mr43467427b3.23.1734760803846;
        Fri, 20 Dec 2024 22:00:03 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783ab9dsm12164077b3.119.2024.12.20.22.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 22:00:03 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 05/20] alienware-wmi: Improve rgb-zones group creation
Date: Sat, 21 Dec 2024 00:59:02 -0500
Message-ID: <20241221055917.10555-6-kuurtb@gmail.com>
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

Define zone_attrs statically with the use of helper macros and
initialize the zone_attribute_group with driver's .dev_groups.

Drop match_zone() and instead pass a `location` argument to previous
show/store methods to access the correct `zone` LED state. On top of
that rename zone_set() -> zone_store() to be more consistent with sysfs
conventions.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 179 +++++++++-------------
 1 file changed, 72 insertions(+), 107 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index e010c94555e8..a431b1fec9fb 100644
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
@@ -510,35 +484,54 @@ static int alienware_update_led(struct platform_zone *zone)
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
 
+#define ALIENWARE_ZONE_SHOW_FUNC(_num)					\
+	static ssize_t zone0##_num##_show(struct device *dev,		\
+					struct device_attribute *attr,	\
+					char *buf)			\
+	{								\
+		return zone_show(dev, attr, buf, _num);			\
+	}
+
+#define ALIENWARE_ZONE_STORE_FUNC(_num)					\
+	static ssize_t zone0##_num##_store(struct device *dev,		\
+					struct device_attribute *attr,	\
+					const char *buf, size_t count)	\
+	{								\
+		return zone_store(dev, attr, buf, count, _num);		\
+	}
+
+#define ALIENWARE_ZONE_ATTR(_num)					\
+	ALIENWARE_ZONE_SHOW_FUNC(_num)					\
+	ALIENWARE_ZONE_STORE_FUNC(_num)					\
+	static DEVICE_ATTR_RW(zone0##_num)
+
+ALIENWARE_ZONE_ATTR(0);
+ALIENWARE_ZONE_ATTR(1);
+ALIENWARE_ZONE_ATTR(2);
+ALIENWARE_ZONE_ATTR(3);
+
 /*
  * Lighting control state device attribute (Global)
  */
@@ -578,6 +571,33 @@ static ssize_t lighting_control_state_store(struct device *dev,
 
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
@@ -606,7 +626,7 @@ static void global_led_set(struct led_classdev *led_cdev,
 	if (interface == WMAX)
 		ret = wmax_brightness(brightness);
 	else
-		ret = alienware_update_led(&zone_data[0]);
+		ret = alienware_update_led(0);
 	if (ret)
 		pr_err("LED brightness update failed\n");
 }
@@ -624,9 +644,6 @@ static struct led_classdev global_led = {
 
 static int alienware_zone_init(struct platform_device *dev)
 {
-	u8 zone;
-	char *name;
-
 	if (interface == WMAX) {
 		lighting_control_state = WMAX_RUNNING;
 	} else if (interface == LEGACY) {
@@ -635,65 +652,12 @@ static int alienware_zone_init(struct platform_device *dev)
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
@@ -1143,6 +1107,7 @@ static void remove_thermal_profile(void)
  * Platform Driver
  */
 static const struct attribute_group *alienfx_groups[] = {
+	&zone_attribute_group,
 	&hdmi_attribute_group,
 	&amplifier_attribute_group,
 	&deepsleep_attribute_group,
-- 
2.47.1

