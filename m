Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564F6269B0D
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 20:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758398854; cv=none; b=eWwVeqD6oOy7qiOPqamx1vFVqlagKY3XzwvDq9nd6YGu52qTd2SuR+pwjM0S5o+hxw9cFzOAtNHzKeO+mDz4cLc31axaTGl/63N7R4NBkgnfS8yTAv8CD2hacPXZINiJ/lXfteZkBEE0p2NbFEWvuNsOFtUbsPavAMsCX2PAT50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758398854; c=relaxed/simple;
	bh=4bi2Jq7IHPSsCx1euv23BO9pKWxjKwoYWIU+MWy0Vkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pdg4ql1esox4a76AYviOzzLDCKKip2GxXEoVyfeqiGWSGwriyr9HQtxWsSI/yl//DTl5YFjZdMGCFTPS9sg5a+WplLhWGJ3gbUePRHaL2Kr47Foza7lCCz86k2oTnQvSrwY6Vk5ldU8PBp+qItqhQleadmYpQxbgU0/+7yL3yhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzktzpYl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzktzpYl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D115C4CEF9;
	Sat, 20 Sep 2025 20:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758398853;
	bh=4bi2Jq7IHPSsCx1euv23BO9pKWxjKwoYWIU+MWy0Vkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JzktzpYl4NXJRsW0/CtzrQclpJoOLBTX++Vy5AGPQEr1G0X2ZkBn5ohk2KDLzd3/m
	 9gEw1UKtlQr2GefLUZLaHxqNVYotId2qqUaDGwKCZIAtAVtQWfxaJlXoSIuoXM81bQ
	 bJE0y/NxsRKzziWlP/93H3Hb8+nDYZZlh3zHLs98kJhfVAZgHgSMkmtJ4VANXpA+Um
	 Szka+vrQcPiBDTIzGZ+CL9nYXJuh8nQmdo6z8J0JfK4/8vnRT5CzRPyzhEVtN0KA4l
	 wvRSEoFoQTRv3Pe/LQmpNh8e5DIDUSlIQqb+ewdxyeMx1xOeEvb/KTxoXas5eV6w1s
	 4pJ6MI/jbdgNA==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 09/20] platform/x86: x86-android-tablets: convert Yoga Tab2 fast charger to GPIO references
Date: Sat, 20 Sep 2025 22:07:02 +0200
Message-ID: <20250920200713.20193-10-hansg@kernel.org>
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
driver away from using GPIO lookup tables for the fast charger device
to using PROPERTY_ENTRY_GPIO().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Tested-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Changes in v4:
- Split propagating the platform-dev fwnode to the serdev and
  the fwnode_handle_get() call on the serdev fwnode into 2 separate
  statements

Changes in v3:
- Make yoga-tab2-pro-1380-fastcharger.c propagate the fwnode set on
  the platform-device to the serdev it creates
- Mark lenovo_yoga_tab2_1380_fc_props[] __initconst
---
 .../lenovo/yoga-tab2-pro-1380-fastcharger.c   |  5 ++++
 .../platform/x86/x86-android-tablets/lenovo.c | 23 +++++++------------
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
index 1b33c977f6d7..8551ab4d2c7d 100644
--- a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
+++ b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
@@ -255,6 +255,11 @@ static int yt2_1380_fc_pdev_probe(struct platform_device *pdev)
 	if (!serdev)
 		return -ENOMEM;
 
+	/* Propagate pdev-fwnode set by x86-android-tablets to serdev */
+	device_set_node(&serdev->dev, dev_fwnode(&pdev->dev));
+	/* The fwnode is a managed node, so it will be auto-put on serdev_device_put() */
+	fwnode_handle_get(dev_fwnode(&serdev->dev));
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

