Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F80BC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Nov 2021 19:28:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241542AbhKYTbh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 Nov 2021 14:31:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37016 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349977AbhKYT3g (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Nov 2021 14:29:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637868384;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=P9/VCEbsx1baJ7MpkMavVulLlPCmXzUh5OVETDmd72k=;
        b=QOeJrpYhLOO1boH4QqUHJrRei8kOsADuNELgtADIXQNjCUeELQ3gmlbl0D6bnvB39kM/Tt
        Z8uM3yGS7llFTQzPpEC02rXQrbwjNn/odvdwbbBEbsI2+coDFpPf4lKlmHVnhCfg1M7Hi8
        qaiBpPrkBHpY+LWRSEqmyoALT4DvPpc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-wSBFmaJeMaiuif7DxDIhyg-1; Thu, 25 Nov 2021 14:26:21 -0500
X-MC-Unique: wSBFmaJeMaiuif7DxDIhyg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 750361018723;
        Thu, 25 Nov 2021 19:26:20 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.195.117])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0EC5F10016FE;
        Thu, 25 Nov 2021 19:26:18 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: x86-android-tablets: New driver for x86 Android tablets
Date:   Thu, 25 Nov 2021 20:26:18 +0100
Message-Id: <20211125192618.732348-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

x86 tablets which ship with Android as (part of) the factory image
typically have various problems with their DSDTs. The factory kernels
shipped on these devices typically have device addresses and GPIOs
hardcoded in the kernel, rather then specified in their DSDT.

With the DSDT containing a random collection of devices which may or
may not actually be present as well as missing devices which are
actually present.

This driver, which loads only on affected models based on DMI matching,
adds DMI based instantiating of kernel devices for devices which are
missing from the DSDT, fixing e.g. battery monitoring, touchpads and/or
accelerometers not working.

Note the Kconfig help text also refers to "various fixes" ATM there are
no such fixes, but there are also known cases where entries are present
in the DSDT but they contain bugs, such as missing/wrong GPIOs. The plan
is to also add fixes for things like this here in the future.

This is the least ugly option to get these devices to fully work and to
do so without adding any extra code to the main kernel image (vmlinuz)
when built as a module.

Link: https://lore.kernel.org/platform-driver-x86/20211031162428.22368-1-hdegoede@redhat.com/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/Kconfig               |  17 ++
 drivers/platform/x86/Makefile              |   1 +
 drivers/platform/x86/x86-android-tablets.c | 315 +++++++++++++++++++++
 3 files changed, 333 insertions(+)
 create mode 100644 drivers/platform/x86/x86-android-tablets.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 27108c0e855f..a1dd5e0676d1 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1006,6 +1006,23 @@ config TOUCHSCREEN_DMI
 	  the OS-image for the device. This option supplies the missing info.
 	  Enable this for x86 tablets with Silead or Chipone touchscreens.
 
+config X86_ANDROID_TABLETS
+	tristate "X86 Android tablet support"
+	depends on I2C && ACPI
+	help
+	  X86 tablets which ship with Android as (part of) the factory image
+	  typically have various problems with their DSDTs. The factory kernels
+	  shipped on these devices typically have device addresses and GPIOs
+	  hardcoded in the kernel, rather then specified in their DSDT.
+
+	  With the DSDT containing a random collection of devices which may or
+	  may not actually be present. This driver contains various fixes for
+	  such tablets, including instantiating kernel devices for devices which
+	  are missing from the DSDT.
+
+	  If you have a x86 Android tablet say Y or M here, for a generic x86
+	  distro config say M here.
+
 config FW_ATTR_CLASS
 	tristate
 
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index dfb7ca88f012..30047df8f701 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -113,6 +113,7 @@ obj-$(CONFIG_I2C_MULTI_INSTANTIATE)	+= i2c-multi-instantiate.o
 obj-$(CONFIG_MLX_PLATFORM)		+= mlx-platform.o
 obj-$(CONFIG_TOUCHSCREEN_DMI)		+= touchscreen_dmi.o
 obj-$(CONFIG_WIRELESS_HOTKEY)		+= wireless-hotkey.o
+obj-$(CONFIG_X86_ANDROID_TABLETS)	+= x86-android-tablets.o
 
 # Intel uncore drivers
 obj-$(CONFIG_INTEL_IPS)				+= intel_ips.o
diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
new file mode 100644
index 000000000000..526c6a5ff7da
--- /dev/null
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -0,0 +1,315 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * DMI based code to deal with broken DSDTs on X86 tablets which ship with
+ * Android as (part of) the factory image. The factory kernels shipped on these
+ * devices typically have a bunch of things hardcoded, rather then specified
+ * in their DSDT.
+ *
+ * Copyright (C) 2021 Hans de Goede <hdegoede@redhat.com>
+ */
+
+#define pr_fmt(fmt) "x86-android-tablet: " fmt
+
+#include <linux/acpi.h>
+#include <linux/dmi.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
+#include <linux/i2c.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+
+#define IRQ_TYPE_NONE		0
+#define IRQ_TYPE_APIC		1
+#define IRQ_TYPE_GPIOINT	2
+
+struct x86_i2c_client_info {
+	struct i2c_board_info board_info;
+	char *adapter_path;
+	int irq_type;
+	int irq_index;
+	int irq_trigger;
+	int irq_polarity;
+};
+
+struct x86_dev_info {
+	const struct x86_i2c_client_info *i2c_client_info;
+	int i2c_client_count;
+	struct gpiod_lookup_table *gpiod_lookup_table;
+};
+
+int i2c_client_count;
+static struct i2c_client **i2c_clients;
+struct gpio_desc **irq_gpiods;
+
+/*
+ * When booted with the BIOS set to Android mode the Chuwi Hi8 (CWI509) DSDT
+ * contains a whole bunch of bogus ACPI I2C devices and is missing entries
+ * for the touchscreen and the accelerometer.
+ */
+static const struct property_entry chuwi_hi8_gsl1680_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1665),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hi8.fw"),
+	{ }
+};
+
+static const struct software_node chuwi_hi8_gsl1680_node = {
+	.properties = chuwi_hi8_gsl1680_props,
+};
+
+static const char * const chuwi_hi8_mount_matrix[] = {
+	"1", "0", "0",
+	"0", "-1", "0",
+	"0", "0", "1"
+};
+
+static const struct property_entry chuwi_hi8_bma250e_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("mount-matrix", chuwi_hi8_mount_matrix),
+	{ }
+};
+
+static const struct software_node chuwi_hi8_bma250e_node = {
+	.properties = chuwi_hi8_bma250e_props,
+};
+
+static const struct x86_i2c_client_info chuwi_hi8_i2c_clients[] __initconst = {
+	{	/* Silead touchscreen */
+		.board_info = {
+			.type = "gsl1680",
+			.addr = 0x40,
+			.swnode = &chuwi_hi8_gsl1680_node,
+		},
+		.adapter_path = "\\_SB_.I2C4",
+		.irq_type = IRQ_TYPE_APIC,
+		.irq_index = 0x44,
+		.irq_trigger = ACPI_EDGE_SENSITIVE,
+		.irq_polarity = ACPI_ACTIVE_HIGH,
+	},
+	{	/* BMA250E accelerometer */
+		.board_info = {
+			.type = "bma250e",
+			.addr = 0x18,
+			.swnode = &chuwi_hi8_bma250e_node,
+		},
+		.adapter_path = "\\_SB_.I2C3",
+		.irq_type = IRQ_TYPE_GPIOINT,
+		.irq_trigger = ACPI_LEVEL_SENSITIVE,
+		.irq_polarity = ACPI_ACTIVE_HIGH,
+	},
+};
+
+static struct gpiod_lookup_table chuwi_hi8_gpios = {
+	.table = {
+		GPIO_LOOKUP("INT33FC:02", 23, "bma250e_irq", GPIO_ACTIVE_HIGH),
+		{}
+	},
+};
+
+static const struct x86_dev_info chuwi_hi8_info __initconst = {
+	.i2c_client_info = chuwi_hi8_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(chuwi_hi8_i2c_clients),
+	.gpiod_lookup_table = &chuwi_hi8_gpios,
+};
+
+/*
+ * On the Xiaomi Mi Pad 2 X86 tablet a bunch of devices are hidden when
+ * the EFI if the tablet does thinks the OS it is booting is Windows
+ * (OSID in the DSDT is set to 1); and the EFI code thinks this as soon
+ * as the EFI bootloader is not Xiaomi's own signed Android loader :|
+ *
+ * This takes care of instantiating the hidden devices manually.
+ */
+static const char * const bq27520_suppliers[] = { "bq25890-charger" };
+
+static const struct property_entry bq27520_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq27520_suppliers),
+	{ }
+};
+
+static const struct software_node bq27520_node = {
+	.properties = bq27520_props,
+};
+
+static const struct x86_i2c_client_info xiaomi_mipad2_i2c_clients[] __initconst = {
+	{	/* BQ27520 fuel-gauge */
+		.board_info = {
+			.type = "bq27520",
+			.addr = 0x55,
+			.dev_name = "bq27520",
+			.swnode = &bq27520_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C1",
+	}, {	/* KTD2026 RGB notification LED controller */
+		.board_info = {
+			.type = "ktd2026",
+			.addr = 0x30,
+			.dev_name = "ktd2026",
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C3",
+	}
+};
+
+static const struct x86_dev_info xiaomi_mipad2_info __initconst = {
+	.i2c_client_info = xiaomi_mipad2_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(xiaomi_mipad2_i2c_clients),
+};
+
+static const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
+	{	/* Xiaomi Mi Pad 2 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Xiaomi Inc"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Mipad2"),
+		},
+		.driver_data = (void *)&xiaomi_mipad2_info,
+	}, {
+		/* Chuwi Hi8 (CWI509) */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
+			DMI_MATCH(DMI_BOARD_NAME, "BYT-PA03C"),
+			DMI_MATCH(DMI_SYS_VENDOR, "ilife"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "S806"),
+		},
+		.driver_data = (void *)&chuwi_hi8_info,
+	},
+	{} /* Terminating entry */
+};
+MODULE_DEVICE_TABLE(dmi, x86_android_tablet_ids);
+
+static __init int x86_instantiate_i2c_client(const struct x86_dev_info *dev_info,
+					     int idx)
+{
+	const struct x86_i2c_client_info *client_info = &dev_info->i2c_client_info[idx];
+	struct i2c_board_info board_info = client_info->board_info;
+	struct i2c_adapter *adap;
+	unsigned int irq_type;
+	char gpio_name[16];
+	acpi_handle handle;
+	acpi_status status;
+	int ret;
+
+	status = acpi_get_handle(NULL, client_info->adapter_path, &handle);
+	if (ACPI_FAILURE(status)) {
+		pr_err("Error could not get %s handle\n", client_info->adapter_path);
+		return -ENODEV;
+	}
+
+	adap = i2c_acpi_find_adapter_by_handle(handle);
+	if (!adap) {
+		pr_err("Error could not get %s adapter\n", client_info->adapter_path);
+		return -ENODEV;
+	}
+
+	switch (client_info->irq_type) {
+	case IRQ_TYPE_APIC:
+		ret = acpi_register_gsi(NULL, client_info->irq_index,
+					client_info->irq_trigger,
+					client_info->irq_polarity);
+		if (ret < 0) {
+			pr_err("Error getting APIC IRQ %d: %d\n",
+			       client_info->irq_index, ret);
+			goto out;
+		}
+
+		board_info.irq = ret;
+		break;
+	case IRQ_TYPE_GPIOINT:
+		snprintf(gpio_name, sizeof(gpio_name), "%s_irq", board_info.type);
+		irq_gpiods[idx] = gpiod_get(NULL, gpio_name, GPIOD_IN);
+		if (IS_ERR(irq_gpiods[idx])) {
+			ret = PTR_ERR(irq_gpiods[idx]);
+			irq_gpiods[idx] = NULL;
+			pr_err("Error getting GPIO %s: %d\n", gpio_name, ret);
+			goto out;
+		}
+
+		ret = gpiod_to_irq(irq_gpiods[idx]);
+		if (ret < 0) {
+			pr_err("Error getting IRQ for %s: %d\n", gpio_name, ret);
+			goto out;
+		}
+
+		board_info.irq = ret;
+
+		irq_type = acpi_dev_get_irq_type(client_info->irq_trigger,
+						 client_info->irq_polarity);
+		if (irq_type != IRQ_TYPE_NONE &&
+		    irq_type != irq_get_trigger_type(board_info.irq))
+			irq_set_irq_type(board_info.irq, irq_type);
+
+		break;
+	}
+
+	ret = 0;
+	i2c_clients[idx] = i2c_new_client_device(adap, &board_info);
+	if (IS_ERR(i2c_clients[idx])) {
+		ret = PTR_ERR(i2c_clients[idx]);
+		pr_err("Error creating I2C-client %d: %d\n", idx, ret);
+	}
+out:
+	put_device(&adap->dev);
+	return ret;
+}
+
+static void x86_android_tablet_cleanup(void)
+{
+	int i;
+
+	for (i = 0; i < i2c_client_count; i++) {
+		i2c_unregister_device(i2c_clients[i]);
+		gpiod_put(irq_gpiods[i]);
+	}
+
+	kfree(i2c_clients);
+	kfree(irq_gpiods);
+}
+
+static __init int x86_android_tablet_init(void)
+{
+	const struct x86_dev_info *dev_info;
+	const struct dmi_system_id *id;
+	int i, ret = 0;
+
+	id = dmi_first_match(x86_android_tablet_ids);
+	if (!id)
+		return -ENODEV;
+
+	dev_info = id->driver_data;
+
+	i2c_client_count = dev_info->i2c_client_count;
+
+	i2c_clients = kcalloc(i2c_client_count, sizeof(*i2c_clients), GFP_KERNEL);
+	if (!i2c_clients)
+		return -ENOMEM;
+
+	irq_gpiods = kcalloc(i2c_client_count, sizeof(*irq_gpiods), GFP_KERNEL);
+	if (!irq_gpiods) {
+		kfree(i2c_clients);
+		return -ENOMEM;
+	}
+
+	if (dev_info->gpiod_lookup_table)
+		gpiod_add_lookup_table(dev_info->gpiod_lookup_table);
+
+	for (i = 0; i < dev_info->i2c_client_count; i++) {
+		ret = x86_instantiate_i2c_client(dev_info, i);
+		if (ret < 0) {
+			x86_android_tablet_cleanup();
+			break;
+		}
+	}
+
+	if (dev_info->gpiod_lookup_table)
+		gpiod_remove_lookup_table(dev_info->gpiod_lookup_table);
+
+	return ret;
+}
+
+module_init(x86_android_tablet_init);
+module_exit(x86_android_tablet_cleanup);
+
+MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com");
+MODULE_DESCRIPTION("X86 Android tablets DSDT fixups driver");
+MODULE_LICENSE("GPL");
-- 
2.33.1

