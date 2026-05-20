Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010035.outbound.protection.outlook.com [40.93.198.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A1F81724
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 19:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779304347; cv=fail; b=FCmFygTDvAFcGdP4SrsA/wsXnrNJAXXnkENmgbz7GIDtodcW8I7WM9bGRGlBIKlBujMbdUc/hRdkvt3g/jHgt5JI8E3BHnnjLvVUOjbF9kAXP1RCuLHI0dyXCFgRsrklyWy9swdTsFEduhtmZY7dYlkhAGowC4848mICy0hMxLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779304347; c=relaxed/simple;
	bh=ElcuZewl//WinO0uwrtE+dWQDalEMuVVXCgQhDvPgws=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kYORWeMaXFcAy2vSI1xlLMGbAyZfvImpUEd7jyXYZgKgevNfi1MdAgIhQnY7iUvPbSvVI/MK54fHj5TqBh7OT1ui2FnCncmeW4yEAoVYlYbgHLsIni5XtKzdff/xqQaWbxnLhpAzZRuET0vC5u/AvlQrMqvD+qH1NLKOVK/WbWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EdpYrcou; arc=fail smtp.client-ip=40.93.198.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EdpYrcou"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mv63y4McN4AzT25uHosWlXii3iED6olycXC4L7Etf9pMhnreDDjsspGYVdwsTAbcfmHO/FGsRvxNFak5nSTeUPvnGwuRnDq4qHZjp5pjFL14lc4X9Mnss2ZBK7v5bKFVIAruYeOAGgpC46vcpEAb3rg+NU+QYLdSESw+yyYqQnT8xkEpC1pWePYFaR/A4xieHGVVpJLgMiAh2zafijQScIsWK0owW1ZIWla0Pbt0+owvf7KKE3zukN5Jz5GMCy1/+uVl/FhczAP5u69v5B5qB/1lZBW72cKqyq1sF8MMf7U7e2NCowDTEi/H/Hg9B3sSOo5KyGr94hy9bGF04ylKfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJXje/RV4wcz9Pvj01UZ4dPOn0ALiUWP8mk3EpixfK8=;
 b=DMJKzW8SDG7nSXLa9ult2nqW58a/RFI8wJLgRTOhkneiz8mNA1Dr7vEeN77VXTNJJ1mwUH7jMNy01E8FSbRmPakwYA1031Bmv/ctQb3pHgbO6bwLhASkv4QBr00NCiqJNolXbik/3wc1CoV6qCnyD6FzX7YFfsBMMf/Y4nTuZ7bOjy0ZpJB26B/N4GHPgnluv1YOwuD3M+8cxiWLfA8bFW+oF7UI+MX6djnL9RvXXIq2/fA4/C19bjQcdmV5byB7N53ccf6kbuHvJdnMSiWLm0JGFCSQ0eXBoxWhMFso/H0Xx+8rc7fIWXeP9VTghQ1F0BStaSBL/EpvFBkHYt7YOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJXje/RV4wcz9Pvj01UZ4dPOn0ALiUWP8mk3EpixfK8=;
 b=EdpYrcouhL7kR7gK28syl9ySn0GZGrmvqwatnuY83aWGIFQA36Z1BP9t71UtAHObtVPkIvQdknKc+3G5RxW/7kPxJ2oBTRrY7VvaVTU4sk0iSvIEIW8M+AAJJQLhEve6Yxpz9VlDIGU6HX1tMIOAGMOVeNg6d4JVi4LARp3D+ow=
Received: from CH5PR03CA0003.namprd03.prod.outlook.com (2603:10b6:610:1f1::19)
 by SAVPR12MB999168.namprd12.prod.outlook.com (2603:10b6:806:4e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 20 May
 2026 19:12:17 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::79) by CH5PR03CA0003.outlook.office365.com
 (2603:10b6:610:1f1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 19:12:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 19:12:16 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 14:12:14 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/5] platform/x86/amd/pmc: Add SMU mailbox offset retrieval for different CPU families
Date: Thu, 21 May 2026 00:41:46 +0530
Message-ID: <20260520191149.773196-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520191149.773196-1-Shyam-sundar.S-k@amd.com>
References: <20260520191149.773196-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|SAVPR12MB999168:EE_
X-MS-Office365-Filtering-Correlation-Id: 600e1fd3-0346-4048-a94a-08deb6a3b52d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|22082099003|11063799006|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	fwpKxTm3zyKh/62QxfGIUyU2m58oiCJqRDoMPPAkWJNT8hO7V29gpVpeKwohuhN98cDmpfG+hyxlMwo5QCsIDK4LFTDNkaiVWZpxls+/VBfrhYovSJubeEYpyUx2gQVf2zYxEGKnwujG+oL2Ofbtzhlf6DagNoWxgdH4J/YW9uESBwfCBkyDif1kqitUQOOsgWV+WAv1kHgJ0p8yslDauW2ahDcBW9YG3cD0u25zG/MrALMZEp0bsJjuUr1QymlJaNzAzINe/cV7NRtoxthc7TvA2w6EwEKHjVZbh7iTk4dJKm4Q5XTTWqu/J5UkDfz7wGV8izBxI/iWIPO40f8fzypXLrvH+3m50e4+Rm76sFt6+K1a/6V8XlurXKU1d2i5VW/k+8LJHVl44wFT4A5XDzKt2N/zArSi3xvcMKWx7ZzIz0/MnY0woVV6RvwMnPPRkK9vzXUZwa6On3VQeJ1rd5Mu6EN9XTLuwX0V3SYHWIN2ylDalnSTfzO+a7ZleDbulOYbuUvCssQmP+jGSpIqNXG+fN61PQvvdvtO+v5TgjAT8alcQIt3I7nw0WAB8oFC7SkH0m5iqLaeVTUKaAf9x4i7ZrC53+FEGPrBx5kLXWkxwZhbzg1Y7jfHoJmrke6LZTy5bZkBo1TWxH4RaB8avaqJc+QoPZBxBs7wEfNHL3OxM4Dm13eaKB7c6Mkxk8TVlXQ8glkyMifePgQbxeFK1m42RoUv9PljqX5B8IbdvSQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(22082099003)(11063799006)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xOx5XlnmbwxF+zw01ymMSlHLNHRYaq/jYOnmivQlAcaTnnuUGUzdTozTlCjkZXjMOnc56XMv2wakyc2AAmJJYIbqTuWycv6ImIWoO2dx1y9hKqj6nuk5zJZBfM/uB09TV5/7ltdRvcH1uNzT0+1oOC4wPrUd96eINO4aP7bsMewGKvlWeZuaFyi90o9RCO95Qw1cgPZ325yBGskHERiUJ2w0nI94OMMnyjYqL7qwBE/qy76GBuWgPV/GxtwPI3sMY1o1L0g3uHVVvb1he+WR+Om8QS7f2XcnkQyeKxrHeX+7jktOsodZY2yIvMEdWx98zqcLOHK7tx22uOZrDiABKcyda3gIYK5DxG87aTcIAsErZvQ94B1q85LFWIPeJY4aDM3IuT/Emg3xhpUNNM7ToPH885zA8pWP0QtLQpwW93NWGCg98APleytSR4xwWI/w
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 19:12:16.8246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 600e1fd3-0346-4048-a94a-08deb6a3b52d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999168

Different AMD CPU families have different SMU mailbox register offsets.
Add a helper function amd_pmc_get_smu_mb() to populate the appropriate
SMU message offset based on the CPU ID during probe.

This infrastructure will help support future features that require
communication with the SMU through the correct mailbox address.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 7200f19088fe..7c80fb445138 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -101,6 +101,24 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
 	iowrite32(val, dev->regbase + reg_offset);
 }
 
+static void amd_pmc_get_smu_mb(struct amd_pmc_dev *dev)
+{
+	switch (dev->cpu_id) {
+	case AMD_CPU_ID_PCO:
+	case AMD_CPU_ID_RN:
+	case AMD_CPU_ID_VG:
+	case AMD_CPU_ID_YC:
+	case AMD_CPU_ID_CB:
+	case AMD_CPU_ID_PS:
+		dev->smu_msg = 0x538;
+		break;
+	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
+		dev->smu_msg = 0x938;
+		break;
+	}
+}
+
 static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
 {
 	switch (dev->cpu_id) {
@@ -111,12 +129,10 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
 	case AMD_CPU_ID_CB:
 		dev->num_ips = 12;
 		dev->ips_ptr = soc15_ip_blk;
-		dev->smu_msg = 0x538;
 		break;
 	case AMD_CPU_ID_PS:
 		dev->num_ips = 21;
 		dev->ips_ptr = soc15_ip_blk;
-		dev->smu_msg = 0x538;
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
@@ -127,7 +143,6 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
 			dev->num_ips = ARRAY_SIZE(soc15_ip_blk);
 			dev->ips_ptr = soc15_ip_blk;
 		}
-		dev->smu_msg = 0x938;
 		break;
 	}
 }
@@ -782,6 +797,9 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	/* Get num of IP blocks within the SoC */
 	amd_pmc_get_ip_info(dev);
 
+	/* Populate SMU msg offset */
+	amd_pmc_get_smu_mb(dev);
+
 	platform_set_drvdata(pdev, dev);
 	if (IS_ENABLED(CONFIG_SUSPEND)) {
 		err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
-- 
2.34.1

