Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C5B15C144
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 17:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828288; cv=fail; b=l+CyjNQOn5pGdURLO+1I/Co8xtowJqZQ2MeU4lkkRxF6Q0MrDwKSgYANQeq23BWxZfvK+tLFnwvJ5xkrJarHYMgyMw7a2f/EKlSdJ+SpC5IdQY99IoPcmSpi3VRrKft5YdB18t4huQHPA/wOy1TluazURYEYf6mfKlT1RcfHqJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828288; c=relaxed/simple;
	bh=+1gbOZQ6yQnalxYEjCR0zZ8a98sZyvzoodlTsAVsIkU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XkkZ0TyN8pjkl0PGpyBYWzC6HIHNXBNmgd6MR/IUDO7q9VQIcVCDtCpNjUV+HsIY/iONGN6jmkQ/6K//U44X0g7y629b9WCduQyjlCt66Wpc+7GA8S+elgL2l9Qbt1+lZms0wwGpRmkl4b2FIXwfSZxScsB2HV3aNmtVoFDwhys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=x92vW9VV; arc=fail smtp.client-ip=40.107.93.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="x92vW9VV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIDVs6e2gwbNNacsd3VnTbSumqA1tMOilEUq8ZI6ydFL39KRk5E0FjILrzYhBkvELbd7vd65469FztVQP54+BuurklL1AFZ6vHcLb0MLs8Nzj1bV4LXf4jNsnBTHWeqDg3ejZHMFFNq73bB9R9QVDY/XwJGyNyGcU5m3DdnVW6X99D6vuf/+29wqafqbnR67sTRiJ+4sATUiTHerFwUIhLwQaTaS6z4YPL4NmLx2k6LOK2nGjvHJ/i6MWUDloXqUUOVkZiDab5P6Bt22mKxvzUiStrxuPCyT2ItkrdpF6j3FcrkC+TxYDfwiTRxNJGjnBYp64Dwl0z0aab0204HtVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xdE3+F9yBuefbI85vmFDw7FMv1RUI5kej4TGiUwI1c=;
 b=leT/o+UHT2C9c4MDz+QoVETHalHyYZCdpR5gOOm+x7S50T6BhHbEgc74S3M4wwNrflB6XDZR9OIzPkzozQ8QpD6eR+juC4XT7PLI0y02qtdqhuV9OZPKmDMvscjnSZPhg+3nXS3JVAnLT34alPG3IRmE2OZFxIa+hOrl5TYGqo6k9+tBwm1Hl3fDu1sVkdKAfumsREiQKkq5x90oD+el+sc4d+ut8CUO3Vjf/xG5sngvhKaHkhFOx5F/dFEjykSbKNoWo1aN2/92+Y6156jZ4VVfseqkD5Q1TgDjK6HCPV7rATOn11ARDvMvMKPFOUv2xi5N19fXrQS/korufDhQpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xdE3+F9yBuefbI85vmFDw7FMv1RUI5kej4TGiUwI1c=;
 b=x92vW9VV7arEWoA+yk6WkMJ+RcS9Rp0HGGUd7UAt5fGN/9KcsL3QeV0gUySnLrJN85G9BpVCdRn5Oc8gEsgIXwtHChVDDi9Vz2hzpypRgTfTMRKDfEFvVt92ZK6WRAbTb3qziCnruIEf89krI2Wv/UmMl3TJPGX9yoyI3jcOiBI=
Received: from BY3PR04CA0001.namprd04.prod.outlook.com (2603:10b6:a03:217::6)
 by MW6PR12MB7070.namprd12.prod.outlook.com (2603:10b6:303:238::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 17:38:04 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::6) by BY3PR04CA0001.outlook.office365.com
 (2603:10b6:a03:217::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30 via Frontend
 Transport; Tue, 5 Nov 2024 17:38:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Tue, 5 Nov 2024 17:38:04 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Nov
 2024 11:38:01 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 10/13] platform/x86/amd/pmc: Use ARRAY_SIZE() to fill num_ips information
Date: Tue, 5 Nov 2024 23:06:34 +0530
Message-ID: <20241105173637.733589-11-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|MW6PR12MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f5db85-598e-41a7-a9db-08dcfdc09a54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8Nthu4hoWasQMB4mrxo5gsEZ96RKALOmDPAQ2ajpJHnvYL7huJByS/63p6Vd?=
 =?us-ascii?Q?S3KE8/5Kjwty0HBKuPu8y9tFscxOraI3/4ugMl3i7Se/7BGz1PgM4XZ7bhB6?=
 =?us-ascii?Q?3SGBhplFJPVYLGaBv1uqPihFZIGA2d462r+mV5+4givtCPZ+WCtq/TVH+PxU?=
 =?us-ascii?Q?loA6f8GqJD164EExF17LkM8OeNIyUpWSHS92+7ZBfp4REEx8lnAu4GvsfIqy?=
 =?us-ascii?Q?qhwKo9E32OX7U9nrDj2+j7HxWbs6L8KzU+pI9rBEzaAhb7krhq/nxgNDXkye?=
 =?us-ascii?Q?oo5VHxoE6+nJhrH1+iNLG5y0FBDkYnwBCZTPkp/Sj2UPT7lQgYRq5N0NZ8xV?=
 =?us-ascii?Q?GOujyUCYyFzzLzMP308cVJes3+1CCf0usHian/PLu9SV87bCivFiJCBIHrAM?=
 =?us-ascii?Q?8iwhGDp52GPkwp/4PH+tR2gVTQmsFWC7CnsBsGZpytP5PfLq9DE51NW0dvJo?=
 =?us-ascii?Q?tlv5aXpuXWA+ZsANwKEqL5g/ta8ciaZw/3RWh6USmW2tdc39znrJ2J/AGKzi?=
 =?us-ascii?Q?Obsej6SqqxAfQDnZAOHYemP61bTLV0PNBQk92GKSR2+fBEqviH2KaOYlcVXv?=
 =?us-ascii?Q?q8PgGFU4E6FDLV+jZMSgMbCgwo1cfHdAuikNibiYB6+cy8/F79CGH5arCggp?=
 =?us-ascii?Q?KyK4mAp2o3G4vA7lKGkCj1BD/fJUlyRXWImApIh0OXogH/tEs0zE+rHqhF/b?=
 =?us-ascii?Q?H+9Wd1xqx4GRD0DPldZZ1bR/oBg09Vm6+TqtYuL3TD8/uUiUrMlq3eybJT8o?=
 =?us-ascii?Q?TPF+lesRslYLsHuQ5MugWcwsNVO8fY0Q673WOm5jDuhHGKgyknK5C818aHbA?=
 =?us-ascii?Q?y600+0D7cnmcZQUTdcy4Prh2iok8BJaFGJYLptiHaWXvr+uRC2yM7BQYwzrc?=
 =?us-ascii?Q?1LeC8UFrQ+TJsE1eOpiL8MHtExwS80Kf4vCle2nDBovCYB9shn00iVsEOLWR?=
 =?us-ascii?Q?MTgYMJetTIWNDM2s1J/JZJnM7CxssMQOkEIRJgFPhkK7/8ffHvvxt6VzH/PZ?=
 =?us-ascii?Q?MJGccNAjwzjHs4TudiN5R3zdKTIKnSWYFA3Au5Mbo8U9oe/ZlBhb002Tm8hK?=
 =?us-ascii?Q?ODH6x9IS/SsocIVPEkd8dqqErR6Wmudpngira2ouP54OnKQZQDQbUKCLmTCQ?=
 =?us-ascii?Q?07f+4wJJNyhKtS5zYXBHddNYJwbKHKpj3h1pC7rniXYeuhWjgi1gxmrOgXOp?=
 =?us-ascii?Q?b99z/dgS/j311bjEj5oP0AqwyzZQom1IsnnFa7dyxYEMZxmxpFhz3rgnx7sf?=
 =?us-ascii?Q?0Q+tZn0GKPs+Ojvn9suxV18K6g4K4cvCp5mEpzTQSOd1bJfgUVwvRJWuvj0i?=
 =?us-ascii?Q?ye4igFqo1+P/4uoqzAtWVLKwliFYOksUAiaxOPKzqyJm3TjaWH9PpmxGBmOv?=
 =?us-ascii?Q?FcuXpwCRAg8H30dp0QgqIa1zc0X2Kv49HsN6JYOo3oNsBN5lRw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 17:38:04.2993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f5db85-598e-41a7-a9db-08dcfdc09a54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7070

Instead of manually specifying num_ips, use ARRAY_SIZE() to set this value
based on the actual number of elements in the array.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 5ca97712ef44..77f2c6e78139 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -12,6 +12,7 @@
 
 #include <asm/amd_nb.h>
 #include <linux/acpi.h>
+#include <linux/array_size.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/debugfs.h>
@@ -120,7 +121,6 @@ static const struct amd_pmc_bit_map soc15_ip_blk_v2[] = {
 	{"IPU",         BIT(22)},
 	{"UMSCH",       BIT(23)},
 	{"VPE",         BIT(24)},
-	{}
 };
 
 static const struct amd_pmc_bit_map soc15_ip_blk[] = {
@@ -146,7 +146,6 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
 	{"IPU",		BIT(19)},
 	{"UMSCH",	BIT(20)},
 	{"VPE",		BIT(21)},
-	{}
 };
 
 static bool disable_workarounds;
@@ -201,10 +200,10 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
 		if (boot_cpu_data.x86_model == 0x70) {
-			dev->num_ips = 25;
+			dev->num_ips = ARRAY_SIZE(soc15_ip_blk_v2);
 			dev->ptr = (struct amd_pmc_bit_map *)soc15_ip_blk_v2;
 		} else {
-			dev->num_ips = 22;
+			dev->num_ips = ARRAY_SIZE(soc15_ip_blk);
 			dev->ptr = (struct amd_pmc_bit_map *)soc15_ip_blk;
 		}
 		dev->smu_msg = 0x938;
-- 
2.34.1

