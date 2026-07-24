Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021135.outbound.protection.outlook.com [40.107.57.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB06A38A72F;
	Fri, 24 Jul 2026 10:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784890420; cv=fail; b=dBavT9/D1MUg+flMeQIDN+0f7ZfMhZKZr+cHl0s+2OjxYIDJGQxCpfQkFxxDQzVyhtAUZ1zts2SAzgMRdSXXXoqkbzkk/TfnMrJC06vI17mirOtfiSgqTsDmwePSG2RDIRUi3mnI7Eq1zEUaiLMHXwonxx4Bg2xXcdu5chJGzW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784890420; c=relaxed/simple;
	bh=PcR07A7IBKIBuqOIyvQB22OHr3IeO2W/eNloOHLLmbs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ba/Ztg/A8cdor8STC4SDsQbTEgMdrHjjo+DDJIIQDeZwv0uZmNygWa0Stzt4nuN4ClAKfEVt73QH/grfuOu7vhrGlcj4OSI6G/4RuKIpGRFV1AOhACRhroUIuIhEtz/y5+GD0VDYsNA18JaLlma8XH2dOxBFZQi/SrtMY7vhExQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=KOJqlie7 reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="KOJqlie7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nS2V0qZce5/21v+r6ftQSM8FrQeYEW+5NvggKqmYXdCqAs2se9WeFI8xew7FzFwX+pFAq00nhk5fY7fzkkCEz5V5qxPNZSfbpzsOMyPB5NK6fWHjmNFyzi6Feo2lE6/9T2zwFtKKpeLBf9lV5T6jT5+WQ6ZdDa/Jmmo+TPCkmi0KwRc9kit+WbHNye09XpQED9r2KlRkC9H4iZWy9uhc14irDNdQytKOyuXl/yDL2anz/+fMg3PNcDPfXcguhkeqda8wCeMMaP54UpgdnmU/f1iHUsNlQTFgHtUrCqXgwCdOAEJxJVkBA7PEtdunPPW/FiVwOYy+JubzurmJVLtqQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=374uXpjUSSjRzP0+pCTD7FJb/iIbBzBNItmJpAwi8I4=;
 b=bL5CO0Tx9KXf9pv0bJkAoA3jfsoINtwfYRjIIZYAyux6Q5T7A7OUvIxmVC8/Rd3n86foUHZTZB1McyOrx0W9HwA2MggF2knvhGHRJmD08enVOkPA2VfBE1sLfXooXoXx60DM/BwIt1NCup0RQIHw6XqdCF+LEbcp9E/lYhVKv8V0oKcdXLN1U6KxMNcLffwcPkKlfS9Y1QEpc/ebcFbgll/qZL1BXKqZT+Zi6+QqvzLPclSHTgWBo1Ogb6LORMMbZc+efPQ8S+T/rOCyy1xeHjUWgrP3yvr0uNU4g2kSmdMOc4AhoxeplGo+V6KZyOlNg7FvedzDFX5uvuX6Q1SMxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=374uXpjUSSjRzP0+pCTD7FJb/iIbBzBNItmJpAwi8I4=;
 b=KOJqlie7F3gB1KgpODxPWj7JJooaiIrM0X0PpmNQscewkz8+s5aEAxulEVE1sbH/AriXPBaqHJVdwH26kbm7xANUFwAgQLjpCerKPksc4iU+2gRcAl34V9A70AuLQTRkp6SI1/tKN55KSpbZC+g7LhvWopb63wEBt22Xk6qVcQOVHYrLVoxoV5MfNQCqy6ketOeNjwkhF+FCLSfCQDpn1D0XvC5FOILyQPTnwSP/RHtWMbdp12UucpT505pTmxArimwVBAGO9/39a9cnMsx+L+1yUg7KnTYCgxmGAdxMUnhzwMrS5hbKqPNyA/uxbFumnWqv5IYF/U89C4ixa5xcpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB0162.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 10:53:33 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 10:53:33 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	johannes.goede@oss.qualcomm.com
Cc: hpa@redhat.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] platform: int3472: discrete: Support multiple HIDs per GPIO map entry
Date: Fri, 24 Jul 2026 16:23:13 +0530
Message-Id: <20260724105314.10621-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5P287CA0033.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:263::12) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN3P287MB0162:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c2e5280-05ca-4a00-4eb3-08dee971ce39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|10070799003|1800799024|23010399003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Po9kS8ceSzHGGI0Q9Thk/1aDUkq3RY97MGAmS+vU7z2DCH51ZRXtI4RKmpZOk9DbjiyMpL8kdkVRkwAHzSppK9iT5xi04mzjxJ5afdyHFW6+ubGzT4DpnTj7xKFavl+dStUG7W5pE3t3O4aBAMw1OZkJJFpLn6I7u3JyhzZG0xFesErpIFLBf+Su4BLT/9vTGrIjEFS8qF9J/0RKlgyAbyT4VHU7XEgxvO3D2pEr3yJoDKJILhB5IOP+5zakItxhsF9qBTX7pNuhzWfqn0wU3QlkLOQXAHJYsLUvvWA9jn+RhqPTI4bfG/oSPmpvaNODyF5S09qKLz3kByDF3T3i9efvc3xJZLgbTLOgxfWjP+cicWjIAdFqVTlZJVwtTWnfN2W+4XkOd5tOti6sI/LczNkm+gktOH+99D105G8SnGRwcLj/Gjyc/N/VPmnC0I3AgOW3gWuU1TtXbrLX19GV7+fnZxHKO4X+Py/v3pSfCN5VWGBQM39orXx+iXkxW+tMK0IUi2dg7YPb0Xlk/GHhYanzwFnUjBgrY38hhkAV1ZMlV/G+HJdz8TaG72+aUD1GNS2Hb2HwSgv05RJhoTTDpw0X516iv4m2JA3jNPI6eunUV5JZAukIFvw1vIo27nj3M+iVJl8+8HwpUACKQqfX0nHOMCoViqchJbp1lnR0CDs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(10070799003)(1800799024)(23010399003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SPC0hAGOGzIZdKLxVhw14pY4IkrBOG4zOiXS5iPD9z9XozHxO8NYvfQ4rb8m?=
 =?us-ascii?Q?wrXjgc623I3AnxtSwIf8kBYDyWp7i3kxlPs6PWwfCpjBDkuqjmJ0lUmwlRwJ?=
 =?us-ascii?Q?2jiow5fYC9YWNZyc0v7moyleo8r3ZXCGuCSGHXFbt78FLLucHKkGDNFqV6R/?=
 =?us-ascii?Q?8PZSrGBiRx5NzWWJgnc5hbeMh1LjkEM2tMo3KLTJ/t93sgbYLKt6U3BmydG4?=
 =?us-ascii?Q?kv3KTq+ZhoSakbp3Qe9UOYu7BOwOoMJ9COB3i+eCJwdxkVX/4GZW++4kYpim?=
 =?us-ascii?Q?IlV1G77rLcCYOz7pTD87vkb7hg2s1G6LBJ7IegqdEOM5kAAHPDw5PR9xQ+uS?=
 =?us-ascii?Q?erpaT3RgXftP/dWjaBLo7W9k6LSUJjufbImi45qaCX+zlAYE01izYz1ZQDgx?=
 =?us-ascii?Q?Slo34TMkZZzvmsrmTGMGHMOQuyVK7LRYkg3a2wQ80e5P7CANyACJtQCRpMR+?=
 =?us-ascii?Q?baYjUO/dAvBjrkHiThfxFQYbsPgCfKyamL5mlNUHrxCivh+8U8+lmZI+eBXk?=
 =?us-ascii?Q?BvsirwwkIt0ib0sDAMSo+eX2wT4NO/cPbCgD2EBRRj29RAOxP4e4xeQlHmHM?=
 =?us-ascii?Q?nTbppSPFK4kGmiPM2jPuhZRn9ePM04xvvyLZOBPZTVgHM18wXz8odLW3xUqn?=
 =?us-ascii?Q?UUDlhPKU6DEMn/VFUcPwsgsEbhTsZ1rtLh6A2EqwfYur26ynGmIvLyr/JvQe?=
 =?us-ascii?Q?gTHxsxoIR+Fq807mGaoXqvZ039FJW8SLjEhzjvhenQKZuZOVqg1YrcFnW6DZ?=
 =?us-ascii?Q?j9U+mYTT6TmST+Ueg0gtRdHK9a1/G5BLtz9xHNqm7Unf1auZlPo5k9QopPHD?=
 =?us-ascii?Q?qVqONu8rf3XXPNJLLpqlaU0u5cnusdosPVrOl2mHV5MJLWZVGA9u5swwquKX?=
 =?us-ascii?Q?bSRB/iyd6qVAaEc/jD68b9n/nUPEmEXhxXol+D8DfasLvR6Qt9XFgRinK6K2?=
 =?us-ascii?Q?SuP0/Ow8iibeFqXk8NNwGHA9zWllpIzZJ+jQl0+Cw4dNnbNuDcTqzZfNqEwv?=
 =?us-ascii?Q?KTfPuQs5ftTCKORh0rpupYT3Ts7C0NZTarJzEgMj8cqFDJrDhVUgt2ySwR3W?=
 =?us-ascii?Q?dIp5TzIs95EahlLo6Kz4yfd8lvjuPNk88MDlwVXdLMlc5i7hOgdL7CJoSkaI?=
 =?us-ascii?Q?GelMx9wylyeMx2sPSDFwFCTAQKC+kNna+6ZyUdYg4i3nFgvclBXpPZvYnEBt?=
 =?us-ascii?Q?tnIea99Ass89RLJ6WlUaNw/JrSzL9WiIpyN1qaBraY+FqWbUxXPI0Bd9vfZs?=
 =?us-ascii?Q?sEfH/D8ACfZeNcu5YLL6Rf+Aww4vsA7xIX46lYpKt/Vf6u8uSBlfIA7BI7w8?=
 =?us-ascii?Q?3fOsWByQdHDQgET6HT1iCW0FTWivj7CYfvTQHg8UijYfPjNBw/5+99H4vIMl?=
 =?us-ascii?Q?BXf470sxefdrayY6V8kRmHph/TkWoWA2hasOyVQ8CoOPGaEL/G8NMG5ZKh++?=
 =?us-ascii?Q?ogCI6PnGPjkt1+Is6aTrAxD+OXHhHgNRu3Eg1ruLeZf85xX4iwBRwKGy4SmF?=
 =?us-ascii?Q?nWugY69WDQnoNpEuMfofmClA67P/Tr/SEw5qDSZ2d1hv5eGpaN4spNJ/0yUd?=
 =?us-ascii?Q?59yOPCKuhjEix33RdhC/q/crdXTasRndTUIwWC5ewPGANnXOror8px0XoeTT?=
 =?us-ascii?Q?76BVCs8uCTfqbbhRnLdhJ0vnXJ+UDNLaOOWjLyAhCmA1qStnNx5vebFxNXby?=
 =?us-ascii?Q?v15YMwbgyFJy7xjymEbwUEOdpbsweLlXPbG8UZEJq/DTQ9YOMp7PnXNDyh0O?=
 =?us-ascii?Q?B7YWS0C7wjJ3a81YiIJKfq84wD14m/iCbd4mfLq6l+s5iIVouzHrdnbv6mt+?=
X-MS-Exchange-AntiSpam-MessageData-1: AvVB1wQ4jOeKsP2EWYc6ElzYTWj1u6lz+N8=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c2e5280-05ca-4a00-4eb3-08dee971ce39
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:53:33.4989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZR2wOLR7jbZbcBP/wE08Vs66ToL5BXRic+KiI9VzxGqVj44vwAADNNy5RX2gVgV6VJBPJqsqyBdesntD1tDOqPdluuYfs6bwCXbWa2g40vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0162

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

