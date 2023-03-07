Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E5CC678D5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Mar 2023 11:42:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbjCGLma (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Mar 2023 06:42:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbjCGLlG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Mar 2023 06:41:06 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 968837C95A
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Mar 2023 03:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678189096;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=9oipplq7y5HInG6y6zaibC+Zk+6GCLV/jkoLOSj7rO8=;
        b=LFR8s3I8va/5m+6Y1yatkxJ5en5sgZx85KoXMvFNR6M7EDc4OJS+Q2dqWWFbNB1nAjH52f
        893feAMP18JoDHGa4OVayDlGZYNKGmSoJwiTak54O/AiNVQgTeUhKQV+bl0sfBbOtuxk6z
        hp9/eC1jq84rhgq2XN83FUuHoPJq3x8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-LhrvdauiPImY3w5osoliww-1; Tue, 07 Mar 2023 06:38:15 -0500
X-MC-Unique: LhrvdauiPImY3w5osoliww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2FDE80D0E3;
        Tue,  7 Mar 2023 11:38:14 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.222])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0157B40CF8EE;
        Tue,  7 Mar 2023 11:38:13 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Aditya Garg <gargaditya08@live.com>
Subject: [PATCH] platform/x86: apple-gmux: Add acpi_video_get_backlight_type() check
Date:   Tue,  7 Mar 2023 12:38:13 +0100
Message-Id: <20230307113813.359743-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Make apple-gmux backlight registration honor the acpi_backlight=...
kernel commandline option which is used to select the backlight
control method on x86/ACPI devices.

Reported-and-tested-by: Aditya Garg <gargaditya08@live.com>
Link: https://lore.kernel.org/platform-driver-x86/BM1PR01MB0931B467250831916F7C55B3B8A59@BM1PR01MB0931.INDPRD01.PROD.OUTLOOK.COM/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/apple-gmux.c | 59 +++++++++++++++++--------------
 1 file changed, 33 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 757fd71c900f..787cf2a7e268 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -23,6 +23,7 @@
 #include <linux/pci.h>
 #include <linux/vga_switcheroo.h>
 #include <linux/debugfs.h>
+#include <acpi/video.h>
 #include <asm/io.h>
 
 /**
@@ -783,6 +784,7 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	struct backlight_properties props;
 	struct backlight_device *bdev;
 	u8 ver_major, ver_minor, ver_release;
+	bool register_bdev = true;
 	int ret = -ENXIO;
 	acpi_status status;
 	unsigned long long gpe;
@@ -859,33 +861,38 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	props.type = BACKLIGHT_PLATFORM;
 	props.max_brightness = gmux_read32(gmux_data, GMUX_PORT_MAX_BRIGHTNESS);
 
-	/*
-	 * Currently it's assumed that the maximum brightness is less than
-	 * 2^24 for compatibility with old gmux versions. Cap the max
-	 * brightness at this value, but print a warning if the hardware
-	 * reports something higher so that it can be fixed.
-	 */
-	if (WARN_ON(props.max_brightness > GMUX_MAX_BRIGHTNESS))
-		props.max_brightness = GMUX_MAX_BRIGHTNESS;
-
-	bdev = backlight_device_register("gmux_backlight", &pnp->dev,
-					 gmux_data, &gmux_bl_ops, &props);
-	if (IS_ERR(bdev)) {
-		ret = PTR_ERR(bdev);
-		goto err_unmap;
-	}
-
-	gmux_data->bdev = bdev;
-	bdev->props.brightness = gmux_get_brightness(bdev);
-	backlight_update_status(bdev);
+#if IS_REACHABLE(CONFIG_ACPI_VIDEO)
+	register_bdev = acpi_video_get_backlight_type() == acpi_backlight_apple_gmux;
+#endif
+	if (register_bdev) {
+		/*
+		 * Currently it's assumed that the maximum brightness is less than
+		 * 2^24 for compatibility with old gmux versions. Cap the max
+		 * brightness at this value, but print a warning if the hardware
+		 * reports something higher so that it can be fixed.
+		 */
+		if (WARN_ON(props.max_brightness > GMUX_MAX_BRIGHTNESS))
+			props.max_brightness = GMUX_MAX_BRIGHTNESS;
+
+		bdev = backlight_device_register("gmux_backlight", &pnp->dev,
+						 gmux_data, &gmux_bl_ops, &props);
+		if (IS_ERR(bdev)) {
+			ret = PTR_ERR(bdev);
+			goto err_unmap;
+		}
 
-	/*
-	 * The backlight situation on Macs is complicated. If the gmux is
-	 * present it's the best choice, because it always works for
-	 * backlight control and supports more levels than other options.
-	 * Disable the other backlight choices.
-	 */
-	apple_bl_unregister();
+		gmux_data->bdev = bdev;
+		bdev->props.brightness = gmux_get_brightness(bdev);
+		backlight_update_status(bdev);
+
+		/*
+		 * The backlight situation on Macs is complicated. If the gmux is
+		 * present it's the best choice, because it always works for
+		 * backlight control and supports more levels than other options.
+		 * Disable the other backlight choices.
+		 */
+		apple_bl_unregister();
+	}
 
 	gmux_data->power_state = VGA_SWITCHEROO_ON;
 
-- 
2.39.1

