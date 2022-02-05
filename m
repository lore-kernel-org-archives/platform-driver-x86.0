Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A616C4332F
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Feb 2022 19:14:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243650AbiBETOG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 5 Feb 2022 14:14:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21792 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343837AbiBETOG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Feb 2022 14:14:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644088445;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RtLRkw0TyCzWJRssuVdF65lN13Lr7qPtY9EeWTpN3zA=;
        b=V1vt9QXcEvdP0B66eQmJ1ze0FCHe1WDqTKrl4+KpKfvHe7YpCOidFKzZ7dpyreuX8afuTu
        AshtGkN4dgWVIsmqR8dHvoGv4sfeJ+dga3Pzj89GvjqV1H3G35Lv/vKpWZyDew2yqHSmGv
        L5PRnJ3GLVWDuEu8ClJiKn+7we/sHAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-2gPntthIPaKE2wanYOy_Dw-1; Sat, 05 Feb 2022 14:14:04 -0500
X-MC-Unique: 2gPntthIPaKE2wanYOy_Dw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CC931006AA3;
        Sat,  5 Feb 2022 19:14:03 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 663F05C23A;
        Sat,  5 Feb 2022 19:14:02 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 4/6] platform/x86: x86-android-tablets: Add lid-switch gpio-keys pdev to Asus ME176C + TF103C
Date:   Sat,  5 Feb 2022 20:13:54 +0100
Message-Id: <20220205191356.225505-4-hdegoede@redhat.com>
In-Reply-To: <20220205191356.225505-1-hdegoede@redhat.com>
References: <20220205191356.225505-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Asus ME176C + TF103C both have a lid-switch (for a cover in the ME176C
case), add a gpio-keys platform-device and platform-data describing the
lid-switch on both.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 57 ++++++++++++++++++++--
 1 file changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 40243ea3ae39..6174aad572bc 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -12,10 +12,12 @@
 
 #include <linux/acpi.h>
 #include <linux/dmi.h>
+#include <linux/gpio_keys.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 #include <linux/i2c.h>
+#include <linux/input.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
 #include <linux/module.h>
@@ -231,6 +233,51 @@ static struct gpiod_lookup_table int3496_gpo2_pin22_gpios = {
 	},
 };
 
+/* Asus ME176C and TF103C tablets shared data */
+static struct gpio_keys_button asus_me176c_tf103c_lid = {
+	.code = SW_LID,
+	/* .gpio gets filled in by asus_me176c_tf103c_init() */
+	.active_low = true,
+	.desc = "lid_sw",
+	.type = EV_SW,
+	.wakeup = true,
+	.debounce_interval = 50,
+};
+
+static const struct gpio_keys_platform_data asus_me176c_tf103c_lid_pdata __initconst = {
+	.buttons = &asus_me176c_tf103c_lid,
+	.nbuttons = 1,
+	.name = "lid_sw",
+};
+
+static const struct platform_device_info asus_me176c_tf103c_pdevs[] __initconst = {
+	{
+		.name = "gpio-keys",
+		.id = PLATFORM_DEVID_AUTO,
+		.data = &asus_me176c_tf103c_lid_pdata,
+		.size_data = sizeof(asus_me176c_tf103c_lid_pdata),
+	},
+	{
+		/* For micro USB ID pin handling */
+		.name = "intel-int3496",
+		.id = PLATFORM_DEVID_NONE,
+	},
+};
+
+static int __init asus_me176c_tf103c_init(void)
+{
+	struct gpio_desc *gpiod;
+	int ret;
+
+	ret = x86_android_tablet_get_gpiod("INT33FC:02", 12, &gpiod);
+	if (ret < 0)
+		return ret;
+	asus_me176c_tf103c_lid.gpio = desc_to_gpio(gpiod);
+
+	return 0;
+}
+
+
 /* Asus ME176C tablets have an Android factory img with everything hardcoded */
 static const char * const asus_me176c_accel_mount_matrix[] = {
 	"-1", "0", "0",
@@ -358,14 +405,15 @@ static struct gpiod_lookup_table * const asus_me176c_gpios[] = {
 static const struct x86_dev_info asus_me176c_info __initconst = {
 	.i2c_client_info = asus_me176c_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(asus_me176c_i2c_clients),
-	.pdev_info = int3496_pdevs,
-	.pdev_count = ARRAY_SIZE(int3496_pdevs),
+	.pdev_info = asus_me176c_tf103c_pdevs,
+	.pdev_count = ARRAY_SIZE(asus_me176c_tf103c_pdevs),
 	.serdev_info = asus_me176c_serdevs,
 	.serdev_count = ARRAY_SIZE(asus_me176c_serdevs),
 	.gpiod_lookup_tables = asus_me176c_gpios,
 	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
 	.modules = bq24190_modules,
 	.invalid_aei_gpiochip = "INT33FC:02",
+	.init = asus_me176c_tf103c_init,
 };
 
 /* Asus TF103C tablets have an Android factory img with everything hardcoded */
@@ -502,12 +550,13 @@ static struct gpiod_lookup_table * const asus_tf103c_gpios[] = {
 static const struct x86_dev_info asus_tf103c_info __initconst = {
 	.i2c_client_info = asus_tf103c_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(asus_tf103c_i2c_clients),
-	.pdev_info = int3496_pdevs,
-	.pdev_count = ARRAY_SIZE(int3496_pdevs),
+	.pdev_info = asus_me176c_tf103c_pdevs,
+	.pdev_count = ARRAY_SIZE(asus_me176c_tf103c_pdevs),
 	.gpiod_lookup_tables = asus_tf103c_gpios,
 	.bat_swnode = &asus_tf103c_battery_node,
 	.modules = bq24190_modules,
 	.invalid_aei_gpiochip = "INT33FC:02",
+	.init = asus_me176c_tf103c_init,
 };
 
 /*
-- 
2.33.1

