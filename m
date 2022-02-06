Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E63C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun,  6 Feb 2022 22:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbiBFWCh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 6 Feb 2022 17:02:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236237AbiBFWCg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 6 Feb 2022 17:02:36 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E0C11C061348
        for <platform-driver-x86@vger.kernel.org>; Sun,  6 Feb 2022 14:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644184953;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5DqV+gz5NqJ1tlFR6JMc9I/F26WxOuOQUbiZ0y/bwK4=;
        b=gMhHnFoJSfaE2o7UsXv0X8dT0MoAMY8nvzqwI2oYcKc4D0Ael32aPWabcg4onqHgPZbLB2
        ar6AgitnpAopZY9x+nz9bvXzWcbocxyvKXvoglTg8xiW888d6m/n7SHJT6DuPGJtmzTPAN
        snGz7IbapzuJOy+GHJAzIP/TgSraOuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-uzRM1ukPPvWqPUPyzHWe8g-1; Sun, 06 Feb 2022 17:02:32 -0500
X-MC-Unique: uzRM1ukPPvWqPUPyzHWe8g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 764CF104;
        Sun,  6 Feb 2022 22:02:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.35])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5F9691037F5B;
        Sun,  6 Feb 2022 22:02:30 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/4] platform/x86: intel_cht_int33fe: Switch to DMI modalias based loading
Date:   Sun,  6 Feb 2022 23:02:18 +0100
Message-Id: <20220206220220.88491-2-hdegoede@redhat.com>
In-Reply-To: <20220206220220.88491-1-hdegoede@redhat.com>
References: <20220206220220.88491-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The intel_cht_int33fe driver is intended to deal with ACPI INT33FE
firmware-nodes on Cherry Trail devices with a Whiskey Cove PMIC.

The original version of the driver only dealt with the GPD win and
GPD pocket boards where the WC PMIC is connected to a TI BQ24292i charger,
paired with a Maxim MAX17047 fuelgauge + a FUSB302 USB Type-C Controller +
a PI3USB30532 USB switch, for a fully functional Type-C port.

Later it was split into a Type-C and a Micro-B variant to deal with
the Lenovo Yoga Book YB1-X90 / Lenovo Yoga Book YB1-X91 boards where
the ACPI INT33FE firmware-node only describes the TI BQ27542 fuelgauge.

Currently the driver differentiates between these 2 models by counting
the number of I2cSerialBus resources in the firmware-node.

There are a number of problems with this approach:

1. The driver autoloads based on the acpi:INT33FE modalias causing it
to get loaded on almost all Bay Trail and Cherry Trail devices. It
checks for the presence of a WC PMIC, so it won't bind but the loading
still wastes time and memory.

2. Both code paths in the driver are really only designed for a single
board and have harcoded various assumptions about these boards, if
another design matching the current checks ever shows up the driver
may end up doing something completely wrong.

Avoid both issues by switching to using DMI based autoloading of
the module, which has neither of these problems.

Note this splits the previous intel_cht_int33fe kernel module into two
modules: intel_cht_int33fe_typec and intel_cht_int33fe_microb, one for
each model.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int33fe/Makefile   |   5 +-
 .../intel/int33fe/intel_cht_int33fe_common.c  | 118 ------------------
 .../intel/int33fe/intel_cht_int33fe_common.h  |  41 ------
 .../intel/int33fe/intel_cht_int33fe_microb.c  |  53 +++++++-
 .../intel/int33fe/intel_cht_int33fe_typec.c   |  65 +++++++++-
 5 files changed, 111 insertions(+), 171 deletions(-)
 delete mode 100644 drivers/platform/x86/intel/int33fe/intel_cht_int33fe_common.c
 delete mode 100644 drivers/platform/x86/intel/int33fe/intel_cht_int33fe_common.h

diff --git a/drivers/platform/x86/intel/int33fe/Makefile b/drivers/platform/x86/intel/int33fe/Makefile
index 9456e3b37f6f..4672fcbec896 100644
--- a/drivers/platform/x86/intel/int33fe/Makefile
+++ b/drivers/platform/x86/intel/int33fe/Makefile
@@ -1,5 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_INTEL_CHT_INT33FE)		+= intel_cht_int33fe.o
-intel_cht_int33fe-y			:= intel_cht_int33fe_common.o \
-					   intel_cht_int33fe_typec.o \
-					   intel_cht_int33fe_microb.o
+obj-$(CONFIG_INTEL_CHT_INT33FE) += intel_cht_int33fe_typec.o intel_cht_int33fe_microb.o
diff --git a/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_common.c b/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_common.c
deleted file mode 100644
index 463222521e61..000000000000
--- a/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_common.c
+++ /dev/null
@@ -1,118 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Common code for Intel Cherry Trail ACPI INT33FE pseudo device drivers
- * (USB Micro-B and Type-C connector variants).
- *
- * Copyright (c) 2019 Yauhen Kharuzhy <jekhor@gmail.com>
- */
-
-#include <linux/acpi.h>
-#include <linux/i2c.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-
-#include "intel_cht_int33fe_common.h"
-
-#define EXPECTED_PTYPE		4
-
-static int cht_int33fe_check_hw_type(struct device *dev)
-{
-	unsigned long long ptyp;
-	acpi_status status;
-	int ret;
-
-	status = acpi_evaluate_integer(ACPI_HANDLE(dev), "PTYP", NULL, &ptyp);
-	if (ACPI_FAILURE(status)) {
-		dev_err(dev, "Error getting PTYPE\n");
-		return -ENODEV;
-	}
-
-	/*
-	 * The same ACPI HID is used for different configurations check PTYP
-	 * to ensure that we are dealing with the expected config.
-	 */
-	if (ptyp != EXPECTED_PTYPE)
-		return -ENODEV;
-
-	/* Check presence of INT34D3 (hardware-rev 3) expected for ptype == 4 */
-	if (!acpi_dev_present("INT34D3", "1", 3)) {
-		dev_err(dev, "Error PTYPE == %d, but no INT34D3 device\n",
-			EXPECTED_PTYPE);
-		return -ENODEV;
-	}
-
-	ret = i2c_acpi_client_count(ACPI_COMPANION(dev));
-	if (ret < 0)
-		return ret;
-
-	switch (ret) {
-	case 2:
-		return INT33FE_HW_MICROB;
-	case 4:
-		return INT33FE_HW_TYPEC;
-	default:
-		return -ENODEV;
-	}
-}
-
-static int cht_int33fe_probe(struct platform_device *pdev)
-{
-	struct cht_int33fe_data *data;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	ret = cht_int33fe_check_hw_type(dev);
-	if (ret < 0)
-		return ret;
-
-	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	data->dev = dev;
-
-	switch (ret) {
-	case INT33FE_HW_MICROB:
-		data->probe = cht_int33fe_microb_probe;
-		data->remove = cht_int33fe_microb_remove;
-		break;
-
-	case INT33FE_HW_TYPEC:
-		data->probe = cht_int33fe_typec_probe;
-		data->remove = cht_int33fe_typec_remove;
-		break;
-	}
-
-	platform_set_drvdata(pdev, data);
-
-	return data->probe(data);
-}
-
-static int cht_int33fe_remove(struct platform_device *pdev)
-{
-	struct cht_int33fe_data *data = platform_get_drvdata(pdev);
-
-	return data->remove(data);
-}
-
-static const struct acpi_device_id cht_int33fe_acpi_ids[] = {
-	{ "INT33FE", },
-	{ }
-};
-MODULE_DEVICE_TABLE(acpi, cht_int33fe_acpi_ids);
-
-static struct platform_driver cht_int33fe_driver = {
-	.driver	= {
-		.name = "Intel Cherry Trail ACPI INT33FE driver",
-		.acpi_match_table = ACPI_PTR(cht_int33fe_acpi_ids),
-	},
-	.probe = cht_int33fe_probe,
-	.remove = cht_int33fe_remove,
-};
-
-module_platform_driver(cht_int33fe_driver);
-
-MODULE_DESCRIPTION("Intel Cherry Trail ACPI INT33FE pseudo device driver");
-MODULE_AUTHOR("Yauhen Kharuzhy <jekhor@gmail.com>");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_common.h b/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_common.h
deleted file mode 100644
index 03cd45f4e8cb..000000000000
--- a/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_common.h
+++ /dev/null
@@ -1,41 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Common code for Intel Cherry Trail ACPI INT33FE pseudo device drivers
- * (USB Micro-B and Type-C connector variants), header file
- *
- * Copyright (c) 2019 Yauhen Kharuzhy <jekhor@gmail.com>
- */
-
-#ifndef _INTEL_CHT_INT33FE_COMMON_H
-#define _INTEL_CHT_INT33FE_COMMON_H
-
-#include <linux/device.h>
-#include <linux/fwnode.h>
-#include <linux/i2c.h>
-
-enum int33fe_hw_type {
-	INT33FE_HW_MICROB,
-	INT33FE_HW_TYPEC,
-};
-
-struct cht_int33fe_data {
-	struct device *dev;
-
-	int (*probe)(struct cht_int33fe_data *data);
-	int (*remove)(struct cht_int33fe_data *data);
-
-	struct i2c_client *battery_fg;
-
-	/* Type-C only */
-	struct i2c_client *fusb302;
-	struct i2c_client *pi3usb30532;
-
-	struct fwnode_handle *dp;
-};
-
-int cht_int33fe_microb_probe(struct cht_int33fe_data *data);
-int cht_int33fe_microb_remove(struct cht_int33fe_data *data);
-int cht_int33fe_typec_probe(struct cht_int33fe_data *data);
-int cht_int33fe_typec_remove(struct cht_int33fe_data *data);
-
-#endif /* _INTEL_CHT_INT33FE_COMMON_H */
diff --git a/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_microb.c b/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_microb.c
index 673f41cd14b5..6c2feca8a06f 100644
--- a/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_microb.c
+++ b/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_microb.c
@@ -18,6 +18,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/dmi.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -26,7 +27,9 @@
 #include <linux/slab.h>
 #include <linux/usb/pd.h>
 
-#include "intel_cht_int33fe_common.h"
+struct cht_int33fe_data {
+	struct i2c_client *battery_fg;
+};
 
 static const char * const bq27xxx_suppliers[] = { "bq25890-charger" };
 
@@ -39,10 +42,30 @@ static const struct software_node bq27xxx_node = {
 	.properties = bq27xxx_props,
 };
 
-int cht_int33fe_microb_probe(struct cht_int33fe_data *data)
+static const struct dmi_system_id cht_int33fe_microb_ids[] = {
+	{
+		/* Lenovo Yoga Book X90F / X91F / X91L */
+		.matches = {
+			/* Non exact match to match all versions */
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X9"),
+		},
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(dmi, cht_int33fe_microb_ids);
+
+static int cht_int33fe_microb_probe(struct platform_device *pdev)
 {
-	struct device *dev = data->dev;
 	struct i2c_board_info board_info;
+	struct device *dev = &pdev->dev;
+	struct cht_int33fe_data *data;
+
+	if (!dmi_check_system(cht_int33fe_microb_ids))
+		return -ENODEV;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
 
 	memset(&board_info, 0, sizeof(board_info));
 	strscpy(board_info.type, "bq27542", ARRAY_SIZE(board_info.type));
@@ -53,9 +76,31 @@ int cht_int33fe_microb_probe(struct cht_int33fe_data *data)
 	return PTR_ERR_OR_ZERO(data->battery_fg);
 }
 
-int cht_int33fe_microb_remove(struct cht_int33fe_data *data)
+static int cht_int33fe_microb_remove(struct platform_device *pdev)
 {
+	struct cht_int33fe_data *data = platform_get_drvdata(pdev);
+
 	i2c_unregister_device(data->battery_fg);
 
 	return 0;
 }
+
+static const struct acpi_device_id cht_int33fe_acpi_ids[] = {
+	{ "INT33FE", },
+	{ }
+};
+
+static struct platform_driver cht_int33fe_microb_driver = {
+	.driver	= {
+		.name = "Intel Cherry Trail ACPI INT33FE micro-B driver",
+		.acpi_match_table = ACPI_PTR(cht_int33fe_acpi_ids),
+	},
+	.probe = cht_int33fe_microb_probe,
+	.remove = cht_int33fe_microb_remove,
+};
+
+module_platform_driver(cht_int33fe_microb_driver);
+
+MODULE_DESCRIPTION("Intel Cherry Trail ACPI INT33FE micro-B pseudo device driver");
+MODULE_AUTHOR("Yauhen Kharuzhy <jekhor@gmail.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_typec.c b/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_typec.c
index d59544167430..0de509fbf020 100644
--- a/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_typec.c
+++ b/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_typec.c
@@ -17,6 +17,7 @@
  * for these chips can bind to the them.
  */
 
+#include <linux/dmi.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/pci.h>
@@ -26,7 +27,12 @@
 #include <linux/slab.h>
 #include <linux/usb/pd.h>
 
-#include "intel_cht_int33fe_common.h"
+struct cht_int33fe_data {
+	struct i2c_client *battery_fg;
+	struct i2c_client *fusb302;
+	struct i2c_client *pi3usb30532;
+	struct fwnode_handle *dp;
+};
 
 /*
  * Grrr, I severely dislike buggy BIOS-es. At least one BIOS enumerates
@@ -272,15 +278,44 @@ cht_int33fe_register_max17047(struct device *dev, struct cht_int33fe_data *data)
 	return PTR_ERR_OR_ZERO(data->battery_fg);
 }
 
-int cht_int33fe_typec_probe(struct cht_int33fe_data *data)
+static const struct dmi_system_id cht_int33fe_typec_ids[] = {
+	{
+		/*
+		 * GPD win / GPD pocket mini laptops
+		 *
+		 * This DMI match may not seem unique, but it is. In the 67000+
+		 * DMI decode dumps from linux-hardware.org only 116 have
+		 * board_vendor set to "AMI Corporation" and of those 116 only
+		 * the GPD win's and pocket's board_name is "Default string".
+		 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "Default string"),
+			DMI_EXACT_MATCH(DMI_BOARD_SERIAL, "Default string"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Default string"),
+		},
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(dmi, cht_int33fe_typec_ids);
+
+static int cht_int33fe_typec_probe(struct platform_device *pdev)
 {
-	struct device *dev = data->dev;
 	struct i2c_board_info board_info;
+	struct device *dev = &pdev->dev;
+	struct cht_int33fe_data *data;
 	struct fwnode_handle *fwnode;
 	struct regulator *regulator;
 	int fusb302_irq;
 	int ret;
 
+	if (!dmi_check_system(cht_int33fe_typec_ids))
+		return -ENODEV;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
 	/*
 	 * We expect the WC PMIC to be paired with a TI bq24292i charger-IC.
 	 * We check for the bq24292i vbus regulator here, this has 2 purposes:
@@ -368,8 +403,10 @@ int cht_int33fe_typec_probe(struct cht_int33fe_data *data)
 	return ret;
 }
 
-int cht_int33fe_typec_remove(struct cht_int33fe_data *data)
+static int cht_int33fe_typec_remove(struct platform_device *pdev)
 {
+	struct cht_int33fe_data *data = platform_get_drvdata(pdev);
+
 	i2c_unregister_device(data->pi3usb30532);
 	i2c_unregister_device(data->fusb302);
 	i2c_unregister_device(data->battery_fg);
@@ -378,3 +415,23 @@ int cht_int33fe_typec_remove(struct cht_int33fe_data *data)
 
 	return 0;
 }
+
+static const struct acpi_device_id cht_int33fe_acpi_ids[] = {
+	{ "INT33FE", },
+	{ }
+};
+
+static struct platform_driver cht_int33fe_typec_driver = {
+	.driver	= {
+		.name = "Intel Cherry Trail ACPI INT33FE Type-C driver",
+		.acpi_match_table = ACPI_PTR(cht_int33fe_acpi_ids),
+	},
+	.probe = cht_int33fe_typec_probe,
+	.remove = cht_int33fe_typec_remove,
+};
+
+module_platform_driver(cht_int33fe_typec_driver);
+
+MODULE_DESCRIPTION("Intel Cherry Trail ACPI INT33FE Type-C pseudo device driver");
+MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.33.1

