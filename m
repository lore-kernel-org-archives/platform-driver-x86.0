Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11021089.outbound.protection.outlook.com [40.107.208.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08AA4B8DD9
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 May 2026 17:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778089745; cv=fail; b=AzsUOirpnMAbMYS++iQxunr9Cip7EKULMyiCG8mAFbdriR1E0m1P/Hp6NAjMD9CGLp537nH38y6AZh+Zbt6YDQ0Np0EnPUVXhN2ekGFlC4kCO1P0V/G4ypJ07GQ0jvbUk3c4YvRGPXRc4p3K2U+WZVGgEzYil7R1L9giQO/0LEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778089745; c=relaxed/simple;
	bh=P85IyQMMOwhF8B2PJpATsMxpENOdg86FOLRFcsesNG0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OsZRKTknUD7QJqZ8P4C4cbbt/VdVaIYpzPObYhAkkZA3lRE7z3/LRqPfJ516FckkBrOvRfGikAtK2tU2gTd7FXFpix6Q1fJI8RngUuWsotPy+0AqWvAvKKwDAIOLp17umm5N6CHuZnrNkvOxQ4gHgQaM8yRpZ6J9+hHwAoaT2jE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=selinc.com; spf=pass smtp.mailfrom=selinc.com; dkim=pass (2048-bit key) header.d=selinc.com header.i=@selinc.com header.b=EVioGM17; arc=fail smtp.client-ip=40.107.208.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=selinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=selinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=selinc.com header.i=@selinc.com header.b="EVioGM17"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOLnAT/LtDgXQw8H87Pj78pW2sZwIjxfUHCASZ8JkR7hIp24oYysphj9fn+d37eclN+Id82Cts9TkH0SOGr3XxCjNur2Y1dV4U4AGVkZkpMsDt6+4R1lKp6okCizE4iOyauGBMiN+1Bln/CuIilATa9ve9mostD1dGDLDOJCq1qQdHt7ErRRdS43eUM4qAR0tINzq619wwHBmMoPlglUD0pasmj1U2jMBfDOUzgE/RnMNUSNC5HLZabqi92HKnyIwYvvaB73OGJpwL7JKYRbUUws0ADspo5beIYZUkZXsuKrKYdKP4Pm/87Q9auQD7wDzU89EtXtRA9Y/81JEOL7Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkAhvTeF0sP2seUrx02eNkvUTUcnRJ+5XdhHVyxmQBU=;
 b=L5xP3z1FFvCYxzWVJapZjAUPx1VH86N7I3VgE9weh64cNiko0R1g2rwNJdNMGqmXmAiI/7aKFYkZWOIAP3WLkEKxyogcXA5bNxES7cq/0jTzGZ8/xrw6QCdRPDRSoR13Tem2rRs2hhshc7YCu9UfcZUVNrpbI9AW9A4BjV0xLG4ESA4XRqWKZgulA+KrNa8XQxe/MLY3w1Dy5CSwDBuulkh/9VqSBki6Mhf03GxHHk9o+rxnS1XWaPA47N+3gUfSLKhb1R7z3yid5ac8w6a+rSFj+l20yM/6IQ4P8Bjn9ygZb6S9zp/sQ72QOHNimpjF5f7toR0PLIla9joOMqYSTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 74.117.212.83) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=selinc.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=selinc.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkAhvTeF0sP2seUrx02eNkvUTUcnRJ+5XdhHVyxmQBU=;
 b=EVioGM17IB094s47gozOclXIgrXzzbUtcrSscMKZlVdyJ1bnhhG56aosd/KANiPUzn2CEOCn9din3n6gaV0zBYV1VP6I4RmpbwOMfU3hYCrDVun1/x+iAgiogqYXg4A7HlTNH7Dw3757uSRdKzctdFJpNJ0RnzjoNONDqxN02fjdT2F7wQBUOTVdz+pnxcpGvjnDpGxJwm/aSIZGi8d04Zaok2RATOV+h+i/PixTA3IPN9JKV9og7yhc8L4G9qE/1dNJyP7gPTKsRh8FAfmMAXz7626fkO2StNvrJalAim2kRItTQjB2wVAYp8YKJVxP2qMkg+XBwAg7UGBFKSPn3w==
Received: from MW4PR03CA0198.namprd03.prod.outlook.com (2603:10b6:303:b8::23)
 by SA1PR22MB4182.namprd22.prod.outlook.com (2603:10b6:806:385::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 17:48:50 +0000
Received: from MWH0EPF000C618F.namprd02.prod.outlook.com
 (2603:10b6:303:b8:cafe::e5) by MW4PR03CA0198.outlook.office365.com
 (2603:10b6:303:b8::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Wed,
 6 May 2026 17:48:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 74.117.212.83)
 smtp.mailfrom=selinc.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=selinc.com;
Received-SPF: Pass (protection.outlook.com: domain of selinc.com designates
 74.117.212.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=74.117.212.83; helo=email.selinc.com; pr=C
Received: from email.selinc.com (74.117.212.83) by
 MWH0EPF000C618F.mail.protection.outlook.com (10.167.249.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 17:48:49 +0000
Received: from DUT.ad.selinc.com (10.100.90.200) by
 wpul-exchange.ad.selinc.com (10.53.14.24) with Microsoft SMTP Server id
 15.2.2562.37; Wed, 6 May 2026 10:48:47 -0700
From: Brodie Abrew <brodie_abrew@selinc.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <brodie_abrew@selinc.com>, <platform-driver-x86@vger.kernel.org>,
	<robert.joslyn@redrectangle.org>
Subject: [PATCH v3] platform/x86: sel3350-platform: Retain LED state on load and unload
Date: Wed, 6 May 2026 17:49:16 -0700
Message-ID: <20260507004916.6710-1-brodie_abrew@selinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <65829704-a7b8-208a-255c-6d4586b75772@linux.intel.com>
References: <65829704-a7b8-208a-255c-6d4586b75772@linux.intel.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618F:EE_|SA1PR22MB4182:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a2f7107-da9d-4174-2a51-08deab97baf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qG7PtUNxvVyuuWYzKnBhCFNLx9pMWuuJusK8ANNqXlFhju8y8gItxkqZlPpzKsyARocrPEpKLfEvScIAy6szROKCaq1VVi3yG3l7np0sPF13/p55i/mHUDUqJQOzin+vxfeQr/CckeAQgCaddC2eIvGNRVdq+hbwELhYvfMZohWitRSGPpwL1ABty0jp0fkfJgfqehaiImPzgBnqAAkGcl2dLHfWxvSAPy6RVuOodffjgSRWIRw9c2SxVPEdngIsTiKXR5kK+0+HWPn4ZS95qv4zMfia+2wXlAxuFLWYlzb78cXgjYU1sX6WP9sfK6yAo6Xa0OQ4EPNy81aFJsRSqpeI8luf8L9bkA7uyNBYNfRPxxK9jICqIgfHsF5N2kpCQVS1bZv0Sg3Zc+zwCUb6tSTCvA9Qy5hqIeXfHzP5TnLSOhquagdX4NEAlvQuziYIIowPUHdLRq7cu6MtTwtTkoifs6uaYvDJLLria7PIHzQ2PJdw3TuiwQLX898XEKZIfIVQbU0qikSIUxlSg5Rdka2V//0wTUykqmp6FOrjNP4tm3yGdZqmZzZzkucwBElvX57ABGx5PG7ylisFntbe+7B/gceweVQHJ9jWpHkzlXJo6HU+WWOVSwRbwTW3/BAawpfVqO3yNSMarZcdD4FJp719iL0wl8fi3uJ6ymXL1J9DxYdbX9Mm3SXVgWD2AlSWOdZzxZ90ClUMlNq3qOVpaiXYxy9T4+rEGDGbMu+p72U=
X-Forefront-Antispam-Report:
	CIP:74.117.212.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:email.selinc.com;PTR:wpul-exchange1.selinc.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hj9H7r7IzL08cNZsHHjeDQuq81aLa4qexOm5vR1NiKhAtko90uypczwBsGpu2SPMNBBDQHLQ6SB2td0Y/9XxxiUShTmiXbMGcNA/Cklafe1bQonJO6UHD0nUuzZ94I67xcaxSJEw+fqnEmURI6EgGxKTv0HQpb2OJhd/b/rEjBa7GX1E1MVKGdKkKDNbkX9IFbgF2LE90wvNlPMIfn0kdI0ukbOM1cWKynfic8pXCFzc5vfP6i/UVwSdl4qoKsCdDY4bmsgoNSjDQDhAeo/HVm/cc6m/62lo/5ZwehHPNbXNzUWAWzJFav0Nf3bqA1kVFjbGGVojs9WZ490zEY7bx6mCXwN2DShyihuQNofTwwv+oBjkGxG1cw6ZeYO9dgnbcK4/Xr0Z7oPq0ZRonhbMY95nhjA9T6l9NyBFRJFBIjvas90nw23ziVPsqWaN3ccf
X-OriginatorOrg: selinc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 17:48:49.7879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2f7107-da9d-4174-2a51-08deab97baf6
X-MS-Exchange-CrossTenant-Id: 12381f30-10fe-4e2c-aa3a-5e03ebeb59ec
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=12381f30-10fe-4e2c-aa3a-5e03ebeb59ec;Ip=[74.117.212.83];Helo=[email.selinc.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR22MB4182

When the platform driver is loaded or unloaded, it overwrites the
existing LED states. This can cause a loss of early boot state when the
driver loads, and it can cause the ALARM contact to change state or
flicker.

Explicitly retain the existing LED state to prevent overwriting on
driver load and unload.

Signed-off-by: Brodie Abrew <brodie_abrew@selinc.com>
---
V1 -> V2: Fixed code style, added includes, and fixed other reviewer comments
V2 -> V3: Simplified if statement and removed unnecessary MODULE_ALIAS

 drivers/platform/x86/sel3350-platform.c | 136 ++++++++++++++++++------
 1 file changed, 103 insertions(+), 33 deletions(-)

diff --git a/drivers/platform/x86/sel3350-platform.c b/drivers/platform/x86/sel3350-platform.c
index 02e2081e2333..f3a314235632 100644
--- a/drivers/platform/x86/sel3350-platform.c
+++ b/drivers/platform/x86/sel3350-platform.c
@@ -9,6 +9,8 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/array_size.h>
+#include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/leds.h>
@@ -30,19 +32,82 @@
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
+	  .retain_state_shutdown = 1,
+	},
+	{ .name = "sel:green:aux2",
+	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
+	  .retain_state_suspended = 1,
+	  .retain_state_shutdown = 1,
+	},
+	{ .name = "sel:green:aux3",
+	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
+	  .retain_state_suspended = 1,
+	  .retain_state_shutdown = 1,
+	},
+	{ .name = "sel:green:aux4",
+	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
+	  .retain_state_suspended = 1,
+	  .retain_state_shutdown = 1,
+	},
+	{ .name = "sel:red:alarm",
+	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
+	  .retain_state_suspended = 1,
+	  .retain_state_shutdown = 1,
+	},
 	{ .name = "sel:green:enabled",
-	  .default_state = LEDS_GPIO_DEFSTATE_ON },
-	{ .name = "sel:red:aux1" },
-	{ .name = "sel:red:aux2" },
-	{ .name = "sel:red:aux3" },
-	{ .name = "sel:red:aux4" },
+	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
+	  .retain_state_suspended = 1,
+	  .retain_state_shutdown = 1,
+	},
+	{ .name = "sel:red:aux1",
+	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
+	  .retain_state_suspended = 1,
+	  .retain_state_shutdown = 1,
+	},
+	{ .name = "sel:red:aux2",
+	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
+	  .retain_state_suspended = 1,
+	  .retain_state_shutdown = 1,
+	},
+	{ .name = "sel:red:aux3",
+	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
+	  .retain_state_suspended = 1,
+	  .retain_state_shutdown = 1,
+	},
+	{ .name = "sel:red:aux4",
+	  .default_state = LEDS_GPIO_DEFSTATE_KEEP,
+	  .retain_state_suspended = 1,
+	  .retain_state_shutdown = 1,
+	},
 };
 
 static const struct gpio_led_platform_data sel3350_leds_pdata = {
@@ -50,25 +115,6 @@ static const struct gpio_led_platform_data sel3350_leds_pdata = {
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
@@ -76,6 +122,16 @@ static struct gpiod_lookup_table sel3350_gpios_table = {
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
@@ -149,6 +205,7 @@ struct sel3350_data {
 static int sel3350_probe(struct platform_device *pdev)
 {
 	int rs;
+	int i;
 	struct sel3350_data *sel3350;
 	struct power_supply_config ps_cfg = {};
 
@@ -158,9 +215,19 @@ static int sel3350_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, sel3350);
 
-	gpiod_add_lookup_table(&sel3350_leds_table);
 	gpiod_add_lookup_table(&sel3350_gpios_table);
 
+	for (i = 0; i < ARRAY_SIZE(sel3350_leds); ++i) {
+		sel3350_leds[i].gpiod = devm_gpiod_get(&pdev->dev,
+						       sel3350_leds_gpio_names[i],
+						       GPIOD_ASIS);
+		if (IS_ERR_OR_NULL(sel3350_leds[i].gpiod)) {
+			rs = -EPROBE_DEFER;
+			goto err_gpio_loop;
+		}
+		gpiod_set_consumer_name(sel3350_leds[i].gpiod, sel3350_leds[i].name);
+	}
+
 	sel3350->leds_pdev = platform_device_register_data(
 			NULL,
 			"leds-gpio",
@@ -209,11 +276,15 @@ static int sel3350_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_gpio_loop:
+	while (i--)
+		devm_gpiod_put(&pdev->dev, sel3350_leds[i].gpiod);
+	goto err_platform;
+
 err_ps:
 	platform_device_unregister(sel3350->leds_pdev);
 err_platform:
 	gpiod_remove_lookup_table(&sel3350_gpios_table);
-	gpiod_remove_lookup_table(&sel3350_leds_table);
 
 	return rs;
 }
@@ -224,7 +295,6 @@ static void sel3350_remove(struct platform_device *pdev)
 
 	platform_device_unregister(sel3350->leds_pdev);
 	gpiod_remove_lookup_table(&sel3350_gpios_table);
-	gpiod_remove_lookup_table(&sel3350_leds_table);
 }
 
 static const struct acpi_device_id sel3350_device_ids[] = {
-- 
2.43.0

