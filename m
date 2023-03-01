Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6D2C64ED6
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 09:24:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjCAJY3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 04:24:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjCAJY2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 04:24:28 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62BC432CF7
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 01:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677662622;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cQvKK/eyoK/pEz+C54xSev6jvMn9wQY0YSYJ6O8jtWM=;
        b=EXOUMWaDW9rMs2TrD/juwlGu5rZxfsI2uJnYXaduQqQ6VubI2xIPm1P2xSSybkok5HcZti
        MxHByr6CXFH4AznzCRg9m33AlGu0j24q9GUovur3JOikM+m7zxEOH8p2eT2kCc12TLQgWW
        wT3hVVJtEAuUqJzxqQ5MTQSF8ltLgWk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-kWqVqSw-NXKilETAh4bBuA-1; Wed, 01 Mar 2023 04:23:41 -0500
X-MC-Unique: kWqVqSw-NXKilETAh4bBuA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DEB118A6460;
        Wed,  1 Mar 2023 09:23:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.30])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4502A400D796;
        Wed,  1 Mar 2023 09:23:40 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 03/14] platform/x86: x86-android-tablets: Move core code into new core.c file
Date:   Wed,  1 Mar 2023 10:23:20 +0100
Message-Id: <20230301092331.7038-4-hdegoede@redhat.com>
In-Reply-To: <20230301092331.7038-1-hdegoede@redhat.com>
References: <20230301092331.7038-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Move the helpers to get irqs + gpios as well as the core code for
instantiating all the devices missing from ACPI into a new core.c file.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Use GPL-2.0-or-later for SPDX identifier
- Use struct forward declarations in x86-android-tablets.h
  instead of bringing in a bunch of headers
- Prefix the define guarding against multiple inclusions with PDX86_
---
 .../platform/x86/x86-android-tablets/Makefile |   2 +-
 .../platform/x86/x86-android-tablets/core.c   | 365 ++++++++++++++++
 .../x86-android-tablets-main.c                | 404 +-----------------
 .../x86-android-tablets/x86-android-tablets.h |  79 ++++
 4 files changed, 447 insertions(+), 403 deletions(-)
 create mode 100644 drivers/platform/x86/x86-android-tablets/core.c
 create mode 100644 drivers/platform/x86/x86-android-tablets/x86-android-tablets.h

diff --git a/drivers/platform/x86/x86-android-tablets/Makefile b/drivers/platform/x86/x86-android-tablets/Makefile
index 52a0d6de5fcb..34016df3e54a 100644
--- a/drivers/platform/x86/x86-android-tablets/Makefile
+++ b/drivers/platform/x86/x86-android-tablets/Makefile
@@ -5,4 +5,4 @@
 
 obj-$(CONFIG_X86_ANDROID_TABLETS) += x86-android-tablets.o
 
-x86-android-tablets-y := x86-android-tablets-main.o
+x86-android-tablets-y := core.o x86-android-tablets-main.o
diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
new file mode 100644
index 000000000000..ddd24881f392
--- /dev/null
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -0,0 +1,365 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * DMI based code to deal with broken DSDTs on X86 tablets which ship with
+ * Android as (part of) the factory image. The factory kernels shipped on these
+ * devices typically have a bunch of things hardcoded, rather than specified
+ * in their DSDT.
+ *
+ * Copyright (C) 2021-2023 Hans de Goede <hdegoede@redhat.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/dmi.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/serdev.h>
+#include <linux/string.h>
+
+#include "x86-android-tablets.h"
+/* For gpiochip_get_desc() which is EXPORT_SYMBOL_GPL() */
+#include "../../../gpio/gpiolib.h"
+#include "../../../gpio/gpiolib-acpi.h"
+
+static int gpiochip_find_match_label(struct gpio_chip *gc, void *data)
+{
+	return gc->label && !strcmp(gc->label, data);
+}
+
+int x86_android_tablet_get_gpiod(const char *label, int pin, struct gpio_desc **desc)
+{
+	struct gpio_desc *gpiod;
+	struct gpio_chip *chip;
+
+	chip = gpiochip_find((void *)label, gpiochip_find_match_label);
+	if (!chip) {
+		pr_err("error cannot find GPIO chip %s\n", label);
+		return -ENODEV;
+	}
+
+	gpiod = gpiochip_get_desc(chip, pin);
+	if (IS_ERR(gpiod)) {
+		pr_err("error %ld getting GPIO %s %d\n", PTR_ERR(gpiod), label, pin);
+		return PTR_ERR(gpiod);
+	}
+
+	*desc = gpiod;
+	return 0;
+}
+
+int x86_acpi_irq_helper_get(const struct x86_acpi_irq_data *data)
+{
+	struct irq_fwspec fwspec = { };
+	struct irq_domain *domain;
+	struct acpi_device *adev;
+	struct gpio_desc *gpiod;
+	unsigned int irq_type;
+	acpi_handle handle;
+	acpi_status status;
+	int irq, ret;
+
+	switch (data->type) {
+	case X86_ACPI_IRQ_TYPE_APIC:
+		/*
+		 * The DSDT may already reference the GSI in a device skipped by
+		 * acpi_quirk_skip_i2c_client_enumeration(). Unregister the GSI
+		 * to avoid EBUSY errors in this case.
+		 */
+		acpi_unregister_gsi(data->index);
+		irq = acpi_register_gsi(NULL, data->index, data->trigger, data->polarity);
+		if (irq < 0)
+			pr_err("error %d getting APIC IRQ %d\n", irq, data->index);
+
+		return irq;
+	case X86_ACPI_IRQ_TYPE_GPIOINT:
+		/* Like acpi_dev_gpio_irq_get(), but without parsing ACPI resources */
+		ret = x86_android_tablet_get_gpiod(data->chip, data->index, &gpiod);
+		if (ret)
+			return ret;
+
+		irq = gpiod_to_irq(gpiod);
+		if (irq < 0) {
+			pr_err("error %d getting IRQ %s %d\n", irq, data->chip, data->index);
+			return irq;
+		}
+
+		irq_type = acpi_dev_get_irq_type(data->trigger, data->polarity);
+		if (irq_type != IRQ_TYPE_NONE && irq_type != irq_get_trigger_type(irq))
+			irq_set_irq_type(irq, irq_type);
+
+		return irq;
+	case X86_ACPI_IRQ_TYPE_PMIC:
+		status = acpi_get_handle(NULL, data->chip, &handle);
+		if (ACPI_FAILURE(status)) {
+			pr_err("error could not get %s handle\n", data->chip);
+			return -ENODEV;
+		}
+
+		adev = acpi_fetch_acpi_dev(handle);
+		if (!adev) {
+			pr_err("error could not get %s adev\n", data->chip);
+			return -ENODEV;
+		}
+
+		fwspec.fwnode = acpi_fwnode_handle(adev);
+		domain = irq_find_matching_fwspec(&fwspec, data->domain);
+		if (!domain) {
+			pr_err("error could not find IRQ domain for %s\n", data->chip);
+			return -ENODEV;
+		}
+
+		return irq_create_mapping(domain, data->index);
+	default:
+		return 0;
+	}
+}
+
+static int i2c_client_count;
+static int pdev_count;
+static int serdev_count;
+static struct i2c_client **i2c_clients;
+static struct platform_device **pdevs;
+static struct serdev_device **serdevs;
+static struct gpiod_lookup_table * const *gpiod_lookup_tables;
+static const struct software_node *bat_swnode;
+static void (*exit_handler)(void);
+
+static __init int x86_instantiate_i2c_client(const struct x86_dev_info *dev_info,
+					     int idx)
+{
+	const struct x86_i2c_client_info *client_info = &dev_info->i2c_client_info[idx];
+	struct i2c_board_info board_info = client_info->board_info;
+	struct i2c_adapter *adap;
+	acpi_handle handle;
+	acpi_status status;
+
+	board_info.irq = x86_acpi_irq_helper_get(&client_info->irq_data);
+	if (board_info.irq < 0)
+		return board_info.irq;
+
+	status = acpi_get_handle(NULL, client_info->adapter_path, &handle);
+	if (ACPI_FAILURE(status)) {
+		pr_err("Error could not get %s handle\n", client_info->adapter_path);
+		return -ENODEV;
+	}
+
+	adap = i2c_acpi_find_adapter_by_handle(handle);
+	if (!adap) {
+		pr_err("error could not get %s adapter\n", client_info->adapter_path);
+		return -ENODEV;
+	}
+
+	i2c_clients[idx] = i2c_new_client_device(adap, &board_info);
+	put_device(&adap->dev);
+	if (IS_ERR(i2c_clients[idx]))
+		return dev_err_probe(&adap->dev, PTR_ERR(i2c_clients[idx]),
+				      "creating I2C-client %d\n", idx);
+
+	return 0;
+}
+
+static __init int x86_instantiate_serdev(const struct x86_serdev_info *info, int idx)
+{
+	struct acpi_device *ctrl_adev, *serdev_adev;
+	struct serdev_device *serdev;
+	struct device *ctrl_dev;
+	int ret = -ENODEV;
+
+	ctrl_adev = acpi_dev_get_first_match_dev(info->ctrl_hid, info->ctrl_uid, -1);
+	if (!ctrl_adev) {
+		pr_err("error could not get %s/%s ctrl adev\n",
+		       info->ctrl_hid, info->ctrl_uid);
+		return -ENODEV;
+	}
+
+	serdev_adev = acpi_dev_get_first_match_dev(info->serdev_hid, NULL, -1);
+	if (!serdev_adev) {
+		pr_err("error could not get %s serdev adev\n", info->serdev_hid);
+		goto put_ctrl_adev;
+	}
+
+	/* get_first_physical_node() returns a weak ref, no need to put() it */
+	ctrl_dev = acpi_get_first_physical_node(ctrl_adev);
+	if (!ctrl_dev)	{
+		pr_err("error could not get %s/%s ctrl physical dev\n",
+		       info->ctrl_hid, info->ctrl_uid);
+		goto put_serdev_adev;
+	}
+
+	/* ctrl_dev now points to the controller's parent, get the controller */
+	ctrl_dev = device_find_child_by_name(ctrl_dev, info->ctrl_devname);
+	if (!ctrl_dev) {
+		pr_err("error could not get %s/%s %s ctrl dev\n",
+		       info->ctrl_hid, info->ctrl_uid, info->ctrl_devname);
+		goto put_serdev_adev;
+	}
+
+	serdev = serdev_device_alloc(to_serdev_controller(ctrl_dev));
+	if (!serdev) {
+		ret = -ENOMEM;
+		goto put_serdev_adev;
+	}
+
+	ACPI_COMPANION_SET(&serdev->dev, serdev_adev);
+	acpi_device_set_enumerated(serdev_adev);
+
+	ret = serdev_device_add(serdev);
+	if (ret) {
+		dev_err(&serdev->dev, "error %d adding serdev\n", ret);
+		serdev_device_put(serdev);
+		goto put_serdev_adev;
+	}
+
+	serdevs[idx] = serdev;
+
+put_serdev_adev:
+	acpi_dev_put(serdev_adev);
+put_ctrl_adev:
+	acpi_dev_put(ctrl_adev);
+	return ret;
+}
+
+static void x86_android_tablet_cleanup(void)
+{
+	int i;
+
+	for (i = 0; i < serdev_count; i++) {
+		if (serdevs[i])
+			serdev_device_remove(serdevs[i]);
+	}
+
+	kfree(serdevs);
+
+	for (i = 0; i < pdev_count; i++)
+		platform_device_unregister(pdevs[i]);
+
+	kfree(pdevs);
+
+	for (i = 0; i < i2c_client_count; i++)
+		i2c_unregister_device(i2c_clients[i]);
+
+	kfree(i2c_clients);
+
+	if (exit_handler)
+		exit_handler();
+
+	for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
+		gpiod_remove_lookup_table(gpiod_lookup_tables[i]);
+
+	software_node_unregister(bat_swnode);
+}
+
+extern const struct dmi_system_id x86_android_tablet_ids[];
+
+static __init int x86_android_tablet_init(void)
+{
+	const struct x86_dev_info *dev_info;
+	const struct dmi_system_id *id;
+	struct gpio_chip *chip;
+	int i, ret = 0;
+
+	id = dmi_first_match(x86_android_tablet_ids);
+	if (!id)
+		return -ENODEV;
+
+	dev_info = id->driver_data;
+
+	/*
+	 * The broken DSDTs on these devices often also include broken
+	 * _AEI (ACPI Event Interrupt) handlers, disable these.
+	 */
+	if (dev_info->invalid_aei_gpiochip) {
+		chip = gpiochip_find(dev_info->invalid_aei_gpiochip,
+				     gpiochip_find_match_label);
+		if (!chip) {
+			pr_err("error cannot find GPIO chip %s\n", dev_info->invalid_aei_gpiochip);
+			return -ENODEV;
+		}
+		acpi_gpiochip_free_interrupts(chip);
+	}
+
+	/*
+	 * Since this runs from module_init() it cannot use -EPROBE_DEFER,
+	 * instead pre-load any modules which are listed as requirements.
+	 */
+	for (i = 0; dev_info->modules && dev_info->modules[i]; i++)
+		request_module(dev_info->modules[i]);
+
+	bat_swnode = dev_info->bat_swnode;
+	if (bat_swnode) {
+		ret = software_node_register(bat_swnode);
+		if (ret)
+			return ret;
+	}
+
+	gpiod_lookup_tables = dev_info->gpiod_lookup_tables;
+	for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
+		gpiod_add_lookup_table(gpiod_lookup_tables[i]);
+
+	if (dev_info->init) {
+		ret = dev_info->init();
+		if (ret < 0) {
+			x86_android_tablet_cleanup();
+			return ret;
+		}
+		exit_handler = dev_info->exit;
+	}
+
+	i2c_clients = kcalloc(dev_info->i2c_client_count, sizeof(*i2c_clients), GFP_KERNEL);
+	if (!i2c_clients) {
+		x86_android_tablet_cleanup();
+		return -ENOMEM;
+	}
+
+	i2c_client_count = dev_info->i2c_client_count;
+	for (i = 0; i < i2c_client_count; i++) {
+		ret = x86_instantiate_i2c_client(dev_info, i);
+		if (ret < 0) {
+			x86_android_tablet_cleanup();
+			return ret;
+		}
+	}
+
+	pdevs = kcalloc(dev_info->pdev_count, sizeof(*pdevs), GFP_KERNEL);
+	if (!pdevs) {
+		x86_android_tablet_cleanup();
+		return -ENOMEM;
+	}
+
+	pdev_count = dev_info->pdev_count;
+	for (i = 0; i < pdev_count; i++) {
+		pdevs[i] = platform_device_register_full(&dev_info->pdev_info[i]);
+		if (IS_ERR(pdevs[i])) {
+			x86_android_tablet_cleanup();
+			return PTR_ERR(pdevs[i]);
+		}
+	}
+
+	serdevs = kcalloc(dev_info->serdev_count, sizeof(*serdevs), GFP_KERNEL);
+	if (!serdevs) {
+		x86_android_tablet_cleanup();
+		return -ENOMEM;
+	}
+
+	serdev_count = dev_info->serdev_count;
+	for (i = 0; i < serdev_count; i++) {
+		ret = x86_instantiate_serdev(&dev_info->serdev_info[i], i);
+		if (ret < 0) {
+			x86_android_tablet_cleanup();
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+module_init(x86_android_tablet_init);
+module_exit(x86_android_tablet_cleanup);
+
+MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
+MODULE_DESCRIPTION("X86 Android tablets DSDT fixups driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c b/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
index 08cc5e158460..7d3012ea7bb5 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
@@ -14,14 +14,8 @@
 #include <linux/dmi.h>
 #include <linux/efi.h>
 #include <linux/gpio_keys.h>
-#include <linux/gpio/consumer.h>
-#include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
-#include <linux/i2c.h>
 #include <linux/input.h>
-#include <linux/irq.h>
-#include <linux/irqdomain.h>
-#include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/machine.h>
@@ -30,159 +24,9 @@
 #include <linux/power/bq24190_charger.h>
 #include <linux/reboot.h>
 #include <linux/rmi.h>
-#include <linux/serdev.h>
 #include <linux/spi/spi.h>
-#include <linux/string.h>
-/* For gpio_get_desc() which is EXPORT_SYMBOL_GPL() */
-#include "../../../gpio/gpiolib.h"
-#include "../../../gpio/gpiolib-acpi.h"
 
-/*
- * Helper code to get Linux IRQ numbers given a description of the IRQ source
- * (either IOAPIC index, or GPIO chip name + pin-number).
- */
-enum x86_acpi_irq_type {
-	X86_ACPI_IRQ_TYPE_NONE,
-	X86_ACPI_IRQ_TYPE_APIC,
-	X86_ACPI_IRQ_TYPE_GPIOINT,
-	X86_ACPI_IRQ_TYPE_PMIC,
-};
-
-struct x86_acpi_irq_data {
-	char *chip;   /* GPIO chip label (GPIOINT) or PMIC ACPI path (PMIC) */
-	enum x86_acpi_irq_type type;
-	enum irq_domain_bus_token domain;
-	int index;
-	int trigger;  /* ACPI_EDGE_SENSITIVE / ACPI_LEVEL_SENSITIVE */
-	int polarity; /* ACPI_ACTIVE_HIGH / ACPI_ACTIVE_LOW / ACPI_ACTIVE_BOTH */
-};
-
-static int gpiochip_find_match_label(struct gpio_chip *gc, void *data)
-{
-	return gc->label && !strcmp(gc->label, data);
-}
-
-static int x86_android_tablet_get_gpiod(char *label, int pin, struct gpio_desc **desc)
-{
-	struct gpio_desc *gpiod;
-	struct gpio_chip *chip;
-
-	chip = gpiochip_find(label, gpiochip_find_match_label);
-	if (!chip) {
-		pr_err("error cannot find GPIO chip %s\n", label);
-		return -ENODEV;
-	}
-
-	gpiod = gpiochip_get_desc(chip, pin);
-	if (IS_ERR(gpiod)) {
-		pr_err("error %ld getting GPIO %s %d\n", PTR_ERR(gpiod), label, pin);
-		return PTR_ERR(gpiod);
-	}
-
-	*desc = gpiod;
-	return 0;
-}
-
-static int x86_acpi_irq_helper_get(const struct x86_acpi_irq_data *data)
-{
-	struct irq_fwspec fwspec = { };
-	struct irq_domain *domain;
-	struct acpi_device *adev;
-	struct gpio_desc *gpiod;
-	unsigned int irq_type;
-	acpi_handle handle;
-	acpi_status status;
-	int irq, ret;
-
-	switch (data->type) {
-	case X86_ACPI_IRQ_TYPE_APIC:
-		/*
-		 * The DSDT may already reference the GSI in a device skipped by
-		 * acpi_quirk_skip_i2c_client_enumeration(). Unregister the GSI
-		 * to avoid EBUSY errors in this case.
-		 */
-		acpi_unregister_gsi(data->index);
-		irq = acpi_register_gsi(NULL, data->index, data->trigger, data->polarity);
-		if (irq < 0)
-			pr_err("error %d getting APIC IRQ %d\n", irq, data->index);
-
-		return irq;
-	case X86_ACPI_IRQ_TYPE_GPIOINT:
-		/* Like acpi_dev_gpio_irq_get(), but without parsing ACPI resources */
-		ret = x86_android_tablet_get_gpiod(data->chip, data->index, &gpiod);
-		if (ret)
-			return ret;
-
-		irq = gpiod_to_irq(gpiod);
-		if (irq < 0) {
-			pr_err("error %d getting IRQ %s %d\n", irq, data->chip, data->index);
-			return irq;
-		}
-
-		irq_type = acpi_dev_get_irq_type(data->trigger, data->polarity);
-		if (irq_type != IRQ_TYPE_NONE && irq_type != irq_get_trigger_type(irq))
-			irq_set_irq_type(irq, irq_type);
-
-		return irq;
-	case X86_ACPI_IRQ_TYPE_PMIC:
-		status = acpi_get_handle(NULL, data->chip, &handle);
-		if (ACPI_FAILURE(status)) {
-			pr_err("error could not get %s handle\n", data->chip);
-			return -ENODEV;
-		}
-
-		adev = acpi_fetch_acpi_dev(handle);
-		if (!adev) {
-			pr_err("error could not get %s adev\n", data->chip);
-			return -ENODEV;
-		}
-
-		fwspec.fwnode = acpi_fwnode_handle(adev);
-		domain = irq_find_matching_fwspec(&fwspec, data->domain);
-		if (!domain) {
-			pr_err("error could not find IRQ domain for %s\n", data->chip);
-			return -ENODEV;
-		}
-
-		return irq_create_mapping(domain, data->index);
-	default:
-		return 0;
-	}
-}
-
-struct x86_i2c_client_info {
-	struct i2c_board_info board_info;
-	char *adapter_path;
-	struct x86_acpi_irq_data irq_data;
-};
-
-struct x86_serdev_info {
-	const char *ctrl_hid;
-	const char *ctrl_uid;
-	const char *ctrl_devname;
-	/*
-	 * ATM the serdev core only supports of or ACPI matching; and sofar all
-	 * Android x86 tablets DSDTs have usable serdev nodes, but sometimes
-	 * under the wrong controller. So we just tie the existing serdev ACPI
-	 * node to the right controller.
-	 */
-	const char *serdev_hid;
-};
-
-struct x86_dev_info {
-	char *invalid_aei_gpiochip;
-	const char * const *modules;
-	const struct software_node *bat_swnode;
-	struct gpiod_lookup_table * const *gpiod_lookup_tables;
-	const struct x86_i2c_client_info *i2c_client_info;
-	const struct platform_device_info *pdev_info;
-	const struct x86_serdev_info *serdev_info;
-	int i2c_client_count;
-	int pdev_count;
-	int serdev_count;
-	int (*init)(void);
-	void (*exit)(void);
-};
+#include "x86-android-tablets.h"
 
 /* Generic / shared charger / battery settings */
 static const char * const tusb1211_chg_det_psy[] = { "tusb1211-charger-detect" };
@@ -1507,7 +1351,7 @@ static const struct x86_dev_info xiaomi_mipad2_info __initconst = {
 	.i2c_client_count = ARRAY_SIZE(xiaomi_mipad2_i2c_clients),
 };
 
-static const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
+const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
 	{
 		/* Acer Iconia One 7 B1-750 */
 		.matches = {
@@ -1638,247 +1482,3 @@ static const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
 	{ }
 };
 MODULE_DEVICE_TABLE(dmi, x86_android_tablet_ids);
-
-static int i2c_client_count;
-static int pdev_count;
-static int serdev_count;
-static struct i2c_client **i2c_clients;
-static struct platform_device **pdevs;
-static struct serdev_device **serdevs;
-static struct gpiod_lookup_table * const *gpiod_lookup_tables;
-static const struct software_node *bat_swnode;
-static void (*exit_handler)(void);
-
-static __init int x86_instantiate_i2c_client(const struct x86_dev_info *dev_info,
-					     int idx)
-{
-	const struct x86_i2c_client_info *client_info = &dev_info->i2c_client_info[idx];
-	struct i2c_board_info board_info = client_info->board_info;
-	struct i2c_adapter *adap;
-	acpi_handle handle;
-	acpi_status status;
-
-	board_info.irq = x86_acpi_irq_helper_get(&client_info->irq_data);
-	if (board_info.irq < 0)
-		return board_info.irq;
-
-	status = acpi_get_handle(NULL, client_info->adapter_path, &handle);
-	if (ACPI_FAILURE(status)) {
-		pr_err("Error could not get %s handle\n", client_info->adapter_path);
-		return -ENODEV;
-	}
-
-	adap = i2c_acpi_find_adapter_by_handle(handle);
-	if (!adap) {
-		pr_err("error could not get %s adapter\n", client_info->adapter_path);
-		return -ENODEV;
-	}
-
-	i2c_clients[idx] = i2c_new_client_device(adap, &board_info);
-	put_device(&adap->dev);
-	if (IS_ERR(i2c_clients[idx]))
-		return dev_err_probe(&adap->dev, PTR_ERR(i2c_clients[idx]),
-				      "creating I2C-client %d\n", idx);
-
-	return 0;
-}
-
-static __init int x86_instantiate_serdev(const struct x86_serdev_info *info, int idx)
-{
-	struct acpi_device *ctrl_adev, *serdev_adev;
-	struct serdev_device *serdev;
-	struct device *ctrl_dev;
-	int ret = -ENODEV;
-
-	ctrl_adev = acpi_dev_get_first_match_dev(info->ctrl_hid, info->ctrl_uid, -1);
-	if (!ctrl_adev) {
-		pr_err("error could not get %s/%s ctrl adev\n",
-		       info->ctrl_hid, info->ctrl_uid);
-		return -ENODEV;
-	}
-
-	serdev_adev = acpi_dev_get_first_match_dev(info->serdev_hid, NULL, -1);
-	if (!serdev_adev) {
-		pr_err("error could not get %s serdev adev\n", info->serdev_hid);
-		goto put_ctrl_adev;
-	}
-
-	/* get_first_physical_node() returns a weak ref, no need to put() it */
-	ctrl_dev = acpi_get_first_physical_node(ctrl_adev);
-	if (!ctrl_dev)	{
-		pr_err("error could not get %s/%s ctrl physical dev\n",
-		       info->ctrl_hid, info->ctrl_uid);
-		goto put_serdev_adev;
-	}
-
-	/* ctrl_dev now points to the controller's parent, get the controller */
-	ctrl_dev = device_find_child_by_name(ctrl_dev, info->ctrl_devname);
-	if (!ctrl_dev) {
-		pr_err("error could not get %s/%s %s ctrl dev\n",
-		       info->ctrl_hid, info->ctrl_uid, info->ctrl_devname);
-		goto put_serdev_adev;
-	}
-
-	serdev = serdev_device_alloc(to_serdev_controller(ctrl_dev));
-	if (!serdev) {
-		ret = -ENOMEM;
-		goto put_serdev_adev;
-	}
-
-	ACPI_COMPANION_SET(&serdev->dev, serdev_adev);
-	acpi_device_set_enumerated(serdev_adev);
-
-	ret = serdev_device_add(serdev);
-	if (ret) {
-		dev_err(&serdev->dev, "error %d adding serdev\n", ret);
-		serdev_device_put(serdev);
-		goto put_serdev_adev;
-	}
-
-	serdevs[idx] = serdev;
-
-put_serdev_adev:
-	acpi_dev_put(serdev_adev);
-put_ctrl_adev:
-	acpi_dev_put(ctrl_adev);
-	return ret;
-}
-
-static void x86_android_tablet_cleanup(void)
-{
-	int i;
-
-	for (i = 0; i < serdev_count; i++) {
-		if (serdevs[i])
-			serdev_device_remove(serdevs[i]);
-	}
-
-	kfree(serdevs);
-
-	for (i = 0; i < pdev_count; i++)
-		platform_device_unregister(pdevs[i]);
-
-	kfree(pdevs);
-
-	for (i = 0; i < i2c_client_count; i++)
-		i2c_unregister_device(i2c_clients[i]);
-
-	kfree(i2c_clients);
-
-	if (exit_handler)
-		exit_handler();
-
-	for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
-		gpiod_remove_lookup_table(gpiod_lookup_tables[i]);
-
-	software_node_unregister(bat_swnode);
-}
-
-static __init int x86_android_tablet_init(void)
-{
-	const struct x86_dev_info *dev_info;
-	const struct dmi_system_id *id;
-	struct gpio_chip *chip;
-	int i, ret = 0;
-
-	id = dmi_first_match(x86_android_tablet_ids);
-	if (!id)
-		return -ENODEV;
-
-	dev_info = id->driver_data;
-
-	/*
-	 * The broken DSDTs on these devices often also include broken
-	 * _AEI (ACPI Event Interrupt) handlers, disable these.
-	 */
-	if (dev_info->invalid_aei_gpiochip) {
-		chip = gpiochip_find(dev_info->invalid_aei_gpiochip,
-				     gpiochip_find_match_label);
-		if (!chip) {
-			pr_err("error cannot find GPIO chip %s\n", dev_info->invalid_aei_gpiochip);
-			return -ENODEV;
-		}
-		acpi_gpiochip_free_interrupts(chip);
-	}
-
-	/*
-	 * Since this runs from module_init() it cannot use -EPROBE_DEFER,
-	 * instead pre-load any modules which are listed as requirements.
-	 */
-	for (i = 0; dev_info->modules && dev_info->modules[i]; i++)
-		request_module(dev_info->modules[i]);
-
-	bat_swnode = dev_info->bat_swnode;
-	if (bat_swnode) {
-		ret = software_node_register(bat_swnode);
-		if (ret)
-			return ret;
-	}
-
-	gpiod_lookup_tables = dev_info->gpiod_lookup_tables;
-	for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
-		gpiod_add_lookup_table(gpiod_lookup_tables[i]);
-
-	if (dev_info->init) {
-		ret = dev_info->init();
-		if (ret < 0) {
-			x86_android_tablet_cleanup();
-			return ret;
-		}
-		exit_handler = dev_info->exit;
-	}
-
-	i2c_clients = kcalloc(dev_info->i2c_client_count, sizeof(*i2c_clients), GFP_KERNEL);
-	if (!i2c_clients) {
-		x86_android_tablet_cleanup();
-		return -ENOMEM;
-	}
-
-	i2c_client_count = dev_info->i2c_client_count;
-	for (i = 0; i < i2c_client_count; i++) {
-		ret = x86_instantiate_i2c_client(dev_info, i);
-		if (ret < 0) {
-			x86_android_tablet_cleanup();
-			return ret;
-		}
-	}
-
-	pdevs = kcalloc(dev_info->pdev_count, sizeof(*pdevs), GFP_KERNEL);
-	if (!pdevs) {
-		x86_android_tablet_cleanup();
-		return -ENOMEM;
-	}
-
-	pdev_count = dev_info->pdev_count;
-	for (i = 0; i < pdev_count; i++) {
-		pdevs[i] = platform_device_register_full(&dev_info->pdev_info[i]);
-		if (IS_ERR(pdevs[i])) {
-			x86_android_tablet_cleanup();
-			return PTR_ERR(pdevs[i]);
-		}
-	}
-
-	serdevs = kcalloc(dev_info->serdev_count, sizeof(*serdevs), GFP_KERNEL);
-	if (!serdevs) {
-		x86_android_tablet_cleanup();
-		return -ENOMEM;
-	}
-
-	serdev_count = dev_info->serdev_count;
-	for (i = 0; i < serdev_count; i++) {
-		ret = x86_instantiate_serdev(&dev_info->serdev_info[i], i);
-		if (ret < 0) {
-			x86_android_tablet_cleanup();
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
-module_init(x86_android_tablet_init);
-module_exit(x86_android_tablet_cleanup);
-
-MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
-MODULE_DESCRIPTION("X86 Android tablets DSDT fixups driver");
-MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
new file mode 100644
index 000000000000..434353572096
--- /dev/null
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * DMI based code to deal with broken DSDTs on X86 tablets which ship with
+ * Android as (part of) the factory image. The factory kernels shipped on these
+ * devices typically have a bunch of things hardcoded, rather than specified
+ * in their DSDT.
+ *
+ * Copyright (C) 2021-2023 Hans de Goede <hdegoede@redhat.com>
+ */
+#ifndef __PDX86_X86_ANDROID_TABLETS_H
+#define __PDX86_X86_ANDROID_TABLETS_H
+
+#include <linux/i2c.h>
+#include <linux/irqdomain_defs.h>
+
+struct gpio_desc;
+struct gpiod_lookup_table;
+struct platform_device_info;
+struct software_node;
+
+/*
+ * Helpers to get Linux IRQ numbers given a description of the IRQ source
+ * (either IOAPIC index, or GPIO chip name + pin-number).
+ */
+enum x86_acpi_irq_type {
+	X86_ACPI_IRQ_TYPE_NONE,
+	X86_ACPI_IRQ_TYPE_APIC,
+	X86_ACPI_IRQ_TYPE_GPIOINT,
+	X86_ACPI_IRQ_TYPE_PMIC,
+};
+
+struct x86_acpi_irq_data {
+	char *chip;   /* GPIO chip label (GPIOINT) or PMIC ACPI path (PMIC) */
+	enum x86_acpi_irq_type type;
+	enum irq_domain_bus_token domain;
+	int index;
+	int trigger;  /* ACPI_EDGE_SENSITIVE / ACPI_LEVEL_SENSITIVE */
+	int polarity; /* ACPI_ACTIVE_HIGH / ACPI_ACTIVE_LOW / ACPI_ACTIVE_BOTH */
+};
+
+/* Structs to describe devices to instantiate */
+struct x86_i2c_client_info {
+	struct i2c_board_info board_info;
+	char *adapter_path;
+	struct x86_acpi_irq_data irq_data;
+};
+
+struct x86_serdev_info {
+	const char *ctrl_hid;
+	const char *ctrl_uid;
+	const char *ctrl_devname;
+	/*
+	 * ATM the serdev core only supports of or ACPI matching; and sofar all
+	 * Android x86 tablets DSDTs have usable serdev nodes, but sometimes
+	 * under the wrong controller. So we just tie the existing serdev ACPI
+	 * node to the right controller.
+	 */
+	const char *serdev_hid;
+};
+
+struct x86_dev_info {
+	char *invalid_aei_gpiochip;
+	const char * const *modules;
+	const struct software_node *bat_swnode;
+	struct gpiod_lookup_table * const *gpiod_lookup_tables;
+	const struct x86_i2c_client_info *i2c_client_info;
+	const struct platform_device_info *pdev_info;
+	const struct x86_serdev_info *serdev_info;
+	int i2c_client_count;
+	int pdev_count;
+	int serdev_count;
+	int (*init)(void);
+	void (*exit)(void);
+};
+
+int x86_android_tablet_get_gpiod(const char *label, int pin, struct gpio_desc **desc);
+int x86_acpi_irq_helper_get(const struct x86_acpi_irq_data *data);
+
+#endif
-- 
2.39.1

