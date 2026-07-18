Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021113.outbound.protection.outlook.com [40.107.57.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E615288D0;
	Sat, 18 Jul 2026 20:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784407138; cv=fail; b=G97c1TFwDOD/Pg0d+XGx5QlF9UxtIrc7fF6GUVHqF71VqOlcX4ZA+PPRQ+PYfaCb9gzXLx4hBPoDvKRK9uP9JWE/jb62/3cxebk4mTrpz6NSUZycqorAFT/KlCoZjoiaXoJOFbewb1fBb75YLF6uM4egktCi0KRtonQznG/UAnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784407138; c=relaxed/simple;
	bh=NbMONZN+gcc614EkIizxwXNcX4kR8dGYa8ISEvar0zs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=BgqWWUCYuCI7IJ+nlfSBVfSfWOkRLHz07+mew9/8BqTWBZdVPNo/jNTti+rVdX/cMgBjbQP3P7HuVrjm3z8AwNkmGt/tp96u34y5aJawVqxL3mKBR092iczeLJ2iyxx/4FXIYT0/AYoRgDi/w4PlWI5m2cPOQZdeJFjyKlraQH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=Vrf7xqeu reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="Vrf7xqeu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q85jUZRl0wtc/7Uo2FFmYZt28/IwdFprhDtDh/y3bVgTZ0YkSFKosQtDKS7dwFKlCiw1TV5yJNYr0H34WTBJFmjU3UBYtSZhuwsDTmyJ0cyCJ3/HYuLcrTXIlCWqmUJ8pkR+S9EaZ4ponVSJbTypBETZ51JFbWoOfo5MmraV3B1RG3AuFFE73xcvZWvq28sA9Os1mIjC+QDqAMDVhcAuLaNeBPCM4avdLd+ZqjO6DJOnQTbuZw7JKhdYbyX8e6RuI+suIDQl7kyig7ARr8W6773N9FrNXVH9QHw+b+tPkqtQcvDXXMC2ba6sW2xdBmDxT1zEkfDur3+yi4cqY8KoGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRyzdPJ2XBBED5L+PJD1bTgJYqfaaGgTrk2A5pp5f5Y=;
 b=oKQv/3XXL00FsKxo/cvpWYT5QPLnJZxQaiYqmlhyiivjNyY42nnAbqvMn3Kcm2ln82e91DuPso8j2BSyLBvW4Yxy8THcx7KQJopoa6XZn/WzbcG/dvyhJQc3PYIfZbzrkeT9G9/SxHV8RTgj9EAHgPWeURqhEB10dDzxBuAhoHXgjZ/xLthHPtjPoVq5SMf+Hzo7MB9ZEAC379ZeNEwyfU9qIb1VLvExgrp1+Mq7tTT/RcGPGiLkze+P3+MiTR1V2or0VGxowghIcNBBu0BhWTxtst6xHPwjhu0gWROtM9LdfFJv9bI79pYV2uXNO5xkUXlxtdEri1MXLyYXLiKQkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRyzdPJ2XBBED5L+PJD1bTgJYqfaaGgTrk2A5pp5f5Y=;
 b=Vrf7xqeumG62T1IboRBR/0+VSUg2H3XfkQgQAx4jRIFG/0LgjReZghjkRpmfNQGaWwDnskc948DuSk+ZXSArUTkVFIABQmzOL7b27NCdEuDjhuTdQ0ZabFI1qZ4PlP0o4wVUAes9GLNJEPntKqs1dM4k1b8sx4VlGz0jgkOQWVlshwojZtyBHP+0aiixjT2OWAgbdWDzQdULhzwuMrSGveVgDsRO1fGwnJYIiRM2sKVwVDUksd2xnpBwR/Et/Ir5Ul45a6t25Ci3S58EQy4RhoXgjERKLyBUDO9rUPBrz2TrdW006tcJYemKDJyTpTvu/972knaVoCa9BRzE8pbQuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA5P287MB5202.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Sat, 18 Jul
 2026 20:38:52 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0223.013; Sat, 18 Jul 2026
 20:38:52 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	hansg@kernel.org
Cc: hpa@redhat.com,
	linux-media@vger.kernel.org,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform: int3472: discrete: Support multiple HIDs per GPIO map entry
Date: Sun, 19 Jul 2026 02:08:20 +0530
Message-Id: <20260718203821.17684-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::18) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|MA5P287MB5202:EE_
X-MS-Office365-Filtering-Correlation-Id: 144acdde-5050-4766-eb20-08dee50c9462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|10070799003|366016|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	34KsSo3WZeS/tDt/cIj+i/JfA/BuHMoiDo9W9cOhxP+nDOj0aXjxbiZYOEK/1LLGw2//4jiu/bNrElhCeUQiCgMdszTqEUaNeOR8hTW+Ha02xjWqW/NLTp9FoZKft75lUyc6QQXk6SVXbTBu8PRK6ZvdUfFPrspZCIkE88ZEZTF1XK/0+dzPMmgpFkYB+r8r9Y/7Jl2PJLbsubFVGYP564FnO/Vz51dc3WDTTGB4xH1SiOfTqrlt5bYr4vLXbBWVsQGhMid42Al9XMadFPykoWMOqbj1vZ6nct3D12cQwHWtwqArJA9BiDejPleU3v4ZnYPnVDXeue6Auga8lZbFhcMri4grIDAPX/o1Ga0lrbMEn0f5MEwbvEHss5Qo+sts5ZVJr+dkxRqjr7YUK4xgIeTc2q2aWgknhnwPO6WUUjKCq97Hu+JUGiYeoHpqfHjJHG7YKKr9tSysB1+t1PmoC6zRbgCkZTXmgogSsLSv6nhOqUS+KTv5KsiR2Ukdc8v/sRFPHN3+51CrcUyQrPnVJMRD56jD3dS+Uo6pScO5PZi5nIetZJX3mRPXuADbd5dmCcIR6CO1OsYyqClnY/6AqXn/JuNsjoLtCh6ZLk/8Z9aG2MbiN0xkWRlrpLcSb5nY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(10070799003)(366016)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wUw2fvTiC/B4IsVcqB5bg1duKRy729Vpthkz/PGSCESfJDNw7AOvAYMVHEWF?=
 =?us-ascii?Q?zYB63CT+IVArGJIwP9yECeB7W2ezNE5Yyn4DoY6GKHO+U3Pk8C146cdxv3QZ?=
 =?us-ascii?Q?PgYO5SZnHZJLqPvRPLqed/Hit27k3og9fdo0aNVrBf1H3EteOnqbVpYgR1st?=
 =?us-ascii?Q?HNZZg8vGCFpDYbw4j/19+8Ocd+Ln1n1mrV7MQavdWprPHibE3UP+6gZ4ybq1?=
 =?us-ascii?Q?YzsCAHf5vWgb5e7Myf/et3neKEkciig31sUkBjCU12fg+Yntuntyyw98ZNh3?=
 =?us-ascii?Q?DMoiIpblq3Fqpyk8SuKk21WXt58BumtIw7+RyxoQEhZmgCx88EK9uQk9y4Gh?=
 =?us-ascii?Q?FbCM5XNtAcLBe5Xycts9sTmo4XXhmpjyrP9/4G0NoqiS9pNdUGrSoUc0Ss0+?=
 =?us-ascii?Q?SylKUfpnOGo9QOO7n6fdMBxvs8khzrcwW2szLx11Hkgt+l+Ie0mKDq2iv80n?=
 =?us-ascii?Q?i5+Z8IUhx3w+7gmdvmF1ybXvvOK7DdstAfXqFcgCvJyzghPBEtBby9ich2Xe?=
 =?us-ascii?Q?+ezeXU2nrDfy7+8CJI3BIc69DWG8u/OM+nPBV+aco3XW03RSKu+IhJc6vYsf?=
 =?us-ascii?Q?niz7uzY9lgWu9KrQfKRdshhVqnv9C/BWswbCYFOvwT4nU8ZaJ0+79bpjE9Oj?=
 =?us-ascii?Q?SNWK7h6ahRNEWX3g+QbYvYgqKkqEEF2DOFL4YGtDnmE0k2J1s6I60ICkBgHO?=
 =?us-ascii?Q?yrzs6/ZX0dNYCnFj/sKWZRZCHN0+GTVVFk8IJ6UFddQdC/0EezZIcZ4Y8Ddo?=
 =?us-ascii?Q?TO9va9xN/ea18GRku/RYlTQouHxLLN+yyWaF85JGdJx56U2ksC58NG2EkZCj?=
 =?us-ascii?Q?/YeDtay4+WGJP6o1FPX770bYA0oC6BEjDcF5Ko+QZMLmx3448QRXbh3s21fW?=
 =?us-ascii?Q?BI6baoIsFmwwlsX7v05ip87h0ioDTW5S8zCqOwu15cWLXESnKLnvJFHAuJ1h?=
 =?us-ascii?Q?8YiE4an5eD/YGqovB9TENKUlAnDLRlgKP4NqOQX3qGznV3g1VG20wlEvbmBX?=
 =?us-ascii?Q?9cxLqWHoY9lZAsf0JGtMGN4LXMMYSBAArONbwfYJn9CdJhZV0Z1EsU0zEACS?=
 =?us-ascii?Q?zTH+Kk+ct59FvP65DtP5UNp42e+LnARGatXKKoMZBlwr7Uw2kLmDzqWyTc0k?=
 =?us-ascii?Q?BeAhbH+wDfoYjInsNbiFXMUmMRW2/VGcVnYeaD7/QVhS5dRonkII/5PX1bDd?=
 =?us-ascii?Q?rlfmmMqAjIm8znpDeQDGC6nPhED4M7NFZ26aHuTTGr+jru25C3eqRmVT53sb?=
 =?us-ascii?Q?imObkSfCQcnSJe565SaTWg1KX8cLjlkcERR70B6h0HEJqDWynN1p+jy364fF?=
 =?us-ascii?Q?TgNMcEMlXef6DNy/+c/vx47k02vWjbr3pBQVRyzUNJ4znQ8M97Xgs5bQrBPp?=
 =?us-ascii?Q?kEpVv1MTshZ7kkrPoU85zM8ypo5lHVbfUvvY7wqmm7lVroJVyS/n+GENs2Yg?=
 =?us-ascii?Q?3plw/4vDYQkorWLddZl+d2QS5WDCxfR2ESgdE6w63HFLIK10yOih50qibK2S?=
 =?us-ascii?Q?2pwuSBmsuNQgd7ASY6bs8irw2l5OWcIIrP3SGcOnM/kDNqAc7h6yO7IrmRfR?=
 =?us-ascii?Q?mBui3YCpVA7rwWjYe/GQvASY6LUASdLm+5QcBM1YdONSsBH7QFMuWDMz6jkC?=
 =?us-ascii?Q?HTFxP59vceq9p4cqWJ/zpp6iQdGtM4pGxS4JedU5RnVp/SdCJsP9um2S+HLX?=
 =?us-ascii?Q?wcPtdDxgyPVL9bxU6wDfX9IX80H/kou7E7EamOxEY1TdnlsMLiEkWER7oj78?=
 =?us-ascii?Q?F/sJNF3lFxrv7tX2pxQJMYivSzjghKH9BIB1kIahL5ZwXnEbg9dYNuoAH2OH?=
X-MS-Exchange-AntiSpam-MessageData-1: y+PGZSWK2sTwtagTKJwHH2qR9P8d4FZWhPE=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 144acdde-5050-4766-eb20-08dee50c9462
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 20:38:52.7098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ad3HEdcadgwDq4ek1p3V9A5D8OayPEI/5KatxqGNeHOficbhBTg5ecocJtxqDNpiZOtbl0VZYok3FIeM9xAMEHZ2UhS6IBgA9MrTM55h/p4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB5202

Each int3472_gpio_map entry currently maps exactly one ACPI HID to a
GPIO quirk. As more sensors needing the same quirk are identified, this
means adding a full duplicate table entry per HID, differing only in
the HID string, which does not scale.

Change int3472_gpio_map::hid to a NULL-terminated hids array so a
single entry can match any number of ACPI HIDs, letting new HIDs be
added to the relevant array instead of duplicating quirk entries.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Tested-by: Kate Hsuan <hpa@redhat.com>
---
change log:

v1 -> v2:

- Add per-HID comments to power_enable_hids_vana[] (Lenovo X9-14/X9-15
  for SONY471A, Lenovo X1 Carbon G14 for TBE20A0)
- Convert INT33F0 (mt9m114), INT347E (ov7251) entries to use named
  power_enable_hids_*[] arrays instead of anonymous compound literals,
  for style consistency
- Did not convert OVTI08F4 (ov08x40) to a named array, and did not add
  a NULL guard in int3472_gpio_map_hids_match(): not fully convinced
  these changes are needed yet, but open to further discussion on both

Identified while reviewing Kate Hsuan's imx471 vana con_id patch, whose
two near-identical SONY471A/TBE20A0 entries are collapsed here into
one, backed by a new power_enable_hids_vana[] array.

This patch is on top of kate's imx471 driver series[1].

Link: https://lore.kernel.org/linux-media/20260629074026.35490-1-hpa@redhat.com/T/#t [1].
---
 drivers/platform/x86/intel/int3472/discrete.c | 63 +++++++++++++------
 1 file changed, 44 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index adff564bf3fd..f70bd661592d 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -123,10 +123,35 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
 	return desc;
 }

+/*
+ * Other vana-supply users (e.g. ST, Toshiba, Sony sensors) can be added to
+ * this array instead of adding new quirk table entries.
+ */
+static const char * const power_enable_hids_vana[] = {
+	/* Lenovo X9-14 and X9-15 */
+	"SONY471A",
+	/* Lenovo X1 Carbon G14 */
+	"TBE20A0",
+	NULL
+};
+
+static const char * const power_enable_hids_vdd[] = {
+	/* mt9m114 */
+	"INT33F0",
+	NULL
+};
+
+static const char * const power_enable_hids_enable[] = {
+	/* ov7251 */
+	"INT347E",
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
@@ -135,7 +160,7 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
  * GPIO_ACTIVE_HIGH otherwise
  */
 struct int3472_gpio_map {
-	const char *hid;
+	const char * const *hids;
 	u8 type_from;
 	u8 type_to;
 	bool polarity_low;
@@ -145,38 +170,27 @@ struct int3472_gpio_map {

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
@@ -184,6 +198,17 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
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
@@ -200,7 +225,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		if (*type != int3472_gpio_map[i].type_from)
 			continue;

-		if (!acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
+		if (!int3472_gpio_map_hids_match(adev, int3472_gpio_map[i].hids))
 			continue;

 		dev_dbg(int3472->dev, "mapping type 0x%02x pin to 0x%02x %s\n",
--
2.34.1

