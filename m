Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528353BB30
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Jul 2024 15:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721314909; cv=fail; b=e6PdDvraZJGdU8MX2ztMCKAuTKisgjYxNW+/iB3ZhnkfqShjZl3qW7ZIQl+QBnaNuBQt5Lf+Q1bEeehdmETPJY8b8+nlWcRqlC67C8j0JUH5j9kPzpXogdguYVe1rWEbp+uECrrS9twMX+sTl5mM/k+WFKXpDevl38mo0jhAyas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721314909; c=relaxed/simple;
	bh=ZN0xICDRWoGSyys5dHis6M0lxU4eW6TWqZQbsmhzCLY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lMqeNV/f8HWSTmt9kruas6SbltxgN29+TnROK9K+e6lq7ALDBJE82oSyaGmbQniYLIWNA/ej3E0T4ap07vRxIgcqhkTJO9I96dQ/DR1WQuO8/xuDQYfaUc9HNkCVHW7W4bqV0soJI7OnqRPgjf6rtsstd8DibQXPCAOk7/MxK2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XS5wpyH4; arc=fail smtp.client-ip=40.107.220.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XS5wpyH4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKIgj5HdfU6P8gPsHf25BBUKHG4oOkN/F11CrcZmoYHnWESOJqSEeZ1up/FJfGkT8xsT+wYFrXAuRv2i5NiG1q0H9oPcYuRGmEMhEdikaxqugco5aZl5BtI/vvqL+OL0G6eZPz1nth3+Y9LSUNWdMQEtTi6zln1cDoHKZxC+zdSHFc18s2uye+HSerjoImPUdTHDtTYRjVjCHzzBJ4CmAgk+lilokPX545/wrym4Lpgi4iU7DKpvEMiCVhgNEpdErPd883iR+KVX6XnoXucqG7lkFwB6iUW4wE+wwSdZ8GYg4HqDHeZHGqM6BZzBhbIE/fAfhb+tb6CPzbP+BGGi+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1qe8LZSi7Z9D7nLYpMSgmWDQ9sbvay7g1lEXAgFHhw=;
 b=nMTHWvUGBmgirItJ7gX2+g8umTf+kVV5IfuvUtqYGHUGRCDpg9RicPYltj4jG2Dj/Zv2wQUvG7VfpYL897SFC5hjJ9l9fCa047wlgRGt2Ecqxl5usUb1YRqshQJ6YTRELJxpbfytATCVHJyNoKxnrDeAXfhjSKvU3et+GEb0SpUQn7x/sEVJRJIHNUdkkdfL1c/16yBfPyTJabZSi/zgsYxzXYM9SLszRKrD+QNgi6/wkPZyAi9QHEybM2WBlCe+pY/BZEcbxfbXnESthEzMn4MQ8RdafpMS0lDl42nDH1Y3ifetXvV4DBMCQ3uo/4pf65gPVGoDNazmhxdNnz8gFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1qe8LZSi7Z9D7nLYpMSgmWDQ9sbvay7g1lEXAgFHhw=;
 b=XS5wpyH4kYVckhFwnmEpL2BJhH5T/iPX71XCoJlpqIkrWuioCK2X2I9WEOLWr600gUNkHo8wBtyz8zobwB2IiqpzRFQpQZwXy9DFI5SLjXAZyTY7TaiceThDQeKWgcnWvbFp2mw1era2+x4+VY/Y9CR0+TE5EThXpZEy6LvtRtM=
Received: from BYAPR06CA0014.namprd06.prod.outlook.com (2603:10b6:a03:d4::27)
 by DS0PR12MB8453.namprd12.prod.outlook.com (2603:10b6:8:157::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Thu, 18 Jul
 2024 15:01:39 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::bd) by BYAPR06CA0014.outlook.office365.com
 (2603:10b6:a03:d4::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14 via Frontend
 Transport; Thu, 18 Jul 2024 15:01:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Thu, 18 Jul 2024 15:01:38 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 18 Jul
 2024 10:01:36 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v1] platform/x86/amd/pmc: Send OS_HINT command for new AMD platform
Date: Thu, 18 Jul 2024 20:31:19 +0530
Message-ID: <20240718150119.3427190-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|DS0PR12MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: 837b8b08-8496-4917-7311-08dca73a86a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DRdLHw2dbdRtGfhhzuEw3ULmbNyNo5x1BQ8iILWoCvkkOY/mdTDlzTA3pKxb?=
 =?us-ascii?Q?orWB7YkSnnR6J+RKK3a7QqcbIZPKynAst1ScJAtf+jXjykHwb0hfkpQtASct?=
 =?us-ascii?Q?8X9C+Vj/6fL3uxP9LWO+uOBdF1od41JtYq05kWowrbjt6ayoiSa2huw080A5?=
 =?us-ascii?Q?enYkT2WV7OYEQMxmpmOHIJQ69GLhRN7u2LKnzbvOLxptAN/LcpWWOw0XuiRR?=
 =?us-ascii?Q?cBzXLqb+mb6EVHAh55D11WjwH1YX/NvUK50/+NfHqmYaCznSCT0ip8Bacc/z?=
 =?us-ascii?Q?/soMzczqHSLqtKYcDkU1EChlfS2orpCqVHSBwiGKYfTPkLqx2+cughMe1ELW?=
 =?us-ascii?Q?GrWEjo6VHwrxyl0zuL9+wAb1hJi7E1DLkRSdpSKy1vhjjguhndsUdxS/1qvz?=
 =?us-ascii?Q?Lo/ehupQim3bmEN1SISDAcqpMg+aSJqK7QyX1TEtZFI+NxlsRqjT53FPDego?=
 =?us-ascii?Q?3b1cy9/XzOd+4wkl6yH97pgkj7NU8TZ7FpwprseNKWCFzpw83c9d4f3R0RzX?=
 =?us-ascii?Q?+f0Xs9KaN9s0TgcYGRKFSLX8cpPFiK2WI/YfIEEubRXCrb+Xkzk/ttLCQ6lr?=
 =?us-ascii?Q?Ac685ihlK+KLLppgFpB9iN32FcCIHAiloJSb4+dEjB0d6EJEx6viRW6k1Dty?=
 =?us-ascii?Q?MzWWUKuuJGEGbfbnWo5wsc/irNAuPJ/BXxr9ENc3gGP5796YxLlHDIYfNss8?=
 =?us-ascii?Q?Q6fVzl6kI1Gu5PvTkjcX13vjuXMetTQ39pXjg+UZAryNyrmQiS1C/6z4/wt5?=
 =?us-ascii?Q?t8+epYnVYZ3MO/s5RQ4A26ENo0UaVGQB9JZ2PkEZ3fbxMGy0PAnlFFMKSnyN?=
 =?us-ascii?Q?NiV4tZMAMB4tE4Ixx03v7GQbja7vOvqv5aIV2LQAs+uFnzoz4A3Rsp9BYL0F?=
 =?us-ascii?Q?cEhW/v7GFV6c+Xcsdq7VoRjE3kAomU9jnkdHvW+5DJXMTd3qFiKPvIMrtoaA?=
 =?us-ascii?Q?Kxq+150N3WYnwYIGtW+neIIohNSCOnLvnLdmDudyh+nWilh4wyKbt6xf98rG?=
 =?us-ascii?Q?jjHrsRzFVqq2gyUxkY+XXl2x+cEZwsIB/DgSr3dfv2P8ZWsPeORrpE0cmSBA?=
 =?us-ascii?Q?YJm2el3DB8prQ//E/g6pCu07EFJasIvy2jJoiW6yQeqAshmGzVU8IVXJBHJO?=
 =?us-ascii?Q?v/yoJM2i52Y8rgt5WYSprEMfaDZwhjUWWUNTvzoaA5XvZpY9B0Y3th8M2agb?=
 =?us-ascii?Q?hqd4ZMeHHEmo9q1fgxu67TVOXe0IGMHySyxw90dWuYbZjFYkZEGxNiGa0iaV?=
 =?us-ascii?Q?s9wpsMZrgR2BsIwjlTy7u0gPvdYozhqxypZ6HszwckdV4X1C56jgWNHUXXaZ?=
 =?us-ascii?Q?Zr3993GabmrPtTIdEgnfp7uLLE/zYmHxddX3iTqWWBtAA+Dg5f+Np5+rQrNQ?=
 =?us-ascii?Q?EpVtFjOJ3IF47vScAQZtoWsPeGA7+gBQmPpcmVNGtcsEN/7SrPhQ0+bBnVQV?=
 =?us-ascii?Q?zL36LkzXZSA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 15:01:38.7031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 837b8b08-8496-4917-7311-08dca73a86a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8453

To initiate the HW deep state transistion the OS_HINT command has to be
sent to the PMFW. Add this support to the platforms that belong to family
1Ah model 60h series.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 2 ++
 drivers/platform/x86/amd/pmc/pmc.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index a3d881f6e5d9..c3e51f0a5c33 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -764,6 +764,7 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
 	case AMD_CPU_ID_CB:
 	case AMD_CPU_ID_PS:
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
 		return MSG_OS_HINT_RN;
 	}
 	return -EINVAL;
@@ -967,6 +968,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
 	{ }
 };
 
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index 9e32d3128c3a..f1166d15c856 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -67,6 +67,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
 #define AMD_CPU_ID_PS			0x14E8
 #define AMD_CPU_ID_SP			0x14A4
 #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
+#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
 #define PCI_DEVICE_ID_AMD_MP2_STB	0x172c
 
 #endif /* PMC_H */
-- 
2.25.1

