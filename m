Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013014.outbound.protection.outlook.com [40.107.201.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8ED2D9786
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Nov 2025 06:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762843108; cv=fail; b=FiLQ7oj3Qo3WLFI58+nnulf4aCGEgBwfrUboNZ2B8SK4sdisxVTxWaxT/91tJ03dCrVB+bLDFmVITSINr6Fkc20T0lOyKiGYtJCvJvFicRIIj5bsogheKsuFST0aRUA2nx+cwEUdhndq5Ald1oVbeNJc7BCUQDoMAB75HW+yRzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762843108; c=relaxed/simple;
	bh=BC+CQSoKKSL4HWkwiyqBb7jzt1Kq2m/qQHIiFTo6UCQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XhMUcl8OM6GIolUwri/ef9JD5JOaa4tkoiF6o++HzrwWD3HPzOeEdAFetEvnfrXq5/HsSOdJTB2Z7r7vhjQcylKsIXctFPfTiwfaeNwIJt1JjwyhLoVPgVcrg4AOvfqiJpKOxJu59foH6k8RttFHKApMvvvnzNdLI5LDjOjRVR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4eArvJnR; arc=fail smtp.client-ip=40.107.201.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4eArvJnR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XbFtqvGRSWzD5qW0RSGzHCeA6Jfkrde8JouMcvLM0hmwAbxVv4Z1ukk1+PxBWtvDbaKamyKJbSBBRXcY90+4tUpnHFlwD+xStmVf622hoE1s+Cfzj30Ju9uJtRZmm0Lm/jJXywqJXqP2mLsy+ve3dWXD6AX7NOopL6zfKDgQgn0nCAWqC/0ZiwQUozqqyLzkeALTrwKpXwRKCN3XZq1WjeyFAIorryWerVtJqZx2B9H2XyzuovuyaTcQrv7TTtiZ+O56K43jKaEAN9mdmd8X4Hes7T+G9Eiz8y+LZfF0cl8fc4F/GJ+deRcFbFLdp76dt5neTovdhrHaqLYq7vgYFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PBM7Hojp3m1XEXGwFPc1Q6fybnZfNFBjqixK1IE/ic=;
 b=EIsGU/rfv3uyE6zghi4IEOmZz9Z5OmdV1V5kcQb+oODomnUQtYJp0dL/k8IC/BGcLWFPmpVj/0H2LrRBSTy5tgk4xspd1RKYQ7VHH8vKRMRWyV3OD/EdJUZCmMxkNMXSsGB7BzV+wUxFGNCrao6bP5YHhOjvYqWobNLmGnQR0p/R1boAretPdY5afDcLvZpQ1aX8mbyorsQ1HThg14VGUogwKN2VRf0fFoyEj1LDVngZydKeCvdl2DqOJ5FKpsGNaCasTK1/GX4UEg869EUDaSlsB8El6I1U9qSVWCUT7JpH4DPxcM/lj7M18lwukcVAco/h/nAO/7sWfevR9p2L4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PBM7Hojp3m1XEXGwFPc1Q6fybnZfNFBjqixK1IE/ic=;
 b=4eArvJnRL1PdaZwaW2fuP0DO81UO5j9Wm0KTYYILp7YfdDzH3Ps+1F4NweD1cTe8YwTeXBK6jI/Iy6K4KHstzfzTS3kxIkJM14kLbNeK6T2+lLo1vGS+Jdf2EFzxX9UHzEUFlFoyIDnjKrJxqCMWCWugGixwORMITLvYpO0QXN8=
Received: from CH2PR03CA0009.namprd03.prod.outlook.com (2603:10b6:610:59::19)
 by DS5PPFDF2DDE6CD.namprd12.prod.outlook.com (2603:10b6:f:fc00::665) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 06:38:23 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::35) by CH2PR03CA0009.outlook.office365.com
 (2603:10b6:610:59::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 06:38:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 06:38:23 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 10 Nov
 2025 22:38:21 -0800
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <lizhi.hou@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 3/5] platform/x86/amd/pmf: replace magic table id with METRICS_TABLE_ID
Date: Tue, 11 Nov 2025 12:07:35 +0530
Message-ID: <20251111063737.4156385-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com>
References: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|DS5PPFDF2DDE6CD:EE_
X-MS-Office365-Filtering-Correlation-Id: f80ff6c5-bdbe-462b-5d77-08de20ece9c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|203893001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iHEI1gtgQosSMbJrCGsM3ZF59YVRinBoqKARcb/Ww9nJomm7MB+gH7MaqH3D?=
 =?us-ascii?Q?iQABckic21FmO2yHVHRx3wDwUHRjJ7KnT1YWM2z4QphKUO+IeWjSZpp+WRYQ?=
 =?us-ascii?Q?Fwpyr5u2vfnpZ/PZrHPM0sy1UedWlab0VhTTftysxzaj7vcEpiT6JZVZhrJ7?=
 =?us-ascii?Q?K0q2b88CoZwhT+H6+M2DPonB4ZTbM+0UIpZJt4dyjQ4GGCotCasGKAf4zrQv?=
 =?us-ascii?Q?szsyGdtXjDwhuKeYidBerq1lkfqDgt54LOi7ZCgQjbBepUDOfZIZTNHcq3hN?=
 =?us-ascii?Q?PqTJrBJBF4IxlHCuWUwTjjiYb1bQ2p6woBj95gAHq8mEL4GH/PEmS+q5SZrF?=
 =?us-ascii?Q?Qpye3T7sQo3oR4wUADh8XiYmAORaZlRMeHFth2T4Y1rXXbixAkwLXudCyvjW?=
 =?us-ascii?Q?o6dy+A7zVqtW8qfle6463nHPi1I3FweIDFXdn4iMHK4OHox/3VRgr77Vb36+?=
 =?us-ascii?Q?6vheTH+EKZnkYHKIxtaTnX97sbGoFSDkOGNUBn4/gKl9WSx445egqPsn0pFZ?=
 =?us-ascii?Q?r4CsoFafiGQhAx+mVDCstU9oHzt4oGkQxCoKFurki1c/Z4aBoyDae4ZyAxkw?=
 =?us-ascii?Q?GsUp9PZfcD+D0/pCxW9VlAQ8Lt3+Zz4Asu35vRlb73eFn4yCa06v6kG5DZ9/?=
 =?us-ascii?Q?0ysR09vPYUFnKV9b5PnSFOYFjGPEdoJvegpMp5P+ti0Eln1sEkwbx68c6yxf?=
 =?us-ascii?Q?nbKH88N1lbhI7OuzCQ87UjHpmSyaTgnj7Td3ahmJXJjFhcYoe0cJ0ZL05OYW?=
 =?us-ascii?Q?c9hSMQltnqnZpF4anZ5DXwjA0mXeKUkhcZ1pGSfmaSA8pKhbKzE6C3yiuVoG?=
 =?us-ascii?Q?mGeVI2L3Qm/GmvPXJxM5deOr8GgUfT1ux35JFxALmOLBrCA7xzNzYRKD7V6P?=
 =?us-ascii?Q?fswUQohYUTFdqR/mvxIN0x2t2BMsHCORZIAjK4sfwx3s07LH2i7z/F3eFHdy?=
 =?us-ascii?Q?ai8LHDPN4O7FmSjSkLDmFXRArCFlERnJDQg69+XarFAmqfIc93zgUmt7YTiA?=
 =?us-ascii?Q?nAYPWQnEVzh7YorWiy1k0jWKEIGUza7XH4pBwQrrkVVIyunQdLvGZPtNTwgx?=
 =?us-ascii?Q?3BNXJ5cl/wRJxDfxnGvQW/V1y9icAVMaVPGnyp3XAHUQKSl/l2k172oUu2wx?=
 =?us-ascii?Q?ksAP0ja2IDVwIyesCyXsEqENLnd7n/Q4hYqAU70mJXoPCDU9B8MuxUaWP8Bb?=
 =?us-ascii?Q?YtnkSRTvcmMpaT8PYcQqv31jXCKA35Pgs1ggJl3GJ0M+zuiK0ACQxExK/gMe?=
 =?us-ascii?Q?2c9jVKqMJ3xrsZDTnZlDcJzDq4/zX7ml0jTnQzI9UsUwSpsni/h/y3kWOUeF?=
 =?us-ascii?Q?tmiJsi41BatOYzDjZrbxFNqwQuA2nfncDUfeQF1wORqxpud+NDR7yTSg0Psm?=
 =?us-ascii?Q?DSL5puxPcUeX0C7JlSQ2sUaWpPKDO/umVWTpsXopEFT+dpawmFnbAru3GOBQ?=
 =?us-ascii?Q?b0YQIZwGxFTGXxIw4MS2zAaWTYh40e+Kzt8sK/ro9bDuDJ/woaj2q/UvHF/C?=
 =?us-ascii?Q?ezABMtiiRR4uLkr5Nq6BP3jYPSo6u/+Qqo6DSIAd5LbgESsI3VriWDP5NbrJ?=
 =?us-ascii?Q?4r9atDKu2s3v8YvEwXsjVzG/uUA9jMC7aUUm4ZxF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(203893001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 06:38:23.8778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f80ff6c5-bdbe-462b-5d77-08de20ece9c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFDF2DDE6CD

Add METRICS_TABLE_ID (7) and use it when requesting the metrics
transfer table instead of the hard-coded literal. This clarifies the
meaning of the argument to amd_pmf_send_cmd() and centralizes the table
ID definition for easier maintenance.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 2 +-
 drivers/platform/x86/amd/pmf/pmf.h  | 1 +
 drivers/platform/x86/amd/pmf/spc.c  | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index a659cedc4533..a6a5d416edf9 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -131,7 +131,7 @@ static void amd_pmf_get_metrics(struct work_struct *work)
 
 	/* Transfer table contents */
 	memset(dev->buf, 0, sizeof(dev->m_table));
-	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, 7, NULL);
+	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, NULL);
 	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
 
 	time_elapsed_ms = ktime_to_ms(ktime_get()) - dev->start_time;
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 19e413bd89bc..561919b9f671 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -122,6 +122,7 @@ struct cookie_header {
 
 #define SET_CMD		0
 #define GET_CMD		1
+#define METRICS_TABLE_ID	7
 
 typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
 
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index b10229def18a..0a37dc6a7950 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -202,7 +202,7 @@ static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
 {
 	/* Get the updated metrics table data */
 	memset(dev->buf, 0, dev->mtable_size);
-	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, 7, NULL);
+	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, NULL);
 
 	switch (dev->cpu_id) {
 	case AMD_CPU_ID_PS:
-- 
2.34.1

