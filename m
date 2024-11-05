Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147B115C144
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 17:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828291; cv=fail; b=UyNHvyS/+1IW1pbYeR8e5KAlepm5Xk8Go/dTNl7ph1fRfRw7x2L8+uRJKQBpQyPuvlMY3NIhMw5j5TNomqczOAI7HnExRD6ukuutxJ38c0r7iO44zwCgtYDRS33dFZCpDfzZ7Q7+HJdAxtE4e5XUvMpWwDHAXse2g+/WIR62T7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828291; c=relaxed/simple;
	bh=j0hmej36uztwUlNDtTGoYieRKUtQp63jgt9DaKAShYk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ULS20zw5TbyhtDk9opS4cDoq29wmi6qqUTtWCBNjj5sm6Frcxo8fesllKw+wkQOFat3CkrUsnsXxavvwhJH0dy0Ph0Pee5eUBrypHRtC2fshNhheLSoeDTrjny6GqvJenOtpmF8MoxEaZB9YHIJNTWp2TsEJNLhLWdSBvhjkr3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xE/qDo5b; arc=fail smtp.client-ip=40.107.243.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xE/qDo5b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4g4/OvAHJd/fKixq/Hk/Yy0sBLN6YiW1txKjGnYEUy1lwG8Hy4tzeVEFebQpWnuRSHFY8LMZ6g8wtnd4MJncOGtH8KDdeWG1lk2WwRgBxbY94YfQTluRusAcAQ2iwIVjBhqC1KgW7EeFBdWKlc+9iPAB+/bundxJD6+zeZpvNwbR7vCrWd1GtzspwYvKq4jEIFOQovuBo5AyqniTm5mnLJbO3L3uCmTJ625gpGWEscqxJKgp9S48QZ6Sl3yN8PIeLPAhl+4+8Os18Ahtydnl3Ng04D4ZoPb5q8QyiOXtk15ZXtvj1UECOJkCbzcjBY+nIbabuG0K5A3P+ooSqdB1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfTChAUA2b2Io7CfaKdaUj553UUzuSsDRWjKgn1kGEc=;
 b=pXWdcaWBLVAJbUbluMiXam7n3dX4JB5malmSU4LENiJJ/03JBxy5COZcuno8jXHYAUn9TOB6E/XUbDXYd23NllKcqO2QgCGpMirrbtt2sXmGBe1WcsGPYxjOPUYc8P8hE2dgbCU8Fvz60iad5EgpEIFSsnpx5ApeVp9Q4YS+7JmPaHe0XSMjtqDsl//YePd5Ej2RR3qHZHeZMEvrMZMQgLW68HgyGcgcqL7qRF9wq4+8xiPxcvYnDXJzFNFgKFtDe+NZnc1EuYSerRo4ph0qIilPLDd1PEcfOw3BOgyxRomEs+NDXcOMD8Gpk8qNmgzwf0yZvu0dQyMNNSBT7A/IYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfTChAUA2b2Io7CfaKdaUj553UUzuSsDRWjKgn1kGEc=;
 b=xE/qDo5bE/0sxTBnegzSTvv2lvzof0j3wC/7ATA/tE0NXPg69z9jDZuI4T82KVhKzmtSBOb/4wzHSKdXBlMI9lIQGVB2VpkJy+967mkez4n1w1W74zyv1itdOJetSJ/tc+ZQ5Yd5m1BL8mGpqqIE0Q4/YGZ6eAuXYGpHD7+h3es=
Received: from BY5PR16CA0028.namprd16.prod.outlook.com (2603:10b6:a03:1a0::41)
 by MW4PR12MB7215.namprd12.prod.outlook.com (2603:10b6:303:228::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 17:38:06 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::64) by BY5PR16CA0028.outlook.office365.com
 (2603:10b6:a03:1a0::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28 via Frontend
 Transport; Tue, 5 Nov 2024 17:38:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Tue, 5 Nov 2024 17:38:06 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Nov
 2024 11:38:03 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v3 11/13] platform/x86/amd/pmc: Update S2D message id for 1Ah Family 70h model
Date: Tue, 5 Nov 2024 23:06:35 +0530
Message-ID: <20241105173637.733589-12-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|MW4PR12MB7215:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f15cb0-3466-44f9-55b1-08dcfdc09ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nYsOrz+G7eoOLm/A38HKqarDYXExOIEl/ilioS/tn4RzI03gTmFCwmGxAi2j?=
 =?us-ascii?Q?HohH2DEoIc7KEXi4VNp8gAw4URywlg2yqzkt3RDSJDwdkomw+b8PJtaKmlON?=
 =?us-ascii?Q?Mq5TWqm9VVo96dSIjbATBt2UNC7b4fut+O2l21FV5Mqzt3DX16AGpVOWv6IJ?=
 =?us-ascii?Q?jjcK0XN2ZrcEQfT7xj5wVoVkB1zfoUf1dqc8aabpqfkDIY0jn2jyY4+A53W7?=
 =?us-ascii?Q?Y6fwaakAPKh5XD1qixNbcRiMg5/cGx8lGHXyMrpud6urmU4x0tVI5BY+PEkD?=
 =?us-ascii?Q?FakeOVxVCmE6B5DX/FQk1/Fyt3CPE7SPxM2CgymcqtRu6SDkZCfqlY3N1j0j?=
 =?us-ascii?Q?RjwCVJr5QODKuf/xUQo7WYaW1EEcwdcocMvLKHAGvBYpz5nMc0NChocJLkZ3?=
 =?us-ascii?Q?xYuay9Jla50GuLKtQTeGYqI3kW0/QHW+IxZT3PMEBRgK6ZjtoO4jLsKf7x0u?=
 =?us-ascii?Q?oHCixp2MTZsWLEMs0AaThz4Z0ORsZQWpzk/hKIm7MlyiElEsvf3w123q1Lrg?=
 =?us-ascii?Q?at/pqbG1R8JejMpYC3Z5J5zgEpZWPNTYm9B1ieb7wrdUhUR0XmefUnrGeiLJ?=
 =?us-ascii?Q?+13ZGdFanoX44pYL2bK8ZAXK5fa1v1Z+pp1/ODmlHyJULmhKDNimbJtREtcC?=
 =?us-ascii?Q?ZiIg7JPN6Z4ubAPnsC0jJa12ltsryknxK5Q/h7gxzI5bu4Jn3AX8fCN46tMv?=
 =?us-ascii?Q?a9iSngSucX2w/GscLrTuxq4QXSlw5Gq6Hp0jOl/u9m14teKNa5zNVmhZYCb9?=
 =?us-ascii?Q?yZQgVeiLXafj4jWdJsFpS5+dA84nj9X+W0JWKFA6FCNkLeCeoxdi9NbYR/0r?=
 =?us-ascii?Q?EG2iNglqVxGYixFFo3oGoXG0YvOiZSqdg2sAD2AeLTGfMeiEsDcuw42IUYQD?=
 =?us-ascii?Q?JQOTIRLmpW9bCT9I9KsuvWyNo9KcCD5V9jWVfowZyttIBxoIIwu/H/hVVr1Y?=
 =?us-ascii?Q?936oO6hAJsYN7R+y9lMPx39ez1KiU17ixXeCiqsLbx7OmILdIew/BXqqy5AG?=
 =?us-ascii?Q?7x0238rir1DPsCySOGj2X5DRNROGOmYKT9oYHNoDS37BYXF919+rJLvOzJu6?=
 =?us-ascii?Q?CnonlxBksYVFxoehQnrE+AJ7up62OGECroFL++R0WZG70KSzc3uAKgZvmO+V?=
 =?us-ascii?Q?EitbXCo9QZ0KgzDDu3m8o96pwLdFEmviXGa5zzGAW+SJvtZYocmgHKCe/7v2?=
 =?us-ascii?Q?5e6il5HMqBvSmmDt7QgXVnx7O6kAadONWoWjX3+amSZvdNnY2z1q46gHwvYl?=
 =?us-ascii?Q?xxGzM/xM5d+u75wU3GZ5RDO4p1wQiJ3Tevl29erQEYo9PRjgukExEf8IWuYB?=
 =?us-ascii?Q?GTsdfoGvPaC67uENIpw/yzImgvqu53d70RV1mRGZc+y65er8TnAHZdjUQxk/?=
 =?us-ascii?Q?PdYlQgAFosq+uF4pS+/5ZXlQgE1O2k2zazIgzcu8vIl2+BhR3Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 17:38:06.5057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f15cb0-3466-44f9-55b1-08dcfdc09ba5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7215

AMD's 1Ah family 70h model uses a different S2D (Spill to DRAM) message
ID. Update the driver with this information.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/mp1_stb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index 38729c9b205a..ed1723853158 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -250,7 +250,10 @@ static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
-		dev->stb_arg.s2d_msg_id = 0xDE;
+		if (boot_cpu_data.x86_model == 0x70)
+			dev->stb_arg.s2d_msg_id = 0xF1;
+		else
+			dev->stb_arg.s2d_msg_id = 0xDE;
 		break;
 	default:
 		return false;
-- 
2.34.1

