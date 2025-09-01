Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3E3244685
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Sep 2025 11:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724552; cv=fail; b=k0XjNKs12ugwdHpgkGi3+jxZeWGTOorMxH9C53ronLsEZfbGkwXNbnW9wXDF6tOGLnGcago8CvCUp21aSFP2/bvliu9FvtrEYqCoICeR/Y3K6Je3evzC1JRgGA/UJB8vSxPEgP5CO/dD2ycEbsg6RDC3M0qQSfU7J19XIuopVy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724552; c=relaxed/simple;
	bh=InVbot3MBtuEP6tm+6dDnaKJDIXr+lEWeV68mqZQiqY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MD2bGM84WlO3Ua0utwFH2w+KprdQiWXhrsHDTRerwLW0SPrqrM8GxcWCym914CsfoKrFmgYPHN57JOKITyzFdSUMWg5LVjIWDrlEU4px5w9Mg94aL+7PR9vuP1PbUD1oCXMwb5hSQbNvYOyAkR6Vx24WjXs0l7W/YfFiEu9sHRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gteJJtTn; arc=fail smtp.client-ip=40.107.93.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gteJJtTn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KpB/JFiVvnGZwcEUVrc0r2CLtVXjEfc5d53WQQRCEbaTxhXyG4TLzohc+ehxPBO0z56Zmv/EEzVNEjHjB8APe+M2ryvcvFOoqTnPuFOVtmRoXnF7LRgRYE3BRXwCx6jfIX+BLK6cajYgeyRtuk0tj4DzAv83Pz3gdNNl7voWxIdx6fkY7NOVW2Vv1wxHiLNxa7QfAMek9fHMat62RtLx+ESm7BavDjiDnf3+drpj7jeLCgVS9H+9NLY0thqCJn/mnsqO7oEiEPFheASm73s2/5F+kAZ/+xKVnGJipW/xdVwmKD3xyoKp25w9fBboQ5u9/WyFrXMmIl3vrM2xoPCITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1zmd6NP5L9PTHfAD96W9hCtAHkKtXHGLRVmEENL/b4=;
 b=zGadQH7NNLLx9YysONseSnz+NMmUf8Y2UZEq9U5odQQwZaO82oKACYNYGK6GjmHsSoBRlqIgZQV2YFHqa0Ltn3/EnAmme5D1zwA8jcFMC0HC8QYvWWH2ek1XuXlChOK+GkTqgpX4VQIPSP7f7y//ZKqhF73GpsXeSp2ol5mpdd0C4HCMb++A6wevK0Ph75aWBjNHMd46eK1PBIdA0NyTnnkIguXIQ74IVM5qrO+cn6dgEeDV3AHBDk9UO2dYxYa1QxpnvSLgOhHE84ZH6dxKeVqu4q0dMG7mWbYzYMaKml8u9ra+WXF7CPC87tbSPNl4tkGj90PQG1FjanTOmfAb+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1zmd6NP5L9PTHfAD96W9hCtAHkKtXHGLRVmEENL/b4=;
 b=gteJJtTnqNYbow+gRLfSJIUWfvywMObBY9TXHq5qRolmAbexSp/3lVVPrZ7b4RtmTIBAo19VVD4zL1lPtETQdWyJAI6q0+tm9KDYWU5bEmAAEwm/rJfElGYjZmlFlP0LGNjmxaOVQDeiId5bt3wq/SVvCVlAt/GC+6CLAXuaWCw=
Received: from BL1P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::19)
 by DS7PR12MB5814.namprd12.prod.outlook.com (2603:10b6:8:76::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.19; Mon, 1 Sep 2025 11:02:27 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:2c7:cafe::8b) by BL1P222CA0014.outlook.office365.com
 (2603:10b6:208:2c7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Mon,
 1 Sep 2025 11:02:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 11:02:27 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 06:02:27 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 1 Sep
 2025 04:02:24 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v5 RESEND 9/9] platform/x86/amd/pmf: Add debug logs for pending requests and custom BIOS inputs
Date: Mon, 1 Sep 2025 16:31:40 +0530
Message-ID: <20250901110140.2519072-10-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901110140.2519072-1-Shyam-sundar.S-k@amd.com>
References: <20250901110140.2519072-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|DS7PR12MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: e82e3b53-1da3-4c92-55b1-08dde9470a1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CtvlKZePvOLatiNqYNSnxsk1NDtybeOaHtloFQfLjdWbtv8qRYTlmjgkE/zD?=
 =?us-ascii?Q?Bpbzr+oH39wIJA07pDjZhB7gGzzVZqFGdxcvxIqE+EkQ77MzrNW5E3cqdoN/?=
 =?us-ascii?Q?W7kaj2jaFy6pLS+WJWgxOp9rC/SNQupPiRImTf+UYS1hmt1c6zihOQY6IIUK?=
 =?us-ascii?Q?5beJXGMm6K3NqNxDKm2gyNjxtzxvvqa/L/R9PISEmOH5CiSyvGcdvgjPb/Su?=
 =?us-ascii?Q?PGYmMs+tWbePtqacaBa/nJGguoECNY8V6yGWAgOobUBmsHHL5j1Bcm/b+ody?=
 =?us-ascii?Q?YahSfkz4ltScjjmAYciLnfI7orS9MvExE2kwwUhYIpNhW9TMFiGnlD1DD0cT?=
 =?us-ascii?Q?QSr/lmPp1NqtZPDGr+4EtHvgxfxZdiCD4mazlT/qtJtHDV/bh4sr17gxe1e3?=
 =?us-ascii?Q?6lP2JDTTz1tpSSwLKFBoU3AssqIymfXa1hgUeREn+BFQFTZVFmnxf4XFUEfF?=
 =?us-ascii?Q?iH8WrNo4E7QI8fNtmxTD7tdzMEKdKOwp0pYXLlRPFz/xneI7sHYySm0VxhPm?=
 =?us-ascii?Q?kxvFqrsZq8Yh3Rr68uF1e6K5+gomuXP+mD6WZsge9iq37ytyZoPVC1NjwwTq?=
 =?us-ascii?Q?1TbMWMrge7+YDoCdTjw6ZtaYY42HX9t+CnbqbN6a0wtRobEbcOJoz29grqhX?=
 =?us-ascii?Q?/DdO6VaUf4vzJI+caD18zF2gmEY6+nRsmHguXYZN6knlz9lnx3HMIGf2Bqb8?=
 =?us-ascii?Q?MYEDk3iFpQCGqguU3yBkWBe/Fj0SwtwIBtOuvjIliIcrT2DihJnLvOBV8jhh?=
 =?us-ascii?Q?C/mulVDRPBsVk6KQdzMs758fk/GK8oBa+Wp2eIVBXyFM/HE34T2yhismhJwa?=
 =?us-ascii?Q?2/PElmf6HqNFNq86yGdUKhe/jfUDeQQE/Y/xm6jIowp8SWlecIY11wEPS0Tu?=
 =?us-ascii?Q?F1LOe55AnTA4cRj6voXNLoHckIgLZYVN9oMv2OA2vWcc2r+QehL6W7evoeJ9?=
 =?us-ascii?Q?6boITleURZI2/7y8KfFJwaVQT4EEDytkHlpPF3R5NmOPAQKVxUsYfhwZ6t8+?=
 =?us-ascii?Q?JXgNp8EaWSGrmrPReI3sifKG736XS9J+r6Q9Tr0VWB+xqnKOO7tkQZ+r38/w?=
 =?us-ascii?Q?CJRTCBSJZ3MPPVf385j0chm5AHmeEYEmtjEiBJAdMDP4ja+02O6RtPOXa5XH?=
 =?us-ascii?Q?fehUwHwbEEmFHEAkrlIb6nnT/ozt/iq0sIhD6G3+wEXJF9PRUcLLOs0OZdlS?=
 =?us-ascii?Q?YsZXdoL2gU81KHbP+d7EO+mb8hvTGGrRxK6/qc0jn72jKaFidqWuZ1rWUKu/?=
 =?us-ascii?Q?kGvz2k+r2ShMzn9KTt6Qy0drr1qDde94QXfnzrQu7XYuK8msyHNjZUEJzttc?=
 =?us-ascii?Q?Y7gJwfn0lIwe8mkzvZkms4AYvcsOBifJNskhxWIJMrjmuwb4j+5MB9TcLqmt?=
 =?us-ascii?Q?IzYRCYQEzboa2eLgFQATfA1Uw6luYdKWWjY1HH6hW5lu82LJx8P8hueMlh48?=
 =?us-ascii?Q?sP6JAk2SjOlW6ROBT2nK7JEepbhk1YvJIi7KVDVauQV3KjWyHV+NqV2O6A1Q?=
 =?us-ascii?Q?HOJi7MFNqgUqzQlAf+P9WNqS1bbOPfXfXacz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 11:02:27.7813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e82e3b53-1da3-4c92-55b1-08dde9470a1f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5814

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
index 1ae2323f3197..13c4fec2c7ef 100644
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
index aeead2477a07..85192c7536b8 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -143,6 +143,7 @@ static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req
 			continue;
 		amd_pmf_set_ta_custom_bios_input(in, i, custom_policy[i]);
 		pdev->cb_prev.custom_bios_inputs[i] = custom_policy[i];
+		dev_dbg(pdev->dev, "Custom BIOS Input[%d]: %u\n", i, custom_policy[i]);
 	}
 }
 
-- 
2.34.1

