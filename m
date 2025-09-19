Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB7729B78D
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 20:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758314894; cv=none; b=oT9ihzaCdAE3W7RhSXMJPQcG/t79ReAl2CIJ1jD2ou6GIDvyaWzU9sfT26Z86jiT9vOcd4PNHnOoQPbh2wIgutztZuB5ter1CIniUGKs/TXLdF/O9E6j8fISAHzrCTtBp87DTHRZr1TGcnmxJBpKThg8C8mEZzkfGqeu+GK0JzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758314894; c=relaxed/simple;
	bh=gi3mpGke5upHMmKDhzWh+qphGbiVt5Q8RsF6kofaSKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMf5CtBn35Y/XYeu+SuP1I9sPbTuPVu4I08CMYN7JnsIajAVlZhpsF5Uj42QYbZlKPAn+OrWi9JVJweEy++Jac9j8BgD8lVlcjb1CKa7KAJsUb0T9fSXpMOfObcdJrI5l1QQPaZO4vjS3ftUStB50FypuX6tlnY5bQLZRGwkS4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0Yx8QvD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0Yx8QvD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3FAC4CEF0;
	Fri, 19 Sep 2025 20:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758314894;
	bh=gi3mpGke5upHMmKDhzWh+qphGbiVt5Q8RsF6kofaSKk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E0Yx8QvD1d1ZBAdJRxg3PX0FL1NWmk9HHyUFqIiHKg+Ietymg94FIAw12/6kZQnhR
	 TWW3Ou7MZu/ZnJ9jZO30LiKXH1uBL1+6iDEWD3ys6fsjEemajS3Q5eOQbNEc54VXTz
	 WshqHns5JD9FqJIZx7dDS1Y5eTgbKFIsepFzU5eiS6Xj1UpKRFRI3EiCYalCxRe+1N
	 pbgsxm0ueiWJUyFS6cvlvy4SeER4bJwvP6qFmJeB3g9hFfNxMiTLzv8mVJzgiMguEC
	 bUaVXPF7WNkSHuGWE2WSY46ucUTYEBc+/pbLg7iZhkP4EyRlGv+vb8G41FoV8ZxCvw
	 ADEHCPWd/NXDg==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 16/19] platform/x86: x86-android-tablets: Add support for Acer A1-840 tablet
Date: Fri, 19 Sep 2025 22:47:39 +0200
Message-ID: <20250919204742.25581-17-hansg@kernel.org>
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

Add support for the Acer Iconia One 8 A1-840 (non FHD version) tablet.

This tablet has the usual issues for tablets shipped with Android as
factory OS. The DSDT is broken in various ways, so i2c_clients for
various devices as well as the INT3496 platform-device for OTG extcon
handling need to be instantiated manually by x86-android-tablets.

This tablet is special in that it is the first time a Bay Trail device
has been found to use the Dollar Cove TI PMIC and the first time that
the PMIC's Coulomb Counter is used as fuel-gauge.

So far this PMIC has only been used together with Cherry Trail SoCs
and always in combination with a separate full-featured fuel-gauge IC.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Changes in v3:
- Rebase on top of Dmitry's GPIO software node reference series and
  use GPIO swnode references instead of GPIO lookup tables
- Use the new swnode_group register mechanism to simplify init() and exit()
---
 .../platform/x86/x86-android-tablets/acer.c   | 160 ++++++++++++++++++
 .../platform/x86/x86-android-tablets/dmi.c    |  10 ++
 .../x86-android-tablets/x86-android-tablets.h |   1 +
 3 files changed, 171 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/acer.c b/drivers/platform/x86/x86-android-tablets/acer.c
index e5850da8037a..d48c70ffd992 100644
--- a/drivers/platform/x86/x86-android-tablets/acer.c
+++ b/drivers/platform/x86/x86-android-tablets/acer.c
@@ -16,6 +16,166 @@
 #include "shared-psy-info.h"
 #include "x86-android-tablets.h"
 
+/* Acer Iconia One 8 A1-840 (non FHD version) */
+static const struct property_entry acer_a1_840_bq24190_props[] = {
+	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_4v2_battery_node),
+	PROPERTY_ENTRY_BOOL("omit-battery-class"),
+	PROPERTY_ENTRY_BOOL("disable-reset"),
+	{ }
+};
+
+static const struct software_node acer_a1_840_bq24190_node = {
+	.properties = acer_a1_840_bq24190_props,
+};
+
+static const struct property_entry acer_a1_840_touchscreen_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 800),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpiochip_nodes[1], 26, GPIO_ACTIVE_LOW),
+	{ }
+};
+
+static const struct software_node acer_a1_840_touchscreen_node = {
+	.properties = acer_a1_840_touchscreen_props,
+};
+
+static const struct x86_i2c_client_info acer_a1_840_i2c_clients[] __initconst = {
+	{
+		/* BQ24297 charger IC */
+		.board_info = {
+			.type = "bq24297",
+			.addr = 0x6b,
+			.dev_name = "bq24297",
+			.swnode = &acer_a1_840_bq24190_node,
+			.platform_data = &bq24190_pdata,
+		},
+		.adapter_path = "\\_SB_.I2C1",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FC:02",
+			.index = 2,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+			.con_id = "bq24297_irq",
+		},
+	}, {
+		/* MPU6515 sensors */
+		.board_info = {
+			.type = "mpu6515",
+			.addr = 0x69,
+			.dev_name = "mpu6515",
+		},
+		.adapter_path = "\\_SB_.I2C3",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_APIC,
+			.index = 0x47,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_HIGH,
+		},
+	}, {
+		/* FT5416 touchscreen controller */
+		.board_info = {
+			.type = "edt-ft5x06",
+			.addr = 0x38,
+			.dev_name = "ft5416",
+			.swnode = &acer_a1_840_touchscreen_node,
+		},
+		.adapter_path = "\\_SB_.I2C4",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_APIC,
+			.index = 0x45,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_HIGH,
+		},
+	}
+};
+
+static const struct property_entry acer_a1_840_int3496_props[] __initconst = {
+	PROPERTY_ENTRY_GPIO("mux-gpios", &baytrail_gpiochip_nodes[2], 1, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("id-gpios", &baytrail_gpiochip_nodes[2], 18, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct platform_device_info acer_a1_840_pdevs[] __initconst = {
+	{
+		/* For micro USB ID pin handling */
+		.name = "intel-int3496",
+		.id = PLATFORM_DEVID_NONE,
+		.properties = acer_a1_840_int3496_props,
+	},
+};
+
+/* Properties for the Dollar Cove TI PMIC battery MFD child used as fuel-gauge */
+static const struct property_entry acer_a1_840_fg_props[] = {
+	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_4v2_battery_node),
+	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", bq24190_psy, 1),
+	PROPERTY_ENTRY_GPIO("charged-gpios", &baytrail_gpiochip_nodes[2], 10, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static struct device *acer_a1_840_fg_dev;
+static struct fwnode_handle *acer_a1_840_fg_node;
+
+static int __init acer_a1_840_init(struct device *dev)
+{
+	int ret;
+
+	acer_a1_840_fg_dev = bus_find_device_by_name(&platform_bus_type, NULL, "chtdc_ti_battery");
+	if (!acer_a1_840_fg_dev)
+		return dev_err_probe(dev, -EPROBE_DEFER, "getting chtdc_ti_battery dev\n");
+
+	acer_a1_840_fg_node = fwnode_create_software_node(acer_a1_840_fg_props, NULL);
+	if (IS_ERR(acer_a1_840_fg_node)) {
+		ret = PTR_ERR(acer_a1_840_fg_node);
+		goto err_put;
+	}
+
+	ret = device_add_software_node(acer_a1_840_fg_dev,
+				       to_software_node(acer_a1_840_fg_node));
+	if (ret)
+		goto err_put;
+
+	return 0;
+
+err_put:
+	fwnode_handle_put(acer_a1_840_fg_node);
+	acer_a1_840_fg_node = NULL;
+	put_device(acer_a1_840_fg_dev);
+	acer_a1_840_fg_dev = NULL;
+	return ret;
+}
+
+static void acer_a1_840_exit(void)
+{
+	device_remove_software_node(acer_a1_840_fg_dev);
+	/*
+	 * Skip fwnode_handle_put(acer_a1_840_fg_node), instead leak the node.
+	 * The intel_dc_ti_battery driver may still reference the strdup-ed
+	 * "supplied-from" string. This string will be free-ed if the node
+	 * is released.
+	 */
+	acer_a1_840_fg_node = NULL;
+	put_device(acer_a1_840_fg_dev);
+	acer_a1_840_fg_dev = NULL;
+}
+
+static const char * const acer_a1_840_modules[] __initconst = {
+	"bq24190_charger",	/* For the Vbus regulator for intel-int3496 */
+	NULL
+};
+
+const struct x86_dev_info acer_a1_840_info __initconst = {
+	.i2c_client_info = acer_a1_840_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(acer_a1_840_i2c_clients),
+	.pdev_info = acer_a1_840_pdevs,
+	.pdev_count = ARRAY_SIZE(acer_a1_840_pdevs),
+	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
+	.swnode_group = generic_lipo_4v2_battery_swnodes,
+	.modules = acer_a1_840_modules,
+	.init = acer_a1_840_init,
+	.exit = acer_a1_840_exit,
+};
+
 /* Acer Iconia One 7 B1-750 has an Android factory image with everything hardcoded */
 static const char * const acer_b1_750_mount_matrix[] = {
 	"-1", "0", "0",
diff --git a/drivers/platform/x86/x86-android-tablets/dmi.c b/drivers/platform/x86/x86-android-tablets/dmi.c
index ebba7400d5c9..4a5720d6fc1d 100644
--- a/drivers/platform/x86/x86-android-tablets/dmi.c
+++ b/drivers/platform/x86/x86-android-tablets/dmi.c
@@ -16,6 +16,16 @@
 #include "x86-android-tablets.h"
 
 const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
+	{
+		/* Acer Iconia One 8 A1-840 (non FHD version) */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "BayTrail"),
+			/* Above strings are too generic also match BIOS date */
+			DMI_MATCH(DMI_BIOS_DATE, "04/01/2014"),
+		},
+		.driver_data = (void *)&acer_a1_840_info,
+	},
 	{
 		/* Acer Iconia One 7 B1-750 */
 		.matches = {
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index 8e7d04bcb3f8..2498390958ad 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -111,6 +111,7 @@ extern const struct software_node cherryview_gpiochip_nodes[];
  * Extern declarations of x86_dev_info structs so there can be a single
  * MODULE_DEVICE_TABLE(dmi, ...), while splitting the board descriptions.
  */
+extern const struct x86_dev_info acer_a1_840_info;
 extern const struct x86_dev_info acer_b1_750_info;
 extern const struct x86_dev_info advantech_mica_071_info;
 extern const struct x86_dev_info asus_me176c_info;
-- 
2.51.0

