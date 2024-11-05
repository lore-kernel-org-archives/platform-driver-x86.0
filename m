Received: from outbound.mail.protection.outlook.com (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8211D5ADA
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 17:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828285; cv=fail; b=umh4I5sx+/0nRL8jzsJkdos69rGIk2CuUcVZLLvF8gKhxY1zXAJKEmZdCc/M36TEWGaLqwawc519yk/XU7qhs2sBbplt1zsU+k/NLy4AklgbFQWfM7k0gLxmam/ftyXv/Map8kFz8bRPnWEK6+b6e8+j0gf4gEj5r0XrxCL/IjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828285; c=relaxed/simple;
	bh=0Pj+DguNAAMJhpk5Uu02LwDkSM2aNSrDq02yQVZA4p4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sks6Kjaozy+fLC3m9Vkd7DkgLFeize4jlHf9oTgtkC7xBZ8nWov+0OpsOtT2lfPoCZXCm0lNefn3HBoAj8hP6fpI8/D0YyuXDhG88Ffy0zk5hGSy0GvlIEqSYx8FRVcfeyEBGmL+3nIMcWf3eMT8wZC6jcj2otNqHTXwoccd0ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QssncQrL; arc=fail smtp.client-ip=40.107.236.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QssncQrL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRxZ4niAFuhWuY1nkjqsrOEquiLXOKupNbionF8iiiHFPh9rBrRwdzNLqncwSD0eKUiGPgEC8KRsz6GALap+5fdTPGhPBGh2iDx8muJINlGkjn8uzXeMzFuXR9wzOsVQ5leKtbnz1RZndP4hvSAfnSBC1kDf7so8jNw7cDzXzZoUuCkpfC1omgy8b4in0EXqFYct5NgHC3+X9XN62X49gApov41v2KQFydOY/9z1I8JG2XkWG3v0fSAn505+DdF/ls9dWmHARuQ1ktSFA8UqrJvKTJWkWrjohcIrCWPQZXtul6NNmOsxKd5/lbdNlE9SHntWg61J4c9YUmAcl+a4VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/ll664WPMtIS6D/QTe1oYGz2/a9meVGfSiHFhN2myw=;
 b=mqDOLzHDwAToHayk8MNwpT4/TRNQom9BUG4eDaCM+7YpmKiBWOvKSioQ1gDWL9pDAVFRkBYCrHi+AwnKnfjZeA9rjv8avfjKR3EsQ+GTWE/upeKkoGakB6y2obABv1hROpNsgbufjI91t5HuVCemOTGQpxij523kfM1e/AdzpL6OHDgw8ELyGkF4MTZ26ywtkw6VOweQzI5Vj4h7Tb8sq4DrW5ya47wu2X9sNh1WUFRgzT/X6M3WveKUHsXcFXoh+vSCYy+ElYFRz4UazGRcnaln45COxxc1QOYXCedoM/DAb2VJiGeu9x/7uSjKx5s1JKsGElYdBNTgOq5+/LzXoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/ll664WPMtIS6D/QTe1oYGz2/a9meVGfSiHFhN2myw=;
 b=QssncQrL6O+2pAmc2n2/5fDEeVR0a0LPAIz3spsYyWLO1+v2hInGtSEwYHGhfyK/dzckEdge0nYVROw/Ew5vUByBczozq84LwH3geGk4xwxKvrKmIETSWWD3edRoHCl7ZTyKmIGuVv3xVHAtponwDNvBP7GtilGwz2a3RWOD2zA=
Received: from MW4PR04CA0146.namprd04.prod.outlook.com (2603:10b6:303:84::31)
 by SA1PR12MB9248.namprd12.prod.outlook.com (2603:10b6:806:3a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 17:37:59 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:303:84:cafe::49) by MW4PR04CA0146.outlook.office365.com
 (2603:10b6:303:84::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18 via Frontend
 Transport; Tue, 5 Nov 2024 17:37:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Tue, 5 Nov 2024 17:37:55 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Nov
 2024 11:37:53 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v3 06/13] platform/x86/amd/pmc: Define enum for S2D/PMC msg_port
Date: Tue, 5 Nov 2024 23:06:30 +0530
Message-ID: <20241105173637.733589-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
References: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|SA1PR12MB9248:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a9c232b-bc8e-4232-9b4a-08dcfdc0955a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d5lNULDZpOwSnL9vhRVh/Qeb5J1bQbVbDLgK2DCHYJcsrfdh8l5HuKlHtZ8f?=
 =?us-ascii?Q?mVyjDO66xsTFARcm6qpypCJJ8ukkpp+yq3TCZZ3j/1pt92n3lf1IM4C0uzPo?=
 =?us-ascii?Q?F5fbvMz5/XwBEiNiuh56gdvCKDojRtTvowUCD1oUgMlx9SD2R1cDR01Ngpqu?=
 =?us-ascii?Q?gaVdxZhhLyqEwMPS0o0FSzRi4SWK2NmgxpsO99qq9sv49zaiiGpQw+RNVMe6?=
 =?us-ascii?Q?p40peXe2V+gDIsk9RSZWGM4PbRO6DyDJd/kbo9s1mhK3bfyrOOXI+d1POhlL?=
 =?us-ascii?Q?/OKfUcl+/Puv3gLzbOvcg+JEd9lc+wxK8ciDU2UDw0c1iv6VG1f5VIchlw7d?=
 =?us-ascii?Q?8teky9jJ+pjX0suD1SnXVIFVnj9CZjJF0eHNUE6+D8BrjRvnANpEVsoGl5zh?=
 =?us-ascii?Q?ski+H6tjuVB+jS3DJjSHzcj0jl8SYh3MnrWMsj4qjI8WKeYU5EeGZ89+yyrc?=
 =?us-ascii?Q?8zrkLWI/0lWuiZzY7Iyvld92O1pRYdERkEROLNT3cHV6s5lkjeG2GxMdiSdo?=
 =?us-ascii?Q?dZiLGtLLk2zJ9q+/Zsc4328cK39GgvNpTt/you5I1zDuzH2W4SQsKTw9zRxJ?=
 =?us-ascii?Q?oJAtokE2c+4NJJ5cCBWTKQFl7JiF0AzDdSILdTEf4errIIy5xbRwyELhHCpt?=
 =?us-ascii?Q?Va0OVLGRlDMWkwXSugjU+sDac5onx1+dxX0RFCh0hIZNNgPXOAfWqgIFWJdz?=
 =?us-ascii?Q?3LbVoZXsRAXKYtFS6YwtAdPz8wcFjxuFnAyqh3/H0cXBGk1bWkUhf/mfxsFA?=
 =?us-ascii?Q?xzH53h7ZQ9KzCjxPwwi5HAmXCGVLv67J/adYZYuqFj/eqMPlk6IqKGSHtQT8?=
 =?us-ascii?Q?kC6VKchLjZiNq7MFSgY9loq2xOsRnLpT19bJnkrPmrpI7a9I8eQMz6JHOJ2T?=
 =?us-ascii?Q?Ks7ZsLCOLoi4g6vhUHVa2UVRhjI8oFH0iMeEHD9YPGRl9MwdKZUukvogmz1i?=
 =?us-ascii?Q?7+McUMmDgCGZfBIwxEx7nj7h4bT63le+ai65hv3rytpmiszh+d5Sb89rOKJv?=
 =?us-ascii?Q?aBocSDC9FQY+FDAdCboFbkj6e2Zlj6/yXRObSyqELjsdPpr0+goPFIIb70Y7?=
 =?us-ascii?Q?RJoQ5CHizAPgrSHPAPqpV2WDIHY+3bJw1W6nvvC55sL+Jrnh1E15y90tCCW4?=
 =?us-ascii?Q?pfLftlIJs+or60hPvEUM/y2EPTA3UMQy2HrrtFK31d4v3euA7TscancDbUJD?=
 =?us-ascii?Q?tqIBkuhE1tCJEIjNObLzm42sZ32Ld3HyF800Fwdx9wuVxhu+PHyAsLmk8+C/?=
 =?us-ascii?Q?XfTBrL1m3Irw1Z5Nr+puFFmv/Rl9lLK+4wpeGVr1+oeGWxnIYgeY52hZcmvt?=
 =?us-ascii?Q?1RAUQzcFv2casRVUJHnudGIBjpFMraKe8lJjod48Sa+gBgzXMG43y8Iw42qv?=
 =?us-ascii?Q?E5IreogF+HglWG/qtRtStt/XF1vpmu+qhgcdZzVwdj80OHyyrQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 17:37:55.9652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9c232b-bc8e-4232-9b4a-08dcfdc0955a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9248

To distinguish between the PMC message port and the S2D (Spill to DRAM)
message port, replace the use of 0 and 1 with an enum.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/mp1_stb.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index 5c03ac92558f..fd7ca1626cfe 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -47,6 +47,11 @@ enum s2d_arg {
 	S2D_DRAM_SIZE,
 };
 
+enum s2d_msg_port {
+	MSG_PORT_PMC,
+	MSG_PORT_S2D,
+};
+
 struct amd_stb_v2_data {
 	size_t size;
 	u8 data[] __counted_by(size);
@@ -155,7 +160,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 		dev_err(dev->dev, "error writing to STB: %d\n", ret);
 
 	/* Spill to DRAM num_samples uses separate SMU message port */
-	dev->msg_port = 1;
+	dev->msg_port = MSG_PORT_S2D;
 
 	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
 	if (ret)
@@ -172,7 +177,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	/* Get the num_samples to calculate the last push location */
 	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
 	/* Clear msg_port for other SMU operation */
-	dev->msg_port = 0;
+	dev->msg_port = MSG_PORT_PMC;
 	if (ret) {
 		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
 		return ret;
@@ -267,7 +272,7 @@ int amd_stb_s2d_init(struct amd_pmc_dev *dev)
 	}
 
 	/* Spill to DRAM feature uses separate SMU message port */
-	dev->msg_port = 1;
+	dev->msg_port = MSG_PORT_S2D;
 
 	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
 	if (size != S2D_TELEMETRY_BYTES_MAX)
@@ -285,7 +290,7 @@ int amd_stb_s2d_init(struct amd_pmc_dev *dev)
 	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
 
 	/* Clear msg_port for other SMU operation */
-	dev->msg_port = 0;
+	dev->msg_port = MSG_PORT_PMC;
 
 	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
 	if (!dev->stb_virt_addr)
-- 
2.34.1

