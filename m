Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17146C76196
	for <platform-driver-x86@archiver.kernel.org>; Sat,  1 Apr 2023 15:08:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjDAPIl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 1 Apr 2023 11:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbjDAPIk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 1 Apr 2023 11:08:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C181CBAE
        for <platform-driver-x86@vger.kernel.org>; Sat,  1 Apr 2023 08:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361672;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Gq2Zrf7IMh4/B4/HxoSgQN3ALfhkXhIzizBJNAHr2Sc=;
        b=DZELXJ7a+AQtxHTcMvzdsJEtSCrPrNWnuUiZFGW3X0/F9LdAGCRTTB3unBzWqQ0p6NbQCF
        uqwUWyAq++9b2uoVS5afcd+HMEOYQXui5DI2taSK8R+bKEgdPy4FmBAGb3pm6a5bi7suyL
        8apK8jdUDVCbs9OnbwH2sm/lU0TuHBE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-kuDRWUcbOJ-TlrU3uyVgLw-1; Sat, 01 Apr 2023 11:07:48 -0400
X-MC-Unique: kuDRWUcbOJ-TlrU3uyVgLw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76864884620;
        Sat,  1 Apr 2023 15:07:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C51EB1121314;
        Sat,  1 Apr 2023 15:07:47 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/3] platform/x86: x86-android-tablets: Add Lenovo Yoga Book X90F/L data
Date:   Sat,  1 Apr 2023 17:07:37 +0200
Message-Id: <20230401150737.597417-3-hdegoede@redhat.com>
In-Reply-To: <20230401150737.597417-1-hdegoede@redhat.com>
References: <20230401150737.597417-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Lenovo Yoga Book X90F/L is a x86 ACPI tablet which ships with Android
x86 as factory OS. Its DSDT contains a bunch of I2C devices which are not
actually there, causing various resource conflicts. Enumeration of these
is skipped through the acpi_quirk_skip_i2c_client_enumeration().

Add support for manually instantiating the I2C + other devices which are
actually present on this tablet by adding the necessary device info to
the x86-android-tablets module.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/dmi.c    |   9 ++
 .../platform/x86/x86-android-tablets/lenovo.c | 122 ++++++++++++++++++
 .../x86-android-tablets/x86-android-tablets.h |   1 +
 3 files changed, 132 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/dmi.c b/drivers/platform/x86/x86-android-tablets/dmi.c
index 6ea47af1b480..23e640b7003d 100644
--- a/drivers/platform/x86/x86-android-tablets/dmi.c
+++ b/drivers/platform/x86/x86-android-tablets/dmi.c
@@ -76,6 +76,15 @@ const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
 		},
 		.driver_data = (void *)&czc_p10t,
 	},
+	{
+		/* Lenovo Yoga Book X90F / X90L */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "YETI-11"),
+		},
+		.driver_data = (void *)&lenovo_yogabook_x90_info,
+	},
 	{
 		/* Lenovo Yoga Book X91F / X91L */
 		.matches = {
diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 5d217cbbde30..d53928504c09 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -38,6 +38,128 @@ static struct lp855x_platform_data lenovo_lp8557_pdata = {
 	.initial_brightness = 128,
 };
 
+/* Lenovo Yoga Book X90F / X90L's Android factory img has everything hardcoded */
+
+/*
+ * The HiDeep IST940E touchscreen comes up in HID mode and could alternatively
+ * be used in I2C-HID mode (I2C-HID descriptor reg 0x0020) if i2c-hid-of.c is
+ * modified to use generic (non of) device-properties and thought to deal with
+ * the reset GPIO. "hideep,force-native-protocol" resets it to native mode.
+ */
+static const struct property_entry lenovo_yb1_x90_hideep_ts_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1200),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1920),
+	PROPERTY_ENTRY_U32("touchscreen-max-pressure", 16384),
+	PROPERTY_ENTRY_BOOL("hideep,force-native-protocol"),
+	{ }
+};
+
+static const struct software_node lenovo_yb1_x90_hideep_ts_node = {
+	.properties = lenovo_yb1_x90_hideep_ts_props,
+};
+
+static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst = {
+	{
+		/* BQ27542 fuel-gauge */
+		.board_info = {
+			.type = "bq27542",
+			.addr = 0x55,
+			.dev_name = "bq27542",
+			.swnode = &fg_bq25890_supply_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C1",
+	}, {
+		/* Goodix Touchscreen in keyboard half*/
+		.board_info = {
+			.type = "GDIX1001:00",
+			.addr = 0x14,
+			.dev_name = "goodix_ts",
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C2",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FF:01",
+			.index = 56,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+		},
+	}, {
+		/* LP8557 Backlight controller */
+		.board_info = {
+			.type = "lp8557",
+			.addr = 0x2c,
+			.dev_name = "lp8557",
+			.platform_data = &lenovo_lp8557_pdata,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C4",
+	}, {
+		/* HiDeep IST940E Touchscreen in display half */
+		.board_info = {
+			.type = "hideep_ts",
+			.addr = 0x6c,
+			.dev_name = "hideep_ts",
+			.swnode = &lenovo_yb1_x90_hideep_ts_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C6",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FF:03",
+			.index = 77,
+			.trigger = ACPI_LEVEL_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+		},
+	},
+};
+
+static struct gpiod_lookup_table lenovo_yb1_x90_goodix_gpios = {
+	.dev_id = "i2c-goodix_ts",
+	.table = {
+		GPIO_LOOKUP("INT33FF:01", 53, "reset", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("INT33FF:01", 56, "irq", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+static struct gpiod_lookup_table lenovo_yb1_x90_hideep_gpios = {
+	.dev_id = "i2c-hideep_ts",
+	.table = {
+		GPIO_LOOKUP("INT33FF:00", 7, "reset", GPIO_ACTIVE_LOW),
+		{ }
+	},
+};
+
+static struct gpiod_lookup_table * const lenovo_yb1_x90_gpios[] = {
+	&lenovo_yb1_x90_hideep_gpios,
+	&lenovo_yb1_x90_goodix_gpios,
+	NULL
+};
+
+static int __init lenovo_yb1_x90_init(void)
+{
+	/* Enable the regulators used by the touchscreens */
+
+	/* Vprog3B 3.0V used by the goodix touchscreen in the keyboard half */
+	intel_soc_pmic_exec_mipi_pmic_seq_element(0x6e, 0x9b, 0x02, 0xff);
+
+	/* Vprog4D 3.0V used by the HiDeep touchscreen in the display half */
+	intel_soc_pmic_exec_mipi_pmic_seq_element(0x6e, 0x9f, 0x02, 0xff);
+
+	/* Vprog5A 1.8V used by the HiDeep touchscreen in the display half */
+	intel_soc_pmic_exec_mipi_pmic_seq_element(0x6e, 0xa0, 0x02, 0xff);
+
+	/* Vprog5B 1.8V used by the goodix touchscreen in the keyboard half */
+	intel_soc_pmic_exec_mipi_pmic_seq_element(0x6e, 0xa1, 0x02, 0xff);
+
+	return 0;
+}
+
+const struct x86_dev_info lenovo_yogabook_x90_info __initconst = {
+	.i2c_client_info = lenovo_yb1_x90_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(lenovo_yb1_x90_i2c_clients),
+	.gpiod_lookup_tables = lenovo_yb1_x90_gpios,
+	.init = lenovo_yb1_x90_init,
+};
+
 /* Lenovo Yoga Book X91F/L Windows tablet needs manual instantiation of the fg client */
 static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __initconst = {
 	{
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index c2b490519324..b6802d75dbdd 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -94,6 +94,7 @@ extern const struct x86_dev_info asus_me176c_info;
 extern const struct x86_dev_info asus_tf103c_info;
 extern const struct x86_dev_info chuwi_hi8_info;
 extern const struct x86_dev_info czc_p10t;
+extern const struct x86_dev_info lenovo_yogabook_x90_info;
 extern const struct x86_dev_info lenovo_yogabook_x91_info;
 extern const struct x86_dev_info lenovo_yoga_tab2_830_1050_info;
 extern const struct x86_dev_info lenovo_yt3_info;
-- 
2.39.1

