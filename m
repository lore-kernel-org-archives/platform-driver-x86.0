Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF95155C82
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Feb 2025 08:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739780363; cv=fail; b=RifJPLKnIk/TRPjmHE7OWjhNM1bJnwIkr3QHTNj78Qn3XxbGiqFsaYV4eBQ6pgT/U1eiKYZx5B2uxc8OTR+RrZn16ZY7KwZepvShOLMGrPz7Peq4tCml/kYy7b2UOTCPaI/zRi19UZqvzSIt2zcuvrsHTEYqG9ASSC8tVJ5lFs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739780363; c=relaxed/simple;
	bh=FeUkRUMrmjA148ANxb1ofQuSeCOWRLlZ9UFGg1wIsYQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WU/KX217JIHKi5i1A9k6nppsNEAAK4g60yaoTuPL8vkLRZNEIfuV3AtnBarkvGr1cekhA6I8qTGqmOiAa+wLD1dTaXBcUj6Sv4J1cPafho9NVt7RG3nmmPhPbI1HIHHlkucqct3ZkoXg5CVQjEQ2hxuc3Oy6WiGHXjY/4j9XH3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ao0wugxC; arc=fail smtp.client-ip=40.107.236.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ao0wugxC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOL4vEbw5jINBhf66Vm7TQbiNPCiS2M7PJzscTDhZ5yYzetuQOoAKazrkRF3vu1AKsBt79HyV4iW0fY4+6dvCjR4H/Dtc/PYdAtMmNa/lQAgXMWKE6brYrqzzkI8w6WDCV5GjeXDGTI6ptIKGkd4qbWaC1MKoyRWc5CflqhwW/FIHRy7eUdx7DJokf7JRGxW5X/dZvV46zDmqE3MQW5DJ4z/4B2uf65dnORKHxCuS3O45ooJvscTlfs0+AzaFxVDVY4av/HWDKqUZ+/+IC2c2kEcKhVmpRXX5++eJQSBpSzv1modvHedRPra/Kkn1vPKX0UmmndWM3brqwe95edTXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noNBmpIi2fU7xD1a/7tX0xgLy57cLmI+c1q2q15YKEo=;
 b=uzOZAadfx3+yeimttf0bI2OMSisClTXUZAZLBNBFSvTPxFj841lclV4sWzyGQL03yo13Z8C/FULsNMejkc5s9XYWOpvEt9UNF+N+bsoRFfBXzeY9S++I+0CUw3RqPz00oCV1krS7ASIYarCRutIXuEexIm9Ew6bIhDSh9Qj/jYGXmVfQacYqtEBR5OGL65n/hblz1E5ANlMFKe0WDmgbCxOaDo9pOqnLRusWXL0tpIidIBNvkJW2VNfccxFKlzJfucsLEJrpWzbKI7QDQ2BbbYxPfQi5WyrGUI2dTNrLMqEj5eVnPEFBExKz1Hjylrt0AVMfbO+hUUroAUurxXTzqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noNBmpIi2fU7xD1a/7tX0xgLy57cLmI+c1q2q15YKEo=;
 b=Ao0wugxCbwGHJ6y3kPuhyXx0YgoFEz994HQwOdHegiJzQd5BtJnAcuvrmEyAmUKAHbwLfsNYcgvIKQ/pzaxg97J7GHnx3EMncnU59ZE2OqtKJJt4UojaaR3SQiMhfpdrXQYitpnaTTSXW3HSGDKHVl77bCovdEf6uIYRSYnX4Qk=
Received: from BYAPR08CA0012.namprd08.prod.outlook.com (2603:10b6:a03:100::25)
 by SJ2PR12MB8160.namprd12.prod.outlook.com (2603:10b6:a03:4af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Mon, 17 Feb
 2025 08:19:16 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:100:cafe::17) by BYAPR08CA0012.outlook.office365.com
 (2603:10b6:a03:100::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.16 via Frontend Transport; Mon,
 17 Feb 2025 08:19:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Mon, 17 Feb 2025 08:19:16 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 02:18:17 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/4] platform/x86/amd/pmc: Notify user when platform does not support s0ix transition
Date: Mon, 17 Feb 2025 13:47:17 +0530
Message-ID: <20250217081720.107719-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|SJ2PR12MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: 369bff48-6199-4cc8-7ed9-08dd4f2bc514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6MGpmchBYnp0X8GRu0GqSWDonktrR4kmnxZRceesP3KtqDsL9nxCax+RYeEo?=
 =?us-ascii?Q?j1rfcqG9hSSmhgCLDDcPS9nO7osbUaAs68aXdfmlQIY36ugrhwEJ94XYjUXe?=
 =?us-ascii?Q?G6uvAWCEN+LCsordQ4X+sT58r10DTYtgGJ5nj9q9deXosET9ljVoS7OViiI8?=
 =?us-ascii?Q?aJPCFqdbf56g918I3WFw0cUYn8Zz3CoSaa5VAlhW/FUf6v3CdjbC5xfBG6RI?=
 =?us-ascii?Q?qDuPAmS3v4ihxyWkR/xX15rZ7sQP8TAYW/uTwxz9tnP6zIK9JI7bQaTWLMKJ?=
 =?us-ascii?Q?zkahn+kCJuJ7LLTDEO71rc7YJTxW2k/aaFt1Ees4iNsxGmsRGtIkvqGTUObi?=
 =?us-ascii?Q?87mqQ0WWXnsYJc1rlg8PzTNmq4YKaYoBSogIaxrNTnnP2rhNDaOB53/CUSAi?=
 =?us-ascii?Q?+UzpsDkljF1KXHdhd5ER68YcC6Itdh4lKx/0X57gEyH0GbC1ebcBDspHWYfT?=
 =?us-ascii?Q?FP5LJg5UiKTG/SraytOj212lPrCsRDX6bpWcuiUdRd92WK2Owq583I8x/zBF?=
 =?us-ascii?Q?z6qcL0Ao+mIG7wBqi/FT4vXMjBqCoS/4tawdgpBYbryZtVYNFJc8KiRxprr/?=
 =?us-ascii?Q?kVJzgeyqY0VS/gM407GcCWUJdqvos6B4O3UHERfRfUcbF7Sr3ARm6arTvTND?=
 =?us-ascii?Q?fXYte4o8CrK7CQUmu4dTVJAN5BCmPRp/D20GjQfrIIxrEIhOh08fyvdK2LbD?=
 =?us-ascii?Q?Uwbne9biDk2bzfkf78OAB/BoV/PMd0f+jGOJKfVzQUrFHPpPf59cGLTJ4kob?=
 =?us-ascii?Q?a6cYoTWdfS8zYK9RtmWydNIqaMqB0BhKlCxWP3rdWLW4iVId06BxcyjXfkmE?=
 =?us-ascii?Q?3hCKFdSwh8mhKBDDImjzgUOzhyv97mElmo3fx2/dGZ6wIgc3PeqOQ6lZM/8r?=
 =?us-ascii?Q?rRuzglEALBXyBTDmPBIH9MoEv+JAZX6I7lXEXdkx6RMTod2v4hGObsW5uGiW?=
 =?us-ascii?Q?NybNCpp1t0N0t+OAAh8ME+wH9qqA8lxvpm+caDpA2URGrtCgRQx3bPNaUhZE?=
 =?us-ascii?Q?OSUx5KHIHYyFJuRTzb/F46+6EjXSAB9ZnGjmFPGSh4LpmdSPxGXBKF14G+lk?=
 =?us-ascii?Q?2STs7enlML8AgpjUCxnijRd8zV13NlHv/0tJSliLWYwAgb+M6eqv0BlP5Mc5?=
 =?us-ascii?Q?ao46s22rxF/FZDy4ZH71xWe2k8WoWX/cLFXhzca/NSL/Rf1u8P7QrTqQadPg?=
 =?us-ascii?Q?A3zaScYEelN2HUhKNZUhE9G8Uck8QfoHuDr5ebQNZBQiqTDYKdPnZ8Lm3Gg3?=
 =?us-ascii?Q?5qDMN4W6SppGjFYvrZJwNRsonFJgy7JFGBoGQrDDfk/a1XR7IW3R+IwkMRwy?=
 =?us-ascii?Q?IGnQ0KtCiYzKIkAT6J7cMg4USzGLljMy8eixnqgHvjn8PDZbdBbxNe0olUN/?=
 =?us-ascii?Q?07nH7lz2eZvEKk8f+pdCQew+So5BjrLOZhiEduRTR3NDg8uyHPhgKPrBXDQT?=
 =?us-ascii?Q?EhAVGkyIuyo9QAOpAskd2RDMSNnzABkMEhZnsHCoO9jBWx9XTbEkhp0A7wqX?=
 =?us-ascii?Q?kAFLZ0q4v8Pg00c=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 08:19:16.3402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 369bff48-6199-4cc8-7ed9-08dd4f2bc514
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8160

Some of the AMD platforms do not support modern standby, so when such
CPU ID is detected, a warning message will be displayed to the user.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
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

