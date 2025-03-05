Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CED22459C0
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Mar 2025 14:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741184910; cv=fail; b=UXoHiuzqXolmunXOUyB6/nfqEO+ssiF7EyoqPfSNW38xjs0oYOwsZ3JKparMBdaS5AlvLylOhovdY8WqrvXgrdAce/FofcOaPt5d4qXJVOIi7gkhVfD82CFDCCGgt9YB0Lha9O2eCKbvNynNbXYWIbVkpM/1F0Fo3BJJ3adfFO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741184910; c=relaxed/simple;
	bh=LbyhHgaCruZNl5rgkPhEI55jrtEPcgBREvYe7oZ7G5Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=moMAfyrFpDupEHoV/RXmUXaCvKqHt/pwnnRnZH4GtBn3APZhV/+2UCG1m2gTpVDN8Mh/YoAYxPlpBUQogn9/m4st93Wnh4y5MXZ04+1OciSoMSJUTgUCB7hiycf0HcJ4vuiTP6y8jZ8sop4b9dndxYKAIIE8+xW8Sngfp5IukQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nAArzsbR; arc=fail smtp.client-ip=40.107.92.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nAArzsbR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjFetK0AgtrrTBkodW2dyoOYkeQ9N0Qf+jitW+9Ckz22CXdG4/s+RXLvNurRMHX3GJn5f5D6qkdHt3HJ5YD/2aDpheTvcVV6Q7STVGZHwh2P9SKehCRfI3Tqz+hzVTJPkBp/OveUM2dQ1pyQQZTZlhtIUWMSYdQ6SCcKMP5LjsyDjwfosSVpF/QehEbJt7a2XqdsL12Na/awOGC+ihUed7YYJr2LETncgzjLruhjeM5bGqpJ/e9bTcGaJBKBDu81rkRFEJAsWF/O7xxco4lg1kHG0AvRj5Nd0jwHvw/gL54u7Br4jtg65i9rAGjcib7ZuuoURwHGF9k4Pecvza1rXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsbaJvg+WEQzEZkaQ/FurTQe+vG+LcQDoKAip7Uuea0=;
 b=G0eCV0gD6S5sfVDz4ZmTMFaiE/WX/3/9qszypfbw4qsfpy2TKwDi4ZVHH8Gqr59ErPpbC+/mFOu6r5PchoVsOsUNKgFmNaNS8p70xEI21N/edMebyMp7ICc/b8fFRwqcdsIq0l2PiKY0FiTs1BBIu0vCYkMVOfOtOuionYgh9GO2oyIQWD/eFABaPUiuZXgvdKvBXQFG7OGV/98800TfbixW8E+aVjTkjFPiNbt1k8bMu16bG3JMJwzD0o1vTuLP548MxfVKo2+s94/x2tx3nS1jyzyrSkRZ1i3Ox2j0SEhk7Th8N7wJHuntZmYSFASmHJVlCEYoSv9YL1Telg2k1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsbaJvg+WEQzEZkaQ/FurTQe+vG+LcQDoKAip7Uuea0=;
 b=nAArzsbRq/kCGCVjVjSbWKQSOl1+AfZcvNvqcsKftnfkdv0T+SftDXrGiB6Do3YgO28w5VGuvDcPZ2OSCmv1M02KrW3JtymADQj3MusbL+okEL8RSJxIvIfWGmEQIX4SZrm15+5CSI8GaNFu+o9QO5qpm769IsL9nSuu8wx7BAE=
Received: from SJ0P220CA0030.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::6)
 by MN0PR12MB5762.namprd12.prod.outlook.com (2603:10b6:208:375::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Wed, 5 Mar
 2025 14:28:23 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:41b:cafe::95) by SJ0P220CA0030.outlook.office365.com
 (2603:10b6:a03:41b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Wed,
 5 Mar 2025 14:28:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Wed, 5 Mar 2025 14:28:22 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Mar
 2025 08:26:55 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v2 1/4] platform/x86/amd/pmc: Notify user when platform does not support s0ix transition
Date: Wed, 5 Mar 2025 19:56:12 +0530
Message-ID: <20250305142615.410178-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|MN0PR12MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: ae0b6ac3-729c-4b37-0838-08dd5bf1fbf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?07lT+JsgbHUsmQ7lCQueytoUEeLE/pevN3pRdFvZ5jP5AdLqJOeah5IcPXlP?=
 =?us-ascii?Q?Vw11KBB668peBRriYIjsubzSKKA/tu3YNHpKIkX1qqbcccuaudH/DBptq8mU?=
 =?us-ascii?Q?rhceosCMMLOFGZ/d0hH2wQPX98eeBFryu+jO2qMItL/Y38M2hy2my6oRwuIq?=
 =?us-ascii?Q?FSetObrGrDZ6eANCzzew9OJ5WJuZ59WfYpWQ6r7zf2rBPJtlNf5LeZtaWn3t?=
 =?us-ascii?Q?gU5cpOs9mqeh+Py/9vzyPJzqj0YkNgkNlFH3ZeKtlLu1ucitk6nalAwE8zTk?=
 =?us-ascii?Q?zb90U8nAlmJ9dMIDKHH2lUXVhfmCJ9SmqqxiLDB80/qJYghMdRHjniVmsWjn?=
 =?us-ascii?Q?nyjcaqsrf+l2zs3anaHGIdoesEOXu2F7g1YyYZM9Z0h2HqXhCXBF3cyjXWQF?=
 =?us-ascii?Q?FS0wYE5NSPj1izYN8RdGjNZOtwRieckK98Y3lo6MWzN8i/+hbpU36595t+x/?=
 =?us-ascii?Q?cBKCIk+T/nAG99gsXfr0FbKLrX1pqLUDLfbcKMeBlYVY4vUWA7yuwfQ9u1km?=
 =?us-ascii?Q?qGATIcKSUbNw8fVA6WRc2vhUf9Doe0UzyhykbGl83bgTzMnb90g7hHxxE0a+?=
 =?us-ascii?Q?Z7KMTPTPXsDEGecDapXHe4gFLSop/e6YuH2wyQvkEiZHtnc8BDq/B9iJe9uI?=
 =?us-ascii?Q?mSbpIUPwqEJrT3lfack3vDq8MxOYezJ6PCtv9608z0r5hlyCVCyWop59JB/3?=
 =?us-ascii?Q?2PsnAws0tH5fFLUgMVb3k87FpwUmzUiRxaCPQNuzSEu7+oruf9+gH4wtAtvY?=
 =?us-ascii?Q?SLy/6n2NT38xvzSFx04Vz2rwCft+PQQAdDmy4uMjqHxcMC48EHn557Pxczpz?=
 =?us-ascii?Q?tHnq7+i9q+689hUsMKnKo2se66jDX6hy6FNyTtpBBKCfd8jwVc2fHwSMpsaf?=
 =?us-ascii?Q?ZVwbFhHyTcXO5P4Le17CBDqESEwtd0jKfvxpxfCeK0B0ygBOUJUzb1Dwfv2+?=
 =?us-ascii?Q?8rNtIpakII6h3S0DF3OGl9FUbgeapK0El+Vc/ISPP9nN5T4Ukc/AsqwOenVM?=
 =?us-ascii?Q?Y+WSjktZtzSVZ39rXkgeWbRvh8os0i+7eYXbwYuUoybM5T9QNnCgsONXZtb+?=
 =?us-ascii?Q?/zPCvTbBt9q6BMvybbLsPjw0KgRbW25fFUkABk0AAgoSwV1bBgA7frUIrj1h?=
 =?us-ascii?Q?1FI3cuHiX2wiJE6yDE8rxRo0Dkdvb3HJLj7igfg5e+ljtXVJhmk2dMqeXSex?=
 =?us-ascii?Q?Q55eR/HRA/O1IplFHagqrwhO4FeAegrMTu/dK3VRy/2ge8ZV5Qk2aES35xD7?=
 =?us-ascii?Q?v8Sai4DjCFAtKDfSt/LJHcb3fjySyUuk5OUaMb/1KJBsLBF/QFylU55xMUEG?=
 =?us-ascii?Q?2vGxfi11V7cDSOeQfMx4HTplDDlF75VpBxNV3YxlbO5Par7sC267DV0JLKzR?=
 =?us-ascii?Q?MAxsPFNR7R6g2vf+t+1TzUSi3JrWB2vkjIKgGoBNFLKloOO5YRTcUG8Y2G5H?=
 =?us-ascii?Q?C+56lCZSVzH/PblL1vvHpCmU3GLVomvcihRnr9jz5l54cqb1V39cb0988+vT?=
 =?us-ascii?Q?F4gvPdmfj1IjAto=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 14:28:22.7170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae0b6ac3-729c-4b37-0838-08dd5bf1fbf3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5762

Some of the AMD platforms do not support modern standby, so when such
CPU ID is detected, a warning message will be displayed to the user.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
based on mainline with tip commit 48a5eed9ad58

v2:
 - add tag

 drivers/platform/x86/amd/pmc/pmc.c | 3 ++-
 drivers/platform/x86/amd/pmc/pmc.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index e6124498b195..c7c7afb8a431 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -808,6 +808,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PCO) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SHP) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
 	{ }
@@ -832,7 +833,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	dev->cpu_id = rdev->device;
 
-	if (dev->cpu_id == AMD_CPU_ID_SP) {
+	if (dev->cpu_id == AMD_CPU_ID_SP || dev->cpu_id == AMD_CPU_ID_SHP) {
 		dev_warn_once(dev->dev, "S0i3 is not supported on this hardware\n");
 		err = -ENODEV;
 		goto err_pci_dev_put;
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index f43f0253b0f5..8f39988ce7a3 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -79,6 +79,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
 #define AMD_CPU_ID_CB			0x14D8
 #define AMD_CPU_ID_PS			0x14E8
 #define AMD_CPU_ID_SP			0x14A4
+#define AMD_CPU_ID_SHP			0x153A
 #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
 #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
 #define PCI_DEVICE_ID_AMD_MP2_STB	0x172c
-- 
2.34.1

