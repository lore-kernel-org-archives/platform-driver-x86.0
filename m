Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2064.outbound.protection.outlook.com [40.107.96.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3A917C9E7
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 14:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723471829; cv=fail; b=rS4vMgB05QtYy53stuRueZmvMGkLY7cy/QFQR7Sx9jGTcMjg2bS51TQLyK+SUcwOdRvEEqPUEcHTH8kn+rYKFYacJX/MpBJwnrVN6/u15SGgXNtYTj9qCIslE5jFqGVrTtol73R4aIdbdO8sNPdMU/xYd/nPF/YIxMjfZIkGwHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723471829; c=relaxed/simple;
	bh=w9Tz6YIH/KkI1/JRXhOa8bbQuOabtmvcq1Bv23BScgI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mDPPsYspkL/jnHcFVObZJ6XePiQ9AXbUz+Wwn/QZCUbu1u9vPE9wuytXuYRD7yrM3x3FKpOaStGx0jCpnkpCplzdMbxSH0rwPBT9xz4zmhBvTxFvwt0Pv7ZI1rK8DPoKuxQOr/qxTQMhBfMhE5nNJ18YEPw4H23EP3ui2Xyme/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=U0r/tZCD; arc=fail smtp.client-ip=40.107.96.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="U0r/tZCD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmMsNYG3kwY9bIQbQJXO4PL+YP6ALofFuGAlCaSnue1f54gEkOtcyGljCSB36peD0IWa0UkFUKMouW1re+TX2o7mJX3YJ30V4UgcpM5JJWPx0J77Jbemf8fxyisbHB+i9q9h4j+0sp6A4Xfxo7KjoI2EgjhS47mlxei1KWQT5Hx9+BT3kJY0ClkYHXqd1DLMRsHTxGfrAAF+TaACi8szcKLgV9EM5+BjoL4nujVrqOc7m2L3jNk1LIKZOlQaj9rYHMNIVgaco5SHJK2KX7GielWILQap36vZggQtn+JOIqTL3WgPXpGqViK5R/7V0HWc4DxsO0Udve6lIx0eYWSPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLX454EkOKlJyipfPO/aGIMEa0XG7r3pXiOddOD6kTs=;
 b=yo0jaH4/gzkHbqwMh6UJm4B+B+oozxXKW8N4aZqbSUTol7KSTQeYqakiTpcVG8PSzEotiF2lQi99YRfPbMxaAj7shFsKI+I5kO0ZKJclkVZgsnjzcDHKgfyabVxWjG8TKy3+Z46+1k9k38crzVS57rOQtPb3H2++DdfSaWf/G5jhzZ6vJeEHLux0ZgGsgOMxm8d8KwIIw6mk3VxDYDbeLuYN9745ag7oX+h6hUMHzcNGgHvqttiXrEFaVrQQoKlwL3Z82UxhTD5CKC4invNSl0vZXyqtgLdrGRQ+9aoVe2g/pTR00++gh8SYcuJE0J2vt2zym34+xkPkBdBWZRa2rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLX454EkOKlJyipfPO/aGIMEa0XG7r3pXiOddOD6kTs=;
 b=U0r/tZCDyXQHbytmND9SP07ROQqAM8nkwjYnFLuDDeYZPd3t2uMTmmtkKp00yOsP4TGiKEom7raffVeqSRKzDFvC5UhEIL8p4B4g0GvMyf2svklr0ahPVA1rWRxJ2BcCQHYIHNybhD/u3f1HOYcKpMkTfyYAzH5A85gRCUzfavc=
Received: from SA0PR11CA0076.namprd11.prod.outlook.com (2603:10b6:806:d2::21)
 by MW4PR12MB7030.namprd12.prod.outlook.com (2603:10b6:303:20a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.17; Mon, 12 Aug
 2024 14:10:24 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:d2:cafe::8a) by SA0PR11CA0076.outlook.office365.com
 (2603:10b6:806:d2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33 via Frontend
 Transport; Mon, 12 Aug 2024 14:10:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Mon, 12 Aug 2024 14:10:24 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 09:10:21 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/2] platform/x86/amd/pmf: Relocate CPU ID macros to the PMF header
Date: Mon, 12 Aug 2024 19:39:50 +0530
Message-ID: <20240812140951.310550-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|MW4PR12MB7030:EE_
X-MS-Office365-Filtering-Correlation-Id: 14c72d85-fbab-449e-05a0-08dcbad88245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7q5KzLyY0upGWZcUjhTYD09uGGYEJj3fVNQ/+3cSNfnmERXmnSoe8VHeZCVn?=
 =?us-ascii?Q?RJeKYc7GWofZHZmXurF28S+6/M0aLWYm0iRBAYEvPfCxAGkCPXpBhwYDyLG7?=
 =?us-ascii?Q?Y6In10ELx5ofu4dCqVfQICjP2cM1dWk4vrYQbGDpgd3rv2Vli3jOqJl4Q3Eo?=
 =?us-ascii?Q?qD/fbnQgb8THKZxO9oDCFg0KFeaPqvw5UmYvyo6uDVkREa2GP/59KW1lpRhP?=
 =?us-ascii?Q?LQUWEAUeA3DktHpN2mB/fWAGLYDxlWnb2AhwL0y69y7fZdImcIhf/eUFDomI?=
 =?us-ascii?Q?hxpRSkeGUZcvZZgCD8WDhuQgdlbEamlusCAwPTgaS+jUg/dp3hg3qeOQvF3e?=
 =?us-ascii?Q?pAV2tpKIicuRHraH3yISjcchxCeXQeXSYUZGbAVjtbp/iKe8sInPPulG669s?=
 =?us-ascii?Q?Dpa8H8xe7vFlvWESpbin6WSJcLRgapP6W6Y15rCagim3DfEYfzAe7p081n9L?=
 =?us-ascii?Q?QBaMyefHPNyra+yL6/LoIobXrkwejRgr9uSdMfd+TUe+Sb/ikQF+PW0VnQG1?=
 =?us-ascii?Q?XCIqaOLlTXcQ8JU7jAOH2hURmuoMyaqv9C4nchczGOb+qOEueF1yLPODlIPd?=
 =?us-ascii?Q?egA4qHM32FFuBHQk5xmGQh6/IzGZHB36hgoS/0Jnc7oYpyP9qecQAqJilbIX?=
 =?us-ascii?Q?NBbT11iazj+3RyrSQz7F/ZGxC3t8OiV7wYXQDqmiQVyusEuuOkzGDRfpeB3/?=
 =?us-ascii?Q?uUrjG6d7NXmYAL0QdI337c9MLgz9klrTo7QhKABD2gA7qn2hBmycUlSrjMgm?=
 =?us-ascii?Q?tHEWGaN8PJAUFR27SENobV5OSHbgvVcmrjeDb6uT83n4J5YsQmC+w85w6Yyc?=
 =?us-ascii?Q?iKSy7PW0bgvmekwh/x5/lrjwBkylEXKA4oEMPYPyF4EfrJmMbtouQ6M+hxAa?=
 =?us-ascii?Q?687aDulyg4Wkzy3BPQxupHevh5HIOvdykX9ugHe40HOJvAbYGmuo8KfhjKbo?=
 =?us-ascii?Q?zwLvVdiHTmqWd9iemYBkEBiTPz9tI5JNUsHVPx80d8sL+Bdh6vC1i8lsOIVk?=
 =?us-ascii?Q?oljjKKFnyfm+1EC0+D5wABUxuBWnKyjT/lvYzffNDaAQwwcLbowPfzl2DGZ4?=
 =?us-ascii?Q?865CfRMi/WJ2RZIFcuVNDMSKkh3nwRF7TQlhyDI12AgAsmVlyk+NsAWBuTZs?=
 =?us-ascii?Q?gjNNvPjkQ7MF2eXbJW/n+FV3JiHrh7WaKA/1lfypXKSvmb6p8grVVBoLuHi2?=
 =?us-ascii?Q?AlR+yOFOnJC9lrU+Vmf7TGoBqnN6mJLgOxBYAqpazIg2PyTGloVaB1AtuZDD?=
 =?us-ascii?Q?FURuj8uCYpz+DgBBGlw2GysXPMfeQk1IQPcTfnuSPxtXReESGpuUqUDt1wel?=
 =?us-ascii?Q?MUANoiPtZHR2idQFQS0wzsuyBA2kCmyT68IyvQxJ3GhSLKxO6fwly2YTY0Co?=
 =?us-ascii?Q?LcUUxxibind0xBLXIUuz1W71t34j5jlBN9FyS1NR39sN76Cx8IVlT80CWueF?=
 =?us-ascii?Q?ygO0CmEQ2xC396P6AsynvHIybbCH7HEM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 14:10:24.0094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c72d85-fbab-449e-05a0-08dcbad88245
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7030

The CPU ID macros are needed by the Smart PC builder. Therefore, transfer
the CPU ID macros from core.c to the common PMF header file.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 6 ------
 drivers/platform/x86/amd/pmf/pmf.h  | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 8f1f719befa3..88314b0277a3 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -37,12 +37,6 @@
 #define AMD_PMF_RESULT_CMD_UNKNOWN           0xFE
 #define AMD_PMF_RESULT_FAILED                0xFF
 
-/* List of supported CPU ids */
-#define AMD_CPU_ID_RMB			0x14b5
-#define AMD_CPU_ID_PS			0x14e8
-#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT	0x1507
-#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT	0x1122
-
 #define PMF_MSG_DELAY_MIN_US		50
 #define RESPONSE_REGISTER_LOOP_MAX	20000
 
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 9bf4326d06c3..9fc26f672f12 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -19,6 +19,12 @@
 #define POLICY_SIGN_COOKIE		0x31535024
 #define POLICY_COOKIE_OFFSET		0x10
 
+/* List of supported CPU ids */
+#define AMD_CPU_ID_RMB                  0x14b5
+#define AMD_CPU_ID_PS                   0x14e8
+#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
+#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
+
 struct cookie_header {
 	u32 sign;
 	u32 length;
-- 
2.25.1

