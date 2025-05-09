Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D39426E16A
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 May 2025 07:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775696; cv=fail; b=sDbCPczVTD4qofBvELmGvijfa7x8+13b4uTdfenybPxjEIRaAGYzuuSnn5QXRvt4cbp23lOv92joIGhWthdn3xF7b2C2/hk5XHqoNvvXWQdVy+HFS/ddVSNLgfMeKeE6JJC9jJ72szeqHJ1bPwlazueq4NuPEUhLPB025rQZL+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775696; c=relaxed/simple;
	bh=rIFheVGuQ3SMzGr2caw3inwGlZAB4ccIp1Krp5O9emI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HfJ93eP3GhJll3VB1bVxlWNR+saE03c7h3/4tLha/lIKTpbddVjjztFCMI3MJjOoYNv/ivtucw1nBxhsMfZWD3EOCqBqVRrAdNZq0zcz9Ad7Nlimkefg6GTdUm6kdyz0MVfYj6vZZIld2kchPBSgC4z0udrnSaPAxyOc4u3dbkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=c2b/eYYn; arc=fail smtp.client-ip=40.107.236.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="c2b/eYYn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVfbou2AXk+qttw6PlENPa2w3W1sCpXmvYqtruSqcuI1xiJ1jNIWB6JyhlcDfTZcVBZFk4YaMbnes/u6pMNiQvwz/WxhbrVxaBp7xXrnGxhddtlWyfVBJq5n/Dat4k/R/+FBj0GPRkEbSXpsWXxjnrh/ssAoWM9fIF/+mFzh3cHzjcR6S1WSd+n59UJ7t5Cjbp4ninQcFk4jidSRGQasHcwSyMowbVE7rKO9ZPvT0oYCGeTjbjRRXKzzFXBnsFGi1OYHBP64MOVG1snlILQOv0OBQyi1zgWRcN1JVk4F9aVeEGCzW64ur0j8ViKyxQBvMTJ1NxLRuS44t16PP6EaOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MmCxyucanmKvKeWRUrZiPj1WwzEBNXxpbdKBj4YZ1g=;
 b=sSE3OObW5V7zB6cav+Luug/CXoCJsxiGkY7vn54xwwWRAU2NmFATE8VKChAVnXLrpzphzi+j5UF8EqfmPGrA8vLzKLmmOjKKgXTyoeM9FdZ7GZwfItwkC7SmTLxXkmUypeVk8Tg/4rhtIHz/T5USHe6iIPpyCy5tv+G6cn3+sxFfVe6E0QZd00sw8E4dPZC5OeMue1OkS3ezjWODJFdPMP8bc83DOsaqGjBittXLjkEakmmLNqqOp21bgP2aQ/wtcf0T5YuxlotcSm668SDemjbKEiakGReLp8fcdoCwf1gxwC1orrO6kmoTmaQPSkpRfrPhwEMtHRHXqzek53hpeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MmCxyucanmKvKeWRUrZiPj1WwzEBNXxpbdKBj4YZ1g=;
 b=c2b/eYYnCkmSsOPmfYa7eOsyCqgSYmhOuYr84T8IKqXLOXqX7BJRjgiajMVsXzVWClg2xrT+sR2OgOUMH8YaOwujwZtQbSFlLfVfeBmdJw44Fek00/GBCZv9T4g7vxfZaAvtzaEvfoxRDftdraM6IvqOfigOJtZ3GhoDdxp+9HQ=
Received: from CH0PR08CA0011.namprd08.prod.outlook.com (2603:10b6:610:33::16)
 by DM4PR12MB5721.namprd12.prod.outlook.com (2603:10b6:8:5c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 07:28:04 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::59) by CH0PR08CA0011.outlook.office365.com
 (2603:10b6:610:33::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Fri,
 9 May 2025 07:28:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 07:28:04 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 02:28:01 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 10/10] platform/x86/amd/pmf: Add debug logs for pending requests and custom BIOS inputs
Date: Fri, 9 May 2025 12:56:54 +0530
Message-ID: <20250509072654.713629-11-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
References: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|DM4PR12MB5721:EE_
X-MS-Office365-Filtering-Correlation-Id: 642e08e4-ccc9-42b1-0fcb-08dd8ecb0944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uasx5vipm8YqDDLiZglKsAd4nP+ZbLzHS6Ww+2DvDTzJD8FJ7zgJo7TGDlVF?=
 =?us-ascii?Q?ohJqp22nRPkIZ0V9bEDXP6gsj1lnGF3xaY58lwGH+9X4oFZnX5Zm5zLPleDQ?=
 =?us-ascii?Q?/LhRld4D/HYElr4bCWiNvnr897syD/C15m6aA01Pg41DGXm9FFAmVCPwy+hB?=
 =?us-ascii?Q?HROc3d2DxZ0AakycJxpUKx2fYoIXjiDPqxMo219mW1dvb8yPrwTK0g5u0Mzu?=
 =?us-ascii?Q?FiTLeRuO5e02ckZq+Vj6IYl7eZCxiG9SAEOassOMDkFLie2IRB+3qtG4ffNW?=
 =?us-ascii?Q?Wqv3p5F79g2KE3z1okhAGd8VyBNM7aTZnw0WeFjxZJhOh3AMzT+BFvkjJCzE?=
 =?us-ascii?Q?jXEr+j+PL1txY9gOH5vUdh3QzeRrgJj7VDdvA50+pt95j+7IJab35BUZzQMy?=
 =?us-ascii?Q?QlGbiFczLozEX7ljSXsVYNxWBCo6avnKXoFPJof0/UgV/LgY6IRFOIuGXjkc?=
 =?us-ascii?Q?H55Qun+MWl5hxQkTvcpn6Ve1ni8HKST/BbtnP0IsMaSmAn0UgjTHguWEJ+Di?=
 =?us-ascii?Q?VcmGI20ikKouekXcXdGTnqeXydqqPu2Azy13qIm6mPiiwyXhJ4dfyutmkGP8?=
 =?us-ascii?Q?dYzfAYNjeQS/AvtydusxQz4xypWJbpNGldcQ8sDS264PZJUl09IAa9ZOVKMB?=
 =?us-ascii?Q?IL0NZrY6NMH01AFpUZ6Rq6rIaDCWMAqzPGFf10xIxAx1SrX3HvMVWZ3HxrKP?=
 =?us-ascii?Q?Orkos+OrWDAcX89hezHACVkVi8PZFfKroE2HgkrJxb0oWHEdmV/tMSEOkMoY?=
 =?us-ascii?Q?/lA3EqkJTut0ZC46Mw1ZejOVjV/tMrl93iV9xmx8TRPmDWAuFmnRIqhXI3XD?=
 =?us-ascii?Q?H2tnaJwqRvBgXI0hnAgEutf7Q5iYgw/PcY8cQTvuDwEg8EuBXnMgE2a/Vlj7?=
 =?us-ascii?Q?sjMBRHnRyH+RO0MjLnXw1z0RTr5z/aNdxOQsm+IxIOAGx3Qv5y2kcyZiyUiS?=
 =?us-ascii?Q?bdYmCHfnTyUTZbKTKtftiWHKQhk18cacGpN0bC4WIT9Uxo/WQPx2EvYk0sPt?=
 =?us-ascii?Q?dOcD7w853VtjlNymc52BX172IvCB26dEw9TD1E74EYp6VHIQzs85zHsO/J3H?=
 =?us-ascii?Q?ZLdhHrKE6OVVk1q9TRYUdkN+dkPfkwc+cUjaOmuS/EIKSWASLuPN0kMx8T71?=
 =?us-ascii?Q?ddwa5mxqakBsgANo+xN8h8DSb9PyzOHB3bF3pQ+8gRWdCNRX064j7yTIKPiJ?=
 =?us-ascii?Q?gbsEsScr4Z0o85qsMLc2GubzU4olMoJ4MBKeobbXdXn/Pghvsa4XUfFa7HCL?=
 =?us-ascii?Q?2bJDldsGshPHybaMdfh/Yqu+ici67UMArZ4NnkKMHNi0uK3rm9dfYYHUS5+j?=
 =?us-ascii?Q?xeLJwUs37zFgDPTOfUeKf/fXS3uhvWJnBM0nmLghMu5hOJANcrN6lhgzDPOC?=
 =?us-ascii?Q?/zNFTS5pf8DMWFX9oobtis/bsSqmFjYLmktIfc0/tzUGVcLXr7XR1+h1WdPk?=
 =?us-ascii?Q?oWVAnroDhkb+2i/rX5/7o7X6i5WsoZ44zx7P9mq3+OdZV7CCpmnq3GOTO3Sq?=
 =?us-ascii?Q?+Yk5ucq3MfIhfPxz0w5txJQ5EtwAVJOjf1mC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 07:28:04.0886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 642e08e4-ccc9-42b1-0fcb-08dd8ecb0944
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5721

This patch adds debug logging capabilities to monitor early pending
requests and their associated custom BIOS inputs during runtime.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 4 ++++
 drivers/platform/x86/amd/pmf/spc.c  | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index a3319ac89fd1..c1a5921e6ac2 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -344,6 +344,8 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
 		return;
 	}
 
+	dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.pending_req);
+
 	if (pmf_dev->cb_flag) {
 		amd_pmf_invoke_cmd_enact(pmf_dev);
 		pmf_dev->cb_flag = false;
@@ -363,6 +365,8 @@ static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
 		return;
 	}
 
+	dev_dbg(pmf_dev->dev, "Pending request (preq1): 0x%x\n", pmf_dev->req1.pending_req);
+
 	if (pmf_dev->cb_flag) {
 		amd_pmf_invoke_cmd_enact(pmf_dev);
 		pmf_dev->cb_flag = false;
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 8fd745598ad3..3cb93ab9b673 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -117,6 +117,7 @@ static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 *bios_input
 			*bios_inputs[i] = custom_policy[i];
 			pdev->cb_prev.custom_bios_inputs[i] = custom_policy[i];
 		}
+		dev_dbg(pdev->dev, "Custom BIOS Input[%d]: %u\n", i, *bios_inputs[i]);
 	}
 }
 
-- 
2.34.1

