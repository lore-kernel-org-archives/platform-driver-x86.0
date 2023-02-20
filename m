Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA51C61DA3
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Feb 2023 22:13:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232648AbjBTWNS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Feb 2023 17:13:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232640AbjBTWNR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Feb 2023 17:13:17 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D831E28D
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Feb 2023 14:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676931150;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AlibHVdyX399Ef3X6uxd5yO7sNGLKio5S4P5CpjNius=;
        b=gbi18py+W8o6HGjfwtlalYItNlw12hadjQdxqVu4RQAJLuXc3yPGy9AoSn7gnafsd6fKMp
        7uz4fIlv3/lsmFLd9RdImbZH2OuWtxUwYzPAD4ybV6s8SmQFhZ62q7r+tMyXB+SbCuda/X
        4i73bWSLRDDC4Q6EnOH8Ks1UrxG7EQE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-A6mykgb2Mn-4khnPEarkzQ-1; Mon, 20 Feb 2023 17:12:28 -0500
X-MC-Unique: A6mykgb2Mn-4khnPEarkzQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 461B029AA2CE;
        Mon, 20 Feb 2023 22:12:28 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.43])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9FAD4140EBF6;
        Mon, 20 Feb 2023 22:12:27 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 8/9] platform/x86: x86-android-tablets: Add gpio_keys support to x86_android_tablet_init()
Date:   Mon, 20 Feb 2023 23:12:11 +0100
Message-Id: <20230220221212.196009-9-hdegoede@redhat.com>
In-Reply-To: <20230220221212.196009-1-hdegoede@redhat.com>
References: <20230220221212.196009-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add gpio_keys instantation support to x86_android_tablet_init(), to avoid
this having to be repeated in various x86_dev_info.init() functions.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/asus.c   | 53 ++++---------------
 .../platform/x86/x86-android-tablets/core.c   | 30 ++++++++++-
 .../platform/x86/x86-android-tablets/other.c  | 37 ++-----------
 .../x86-android-tablets/x86-android-tablets.h |  4 ++
 4 files changed, 48 insertions(+), 76 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/asus.c b/drivers/platform/x86/x86-android-tablets/asus.c
index c7d3ca73ebd3..78e5d10eb803 100644
--- a/drivers/platform/x86/x86-android-tablets/asus.c
+++ b/drivers/platform/x86/x86-android-tablets/asus.c
@@ -8,7 +8,6 @@
  * Copyright (C) 2021-2023 Hans de Goede <hdegoede@redhat.com>
  */
 
-#include <linux/gpio_keys.h>
 #include <linux/input.h>
 
 #include "shared-psy-info.h"
@@ -25,7 +24,7 @@ static struct gpiod_lookup_table int3496_gpo2_pin22_gpios = {
 
 static struct gpio_keys_button asus_me176c_tf103c_lid = {
 	.code = SW_LID,
-	/* .gpio gets filled in by asus_me176c_tf103c_init() */
+	/* .gpio gets filled in by x86_android_tablet_init() */
 	.active_low = true,
 	.desc = "lid_sw",
 	.type = EV_SW,
@@ -33,40 +32,6 @@ static struct gpio_keys_button asus_me176c_tf103c_lid = {
 	.debounce_interval = 50,
 };
 
-static const struct gpio_keys_platform_data asus_me176c_tf103c_lid_pdata __initconst = {
-	.buttons = &asus_me176c_tf103c_lid,
-	.nbuttons = 1,
-	.name = "lid_sw",
-};
-
-static const struct platform_device_info asus_me176c_tf103c_pdevs[] __initconst = {
-	{
-		.name = "gpio-keys",
-		.id = PLATFORM_DEVID_AUTO,
-		.data = &asus_me176c_tf103c_lid_pdata,
-		.size_data = sizeof(asus_me176c_tf103c_lid_pdata),
-	},
-	{
-		/* For micro USB ID pin handling */
-		.name = "intel-int3496",
-		.id = PLATFORM_DEVID_NONE,
-	},
-};
-
-static int __init asus_me176c_tf103c_init(void)
-{
-	struct gpio_desc *gpiod;
-	int ret;
-
-	ret = x86_android_tablet_get_gpiod("INT33FC:02", 12, &gpiod);
-	if (ret < 0)
-		return ret;
-	asus_me176c_tf103c_lid.gpio = desc_to_gpio(gpiod);
-
-	return 0;
-}
-
-
 /* Asus ME176C tablets have an Android factory img with everything hardcoded */
 static const char * const asus_me176c_accel_mount_matrix[] = {
 	"-1", "0", "0",
@@ -200,15 +165,17 @@ static struct gpiod_lookup_table * const asus_me176c_gpios[] = {
 const struct x86_dev_info asus_me176c_info __initconst = {
 	.i2c_client_info = asus_me176c_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(asus_me176c_i2c_clients),
-	.pdev_info = asus_me176c_tf103c_pdevs,
-	.pdev_count = ARRAY_SIZE(asus_me176c_tf103c_pdevs),
+	.pdev_info = int3496_pdevs,
+	.pdev_count = 1,
 	.serdev_info = asus_me176c_serdevs,
 	.serdev_count = ARRAY_SIZE(asus_me176c_serdevs),
 	.gpiod_lookup_tables = asus_me176c_gpios,
 	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
 	.modules = bq24190_modules,
 	.invalid_aei_gpiochip = "INT33FC:02",
-	.init = asus_me176c_tf103c_init,
+	.gpio_keys_button = &asus_me176c_tf103c_lid,
+	.gpio_keys_gpiochip = "INT33FC:02",
+	.gpio_keys_pin = 12,
 };
 
 /* Asus TF103C tablets have an Android factory img with everything hardcoded */
@@ -345,11 +312,13 @@ static struct gpiod_lookup_table * const asus_tf103c_gpios[] = {
 const struct x86_dev_info asus_tf103c_info __initconst = {
 	.i2c_client_info = asus_tf103c_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(asus_tf103c_i2c_clients),
-	.pdev_info = asus_me176c_tf103c_pdevs,
-	.pdev_count = ARRAY_SIZE(asus_me176c_tf103c_pdevs),
+	.pdev_info = int3496_pdevs,
+	.pdev_count = 1,
 	.gpiod_lookup_tables = asus_tf103c_gpios,
 	.bat_swnode = &asus_tf103c_battery_node,
 	.modules = bq24190_modules,
 	.invalid_aei_gpiochip = "INT33FC:02",
-	.init = asus_me176c_tf103c_init,
+	.gpio_keys_button = &asus_me176c_tf103c_lid,
+	.gpio_keys_gpiochip = "INT33FC:02",
+	.gpio_keys_pin = 12,
 };
diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 5d04e63e1ebc..32819e7d4763 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -322,7 +322,8 @@ static __init int x86_android_tablet_init(void)
 		}
 	}
 
-	pdevs = kcalloc(dev_info->pdev_count, sizeof(*pdevs), GFP_KERNEL);
+	/* + 1 to make space for (optional) gpio_keys_button pdev */
+	pdevs = kcalloc(dev_info->pdev_count + 1, sizeof(*pdevs), GFP_KERNEL);
 	if (!pdevs) {
 		x86_android_tablet_cleanup();
 		return -ENOMEM;
@@ -352,6 +353,33 @@ static __init int x86_android_tablet_init(void)
 		}
 	}
 
+	if (dev_info->gpio_keys_button) {
+		struct gpio_keys_platform_data pdata = {
+			.buttons = dev_info->gpio_keys_button,
+			.nbuttons = 1,
+		};
+		struct gpio_desc *gpiod;
+
+		/* Get GPIO for the gpio-button */
+		ret = x86_android_tablet_get_gpiod(dev_info->gpio_keys_gpiochip,
+						   dev_info->gpio_keys_pin, &gpiod);
+		if (ret < 0) {
+			x86_android_tablet_cleanup();
+			return ret;
+		}
+
+		dev_info->gpio_keys_button->gpio = desc_to_gpio(gpiod);
+
+		pdevs[pdev_count] = platform_device_register_data(NULL, "gpio-keys",
+								  PLATFORM_DEVID_AUTO,
+								  &pdata, sizeof(pdata));
+		if (IS_ERR(pdevs[pdev_count])) {
+			x86_android_tablet_cleanup();
+			return PTR_ERR(pdevs[pdev_count]);
+		}
+		pdev_count++;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index a0f8c4bb3237..e4b3ad2ce7c1 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -9,7 +9,6 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/gpio_keys.h>
 #include <linux/input.h>
 
 #include "shared-psy-info.h"
@@ -95,7 +94,7 @@ const struct x86_dev_info acer_b1_750_info __initconst = {
  */
 static struct gpio_keys_button advantech_mica_071_button = {
 	.code = KEY_PROG1,
-	/* .gpio gets filled in by advantech_mica_071_init() */
+	/* .gpio gets filled in by x86_android_tablet_init() */
 	.active_low = true,
 	.desc = "prog1_key",
 	.type = EV_KEY,
@@ -103,38 +102,10 @@ static struct gpio_keys_button advantech_mica_071_button = {
 	.debounce_interval = 50,
 };
 
-static const struct gpio_keys_platform_data advantech_mica_071_button_pdata __initconst = {
-	.buttons = &advantech_mica_071_button,
-	.nbuttons = 1,
-	.name = "prog1_key",
-};
-
-static const struct platform_device_info advantech_mica_071_pdevs[] __initconst = {
-	{
-		.name = "gpio-keys",
-		.id = PLATFORM_DEVID_AUTO,
-		.data = &advantech_mica_071_button_pdata,
-		.size_data = sizeof(advantech_mica_071_button_pdata),
-	},
-};
-
-static int __init advantech_mica_071_init(void)
-{
-	struct gpio_desc *gpiod;
-	int ret;
-
-	ret = x86_android_tablet_get_gpiod("INT33FC:00", 2, &gpiod);
-	if (ret < 0)
-		return ret;
-	advantech_mica_071_button.gpio = desc_to_gpio(gpiod);
-
-	return 0;
-}
-
 const struct x86_dev_info advantech_mica_071_info __initconst = {
-	.pdev_info = advantech_mica_071_pdevs,
-	.pdev_count = ARRAY_SIZE(advantech_mica_071_pdevs),
-	.init = advantech_mica_071_init,
+	.gpio_keys_button = &advantech_mica_071_button,
+	.gpio_keys_gpiochip = "INT33FC:00",
+	.gpio_keys_pin = 2,
 };
 
 /*
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index 2023b53e0df2..f93d0fc61b7d 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -10,6 +10,7 @@
 #ifndef __X86_ANDROID_TABLETS_H
 #define __X86_ANDROID_TABLETS_H
 
+#include <linux/gpio_keys.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/i2c.h>
@@ -67,6 +68,9 @@ struct x86_dev_info {
 	int i2c_client_count;
 	int pdev_count;
 	int serdev_count;
+	int gpio_keys_pin;
+	const char *gpio_keys_gpiochip;
+	struct gpio_keys_button *gpio_keys_button;
 	int (*init)(void);
 	void (*exit)(void);
 };
-- 
2.39.1

