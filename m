Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F5126B098
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 20:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758398860; cv=none; b=q91nxekQMaVP98G3xdQWoDUK7oEup0gZtODGM8q4j8hv8c7bAxSJ3fzn9dZ6zIU7vUsPVhHZwu8+eHDg9KClPuG671Wo22//7oqLn1Vn5nCsqpczm1ug+J8md2o+ChrMqoI7B/EaGOdWSM/u5T8aAjjRD/iOKLMfgjgHytbTcCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758398860; c=relaxed/simple;
	bh=9wn2gOl7CEykyeYYbGJMTGZPLQV47BycVV/3gtfmoWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bPQNr9lOKaQ/Fv40iAM5/qt1lkL9C9Ol8c3tRKafr4b/HJr5NMqKCVC5yeJs1jU/UDBM34T0T7A6KffoW5cAnO7TAMzv5wL0ACfPj3csFq58DFrkc6iaJ425E6QH5B95waMlro2KkXOcT7NZ3Cyv3v54CGzEXXadfEMAIvNnWHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/oVnW7/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/oVnW7/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D5EC4CEF0;
	Sat, 20 Sep 2025 20:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758398859;
	bh=9wn2gOl7CEykyeYYbGJMTGZPLQV47BycVV/3gtfmoWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g/oVnW7/3fp4ilV+p+UQmCoVLV/tuOYnBcdOmUvDKtKLSOHTwEj6Ez4UPNqp+KErZ
	 hpqXJphFk4ku0jh8RBCCJAeAgEZpYCYImjEWkg12nhdHwyVyxSZ2NDaELdZOVhQMte
	 PvkR8IcHa9e0voQsNlYAd5F7WcwDklRE9/mathb2BdPrAof7PFfZs5SpI2J4ye7I7I
	 hfphO6NfKS1ML+ZNquIKeWffJiryyGiU1Q/YfeEzTpE3hwt/DzIL5dtDMOWYzER8H6
	 UEgiFJBGMQoHB3Iu29X1VZr56JzetSEoBTUL9w229qvQYbtGzUdyOtcprVrmIf7Zj8
	 ftaPQjEHp0HZA==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 12/20] platform/x86: x86-android-tablets: replace bat_swnode with swnode_group
Date: Sat, 20 Sep 2025 22:07:05 +0200
Message-ID: <20250920200713.20193-13-hansg@kernel.org>
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

Now that we are using software-nodes are used in more places it is
useful to have a more generic mechanism to have the core code register
software-nodes.

Replace the bat_swnode registration mechanism with a more generic
swnode_group registration mechanism.

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/platform/x86/x86-android-tablets/asus.c      |  4 ++--
 drivers/platform/x86/x86-android-tablets/core.c      | 12 ++++++------
 drivers/platform/x86/x86-android-tablets/lenovo.c    |  4 ++--
 .../x86/x86-android-tablets/shared-psy-info.c        | 10 ++++++++++
 .../x86/x86-android-tablets/shared-psy-info.h        |  4 ++++
 .../x86/x86-android-tablets/x86-android-tablets.h    |  2 +-
 6 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/asus.c b/drivers/platform/x86/x86-android-tablets/asus.c
index 91245f1bfd87..39eb2f9dc031 100644
--- a/drivers/platform/x86/x86-android-tablets/asus.c
+++ b/drivers/platform/x86/x86-android-tablets/asus.c
@@ -190,7 +190,7 @@ const struct x86_dev_info asus_me176c_info __initconst = {
 	.serdev_info = asus_me176c_serdevs,
 	.serdev_count = ARRAY_SIZE(asus_me176c_serdevs),
 	.gpio_button_swnodes = asus_me176c_tf103c_lid_swnodes,
-	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
+	.swnode_group = generic_lipo_hv_4v35_battery_swnodes,
 	.modules = bq24190_modules,
 	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 };
@@ -313,7 +313,7 @@ const struct x86_dev_info asus_tf103c_info __initconst = {
 	.pdev_info = asus_me176c_tf103c_pdevs,
 	.pdev_count = ARRAY_SIZE(asus_me176c_tf103c_pdevs),
 	.gpio_button_swnodes = asus_me176c_tf103c_lid_swnodes,
-	.bat_swnode = &generic_lipo_4v2_battery_node,
+	.swnode_group = generic_lipo_4v2_battery_swnodes,
 	.modules = bq24190_modules,
 	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 };
diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 955a2c83a9bf..5675e888d84f 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -153,7 +153,7 @@ static struct spi_device **spi_devs;
 static struct platform_device **pdevs;
 static struct serdev_device **serdevs;
 static const struct software_node **gpio_button_swnodes;
-static const struct software_node *bat_swnode;
+static const struct software_node **swnode_group;
 static const struct software_node **gpiochip_node_group;
 static void (*exit_handler)(void);
 
@@ -390,8 +390,8 @@ static void x86_android_tablet_remove(struct platform_device *pdev)
 	if (gpio_button_swnodes)
 		software_node_unregister_node_group(gpio_button_swnodes);
 
-	if (bat_swnode)
-		software_node_unregister(bat_swnode);
+	if (swnode_group)
+		software_node_unregister_node_group(swnode_group);
 
 	if (gpiochip_node_group)
 		software_node_unregister_node_group(gpiochip_node_group);
@@ -436,13 +436,13 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	if (dev_info->bat_swnode) {
-		ret = software_node_register(dev_info->bat_swnode);
+	if (dev_info->swnode_group) {
+		ret = software_node_register_node_group(dev_info->swnode_group);
 		if (ret) {
 			x86_android_tablet_remove(pdev);
 			return ret;
 		}
-		bat_swnode = dev_info->bat_swnode;
+		swnode_group = dev_info->swnode_group;
 	}
 
 	if (dev_info->init) {
diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 9a28216642c3..66617f6ff13e 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -448,7 +448,7 @@ const struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initconst = {
 	.pdev_info = lenovo_yoga_tab2_830_1050_pdevs,
 	.pdev_count = ARRAY_SIZE(lenovo_yoga_tab2_830_1050_pdevs),
 	.gpio_button_swnodes = lenovo_yoga_tab2_830_1050_lid_swnodes,
-	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
+	.swnode_group = generic_lipo_hv_4v35_battery_swnodes,
 	.modules = bq24190_modules,
 	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 	.init = lenovo_yoga_tab2_830_1050_init,
@@ -812,7 +812,7 @@ const struct x86_dev_info lenovo_yoga_tab2_1380_info __initconst = {
 	.pdev_info = lenovo_yoga_tab2_1380_pdevs,
 	.pdev_count = ARRAY_SIZE(lenovo_yoga_tab2_1380_pdevs),
 	.gpio_button_swnodes = lenovo_yoga_tab2_830_1050_lid_swnodes,
-	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
+	.swnode_group = generic_lipo_hv_4v35_battery_swnodes,
 	.modules = lenovo_yoga_tab2_1380_modules,
 	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 	.init = lenovo_yoga_tab2_1380_init,
diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.c b/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
index 6ebe282bda6e..62f41c14e6ba 100644
--- a/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
+++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
@@ -113,6 +113,11 @@ const struct software_node generic_lipo_4v2_battery_node = {
 	.properties = generic_lipo_4v2_battery_props,
 };
 
+const struct software_node *generic_lipo_4v2_battery_swnodes[] = {
+	&generic_lipo_4v2_battery_node,
+	NULL
+};
+
 /* LiPo HighVoltage (max 4.35V) settings used by most devs with a HV battery */
 static const struct property_entry generic_lipo_hv_4v35_battery_props[] = {
 	PROPERTY_ENTRY_STRING("compatible", "simple-battery"),
@@ -133,6 +138,11 @@ const struct software_node generic_lipo_hv_4v35_battery_node = {
 	.properties = generic_lipo_hv_4v35_battery_props,
 };
 
+const struct software_node *generic_lipo_hv_4v35_battery_swnodes[] = {
+	&generic_lipo_hv_4v35_battery_node,
+	NULL
+};
+
 /* For enabling the bq24190 5V boost based on id-pin */
 static struct regulator_consumer_supply intel_int3496_consumer = {
 	.supply = "vbus",
diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
index b9cbc291aa4d..e5ba1c65d62b 100644
--- a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
+++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
@@ -20,8 +20,12 @@ extern const char * const bq25890_psy[];
 
 extern const struct software_node fg_bq24190_supply_node;
 extern const struct software_node fg_bq25890_supply_node;
+
 extern const struct software_node generic_lipo_4v2_battery_node;
+extern const struct software_node *generic_lipo_4v2_battery_swnodes[];
+
 extern const struct software_node generic_lipo_hv_4v35_battery_node;
+extern const struct software_node *generic_lipo_hv_4v35_battery_swnodes[];
 
 extern struct bq24190_platform_data bq24190_pdata;
 extern const char * const bq24190_modules[];
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index f4a67a9b74ea..4bf4bcdf50c0 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -82,7 +82,7 @@ struct x86_serdev_info {
 
 struct x86_dev_info {
 	const char * const *modules;
-	const struct software_node *bat_swnode;
+	const struct software_node **swnode_group;
 	const struct x86_i2c_client_info *i2c_client_info;
 	const struct x86_spi_dev_info *spi_dev_info;
 	const struct platform_device_info *pdev_info;
-- 
2.51.0

