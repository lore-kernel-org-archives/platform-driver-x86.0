Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998FDC77B7C
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 May 2023 21:00:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbjEEVAF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 May 2023 17:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbjEEVAE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 May 2023 17:00:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C35935260
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 May 2023 13:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683320353;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EAFX+qiTTtL9zUCvCGgk3SJokaanGsX1wKZRD5d+Uwg=;
        b=XQh7ysujCM92104flDg94DPRthvNUYHsAEk/1LSsGjedW4m+2ovrrT4qn8Wgcr4a1fRCiY
        Zlzwz80aJ2m4tukE88Ig6+5zI2BTRW+Qmp09DmOB4jSTn08ttrXpGWrG7a9RXC94w2p5P5
        E0ElI1xY1dAAGJ9DhFwTyiGmFiZ8dfQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-H7lS_EBtPVubrzTreJPMiQ-1; Fri, 05 May 2023 16:59:12 -0400
X-MC-Unique: H7lS_EBtPVubrzTreJPMiQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2344885625;
        Fri,  5 May 2023 20:59:11 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.14])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F0B111402C06;
        Fri,  5 May 2023 20:59:10 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: x86-android-tablets: Add support for extra buttons on Cyberbook T116
Date:   Fri,  5 May 2023 22:59:01 +0200
Message-Id: <20230505205901.42649-2-hdegoede@redhat.com>
In-Reply-To: <20230505205901.42649-1-hdegoede@redhat.com>
References: <20230505205901.42649-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Cyberbook T116 rugged tablet comes in both Windows and Android versions
and even on the Android version the DSDT is mostly sane. This tablet has
2 extra general purpose buttons in the row with the power + volume-buttons,
labeled P and F.

Use the x86-android-tablets infra to create a gpio-button device for these
2 extra buttons.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/dmi.c    | 11 ++++++
 .../platform/x86/x86-android-tablets/other.c  | 39 +++++++++++++++++++
 .../x86-android-tablets/x86-android-tablets.h |  1 +
 3 files changed, 51 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/dmi.c b/drivers/platform/x86/x86-android-tablets/dmi.c
index 07acf0978325..2bda152b4a11 100644
--- a/drivers/platform/x86/x86-android-tablets/dmi.c
+++ b/drivers/platform/x86/x86-android-tablets/dmi.c
@@ -58,6 +58,17 @@ const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
 		},
 		.driver_data = (void *)&chuwi_hi8_info,
 	},
+	{
+		/* Cyberbook T116 Android version */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Default string"),
+			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
+			/* Above strings are much too generic, also match on SKU + BIOS date */
+			DMI_MATCH(DMI_PRODUCT_SKU, "20170531"),
+			DMI_MATCH(DMI_BIOS_DATE, "07/12/2017"),
+		},
+		.driver_data = (void *)&cyberbook_t116_info,
+	},
 	{
 		/* CZC P10T */
 		.ident = "CZC ODEON TPC-10 (\"P10T\")",
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index 4d54c89e6ca2..e79549c6aae1 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -197,6 +197,45 @@ const struct x86_dev_info chuwi_hi8_info __initconst = {
 	.init = chuwi_hi8_init,
 };
 
+/*
+ * Cyberbook T116 Android version
+ * This comes in both Windows and Android versions and even on Android
+ * the DSDT is mostly sane. This tablet has 2 extra general purpose buttons
+ * in the button row with the power + volume-buttons labeled P and F.
+ * Use the x86-android-tablets infra to create a gpio-button device for these.
+ */
+static const struct x86_gpio_button cyberbook_t116_buttons[] __initconst = {
+	{
+		.button = {
+			.code = KEY_PROG1,
+			.active_low = true,
+			.desc = "prog1_key",
+			.type = EV_KEY,
+			.wakeup = false,
+			.debounce_interval = 50,
+		},
+		.chip = "INT33FF:00",
+		.pin = 30,
+	},
+	{
+		.button = {
+			.code = KEY_PROG2,
+			.active_low = true,
+			.desc = "prog2_key",
+			.type = EV_KEY,
+			.wakeup = false,
+			.debounce_interval = 50,
+		},
+		.chip = "INT33FF:03",
+		.pin = 48,
+	},
+};
+
+const struct x86_dev_info cyberbook_t116_info __initconst = {
+	.gpio_button = cyberbook_t116_buttons,
+	.gpio_button_count = ARRAY_SIZE(cyberbook_t116_buttons),
+};
+
 #define CZC_EC_EXTRA_PORT	0x68
 #define CZC_EC_ANDROID_KEYS	0x63
 
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index 8f04a052eada..e46e1128acc8 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -94,6 +94,7 @@ extern const struct x86_dev_info advantech_mica_071_info;
 extern const struct x86_dev_info asus_me176c_info;
 extern const struct x86_dev_info asus_tf103c_info;
 extern const struct x86_dev_info chuwi_hi8_info;
+extern const struct x86_dev_info cyberbook_t116_info;
 extern const struct x86_dev_info czc_p10t;
 extern const struct x86_dev_info lenovo_yogabook_x90_info;
 extern const struct x86_dev_info lenovo_yogabook_x91_info;
-- 
2.40.1

