Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1268C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat, 19 Feb 2022 14:07:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242170AbiBSOIP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 19 Feb 2022 09:08:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238867AbiBSOIO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 19 Feb 2022 09:08:14 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7D3F1C9184
        for <platform-driver-x86@vger.kernel.org>; Sat, 19 Feb 2022 06:07:53 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id hw13so21599550ejc.9
        for <platform-driver-x86@vger.kernel.org>; Sat, 19 Feb 2022 06:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:in-reply-to:references:from:date:subject:to:cc;
        bh=Cxr3nGgo1PSgVhwRE/F9uc9xc4DM7cTg6abhvwjr2eY=;
        b=u0QF6J+SeIe/QHqw7xpXdTziJ6X9IW8TbJHFEKhsELLIpET6fLiHngp+CgwcALDYAL
         YJARyHmMGQ9bzQR2fFpLeiJqLuCbw2If5pMUOZ77WEopn5tVUqdCWFox2jiF0xGKOyna
         JROWhRUR+gHcXLAjUvK0uZxSdQLywag0vyCvFPsLvlTkewhnWkp06T6Qt6lQYL54V7zl
         q89Omd0FwCgL9+tN0qoKdXYgmt3VF8wy1QCylpIsXqntNUfniVjqMPSH+UWqo9auiTDl
         wrVAYOyAaJGbmrIOPo9bJWjWIyIW5duzW08CA9IvqiUwVXHKqKzYW3SvFrsVtXBFT4K5
         jHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:in-reply-to:references:from:date
         :subject:to:cc;
        bh=Cxr3nGgo1PSgVhwRE/F9uc9xc4DM7cTg6abhvwjr2eY=;
        b=jwal+KjM48ViWSpAyrXs04dv8n1J7g2BLC6L2hLXK281upxc04DQTHoFk2hjcoP6eG
         OqGWL4j/VWW4yESZLNzMU/s2WyC7yX0CthpYzXPzKjmlxT1ewGDmWvIDwtbydcnnRjCJ
         46ITsv0JYGHnJiKwHt6GXeVO/PzNUyLrtWihlb7xBgI3Us849gjdD0tEKpu0YkgpWVq3
         IRktBvX/xkoYiZacWm68j4h3jyrSEum059/Lbwn/D2K8pG36MV5DLo5+njibiBDDHc/P
         OmalDcBi9/QQuEkXPfOsEzhGOyymphFhu1HFjEYcimai0K5JRCu4VkPwQJ7XdlgUF/2g
         o7IQ==
X-Gm-Message-State: AOAM533ais6EkPFsz16Er6uZru/lVRvLHFeQnGBsf1hc6vU7V1XiQAEo
        OuKXoRV65V/dDEpwsgK4cq0+91Q4MuPrU9M=
X-Google-Smtp-Source: ABdhPJzOTUIxvu1+MT2MyglHS1dlw31DHOSfOEd9fezxYD3h4cUjdpXAEWk1onNAggwmfzMvozYNRQ==
X-Received: by 2002:a17:907:2a53:b0:6ce:e4fe:3f92 with SMTP id fe19-20020a1709072a5300b006cee4fe3f92mr9921178ejc.389.1645279670848;
        Sat, 19 Feb 2022 06:07:50 -0800 (PST)
Received: from localhost ([2a00:a040:195:22d0:fc1:2409:df36:9b25])
        by smtp.gmail.com with ESMTPSA id 23sm3211436ejf.215.2022.02.19.06.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 06:07:50 -0800 (PST)
Message-Id: <eca2fa354f60b8a6e5a5c9c8e244fea56616970a.1645278914.git.matan@svgalib.org>
In-Reply-To: <cover.1645278914.git.matan@svgalib.org>
References: <cover.1645278914.git.matan@svgalib.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Sat, 19 Feb 2022 15:54:46 +0200
Subject: [PATCH 2/2] lg-laptop: Move setting of battery charge limit to common
 location
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

For now leave also the driver specific location,
with deprecated warning in documentation.

Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
---
 .../ABI/testing/sysfs-platform-lg-laptop      |  2 +-
 .../admin-guide/laptops/lg-laptop.rst         |  2 +-
 drivers/platform/x86/lg-laptop.c              | 57 ++++++++++++++++---
 3 files changed, 51 insertions(+), 10 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-platform-lg-laptop b/Documentation/ABI/testing/sysfs-platform-lg-laptop
index cf47749b19df..d226058049ce 100644
--- a/Documentation/ABI/testing/sysfs-platform-lg-laptop
+++ b/Documentation/ABI/testing/sysfs-platform-lg-laptop
@@ -16,7 +16,7 @@ What:		/sys/devices/platform/lg-laptop/battery_care_limit
 Date:		October 2018
 KernelVersion:	4.20
 Contact:	"Matan Ziv-Av <matan@svgalib.org>
-Description:
+Description: <deprecated> use /sys/class/power_supply/CMB0/charge_control_end_threshold
         Maximal battery charge level. Accepted values are 80 or 100.
 
 What:		/sys/devices/platform/lg-laptop/fan_mode
diff --git a/Documentation/admin-guide/laptops/lg-laptop.rst b/Documentation/admin-guide/laptops/lg-laptop.rst
index 6fbe165dcd27..67fd6932cef4 100644
--- a/Documentation/admin-guide/laptops/lg-laptop.rst
+++ b/Documentation/admin-guide/laptops/lg-laptop.rst
@@ -38,7 +38,7 @@ FN lock.
 Battery care limit
 ------------------
 
-Writing 80/100 to /sys/devices/platform/lg-laptop/battery_care_limit
+Writing 80/100 to /sys/class/power_supply/CMB0/charge_control_end_threshold
 sets the maximum capacity to charge the battery. Limiting the charge
 reduces battery capacity loss over time.
 
diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index a91847a551a7..332868b140ed 100644
--- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -17,6 +17,8 @@
 #include <linux/platform_device.h>
 #include <linux/types.h>
 
+#include <acpi/battery.h>
+
 #define LED_DEVICE(_name, max, flag) struct led_classdev _name = { \
 	.name           = __stringify(_name),   \
 	.max_brightness = max,                  \
@@ -458,14 +460,14 @@ static ssize_t fn_lock_show(struct device *dev,
 	return sysfs_emit(buffer, "%d\n", status);
 }
 
-static ssize_t battery_care_limit_store(struct device *dev,
-					struct device_attribute *attr,
-					const char *buffer, size_t count)
+static ssize_t charge_control_end_threshold_store(struct device *dev,
+						  struct device_attribute *attr,
+						  const char *buf, size_t count)
 {
 	unsigned long value;
 	int ret;
 
-	ret = kstrtoul(buffer, 10, &value);
+	ret = kstrtoul(buf, 10, &value);
 	if (ret)
 		return ret;
 
@@ -486,9 +488,9 @@ static ssize_t battery_care_limit_store(struct device *dev,
 	return -EINVAL;
 }
 
-static ssize_t battery_care_limit_show(struct device *dev,
-				       struct device_attribute *attr,
-				       char *buffer)
+static ssize_t charge_control_end_threshold_show(struct device *device,
+						 struct device_attribute *attr,
+						 char *buf)
 {
 	unsigned int status;
 	union acpi_object *r;
@@ -520,15 +522,52 @@ static ssize_t battery_care_limit_show(struct device *dev,
 	if (status != 80 && status != 100)
 		status = 0;
 
-	return sysfs_emit(buffer, "%d\n", status);
+	return sysfs_emit(buf, "%d\n", status);
+}
+
+static ssize_t battery_care_limit_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buffer)
+{
+	return charge_control_end_threshold_show(dev, attr, buffer);
+}
+
+static ssize_t battery_care_limit_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buffer, size_t count)
+{
+	return charge_control_end_threshold_store(dev, attr, buffer, count);
 }
 
 static DEVICE_ATTR_RW(fan_mode);
 static DEVICE_ATTR_RW(usb_charge);
 static DEVICE_ATTR_RW(reader_mode);
 static DEVICE_ATTR_RW(fn_lock);
+static DEVICE_ATTR_RW(charge_control_end_threshold);
 static DEVICE_ATTR_RW(battery_care_limit);
 
+static int lg_battery_add(struct power_supply *battery)
+{
+	if (device_create_file(&battery->dev,
+			       &dev_attr_charge_control_end_threshold))
+		return -ENODEV;
+
+	return 0;
+}
+
+static int lg_battery_remove(struct power_supply *battery)
+{
+	device_remove_file(&battery->dev,
+			   &dev_attr_charge_control_end_threshold);
+	return 0;
+}
+
+static struct acpi_battery_hook battery_hook = {
+	.add_battery = lg_battery_add,
+	.remove_battery = lg_battery_remove,
+	.name = "LG Battery Extension",
+};
+
 static struct attribute *dev_attributes[] = {
 	&dev_attr_fan_mode.attr,
 	&dev_attr_usb_charge.attr,
@@ -711,6 +750,7 @@ static int acpi_add(struct acpi_device *device)
 	led_classdev_register(&pf_device->dev, &tpad_led);
 
 	wmi_input_setup();
+	battery_hook_register(&battery_hook);
 
 	return 0;
 
@@ -728,6 +768,7 @@ static int acpi_remove(struct acpi_device *device)
 	led_classdev_unregister(&tpad_led);
 	led_classdev_unregister(&kbd_backlight);
 
+	battery_hook_unregister(&battery_hook);
 	wmi_input_destroy();
 	platform_device_unregister(pf_device);
 	pf_device = NULL;
-- 
Matan.

