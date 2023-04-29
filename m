Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4B7C77B60
	for <platform-driver-x86@archiver.kernel.org>; Sat, 29 Apr 2023 18:03:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjD2SDe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 29 Apr 2023 14:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjD2SDd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 Apr 2023 14:03:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A574310F1
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Apr 2023 11:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682791365;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=m3p7fWLrjb8afpYC9b/0q/921Mdpq6LY7H4zcNrNFU4=;
        b=UymQDxU4gT/9FbG3bFKf6UNjIcf4dzi8C8WfsIvlEXwx4J1tR3jsrmbTtJWbRY6bw//yqb
        031WZzD/91sh1bYNO9ft2bmavvNFuLcxIWY3/Q01p+TaFsNNxnxRYRMCCo18x+GlcwiR7K
        KWzBgHaGQpgCjvhIxvggOWCASm8qVlg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-j7ZmrnJiPieE-xdUEFo87w-1; Sat, 29 Apr 2023 14:02:40 -0400
X-MC-Unique: j7ZmrnJiPieE-xdUEFo87w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AF733C0DDAE;
        Sat, 29 Apr 2023 18:02:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CB8DD14171B6;
        Sat, 29 Apr 2023 18:02:39 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: x86-android-tablets: Add Lenovo Yoga Book lid switch
Date:   Sat, 29 Apr 2023 20:02:30 +0200
Message-Id: <20230429180230.97716-2-hdegoede@redhat.com>
In-Reply-To: <20230429180230.97716-1-hdegoede@redhat.com>
References: <20230429180230.97716-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add x86_gpio_button info for the yb1-x90f/l describing the lid switch
on the Lenovo Yoga Book Android models.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/lenovo.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 270c4712fa7c..50031e902a2c 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -160,6 +160,19 @@ static const struct x86_serdev_info lenovo_yb1_x90_serdevs[] __initconst = {
 	},
 };
 
+static struct x86_gpio_button lenovo_yb1_x90_lid = {
+	.button = {
+		.code = SW_LID,
+		.active_low = true,
+		.desc = "lid_sw",
+		.type = EV_SW,
+		.wakeup = true,
+		.debounce_interval = 50,
+	},
+	.chip = "INT33FF:02",
+	.pin = 19,
+};
+
 static struct gpiod_lookup_table lenovo_yb1_x90_goodix_gpios = {
 	.dev_id = "i2c-goodix_ts",
 	.table = {
@@ -218,6 +231,7 @@ const struct x86_dev_info lenovo_yogabook_x90_info __initconst = {
 	.pdev_count = ARRAY_SIZE(lenovo_yb1_x90_pdevs),
 	.serdev_info = lenovo_yb1_x90_serdevs,
 	.serdev_count = ARRAY_SIZE(lenovo_yb1_x90_serdevs),
+	.gpio_button = &lenovo_yb1_x90_lid,
 	.gpiod_lookup_tables = lenovo_yb1_x90_gpios,
 	.init = lenovo_yb1_x90_init,
 };
-- 
2.39.2

