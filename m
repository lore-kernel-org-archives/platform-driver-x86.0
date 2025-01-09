Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027DB21B908;
	Thu,  9 Jan 2025 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736433602; cv=fail; b=j3aPXDUAcMb18NmMdF/DplSWC5I5UGfOXbXQk51pOZh2CMn23xdT5LwYrm2ehCYb9go68C+q1vblH8jFVVZx+fjmnvH7JIYSGEADo77Z43+MEQfZAizmL9SxUG+D6YPk9WccsYN7JdmJ/+9HlTR041pubpLO3CyNiIEqqkRZwBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736433602; c=relaxed/simple;
	bh=4sB0M4TTIS7GpjoLSkzVRpNoml/aXT+85wvVg5kvnQo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S7VL7hwlCr9GGpgKm+QpgFWntvsJoA7KJajNrmsK/vJlYqe6e5/k55ea7+kJvGPzUCeJO3IGr5nzW8JaHmAy3l8pd8ozbkIcbXMg1nQ3jNZyGXqQ6ArBCmBAbKvyaWGdDgSLp4WpA30Wr6MJhNM6R6SmdTyJJDtGBugZHm7Hf9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PeY1bnSU; arc=fail smtp.client-ip=40.107.243.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PeY1bnSU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D6L1VHw5rMgFMoXvI8BjE4wjcYoCUQvQBrKL5gRxMky5ag3nRJ5OGZKdh8YZA/cTd3awMFf6SVKPh4VMxpScnvQTCJ0NnrUK3rCxo/d+7vHXuX7/CLjnMBO8DaJ2XEIWG4+ZUtebCOGPla6j/Dy7duzWJllVaZvS2p/19M6kaopA7GgMX8f5UlwwDD0LI27xlE7EfmwPhFT1AQxRB9S0TVhHbwNs9pcraU2rT2XIOo/ab5zyyP5R2FOyBpFtNgEXj0Y2fVa8Phmkq1Ig//Zafzmpjzl69GPQfxp4LfUdWX+rnxq9iswIh/ORvPGr0QONJ/JuDB8chZLiplK0T8M9JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxzO8BNdn60zmrIIdKw2rUfLDzhsoYp3pLL4dAUQ1uw=;
 b=qKIhF2wxElm3/ofLUmzWfttjQYmLsf7ljxf/wwlzgu7KTKOJ/bwGQGPiEqvFI0CUs54cFYjt8KvBaFkegfrZpDL5ZTd6x9H5aZt9+qh6kM3GuJXEAWoGOre8E22s6AfFGEzOzIvdTvdM0sovW9EFPCnZg2CLSBbB9rY8ChN+IO+RgwT9OFsY2bUnSVJZ0fgjqqzeiSInXWd4PaRkNouRQlXnd8MhyC3ru6n5/f4XyMxhFd54vPY8FP70BeK/i0a6FVNtS9+6UzwLY01Dsevv8EYo6tuq0mhJ5tgNCUkLHzJzpLY7KtCWt2afpZRzytx+8WJw2eAprbrXthkCQxvfqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxzO8BNdn60zmrIIdKw2rUfLDzhsoYp3pLL4dAUQ1uw=;
 b=PeY1bnSUYx2/y7LzQiEyLW25WtY0PB09t7+g3FB7lZHVO//JxdgJrQDIWlzZAHp1s0Ta64u/bC2egf8iYhHQGQjRHg4ohmkCfyuvB5AC0rlViI38Ba1pBIGoNJWbdoxPVTtMzG74/K9DERZ7YqUPZFry47W3WKPo8V3JiBp1PwrQzlSWZ8NV6hJ48pwh7jBoDqDCCbAHRWSATqa0sbta/LvDKVYGs7eusb3Qw+SVWz+i8TShRp7iJLedCJxRB99x0r+a7p5Oz97td97rJ5BmpAOW0C2Q2sUYdcvIMNoB43NQ8uv958cO7aI31nVT/IsLUKU8C2B0Ro4vTLgXFZSPcA==
Received: from PH8PR21CA0018.namprd21.prod.outlook.com (2603:10b6:510:2ce::8)
 by SN7PR12MB6838.namprd12.prod.outlook.com (2603:10b6:806:266::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 14:39:57 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:2ce:cafe::1b) by PH8PR21CA0018.outlook.office365.com
 (2603:10b6:510:2ce::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.6 via Frontend Transport; Thu, 9
 Jan 2025 14:39:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Thu, 9 Jan 2025 14:39:57 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 9 Jan 2025
 06:39:39 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 9 Jan 2025
 06:39:38 -0800
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Thu, 9 Jan
 2025 06:39:37 -0800
From: Shravan Kumar Ramani <shravankr@nvidia.com>
To: Hans de Goede <hdegoede@redhat.com>, Ilpo Jarvinen
	<ilpo.jarvinen@linux.intel.com>, Vadim Pasternak <vadimp@nvidia.com>, "David
 Thompson" <davthompson@nvidia.com>
CC: Shravan Kumar Ramani <shravankr@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 3/4] platform/mellanox: mlxbf-pmc: Add support for clock_measure performance block
Date: Thu, 9 Jan 2025 09:39:22 -0500
Message-ID: <6ea0699497479dfde0a52fcb28aef55aee1bbc0b.1736413033.git.shravankr@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|SN7PR12MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a782d13-f0d8-40d3-9c63-08dd30bb7d46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0NEvQjWLJX0hSeHMM3aPEUdzTjQo7dGM+fyKRG87z4FlzbsheRk4lnVKfpEM?=
 =?us-ascii?Q?M15Gz6IUxVFYWErVeJENuCEmNDt6kYsIylvZ8dwUqFay6wBuZLtxTU0CunmB?=
 =?us-ascii?Q?6x709s60Lnw0VlsHgdBFIano4O5BvsIXd9n6f1TLHIB1fFBSQHwdd/JuOlW3?=
 =?us-ascii?Q?mc8n9mRkf6OYj7jXngkZE5FimnXqpjFB1nPjPR5/muCGwxg8K11UpPY9dYkM?=
 =?us-ascii?Q?ujofsSKPByKLevYVfyof1Gt6LAbaBKeboIsvxNm5MnKB5f5v8/TijTGgFw4P?=
 =?us-ascii?Q?RPzhiSAcDI3G6MOKJncECLe04hMN5ygUt4SqjDbFSeRFvwv8FcoWJfuX18zH?=
 =?us-ascii?Q?dijiq8eaU6hb4Ua4FwCTgtp/x8+fPgl0U989s/dYpDk9PsrJseUBTgozk76T?=
 =?us-ascii?Q?ErIbsDKHR8Ns8wHF5xo6RrUprl028nJI9ShDmnPBoKzKgEJRFEhZbUy2gz4e?=
 =?us-ascii?Q?lA8yyX8KRFVLYV35y+gJObUS2eV8uxx7HZaCb6Thi6Iz9tPf42XMGe8P4gl4?=
 =?us-ascii?Q?gKvbScxN7jdFMBaUdcBuwS0yka1/ANga5lPo258mBIrpplSE9/zdh7na+x37?=
 =?us-ascii?Q?Yl5XlfbpkjATqsiJsnwE//z3x5OjxUzsIU33CBQ53PZqLI09tvh8EyExjWah?=
 =?us-ascii?Q?dCTaDEmR+vhJHctmnc2kB3MZeSf7HDOuX/002jdMt+E+ZLtN1HiiLaGIxFsz?=
 =?us-ascii?Q?e1z1gaCOtQZXcWDgjs+Rf8TDEzd7u8fMK35czKEPN3ouE1pzU7DMyrVPaVem?=
 =?us-ascii?Q?7GOC30D+dbVznc2bos36wlSHXN3h3xwaOSPNyO3JPlA5xPtFgkbPNDeYeuZC?=
 =?us-ascii?Q?Vq0c8x30tAF8u3RZXkx+9KmpHW1esqWg/lLjDhGbDFlSl5qpvYg/9g+lKOR9?=
 =?us-ascii?Q?FVAiERuy1/i4GGeHH/vAKG03y+JU2+ebrWyMka/Pd58Z13OAbIUbeGr7LTTn?=
 =?us-ascii?Q?wD/vDJBcTwmkve+fcA3F7mQBLWQcMtO2hcPCAxPIHczMoILnbZKNGIshU0//?=
 =?us-ascii?Q?1mYXDAd11aWiwU59EKuMKmkCsdg/0puxN3On+fFgh2pW4UEYUw8TWLnQjd2R?=
 =?us-ascii?Q?goUTTfTPCpSpBuBwhYcwmMlW/lFHm7hrbLrvAHiHlnWjTaSUG1lECEjZh5oz?=
 =?us-ascii?Q?xl8oErfprxvXORZsydE5BkXPTECYnStq3u72ISJVZm46YgiGARIReCvg50gv?=
 =?us-ascii?Q?0hkUZd+liiOzFIZFyP18q2a474Peihgot3Mu1N1vMXWLnQtjyXV361AnSgCV?=
 =?us-ascii?Q?nxvICrlPH5vZeyYHaPnrTKvtwAW9t/mROF3Rs5rpCxvoLgJJyNHE9cARARRk?=
 =?us-ascii?Q?3EyO97NZZFwRD2houVVZWfFHOcgaoj+BwBIovBqXifjpnGPNWN0QDpruGbhV?=
 =?us-ascii?Q?Tn3YrLTZRbeI2yIeYVZMcsPrkXdMmIT/DDW3Si+ZEki8IgZvjIL8C0E+mNDa?=
 =?us-ascii?Q?3pwpieqvOOQ7Y7qYtdquEqzK2GcBg/UfG3kctZOJa7Fj1ruSEIJi5ji9uqlJ?=
 =?us-ascii?Q?NBsdPJU7sP55rUI=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 14:39:57.3869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a782d13-f0d8-40d3-9c63-08dd30bb7d46
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6838

The HW clock_measure counter info is passed to the driver from ACPI.
Create a new sub-directory for clock_measure events and provide
read access to the user. Writes are blocked since the fields are RO.

Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
Reviewed-by: David Thompson <davthompson@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlxbf-pmc.c | 46 ++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
index ce967030d62a..25270a425ded 100644
--- a/drivers/platform/mellanox/mlxbf-pmc.c
+++ b/drivers/platform/mellanox/mlxbf-pmc.c
@@ -862,6 +862,37 @@ static const struct mlxbf_pmc_events mlxbf_pmc_llt_miss_events[] = {
 	{75, "HISTOGRAM_HISTOGRAM_BIN9"},
 };
 
+static const struct mlxbf_pmc_events mlxbf_pmc_clock_events[] = {
+	{ 0x0, "FMON_CLK_LAST_COUNT_PLL_D1_INST0" },
+	{ 0x4, "REFERENCE_WINDOW_WIDTH_PLL_D1_INST0" },
+	{ 0x8, "FMON_CLK_LAST_COUNT_PLL_D1_INST1" },
+	{ 0xc, "REFERENCE_WINDOW_WIDTH_PLL_D1_INST1" },
+	{ 0x10, "FMON_CLK_LAST_COUNT_PLL_G1" },
+	{ 0x14, "REFERENCE_WINDOW_WIDTH_PLL_G1" },
+	{ 0x18, "FMON_CLK_LAST_COUNT_PLL_W1" },
+	{ 0x1c, "REFERENCE_WINDOW_WIDTH_PLL_W1" },
+	{ 0x20, "FMON_CLK_LAST_COUNT_PLL_T1" },
+	{ 0x24, "REFERENCE_WINDOW_WIDTH_PLL_T1" },
+	{ 0x28, "FMON_CLK_LAST_COUNT_PLL_A0" },
+	{ 0x2c, "REFERENCE_WINDOW_WIDTH_PLL_A0" },
+	{ 0x30, "FMON_CLK_LAST_COUNT_PLL_C0" },
+	{ 0x34, "REFERENCE_WINDOW_WIDTH_PLL_C0" },
+	{ 0x38, "FMON_CLK_LAST_COUNT_PLL_N1" },
+	{ 0x3c, "REFERENCE_WINDOW_WIDTH_PLL_N1" },
+	{ 0x40, "FMON_CLK_LAST_COUNT_PLL_I1" },
+	{ 0x44, "REFERENCE_WINDOW_WIDTH_PLL_I1" },
+	{ 0x48, "FMON_CLK_LAST_COUNT_PLL_R1" },
+	{ 0x4c, "REFERENCE_WINDOW_WIDTH_PLL_R1" },
+	{ 0x50, "FMON_CLK_LAST_COUNT_PLL_P1" },
+	{ 0x54, "REFERENCE_WINDOW_WIDTH_PLL_P1" },
+	{ 0x58, "FMON_CLK_LAST_COUNT_REF_100_INST0" },
+	{ 0x5c, "REFERENCE_WINDOW_WIDTH_REF_100_INST0" },
+	{ 0x60, "FMON_CLK_LAST_COUNT_REF_100_INST1" },
+	{ 0x64, "REFERENCE_WINDOW_WIDTH_REF_100_INST1" },
+	{ 0x68, "FMON_CLK_LAST_COUNT_REF_156" },
+	{ 0x6c, "REFERENCE_WINDOW_WIDTH_REF_156" },
+};
+
 static struct mlxbf_pmc_context *pmc;
 
 /* UUID used to probe ATF service. */
@@ -1035,6 +1066,9 @@ static const struct mlxbf_pmc_events *mlxbf_pmc_event_list(const char *blk, size
 	} else if (strstr(blk, "llt")) {
 		events = mlxbf_pmc_llt_events;
 		size = ARRAY_SIZE(mlxbf_pmc_llt_events);
+	} else if (strstr(blk, "clock_measure")) {
+		events = mlxbf_pmc_clock_events;
+		size = ARRAY_SIZE(mlxbf_pmc_clock_events);
 	} else {
 		events = NULL;
 		size = 0;
@@ -1469,14 +1503,15 @@ static int mlxbf_pmc_read_event(unsigned int blk_num, u32 cnt_num, bool is_l3, u
 /* Method to read a register */
 static int mlxbf_pmc_read_reg(unsigned int blk_num, u32 offset, u64 *result)
 {
-	u32 ecc_out;
+	u32 reg;
 
-	if (strstr(pmc->block_name[blk_num], "ecc")) {
+	if ((strstr(pmc->block_name[blk_num], "ecc")) ||
+	    (strstr(pmc->block_name[blk_num], "clock_measure"))) {
 		if (mlxbf_pmc_readl(pmc->block[blk_num].mmio_base + offset,
-				    &ecc_out))
+				    &reg))
 			return -EFAULT;
 
-		*result = ecc_out;
+		*result = reg;
 		return 0;
 	}
 
@@ -1490,6 +1525,9 @@ static int mlxbf_pmc_read_reg(unsigned int blk_num, u32 offset, u64 *result)
 /* Method to write to a register */
 static int mlxbf_pmc_write_reg(unsigned int blk_num, u32 offset, u64 data)
 {
+	if (strstr(pmc->block_name[blk_num], "clock_measure"))
+		return -EINVAL;
+
 	if (strstr(pmc->block_name[blk_num], "ecc")) {
 		return mlxbf_pmc_write(pmc->block[blk_num].mmio_base + offset,
 				       MLXBF_PMC_WRITE_REG_32, data);
-- 
2.43.2

