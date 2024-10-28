Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC60518FC8C
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 07:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730099116; cv=fail; b=ibL8enyES1MAi+JznQnmJ8YuQHwDhMXUD6bqQAKpv/Q88ATabOOvF6Y8uo4l2nP0Ps0wILHSt+a+K6UNfz5VG0osDckXLK9b2yse5cKDcACAVfwsRfAmH4AQJ+UNP4UfLDpiQWehNUQ34CVMTYbLxMfigwdTiHR0KNIHlU13J9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730099116; c=relaxed/simple;
	bh=Jm6ZCB/sX4tmFnbmu3P8M5KvM6G60SfcB5N6BPdVLzU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B/QED7Ti2539IGWN0sVVnXXZYiikHDEBH2I16cx5Bs3E5HvTe1rLnyK+qzTT8/9zR7px/U6unYkklv8+619Cpavh3mE0D5Ii7YKCVL2tbtJIjYYZNnERmtefsZSkDhjixABmJwBdJeD2lDn93x5JRGhtxKxlwFZZ4ljbNNO4WNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KBN5DgAf; arc=fail smtp.client-ip=40.107.244.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KBN5DgAf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYkI6+kTHccOb+53scIby0VkbnMvHiKnpplzTu6WltHMhTgWDZmLNUkKx/ffYru8TG7tEzIJwAZMZgxHLxQaWjq+WIzMHjSY5oCxK78UEb1WmFqMTXNloS2vKmviMfBWGZ/GIB/4ncUT7A0Ba8Tm+Dm6qiWxirlbYDZI+EgZuH8qffbysuwHT7tnpH1guggoXgN7aLTeZxUXARzZHMGx5kEWff1VgeUl53yN8VMIoXM0BH6dnlh1I6WQqu4KFfLm0Sgb5DRgHw3sPyqiQrL7ZC/cnhwzrRR7AlbmgM5RWM+9DqIlO3fuvijldQE5fCD44hjgiLbcuoZWxWAXAlsLbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiJDdqrr58YH2pNIgZga7qSfrthhGg1oqPUZVX8vdiw=;
 b=q3p9E9XxcxpzFIexHQvaWutR19eXx272BFtL5dJ7ttRPYGnDarJcxk5mw7QGjKDtrnOtNzjw7BITteCOTlWxnQU0QTzaPp6vcsnTHHDi/5lWFT/mcCSk77jCIcyPUBPHTtqgR81UTwhSe2nbDA8PzcAm9eUpt/uvGNEVNje7yThUfzuNKgyHFRk3e0PP/Rbx/htp/8zD13cmcQ/HLcsoPhtLVFZmOo0R11PpxqILX+97dny3hUDapCJGkLi0G2G6BMFKLUVC/9cTE7XirwJsUyAcjVtfMHSTnRPBPc+2K7Xd2StGuywf2npHknLlGtmHZN3zVHUcaC/kS0k/3/xNbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiJDdqrr58YH2pNIgZga7qSfrthhGg1oqPUZVX8vdiw=;
 b=KBN5DgAfg9aKkUF+4FCNVQSbcbPYfRMNYcoe6HWZBdKVSzdD8nr6VDrjtZtkHeER4XWySpsaeDufilqymDoXpPFhSJQjTKv+CtnawSeEkNH91jLvMgGZ5C/huG1HaZSuDzgeWa9GCvxiTivDUOyWMLI4IKLpBX48zcaJ3LeDr1M=
Received: from SJ0PR03CA0122.namprd03.prod.outlook.com (2603:10b6:a03:33c::7)
 by MW4PR12MB5604.namprd12.prod.outlook.com (2603:10b6:303:18d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 07:05:11 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::8) by SJ0PR03CA0122.outlook.office365.com
 (2603:10b6:a03:33c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21 via Frontend
 Transport; Mon, 28 Oct 2024 07:05:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 28 Oct 2024 07:05:11 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 02:05:06 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 3/8] platform/x86/amd/pmc: Define enum for S2D/PMC msg_port
Date: Mon, 28 Oct 2024 12:34:33 +0530
Message-ID: <20241028070438.1548737-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
References: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|MW4PR12MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: 40338d48-ef3c-4db8-cdd7-08dcf71edd31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WjX6kC1U5qxcIO9BxanwWcJTO1oT3s73vboX8+nVPMruoU5jW5q+zvpT4DA5?=
 =?us-ascii?Q?tsEPkGB1wd5sGoNZjgdBHZEK8kB/q6mUFs2/i5geI+rU2djTBe5bJw/rtaeW?=
 =?us-ascii?Q?B6W1205UFBqeIo9hgVTefEPFeLT0Aed0Y4lRoSAT+xG4Uw5rFkzO45cMNPbB?=
 =?us-ascii?Q?+Oh1w9yT8WbEmcfYV+OfcTOi0UJxIwzeiLkda1HgvJOrgXnoIaa7t5Hif7ZF?=
 =?us-ascii?Q?a42e26npH/PUEjdoCeMTA44KdKVENoICgVttyBMCEHhMAFCbNa7zCu8qQFVM?=
 =?us-ascii?Q?o9yWPUJfKm5oibUz1zqQCEdLuH9Nca1qqZVKhv9++LADBY8dowlvB3vD1wWk?=
 =?us-ascii?Q?qAodqgLogqGKqe5K8JawZO3Kzo+uOv7STRXz0Ys81+QcO1ZiYMm0zC5KpsBa?=
 =?us-ascii?Q?uA+OUbPBJO7BHFcP8NyVjAsHClT6K9JEpoZmrNXWfKC6liwxs1J9Aagqo0Gn?=
 =?us-ascii?Q?t5OM0bVunieAGv+yrE8AMP3QPrpoC4eeDjQyymC6B0qME1p4uzJsho7lGVQC?=
 =?us-ascii?Q?AtWMsBiShRh1tJHhEF39eRYyvyLIlo/JxaaQ3XfDR4IhmcXBlmr7Mw9TCjKs?=
 =?us-ascii?Q?/eGrCf/a640+XwVJZ54uRd0tlSJrI0ctOsa2pzq0IlF4W1dV113TvmzJYBKH?=
 =?us-ascii?Q?k7m1JGBFrCShlZ3MwUpeH3sl5khPYmsNUbs/cIGe+DnHVrQkWgSZ78CkP7zE?=
 =?us-ascii?Q?JeECGJxav+jpLsIaZnHJxl0mWqiHtKjhunVxOpE0Vra4qqvdAbCT++NqPR6d?=
 =?us-ascii?Q?PM1wyHxithvGmmT1Lw65HxTnaY8G00ZFfXA1BXUGF1pt0650eEApD+RVp5LD?=
 =?us-ascii?Q?2sbvJXG+EeArjpFhJ7umMnCsx6/QHCpfha1SZBoAG/fxonWrasLJIaYzag3v?=
 =?us-ascii?Q?TWCqiv86NNRzgzkEZ0t64bTU1CbUiaIqe6COwXLHTgTkJlk5YQpmLLy0DTxd?=
 =?us-ascii?Q?zXZgUSSFGrACtUhWuG/7mRzArbFditoLir9Qtqn3XQ2+PeTClPd1nEiAIBfj?=
 =?us-ascii?Q?H/uzgp7+LJGiHtAASMkhQjK2AkrAmSn+gfYjqzFsjDkHcaZ36CMveMy6L4/j?=
 =?us-ascii?Q?RhD0dZmmeFZQs0dtufYc7yEIkYBRMCSaX2ExczGOtaiYzAYiaBM4xDCToOKM?=
 =?us-ascii?Q?QWv11VRL2L+pCMs61Mz7xUMBWvJ/f8IvqKACOtnZvShBaD0gfqjz5eFdu0xb?=
 =?us-ascii?Q?VTyU60WQ+8vBOHQllVmo1SwsDSOnOgKioNSFGtc8HgnToyaYXS1fBOC5qfTg?=
 =?us-ascii?Q?78af5tLJWjpl892EuiB+nezKpiGj6bGi2rs0KjDYtjgO6NzPnsrPWPxDZMSt?=
 =?us-ascii?Q?OQ0cQnNvGsjM+QmZ/3RoQA48RGCPYghxBfqa23dqKy/LPMchPRd2BbLqKU4W?=
 =?us-ascii?Q?MHIiO3AyqbBPSCIYJw8FhyaWEMJ/d+yKnzUx4spyF5qvoczYDQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 07:05:11.0313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40338d48-ef3c-4db8-cdd7-08dcf71edd31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5604

To distinguish between the PMC message port and the S2D (Spill to DRAM)
message port, replace the use of 0 and 1 with an enum.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/mp1_stb.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index 5efec020ecac..2b06861c479b 100644
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
@@ -156,7 +161,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 		dev_err(dev->dev, "error writing to STB: %d\n", ret);
 
 	/* Spill to DRAM num_samples uses separate SMU message port */
-	dev->msg_port = 1;
+	dev->msg_port = MSG_PORT_S2D;
 
 	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
 	if (ret)
@@ -173,7 +178,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	/* Get the num_samples to calculate the last push location */
 	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
 	/* Clear msg_port for other SMU operation */
-	dev->msg_port = 0;
+	dev->msg_port = MSG_PORT_PMC;
 	if (ret) {
 		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
 		return ret;
@@ -266,7 +271,7 @@ int amd_s2d_init(struct amd_pmc_dev *dev)
 				    &amd_stb_debugfs_fops);
 
 	/* Spill to DRAM feature uses separate SMU message port */
-	dev->msg_port = 1;
+	dev->msg_port = MSG_PORT_S2D;
 
 	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
 	if (size != S2D_TELEMETRY_BYTES_MAX)
@@ -284,7 +289,7 @@ int amd_s2d_init(struct amd_pmc_dev *dev)
 	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
 
 	/* Clear msg_port for other SMU operation */
-	dev->msg_port = 0;
+	dev->msg_port = MSG_PORT_PMC;
 
 	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
 	if (!dev->stb_virt_addr)
-- 
2.34.1

