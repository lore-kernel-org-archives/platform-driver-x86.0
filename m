Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F468C76196
	for <platform-driver-x86@archiver.kernel.org>; Sat,  1 Apr 2023 15:08:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbjDAPIh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 1 Apr 2023 11:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbjDAPIh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 1 Apr 2023 11:08:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE7411EA0
        for <platform-driver-x86@vger.kernel.org>; Sat,  1 Apr 2023 08:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361670;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Nq0PU4hNClmZeCRP/6EgxWQKIg/TOfuZVnD+aKuzvlw=;
        b=V6gSLY6rWET7H8w0d+YgjEmCNacAGzgMZuEAO9qqAbKEeISiob/SluJR4wNpX8+2DXroQn
        5qyEGLC/thrIM9/T6SCIxNzqT2WPjMPUNPhVtZDimywm3lXZYnqglfS8bAcnGlTIVnbkjj
        ipDjYkTI1Ij/73gbAqkMNzLlTdsUs5Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-3RQgt8HYNaSM4CZjosigZA-1; Sat, 01 Apr 2023 11:07:47 -0400
X-MC-Unique: 3RQgt8HYNaSM4CZjosigZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAEA63C02521;
        Sat,  1 Apr 2023 15:07:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 045C41121314;
        Sat,  1 Apr 2023 15:07:45 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/3] platform/x86: x86-android-tablets: Use LP8557 in direct mode on both the Yoga 830 and the 1050
Date:   Sat,  1 Apr 2023 17:07:35 +0200
Message-Id: <20230401150737.597417-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Both the Lenovo Yoga Tablet 2 830 and 1050 models use an TI LP8557 LED
backlight controller. On the 1050 the LP8557's PWM input is connected to
the PMIC's PWM output and everything works fine with the defaults
programmed into the LP8557 by the BIOS.

But on the 830 the LP8557's PWM input is connected to a PWM output coming
from the LCD panel's controller. The Android code has a hack in the i915
driver to write the non-standard DSI reg 0x9f with the desired backlight
level to set the duty-cycle of the LCD's PWM output.

To avoid having to have a similar hack in the mainline kernel the LP8557
entry in lenovo_yoga_tab2_830_1050_i2c_clients instead just programs the
LP8557 to directly set the level, ignoring the PWM input.

So far we have only been instantiating the LP8557 i2c_client for direct
backlight control on the 830 model. But we want hide/disable the
intel_backlight interface on the 830 model to avoid having 2 backlight
interfaces for the same LCD panel.

And the 830 and 1050 share the same DMI strings. So this will hide the
intel_backlight interface on the 1050 model too.

To avoid this causing problems make the backlight handling consistent
between the 2 models and always directly use the LP8557.

This also simplifies the code.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/lenovo.c | 29 ++++---------------
 .../x86-android-tablets/x86-android-tablets.h |  3 +-
 2 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 0baad9970820..d9d6dccc53c8 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -162,9 +162,9 @@ static struct gpiod_lookup_table * const lenovo_yoga_tab2_830_1050_gpios[] = {
 static int __init lenovo_yoga_tab2_830_1050_init(void);
 static void lenovo_yoga_tab2_830_1050_exit(void);
 
-struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initdata = {
+const struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initconst = {
 	.i2c_client_info = lenovo_yoga_tab2_830_1050_i2c_clients,
-	/* i2c_client_count gets set by lenovo_yoga_tab2_830_1050_init() */
+	.i2c_client_count = ARRAY_SIZE(lenovo_yoga_tab2_830_1050_i2c_clients),
 	.pdev_info = int3496_pdevs,
 	.pdev_count = 1,
 	.gpio_button = &lenovo_yoga_tab2_830_1050_lid,
@@ -177,23 +177,10 @@ struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initdata = {
 
 /*
  * The Lenovo Yoga Tablet 2 830 and 1050 (8" vs 10") versions use the same
- * mainboard, but they need some different treatment related to the display:
- * 1. The 830 uses a portrait LCD panel with a landscape touchscreen, requiring
- *    the touchscreen driver to adjust the touch-coords to match the LCD.
- * 2. Both use an TI LP8557 LED backlight controller. On the 1050 the LP8557's
- *    PWM input is connected to the PMIC's PWM output and everything works fine
- *    with the defaults programmed into the LP8557 by the BIOS.
- *    But on the 830 the LP8557's PWM input is connected to a PWM output coming
- *    from the LCD panel's controller. The Android code has a hack in the i915
- *    driver to write the non-standard DSI reg 0x9f with the desired backlight
- *    level to set the duty-cycle of the LCD's PWM output.
- *
- *    To avoid having to have a similar hack in the mainline kernel the LP8557
- *    entry in lenovo_yoga_tab2_830_1050_i2c_clients instead just programs the
- *    LP8557 to directly set the level, ignoring the PWM input. This means that
- *    the LP8557 i2c_client should only be instantiated on the 830.
+ * mainboard, but the 830 uses a portrait LCD panel with a landscape touchscreen,
+ * requiring the touchscreen driver to adjust the touch-coords to match the LCD.
  */
-static int __init lenovo_yoga_tab2_830_1050_init_display(void)
+static int __init lenovo_yoga_tab2_830_1050_init_touchscreen(void)
 {
 	struct gpio_desc *gpiod;
 	int ret;
@@ -206,14 +193,10 @@ static int __init lenovo_yoga_tab2_830_1050_init_display(void)
 	ret = gpiod_get_value_cansleep(gpiod);
 	if (ret) {
 		pr_info("detected Lenovo Yoga Tablet 2 1050F/L\n");
-		lenovo_yoga_tab2_830_1050_info.i2c_client_count =
-			ARRAY_SIZE(lenovo_yoga_tab2_830_1050_i2c_clients) - 1;
 	} else {
 		pr_info("detected Lenovo Yoga Tablet 2 830F/L\n");
 		lenovo_yoga_tab2_830_1050_rmi_pdata.sensor_pdata.axis_align.swap_axes = true;
 		lenovo_yoga_tab2_830_1050_rmi_pdata.sensor_pdata.axis_align.flip_y = true;
-		lenovo_yoga_tab2_830_1050_info.i2c_client_count =
-			ARRAY_SIZE(lenovo_yoga_tab2_830_1050_i2c_clients);
 	}
 
 	return 0;
@@ -281,7 +264,7 @@ static int __init lenovo_yoga_tab2_830_1050_init(void)
 {
 	int ret;
 
-	ret = lenovo_yoga_tab2_830_1050_init_display();
+	ret = lenovo_yoga_tab2_830_1050_init_touchscreen();
 	if (ret)
 		return ret;
 
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index cf8566b3fd9c..c2b490519324 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -95,8 +95,7 @@ extern const struct x86_dev_info asus_tf103c_info;
 extern const struct x86_dev_info chuwi_hi8_info;
 extern const struct x86_dev_info czc_p10t;
 extern const struct x86_dev_info lenovo_yogabook_x91_info;
-/* Not const as this gets modified by its init callback */
-extern struct x86_dev_info lenovo_yoga_tab2_830_1050_info;
+extern const struct x86_dev_info lenovo_yoga_tab2_830_1050_info;
 extern const struct x86_dev_info lenovo_yt3_info;
 extern const struct x86_dev_info medion_lifetab_s10346_info;
 extern const struct x86_dev_info nextbook_ares8_info;
-- 
2.39.1

