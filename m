Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B22C77B76
	for <platform-driver-x86@archiver.kernel.org>; Sun, 16 Apr 2023 21:29:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjDPV3f (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 16 Apr 2023 17:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjDPV3e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 16 Apr 2023 17:29:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72B382108
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Apr 2023 14:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681680529;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2Km4LcX0mE8tTTSGXnegnIfihLL0LLq1tjd3c59HzM8=;
        b=i1SlijAUdurYW9QKEPCR2A5VeV/zyTZY3vhY6nR1VRGyoCVdpPGRaLs43HGBmp1qmKCbnT
        BGQaUgywzriwt0FYQn4yZYJkNa9lkOoNUPn+aXaAqYOB3aYXSI0+6rF1UG/FFyCe/zOm14
        e8OVgtHONPxVj6PAV6yOITa2bse56VM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-Quizdg30M-yLruoTXnaojA-1; Sun, 16 Apr 2023 17:28:46 -0400
X-MC-Unique: Quizdg30M-yLruoTXnaojA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA39B185A78F;
        Sun, 16 Apr 2023 21:28:45 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.56])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 38CBF14171B8;
        Sun, 16 Apr 2023 21:28:45 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 4/4] platform/x86: x86-android-tablets: Add accelerometer support for Yoga Tablet 2 1050/830 series
Date:   Sun, 16 Apr 2023 23:28:41 +0200
Message-Id: <20230416212841.311152-4-hdegoede@redhat.com>
In-Reply-To: <20230416212841.311152-1-hdegoede@redhat.com>
References: <20230416212841.311152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Yoga Tablet 2 1050/830 series have a LSM303DA accelerometer +
magnetometer (IMU), add this to the list of i2c_clients to
instantiate on these models.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/lenovo.c | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index cf1629970f98..65cfccaa2894 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -255,8 +255,19 @@ static struct x86_gpio_button lenovo_yoga_tab2_830_1050_lid = {
 /* This gets filled by lenovo_yoga_tab2_830_1050_init() */
 static struct rmi_device_platform_data lenovo_yoga_tab2_830_1050_rmi_pdata = { };
 
-static const struct x86_i2c_client_info lenovo_yoga_tab2_830_1050_i2c_clients[] __initconst = {
+static struct x86_i2c_client_info lenovo_yoga_tab2_830_1050_i2c_clients[] __initdata = {
 	{
+		/*
+		 * This must be the first entry because lenovo_yoga_tab2_830_1050_init()
+		 * may update its swnode. LSM303DA accelerometer + magnetometer.
+		 */
+		.board_info = {
+			.type = "lsm303d",
+			.addr = 0x1d,
+			.dev_name = "lsm303d",
+		},
+		.adapter_path = "\\_SB_.I2C5",
+	}, {
 		/* bq24292i battery charger */
 		.board_info = {
 			.type = "bq24190",
@@ -357,7 +368,24 @@ const struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initconst = {
  * The Lenovo Yoga Tablet 2 830 and 1050 (8" vs 10") versions use the same
  * mainboard, but the 830 uses a portrait LCD panel with a landscape touchscreen,
  * requiring the touchscreen driver to adjust the touch-coords to match the LCD.
+ * And requiring the accelerometer to have a mount-matrix set to correct for
+ * the 90° rotation of the LCD vs the frame.
  */
+static const char * const lenovo_yoga_tab2_830_lms303d_mount_matrix[] = {
+	"0", "1", "0",
+	"-1", "0", "0",
+	"0", "0", "1"
+};
+
+static const struct property_entry lenovo_yoga_tab2_830_lms303d_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("mount-matrix", lenovo_yoga_tab2_830_lms303d_mount_matrix),
+	{ }
+};
+
+static const struct software_node lenovo_yoga_tab2_830_lms303d_node = {
+	.properties = lenovo_yoga_tab2_830_lms303d_props,
+};
+
 static int __init lenovo_yoga_tab2_830_1050_init_touchscreen(void)
 {
 	struct gpio_desc *gpiod;
@@ -375,6 +403,8 @@ static int __init lenovo_yoga_tab2_830_1050_init_touchscreen(void)
 		pr_info("detected Lenovo Yoga Tablet 2 830F/L\n");
 		lenovo_yoga_tab2_830_1050_rmi_pdata.sensor_pdata.axis_align.swap_axes = true;
 		lenovo_yoga_tab2_830_1050_rmi_pdata.sensor_pdata.axis_align.flip_y = true;
+		lenovo_yoga_tab2_830_1050_i2c_clients[0].board_info.swnode =
+			&lenovo_yoga_tab2_830_lms303d_node;
 	}
 
 	return 0;
-- 
2.39.2

