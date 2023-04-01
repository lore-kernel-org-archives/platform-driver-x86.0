Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ACA3C6FD1D
	for <platform-driver-x86@archiver.kernel.org>; Sat,  1 Apr 2023 15:08:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbjDAPIh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 1 Apr 2023 11:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbjDAPIg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 1 Apr 2023 11:08:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C09AC1BF72
        for <platform-driver-x86@vger.kernel.org>; Sat,  1 Apr 2023 08:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361671;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gTVH+R4EeX2XOdjsEOFgSLhWC3jpQ5RhOhOkkXcaMXM=;
        b=VkdWhG8/IBp5sjEWDncI5G0LZ5YtqSK9GP73IyxkL9xYHshBPUrwHOvl9vauEQxblKUDvt
        if9LhUgwM6qr53d8lkr/FLa00uPJUOEzO7nHcGKw+gbmLLIwwCBTCunmu39KoTvFLH7o8T
        upEbL1Hn15TfdM+q94405t3j1JycH2Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-GDRmwQ1NM52saf95l1mpIQ-1; Sat, 01 Apr 2023 11:07:47 -0400
X-MC-Unique: GDRmwQ1NM52saf95l1mpIQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91824185A78F;
        Sat,  1 Apr 2023 15:07:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E20571121314;
        Sat,  1 Apr 2023 15:07:46 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/3] platform/x86: x86-android-tablets: Share lp855x_platform_data between different models
Date:   Sat,  1 Apr 2023 17:07:36 +0200
Message-Id: <20230401150737.597417-2-hdegoede@redhat.com>
In-Reply-To: <20230401150737.597417-1-hdegoede@redhat.com>
References: <20230401150737.597417-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Various Lenovo models use a TI LP8557 LED backlight controller and
the necessary platform_data is the same for the different models.

Currently there are 2 identical copies and the upcoming support for
the Lenovo Yoga Book X90F/L would add a 3th identical copy.

Move to sharing the lp855x_platform_data between different models
to avoid this duplication.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/lenovo.c | 37 ++++++++-----------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index d9d6dccc53c8..5d217cbbde30 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -24,6 +24,20 @@
 #include "shared-psy-info.h"
 #include "x86-android-tablets.h"
 
+/*
+ * Various Lenovo models use a TI LP8557 LED backlight controller with its PWM
+ * input connected to a PWM output coming from the LCD panel's controller.
+ * The Android kernels have a hack in the i915 driver to write a non-standard
+ * panel specific DSI register to set the duty-cycle of the LCD's PWM output.
+ *
+ * To avoid having to have a similar hack in the mainline kernel program the
+ * LP8557 to directly set the level and use the lp855x_bl driver for control.
+ */
+static struct lp855x_platform_data lenovo_lp8557_pdata = {
+	.device_control = 0x86,
+	.initial_brightness = 128,
+};
+
 /* Lenovo Yoga Book X91F/L Windows tablet needs manual instantiation of the fg client */
 static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __initconst = {
 	{
@@ -72,11 +86,6 @@ static struct x86_gpio_button lenovo_yoga_tab2_830_1050_lid = {
 /* This gets filled by lenovo_yoga_tab2_830_1050_init() */
 static struct rmi_device_platform_data lenovo_yoga_tab2_830_1050_rmi_pdata = { };
 
-static struct lp855x_platform_data lenovo_yoga_tab2_830_1050_lp8557_pdata = {
-	.device_control = 0x86,
-	.initial_brightness = 128,
-};
-
 static const struct x86_i2c_client_info lenovo_yoga_tab2_830_1050_i2c_clients[] __initconst = {
 	{
 		/* bq24292i battery charger */
@@ -125,7 +134,7 @@ static const struct x86_i2c_client_info lenovo_yoga_tab2_830_1050_i2c_clients[]
 			.type = "lp8557",
 			.addr = 0x2c,
 			.dev_name = "lp8557",
-			.platform_data = &lenovo_yoga_tab2_830_1050_lp8557_pdata,
+			.platform_data = &lenovo_lp8557_pdata,
 		},
 		.adapter_path = "\\_SB_.I2C3",
 	},
@@ -343,20 +352,6 @@ static const struct software_node lenovo_yt3_hideep_ts_node = {
 	.properties = lenovo_yt3_hideep_ts_props,
 };
 
-/*
- * The YT3 uses an TI LP8557 LED backlight controller, the LP8557's PWM input is
- * connected to a PWM output coming from the LCD panel's controller. The Android
- * kernel has a hack in the i915 driver to write the non-standard DSI reg 0x51
- * with the desired level to set the duty-cycle of the LCD's PWM output.
- *
- * To avoid having to have a similar hack in the mainline kernel program the
- * LP8557 to directly set the level and use the lp855x_bl driver for control.
- */
-static struct lp855x_platform_data lenovo_yt3_lp8557_pdata = {
-	.device_control = 0x86,
-	.initial_brightness = 128,
-};
-
 static const struct x86_i2c_client_info lenovo_yt3_i2c_clients[] __initconst = {
 	{
 		/* bq27500 fuel-gauge for the flat lipo battery behind the screen */
@@ -414,7 +409,7 @@ static const struct x86_i2c_client_info lenovo_yt3_i2c_clients[] __initconst = {
 			.type = "lp8557",
 			.addr = 0x2c,
 			.dev_name = "lp8557",
-			.platform_data = &lenovo_yt3_lp8557_pdata,
+			.platform_data = &lenovo_lp8557_pdata,
 		},
 		.adapter_path = "\\_SB_.PCI0.I2C1",
 	}
-- 
2.39.1

