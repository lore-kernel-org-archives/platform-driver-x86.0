Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F28C7EE32
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 09:24:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjCAJYg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 04:24:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjCAJYc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 04:24:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 246BE32E7A
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 01:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677662626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D2wf+Gixu6g7HQS3XbMYi4WxZ2Nv+mUUA1USqjWjgNI=;
        b=itPE514MOpPj3a2U6fcFO8LO1aAUq3C1zAw1xAgm/0EwJPdYvBq2YXktk42Fnxuw8UirFw
        wE3ztGj9txqgzMrfBmq4erOXj5fT4vHSXF7hW2qJHIsraQi26cTSvlUa2DirrIqCpqST1S
        2Yysxjf4thcPAwtaf5DCwQxz9bs830k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-dyvAysv2OPKeGdq1hP28ow-1; Wed, 01 Mar 2023 04:23:43 -0500
X-MC-Unique: dyvAysv2OPKeGdq1hP28ow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C646718A6462;
        Wed,  1 Mar 2023 09:23:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.30])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 25448400D796;
        Wed,  1 Mar 2023 09:23:42 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 05/14] platform/x86: x86-android-tablets: Move shared power-supply fw-nodes to a separate file
Date:   Wed,  1 Mar 2023 10:23:22 +0100
Message-Id: <20230301092331.7038-6-hdegoede@redhat.com>
In-Reply-To: <20230301092331.7038-1-hdegoede@redhat.com>
References: <20230301092331.7038-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Move the shared power-supply fw-nodes and related files to
a new separate shared-psy-info.c file.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Use GPL-2.0-or-later for SPDX identifier
- Use struct forward declarations in shared-psy-info.h
  instead of bringing in a bunch of headers
- Prefix the define guarding against multiple inclusions with PDX86_
---
 .../platform/x86/x86-android-tablets/Makefile |   2 +-
 .../x86/x86-android-tablets/shared-psy-info.c | 101 ++++++++++++++++++
 .../x86/x86-android-tablets/shared-psy-info.h |  32 ++++++
 .../x86-android-tablets-main.c                | 101 ++----------------
 4 files changed, 143 insertions(+), 93 deletions(-)
 create mode 100644 drivers/platform/x86/x86-android-tablets/shared-psy-info.c
 create mode 100644 drivers/platform/x86/x86-android-tablets/shared-psy-info.h

diff --git a/drivers/platform/x86/x86-android-tablets/Makefile b/drivers/platform/x86/x86-android-tablets/Makefile
index 230683cdd5be..d4e0da886790 100644
--- a/drivers/platform/x86/x86-android-tablets/Makefile
+++ b/drivers/platform/x86/x86-android-tablets/Makefile
@@ -5,4 +5,4 @@
 
 obj-$(CONFIG_X86_ANDROID_TABLETS) += x86-android-tablets.o
 
-x86-android-tablets-y := core.o dmi.o x86-android-tablets-main.o
+x86-android-tablets-y := core.o dmi.o shared-psy-info.o x86-android-tablets-main.o
diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.c b/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
new file mode 100644
index 000000000000..9a16cbf62b8c
--- /dev/null
+++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Shared psy info for X86 tablets which ship with Android as the factory image
+ * and which have broken DSDT tables. The factory kernels shipped on these
+ * devices typically have a bunch of things hardcoded, rather than specified
+ * in their DSDT.
+ *
+ * Copyright (C) 2021-2023 Hans de Goede <hdegoede@redhat.com>
+ */
+
+#include <linux/gpio/machine.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/power/bq24190_charger.h>
+#include <linux/property.h>
+#include <linux/regulator/machine.h>
+
+#include "shared-psy-info.h"
+
+/* Generic / shared charger / battery settings */
+const char * const tusb1211_chg_det_psy[] = { "tusb1211-charger-detect" };
+const char * const bq24190_psy[] = { "bq24190-charger" };
+const char * const bq25890_psy[] = { "bq25890-charger-0" };
+
+static const struct property_entry fg_bq24190_supply_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq24190_psy),
+	{ }
+};
+
+const struct software_node fg_bq24190_supply_node = {
+	.properties = fg_bq24190_supply_props,
+};
+
+static const struct property_entry fg_bq25890_supply_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq25890_psy),
+	{ }
+};
+
+const struct software_node fg_bq25890_supply_node = {
+	.properties = fg_bq25890_supply_props,
+};
+
+/* LiPo HighVoltage (max 4.35V) settings used by most devs with a HV bat. */
+static const struct property_entry generic_lipo_hv_4v35_battery_props[] = {
+	PROPERTY_ENTRY_STRING("compatible", "simple-battery"),
+	PROPERTY_ENTRY_STRING("device-chemistry", "lithium-ion"),
+	PROPERTY_ENTRY_U32("precharge-current-microamp", 256000),
+	PROPERTY_ENTRY_U32("charge-term-current-microamp", 128000),
+	PROPERTY_ENTRY_U32("constant-charge-current-max-microamp", 1856000),
+	PROPERTY_ENTRY_U32("constant-charge-voltage-max-microvolt", 4352000),
+	PROPERTY_ENTRY_U32("factory-internal-resistance-micro-ohms", 150000),
+	{ }
+};
+
+const struct software_node generic_lipo_hv_4v35_battery_node = {
+	.properties = generic_lipo_hv_4v35_battery_props,
+};
+
+/* For enabling the bq24190 5V boost based on id-pin */
+static struct regulator_consumer_supply intel_int3496_consumer = {
+	.supply = "vbus",
+	.dev_name = "intel-int3496",
+};
+
+static const struct regulator_init_data bq24190_vbus_init_data = {
+	.constraints = {
+		.name = "bq24190_vbus",
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.consumer_supplies = &intel_int3496_consumer,
+	.num_consumer_supplies = 1,
+};
+
+struct bq24190_platform_data bq24190_pdata = {
+	.regulator_init_data = &bq24190_vbus_init_data,
+};
+
+const char * const bq24190_modules[] __initconst = {
+	"intel_crystal_cove_charger", /* For the bq24190 IRQ */
+	"bq24190_charger",            /* For the Vbus regulator for intel-int3496 */
+	NULL
+};
+
+/* Generic pdevs array and gpio-lookups for micro USB ID pin handling */
+const struct platform_device_info int3496_pdevs[] __initconst = {
+	{
+		/* For micro USB ID pin handling */
+		.name = "intel-int3496",
+		.id = PLATFORM_DEVID_NONE,
+	},
+};
+
+struct gpiod_lookup_table int3496_reference_gpios = {
+	.dev_id = "intel-int3496",
+	.table = {
+		GPIO_LOOKUP("INT33FC:01", 15, "vbus", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("INT33FC:02", 1, "mux", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("INT33FC:02", 18, "id", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
new file mode 100644
index 000000000000..c2d2968cddc2
--- /dev/null
+++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Shared psy info for X86 tablets which ship with Android as the factory image
+ * and which have broken DSDT tables. The factory kernels shipped on these
+ * devices typically have a bunch of things hardcoded, rather than specified
+ * in their DSDT.
+ *
+ * Copyright (C) 2021-2023 Hans de Goede <hdegoede@redhat.com>
+ */
+#ifndef __PDX86_SHARED_PSY_INFO_H
+#define __PDX86_SHARED_PSY_INFO_H
+
+struct bq24190_platform_data;
+struct gpiod_lookup_table;
+struct platform_device_info;
+struct software_node;
+
+extern const char * const tusb1211_chg_det_psy[];
+extern const char * const bq24190_psy[];
+extern const char * const bq25890_psy[];
+
+extern const struct software_node fg_bq24190_supply_node;
+extern const struct software_node fg_bq25890_supply_node;
+extern const struct software_node generic_lipo_hv_4v35_battery_node;
+
+extern struct bq24190_platform_data bq24190_pdata;
+extern const char * const bq24190_modules[];
+
+extern const struct platform_device_info int3496_pdevs[];
+extern struct gpiod_lookup_table int3496_reference_gpios;
+
+#endif
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c b/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
index 4456cf5a2299..225502794a89 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
@@ -19,86 +19,13 @@
 #include <linux/pinctrl/machine.h>
 #include <linux/platform_data/lp855x.h>
 #include <linux/platform_device.h>
-#include <linux/power/bq24190_charger.h>
 #include <linux/reboot.h>
 #include <linux/rmi.h>
 #include <linux/spi/spi.h>
 
+#include "shared-psy-info.h"
 #include "x86-android-tablets.h"
 
-/* Generic / shared charger / battery settings */
-static const char * const tusb1211_chg_det_psy[] = { "tusb1211-charger-detect" };
-static const char * const bq24190_psy[] = { "bq24190-charger" };
-static const char * const bq25890_psy[] = { "bq25890-charger-0" };
-
-static const struct property_entry fg_bq24190_supply_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq24190_psy),
-	{ }
-};
-
-static const struct software_node fg_bq24190_supply_node = {
-	.properties = fg_bq24190_supply_props,
-};
-
-static const struct property_entry fg_bq25890_supply_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq25890_psy),
-	{ }
-};
-
-static const struct software_node fg_bq25890_supply_node = {
-	.properties = fg_bq25890_supply_props,
-};
-
-/* LiPo HighVoltage (max 4.35V) settings used by most devs with a HV bat. */
-static const struct property_entry generic_lipo_hv_4v35_battery_props[] = {
-	PROPERTY_ENTRY_STRING("compatible", "simple-battery"),
-	PROPERTY_ENTRY_STRING("device-chemistry", "lithium-ion"),
-	PROPERTY_ENTRY_U32("precharge-current-microamp", 256000),
-	PROPERTY_ENTRY_U32("charge-term-current-microamp", 128000),
-	PROPERTY_ENTRY_U32("constant-charge-current-max-microamp", 1856000),
-	PROPERTY_ENTRY_U32("constant-charge-voltage-max-microvolt", 4352000),
-	PROPERTY_ENTRY_U32("factory-internal-resistance-micro-ohms", 150000),
-	{ }
-};
-
-static const struct software_node generic_lipo_hv_4v35_battery_node = {
-	.properties = generic_lipo_hv_4v35_battery_props,
-};
-
-/* For enabling the bq24190 5V boost based on id-pin */
-static struct regulator_consumer_supply intel_int3496_consumer = {
-	.supply = "vbus",
-	.dev_name = "intel-int3496",
-};
-
-static const struct regulator_init_data bq24190_vbus_init_data = {
-	.constraints = {
-		.name = "bq24190_vbus",
-		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
-	},
-	.consumer_supplies = &intel_int3496_consumer,
-	.num_consumer_supplies = 1,
-};
-
-static struct bq24190_platform_data bq24190_pdata = {
-	.regulator_init_data = &bq24190_vbus_init_data,
-};
-
-static const char * const bq24190_modules[] __initconst = {
-	"intel_crystal_cove_charger", /* For the bq24190 IRQ */
-	"bq24190_charger",            /* For the Vbus regulator for intel-int3496 */
-	NULL
-};
-
-/* Generic pdevs array and gpio-lookups for micro USB ID pin handling */
-static const struct platform_device_info int3496_pdevs[] __initconst = {
-	{
-		/* For micro USB ID pin handling */
-		.name = "intel-int3496",
-		.id = PLATFORM_DEVID_NONE,
-	},
-};
-
 static struct gpiod_lookup_table int3496_gpo2_pin22_gpios = {
 	.dev_id = "intel-int3496",
 	.table = {
@@ -107,16 +34,6 @@ static struct gpiod_lookup_table int3496_gpo2_pin22_gpios = {
 	},
 };
 
-static struct gpiod_lookup_table int3496_reference_gpios = {
-	.dev_id = "intel-int3496",
-	.table = {
-		GPIO_LOOKUP("INT33FC:01", 15, "vbus", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("INT33FC:02", 1, "mux", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("INT33FC:02", 18, "id", GPIO_ACTIVE_HIGH),
-		{ }
-	},
-};
-
 /* Acer Iconia One 7 B1-750 has an Android factory img with everything hardcoded */
 static const char * const acer_b1_750_mount_matrix[] = {
 	"-1", "0", "0",
@@ -185,7 +102,7 @@ const struct x86_dev_info acer_b1_750_info __initconst = {
 	.i2c_client_info = acer_b1_750_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(acer_b1_750_i2c_clients),
 	.pdev_info = int3496_pdevs,
-	.pdev_count = ARRAY_SIZE(int3496_pdevs),
+	.pdev_count = 1,
 	.gpiod_lookup_tables = acer_b1_750_gpios,
 };
 
@@ -301,7 +218,7 @@ static const struct software_node asus_me176c_accel_node = {
 };
 
 static const struct property_entry asus_me176c_bq24190_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", tusb1211_chg_det_psy),
+	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", tusb1211_chg_det_psy, 1),
 	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_hv_4v35_battery_node),
 	PROPERTY_ENTRY_U32("ti,system-minimum-microvolt", 3600000),
 	PROPERTY_ENTRY_BOOL("omit-battery-class"),
@@ -314,7 +231,7 @@ static const struct software_node asus_me176c_bq24190_node = {
 };
 
 static const struct property_entry asus_me176c_ug3105_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq24190_psy),
+	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", bq24190_psy, 1),
 	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_hv_4v35_battery_node),
 	PROPERTY_ENTRY_U32("upisemi,rsns-microohm", 10000),
 	{ }
@@ -469,7 +386,7 @@ static const struct software_node asus_tf103c_battery_node = {
 };
 
 static const struct property_entry asus_tf103c_bq24190_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", tusb1211_chg_det_psy),
+	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", tusb1211_chg_det_psy, 1),
 	PROPERTY_ENTRY_REF("monitored-battery", &asus_tf103c_battery_node),
 	PROPERTY_ENTRY_U32("ti,system-minimum-microvolt", 3600000),
 	PROPERTY_ENTRY_BOOL("omit-battery-class"),
@@ -482,7 +399,7 @@ static const struct software_node asus_tf103c_bq24190_node = {
 };
 
 static const struct property_entry asus_tf103c_ug3105_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq24190_psy),
+	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", bq24190_psy, 1),
 	PROPERTY_ENTRY_REF("monitored-battery", &asus_tf103c_battery_node),
 	PROPERTY_ENTRY_U32("upisemi,rsns-microohm", 5000),
 	{ }
@@ -710,7 +627,7 @@ const struct x86_dev_info lenovo_yogabook_x9x_info __initconst = {
 
 /* Lenovo Yoga Tablet 2 1050F/L's Android factory img has everything hardcoded */
 static const struct property_entry lenovo_yoga_tab2_830_1050_bq24190_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", tusb1211_chg_det_psy),
+	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", tusb1211_chg_det_psy, 1),
 	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_hv_4v35_battery_node),
 	PROPERTY_ENTRY_BOOL("omit-battery-class"),
 	PROPERTY_ENTRY_BOOL("disable-reset"),
@@ -818,7 +735,7 @@ struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initdata = {
 	.i2c_client_info = lenovo_yoga_tab2_830_1050_i2c_clients,
 	/* i2c_client_count gets set by lenovo_yoga_tab2_830_1050_init() */
 	.pdev_info = int3496_pdevs,
-	.pdev_count = ARRAY_SIZE(int3496_pdevs),
+	.pdev_count = 1,
 	.gpiod_lookup_tables = lenovo_yoga_tab2_830_1050_gpios,
 	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
 	.modules = bq24190_modules,
@@ -1231,7 +1148,7 @@ const struct x86_dev_info nextbook_ares8_info __initconst = {
 	.i2c_client_info = nextbook_ares8_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(nextbook_ares8_i2c_clients),
 	.pdev_info = int3496_pdevs,
-	.pdev_count = ARRAY_SIZE(int3496_pdevs),
+	.pdev_count = 1,
 	.gpiod_lookup_tables = nextbook_ares8_gpios,
 	.invalid_aei_gpiochip = "INT33FC:02",
 };
-- 
2.39.1

