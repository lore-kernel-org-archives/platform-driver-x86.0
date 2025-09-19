Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0001127FD71
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 20:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758314882; cv=none; b=rbTMOvSem1BRsZ7+ao/KMIsn2IzdvTvtvLdCxYgnHc+bQZM0hg9GDhUt8CHV9R/LbdHUZVu+ZFpEmjqCVrgikFVUqPg9BgqB7Nq9wic0QSMlMVzvAuUiWATMO5aHDsD+c4AxPUiuGWzNmAlECw7YyaGDHszxd8+D/tIRUv6bmSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758314882; c=relaxed/simple;
	bh=hsZjwHWfOrSs6gA5j0lD4MZsfSoSt7JsNQGLZNL2su0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MwnNQJqKDdCcao34INMG2BUcfRa/aVyTwy6yWUqrJeNXEVUTTSCVXPVU7TH/wHq/WzMkTN5pY3Mxs1Jc74hRzIfYQhCgOt85AabWFBuOw+d2ffUWwmEvLBKb1IrfFZRwJWcRwpnbJ/DgZAT42P00S5vyeJEjq6AukLa1mH7ilV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvMXyAk8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvMXyAk8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4B8C4CEF0;
	Fri, 19 Sep 2025 20:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758314881;
	bh=hsZjwHWfOrSs6gA5j0lD4MZsfSoSt7JsNQGLZNL2su0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QvMXyAk8oKD9zCp2Nrqh2KRijVH7H+M5ce98j/pi/lAeHMWJxhIpQ11oH23cjtipP
	 4VZP/LWUcFqCWquywMtEsq6s1CCUkjJ4GKWbo0wt3B+XAqFrkG5dBHuiJ8PWHdMN/R
	 GXB6Y0+PzAnrwaXLZcdmYh3B2Z/+kePt44oJ81iBfdKMOEYk3OJMN/T7mrTLj6MyQJ
	 yDuB21qy0hyb2LgigDjwZn6HV+iTg/k9Cze0YJatxJyTcipvVI/+pPll+4vmjmevqI
	 04OMu3p4lXgqEL5rtx3shulwi18y6uWqttP0HfiqXOIs0hqENGE3a1evg8QBLTSH5B
	 DxGCBoW/QAIxw==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 09/19] platform/x86: x86-android-tablets: convert Yoga Tab2 fast charger to GPIO references
Date: Fri, 19 Sep 2025 22:47:32 +0200
Message-ID: <20250919204742.25581-10-hansg@kernel.org>
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
driver away from using GPIO lookup tables for the fast charger device
to using PROPERTY_ENTRY_GPIO().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Tested-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Changes in v3:
- Make yoga-tab2-pro-1380-fastcharger.c propagate the fwnode set on
  the platform-device to the serdev it creates
- Mark lenovo_yoga_tab2_1380_fc_props[] __initconst
---
 .../lenovo/yoga-tab2-pro-1380-fastcharger.c   |  7 ++++++
 .../platform/x86/x86-android-tablets/lenovo.c | 23 +++++++------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
index 1b33c977f6d7..cca8e644f4e7 100644
--- a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
+++ b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
@@ -255,6 +255,13 @@ static int yt2_1380_fc_pdev_probe(struct platform_device *pdev)
 	if (!serdev)
 		return -ENOMEM;
 
+	/*
+	 * Propagate pdev-fwnode set by x86-android-tablets to serdev.
+	 * The pdev-fwnode is a managed node, so it will be auto-put on
+	 * serdev_device_put().
+	 */
+	device_set_node(&serdev->dev, fwnode_handle_get(dev_fwnode(&pdev->dev)));
+
 	ret = serdev_device_add(serdev);
 	if (ret) {
 		serdev_device_put(serdev);
diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index aaa946bb1e7c..7d1808a3437f 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -741,11 +741,18 @@ static const struct x86_i2c_client_info lenovo_yoga_tab2_1380_i2c_clients[] __in
 	}
 };
 
+static const struct property_entry lenovo_yoga_tab2_1380_fc_props[] __initconst = {
+	PROPERTY_ENTRY_GPIO("uart3_txd-gpios", &baytrail_gpiochip_nodes[0], 57, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("uart3_rxd-gpios", &baytrail_gpiochip_nodes[0], 61, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
 static const struct platform_device_info lenovo_yoga_tab2_1380_pdevs[] __initconst = {
 	{
 		/* For the Tablet 2 Pro 1380's custom fast charging driver */
 		.name = "lenovo-yoga-tab2-pro-1380-fastcharger",
 		.id = PLATFORM_DEVID_NONE,
+		.properties = lenovo_yoga_tab2_1380_fc_props,
 	},
 };
 
@@ -775,20 +782,6 @@ static int __init lenovo_yoga_tab2_1380_init(struct device *dev)
 	return 0;
 }
 
-static struct gpiod_lookup_table lenovo_yoga_tab2_1380_fc_gpios = {
-	.dev_id = "serial0-0",
-	.table = {
-		GPIO_LOOKUP("INT33FC:00", 57, "uart3_txd", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("INT33FC:00", 61, "uart3_rxd", GPIO_ACTIVE_HIGH),
-		{ }
-	},
-};
-
-static struct gpiod_lookup_table * const lenovo_yoga_tab2_1380_gpios[] = {
-	&lenovo_yoga_tab2_1380_fc_gpios,
-	NULL
-};
-
 const struct x86_dev_info lenovo_yoga_tab2_1380_info __initconst = {
 	.i2c_client_info = lenovo_yoga_tab2_1380_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(lenovo_yoga_tab2_1380_i2c_clients),
@@ -796,9 +789,9 @@ const struct x86_dev_info lenovo_yoga_tab2_1380_info __initconst = {
 	.pdev_count = ARRAY_SIZE(lenovo_yoga_tab2_1380_pdevs),
 	.gpio_button = &lenovo_yoga_tab2_830_1050_lid,
 	.gpio_button_count = 1,
-	.gpiod_lookup_tables = lenovo_yoga_tab2_1380_gpios,
 	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
 	.modules = lenovo_yoga_tab2_1380_modules,
+	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 	.init = lenovo_yoga_tab2_1380_init,
 	.exit = lenovo_yoga_tab2_830_1050_exit,
 };
-- 
2.51.0

