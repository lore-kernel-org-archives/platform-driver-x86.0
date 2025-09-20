Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEECA23F26A
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 20:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758398848; cv=none; b=QRVHmNEs1S97Bk4/Lqb6rUp9wmEaD4NCHTnAk0ftH1SKMD7Y2Lm2vGvraqRxfIc31992NWHS9q9VfzUYwLohrbCHXm2WKoMKhUeKYU8T3i9mWeHJ87NE5TVAygkSthW36Ubne0tqv6w/enWTLj8R3KBVQgSJfFeD9OOEIH120Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758398848; c=relaxed/simple;
	bh=VBmuh3Ed1nwfWLdaJwPfN4x+dWFlcXxS0z01khFcuNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8mfx+buP4bI4BFIg8tbcrZZGPJHZaC6Oj+KeMEGMqE54uvgdei2iajYh3xrFtEKCT0jkanCKjk1hN1XVGcF6+4AUn5ztRxu6+O/jXgTt+PhO2g7IQdf62SQ83cR6AjAHpEKbrLEY5a2g3oJjSktwKUpT751CuRC4LCqI8aOous=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2ssLCS5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2ssLCS5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A2AC4CEEB;
	Sat, 20 Sep 2025 20:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758398848;
	bh=VBmuh3Ed1nwfWLdaJwPfN4x+dWFlcXxS0z01khFcuNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z2ssLCS5zHQ2+OK9QjBMACnJuw76LWufeuDsIwo5oPsoE82JASkOuE+o/LCavXtT6
	 YCzLi1KFnQUW/Sx3leOAbDMafwdmcR5nJg5b1ASAOJH/kldiVH57fJe/FX7SB/E6fU
	 kDAT9a2pPCpaKdNKsVfnCRxLUhoCSjG7be+UawP/wP9sYZL4yOM92eEbE0wSLjpDYy
	 rC2Tnz7cSfN5svDlJf/cQ5qvJNftm9wFnpxpxkY608aJSRkmPBoBvZx1ZvNT+mpykp
	 eP9HNr5nZVt5i4nRVa5/8qRWL06v8dl4Br2PKh7HjP1PeHd3nhMTbPYliwoAEiFe2O
	 aUuxZkLBdRWKQ==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 06/20] platform/x86: x86-android-tablets: convert int3496 devices to GPIO references
Date: Sat, 20 Sep 2025 22:06:59 +0200
Message-ID: <20250920200713.20193-7-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920200713.20193-1-hansg@kernel.org>
References: <20250920200713.20193-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Now that gpiolib supports software nodes to describe GPIOs, switch the
driver away from using GPIO lookup tables for int3496 devices to using
PROPERTY_ENTRY_GPIO().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Tested-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Changes in v3:
- Leave int3496_pdevs[] in shared-psy-info.c instead of moving it to
  other.c, it will also be used in the upcoming acer.c so it needs to
  stay shared
---
 .../platform/x86/x86-android-tablets/asus.c   | 37 ++++++++-----------
 .../platform/x86/x86-android-tablets/lenovo.c | 24 +++++++-----
 .../platform/x86/x86-android-tablets/other.c  | 13 +------
 .../x86/x86-android-tablets/shared-psy-info.c | 22 +++++------
 .../x86/x86-android-tablets/shared-psy-info.h |  2 -
 5 files changed, 43 insertions(+), 55 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/asus.c b/drivers/platform/x86/x86-android-tablets/asus.c
index 6c4468f4004b..ce581d161551 100644
--- a/drivers/platform/x86/x86-android-tablets/asus.c
+++ b/drivers/platform/x86/x86-android-tablets/asus.c
@@ -17,11 +17,17 @@
 #include "x86-android-tablets.h"
 
 /* Asus ME176C and TF103C tablets shared data */
-static struct gpiod_lookup_table int3496_gpo2_pin22_gpios = {
-	.dev_id = "intel-int3496",
-	.table = {
-		GPIO_LOOKUP("INT33FC:02", 22, "id", GPIO_ACTIVE_HIGH),
-		{ }
+static const struct property_entry asus_me176c_tf103c_int3496_props[] __initconst = {
+	PROPERTY_ENTRY_GPIO("id-gpios", &baytrail_gpiochip_nodes[2], 22, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct platform_device_info asus_me176c_tf103c_pdevs[] __initconst = {
+	{
+		/* For micro USB ID pin handling */
+		.name = "intel-int3496",
+		.id = PLATFORM_DEVID_NONE,
+		.properties = asus_me176c_tf103c_int3496_props,
 	},
 };
 
@@ -164,21 +170,15 @@ static const struct x86_serdev_info asus_me176c_serdevs[] __initconst = {
 	},
 };
 
-static struct gpiod_lookup_table * const asus_me176c_gpios[] = {
-	&int3496_gpo2_pin22_gpios,
-	NULL
-};
-
 const struct x86_dev_info asus_me176c_info __initconst = {
 	.i2c_client_info = asus_me176c_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(asus_me176c_i2c_clients),
-	.pdev_info = int3496_pdevs,
-	.pdev_count = 1,
+	.pdev_info = asus_me176c_tf103c_pdevs,
+	.pdev_count = ARRAY_SIZE(asus_me176c_tf103c_pdevs),
 	.serdev_info = asus_me176c_serdevs,
 	.serdev_count = ARRAY_SIZE(asus_me176c_serdevs),
 	.gpio_button = &asus_me176c_tf103c_lid,
 	.gpio_button_count = 1,
-	.gpiod_lookup_tables = asus_me176c_gpios,
 	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
 	.modules = bq24190_modules,
 	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
@@ -296,19 +296,14 @@ static const struct x86_i2c_client_info asus_tf103c_i2c_clients[] __initconst =
 	},
 };
 
-static struct gpiod_lookup_table * const asus_tf103c_gpios[] = {
-	&int3496_gpo2_pin22_gpios,
-	NULL
-};
-
 const struct x86_dev_info asus_tf103c_info __initconst = {
 	.i2c_client_info = asus_tf103c_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(asus_tf103c_i2c_clients),
-	.pdev_info = int3496_pdevs,
-	.pdev_count = 1,
+	.pdev_info = asus_me176c_tf103c_pdevs,
+	.pdev_count = ARRAY_SIZE(asus_me176c_tf103c_pdevs),
 	.gpio_button = &asus_me176c_tf103c_lid,
 	.gpio_button_count = 1,
-	.gpiod_lookup_tables = asus_tf103c_gpios,
 	.bat_swnode = &generic_lipo_4v2_battery_node,
 	.modules = bq24190_modules,
+	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 };
diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 49388266201b..db6337671357 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -366,12 +366,18 @@ static struct x86_i2c_client_info lenovo_yoga_tab2_830_1050_i2c_clients[] __init
 	},
 };
 
-static struct gpiod_lookup_table lenovo_yoga_tab2_830_1050_int3496_gpios = {
-	.dev_id = "intel-int3496",
-	.table = {
-		GPIO_LOOKUP("INT33FC:02", 1, "mux", GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP("INT33FC:02", 24, "id", GPIO_ACTIVE_HIGH),
-		{ }
+static const struct property_entry lenovo_yoga_tab2_830_1050_int3496_props[] __initconst = {
+	PROPERTY_ENTRY_GPIO("mux-gpios", &baytrail_gpiochip_nodes[2], 1, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("id-gpios", &baytrail_gpiochip_nodes[2], 24, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct platform_device_info lenovo_yoga_tab2_830_1050_pdevs[] __initconst = {
+	{
+		/* For micro USB ID pin handling */
+		.name = "intel-int3496",
+		.id = PLATFORM_DEVID_NONE,
+		.properties = lenovo_yoga_tab2_830_1050_int3496_props,
 	},
 };
 
@@ -389,7 +395,6 @@ static struct gpiod_lookup_table lenovo_yoga_tab2_830_1050_codec_gpios = {
 };
 
 static struct gpiod_lookup_table * const lenovo_yoga_tab2_830_1050_gpios[] = {
-	&lenovo_yoga_tab2_830_1050_int3496_gpios,
 	&lenovo_yoga_tab2_830_1050_codec_gpios,
 	NULL
 };
@@ -400,13 +405,14 @@ static void lenovo_yoga_tab2_830_1050_exit(void);
 const struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initconst = {
 	.i2c_client_info = lenovo_yoga_tab2_830_1050_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(lenovo_yoga_tab2_830_1050_i2c_clients),
-	.pdev_info = int3496_pdevs,
-	.pdev_count = 1,
+	.pdev_info = lenovo_yoga_tab2_830_1050_pdevs,
+	.pdev_count = ARRAY_SIZE(lenovo_yoga_tab2_830_1050_pdevs),
 	.gpio_button = &lenovo_yoga_tab2_830_1050_lid,
 	.gpio_button_count = 1,
 	.gpiod_lookup_tables = lenovo_yoga_tab2_830_1050_gpios,
 	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
 	.modules = bq24190_modules,
+	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 	.init = lenovo_yoga_tab2_830_1050_init,
 	.exit = lenovo_yoga_tab2_830_1050_exit,
 };
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index 0f3cc0ea877e..2f12b68080ba 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -84,17 +84,11 @@ static const struct x86_i2c_client_info acer_b1_750_i2c_clients[] __initconst =
 	},
 };
 
-static struct gpiod_lookup_table * const acer_b1_750_gpios[] = {
-	&int3496_reference_gpios,
-	NULL
-};
-
 const struct x86_dev_info acer_b1_750_info __initconst = {
 	.i2c_client_info = acer_b1_750_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(acer_b1_750_i2c_clients),
 	.pdev_info = int3496_pdevs,
 	.pdev_count = 1,
-	.gpiod_lookup_tables = acer_b1_750_gpios,
 	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 };
 
@@ -407,17 +401,12 @@ static const struct x86_i2c_client_info nextbook_ares8_i2c_clients[] __initconst
 	},
 };
 
-static struct gpiod_lookup_table * const nextbook_ares8_gpios[] = {
-	&int3496_reference_gpios,
-	NULL
-};
-
 const struct x86_dev_info nextbook_ares8_info __initconst = {
 	.i2c_client_info = nextbook_ares8_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(nextbook_ares8_i2c_clients),
 	.pdev_info = int3496_pdevs,
 	.pdev_count = 1,
-	.gpiod_lookup_tables = nextbook_ares8_gpios,
+	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 };
 
 /* Nextbook Ares 8A (CHT) tablets have an Android factory image with everything hardcoded */
diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.c b/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
index fe34cedb6257..6ebe282bda6e 100644
--- a/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
+++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
@@ -9,12 +9,14 @@
  */
 
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/platform_device.h>
 #include <linux/power/bq24190_charger.h>
 #include <linux/property.h>
 #include <linux/regulator/machine.h>
 
 #include "shared-psy-info.h"
+#include "x86-android-tablets.h"
 
 /* Generic / shared charger / battery settings */
 const char * const tusb1211_chg_det_psy[] = { "tusb1211-charger-detect" };
@@ -156,21 +158,19 @@ const char * const bq24190_modules[] __initconst = {
 	NULL
 };
 
-/* Generic platform device array and GPIO lookup table for micro USB ID pin handling */
+static const struct property_entry int3496_reference_props[] __initconst = {
+	PROPERTY_ENTRY_GPIO("vbus-gpios", &baytrail_gpiochip_nodes[1], 15, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("mux-gpios", &baytrail_gpiochip_nodes[2], 1, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("id-gpios", &baytrail_gpiochip_nodes[2], 18, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+/* Generic pdevs array and gpio-lookups for micro USB ID pin handling */
 const struct platform_device_info int3496_pdevs[] __initconst = {
 	{
 		/* For micro USB ID pin handling */
 		.name = "intel-int3496",
 		.id = PLATFORM_DEVID_NONE,
-	},
-};
-
-struct gpiod_lookup_table int3496_reference_gpios = {
-	.dev_id = "intel-int3496",
-	.table = {
-		GPIO_LOOKUP("INT33FC:01", 15, "vbus", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("INT33FC:02", 1, "mux", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("INT33FC:02", 18, "id", GPIO_ACTIVE_HIGH),
-		{ }
+		.properties = int3496_reference_props,
 	},
 };
diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
index bcf9845ad275..b9cbc291aa4d 100644
--- a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
+++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
@@ -11,7 +11,6 @@
 #define __PDX86_SHARED_PSY_INFO_H
 
 struct bq24190_platform_data;
-struct gpiod_lookup_table;
 struct platform_device_info;
 struct software_node;
 
@@ -28,6 +27,5 @@ extern struct bq24190_platform_data bq24190_pdata;
 extern const char * const bq24190_modules[];
 
 extern const struct platform_device_info int3496_pdevs[];
-extern struct gpiod_lookup_table int3496_reference_gpios;
 
 #endif
-- 
2.51.0

