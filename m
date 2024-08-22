Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E8A13A3F2
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Aug 2024 09:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724320499; cv=fail; b=EDYjqfh6oaqkIyZs9///1/kgCu4vNnZj/5NkdKsMfQm7543bDlQVdsT4SIX3W2cMyVYN1LpTSDVK5fwGPMQeuMD2otQpMQCiQPsIeoxMruv0FbxgCF4DFikMH56bP9e3DX2wBEJ9EwUlcRkTAt8LSQIL9sHFRyQJ319YDO0oFYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724320499; c=relaxed/simple;
	bh=INiOkMJAzhuOrZa4gQZvFwIn10C7FgmyF8fuh3UWs1Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a9bxdpqgnJQsdheCIIFzClRSJu3KVC1uSeb+ifCrAlMGlw0Ei6TjZFXP+pnXx6PxKxDYUYVgXlRlHXQWLorql70BcfLSUhrrPT5sh/2YHFDScQvSAm0sil5jNKeq7nQAENbqZ/C9FPoI1xjDxIvSVkkQJF/rajgu1z4U0+/fw/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZV3BGI39; arc=fail smtp.client-ip=40.107.93.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZV3BGI39"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfjfwexV23MvqU5SxaUDPn/yqjopbqQon/aEh64QHtRgwlL5yRI5Zlrzf/Iazvum9cQTj6CPTaA+1kw6b7+FlohdAA7xbjC6SJMwUdHNypFska/8aJo3u6DGu4T0l/sIykvpTzTgcRjV/1ImC9cWnZV8oao6RojukRyKuhIHmhBmpEp24+dodUtNBcziTJJLbhmhqC1yVx29R4WboYVMsuhDwVgd8j20CvzbcDCuCKSlrENGEZIK9NpNKsKgHCdg8NHqn82DthlFE1yQGLJqSAIY/YoFews2AM9AK9Z3nHW0VUnH4+aVXd6QZMWvml9pZvRcuBqTsjz45yZ8SpWqUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbRKVVCYo5S3AnrOctbN4O4RtdYmL532QFxQPXV4y64=;
 b=Frbvv+ielmj9qV5aZs6jffDSQkqbYMhzRQiFJxk4C3+d8Hbb+aqNBp+WiVgm4BSt0l5t0L160EZf2birdl5Z+QBQjAa5FDB4PtAUHGfNZndmSHHpImP/zJUApuyy/nMlVMjazTCB6iuHpoW48VAr7dAlQawV193h/jglXlnQRN3uuKWtgtGMAVVgOfyxdjrxsnuLJnM5gBrxPev7+Xgnnqsc5L1EuV+GDIVBcS00LmUvjZerpGiGxItvzBJo85hpb2PW2eluqmuPVKYLhZ6YO0kSWhGNoyh41JRCq2t8f/l5env5rqAmvFYz7YzQJBf4IkP6cnCQ0Bq/1frWjzGJhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbRKVVCYo5S3AnrOctbN4O4RtdYmL532QFxQPXV4y64=;
 b=ZV3BGI3944r/aD57gAdRTKkI3djiLsawIupbIdBYLJlMl0laoqw30cqQko5InzEceCTUyza0EK1pjb/pdMjLKFPlvX/zjHb2SMFPex5z9qUO2k1fGvalRb1twq0QC/00KiMo5tkaRQfS2BMMe/ILsXFREFtqp5bi+Iz6QcGYySg=
Received: from PH7PR02CA0012.namprd02.prod.outlook.com (2603:10b6:510:33d::12)
 by SJ1PR12MB6145.namprd12.prod.outlook.com (2603:10b6:a03:45c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Thu, 22 Aug
 2024 09:54:55 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::6b) by PH7PR02CA0012.outlook.office365.com
 (2603:10b6:510:33d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Thu, 22 Aug 2024 09:54:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Thu, 22 Aug 2024 09:54:54 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 Aug
 2024 04:54:52 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/2] platform/x86/amd/pmc: Extend support for PMC features on new AMD platform
Date: Thu, 22 Aug 2024 15:23:57 +0530
Message-ID: <20240822095357.395808-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822095357.395808-1-Shyam-sundar.S-k@amd.com>
References: <20240822095357.395808-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|SJ1PR12MB6145:EE_
X-MS-Office365-Filtering-Correlation-Id: c3015b33-ec2e-4675-e268-08dcc2907956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nO+8VwImnVxf5CaPccSnE9N2LdGGTb5WU6p2N6LHludT2BBolPs8Ms2GB5VA?=
 =?us-ascii?Q?3sNnhtxm92+vpVZezwAVQ6VIdvg8DZ53dZELrPLTnvvhtYD4fw9HXcMNH4Gv?=
 =?us-ascii?Q?SEB864U3plj+LMEBV5YFZoQUotXXmwq6fEZQbX50j85alcYmeRMAo3s7vUOG?=
 =?us-ascii?Q?n4lQIeExfAoIHwNvx56UagqS/XVfszuD/A/wfLQmt8QWZTuNto4BG9zpjevz?=
 =?us-ascii?Q?8+B4KTzYLubHguB6YwG3idSBWwHZY6fgZjaTxqsmo8Bg3wYCfxeeA7+VgGwk?=
 =?us-ascii?Q?1Vjmr40n+N1xUKL25Ye9NG4mlBvt8ay0z3dpUnloTy9noZJ2tw2jBdH/Hkbl?=
 =?us-ascii?Q?wU2Djjc9nufKQVeSsH4X8FEt7kkXefFIYdSeBTpPTll+cFifegi4H45muEMT?=
 =?us-ascii?Q?X4mF9n61BVi7tukbz89yNWee39inUq7K7+cM6ich00KmdLvpje5zxJtIvMha?=
 =?us-ascii?Q?1Yq5VpJra+pL/lErZJW+mt7cqaoqxLYKIXRZe6P+fCqCBhDm9gEsbxVRfxbR?=
 =?us-ascii?Q?ToNQzZX7kjvyl6MaGS0GfojojO/lhO1XajOc3njQrIGGfiSFGk+LEXPQ6+YM?=
 =?us-ascii?Q?8fdRJ6LviwVuI1r2a3yS9kje7QrhcPzrdJ8+dA9qFX8PfU4oO/MtNBni6Kgt?=
 =?us-ascii?Q?SdTb1r5hFJC2TuRC5ZvhF5BgYABGlJOMvHJHq6Xjg86qGDzitx63kyIVNS4q?=
 =?us-ascii?Q?gL3HFS9nYeIjhMVQhyScv5ktHLEO9u8ZBDUC0ZQqJWvOXzqCsWRma4Bkxvko?=
 =?us-ascii?Q?VqilOH+SI3dpApNj9dekIHOr17K+uXdmrf8mwl43pY4VNkpb5YrpaPFvEJdc?=
 =?us-ascii?Q?Na7Q6YGOGTzuLSa3ABla9gLVZWhRzIN1e8v4ZAVBcmH1EbzI5EaKwXbGf+ct?=
 =?us-ascii?Q?+Vbw2e7GmIFGhUzNU9x+ChHqAKt4YaLwgRKs0iKcVP30dWvtWHfvcSlEp9pn?=
 =?us-ascii?Q?iMOuAq0MCc8g6EPJEQqje/pACd60c8KhRCc3vgNW5D/jQLqyOrnLWs2vhdLS?=
 =?us-ascii?Q?U+zNCtSvHbCIPiCg5+62A1Xkd8Qm+nPWJ8xPECas8jVVTB9BCb1lD2t03Zmg?=
 =?us-ascii?Q?4P5PJurHy4W603NvpdtHL0lMEpCoEu5eCfXE68sVToOqJmu/fMOzD/h0oFEU?=
 =?us-ascii?Q?ayDmyIZCOMKmNtOgzqT9eq/4WdLWvo5rzpFrzMW1J8A4indvceHnLZki8pc/?=
 =?us-ascii?Q?JJmF5f9bax0cwtnhup0ruiTXRKmMB0yIb43SldSTZjwOvnYiVBSQ3a1tN11J?=
 =?us-ascii?Q?JKL8s+t3khukkvPf1dbpwf0XPendit/wrJAKgASyWR/mpmQdri2Vfhnfp6zG?=
 =?us-ascii?Q?6ghVs5CtN3JMPvQP7Vej2AZz98sVUq+CCK1GdOnELvvl0INc03J+OThG0/vV?=
 =?us-ascii?Q?hcfpuFJsBlGJYy1Wo8MvQ9XGgAk+tR5Q356pfydaFM55QY2pQvkeKfjETvtl?=
 =?us-ascii?Q?A5ImmDSVdl/V1xR09Blg757VS6MXAsJx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 09:54:54.5646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3015b33-ec2e-4675-e268-08dcc2907956
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6145

PMC driver has capability to get the idle mask values and STB data from
the PMFW. Extend this support to the platforms that belong to family 1Ah
model 60h series.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2:
 - No change

 drivers/platform/x86/amd/pmc/pmc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index f0d389cf1ecb..bbb8edb62e00 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -598,6 +598,7 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
 		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
 		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_1AH);
 		break;
 	default:
@@ -631,6 +632,7 @@ static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
 	case AMD_CPU_ID_CB:
 	case AMD_CPU_ID_PS:
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
 		return true;
 	default:
 		return false;
-- 
2.25.1

