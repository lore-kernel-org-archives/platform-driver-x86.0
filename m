Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A4CC64EC7
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 09:24:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbjCAJYf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 04:24:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjCAJYc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 04:24:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6539732E45
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 01:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677662622;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JS89fE4qk1EPPHjF6ugmVawM7exlUu8DFgwkNcp7Hmk=;
        b=AgbrhTYJLJR4k3Qk3okbqFqv5Mtmdcwl+WdTXuoCdCSOJWpMZs8jcRVYJ0zz94NtLfpsZ3
        qcKWfkJbY7zzTwzF3EtIUZnwzupDUYdkvNNQhG2e5Kdgr8AskBrGMevo2dK92FrvS15EXh
        yc/jxR3jsoI2T6LXvncP4C02w294egw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-pC4fhx4GMOWarqvnorChoA-1; Wed, 01 Mar 2023 04:23:39 -0500
X-MC-Unique: pC4fhx4GMOWarqvnorChoA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 318643C0E44C;
        Wed,  1 Mar 2023 09:23:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.30])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 85076400D796;
        Wed,  1 Mar 2023 09:23:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 01/14] platform/x86: x86-android-tablets: Add Acer Iconia One 7 B1-750 data
Date:   Wed,  1 Mar 2023 10:23:18 +0100
Message-Id: <20230301092331.7038-2-hdegoede@redhat.com>
In-Reply-To: <20230301092331.7038-1-hdegoede@redhat.com>
References: <20230301092331.7038-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Acer Iconia One 7 B1-750 is a x86 ACPI tablet which ships with Android
x86 as factory OS. Its DSDT contains a bunch of I2C devices which are not
actually there, causing various resource conflicts. Enumeration of these
is skipped through the acpi_quirk_skip_i2c_client_enumeration().

Add support for manually instantiating the I2C + other devices which are
actually present on this tablet by adding the necessary device info to
the x86-android-tablets module.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 101 +++++++++++++++++++--
 1 file changed, 91 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 111b007656fc..8405e1c58d52 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -265,6 +265,88 @@ static struct gpiod_lookup_table int3496_gpo2_pin22_gpios = {
 	},
 };
 
+static struct gpiod_lookup_table int3496_reference_gpios = {
+	.dev_id = "intel-int3496",
+	.table = {
+		GPIO_LOOKUP("INT33FC:01", 15, "vbus", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("INT33FC:02", 1, "mux", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("INT33FC:02", 18, "id", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+/* Acer Iconia One 7 B1-750 has an Android factory img with everything hardcoded */
+static const char * const acer_b1_750_mount_matrix[] = {
+	"-1", "0", "0",
+	"0", "1", "0",
+	"0", "0", "1"
+};
+
+static const struct property_entry acer_b1_750_bma250e_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("mount-matrix", acer_b1_750_mount_matrix),
+	{ }
+};
+
+static const struct software_node acer_b1_750_bma250e_node = {
+	.properties = acer_b1_750_bma250e_props,
+};
+
+static const struct x86_i2c_client_info acer_b1_750_i2c_clients[] __initconst = {
+	{
+		/* Novatek NVT-ts touchscreen */
+		.board_info = {
+			.type = "NVT-ts",
+			.addr = 0x34,
+			.dev_name = "NVT-ts",
+		},
+		.adapter_path = "\\_SB_.I2C4",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FC:02",
+			.index = 3,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+		},
+	}, {
+		/* BMA250E accelerometer */
+		.board_info = {
+			.type = "bma250e",
+			.addr = 0x18,
+			.swnode = &acer_b1_750_bma250e_node,
+		},
+		.adapter_path = "\\_SB_.I2C3",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FC:02",
+			.index = 25,
+			.trigger = ACPI_LEVEL_SENSITIVE,
+			.polarity = ACPI_ACTIVE_HIGH,
+		},
+	},
+};
+
+static struct gpiod_lookup_table acer_b1_750_goodix_gpios = {
+	.dev_id = "i2c-NVT-ts",
+	.table = {
+		GPIO_LOOKUP("INT33FC:01", 26, "reset", GPIO_ACTIVE_LOW),
+		{ }
+	},
+};
+
+static struct gpiod_lookup_table * const acer_b1_750_gpios[] = {
+	&acer_b1_750_goodix_gpios,
+	&int3496_reference_gpios,
+	NULL
+};
+
+static const struct x86_dev_info acer_b1_750_info __initconst = {
+	.i2c_client_info = acer_b1_750_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(acer_b1_750_i2c_clients),
+	.pdev_info = int3496_pdevs,
+	.pdev_count = ARRAY_SIZE(int3496_pdevs),
+	.gpiod_lookup_tables = acer_b1_750_gpios,
+};
+
 /*
  * Advantech MICA-071
  * This is a standard Windows tablet, but it has an extra "quick launch" button
@@ -1298,17 +1380,8 @@ static const struct x86_i2c_client_info nextbook_ares8_i2c_clients[] __initconst
 	},
 };
 
-static struct gpiod_lookup_table nextbook_ares8_int3496_gpios = {
-	.dev_id = "intel-int3496",
-	.table = {
-		GPIO_LOOKUP("INT33FC:02", 1, "mux", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("INT33FC:02", 18, "id", GPIO_ACTIVE_HIGH),
-		{ }
-	},
-};
-
 static struct gpiod_lookup_table * const nextbook_ares8_gpios[] = {
-	&nextbook_ares8_int3496_gpios,
+	&int3496_reference_gpios,
 	NULL
 };
 
@@ -1435,6 +1508,14 @@ static const struct x86_dev_info xiaomi_mipad2_info __initconst = {
 };
 
 static const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
+	{
+		/* Acer Iconia One 7 B1-750 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "VESPA2"),
+		},
+		.driver_data = (void *)&acer_b1_750_info,
+	},
 	{
 		/* Advantech MICA-071 */
 		.matches = {
-- 
2.39.1

