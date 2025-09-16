Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011052.outbound.protection.outlook.com [52.101.52.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D381C25A630
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 05:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758001685; cv=fail; b=Xo6BzEGugIhIGZuYD2S9A3Xxl7PmAdq4TdiZ/yjUTfBBtxDYPT3rl/jb8QVhU32ycJBgF2Y64ELCRU/LfX0xtPQcu3o3emdchXgxT3CpLzV4osEEsBcy5RlfWoD7XEgbyD3evn/Sfz1QYige06yMir2sBXrxZ/+qKpW0M58V4lQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758001685; c=relaxed/simple;
	bh=zzJi1PFVYeamzSPzC+yGR8otepBpiAEl+CtBeEyV9RQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d9J4V0GYFhnuLiVfTZnfV6M7yJmBIzvz7sG7V3XrNrKkMAOFEDFYDMaP1HXIjlDRLOpgtirXpQbRdQ/yQVBIIq5kgwyRHWeyV2lM06CtpmkHxJdypO2hCtyKh3udfBmDV3XSX3JoqFDLYeuaA9mBq1gbWtvC9TSJjscCQpmEGho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hg3AjaLX; arc=fail smtp.client-ip=52.101.52.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hg3AjaLX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PoBy0XKjpKgJaQTEmqtPfl9rT0r7jTgVk0RfdRmphZaVJ3wPNp5yDb2gHVpEpX9yCmQ6j8MvfbxUppBfVvK7j4xvlBBCRwTDWD5PrJljWjvMrC/y2cZIhNdI6SJ6qVcMDuKFVI96jUm7EkkbfpKqbAXAvD2TqABIrrBhUyq9Nk7PfXYZuhtlWennwYYeWQg3qR5VIHNamHWzoDvHMdUTAs0I45MFHGp5ss7t5fchpVFS/c9hVcxwOgYCBNMBWpt5Dm8XuS5AWge5zkTtEymvIyXOCu0ICJ5aFYrUc8NXbZONKHKaT3IcGHGQ+29DmHncjFfM1SQPrKa9QPwtWh5WJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpfv9ZJreIF16U4TYy3hgHHNImENaRALfbqUW9JIjLE=;
 b=prNtW3Iukuou4Xc8S7UPS2ZF5Za0HC5cHGW9n/N/19Lcd87jRiETiCu9AmA2CjrqfEeczcqrwne5eW5A80670hcsArzZHknmg9Wi05hvmfC3jJOpjKBLGzveIiukqjCehHFZ00Adam4LZXimmfB6Xmd+s0ekabRYFUnfN3Gr0m+pJy7Y423SITW2YdOR91jNXcPoCml/moeN82MzEiHLm/xrAxSxFgoWIQmb1xh7+BW1P1ilYTot2QUcmaV4mxo7Fi581DHihPq1pGPtkOHuCi+9Mg/yvmHI30BQYjBg18aeNKwi1rBIyJUIp+l2l94U1AcG+qc/aYkxDqiqQg4U4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpfv9ZJreIF16U4TYy3hgHHNImENaRALfbqUW9JIjLE=;
 b=hg3AjaLXp8VV4GPUysDJK+yLVXHbBskv48NWbI5tloYd0auBLyrh41yNtZ9Kap44cIFYWpz2RNZxtFFoqkYO8MYpyPlRDMu+D2oRXa9GZRBqthxy4GaO2JBb+IFkDmOuu2aAE7oD7YY8EyWknfJOBycZKHUl273sCzVuBzi+NSE0d3cYRnkvzE8gbKlYjT7j/i5oNtNrRFwg8ZmAlmjUFgp+vAsXkQZevg66HdBM7vh6yuLrmlp5xipINrmWI8XhPppoNwBV+H246iHMx64EX90ieaN4Oz01GWILaDLwCHimcR6bb5Pm4LP9EoKEE1i0BioZbea9JqsyxksR18BHLQ==
Received: from MW4PR04CA0057.namprd04.prod.outlook.com (2603:10b6:303:6a::32)
 by BY5PR12MB4114.namprd12.prod.outlook.com (2603:10b6:a03:20c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Tue, 16 Sep
 2025 05:47:58 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:303:6a:cafe::27) by MW4PR04CA0057.outlook.office365.com
 (2603:10b6:303:6a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.21 via Frontend Transport; Tue,
 16 Sep 2025 05:47:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 05:47:58 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 15 Sep
 2025 22:47:41 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 15 Sep
 2025 22:47:40 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 15 Sep 2025 22:47:38 -0700
From: Ciju Rajan K <crajank@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <christophe.jaillet@wanadoo.fr>, <platform-driver-x86@vger.kernel.org>,
	<vadimp@nvidia.com>, Ciju Rajan K <crajank@nvidia.com>
Subject: [PATCH platform-next 1/2] platform_data/mlxreg: Add fields for interrupt storm handling
Date: Tue, 16 Sep 2025 08:47:30 +0300
Message-ID: <20250916054731.1412031-2-crajank@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|BY5PR12MB4114:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f48234-d3c0-47d2-e6c5-08ddf4e49735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zj3mGfT/dmhUY7bn+p0BfBlFfzeHnUxPtUMz4rmU7VkBDlX/tdeQaXGaauus?=
 =?us-ascii?Q?gcGfYpr9/fkj4Sobomf0qZGZe2D0fV2LviJTRYtb7gjJf4JlrKX734/yrA3v?=
 =?us-ascii?Q?+4VJIjojidarfsQykN2eDS3+SinLuXIZMJqEkEDl1fIjlJFatNxvd/4dhu72?=
 =?us-ascii?Q?+vzgRKBYv0Q02nBPl4BU/1pm3tSveCc2aISxNHWG2LVgDA3Twj62mPhDMlns?=
 =?us-ascii?Q?guwFMOIQSIFdTyUVTLtawE5+TN9z/pdNWVg7SPzXaC9FN0L5PD9Ns/WNo7hz?=
 =?us-ascii?Q?dLQJvnE+mo3PD9AVuQ5GmH8xu81REg4zbTeqdBFdw1oj++H2c2pcI/SvGs0e?=
 =?us-ascii?Q?xZUoz/9l14b+vbrurh9Nbz4/cLo62nlyUgvXNRbg2tlXJLxs5Fyaj2Sg9iV0?=
 =?us-ascii?Q?iPbRG2zr+TZ5Hpv4O1bNOsjD187xTXHlCApKI7lGLOmx/GEjLHu36rssPGMm?=
 =?us-ascii?Q?8TuV49dyLvPLvD6QtmfMoKN0kpLRtbwll6BOgna/Cc/ASzfifhp/ZlUUROeq?=
 =?us-ascii?Q?lsKDTiOTU8Bv8XgRn58rO9Gd3eejkFXUBqGuAm6d/n5yUAQYPykL5Wv6/3hR?=
 =?us-ascii?Q?86xZzbV88loQwIE7t09KmqaR/nvHORzE8Ff03qYmcBN58p34jkmWcRLIkA4r?=
 =?us-ascii?Q?DY5YkW1K1zoT6EiGC4lAR/EJ+5tVw2AWrkrc3+lUiQmOVL2mPgpirvErkrYK?=
 =?us-ascii?Q?jbRpemE6fy4kmsT022YRjSB3uYAgLXzaBrSaqsCh7diBIyX/QMbTadK4mT8w?=
 =?us-ascii?Q?+U5QQqZbDleiefa7mEFSGt72uKbhWwukWnUTulxV1yzd8BNGuAxW9v0kQxeg?=
 =?us-ascii?Q?8fGpyNLi7HvFaURPxEP+2FJB6ojpzNy169gDhNHoj5Yib1gn7m1t2XQWkWhV?=
 =?us-ascii?Q?WSJZB4Q6lBtAIudCIraDEp4l3eKxY9dCzI8mnov+MCWc9isxUQmV52LLBsdx?=
 =?us-ascii?Q?FTgtLEbqxbITwZnx/ZNFlcIqEBnS0eu6lREhk4vEIC0I12x7AJtO3R61AXlT?=
 =?us-ascii?Q?XctThCdo9slsY9/x/B4BO0Scp6qsOaPEmxayw9Bg0J3Fv3XZMLm/JUoBtXoP?=
 =?us-ascii?Q?tREW9CWFvi25SHL/ML2fhT94qYXMrGZNx6WT03Uoj8vN5PvCqTfS3tkoBNYW?=
 =?us-ascii?Q?vH+CYSOhldBIncuqQLYe4wuxO65sOJMSyfUHyQeoZlwr9oYj6JpIGWI5DGY7?=
 =?us-ascii?Q?7PljOc89bCXG9WczGeuitO+g/eOSWWMjQVVLhLmieOB9cFRR7RTTATsz3Zn8?=
 =?us-ascii?Q?PQtyKKdhipCSZeyB5MRh3wcO7S7stDhui0sv8WNgarGMUJzAEwp3wipZosso?=
 =?us-ascii?Q?rEtpIBf/E0WXhfcVP45tfRuiaXUjTaSorlixgZl/S1KSaKRd9UAbeYGBMMGi?=
 =?us-ascii?Q?CMyFQYmocbXA7U+jaJQGSO0jBfhx/9Xz5+VjWvS8aVp4/LS06vL/gwpjPNHC?=
 =?us-ascii?Q?5FZmyDRawqjhU2zjCbItzMV6mL3pTf+uP1N2AFRBLlby5OPC+iCsC4xPi7Dv?=
 =?us-ascii?Q?hhmooHV5UGudurBWntUZR6eMHtTnWcBw+oUR?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 05:47:58.1689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f48234-d3c0-47d2-e6c5-08ddf4e49735
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4114

Add fields for interrupt storm handling.
Extend structure mlxreg_core_data with the following fields:
 'wmark_low_cntr' - interrupt storm counter.
 'mark_low_ts'    - interrupt storm low bound timestamp.
 'wmark_high_ts'  - interrupt storm high bound timestamp.

Extend structure mlxreg_core_item with the following field:
 'storming_bits' - interrupt storming bits mask.

Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
Signed-off-by: Ciju Rajan K <crajank@nvidia.com>
---
 include/linux/platform_data/mlxreg.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index f6cca7a035c7..55f05caa0d56 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -131,6 +131,9 @@ struct mlxreg_hotplug_device {
  * @regnum: number of registers occupied by multi-register attribute;
  * @slot: slot number, at which device is located;
  * @secured: if set indicates that entry access is secured;
+ * @wmark_low_cntr: interrupt storm counter;
+ * @wmark_low_ts: interrupt storm low bound timestamp;
+ * @wmark_high_ts: interrupt storm high bound timestamp;
  */
 struct mlxreg_core_data {
 	char label[MLXREG_CORE_LABEL_MAX_SIZE];
@@ -151,6 +154,9 @@ struct mlxreg_core_data {
 	u8 regnum;
 	u8 slot;
 	u8 secured;
+	unsigned int wmark_low_cntr;
+	unsigned long wmark_low_ts;
+	unsigned long wmark_high_ts;
 };
 
 /**
@@ -167,6 +173,7 @@ struct mlxreg_core_data {
  * @ind: element's index inside the group;
  * @inversed: if 0: 0 for signal status is OK, if 1 - 1 is OK;
  * @health: true if device has health indication, false in other case;
+ * @storming_bits: interrupt storming bits mask;
  */
 struct mlxreg_core_item {
 	struct mlxreg_core_data *data;
@@ -180,6 +187,7 @@ struct mlxreg_core_item {
 	u8 ind;
 	u8 inversed;
 	u8 health;
+	u32 storming_bits;
 };
 
 /**
-- 
2.47.2

