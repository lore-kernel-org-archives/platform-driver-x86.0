Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C908DC433EA
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Mar 2021 12:57:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83CC861A06
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Mar 2021 12:57:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234552AbhCXM4i (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Mar 2021 08:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234575AbhCXM4H (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Mar 2021 08:56:07 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C90C4C061763
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Mar 2021 05:56:06 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id dm8so27536706edb.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Mar 2021 05:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gTwIvnFJ6UsqMLEIUtmaMXWTcL1Cr8qDnDvFwxUlyRo=;
        b=bmsC/KwYkIzuvFP7Idgwv5+p6kgC9Ye8LKkbjNEhX+tq2iw90b48JioM/uXs8qGp/j
         7yfjdIrCmrv2sB6OFf7M/FkpXYW7wjcT250s9W0gpygqFAd/vs/vdAD5FiiMWDwwNaTp
         OJgN+VCaAK4AniCbsqmqMkoi02XTfkzi4z/5KDgEaiJotbunvsNjL6+KH7x2+mBaXm3k
         Vt5Rq5QBnW9eCfp/6ToIbwu4YojnHMXcjCHciJl5BWnrEhHfyXAJD+pfJu6vho1VyuF+
         z07Xlox0xuiuC7pl3CAuzlGy+jeFgHtaYJACRudvls1IjhT5jCVEOqQRpigkXONRBI3Q
         rSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gTwIvnFJ6UsqMLEIUtmaMXWTcL1Cr8qDnDvFwxUlyRo=;
        b=suPHiyOU6ZwQtUGyiDlUGZXeIC0E7tdwmgpa/6Topk6tkenLVxbTSTwKyi3o27Kkpb
         AMGOifr8b+HIOPfklPUqmHmzEhn7baUha/UzTqS/oeFcUaZbsb3KNnQRxIZVie/o4M/R
         qXATzKw9LKeConXr459C15+Luge3ZIoaZBiYYw11m7jHzLjDN1w31MxX80NcSbXKNt12
         QUij8wBEy71kqy0dhlKBSwtRKpWDZ4SKsrJQtfPYX5tiHGYri63numuyNNI4glYkVoNJ
         GNLiD2N5qbzZ+Rpm223X+Dpzn0nhxj0YI1bLqV8qjoUXQYsjnhCS+KjWQCs9PnDdnGVp
         Casw==
X-Gm-Message-State: AOAM530c12sp6eKI1d+VWQ0tLYfSoQCyre5uoFcmPcd5DPwzC/ts/68W
        PiAHi7YGYqSPh4mC5yAnxCtmKmJYPcBngneE
X-Google-Smtp-Source: ABdhPJyN5wrrs/ArU3voReZNJqPglYS2Zo/b32kuE6YTrDfhRKFB4Ch90AD8q0CTaav6C8DazMTz/w==
X-Received: by 2002:a05:6402:51cd:: with SMTP id r13mr3347222edd.116.1616590565316;
        Wed, 24 Mar 2021 05:56:05 -0700 (PDT)
Received: from localhost.localdomain ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id fi11sm880282ejb.73.2021.03.24.05.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:56:05 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org
Cc:     coproscefalo@gmail.com, hdegoede@redhat.com,
        mgross@linux.intel.com, jic23@kernel.org, linux@deviqon.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH 05/10] platform/x86: toshiba_acpi: register backlight with device-managed variant
Date:   Wed, 24 Mar 2021 14:55:43 +0200
Message-Id: <20210324125548.45983-6-aardelean@deviqon.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324125548.45983-1-aardelean@deviqon.com>
References: <20210324125548.45983-1-aardelean@deviqon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This change converts the registration of the backlight data with the
devm_backlight_device_register() function.
This way, the backlight_device_unregister() call is no longer required, and
the order of deregistration is made to be more symmetrical with the
registration order.

Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---
 drivers/platform/x86/toshiba_acpi.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 556f2cc99bad..ada2a2d8c913 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -2876,7 +2876,8 @@ static int toshiba_acpi_setup_keyboard(struct device *parent,
 	return error;
 }
 
-static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
+static int toshiba_acpi_setup_backlight(struct device *parent,
+					struct toshiba_acpi_dev *dev)
 {
 	struct backlight_properties props;
 	int brightness;
@@ -2924,11 +2925,12 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
 	if (dev->tr_backlight_supported)
 		props.max_brightness++;
 
-	dev->backlight_dev = backlight_device_register("toshiba",
-						       &dev->acpi_dev->dev,
-						       dev,
-						       &toshiba_backlight_data,
-						       &props);
+	dev->backlight_dev = devm_backlight_device_register(parent,
+							    "toshiba",
+							    &dev->acpi_dev->dev,
+							    dev,
+							    &toshiba_backlight_data,
+							    &props);
 	if (IS_ERR(dev->backlight_dev)) {
 		ret = PTR_ERR(dev->backlight_dev);
 		pr_err("Could not register toshiba backlight device\n");
@@ -2999,8 +3001,6 @@ static int toshiba_acpi_remove(struct acpi_device *acpi_dev)
 		sysfs_remove_group(&dev->acpi_dev->dev.kobj,
 				   &toshiba_attr_group);
 
-	backlight_device_unregister(dev->backlight_dev);
-
 	led_classdev_unregister(&dev->led_dev);
 	led_classdev_unregister(&dev->kbd_led);
 	led_classdev_unregister(&dev->eco_led);
@@ -3104,9 +3104,9 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	ret = get_tr_backlight_status(dev, &dummy);
 	dev->tr_backlight_supported = !ret;
 
-	ret = toshiba_acpi_setup_backlight(dev);
+	ret = toshiba_acpi_setup_backlight(parent, dev);
 	if (ret)
-		goto error;
+		return ret;
 
 	toshiba_illumination_available(dev);
 	if (dev->illumination_supported) {
-- 
2.30.2

