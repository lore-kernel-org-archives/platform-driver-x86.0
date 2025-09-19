Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABB52C15AF
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 20:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758314878; cv=none; b=pfolQa0VakbdwvNjvJZpSyqktZXVqnqHtUqHTI91lawXhpjAR/5BjYDfZjjngeBEX5u807+zuVjGfGZwVAI5GAS29GaV7jME4tNY4yBlOygqFF+c4VaCa8Vzct68dxTxURXf6+Mvad2PItDB+St1M9Ee6L3+DDQSBF9GOnmYLe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758314878; c=relaxed/simple;
	bh=/DuNnswPeJOe/PaiO9NsgiRAwZ7BADqETbA57fZ5wZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e7vQWSZ7+38nHDSaQ9Omib50bY8a/Eid19zSbYDNz3Fg5qMo/kLXTqWJj5+hglVD1aBz0EUC131hyOiDNSe1cr3Dq8wI+N7vxPnPwWKX1TRaWcmyUTPI8IOLG6ZvUhy5n+odhQAHTX72mrTLVudeoopUr2D8Zh0wjUUhU/Lbrlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6gdBV++; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6gdBV++"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33E9C4CEF7;
	Fri, 19 Sep 2025 20:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758314878;
	bh=/DuNnswPeJOe/PaiO9NsgiRAwZ7BADqETbA57fZ5wZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P6gdBV++uVuAPV09IrFmDuq7MGXC8TV9F0tMUOsiMR+gedj3pmhyS7SuZSxRHjOsP
	 rl2vSOMlKP2RZx6J+4xCUxoKpp1BO9SeatSxmsKR/75v43/kszn57zvPW7sYrwOBOi
	 Oa/RUeVLE/kJXCH255eN9iwbntOHC3rAk7SPtMTwsqFvzV3R0LZOKeScjA/Yx/iOz/
	 OQ5UAxhiyXl4kXxN75qjM0zo2O9k7FIywPVWYn8OjLUlI5CAG+UHoiBkO2658aV5pV
	 vl8yAsE+D/2gS4jbxE8W3cmEUFosTtkGyk8oQUbbfmTJiPcjT6YVGMI0YjnESn0SqR
	 oQdXxtx8sn6Ng==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 07/19] platform/x86: x86-android-tablets: convert wm1502 devices to GPIO references
Date: Fri, 19 Sep 2025 22:47:30 +0200
Message-ID: <20250919204742.25581-8-hansg@kernel.org>
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
driver away from using GPIO lookup tables for wm1502 devices to using
PROPERTY_ENTRY_GPIO().

Adding a swnode to the yt3 spi device changes the name of the SPI/codec
device and the sound/soc/intel/boards/bytcr_wm5102.c machine driver looks
up the code by name, update the machine driver to use the new name.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Tested-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Changes in v3:
- Add pinctrl_put() to error-exit paths in lenovo_yoga_tab2_830_1050_init_codec()
- Share arizona_gpiochip_node between yoga tablet2 and yoga tab3 settings
- Give lenovo_yt3_wm5102 swnode a name so that the codec SPI-dev gets a stable name
- Adjust sound/soc/intel/boards/bytcr_wm5102.c for the new SPI/codec dev-name
---
 .../platform/x86/x86-android-tablets/lenovo.c | 107 ++++++++++++------
 sound/soc/intel/boards/bytcr_wm5102.c         |   2 +-
 2 files changed, 76 insertions(+), 33 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index db6337671357..aaa946bb1e7c 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -60,6 +60,14 @@ static struct lp855x_platform_data lenovo_lp8557_reg_only_pdata = {
 	.initial_brightness = 128,
 };
 
+static const struct software_node arizona_gpiochip_node = {
+	.name = "arizona",
+};
+
+static const struct software_node crystalcove_gpiochip_node = {
+	.name = "gpio_crystalcove",
+};
+
 /* Lenovo Yoga Book X90F / X90L's Android factory image has everything hardcoded */
 
 static const struct property_entry lenovo_yb1_x90_goodix_props[] = {
@@ -383,19 +391,26 @@ static const struct platform_device_info lenovo_yoga_tab2_830_1050_pdevs[] __ini
 
 #define LENOVO_YOGA_TAB2_830_1050_CODEC_NAME "spi-10WM5102:00"
 
-static struct gpiod_lookup_table lenovo_yoga_tab2_830_1050_codec_gpios = {
-	.dev_id = LENOVO_YOGA_TAB2_830_1050_CODEC_NAME,
-	.table = {
-		GPIO_LOOKUP("gpio_crystalcove", 3, "reset", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("INT33FC:01", 23, "wlf,ldoena", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("arizona", 2, "wlf,spkvdd-ena", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("arizona", 4, "wlf,micd-pol", GPIO_ACTIVE_LOW),
-		{ }
-	},
+static const struct property_entry lenovo_yoga_tab2_830_1050_wm1502_props[] = {
+	PROPERTY_ENTRY_GPIO("reset-gpios",
+			    &crystalcove_gpiochip_node, 3, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("wlf,ldoena-gpios",
+			    &baytrail_gpiochip_nodes[1], 23, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("wlf,spkvdd-ena-gpios",
+			    &arizona_gpiochip_node, 2, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("wlf,micd-pol-gpios",
+			    &arizona_gpiochip_node, 4, GPIO_ACTIVE_LOW),
+	{ }
 };
 
-static struct gpiod_lookup_table * const lenovo_yoga_tab2_830_1050_gpios[] = {
-	&lenovo_yoga_tab2_830_1050_codec_gpios,
+static const struct software_node lenovo_yoga_tab2_830_1050_wm5102 = {
+	.properties = lenovo_yoga_tab2_830_1050_wm1502_props,
+};
+
+static const struct software_node *lenovo_yoga_tab2_830_1050_swnodes[] = {
+	&crystalcove_gpiochip_node,
+	&arizona_gpiochip_node,
+	&lenovo_yoga_tab2_830_1050_wm5102,
 	NULL
 };
 
@@ -409,7 +424,6 @@ const struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initconst = {
 	.pdev_count = ARRAY_SIZE(lenovo_yoga_tab2_830_1050_pdevs),
 	.gpio_button = &lenovo_yoga_tab2_830_1050_lid,
 	.gpio_button_count = 1,
-	.gpiod_lookup_tables = lenovo_yoga_tab2_830_1050_gpios,
 	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
 	.modules = bq24190_modules,
 	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
@@ -469,6 +483,7 @@ static const struct pinctrl_map lenovo_yoga_tab2_830_1050_codec_pinctrl_map =
 	PIN_MAP_MUX_GROUP(LENOVO_YOGA_TAB2_830_1050_CODEC_NAME, "codec_32khz_clk",
 			  "INT33FC:02", "pmu_clk2_grp", "pmu_clk");
 
+static struct device *lenovo_yoga_tab2_830_1050_codec_dev;
 static struct pinctrl *lenovo_yoga_tab2_830_1050_codec_pinctrl;
 static struct sys_off_handler *lenovo_yoga_tab2_830_1050_sys_off_handler;
 
@@ -495,12 +510,26 @@ static int __init lenovo_yoga_tab2_830_1050_init_codec(void)
 		goto err_unregister_mappings;
 	}
 
-	/* We're done with the codec_dev now */
-	put_device(codec_dev);
+	ret = software_node_register_node_group(lenovo_yoga_tab2_830_1050_swnodes);
+	if (ret) {
+		ret = dev_err_probe(codec_dev, ret, "registering software nodes\n");
+		goto err_put_pinctrl;
+	}
 
+	ret = device_add_software_node(codec_dev, &lenovo_yoga_tab2_830_1050_wm5102);
+	if (ret) {
+		ret = dev_err_probe(codec_dev, ret, "adding software node\n");
+		goto err_unregister_swnodes;
+	}
+
+	lenovo_yoga_tab2_830_1050_codec_dev = codec_dev;
 	lenovo_yoga_tab2_830_1050_codec_pinctrl = pinctrl;
 	return 0;
 
+err_unregister_swnodes:
+	software_node_unregister_node_group(lenovo_yoga_tab2_830_1050_swnodes);
+err_put_pinctrl:
+	pinctrl_put(lenovo_yoga_tab2_830_1050_codec_pinctrl);
 err_unregister_mappings:
 	pinctrl_unregister_mappings(&lenovo_yoga_tab2_830_1050_codec_pinctrl_map);
 err_put_device:
@@ -548,6 +577,12 @@ static void lenovo_yoga_tab2_830_1050_exit(void)
 {
 	unregister_sys_off_handler(lenovo_yoga_tab2_830_1050_sys_off_handler);
 
+	if (lenovo_yoga_tab2_830_1050_codec_dev) {
+		device_remove_software_node(lenovo_yoga_tab2_830_1050_codec_dev);
+		put_device(lenovo_yoga_tab2_830_1050_codec_dev);
+		software_node_unregister_node_group(lenovo_yoga_tab2_830_1050_swnodes);
+	}
+
 	if (lenovo_yoga_tab2_830_1050_codec_pinctrl) {
 		pinctrl_put(lenovo_yoga_tab2_830_1050_codec_pinctrl);
 		pinctrl_unregister_mappings(&lenovo_yoga_tab2_830_1050_codec_pinctrl_map);
@@ -750,7 +785,6 @@ static struct gpiod_lookup_table lenovo_yoga_tab2_1380_fc_gpios = {
 };
 
 static struct gpiod_lookup_table * const lenovo_yoga_tab2_1380_gpios[] = {
-	&lenovo_yoga_tab2_830_1050_codec_gpios,
 	&lenovo_yoga_tab2_1380_fc_gpios,
 	NULL
 };
@@ -947,12 +981,34 @@ static struct arizona_pdata lenovo_yt3_wm5102_pdata = {
 	},
 };
 
+static const struct property_entry lenovo_yt3_wm1502_props[] = {
+	PROPERTY_ENTRY_GPIO("wlf,spkvdd-ena-gpios",
+			    &cherryview_gpiochip_nodes[0], 75, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("wlf,ldoena-gpios",
+			    &cherryview_gpiochip_nodes[0], 81, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[0], 82, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("wlf,micd-pol-gpios", &arizona_gpiochip_node, 2, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node lenovo_yt3_wm5102 = {
+	.properties = lenovo_yt3_wm1502_props,
+	.name = "wm5102",
+};
+
+static const struct software_node *lenovo_yt3_swnodes[] = {
+	&arizona_gpiochip_node,
+	&lenovo_yt3_wm5102,
+	NULL
+};
+
 static const struct x86_spi_dev_info lenovo_yt3_spi_devs[] __initconst = {
 	{
 		/* WM5102 codec */
 		.board_info = {
 			.modalias = "wm5102",
 			.platform_data = &lenovo_yt3_wm5102_pdata,
+			.swnode = &lenovo_yt3_wm5102,
 			.max_speed_hz = 5000000,
 		},
 		.ctrl_path = "\\_SB_.PCI0.SPI1",
@@ -999,31 +1055,18 @@ static int __init lenovo_yt3_init(struct device *dev)
 	intel_soc_pmic_exec_mipi_pmic_seq_element(0x6e, 0x9b, 0x02, 0xff);
 	intel_soc_pmic_exec_mipi_pmic_seq_element(0x6e, 0xa0, 0x02, 0xff);
 
+	ret = software_node_register_node_group(lenovo_yt3_swnodes);
+	if (ret)
+		return dev_err_probe(dev, ret, "registering software nodes\n");
+
 	return 0;
 }
 
-static struct gpiod_lookup_table lenovo_yt3_wm5102_gpios = {
-	.dev_id = "spi1.0",
-	.table = {
-		GPIO_LOOKUP("INT33FF:00", 75, "wlf,spkvdd-ena", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("INT33FF:00", 81, "wlf,ldoena", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("INT33FF:00", 82, "reset", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("arizona", 2, "wlf,micd-pol", GPIO_ACTIVE_HIGH),
-		{ }
-	},
-};
-
-static struct gpiod_lookup_table * const lenovo_yt3_gpios[] = {
-	&lenovo_yt3_wm5102_gpios,
-	NULL
-};
-
 const struct x86_dev_info lenovo_yt3_info __initconst = {
 	.i2c_client_info = lenovo_yt3_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(lenovo_yt3_i2c_clients),
 	.spi_dev_info = lenovo_yt3_spi_devs,
 	.spi_dev_count = ARRAY_SIZE(lenovo_yt3_spi_devs),
-	.gpiod_lookup_tables = lenovo_yt3_gpios,
 	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
 	.init = lenovo_yt3_init,
 };
diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index a6dfbcfdf74e..da0fdb8d677d 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -552,7 +552,7 @@ static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
 		acpi_dev_put(adev);
 	} else {
 		/* Special case for when the codec is missing from the DSTD */
-		strscpy(codec_name, "spi1.0", sizeof(codec_name));
+		strscpy(codec_name, "spi-wm5102", sizeof(codec_name));
 	}
 
 	codec_dev = bus_find_device_by_name(&spi_bus_type, NULL, codec_name);
-- 
2.51.0

