Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F3A190685
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 Aug 2025 10:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756637601; cv=none; b=XU+q9xa77kTpb6pMdci+UiOA41mfHN8t4IuPQZUPqoVO7JT0oHC+5c+gyU8g0cWZzLa8UuIkUwQ9DljgRsCjU69bGEvpgKecxm/LGyJOp9vZ7XkIA9BiuQzfRXmiybI5NsZIwflI0ydk9fL/LzFe21XUnmTzAdfyOuE19+0OGFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756637601; c=relaxed/simple;
	bh=EyiUIygJ2JxATi/t5fBFWYb0AyfqPyJyLdnIJ6jw9q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OdXRgwsjVhSJGECXjAGAb/zq3EJz7qpJeyOPZzd8gHdHaAC3gEgic12A5P4mAueqIPtoUZKsKa4cPA6NUsNel8c2aS4jt7ryaHcaGk8BZJFLbt0G61cjkcA3GNs5NVtEmAE6J0/V6b3plHSF7Fcsafyw8FDkLLxHlIzmhoo1kFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WIJr7DnK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WIJr7DnK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9705CC4CEF9;
	Sun, 31 Aug 2025 10:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756637600;
	bh=EyiUIygJ2JxATi/t5fBFWYb0AyfqPyJyLdnIJ6jw9q0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WIJr7DnKOos9HqpZ1S/lkIdxy0ONNCrITdXsFdxaExt6UBhdEkNFy34t7ZET/J/xI
	 KS8/2YQ3tnwGTIDohriDOmqggOom2GFcqNeos/iFOfICSPRcWTEhDglONRp7W8Tzj4
	 pRWbmazg0GIQplqrlIyPj460YAq8zo/504I75yIvMcExVdmAMgX5xyvAfIdjz4WtVL
	 VEC9gh3JQ2/essb6BgkfPRyN7DJJBdNgqmuaNDiHE4sCJ11ZvhL0Pr0zjWWLTUCw4U
	 9BiSjmFPpZwcgwooa5TdY3Y8cMDfl5jhnVokwgKBkeBr+ZwEH2243gEFGe34DQfCQ1
	 po07GM3Tt5aMA==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/2] platform/x86: x86-android-tablets: Add support for Acer A1-840 tablet
Date: Sun, 31 Aug 2025 12:53:15 +0200
Message-ID: <20250831105315.15349-2-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250831105315.15349-1-hansg@kernel.org>
References: <20250831105315.15349-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

Add support for the Acer Iconia One 8 A1-840 (non FHD version) tablet.

This tablet has the usual issues for tablets shipped with Android as
factory OS. The DSDT is broken in various ways, so i2c_clients for
various devices as well as the INT3496 platform-device for OTG extcon
handling need to be instantiated manually by x86-android-tablets.

This table is special in that it is the first time a Bay Trail device
has been found to use the Dollar Cove TI PMIC and the first time that
the PMIC's Coulomb Counter is used as fuel-gauge.

So far this PMIC has only been used together with Cherry Trail SoCs
and always in combination with a separate full-featured fuel-gauge IC.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/acer.c   | 169 ++++++++++++++++++
 .../platform/x86/x86-android-tablets/dmi.c    |  10 ++
 .../x86-android-tablets/x86-android-tablets.h |   1 +
 3 files changed, 180 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/acer.c b/drivers/platform/x86/x86-android-tablets/acer.c
index e3ed19bdce66..6a4b02576093 100644
--- a/drivers/platform/x86/x86-android-tablets/acer.c
+++ b/drivers/platform/x86/x86-android-tablets/acer.c
@@ -15,6 +15,175 @@
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
+struct gpiod_lookup_table acer_a1_840_int3496_gpios = {
+	.dev_id = "intel-int3496",
+	.table = {
+		GPIO_LOOKUP("INT33FC:02", 1, "mux", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("INT33FC:02", 18, "id", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+static struct gpiod_lookup_table acer_a1_840_ft5416_gpios = {
+	.dev_id = "i2c-ft5416",
+	.table = {
+		GPIO_LOOKUP("INT33FC:01", 26, "reset", GPIO_ACTIVE_LOW),
+		{ }
+	},
+};
+
+static struct gpiod_lookup_table acer_a1_840_fuel_gauge_gpios = {
+	.dev_id = "chtdc_ti_battery",
+	.table = {
+		GPIO_LOOKUP("INT33FC:02", 10, "charged", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+static struct gpiod_lookup_table * const acer_a1_840_gpios[] = {
+	&acer_a1_840_int3496_gpios,
+	&acer_a1_840_ft5416_gpios,
+	&acer_a1_840_fuel_gauge_gpios,
+	NULL
+};
+
+/* Properties for the Dollar Cove TI PMIC battery MFD child used as fuel-gauge */
+static const struct property_entry acer_a1_840_fg_props[] = {
+	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_4v2_battery_node),
+	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", bq24190_psy, 1),
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
+const struct x86_dev_info acer_a1_840_info __initconst = {
+	.i2c_client_info = acer_a1_840_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(acer_a1_840_i2c_clients),
+	.pdev_info = int3496_pdevs,
+	.pdev_count = 1,
+	.gpiod_lookup_tables = acer_a1_840_gpios,
+	.bat_swnode = &generic_lipo_4v2_battery_node,
+	.init = acer_a1_840_init,
+	.exit = acer_a1_840_exit,
+};
+
 /* Acer Iconia One 7 B1-750 has an Android factory image with everything hardcoded */
 static const char * const acer_b1_750_mount_matrix[] = {
 	"-1", "0", "0",
diff --git a/drivers/platform/x86/x86-android-tablets/dmi.c b/drivers/platform/x86/x86-android-tablets/dmi.c
index 278c6d151dc4..b9baa2789177 100644
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
index dcf8d49e3b5f..4c43d717218f 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -110,6 +110,7 @@ int x86_acpi_irq_helper_get(const struct x86_acpi_irq_data *data);
  * Extern declarations of x86_dev_info structs so there can be a single
  * MODULE_DEVICE_TABLE(dmi, ...), while splitting the board descriptions.
  */
+extern const struct x86_dev_info acer_a1_840_info;
 extern const struct x86_dev_info acer_b1_750_info;
 extern const struct x86_dev_info advantech_mica_071_info;
 extern const struct x86_dev_info asus_me176c_info;
-- 
2.51.0

