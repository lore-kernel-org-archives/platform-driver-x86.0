Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A751C636D6
	for <platform-driver-x86@archiver.kernel.org>; Thu, 23 Feb 2023 11:57:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233157AbjBWL53 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 23 Feb 2023 06:57:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233351AbjBWL52 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Feb 2023 06:57:28 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B5B1C320
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Feb 2023 03:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677153400;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Y9VeYqTcpj6T8JSi78ZolBt+4BYoLaEm5K9uCFPFbKU=;
        b=chw6JabWjOTvfv2ogL1R+ZiGfcqxRYuQuYiwH7M2Dsa3CojDKOQZcN9kBe7qt3wIBbJiGs
        qUp0HxAn5haRV1qW5pQ7jKMiu2R5mcxV44UDMhpU59Qc+/U3jWA04bgXEeTI6ZiS5eE2iX
        d8NfECTMUUc9f0ui48vo7oVwzs3V6DY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-4sxElbkTMuyBfCMPO61pBA-1; Thu, 23 Feb 2023 06:56:39 -0500
X-MC-Unique: 4sxElbkTMuyBfCMPO61pBA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0503618A64E1;
        Thu, 23 Feb 2023 11:56:39 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.113])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 03600C15BA0;
        Thu, 23 Feb 2023 11:56:37 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: x86-android-tablets: Add touchscreen support for Lenovo Yoga Tab 3 Pro YT3-X90F
Date:   Thu, 23 Feb 2023 12:56:36 +0100
Message-Id: <20230223115637.30303-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add the necessaty info to instantiate the I2C device for the touchscreen
on Lenovo Yoga Tab 3 Pro YT3-X90F tablets.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/lenovo.c | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 6bdf25c030ed..0555a4e8a1e3 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -11,6 +11,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/efi.h>
+#include <linux/mfd/intel_soc_pmic.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/machine.h>
 #include <linux/platform_data/lp855x.h>
@@ -332,6 +333,17 @@ static const struct software_node lenovo_yt3_bq25892_0_node = {
 	.properties = lenovo_yt3_bq25892_0_props,
 };
 
+static const struct property_entry lenovo_yt3_hideep_ts_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1600),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 2560),
+	PROPERTY_ENTRY_U32("touchscreen-max-pressure", 255),
+	{ }
+};
+
+static const struct software_node lenovo_yt3_hideep_ts_node = {
+	.properties = lenovo_yt3_hideep_ts_props,
+};
+
 static const struct x86_i2c_client_info lenovo_yt3_i2c_clients[] __initconst = {
 	{
 		/* bq27500 fuel-gauge for the flat lipo battery behind the screen */
@@ -367,6 +379,22 @@ static const struct x86_i2c_client_info lenovo_yt3_i2c_clients[] __initconst = {
 			.swnode = &fg_bq25890_1_supply_node,
 		},
 		.adapter_path = "\\_SB_.PCI0.I2C2",
+	}, {
+		/* HiDeep Touchscreen */
+		.board_info = {
+			.type = "hideep_ts",
+			.addr = 0x6c,
+			.dev_name = "hideep_ts",
+			.swnode = &lenovo_yt3_hideep_ts_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C6",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FF:03",
+			.index = 77,
+			.trigger = ACPI_LEVEL_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+		},
 	}
 };
 
@@ -407,11 +435,29 @@ static int __init lenovo_yt3_init(void)
 
 	gpiod_set_value(gpiod, 0);
 
+	/* Enable the regulators used by the touchscreen */
+	intel_soc_pmic_exec_mipi_pmic_seq_element(0x6e, 0x9b, 0x02, 0xff);
+	intel_soc_pmic_exec_mipi_pmic_seq_element(0x6e, 0xa0, 0x02, 0xff);
+
 	return 0;
 }
 
+static struct gpiod_lookup_table lenovo_yt3_hideep_gpios = {
+	.dev_id = "i2c-hideep_ts",
+	.table = {
+		GPIO_LOOKUP("INT33FF:00", 7, "reset", GPIO_ACTIVE_LOW),
+		{ }
+	},
+};
+
+static struct gpiod_lookup_table * const lenovo_yt3_gpios[] = {
+	&lenovo_yt3_hideep_gpios,
+	NULL
+};
+
 const struct x86_dev_info lenovo_yt3_info __initconst = {
 	.i2c_client_info = lenovo_yt3_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(lenovo_yt3_i2c_clients),
+	.gpiod_lookup_tables = lenovo_yt3_gpios,
 	.init = lenovo_yt3_init,
 };
-- 
2.39.1

