Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FD91FB3
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 20:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758314885; cv=none; b=aMj51Czpj2ucuYQTwCAmd6/u36xdRbaoudyHcArIs9WLPoMCrfbA2/oQ6CZk83xn7PTjs2FRTJOkCwG/MWn/pRfPx1v90S7KCNMdw168hOi3u0koZDNs/3E4293U0JP92d0YS/9sKl5LtuRtrnRNGggsf0kXnLoEtG0yzLVSne0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758314885; c=relaxed/simple;
	bh=TeDwufmQ2gqi/Z7juO2k2MN5KOS1yxye/Ycz8ctj8U0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HKG3n43I+zTozeyAbA2zeQmahQYcFlbMfUvFt4ameAxI/Q4VoXvnrcJuw9pLaOGJo/Lu85PnPUoXdQy6z3dPTfPPeG1XfmBpaQHoVxMLQVhLz/oYWd2baySiB4bEkt0wx0lMkz0JE68FMiUVT4dV7obGtIZoeKxhopZRx53W6gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Im2IW+6v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Im2IW+6v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DCC7C4CEF7;
	Fri, 19 Sep 2025 20:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758314885;
	bh=TeDwufmQ2gqi/Z7juO2k2MN5KOS1yxye/Ycz8ctj8U0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Im2IW+6vioSAHJkCWvKu1Jh7z0Qp/rPZFrbch8qYDiE4+enlo94BklouMZ6+TR7IL
	 M4Ao2NQfC+gCrv2jJOAN9jdQgztTEiQ0KAkGXMJ6T6Rl6YxveD7Xt8Q0FaLTBk4F0k
	 hI0hjLkcox0hmqXb0vTVl6+mzkE0muvdbCN5qibnqN97vUXXqiEacH3givOOu/DBf9
	 daiKUZMTo4tx1QEvB+UktH11TGUUrU8r6EaXbGl0RfmYJpVUwpeu0DL3nu42bnbv/y
	 0HuyKom49R0k8m3MjntfuqMsIScdiSYUi77eyK3C+dM32mE0l1GUojnNAAjSoeo8Ec
	 WDrv5gEEQbccQ==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 11/19] platform/x86: x86-android-tablets: convert gpio_keys devices to GPIO references
Date: Fri, 19 Sep 2025 22:47:34 +0200
Message-ID: <20250919204742.25581-12-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919204742.25581-1-hansg@kernel.org>
References: <20250919204742.25581-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Now that gpiolib supports software nodes to describe GPIOs, switch the
driver away from using GPIO lookup tables for gpio_keys devices to using
PROPERTY_ENTRY_GPIO().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Tested-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 .../platform/x86/x86-android-tablets/asus.c   |  42 ++++--
 .../platform/x86/x86-android-tablets/core.c   |  44 ++----
 .../platform/x86/x86-android-tablets/lenovo.c |  79 ++++++----
 .../platform/x86/x86-android-tablets/other.c  | 138 +++++++++++-------
 .../x86-android-tablets/x86-android-tablets.h |  10 +-
 5 files changed, 177 insertions(+), 136 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/asus.c b/drivers/platform/x86/x86-android-tablets/asus.c
index ce581d161551..91245f1bfd87 100644
--- a/drivers/platform/x86/x86-android-tablets/asus.c
+++ b/drivers/platform/x86/x86-android-tablets/asus.c
@@ -10,7 +10,7 @@
 
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
-#include <linux/input.h>
+#include <linux/input-event-codes.h>
 #include <linux/platform_device.h>
 
 #include "shared-psy-info.h"
@@ -31,17 +31,29 @@ static const struct platform_device_info asus_me176c_tf103c_pdevs[] __initconst
 	},
 };
 
-static const struct x86_gpio_button asus_me176c_tf103c_lid __initconst = {
-	.button = {
-		.code = SW_LID,
-		.active_low = true,
-		.desc = "lid_sw",
-		.type = EV_SW,
-		.wakeup = true,
-		.debounce_interval = 50,
-	},
-	.chip = "INT33FC:02",
-	.pin = 12,
+static const struct software_node asus_me176c_tf103c_gpio_keys_node = {
+	.name = "lid_sw",
+};
+
+static const struct property_entry asus_me176c_tf103c_lid_props[] = {
+	PROPERTY_ENTRY_U32("linux,input-type", EV_SW),
+	PROPERTY_ENTRY_U32("linux,code", SW_LID),
+	PROPERTY_ENTRY_STRING("label", "lid_sw"),
+	PROPERTY_ENTRY_GPIO("gpios", &baytrail_gpiochip_nodes[2], 12, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_U32("debounce-interval", 50),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	{ }
+};
+
+static const struct software_node asus_me176c_tf103c_lid_node = {
+	.parent = &asus_me176c_tf103c_gpio_keys_node,
+	.properties = asus_me176c_tf103c_lid_props,
+};
+
+static const struct software_node *asus_me176c_tf103c_lid_swnodes[] = {
+	&asus_me176c_tf103c_gpio_keys_node,
+	&asus_me176c_tf103c_lid_node,
+	NULL
 };
 
 /* Asus ME176C tablets have an Android factory image with everything hardcoded */
@@ -177,8 +189,7 @@ const struct x86_dev_info asus_me176c_info __initconst = {
 	.pdev_count = ARRAY_SIZE(asus_me176c_tf103c_pdevs),
 	.serdev_info = asus_me176c_serdevs,
 	.serdev_count = ARRAY_SIZE(asus_me176c_serdevs),
-	.gpio_button = &asus_me176c_tf103c_lid,
-	.gpio_button_count = 1,
+	.gpio_button_swnodes = asus_me176c_tf103c_lid_swnodes,
 	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
 	.modules = bq24190_modules,
 	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
@@ -301,8 +312,7 @@ const struct x86_dev_info asus_tf103c_info __initconst = {
 	.i2c_client_count = ARRAY_SIZE(asus_tf103c_i2c_clients),
 	.pdev_info = asus_me176c_tf103c_pdevs,
 	.pdev_count = ARRAY_SIZE(asus_me176c_tf103c_pdevs),
-	.gpio_button = &asus_me176c_tf103c_lid,
-	.gpio_button_count = 1,
+	.gpio_button_swnodes = asus_me176c_tf103c_lid_swnodes,
 	.bat_swnode = &generic_lipo_4v2_battery_node,
 	.modules = bq24190_modules,
 	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 1eb59c999baf..955a2c83a9bf 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -152,7 +152,7 @@ static struct i2c_client **i2c_clients;
 static struct spi_device **spi_devs;
 static struct platform_device **pdevs;
 static struct serdev_device **serdevs;
-static struct gpio_keys_button *buttons;
+static const struct software_node **gpio_button_swnodes;
 static const struct software_node *bat_swnode;
 static const struct software_node **gpiochip_node_group;
 static void (*exit_handler)(void);
@@ -373,7 +373,6 @@ static void x86_android_tablet_remove(struct platform_device *pdev)
 		platform_device_unregister(pdevs[i]);
 
 	kfree(pdevs);
-	kfree(buttons);
 
 	for (i = spi_dev_count - 1; i >= 0; i--)
 		spi_unregister_device(spi_devs[i]);
@@ -388,6 +387,9 @@ static void x86_android_tablet_remove(struct platform_device *pdev)
 	if (exit_handler)
 		exit_handler();
 
+	if (gpio_button_swnodes)
+		software_node_unregister_node_group(gpio_button_swnodes);
+
 	if (bat_swnode)
 		software_node_unregister(bat_swnode);
 
@@ -514,38 +516,22 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (dev_info->gpio_button_count) {
-		struct gpio_keys_platform_data pdata = { };
-		struct gpio_desc *gpiod;
+	if (dev_info->gpio_button_swnodes) {
+		struct platform_device_info button_info = {
+			.name = "gpio-keys",
+			.id = PLATFORM_DEVID_AUTO,
+		};
 
-		buttons = kcalloc(dev_info->gpio_button_count, sizeof(*buttons), GFP_KERNEL);
-		if (!buttons) {
+		ret = software_node_register_node_group(dev_info->gpio_button_swnodes);
+		if (ret < 0) {
 			x86_android_tablet_remove(pdev);
-			return -ENOMEM;
+			return ret;
 		}
 
-		for (i = 0; i < dev_info->gpio_button_count; i++) {
-			ret = x86_android_tablet_get_gpiod(dev_info->gpio_button[i].chip,
-							   dev_info->gpio_button[i].pin,
-							   dev_info->gpio_button[i].button.desc,
-							   false, GPIOD_IN, &gpiod);
-			if (ret < 0) {
-				x86_android_tablet_remove(pdev);
-				return ret;
-			}
+		gpio_button_swnodes = dev_info->gpio_button_swnodes;
 
-			buttons[i] = dev_info->gpio_button[i].button;
-			buttons[i].gpio = desc_to_gpio(gpiod);
-			/* Release GPIO descriptor so that gpio-keys can request it */
-			devm_gpiod_put(&x86_android_tablet_device->dev, gpiod);
-		}
-
-		pdata.buttons = buttons;
-		pdata.nbuttons = dev_info->gpio_button_count;
-
-		pdevs[pdev_count] = platform_device_register_data(&pdev->dev, "gpio-keys",
-								  PLATFORM_DEVID_AUTO,
-								  &pdata, sizeof(pdata));
+		button_info.fwnode = software_node_fwnode(dev_info->gpio_button_swnodes[0]);
+		pdevs[pdev_count] = platform_device_register_full(&button_info);
 		if (IS_ERR(pdevs[pdev_count])) {
 			ret = PTR_ERR(pdevs[pdev_count]);
 			x86_android_tablet_remove(pdev);
diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 7d1808a3437f..9a28216642c3 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -13,6 +13,7 @@
 #include <linux/efi.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
+#include <linux/input-event-codes.h>
 #include <linux/mfd/arizona/pdata.h>
 #include <linux/mfd/arizona/registers.h>
 #include <linux/mfd/intel_soc_pmic.h>
@@ -207,17 +208,34 @@ static const struct x86_serdev_info lenovo_yb1_x90_serdevs[] __initconst = {
 	},
 };
 
-static const struct x86_gpio_button lenovo_yb1_x90_lid __initconst = {
-	.button = {
-		.code = SW_LID,
-		.active_low = true,
-		.desc = "lid_sw",
-		.type = EV_SW,
-		.wakeup = true,
-		.debounce_interval = 50,
-	},
-	.chip = "INT33FF:02",
-	.pin = 19,
+/*
+ * Software node attached to gpio-keys device representing the LID and
+ * serving as a parent to software nodes representing individual keys/buttons
+ * as required by the device tree binding.
+ */
+static const struct software_node lenovo_lid_gpio_keys_node = {
+	.name = "lid_sw",
+};
+
+static const struct property_entry lenovo_yb1_x90_lid_props[] = {
+	PROPERTY_ENTRY_U32("linux,input-type", EV_SW),
+	PROPERTY_ENTRY_U32("linux,code", SW_LID),
+	PROPERTY_ENTRY_STRING("label", "lid_sw"),
+	PROPERTY_ENTRY_GPIO("gpios", &cherryview_gpiochip_nodes[2], 19, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_U32("debounce-interval", 50),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	{ }
+};
+
+static const struct software_node lenovo_yb1_x90_lid_node = {
+	.parent = &lenovo_lid_gpio_keys_node,
+	.properties = lenovo_yb1_x90_lid_props,
+};
+
+static const struct software_node *lenovo_yb1_x90_lid_swnodes[] = {
+	&lenovo_lid_gpio_keys_node,
+	&lenovo_yb1_x90_lid_node,
+	NULL
 };
 
 static int __init lenovo_yb1_x90_init(struct device *dev)
@@ -246,8 +264,7 @@ const struct x86_dev_info lenovo_yogabook_x90_info __initconst = {
 	.pdev_count = ARRAY_SIZE(lenovo_yb1_x90_pdevs),
 	.serdev_info = lenovo_yb1_x90_serdevs,
 	.serdev_count = ARRAY_SIZE(lenovo_yb1_x90_serdevs),
-	.gpio_button = &lenovo_yb1_x90_lid,
-	.gpio_button_count = 1,
+	.gpio_button_swnodes = lenovo_yb1_x90_lid_swnodes,
 	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
 	.init = lenovo_yb1_x90_init,
 };
@@ -284,17 +301,25 @@ static const struct software_node lenovo_yoga_tab2_830_1050_bq24190_node = {
 	.properties = lenovo_yoga_tab2_830_1050_bq24190_props,
 };
 
-static const struct x86_gpio_button lenovo_yoga_tab2_830_1050_lid __initconst = {
-	.button = {
-		.code = SW_LID,
-		.active_low = true,
-		.desc = "lid_sw",
-		.type = EV_SW,
-		.wakeup = true,
-		.debounce_interval = 50,
-	},
-	.chip = "INT33FC:02",
-	.pin = 26,
+static const struct property_entry lenovo_yoga_tab2_830_1050_lid_props[] = {
+	PROPERTY_ENTRY_U32("linux,input-type", EV_SW),
+	PROPERTY_ENTRY_U32("linux,code", SW_LID),
+	PROPERTY_ENTRY_STRING("label", "lid_sw"),
+	PROPERTY_ENTRY_GPIO("gpios", &baytrail_gpiochip_nodes[2], 26, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_U32("debounce-interval", 50),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	{ }
+};
+
+static const struct software_node lenovo_yoga_tab2_830_1050_lid_node = {
+	.parent = &lenovo_lid_gpio_keys_node,
+	.properties = lenovo_yoga_tab2_830_1050_lid_props,
+};
+
+static const struct software_node *lenovo_yoga_tab2_830_1050_lid_swnodes[] = {
+	&lenovo_lid_gpio_keys_node,
+	&lenovo_yoga_tab2_830_1050_lid_node,
+	NULL
 };
 
 /* This gets filled by lenovo_yoga_tab2_830_1050_init() */
@@ -422,8 +447,7 @@ const struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initconst = {
 	.i2c_client_count = ARRAY_SIZE(lenovo_yoga_tab2_830_1050_i2c_clients),
 	.pdev_info = lenovo_yoga_tab2_830_1050_pdevs,
 	.pdev_count = ARRAY_SIZE(lenovo_yoga_tab2_830_1050_pdevs),
-	.gpio_button = &lenovo_yoga_tab2_830_1050_lid,
-	.gpio_button_count = 1,
+	.gpio_button_swnodes = lenovo_yoga_tab2_830_1050_lid_swnodes,
 	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
 	.modules = bq24190_modules,
 	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
@@ -787,8 +811,7 @@ const struct x86_dev_info lenovo_yoga_tab2_1380_info __initconst = {
 	.i2c_client_count = ARRAY_SIZE(lenovo_yoga_tab2_1380_i2c_clients),
 	.pdev_info = lenovo_yoga_tab2_1380_pdevs,
 	.pdev_count = ARRAY_SIZE(lenovo_yoga_tab2_1380_pdevs),
-	.gpio_button = &lenovo_yoga_tab2_830_1050_lid,
-	.gpio_button_count = 1,
+	.gpio_button_swnodes = lenovo_yoga_tab2_830_1050_lid_swnodes,
 	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
 	.modules = lenovo_yoga_tab2_1380_modules,
 	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index 5309831243b3..1362f4167e3d 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -11,7 +11,7 @@
 #include <linux/acpi.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
-#include <linux/input.h>
+#include <linux/input-event-codes.h>
 #include <linux/leds.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
@@ -98,22 +98,32 @@ const struct x86_dev_info acer_b1_750_info __initconst = {
  * which is not described in the ACPI tables in anyway.
  * Use the x86-android-tablets infra to create a gpio-keys device for this.
  */
-static const struct x86_gpio_button advantech_mica_071_button __initconst = {
-	.button = {
-		.code = KEY_PROG1,
-		.active_low = true,
-		.desc = "prog1_key",
-		.type = EV_KEY,
-		.wakeup = false,
-		.debounce_interval = 50,
-	},
-	.chip = "INT33FC:00",
-	.pin = 2,
+static const struct software_node advantech_mica_071_gpio_keys_node = {
+	.name = "prog1_key",
+};
+
+static const struct property_entry advantech_mica_071_prog1_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_PROG1),
+	PROPERTY_ENTRY_STRING("label", "prog1_key"),
+	PROPERTY_ENTRY_GPIO("gpios", &baytrail_gpiochip_nodes[0], 2, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_U32("debounce-interval", 50),
+	{ }
+};
+
+static const struct software_node advantech_mica_071_prog1_key_node = {
+	.parent = &advantech_mica_071_gpio_keys_node,
+	.properties = advantech_mica_071_prog1_key_props,
+};
+
+static const struct software_node *advantech_mica_071_button_swnodes[] = {
+	&advantech_mica_071_gpio_keys_node,
+	&advantech_mica_071_prog1_key_node,
+	NULL
 };
 
 const struct x86_dev_info advantech_mica_071_info __initconst = {
-	.gpio_button = &advantech_mica_071_button,
-	.gpio_button_count = 1,
+	.gpio_button_swnodes = advantech_mica_071_button_swnodes,
+	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 };
 
 /*
@@ -209,36 +219,46 @@ const struct x86_dev_info chuwi_hi8_info __initconst = {
  * in the button row with the power + volume-buttons labeled P and F.
  * Use the x86-android-tablets infra to create a gpio-keys device for these.
  */
-static const struct x86_gpio_button cyberbook_t116_buttons[] __initconst = {
-	{
-		.button = {
-			.code = KEY_PROG1,
-			.active_low = true,
-			.desc = "prog1_key",
-			.type = EV_KEY,
-			.wakeup = false,
-			.debounce_interval = 50,
-		},
-		.chip = "INT33FF:00",
-		.pin = 30,
-	},
-	{
-		.button = {
-			.code = KEY_PROG2,
-			.active_low = true,
-			.desc = "prog2_key",
-			.type = EV_KEY,
-			.wakeup = false,
-			.debounce_interval = 50,
-		},
-		.chip = "INT33FF:03",
-		.pin = 48,
-	},
+static const struct software_node cyberbook_t116_gpio_keys_node = {
+	.name = "prog_keys",
+};
+
+static const struct property_entry cyberbook_t116_prog1_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_PROG1),
+	PROPERTY_ENTRY_STRING("label", "prog1_key"),
+	PROPERTY_ENTRY_GPIO("gpios", &cherryview_gpiochip_nodes[0], 30, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_U32("debounce-interval", 50),
+	{ }
+};
+
+static const struct software_node cyberbook_t116_prog1_key_node = {
+	.parent = &cyberbook_t116_gpio_keys_node,
+	.properties = cyberbook_t116_prog1_key_props,
+};
+
+static const struct property_entry cyberbook_t116_prog2_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_PROG2),
+	PROPERTY_ENTRY_STRING("label", "prog2_key"),
+	PROPERTY_ENTRY_GPIO("gpios", &cherryview_gpiochip_nodes[3], 48, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_U32("debounce-interval", 50),
+	{ }
+};
+
+static const struct software_node cyberbook_t116_prog2_key_node = {
+	.parent = &cyberbook_t116_gpio_keys_node,
+	.properties = cyberbook_t116_prog2_key_props,
+};
+
+static const struct software_node *cyberbook_t116_buttons_swnodes[] = {
+	&cyberbook_t116_gpio_keys_node,
+	&cyberbook_t116_prog1_key_node,
+	&cyberbook_t116_prog2_key_node,
+	NULL
 };
 
 const struct x86_dev_info cyberbook_t116_info __initconst = {
-	.gpio_button = cyberbook_t116_buttons,
-	.gpio_button_count = ARRAY_SIZE(cyberbook_t116_buttons),
+	.gpio_button_swnodes = cyberbook_t116_buttons_swnodes,
+	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
 };
 
 #define CZC_EC_EXTRA_PORT	0x68
@@ -478,22 +498,32 @@ const struct x86_dev_info nextbook_ares8a_info __initconst = {
  * This button has a WMI interface, but that is broken. Instead of trying to
  * use the broken WMI interface, instantiate a gpio-keys device for this.
  */
-static const struct x86_gpio_button peaq_c1010_button __initconst = {
-	.button = {
-		.code = KEY_SOUND,
-		.active_low = true,
-		.desc = "dolby_key",
-		.type = EV_KEY,
-		.wakeup = false,
-		.debounce_interval = 50,
-	},
-	.chip = "INT33FC:00",
-	.pin = 3,
+static const struct software_node peaq_c1010_gpio_keys_node = {
+	.name = "gpio_keys",
+};
+
+static const struct property_entry peaq_c1010_dolby_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_SOUND),
+	PROPERTY_ENTRY_STRING("label", "dolby_key"),
+	PROPERTY_ENTRY_GPIO("gpios", &baytrail_gpiochip_nodes[0], 3, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_U32("debounce-interval", 50),
+	{ }
+};
+
+static const struct software_node peaq_c1010_dolby_key_node = {
+	.parent = &peaq_c1010_gpio_keys_node,
+	.properties = peaq_c1010_dolby_key_props,
+};
+
+static const struct software_node *peaq_c1010_button_swnodes[] = {
+	&peaq_c1010_gpio_keys_node,
+	&peaq_c1010_dolby_key_node,
+	NULL
 };
 
 const struct x86_dev_info peaq_c1010_info __initconst = {
-	.gpio_button = &peaq_c1010_button,
-	.gpio_button_count = 1,
+	.gpio_button_swnodes = peaq_c1010_button_swnodes,
+	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 };
 
 /*
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index d037e3962a51..f4a67a9b74ea 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -11,7 +11,6 @@
 #define __PDX86_X86_ANDROID_TABLETS_H
 
 #include <linux/gpio/consumer.h>
-#include <linux/gpio_keys.h>
 #include <linux/i2c.h>
 #include <linux/irqdomain_defs.h>
 #include <linux/spi/spi.h>
@@ -81,12 +80,6 @@ struct x86_serdev_info {
 	const char *serdev_hid;
 };
 
-struct x86_gpio_button {
-	struct gpio_keys_button button;
-	const char *chip;
-	int pin;
-};
-
 struct x86_dev_info {
 	const char * const *modules;
 	const struct software_node *bat_swnode;
@@ -94,12 +87,11 @@ struct x86_dev_info {
 	const struct x86_spi_dev_info *spi_dev_info;
 	const struct platform_device_info *pdev_info;
 	const struct x86_serdev_info *serdev_info;
-	const struct x86_gpio_button *gpio_button;
+	const struct software_node **gpio_button_swnodes;
 	int i2c_client_count;
 	int spi_dev_count;
 	int pdev_count;
 	int serdev_count;
-	int gpio_button_count;
 	int (*init)(struct device *dev);
 	void (*exit)(void);
 	bool use_pci;
-- 
2.51.0

