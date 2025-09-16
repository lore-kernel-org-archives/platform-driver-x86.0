Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012044.outbound.protection.outlook.com [40.107.209.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA77223DF6
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 05:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758001688; cv=fail; b=Z+a5gMxE/4xNuFcH+ohywa4vghDIkQg0fTCIFSV4ApPSq09A9alU9mvIncJ0bCPrNcd72Y08ZDS4XTMlb9TiRR0O5YUthe873n49Y4kAk3jr8fes17lazAD7+qeKKzEI3daR6tZBrPGPwQKWaNl07VlU7VRlEdsgpStCQN1GNS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758001688; c=relaxed/simple;
	bh=pNJjXjsIxsXNzOMAtvNPGZXiS+cr6/hOWCJEzX8retY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OcaLB1Kxk0fLwsLNIhqgTiIYlRI1Nyt2FHsBUy6tyefCkzPVIUSvVIGUNyhiUuRuuEh3JIlYwUARwHCIF0R9X/8+nWrhijp2VPLeMXylvdNg6XbgicE5tPWvcc90yv0zntjy7c+mBKhjWOuI69kseCWdSuNs4FeUC4l0bV/zDDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gDoyopkF; arc=fail smtp.client-ip=40.107.209.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gDoyopkF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFxZPq9mtdvjzYaGv2Vec6cwFuuVMheZwpo/VekSF1bGfyYpjt1O+IHJJ/Pgc+BuFfby6N7+R0olYO+TKz4zqydN/Vy09Hgt9liWC3NuBawzXBKOge32Mvqrm7K3A/9kT2XhMwAicC5EZwZdAhGs8zRfLMUd6GF5uATo99zb9ZYIx0z1D1Mg1RVMimDJVCtYGfiD3T5ZwkjM0noVrxaSFnvDi3Rbz3Q6xwS5IplTfTjdlg/1wmlGMBzQWQeiJZNEPHSYhShTw9ULy4BqU6M1TasQpQdDTD6n8VzpVao1cvnqmGnxqQJcIeGgQEWzUKvD4IkoQLNphSWR7sRCxme8Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMbO92QJBDAzxV6X2gjkoMB0qZj5UmFAukRDtlIvSBI=;
 b=gTbPlh5kCoGco+YOIeV5RV7YPrUF5ore/0CEQGFfc9Z7dd4jzYBrAC9u40H5iQrME9yvkQsY61UNQJ7LzFDqA79IgU/Atff5776ShfjrYL7vIuRaaROgS9SlbyAai1qFplb3zDm+EK1siBoKjMbVu9xDEKtWtBU72GAm2s6AmjY0gN5jU+KVQhg46gyFDsne0vlwj+UKD8YPb8lvlryJs4pPbRJiSP9rpJXpY6KgSoD73IzSsAZRtTLMobaOFLVGAxtr+tDRu1Ar49epKAJPnhnGQX10Y1Rf2TGvdCn9IKNQR3GeHm2czY7R+e6VVOQEkwvajsT7PTwBW5+MwS622w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMbO92QJBDAzxV6X2gjkoMB0qZj5UmFAukRDtlIvSBI=;
 b=gDoyopkFmi01zomcFx7iYBac8clROxfGKAL++8djptk0gzhWcdH1lUuQdYZD51uMk6OoGOQDmiN9rco0LDcJB8ATkoJC27prJXxTt6loggeif3lqDXpr7waWi7fdMWad1Lme7zhBkIs0bI2b1VtoG3LxISlMP7Uoa7J6TPsLiTe8d+BKZTRuyfR72DaTMeVmK6szulwZMVgKPhBqDL+HCYgT16fnUjYradXOCF4jwLTDoFJEUMh+LmKD1Nzb+yAwPvIQZZm024SmLm3yORfN8OcUnFmWRsB8CZKbD6SEw8ptS8MqCZr2CSnn7OGW6h9sgKqEuaWXvMxVgO4ChfRe1Q==
Received: from MW4PR04CA0059.namprd04.prod.outlook.com (2603:10b6:303:6a::34)
 by SJ0PR12MB6926.namprd12.prod.outlook.com (2603:10b6:a03:485::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Tue, 16 Sep
 2025 05:48:02 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:303:6a:cafe::83) by MW4PR04CA0059.outlook.office365.com
 (2603:10b6:303:6a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.22 via Frontend Transport; Tue,
 16 Sep 2025 05:48:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 05:48:02 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 15 Sep
 2025 22:47:43 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 15 Sep
 2025 22:47:43 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 15 Sep 2025 22:47:41 -0700
From: Ciju Rajan K <crajank@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <christophe.jaillet@wanadoo.fr>, <platform-driver-x86@vger.kernel.org>,
	<vadimp@nvidia.com>, Ciju Rajan K <crajank@nvidia.com>
Subject: [PATCH platform-next 2/2] platform/mellanox: mlxreg-hotplug: Add support for handling interrupt storm
Date: Tue, 16 Sep 2025 08:47:31 +0300
Message-ID: <20250916054731.1412031-3-crajank@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250916054731.1412031-1-crajank@nvidia.com>
References: <20250916054731.1412031-1-crajank@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|SJ0PR12MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: 6442f455-2367-49ca-4764-08ddf4e49984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZbKZYJpwkbp0UUo7J650a8l+GtnqHCqm8zEvSIvQMrsPYFB6TFZ/WgWF8wgN?=
 =?us-ascii?Q?SAk0rXKfGoOVEPVVTaTLAkRr2TkfBuhe3oEHBzchdIWPWG2wsd5slH7kvqSn?=
 =?us-ascii?Q?S89oYdoYHDYYZZJDfkVtRu7eOmGCczRk3Q8l5hcPSs0EGRT5Ee35ElE0Fq0C?=
 =?us-ascii?Q?ewAFTY9KWQPgH3ZSVgMmt9+NRo9+uDpKVmXhQlPIoStBMwV+ZdxvkSNMBqct?=
 =?us-ascii?Q?H+y4XOh4RKhkakhDEkNpcea08p5IFwY8yd8qTe5vqlx/VZN9JvKCC+UPS2oc?=
 =?us-ascii?Q?2jZgAtA0MZU/owyxinBOC30+wjCZqCNYKUPrrfQOwCzDiFYKWAOrvXnV/DCk?=
 =?us-ascii?Q?3DMCqSswiBJGJvlueKeCb/74gKxnpeRXxWju/nVw7ggCNIipj6GIsnrLdacB?=
 =?us-ascii?Q?jeGhDtOeQ8ZQ4+G+fXWY35ERWyD79bUsSNDutksG8G02WPrJl54R9J/6WK4+?=
 =?us-ascii?Q?mksTfVTwWcDQRGegA2p2igCWxW6TlQv3VJCmmKiVyY/yeiNJMHa6Huw8B+Y2?=
 =?us-ascii?Q?966scRl9bDvDpIjcwNJwGcBRum68Koi+HJYKYFVXT+Ljvq8qsfc3FyRDKEER?=
 =?us-ascii?Q?obbW+eYuo3yqnWLV5iMr86R3xnGOK9IHC60p4ytzYU2vhZD7l4iyQRg2x/ao?=
 =?us-ascii?Q?V2jxBBGq5CLvv5UHkY9sbDqcUcfvlZMEu92IQCrIZcaFBKUzx3SJ9lJh9L0L?=
 =?us-ascii?Q?x1A5124ad5c/yaeNhR0SqkurVfALvzRq1+Guau0sY+ZnBW5pFohFkKbuXers?=
 =?us-ascii?Q?Eh+ARmLltRrMpnbn3zoNUM6+a2LitDmiGzdhPQe0687bUhhwYx0mGUn3xrZI?=
 =?us-ascii?Q?NrSm4Fk4AO+57C8n4c66Mk/Z6UnrC2bBKnWWhaqTMkEOQO5mQrbrBMuDnMxO?=
 =?us-ascii?Q?tm2TI6hE2yMk0+0Q+LjGzsN1V22Y+rU92yl9f93LeZMGhYcHR3LgXZvMWQrr?=
 =?us-ascii?Q?M0PLhA34EX02PZhm9QcbbkV9blxlb4SBf7+9MvN1dKYH0muZcz51KjsuOqxC?=
 =?us-ascii?Q?HSS1JtEeYZGpPHx+8caBgO8mZxEa9hwx2B31opVB4zJyCNm7QnCt62VRbi7o?=
 =?us-ascii?Q?vPv7CneRj2VAfRJ0w18NJo+M4y0+vx/hMo41QtlIiPeszZOiD6Ia1q3hw7XA?=
 =?us-ascii?Q?qp6u1C9ylAWIUYC4XE8WyiIjs9i3RBF4+EUPvakFxb07NC5z8kFSJo/09LF8?=
 =?us-ascii?Q?vCafuhmGSvsGGjEKjiLvHHD4JJMvW7mIZnQ1/DisB0Le2vg8jYua2hdYtaHq?=
 =?us-ascii?Q?BqqzkIZCEox448WaO9ahf9/Kt5+ad6yh/TKZsYLylyeMs89NMIf7Gixa3vli?=
 =?us-ascii?Q?cO87rcKWTpLzxom9MCpIU0SkGRb/7sFomD/4VeYJhfwIadT52Hl3dX8cDbhJ?=
 =?us-ascii?Q?xsZcWveoHiwvqB22WLgBAc+5EK+S8FlEbidjpH5mZmeR1ng74TLe4K4FXsRe?=
 =?us-ascii?Q?AtfyIsdZ7UiH9ReNJN+Y/Kzw8vE3y3qS9xWda9Gu6uuQqbcXUJYcoHG3aU53?=
 =?us-ascii?Q?4gJ2iPvUV8xTQWL0t1fSfRn67g2hi8/u5nTn?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 05:48:02.0284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6442f455-2367-49ca-4764-08ddf4e49984
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6926

In case of broken hardware, it is possible that broken device will
flood interrupt handler with false events. For example, if fan or
power supply has damaged presence pin, it will cause permanent
generation of plugged in / plugged out events. As a result, interrupt
handler will consume a lot of CPU resources and will keep raising
"UDEV" events to the user space.

This patch provides a mechanism to detect device causing interrupt
flooding and mask interrupt for this specific device, to isolate
from interrupt handling flow. Use the following criteria: if the
specific interrupt was generated 'N' times during 'T' seconds,
such device is to be considered as broken and will be closed for
getting interrupts. User will be notified through the log error
and will be instructed to replace broken device.

Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
Signed-off-by: Ciju Rajan K <crajank@nvidia.com>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 35 ++++++++++++++++++++--
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index d246772aafd6..97b84c584d5e 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -11,6 +11,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
+#include <linux/jiffies.h>
 #include <linux/module.h>
 #include <linux/platform_data/mlxreg.h>
 #include <linux/platform_device.h>
@@ -30,6 +31,11 @@
 #define MLXREG_HOTPLUG_ATTRS_MAX	128
 #define MLXREG_HOTPLUG_NOT_ASSERT	3
 
+/* Interrupt storm definitions */
+#define MLXREG_HOTPLUG_WM_COUNTER 100
+/* Time window in milliseconds */
+#define MLXREG_HOTPLUG_WM_WINDOW 3000
+
 /**
  * struct mlxreg_hotplug_priv_data - platform private data:
  * @irq: platform device interrupt number;
@@ -344,7 +350,7 @@ mlxreg_hotplug_work_helper(struct mlxreg_hotplug_priv_data *priv,
 			   struct mlxreg_core_item *item)
 {
 	struct mlxreg_core_data *data;
-	unsigned long asserted;
+	unsigned long asserted, wmark_low_ts_window;
 	u32 regval, bit;
 	int ret;
 
@@ -366,11 +372,34 @@ mlxreg_hotplug_work_helper(struct mlxreg_hotplug_priv_data *priv,
 	for_each_set_bit(bit, &asserted, 8) {
 		int pos;
 
+		/* Skip already marked storming bit. */
+		if (item->storming_bits & BIT(bit))
+			continue;
+
 		pos = mlxreg_hotplug_item_label_index_get(item->mask, bit);
 		if (pos < 0)
 			goto out;
 
 		data = item->data + pos;
+
+		/* Interrupt storm handling logic. */
+		if (data->wmark_low_cntr == 0)
+			data->wmark_low_ts = jiffies;
+
+		if (data->wmark_low_cntr == MLXREG_HOTPLUG_WM_COUNTER - 1) {
+			data->wmark_high_ts = jiffies;
+			wmark_low_ts_window = data->wmark_low_ts +
+					      msecs_to_jiffies(MLXREG_HOTPLUG_WM_WINDOW);
+			if (time_after(data->wmark_high_ts, wmark_low_ts_window)) {
+				dev_err(priv->dev, "Storming bit %d (label: %s) - interrupt masked permanently. Replace broken HW.",
+					bit, data->label);
+				/* Mark bit as storming. */
+				item->storming_bits |= BIT(bit);
+			} else {
+				data->wmark_low_cntr = 0;
+			}
+		}
+		data->wmark_low_cntr++;
 		if (regval & BIT(bit)) {
 			if (item->inversed)
 				mlxreg_hotplug_device_destroy(priv, data, item->kind);
@@ -390,9 +419,9 @@ mlxreg_hotplug_work_helper(struct mlxreg_hotplug_priv_data *priv,
 	if (ret)
 		goto out;
 
-	/* Unmask event. */
+	/* Unmask event, exclude storming bits. */
 	ret = regmap_write(priv->regmap, item->reg + MLXREG_HOTPLUG_MASK_OFF,
-			   item->mask);
+			   item->mask & ~item->storming_bits);
 
  out:
 	if (ret)
-- 
2.47.2

