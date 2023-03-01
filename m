Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F14C7EE37
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 09:26:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjCAJZm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 04:25:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjCAJZM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 04:25:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F4733478
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 01:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677662627;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T3tA1Oqi7SdstTN5Ghe1SCM/O1ZHoIUlNUZTFIPO+uk=;
        b=NA+Ya/mWbTrkdekAHjJbUBT7f/4mWM56USHlZSz07uukJxcQZ9ua6YSs1cg7YHtZxKQPkO
        cZ5f4AGu7r8kvV3XWIL+hw0dKpPTwxzjMI8hXfp8IhvwbwYu8RajA6iieUsahrB/SNvjWY
        zC/dBxGmMdtxmlqberU8S31PPkORv6g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-HH13-W7CPP6p8tXTfRuJfw-1; Wed, 01 Mar 2023 04:23:44 -0500
X-MC-Unique: HH13-W7CPP6p8tXTfRuJfw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C22FD1C068C0;
        Wed,  1 Mar 2023 09:23:43 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.30])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 053AC40B40DF;
        Wed,  1 Mar 2023 09:23:42 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 06/14] platform/x86: x86-android-tablets: Move Asus tablets to their own file
Date:   Wed,  1 Mar 2023 10:23:23 +0100
Message-Id: <20230301092331.7038-7-hdegoede@redhat.com>
In-Reply-To: <20230301092331.7038-1-hdegoede@redhat.com>
References: <20230301092331.7038-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Move the info for the Asus tablets to their own asus.c file.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Use GPL-2.0-or-later for SPDX identifier
---
 .../platform/x86/x86-android-tablets/Makefile |   2 +-
 .../platform/x86/x86-android-tablets/asus.c   | 358 ++++++++++++++++++
 .../x86-android-tablets-main.c                | 340 -----------------
 3 files changed, 359 insertions(+), 341 deletions(-)
 create mode 100644 drivers/platform/x86/x86-android-tablets/asus.c

diff --git a/drivers/platform/x86/x86-android-tablets/Makefile b/drivers/platform/x86/x86-android-tablets/Makefile
index d4e0da886790..76f94831bf97 100644
--- a/drivers/platform/x86/x86-android-tablets/Makefile
+++ b/drivers/platform/x86/x86-android-tablets/Makefile
@@ -5,4 +5,4 @@
 
 obj-$(CONFIG_X86_ANDROID_TABLETS) += x86-android-tablets.o
 
-x86-android-tablets-y := core.o dmi.o shared-psy-info.o x86-android-tablets-main.o
+x86-android-tablets-y := core.o dmi.o shared-psy-info.o asus.o x86-android-tablets-main.o
diff --git a/drivers/platform/x86/x86-android-tablets/asus.c b/drivers/platform/x86/x86-android-tablets/asus.c
new file mode 100644
index 000000000000..74c3b10e9ca7
--- /dev/null
+++ b/drivers/platform/x86/x86-android-tablets/asus.c
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
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
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
+#include <linux/input.h>
+#include <linux/platform_device.h>
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
index 225502794a89..10254db73286 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
@@ -26,14 +26,6 @@
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
@@ -156,338 +148,6 @@ const struct x86_dev_info advantech_mica_071_info __initconst = {
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

