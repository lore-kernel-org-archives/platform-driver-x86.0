Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE38D22157E
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Aug 2025 11:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755690703; cv=fail; b=GoNwQ86yclSvQEBD7M6To0E/Z5tYvBpz+Ke1IeGLhmvXwkmX7XaURVW0J6UPteBvXVWVkTBrYZVDGGGWSnoT5JlFIVtMqaI8CpNLy4kcxzWBYb0TQZ/TNoA0dK+BBFDku252k8msKjO4szZon1NmqUXhbdlJUHzslvTGHJyUCDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755690703; c=relaxed/simple;
	bh=zX+FZrq7YugTllIKBxJdah2obUv4HV+Pe3GdwXzOYxo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CH7UMcHX6Rz40rKfFgsx6WgLJS+tiTJK3vxkkJCxRECdx/NWyVKV/e7OTerC7qLGetRqePxP1foHOnwm1b2Z60Kx3K3txWLGdRhblcTfzp4X/KNKtT0c4HTgEXkiQzmguFSgS7cZbxSB1ByKqGPT2MPVcer3U4DIHUZKM8w1mXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JVsFSWck; arc=fail smtp.client-ip=40.107.92.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JVsFSWck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWT9W+qdVn55K6463WP2XZHIF41CIk3g/E4XrAVOTriDYAd5qwjA6+T/cZzZs88JcstG/1S4+pqsnIoAc86NDVO5827ftNJYVGQjaYGWulf3fpfoVSP4KuS1wCVWt8H1FzjLRWGWXeGs1ckuLycvvJMgo2zGclrJp/0SZ8IreFgPZgqedxMdJ8g6aFzi7kv+Vt1M08zEWPmwxgaTd58NU3kuiSGtMzlcig2BF2ZNLsV7BcEs5CkMpVIHEvnC0VsxExX2zH67PlIRCa4hpgNAyOS2R7GjBS0KJkYBApu3W5V5hr2iPZv7L02lHepdKOrzC60crEkmyODItjezloAE1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Df5ZJ5NmKbM4FqPAFltDpzSWLO0QdXWFNtmSnxVgmM4=;
 b=YR22LVqoGntiyBVpAagKUnDcgRNgA9wEW8JFXH4Aqo3M4INWGmJWFfZewZ1MaxfLOZsLP4tBLq4HGxvZhc+rrRBeMhCJ9at8yhNafaFxqGjYC8CodI+7uVO79fYY/k9V96FFDHGgz4dfeeRqSwLTKntkx1boSeBGtw+x9kUoyvOkpToKJw76exC645zU0hVqoRzq8W9l59SUSkj9Fdc0eDlymgyNJ+69jjXmOw8kvkQ+DswGyNjnh4ytO1BTeP5XfN10sw0Il1JMZ1Qq1o2MZqoNZNF4T8DEO9fFBlaCJ9tj85adA0v93RAXXDO3CPtoyE7IIuXoiZXJRvnFLQjsMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Df5ZJ5NmKbM4FqPAFltDpzSWLO0QdXWFNtmSnxVgmM4=;
 b=JVsFSWckmc557UBiSulSsZ7+WG2hHmy+1pTtSDnxQkPhzwzZ19NrAoe/ZlerUxTTjorCqLVc3eJmjkH2RrCOXNiXtiMM6WqfxxPakv5XQ8zu3g5tcyoBhLke0q/AAHSLZWP92LNXNG2eBmzGNXSFi3bhmQY8+1XJMUM3ZkpVFD0=
Received: from DS7PR03CA0140.namprd03.prod.outlook.com (2603:10b6:5:3b4::25)
 by CY5PR12MB6225.namprd12.prod.outlook.com (2603:10b6:930:23::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Wed, 20 Aug
 2025 11:51:38 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:5:3b4:cafe::27) by DS7PR03CA0140.outlook.office365.com
 (2603:10b6:5:3b4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.14 via Frontend Transport; Wed,
 20 Aug 2025 11:51:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 20 Aug 2025 11:51:37 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 06:51:35 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v4 9/9] platform/x86/amd/pmf: Add debug logs for pending requests and custom BIOS inputs
Date: Wed, 20 Aug 2025 17:20:11 +0530
Message-ID: <20250820115011.1448026-10-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820115011.1448026-1-Shyam-sundar.S-k@amd.com>
References: <20250820115011.1448026-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|CY5PR12MB6225:EE_
X-MS-Office365-Filtering-Correlation-Id: dee72bc1-4dca-4a33-5a80-08dddfdfeb90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xyb8Ld1jZpspc6mh94Jj+G1grhXNwwn/Wlz9rYLjPm3mbZx/blCt8zsUVMj9?=
 =?us-ascii?Q?MaV4UnD0Zt0fi1P4NFaODBsPPuvHxJZGbLBOxkDIH4c+s8pxCKT6ym6fdWAt?=
 =?us-ascii?Q?9jjOhD5r8ta+0Oc9LtL3pM9G9qhu7m+TtOlBBcU6kBnqTenyOZixOYerpcmn?=
 =?us-ascii?Q?dYsv7cBUh2jpU6pnQp0ZL096VEDr2QmUk4EdGDCydLJeI9QGujAknJfFFd0Q?=
 =?us-ascii?Q?PeuWltOrV5WlbQfqkcYu5sps47gujzRRbmmIZHgBgvD7AvN0J6TCDK+6YIEQ?=
 =?us-ascii?Q?eVh7iTtd5ZJjypk83to77Uldx/q8/4MDszYIuigawB9ebU2gu5AyKrMGt5/w?=
 =?us-ascii?Q?sKg8HiYiKOm/YJw+NGIirhoYOvn2PFYhd0xrGpV6ApIpEmT5Bj6oTdIHGIo/?=
 =?us-ascii?Q?ggeA6jzrZ0Zr6P6jFuTrD3CyWMpVpqlgZx4J3OgR3v1JOIdvhfy+SnGCeQet?=
 =?us-ascii?Q?GlZSVLkAgTbMPARu00/lI2UImbOEL9NAr/+wen38wZFYMYTSIAd7Z2klurcP?=
 =?us-ascii?Q?TZO+6nfoTjRsjzlkW6Dxs+qX7rvysGGIMapCaqRLWIEnCAln+u3v/985GFv2?=
 =?us-ascii?Q?vGqDYd7XGhKwHShT4W78Ko9IvrVau//8pLrpOXNwKwTX5ZGIPBeHthLcoS4C?=
 =?us-ascii?Q?EBz+dt26tTDJ7UL4P6kB5jj6+3fOVu0otbzKgZsVqVaOIWRvnjkpWZ0dhCQM?=
 =?us-ascii?Q?G6v0iCKYQvEphvN+FF6QY9WxhcTSXG9imAqs+GS/Lk09757DwZATlOPYoWhG?=
 =?us-ascii?Q?7dUj4rfOnOQzkg+TuOkb/6auAmfVJO/NpM4Ad5avGrza6T2gva6wBf6qTAvY?=
 =?us-ascii?Q?97qfq0vy2fNudYYuVPKNc/Yh91QgMsfhgptXTZZGPyKlCPfCykOkWHxJLFVK?=
 =?us-ascii?Q?UjcT6iEbdxMPDMTYY0xbMbzcIN3GWSTFvn/Bw6FCGk/QNSJK3uNug+viqIFB?=
 =?us-ascii?Q?w6Kv+xBezxKl4vMcOX/1yEvp85wvsR5bvotgn2w09UporXK0qHetrEjHWxKu?=
 =?us-ascii?Q?RdNhG3y0j22RZIsjiaFm5TR/sk3cWRgtP+KoYvMWi9EFhQAqcnNLW0YyjOVu?=
 =?us-ascii?Q?6w1dJt4U1gVS26PiC6HffM49dU9pZYGpwNOb2ZD8dBAJ9OSGlYx3rpZMwXOm?=
 =?us-ascii?Q?tdGiOtVBLBEJiPB6jOZTFlH5bWjRDhMI+uTwm3mZ2Xxcoj0qlPdneaseKDzY?=
 =?us-ascii?Q?J5G/Y92K44TicrIFS1CdPlsgY0oh/GEP2GZdm8K9l8j1MuN4ZU92aw6Jg93S?=
 =?us-ascii?Q?W5TE2YFSwLcsycelc9N+IRVRxT7znk2sgVTaq7Lm1pUQaDMT3cZyBlTlNQX8?=
 =?us-ascii?Q?P1ndNkixwfsGQrlmSwjGQG8O9LqLBKWE/X2L+C2UV1yCsG4XjlABlr++Mxd6?=
 =?us-ascii?Q?o+/tSYTB29mhtLvK8uHFoYrnGipZh+q+n3XIAKH5J3WtEUVo9Hj5JEcqYo9+?=
 =?us-ascii?Q?NKI/xSC/tREP5oOIpqzvrAFMO2hfCvz396JuAYvsbpk0gjOtmYssBAof3nyx?=
 =?us-ascii?Q?6oBQv3K0460wLj9kMCHBf8u4TNMxdXlS4WHP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 11:51:37.8482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dee72bc1-4dca-4a33-5a80-08dddfdfeb90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6225

This patch adds debug logging capabilities to monitor early pending
requests and their associated custom BIOS inputs during runtime.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 4 ++++
 drivers/platform/x86/amd/pmf/spc.c  | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 7f95a8b6c1a7..edb785325c58 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -353,6 +353,8 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
 		return;
 	}
 
+	dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.pending_req);
+
 	amd_pmf_handle_early_preq(pmf_dev);
 }
 
@@ -369,6 +371,8 @@ static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
 		return;
 	}
 
+	dev_dbg(pmf_dev->dev, "Pending request (preq1): 0x%x\n", pmf_dev->req1.pending_req);
+
 	amd_pmf_handle_early_preq(pmf_dev);
 }
 
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 463683860db9..63e64e8658ec 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -143,6 +143,7 @@ static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req
 			continue;
 		amd_pmf_set_ta_custom_bios_input(in, i, pdev->req.custom_policy[i]);
 		pdev->cb_prev.custom_bios_inputs[i] = custom_policy[i];
+		dev_dbg(pdev->dev, "Custom BIOS Input[%d]: %u\n", i, custom_policy[i]);
 	}
 }
 
-- 
2.34.1

