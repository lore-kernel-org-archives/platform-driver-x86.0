Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE62C77B75
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 May 2023 21:00:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231698AbjEEU76 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 May 2023 16:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbjEEU74 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 May 2023 16:59:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771D65254
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 May 2023 13:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683320354;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=lMUuRid/JO1nnlAiQd9ru36hciCnUvJqzgP/dFcQGd8=;
        b=OMAI6vTxu28sdC0K5Qrj245BGwhNi5QBOv41gLGbbj/Xdp+f3xL77cihtys8ehV7BSPbFN
        kkMayIC+DEMytQzEQ+YCYkx53deAc6NVtfugKNHKTEfJtRK+X0xzcqvjc7Wq/P3TuXSbFc
        M8VHE5S/1F3dS3ClEFE0nE7X72OmTs0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-i6ZMHiXANNK1PsZJVKYgSQ-1; Fri, 05 May 2023 16:59:11 -0400
X-MC-Unique: i6ZMHiXANNK1PsZJVKYgSQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD8D43804514;
        Fri,  5 May 2023 20:59:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.14])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 18BF01410F23;
        Fri,  5 May 2023 20:59:09 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: x86-android-tablets: Add support for more then 1 gpio_key
Date:   Fri,  5 May 2023 22:59:00 +0200
Message-Id: <20230505205901.42649-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Modify the gpio_keys support in x86_android_tablet_init() for
tablets which have more then 1 key/button which needs to be handled
by the gpio_keys driver.

This requires copying over the struct gpio_keys_button from
the x86_gpio_button struct array to a new gpio_keys_button struct array,
as an added benefit this allows marking the per model x86_gpio_button
arrays __initconst so that they all can be freed after module init().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/asus.c   |  4 ++-
 .../platform/x86/x86-android-tablets/core.c   | 33 ++++++++++++-------
 .../platform/x86/x86-android-tablets/lenovo.c |  6 ++--
 .../platform/x86/x86-android-tablets/other.c  |  6 ++--
 .../x86-android-tablets/x86-android-tablets.h |  3 +-
 5 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/asus.c b/drivers/platform/x86/x86-android-tablets/asus.c
index 2aca91678219..f9c4083be86d 100644
--- a/drivers/platform/x86/x86-android-tablets/asus.c
+++ b/drivers/platform/x86/x86-android-tablets/asus.c
@@ -24,7 +24,7 @@ static struct gpiod_lookup_table int3496_gpo2_pin22_gpios = {
 	},
 };
 
-static struct x86_gpio_button asus_me176c_tf103c_lid = {
+static const struct x86_gpio_button asus_me176c_tf103c_lid __initconst = {
 	.button = {
 		.code = SW_LID,
 		.active_low = true,
@@ -175,6 +175,7 @@ const struct x86_dev_info asus_me176c_info __initconst = {
 	.serdev_info = asus_me176c_serdevs,
 	.serdev_count = ARRAY_SIZE(asus_me176c_serdevs),
 	.gpio_button = &asus_me176c_tf103c_lid,
+	.gpio_button_count = 1,
 	.gpiod_lookup_tables = asus_me176c_gpios,
 	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
 	.modules = bq24190_modules,
@@ -317,6 +318,7 @@ const struct x86_dev_info asus_tf103c_info __initconst = {
 	.pdev_info = int3496_pdevs,
 	.pdev_count = 1,
 	.gpio_button = &asus_me176c_tf103c_lid,
+	.gpio_button_count = 1,
 	.gpiod_lookup_tables = asus_tf103c_gpios,
 	.bat_swnode = &asus_tf103c_battery_node,
 	.modules = bq24190_modules,
diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 245167674aa2..0c7142f4eccc 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -124,6 +124,7 @@ static int serdev_count;
 static struct i2c_client **i2c_clients;
 static struct platform_device **pdevs;
 static struct serdev_device **serdevs;
+static struct gpio_keys_button *buttons;
 static struct gpiod_lookup_table * const *gpiod_lookup_tables;
 static const struct software_node *bat_swnode;
 static void (*exit_handler)(void);
@@ -238,6 +239,7 @@ static void x86_android_tablet_cleanup(void)
 		platform_device_unregister(pdevs[i]);
 
 	kfree(pdevs);
+	kfree(buttons);
 
 	for (i = 0; i < i2c_client_count; i++)
 		i2c_unregister_device(i2c_clients[i]);
@@ -353,22 +355,31 @@ static __init int x86_android_tablet_init(void)
 		}
 	}
 
-	if (dev_info->gpio_button) {
-		struct gpio_keys_platform_data pdata = {
-			.buttons = &dev_info->gpio_button->button,
-			.nbuttons = 1,
-		};
+	if (dev_info->gpio_button_count) {
+		struct gpio_keys_platform_data pdata = { };
 		struct gpio_desc *gpiod;
 
-		/* Get GPIO for the gpio-button */
-		ret = x86_android_tablet_get_gpiod(dev_info->gpio_button->chip,
-						   dev_info->gpio_button->pin, &gpiod);
-		if (ret < 0) {
+		buttons = kcalloc(dev_info->gpio_button_count, sizeof(*buttons), GFP_KERNEL);
+		if (!buttons) {
 			x86_android_tablet_cleanup();
-			return ret;
+			return -ENOMEM;
+		}
+
+		for (i = 0; i < dev_info->gpio_button_count; i++) {
+			buttons[i] = dev_info->gpio_button[i].button;
+			/* Get GPIO for the gpio-button */
+			ret = x86_android_tablet_get_gpiod(dev_info->gpio_button[i].chip,
+							   dev_info->gpio_button[i].pin, &gpiod);
+			if (ret < 0) {
+				x86_android_tablet_cleanup();
+				return ret;
+			}
+
+			buttons[i].gpio = desc_to_gpio(gpiod);
 		}
 
-		dev_info->gpio_button->button.gpio = desc_to_gpio(gpiod);
+		pdata.buttons = buttons;
+		pdata.nbuttons = dev_info->gpio_button_count;
 
 		pdevs[pdev_count] = platform_device_register_data(NULL, "gpio-keys",
 								  PLATFORM_DEVID_AUTO,
diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 50031e902a2c..26a4ef670ad7 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -160,7 +160,7 @@ static const struct x86_serdev_info lenovo_yb1_x90_serdevs[] __initconst = {
 	},
 };
 
-static struct x86_gpio_button lenovo_yb1_x90_lid = {
+static const struct x86_gpio_button lenovo_yb1_x90_lid __initconst = {
 	.button = {
 		.code = SW_LID,
 		.active_low = true,
@@ -232,6 +232,7 @@ const struct x86_dev_info lenovo_yogabook_x90_info __initconst = {
 	.serdev_info = lenovo_yb1_x90_serdevs,
 	.serdev_count = ARRAY_SIZE(lenovo_yb1_x90_serdevs),
 	.gpio_button = &lenovo_yb1_x90_lid,
+	.gpio_button_count = 1,
 	.gpiod_lookup_tables = lenovo_yb1_x90_gpios,
 	.init = lenovo_yb1_x90_init,
 };
@@ -268,7 +269,7 @@ static const struct software_node lenovo_yoga_tab2_830_1050_bq24190_node = {
 	.properties = lenovo_yoga_tab2_830_1050_bq24190_props,
 };
 
-static struct x86_gpio_button lenovo_yoga_tab2_830_1050_lid = {
+static const struct x86_gpio_button lenovo_yoga_tab2_830_1050_lid __initconst = {
 	.button = {
 		.code = SW_LID,
 		.active_low = true,
@@ -394,6 +395,7 @@ const struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initconst = {
 	.pdev_info = int3496_pdevs,
 	.pdev_count = 1,
 	.gpio_button = &lenovo_yoga_tab2_830_1050_lid,
+	.gpio_button_count = 1,
 	.gpiod_lookup_tables = lenovo_yoga_tab2_830_1050_gpios,
 	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
 	.modules = bq24190_modules,
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index 3754d2453cdb..4d54c89e6ca2 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -94,7 +94,7 @@ const struct x86_dev_info acer_b1_750_info __initconst = {
  * which is not described in the ACPI tables in anyway.
  * Use the x86-android-tablets infra to create a gpio-button device for this.
  */
-static struct x86_gpio_button advantech_mica_071_button = {
+static const struct x86_gpio_button advantech_mica_071_button __initconst = {
 	.button = {
 		.code = KEY_PROG1,
 		.active_low = true,
@@ -109,6 +109,7 @@ static struct x86_gpio_button advantech_mica_071_button = {
 
 const struct x86_dev_info advantech_mica_071_info __initconst = {
 	.gpio_button = &advantech_mica_071_button,
+	.gpio_button_count = 1,
 };
 
 /*
@@ -449,7 +450,7 @@ const struct x86_dev_info nextbook_ares8a_info __initconst = {
  * This button has a WMI interface, but that is broken. Instead of trying to
  * use the broken WMI interface, instantiate a gpio_keys device for this.
  */
-static struct x86_gpio_button peaq_c1010_button = {
+static const struct x86_gpio_button peaq_c1010_button __initconst = {
 	.button = {
 		.code = KEY_SOUND,
 		.active_low = true,
@@ -464,6 +465,7 @@ static struct x86_gpio_button peaq_c1010_button = {
 
 const struct x86_dev_info peaq_c1010_info __initconst = {
 	.gpio_button = &peaq_c1010_button,
+	.gpio_button_count = 1,
 	/*
 	 * Move the ACPI event handler used by the broken WMI interface out of
 	 * the way. This is the only event handler on INT33FC:00.
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index 8e9f7238015c..8f04a052eada 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -73,10 +73,11 @@ struct x86_dev_info {
 	const struct x86_i2c_client_info *i2c_client_info;
 	const struct platform_device_info *pdev_info;
 	const struct x86_serdev_info *serdev_info;
-	struct x86_gpio_button *gpio_button;
+	const struct x86_gpio_button *gpio_button;
 	int i2c_client_count;
 	int pdev_count;
 	int serdev_count;
+	int gpio_button_count;
 	int (*init)(void);
 	void (*exit)(void);
 };
-- 
2.40.1

