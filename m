Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BD1C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Dec 2022 11:08:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbiLHLIO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Dec 2022 06:08:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbiLHLHw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Dec 2022 06:07:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD65A10B
        for <platform-driver-x86@vger.kernel.org>; Thu,  8 Dec 2022 03:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670497351;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=q0GTT9NhhbOU+AzsfZ/WjhsSQaWmMFA+fQWTnIof7FI=;
        b=XXvoHtYaTLiCLOJZuyqZb8pXC+MPVtOfHtj/juzUUExp8V5jZPAwABfIrAphqStA4jxSUz
        ic9Mg8rLbeoTJnnqHSk31hDNt8sGSyjll6sVSiBBXEjRRI4yw0olpqEovVo/13FuRELLbV
        GPcYitcPGpXyjrIHfkVOMP7hq3ByPSM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-h6644K96Pp-TkUWj8aQnpQ-1; Thu, 08 Dec 2022 06:02:28 -0500
X-MC-Unique: h6644K96Pp-TkUWj8aQnpQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58FB8380670E;
        Thu,  8 Dec 2022 11:02:28 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.54])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6144A1121331;
        Thu,  8 Dec 2022 11:02:27 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: x86-android-tablets: Add Medion Lifetab S10346 data
Date:   Thu,  8 Dec 2022 12:02:24 +0100
Message-Id: <20221208110224.107354-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Medion Lifetab S10346 is a x86 ACPI tablet which ships with Android
x86 as factory OS. Its DSDT contains a bunch of I2C devices which are not
actually there, causing various resource conflicts. Enumeration of these
is skipped through the acpi_quirk_skip_i2c_client_enumeration().

Add support for manually instantiating the I2C devices which are
actually present on this tablet by adding the necessary device info to
the x86-android-tablets module.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 4acd6fa8d43b..f04e06eeb958 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -987,6 +987,88 @@ static void lenovo_yoga_tab2_830_1050_exit(void)
 	}
 }
 
+/* Medion Lifetab S10346 tablets have an Android factory img with everything hardcoded */
+static const char * const medion_lifetab_s10346_accel_mount_matrix[] = {
+	"0", "1", "0",
+	"1", "0", "0",
+	"0", "0", "1"
+};
+
+static const struct property_entry medion_lifetab_s10346_accel_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("mount-matrix", medion_lifetab_s10346_accel_mount_matrix),
+	{ }
+};
+
+static const struct software_node medion_lifetab_s10346_accel_node = {
+	.properties = medion_lifetab_s10346_accel_props,
+};
+
+/* Note the LCD panel is mounted upside down, this is correctly indicated in the VBT */
+static const struct property_entry medion_lifetab_s10346_touchscreen_props[] = {
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	{ }
+};
+
+static const struct software_node medion_lifetab_s10346_touchscreen_node = {
+	.properties = medion_lifetab_s10346_touchscreen_props,
+};
+
+static const struct x86_i2c_client_info medion_lifetab_s10346_i2c_clients[] __initconst = {
+	{
+		/* kxtj21009 accel */
+		.board_info = {
+			.type = "kxtj21009",
+			.addr = 0x0f,
+			.dev_name = "kxtj21009",
+			.swnode = &medion_lifetab_s10346_accel_node,
+		},
+		.adapter_path = "\\_SB_.I2C3",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FC:02",
+			.index = 23,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_HIGH,
+		},
+	}, {
+		/* goodix touchscreen */
+		.board_info = {
+			.type = "GDIX1001:00",
+			.addr = 0x14,
+			.dev_name = "goodix_ts",
+			.swnode = &medion_lifetab_s10346_touchscreen_node,
+		},
+		.adapter_path = "\\_SB_.I2C4",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_APIC,
+			.index = 0x44,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+		},
+	},
+};
+
+static struct gpiod_lookup_table medion_lifetab_s10346_goodix_gpios = {
+	.dev_id = "i2c-goodix_ts",
+	.table = {
+		GPIO_LOOKUP("INT33FC:01", 26, "reset", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("INT33FC:02", 3, "irq", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+static struct gpiod_lookup_table * const medion_lifetab_s10346_gpios[] = {
+	&medion_lifetab_s10346_goodix_gpios,
+	NULL
+};
+
+static const struct x86_dev_info medion_lifetab_s10346_info __initconst = {
+	.i2c_client_info = medion_lifetab_s10346_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(medion_lifetab_s10346_i2c_clients),
+	.gpiod_lookup_tables = medion_lifetab_s10346_gpios,
+};
+
 /* Nextbook Ares 8 tablets have an Android factory img with everything hardcoded */
 static const char * const nextbook_ares8_accel_mount_matrix[] = {
 	"0", "-1", "0",
@@ -1245,6 +1327,16 @@ static const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
 		},
 		.driver_data = (void *)&lenovo_yoga_tab2_830_1050_info,
 	},
+	{
+		/* Medion Lifetab S10346 */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
+			/* Above strings are much too generic, also match on BIOS date */
+			DMI_MATCH(DMI_BIOS_DATE, "10/22/2015"),
+		},
+		.driver_data = (void *)&medion_lifetab_s10346_info,
+	},
 	{
 		/* Nextbook Ares 8 */
 		.matches = {
-- 
2.38.1

