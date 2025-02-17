Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2067.outbound.protection.outlook.com [40.107.96.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144F418A95A
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Feb 2025 06:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739775020; cv=fail; b=GFhW3fshr1PCqXejvkzxxQZbYgB/tc8nL7YkZeVj8pJIKpgITFyxIszxT+cg4WQWQWPvgdCKClPtuxqCz/YDTWoJFb2QZYN83GjdlEKBWPWi1wVUrye0i24GEaQUNC3PPLi19RCE6Olk7qFSalk7SBLwVf+qcgpQU0aYw8oG+Mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739775020; c=relaxed/simple;
	bh=Bb5ibDcvq1KCK4YFhK2P6tsMP4NTZRTDbl0qJm70+CM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FctjQi6XXJ0YrHrMnudDmi7MoZVoUwfIxD2TcTTeDouZwF1WAwguNW3+kHdaqDuw3wYGKDsyEF/sLXecdiMLhXNsQ0ytbUMNOih7e2nBuukrli2P0U7fqtWLDzLwF/vIt8CsLkMEyj7zUbkRfc95HgPBbFzI6RdaJL0xtpUsPlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2pi2vWYe; arc=fail smtp.client-ip=40.107.96.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2pi2vWYe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WN7TGykXDK8EpxIMCmVp0Vy/Imgxh/hcyJbfN7YE5WSFCoib6Sgfug3StIs+uxr08aUnagyhYn8ltac8PobF/zGU8bLS7aznhPqkOS98k7agBzxBpIGuesDZAHGJoNlXPjWxYXJLygSdCosVpkdW9Kug7SbwKe3879EpKBFIL8XXtcUvyNCLA+u6yMb+rgBNfWYdKuNbYvAOlELHpOoOZM9l0n1ipS9qtSsMiKdG1UI2+WLV4ejHsBzJXr3/Ysy2wDJuWkJ2ku7DcrWpTa/mulMWgAU6X7zGkHcCX2hGNhCGdzDxtw+DzzbaJg4dElROPhRlGBXw120SElWNNjH0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U33QHaHakDnKukXSdJ+2tAtK/wtv+27yIhk7iYKjgmA=;
 b=tIP0dOBqhA7Kx1rhtePcmC9wKopMqpwjXD0PbYpofQOoDIZzHPnIQkQJExJ+LnOpHD3OIIQjx2E5oP3bQQD5d7cxFE0a8qXrfhXgO6EMjrwsiyi7D3TH+w8G/QFE7RH3kqJXHGgp2vORSuoICJoGx0NapZDg9WqypFTljpGsmCY6o7uirbylO//RLSTIhFJC/Qb/1QNjdghgm2QH3h6iX9V0AnTza0rSY6xyJJM1eStel7bV4PF4q40Fp6IR3RAbDq281ZbqJ2estgOaPyjg1bka/VWewC48hUvh8zOXASJBjabR7UeEuBkgicMQaxs7hqs9BAyJzOpAlyrOZjLzTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U33QHaHakDnKukXSdJ+2tAtK/wtv+27yIhk7iYKjgmA=;
 b=2pi2vWYe9Z0JqX0Qy1DR4obNGH+UnMS7C+VB6hFJkB0EgAEMMIg7huOPqlryvN+cXfBtFa5Xwbc61D1p/sfFMwt5DkpuB4y4RaFU2yzUDSZhEdNtNheoPjebmqMZO203INvN1HgzCFHPuGk6gmowIupzNZpU/8r/6YnZAXwDwFA=
Received: from BYAPR11CA0106.namprd11.prod.outlook.com (2603:10b6:a03:f4::47)
 by DS0PR12MB6608.namprd12.prod.outlook.com (2603:10b6:8:d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 06:50:12 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:f4:cafe::4) by BYAPR11CA0106.outlook.office365.com
 (2603:10b6:a03:f4::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.19 via Frontend Transport; Mon,
 17 Feb 2025 06:50:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Mon, 17 Feb 2025 06:50:10 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 00:50:02 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/2] platform/x86/amd/pmf: Propagate PMF-TA return codes
Date: Mon, 17 Feb 2025 12:19:36 +0530
Message-ID: <20250217064937.98702-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|DS0PR12MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: 26ec10cc-d786-4943-0732-08dd4f1f52cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?49U3u7TbRr2uZQhAg9dCf8szLexWMyPeNeIql7HuMFUtg5M4aGkeFLOVBgI6?=
 =?us-ascii?Q?hgsQWn+HoRs5ZHw8L4xMhTLncMjchoiyBG/dIviSufI799rZGGyTYqsEzybP?=
 =?us-ascii?Q?NmCVS0Pe1iUukqMNy2QVIWaO7JpMGhBXsukaF7VJwgNnzhzP6ksn4OnhjCCD?=
 =?us-ascii?Q?q9aPiGUS3aSeuiLrvvTsMKYH4PFYJQye6mnDI/q7IsZCT80z3+baw+tbgdf2?=
 =?us-ascii?Q?N/wtHoMbj5mhTQIcMbgbx2Rc4QMrXQj3OzYUHt5mv/2If/0X1eOtqs+0BbNS?=
 =?us-ascii?Q?SgRxGb7yRtlEjTq66V5x/KIja6ua8d79aI14YC1dKiYlk2Wypcfc7DLHaY4T?=
 =?us-ascii?Q?tdawPD9+7makw44CAsdQQWx0+tHsd5vZsAirb5KT5OoKV1dtHkUSJe5VKBTq?=
 =?us-ascii?Q?aYc5BmzfvQCr/Gi+JSrt/N8gHWLa2aEy0dtEIvuSJar8/cJYAF7XdfZvTiuM?=
 =?us-ascii?Q?FEePmW3C8UMi6O+rC5U0Q4jAm31xlaCQCVoEBF5sUb9HjUJf7LbCJEA2mndo?=
 =?us-ascii?Q?MFr/48IlzWzV+iO/4bmdYqS0vJb2CfqFMXVSrrWzR0UztKQNOEfhYlgA71Hs?=
 =?us-ascii?Q?zp5ctquW/D4GmR3xQQqnNX5tLf101bXvz4QtQUjvsYosKwMLYKewQdwoXnis?=
 =?us-ascii?Q?R/4v1eHOpoNaV/wtohuNcgANnjAVV3qN18f2GA4czzeWPSvTk3/OXidIE6yU?=
 =?us-ascii?Q?uo+9Ch3l80wHrtNEr2mhiTIQ3rfGBms8qP4DkUZjjoamzJcqG1rGfYL8APLp?=
 =?us-ascii?Q?m8zbiaEbQWl6n0tPRcOQAaNXXM0UFIoSZcgomw4y1voCIzFbmHeoRAEniL0G?=
 =?us-ascii?Q?4CJ/QkmjMCKaXNSX+LvXfD7TEwefj01xYVzExHWu9f63Sm8PSOp81aOOh2/M?=
 =?us-ascii?Q?6s4+YxgbpCKWCkJO6Cen3U3LuTWSnqsgdpTDgqEofOzlE7DFNSXZLL6ZR2hJ?=
 =?us-ascii?Q?MIt99rJ37Rqd725RXA4v0yEeLV+k/KgR5d2A94mSm//fVlBEK3Mqmc8jIC6b?=
 =?us-ascii?Q?hazxVF/ckCCyPpaJD2fGgcMuohO4IZsa0vBY9m0TuOlUO7yTdV3/KOsqaoIm?=
 =?us-ascii?Q?mHYxNEy0PH7V6EsAsPASMInv9Yg5Bym/LQ3X22a7PdJ4hubAUQjfBYqpBtLd?=
 =?us-ascii?Q?hTfRpSDAl9FsEsLmXDm/3pQrnI7bhaHGV1m82OuzzAgHts74cnnUTPLusx9j?=
 =?us-ascii?Q?LUHC5EjWhYob0s8oYmsa4M6FQh7pUFxOZ+KuKWckxsq/U68V7UYw1BjQik6B?=
 =?us-ascii?Q?3wLNsnmaDFSH4oOc/t6o6IEi75CczkkmXYu0ZnkNwa8Cq9FL2HnMoL8pkJwN?=
 =?us-ascii?Q?/yKx3aAmR+K8gbdf5m25CHvXdYU4U2WemU1zfziBbtFIL6wGl2JQBSbuR0oE?=
 =?us-ascii?Q?YSEvB/oJJLVvRS6hVJ9LsdQnPrgSKSXSjmvXDak2HJfNIwPAsXkP3oqNsXdE?=
 =?us-ascii?Q?irh8ULWwZdMRYtCIxkUomhElqTuoCKvfA1Uzj3QqXUhUVwg3klolg58aEkmj?=
 =?us-ascii?Q?AHy/HYYcfdcEH24=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 06:50:10.6664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ec10cc-d786-4943-0732-08dd4f1f52cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6608

In the amd_pmf_invoke_cmd_init() function within the PMF driver ensure
that the actual result from the PMF-TA is returned rather than a generic
EIO. This change allows for proper handling of errors originating from the
PMF-TA.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/tee-if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 8c88769ea1d8..b404764550c4 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -323,7 +323,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
 	} else {
 		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
 		dev->smart_pc_enabled = false;
-		return -EIO;
+		return res;
 	}
 
 	return 0;
-- 
2.34.1

