Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4CC3C77B73
	for <platform-driver-x86@archiver.kernel.org>; Sun, 16 Apr 2023 21:29:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbjDPV3f (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 16 Apr 2023 17:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjDPV3e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 16 Apr 2023 17:29:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A74482107
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Apr 2023 14:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681680528;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9yYwSl/G88KvZ8rvQCNrw30tHVXz0YrEdCGm3+T/A3E=;
        b=Amysi6Dag3wQ+sJNf7yxMhJ84+ej1grdUjnTOze0EvvpMaR4H4L6Wc/OtYieqKmjuCqpuK
        G94qw9cnOnMSfLVmawwyZmQZikx26/u00IWc+1LzX1wGvm/w/0MjBs3yvsr3i1usArEtL6
        WgQDzy0Lcrkyk0iTakcseKl9zUTWeDc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-FXuFc3X6MvCASvzLapTCwQ-1; Sun, 16 Apr 2023 17:28:44 -0400
X-MC-Unique: FXuFc3X6MvCASvzLapTCwQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 235383813F2F;
        Sun, 16 Apr 2023 21:28:44 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.56])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 747F91415304;
        Sun, 16 Apr 2023 21:28:43 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/4] platform/x86: x86-android-tablets: Add Wacom digitizer info for Lenovo Yoga Book
Date:   Sun, 16 Apr 2023 23:28:39 +0200
Message-Id: <20230416212841.311152-2-hdegoede@redhat.com>
In-Reply-To: <20230416212841.311152-1-hdegoede@redhat.com>
References: <20230416212841.311152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Lenovo Yoga Book has a wacom digitizer in its keyboard half,
add the necessary info to instantiate an i2c_client for the digitizer.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/lenovo.c | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index b5dd74bf9e8c..438de8b92dc6 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -40,6 +40,16 @@ static struct lp855x_platform_data lenovo_lp8557_pdata = {
 
 /* Lenovo Yoga Book X90F / X90L's Android factory img has everything hardcoded */
 
+static const struct property_entry lenovo_yb1_x90_wacom_props[] = {
+	PROPERTY_ENTRY_U32("hid-descr-addr", 0x0001),
+	PROPERTY_ENTRY_U32("post-reset-deassert-delay-ms", 150),
+	{ }
+};
+
+static const struct software_node lenovo_yb1_x90_wacom_node = {
+	.properties = lenovo_yb1_x90_wacom_props,
+};
+
 /*
  * The HiDeep IST940E touchscreen comes up in I2C-HID mode. The native protocol
  * reports ABS_MT_PRESSURE and ABS_MT_TOUCH_MAJOR which are not reported in HID
@@ -86,6 +96,22 @@ static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst
 			.trigger = ACPI_EDGE_SENSITIVE,
 			.polarity = ACPI_ACTIVE_LOW,
 		},
+	}, {
+		/* Wacom Digitizer in keyboard half */
+		.board_info = {
+			.type = "hid-over-i2c",
+			.addr = 0x09,
+			.dev_name = "wacom",
+			.swnode = &lenovo_yb1_x90_wacom_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C4",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FF:01",
+			.index = 49,
+			.trigger = ACPI_LEVEL_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+		},
 	}, {
 		/* LP8557 Backlight controller */
 		.board_info = {
@@ -131,9 +157,18 @@ static struct gpiod_lookup_table lenovo_yb1_x90_hideep_gpios = {
 	},
 };
 
+static struct gpiod_lookup_table lenovo_yb1_x90_wacom_gpios = {
+	.dev_id = "i2c-wacom",
+	.table = {
+		GPIO_LOOKUP("INT33FF:00", 82, "reset", GPIO_ACTIVE_LOW),
+		{ }
+	},
+};
+
 static struct gpiod_lookup_table * const lenovo_yb1_x90_gpios[] = {
 	&lenovo_yb1_x90_hideep_gpios,
 	&lenovo_yb1_x90_goodix_gpios,
+	&lenovo_yb1_x90_wacom_gpios,
 	NULL
 };
 
-- 
2.39.2

