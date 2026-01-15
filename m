Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012037.outbound.protection.outlook.com [40.107.209.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BE132C92E;
	Thu, 15 Jan 2026 07:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768463377; cv=fail; b=lU2LRHUAJIwoSy9mte63nl+ip7nAxNUsZEgXXahcmXX9a4s57U73jCps9OvzIIHiDyprcHKSYyBYzjlXreNNy2W8IibjkEtw4vbKqhyKVBSP6F6nljjL4yqUg07gNToQ9t+eyj8xnH/GCFIkkS/QiKDWt85xpgNQX8AAk/E32Lk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768463377; c=relaxed/simple;
	bh=JX3qAtQoUieq5opq25eT4gJFQYmyFjAWFyC3wnNvKKA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j7b9LkKsNw8wcPD6Kz84YU8LCCKIA7C6jLhrp/VLokCMtpec3RRt6Sc5au1pvOL7dHI2CEr8ZvwYiVMrP/mUIKjuVwWNU8GkahLq564YVyG+XvERzBSavFwdN0R2+JKdkeWNDeScFu3VnD1rLLU+pI9ZmV8nERSxSFXsFlrh3JM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jBtr+eOO; arc=fail smtp.client-ip=40.107.209.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jBtr+eOO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFXgIK3VEZeuJ24uPqB/vn5KmmKIPhUHodb5EKoiz9bHmpsciQcPrGG/BudnmtxWV3gafIRL8s45oO2lZ1h37vvJD9IAsMAIzr7ZeCBtX3LMerowKNvDv16fi2V2uLzwUS4Ju8UZDNSh41myWbO2eXtijwbSenJcqt9a8d7ko/y8XzAxeA39awOi+3htbPYmsVv97+LEq5JIPm/Jxdw9OSm38uxWDRsGYJsqYQfG4s9kCfw9OrwhOnq+XVJNzXa0zhDe3ldmtpB51TZM46pbOk9yr9NNJXYD7AnA+/ipDipbVFiJz6H+rxEFtmF2hObSoph6Mocp2mevq15j+pRFkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMeHGqEsRhGxXhIsyMYMsaGb/ujDmlXDL6pEKvcEgtw=;
 b=XZgeU5gLKMcO+fX749p0MEYM/OoSsdKDxj8bH5zzTqfW5bW++Jjh7u2TgDJSPVz4doOGLCUsXwSRqvi8qS1TDJZnC1Nd8OOxaluO+2S00v1eljgFToUxhwByk19Oh7/MadCi+8AAyb4lHZ+1gK1aUhftce/Skvm+rxzqdjOR7ksmWnPVEWW1BJDF3t63VeZreqmKkZ1kfi2t4a9poWj4TtxrOJBGyzD9gVgjjdHTJma224aBPqtt5ZU21EGMGC+w0bipyD2o39c075M58ywgboSs2HJoglrGJajzKumiiUOIqi22h7JAslcFOitlWLIDYoyL2jQ9kbsOjhLJQzfQ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMeHGqEsRhGxXhIsyMYMsaGb/ujDmlXDL6pEKvcEgtw=;
 b=jBtr+eOOeixjYwpjafSnO3508n77EFViELLszdmWR8gtlUeW3sxU6noy1QlSaYWVdhpzTFAnQiv0gAtCLVSlOdNQhLO390IF8wbrJb1+NBNcIn8jWU5sGz/Tgj0i7GmYfF3WjhMvf8XZ93Cjb/cZKuTWvaRssZY9Rh5pomNXhJ0VDs/XsJqJBVBWWG1FTO2le1pLTRFRIBsc+95eQtsTPR9ZybQr3z/HN6hAAxRagWtc4sRcQNJxa/Ts1/mK+rH1BKohdpwroKy35G8RvKMgIzyniFIR68FhKHJJa7ODuMad6Uq7CQhbqjIffSLe1LmYt0kFeyFccMqIuSyp0m0tDw==
Received: from BY3PR05CA0057.namprd05.prod.outlook.com (2603:10b6:a03:39b::32)
 by LV2PR12MB5941.namprd12.prod.outlook.com (2603:10b6:408:172::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 07:49:26 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::d9) by BY3PR05CA0057.outlook.office365.com
 (2603:10b6:a03:39b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Thu,
 15 Jan 2026 07:49:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 15 Jan 2026 07:49:25 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 23:49:20 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 14 Jan 2026 23:49:19 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 14 Jan 2026 23:49:17 -0800
From: Ciju Rajan K <crajank@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<tglx@linutronix.de>
CC: <christophe.jaillet@wanadoo.fr>, <andriy.shevchenko@linux.intel.com>,
	<vadimp@nvidia.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Ciju Rajan K <crajank@nvidia.com>
Subject: [PATCH platform-next v4 2/2] platform/mellanox: mlxreg-hotplug: Enabling interrupt storm detection
Date: Thu, 15 Jan 2026 09:49:09 +0200
Message-ID: <20260115074909.245852-3-crajank@nvidia.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260115074909.245852-1-crajank@nvidia.com>
References: <20260115074909.245852-1-crajank@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|LV2PR12MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: 689069e3-2fa3-4cbe-728f-08de540a9aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YZ4gJK7woLfgkcXhzdhGleHLKWgg/VZj5wZcmIJS3OLh8z9daaArMB3mO6gd?=
 =?us-ascii?Q?wYZNcEXSWa7dWCF9aTwPCpORECgZFOpfhg2niN9r/VzOBYvBwQqiwf/+Z7Lw?=
 =?us-ascii?Q?2c0RtKfrnIZ8kDaal9pW4Wg4PDje58somwSsFE9rCf0b3hjk1Q45WT6VOQPB?=
 =?us-ascii?Q?EOQFQOj2MHLQtothHVqsxVt845qYd7mkkLPH/8Pk4swB/2PiMWdyfvUsoBHS?=
 =?us-ascii?Q?CcSKA2a/RTSK5XfBw/VjSOU9kA/zqOpQtzh6o9R0uHCRAjz39wtcI7x9ESpr?=
 =?us-ascii?Q?nWHa2FL54QdDa9nYDn+MgJLPtrvrLS8en3pwFTEicf3S6AixHUj9exBaEsjT?=
 =?us-ascii?Q?T/GEYqf+NPQ/Rmti0raiCI+G48bHRPVVuVKGhnK6BXTA3q3ZYr8adqKDyyaF?=
 =?us-ascii?Q?xgRhpgchqRq6hw8vC+NEq5DMeSIbPWvo93j9vUH27zVPvdJ8h1C7kolr3V+A?=
 =?us-ascii?Q?wyWHgg2rmljLUIBd7U0cInIQ6JBc7+KTr1NzsDMpuaMA2PGDV+Xp8AAE6KZH?=
 =?us-ascii?Q?RanFu9XumjE8oZjR/JcKKZ+eHNQ0MIo5ZErMIU5XNyGsRKtYpHcA3TcNhi4+?=
 =?us-ascii?Q?lBlUDDhdVGVbEh5l4l2ay0JIb/cDdiOTcsitF2RNZ3mWFPU9iKhaR5sadEZ4?=
 =?us-ascii?Q?oWG+Mmfki7jB1/gVw1Nj9NeoOQg5FNieXAFPYtjDYFIeTbEjuZcRfSnLZQgN?=
 =?us-ascii?Q?mexyNQnkUEq1Mi+MBRZuBnAZngRjOrhrx0CPiC+WJ0TRHvOUzrIv/uV01UuQ?=
 =?us-ascii?Q?L8aA6EQ7iKYRSQxSSMybJzwCpj2YztxjuTHOA7UvNjheHeP2Xqrhri01leQj?=
 =?us-ascii?Q?HIicbNa3tAihJkgXYUIhMQ/SI5qVqUsNIuHW7cSjCtJD7NpHBgW40LHFGqmh?=
 =?us-ascii?Q?DpEadfqS2V7IdjFY2v8DhtrUxPZ7IPfrmQU7r7d/BBTFMj8cvhqnUv+fKqGs?=
 =?us-ascii?Q?Rvo0bwnRCtNEnYqeU6fO+ptMBJiXqfH/nmFshLVgPXzlK5Y3P5By32Cku1/8?=
 =?us-ascii?Q?m0SNgJX3JfG7yGo55YRUxfcJvAdHiWiZOE4oARJ1Pnarn6SfPldiCHyxkKLt?=
 =?us-ascii?Q?mfeH/vvF4JN5zhrjV0FHKtGvTbTgGEwgiAVz/BBBSKyE7BWYceDV5ggXzJRn?=
 =?us-ascii?Q?J9vkAblMQTsr9TKa+RFIV4lOIS9TJWtzGhsHPZzGS5KRbblavKSUpgI2wUjT?=
 =?us-ascii?Q?7wAryKCZ1GYAyzcpAAsprna/VI/Cq2RNtVttlyfechcaXWB7WUVJb7HDPBqf?=
 =?us-ascii?Q?fbzYyccmt8NJ9n9z3EwrhbZ21+7y9nQxJnlNCs+QH0DK62ARjspPchYUGz85?=
 =?us-ascii?Q?kR7IwioHEiGhn6zi3U4DbHxg9/g/MUjxsXZSywBxMyDKqsdGfBLhjYh8gy/A?=
 =?us-ascii?Q?7WsQP8iTmIFd3d5yYrFSUH4h+WTS5uUuTRHpCGUV6H0531qdclOX7HL5rCF6?=
 =?us-ascii?Q?++Rb24Jqy8yJ4LIhW0bGgAIrZE7qnl3Hf0gs/wAeeECtGGrS0KlIp8xj72HB?=
 =?us-ascii?Q?woE3nry2QP0fi7Cm9ea5OpzrLO3JT5dDcCFQ4JkX5gCozPjFTBBLZ28SNL5k?=
 =?us-ascii?Q?IK4t8l4tBH/uFq3rcvqFVjZUwetlL+wZvhHqXYEufuI3HdVPzaVwNNofErMj?=
 =?us-ascii?Q?uDzdpDUas0Z2AdJa8wpT5MAOn8le4+km5MnU0EG5/t4YxvWmxdhYDVxeS/lD?=
 =?us-ascii?Q?0wRzJA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:49:25.9883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 689069e3-2fa3-4cbe-728f-08de540a9aff
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5941

This patch enables the interrupt storm detection feature and
also adds the per device counter for tracking the faulty
devices. It also masks the faulty devices from generating
any further interrupts.

Add field for interrupt storm handling.
Extend structure mlxreg_core_data with the following field:
 'wmark_cntr'   - interrupt storm counter.

Extend structure mlxreg_core_item with the following field:
 'storming_bits' - interrupt storming bits mask.

Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
Signed-off-by: Ciju Rajan K <crajank@nvidia.com>
--
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 74 +++++++++++++++++++++-
 include/linux/platform_data/mlxreg.h       |  4 ++
 2 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index d246772aafd6..4752477207d4 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -30,6 +30,9 @@
 #define MLXREG_HOTPLUG_ATTRS_MAX	128
 #define MLXREG_HOTPLUG_NOT_ASSERT	3
 
+/* Interrupt storm frequency */
+#define MLXREG_HOTPLUG_INTR_FREQ_HZ	100
+
 /**
  * struct mlxreg_hotplug_priv_data - platform private data:
  * @irq: platform device interrupt number;
@@ -339,6 +342,57 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 	return 0;
 }
 
+/**
+ * mlxreg_hotplug_storm_handler - generic interrupt storm detection callback
+ * @irq: interrupt number experiencing storm
+ * @freq: detected frequency (interrupts per second)
+ * @dev_id: device data (mlxreg_hotplug_priv_data)
+ *
+ * This callback is invoked by the generic interrupt storm detection mechanism
+ * when an interrupt storm is detected on the shared IRQ line. The driver then
+ * analyzes per-device interrupt counters to identify which specific devices
+ * are causing excessive interrupts without blocking operations.
+ */
+static void mlxreg_hotplug_storm_handler(unsigned int irq, unsigned int freq, void *dev_id)
+{
+	struct mlxreg_hotplug_priv_data *priv = dev_id;
+	struct mlxreg_core_hotplug_platform_data *pdata;
+	struct mlxreg_core_item *item;
+	struct mlxreg_core_data *data;
+	unsigned long asserted;
+	u32 bit;
+
+	dev_warn(priv->dev,
+		 "Interrupt storm detected on IRQ %u (%u interrupts/sec)",
+		 irq, freq);
+
+	pdata = dev_get_platdata(&priv->pdev->dev);
+	item = pdata->items;
+	asserted = item->cache;
+
+	for_each_set_bit(bit, &asserted, 8) {
+		int pos;
+
+		pos = mlxreg_hotplug_item_label_index_get(item->mask, bit);
+		if (pos < 0)
+			goto out;
+
+		data = item->data + pos;
+		/* Check per device interrupt counter */
+		if (data->wmark_cntr >= MLXREG_HOTPLUG_INTR_FREQ_HZ - 1) {
+			dev_err(priv->dev,
+				"Storming bit %d (label: %s) - interrupt masked permanently. Replace broken HW.",
+				bit, data->label);
+			/* Mark bit as storming. */
+			item->storming_bits |= BIT(bit);
+		}
+		data->wmark_cntr = 0;
+	}
+	return;
+ out:
+	dev_err(priv->dev, "Failed to complete interrupt storm handler\n");
+}
+
 static void
 mlxreg_hotplug_work_helper(struct mlxreg_hotplug_priv_data *priv,
 			   struct mlxreg_core_item *item)
@@ -371,6 +425,10 @@ mlxreg_hotplug_work_helper(struct mlxreg_hotplug_priv_data *priv,
 			goto out;
 
 		data = item->data + pos;
+
+		/* Counter to keep track of interrupt storm */
+		data->wmark_cntr++;
+
 		if (regval & BIT(bit)) {
 			if (item->inversed)
 				mlxreg_hotplug_device_destroy(priv, data, item->kind);
@@ -390,9 +448,9 @@ mlxreg_hotplug_work_helper(struct mlxreg_hotplug_priv_data *priv,
 	if (ret)
 		goto out;
 
-	/* Unmask event. */
+	/* Unmask event, exclude storming bits. */
 	ret = regmap_write(priv->regmap, item->reg + MLXREG_HOTPLUG_MASK_OFF,
-			   item->mask);
+			   item->mask & ~item->storming_bits);
 
  out:
 	if (ret)
@@ -767,6 +825,15 @@ static int mlxreg_hotplug_probe(struct platform_device *pdev)
 
 	/* Perform initial interrupts setup. */
 	mlxreg_hotplug_set_irq(priv);
+
+	/* Register with generic interrupt storm detection */
+	if (!irq_register_storm_detection(priv->irq, MLXREG_HOTPLUG_INTR_FREQ_HZ,
+					  mlxreg_hotplug_storm_handler, priv)) {
+		dev_warn(&pdev->dev, "Failed to register generic interrupt storm detection\n");
+	} else {
+		dev_info(&pdev->dev, "Registered generic storm detection for IRQ %d\n", priv->irq);
+	}
+
 	priv->after_probe = true;
 
 	return 0;
@@ -776,6 +843,9 @@ static void mlxreg_hotplug_remove(struct platform_device *pdev)
 {
 	struct mlxreg_hotplug_priv_data *priv = dev_get_drvdata(&pdev->dev);
 
+	/* Unregister generic interrupt storm detection */
+	irq_unregister_storm_detection(priv->irq);
+
 	/* Clean interrupts setup. */
 	mlxreg_hotplug_unset_irq(priv);
 	devm_free_irq(&pdev->dev, priv->irq, priv);
diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index f6cca7a035c7..592256570175 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -131,6 +131,7 @@ struct mlxreg_hotplug_device {
  * @regnum: number of registers occupied by multi-register attribute;
  * @slot: slot number, at which device is located;
  * @secured: if set indicates that entry access is secured;
+ * @wmark_cntr: interrupt storm counter;
  */
 struct mlxreg_core_data {
 	char label[MLXREG_CORE_LABEL_MAX_SIZE];
@@ -151,6 +152,7 @@ struct mlxreg_core_data {
 	u8 regnum;
 	u8 slot;
 	u8 secured;
+	unsigned int wmark_cntr;
 };
 
 /**
@@ -167,6 +169,7 @@ struct mlxreg_core_data {
  * @ind: element's index inside the group;
  * @inversed: if 0: 0 for signal status is OK, if 1 - 1 is OK;
  * @health: true if device has health indication, false in other case;
+ * @storming_bits: interrupt storming bits mask;
  */
 struct mlxreg_core_item {
 	struct mlxreg_core_data *data;
@@ -180,6 +183,7 @@ struct mlxreg_core_item {
 	u8 ind;
 	u8 inversed;
 	u8 health;
+	u32 storming_bits;
 };
 
 /**
-- 
2.47.3

