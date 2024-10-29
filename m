Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA79195B33
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Oct 2024 15:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730217327; cv=fail; b=exG1Li7ArJIjnl8Jt4ZQXfi6pcAhbbEcY86OofEVqv1yvY55nJqqmxzAILPIriSusGpl6V3bQTK2OiuoOxxgXni7pU999qBgyaCZjbGxP/izU/wwIHcLEFvE5Q7aemaZ4PFSI5J6dv44KaMF93a2KBqNVNvq3QwRMXsLO9rBjH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730217327; c=relaxed/simple;
	bh=ZZS4W9VoewGLxhSCaManuN/LEzpURITPpL9uJj26748=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nmsxEVv2bp9sonK7OKnzj0G1EyI2lJMgGlwa+TI+cRlFon/d9r/bCjrsf4zZyTIRO/L/GUfiwtxozYVPQJ871RwKgmzVqX/tRv+4n084OT5znXihZfL7SwCMg30YBSXnFF+tQKm4yb/ulti3bh2ZCdnWrAFUV1eOJx8iZZtlh/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3mWSAx1L; arc=fail smtp.client-ip=40.107.223.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3mWSAx1L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQ8AbruEYFzwUj81BvrE8etdnz6A2Nc1wZI6kEsCMqcFGVXVU4YmNY7gSuN5NFxV2TVzuvQ7jp6VcpWObr14blz5kYdD/Wg/cBGlE9uCZVjv9nF60iBTPHNgR3c4TQmRNK3IhomNUkaqOZleVRGPIuTvNTWxmy8xDjndZTlnoguQpqFEL/FrsyzUG/ZX/DttWAROkBso4cYHI97xbfznW14loQrcPTrbXvNWCnYX+9HgtP3wwNE6uUuYu00VS5nHVb2EuLtCHgXo7qEkwmrFCgDY5atFG8q7JuFsxJ+OhaeIXHrd39tRRLdaMH2ytxTp1/2Ci+t5v3W1YTpXMQy4hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJaVMVdC8F71A7WWJI4SOLxVtSQgx/gr8r4gD/2gXPc=;
 b=o5ThJg68vI6HPbeEGi55UqApvsVfQ7n3FAycWnno76v8TSpMbn8bd4fw2xoTSQQ5XaPEm/PgzHdSRgnUu9o4etEGbITm5LFgloD7q+2bC9HfIwRD60ELpgae5t/7P2ybhlmwfV58Zfr0xVhUWJ/SKgzSsQIAmZMBPw6Gl3GCtFH2Tuxfc/ohAB57St0eAjKoODERrFxEl0BxIdYir0CGHmhcTUGbDkx08ZMzcfQVUKPQ8WV73CWmbi89gHq3jjyf6IyMPahZTQI6gEpDWjzj57jSB7zDJWmOm6ocsSOe5/VB3zVHKrgiVuJv58PMmB1glnmz1c9el/g8ThG9wBaiMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJaVMVdC8F71A7WWJI4SOLxVtSQgx/gr8r4gD/2gXPc=;
 b=3mWSAx1LBmWtWq8K6i3/EJ+qH9u3eNCemQXzLfMWGYslWMdRCn6axbsLzbmaEYkJpx9HhmopDhSAHU0fvYz45P1dOvsPRPowjP2oth7QZ5RY0d9gEsYUKe1HECSO4xTuovHTSiT2DklFXCPllL1BNLL8Qn77auB86+WhiXnx/Vs=
Received: from BYAPR08CA0022.namprd08.prod.outlook.com (2603:10b6:a03:100::35)
 by CY5PR12MB6621.namprd12.prod.outlook.com (2603:10b6:930:43::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Tue, 29 Oct
 2024 15:55:22 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:100:cafe::99) by BYAPR08CA0022.outlook.office365.com
 (2603:10b6:a03:100::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17 via Frontend
 Transport; Tue, 29 Oct 2024 15:55:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 15:55:22 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 10:55:17 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 6/8] platform/x86/amd/pmc: Update S2D message id for 1Ah Family 70h model
Date: Tue, 29 Oct 2024 21:24:38 +0530
Message-ID: <20241029155440.3499273-7-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|CY5PR12MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: a0065fa3-b18b-48c1-d902-08dcf83218ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wM9TQxn+i7x5bzXH8RlZBdiBDQX9/NJOLs0d9Li31ai7tm16QCK3mblq+/6U?=
 =?us-ascii?Q?lW/dhXISZI6KSQOf1dODFl9TPLuqheD7xfzsKEEM4nHPpaexWOnb+NWHESiD?=
 =?us-ascii?Q?I0+5QKOcfX5AWvlY+DzfxwDQNeLbyA1eYx6+OYFIXIpOTypKvc6no+TeZStQ?=
 =?us-ascii?Q?2LrOTuT6CrdswU+8JRWBUZhDX2Rs7o3nUET/Ih/74ZWBKDdlBbxEFtyeQXG1?=
 =?us-ascii?Q?kJR+PJ99RBA3U2r4oibSCjaL/J9XS9yRnR59OTt9MtSkpx1HAinyJqRggpqs?=
 =?us-ascii?Q?GnMFlrPKEw+ay09aWcJBqun24TdaffyS7IyuBSurbPyMeFvZneD6jfjaELJP?=
 =?us-ascii?Q?GBunmErtcixwB++xKLDcKRwssqB7Vk47EjV8hmAGiizedaS0CvLpEv0ekm2H?=
 =?us-ascii?Q?FcZ9hGu7/eiu03g5cKclr45Jx6ICIDfjv7OLpK/ZQaYhEeWTKJZ9mA1SQvA2?=
 =?us-ascii?Q?4ZeG+Iu9v1W2602Gtq0VZmaHxEtj8Mpq0ThG6U2JqyMVgctSp76pLtxfok5h?=
 =?us-ascii?Q?1fJ69LkGTMx+ipC+UIvDw8QYo9pssqLVXnATaQTcfa1maXkUv0C7TEZKqPGp?=
 =?us-ascii?Q?PIOc9iqXM12Rb4NrxyJCRYzEQwHG6QjCGinJ6YgH7NCaPsGPlIgTkt+ZQI/+?=
 =?us-ascii?Q?EMfzHmZ59HmroDj5oaEF7K+8+RyQuykqmscmZMbKecIDgTn6uKuOux0PiOFT?=
 =?us-ascii?Q?inotDCWGqtJ0PaQP7qGriV6H8jXmNecEpwYTRhxTa3JYvzOS63dq6f8wHPiV?=
 =?us-ascii?Q?WPeHvvZvhCeY84s/QOfNVxmy8ka89PZTK4EiyuFsl0sEfrPU5MV9gern6oUp?=
 =?us-ascii?Q?FKKeoGeGo9LRy8KNOz6KbgwgDKvyCbtmF7cPy4p02O4yhzn+dLAClSLYFR/i?=
 =?us-ascii?Q?fbo4fnJffHMXzayA4T4vmGIDeMvkWICShKyl9p3Ciiy6/5tZWCfcEZuXIqfo?=
 =?us-ascii?Q?dt/LDjtlM3EjFjZWHOpX2aewVN9EiGDP7FJxg965nwU4G7TSkTP4271x8rL4?=
 =?us-ascii?Q?5t3gNWshvKnLonr2T4v2c09isZeE1t0HHY3WAP7zWNXwTcRa94NKw7LVu7RS?=
 =?us-ascii?Q?oebToGzvAemqT7XzwQny9XG9DsVYb6VowUfJIjp0y33mpNfBndQQym1UTgOY?=
 =?us-ascii?Q?ie3dHTqMBx6Ttn8Dr75hJ0nx6HIcctDVmyHbhXPPNaU+rWea6g/I6OSw0YCQ?=
 =?us-ascii?Q?wgJ1Fb77wwyaSBjJm3dw5gDrQN5MERqiHAT12wToZvwYqjmqhSe4LL6iFDqL?=
 =?us-ascii?Q?PrQVyYRK+x6UlLwCWCsDgPLg2/ibKXKehOPpRebMhsGxDJBUNcome6WYsmAR?=
 =?us-ascii?Q?u3pUniobyZDB6PhbooGZn+nBk2WE0NodGHwpMMu/R2PT6a1OHH7XR01QrHQq?=
 =?us-ascii?Q?N+EHn/ymmy555J/rxsSiLfb47NGE073262gHoZeACyYeZmid5w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 15:55:22.4642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0065fa3-b18b-48c1-d902-08dcf83218ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6621

AMD's 1Ah family 70h model uses a different S2D (Spill to DRAM) message
ID. Update the driver with this information.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/mp1_stb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index 1501793b9281..917c111b31c9 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -251,7 +251,10 @@ static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
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

