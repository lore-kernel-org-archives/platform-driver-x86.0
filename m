Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B3EC77B7C
	for <platform-driver-x86@archiver.kernel.org>; Sat, 29 Apr 2023 18:03:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjD2SDc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 29 Apr 2023 14:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjD2SDb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 Apr 2023 14:03:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0EA10EC
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Apr 2023 11:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682791363;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=wAdgucQUoOAEIIxXnvN0Q0+LPuqoUDm2THFQz+7FNtM=;
        b=R+0pY/o6LKxR8iiOOBs+NjfPahEMmVRccQxm2opBgr+1rNLTaJJwxwTISu280+ap76tNPC
        ccF6qr8Qj5lqbF1PVECh3jXOqGCwxchdDlRHRx4zVMfriupP6Boz0ZGqxqfe23AGZMv+RZ
        zQw+PSHjsmp5Sk4NBHU4cyasH/sods0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645--LMSD-wKOv-q9LFf-fY2gw-1; Sat, 29 Apr 2023 14:02:40 -0400
X-MC-Unique: -LMSD-wKOv-q9LFf-fY2gw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98E798828C1;
        Sat, 29 Apr 2023 18:02:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E44EC14171B6;
        Sat, 29 Apr 2023 18:02:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: x86-android-tablets: Fix Bluetooth on Lenovo Yoga Book
Date:   Sat, 29 Apr 2023 20:02:29 +0200
Message-Id: <20230429180230.97716-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Lenovo Yoga Book yb1-x90f/l has (another) bug in its DSDT where
the UART resource for the BTH0 ACPI device contains
"\\_SB.PCIO.URT1" as path to the UART.

Note that is with a letter 'O' instead of the number '0' which is wrong.

Add a x86_serdev_info entry to make the x86-android-tablets module
manually setup the /sys/bus/serial device for the Bluetooth UART
to fix Bluetooth not working due to this bug.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/lenovo.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 0297b4c43d3b..270c4712fa7c 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -147,6 +147,19 @@ static const struct platform_device_info lenovo_yb1_x90_pdevs[] __initconst = {
 	},
 };
 
+/*
+ * DSDT says UART path is "\\_SB.PCIO.URT1" with a letter 'O' instead of
+ * the number '0' add the link manually.
+ */
+static const struct x86_serdev_info lenovo_yb1_x90_serdevs[] __initconst = {
+	{
+		.ctrl_hid = "8086228A",
+		.ctrl_uid = "1",
+		.ctrl_devname = "serial0",
+		.serdev_hid = "BCM2E1A",
+	},
+};
+
 static struct gpiod_lookup_table lenovo_yb1_x90_goodix_gpios = {
 	.dev_id = "i2c-goodix_ts",
 	.table = {
@@ -203,6 +216,8 @@ const struct x86_dev_info lenovo_yogabook_x90_info __initconst = {
 	.i2c_client_count = ARRAY_SIZE(lenovo_yb1_x90_i2c_clients),
 	.pdev_info = lenovo_yb1_x90_pdevs,
 	.pdev_count = ARRAY_SIZE(lenovo_yb1_x90_pdevs),
+	.serdev_info = lenovo_yb1_x90_serdevs,
+	.serdev_count = ARRAY_SIZE(lenovo_yb1_x90_serdevs),
 	.gpiod_lookup_tables = lenovo_yb1_x90_gpios,
 	.init = lenovo_yb1_x90_init,
 };
-- 
2.39.2

