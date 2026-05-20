Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012062.outbound.protection.outlook.com [52.101.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246A181724
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 19:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779304344; cv=fail; b=hFg1/Xfd4i+v2eVJEPTQWttSbt4n4+Z9HJyR0u8uF2CmOuRI8n74G2rNANb3rINbEmzJtOFqLuKSPjVGw7Rr6/hMZGmXvWRXR8Ksr243ibWp+ki7LrGzje6RlpdybO/2YgsmE+OD/kiysLQrEyu2adZC3+Fn6+Ot7ipGaiJEJPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779304344; c=relaxed/simple;
	bh=uMk9QUWNm4TfINgwJeA2rw5SdFVIWmf4GFhp/eb8CHw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qo2jT5kgBJB+vhGEFxwp/NGnCsf68xrlHgr7NHmqvx4I1s7u/iatDrgkyGkgyXy9rKsVeDFOgSno9ZEGqdILab4G4uR8msuGI0+uiM2Ac+ET0iDn7g7HD4h94PqIbk5CTxr/nQyEZzfAxCzEl/GOZBsUXGRFNzZ/bcIS1OtHCC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=InxYzWYA; arc=fail smtp.client-ip=52.101.43.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="InxYzWYA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hoUDPY5xkl7xYfUUJemrEIX21xH+WMdGmeRG+fKKYm7pXBQAeCis7maqfq1VIk3svsRNqmn8U338bGFD9zRiYe09Yvig1ln82l1aUlXdc2B4LVjUXV5mpdVyVvUaA1MdOoyRTGgfNCgw9iLfp/DO+n82jT9ROweCJ0i6i2L8RGw2XCtCxfo+TFIrR8q1O24X9RxLrR3ZnBxo+qNEt/tenWmmuyG3VBVMIhkzEstKlhfFtJpHlU15k/s/L9Rs41A84bTburf/peHB4BY62KN2HZes9aU4YtenltSHNwG31O7Z8R9T3T4YdJmKlDmQ2jHNN1wqvtlhJ91dgLAHY2PFeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxADXUtEOy5gHH62/xrPXFnXHTDwk746i9LAbzGTMX8=;
 b=FLDyPz02FvbxDDnewXvZuUdoSYKnPomTutWzgxzGq04wTvYj6vOcAbU52g/xMuslvsuaIVC7QmK85Y5326d/OfMgc+debYh1lAG0PEUzmQoHqnCIfdSbkMJKOZLiRNZr09Gfk60Faosji8zXR+uG8726psXUNA6NmcYbk/Azl7zAYXYsHJqfRzlMHS3gu0hvr8Hwh+LBwZXtFNf9CAyRHaLjV9zHcmGT5G5B+W4U1Idn2fad5OSnZxC81Vzyryq+iuDj5PdueCWvc9g6y5N2aOtPDd/R/aY3yfMWIU80dFRi0U48AbKZ8YodUTwfA/M1teZhpV57K8o5Z/SKUATHvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxADXUtEOy5gHH62/xrPXFnXHTDwk746i9LAbzGTMX8=;
 b=InxYzWYAmb+MoI1dxf6K3LHvHSq+Ft0rNdsyu6XgHhvkAO7c0SAy1+ZpsPAAdARgcNF3xZdU6rEnfHxB/94SUUewXHko5kx7WOpcZlGoiDQMeBXH/3qIE5FpyBjJBpcP9RknkMnNF4S7oNjnKSfotOD0jbFVgK8KE2MCMyAgBm8=
Received: from CH5PR03CA0012.namprd03.prod.outlook.com (2603:10b6:610:1f1::9)
 by DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 20 May
 2026 19:12:20 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::c) by CH5PR03CA0012.outlook.office365.com
 (2603:10b6:610:1f1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 19:12:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 19:12:19 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 14:12:16 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 3/5] platform/x86/amd/pmc: Refactor SMU register handling to be device-specific
Date: Thu, 21 May 2026 00:41:47 +0530
Message-ID: <20260520191149.773196-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|DS2PR12MB9750:EE_
X-MS-Office365-Filtering-Correlation-Id: e6008dfa-91c9-4984-ecf4-08deb6a3b710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|11063799006|22082099003|56012099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MasPdrGsi/zey/GHWASCanEyGN/51733PO8gMQ2wms063Ekt1tFJUGpjI9AL9kJmM1pOcqnLX47z3wFRfzUvCCWVEH23ys+49mk6+BkCzZ03bdggCEHbhBaOHSE+cJMo9PyQF5oqWxhvqpUHqKqFgNDT/F68qo+AmJob9HfQW7gAE7ypsUP/EfgimBYNfL8Up0MACyEhyexqQ1UmYYM4No2HScXqY+oeLeIgvahV6sUfInqIQFL05ZTq5vzlbgZHKFMDpZSHMMLNKPRlrzNkwWxysgcxso73BMd8XCVu36rnNJ2yCQD14YB0IcZDIzD7D08seb8tYIlUp5pa4RW8OsVQw3gIx+5PBj0CJ/0friSKuiX9jLcPBITohAQOxoRcs/MCcCHzp7W5BfGJvOgkx4ttxlJn4oz0C9FutudC5514nV/f2KuTYzrIfH6x0H5XaQOZbg45aH2OGIHt8ohun5eY306Eik5ak58Gg9wfIij8/zHF41VJ+1/ap6F3HVQhAe3ykjnwnjeT18D4LJn0uShzl07Es1q/1nfGHa8YSMi/Yf82y3pNWesad43IHfimSZC+E9rKqpwlT9eBcw63NsvE98RzU1yt9yQ8hTPvXJft+2LM1bIfdFTnIddBFvMY9MxILaN+jJcyI1jryQQ4Sw0CeE9shlFGL2sEHtSWF9YayO0DmfMMj+dR3KywWSnt5ABKsushQOL3NaCkO5xHAM9QWgrVGOoo73tZyjvvgTQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(11063799006)(22082099003)(56012099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nhmDzUCzq1J5mI4mMfNhUHdxxlgugCl4QTfZjYN2xCejfVd6zNiRf72p1FcOMu2bt0MttjbUL6Oz1vyJ2ppa+yl5ZZoFVYsAakrPi0rsqJYaTzA04Fo/JoHXwyP+5G+CbFvKA5k9KfB9tfUpr/8EIQ3CMSGEDSq2bKTP12hv1uzNhmNxxRY3ihV1BKOalmokHUWN6tto54cTugoZkLX8Jwz4TQqW6FuCDNT3kiPvDmQjQU6Ct+9EIJjd6Lw3j5P1Wqo2Dcz9uXJg6iTjsrJJ2pOv3TrlHkpIuSVDtFLVnF5qYf1ocnp/OHB3b+f0wUv0qUlAjvJnYbtgoIIwCJu6HLMuS+jZNiF3sxZzAQDamFDz30t+rnwlcGlNz0007EYHy5Wn6Ob2VF2KyuAt/EwaR8/1i08DLDHWQz8BG0M7YEPk9+Gbg8pgguyIoU+yhXcB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 19:12:19.9919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6008dfa-91c9-4984-ecf4-08deb6a3b710
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9750

Currently, the driver uses hardcoded register addresses for SMU
communication (argument and response registers) and a mix of hardcoded
values and device-specific storage for the message register.

Refactor the code to store all three SMU communication registers
(message, argument and response) in the device structure. This approach
provides better consistency and flexibility for supporting SoCs with
different register layouts.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 16 ++++++++++------
 drivers/platform/x86/amd/pmc/pmc.h |  6 ++++++
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 7c80fb445138..55dc88c93614 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -110,11 +110,15 @@ static void amd_pmc_get_smu_mb(struct amd_pmc_dev *dev)
 	case AMD_CPU_ID_YC:
 	case AMD_CPU_ID_CB:
 	case AMD_CPU_ID_PS:
-		dev->smu_msg = 0x538;
+		dev->smu_msg = AMD_PMC_REGISTER_MESSAGE;
+		dev->smu_arg = AMD_PMC_REGISTER_ARGUMENT;
+		dev->smu_rsp = AMD_PMC_REGISTER_RESPONSE;
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
-		dev->smu_msg = 0x938;
+		dev->smu_msg = AMD_PMC_REGISTER_MSG_1AH_20H;
+		dev->smu_arg = AMD_PMC_REGISTER_ARGUMENT;
+		dev->smu_rsp = AMD_PMC_REGISTER_RESPONSE;
 		break;
 	}
 }
@@ -441,8 +445,8 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 		response = dev->stb_arg.resp;
 	} else {
 		message = dev->smu_msg;
-		argument = AMD_PMC_REGISTER_ARGUMENT;
-		response = AMD_PMC_REGISTER_RESPONSE;
+		argument = dev->smu_arg;
+		response = dev->smu_rsp;
 	}
 
 	value = amd_pmc_reg_read(dev, response);
@@ -468,8 +472,8 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
 		response = dev->stb_arg.resp;
 	} else {
 		message = dev->smu_msg;
-		argument = AMD_PMC_REGISTER_ARGUMENT;
-		response = AMD_PMC_REGISTER_RESPONSE;
+		argument = dev->smu_arg;
+		response = dev->smu_rsp;
 	}
 
 	/* Wait until we get a valid response */
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index 969b62162470..0c3c31f73fdf 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -17,6 +17,10 @@
 /* SMU communication registers */
 #define AMD_PMC_REGISTER_RESPONSE	0x980
 #define AMD_PMC_REGISTER_ARGUMENT	0x9BC
+#define AMD_PMC_REGISTER_MESSAGE	0x538
+
+/* SMU communication registers for 1Ah 20h SoC */
+#define AMD_PMC_REGISTER_MSG_1AH_20H	0x938
 
 /* PMC Scratch Registers */
 #define AMD_PMC_SCRATCH_REG_CZN		0x94
@@ -102,6 +106,8 @@ struct amd_pmc_dev {
 	const struct amd_pmc_bit_map *ips_ptr;
 	u32 num_ips;
 	u32 smu_msg;
+	u32 smu_arg;
+	u32 smu_rsp;
 /* SMU version information */
 	u8 smu_program;
 	u8 major;
-- 
2.34.1

