Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011064.outbound.protection.outlook.com [52.101.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7140881724
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 19:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779304348; cv=fail; b=iK1nJYqZvej0UrItCFgb6hsM+H4dCBuU1d0GOudB3G15yRJAYjZaCeFfzADfVsWkIvAc1L7fKEBCq0+NVKsSDYcKVWqzWRTWd8p31clX+e3O0J/nMVcWsCqMd6CiN8JMcJXGedQlX70PbpTVa9FirFs3IMDmousebGikVcJ4X+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779304348; c=relaxed/simple;
	bh=9Swy/0j/PTA0wsA1Qbf5+Ri1lpdYFr5shLWrzokrjaY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OzDit/GDF5l8VjdazApm/Yc6B300YTaZbp00tbTXBcJ8ysRsJbtOKJRxqQ+4ObUumbLVwvK6NBMIrJ9hUzLKfMTaqk1XbH5SclKbMmjepqEIUgm3S+ejV9gdHvAujiJ1xvn4rWsAlp4G2vczbQ798eqXTQY2tvaKjri3KIhv++k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DqztPcK1; arc=fail smtp.client-ip=52.101.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DqztPcK1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IfdeHI431cOvL6nbmNSg+G5QFtx2lrbaFxcjq9fY3HvdT3/OTy9DcD6BWRK0sDKJBm7QMLyXBH1L+kgLnPCEQDZTt2d2V3kh4S2nJZTOU8iTgXYuogjRo15JsVE8RM6GIr+iLlbs5SXjS+zdNnUn5+ZiYVsqdsqvehz3ugP/D9IgATZZQr+HGUfpJLi7LqHq1jZmSdgAHitdQRN849p4auDO4mfsPhxMYJ8IgvP8EpqREePqzpzmWnc9n/G3awAAPefZh34oAyilO25wfPfUYMDcCW2xBSDBDeRvpHrCIYJ3pO1YXOlOYvdx2cUBz2x7+okh0U72pUbqw3EwJZHVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TclLsuib8ru/X/FzXVFoE08P7Tpe7FfCyarOEJi7tcQ=;
 b=aNZOaxUo0wZ3cQOl06pthqRe0eBb0DhxHrWep0wdgLpcmUEX4dxbjIOnoiS8r1mhDozV9VIJEAjA4djdxco6a82KuF0zKOKQs6DWz6tyuGOiGsH795io2SRUau5oAWpybNutuvuv4D5ZtMgqVkJqzRoYf9ldx7O6iWyDdJh/MnZMZFKStyCkeAKbj2gkvQjXMlpoLPCZTvZ+SFWOizvJ6YMv6E8Lv5q+VwIzAocsCIomuoQgYSRdAoOphNf0/rI90kXsNcFcgPg+jw4fOhnORlh3fJ77ngTwaWGNAWuIKr54XiuyvI0LBZi3ueXq77dJg8XjXHpfnx31TfV46cfUlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TclLsuib8ru/X/FzXVFoE08P7Tpe7FfCyarOEJi7tcQ=;
 b=DqztPcK1K1Cv//lt2K2nqcF+cr17oB+ibiJ1N4b1z0v/XHpWwudVZHuIqKXHTgZAfTVO9a6U3TDrIPK+9+OEW75S6+NNu8mYu96Iv1HT/DjN1dvrzmwgsksxMWmm4QGYs9osXSWbkSZuonEbPVX9CXrJqYPkxDOxkESXdZ12i2U=
Received: from CH5PR03CA0016.namprd03.prod.outlook.com (2603:10b6:610:1f1::28)
 by MW5PR12MB5650.namprd12.prod.outlook.com (2603:10b6:303:19e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 19:12:23 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::a2) by CH5PR03CA0016.outlook.office365.com
 (2603:10b6:610:1f1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 19:12:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 19:12:22 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 14:12:18 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 4/5] platform/x86/amd/pmc: Add SMU register support for 1Ah 80h SoC
Date: Thu, 21 May 2026 00:41:48 +0530
Message-ID: <20260520191149.773196-5-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|MW5PR12MB5650:EE_
X-MS-Office365-Filtering-Correlation-Id: fdea1eb8-2f50-49c5-f757-08deb6a3b8c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|11063799006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	j5MKipLXoTIkDsoVVM6WxHOviZknrV9N+ij7T4rCCJo8pAR6zW+p5La+P8R4PD8vCsLZzPbXfFvW91cwhBjoICkSbJz2KtrVjxZ7AwMMuVMYXV8mcuBjOAm1tLUGeX0T+/zvvyqAuXxGnw1pAVoYvxH3Y4YIzrBkgSk28YS1d/nQMPxyAQ23U9cHqjVb/6wOeEa22la4XVfDdKovD04Mr3jDvjBE4923boSn6R16w4xUwBzKzW7dpodcm51EwX67a0Od3QP/kwAMsSBybDPTeTGWAx1419zjmTYWZ0z+Bj8lgvodceMJqfdkcLU5/oTAcZcnOk/g4f2uBmuBKFDKw6GtTs3EQSxucvkNlZCvWhTLh4U6oLqW/bYfdjUFhq3li+z8R2NLnwZR/A1/FoRtKNfhxWw9m+p1dUkBafWneWn6rs/Vo1ywVL58kvKwlgBbo0pTyd2zQ6kpwD3C1XTziay0e5SuZYXuKcCirhcB/L4pDFh0w/2uyyrQx3E97xmhngL5ogAH9YZ44asWIkzjLoJDqiZzcwbXXDeHDeUXhad2bIz8iQjkMlBpgf7zNuRxV4WIMqzy/UobkZNljZTA6jtMhx6ouhAl+usT0ABcwv/pU5nDoXtjMfv2SL7mwei1XCruMCJhSLL7lmqI2qiPvFiQBta1g1p/5wcUhu+paVxkRGsCdQyTkCiaiuVDsgBx+FqaqY7ATHWsiH0mq5yda0L6ocOXdyFnzpkBfC+luT8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(11063799006)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uqwhVHKPTdwm5GBf/kMfrEb0VlQ1gYax17Q8XrdG5nRz6xFv8r3ArYBbKfBhgfiQ3lEgIDFGEsY0UjEzlNP57CVL36tQMZdXKoS/LtzKZET2NDOhDSabQC+oc5TkxrpCV2xPffA5JvvIeF43gOPgsQPcedsjBJc7nbvYgquT1X2RxJLDPNP8/M/gNpXAhqzUV429vMqxZvSDoQ+Sqh+zMfagY3wfO4OHlp+7TY/AFZVjltoYhPx7U/oXVbmTG9bqPz5e4nXWVtgiODQOZcDT2jN8W2gUODxqxmXbJ1NrSQiaxs6YGl67NdO3kywUcwcDJL3cbfr9BVnViLutF4zyB9+Gel9+mWW0W7i3l2X+/wN1e2j/n0kyXS3IWrPNTQ2pOto2ILp1UhZf/C7VuQHBFFebNMa+yjPXW/8+PYjEatHqgFI4li2GscLxwrUWIb8T
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 19:12:22.8367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdea1eb8-2f50-49c5-f757-08deb6a3b8c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5650

The AMD 1Ah 80h SoC uses different set of SMU communication registers
compared to earlier AMD SoCs. Add support for these SoC-specific
register addresses.

Update amd_pmc_get_smu_mb() to initialize the device structure with
these registers when PCI_DEVICE_ID_AMD_1AH_M80H_ROOT is detected.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 5 +++++
 drivers/platform/x86/amd/pmc/pmc.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 55dc88c93614..9620b7cbd371 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -120,6 +120,11 @@ static void amd_pmc_get_smu_mb(struct amd_pmc_dev *dev)
 		dev->smu_arg = AMD_PMC_REGISTER_ARGUMENT;
 		dev->smu_rsp = AMD_PMC_REGISTER_RESPONSE;
 		break;
+	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
+		dev->smu_msg = AMD_PMC_REGISTER_MSG_1AH_80H;
+		dev->smu_arg = AMD_PMC_REGISTER_ARG_1AH_80H;
+		dev->smu_rsp = AMD_PMC_REGISTER_RSP_1AH_80H;
+		break;
 	}
 }
 
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index 0c3c31f73fdf..425ceac3ad72 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -22,6 +22,11 @@
 /* SMU communication registers for 1Ah 20h SoC */
 #define AMD_PMC_REGISTER_MSG_1AH_20H	0x938
 
+/* SMU communication registers for 1Ah 80h SoC */
+#define AMD_PMC_REGISTER_MSG_1AH_80H	0xA10
+#define AMD_PMC_REGISTER_ARG_1AH_80H	0xA18
+#define AMD_PMC_REGISTER_RSP_1AH_80H	0xA14
+
 /* PMC Scratch Registers */
 #define AMD_PMC_SCRATCH_REG_CZN		0x94
 #define AMD_PMC_SCRATCH_REG_YC		0xD14
-- 
2.34.1

