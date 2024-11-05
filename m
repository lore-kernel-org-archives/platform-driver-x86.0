Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2078.outbound.protection.outlook.com [40.107.96.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2461E282B
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 17:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828274; cv=fail; b=cfYLCYUmGz2fcLeOR1scfMA35tpelabnYyS0gJ2rQyAbkQIubPf/QhJ5cHOMl88l48b4Ugvjri2bMswMUSDtVUdAT9cpu0GzFoddgaZBEzQcq7AbXbcQGKAKhapdYd9DO5Jpu+qvqo4/8dqhBz4WPwXqH9c3mujiUP6L53xFnsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828274; c=relaxed/simple;
	bh=b72zcHwk7q03hJjP44NO6LkRuvl145hDxBstnDUcdk8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FOP/hVAcMTmBaaAWbQSf3S2CB1vcCzOu+A905Kuxx5CbILcj1nc/nBMnH30AhWx6qmJRmLKcvvgBzr1NBAL+MIvF6pmHsftsK/fxFjmcB08CJPQlfh0mMYIH8gWyNhTA8zrsUvA//xaoBSFZOl2Q1f5OZbxCDLzgnQlBphoorTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TL/FijFx; arc=fail smtp.client-ip=40.107.96.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TL/FijFx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KlH5/Qj3Hv4ASIjCvXb3D3pWvIq3hCKy07zBZ/pnKAYWDSzLKtPG0zyo4KkQD2VX0WH7W3qKBODgyxHwyu/wZ+lsZokUfZezkrKZAOgaU3SPZMx/bhib4Cbq9fo7gqIGtegxK3575lCSgdTYWJTWcjDEqkywTvH+xDWHdZ48chgK/r9P0sExp4pHg6GRbPkftJBP3ypZBLrvZFKBoxob7vboY+jt/MO87xO0FSjd9z8TkeYyg7MMKOKeDvZtYtAZLSCfYksk4R2Eta+voDwV7UHMk3OV1GWl6U9WEFXZ/TguZHGy+PBTDULZ+FCnhOTfmi7jyVxJVSRx9El4Mrh44A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0tmgwCc7Eyv6xpw9mpT/5HZoZfkuySfzR+aVRyGgmI=;
 b=tA4rsN5oVYGNqnOF2n8Bi8NCdFFqAXy0koTVr3GP8hmWXes36JoYGqGvu0d6+K4myweZMiu9DBqlVBMQSJOKgJbV17hgEBh+HOQo8Rt0LnxGUFVCGt50Cv14w1Wh0AJIB5Vyw2p0nSXU/LPwrm/5aRdT8KEhz4GLC79Fa71em07CBI+j2NBukSNMwk4UFb1r5gJOkRKhIXvmDYvB6zL8v5C5mTSMnTIsXqfmjtv4gad29niZRshvvkM1QhEBrCOgLhxyRd5mgJAbsDwIXxFjzfQqGQG9y4pGP5mGJM1tZ62BAkXqVebDYjHUjrGf7YE7OQaqaZdmkpXWTyBlpKXNjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0tmgwCc7Eyv6xpw9mpT/5HZoZfkuySfzR+aVRyGgmI=;
 b=TL/FijFx7xZsBYw/ZhvmdKQWicwAlSU2o48ck04POvUSfWIMSPWxcfJDRe/oydNqw0ClzrPL9X+tjLTXf1Vkr8hzZAc8PnA8AvGG/t3IjPzmRj1RsxqAyjsJq7eWwf3e8jtdYZA9+ZvXrxWmoaW3nl++yb33vmVxFlY6eHYjNTQ=
Received: from MW4PR04CA0140.namprd04.prod.outlook.com (2603:10b6:303:84::25)
 by SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 17:37:50 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:303:84:cafe::7d) by MW4PR04CA0140.outlook.office365.com
 (2603:10b6:303:84::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30 via Frontend
 Transport; Tue, 5 Nov 2024 17:37:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Tue, 5 Nov 2024 17:37:49 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Nov
 2024 11:37:47 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 03/13] platform/x86/amd/pmc: Skip Completing amd_pmc_s2d_init() on Older Platforms
Date: Tue, 5 Nov 2024 23:06:27 +0530
Message-ID: <20241105173637.733589-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|SJ2PR12MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 02374e09-b1de-4f46-2c4f-08dcfdc0917d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J07mOE8WTm/jOFSjKjakzJHtCS+3gCaEuIuRg8u1QPECFZhmDCrW8t3ePVBg?=
 =?us-ascii?Q?NJdJv2Y3ghxgFKMFNEskiOVXvyhv81XRkW3r86HaGaaNzELMEMF9LFDH2zqI?=
 =?us-ascii?Q?ApwMh5QPuQVaWOmmqfKV9h/tvXxjNNntigsflOMmgL+0/m/wqGLNKQI91bwc?=
 =?us-ascii?Q?nTPolDmNKqkmpnS6O95P8wuaPaojpQQUWqnnGKVPfdR9MVNa6DRz66p3QiS1?=
 =?us-ascii?Q?/sh/WFGpDF9W+G9E7WRqh6cUgX04bTrhVFE/Y+ii+21+4pK/wegE2Ujoqhl0?=
 =?us-ascii?Q?RXRtyZsupqXhhSCzqeocH6fWqSLKDdKuUwkkGXfhaGNYAnQwJoqEx9oH7PiT?=
 =?us-ascii?Q?y0zelwpojr1Eea60w51NTm+QD84VoypnMr5fCJyubtb77pzKSELbivkBoTO/?=
 =?us-ascii?Q?KFiWauTEXe97ur+Djb2GxcQYiiin2jfXjhQdbnCBVX1Ks16I4+pw5U0EZBDC?=
 =?us-ascii?Q?YUaA1Xdd70GqnrfMwPIECLHaSAZyDeHeFr251wypaFfzmJiAayxAcKZupUqp?=
 =?us-ascii?Q?VuYBflRoTtdexvwxHMkM5r+NTzOJ4M9wWJvdu9g6blhQ2gyBSdo/cLebVtvb?=
 =?us-ascii?Q?CotDllM+BNJdGUW0vqnZSAYPPbfi0QgZJI0tw4pcGFm+OoET+Npl2rnvWWvI?=
 =?us-ascii?Q?Ew1f2SpnhZfIZNTDnP2/zqDWDIpQKgCbhK54BuACTtlLtjZPDUiJ1ACTvNlE?=
 =?us-ascii?Q?LFfcUPJevaPzYk9l/oR/bQd4JJjQ0Oe/ze7O9zZrZhmtQug9936Uk7fRxUv1?=
 =?us-ascii?Q?6FM2sRVI/To0EFqlT0LAP3JvZionKjjcSTYcqyFVBG8kY+280Q9KxiTo90Ou?=
 =?us-ascii?Q?bhJOZILu8tQmYK1Cqwb9ARUTzz11Bl8HDV3Iu1wcToq/dAWjGW0THQNvJzF4?=
 =?us-ascii?Q?dl/QSICGN4t4NWOPXi1ZLyUMcBIloY6DpU4SxOiD4A7J+UzQLcDbVmUEnlMB?=
 =?us-ascii?Q?kyYJeK0T95vSW9hqPALSojIcrB84BnaQy0TkNNl/baUBFqb9E+KQax9t5fly?=
 =?us-ascii?Q?ALCVlgXandHIFF3we2TcCdJ35lv0fblJ++3VAbfjn2DGj8o2+cRtjAS4fycO?=
 =?us-ascii?Q?/JvXqPqvNTlKil88VuBnKG8+yI4jpAlhIAYOdut1krH6z/8tFDvLn+cxfPTG?=
 =?us-ascii?Q?4JEYy6fmSWE6Xa85py1toqcimzttrtowOuYw85gnvDoKHsGn5JiZYswbTfBK?=
 =?us-ascii?Q?Te71tpF3ZJH+MbGVMYWkIgZ8O7c/7MFXypoQKKBnHiF6E0PpJ4WZXCDiEjjX?=
 =?us-ascii?Q?ZnCZ++J94JhMNLYvp7GrY7Wd76FKmAS184K6Octpw5qhH5ObO+r2tWTOiVh0?=
 =?us-ascii?Q?LEfYgPVhjEkrOoJ8lmkkyuFi9k82LicMMGf4Dt+QZhhK3qUXbl+On9U+VB7k?=
 =?us-ascii?Q?qrAT9QTor41qui9hzeCBtLCKRQOEJBvrPmtcYUFBk3fjwER9lQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 17:37:49.4653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02374e09-b1de-4f46-2c4f-08dcfdc0917d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7943

For older platforms that supported S2D, exit immediately after creating
debugfs. These platforms may not support the PMFW messages available on
newer platforms. This adjustment is necessary due to the relocation of
debugfs creation into amd_pmc_s2d_init().

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/mp1_stb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index 6552617bd9c7..29e0241190e4 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -258,12 +258,14 @@ int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 	if (!enable_stb)
 		return 0;
 
-	if (amd_pmc_is_stb_supported(dev))
+	if (amd_pmc_is_stb_supported(dev)) {
 		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
 				    &amd_pmc_stb_debugfs_fops_v2);
-	else
+	} else {
 		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
 				    &amd_pmc_stb_debugfs_fops);
+		return 0;
+	}
 
 	/* Spill to DRAM feature uses separate SMU message port */
 	dev->msg_port = 1;
-- 
2.34.1

