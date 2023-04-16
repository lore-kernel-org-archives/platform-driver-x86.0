Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2583EC77B61
	for <platform-driver-x86@archiver.kernel.org>; Sun, 16 Apr 2023 21:29:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjDPV3g (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 16 Apr 2023 17:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjDPV3e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 16 Apr 2023 17:29:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78DF91FEF
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Apr 2023 14:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681680526;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kjovfbO66bvuLX7JzPUngH0ZWEXv7QtWSzXKeHsMgNs=;
        b=RqelJ9rGgyp5Q1Lyyn71ug3s6oA6673JPKP94UDJKDhNqsH0Glh0KvV4Yo3RtU7nfE+60f
        KsV3Wz7z5XEAZhLEOC5fplBMALenLEYi//nnXQYkPLOuv7d+DdJtklxz/hyIm8fqOsyLXD
        4yCcEAKRZW+HOUcVu1u/C5rcaCJENSY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-2li-KX42NwupttoWnbCWng-1; Sun, 16 Apr 2023 17:28:45 -0400
X-MC-Unique: 2li-KX42NwupttoWnbCWng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0637E3C0DDA0;
        Sun, 16 Apr 2023 21:28:45 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.56])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5641014171B8;
        Sun, 16 Apr 2023 21:28:44 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/4] platform/x86: x86-android-tablets: Add "yogabook-touch-kbd-digitizer-switch" pdev for Lenovo Yoga Book
Date:   Sun, 16 Apr 2023 23:28:40 +0200
Message-Id: <20230416212841.311152-3-hdegoede@redhat.com>
In-Reply-To: <20230416212841.311152-1-hdegoede@redhat.com>
References: <20230416212841.311152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a "yogabook-touch-kbd-digitizer-switch" platform-device, for
the lenovo-yogabook driver to bind to, to the x86_dev_info for
the Lenovo Yoga Book 1 Android models (yb1-x90f/l).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/lenovo.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 438de8b92dc6..cf1629970f98 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -140,6 +140,13 @@ static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst
 	},
 };
 
+static const struct platform_device_info lenovo_yb1_x90_pdevs[] __initconst = {
+	{
+		.name = "yogabook-touch-kbd-digitizer-switch",
+		.id = PLATFORM_DEVID_NONE,
+	},
+};
+
 static struct gpiod_lookup_table lenovo_yb1_x90_goodix_gpios = {
 	.dev_id = "i2c-goodix_ts",
 	.table = {
@@ -194,6 +201,8 @@ static int __init lenovo_yb1_x90_init(void)
 const struct x86_dev_info lenovo_yogabook_x90_info __initconst = {
 	.i2c_client_info = lenovo_yb1_x90_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(lenovo_yb1_x90_i2c_clients),
+	.pdev_info = lenovo_yb1_x90_pdevs,
+	.pdev_count = ARRAY_SIZE(lenovo_yb1_x90_pdevs),
 	.gpiod_lookup_tables = lenovo_yb1_x90_gpios,
 	.init = lenovo_yb1_x90_init,
 };
-- 
2.39.2

