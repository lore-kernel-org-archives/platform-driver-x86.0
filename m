Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806F7C77B7C
	for <platform-driver-x86@archiver.kernel.org>; Sat, 29 Apr 2023 10:52:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjD2KwB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 29 Apr 2023 06:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbjD2KwA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 Apr 2023 06:52:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9A2BE7F
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Apr 2023 03:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682765470;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1nKd4rsS0MobpDJsEKuXWi1KkTQmmAIPCVArb8gNULY=;
        b=dcMJyBYSDIjVhZTlE8/Dtr07dDnnv544imppBvHyRj3onH0aZlGqoH95uy4pQZaecgQTwA
        Q7bOHEdn51j2D3yhJgSp3RLQ1N8SAqr0rz8DMfkGPiMZBGEO3qJBXHQzW4kRWUWZTfBHiF
        GvKvdZMeXXbcoRimSIiB/HJNYUbuhl0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-P3G4aZiMNFqWOeLBdLB_2w-1; Sat, 29 Apr 2023 06:51:08 -0400
X-MC-Unique: P3G4aZiMNFqWOeLBdLB_2w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95DDB1C05EAA;
        Sat, 29 Apr 2023 10:51:08 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E7164C15BA0;
        Sat, 29 Apr 2023 10:51:07 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/3] platform/x86: x86-android-tablets: Add Nextbook Ares 8A data
Date:   Sat, 29 Apr 2023 12:50:57 +0200
Message-Id: <20230429105057.7697-3-hdegoede@redhat.com>
In-Reply-To: <20230429105057.7697-1-hdegoede@redhat.com>
References: <20230429105057.7697-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Nextbook Ares 8A is a x86 ACPI tablet which ships with Android x86
as factory OS. Its DSDT contains a bunch of I2C devices which are not
actually there, causing various resource conflicts. Enumeration of these
is skipped through the acpi_quirk_skip_i2c_client_enumeration().

Add support for manually instantiating the I2C devices which are
actually present on this tablet by adding the necessary device info to
the x86-android-tablets module.

Note the Ares 8A is the Cherry Trail (CHT) model, the regular Ares 8
is Bay Trail (BYT) based and was already supported. This also updates
the comments for the BYT model to point out this is the BYT model.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/dmi.c    | 11 +++-
 .../platform/x86/x86-android-tablets/other.c  | 66 ++++++++++++++++++-
 .../x86-android-tablets/x86-android-tablets.h |  1 +
 3 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/dmi.c b/drivers/platform/x86/x86-android-tablets/dmi.c
index 23e640b7003d..07acf0978325 100644
--- a/drivers/platform/x86/x86-android-tablets/dmi.c
+++ b/drivers/platform/x86/x86-android-tablets/dmi.c
@@ -127,13 +127,22 @@ const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
 		.driver_data = (void *)&medion_lifetab_s10346_info,
 	},
 	{
-		/* Nextbook Ares 8 */
+		/* Nextbook Ares 8 (BYT version)*/
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "M890BAP"),
 		},
 		.driver_data = (void *)&nextbook_ares8_info,
 	},
+	{
+		/* Nextbook Ares 8A (CHT version)*/
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "CherryTrail"),
+			DMI_MATCH(DMI_BIOS_VERSION, "M882"),
+		},
+		.driver_data = (void *)&nextbook_ares8a_info,
+	},
 	{
 		/* Peaq C1010 */
 		.matches = {
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index fb512c084fe9..3754d2453cdb 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -311,7 +311,7 @@ const struct x86_dev_info medion_lifetab_s10346_info __initconst = {
 	.gpiod_lookup_tables = medion_lifetab_s10346_gpios,
 };
 
-/* Nextbook Ares 8 tablets have an Android factory img with everything hardcoded */
+/* Nextbook Ares 8 (BYT) tablets have an Android factory img with everything hardcoded */
 static const char * const nextbook_ares8_accel_mount_matrix[] = {
 	"0", "-1", "0",
 	"-1", "0", "0",
@@ -379,6 +379,70 @@ const struct x86_dev_info nextbook_ares8_info __initconst = {
 	.gpiod_lookup_tables = nextbook_ares8_gpios,
 };
 
+/* Nextbook Ares 8A (CHT) tablets have an Android factory img with everything hardcoded */
+static const char * const nextbook_ares8a_accel_mount_matrix[] = {
+	"1", "0", "0",
+	"0", "-1", "0",
+	"0", "0", "1"
+};
+
+static const struct property_entry nextbook_ares8a_accel_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("mount-matrix", nextbook_ares8a_accel_mount_matrix),
+	{ }
+};
+
+static const struct software_node nextbook_ares8a_accel_node = {
+	.properties = nextbook_ares8a_accel_props,
+};
+
+static const struct x86_i2c_client_info nextbook_ares8a_i2c_clients[] __initconst = {
+	{
+		/* Freescale MMA8653FC accel */
+		.board_info = {
+			.type = "mma8653",
+			.addr = 0x1d,
+			.dev_name = "mma8653",
+			.swnode = &nextbook_ares8a_accel_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C3",
+	}, {
+		/* FT5416DQ9 touchscreen controller */
+		.board_info = {
+			.type = "edt-ft5x06",
+			.addr = 0x38,
+			.dev_name = "ft5416",
+			.swnode = &nextbook_ares8_touchscreen_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C6",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FF:01",
+			.index = 17,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+		},
+	},
+};
+
+static struct gpiod_lookup_table nextbook_ares8a_ft5416_gpios = {
+	.dev_id = "i2c-ft5416",
+	.table = {
+		GPIO_LOOKUP("INT33FF:01", 25, "reset", GPIO_ACTIVE_LOW),
+		{ }
+	},
+};
+
+static struct gpiod_lookup_table * const nextbook_ares8a_gpios[] = {
+	&nextbook_ares8a_ft5416_gpios,
+	NULL
+};
+
+const struct x86_dev_info nextbook_ares8a_info __initconst = {
+	.i2c_client_info = nextbook_ares8a_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(nextbook_ares8a_i2c_clients),
+	.gpiod_lookup_tables = nextbook_ares8a_gpios,
+};
+
 /*
  * Peaq C1010
  * This is a standard Windows tablet, but it has a special Dolby button.
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index b6802d75dbdd..8e9f7238015c 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -100,6 +100,7 @@ extern const struct x86_dev_info lenovo_yoga_tab2_830_1050_info;
 extern const struct x86_dev_info lenovo_yt3_info;
 extern const struct x86_dev_info medion_lifetab_s10346_info;
 extern const struct x86_dev_info nextbook_ares8_info;
+extern const struct x86_dev_info nextbook_ares8a_info;
 extern const struct x86_dev_info peaq_c1010_info;
 extern const struct x86_dev_info whitelabel_tm800a550l_info;
 extern const struct x86_dev_info xiaomi_mipad2_info;
-- 
2.39.2

