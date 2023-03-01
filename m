Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00254C64ED6
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 09:26:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjCAJZm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 04:25:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjCAJZL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 04:25:11 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 061D834F5A
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 01:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677662631;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yjqMXspg0d6HcsD3k+Hkf3ttNZbcpgD/PI0Rgs9Tp+s=;
        b=cdDMx/HJvcKiy+NANC6Uz/hz6RMurU7mPsrw7UuOgILvPQEnLftDHfQqK5XJRqbsB2U0DT
        eTik4jljG2MUA4KGdza8xwlOsW/ZSv7jrdMWxTJhdSYRKAOaQsZN5bX9fydJMtOFK3/wnM
        AfcLJng57YdTAYfwEm4/3HF/5Dugntg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-wKGb8xuTO7uouYgINvAEaQ-1; Wed, 01 Mar 2023 04:23:46 -0500
X-MC-Unique: wKGb8xuTO7uouYgINvAEaQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66CF23810B0D;
        Wed,  1 Mar 2023 09:23:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.30])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B6F954010E86;
        Wed,  1 Mar 2023 09:23:45 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 09/14] platform/x86: x86-android-tablets: Add gpio_keys support to x86_android_tablet_init()
Date:   Wed,  1 Mar 2023 10:23:26 +0100
Message-Id: <20230301092331.7038-10-hdegoede@redhat.com>
In-Reply-To: <20230301092331.7038-1-hdegoede@redhat.com>
References: <20230301092331.7038-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add gpio_keys instantation support to x86_android_tablet_init(), to avoid
this having to be repeated in various x86_dev_info.init() functions.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/asus.c   | 65 +++++--------------
 .../platform/x86/x86-android-tablets/core.c   | 30 ++++++++-
 .../platform/x86/x86-android-tablets/other.c  | 51 ++++-----------
 .../x86-android-tablets/x86-android-tablets.h |  8 +++
 4 files changed, 64 insertions(+), 90 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/asus.c b/drivers/platform/x86/x86-android-tablets/asus.c
index 74c3b10e9ca7..cfa038b44b43 100644
--- a/drivers/platform/x86/x86-android-tablets/asus.c
+++ b/drivers/platform/x86/x86-android-tablets/asus.c
@@ -8,8 +8,6 @@
  * Copyright (C) 2021-2023 Hans de Goede <hdegoede@redhat.com>
  */
 
-#include <linux/gpio_keys.h>
-#include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/input.h>
 #include <linux/platform_device.h>
@@ -26,50 +24,19 @@ static struct gpiod_lookup_table int3496_gpo2_pin22_gpios = {
 	},
 };
 
-static struct gpio_keys_button asus_me176c_tf103c_lid = {
-	.code = SW_LID,
-	/* .gpio gets filled in by asus_me176c_tf103c_init() */
-	.active_low = true,
-	.desc = "lid_sw",
-	.type = EV_SW,
-	.wakeup = true,
-	.debounce_interval = 50,
-};
-
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
+static struct x86_gpio_button asus_me176c_tf103c_lid = {
+	.button = {
+		.code = SW_LID,
+		.active_low = true,
+		.desc = "lid_sw",
+		.type = EV_SW,
+		.wakeup = true,
+		.debounce_interval = 50,
 	},
+	.chip = "INT33FC:02",
+	.pin = 12,
 };
 
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
@@ -203,15 +170,15 @@ static struct gpiod_lookup_table * const asus_me176c_gpios[] = {
 const struct x86_dev_info asus_me176c_info __initconst = {
 	.i2c_client_info = asus_me176c_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(asus_me176c_i2c_clients),
-	.pdev_info = asus_me176c_tf103c_pdevs,
-	.pdev_count = ARRAY_SIZE(asus_me176c_tf103c_pdevs),
+	.pdev_info = int3496_pdevs,
+	.pdev_count = 1,
 	.serdev_info = asus_me176c_serdevs,
 	.serdev_count = ARRAY_SIZE(asus_me176c_serdevs),
+	.gpio_button = &asus_me176c_tf103c_lid,
 	.gpiod_lookup_tables = asus_me176c_gpios,
 	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
 	.modules = bq24190_modules,
 	.invalid_aei_gpiochip = "INT33FC:02",
-	.init = asus_me176c_tf103c_init,
 };
 
 /* Asus TF103C tablets have an Android factory img with everything hardcoded */
@@ -348,11 +315,11 @@ static struct gpiod_lookup_table * const asus_tf103c_gpios[] = {
 const struct x86_dev_info asus_tf103c_info __initconst = {
 	.i2c_client_info = asus_tf103c_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(asus_tf103c_i2c_clients),
-	.pdev_info = asus_me176c_tf103c_pdevs,
-	.pdev_count = ARRAY_SIZE(asus_me176c_tf103c_pdevs),
+	.pdev_info = int3496_pdevs,
+	.pdev_count = 1,
+	.gpio_button = &asus_me176c_tf103c_lid,
 	.gpiod_lookup_tables = asus_tf103c_gpios,
 	.bat_swnode = &asus_tf103c_battery_node,
 	.modules = bq24190_modules,
 	.invalid_aei_gpiochip = "INT33FC:02",
-	.init = asus_me176c_tf103c_init,
 };
diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 779d49c66987..245167674aa2 100644
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
 
+	if (dev_info->gpio_button) {
+		struct gpio_keys_platform_data pdata = {
+			.buttons = &dev_info->gpio_button->button,
+			.nbuttons = 1,
+		};
+		struct gpio_desc *gpiod;
+
+		/* Get GPIO for the gpio-button */
+		ret = x86_android_tablet_get_gpiod(dev_info->gpio_button->chip,
+						   dev_info->gpio_button->pin, &gpiod);
+		if (ret < 0) {
+			x86_android_tablet_cleanup();
+			return ret;
+		}
+
+		dev_info->gpio_button->button.gpio = desc_to_gpio(gpiod);
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
index 83b30b24d57f..c1bde42315c4 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -9,8 +9,6 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/gpio_keys.h>
-#include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/input.h>
 #include <linux/platform_device.h>
@@ -96,48 +94,21 @@ const struct x86_dev_info acer_b1_750_info __initconst = {
  * which is not described in the ACPI tables in anyway.
  * Use the x86-android-tablets infra to create a gpio-button device for this.
  */
-static struct gpio_keys_button advantech_mica_071_button = {
-	.code = KEY_PROG1,
-	/* .gpio gets filled in by advantech_mica_071_init() */
-	.active_low = true,
-	.desc = "prog1_key",
-	.type = EV_KEY,
-	.wakeup = false,
-	.debounce_interval = 50,
-};
-
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
+static struct x86_gpio_button advantech_mica_071_button = {
+	.button = {
+		.code = KEY_PROG1,
+		.active_low = true,
+		.desc = "prog1_key",
+		.type = EV_KEY,
+		.wakeup = false,
+		.debounce_interval = 50,
 	},
+	.chip = "INT33FC:00",
+	.pin = 2,
 };
 
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
+	.gpio_button = &advantech_mica_071_button,
 };
 
 /*
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index 19994b501903..fb499a2c42d9 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -10,6 +10,7 @@
 #ifndef __PDX86_X86_ANDROID_TABLETS_H
 #define __PDX86_X86_ANDROID_TABLETS_H
 
+#include <linux/gpio_keys.h>
 #include <linux/i2c.h>
 #include <linux/irqdomain_defs.h>
 
@@ -58,6 +59,12 @@ struct x86_serdev_info {
 	const char *serdev_hid;
 };
 
+struct x86_gpio_button {
+	struct gpio_keys_button button;
+	const char *chip;
+	int pin;
+};
+
 struct x86_dev_info {
 	char *invalid_aei_gpiochip;
 	const char * const *modules;
@@ -66,6 +73,7 @@ struct x86_dev_info {
 	const struct x86_i2c_client_info *i2c_client_info;
 	const struct platform_device_info *pdev_info;
 	const struct x86_serdev_info *serdev_info;
+	struct x86_gpio_button *gpio_button;
 	int i2c_client_count;
 	int pdev_count;
 	int serdev_count;
-- 
2.39.1

