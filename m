Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFD8C6FA82
	for <platform-driver-x86@archiver.kernel.org>; Fri, 23 Sep 2022 09:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbiIWJtG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 23 Sep 2022 05:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231979AbiIWJsX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 23 Sep 2022 05:48:23 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9E31323CB
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Sep 2022 02:48:12 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1obfI0-0005Lq-Jy; Fri, 23 Sep 2022 11:48:08 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1obfI0-002QwP-Gg; Fri, 23 Sep 2022 11:48:07 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1obfHy-002yPa-47; Fri, 23 Sep 2022 11:48:06 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] platform/x86: compal-laptop: Get rid of a few forward declarations
Date:   Fri, 23 Sep 2022 11:47:59 +0200
Message-Id: <20220923094759.87804-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4865; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=1reSiXm4t4VXOW/YMU84n6K9LnLz9eSK2l9dzVrXo84=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjLYDLqLC+zh23kW0QOxPG16HY7l9QlwAHpcmZZGoH hXjX8WuJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYy2AywAKCRDB/BR4rcrsCcj+B/ 9/I+JCyB82szxRaTVxOTWpQDnda0fE3MunmuyYFSXFzQrP83jI7IBbdrPR1x8luF3ta9uVJIu98LLt QRWbzTZrx1B5ZkMtB/KpvB9/LWoiLukkptypBI8eco3iIofLkk0+z4g6P9XOjTRPyBI/yU66XRVuXs 5bgBpw2iCH1KPiec4GN9p+s9KvWgD9BGABPeV1R8f4psS4GbDOzP8ZGNCBQYE2wNqC9bF16ULQJFJb 6KquHFcGiSbRF6SuBt+E0Ew3M39pvhdiBATOKhf+J/Sy8Vbx36pUeB3yyRit0TwBZqdaw8jIMl0h9/ JSt4sg0YNLePIpQ9BMMTvq34H/A3g5
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Declarations for static symbols are useless repetition (unless there are
cyclic dependencies).

By changing the order of a few symbols two forward declarations can be
dropped.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/platform/x86/compal-laptop.c | 151 +++++++++++++--------------
 1 file changed, 74 insertions(+), 77 deletions(-)

diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index 0942f50bd793..72e1523edd31 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -721,16 +721,6 @@ static struct attribute *compal_hwmon_attrs[] = {
 };
 ATTRIBUTE_GROUPS(compal_hwmon);
 
-static int compal_probe(struct platform_device *);
-static int compal_remove(struct platform_device *);
-static struct platform_driver compal_driver = {
-	.driver = {
-		.name = DRIVER_NAME,
-	},
-	.probe	= compal_probe,
-	.remove	= compal_remove,
-};
-
 static enum power_supply_property compal_bat_properties[] = {
 	POWER_SUPPLY_PROP_STATUS,
 	POWER_SUPPLY_PROP_HEALTH,
@@ -965,6 +955,80 @@ static int setup_rfkill(void)
 	return ret;
 }
 
+static int compal_probe(struct platform_device *pdev)
+{
+	int err;
+	struct compal_data *data;
+	struct device *hwmon_dev;
+	struct power_supply_config psy_cfg = {};
+
+	if (!extra_features)
+		return 0;
+
+	/* Fan control */
+	data = devm_kzalloc(&pdev->dev, sizeof(struct compal_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	initialize_fan_control_data(data);
+
+	err = sysfs_create_group(&pdev->dev.kobj, &compal_platform_attr_group);
+	if (err)
+		return err;
+
+	hwmon_dev = devm_hwmon_device_register_with_groups(&pdev->dev,
+							   "compal", data,
+							   compal_hwmon_groups);
+	if (IS_ERR(hwmon_dev)) {
+		err = PTR_ERR(hwmon_dev);
+		goto remove;
+	}
+
+	/* Power supply */
+	initialize_power_supply_data(data);
+	psy_cfg.drv_data = data;
+	data->psy = power_supply_register(&compal_device->dev, &psy_bat_desc,
+					  &psy_cfg);
+	if (IS_ERR(data->psy)) {
+		err = PTR_ERR(data->psy);
+		goto remove;
+	}
+
+	platform_set_drvdata(pdev, data);
+
+	return 0;
+
+remove:
+	sysfs_remove_group(&pdev->dev.kobj, &compal_platform_attr_group);
+	return err;
+}
+
+static int compal_remove(struct platform_device *pdev)
+{
+	struct compal_data *data;
+
+	if (!extra_features)
+		return 0;
+
+	pr_info("Unloading: resetting fan control to motherboard\n");
+	pwm_disable_control();
+
+	data = platform_get_drvdata(pdev);
+	power_supply_unregister(data->psy);
+
+	sysfs_remove_group(&pdev->dev.kobj, &compal_platform_attr_group);
+
+	return 0;
+}
+
+static struct platform_driver compal_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+	},
+	.probe	= compal_probe,
+	.remove	= compal_remove,
+};
+
 static int __init compal_init(void)
 {
 	int ret;
@@ -1028,54 +1092,6 @@ static int __init compal_init(void)
 	return ret;
 }
 
-static int compal_probe(struct platform_device *pdev)
-{
-	int err;
-	struct compal_data *data;
-	struct device *hwmon_dev;
-	struct power_supply_config psy_cfg = {};
-
-	if (!extra_features)
-		return 0;
-
-	/* Fan control */
-	data = devm_kzalloc(&pdev->dev, sizeof(struct compal_data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	initialize_fan_control_data(data);
-
-	err = sysfs_create_group(&pdev->dev.kobj, &compal_platform_attr_group);
-	if (err)
-		return err;
-
-	hwmon_dev = devm_hwmon_device_register_with_groups(&pdev->dev,
-							   "compal", data,
-							   compal_hwmon_groups);
-	if (IS_ERR(hwmon_dev)) {
-		err = PTR_ERR(hwmon_dev);
-		goto remove;
-	}
-
-	/* Power supply */
-	initialize_power_supply_data(data);
-	psy_cfg.drv_data = data;
-	data->psy = power_supply_register(&compal_device->dev, &psy_bat_desc,
-					  &psy_cfg);
-	if (IS_ERR(data->psy)) {
-		err = PTR_ERR(data->psy);
-		goto remove;
-	}
-
-	platform_set_drvdata(pdev, data);
-
-	return 0;
-
-remove:
-	sysfs_remove_group(&pdev->dev.kobj, &compal_platform_attr_group);
-	return err;
-}
-
 static void __exit compal_cleanup(void)
 {
 	platform_device_unregister(compal_device);
@@ -1089,25 +1105,6 @@ static void __exit compal_cleanup(void)
 	pr_info("Driver unloaded\n");
 }
 
-static int compal_remove(struct platform_device *pdev)
-{
-	struct compal_data *data;
-
-	if (!extra_features)
-		return 0;
-
-	pr_info("Unloading: resetting fan control to motherboard\n");
-	pwm_disable_control();
-
-	data = platform_get_drvdata(pdev);
-	power_supply_unregister(data->psy);
-
-	sysfs_remove_group(&pdev->dev.kobj, &compal_platform_attr_group);
-
-	return 0;
-}
-
-
 module_init(compal_init);
 module_exit(compal_cleanup);
 

base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
2.37.2

