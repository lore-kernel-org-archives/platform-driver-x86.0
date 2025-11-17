Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F12132E143;
	Mon, 17 Nov 2025 13:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763385949; cv=none; b=KX/LeJ0exd9h1zr4XCgl7A4nQrBoQTvd9JxVMmCPCxYmUKXamFRKA+6rIlORJj7o/Fo4c6PQAKMYUCrpVfZCtVQUBECqsbnpwNwzg1te215qiRRbpKgzQT6tYbN1t4KG1n3wqCV/cMCAsp3r34MuWcrqZHNksu4SeJTC79/yYhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763385949; c=relaxed/simple;
	bh=VA6IzrnzKaW1sOf6uo321n1ATMa6MQjIiEXYF2PPnrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJx6mFoMU4HJzWpEVzzcOc3lzf1PDIvCMAM9DuATWC7I7+DH2GWdvxx3Hw5HId4DsW9PbvJMD2D34if7TS7eqA2cTp/a+6lh19QIbJsABpRm1NYiQL/8b5/vBf0P78u2oQYDR/TgemI3hJJEtdZk8QsZZWhL1E5W11+21BT05wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=MYPHBzRk; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="MYPHBzRk"
Received: from wse-pc.fritz.box (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 0B4742FC0057;
	Mon, 17 Nov 2025 14:25:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763385940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1HSBul6bsO7EQvaMnplxoCk2jP8+9brQvKw2QvqzG0I=;
	b=MYPHBzRkBHVME2VH3GU+E9kgRTZ9an9RNlaOv5xOMUPOHh5T9au5NSsLfx4jvY55nC2VZK
	tsuBYdbNtqbextVBsTzllTL6QJ0KT2mtURAc9fc44MfS2DGYzSkwab4y3ws2Kltpdbomhk
	jVVG12itglGFYWyBoR2NyC96OeGZ6dI=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH 4/6] platform/x86/uniwill: Make uniwill_dmi_table accessible in probe
Date: Mon, 17 Nov 2025 14:24:01 +0100
Message-ID: <20251117132530.32460-5-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117132530.32460-1-wse@tuxedocomputers.com>
References: <20251117132530.32460-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move uniwill_dmi_table up and remove __intconst to make it also accessible
in the probe function.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 344 ++++++++++----------
 1 file changed, 172 insertions(+), 172 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index de3417d9d1ac0..9412783698685 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1405,178 +1405,7 @@ static int uniwill_ec_init(struct uniwill_data *data)
 	return devm_add_action_or_reset(data->dev, uniwill_disable_manual_control, data);
 }
 
-static int uniwill_probe(struct platform_device *pdev)
-{
-	struct uniwill_data *data;
-	struct regmap *regmap;
-	acpi_handle handle;
-	int ret;
-
-	handle = ACPI_HANDLE(&pdev->dev);
-	if (!handle)
-		return -ENODEV;
-
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	data->dev = &pdev->dev;
-	data->handle = handle;
-	platform_set_drvdata(pdev, data);
-
-	regmap = devm_regmap_init(&pdev->dev, &uniwill_ec_bus, data, &uniwill_ec_config);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	data->regmap = regmap;
-	ret = devm_mutex_init(&pdev->dev, &data->super_key_lock);
-	if (ret < 0)
-		return ret;
-
-	ret = uniwill_ec_init(data);
-	if (ret < 0)
-		return ret;
-
-	ret = uniwill_battery_init(data);
-	if (ret < 0)
-		return ret;
-
-	ret = uniwill_led_init(data);
-	if (ret < 0)
-		return ret;
-
-	ret = uniwill_hwmon_init(data);
-	if (ret < 0)
-		return ret;
-
-	ret = uniwill_nvidia_ctgp_init(data);
-	if (ret < 0)
-		return ret;
-
-	return uniwill_input_init(data);
-}
-
-static void uniwill_shutdown(struct platform_device *pdev)
-{
-	struct uniwill_data *data = platform_get_drvdata(pdev);
-
-	regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
-}
-
-static int uniwill_suspend_keyboard(struct uniwill_data *data)
-{
-	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
-		return 0;
-
-	/*
-	 * The EC_ADDR_SWITCH_STATUS is marked as volatile, so we have to restore it
-	 * ourselves.
-	 */
-	return regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &data->last_switch_status);
-}
-
-static int uniwill_suspend_battery(struct uniwill_data *data)
-{
-	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
-		return 0;
-
-	/*
-	 * Save the current charge limit in order to restore it during resume.
-	 * We cannot use the regmap code for that since this register needs to
-	 * be declared as volatile due to CHARGE_CTRL_REACHED.
-	 */
-	return regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &data->last_charge_ctrl);
-}
-
-static int uniwill_suspend(struct device *dev)
-{
-	struct uniwill_data *data = dev_get_drvdata(dev);
-	int ret;
-
-	ret = uniwill_suspend_keyboard(data);
-	if (ret < 0)
-		return ret;
-
-	ret = uniwill_suspend_battery(data);
-	if (ret < 0)
-		return ret;
-
-	regcache_cache_only(data->regmap, true);
-	regcache_mark_dirty(data->regmap);
-
-	return 0;
-}
-
-static int uniwill_resume_keyboard(struct uniwill_data *data)
-{
-	unsigned int value;
-	int ret;
-
-	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
-		return 0;
-
-	ret = regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
-	if (ret < 0)
-		return ret;
-
-	if ((data->last_switch_status & SUPER_KEY_LOCK_STATUS) == (value & SUPER_KEY_LOCK_STATUS))
-		return 0;
-
-	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER_KEY_LOCK,
-				 TRIGGER_SUPER_KEY_LOCK);
-}
-
-static int uniwill_resume_battery(struct uniwill_data *data)
-{
-	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
-		return 0;
-
-	return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_CTRL_MASK,
-				  data->last_charge_ctrl);
-}
-
-static int uniwill_resume(struct device *dev)
-{
-	struct uniwill_data *data = dev_get_drvdata(dev);
-	int ret;
-
-	regcache_cache_only(data->regmap, false);
-
-	ret = regcache_sync(data->regmap);
-	if (ret < 0)
-		return ret;
-
-	ret = uniwill_resume_keyboard(data);
-	if (ret < 0)
-		return ret;
-
-	return uniwill_resume_battery(data);
-}
-
-static DEFINE_SIMPLE_DEV_PM_OPS(uniwill_pm_ops, uniwill_suspend, uniwill_resume);
-
-/*
- * We only use the DMI table for auoloading because the ACPI device itself
- * does not guarantee that the underlying EC implementation is supported.
- */
-static const struct acpi_device_id uniwill_id_table[] = {
-	{ "INOU0000" },
-	{ },
-};
-
-static struct platform_driver uniwill_driver = {
-	.driver = {
-		.name = DRIVER_NAME,
-		.dev_groups = uniwill_groups,
-		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-		.acpi_match_table = uniwill_id_table,
-		.pm = pm_sleep_ptr(&uniwill_pm_ops),
-	},
-	.probe = uniwill_probe,
-	.shutdown = uniwill_shutdown,
-};
-
-static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
+static const struct dmi_system_id uniwill_dmi_table[] = {
 	{
 		.ident = "XMG FUSION 15",
 		.matches = {
@@ -1936,6 +1765,177 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 };
 MODULE_DEVICE_TABLE(dmi, uniwill_dmi_table);
 
+static int uniwill_probe(struct platform_device *pdev)
+{
+	struct uniwill_data *data;
+	struct regmap *regmap;
+	acpi_handle handle;
+	int ret;
+
+	handle = ACPI_HANDLE(&pdev->dev);
+	if (!handle)
+		return -ENODEV;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->dev = &pdev->dev;
+	data->handle = handle;
+	platform_set_drvdata(pdev, data);
+
+	regmap = devm_regmap_init(&pdev->dev, &uniwill_ec_bus, data, &uniwill_ec_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	data->regmap = regmap;
+	ret = devm_mutex_init(&pdev->dev, &data->super_key_lock);
+	if (ret < 0)
+		return ret;
+
+	ret = uniwill_ec_init(data);
+	if (ret < 0)
+		return ret;
+
+	ret = uniwill_battery_init(data);
+	if (ret < 0)
+		return ret;
+
+	ret = uniwill_led_init(data);
+	if (ret < 0)
+		return ret;
+
+	ret = uniwill_hwmon_init(data);
+	if (ret < 0)
+		return ret;
+
+	ret = uniwill_nvidia_ctgp_init(data);
+	if (ret < 0)
+		return ret;
+
+	return uniwill_input_init(data);
+}
+
+static void uniwill_shutdown(struct platform_device *pdev)
+{
+	struct uniwill_data *data = platform_get_drvdata(pdev);
+
+	regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CTRL);
+}
+
+static int uniwill_suspend_keyboard(struct uniwill_data *data)
+{
+	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
+		return 0;
+
+	/*
+	 * The EC_ADDR_SWITCH_STATUS is marked as volatile, so we have to restore it
+	 * ourselves.
+	 */
+	return regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &data->last_switch_status);
+}
+
+static int uniwill_suspend_battery(struct uniwill_data *data)
+{
+	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
+		return 0;
+
+	/*
+	 * Save the current charge limit in order to restore it during resume.
+	 * We cannot use the regmap code for that since this register needs to
+	 * be declared as volatile due to CHARGE_CTRL_REACHED.
+	 */
+	return regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &data->last_charge_ctrl);
+}
+
+static int uniwill_suspend(struct device *dev)
+{
+	struct uniwill_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	ret = uniwill_suspend_keyboard(data);
+	if (ret < 0)
+		return ret;
+
+	ret = uniwill_suspend_battery(data);
+	if (ret < 0)
+		return ret;
+
+	regcache_cache_only(data->regmap, true);
+	regcache_mark_dirty(data->regmap);
+
+	return 0;
+}
+
+static int uniwill_resume_keyboard(struct uniwill_data *data)
+{
+	unsigned int value;
+	int ret;
+
+	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
+		return 0;
+
+	ret = regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
+	if (ret < 0)
+		return ret;
+
+	if ((data->last_switch_status & SUPER_KEY_LOCK_STATUS) == (value & SUPER_KEY_LOCK_STATUS))
+		return 0;
+
+	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER_KEY_LOCK,
+				 TRIGGER_SUPER_KEY_LOCK);
+}
+
+static int uniwill_resume_battery(struct uniwill_data *data)
+{
+	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
+		return 0;
+
+	return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_CTRL_MASK,
+				  data->last_charge_ctrl);
+}
+
+static int uniwill_resume(struct device *dev)
+{
+	struct uniwill_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	regcache_cache_only(data->regmap, false);
+
+	ret = regcache_sync(data->regmap);
+	if (ret < 0)
+		return ret;
+
+	ret = uniwill_resume_keyboard(data);
+	if (ret < 0)
+		return ret;
+
+	return uniwill_resume_battery(data);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(uniwill_pm_ops, uniwill_suspend, uniwill_resume);
+
+/*
+ * We only use the DMI table for auoloading because the ACPI device itself
+ * does not guarantee that the underlying EC implementation is supported.
+ */
+static const struct acpi_device_id uniwill_id_table[] = {
+	{ "INOU0000" },
+	{ },
+};
+
+static struct platform_driver uniwill_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+		.dev_groups = uniwill_groups,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.acpi_match_table = uniwill_id_table,
+		.pm = pm_sleep_ptr(&uniwill_pm_ops),
+	},
+	.probe = uniwill_probe,
+	.shutdown = uniwill_shutdown,
+};
+
 static int __init uniwill_init(void)
 {
 	const struct dmi_system_id *id;
-- 
2.43.0

