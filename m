Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E6F1D0E2F
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 Nov 2024 07:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731049753; cv=fail; b=lzNY/P1mFvYfguWPZJFvXCb9yXgbKAAWpkDBcDjffX1nD3TE4E+g73dS8dlTh4IXPTqK9vEpXQF1+prFdy/9PqZch8IqPb3szAO8AsMoIwmZyjwKxpXa+72n6TCUOBPLl12gvkSw34ucg5YRcPmfsjq7hnqRGta3rmi7y4uUoj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731049753; c=relaxed/simple;
	bh=cFsiaEhIwb2M3eVu20QYprPIRN1wWm6CAGVK1goUbv0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MPAhnCOY6jnQS8lS5zqvqmF18YKFRyA3rx2kCmbmJHKyyD0rcFofwiMI4bxW0OMfYox66QaFDrTeSH+QzABqE8a+IQhO8Mr69B3pE9pzCj6Ow/JgxUZjIAkppzpafmFVYZruaqanr5e5tnoEPCxd6RpCUWEi3TnNIdwBvyYxSoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=feZTWTty; arc=fail smtp.client-ip=40.107.93.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="feZTWTty"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Viu6J0iVv1M2GBug9AP7qO22WOlmEmbylHR2nGXwi95RtWP0/UZa+WaUA5FLIorVpIXLWQBqq0XMQkwROiwljSZyWxsep1wHUWu5xxpBcBr/vJbG+NO0Sik8XrBU3f1m36MYUz3icuUqsTxsQ9VfGIGrX0u6vWs/0kl9L8VK5xuzuXa5WNR0SSfC942vliz/zBD1ce1bu1/KGyZxCDbbPYqsy9VvNgUYFp+j24Sl4zrW004IZXmuE25Rf1c+KE8TtiERyEuB8wdWlOSF0TQ86lr6f8UGg2MotSMJGuXSMC0oL+am75H+6yYKkqbqXlOaqu3gJEdeUgvFBIUMDhptrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DL4+wdjqOWvxvHnEjOfOLG3FPfrdAcLiqWxn4BdRdWc=;
 b=DhVBAAAes5OrIU4YT9wb4Lksy+IU312KSZtzTl8aYeoM0aoVMWqsAA7hR0LDkGmOagEaFtmhFkieytIjw/MBWunXxGsxNEWIVwDhGIHscob8xsYFHgLfty9Km87AQVLMGJJN9iQ7qckhcLJlIznqdQP7hcPtYyW8kehJ1rbDm91XTfmPuFT1Za9tnKF7zs7VcQ77O21UY8qjwvhLkoeuhleFbde4pj+rgQX4vXSLQHwM9Zz77R/7/LLJHcCK5eO3cEFrX6RBUPfBHta2gWTr9BlY1cdFS0YvtzXdRYpoUUprlCjlXoxdSs0Dy+CxYsR3GGUWmgnJIC2JNN5G+TMgAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DL4+wdjqOWvxvHnEjOfOLG3FPfrdAcLiqWxn4BdRdWc=;
 b=feZTWTtywBXLoJTia4H3Xr3xATkedOMKB9aCctvA0zQ5bFv4iBuQkIE8xIMB4EIpptorGssSeBTnhYtGrXy58I0cCPo9ZmipZ+Fp2RWRasmvui7xUsFsLXiKkSnoGr8lAlT4HPrMD3dDL3ou1w5RAmLI1X2fy+p0FkZK7ZDykmE=
Received: from CH0P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::17)
 by MN0PR12MB6029.namprd12.prod.outlook.com (2603:10b6:208:3cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 07:09:06 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::8f) by CH0P220CA0029.outlook.office365.com
 (2603:10b6:610:ef::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Fri, 8 Nov 2024 07:09:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 07:09:06 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 01:09:03 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v5 08/10] platform/x86/amd/pmc: Update S2D message id for 1Ah Family 70h model
Date: Fri, 8 Nov 2024 12:38:20 +0530
Message-ID: <20241108070822.3912689-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
References: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|MN0PR12MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f4a5846-cde2-4c7a-f9a7-08dcffc43c1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9wldJ6UmnqBCrT9KpFPLZ40g/9/YzPE9wZipnZVZHTMpGslOv0n09Jve9GrO?=
 =?us-ascii?Q?USJaYEk3isZtJBVletPLJBFth7iVeeIdj8T+2cad4OA02CWC2Wj+7Lqc3QqV?=
 =?us-ascii?Q?WCJduTMozWf+7JlGvT8+2mQElC9omKvIe3AW/WkwKhacw+50Q+LMZRKjxKME?=
 =?us-ascii?Q?YEKi/irU2eoDAG9V9lm88zjpokGZ5ZI+P4jA5umazBgY8+25MFc0aMDV34Qn?=
 =?us-ascii?Q?aPsqW25Wkz83xYWNqPBTmIahLHn6hWLTCOGtEdfFRUk9ctyCixgVmYxOYHTV?=
 =?us-ascii?Q?zjjbXigYlS4jjpj0hrwqzvBr9Dy/oTTwebCdtBGFpy6V7nW6pXHGr/uaOdN8?=
 =?us-ascii?Q?V+vA8+A87DdnaIuWAxT8oqi3nWuwW6eDfcS2PDmKPnlRRyGDzyFYSKMN9ONx?=
 =?us-ascii?Q?xVvhiY9BiIJpj637DaISZ68HPfncVQs2wTt2chZ8Wa+igcKs2uvBrt139/8i?=
 =?us-ascii?Q?300Y1Q4W3bmwlLMpyiqZXN0MDvbeii3tTwN1n2+k9+Zp7XxcMTBdVBZFj3xV?=
 =?us-ascii?Q?+6dfzr/2p67VCnEdZRlUEAAZaVSOxFEA30KxsoTQ03Q3hF6phGpM+J/T3DHz?=
 =?us-ascii?Q?iKJTsIPP8ifK4f9/M9Ed5IBLnEYK9UwudSNw/TJ1jucWXh88lKogsfmwo0aL?=
 =?us-ascii?Q?4pUUViDx8cvmKwOZwDf49+Ed5pukvBeSeK3m9a9UoI6ScL4TdpKM0foSKby4?=
 =?us-ascii?Q?iVnQag7Qt0CyF/XjgwkU4Z55Nb/ZGbNxa7xTB1BBAK8/fQTgomaRdpkyZTDl?=
 =?us-ascii?Q?540pUmK6z13uwZfkFp0wKtrk3Dh4koaFgxfXZD62aySi03GpOFbBl92xDtrC?=
 =?us-ascii?Q?L4trZJCm0aCFlKztNwizNT9lB5k/Kj0DxzQotblpoxNqccRy2icuskrSUG4A?=
 =?us-ascii?Q?SNcPgTm3u0G8h3hBKEDCyeuNOaPrthpbpq1NuXbGo5EvTpPkdQpDCuVfeK3N?=
 =?us-ascii?Q?ubSloUiNpIuTlZswjDEDOHls3DKrQhtI44+h+tNSrrKktQ03DqhiDJLohSew?=
 =?us-ascii?Q?iuNw7QCHH3Ih3tUwdqaCDp7Nc1wSWo6TBnUmA0tt3KinVlQvZnWSzindJYVu?=
 =?us-ascii?Q?VsUcKkwu96aMCj9iNrFhMDzIkLZN/FHp+Asj0rxrWd8G/uo5rN/kPhAnv8k+?=
 =?us-ascii?Q?LrN4S2oF7mk4LshKDWPfz+8hXgZyHN0Y+QNFITouvL/wsxXELJRTLHAQO5gl?=
 =?us-ascii?Q?EoMbZnDUKviIcmvteSOjCdXi4EQMNO8Qw97XxHWydi0PptrTBHFBv3lD3wsM?=
 =?us-ascii?Q?PSxYBUOiLIEStX9nE7YTVJLx9rafDdzyAzWxDHsE3CpAzHdwYlrwcHZsNqEO?=
 =?us-ascii?Q?IdUbPb9nwgdcCtgplH2AoU3aD6R0Pqs/MsyJeaBldiQ1Nstrh0iVEwLTTRrk?=
 =?us-ascii?Q?klZTlzcngruAQQL5Dl/JxIMevScKquTheY865qlYruUqjTbS0A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 07:09:06.6388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4a5846-cde2-4c7a-f9a7-08dcffc43c1f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6029

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
index 6a54dd3e7f4c..d19a13a82e1e 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -245,7 +245,10 @@ static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
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

