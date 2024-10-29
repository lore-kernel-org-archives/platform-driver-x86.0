Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A085195B33
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Oct 2024 15:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730217330; cv=fail; b=k/X8r021UqzyrYSCsGqjnwppdS2HhZg44gD/Xa72hZQSN5BstkYJuUyYXiS5tAe0MQX7HQEmoj9Sedv65fpqR3Tfi/V7X6HVLVQjRupxhh9KETjQQrEhUmLYUwuzx+TIUa4wN01pdcVDV5jNzetcd5OLEtNw8+0bmfoeoTInlLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730217330; c=relaxed/simple;
	bh=5yQYGk8OyzyrAWmUyuXkfPVnie9sirTMr2j1FWiXScE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FWsDwO3ZTH2YVEPD9Tkhysxkasnhgdzu0UVVC/8A2mGPhogD6DtQ602Aqg7BvN0xQaa/sgM8HMfKcGlIIbofjlnXgSHbxhAvobSBzxtNp0u5pMnIYk9JXMgC7vFNWcNcbELya2A2JuxkRgrhkE0/gKxLcRH+JDdqsDQdKhT8N8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=z/9//CLJ; arc=fail smtp.client-ip=40.107.243.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="z/9//CLJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PtyCpn4HQLOAnN4BM5kkXOk5v9eBEt7WSD+a5u/pjsveCYfGa8JNtPHyn/KwqLAzQ6f1+7KejpWjciGoWZghRrGS07QDZJr726H0DUCThs8ObGtPY+XmXqElkfULw1V6v8lAcj66NiiCoWd1YdemL4x6CF9RDL7nWkQUmby4cPHrvAhRcaavSf5XOeJoLCo2Ny/vu6tdNJ4pFjWJ8IZJ8WsRClBP+ukULWWnpenwWTVUMyvT2BaSxFWv//sKbCKx9AyrKY41C4Pc0BNUAtmHLdH+hqFGt0/BAi/ZfPau1jqFK7r3sW0KyL4cARU9uJklaWRVYCshxmBz9Rd8FrZqUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRdHaIq9nrKgsDiCSXHk2WDkmwL6VFMgitQ6OGtgjq4=;
 b=jMCY/pSYrtbDxZ9bvCfcHj4sbALRCRzNzgu6Hbk6Nf7PVXVqpWws2waeVRi6mU3rZtBo2OUr/ye9cDJy0eQpsFxKa4g0IvP73i0EmYmrZg9jGweniesK1aX8bSOJG+ZX+qpxHQ+YYdX/GpuwiV+ols59DMQcYMMfe43mq6f6f7/ygX5I7rp49nVd2M8ZzLSKFAD1ds+PLqLgdGBds1Myer9xWxJHXQ3jYj2Fww5ZrvDw6tqTU7JILqP7SrVpw73OjrZDnZkrG/agO3JV5F0fV1JsDn8mImc4nX0zPrlkM37pvfUOnNyx8Ny+jjfQrXMa8A+tS8tfO998m4dHTfgVEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRdHaIq9nrKgsDiCSXHk2WDkmwL6VFMgitQ6OGtgjq4=;
 b=z/9//CLJCXoVUYXdGY5zDTgXIwWGOH1NwuvLLi4AbxIlLDyH05yEFn8oGJ4o/Y8gglfvznHrB3IaybGycw/kxXUo6yu7lFs8m42oiiJafRtoqL5CBqzloSezLBmw8ctsEIXqwoV1K1WSQbTm4A8vnU9Xgg90taDNTaUCMvl7Ggc=
Received: from BYAPR08CA0027.namprd08.prod.outlook.com (2603:10b6:a03:100::40)
 by CY5PR12MB6106.namprd12.prod.outlook.com (2603:10b6:930:29::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 15:55:20 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:100:cafe::63) by BYAPR08CA0027.outlook.office365.com
 (2603:10b6:a03:100::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17 via Frontend
 Transport; Tue, 29 Oct 2024 15:55:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 15:55:19 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 10:55:11 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v2 3/8] platform/x86/amd/pmc: Define enum for S2D/PMC msg_port
Date: Tue, 29 Oct 2024 21:24:35 +0530
Message-ID: <20241029155440.3499273-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com>
References: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|CY5PR12MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: 540d9070-a6d1-49dc-d880-08dcf8321705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h9a0HeZ64CSPNef8SCnCE32jcnsn7xIMigYSab0V51PiA3olnaB4OG4BQRZH?=
 =?us-ascii?Q?P17w6ftXVc9Ow43Lqbtv+kW7SKMk02kiTmVnzl8XH3EJ4+S23W2tnzQqFQuw?=
 =?us-ascii?Q?+opwdNT/g6dEsnpuR8MgYrgxByRfzmMTkJpPtbo8WKQm1dPMqMRapqHkZMvQ?=
 =?us-ascii?Q?OUCAFiVEypiFwMJsZExna77pfOiZozGiqgVteh5vMa9KFuZd7QlDAErYbD2b?=
 =?us-ascii?Q?fN+7Ac4YpfVdD/ebiUl8UaKG/xen0UHbZmjTuxkSkPRaUzdaran18yOIOCLD?=
 =?us-ascii?Q?mDY6+bAVHN9Cpn+8/6jU1iUMxwzmuqkNOWjxGTUMlARZm9+o9PexkVL2i7nA?=
 =?us-ascii?Q?4bBcuXGf0ThJ6z2IPSvxfdI9huoMpsN/x48an8lHaSeAJk2euiJOfbnDnYuh?=
 =?us-ascii?Q?dwS88ucMYIaJvk4jmy6CUuaOyI+GkYEJv2g+eicGb9BoTzR6IjinlXlV8+qn?=
 =?us-ascii?Q?lZrqvNFAQC2wFMkJ6G3cRaRMZeicwDLgTqXWypNR8leqNLgoYuWRQAlh/uHD?=
 =?us-ascii?Q?B7eDJAyO/ZorEqDqW2Teg4jXXmwN8mj4Ci6wv/thNXugZ4Ic0HhqaS7M9bFM?=
 =?us-ascii?Q?jUKQDgQ3NQD/gx9Q03k2FruGPLTuLklVZnx1ONwRvYCp1Wo/6regwWDzQ2nx?=
 =?us-ascii?Q?TDo+ZMejIAlKnIDdqZ3Ohc7kjGkf6jEryD15bBcBtZ8KxHSh7pUNquwMwyBN?=
 =?us-ascii?Q?dkayrzgYcMuXH4P2fjcUBQ0BU6VvGe+nu1Yn91qFqnSVD8EweBKKjf4wbKqH?=
 =?us-ascii?Q?Ehr+MMmMGRjuZ+6ciFKsdOzmIAELcFQs7K+M55V5T6+jF6jG3DGWIKYFUv/1?=
 =?us-ascii?Q?5aim6qOxE6BuzXQA37efsODWJEZBRMhqZHWjNmo1/02PKQLekuv1Ch61AHjd?=
 =?us-ascii?Q?Nkm99rjME7D1/aSlHbp/X7XJlqOKP+/Q0v1nbHgGRTGTvtU1D32rB9u1TSFA?=
 =?us-ascii?Q?kY20m6lUAl5PBEMXI9z5Ovv9pnK+p5hfaIZCvgU+3Fnu3uhbjBt2+aSBb1xu?=
 =?us-ascii?Q?k6ldZMJErC6gKPf90ydffkjW+E3ZS/wSCu+5v5lpBbfuxDoONKCe5JTylsmB?=
 =?us-ascii?Q?1tngX7hAuYoPEvfUfjsMffywcMPLjZu0QbPHzZmnu4TnhByHfa15a/JnoQpS?=
 =?us-ascii?Q?kCANWS3yGbSuZ01TH9LjfGUiMxX0fGg9QrsQRlNC2QfL8rfZN+aeP91Zvf3Y?=
 =?us-ascii?Q?LP/TUwAmPB1G4utssN6IaDFHfuVAwqHqzvd5Cw17y0LLJAODmeUFhpxeGQic?=
 =?us-ascii?Q?xOwTRLU3eFXN4YgMnmFzAo3rx/KSrIUi9v3Dzu/LHfZwn6Tas+Wv0avKWVC5?=
 =?us-ascii?Q?EUYDNIeEYFHXTDm+BYGfpBHAF83ZJF0LlVTOmMKiI1FrnzToZsVYOrMcLiB+?=
 =?us-ascii?Q?g00wOTOIf5yRw++ugzo0fNQfU2CJmbcHUsNc1INyiVpYjg/FIA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 15:55:19.6517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 540d9070-a6d1-49dc-d880-08dcf8321705
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6106

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

