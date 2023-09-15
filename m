Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E726CCD37AA
	for <platform-driver-x86@archiver.kernel.org>; Fri, 15 Sep 2023 21:52:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237272AbjIOVvK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 15 Sep 2023 17:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237309AbjIOVun (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 15 Sep 2023 17:50:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C2C8CB8
        for <platform-driver-x86@vger.kernel.org>; Fri, 15 Sep 2023 14:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694814586;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ZL/1Hq1b3b3daVb1Bhc+/op8bOmf0NPB7Nnk/wghOZI=;
        b=YeVhHY0++gV8Gt8nuxQKzCQj6G4HaXl7niQJNIQdtzVHVdeesZdWJLxPKzUc6cEcX2d7Hg
        wDj5KyL2z2sF4AbIH3qw5bpjM9eZ/g7YSS7/IGEIc3Q/A6Zv3Bn+rxpHLrYlpe9xYILxjH
        iDA1N1UjaWooZd9QB36Kzni/UpKExV0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-kxei13g2MryGW-uX8V5IiA-1; Fri, 15 Sep 2023 17:49:43 -0400
X-MC-Unique: kxei13g2MryGW-uX8V5IiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBA5A81D88F;
        Fri, 15 Sep 2023 21:49:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.5])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 15A9640C6EA8;
        Fri, 15 Sep 2023 21:49:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: x86-android-tablets: Fix Lenovo Yoga Tablet 2 830F/L vs 1050F/L detection
Date:   Fri, 15 Sep 2023 23:49:33 +0200
Message-ID: <20230915214933.62595-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

gpio_crystalcove pin 10 is already in input mode and passing GPIOD_IN
when requesting the GPIO changes its pull-up/-down settings causing
the 830F/L to get misdetected as 1050F/L.

Switch to using GPIOD_ASIS when requesting the GPIO to fix
the misdetection.

Fixes: 4014ae236b1d ("platform/x86: x86-android-tablets: Stop using gpiolib private APIs")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/lenovo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 904290526173..585f10a57810 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -454,7 +454,7 @@ static int __init lenovo_yoga_tab2_830_1050_init_touchscreen(void)
 
 	/* Use PMIC GPIO 10 bootstrap pin to differentiate 830 vs 1050 */
 	ret = x86_android_tablet_get_gpiod("gpio_crystalcove", 10, "yoga_bootstrap",
-					   false, GPIOD_IN, &gpiod);
+					   false, GPIOD_ASIS, &gpiod);
 	if (ret)
 		return ret;
 
-- 
2.41.0

