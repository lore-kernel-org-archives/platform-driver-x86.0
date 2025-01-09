Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007E221B199;
	Thu,  9 Jan 2025 14:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736433598; cv=fail; b=LbMcJ6gHTNAaef0IU8swrqXYivKRCfv05Kgi7s48R3gFHLCXY+KnvXL53ADqueLEreCdHL/rMBoKcep6ubJbXa40RgBLsBuqXxsujqXPvjW/G7fzsOVxcJRUnJ56HZPTQle9XXYG9u50jcdwAc1OUpNiGf8GQEVjXh6q6xYGqq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736433598; c=relaxed/simple;
	bh=CbysCNaZ/HeDS+FqkfO3sgSurRjwsstPtlNQHJbxDYo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jyxtD339/IoJeNHCcqBbYbrQ8WVyyUpE66hpm/2Y1b63YlnhknQI/pYh5No/WUWKaRAQh7CG2PAyI1CjXBbYdRBOvzUFEtEhCyyWeZFoE54/aSs2NmIfywjrpmBVASy3nzN8lq6cBU64PP9xZj2Unkd0CCnV/wocFYzmiEHMtkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NqAOnYQ7; arc=fail smtp.client-ip=40.107.244.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NqAOnYQ7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krmDidbO2eZ0ZV8H0r5DwKbWOHMQQJ2Bizgp1n2G9/pxBOdJUEhSEnnaULSWV+mrs4fESc+16B/FQ3l9VuYsDRvCS9Y4aiWkUjLaqS+xbiVodzTqfZOqRAPcwvnwbIhK7+faZXWyVRY+BHmQOCA05FLb/am7fchT1FXnyjHppM6Cc/pAmlbE57k/RFTQFUdmQcKSPUJv2zKy1AEbbkX1UYDVaoSPIdP/KDlWA115reP23IxzzOZvWsVIlOR6KrxnX161mRoD6yMLQX9JjfMfKx0RREGnoYDhac2bWlj1c4ctfja3j9bayzgpvuiwt/hHeWCC7EANV5xkmGAzqnpWsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2VLlSLD+M9EXTm2yjxmYm9mm/b5Oc8trhxBX2bqQAU=;
 b=b3FppO8dtbhk0WznbAvaj+F+J+//GH0sFIMvu2kfIT3v9zA4jw6eiuGoe8f+z1GL9AbNsjYWlpR517MO1DUjbsZPZ4GMiQZWuxcXMHElx5FztM9BDjhEhKyD7kQXpAW61Y+/ylfr/89TBgqRIvIq3m4/deJZhhsUCrIYK79J6aaNNvH1PRLaRkhy5IgkRwOTnW6qGsRCCsYKdNHgli3k1FXaWAVGMZSfE15IaKp1IUCmaA1IB0JdZnuKfMIDsf93RO720gyCLxE2ZZx1V7KfYrHSX+poBueaLKJmIo5g0dTTPPd40AmpHl2Nn9PtFXkvmRYdJj3ofj3k2g/dfQQOgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2VLlSLD+M9EXTm2yjxmYm9mm/b5Oc8trhxBX2bqQAU=;
 b=NqAOnYQ7OeSvUW6uMPuXvR0AebK3K/w10SWeF45ECKqnyZMWLyh9HWEPQjP2ISkLgNcV6wWQQhUpmsvoTNgxSIeKUBeRaRXarwbWKfMdBsZEZg3C3tDv6t9SI6nhbaIKDdtrCQERjOQWmvSe47d3zLRigHi210CVGw5+E1ay6lMiAg7Ow+NUO8sk03BOr5czWv+gzdqmmcGMGSJOGlOMJkuwiK8Ng/lBptFUKnsU6SqG6Ky+qHlp4sfkYvJx3c/8aqIiBhBm8gw+MtaYBfKL0pkgXkjbUmcTYT1kiwUwoJs2viv4CWIgWhq5n6pZ5+mmGxsgsjiWnCIG1nRKFDC6+g==
Received: from SJ0PR03CA0252.namprd03.prod.outlook.com (2603:10b6:a03:3a0::17)
 by LV3PR12MB9438.namprd12.prod.outlook.com (2603:10b6:408:212::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Thu, 9 Jan
 2025 14:39:49 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::67) by SJ0PR03CA0252.outlook.office365.com
 (2603:10b6:a03:3a0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Thu,
 9 Jan 2025 14:39:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Thu, 9 Jan 2025 14:39:48 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 9 Jan 2025
 06:39:36 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 9 Jan 2025
 06:39:36 -0800
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Thu, 9 Jan
 2025 06:39:35 -0800
From: Shravan Kumar Ramani <shravankr@nvidia.com>
To: Hans de Goede <hdegoede@redhat.com>, Ilpo Jarvinen
	<ilpo.jarvinen@linux.intel.com>, Vadim Pasternak <vadimp@nvidia.com>, "David
 Thompson" <davthompson@nvidia.com>
CC: Shravan Kumar Ramani <shravankr@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 2/4] platform/mellanox: mlxbf-pmc: Add support for monitoring cycle count
Date: Thu, 9 Jan 2025 09:39:21 -0500
Message-ID: <bd7747897cf1ce77e2e39e271cac21684830f7e7.1736413033.git.shravankr@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1736413033.git.shravankr@nvidia.com>
References: <cover.1736413033.git.shravankr@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|LV3PR12MB9438:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f8d88fa-7e17-4331-6c6e-08dd30bb7832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZIrIkydCNjY5oh/jNymyiQFDzB1bs2tk1aB6c+MsFmnA0Tz1ZuMgx9Dz08tB?=
 =?us-ascii?Q?PSBULubs70gbZBnw9AMLaVtl1iBH8tXELFwiVef2pKl2VirBSPrOz4lFcsfg?=
 =?us-ascii?Q?ACyLxd3A1Yr5N1vNVMMryClCi8xMDucnG6TP9npeLFmBxk2O17HXLH3Kpd24?=
 =?us-ascii?Q?aS4kegBMvk02/ZZzb4EbbCWAJtgCZdFDG3km1mmGJgFHwKX4feD+zIcowKV5?=
 =?us-ascii?Q?VhQjX1KWWma12tS8cFaLLjALqKz4tTELWeAg9KcEiMCkWohD7EGspZKAwY+3?=
 =?us-ascii?Q?eiILCRHCXUv7PgH4UI/a+FjLehZqdnNv/d8fqiWBpLn8WVfxeN/YZwwYYd5m?=
 =?us-ascii?Q?ihNYzySs1h3oRHEU+WES2FrOkrjw+IvAYAK7JDB+ml5HaIH+kFG9NA/TOZC/?=
 =?us-ascii?Q?NmdHTLXeVZWigKG7Y1LednoyOGzxSWBJRGLv7bQtEs8H6SteMdXtsFrfLhwt?=
 =?us-ascii?Q?PdFhc0j4w7ohIZjmobccF3lYkBLuV2aG+3cdDoh7nB8eC5+NCMrEJzel9bBq?=
 =?us-ascii?Q?ACsVDeJ5bd8TJcCK0KhtT4TaDn1VPS+OLrvGmJ9Azt2txD7x3q+BcMdtjhBs?=
 =?us-ascii?Q?JVpvJHIe8EzKn8GB2PS2hwN7YqXZD30dRTqsuLDWTBa2xpNPBMIxj36WdUwq?=
 =?us-ascii?Q?cRUjKIVvTv+3YVXT7Y0zRj0tt1HcrXeRYOp8L+LRq0EGJbhCJhyNLmGLi2r1?=
 =?us-ascii?Q?9FoxUt4dzPDCp8VLolWYzUb7ZfkHyMZub4dePm2mWC9ZiCliguZvo+rAGMC2?=
 =?us-ascii?Q?hbpQENCC97AFS9Giwl/swyWuocWC0gO6osrcQCeGl7xwnHKF5zLiO3eNwpY6?=
 =?us-ascii?Q?5FsWaLCsJLtWd/q8mtv5Ii+NPcMtuApH2yoJU5E2qHqpC0qHscjcgg1gnYzx?=
 =?us-ascii?Q?mvtqqGBPDLCELckncpSu5XMFZyq9qThlliHEwiDH2m39uEM4l/0/GotwbNXb?=
 =?us-ascii?Q?eBeJndd1/ONV9YhxB7zWZ3rJmK0COayIbuQKezL7g5z9FUimyrPipPhHJwAt?=
 =?us-ascii?Q?BmoBnxd95IR1mdCRoiTOkku+IZ4gbuC8GLNl1Zf/0j+V0vE0qHENMBjFM2e2?=
 =?us-ascii?Q?cAGpnFCpk3V1/iUeUcmOpoqn/Mhv8glF9Qp5ydKcbKUJD7i+Cpuxd5zicvis?=
 =?us-ascii?Q?RLQi9sHxeHrkxlRkd7Vyi6FyTQ/Idy/+j9x+cbXpNKfH5CdFfkJmf8kXtC4V?=
 =?us-ascii?Q?BJTFpH50oeQ6dxDymAU0ZEOi3KDvKgJ7Kjg8yMaarAiCMmMD3CvcpQrHRKeT?=
 =?us-ascii?Q?UxZOGK6GMz/YGmMg8p7RUjv6O8Ly+6VSuvD/m6RQrILSujP1JuqLPbt/nqSD?=
 =?us-ascii?Q?LqSa0+pdm0hDX7mITAHUSS9AXNPp+iGnuI+mJHMdOQMcOZ0tqAUmve9Qmbe6?=
 =?us-ascii?Q?3jLhFsMDzmgL/fQZBoG6cRIklFDa84ZvkgAJT30FsaBZUuvdiP+42MEIted7?=
 =?us-ascii?Q?EAffeI5K+NxHH/DiQOGpKpAJfzSZf+iJZ3kZfSjow7Gyj6V9uJhrk2vF79Fj?=
 =?us-ascii?Q?ccSEZJiu5oFUoao=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 14:39:48.9754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8d88fa-7e17-4331-6c6e-08dd30bb7832
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9438

Add support for programming any counter to monitor the cycle count.
This will allow the user to repurpose and dedicate any of the counters
in the block to counting cycles.

Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
Reviewed-by: David Thompson <davthompson@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlxbf-pmc.c | 61 +++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
index 9d18dfca6a67..ce967030d62a 100644
--- a/drivers/platform/mellanox/mlxbf-pmc.c
+++ b/drivers/platform/mellanox/mlxbf-pmc.c
@@ -88,6 +88,7 @@
 #define MLXBF_PMC_CRSPACE_PERFMON_CTL(n) (n * MLXBF_PMC_CRSPACE_PERFMON_REG0_SZ)
 #define MLXBF_PMC_CRSPACE_PERFMON_EN BIT(30)
 #define MLXBF_PMC_CRSPACE_PERFMON_CLR BIT(28)
+#define MLXBF_PMC_CRSPACE_PERFMON_COUNT_CLOCK(n) (MLXBF_PMC_CRSPACE_PERFMON_CTL(n) + 0x4)
 #define MLXBF_PMC_CRSPACE_PERFMON_VAL0(n) (MLXBF_PMC_CRSPACE_PERFMON_CTL(n) + 0xc)
 
 /**
@@ -114,6 +115,7 @@ struct mlxbf_pmc_attribute {
  * @attr_event: Attributes for "event" sysfs files
  * @attr_event_list: Attributes for "event_list" sysfs files
  * @attr_enable: Attributes for "enable" sysfs files
+ * @attr_count_clock: Attributes for "count_clock" sysfs files
  * @block_attr: All attributes needed for the block
  * @block_attr_grp: Attribute group for the block
  */
@@ -126,6 +128,7 @@ struct mlxbf_pmc_block_info {
 	struct mlxbf_pmc_attribute *attr_event;
 	struct mlxbf_pmc_attribute attr_event_list;
 	struct mlxbf_pmc_attribute attr_enable;
+	struct mlxbf_pmc_attribute attr_count_clock;
 	struct attribute *block_attr[MLXBF_PMC_MAX_ATTRS];
 	struct attribute_group block_attr_grp;
 };
@@ -1763,6 +1766,49 @@ static ssize_t mlxbf_pmc_enable_store(struct device *dev,
 	return count;
 }
 
+/* Show function for "count_clock" sysfs files - only for crspace */
+static ssize_t mlxbf_pmc_count_clock_show(struct device *dev,
+					  struct device_attribute *attr, char *buf)
+{
+	struct mlxbf_pmc_attribute *attr_count_clock = container_of(
+		attr, struct mlxbf_pmc_attribute, dev_attr);
+	unsigned int blk_num;
+	u32 reg;
+
+	blk_num = attr_count_clock->nr;
+
+	if (mlxbf_pmc_readl(pmc->block[blk_num].mmio_base +
+			MLXBF_PMC_CRSPACE_PERFMON_COUNT_CLOCK(pmc->block[blk_num].counters),
+			&reg))
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%u\n", reg);
+}
+
+/* Store function for "count_clock" sysfs files - only for crspace */
+static ssize_t mlxbf_pmc_count_clock_store(struct device *dev,
+					   struct device_attribute *attr,
+					   const char *buf, size_t count)
+{
+	struct mlxbf_pmc_attribute *attr_count_clock = container_of(
+		attr, struct mlxbf_pmc_attribute, dev_attr);
+	unsigned int blk_num;
+	u32 reg;
+	int err;
+
+	blk_num = attr_count_clock->nr;
+
+	err = kstrtouint(buf, 0, &reg);
+	if (err < 0)
+		return err;
+
+	mlxbf_pmc_write(pmc->block[blk_num].mmio_base +
+		MLXBF_PMC_CRSPACE_PERFMON_COUNT_CLOCK(pmc->block[blk_num].counters),
+		MLXBF_PMC_WRITE_REG_32, reg);
+
+	return count;
+}
+
 /* Populate attributes for blocks with counters to monitor performance */
 static int mlxbf_pmc_init_perftype_counter(struct device *dev, unsigned int blk_num)
 {
@@ -1801,6 +1847,21 @@ static int mlxbf_pmc_init_perftype_counter(struct device *dev, unsigned int blk_
 		attr = NULL;
 	}
 
+	if (pmc->block[blk_num].type == MLXBF_PMC_TYPE_CRSPACE) {
+		/* Program crspace counters to count clock cycles using "count_clock" sysfs */
+		attr = &pmc->block[blk_num].attr_count_clock;
+		attr->dev_attr.attr.mode = 0644;
+		attr->dev_attr.show = mlxbf_pmc_count_clock_show;
+		attr->dev_attr.store = mlxbf_pmc_count_clock_store;
+		attr->nr = blk_num;
+		attr->dev_attr.attr.name = devm_kasprintf(dev, GFP_KERNEL,
+							  "count_clock");
+		if (!attr->dev_attr.attr.name)
+			return -ENOMEM;
+		pmc->block[blk_num].block_attr[++i] = &attr->dev_attr.attr;
+		attr = NULL;
+	}
+
 	pmc->block[blk_num].attr_counter = devm_kcalloc(
 		dev, pmc->block[blk_num].counters,
 		sizeof(struct mlxbf_pmc_attribute), GFP_KERNEL);
-- 
2.43.2

