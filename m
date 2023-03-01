Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B853EC64ED6
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 09:24:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbjCAJYd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 04:24:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjCAJYc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 04:24:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B8C3253C
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 01:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677662625;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TEgLOfHnsJE8Lkv8HVUpwwr90gMK/ciUDfIZTJtpZ8g=;
        b=EL1YObn5YOYM5p62PkxhUj0z6u6jpMkJ+b0J0UfJ8KQevoQfDDM/r2qK5hRqCrAM2wU3bQ
        znqL9JBlpSbPEPEnPqoePleYjlFmylcTJrEhl5b/Ic3jTskjuwv2DBlV6PuCAcNqR0SY+u
        RshR9yHdcBQj41OhJkRsFQPmzHvl9ec=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-KYfPydrmPoOtGBHYaBzsmQ-1; Wed, 01 Mar 2023 04:23:42 -0500
X-MC-Unique: KYfPydrmPoOtGBHYaBzsmQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5F57811E9C;
        Wed,  1 Mar 2023 09:23:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.30])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 428ED400D796;
        Wed,  1 Mar 2023 09:23:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 04/14] platform/x86: x86-android-tablets: Move DMI match table into its own dmi.c file
Date:   Wed,  1 Mar 2023 10:23:21 +0100
Message-Id: <20230301092331.7038-5-hdegoede@redhat.com>
In-Reply-To: <20230301092331.7038-1-hdegoede@redhat.com>
References: <20230301092331.7038-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

In order to have a single MODULE_DEVICE_TABLE(dmi, ...), while allowing
splitting the board descriptions into multiple files, add a new separate
file for the DMI match table.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Use GPL-2.0-or-later for SPDX identifier
- Move extern declarations for x86_dev_info structs to .h file
---
 .../platform/x86/x86-android-tablets/Makefile |   2 +-
 .../platform/x86/x86-android-tablets/core.c   |   2 -
 .../platform/x86/x86-android-tablets/dmi.c    | 146 ++++++++++++++++
 .../x86-android-tablets-main.c                | 160 ++----------------
 .../x86-android-tablets/x86-android-tablets.h |  20 +++
 5 files changed, 180 insertions(+), 150 deletions(-)
 create mode 100644 drivers/platform/x86/x86-android-tablets/dmi.c

diff --git a/drivers/platform/x86/x86-android-tablets/Makefile b/drivers/platform/x86/x86-android-tablets/Makefile
index 34016df3e54a..230683cdd5be 100644
--- a/drivers/platform/x86/x86-android-tablets/Makefile
+++ b/drivers/platform/x86/x86-android-tablets/Makefile
@@ -5,4 +5,4 @@
 
 obj-$(CONFIG_X86_ANDROID_TABLETS) += x86-android-tablets.o
 
-x86-android-tablets-y := core.o x86-android-tablets-main.o
+x86-android-tablets-y := core.o dmi.o x86-android-tablets-main.o
diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index ddd24881f392..779d49c66987 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -253,8 +253,6 @@ static void x86_android_tablet_cleanup(void)
 	software_node_unregister(bat_swnode);
 }
 
-extern const struct dmi_system_id x86_android_tablet_ids[];
-
 static __init int x86_android_tablet_init(void)
 {
 	const struct x86_dev_info *dev_info;
diff --git a/drivers/platform/x86/x86-android-tablets/dmi.c b/drivers/platform/x86/x86-android-tablets/dmi.c
new file mode 100644
index 000000000000..716b285f0afd
--- /dev/null
+++ b/drivers/platform/x86/x86-android-tablets/dmi.c
@@ -0,0 +1,146 @@
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
+#include <linux/dmi.h>
+#include <linux/mod_devicetable.h>
+
+#include "x86-android-tablets.h"
+
+const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
+	{
+		/* Acer Iconia One 7 B1-750 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "VESPA2"),
+		},
+		.driver_data = (void *)&acer_b1_750_info,
+	},
+	{
+		/* Advantech MICA-071 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Advantech"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MICA-071"),
+		},
+		.driver_data = (void *)&advantech_mica_071_info,
+	},
+	{
+		/* Asus MeMO Pad 7 ME176C */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ME176C"),
+		},
+		.driver_data = (void *)&asus_me176c_info,
+	},
+	{
+		/* Asus TF103C */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TF103C"),
+		},
+		.driver_data = (void *)&asus_tf103c_info,
+	},
+	{
+		/* Chuwi Hi8 (CWI509) */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
+			DMI_MATCH(DMI_BOARD_NAME, "BYT-PA03C"),
+			DMI_MATCH(DMI_SYS_VENDOR, "ilife"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "S806"),
+		},
+		.driver_data = (void *)&chuwi_hi8_info,
+	},
+	{
+		/* CZC P10T */
+		.ident = "CZC ODEON TPC-10 (\"P10T\")",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "CZC"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ODEON*TPC-10"),
+		},
+		.driver_data = (void *)&czc_p10t,
+	},
+	{
+		/* CZC P10T variant */
+		.ident = "ViewSonic ViewPad 10",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ViewSonic"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "VPAD10"),
+		},
+		.driver_data = (void *)&czc_p10t,
+	},
+	{
+		/* Lenovo Yoga Book X90F / X91F / X91L */
+		.matches = {
+			/* Non exact match to match all versions */
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X9"),
+		},
+		.driver_data = (void *)&lenovo_yogabook_x9x_info,
+	},
+	{
+		/*
+		 * Lenovo Yoga Tablet 2 830F/L or 1050F/L (The 8" and 10"
+		 * Lenovo Yoga Tablet 2 use the same mainboard)
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corp."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "VALLEYVIEW C0 PLATFORM"),
+			DMI_MATCH(DMI_BOARD_NAME, "BYT-T FFD8"),
+			/* Partial match on beginning of BIOS version */
+			DMI_MATCH(DMI_BIOS_VERSION, "BLADE_21"),
+		},
+		.driver_data = (void *)&lenovo_yoga_tab2_830_1050_info,
+	},
+	{
+		/* Lenovo Yoga Tab 3 Pro YT3-X90F */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
+		},
+		.driver_data = (void *)&lenovo_yt3_info,
+	},
+	{
+		/* Medion Lifetab S10346 */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
+			/* Above strings are much too generic, also match on BIOS date */
+			DMI_MATCH(DMI_BIOS_DATE, "10/22/2015"),
+		},
+		.driver_data = (void *)&medion_lifetab_s10346_info,
+	},
+	{
+		/* Nextbook Ares 8 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "M890BAP"),
+		},
+		.driver_data = (void *)&nextbook_ares8_info,
+	},
+	{
+		/* Whitelabel (sold as various brands) TM800A550L */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
+			/* Above strings are too generic, also match on BIOS version */
+			DMI_MATCH(DMI_BIOS_VERSION, "ZY-8-BI-PX4S70VTR400-X423B-005-D"),
+		},
+		.driver_data = (void *)&whitelabel_tm800a550l_info,
+	},
+	{
+		/* Xiaomi Mi Pad 2 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Xiaomi Inc"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Mipad2"),
+		},
+		.driver_data = (void *)&xiaomi_mipad2_info,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(dmi, x86_android_tablet_ids);
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c b/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
index 7d3012ea7bb5..4456cf5a2299 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
@@ -11,12 +11,10 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
-#include <linux/dmi.h>
 #include <linux/efi.h>
 #include <linux/gpio_keys.h>
 #include <linux/gpio/machine.h>
 #include <linux/input.h>
-#include <linux/mod_devicetable.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/machine.h>
 #include <linux/platform_data/lp855x.h>
@@ -183,7 +181,7 @@ static struct gpiod_lookup_table * const acer_b1_750_gpios[] = {
 	NULL
 };
 
-static const struct x86_dev_info acer_b1_750_info __initconst = {
+const struct x86_dev_info acer_b1_750_info __initconst = {
 	.i2c_client_info = acer_b1_750_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(acer_b1_750_i2c_clients),
 	.pdev_info = int3496_pdevs,
@@ -235,7 +233,7 @@ static int __init advantech_mica_071_init(void)
 	return 0;
 }
 
-static const struct x86_dev_info advantech_mica_071_info __initconst = {
+const struct x86_dev_info advantech_mica_071_info __initconst = {
 	.pdev_info = advantech_mica_071_pdevs,
 	.pdev_count = ARRAY_SIZE(advantech_mica_071_pdevs),
 	.init = advantech_mica_071_init,
@@ -416,7 +414,7 @@ static struct gpiod_lookup_table * const asus_me176c_gpios[] = {
 	NULL
 };
 
-static const struct x86_dev_info asus_me176c_info __initconst = {
+const struct x86_dev_info asus_me176c_info __initconst = {
 	.i2c_client_info = asus_me176c_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(asus_me176c_i2c_clients),
 	.pdev_info = asus_me176c_tf103c_pdevs,
@@ -561,7 +559,7 @@ static struct gpiod_lookup_table * const asus_tf103c_gpios[] = {
 	NULL
 };
 
-static const struct x86_dev_info asus_tf103c_info __initconst = {
+const struct x86_dev_info asus_tf103c_info __initconst = {
 	.i2c_client_info = asus_tf103c_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(asus_tf103c_i2c_clients),
 	.pdev_info = asus_me176c_tf103c_pdevs,
@@ -652,7 +650,7 @@ static int __init chuwi_hi8_init(void)
 	return 0;
 }
 
-static const struct x86_dev_info chuwi_hi8_info __initconst = {
+const struct x86_dev_info chuwi_hi8_info __initconst = {
 	.i2c_client_info = chuwi_hi8_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(chuwi_hi8_i2c_clients),
 	.init = chuwi_hi8_init,
@@ -687,7 +685,7 @@ static int __init czc_p10t_init(void)
 	return 0;
 }
 
-static const struct x86_dev_info czc_p10t __initconst = {
+const struct x86_dev_info czc_p10t __initconst = {
 	.init = czc_p10t_init,
 };
 
@@ -705,7 +703,7 @@ static const struct x86_i2c_client_info lenovo_yogabook_x9x_i2c_clients[] __init
 	},
 };
 
-static const struct x86_dev_info lenovo_yogabook_x9x_info __initconst = {
+const struct x86_dev_info lenovo_yogabook_x9x_info __initconst = {
 	.i2c_client_info = lenovo_yogabook_x9x_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(lenovo_yogabook_x9x_i2c_clients),
 };
@@ -816,7 +814,7 @@ static struct gpiod_lookup_table * const lenovo_yoga_tab2_830_1050_gpios[] = {
 static int __init lenovo_yoga_tab2_830_1050_init(void);
 static void lenovo_yoga_tab2_830_1050_exit(void);
 
-static struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initdata = {
+struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initdata = {
 	.i2c_client_info = lenovo_yoga_tab2_830_1050_i2c_clients,
 	/* i2c_client_count gets set by lenovo_yoga_tab2_830_1050_init() */
 	.pdev_info = int3496_pdevs,
@@ -1081,7 +1079,7 @@ static int __init lenovo_yt3_init(void)
 	return 0;
 }
 
-static const struct x86_dev_info lenovo_yt3_info __initconst = {
+const struct x86_dev_info lenovo_yt3_info __initconst = {
 	.i2c_client_info = lenovo_yt3_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(lenovo_yt3_i2c_clients),
 	.init = lenovo_yt3_init,
@@ -1163,7 +1161,7 @@ static struct gpiod_lookup_table * const medion_lifetab_s10346_gpios[] = {
 	NULL
 };
 
-static const struct x86_dev_info medion_lifetab_s10346_info __initconst = {
+const struct x86_dev_info medion_lifetab_s10346_info __initconst = {
 	.i2c_client_info = medion_lifetab_s10346_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(medion_lifetab_s10346_i2c_clients),
 	.gpiod_lookup_tables = medion_lifetab_s10346_gpios,
@@ -1229,7 +1227,7 @@ static struct gpiod_lookup_table * const nextbook_ares8_gpios[] = {
 	NULL
 };
 
-static const struct x86_dev_info nextbook_ares8_info __initconst = {
+const struct x86_dev_info nextbook_ares8_info __initconst = {
 	.i2c_client_info = nextbook_ares8_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(nextbook_ares8_i2c_clients),
 	.pdev_info = int3496_pdevs,
@@ -1312,7 +1310,7 @@ static struct gpiod_lookup_table * const whitelabel_tm800a550l_gpios[] = {
 	NULL
 };
 
-static const struct x86_dev_info whitelabel_tm800a550l_info __initconst = {
+const struct x86_dev_info whitelabel_tm800a550l_info __initconst = {
 	.i2c_client_info = whitelabel_tm800a550l_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(whitelabel_tm800a550l_i2c_clients),
 	.gpiod_lookup_tables = whitelabel_tm800a550l_gpios,
@@ -1346,139 +1344,7 @@ static const struct x86_i2c_client_info xiaomi_mipad2_i2c_clients[] __initconst
 	},
 };
 
-static const struct x86_dev_info xiaomi_mipad2_info __initconst = {
+const struct x86_dev_info xiaomi_mipad2_info __initconst = {
 	.i2c_client_info = xiaomi_mipad2_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(xiaomi_mipad2_i2c_clients),
 };
-
-const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
-	{
-		/* Acer Iconia One 7 B1-750 */
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "VESPA2"),
-		},
-		.driver_data = (void *)&acer_b1_750_info,
-	},
-	{
-		/* Advantech MICA-071 */
-		.matches = {
-			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Advantech"),
-			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MICA-071"),
-		},
-		.driver_data = (void *)&advantech_mica_071_info,
-	},
-	{
-		/* Asus MeMO Pad 7 ME176C */
-		.matches = {
-			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ME176C"),
-		},
-		.driver_data = (void *)&asus_me176c_info,
-	},
-	{
-		/* Asus TF103C */
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "TF103C"),
-		},
-		.driver_data = (void *)&asus_tf103c_info,
-	},
-	{
-		/* Chuwi Hi8 (CWI509) */
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
-			DMI_MATCH(DMI_BOARD_NAME, "BYT-PA03C"),
-			DMI_MATCH(DMI_SYS_VENDOR, "ilife"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "S806"),
-		},
-		.driver_data = (void *)&chuwi_hi8_info,
-	},
-	{
-		/* CZC P10T */
-		.ident = "CZC ODEON TPC-10 (\"P10T\")",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "CZC"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "ODEON*TPC-10"),
-		},
-		.driver_data = (void *)&czc_p10t,
-	},
-	{
-		/* CZC P10T variant */
-		.ident = "ViewSonic ViewPad 10",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ViewSonic"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "VPAD10"),
-		},
-		.driver_data = (void *)&czc_p10t,
-	},
-	{
-		/* Lenovo Yoga Book X90F / X91F / X91L */
-		.matches = {
-			/* Non exact match to match all versions */
-			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X9"),
-		},
-		.driver_data = (void *)&lenovo_yogabook_x9x_info,
-	},
-	{
-		/*
-		 * Lenovo Yoga Tablet 2 830F/L or 1050F/L (The 8" and 10"
-		 * Lenovo Yoga Tablet 2 use the same mainboard)
-		 */
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corp."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "VALLEYVIEW C0 PLATFORM"),
-			DMI_MATCH(DMI_BOARD_NAME, "BYT-T FFD8"),
-			/* Partial match on beginning of BIOS version */
-			DMI_MATCH(DMI_BIOS_VERSION, "BLADE_21"),
-		},
-		.driver_data = (void *)&lenovo_yoga_tab2_830_1050_info,
-	},
-	{
-		/* Lenovo Yoga Tab 3 Pro YT3-X90F */
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
-		},
-		.driver_data = (void *)&lenovo_yt3_info,
-	},
-	{
-		/* Medion Lifetab S10346 */
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
-			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
-			/* Above strings are much too generic, also match on BIOS date */
-			DMI_MATCH(DMI_BIOS_DATE, "10/22/2015"),
-		},
-		.driver_data = (void *)&medion_lifetab_s10346_info,
-	},
-	{
-		/* Nextbook Ares 8 */
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "M890BAP"),
-		},
-		.driver_data = (void *)&nextbook_ares8_info,
-	},
-	{
-		/* Whitelabel (sold as various brands) TM800A550L */
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
-			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
-			/* Above strings are too generic, also match on BIOS version */
-			DMI_MATCH(DMI_BIOS_VERSION, "ZY-8-BI-PX4S70VTR400-X423B-005-D"),
-		},
-		.driver_data = (void *)&whitelabel_tm800a550l_info,
-	},
-	{
-		/* Xiaomi Mi Pad 2 */
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Xiaomi Inc"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Mipad2"),
-		},
-		.driver_data = (void *)&xiaomi_mipad2_info,
-	},
-	{ }
-};
-MODULE_DEVICE_TABLE(dmi, x86_android_tablet_ids);
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index 434353572096..19994b501903 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -76,4 +76,24 @@ struct x86_dev_info {
 int x86_android_tablet_get_gpiod(const char *label, int pin, struct gpio_desc **desc);
 int x86_acpi_irq_helper_get(const struct x86_acpi_irq_data *data);
 
+/*
+ * Extern declarations of x86_dev_info structs so there can be a single
+ * MODULE_DEVICE_TABLE(dmi, ...), while splitting the board descriptions.
+ */
+extern const struct x86_dev_info acer_b1_750_info;
+extern const struct x86_dev_info advantech_mica_071_info;
+extern const struct x86_dev_info asus_me176c_info;
+extern const struct x86_dev_info asus_tf103c_info;
+extern const struct x86_dev_info chuwi_hi8_info;
+extern const struct x86_dev_info czc_p10t;
+extern const struct x86_dev_info lenovo_yogabook_x9x_info;
+/* Not const as this gets modified by its init callback */
+extern struct x86_dev_info lenovo_yoga_tab2_830_1050_info;
+extern const struct x86_dev_info lenovo_yt3_info;
+extern const struct x86_dev_info medion_lifetab_s10346_info;
+extern const struct x86_dev_info nextbook_ares8_info;
+extern const struct x86_dev_info whitelabel_tm800a550l_info;
+extern const struct x86_dev_info xiaomi_mipad2_info;
+extern const struct dmi_system_id x86_android_tablet_ids[];
+
 #endif
-- 
2.39.1

