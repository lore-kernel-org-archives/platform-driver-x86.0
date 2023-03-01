Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9F1C7EE39
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 09:26:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjCAJZn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 04:25:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjCAJZO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 04:25:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA3332E7B
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 01:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677662626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S1RSh4wCu4dbNjpP92ywYc5fEoQImXKKq60DCCvLUMA=;
        b=a/+ANsYUD8yJ6bk4v4db8BIm9TC2s5P90PqlgnGXPiuSiV0oYhDhrD+9PJQYzt0iwab89F
        9PgkZRN3K6DcVNkmmiLJGzJ4Ga4yOzErYtv1PMkUeDsX/8dOJYxHJhwdV2Rpv9pmMb/Z1x
        sUKuiH9F3cAksIRo1FV5rj96t7w2HWw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-l9eRffaUPSKmoE9y0Y_N2g-1; Wed, 01 Mar 2023 04:23:45 -0500
X-MC-Unique: l9eRffaUPSKmoE9y0Y_N2g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3FB63C0E44C;
        Wed,  1 Mar 2023 09:23:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.30])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 00A8B400D796;
        Wed,  1 Mar 2023 09:23:43 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 07/14] platform/x86: x86-android-tablets: Move Lenovo tablets to their own file
Date:   Wed,  1 Mar 2023 10:23:24 +0100
Message-Id: <20230301092331.7038-8-hdegoede@redhat.com>
In-Reply-To: <20230301092331.7038-1-hdegoede@redhat.com>
References: <20230301092331.7038-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Move the info for the Lenovo tablets to their own lenovo.c file.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Use GPL-2.0-or-later for SPDX identifier
---
 .../platform/x86/x86-android-tablets/Makefile |   3 +-
 .../platform/x86/x86-android-tablets/lenovo.c | 419 ++++++++++++++++++
 .../x86-android-tablets-main.c                | 406 +----------------
 3 files changed, 422 insertions(+), 406 deletions(-)
 create mode 100644 drivers/platform/x86/x86-android-tablets/lenovo.c

diff --git a/drivers/platform/x86/x86-android-tablets/Makefile b/drivers/platform/x86/x86-android-tablets/Makefile
index 76f94831bf97..d881a824fa3d 100644
--- a/drivers/platform/x86/x86-android-tablets/Makefile
+++ b/drivers/platform/x86/x86-android-tablets/Makefile
@@ -5,4 +5,5 @@
 
 obj-$(CONFIG_X86_ANDROID_TABLETS) += x86-android-tablets.o
 
-x86-android-tablets-y := core.o dmi.o shared-psy-info.o asus.o x86-android-tablets-main.o
+x86-android-tablets-y := core.o dmi.o shared-psy-info.o \
+			 asus.o lenovo.o x86-android-tablets-main.o
diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
new file mode 100644
index 000000000000..290de07d8aa0
--- /dev/null
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -0,0 +1,419 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Board info for Lenovo X86 tablets which ship with Android as the factory image
+ * and which have broken DSDT tables. The factory kernels shipped on these
+ * devices typically have a bunch of things hardcoded, rather than specified
+ * in their DSDT.
+ *
+ * Copyright (C) 2021-2023 Hans de Goede <hdegoede@redhat.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/efi.h>
+#include <linux/gpio/machine.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/machine.h>
+#include <linux/platform_data/lp855x.h>
+#include <linux/platform_device.h>
+#include <linux/reboot.h>
+#include <linux/rmi.h>
+#include <linux/spi/spi.h>
+
+#include "shared-psy-info.h"
+#include "x86-android-tablets.h"
+
+/* Lenovo Yoga Book X90F / X91F / X91L need manual instantiation of the fg client */
+static const struct x86_i2c_client_info lenovo_yogabook_x9x_i2c_clients[] __initconst = {
+	{
+		/* BQ27542 fuel-gauge */
+		.board_info = {
+			.type = "bq27542",
+			.addr = 0x55,
+			.dev_name = "bq27542",
+			.swnode = &fg_bq25890_supply_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C1",
+	},
+};
+
+const struct x86_dev_info lenovo_yogabook_x9x_info __initconst = {
+	.i2c_client_info = lenovo_yogabook_x9x_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(lenovo_yogabook_x9x_i2c_clients),
+};
+
+/* Lenovo Yoga Tablet 2 1050F/L's Android factory img has everything hardcoded */
+static const struct property_entry lenovo_yoga_tab2_830_1050_bq24190_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", tusb1211_chg_det_psy, 1),
+	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_hv_4v35_battery_node),
+	PROPERTY_ENTRY_BOOL("omit-battery-class"),
+	PROPERTY_ENTRY_BOOL("disable-reset"),
+	{ }
+};
+
+static const struct software_node lenovo_yoga_tab2_830_1050_bq24190_node = {
+	.properties = lenovo_yoga_tab2_830_1050_bq24190_props,
+};
+
+/* This gets filled by lenovo_yoga_tab2_830_1050_init() */
+static struct rmi_device_platform_data lenovo_yoga_tab2_830_1050_rmi_pdata = { };
+
+static struct lp855x_platform_data lenovo_yoga_tab2_830_1050_lp8557_pdata = {
+	.device_control = 0x86,
+	.initial_brightness = 128,
+};
+
+static const struct x86_i2c_client_info lenovo_yoga_tab2_830_1050_i2c_clients[] __initconst = {
+	{
+		/* bq24292i battery charger */
+		.board_info = {
+			.type = "bq24190",
+			.addr = 0x6b,
+			.dev_name = "bq24292i",
+			.swnode = &lenovo_yoga_tab2_830_1050_bq24190_node,
+			.platform_data = &bq24190_pdata,
+		},
+		.adapter_path = "\\_SB_.I2C1",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FC:02",
+			.index = 2,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_HIGH,
+		},
+	}, {
+		/* BQ27541 fuel-gauge */
+		.board_info = {
+			.type = "bq27541",
+			.addr = 0x55,
+			.dev_name = "bq27541",
+			.swnode = &fg_bq24190_supply_node,
+		},
+		.adapter_path = "\\_SB_.I2C1",
+	}, {
+		/* Synaptics RMI touchscreen */
+		.board_info = {
+			.type = "rmi4_i2c",
+			.addr = 0x38,
+			.dev_name = "rmi4_i2c",
+			.platform_data = &lenovo_yoga_tab2_830_1050_rmi_pdata,
+		},
+		.adapter_path = "\\_SB_.I2C6",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_APIC,
+			.index = 0x45,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_HIGH,
+		},
+	}, {
+		/* LP8557 Backlight controller */
+		.board_info = {
+			.type = "lp8557",
+			.addr = 0x2c,
+			.dev_name = "lp8557",
+			.platform_data = &lenovo_yoga_tab2_830_1050_lp8557_pdata,
+		},
+		.adapter_path = "\\_SB_.I2C3",
+	},
+};
+
+static struct gpiod_lookup_table lenovo_yoga_tab2_830_1050_int3496_gpios = {
+	.dev_id = "intel-int3496",
+	.table = {
+		GPIO_LOOKUP("INT33FC:02", 1, "mux", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("INT33FC:02", 24, "id", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+#define LENOVO_YOGA_TAB2_830_1050_CODEC_NAME "spi-10WM5102:00"
+
+static struct gpiod_lookup_table lenovo_yoga_tab2_830_1050_codec_gpios = {
+	.dev_id = LENOVO_YOGA_TAB2_830_1050_CODEC_NAME,
+	.table = {
+		GPIO_LOOKUP("gpio_crystalcove", 3, "reset", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("INT33FC:01", 23, "wlf,ldoena", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("arizona", 2, "wlf,spkvdd-ena", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("arizona", 4, "wlf,micd-pol", GPIO_ACTIVE_LOW),
+		{ }
+	},
+};
+
+static struct gpiod_lookup_table * const lenovo_yoga_tab2_830_1050_gpios[] = {
+	&lenovo_yoga_tab2_830_1050_int3496_gpios,
+	&lenovo_yoga_tab2_830_1050_codec_gpios,
+	NULL
+};
+
+static int __init lenovo_yoga_tab2_830_1050_init(void);
+static void lenovo_yoga_tab2_830_1050_exit(void);
+
+struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initdata = {
+	.i2c_client_info = lenovo_yoga_tab2_830_1050_i2c_clients,
+	/* i2c_client_count gets set by lenovo_yoga_tab2_830_1050_init() */
+	.pdev_info = int3496_pdevs,
+	.pdev_count = 1,
+	.gpiod_lookup_tables = lenovo_yoga_tab2_830_1050_gpios,
+	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
+	.modules = bq24190_modules,
+	.init = lenovo_yoga_tab2_830_1050_init,
+	.exit = lenovo_yoga_tab2_830_1050_exit,
+};
+
+/*
+ * The Lenovo Yoga Tablet 2 830 and 1050 (8" vs 10") versions use the same
+ * mainboard, but they need some different treatment related to the display:
+ * 1. The 830 uses a portrait LCD panel with a landscape touchscreen, requiring
+ *    the touchscreen driver to adjust the touch-coords to match the LCD.
+ * 2. Both use an TI LP8557 LED backlight controller. On the 1050 the LP8557's
+ *    PWM input is connected to the PMIC's PWM output and everything works fine
+ *    with the defaults programmed into the LP8557 by the BIOS.
+ *    But on the 830 the LP8557's PWM input is connected to a PWM output coming
+ *    from the LCD panel's controller. The Android code has a hack in the i915
+ *    driver to write the non-standard DSI reg 0x9f with the desired backlight
+ *    level to set the duty-cycle of the LCD's PWM output.
+ *
+ *    To avoid having to have a similar hack in the mainline kernel the LP8557
+ *    entry in lenovo_yoga_tab2_830_1050_i2c_clients instead just programs the
+ *    LP8557 to directly set the level, ignoring the PWM input. This means that
+ *    the LP8557 i2c_client should only be instantiated on the 830.
+ */
+static int __init lenovo_yoga_tab2_830_1050_init_display(void)
+{
+	struct gpio_desc *gpiod;
+	int ret;
+
+	/* Use PMIC GPIO 10 bootstrap pin to differentiate 830 vs 1050 */
+	ret = x86_android_tablet_get_gpiod("gpio_crystalcove", 10, &gpiod);
+	if (ret)
+		return ret;
+
+	ret = gpiod_get_value_cansleep(gpiod);
+	if (ret) {
+		pr_info("detected Lenovo Yoga Tablet 2 1050F/L\n");
+		lenovo_yoga_tab2_830_1050_info.i2c_client_count =
+			ARRAY_SIZE(lenovo_yoga_tab2_830_1050_i2c_clients) - 1;
+	} else {
+		pr_info("detected Lenovo Yoga Tablet 2 830F/L\n");
+		lenovo_yoga_tab2_830_1050_rmi_pdata.sensor_pdata.axis_align.swap_axes = true;
+		lenovo_yoga_tab2_830_1050_rmi_pdata.sensor_pdata.axis_align.flip_y = true;
+		lenovo_yoga_tab2_830_1050_info.i2c_client_count =
+			ARRAY_SIZE(lenovo_yoga_tab2_830_1050_i2c_clients);
+	}
+
+	return 0;
+}
+
+/* SUS (INT33FC:02) pin 6 needs to be configured as pmu_clk for the audio codec */
+static const struct pinctrl_map lenovo_yoga_tab2_830_1050_codec_pinctrl_map =
+	PIN_MAP_MUX_GROUP(LENOVO_YOGA_TAB2_830_1050_CODEC_NAME, "codec_32khz_clk",
+			  "INT33FC:02", "pmu_clk2_grp", "pmu_clk");
+
+static struct pinctrl *lenovo_yoga_tab2_830_1050_codec_pinctrl;
+static struct sys_off_handler *lenovo_yoga_tab2_830_1050_sys_off_handler;
+
+static int __init lenovo_yoga_tab2_830_1050_init_codec(void)
+{
+	struct device *codec_dev;
+	struct pinctrl *pinctrl;
+	int ret;
+
+	codec_dev = bus_find_device_by_name(&spi_bus_type, NULL,
+					    LENOVO_YOGA_TAB2_830_1050_CODEC_NAME);
+	if (!codec_dev) {
+		pr_err("error cannot find %s device\n", LENOVO_YOGA_TAB2_830_1050_CODEC_NAME);
+		return -ENODEV;
+	}
+
+	ret = pinctrl_register_mappings(&lenovo_yoga_tab2_830_1050_codec_pinctrl_map, 1);
+	if (ret)
+		goto err_put_device;
+
+	pinctrl = pinctrl_get_select(codec_dev, "codec_32khz_clk");
+	if (IS_ERR(pinctrl)) {
+		ret = dev_err_probe(codec_dev, PTR_ERR(pinctrl), "selecting codec_32khz_clk\n");
+		goto err_unregister_mappings;
+	}
+
+	/* We're done with the codec_dev now */
+	put_device(codec_dev);
+
+	lenovo_yoga_tab2_830_1050_codec_pinctrl = pinctrl;
+	return 0;
+
+err_unregister_mappings:
+	pinctrl_unregister_mappings(&lenovo_yoga_tab2_830_1050_codec_pinctrl_map);
+err_put_device:
+	put_device(codec_dev);
+	return ret;
+}
+
+/*
+ * These tablet's DSDT does not set acpi_gbl_reduced_hardware, so acpi_power_off
+ * gets used as pm_power_off handler. This causes "poweroff" on these tablets
+ * to hang hard. Requiring pressing the powerbutton for 30 seconds *twice*
+ * followed by a normal 3 second press to recover. Avoid this by doing an EFI
+ * poweroff instead.
+ */
+static int lenovo_yoga_tab2_830_1050_power_off(struct sys_off_data *data)
+{
+	efi.reset_system(EFI_RESET_SHUTDOWN, EFI_SUCCESS, 0, NULL);
+
+	return NOTIFY_DONE;
+}
+
+static int __init lenovo_yoga_tab2_830_1050_init(void)
+{
+	int ret;
+
+	ret = lenovo_yoga_tab2_830_1050_init_display();
+	if (ret)
+		return ret;
+
+	ret = lenovo_yoga_tab2_830_1050_init_codec();
+	if (ret)
+		return ret;
+
+	/* SYS_OFF_PRIO_FIRMWARE + 1 so that it runs before acpi_power_off */
+	lenovo_yoga_tab2_830_1050_sys_off_handler =
+		register_sys_off_handler(SYS_OFF_MODE_POWER_OFF, SYS_OFF_PRIO_FIRMWARE + 1,
+					 lenovo_yoga_tab2_830_1050_power_off, NULL);
+	if (IS_ERR(lenovo_yoga_tab2_830_1050_sys_off_handler))
+		return PTR_ERR(lenovo_yoga_tab2_830_1050_sys_off_handler);
+
+	return 0;
+}
+
+static void lenovo_yoga_tab2_830_1050_exit(void)
+{
+	unregister_sys_off_handler(lenovo_yoga_tab2_830_1050_sys_off_handler);
+
+	if (lenovo_yoga_tab2_830_1050_codec_pinctrl) {
+		pinctrl_put(lenovo_yoga_tab2_830_1050_codec_pinctrl);
+		pinctrl_unregister_mappings(&lenovo_yoga_tab2_830_1050_codec_pinctrl_map);
+	}
+}
+
+/* Lenovo Yoga Tab 3 Pro YT3-X90F */
+
+/*
+ * There are 2 batteries, with 2 bq27500 fuel-gauges and 2 bq25892 chargers,
+ * "bq25890-charger-1" is instantiated from: drivers/i2c/busses/i2c-cht-wc.c.
+ */
+static const char * const lenovo_yt3_bq25892_0_suppliers[] = { "cht_wcove_pwrsrc" };
+static const char * const bq25890_1_psy[] = { "bq25890-charger-1" };
+
+static const struct property_entry fg_bq25890_1_supply_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq25890_1_psy),
+	{ }
+};
+
+static const struct software_node fg_bq25890_1_supply_node = {
+	.properties = fg_bq25890_1_supply_props,
+};
+
+/* bq25892 charger settings for the flat lipo battery behind the screen */
+static const struct property_entry lenovo_yt3_bq25892_0_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", lenovo_yt3_bq25892_0_suppliers),
+	PROPERTY_ENTRY_STRING("linux,power-supply-name", "bq25892-second-chrg"),
+	PROPERTY_ENTRY_U32("linux,iinlim-percentage", 40),
+	PROPERTY_ENTRY_BOOL("linux,skip-reset"),
+	/* Values taken from Android Factory Image */
+	PROPERTY_ENTRY_U32("ti,charge-current", 2048000),
+	PROPERTY_ENTRY_U32("ti,battery-regulation-voltage", 4352000),
+	PROPERTY_ENTRY_U32("ti,termination-current", 128000),
+	PROPERTY_ENTRY_U32("ti,precharge-current", 128000),
+	PROPERTY_ENTRY_U32("ti,minimum-sys-voltage", 3700000),
+	PROPERTY_ENTRY_U32("ti,boost-voltage", 4998000),
+	PROPERTY_ENTRY_U32("ti,boost-max-current", 500000),
+	PROPERTY_ENTRY_BOOL("ti,use-ilim-pin"),
+	{ }
+};
+
+static const struct software_node lenovo_yt3_bq25892_0_node = {
+	.properties = lenovo_yt3_bq25892_0_props,
+};
+
+static const struct x86_i2c_client_info lenovo_yt3_i2c_clients[] __initconst = {
+	{
+		/* bq27500 fuel-gauge for the flat lipo battery behind the screen */
+		.board_info = {
+			.type = "bq27500",
+			.addr = 0x55,
+			.dev_name = "bq27500_0",
+			.swnode = &fg_bq25890_supply_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C1",
+	}, {
+		/* bq25892 charger for the flat lipo battery behind the screen */
+		.board_info = {
+			.type = "bq25892",
+			.addr = 0x6b,
+			.dev_name = "bq25892_0",
+			.swnode = &lenovo_yt3_bq25892_0_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C1",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FF:01",
+			.index = 5,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+		},
+	}, {
+		/* bq27500 fuel-gauge for the round li-ion cells in the hinge */
+		.board_info = {
+			.type = "bq27500",
+			.addr = 0x55,
+			.dev_name = "bq27500_1",
+			.swnode = &fg_bq25890_1_supply_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C2",
+	}
+};
+
+static int __init lenovo_yt3_init(void)
+{
+	struct gpio_desc *gpiod;
+	int ret;
+
+	/*
+	 * The "bq25892_0" charger IC has its /CE (Charge-Enable) and OTG pins
+	 * connected to GPIOs, rather then having them hardwired to the correct
+	 * values as is normally done.
+	 *
+	 * The bq25890_charger driver controls these through I2C, but this only
+	 * works if not overridden by the pins. Set these pins here:
+	 * 1. Set /CE to 0 to allow charging.
+	 * 2. Set OTG to 0 disable V5 boost output since the 5V boost output of
+	 *    the main "bq25892_1" charger is used when necessary.
+	 */
+
+	/* /CE pin */
+	ret = x86_android_tablet_get_gpiod("INT33FF:02", 22, &gpiod);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * The gpio_desc returned by x86_android_tablet_get_gpiod() is a "raw"
+	 * gpio_desc, that is there is no way to pass lookup-flags like
+	 * GPIO_ACTIVE_LOW. Set the GPIO to 0 here to enable charging since
+	 * the /CE pin is active-low, but not marked as such in the gpio_desc.
+	 */
+	gpiod_set_value(gpiod, 0);
+
+	/* OTG pin */
+	ret = x86_android_tablet_get_gpiod("INT33FF:03", 19, &gpiod);
+	if (ret < 0)
+		return ret;
+
+	gpiod_set_value(gpiod, 0);
+
+	return 0;
+}
+
+const struct x86_dev_info lenovo_yt3_info __initconst = {
+	.i2c_client_info = lenovo_yt3_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(lenovo_yt3_i2c_clients),
+	.init = lenovo_yt3_init,
+};
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c b/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
index 10254db73286..0362194e225c 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
@@ -8,20 +8,12 @@
  * Copyright (C) 2021-2022 Hans de Goede <hdegoede@redhat.com>
  */
 
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
 #include <linux/acpi.h>
-#include <linux/efi.h>
 #include <linux/gpio_keys.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/input.h>
-#include <linux/pinctrl/consumer.h>
-#include <linux/pinctrl/machine.h>
-#include <linux/platform_data/lp855x.h>
 #include <linux/platform_device.h>
-#include <linux/reboot.h>
-#include <linux/rmi.h>
-#include <linux/spi/spi.h>
 
 #include "shared-psy-info.h"
 #include "x86-android-tablets.h"
@@ -266,402 +258,6 @@ const struct x86_dev_info czc_p10t __initconst = {
 	.init = czc_p10t_init,
 };
 
-/* Lenovo Yoga Book X90F / X91F / X91L need manual instantiation of the fg client */
-static const struct x86_i2c_client_info lenovo_yogabook_x9x_i2c_clients[] __initconst = {
-	{
-		/* BQ27542 fuel-gauge */
-		.board_info = {
-			.type = "bq27542",
-			.addr = 0x55,
-			.dev_name = "bq27542",
-			.swnode = &fg_bq25890_supply_node,
-		},
-		.adapter_path = "\\_SB_.PCI0.I2C1",
-	},
-};
-
-const struct x86_dev_info lenovo_yogabook_x9x_info __initconst = {
-	.i2c_client_info = lenovo_yogabook_x9x_i2c_clients,
-	.i2c_client_count = ARRAY_SIZE(lenovo_yogabook_x9x_i2c_clients),
-};
-
-/* Lenovo Yoga Tablet 2 1050F/L's Android factory img has everything hardcoded */
-static const struct property_entry lenovo_yoga_tab2_830_1050_bq24190_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", tusb1211_chg_det_psy, 1),
-	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_hv_4v35_battery_node),
-	PROPERTY_ENTRY_BOOL("omit-battery-class"),
-	PROPERTY_ENTRY_BOOL("disable-reset"),
-	{ }
-};
-
-static const struct software_node lenovo_yoga_tab2_830_1050_bq24190_node = {
-	.properties = lenovo_yoga_tab2_830_1050_bq24190_props,
-};
-
-/* This gets filled by lenovo_yoga_tab2_830_1050_init() */
-static struct rmi_device_platform_data lenovo_yoga_tab2_830_1050_rmi_pdata = { };
-
-static struct lp855x_platform_data lenovo_yoga_tab2_830_1050_lp8557_pdata = {
-	.device_control = 0x86,
-	.initial_brightness = 128,
-};
-
-static const struct x86_i2c_client_info lenovo_yoga_tab2_830_1050_i2c_clients[] __initconst = {
-	{
-		/* bq24292i battery charger */
-		.board_info = {
-			.type = "bq24190",
-			.addr = 0x6b,
-			.dev_name = "bq24292i",
-			.swnode = &lenovo_yoga_tab2_830_1050_bq24190_node,
-			.platform_data = &bq24190_pdata,
-		},
-		.adapter_path = "\\_SB_.I2C1",
-		.irq_data = {
-			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
-			.chip = "INT33FC:02",
-			.index = 2,
-			.trigger = ACPI_EDGE_SENSITIVE,
-			.polarity = ACPI_ACTIVE_HIGH,
-		},
-	}, {
-		/* BQ27541 fuel-gauge */
-		.board_info = {
-			.type = "bq27541",
-			.addr = 0x55,
-			.dev_name = "bq27541",
-			.swnode = &fg_bq24190_supply_node,
-		},
-		.adapter_path = "\\_SB_.I2C1",
-	}, {
-		/* Synaptics RMI touchscreen */
-		.board_info = {
-			.type = "rmi4_i2c",
-			.addr = 0x38,
-			.dev_name = "rmi4_i2c",
-			.platform_data = &lenovo_yoga_tab2_830_1050_rmi_pdata,
-		},
-		.adapter_path = "\\_SB_.I2C6",
-		.irq_data = {
-			.type = X86_ACPI_IRQ_TYPE_APIC,
-			.index = 0x45,
-			.trigger = ACPI_EDGE_SENSITIVE,
-			.polarity = ACPI_ACTIVE_HIGH,
-		},
-	}, {
-		/* LP8557 Backlight controller */
-		.board_info = {
-			.type = "lp8557",
-			.addr = 0x2c,
-			.dev_name = "lp8557",
-			.platform_data = &lenovo_yoga_tab2_830_1050_lp8557_pdata,
-		},
-		.adapter_path = "\\_SB_.I2C3",
-	},
-};
-
-static struct gpiod_lookup_table lenovo_yoga_tab2_830_1050_int3496_gpios = {
-	.dev_id = "intel-int3496",
-	.table = {
-		GPIO_LOOKUP("INT33FC:02", 1, "mux", GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP("INT33FC:02", 24, "id", GPIO_ACTIVE_HIGH),
-		{ }
-	},
-};
-
-#define LENOVO_YOGA_TAB2_830_1050_CODEC_NAME "spi-10WM5102:00"
-
-static struct gpiod_lookup_table lenovo_yoga_tab2_830_1050_codec_gpios = {
-	.dev_id = LENOVO_YOGA_TAB2_830_1050_CODEC_NAME,
-	.table = {
-		GPIO_LOOKUP("gpio_crystalcove", 3, "reset", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("INT33FC:01", 23, "wlf,ldoena", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("arizona", 2, "wlf,spkvdd-ena", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("arizona", 4, "wlf,micd-pol", GPIO_ACTIVE_LOW),
-		{ }
-	},
-};
-
-static struct gpiod_lookup_table * const lenovo_yoga_tab2_830_1050_gpios[] = {
-	&lenovo_yoga_tab2_830_1050_int3496_gpios,
-	&lenovo_yoga_tab2_830_1050_codec_gpios,
-	NULL
-};
-
-static int __init lenovo_yoga_tab2_830_1050_init(void);
-static void lenovo_yoga_tab2_830_1050_exit(void);
-
-struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initdata = {
-	.i2c_client_info = lenovo_yoga_tab2_830_1050_i2c_clients,
-	/* i2c_client_count gets set by lenovo_yoga_tab2_830_1050_init() */
-	.pdev_info = int3496_pdevs,
-	.pdev_count = 1,
-	.gpiod_lookup_tables = lenovo_yoga_tab2_830_1050_gpios,
-	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
-	.modules = bq24190_modules,
-	.invalid_aei_gpiochip = "INT33FC:02",
-	.init = lenovo_yoga_tab2_830_1050_init,
-	.exit = lenovo_yoga_tab2_830_1050_exit,
-};
-
-/*
- * The Lenovo Yoga Tablet 2 830 and 1050 (8" vs 10") versions use the same
- * mainboard, but they need some different treatment related to the display:
- * 1. The 830 uses a portrait LCD panel with a landscape touchscreen, requiring
- *    the touchscreen driver to adjust the touch-coords to match the LCD.
- * 2. Both use an TI LP8557 LED backlight controller. On the 1050 the LP8557's
- *    PWM input is connected to the PMIC's PWM output and everything works fine
- *    with the defaults programmed into the LP8557 by the BIOS.
- *    But on the 830 the LP8557's PWM input is connected to a PWM output coming
- *    from the LCD panel's controller. The Android code has a hack in the i915
- *    driver to write the non-standard DSI reg 0x9f with the desired backlight
- *    level to set the duty-cycle of the LCD's PWM output.
- *
- *    To avoid having to have a similar hack in the mainline kernel the LP8557
- *    entry in lenovo_yoga_tab2_830_1050_i2c_clients instead just programs the
- *    LP8557 to directly set the level, ignoring the PWM input. This means that
- *    the LP8557 i2c_client should only be instantiated on the 830.
- */
-static int __init lenovo_yoga_tab2_830_1050_init_display(void)
-{
-	struct gpio_desc *gpiod;
-	int ret;
-
-	/* Use PMIC GPIO 10 bootstrap pin to differentiate 830 vs 1050 */
-	ret = x86_android_tablet_get_gpiod("gpio_crystalcove", 10, &gpiod);
-	if (ret)
-		return ret;
-
-	ret = gpiod_get_value_cansleep(gpiod);
-	if (ret) {
-		pr_info("detected Lenovo Yoga Tablet 2 1050F/L\n");
-		lenovo_yoga_tab2_830_1050_info.i2c_client_count =
-			ARRAY_SIZE(lenovo_yoga_tab2_830_1050_i2c_clients) - 1;
-	} else {
-		pr_info("detected Lenovo Yoga Tablet 2 830F/L\n");
-		lenovo_yoga_tab2_830_1050_rmi_pdata.sensor_pdata.axis_align.swap_axes = true;
-		lenovo_yoga_tab2_830_1050_rmi_pdata.sensor_pdata.axis_align.flip_y = true;
-		lenovo_yoga_tab2_830_1050_info.i2c_client_count =
-			ARRAY_SIZE(lenovo_yoga_tab2_830_1050_i2c_clients);
-	}
-
-	return 0;
-}
-
-/* SUS (INT33FC:02) pin 6 needs to be configured as pmu_clk for the audio codec */
-static const struct pinctrl_map lenovo_yoga_tab2_830_1050_codec_pinctrl_map =
-	PIN_MAP_MUX_GROUP(LENOVO_YOGA_TAB2_830_1050_CODEC_NAME, "codec_32khz_clk",
-			  "INT33FC:02", "pmu_clk2_grp", "pmu_clk");
-
-static struct pinctrl *lenovo_yoga_tab2_830_1050_codec_pinctrl;
-static struct sys_off_handler *lenovo_yoga_tab2_830_1050_sys_off_handler;
-
-static int __init lenovo_yoga_tab2_830_1050_init_codec(void)
-{
-	struct device *codec_dev;
-	struct pinctrl *pinctrl;
-	int ret;
-
-	codec_dev = bus_find_device_by_name(&spi_bus_type, NULL,
-					    LENOVO_YOGA_TAB2_830_1050_CODEC_NAME);
-	if (!codec_dev) {
-		pr_err("error cannot find %s device\n", LENOVO_YOGA_TAB2_830_1050_CODEC_NAME);
-		return -ENODEV;
-	}
-
-	ret = pinctrl_register_mappings(&lenovo_yoga_tab2_830_1050_codec_pinctrl_map, 1);
-	if (ret)
-		goto err_put_device;
-
-	pinctrl = pinctrl_get_select(codec_dev, "codec_32khz_clk");
-	if (IS_ERR(pinctrl)) {
-		ret = dev_err_probe(codec_dev, PTR_ERR(pinctrl), "selecting codec_32khz_clk\n");
-		goto err_unregister_mappings;
-	}
-
-	/* We're done with the codec_dev now */
-	put_device(codec_dev);
-
-	lenovo_yoga_tab2_830_1050_codec_pinctrl = pinctrl;
-	return 0;
-
-err_unregister_mappings:
-	pinctrl_unregister_mappings(&lenovo_yoga_tab2_830_1050_codec_pinctrl_map);
-err_put_device:
-	put_device(codec_dev);
-	return ret;
-}
-
-/*
- * These tablet's DSDT does not set acpi_gbl_reduced_hardware, so acpi_power_off
- * gets used as pm_power_off handler. This causes "poweroff" on these tablets
- * to hang hard. Requiring pressing the powerbutton for 30 seconds *twice*
- * followed by a normal 3 second press to recover. Avoid this by doing an EFI
- * poweroff instead.
- */
-static int lenovo_yoga_tab2_830_1050_power_off(struct sys_off_data *data)
-{
-	efi.reset_system(EFI_RESET_SHUTDOWN, EFI_SUCCESS, 0, NULL);
-
-	return NOTIFY_DONE;
-}
-
-static int __init lenovo_yoga_tab2_830_1050_init(void)
-{
-	int ret;
-
-	ret = lenovo_yoga_tab2_830_1050_init_display();
-	if (ret)
-		return ret;
-
-	ret = lenovo_yoga_tab2_830_1050_init_codec();
-	if (ret)
-		return ret;
-
-	/* SYS_OFF_PRIO_FIRMWARE + 1 so that it runs before acpi_power_off */
-	lenovo_yoga_tab2_830_1050_sys_off_handler =
-		register_sys_off_handler(SYS_OFF_MODE_POWER_OFF, SYS_OFF_PRIO_FIRMWARE + 1,
-					 lenovo_yoga_tab2_830_1050_power_off, NULL);
-	if (IS_ERR(lenovo_yoga_tab2_830_1050_sys_off_handler))
-		return PTR_ERR(lenovo_yoga_tab2_830_1050_sys_off_handler);
-
-	return 0;
-}
-
-static void lenovo_yoga_tab2_830_1050_exit(void)
-{
-	unregister_sys_off_handler(lenovo_yoga_tab2_830_1050_sys_off_handler);
-
-	if (lenovo_yoga_tab2_830_1050_codec_pinctrl) {
-		pinctrl_put(lenovo_yoga_tab2_830_1050_codec_pinctrl);
-		pinctrl_unregister_mappings(&lenovo_yoga_tab2_830_1050_codec_pinctrl_map);
-	}
-}
-
-/* Lenovo Yoga Tab 3 Pro YT3-X90F */
-
-/*
- * There are 2 batteries, with 2 bq27500 fuel-gauges and 2 bq25892 chargers,
- * "bq25890-charger-1" is instantiated from: drivers/i2c/busses/i2c-cht-wc.c.
- */
-static const char * const lenovo_yt3_bq25892_0_suppliers[] = { "cht_wcove_pwrsrc" };
-static const char * const bq25890_1_psy[] = { "bq25890-charger-1" };
-
-static const struct property_entry fg_bq25890_1_supply_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq25890_1_psy),
-	{ }
-};
-
-static const struct software_node fg_bq25890_1_supply_node = {
-	.properties = fg_bq25890_1_supply_props,
-};
-
-/* bq25892 charger settings for the flat lipo battery behind the screen */
-static const struct property_entry lenovo_yt3_bq25892_0_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", lenovo_yt3_bq25892_0_suppliers),
-	PROPERTY_ENTRY_STRING("linux,power-supply-name", "bq25892-second-chrg"),
-	PROPERTY_ENTRY_U32("linux,iinlim-percentage", 40),
-	PROPERTY_ENTRY_BOOL("linux,skip-reset"),
-	/* Values taken from Android Factory Image */
-	PROPERTY_ENTRY_U32("ti,charge-current", 2048000),
-	PROPERTY_ENTRY_U32("ti,battery-regulation-voltage", 4352000),
-	PROPERTY_ENTRY_U32("ti,termination-current", 128000),
-	PROPERTY_ENTRY_U32("ti,precharge-current", 128000),
-	PROPERTY_ENTRY_U32("ti,minimum-sys-voltage", 3700000),
-	PROPERTY_ENTRY_U32("ti,boost-voltage", 4998000),
-	PROPERTY_ENTRY_U32("ti,boost-max-current", 500000),
-	PROPERTY_ENTRY_BOOL("ti,use-ilim-pin"),
-	{ }
-};
-
-static const struct software_node lenovo_yt3_bq25892_0_node = {
-	.properties = lenovo_yt3_bq25892_0_props,
-};
-
-static const struct x86_i2c_client_info lenovo_yt3_i2c_clients[] __initconst = {
-	{
-		/* bq27500 fuel-gauge for the flat lipo battery behind the screen */
-		.board_info = {
-			.type = "bq27500",
-			.addr = 0x55,
-			.dev_name = "bq27500_0",
-			.swnode = &fg_bq25890_supply_node,
-		},
-		.adapter_path = "\\_SB_.PCI0.I2C1",
-	}, {
-		/* bq25892 charger for the flat lipo battery behind the screen */
-		.board_info = {
-			.type = "bq25892",
-			.addr = 0x6b,
-			.dev_name = "bq25892_0",
-			.swnode = &lenovo_yt3_bq25892_0_node,
-		},
-		.adapter_path = "\\_SB_.PCI0.I2C1",
-		.irq_data = {
-			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
-			.chip = "INT33FF:01",
-			.index = 5,
-			.trigger = ACPI_EDGE_SENSITIVE,
-			.polarity = ACPI_ACTIVE_LOW,
-		},
-	}, {
-		/* bq27500 fuel-gauge for the round li-ion cells in the hinge */
-		.board_info = {
-			.type = "bq27500",
-			.addr = 0x55,
-			.dev_name = "bq27500_1",
-			.swnode = &fg_bq25890_1_supply_node,
-		},
-		.adapter_path = "\\_SB_.PCI0.I2C2",
-	}
-};
-
-static int __init lenovo_yt3_init(void)
-{
-	struct gpio_desc *gpiod;
-	int ret;
-
-	/*
-	 * The "bq25892_0" charger IC has its /CE (Charge-Enable) and OTG pins
-	 * connected to GPIOs, rather then having them hardwired to the correct
-	 * values as is normally done.
-	 *
-	 * The bq25890_charger driver controls these through I2C, but this only
-	 * works if not overridden by the pins. Set these pins here:
-	 * 1. Set /CE to 0 to allow charging.
-	 * 2. Set OTG to 0 disable V5 boost output since the 5V boost output of
-	 *    the main "bq25892_1" charger is used when necessary.
-	 */
-
-	/* /CE pin */
-	ret = x86_android_tablet_get_gpiod("INT33FF:02", 22, &gpiod);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * The gpio_desc returned by x86_android_tablet_get_gpiod() is a "raw"
-	 * gpio_desc, that is there is no way to pass lookup-flags like
-	 * GPIO_ACTIVE_LOW. Set the GPIO to 0 here to enable charging since
-	 * the /CE pin is active-low, but not marked as such in the gpio_desc.
-	 */
-	gpiod_set_value(gpiod, 0);
-
-	/* OTG pin */
-	ret = x86_android_tablet_get_gpiod("INT33FF:03", 19, &gpiod);
-	if (ret < 0)
-		return ret;
-
-	gpiod_set_value(gpiod, 0);
-
-	return 0;
-}
-
-const struct x86_dev_info lenovo_yt3_info __initconst = {
-	.i2c_client_info = lenovo_yt3_i2c_clients,
-	.i2c_client_count = ARRAY_SIZE(lenovo_yt3_i2c_clients),
-	.init = lenovo_yt3_init,
-};
-
 /* Medion Lifetab S10346 tablets have an Android factory img with everything hardcoded */
 static const char * const medion_lifetab_s10346_accel_mount_matrix[] = {
 	"0", "1", "0",
-- 
2.39.1

