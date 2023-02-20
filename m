Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADFDC636D6
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Feb 2023 22:13:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232637AbjBTWNJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Feb 2023 17:13:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232507AbjBTWNI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Feb 2023 17:13:08 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B350CC01
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Feb 2023 14:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676931149;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=glzpkaHz/PdkPHM5pKSV7nhEe/mVpRFAaScWWQKx2dE=;
        b=I42PAgs9s43zcFnvKRMpbBRePVnuztWNeaoBD/XPGEFlp+D/zJpvVnzyu3NyqRgY+4TlUg
        Q2NS6QH4qVppTS5j1p7sfZ5+l5kt+zz0kH3paWJ+DrGcD3R5WsbUS8nPNujb3+br9azel8
        pBbY1vD/A9vdiE2Y7mzAGZwZ7ss5MIg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-HGiLMPsQPI-wqBlRzCMKkw-1; Mon, 20 Feb 2023 17:12:26 -0500
X-MC-Unique: HGiLMPsQPI-wqBlRzCMKkw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C54A529AA2D3;
        Mon, 20 Feb 2023 22:12:25 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.43])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 12A1A140EBF6;
        Mon, 20 Feb 2023 22:12:24 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 5/9] platform/x86: x86-android-tablets: Move Asus tablets to their own file
Date:   Mon, 20 Feb 2023 23:12:08 +0100
Message-Id: <20230220221212.196009-6-hdegoede@redhat.com>
In-Reply-To: <20230220221212.196009-1-hdegoede@redhat.com>
References: <20230220221212.196009-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Move the info for the Asus tablets to their own asus.c file.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/Makefile |   2 +-
 .../platform/x86/x86-android-tablets/asus.c   | 355 ++++++++++++++++++
 .../x86-android-tablets-main.c                | 340 -----------------
 3 files changed, 356 insertions(+), 341 deletions(-)
 create mode 100644 drivers/platform/x86/x86-android-tablets/asus.c

diff --git a/drivers/platform/x86/x86-android-tablets/Makefile b/drivers/platform/x86/x86-android-tablets/Makefile
index 6383a1b26481..a527f0a94034 100644
--- a/drivers/platform/x86/x86-android-tablets/Makefile
+++ b/drivers/platform/x86/x86-android-tablets/Makefile
@@ -5,4 +5,4 @@
 
 obj-$(CONFIG_X86_ANDROID_TABLETS) += x86-android-tablets.o
 
-x86-android-tablets-y := core.o dmi.o shared-psy-info.o x86-android-tablets-main.o
+x86-android-tablets-y := core.o dmi.o shared-psy-info.o asus.o x86-android-tablets-main.o
diff --git a/drivers/platform/x86/x86-android-tablets/asus.c b/drivers/platform/x86/x86-android-tablets/asus.c
new file mode 100644
index 000000000000..c7d3ca73ebd3
--- /dev/null
+++ b/drivers/platform/x86/x86-android-tablets/asus.c
@@ -0,0 +1,355 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Board info for Asus X86 tablets which ship with Android as the factory image
+ * and which have broken DSDT tables. The factory kernels shipped on these
+ * devices typically have a bunch of things hardcoded, rather than specified
+ * in their DSDT.
+ *
+ * Copyright (C) 2021-2023 Hans de Goede <hdegoede@redhat.com>
+ */
+
+#include <linux/gpio_keys.h>
+#include <linux/input.h>
+
+#include "shared-psy-info.h"
+#include "x86-android-tablets.h"
+
+/* Asus ME176C and TF103C tablets shared data */
+static struct gpiod_lookup_table int3496_gpo2_pin22_gpios = {
+	.dev_id = "intel-int3496",
+	.table = {
+		GPIO_LOOKUP("INT33FC:02", 22, "id", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+static struct gpio_keys_button asus_me176c_tf103c_lid = {
+	.code = SW_LID,
+	/* .gpio gets filled in by asus_me176c_tf103c_init() */
+	.active_low = true,
+	.desc = "lid_sw",
+	.type = EV_SW,
+	.wakeup = true,
+	.debounce_interval = 50,
+};
+
+static const struct gpio_keys_platform_data asus_me176c_tf103c_lid_pdata __initconst = {
+	.buttons = &asus_me176c_tf103c_lid,
+	.nbuttons = 1,
+	.name = "lid_sw",
+};
+
+static const struct platform_device_info asus_me176c_tf103c_pdevs[] __initconst = {
+	{
+		.name = "gpio-keys",
+		.id = PLATFORM_DEVID_AUTO,
+		.data = &asus_me176c_tf103c_lid_pdata,
+		.size_data = sizeof(asus_me176c_tf103c_lid_pdata),
+	},
+	{
+		/* For micro USB ID pin handling */
+		.name = "intel-int3496",
+		.id = PLATFORM_DEVID_NONE,
+	},
+};
+
+static int __init asus_me176c_tf103c_init(void)
+{
+	struct gpio_desc *gpiod;
+	int ret;
+
+	ret = x86_android_tablet_get_gpiod("INT33FC:02", 12, &gpiod);
+	if (ret < 0)
+		return ret;
+	asus_me176c_tf103c_lid.gpio = desc_to_gpio(gpiod);
+
+	return 0;
+}
+
+
+/* Asus ME176C tablets have an Android factory img with everything hardcoded */
+static const char * const asus_me176c_accel_mount_matrix[] = {
+	"-1", "0", "0",
+	"0", "1", "0",
+	"0", "0", "1"
+};
+
+static const struct property_entry asus_me176c_accel_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("mount-matrix", asus_me176c_accel_mount_matrix),
+	{ }
+};
+
+static const struct software_node asus_me176c_accel_node = {
+	.properties = asus_me176c_accel_props,
+};
+
+static const struct property_entry asus_me176c_bq24190_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", tusb1211_chg_det_psy, 1),
+	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_hv_4v35_battery_node),
+	PROPERTY_ENTRY_U32("ti,system-minimum-microvolt", 3600000),
+	PROPERTY_ENTRY_BOOL("omit-battery-class"),
+	PROPERTY_ENTRY_BOOL("disable-reset"),
+	{ }
+};
+
+static const struct software_node asus_me176c_bq24190_node = {
+	.properties = asus_me176c_bq24190_props,
+};
+
+static const struct property_entry asus_me176c_ug3105_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", bq24190_psy, 1),
+	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_hv_4v35_battery_node),
+	PROPERTY_ENTRY_U32("upisemi,rsns-microohm", 10000),
+	{ }
+};
+
+static const struct software_node asus_me176c_ug3105_node = {
+	.properties = asus_me176c_ug3105_props,
+};
+
+static const struct x86_i2c_client_info asus_me176c_i2c_clients[] __initconst = {
+	{
+		/* bq24297 battery charger */
+		.board_info = {
+			.type = "bq24190",
+			.addr = 0x6b,
+			.dev_name = "bq24297",
+			.swnode = &asus_me176c_bq24190_node,
+			.platform_data = &bq24190_pdata,
+		},
+		.adapter_path = "\\_SB_.I2C1",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_PMIC,
+			.chip = "\\_SB_.I2C7.PMIC",
+			.domain = DOMAIN_BUS_WAKEUP,
+			.index = 0,
+		},
+	}, {
+		/* ug3105 battery monitor */
+		.board_info = {
+			.type = "ug3105",
+			.addr = 0x70,
+			.dev_name = "ug3105",
+			.swnode = &asus_me176c_ug3105_node,
+		},
+		.adapter_path = "\\_SB_.I2C1",
+	}, {
+		/* ak09911 compass */
+		.board_info = {
+			.type = "ak09911",
+			.addr = 0x0c,
+			.dev_name = "ak09911",
+		},
+		.adapter_path = "\\_SB_.I2C5",
+	}, {
+		/* kxtj21009 accel */
+		.board_info = {
+			.type = "kxtj21009",
+			.addr = 0x0f,
+			.dev_name = "kxtj21009",
+			.swnode = &asus_me176c_accel_node,
+		},
+		.adapter_path = "\\_SB_.I2C5",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_APIC,
+			.index = 0x44,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+		},
+	}, {
+		/* goodix touchscreen */
+		.board_info = {
+			.type = "GDIX1001:00",
+			.addr = 0x14,
+			.dev_name = "goodix_ts",
+		},
+		.adapter_path = "\\_SB_.I2C6",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_APIC,
+			.index = 0x45,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+		},
+	},
+};
+
+static const struct x86_serdev_info asus_me176c_serdevs[] __initconst = {
+	{
+		.ctrl_hid = "80860F0A",
+		.ctrl_uid = "2",
+		.ctrl_devname = "serial0",
+		.serdev_hid = "BCM2E3A",
+	},
+};
+
+static struct gpiod_lookup_table asus_me176c_goodix_gpios = {
+	.dev_id = "i2c-goodix_ts",
+	.table = {
+		GPIO_LOOKUP("INT33FC:00", 60, "reset", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("INT33FC:02", 28, "irq", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+static struct gpiod_lookup_table * const asus_me176c_gpios[] = {
+	&int3496_gpo2_pin22_gpios,
+	&asus_me176c_goodix_gpios,
+	NULL
+};
+
+const struct x86_dev_info asus_me176c_info __initconst = {
+	.i2c_client_info = asus_me176c_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(asus_me176c_i2c_clients),
+	.pdev_info = asus_me176c_tf103c_pdevs,
+	.pdev_count = ARRAY_SIZE(asus_me176c_tf103c_pdevs),
+	.serdev_info = asus_me176c_serdevs,
+	.serdev_count = ARRAY_SIZE(asus_me176c_serdevs),
+	.gpiod_lookup_tables = asus_me176c_gpios,
+	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
+	.modules = bq24190_modules,
+	.invalid_aei_gpiochip = "INT33FC:02",
+	.init = asus_me176c_tf103c_init,
+};
+
+/* Asus TF103C tablets have an Android factory img with everything hardcoded */
+static const char * const asus_tf103c_accel_mount_matrix[] = {
+	"0", "-1", "0",
+	"-1", "0", "0",
+	"0", "0", "1"
+};
+
+static const struct property_entry asus_tf103c_accel_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("mount-matrix", asus_tf103c_accel_mount_matrix),
+	{ }
+};
+
+static const struct software_node asus_tf103c_accel_node = {
+	.properties = asus_tf103c_accel_props,
+};
+
+static const struct property_entry asus_tf103c_touchscreen_props[] = {
+	PROPERTY_ENTRY_STRING("compatible", "atmel,atmel_mxt_ts"),
+	{ }
+};
+
+static const struct software_node asus_tf103c_touchscreen_node = {
+	.properties = asus_tf103c_touchscreen_props,
+};
+
+static const struct property_entry asus_tf103c_battery_props[] = {
+	PROPERTY_ENTRY_STRING("compatible", "simple-battery"),
+	PROPERTY_ENTRY_STRING("device-chemistry", "lithium-ion-polymer"),
+	PROPERTY_ENTRY_U32("precharge-current-microamp", 256000),
+	PROPERTY_ENTRY_U32("charge-term-current-microamp", 128000),
+	PROPERTY_ENTRY_U32("constant-charge-current-max-microamp", 2048000),
+	PROPERTY_ENTRY_U32("constant-charge-voltage-max-microvolt", 4208000),
+	PROPERTY_ENTRY_U32("factory-internal-resistance-micro-ohms", 150000),
+	{ }
+};
+
+static const struct software_node asus_tf103c_battery_node = {
+	.properties = asus_tf103c_battery_props,
+};
+
+static const struct property_entry asus_tf103c_bq24190_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", tusb1211_chg_det_psy, 1),
+	PROPERTY_ENTRY_REF("monitored-battery", &asus_tf103c_battery_node),
+	PROPERTY_ENTRY_U32("ti,system-minimum-microvolt", 3600000),
+	PROPERTY_ENTRY_BOOL("omit-battery-class"),
+	PROPERTY_ENTRY_BOOL("disable-reset"),
+	{ }
+};
+
+static const struct software_node asus_tf103c_bq24190_node = {
+	.properties = asus_tf103c_bq24190_props,
+};
+
+static const struct property_entry asus_tf103c_ug3105_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", bq24190_psy, 1),
+	PROPERTY_ENTRY_REF("monitored-battery", &asus_tf103c_battery_node),
+	PROPERTY_ENTRY_U32("upisemi,rsns-microohm", 5000),
+	{ }
+};
+
+static const struct software_node asus_tf103c_ug3105_node = {
+	.properties = asus_tf103c_ug3105_props,
+};
+
+static const struct x86_i2c_client_info asus_tf103c_i2c_clients[] __initconst = {
+	{
+		/* bq24297 battery charger */
+		.board_info = {
+			.type = "bq24190",
+			.addr = 0x6b,
+			.dev_name = "bq24297",
+			.swnode = &asus_tf103c_bq24190_node,
+			.platform_data = &bq24190_pdata,
+		},
+		.adapter_path = "\\_SB_.I2C1",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_PMIC,
+			.chip = "\\_SB_.I2C7.PMIC",
+			.domain = DOMAIN_BUS_WAKEUP,
+			.index = 0,
+		},
+	}, {
+		/* ug3105 battery monitor */
+		.board_info = {
+			.type = "ug3105",
+			.addr = 0x70,
+			.dev_name = "ug3105",
+			.swnode = &asus_tf103c_ug3105_node,
+		},
+		.adapter_path = "\\_SB_.I2C1",
+	}, {
+		/* ak09911 compass */
+		.board_info = {
+			.type = "ak09911",
+			.addr = 0x0c,
+			.dev_name = "ak09911",
+		},
+		.adapter_path = "\\_SB_.I2C5",
+	}, {
+		/* kxtj21009 accel */
+		.board_info = {
+			.type = "kxtj21009",
+			.addr = 0x0f,
+			.dev_name = "kxtj21009",
+			.swnode = &asus_tf103c_accel_node,
+		},
+		.adapter_path = "\\_SB_.I2C5",
+	}, {
+		/* atmel touchscreen */
+		.board_info = {
+			.type = "atmel_mxt_ts",
+			.addr = 0x4a,
+			.dev_name = "atmel_mxt_ts",
+			.swnode = &asus_tf103c_touchscreen_node,
+		},
+		.adapter_path = "\\_SB_.I2C6",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FC:02",
+			.index = 28,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+		},
+	},
+};
+
+static struct gpiod_lookup_table * const asus_tf103c_gpios[] = {
+	&int3496_gpo2_pin22_gpios,
+	NULL
+};
+
+const struct x86_dev_info asus_tf103c_info __initconst = {
+	.i2c_client_info = asus_tf103c_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(asus_tf103c_i2c_clients),
+	.pdev_info = asus_me176c_tf103c_pdevs,
+	.pdev_count = ARRAY_SIZE(asus_me176c_tf103c_pdevs),
+	.gpiod_lookup_tables = asus_tf103c_gpios,
+	.bat_swnode = &asus_tf103c_battery_node,
+	.modules = bq24190_modules,
+	.invalid_aei_gpiochip = "INT33FC:02",
+	.init = asus_me176c_tf103c_init,
+};
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c b/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
index ebe3cdeeb33a..27b4fe94250f 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
@@ -24,14 +24,6 @@
 #include "shared-psy-info.h"
 #include "x86-android-tablets.h"
 
-static struct gpiod_lookup_table int3496_gpo2_pin22_gpios = {
-	.dev_id = "intel-int3496",
-	.table = {
-		GPIO_LOOKUP("INT33FC:02", 22, "id", GPIO_ACTIVE_HIGH),
-		{ }
-	},
-};
-
 /* Acer Iconia One 7 B1-750 has an Android factory img with everything hardcoded */
 static const char * const acer_b1_750_mount_matrix[] = {
 	"-1", "0", "0",
@@ -154,338 +146,6 @@ const struct x86_dev_info advantech_mica_071_info __initconst = {
 	.init = advantech_mica_071_init,
 };
 
-/* Asus ME176C and TF103C tablets shared data */
-static struct gpio_keys_button asus_me176c_tf103c_lid = {
-	.code = SW_LID,
-	/* .gpio gets filled in by asus_me176c_tf103c_init() */
-	.active_low = true,
-	.desc = "lid_sw",
-	.type = EV_SW,
-	.wakeup = true,
-	.debounce_interval = 50,
-};
-
-static const struct gpio_keys_platform_data asus_me176c_tf103c_lid_pdata __initconst = {
-	.buttons = &asus_me176c_tf103c_lid,
-	.nbuttons = 1,
-	.name = "lid_sw",
-};
-
-static const struct platform_device_info asus_me176c_tf103c_pdevs[] __initconst = {
-	{
-		.name = "gpio-keys",
-		.id = PLATFORM_DEVID_AUTO,
-		.data = &asus_me176c_tf103c_lid_pdata,
-		.size_data = sizeof(asus_me176c_tf103c_lid_pdata),
-	},
-	{
-		/* For micro USB ID pin handling */
-		.name = "intel-int3496",
-		.id = PLATFORM_DEVID_NONE,
-	},
-};
-
-static int __init asus_me176c_tf103c_init(void)
-{
-	struct gpio_desc *gpiod;
-	int ret;
-
-	ret = x86_android_tablet_get_gpiod("INT33FC:02", 12, &gpiod);
-	if (ret < 0)
-		return ret;
-	asus_me176c_tf103c_lid.gpio = desc_to_gpio(gpiod);
-
-	return 0;
-}
-
-
-/* Asus ME176C tablets have an Android factory img with everything hardcoded */
-static const char * const asus_me176c_accel_mount_matrix[] = {
-	"-1", "0", "0",
-	"0", "1", "0",
-	"0", "0", "1"
-};
-
-static const struct property_entry asus_me176c_accel_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY("mount-matrix", asus_me176c_accel_mount_matrix),
-	{ }
-};
-
-static const struct software_node asus_me176c_accel_node = {
-	.properties = asus_me176c_accel_props,
-};
-
-static const struct property_entry asus_me176c_bq24190_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", tusb1211_chg_det_psy, 1),
-	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_hv_4v35_battery_node),
-	PROPERTY_ENTRY_U32("ti,system-minimum-microvolt", 3600000),
-	PROPERTY_ENTRY_BOOL("omit-battery-class"),
-	PROPERTY_ENTRY_BOOL("disable-reset"),
-	{ }
-};
-
-static const struct software_node asus_me176c_bq24190_node = {
-	.properties = asus_me176c_bq24190_props,
-};
-
-static const struct property_entry asus_me176c_ug3105_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", bq24190_psy, 1),
-	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_hv_4v35_battery_node),
-	PROPERTY_ENTRY_U32("upisemi,rsns-microohm", 10000),
-	{ }
-};
-
-static const struct software_node asus_me176c_ug3105_node = {
-	.properties = asus_me176c_ug3105_props,
-};
-
-static const struct x86_i2c_client_info asus_me176c_i2c_clients[] __initconst = {
-	{
-		/* bq24297 battery charger */
-		.board_info = {
-			.type = "bq24190",
-			.addr = 0x6b,
-			.dev_name = "bq24297",
-			.swnode = &asus_me176c_bq24190_node,
-			.platform_data = &bq24190_pdata,
-		},
-		.adapter_path = "\\_SB_.I2C1",
-		.irq_data = {
-			.type = X86_ACPI_IRQ_TYPE_PMIC,
-			.chip = "\\_SB_.I2C7.PMIC",
-			.domain = DOMAIN_BUS_WAKEUP,
-			.index = 0,
-		},
-	}, {
-		/* ug3105 battery monitor */
-		.board_info = {
-			.type = "ug3105",
-			.addr = 0x70,
-			.dev_name = "ug3105",
-			.swnode = &asus_me176c_ug3105_node,
-		},
-		.adapter_path = "\\_SB_.I2C1",
-	}, {
-		/* ak09911 compass */
-		.board_info = {
-			.type = "ak09911",
-			.addr = 0x0c,
-			.dev_name = "ak09911",
-		},
-		.adapter_path = "\\_SB_.I2C5",
-	}, {
-		/* kxtj21009 accel */
-		.board_info = {
-			.type = "kxtj21009",
-			.addr = 0x0f,
-			.dev_name = "kxtj21009",
-			.swnode = &asus_me176c_accel_node,
-		},
-		.adapter_path = "\\_SB_.I2C5",
-		.irq_data = {
-			.type = X86_ACPI_IRQ_TYPE_APIC,
-			.index = 0x44,
-			.trigger = ACPI_EDGE_SENSITIVE,
-			.polarity = ACPI_ACTIVE_LOW,
-		},
-	}, {
-		/* goodix touchscreen */
-		.board_info = {
-			.type = "GDIX1001:00",
-			.addr = 0x14,
-			.dev_name = "goodix_ts",
-		},
-		.adapter_path = "\\_SB_.I2C6",
-		.irq_data = {
-			.type = X86_ACPI_IRQ_TYPE_APIC,
-			.index = 0x45,
-			.trigger = ACPI_EDGE_SENSITIVE,
-			.polarity = ACPI_ACTIVE_LOW,
-		},
-	},
-};
-
-static const struct x86_serdev_info asus_me176c_serdevs[] __initconst = {
-	{
-		.ctrl_hid = "80860F0A",
-		.ctrl_uid = "2",
-		.ctrl_devname = "serial0",
-		.serdev_hid = "BCM2E3A",
-	},
-};
-
-static struct gpiod_lookup_table asus_me176c_goodix_gpios = {
-	.dev_id = "i2c-goodix_ts",
-	.table = {
-		GPIO_LOOKUP("INT33FC:00", 60, "reset", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("INT33FC:02", 28, "irq", GPIO_ACTIVE_HIGH),
-		{ }
-	},
-};
-
-static struct gpiod_lookup_table * const asus_me176c_gpios[] = {
-	&int3496_gpo2_pin22_gpios,
-	&asus_me176c_goodix_gpios,
-	NULL
-};
-
-const struct x86_dev_info asus_me176c_info __initconst = {
-	.i2c_client_info = asus_me176c_i2c_clients,
-	.i2c_client_count = ARRAY_SIZE(asus_me176c_i2c_clients),
-	.pdev_info = asus_me176c_tf103c_pdevs,
-	.pdev_count = ARRAY_SIZE(asus_me176c_tf103c_pdevs),
-	.serdev_info = asus_me176c_serdevs,
-	.serdev_count = ARRAY_SIZE(asus_me176c_serdevs),
-	.gpiod_lookup_tables = asus_me176c_gpios,
-	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
-	.modules = bq24190_modules,
-	.invalid_aei_gpiochip = "INT33FC:02",
-	.init = asus_me176c_tf103c_init,
-};
-
-/* Asus TF103C tablets have an Android factory img with everything hardcoded */
-static const char * const asus_tf103c_accel_mount_matrix[] = {
-	"0", "-1", "0",
-	"-1", "0", "0",
-	"0", "0", "1"
-};
-
-static const struct property_entry asus_tf103c_accel_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY("mount-matrix", asus_tf103c_accel_mount_matrix),
-	{ }
-};
-
-static const struct software_node asus_tf103c_accel_node = {
-	.properties = asus_tf103c_accel_props,
-};
-
-static const struct property_entry asus_tf103c_touchscreen_props[] = {
-	PROPERTY_ENTRY_STRING("compatible", "atmel,atmel_mxt_ts"),
-	{ }
-};
-
-static const struct software_node asus_tf103c_touchscreen_node = {
-	.properties = asus_tf103c_touchscreen_props,
-};
-
-static const struct property_entry asus_tf103c_battery_props[] = {
-	PROPERTY_ENTRY_STRING("compatible", "simple-battery"),
-	PROPERTY_ENTRY_STRING("device-chemistry", "lithium-ion-polymer"),
-	PROPERTY_ENTRY_U32("precharge-current-microamp", 256000),
-	PROPERTY_ENTRY_U32("charge-term-current-microamp", 128000),
-	PROPERTY_ENTRY_U32("constant-charge-current-max-microamp", 2048000),
-	PROPERTY_ENTRY_U32("constant-charge-voltage-max-microvolt", 4208000),
-	PROPERTY_ENTRY_U32("factory-internal-resistance-micro-ohms", 150000),
-	{ }
-};
-
-static const struct software_node asus_tf103c_battery_node = {
-	.properties = asus_tf103c_battery_props,
-};
-
-static const struct property_entry asus_tf103c_bq24190_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", tusb1211_chg_det_psy, 1),
-	PROPERTY_ENTRY_REF("monitored-battery", &asus_tf103c_battery_node),
-	PROPERTY_ENTRY_U32("ti,system-minimum-microvolt", 3600000),
-	PROPERTY_ENTRY_BOOL("omit-battery-class"),
-	PROPERTY_ENTRY_BOOL("disable-reset"),
-	{ }
-};
-
-static const struct software_node asus_tf103c_bq24190_node = {
-	.properties = asus_tf103c_bq24190_props,
-};
-
-static const struct property_entry asus_tf103c_ug3105_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", bq24190_psy, 1),
-	PROPERTY_ENTRY_REF("monitored-battery", &asus_tf103c_battery_node),
-	PROPERTY_ENTRY_U32("upisemi,rsns-microohm", 5000),
-	{ }
-};
-
-static const struct software_node asus_tf103c_ug3105_node = {
-	.properties = asus_tf103c_ug3105_props,
-};
-
-static const struct x86_i2c_client_info asus_tf103c_i2c_clients[] __initconst = {
-	{
-		/* bq24297 battery charger */
-		.board_info = {
-			.type = "bq24190",
-			.addr = 0x6b,
-			.dev_name = "bq24297",
-			.swnode = &asus_tf103c_bq24190_node,
-			.platform_data = &bq24190_pdata,
-		},
-		.adapter_path = "\\_SB_.I2C1",
-		.irq_data = {
-			.type = X86_ACPI_IRQ_TYPE_PMIC,
-			.chip = "\\_SB_.I2C7.PMIC",
-			.domain = DOMAIN_BUS_WAKEUP,
-			.index = 0,
-		},
-	}, {
-		/* ug3105 battery monitor */
-		.board_info = {
-			.type = "ug3105",
-			.addr = 0x70,
-			.dev_name = "ug3105",
-			.swnode = &asus_tf103c_ug3105_node,
-		},
-		.adapter_path = "\\_SB_.I2C1",
-	}, {
-		/* ak09911 compass */
-		.board_info = {
-			.type = "ak09911",
-			.addr = 0x0c,
-			.dev_name = "ak09911",
-		},
-		.adapter_path = "\\_SB_.I2C5",
-	}, {
-		/* kxtj21009 accel */
-		.board_info = {
-			.type = "kxtj21009",
-			.addr = 0x0f,
-			.dev_name = "kxtj21009",
-			.swnode = &asus_tf103c_accel_node,
-		},
-		.adapter_path = "\\_SB_.I2C5",
-	}, {
-		/* atmel touchscreen */
-		.board_info = {
-			.type = "atmel_mxt_ts",
-			.addr = 0x4a,
-			.dev_name = "atmel_mxt_ts",
-			.swnode = &asus_tf103c_touchscreen_node,
-		},
-		.adapter_path = "\\_SB_.I2C6",
-		.irq_data = {
-			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
-			.chip = "INT33FC:02",
-			.index = 28,
-			.trigger = ACPI_EDGE_SENSITIVE,
-			.polarity = ACPI_ACTIVE_LOW,
-		},
-	},
-};
-
-static struct gpiod_lookup_table * const asus_tf103c_gpios[] = {
-	&int3496_gpo2_pin22_gpios,
-	NULL
-};
-
-const struct x86_dev_info asus_tf103c_info __initconst = {
-	.i2c_client_info = asus_tf103c_i2c_clients,
-	.i2c_client_count = ARRAY_SIZE(asus_tf103c_i2c_clients),
-	.pdev_info = asus_me176c_tf103c_pdevs,
-	.pdev_count = ARRAY_SIZE(asus_me176c_tf103c_pdevs),
-	.gpiod_lookup_tables = asus_tf103c_gpios,
-	.bat_swnode = &asus_tf103c_battery_node,
-	.modules = bq24190_modules,
-	.invalid_aei_gpiochip = "INT33FC:02",
-	.init = asus_me176c_tf103c_init,
-};
-
 /*
  * When booted with the BIOS set to Android mode the Chuwi Hi8 (CWI509) DSDT
  * contains a whole bunch of bogus ACPI I2C devices and is missing entries
-- 
2.39.1

