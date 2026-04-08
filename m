Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010068.outbound.protection.outlook.com [52.101.85.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673DC253950
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Apr 2026 21:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775683139; cv=fail; b=Qme5z22hgjNJpIXZMPfTQiMkiUqML0QpsrRwIn7v/KwMqVxQpxZCuxIQfEjey5tHWkMw5de/FqoqkHtGPcxsvuA/jBqeF3z6Uq/5gxIuNP0WENjSL7qaO2rN1zKU/h1fKOywzNp10tnMbF5WWwY4jIOWbSES+Gjbzuqacz0eeIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775683139; c=relaxed/simple;
	bh=JeGgMj8l8uZQUWzi0fCimFDc7DkQ2If3yIhwSRaLlLE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TeX5AMQpTWxrvNvvisfNSUMvNzbhnHpOM5HWht5WXcrlnWRyu4DBxqMEyXOA84jgn6qTH7FnKmgSkuUG7BlQ6MVUrN0V93zukT0V+Cbl1NnREhyhIdlaXoz1jkAHhc2b0hJB8F2bE9mseH0Gm4GYqKSDBQYyqFC5wpYDG8KgcO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=selinc.com; spf=pass smtp.mailfrom=selinc.com; dkim=pass (2048-bit key) header.d=selinc.com header.i=@selinc.com header.b=hAyq9DDn; arc=fail smtp.client-ip=52.101.85.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=selinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=selinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=selinc.com header.i=@selinc.com header.b="hAyq9DDn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XN2FYJOnDLfQr3mOU7oMj+Yi1hi+unYzWEZ+wFcchkOo11b9D265sfXTimb/mokET2WtLj9jTLMRMRTY3kGkzgLYLtyIQX0yIdSBOTZVV3vJBD1QAxmJ551JlrMgroVCtkY5kl8TskqNvXo4s4p68WphEGurZ5TpIqg6V9jk4ahMf4ZMvPiU02uJXTAWu9XyPtpiSI7cESpWFRgsU37NJHOh56KCS6N4CajReLgK1encvX/XAwpNvi6wtanlnKUx/mAsyL4IHk8WBBHGjL6iYoe0dWVgidYHAulr0XSLQSTBamDrbXQY5Di6hpcxdGiIM/ZAmQX2cFdV/onTLY7dPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bugDU9RFodz07Y/S4L+CJzui6KmLywBmIoyv+dFWW4=;
 b=QCnl8OKJOUZxZovf9/c0XHd7S07HbTUhCt6nWk1OldPpglY18TNgh81Nf8mICF72JhanE0MoHZpdmVQXM13Pv0NqxZ4AEc0XuOP2RW8KRhO7szf7DSorexT0z7OxG2zwuOEEErHtPDWKGI3LxQVnd1zr+N0YWVibqgbihZ8eZ4Zp9ACLjKuIa7tLT3Ss53oBQI5G4FHRDuiVj1MQFJmTWH0nPzQRzNR6LJ907GwciHNkNcvMAJiJooBDMdPu/por31Se/geDzB1N/gAc3wvvqXJFx5PVgP46QU5CLjdk1Whz3adUsuq2qFK75kxJQv1KXiCg4Mjg4AKxxnEIyYMTIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 74.117.212.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=selinc.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=selinc.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bugDU9RFodz07Y/S4L+CJzui6KmLywBmIoyv+dFWW4=;
 b=hAyq9DDnpa0Aaw/e8D0ao4oftBiGvAtgJwVuQ5mD3hnSc2Yx7OLBAyeYJEzDvYV/1rHO6p78P4Gzf9mvTP/3uEF0UQtsjqnbvzTRhevYjMDS+hDsDnpJMmkD6/4iYeAULken0zY8eYM4ehHfQP6GRp4cO8lDbCM9mI2+wfqIG1goDNhAz+yfa1+cgycOR26kTU2NTU9h9/1XQBuOJ7AiBk1zTILacF+L732+4n+9zwIMAF9gifByDlnoDTq+r7xSdjjd/SnxKXzS4OK3sLKgMcCA3a4VXOS/o6FoCQG5iJ98lJrp2t0NEBVqLp+/wz4PkFPjTp38LOSENoDP2Ls7iQ==
Received: from BYAPR08CA0044.namprd08.prod.outlook.com (2603:10b6:a03:117::21)
 by BL1PR22MB3588.namprd22.prod.outlook.com (2603:10b6:208:390::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 21:18:51 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::28) by BYAPR08CA0044.outlook.office365.com
 (2603:10b6:a03:117::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Wed,
 8 Apr 2026 21:18:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 74.117.212.83)
 smtp.mailfrom=selinc.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=selinc.com;
Received-SPF: Pass (protection.outlook.com: domain of selinc.com designates
 74.117.212.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=74.117.212.83; helo=email.selinc.com; pr=C
Received: from email.selinc.com (74.117.212.83) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 21:18:48 +0000
Received: from DUT.ad.selinc.com (10.100.90.200) by
 wpul-exchange.ad.selinc.com (10.53.14.24) with Microsoft SMTP Server id
 15.2.2562.37; Wed, 8 Apr 2026 14:18:41 -0700
From: Brodie Abrew <brodie_abrew@selinc.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <robert.joslyn@redrectangle.org>, Brodie Abrew <brodie_abrew@selinc.com>
Subject: [PATCH] platform/x86: sel3350-platform: Retain LED state on load and unload
Date: Wed, 8 Apr 2026 14:18:59 -0700
Message-ID: <20260408211859.37226-1-brodie_abrew@selinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|BL1PR22MB3588:EE_
X-MS-Office365-Filtering-Correlation-Id: 2926fa37-9fbd-495f-989d-08de95b46cfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	qzl0Y7hct4g4mmkRyucf0JaWk8yKBTInizY/V6M5yz/fz7DTRB9WNSVdDe2Y+67n5EekxoIGlV3MhHEPnzJgtzyBvlJs1q9ScBE+mRUfQl8MNfGtFZHGV931sIPzNqzRYGRMdtd9aDl/U9p5Y4/mXNmIQdxCfyFjHJHotGAsE3aCLr2u8FSyDt89DMGddy8jCEFUM+QV9E96vO1oaWxx/a7/+VG+mGsXl//OVweN5xmHVdMuDvznDi2Jwpd3trvbeGAyCLvhh3ikm9sSdFcL71d9sxLNVsYVfjYKpBcBxHXtInh8ate6JFWApr5OV5RMDtRedTJ0Lk55SpryDq+Hgu+meJ/9tdHen2Va+J/RMmqhNADvH7ax1j3HUI3dGxUQLLdauSXeSgshj+eGwTrx1Vgj1Dzstra/+XxrXBF0Sj+CsIxNYcsJ+q5b80bJOi4S+tgS2bAzcK+CDys7BPIP+etRLpoYmCFoAilkMS/SS3YsgE5it9dCRCqyJ3FoFb78fypBe3WELeaW6MVFztyk75w4FZ3VaDIQOJ1jgaroQmzHHFwmCCPKaQn2kFPk1o6AXZxu0UHO8HCWYi4GXce0/qZxXiv/9L14CippnVifctNIDbL77VqKvQaXOFaLRoFY1LmJh3R5l3BKOXPFgn/F4w1bQSQc/Epp4u0J3a19IsFHfATGkss8RFlOGYCjTBDuoQn1bigGJHwS0QYhXyRFU0QXpfOmC7tUAT1IsB/CBCzfuL2MLj6GY6TdEOjvgrBKfca+DMnvgR5gy8DbVCnxNA==
X-Forefront-Antispam-Report:
	CIP:74.117.212.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:email.selinc.com;PTR:wpul-exchange1.selinc.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i3YLySX0/wt4TRkfA7JfAw5NdqDIjg/6x4TblwYP9Rv6N+G1B1Sfj89xQcLRx74qyRDS/7j32NuNZAJc+jNg1zg8z+fwb0jju9D9vHbrJh8mXzGyJIniShN3HZHhsFDB8RKgNaq7/BP4r/0Z4ubbYxnO8eaUJiCy8M8x84c/StZGKR7U0bzjF1UfUFYdQ6z33fRrGE0KxHvW/40hm0cC9FWbcOaRllBNMuddSRjh3VOZ7Nz/tfkzSCw28rxKZusvGDOUUZevWXU/6puO+2V2WqaHJbkNy46eLN+xUioNewdWiLYJr/JvyIOdKiN00Oba6il2lsPYUZ/n5V3h+DUMVfV3su5SfD0Cqbv+a/NnpJ/mMw3jd6BhqBrg0hmgOp4lH7Xlsr/phPyq7jZFh1KU9AXteA0UWpw72hHw8KijKZjqlZ2bGYiiu04pM8RSQ3VS
X-OriginatorOrg: selinc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 21:18:48.7672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2926fa37-9fbd-495f-989d-08de95b46cfc
X-MS-Exchange-CrossTenant-Id: 12381f30-10fe-4e2c-aa3a-5e03ebeb59ec
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=12381f30-10fe-4e2c-aa3a-5e03ebeb59ec;Ip=[74.117.212.83];Helo=[email.selinc.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR22MB3588

When the platform driver is loaded or unloaded, it overwrites the
existing LED states. This can cause a loss of early boot state when the
driver loads, andi t can cause the ALARM contact to change state or
flicker.

Explicitly retain the existing LED state to prevent overwriting on
driver load and unload.

Signed-off-by: Brodie Abrew <brodie_abrew@selinc.com>
---
 drivers/platform/x86/sel3350-platform.c | 128 ++++++++++++++++++------
 1 file changed, 95 insertions(+), 33 deletions(-)

diff --git a/drivers/platform/x86/sel3350-platform.c b/drivers/platform/x86/sel3350-platform.c
index 02e2081e2333..08f40268891f 100644
--- a/drivers/platform/x86/sel3350-platform.c
+++ b/drivers/platform/x86/sel3350-platform.c
@@ -30,19 +30,72 @@
 #define SEL_PS_B_DETECT "sel_ps_b_detect"
 #define SEL_PS_B_GOOD   "sel_ps_b_good"
 
+#define AUX_LED_GRN1        "sel_aux_led_grn1"
+#define AUX_LED_GRN2        "sel_aux_led_grn2"
+#define AUX_LED_GRN3        "sel_aux_led_grn3"
+#define AUX_LED_GRN4        "sel_aux_led_grn4"
+#define ALARM_STATE_USER    "sel_alarm_state_user"
+#define ENABLE_STATE_USER   "sel_enable_state_user"
+#define AUX_LED_RED1        "sel_aux_led_red1"
+#define AUX_LED_RED2        "sel_aux_led_red2"
+#define AUX_LED_RED3        "sel_aux_led_red3"
+#define AUX_LED_RED4        "sel_aux_led_red4"
+
+static const char *const sel3350_leds_gpio_names[] = {
+	AUX_LED_GRN1,
+	AUX_LED_GRN2,
+	AUX_LED_GRN3,
+	AUX_LED_GRN4,
+	ALARM_STATE_USER,
+	ENABLE_STATE_USER,
+	AUX_LED_RED1,
+	AUX_LED_RED2,
+	AUX_LED_RED3,
+	AUX_LED_RED4,
+};
+
 /* LEDs */
-static const struct gpio_led sel3350_leds[] = {
-	{ .name = "sel:green:aux1" },
-	{ .name = "sel:green:aux2" },
-	{ .name = "sel:green:aux3" },
-	{ .name = "sel:green:aux4" },
-	{ .name = "sel:red:alarm" },
+static struct gpio_led sel3350_leds[] = {
+	{ .name = "sel:green:aux1",
+	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
+	  .retain_state_suspended = 1,
+	  .retain_state_shutdown = 1 },
+	{ .name = "sel:green:aux2",
+	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
+	  .retain_state_suspended = 1,
+	  .retain_state_shutdown = 1 },
+	{ .name = "sel:green:aux3",
+	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
+	  .retain_state_suspended = 1,
+	  .retain_state_shutdown = 1 },
+	{ .name = "sel:green:aux4",
+	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
+	  .retain_state_suspended = 1,
+	  .retain_state_shutdown = 1 },
+	{ .name = "sel:red:alarm",
+	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
+	  .retain_state_suspended = 1,
+	  .retain_state_shutdown = 1 },
 	{ .name = "sel:green:enabled",
-	  .default_state = LEDS_GPIO_DEFSTATE_ON },
-	{ .name = "sel:red:aux1" },
-	{ .name = "sel:red:aux2" },
-	{ .name = "sel:red:aux3" },
-	{ .name = "sel:red:aux4" },
+	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
+	  .retain_state_suspended = 1,
+	  .retain_state_shutdown = 1 },
+	{ .name = "sel:red:aux1",
+	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
+	  .retain_state_suspended = 1,
+	  .retain_state_shutdown = 1 },
+	{ .name = "sel:red:aux2",
+	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
+	  .retain_state_suspended = 1,
+	  .retain_state_shutdown = 1 },
+	{ .name = "sel:red:aux3",
+	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
+	  .retain_state_suspended = 1,
+	  .retain_state_shutdown = 1 },
+	{ .name = "sel:red:aux4",
+	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
+	  .retain_state_suspended = 1,
+	  .retain_state_shutdown = 1 },
 };
 
 static const struct gpio_led_platform_data sel3350_leds_pdata = {
@@ -50,25 +103,6 @@ static const struct gpio_led_platform_data sel3350_leds_pdata = {
 	.leds = sel3350_leds,
 };
 
-/* Map GPIOs to LEDs */
-static struct gpiod_lookup_table sel3350_leds_table = {
-	.dev_id = "leds-gpio",
-	.table = {
-		GPIO_LOOKUP_IDX(BXT_NW, 49, NULL, 0, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX(BXT_NW, 50, NULL, 1, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX(BXT_NW, 51, NULL, 2, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX(BXT_NW, 52, NULL, 3, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX(BXT_W,  20, NULL, 4, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX(BXT_W,  21, NULL, 5, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX(BXT_SW, 37, NULL, 6, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX(BXT_SW, 38, NULL, 7, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX(BXT_SW, 39, NULL, 8, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX(BXT_SW, 40, NULL, 9, GPIO_ACTIVE_HIGH),
-		{},
-	}
-};
-
-/* Map GPIOs to power supplies */
 static struct gpiod_lookup_table sel3350_gpios_table = {
 	.dev_id = B2093_GPIO_ACPI_ID ":00",
 	.table = {
@@ -76,6 +110,16 @@ static struct gpiod_lookup_table sel3350_gpios_table = {
 		GPIO_LOOKUP(BXT_NW, 45, SEL_PS_A_GOOD,   GPIO_ACTIVE_LOW),
 		GPIO_LOOKUP(BXT_NW, 46, SEL_PS_B_DETECT, GPIO_ACTIVE_LOW),
 		GPIO_LOOKUP(BXT_NW, 47, SEL_PS_B_GOOD,   GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP(BXT_NW, 49, AUX_LED_GRN1, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP(BXT_NW, 50, AUX_LED_GRN2, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP(BXT_NW, 51, AUX_LED_GRN3, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP(BXT_NW, 52, AUX_LED_GRN4, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP(BXT_W,  20, ALARM_STATE_USER, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP(BXT_W,  21, ENABLE_STATE_USER, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP(BXT_SW, 37, AUX_LED_RED1, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP(BXT_SW, 38, AUX_LED_RED2, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP(BXT_SW, 39, AUX_LED_RED3, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP(BXT_SW, 40, AUX_LED_RED4, GPIO_ACTIVE_HIGH),
 		{},
 	}
 };
@@ -149,6 +193,7 @@ struct sel3350_data {
 static int sel3350_probe(struct platform_device *pdev)
 {
 	int rs;
+	int i;
 	struct sel3350_data *sel3350;
 	struct power_supply_config ps_cfg = {};
 
@@ -158,9 +203,19 @@ static int sel3350_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, sel3350);
 
-	gpiod_add_lookup_table(&sel3350_leds_table);
 	gpiod_add_lookup_table(&sel3350_gpios_table);
 
+	for (i = 0; i < ARRAY_SIZE(sel3350_leds); ++i) {
+		sel3350_leds[i].gpiod = devm_gpiod_get(
+				&pdev->dev, sel3350_leds_gpio_names[i], GPIOD_ASIS);
+		if (IS_ERR(sel3350_leds[i].gpiod) ||
+				(sel3350_leds[i].gpiod == NULL)) {
+			rs = -EPROBE_DEFER;
+			goto err_gpio_loop;
+		}
+		gpiod_set_consumer_name(sel3350_leds[i].gpiod, sel3350_leds[i].name);
+	}
+
 	sel3350->leds_pdev = platform_device_register_data(
 			NULL,
 			"leds-gpio",
@@ -209,11 +264,18 @@ static int sel3350_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_gpio_loop:
+	while (i > 0) {
+		/* Don't clean up the failed get but do clean up all others */
+		i--;
+		devm_gpiod_put(&pdev->dev, sel3350_leds[i].gpiod);
+	}
+	goto err_platform;
+
 err_ps:
 	platform_device_unregister(sel3350->leds_pdev);
 err_platform:
 	gpiod_remove_lookup_table(&sel3350_gpios_table);
-	gpiod_remove_lookup_table(&sel3350_leds_table);
 
 	return rs;
 }
@@ -224,7 +286,6 @@ static void sel3350_remove(struct platform_device *pdev)
 
 	platform_device_unregister(sel3350->leds_pdev);
 	gpiod_remove_lookup_table(&sel3350_gpios_table);
-	gpiod_remove_lookup_table(&sel3350_leds_table);
 }
 
 static const struct acpi_device_id sel3350_device_ids[] = {
@@ -246,4 +307,5 @@ module_platform_driver(sel3350_platform_driver);
 MODULE_AUTHOR("Schweitzer Engineering Laboratories");
 MODULE_DESCRIPTION("SEL-3350 platform driver");
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS("platform:sel3350");
 MODULE_SOFTDEP("pre: pinctrl_broxton leds-gpio");
-- 
2.43.0

