Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3181D2C0F81
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 20:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758314889; cv=none; b=kwARz/FN0lBxePyK6lprsOUHSZaivrQC1NsnTxHxVW3xG4uyH87Ay2xNZVL/bcQtVFfELOgP6BQs1JgmhEHQKZ85kNuinZDEAf0COtIxLXv/se/xGRGRd340i0ibIw7y9/XW2IMTmnGm7spmEgmiHSXFekiWjxLRYf1j/geBjaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758314889; c=relaxed/simple;
	bh=acc9Ss2iDb1hyreUpZQaAXFY/dZRIT4CfkGH279SXKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DcfJqFe/5K6QCj8M5QAPOwhY3sQAZlK59Sb9klpRXUYnTbKU98XlHY9WqnqwDze92IMz3LczYaRD3ThTHYF96Z57FM1rZ4r6Te9o3/RX9KEkLG/1CQ3EHUgGo/210MLDhW0qlurACn/37/20LlGOBQy6RE3qddunVPpjY3jzX+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUkfRp2/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUkfRp2/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEBCBC4CEF9;
	Fri, 19 Sep 2025 20:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758314889;
	bh=acc9Ss2iDb1hyreUpZQaAXFY/dZRIT4CfkGH279SXKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZUkfRp2/gb8Rf7CXmhihZtrUEwev6/iSgwc3uUcLP2BEoIp/Qc+QbDhKxguv9N+S8
	 D+HsFyaHB1r76/5+YtYH3qnY7HK0RJwpfJLwH+bVhQ0C+Q05Kaao7o8R9NpWcHWl04
	 ZQ7+PBH1T9fw1cZ+IEuXhTyU50jh+ejV0flJYm84ZBl0i0wynkUDo5GuVkBGFCocpj
	 Fb9GT8AHZQBd8UewKAyhMCPhQ8eN+WfVt5AMpWKJmoZnE5VVMNz2SbVbmfWJ4izX35
	 o/7iwe0i0nrfzjUwKuk/azicpvIZg6mE1Sbh5EZE36PY6TCJ7Fw2oCGGkyRsK/EwmS
	 /BYrIrYC4dITA==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 13/19] platform/x86: x86-android-tablets: use swnode_group instead of manual registering
Date: Fri, 19 Sep 2025 22:47:36 +0200
Message-ID: <20250919204742.25581-14-hansg@kernel.org>
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

Replace manually calling software_node_register_node_group() from init()
with the new swnode_group registration mechanism.

Note this also fixes a missing software_node_unregister_node_group()
for lenovo_yt3_swnodes.

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

