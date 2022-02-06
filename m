Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E864FC4332F
	for <platform-driver-x86@archiver.kernel.org>; Sun,  6 Feb 2022 22:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236237AbiBFWCi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 6 Feb 2022 17:02:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236378AbiBFWCh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 6 Feb 2022 17:02:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2E4B3C06173B
        for <platform-driver-x86@vger.kernel.org>; Sun,  6 Feb 2022 14:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644184955;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i4ne+wYRzGGZ6nPFgDXkA3r68ym1WPSCBsmkb0LYrns=;
        b=EPJZVSjZwPWZJeaTnCTh0ywjJt0kmtFSlqzf1wOS33u1KAc+2chmNIjDpVlXydgVT5FxYR
        IyEMQXIT7qyzhbUa6GmG+oXrKgxvWKPfP9Btf/dvtqnSvPRv9wQK4o9jQzfvT14/sTnV5F
        E2NoozgOO34Orvr+WcR9aHZwyjAkEBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-QUH_mdUyOGSzHiZigJK7WA-1; Sun, 06 Feb 2022 17:02:33 -0500
X-MC-Unique: QUH_mdUyOGSzHiZigJK7WA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACED61926DA1;
        Sun,  6 Feb 2022 22:02:32 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.35])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BD3841037F5B;
        Sun,  6 Feb 2022 22:02:31 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/4] platform/x86: intel_cht_int33fe: Drop Lenovo Yogabook YB1-X9x code
Date:   Sun,  6 Feb 2022 23:02:19 +0100
Message-Id: <20220206220220.88491-3-hdegoede@redhat.com>
In-Reply-To: <20220206220220.88491-1-hdegoede@redhat.com>
References: <20220206220220.88491-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Move the Lenovo Yogabook YB1-X9x fuel-gauge instantiation code over to
the x86-android-tablets module, which already deals with this for various
other devices.

This removes the need to have a special intel_cht_int33fe_microb module
just for Lenovo Yogabook YB1-X9x laptops.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int33fe/Kconfig    |  18 ++-
 drivers/platform/x86/intel/int33fe/Makefile   |   2 +-
 .../intel/int33fe/intel_cht_int33fe_microb.c  | 106 ------------------
 drivers/platform/x86/x86-android-tablets.c    |  27 +++++
 4 files changed, 35 insertions(+), 118 deletions(-)
 delete mode 100644 drivers/platform/x86/intel/int33fe/intel_cht_int33fe_microb.c

diff --git a/drivers/platform/x86/intel/int33fe/Kconfig b/drivers/platform/x86/intel/int33fe/Kconfig
index 2f7329a2e399..60a6cb689299 100644
--- a/drivers/platform/x86/intel/int33fe/Kconfig
+++ b/drivers/platform/x86/intel/int33fe/Kconfig
@@ -6,19 +6,15 @@ config INTEL_CHT_INT33FE
 	depends on USB_ROLES_INTEL_XHCI=y || (USB_ROLES_INTEL_XHCI=m && m)
 	depends on TYPEC_MUX_PI3USB30532=y || (TYPEC_MUX_PI3USB30532=m && m)
 	help
-	  This driver add support for the INT33FE ACPI device found on
-	  some Intel Cherry Trail devices.
+	  This driver add support for the INT33FE ACPI device found on the
+	  GPD win and the GPD pocket.
 
-	  There are two kinds of INT33FE ACPI device possible: for hardware
-	  with USB Type-C and Micro-B connectors. This driver supports both.
-
-	  The INT33FE ACPI device has a CRS table with I2cSerialBusV2
-	  resources for Fuel Gauge Controller and (in the Type-C variant)
-	  FUSB302 USB Type-C Controller and PI3USB30532 USB switch.
+	  The INT33FE ACPI device on these mini laptops contains I2cSerialBusV2
+	  resources for a MAX17042 Fuel Gauge, FUSB302 USB Type-C Controller
+	  and PI3USB30532 USB switch.
 	  This driver instantiates i2c-clients for these, so that standard
 	  i2c drivers for these chips can bind to the them.
 
 	  If you enable this driver it is advised to also select
-	  CONFIG_BATTERY_BQ27XXX=m or CONFIG_BATTERY_BQ27XXX_I2C=m for Micro-B
-	  device and CONFIG_TYPEC_FUSB302=m and CONFIG_BATTERY_MAX17042=m
-	  for Type-C device.
+	  CONFIG_TYPEC_FUSB302=m, CONFIG_TYPEC_MUX_PI3USB30532=m and
+	  CONFIG_BATTERY_MAX17042=m.
diff --git a/drivers/platform/x86/intel/int33fe/Makefile b/drivers/platform/x86/intel/int33fe/Makefile
index 4672fcbec896..582aa7808c7a 100644
--- a/drivers/platform/x86/intel/int33fe/Makefile
+++ b/drivers/platform/x86/intel/int33fe/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_INTEL_CHT_INT33FE) += intel_cht_int33fe_typec.o intel_cht_int33fe_microb.o
+obj-$(CONFIG_INTEL_CHT_INT33FE) += intel_cht_int33fe_typec.o
diff --git a/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_microb.c b/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_microb.c
deleted file mode 100644
index 6c2feca8a06f..000000000000
--- a/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_microb.c
+++ /dev/null
@@ -1,106 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Intel Cherry Trail ACPI INT33FE pseudo device driver for devices with
- * USB Micro-B connector (e.g. without of FUSB302 USB Type-C controller)
- *
- * Copyright (C) 2019 Yauhen Kharuzhy <jekhor@gmail.com>
- *
- * At least one Intel Cherry Trail based device which ship with Windows 10
- * (Lenovo YogaBook YB1-X91L/F tablet), have this weird INT33FE ACPI device
- * with a CRS table with 2 I2cSerialBusV2 resources, for 2 different chips
- * attached to various i2c busses:
- * 1. The Whiskey Cove PMIC, which is also described by the INT34D3 ACPI device
- * 2. TI BQ27542 Fuel Gauge Controller
- *
- * So this driver is a stub / pseudo driver whose only purpose is to
- * instantiate i2c-client for battery fuel gauge, so that standard i2c driver
- * for these chip can bind to the it.
- */
-
-#include <linux/acpi.h>
-#include <linux/dmi.h>
-#include <linux/i2c.h>
-#include <linux/module.h>
-#include <linux/pci.h>
-#include <linux/platform_device.h>
-#include <linux/regulator/consumer.h>
-#include <linux/slab.h>
-#include <linux/usb/pd.h>
-
-struct cht_int33fe_data {
-	struct i2c_client *battery_fg;
-};
-
-static const char * const bq27xxx_suppliers[] = { "bq25890-charger" };
-
-static const struct property_entry bq27xxx_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq27xxx_suppliers),
-	{ }
-};
-
-static const struct software_node bq27xxx_node = {
-	.properties = bq27xxx_props,
-};
-
-static const struct dmi_system_id cht_int33fe_microb_ids[] = {
-	{
-		/* Lenovo Yoga Book X90F / X91F / X91L */
-		.matches = {
-			/* Non exact match to match all versions */
-			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X9"),
-		},
-	},
-	{ }
-};
-MODULE_DEVICE_TABLE(dmi, cht_int33fe_microb_ids);
-
-static int cht_int33fe_microb_probe(struct platform_device *pdev)
-{
-	struct i2c_board_info board_info;
-	struct device *dev = &pdev->dev;
-	struct cht_int33fe_data *data;
-
-	if (!dmi_check_system(cht_int33fe_microb_ids))
-		return -ENODEV;
-
-	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	memset(&board_info, 0, sizeof(board_info));
-	strscpy(board_info.type, "bq27542", ARRAY_SIZE(board_info.type));
-	board_info.dev_name = "bq27542";
-	board_info.swnode = &bq27xxx_node;
-	data->battery_fg = i2c_acpi_new_device(dev, 1, &board_info);
-
-	return PTR_ERR_OR_ZERO(data->battery_fg);
-}
-
-static int cht_int33fe_microb_remove(struct platform_device *pdev)
-{
-	struct cht_int33fe_data *data = platform_get_drvdata(pdev);
-
-	i2c_unregister_device(data->battery_fg);
-
-	return 0;
-}
-
-static const struct acpi_device_id cht_int33fe_acpi_ids[] = {
-	{ "INT33FE", },
-	{ }
-};
-
-static struct platform_driver cht_int33fe_microb_driver = {
-	.driver	= {
-		.name = "Intel Cherry Trail ACPI INT33FE micro-B driver",
-		.acpi_match_table = ACPI_PTR(cht_int33fe_acpi_ids),
-	},
-	.probe = cht_int33fe_microb_probe,
-	.remove = cht_int33fe_microb_remove,
-};
-
-module_platform_driver(cht_int33fe_microb_driver);
-
-MODULE_DESCRIPTION("Intel Cherry Trail ACPI INT33FE micro-B pseudo device driver");
-MODULE_AUTHOR("Yauhen Kharuzhy <jekhor@gmail.com>");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 8e6e4f89220f..f280c82d5ba5 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -679,6 +679,25 @@ static const struct x86_dev_info czc_p10t __initconst = {
 	.init = czc_p10t_init,
 };
 
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
+static const struct x86_dev_info lenovo_yogabook_x9x_info __initconst = {
+	.i2c_client_info = lenovo_yogabook_x9x_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(lenovo_yogabook_x9x_i2c_clients),
+};
+
 /* Nextbook Ares 8 tablets have an Android factory img with everything hardcoded */
 static const char * const nextbook_ares8_accel_mount_matrix[] = {
 	"0", "-1", "0",
@@ -915,6 +934,14 @@ static const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
 		},
 		.driver_data = (void *)&czc_p10t,
 	},
+	{
+		/* Lenovo Yoga Book X90F / X91F / X91L */
+		.matches = {
+			/* Non exact match to match all versions */
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X9"),
+		},
+		.driver_data = (void *)&lenovo_yogabook_x9x_info,
+	},
 	{
 		/* Nextbook Ares 8 */
 		.matches = {
-- 
2.33.1

