Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3192AD31
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Aug 2024 15:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724252735; cv=fail; b=LlaqSY02PLpW7GVXDhT6e/fSGhg9QuUV1+wubJKVujJsGQ02yL55a9xS3bOB7XYaqrtKcgAYxzqLOQ3GOy6doWawKw+VB1c5j+w355S4kLl/BrVDGbBAFU1d8yyHEsSWEWPfHlFPadJQ2LQrLgslUyLZ8dR0hlccZN7Fty829OQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724252735; c=relaxed/simple;
	bh=XWt9/AOcvBf/Md14HmUHVzf6VnVXt/i09hNFxaYu/00=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GgDTkV8c9TAtIFI3w2SW8D12AC4eLMV4KxS2UhL7jLZZszFFjjKxRcadRbX/toE4hJ0+JpxojNKr+QWufwSxPLtw127V+mtZZPRT4xQnO9yEunl644ix8X9R3XIUSyFMHqrNGpeVxTgo9vpK85TJhuJm6pO1aOpJxHfX3puZy4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3uzebfhe; arc=fail smtp.client-ip=40.107.236.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3uzebfhe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQMLdVxzSnqlNwETUHGC4kExHKO8q9EgTsM+oPRg4pl7rOIw7hz+CyDEzhVg9LmPbbRXXgK0Hw3wD7W8C+H0qFzJm2bPMfY+V7H8a9dNm6cGlKsukVP3Fd6epOrZZfPx+c6otZ78kkz79KOyQdMcBrK0Oip/ExrFIawII/M7KOirAJpp4BUNEVXixFUgtiTYTQeUN/NjFZktoY5vdTbFY37SK1JDrQ4VNrjFwtb+Se3RKXlO4W1tzq3Jdwro/W+WW79+af31bWRGxeWYBEnKkVrLgYeZYPVmXVHeQoBITx3qpmRzrIxEB51lAHHKbBpCiGXE3gz41If2WPNvXfOAcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUT7ZIM2KFNH6Lu+dAtf9v/Wkyt/cOGlPeeipVOpzHI=;
 b=NGTHHpZprIn6NMU+0Lsun8h4VNhoO2sr7hdyZoZNP8H+biie6GG/+ZZQkMLt/TYCGJZxGksCMSXgEg/VXGHjHrto+86CB9KD0u7i+CvPPcIbqVgKMsCr2nTAmh871YrtNwQeGrDwR1PP3z+ectsytF4nx98WNcaq9ZHwg8OQOdPLKAYgGkI01Qlfo1LMinAnWI7xxqSJ1gdHh3ZAygUyAlGHjzZWM2P0hsOjIFmFxThZbhkNHAXp4j44JjYcYagfIPdJGG2IX1T63QJHISFiQcgNI87+k8IaHBPkYNoKXa3WnhEY+0m+CWRXolfHemWt9bGvs2R57M+oeq/kpsI0uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUT7ZIM2KFNH6Lu+dAtf9v/Wkyt/cOGlPeeipVOpzHI=;
 b=3uzebfhe+BKFRuAT0DdBE5GWIgUCS8IaKfhCkp887oMT/mGnZ5Hc8EFDeCOcudVsBuY3da0Q+0oyA9DVoIArz9fI+LNuhjuRIqendmbVgesldw92IDE3GNmHRQ6zT+AYjJ/u/fRInErAVpYF4lCm+2opX/MNYCwyQcIVeqTDDjE=
Received: from DM5PR07CA0075.namprd07.prod.outlook.com (2603:10b6:4:ad::40) by
 CH2PR12MB4085.namprd12.prod.outlook.com (2603:10b6:610:79::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.16; Wed, 21 Aug 2024 15:05:29 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:4:ad:cafe::d2) by DM5PR07CA0075.outlook.office365.com
 (2603:10b6:4:ad::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Wed, 21 Aug 2024 15:05:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024 15:05:29 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 Aug
 2024 10:05:27 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86/amd/pmc: Extend support for PMC features on new AMD platform
Date: Wed, 21 Aug 2024 20:34:46 +0530
Message-ID: <20240821150446.392726-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|CH2PR12MB4085:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a0b016c-5c0a-409a-c51e-08dcc1f2b23e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DaLquCX0yMhpH2ht6VPZSoDwSVyHXyUSStLo4k11P3lzNBZCCdzq4GXCde2y?=
 =?us-ascii?Q?MRnRHHEf+w6RPE/22vpNtebZwMe8aLMFcmk839Wn5HwH1reH1RDB7skbwPrP?=
 =?us-ascii?Q?RKqRo614CbpekRgE1KiXfiweQJCp3iHZ3HephrD75pEHsMEH7H2zd0yl2dAI?=
 =?us-ascii?Q?qSvQ+ipZhHAVRRdermfJ95ZS6k2T13I9Jl42AXBmizw7RU8xz5q0tDjYlyU3?=
 =?us-ascii?Q?dw2qo21Cbxw3LxarLY7oJhW9E8/PH3tXoGtlnHVgdINld2elK8BYes9CtZCH?=
 =?us-ascii?Q?BeH4UnanwzURI5L8CITLYtcMJGABjG0biKbj8mE+U5+vDkYZHJm+lCAyoZ1h?=
 =?us-ascii?Q?QpE7n8jMdx6Uktml7YNSCRKgmNu9Uj6VfNMAB8pb5cc4uAmqhaXme0GcD8bs?=
 =?us-ascii?Q?KhmR+d9DZDCE72VirTOdtcArfVaPK2PBk9U0lh7AtPfSUuWqcTVF77A2RUux?=
 =?us-ascii?Q?5SynKnEqCDjJAVC5B88qax0sgWi7wgUsG5yHL5dMsfBJF5Nx5EeMnMKYay/u?=
 =?us-ascii?Q?DbX9gs5r/YsEBMJ4ykvT2ZDdhXIxizppPcJE6DFXQ0CHpfLXv9MaNSTBpBK/?=
 =?us-ascii?Q?wbz4xNJzjyDelXaXtLpn4orcREvS/UgklRXk3d/ZKdNwlpxUCM93DYyaDSMN?=
 =?us-ascii?Q?wCKgUWUsGB9If0Z1KEx/endFuBEiSFe3H/FairfWNZ2vMWUyrWj4DR6pj1DU?=
 =?us-ascii?Q?Tg2KcLBH9A5agffMu/CYFh+WFK78yfSoxzQDBHMUpafNBRdZaJmGzv9NYIiY?=
 =?us-ascii?Q?sniJHpDNCVH22VG6IkPWt9FquPKbI+Ez4+2ooJhnBRbmisMxcO9sagPTYiKF?=
 =?us-ascii?Q?c7EocoFWp0mipgjKe4bYeGZU62nbo7ZFQ10U1uWX8bXGpBRaUgp5L2rnWTWJ?=
 =?us-ascii?Q?PZx7cK4FGR2yC07VH7ZGFKCZsTiKL3UHqRaqdV2RDHH6xGGuW+zwZ7uBkBJj?=
 =?us-ascii?Q?cj2PJQ/y3GGTqZdK7iAw9DTj57bGRI4lvSeS/SSjyzhYD8bs9/O4ZAxcfKOr?=
 =?us-ascii?Q?ja7Hk2qjqiI3AGVRAe7Bj4MGoR8CgLxbpSy3+Rvt/+nIiuXDdwNibGaZGi+m?=
 =?us-ascii?Q?g5a4H8ZHclZ0vLqKoYzvlvZQPlqgmaO7IKXEVpts5Ds3bJzqsyIEgcp0nmr/?=
 =?us-ascii?Q?DgBu4p2L618nuSY40SdnTIMigfCVhdmvNkvjgbkPoz8Ss4St2hO03QNVYTK0?=
 =?us-ascii?Q?f2tjMWdvT6ah1jQHvfxrZ6Rne284k+xdYY1bzIVnZt8+p7OynTS7ncgrlyOx?=
 =?us-ascii?Q?2Z9+niaO4z68Yqtg8dMgG7eHb92+JjOf3QLivgS7yBVLIiOEQcUYfl+v6Gqg?=
 =?us-ascii?Q?hD7IFvpIYO2+ye1YZZLWxd3FEHxlfswk5Ah23oX6zyeOKImcEbqSHAl2qPuH?=
 =?us-ascii?Q?G7EdFlkOATH/XSxSPCxupfZm4fdtXKohYdHCjeGyU8YKSQeav515yflFxR5s?=
 =?us-ascii?Q?hVDjemqakGDnWDXrUW6ei0U7alPfglIJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 15:05:29.5222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a0b016c-5c0a-409a-c51e-08dcc1f2b23e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4085

PMC driver has capability to get the IP information, idle mask values and
STB data from the PMFW. Extend this support to the platforms that belong
to family 1Ah model 60h series.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index c3e51f0a5c33..bbb8edb62e00 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -359,6 +359,7 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
 		dev->smu_msg = 0x538;
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
 		dev->num_ips = 22;
 		dev->s2d_msg_id = 0xDE;
 		dev->smu_msg = 0x938;
@@ -597,6 +598,7 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
 		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
 		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_1AH);
 		break;
 	default:
@@ -630,6 +632,7 @@ static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
 	case AMD_CPU_ID_CB:
 	case AMD_CPU_ID_PS:
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
 		return true;
 	default:
 		return false;
-- 
2.25.1

