Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B950826A1AB
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 20:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758398861; cv=none; b=P2Y7l/IQOOH3oiWWWpiXo+AkoKeuApcnETuL2NLA/qy2BH+8d4Hy2J5oLgHj972PaeElJillxR+Z/U/UdPAPwaudXBBnShgJ35zuwRUVZhAH0thkMj0wA0vV8LcucsDF1TSXIVDNL9098zPwBUy9KAmo7KmKUFIOzn+QUXzXKEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758398861; c=relaxed/simple;
	bh=sXmlmzKCAGZKDGfQj8Wczk0srRpfxk+3yyDsxYXxlys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oNyxIaIkJZv/VnHd371Xg+ngimJIR7EwRRy8F0wWjpX/GiSsOgLUcMwOGXb2WIeNn2WaE3p4Crw5D1Fe2n2DkL/Ofzcp1sWLtnQa3u6vS3EJ8/h3TqQAGtgQchwp6RRRqf4Ipa/OL+VzXURHzDjIZ3pgjKPcKPRxBzMqgLS5Olw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLoOxzVD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLoOxzVD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E743BC4CEF9;
	Sat, 20 Sep 2025 20:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758398861;
	bh=sXmlmzKCAGZKDGfQj8Wczk0srRpfxk+3yyDsxYXxlys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oLoOxzVDPl9Nj8ZHX0Sj7y8ciuO80lnzdieMN8HGcF5XKrki/ZfG+87V3/TNIabT6
	 YWDfAkj3OsBKN0TpQ+yGO2TttOUgK/5GY47lvb2yq7tz3L4aYXUSn9LTfamdU3m5RR
	 5fjUSmcYTQkfON6pRQ9yWRKuLTg55yiJHaL/OrzFCkiZ2tRLrO7ejThSSnosVlfLEA
	 U92XVLp165WxHES5+NJHm1VPk+Q/qxohY/3zOaX/Y2LjGLjKwULmY1wm8aiOLByaLe
	 oFuPJQDNCWMEkfx5yLkOkJCRM7n2N4v7AAgKgqeEhhXPZESNy5i40W84wlxIH34hF2
	 BNrBAogJGCSYA==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 13/20] platform/x86: x86-android-tablets: use swnode_group instead of manual registering
Date: Sat, 20 Sep 2025 22:07:06 +0200
Message-ID: <20250920200713.20193-14-hansg@kernel.org>
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

Replace manually calling software_node_register_node_group() from init()
with the new swnode_group registration mechanism.

Note this also fixes a missing software_node_unregister_node_group()
for lenovo_yt3_swnodes.

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 .../platform/x86/x86-android-tablets/lenovo.c | 21 +++++--------------
 .../platform/x86/x86-android-tablets/other.c  | 14 ++-----------
 2 files changed, 7 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 66617f6ff13e..1f325b2947ab 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -436,6 +436,7 @@ static const struct software_node *lenovo_yoga_tab2_830_1050_swnodes[] = {
 	&crystalcove_gpiochip_node,
 	&arizona_gpiochip_node,
 	&lenovo_yoga_tab2_830_1050_wm5102,
+	&generic_lipo_hv_4v35_battery_node,
 	NULL
 };
 
@@ -448,7 +449,7 @@ const struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initconst = {
 	.pdev_info = lenovo_yoga_tab2_830_1050_pdevs,
 	.pdev_count = ARRAY_SIZE(lenovo_yoga_tab2_830_1050_pdevs),
 	.gpio_button_swnodes = lenovo_yoga_tab2_830_1050_lid_swnodes,
-	.swnode_group = generic_lipo_hv_4v35_battery_swnodes,
+	.swnode_group = lenovo_yoga_tab2_830_1050_swnodes,
 	.modules = bq24190_modules,
 	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 	.init = lenovo_yoga_tab2_830_1050_init,
@@ -534,24 +535,16 @@ static int __init lenovo_yoga_tab2_830_1050_init_codec(void)
 		goto err_unregister_mappings;
 	}
 
-	ret = software_node_register_node_group(lenovo_yoga_tab2_830_1050_swnodes);
-	if (ret) {
-		ret = dev_err_probe(codec_dev, ret, "registering software nodes\n");
-		goto err_put_pinctrl;
-	}
-
 	ret = device_add_software_node(codec_dev, &lenovo_yoga_tab2_830_1050_wm5102);
 	if (ret) {
 		ret = dev_err_probe(codec_dev, ret, "adding software node\n");
-		goto err_unregister_swnodes;
+		goto err_put_pinctrl;
 	}
 
 	lenovo_yoga_tab2_830_1050_codec_dev = codec_dev;
 	lenovo_yoga_tab2_830_1050_codec_pinctrl = pinctrl;
 	return 0;
 
-err_unregister_swnodes:
-	software_node_unregister_node_group(lenovo_yoga_tab2_830_1050_swnodes);
 err_put_pinctrl:
 	pinctrl_put(lenovo_yoga_tab2_830_1050_codec_pinctrl);
 err_unregister_mappings:
@@ -604,7 +597,6 @@ static void lenovo_yoga_tab2_830_1050_exit(void)
 	if (lenovo_yoga_tab2_830_1050_codec_dev) {
 		device_remove_software_node(lenovo_yoga_tab2_830_1050_codec_dev);
 		put_device(lenovo_yoga_tab2_830_1050_codec_dev);
-		software_node_unregister_node_group(lenovo_yoga_tab2_830_1050_swnodes);
 	}
 
 	if (lenovo_yoga_tab2_830_1050_codec_pinctrl) {
@@ -812,7 +804,7 @@ const struct x86_dev_info lenovo_yoga_tab2_1380_info __initconst = {
 	.pdev_info = lenovo_yoga_tab2_1380_pdevs,
 	.pdev_count = ARRAY_SIZE(lenovo_yoga_tab2_1380_pdevs),
 	.gpio_button_swnodes = lenovo_yoga_tab2_830_1050_lid_swnodes,
-	.swnode_group = generic_lipo_hv_4v35_battery_swnodes,
+	.swnode_group = lenovo_yoga_tab2_830_1050_swnodes,
 	.modules = lenovo_yoga_tab2_1380_modules,
 	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 	.init = lenovo_yoga_tab2_1380_init,
@@ -1071,10 +1063,6 @@ static int __init lenovo_yt3_init(struct device *dev)
 	intel_soc_pmic_exec_mipi_pmic_seq_element(0x6e, 0x9b, 0x02, 0xff);
 	intel_soc_pmic_exec_mipi_pmic_seq_element(0x6e, 0xa0, 0x02, 0xff);
 
-	ret = software_node_register_node_group(lenovo_yt3_swnodes);
-	if (ret)
-		return dev_err_probe(dev, ret, "registering software nodes\n");
-
 	return 0;
 }
 
@@ -1083,6 +1071,7 @@ const struct x86_dev_info lenovo_yt3_info __initconst = {
 	.i2c_client_count = ARRAY_SIZE(lenovo_yt3_i2c_clients),
 	.spi_dev_info = lenovo_yt3_spi_devs,
 	.spi_dev_count = ARRAY_SIZE(lenovo_yt3_spi_devs),
+	.swnode_group = lenovo_yt3_swnodes,
 	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
 	.init = lenovo_yt3_init,
 };
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index 1362f4167e3d..174f02322e52 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -895,7 +895,6 @@ static int xiaomi_mipad2_brightness_set(struct led_classdev *led_cdev,
 static int __init xiaomi_mipad2_init(struct device *dev)
 {
 	struct led_classdev *led_cdev;
-	int ret;
 
 	xiaomi_mipad2_led_pwm = devm_pwm_get(dev, "pwm_soc_lpss_2");
 	if (IS_ERR(xiaomi_mipad2_led_pwm))
@@ -912,16 +911,7 @@ static int __init xiaomi_mipad2_init(struct device *dev)
 	/* Turn LED off during suspend */
 	led_cdev->flags = LED_CORE_SUSPENDRESUME;
 
-	ret = devm_led_classdev_register(dev, led_cdev);
-	if (ret)
-		return dev_err_probe(dev, ret, "registering LED\n");
-
-	return software_node_register_node_group(ktd2026_node_group);
-}
-
-static void xiaomi_mipad2_exit(void)
-{
-	software_node_unregister_node_group(ktd2026_node_group);
+	return devm_led_classdev_register(dev, led_cdev);
 }
 
 /*
@@ -956,6 +946,6 @@ static const struct x86_i2c_client_info xiaomi_mipad2_i2c_clients[] __initconst
 const struct x86_dev_info xiaomi_mipad2_info __initconst = {
 	.i2c_client_info = xiaomi_mipad2_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(xiaomi_mipad2_i2c_clients),
+	.swnode_group = ktd2026_node_group,
 	.init = xiaomi_mipad2_init,
-	.exit = xiaomi_mipad2_exit,
 };
-- 
2.51.0

