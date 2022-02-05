Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30022C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Feb 2022 19:14:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343837AbiBETON (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 5 Feb 2022 14:14:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36853 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243609AbiBETON (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Feb 2022 14:14:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644088452;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Abtl0YVLgYWBVpslgerd/m92oxzfmvtyzdTTdSO5sFo=;
        b=Ff+om87V3mYEXFWNh7mTKEWmfl0RZM96ANNi3SFpnn1ymfqzliU9g2eNsHgTZ2hS8ueyZs
        Z5Ubyz9IJ0F5Aflssw0YGks189wzLR8DbPOqngWInqZC+L/Il6/IAI+iP9WVT1+ilhefiw
        0jVMMPAvTPOzyJUV19Cci+jCslz3kCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-2dn5sqUTP5eGIJcM9D8F3A-1; Sat, 05 Feb 2022 14:14:07 -0500
X-MC-Unique: 2dn5sqUTP5eGIJcM9D8F3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FDAA1091DA1;
        Sat,  5 Feb 2022 19:14:06 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 48D2A5C23A;
        Sat,  5 Feb 2022 19:14:05 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 6/6] platform/x86: x86-android-tablets: Add Nextbook Ares 8 data
Date:   Sat,  5 Feb 2022 20:13:56 +0100
Message-Id: <20220205191356.225505-6-hdegoede@redhat.com>
In-Reply-To: <20220205191356.225505-1-hdegoede@redhat.com>
References: <20220205191356.225505-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Nextbook Ares 8 is a x86 ACPI tablet which ships with Android x86
as factory OS. Its DSDT contains a bunch of I2C devices which are not
actually there, causing various resource conflicts. Enumeration of these
is skipped through the acpi_quirk_skip_i2c_client_enumeration().

Add support for manually instantiating the I2C devices which are
actually present on this tablet by adding the necessary device info to
the x86-android-tablets module.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 88 +++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 6d3a453d90eb..838d667126e5 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -669,6 +669,84 @@ static const struct x86_dev_info czc_p10t __initconst = {
 	.init = czc_p10t_init,
 };
 
+/* Nextbook Ares 8 tablets have an Android factory img with everything hardcoded */
+static const char * const nextbook_ares8_accel_mount_matrix[] = {
+	"0", "-1", "0",
+	"-1", "0", "0",
+	"0", "0", "1"
+};
+
+static const struct property_entry nextbook_ares8_accel_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("mount-matrix", nextbook_ares8_accel_mount_matrix),
+	{ }
+};
+
+static const struct software_node nextbook_ares8_accel_node = {
+	.properties = nextbook_ares8_accel_props,
+};
+
+static const struct property_entry nextbook_ares8_touchscreen_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 800),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
+	{ }
+};
+
+static const struct software_node nextbook_ares8_touchscreen_node = {
+	.properties = nextbook_ares8_touchscreen_props,
+};
+
+static const struct x86_i2c_client_info nextbook_ares8_i2c_clients[] __initconst = {
+	{
+		/* Freescale MMA8653FC accel */
+		.board_info = {
+			.type = "mma8653",
+			.addr = 0x1d,
+			.dev_name = "mma8653",
+			.swnode = &nextbook_ares8_accel_node,
+		},
+		.adapter_path = "\\_SB_.I2C3",
+	}, {
+		/* FT5416DQ9 touchscreen controller */
+		.board_info = {
+			.type = "edt-ft5x06",
+			.addr = 0x38,
+			.dev_name = "ft5416",
+			.swnode = &nextbook_ares8_touchscreen_node,
+		},
+		.adapter_path = "\\_SB_.I2C4",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FC:02",
+			.index = 3,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+		},
+	},
+};
+
+static struct gpiod_lookup_table nextbook_ares8_int3496_gpios = {
+	.dev_id = "intel-int3496",
+	.table = {
+		GPIO_LOOKUP("INT33FC:02", 1, "mux", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("INT33FC:02", 18, "id", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+static struct gpiod_lookup_table * const nextbook_ares8_gpios[] = {
+	&nextbook_ares8_int3496_gpios,
+	NULL
+};
+
+static const struct x86_dev_info nextbook_ares8_info __initconst = {
+	.i2c_client_info = nextbook_ares8_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(nextbook_ares8_i2c_clients),
+	.pdev_info = int3496_pdevs,
+	.pdev_count = ARRAY_SIZE(int3496_pdevs),
+	.gpiod_lookup_tables = nextbook_ares8_gpios,
+	.invalid_aei_gpiochip = "INT33FC:02",
+};
+
 /*
  * Whitelabel (sold as various brands) TM800A550L tablets.
  * These tablet's DSDT contains a whole bunch of bogus ACPI I2C devices
@@ -830,7 +908,7 @@ static const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
 		.driver_data = (void *)&czc_p10t,
 	},
 	{
-		/* A variant of CZC P10T */
+		/* CZC P10T variant */
 		.ident = "ViewSonic ViewPad 10",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ViewSonic"),
@@ -838,6 +916,14 @@ static const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
 		},
 		.driver_data = (void *)&czc_p10t,
 	},
+	{
+		/* Nextbook Ares 8 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "M890BAP"),
+		},
+		.driver_data = (void *)&nextbook_ares8_info,
+	},
 	{
 		/* Whitelabel (sold as various brands) TM800A550L */
 		.matches = {
-- 
2.33.1

