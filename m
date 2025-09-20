Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F8823F26A
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 20:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758398839; cv=none; b=CitTFKryKZcFJ5VWzTJW5ahuhoQhhBe3COrHec05n08irXJn61SSeE8/8cpexvTQ6vYglwCipBhtUujbjjA5dGRBMprghS6c0CBC7R4o14rpvyJhuwNHaJZyb7vUSADmsONs8IUTISTePNwfZ1aT7PLw504APq8AGZ3uTOB+qt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758398839; c=relaxed/simple;
	bh=le/o0/RflvDYtiYEh0VlsbdshTAxTgLtNSxBItM9qlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qr/XTTbftKW0uady/31oQ8F4nu5607kX/ONstk1kSObeUkhU4RLDGizOUAxbJCG1jh4aGmlR3YqsOHMpNHYep9Hiv9+lRtq1tW1pGK+gGYqwRWrWHrql8rcoPdEyBVaRxpyFsiTS14ry13vJ46gCNrK9VFQm5Ijg8ET9JHz/xEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=orYfH/Fm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="orYfH/Fm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63349C4CEF0;
	Sat, 20 Sep 2025 20:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758398838;
	bh=le/o0/RflvDYtiYEh0VlsbdshTAxTgLtNSxBItM9qlQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=orYfH/FmXZciodpONYAXrvOrt3KCtYvnsNN67Zn7oknXcfvoEe6UcEHunevmzXg/N
	 dnzdmMZdoIDNy35m/UxKpPOBW2r+v+I/YFg4uB9nL09CDPwlsUSKKZzfcTAmR9kWYv
	 Ads36Bfg7YI9BARIrUY81Ank9e2Do4+NPgPkKE9G76kxsC8gVxbddrpQWHGLpYOCUG
	 /kAQHegMFT5zDb7Ss0IuXhuA8CHLCng8h1Ky9ZNw0z9NUPl3rQjQW2rQd6hyMdgjq2
	 PYgZEFVLxC85XryeNGrgTnhgH7rcK1u/TRuEwT1WDyXsTXkJgfIl3n3iMAwSSxYJ5q
	 J0FEHquRm60Tg==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert Goodix devices to GPIO references
Date: Sat, 20 Sep 2025 22:06:54 +0200
Message-ID: <20250920200713.20193-2-hansg@kernel.org>
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
driver away from using GPIO lookup tables for Goodix touchscreens to
using PROPERTY_ENTRY_GPIO() to keep all touchscreen properties together.

Since the tablets are using either Baytrail or Cherryview GPIO
controllers x86_dev_info structure has been extended to carry gpiochip
type information so that the code can instantiate correct set of
software nodes representing the GPIO chip.

Because this adds a new point of failure in x86_android_tablet_probe(),
x86_android_tablet_remove() is rearranged to handle cases where battery
swnode has not been registered yet, and registering of GPIO lookup
tables is moved earlier as it can not fail.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Tested-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 .../platform/x86/x86-android-tablets/asus.c   | 23 ++++---
 .../platform/x86/x86-android-tablets/core.c   | 69 ++++++++++++++++---
 .../platform/x86/x86-android-tablets/lenovo.c | 23 ++++---
 .../platform/x86/x86-android-tablets/other.c  | 37 ++--------
 .../x86-android-tablets/x86-android-tablets.h | 11 +++
 5 files changed, 105 insertions(+), 58 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/asus.c b/drivers/platform/x86/x86-android-tablets/asus.c
index 97cd14c1fd23..6c4468f4004b 100644
--- a/drivers/platform/x86/x86-android-tablets/asus.c
+++ b/drivers/platform/x86/x86-android-tablets/asus.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/input.h>
 #include <linux/platform_device.h>
 
@@ -77,6 +78,16 @@ static const struct software_node asus_me176c_ug3105_node = {
 	.properties = asus_me176c_ug3105_props,
 };
 
+static const struct property_entry asus_me176c_touchscreen_props[] = {
+	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpiochip_nodes[0], 60, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("irq-gpios", &baytrail_gpiochip_nodes[2], 28, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node asus_me176c_touchscreen_node = {
+	.properties = asus_me176c_touchscreen_props,
+};
+
 static const struct x86_i2c_client_info asus_me176c_i2c_clients[] __initconst = {
 	{
 		/* bq24297 battery charger */
@@ -132,6 +143,7 @@ static const struct x86_i2c_client_info asus_me176c_i2c_clients[] __initconst =
 			.type = "GDIX1001:00",
 			.addr = 0x14,
 			.dev_name = "goodix_ts",
+			.swnode = &asus_me176c_touchscreen_node,
 		},
 		.adapter_path = "\\_SB_.I2C6",
 		.irq_data = {
@@ -152,18 +164,8 @@ static const struct x86_serdev_info asus_me176c_serdevs[] __initconst = {
 	},
 };
 
-static struct gpiod_lookup_table asus_me176c_goodix_gpios = {
-	.dev_id = "i2c-goodix_ts",
-	.table = {
-		GPIO_LOOKUP("INT33FC:00", 60, "reset", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("INT33FC:02", 28, "irq", GPIO_ACTIVE_HIGH),
-		{ }
-	},
-};
-
 static struct gpiod_lookup_table * const asus_me176c_gpios[] = {
 	&int3496_gpo2_pin22_gpios,
-	&asus_me176c_goodix_gpios,
 	NULL
 };
 
@@ -179,6 +181,7 @@ const struct x86_dev_info asus_me176c_info __initconst = {
 	.gpiod_lookup_tables = asus_me176c_gpios,
 	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
 	.modules = bq24190_modules,
+	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 };
 
 /* Asus TF103C tablets have an Android factory image with everything hardcoded */
diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index db76ba3abd7b..7b5942010c78 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -155,6 +155,7 @@ static struct serdev_device **serdevs;
 static struct gpio_keys_button *buttons;
 static struct gpiod_lookup_table * const *gpiod_lookup_tables;
 static const struct software_node *bat_swnode;
+static const struct software_node **gpiochip_node_group;
 static void (*exit_handler)(void);
 
 static __init struct i2c_adapter *
@@ -330,6 +331,34 @@ static __init int x86_instantiate_serdev(const struct x86_dev_info *dev_info, in
 	return ret;
 }
 
+const struct software_node baytrail_gpiochip_nodes[] = {
+	{ .name = "INT33FC:00" },
+	{ .name = "INT33FC:01" },
+	{ .name = "INT33FC:02" },
+};
+
+static const struct software_node *baytrail_gpiochip_node_group[] = {
+	&baytrail_gpiochip_nodes[0],
+	&baytrail_gpiochip_nodes[1],
+	&baytrail_gpiochip_nodes[2],
+	NULL
+};
+
+const struct software_node cherryview_gpiochip_nodes[] = {
+	{ .name = "INT33FF:00" },
+	{ .name = "INT33FF:01" },
+	{ .name = "INT33FF:02" },
+	{ .name = "INT33FF:03" },
+};
+
+static const struct software_node *cherryview_gpiochip_node_group[] = {
+	&cherryview_gpiochip_nodes[0],
+	&cherryview_gpiochip_nodes[1],
+	&cherryview_gpiochip_nodes[2],
+	&cherryview_gpiochip_nodes[3],
+	NULL
+};
+
 static void x86_android_tablet_remove(struct platform_device *pdev)
 {
 	int i;
@@ -360,10 +389,14 @@ static void x86_android_tablet_remove(struct platform_device *pdev)
 	if (exit_handler)
 		exit_handler();
 
+	if (bat_swnode)
+		software_node_unregister(bat_swnode);
+
+	if (gpiochip_node_group)
+		software_node_unregister_node_group(gpiochip_node_group);
+
 	for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
 		gpiod_remove_lookup_table(gpiod_lookup_tables[i]);
-
-	software_node_unregister(bat_swnode);
 }
 
 static __init int x86_android_tablet_probe(struct platform_device *pdev)
@@ -387,16 +420,36 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
 	for (i = 0; dev_info->modules && dev_info->modules[i]; i++)
 		request_module(dev_info->modules[i]);
 
-	bat_swnode = dev_info->bat_swnode;
-	if (bat_swnode) {
-		ret = software_node_register(bat_swnode);
+	gpiod_lookup_tables = dev_info->gpiod_lookup_tables;
+	for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
+		gpiod_add_lookup_table(gpiod_lookup_tables[i]);
+
+	switch (dev_info->gpiochip_type) {
+	case X86_GPIOCHIP_BAYTRAIL:
+		gpiochip_node_group = baytrail_gpiochip_node_group;
+		break;
+	case X86_GPIOCHIP_CHERRYVIEW:
+		gpiochip_node_group = cherryview_gpiochip_node_group;
+		break;
+	case X86_GPIOCHIP_UNSPECIFIED:
+		gpiochip_node_group = NULL;
+		break;
+	}
+
+	if (gpiochip_node_group) {
+		ret = software_node_register_node_group(gpiochip_node_group);
 		if (ret)
 			return ret;
 	}
 
-	gpiod_lookup_tables = dev_info->gpiod_lookup_tables;
-	for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
-		gpiod_add_lookup_table(gpiod_lookup_tables[i]);
+	if (dev_info->bat_swnode) {
+		ret = software_node_register(dev_info->bat_swnode);
+		if (ret) {
+			x86_android_tablet_remove(pdev);
+			return ret;
+		}
+		bat_swnode = dev_info->bat_swnode;
+	}
 
 	if (dev_info->init) {
 		ret = dev_info->init(&pdev->dev);
diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 1241a97cda39..22fe76ef5b5a 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -12,6 +12,7 @@
 
 #include <linux/efi.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/mfd/arizona/pdata.h>
 #include <linux/mfd/arizona/registers.h>
 #include <linux/mfd/intel_soc_pmic.h>
@@ -61,6 +62,16 @@ static struct lp855x_platform_data lenovo_lp8557_reg_only_pdata = {
 
 /* Lenovo Yoga Book X90F / X90L's Android factory image has everything hardcoded */
 
+static const struct property_entry lenovo_yb1_x90_goodix_props[] = {
+	PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[1], 53, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("irq-gpios", &cherryview_gpiochip_nodes[1], 56, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node lenovo_yb1_x90_goodix_node = {
+	.properties = lenovo_yb1_x90_goodix_props,
+};
+
 static const struct property_entry lenovo_yb1_x90_wacom_props[] = {
 	PROPERTY_ENTRY_U32("hid-descr-addr", 0x0001),
 	PROPERTY_ENTRY_U32("post-reset-deassert-delay-ms", 150),
@@ -108,6 +119,7 @@ static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst
 			.type = "GDIX1001:00",
 			.addr = 0x14,
 			.dev_name = "goodix_ts",
+			.swnode = &lenovo_yb1_x90_goodix_node,
 		},
 		.adapter_path = "\\_SB_.PCI0.I2C2",
 		.irq_data = {
@@ -198,15 +210,6 @@ static const struct x86_gpio_button lenovo_yb1_x90_lid __initconst = {
 	.pin = 19,
 };
 
-static struct gpiod_lookup_table lenovo_yb1_x90_goodix_gpios = {
-	.dev_id = "i2c-goodix_ts",
-	.table = {
-		GPIO_LOOKUP("INT33FF:01", 53, "reset", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("INT33FF:01", 56, "irq", GPIO_ACTIVE_HIGH),
-		{ }
-	},
-};
-
 static struct gpiod_lookup_table lenovo_yb1_x90_hideep_gpios = {
 	.dev_id = "i2c-hideep_ts",
 	.table = {
@@ -225,7 +228,6 @@ static struct gpiod_lookup_table lenovo_yb1_x90_wacom_gpios = {
 
 static struct gpiod_lookup_table * const lenovo_yb1_x90_gpios[] = {
 	&lenovo_yb1_x90_hideep_gpios,
-	&lenovo_yb1_x90_goodix_gpios,
 	&lenovo_yb1_x90_wacom_gpios,
 	NULL
 };
@@ -259,6 +261,7 @@ const struct x86_dev_info lenovo_yogabook_x90_info __initconst = {
 	.gpio_button = &lenovo_yb1_x90_lid,
 	.gpio_button_count = 1,
 	.gpiod_lookup_tables = lenovo_yb1_x90_gpios,
+	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
 	.init = lenovo_yb1_x90_init,
 };
 
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index f7bd9f863c85..e3907812c8bc 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -10,6 +10,7 @@
 
 #include <linux/acpi.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/input.h>
 #include <linux/leds.h>
 #include <linux/pci.h>
@@ -297,6 +298,8 @@ static const struct software_node medion_lifetab_s10346_accel_node = {
 static const struct property_entry medion_lifetab_s10346_touchscreen_props[] = {
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpiochip_nodes[1], 26, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("irq-gpios", &baytrail_gpiochip_nodes[2], 3, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -340,24 +343,10 @@ static const struct x86_i2c_client_info medion_lifetab_s10346_i2c_clients[] __in
 	},
 };
 
-static struct gpiod_lookup_table medion_lifetab_s10346_goodix_gpios = {
-	.dev_id = "i2c-goodix_ts",
-	.table = {
-		GPIO_LOOKUP("INT33FC:01", 26, "reset", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("INT33FC:02", 3, "irq", GPIO_ACTIVE_HIGH),
-		{ }
-	},
-};
-
-static struct gpiod_lookup_table * const medion_lifetab_s10346_gpios[] = {
-	&medion_lifetab_s10346_goodix_gpios,
-	NULL
-};
-
 const struct x86_dev_info medion_lifetab_s10346_info __initconst = {
 	.i2c_client_info = medion_lifetab_s10346_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(medion_lifetab_s10346_i2c_clients),
-	.gpiod_lookup_tables = medion_lifetab_s10346_gpios,
+	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 };
 
 /* Nextbook Ares 8 (BYT) tablets have an Android factory image with everything hardcoded */
@@ -543,6 +532,8 @@ static const struct property_entry whitelabel_tm800a550l_goodix_props[] = {
 	PROPERTY_ENTRY_STRING("firmware-name", "gt912-tm800a550l.fw"),
 	PROPERTY_ENTRY_STRING("goodix,config-name", "gt912-tm800a550l.cfg"),
 	PROPERTY_ENTRY_U32("goodix,main-clk", 54),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpiochip_nodes[1], 26, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("irq-gpios", &baytrail_gpiochip_nodes[2], 3, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -578,24 +569,10 @@ static const struct x86_i2c_client_info whitelabel_tm800a550l_i2c_clients[] __in
 	},
 };
 
-static struct gpiod_lookup_table whitelabel_tm800a550l_goodix_gpios = {
-	.dev_id = "i2c-goodix_ts",
-	.table = {
-		GPIO_LOOKUP("INT33FC:01", 26, "reset", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("INT33FC:02", 3, "irq", GPIO_ACTIVE_HIGH),
-		{ }
-	},
-};
-
-static struct gpiod_lookup_table * const whitelabel_tm800a550l_gpios[] = {
-	&whitelabel_tm800a550l_goodix_gpios,
-	NULL
-};
-
 const struct x86_dev_info whitelabel_tm800a550l_info __initconst = {
 	.i2c_client_info = whitelabel_tm800a550l_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(whitelabel_tm800a550l_i2c_clients),
-	.gpiod_lookup_tables = whitelabel_tm800a550l_gpios,
+	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 };
 
 /*
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index dcf8d49e3b5f..a54d09408866 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -32,6 +32,12 @@ enum x86_acpi_irq_type {
 	X86_ACPI_IRQ_TYPE_PMIC,
 };
 
+enum x86_gpiochip_type {
+	X86_GPIOCHIP_UNSPECIFIED = 0,
+	X86_GPIOCHIP_BAYTRAIL,
+	X86_GPIOCHIP_CHERRYVIEW,
+};
+
 struct x86_acpi_irq_data {
 	char *chip;   /* GPIO chip label (GPIOINT) or PMIC ACPI path (PMIC) */
 	enum x86_acpi_irq_type type;
@@ -99,6 +105,7 @@ struct x86_dev_info {
 	int (*init)(struct device *dev);
 	void (*exit)(void);
 	bool use_pci;
+	enum x86_gpiochip_type gpiochip_type;
 };
 
 int x86_android_tablet_get_gpiod(const char *chip, int pin, const char *con_id,
@@ -106,6 +113,10 @@ int x86_android_tablet_get_gpiod(const char *chip, int pin, const char *con_id,
 				 struct gpio_desc **desc);
 int x86_acpi_irq_helper_get(const struct x86_acpi_irq_data *data);
 
+/* Software nodes representing GPIO chips used by various tablets */
+extern const struct software_node baytrail_gpiochip_nodes[];
+extern const struct software_node cherryview_gpiochip_nodes[];
+
 /*
  * Extern declarations of x86_dev_info structs so there can be a single
  * MODULE_DEVICE_TABLE(dmi, ...), while splitting the board descriptions.
-- 
2.51.0

