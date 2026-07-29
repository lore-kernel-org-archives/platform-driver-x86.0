Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020085.outbound.protection.outlook.com [52.101.225.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194A624DCF6;
	Wed, 29 Jul 2026 05:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785304709; cv=fail; b=jjpmaRzEUl1BujIbLwhSCmgdS7Xc+coFyPb/G3u3W+QySQP92liCp8vtrfkjTkm6Loe81jxcjqNFOcbQvk0Xda78edhFhA5qbseWT9dAuVIP4YQ/bvxK3PinjUYGD1tqE8MiglemUD0Poe42nvWJvvVvlTX2iDewjDfk7jd/M/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785304709; c=relaxed/simple;
	bh=fTgWuMaBuGwzI/p0+7R9y/wN7m2IvJkaV1edf0bK5Wc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=rLvMiVRovAP8FeVcRSlpPtTIqI2fnR2v2/58pkMnTer9qkMXo+rXqaH72jKyF+OojO0bo7Ii7EnJn5BjqciTIjL5mcMXkW/BewIdi1QJmuqLWc4RODhEzowhr7nxoCUbaPnTnzkzovYzSkVoT0yIosreEziytnixPTMTOoS4LG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=Le/GPp65 reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="Le/GPp65"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQ23QME/KISvshTOzP6HL3wyxQabh3hUtEmkBV/5sQFycZfb3dVMur97z5B5dgNtEwYlM8x1TNcEkxjH9sMScpn3L6gV1a8ttfNhPT/THIuNqQkUXp/YW/NafsWZ1E5UHNpmr4ZY5JpXmHgENsd4/iUpdM0ZLgD9y+v1PNBnSqNuqZxrjE5K32+UtF+IBtWhePN4Oi7d6TNuML8RztObfyzKvNJ5htnQIQbhUH3b3wpENx26OUpQBjRzC/Yc5aMSms41hltoX/DHhCPOQSgVhUQ5F1dx5QYNJJsFvH9hBSi/fYVyJhHN8Mg10zZBwhnSY9ukdCNutVeIXNJfMuR1OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tN8j9o9S91tEmMInl5lHSF7KZ/zehVG6qrYWr7t/WjQ=;
 b=lapa7W9VdGrXl5E7Ur/q+w68ukWe9WaIjh1MdppuVO4I0H6SCH3pfL34Lr6jFWgt4zDFyh9sNZNBqfw0zHuJYpamr1O9CiaGfhwojzHXN9eo7f5a2kulvVVCYlP8cIOu5c5J8E3lmcIBspro/k+omBc/TfcrxZtWiSLPru2km0EoOZXFX0AOvAM3Tl/CFbnLuZ234tYbSkUbcr+CNzvSyJMkCF5GViRVpdLyQCNYVe9Ss0QvTIhaJaXDcJT/ky8S5/xtLmmfTbt0pnhGy/FRrB1Rgk7vKYkyOexdX4KEUWKtt/CZ14mU4h/Af8qRYPEiW8D+7Afx9feSbKLF9klcOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tN8j9o9S91tEmMInl5lHSF7KZ/zehVG6qrYWr7t/WjQ=;
 b=Le/GPp65LvA++U064tiDEiK6AYDK70J2WdREfkKb+HVzJqw1gd0MTu7abLOH9BXf2J0H9qVgIWOAgNuSsZ2O90PyRmq9t9oWb8jZbVP43N4SuhhT7qV1kSPUse00pMVlmhvJNmwh/isQy+xRFzvrjIFV+Ju4ORCH5rT3AfTkuuHuNQ+6fydiTy+Bcr73gHLhFnfAaVB6e5giCE5oCrF/CzKv+7JJg1VXebhDeX5ypt7+qNrCBdQlnSFKQsi9U0atjvJSJJYUfr7WpxOgzABRrsVpg7ANaT/yXswA4zXzMkVzh2hwRSKa6zDOS+xVIrgq0WuwF7EiwpGBOc81ZQ+Fdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN4P287MB4941.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:308::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 05:58:23 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 05:58:22 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	linux-media@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v3] platform: int3472: discrete: Support multiple HIDs per GPIO map entry
Date: Wed, 29 Jul 2026 11:28:00 +0530
Message-Id: <20260729055801.751945-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0227.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::14) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN4P287MB4941:EE_
X-MS-Office365-Filtering-Correlation-Id: 6763ceab-3f93-49a4-d898-08deed3665c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|23010399003|1800799024|38350700014|56012099006|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	NITo8tTcm2vOt090BayR+Qh61XEnVhbnV2R3MjGMYALCKbqXiqupteFxn0d6kJZ+WK7HTARtSiMkT2b2ZdYMDWSVlWarunXMW3Ek6xwXzUwvTl5lnluRr4N7kqLqd6xlQIoUru9bXADns+NKDVUHp2a9Vn1exzSdylVElWBD0kg+Kzvg2riYHw6JI3lSLwTi7hBG2XI2OJNbGJ6e6H00n56ULm7MF2mz1h5F2YZ3+rPc1t0wp02M/xSIrEM6iTt2WUDHTZEzsd15ZQstYXjn7Nd8RHXAZ7OyGi+iJy2eeMAg68Ef79Z+bgSDvK8X9eeaAIbCsGYjsDg9TARTQkFjy/OsgzuU7CEv6sq6XOkYd7T4lElAWohF7s7qyh1lPu2PRskvbaAwzNOi/cpGxjuGKfqTdw4xJIC/Olt6fuvLH0a7C5sR/Qk3r02z8ThAlkXhOMkflFpieZfVfYVCAaEjCHa1DTEFMVRTw008zd1Co0OKENLeS92U0vRLN90QQV9Wsb8sOq68kyDbSQnDsDpBrJwor5t2VXjRZh5B/uHmsnrA0mRCqLdtihUKruDHqhcW8nJg4/P2WZovm0tovlNYzw/J87LgeHHKpj9xQCNdzOHn3Do/3J3/KdgM5ffrUbfGsCmAYw+bhq97fIPy7dxwUvvAbutqIw8sQNGy/WwZmeGjpaKGp4ykyjxp/geRzkOhLjxAgM3YOl9ox16MVrLIdzKh4fWRK4BGWGWcDkr0+HE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(23010399003)(1800799024)(38350700014)(56012099006)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1wDgcEYwjM5+buzlinW+5cwhmSjWBQMthyu8zz7sbS1VUXdLmxuLT7eXrnbB?=
 =?us-ascii?Q?7lGrJAo+VL8I4uBDgR8UrJ2R5r057Q2hGWydqoxNFrkvNZuN5YqjKifJ76BV?=
 =?us-ascii?Q?6ohurF3a5IoMuwn5ZTQY4bUmqGBdIvXeNzXhuA9Z+VivkY2MmINj8gXZ8/pG?=
 =?us-ascii?Q?i3L7U9trYPU6OD1sCSAhTRPSpeiqHi+3xDl9zFaaTrOBNxdVTVTOC6NRgeLc?=
 =?us-ascii?Q?oMYx3SyVdKuuLMvscZaBPE8LnW8mbuLQ8+qLZhZk6r/Jztubjct11TEUbLLq?=
 =?us-ascii?Q?xPALk3tKkPUP5cdkefmsUBno9XKLNtLIMmsM5mzx3Fwqq4dlI8cKVo0ja9a9?=
 =?us-ascii?Q?8HiKA/hG9gx4aTQNBYrPMBMthsaMrOZ6gaPvsvVwgNIQBMNphupgiPdVg9vN?=
 =?us-ascii?Q?MrdRU5gk+NKBPXuVa7bqx+5nBBled+AR9X7+we4kAvVX8My9kYsYO6N1XGYv?=
 =?us-ascii?Q?AF0/1ro/Fk5W8XoEvIAaFdcBN6n6R+xEgQqVE3jKC42YTI+OuFJzi08S8Dgd?=
 =?us-ascii?Q?2/nQb8BmsSaHvxoPGQo8iT1pTmR+LQezIsgv3e1nVy37jqhuFiSMYW3ejiIF?=
 =?us-ascii?Q?PrT4eWE29ditSeQ0F3kKaG8k1gb18zXaRh/3QKlTMRC6ThNiDkUfssKzOABE?=
 =?us-ascii?Q?nBPgDqWB2hF4503yPcHwKrvtZekLm66kUGMjKjGjD0Bqga8FomBauCYv8FBq?=
 =?us-ascii?Q?ebloUmc6nvSGVkbgp4UjhR7VaikvfPEBgxHDnXV9aIKIoyAXM/vGNNkxwbW1?=
 =?us-ascii?Q?6lXs+6AKS1aQJH1KELXCC+5sZPzuNzhQ8LTNaXfFBUdchlNrvOpN9SgG0QEh?=
 =?us-ascii?Q?43jOxpXKH3YMnsok+DYBCzizTpZA1whg9AJxp7E+9TXC6+hoc+rPVU2SKaJE?=
 =?us-ascii?Q?jemyMfvwQuO5QK1Ds/C5/ywIZdE0fa0mGXYWGpv3XW6ToyRKaVSK9w1g+Mnm?=
 =?us-ascii?Q?ah3x83LEK5Vd1E4G47OIvLlGwBJqthUpLjlX3JFdgx5966Qbv5ptdbBDWB3K?=
 =?us-ascii?Q?s6+UeMQ+1JL7g/2ihTjWwUzIIC1m0k31qXMstTeJPO8rcKMn5zsWRTMHTM5y?=
 =?us-ascii?Q?4fUPrKkva2NCs3rvDGk+x8GZVEkQGIFzsuTotCyNPI9rzRlBZoiWmdvBQlF6?=
 =?us-ascii?Q?YGQGPjMYlAxIBxm8jnKBsMlpmsb7jv6YCkmG8subBWmZuBgNXwxnnSve9GLc?=
 =?us-ascii?Q?cE/ZF1UIb4qjD89FD/gcckpnZDY1ACr+i2b/rfDqEn6P1XqEdt2kP6Dqqqs4?=
 =?us-ascii?Q?fZrNHdrdvxCLb2/InEfJRljod7YgiHLa9aK7Nib05f0g/OXpF+iWEE/L5uLq?=
 =?us-ascii?Q?bIRta6IdExC5MOI749BGbwi8VREZ7ti9MM8qVfJwSlboa2do5UaeF1IqtMFi?=
 =?us-ascii?Q?umYLrI6AY7bEyj+eWB12G5x6m8i4sJSPYY2ORUMVeLlFUOTseWh+oUWsQzBR?=
 =?us-ascii?Q?VZDB02fs3hBoQyEk+friimzeEWOTVofOiF0yeChp3ewVTItHCppjigyXAE7H?=
 =?us-ascii?Q?V7PGMhMCwl3tK4QYiQd6+rPU6j0sibnIhQls41vjOIs+jjC2JCkfkAkKlT48?=
 =?us-ascii?Q?Usi1oKluxhWxubV5CAOsBjPWnDBIQiEm1884XseVjZEuJ8HseRNnLvZ3KILP?=
 =?us-ascii?Q?l+UKBh3Vv5OAmxCy0rC58uIX3FiPNmhGsYeDUBEsMIs5SIVGPqwkyGyMdNzw?=
 =?us-ascii?Q?zvCBT04/UfOoGHXBr5rvf4IczyQgYSOcxHqYqcwN2TqAnK0G8eMJiDwN4KKN?=
 =?us-ascii?Q?J3TPz4dfZvctJFM+xpyFcgUBJMx8CE4=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 6763ceab-3f93-49a4-d898-08deed3665c1
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 05:58:22.7175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mn/Bey/5qZ53EIU4NDsVc0h2p5gL39HF9JYvJQND9q6KragfXlvmT2pJoMIJXEI/WVqv2+yQXxzeCiNsRq/g8LVpkBT7Me5MkJ2fenu3yAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4941

Each int3472_gpio_map entry currently maps exactly one ACPI HID to a
GPIO quirk. As more sensors needing the same quirk are identified, this
means adding a full duplicate table entry per HID, differing only in
the HID string, which does not scale.

Change int3472_gpio_map::hid to a NULL-terminated hids array so a
single entry can match any number of ACPI HIDs, letting new HIDs be
added to the relevant array instead of duplicating quirk entries.

Cc: linux-media@vger.kernel.org
Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Tested-by: Kate Hsuan <hpa@redhat.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Change-log:

v2 -> v3:

- Move the comments after the HID strings and include the sensor name,
  as suggested by Hans.
- Add the Reviewed-by tags from Hans and Daniel.

v1 -> v2:

- Add per-HID comments to power_enable_hids_vana[] (Lenovo X9-14/X9-15
  for SONY471A, Lenovo X1 Carbon G14 for TBE20A0)
- Convert INT33F0 (mt9m114), INT347E (ov7251) entries to use named
  power_enable_hids_*[] arrays instead of anonymous compound literals,
  for style consistency
- Did not convert OVTI08F4 (ov08x40) to a named array, and did not add
  a NULL guard in int3472_gpio_map_hids_match(): not fully convinced
  these changes are needed yet, but open to further discussion on both

---
 drivers/platform/x86/intel/int3472/discrete.c | 59 +++++++++++++------
 1 file changed, 40 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index adff564bf3fd..6c729fcfce5d 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -123,10 +123,31 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
 	return desc;
 }

+/*
+ * Other vana-supply users (e.g. ST, Toshiba, Sony sensors) can be added to
+ * this array instead of adding new quirk table entries.
+ */
+static const char * const power_enable_hids_vana[] = {
+	"SONY471A", /* imx471 on Lenovo X9-14 and X9-15 */
+	"TBE20A0", /* imx471 on Lenovo X1 Carbon G14 */
+	NULL
+};
+
+static const char * const power_enable_hids_vdd[] = {
+	"INT33F0", /* mt9m114 */
+	NULL
+};
+
+static const char * const power_enable_hids_enable[] = {
+	"INT347E", /* ov7251 */
+	NULL
+};
+
 /**
  * struct int3472_gpio_map - Map GPIOs to whatever is expected by the
  * sensor driver (as in DT bindings)
- * @hid: The ACPI HID of the device without the instance number e.g. INT347E
+ * @hids: NULL-terminated array of ACPI HIDs of the devices without the
+ * instance number e.g. INT347E
  * @type_from: The GPIO type from ACPI ?SDT
  * @type_to: The assigned GPIO type, typically same as @type_from
  * @enable_time_us: Enable time in usec for GPIOs mapped to regulators
@@ -135,7 +156,7 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
  * GPIO_ACTIVE_HIGH otherwise
  */
 struct int3472_gpio_map {
-	const char *hid;
+	const char * const *hids;
 	u8 type_from;
 	u8 type_to;
 	bool polarity_low;
@@ -145,38 +166,27 @@ struct int3472_gpio_map {

 static const struct int3472_gpio_map int3472_gpio_map[] = {
 	{	/* mt9m114 designs declare a powerdown pin which controls the regulators */
-		.hid = "INT33F0",
+		.hids = power_enable_hids_vdd,
 		.type_from = INT3472_GPIO_TYPE_POWERDOWN,
 		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
 		.con_id = "vdd",
 		.enable_time_us = GPIO_REGULATOR_ENABLE_TIME,
 	},
 	{	/* ov7251 driver / DT-bindings expect "enable" as con_id for reset */
-		.hid = "INT347E",
+		.hids = power_enable_hids_enable,
 		.type_from = INT3472_GPIO_TYPE_RESET,
 		.type_to = INT3472_GPIO_TYPE_RESET,
 		.con_id = "enable",
 	},
 	{	/* ov08x40's handshake pin needs a 45 ms delay on some HP laptops */
-		.hid = "OVTI08F4",
+		.hids = (const char * const[]) { "OVTI08F4", NULL },
 		.type_from = INT3472_GPIO_TYPE_HANDSHAKE,
 		.type_to = INT3472_GPIO_TYPE_HANDSHAKE,
 		.con_id = "dvdd",
 		.enable_time_us = 45 * USEC_PER_MSEC,
 	},
-	{	/* imx471 expects "vana" as con_id for power enable */
-		.hid = "SONY471A",
-		.type_from = INT3472_GPIO_TYPE_POWER_ENABLE,
-		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
-		.con_id = "vana",
-		.enable_time_us = GPIO_REGULATOR_ENABLE_TIME,
-	},
-	{
-		/*
-		 * imx471 (on Lenovo ThinkPads X1 G14) expects "vana" as con_id
-		 * for power enable
-		 */
-		.hid = "TBE20A0",
+	{	/* Sensors which expect "vana" as con_id for power enable */
+		.hids = power_enable_hids_vana,
 		.type_from = INT3472_GPIO_TYPE_POWER_ENABLE,
 		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
 		.con_id = "vana",
@@ -184,6 +194,17 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
 	},
 };

+static bool int3472_gpio_map_hids_match(struct acpi_device *adev,
+					const char * const *hids)
+{
+	for (unsigned int i = 0; hids[i]; i++) {
+		if (acpi_dev_hid_uid_match(adev, hids[i], NULL))
+			return true;
+	}
+
+	return false;
+}
+
 static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3472, u8 *type,
 					    const char **con_id, unsigned long *gpio_flags,
 					    unsigned int *enable_time_us)
@@ -200,7 +221,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		if (*type != int3472_gpio_map[i].type_from)
 			continue;

-		if (!acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
+		if (!int3472_gpio_map_hids_match(adev, int3472_gpio_map[i].hids))
 			continue;

 		dev_dbg(int3472->dev, "mapping type 0x%02x pin to 0x%02x %s\n",
--
2.34.1

