Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57103C7EE32
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 09:26:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjCAJZk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 04:25:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjCAJZL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 04:25:11 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8859734F46
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 01:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677662629;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d4WbNtaFnKMhYZ9FLZXOK0qalKndD9wzQjlHaEvuZ3g=;
        b=VohbHGeawX1POEjsubCop5NsUJoVXDutEMHnQaNJrIB/cdYvBEik8cpK3HUpWY2Op7A7tS
        30jUKaIt8AeCK1qhJB5V7TCB3O/r9llaKs35+5EUoupRg8l0F56p+v4PRfuTWhXYmbYYvI
        2FCnuk5XpxC/56XraXOxfujsq4Q8IJ4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-6Ccdp1N3PyWh1pwZHLgRow-1; Wed, 01 Mar 2023 04:23:48 -0500
X-MC-Unique: 6Ccdp1N3PyWh1pwZHLgRow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 402213810B0D;
        Wed,  1 Mar 2023 09:23:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.30])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 86814400D796;
        Wed,  1 Mar 2023 09:23:47 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 11/14] platform/x86: x86-android-tablets: Add touchscreen support for Lenovo Yoga Tab 3 Pro YT3-X90F
Date:   Wed,  1 Mar 2023 10:23:28 +0100
Message-Id: <20230301092331.7038-12-hdegoede@redhat.com>
In-Reply-To: <20230301092331.7038-1-hdegoede@redhat.com>
References: <20230301092331.7038-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
index 290de07d8aa0..10121fde42da 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -12,6 +12,7 @@
 
 #include <linux/efi.h>
 #include <linux/gpio/machine.h>
+#include <linux/mfd/intel_soc_pmic.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/machine.h>
 #include <linux/platform_data/lp855x.h>
@@ -334,6 +335,17 @@ static const struct software_node lenovo_yt3_bq25892_0_node = {
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
@@ -369,6 +381,22 @@ static const struct x86_i2c_client_info lenovo_yt3_i2c_clients[] __initconst = {
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
 
@@ -409,11 +437,29 @@ static int __init lenovo_yt3_init(void)
 
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

