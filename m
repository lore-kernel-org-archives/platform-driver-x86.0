Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013012.outbound.protection.outlook.com [40.93.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C88B37418F
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Apr 2026 21:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775769997; cv=fail; b=OJbau2CWQ7uVsLwmPoPcgq8V/TFKtpulpMVX1mRCw2T3ULMKfD7Toa1o0o5dSisbDDRWVo9QDYmU1KWqvbWuEvYCC2hV94/1aJ8BPbnFp+Gqfo2TfZvzEN/KbXeE4PWj0M+DjDYu6FZivbwZj4d6SmZ2Mx/lol/F/Ls860atr4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775769997; c=relaxed/simple;
	bh=NO11VCzulMUbKWAaAZvp5tZCeGFpFhjAUDn35UysyJQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MxX7Bkrnz8miJhQwkkCtDG22Y5cL4PFck5UXssJ831n3r62uDvJnL80LbIPzuViwe/BQwHHym5d9LWBxy480jgM7OZyVD9J9WUWbxH+aqcsxGzHlQ00POGDe1DrU8BjbOkjcKDPPWWAViJcwxfnwlUgMzZS13KwNYXrRZGHyQuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=selinc.com; spf=pass smtp.mailfrom=selinc.com; dkim=pass (2048-bit key) header.d=selinc.com header.i=@selinc.com header.b=iypZiGBN; arc=fail smtp.client-ip=40.93.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=selinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=selinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=selinc.com header.i=@selinc.com header.b="iypZiGBN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xm5AZVx2QekAaCFz6Dn8pcqxo2zkWfZ+D83TnCMnTgn2TPVmxjuhr3b0dfIoVTGP6HyyTL3bJ2EifPSx5NEe0uoC8IlQLxXQiMitPumSYm8esSak3wdeAKOaduT/SHb6OXDpRCKEmNkr2dap6HpuaKwiXXt7bdvjHVw7Y4eKURkKrLFDBX7jyXQ5DaqKSjLxNSlegPqnyXHAHbvpO5L94ffOQwNRZYD2tZpa2ZYS1Yuw8HWEtvPhFjb7439ePUOgfSJ0Z4lZSahjj6xv5YsYPoboaT05ehSduxA7sJMw/WnmbpXO8dQr5Dc8FtOaB2JD4+Ie2Udq87+5CSPJQWAwYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/qcZkjGQzSjtPfYuO7XzRSx2L81R/1ozKH+XQjLlQE=;
 b=CZj+mIlRha03sK9WC3RLNDA+v2W1ovr8eXg846fGuwV+ZqaAFZsrnWwcvQKYYURyqGHyQGP6OtI9XH3vZjY+xFMdATS20AcLl3TIpZMyRjFl0cnOrlGiAYwORHu1xn96IsOtRQKrL8a+/N1Q5F0MPUdqaF8cUxrgqLMIhrCxRtDY8wLQXjeA7M15a1S+kt3mXoo44eb0g+2DmJ5wMftWb7QshDYYhS17VBYdG6sz8Dj7KUH8ReSjkI70a9+KDhk0hVtAF+HDuOp69Z3J/oubL1Fl/twBj3DRX8eVZZH2M/F/JI2QW/kMfG72JNl+4rzfh1KaM+Odq2uSZkBLKneKMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 74.117.212.83) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=selinc.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=selinc.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/qcZkjGQzSjtPfYuO7XzRSx2L81R/1ozKH+XQjLlQE=;
 b=iypZiGBNxdw3RtFvBzBa2cU0YQRfp8eJxKczgK79ZKdUP/DeFbGUNIYjqmuSnVNk4AfMXI+HnGVQfVBud8b3NUbsBEouwL/DEpqQecuv6xcwHkJSa/qote97IGIfRJG0mIVvVyYPxdWwCA4v6C019xuEbM2xmTXqQ57k4QWgoceh+XPUviEA5wSpULT7LTwPlkEJNP/wTW92PgejjMWgA/3nFC+k5w8WecNuj8kX0UC6qzSnYHMnGxqeSgGTAFNBO8x+nr5Ykozizl8V+rSYtVEoLjbwxoyk+5j49+Qk3sA8H7L6ObSX7PaVJzKqC3lwdy2VoWHHlJMkjst1AaePcQ==
Received: from CY8PR11CA0005.namprd11.prod.outlook.com (2603:10b6:930:48::18)
 by SA1PR22MB5084.namprd22.prod.outlook.com (2603:10b6:806:3c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.42; Thu, 9 Apr
 2026 21:26:31 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:930:48:cafe::cf) by CY8PR11CA0005.outlook.office365.com
 (2603:10b6:930:48::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.35 via Frontend Transport; Thu,
 9 Apr 2026 21:26:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 74.117.212.83)
 smtp.mailfrom=selinc.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=selinc.com;
Received-SPF: Pass (protection.outlook.com: domain of selinc.com designates
 74.117.212.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=74.117.212.83; helo=email.selinc.com; pr=C
Received: from email.selinc.com (74.117.212.83) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 21:26:30 +0000
Received: from DUT.ad.selinc.com (10.100.90.200) by
 wpul-exchange.ad.selinc.com (10.53.14.24) with Microsoft SMTP Server id
 15.2.2562.37; Thu, 9 Apr 2026 14:26:28 -0700
From: Brodie Abrew <brodie_abrew@selinc.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <brodie_abrew@selinc.com>, <platform-driver-x86@vger.kernel.org>,
	<robert.joslyn@redrectangle.org>
Subject: [PATCH v2] platform/x86: sel3350-platform: Retain LED state on load and unload
Date: Thu, 9 Apr 2026 14:27:01 -0700
Message-ID: <20260409212701.88577-1-brodie_abrew@selinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7bd355c0-b363-94c8-bb4d-fe4acd29798c@linux.intel.com>
References: <7bd355c0-b363-94c8-bb4d-fe4acd29798c@linux.intel.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|SA1PR22MB5084:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b013cbc-4dca-4908-1d4a-08de967eaa8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BGkLuvQXZ3N9Q+Z9UbmyYVaSa9hnTA5ky45l4egoXsedhZcd8MULj7rxg5qZkqH17gy72cBPsJrC2pVuZTSwIOAkZLkVcLYzAH38HggIVszepawRm6GgnIj7o2zLpxaLwvP8pkK9XaCPe4l/HkoDsfUpwJkLX66I9Fwq0jNRI3GFiExL4VYguekYkaQiMAVNoH06a0zA6dIPtP31LSuwP9d+54tETAypqRw3fgbwb4XFaHfzVtoM1AtkJqaL/uQvj5bew3BNZhE/twgJ7VdwrR/cV4w42Twy1MHwQLcAnvc7ufywe5V7Y7lYXPSIoPk3wl1K2wmlLLtmpA7sT4tjE4uJj7kCtZe1b3tDYYpHcOpBGeDI37ahwZQXBrDHW76cvdNuMq2CWQaz3xWzUhsG5h0JDLL4+bW3GCZRM/8TuoIfJvyVF+Rw0s9a64m+m0gXMNlBDW1CLlLRJ72K13Of6zh+2zVna1L1a0nW0l6mvgO/5394+ttXTTFaRC6Fo+GOeFyZ/62JYGl0b+PQgZw59sE7+AR1Wrh19ZceQ2UJOo9pWY5h6TON4TcocdDX4g7w96eGXsM+Uj9I6o97iSpCAEPoYw/JGGvb5Zg66xG3Z8Fj1Pk3CBvwTUbygMgchxPPk0cg5esDDkPhDSVt3AHh8LjWRkIa7nSqa4/thhzm9HYXGsdruVLOfFSZN+uZVGdlsu01FYWAnIv1ANr/NUdAVD1cK218slnuspHzJBpqzXfeZ7I3epeMOPgNkAyq0HqIXJ7oY4Dnrh/z4wGScLvCjg==
X-Forefront-Antispam-Report:
	CIP:74.117.212.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:email.selinc.com;PTR:wpul-exchange1.selinc.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8+iw+buchF6vMx6iYEvfrzjqVYoyNA/vb48q2e90gVwdzMD6ZUa/i13IdFDolZGyAGPsN5bGtRbGUnwCLeJp7FGAaikfthF5HtMNusXRL0LUS70U4XzU/vLeOXz3YpZbIko7xSUEw/pojoqwAdjeqFpDa2bBVXRKPa9pc59xqsge08cpsIx+R09DPsxZ8fJTHMO8c+2qhwr6skYqe+BtmbYQ88WHbOXxXDRxXqHMN+SiFlXdwdAFj6/UM8tKXC3ufvyFYZJ/e4hpF8nUdFgdEHg7YAdBtO4AAjCKp01Axw/plW2bb4uZGeL8d4eGWpRXtEhGe9Zpx94ahHGs5Wr7/vvKRyDrh+du7IxT1RiUBL7JnQJB1vEG29tNfzRhKeNq0EsChz1kwQnpoZL5Gfb/2QBPXOwGPw3mtpcuz+XzswK01hRdecxD+1aqwQgZP/Qt
X-OriginatorOrg: selinc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 21:26:30.3659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b013cbc-4dca-4908-1d4a-08de967eaa8a
X-MS-Exchange-CrossTenant-Id: 12381f30-10fe-4e2c-aa3a-5e03ebeb59ec
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=12381f30-10fe-4e2c-aa3a-5e03ebeb59ec;Ip=[74.117.212.83];Helo=[email.selinc.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR22MB5084

When the platform driver is loaded or unloaded, it overwrites the
existing LED states. This can cause a loss of early boot state when the
driver loads, and it can cause the ALARM contact to change state or
flicker.

Explicitly retain the existing LED state to prevent overwriting on
driver load and unload.

Signed-off-by: Brodie Abrew <brodie_abrew@selinc.com>
---
V1 -> V2: Fixed code style, added includes, and fixed other reviewer comments

 drivers/platform/x86/sel3350-platform.c | 138 ++++++++++++++++++------
 1 file changed, 105 insertions(+), 33 deletions(-)

diff --git a/drivers/platform/x86/sel3350-platform.c b/drivers/platform/x86/sel3350-platform.c
index 02e2081e2333..7b0dc1d11199 100644
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
 
@@ -158,9 +215,20 @@ static int sel3350_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, sel3350);
 
-	gpiod_add_lookup_table(&sel3350_leds_table);
 	gpiod_add_lookup_table(&sel3350_gpios_table);
 
+	for (i = 0; i < ARRAY_SIZE(sel3350_leds); ++i) {
+		sel3350_leds[i].gpiod = devm_gpiod_get(&pdev->dev,
+						       sel3350_leds_gpio_names[i],
+						       GPIOD_ASIS);
+		if (IS_ERR(sel3350_leds[i].gpiod) ||
+		    (sel3350_leds[i].gpiod == NULL)) {
+			rs = -EPROBE_DEFER;
+			goto err_gpio_loop;
+		}
+		gpiod_set_consumer_name(sel3350_leds[i].gpiod, sel3350_leds[i].name);
+	}
+
 	sel3350->leds_pdev = platform_device_register_data(
 			NULL,
 			"leds-gpio",
@@ -209,11 +277,15 @@ static int sel3350_probe(struct platform_device *pdev)
 
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
@@ -224,7 +296,6 @@ static void sel3350_remove(struct platform_device *pdev)
 
 	platform_device_unregister(sel3350->leds_pdev);
 	gpiod_remove_lookup_table(&sel3350_gpios_table);
-	gpiod_remove_lookup_table(&sel3350_leds_table);
 }
 
 static const struct acpi_device_id sel3350_device_ids[] = {
@@ -246,4 +317,5 @@ module_platform_driver(sel3350_platform_driver);
 MODULE_AUTHOR("Schweitzer Engineering Laboratories");
 MODULE_DESCRIPTION("SEL-3350 platform driver");
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS("platform:sel3350");
 MODULE_SOFTDEP("pre: pinctrl_broxton leds-gpio");
-- 
2.43.0

