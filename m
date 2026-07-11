Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021115.outbound.protection.outlook.com [40.107.57.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522382DCF74;
	Sat, 11 Jul 2026 11:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783768586; cv=fail; b=OHHAYIOfRojYxr4m8Ib9sJZFVWVUnb5dEkYRACAg/lNMLgKb749I47B2Mrwo8qG7mL0y2/DcWzocAHGgUziqftTtCcBWlZOP8uFQFY60NjB+SVlmzvnZzvRq4+P1lolMWYM+zu1jyp4P8M3RRffIcM9P+qLzpsL7JdBvsX+XJxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783768586; c=relaxed/simple;
	bh=Iij31hr73HmtzAu4vLH6Ou/rEtZQXBuC7BfAkWggSWU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=tlMM4IDrpOS3Xz5tp1PZYkOzz0BbZJ1zJTSHB0xpr8NIvTunzzrirDn7xIVw9w7Wzd+QUx+1KUgNfvN1WirUBVFYMz5NZ0q2IrqlAYyl6+q1BGml+QwFV1ng5KVYZeYQ41xoMaQnxePcjkuMs93/yGo2bUxCAlzEg6gkOpIX63Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=c++CFWO0 reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="c++CFWO0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICQi7LlQhHqBqNQwhb2x/t9IZGijGmG4fS7WtOScwOnuyK+Jz9aI2ZmfR5l+q3+5qNvw+dxjNfAgPMFC2Gh2QTCurcm2GSR6q8ByzjiM90WixYnPcP1Kn3SkkZuHRWl4sbVzn9x4KXtAZ7rQcJCqSEU88ZQmJQOCF7V4afphsYjNGBq7yQSYCjcJ2sGYobrHrue/R+zkDIXNOD+Fclc2N4+/WP3Zo3UNDFFsWY1ajC7MmJCY6RpVOEuphD6jy6YKiasCBXH9GVh4IEW7b8jM9v0+QODlDSGNugJjuZM7yT5v7tSVsNsXFQImyJY2Hajjvvv5ODtFGn0mAdHi/c2BMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzI08P4W2N5EQtuEBUbC5iO/GbhbmNVw84Un87tS9Ow=;
 b=W83w8WVgHUyN3ZXAoSSYOXOtWuTUYoG8ejtMMLSeYGlEOmFd+OiPoPshX5ZIeH5ICV4zfbOmGmz6Z9iHfuTeMinii6pLayTFCdrgLrx/pLD0Vnh6sKUYgW5rQ2vbJkAnZnYgGIu3Dm5geNBhvsMqbwvE4ugigWd8tBPZZgFo3MVwxNu6PfzPjNYs+WlW2POEaQIkSy2YDcggQMcAiDCuW+E3FlYk5I7fyp8t73jQQNuogS/D8Au9Vwn5HYL2eREZA9pdNF1crxxVBhtSjNRfjCHCnii1npVmzX1o38/Jxwob2l630OX5eistPNeyRHcyjxmmo4FBE2LzE8g1kCvgBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzI08P4W2N5EQtuEBUbC5iO/GbhbmNVw84Un87tS9Ow=;
 b=c++CFWO0jzpYtviBo1ZrLRFoaaXCm2Ojvzd5UAWm4FTz08XaYr8t5PyJFyuNxqD7G5Rl/bae5rUD5NkZotbtxK0x48kjCvZwoIqHDAJNrX8e3sg5gEItg8znmRJmRnlbq8a6tEdc5Zjhjagp5jOQJA5Hl1mwLc2nyq0ibajH8MxX3AOpZ3AFF0Tlj50YmtIB5OSocDSkAXqAIiE6xO0qCnX+a7l1sXlvS8MhXB/vEUoVDZ0njXDT6WhrD42m0MNSfn4eolHxZKzpb+2sTasnNx2qvuU4064Pj1QNNKryO3F7G15FKw8LlkTGQRWw3PjDh97KTRT3ZI78kejulaz4rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN1P287MB3648.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:257::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Sat, 11 Jul
 2026 11:16:19 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0181.019; Sat, 11 Jul 2026
 11:16:18 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	hansg@kernel.org
Cc: hpa@redhat.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform: int3472: discrete: Support multiple HIDs per GPIO map entry
Date: Sat, 11 Jul 2026 16:43:58 +0530
Message-Id: <20260711111356.54497-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:272::15) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN1P287MB3648:EE_
X-MS-Office365-Filtering-Correlation-Id: 2676f651-87c0-45be-9bdc-08dedf3dd493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|18002099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	2moVL7EHkmwBfTfMhaA8lTvwzXHVnO2hS9Wwcfw2GJ16Xr1CVeP1YrmDne84BIGZIn8o3Teen81pRT2LkXG8fbxRrH0VCpsGYMJcjzXfj/RRlsFVmCqZNTr6UqemVYkmTbtXY3R49y3aut3pavlJ26MSi/YC8kQpSXVBniKomrnm9L//6rqPJYkYVznnsIHGiWWv/BESnN8e6OpZF0hqdaFiubDvwBgTXg4OpUQNfQE8s/HvmbwQjgpBXF8q+7pxgnrU7WfAyRoT58NsOy0lv1K7/v/PeZ0PXhb9m0uOCInTP0gcpkruZu6f9UrrYLt5Mz0Uo14P6rFzuESth8jUVjhGHsorhcw1j3QqcmiAuHffqUiA2wBx2yy7yWzqej53uMSUYuiFpNeJekM1FWa2RJ42FutIiks08LYnEgt4ibl/7qZS+GrPpJLple5+7VcBI+487dQE/Oo0jCeoN+SOQJPwTJhmu7QljGBDkqJNkA6J1+J9r8bw9ktxNkv8YbWn6zjbmaR9tBGAWWwoUCbRKe/rKl5QMIb4/iUUqI+vOt/bJ0oCddjh3O6vHaSuLu8wK3Vl4IgAEttzWgqzPxdsFz3BsZw32pkiVEwRtAVGkiI+Om4BrXHF1djbALBqmeYJh/zxrl16QMYpm/z7YFyDInn8livpI/A+KeEMgobxdQs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(18002099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bExBdWtMR2g5Q3IxN251YmRFZGp5cTJic2tnczAxU2JrakJWZmRMQTM0RTdw?=
 =?utf-8?B?NnMreWUrMHZjVU9rYjZ1MXZSd04ya25VbmFVV2tEdk50WnhVRjJQS0N2UUU3?=
 =?utf-8?B?b1ArMzFqMlRROE1MUTNjMFdpQjkzU3JEMGVqRFFwQ0pjNmhwYjkvcU8vempI?=
 =?utf-8?B?ZXcwNTVVaU9LbGV6emdKMndDOVZidUJsR052akVSY09pYXNrcStYRjZXTDFB?=
 =?utf-8?B?cCs5ZzcwMDBySVB0NW9WVDFLSTRkKytvcWtweU5lZWpUanp6T0M5VllmQXpS?=
 =?utf-8?B?ck9scVIvam9LNHJlOVNCb3NJQkJnNXAzM1FueVFOV1FsNlMveWdiT3d6dFVq?=
 =?utf-8?B?MlNVQmNnVW16a2hnb1V0WmRRb28zV2kzYUNyZGFIdUFiQlNMb29wZlg3UjdF?=
 =?utf-8?B?UVY1Q3NQN3M3TGg0MVZnLzRUQU5EdGhZVmZaT1BmUkoyaDZQVnpFeW1icHcw?=
 =?utf-8?B?aisycmJQUXN2VU1obGZJMjlXWFp5TG5HWExtZVFrVDdSUkhkcTJJTkFDU2cw?=
 =?utf-8?B?UG41ZmVSV2plWXQ5b2xTMXRiaSt5R0VoVzZCZjExMnowdHcxMGZEcW9uYU9n?=
 =?utf-8?B?S1RFNGllbndXdDk1eDE0OW1TU0M5cCsyTG5Ycm0zZ1RiVmJ3NHRDTis1THln?=
 =?utf-8?B?dGRHOVVCQnZMaUtPRlluakFFbUJvQVg1ZE54YjE0R2RyWXpmekJkeU4yL1dS?=
 =?utf-8?B?SFFnWWNseXBMUkM1YWxVRndhUmxnUEpNeXRxSGYwdlF0NHFuMXBkb093N1h2?=
 =?utf-8?B?U1FRaG9ON1VZSkIzYUpibEtxblZOMDZ0YSs0OS9rZlQyT1g5ZXJkREFlb2l3?=
 =?utf-8?B?YkNaS0U5STJxY1hmcXgzZkZmZDVZZHFEdlRQeFpRVG83L3VjVEJSMWd2ZkQ4?=
 =?utf-8?B?dlJSbzdrV0FrWUcrMk5iNlZDWmQweDBGcTZXNW9GaVJyU1hhbVpKNjlHS0Rm?=
 =?utf-8?B?K1hiYjhnUUZBd2Z0bG9mVXQ5TlB0SUNkRTFHRklUN3pWTHJTeGp1NnN6eE90?=
 =?utf-8?B?aUR5U0ZRbUo1MHIxVktDa0pJZi93YmMvUDZJMzVFQlZYRm95WUpZRzNBc2RW?=
 =?utf-8?B?TnFmczdCenFvK1ZTQ2g5MEhGWTF0S2F0K0s2ZEswbEd5Z3dzU2tKQ1RBK00r?=
 =?utf-8?B?THZ0eHZkVkxyS3JyY2s1Tk9JUTEvSkpvZjdHRkpoODhBMXB5b0VPakJoc0xY?=
 =?utf-8?B?RkwzT2tkc0dXNTZmNFdaaUxKNTU3Q2kzOERKM1dNK2pPYkNpeVBqVVZMTksw?=
 =?utf-8?B?bEdEalQraTV6ak5VR0xpTkgrVTNMc29EQmN5Sm5rS0ZUREdWcXVEa1BrRXVS?=
 =?utf-8?B?c25lWldTbFFaelVwaVpDcERZb09Fa0VpK1VlajBTdk53WS9OeHBhUnp2ck1I?=
 =?utf-8?B?Nm9BQ205dmZVZXhpTkRYblNRcUhUeXQxTUNJYlArSEM4ekhrMjVLaG5HTmJv?=
 =?utf-8?B?MElrcHZESDBmamJ4MWJQelgvbnBlUjBPOFFCL2g4MlA5eWhBb0V6N0lVczh6?=
 =?utf-8?B?ZDZvd2YveDRXY05HU1gyMG9LYnhhbFlGNnBETU9EMUZkdTVtVG01T0V5enRh?=
 =?utf-8?B?ZlNWblVnOVZUczdMNGVLbjA1S1dVSFoxVGpHajIxMk5yVUVUVC9QMXRpQkdK?=
 =?utf-8?B?R0lEZnBoVG0yVWNTZVlCZVZLQk1JR293eFRqRVdaSHJaRUJJNHNUdDZMV3ly?=
 =?utf-8?B?Qkd4eVkzNkh4WkJQa2R6TnJzWTF4WUdScjFwUG9TakQzcnBSdEd4UnJubjF2?=
 =?utf-8?B?dGIyZStzMC9OdExaMmhCM3N4SGQxVGtyd0E0MmVXNzdrR3pyNGxLTjdDQnpN?=
 =?utf-8?B?Y1o1alpiblpwSmtDT2pMVjVSTTFTdzBLUnZNQUhicGdDNTQ3bWYxZk5pQ0ps?=
 =?utf-8?B?S3pvWStvNGhVNEFSL2pZODQvb21XSDEwbk5sYTJnUDU1RTJVOFo2VG84WGRo?=
 =?utf-8?B?dDMzRms0bzlrRmRzenA4c3gvNzJWQUNNTkZwOG0rWmdTWUNlSGk3ZER6dmsr?=
 =?utf-8?B?OHBaVzNyNWU4aTJObUNqZDZhVmNLRFRUQUpRbXVlY3hxSVc3RWdGYTJ4am5n?=
 =?utf-8?B?K3M5dmZTQXdlQ1lLYVZudU9tNldsRlMyVCtaRi9rMEVKYnFEeVA2YURJc3Rw?=
 =?utf-8?B?OE9zRzgyWVFsVVAwSGlibHIvaWJBUUdGRG5ETzliSDBqelliTjdLSkpkYmQr?=
 =?utf-8?B?Q2gyZnRSa1RhOXFXalJDcGhHQ2M4TXU2U1UyWUt1YlZCNUNXRjczeWc1dFB6?=
 =?utf-8?B?bk5UUkRQZUZ2RXdxYjQyczFKb3NZaldaT3pteEtVYk9ML3JpVW5obEEwRkhG?=
 =?utf-8?B?c3E4cTZJVUxGOUpTQ2JST0tuSWZCVFdZWWI2eU16QmpVT0pLMElNSUJmYTZO?=
 =?utf-8?Q?rcOoEjxl52nkl9R8=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 2676f651-87c0-45be-9bdc-08dedf3dd493
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2026 11:16:18.6915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NjWG96GbIAMLkJ41zpbdNTlmX+ffSjyZSJLsCdzqjTc3qh9OUiKY7N6FNGbr686VA0yU8iyoawsqX7dtIvkBpgPZJg/BW0j/whBb3Uf/1zg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1P287MB3648

Each int3472_gpio_map entry currently maps exactly one ACPI HID to a
GPIO quirk. As more sensors needing the same quirk are identified, this
means adding a full duplicate table entry per HID, differing only in
the HID string, which does not scale.

Change int3472_gpio_map::hid to a NULL-terminated hids array so a
single entry can match any number of ACPI HIDs, letting new HIDs be
added to the relevant array instead of duplicating quirk entries.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---

Identified while reviewing Kate Hsuan's imx471 vana con_id patch, whose    
two near-identical SONY471A/TBE20A0 entries are collapsed here into            
one, backed by a new power_enable_hids_vana[] array.                           
                                                                               
This patch is on top of kate's imx471 driver series[1].                        
                                                                               
Link: https://lore.kernel.org/linux-media/20260629074026.35490-1-hpa@redhat.com/T/#t [1].

---
 drivers/platform/x86/intel/int3472/discrete.c | 49 ++++++++++++-------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index adff564bf3fd..f86333e38341 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -123,10 +123,21 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
 	return desc;
 }

+/*
+ * Other vana-supply users (e.g. ST, Toshiba, Sony sensors) can be added to
+ * this array instead of adding new quirk table entries.
+ */
+static const char * const power_enable_hids_vana[] = {
+	"SONY471A",
+	"TBE20A0",
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
@@ -135,7 +146,7 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
  * GPIO_ACTIVE_HIGH otherwise
  */
 struct int3472_gpio_map {
-	const char *hid;
+	const char * const *hids;
 	u8 type_from;
 	u8 type_to;
 	bool polarity_low;
@@ -145,38 +156,27 @@ struct int3472_gpio_map {

 static const struct int3472_gpio_map int3472_gpio_map[] = {
 	{	/* mt9m114 designs declare a powerdown pin which controls the regulators */
-		.hid = "INT33F0",
+		.hids = (const char * const[]) { "INT33F0", NULL },
 		.type_from = INT3472_GPIO_TYPE_POWERDOWN,
 		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
 		.con_id = "vdd",
 		.enable_time_us = GPIO_REGULATOR_ENABLE_TIME,
 	},
 	{	/* ov7251 driver / DT-bindings expect "enable" as con_id for reset */
-		.hid = "INT347E",
+		.hids = (const char * const[]) { "INT347E", NULL },
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
@@ -184,6 +184,17 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
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
@@ -200,7 +211,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		if (*type != int3472_gpio_map[i].type_from)
 			continue;

-		if (!acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
+		if (!int3472_gpio_map_hids_match(adev, int3472_gpio_map[i].hids))
 			continue;

 		dev_dbg(int3472->dev, "mapping type 0x%02x pin to 0x%02x %s\n",
--
2.34.1

