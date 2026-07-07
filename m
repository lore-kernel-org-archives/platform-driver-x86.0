Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012034.outbound.protection.outlook.com [40.93.195.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9557878F39
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 05:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783402869; cv=fail; b=sHt8sOQmgz3n8j5mTDPFtOtyzUPJb7uSdND+2bJs+RAkoXsQFbdQ6EbLrG1Eb/RaFISBXJ46dCxS2CZ2LMTmaDr6rDvSnBojfb4DTX8rxKSyZzeSRflaBI2P+EApn8ovDaMTtRHt6nyKs3WFiE1LGtYr8SH6u1eS5hRgfUgxoAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783402869; c=relaxed/simple;
	bh=eSuwShtzHOMlp3OTzhOLLwDuWc0Vcn+8vRJdaQy+BPo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iPi0QoHp56TmkuWtDpKqKWNiVIb1NzWLTZm4NQP36A7cuxRa2MZR+3vDxvKTYxYs5Vz/sDDVJv7m3SxVQY/RvH/04KUSaKps/n8MrIxt/+s9Nf1JFepNdTyK/uakbxBkv8qDKcbVC4p40Qxqq2NcWDk2RiRAMW/erI6NKWEzb2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rJwAbMsz; arc=fail smtp.client-ip=40.93.195.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rJwAbMsz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3QXpaWm03E28MKlJaqADk3X9oz9JXngqq2+fXA31omeaAu/lyeOWYkujNvFw5PwP1tE0cxSN2lFZr6WwdUoXYKJrw7hV01v7tOYdMvTqR7ChovpCm1USK2vMRKbvDD2lzqz+3bQVPHjcSzjZ93CQWBbczoQDwAxlMaeXR+BRnc/8gwd/KhP1WH2I3JKBJEAkCYspWAnWDbrbpZB1vCA0NIZ/2mfzJqt4bJSge+cedGIe2s/2CGAfnO73aL3Kfros5oyZa5mbRL05ZnbiXFQPbU8JiU4VpwpIYWLnKUPGmWb25Pan3QLGR1IcLwurCEjgFes4AcQadY3Fw0Cv2t9OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOqYYp92baqGV8w93F2YycTHS2zZpBGLXO2xJRWC9Bo=;
 b=JC0QC5Eceq8i6uzInfYtkS/d/fiz3SUUB5umQgyg2oB+iJKxMCGuA9wyMMJLlWBqJ6JKiAFYBcQWA49ZVDa1akpJCbho5IhijES+ax1O5dQDdeg88I0bPDMbDNiJPPtK+v5sFHlWTLmTYoGQA8v+JCXvi1eHjzAa/x8LyBrxemSJiDsPj3EdM4RzX+W6EZKdtjg3mMYY4ckcvL+zeSIaVXskksBOFJ4dZoAaAvZTK3iHW96gR1CTgrIy5YWNx8mdBYN63GqKV7Tn3SLohCZ5TG9fUP8eF7KBfipRSA+xrLMYxrpycaqZmCe2CONJhfrzY17RqIWHIwEo7TqzOVqGeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOqYYp92baqGV8w93F2YycTHS2zZpBGLXO2xJRWC9Bo=;
 b=rJwAbMsztF3nX+wWkyoR6PD1Gkcnb24BOLP9kTc81+V95WqZwnVmUs1TTup/ZbcDrfwJKABjFS2eA/RlHMIO9FRWKpQzWJXSTp0tRQYA4M3JLVLm868zaaS22Ai2m4HquJ+rAuq7QjPTB8ojkSLUqCSocymKeqFYaVxGbK/xs88=
Received: from DS1P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:451::11) by
 SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 05:41:04 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:8:451:cafe::91) by DS1P221CA0011.outlook.office365.com
 (2603:10b6:8:451::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 05:41:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 05:41:04 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 00:41:02 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86: amd-pmc: Add IP block table for AMD 1Ah M80H SoC
Date: Tue, 7 Jul 2026 11:10:48 +0530
Message-ID: <20260707054048.69152-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|SA3PR12MB7901:EE_
X-MS-Office365-Filtering-Correlation-Id: cd57316e-3a01-4237-7a2d-08dedbea5636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	+wbhvZGCHRKGCmn3FA/j5lPByOfRsn1wU3YGE/rdjVyJqkp+6pcPX8cndC90Gl3DVHJWffDZJ/e7WWpN0VlZM83rBa1hlpreOjeocPdGRWB/ebeeLCWwuivYPdlESkCvx2KLjs6KUiSNyYVhcz5Qo6nyKNWXySymQ2wHuEslj2zBNeoQDaWH+J0uWyxBsApFqGCz/G76QZHm48ii+ZiVYekfee4QOcK2t4R5aF1qKWYY3D2wSAnPdM2jntSjXwQ4KJlSbk6UUH/za2B/bb773to2NFVyG51a22okIeNq8qHBOzAnEiRoYEFQ6GZ4iHZ3iQ1x67mxzfTxyapkedPQkhjdzW7smZJf5b+TFhR0kIPOu2DVGqduhSyq6rckntu992z5N+sml6yJkae4KOj4s3zepmanC69vtE/kVYh5FcO4fos1VbuUiLmbFbOor9nupimyMGA6NJDL1HDDwthklVZeEWmrQOk+hnLCNymIRG8ZsHzKSvULzDLtwfnsWo258dhG2n4zEMD8w+R26FjK9qtKgNTHiLx3Is/n7IpuGKVhiIDAK9jkYMuZS8ldUPN/fwAeWTfIuOVbdE+HkGiVWoqKtUVavVzPIv7JCiuk81Y6Y5xfF4Rbq6EUT2s7WeY0klphqvA68Po0AqYPEAtM9RSrrzmFZogUOuLtpdjSxn0sziAS2rqEJLIXJhnmpjEGjPJYOIcUT5Bg2OBR+XZa/Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QBfDA4OlriNW2btvgwjhkO/7mt0wOS0WF9rBonGZ//LcFDs/xy/tTtBu3Fta6cOywNQoR2f8dumplNIk7VRinXHPav2AdClaw1w3tGohVniXkTEd1PvWroY++3c9igVKOoE6LaJ8vsh36jLeGOVB7DRhIT6QhIqOfnJWSR4MFn0ncF0NwM0PsGIoU0uRyKPTN7QHy87beNGvs5VpNDR7ImzRjaSWmDG9Z02Xfv/TJagTMM++ziwLd6MU0DErMitLyk3JNwFLmeM0ndPPBpGbjDzI3oylGkx+qmK/PcYEyIPiJq/IqEf8MvJGfv5Vf6m0DUwHM+UvnVdL0MzKhFhYD7IwSY1JlrZDBJkrot6M+l89tFpMTuV3B3qXQyswcDASIaoN7N0RMr0PfV6jbtcoFYw3L2tfLY+HzIWiLjmB7Bh2EOZcRo4SXT9GK+UOYKDv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 05:41:04.7976
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd57316e-3a01-4237-7a2d-08dedbea5636
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7901

AMD Family 1Ah, Model 80h has different IP subsystem layout compared to
previous AMD SoCs. The existing soc15_ip_blk[] does not match the latest
firmware's DRAM export structure for S0i3 subsystem accounting.

Add soc15_ip_blk_v3[] with the correct SoC IP ordering and wire
amd_1ah_m80_cpu_info to use it, enabling accurate S0i3 blocking time
reporting in smu_fw_info.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index d50ea62fa2f3..4a5650f1a3a8 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -33,6 +33,28 @@
 
 #include "pmc.h"
 
+static const struct amd_pmc_bit_map soc15_ip_blk_v3[] = {
+	{"VDDCR",	BIT(0)},
+	{"VDDCR_LP",	BIT(1)},
+	{"LSOCV",	BIT(2)},
+	{"DISPLAY",	BIT(3)},
+	{"VCN",		BIT(4)},
+	{"JPEG",	BIT(5)},
+	{"UMSCH",	BIT(6)},
+	{"VPE",		BIT(7)},
+	{"MPM",		BIT(8)},
+	{"NPU",		BIT(9)},
+	{"USB_HC0",	BIT(10)},
+	{"eUSB_HC0",	BIT(11)},
+	{"RT0_ADP_HC1", BIT(12)},
+	{"RT1_ADP_HC1", BIT(13)},
+	{"RT2_ADP_HC2", BIT(14)},
+	{"USB4_RT0",	BIT(15)},
+	{"USB4_RT1",	BIT(16)},
+	{"USB4-RT2",	BIT(17)},
+	{"LAPIC",	BIT(18)},
+};
+
 static const struct amd_pmc_bit_map soc15_ip_blk_v2[] = {
 	{"DISPLAY",     BIT(0)},
 	{"CPU",         BIT(1)},
@@ -159,9 +181,9 @@ static const struct amd_pmc_cpu_info amd_1ah_m80_cpu_info = {
 	.smu_msg	= AMD_PMC_REGISTER_MSG_1AH_80H,
 	.smu_arg	= AMD_PMC_REGISTER_ARG_1AH_80H,
 	.smu_rsp	= AMD_PMC_REGISTER_RSP_1AH_80H,
-	.num_ips	= ARRAY_SIZE(soc15_ip_blk),
+	.num_ips	= ARRAY_SIZE(soc15_ip_blk_v3),
 	.scratch_reg	= AMD_PMC_SCRATCH_REG_1AH,
-	.ips_ptr	= soc15_ip_blk,
+	.ips_ptr	= soc15_ip_blk_v3,
 	.os_hint	= MSG_OS_HINT_RN,
 };
 
-- 
2.34.1

