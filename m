Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2066.outbound.protection.outlook.com [40.107.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4772F8BE7
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Sep 2025 11:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724534; cv=fail; b=arOmHYoIhOh+00NsRW1OcW1iTX4OBnlh8exZhe8afUom7jpEb5wGlpbxD1+XuCF0iNAMyMW4doxPosD5V8ykwH+4jP7IrauY6BIOaM4+poJv+SP2q9wuPaM1JH0W4k0ytukO3Dl1/C+uCUU14Wb+u60qpCMPs05lhY9GLqqMW2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724534; c=relaxed/simple;
	bh=gK8S3W0iNqMozoHmZtySE4+v4MXABW6xSbQ2LRdiiMk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=reh231E2NTm58rrHu/YZnqU+suxfVHoK+GDhzzr0hp+meTkTbVPWjodcOhplFzB1P2EGFWtVsZivmxouqmSDKZU5x558y7j1eXdFXkIgJRIg6OIwXcvRkeZZBhfdtcYfYWlM6+14Neu9d+anVjGAlMp5WCrTiH4gP3Ol+ewqRxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WsiTqFs+; arc=fail smtp.client-ip=40.107.95.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WsiTqFs+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBN25pCrLfRUSuM5OtizRwMnGUYYFX851wmiz9vlfLNE3nfnT/OVBTtDXKgp0jjfIPgF2eNBQi3rPKbdIc6IYseVqvQuFzOQSTbJzPfQUcr7CPxs/q4UK0HQWy4hYlI+fd3WdWiv3OnhC7cLUMayDMba5sn7rwKOhsyX/bYrV/v8kJT5hK02GBpfHO/1yT9cMCZEbohdtc26BMtePXI1uqnS2gHMd0HlmGIKYEyZjKxu0EaPVSxOxPqFo1bK0c8oWj5OlwA3kwY2lgTO2RbN91b/LyQ1upZQXn84D0VnhA1YYURKHKVDODgYOmv+/dSDZ+82NZXMlRFTCIiMmD8jYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1zqw5gtX7wG28Je24VEI6iwvcVIkUdKuduUwFnF8Ms=;
 b=EvzY6TR6qD108kt0PHrVEk0bn7SQDQakYXC/YtPRSU1xG0PyxroTMV4DmGdXZUISkLa5S3YUqYMuYdUtByu9M0/nl3hHlSEKCl5VXAjuaE6VKeBTEtACZ1VDGx4m0tfryw1aEqkuBqwqfNBt+QEix8IrOoXFyf6YkqSQjUwSNeVoajnI4HXrC2n4c/KXU568pDhM5rPRq8f3T9zq0igyNE4bXEr2PqMTYhXb1I1hs29r8TJm4I8AAmdq5JtF/uiJ6FY+kvmIhJptqoKKWtDHBcf+2mL7S7s23E0R5mAGSE/e18P7LSeUJ1IRsyFb7ntWIiHuyT7ALwcuSCuH5Ak+nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1zqw5gtX7wG28Je24VEI6iwvcVIkUdKuduUwFnF8Ms=;
 b=WsiTqFs+IZBCw/HBR5HzaIDEuzCQpaxbQQtDdUpsavBrRHDLo9X2Qnn5io5uOgRDz0g4BOWm/MbDvXkETVa8Mr1mD9oIxueUyFg4jfQxuiD1dn0AMzKNSgAJi/S6e8CS3wqNnUsnGYwYDZikxX/IbH8aK6Id+s3J1657YpCs9OQ=
Received: from MN2PR05CA0064.namprd05.prod.outlook.com (2603:10b6:208:236::33)
 by IA1PR12MB6281.namprd12.prod.outlook.com (2603:10b6:208:3e7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Mon, 1 Sep
 2025 11:02:06 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:236:cafe::4f) by MN2PR05CA0064.outlook.office365.com
 (2603:10b6:208:236::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.15 via Frontend Transport; Mon,
 1 Sep 2025 11:02:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 11:02:06 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 06:02:06 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 1 Sep
 2025 04:02:03 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v5 RESEND 1/9] platform/x86/amd/pmf: Add support for adjusting PMF PPT and PPT APU thresholds
Date: Mon, 1 Sep 2025 16:31:32 +0530
Message-ID: <20250901110140.2519072-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901110140.2519072-1-Shyam-sundar.S-k@amd.com>
References: <20250901110140.2519072-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|IA1PR12MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: c11303b7-15ba-4e92-d1c8-08dde946fd8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1dPNVRXcnlVQnJHNEY5SjN2ZDNNcWZialNocnkxWW1WN1NVUEtLYVhDOWJY?=
 =?utf-8?B?U2g0eVFQajhCS3NuOGg4YVZUQ0VpUlorVWJOSFJUbm1JanZ3SEJzaXFoTlND?=
 =?utf-8?B?cW5abnZpOHRLMWhwYzFTdE5ZaHh4VmRJR2N0amtJWE80OWV3VW5FVUtFU1BE?=
 =?utf-8?B?RFVJSlB6RE1Ld0puTnU5YUxES2g2bWJlQnZkTTRGTER1ekx0RnpBYkVWb0NI?=
 =?utf-8?B?TUQ3cHYycHFBVDAwQmdqZnVEaTJSa0hVbDRTd0N2aEI0YmNjZ2JOOGdUam40?=
 =?utf-8?B?RWpsQlNKcCtDUER5SE9Gb2RNaENOenYxTTZZRS93Wmh3ZkpyL0RSTDQvSVdn?=
 =?utf-8?B?Q3gzclY0bzYySGZjZjJtZlE1TERVdWpmVXdQVjhKSFNjVFArZzEwZjZSSVp2?=
 =?utf-8?B?Qi9aaVBac2pldjBSaFl6YkUwVTRGMnpvQUdaOVZ0RW90WXRyRDNjUGVzM1p4?=
 =?utf-8?B?TGNNVlZqNHgrOGh1L2VVSTlHbXRlbFIvVWpVUmFqbk04WFBWWHhPMDAzOVpC?=
 =?utf-8?B?czZkd2swYytqTkVCVTBWby9UZlFpMHdZU0ppQmJkcXJWYkhuZlMrMGVkZDVN?=
 =?utf-8?B?WEhJOFk1L25pTHBEazA4Njkza3hNUytKVWJOQ283OUhLVmR2VEJsUkRhMzRk?=
 =?utf-8?B?dmdOUXdpWHVabFVYNlVmeERUbGZrdkVhL0YvR0M1MTk1dlBpdjU5U2VYR0lt?=
 =?utf-8?B?T1QweG53aTduUXBKbGN6NUJZSHQrOWJKVDdiS3owT0F0ai84UHppc0pMZ1pT?=
 =?utf-8?B?cVJCcFJCaFJNZHgvaGpwL0JXYXFQL0o4OGxLL0lxemF3anJCa0ZqcVppRkRv?=
 =?utf-8?B?clVVTkFQQW5HVGRaQndobTBCRTZtN2k4OTB6dlJuTEsrUjBvNjN6cno0MUVX?=
 =?utf-8?B?U0hrMWJxS0twSVZlQ0FzNW1CZWJZZWdBYnJKS0hnVEh0Y0VEVVpuUW9xaHVC?=
 =?utf-8?B?eHVlQzd3ZlkyYSsvSEtQMEZFeGlUTGxBUXpnNFQvQkRnNnVYVnRLREJ0V2Jt?=
 =?utf-8?B?QVRJNDM2d3ZBWk1mMm82Zyt6VEFtTllVLzVrbExHdTdQMmJ5bW1LeUhnWlpV?=
 =?utf-8?B?R0Q0dFhrSkw2ajNZTmVQSXZHQ29UT0UrSmdDVktiRmp3UElOTXNOdW1uN29W?=
 =?utf-8?B?WlhvaWlyNjRtMmtKUFR1bDFwcWlKVXZad0JDV1ZsSW5jVFNZRUdHd21Fc3NO?=
 =?utf-8?B?MzN2Umg1bDVORXZMcVEvWDN0M0daQVAzSlQrdmpBWTlwb2dvaENRZDFYc3d4?=
 =?utf-8?B?a2VXYkZ4eVVCemtUb1N6Qko3dnJ5cks3dEt3MVN2Ukg5elV3MW9EaUV6dlpq?=
 =?utf-8?B?bEJLMEhmZ0tIdElnUm01ZkU1SmVKdUEvbjRDVE9Jdk0vN2pjbkNFYlJrSStD?=
 =?utf-8?B?MlNqWHdwVDlEVW12UHh5ZEFOUHpLZnI2Y3p4Y1NON29kYzJjSW1tR0hNb2ZQ?=
 =?utf-8?B?aVBlT2xacTN2NDBWZDZhRDZyMGZtVWpVUlEwbWpMOHNBT25wMDdUNDFsbmhF?=
 =?utf-8?B?NXIxWngrL0ZHNDd2TEFvRVduOFozUE5uRXJTOERkV1N4TmJvSSswNitLZCt6?=
 =?utf-8?B?U25ld0tQWi90Um04c2dxcVJhWHduTUl0Ym5vd25RZThmQXlIRWgvamFPV21X?=
 =?utf-8?B?cTA2cXVqMUR6bU1ON3MwZjNDZHlGVDNYUHhCamxoUHlsRENVdlcrMnA3NHlZ?=
 =?utf-8?B?eU01Z1JkWUxNaStzaGoyQ0ZSaGViRzZZbkhVODBIY2tRdklzNHNLS1M2Z2hv?=
 =?utf-8?B?OW5xQVcrZUkvRzFrWVlhbUZhcmtHK0RpcXhmeUR2d2JILzlzNzFsZlh0c0N3?=
 =?utf-8?B?TDd0UlB0aGMyb05zUVdhU2k0M0VKS0RQTzYvRVNFUFI5VGlRTUZONlM0TzFJ?=
 =?utf-8?B?eE0xY25sRHRCOW5WSjYyeVp5QjR3VkdXZkZVOXFIbnd1MDlZNDNYWHp6cHFI?=
 =?utf-8?B?TWZqdGFqS0JhbEhjS3U1MEgxczhCWWt0VElDeCtCRXVmM2hyeWN5UHhSeVdr?=
 =?utf-8?B?Vk5oaEtPN1F0N3NJLzlxTDMwKzZtRzlIQTEvcG5pWUsrRVM5YnJjbUNtRmVG?=
 =?utf-8?Q?uTKxOs?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 11:02:06.6753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c11303b7-15ba-4e92-d1c8-08dde946fd8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6281

The most recent PMF Trusted Application includes enhanced features that
allow for modifications to PMF thermal parameters such as PPT and PPT APU.

This update introduces the necessary driver support to utilize these
capabilities.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    |  4 ++++
 drivers/platform/x86/amd/pmf/tee-if.c | 16 ++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 45b60238d527..1a5a8d70c360 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -93,6 +93,8 @@ struct cookie_header {
 #define PMF_POLICY_BIOS_OUTPUT_1				10
 #define PMF_POLICY_BIOS_OUTPUT_2				11
 #define PMF_POLICY_P3T						38
+#define PMF_POLICY_PMF_PPT					54
+#define PMF_POLICY_PMF_PPT_APU_ONLY				55
 #define PMF_POLICY_BIOS_OUTPUT_3				57
 #define PMF_POLICY_BIOS_OUTPUT_4				58
 #define PMF_POLICY_BIOS_OUTPUT_5				59
@@ -677,6 +679,8 @@ struct pmf_action_table {
 	u32 stt_skintemp_apu;	/* in C */
 	u32 stt_skintemp_hs2;	/* in C */
 	u32 p3t_limit;		/* in mW */
+	u32 pmf_ppt;		/* in mW */
+	u32 pmf_ppt_apu_only;	/* in mW */
 };
 
 /* Input conditions */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 4f626ebcb619..b29f92183b2a 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -147,6 +147,22 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 			}
 			break;
 
+		case PMF_POLICY_PMF_PPT:
+			if (dev->prev_data->pmf_ppt != val) {
+				amd_pmf_send_cmd(dev, SET_PMF_PPT, false, val, NULL);
+				dev_dbg(dev->dev, "update PMF PPT: %u\n", val);
+				dev->prev_data->pmf_ppt = val;
+			}
+			break;
+
+		case PMF_POLICY_PMF_PPT_APU_ONLY:
+			if (dev->prev_data->pmf_ppt_apu_only != val) {
+				amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, false, val, NULL);
+				dev_dbg(dev->dev, "update PMF PPT APU ONLY: %u\n", val);
+				dev->prev_data->pmf_ppt_apu_only = val;
+			}
+			break;
+
 		case PMF_POLICY_SYSTEM_STATE:
 			switch (val) {
 			case 0:
-- 
2.34.1

