Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793983593;
	b=wIOQKo18bcXyz6z9pwvBEIha9cKi+0TAqsUp8A/VpKMAK9nmAD9LJM1tKXSRPr4JrVE2
	 dyN0Y3qj5hCv7JmhL204IROmalC6Jg6KOIc6j1iMum5ddAW/LjpyaUhe6AFp57gUYgLnm
	 mNZH8MVUFgG/Eu4O0D76wR+KZYLSXjHsZRWADNoh4r3i0R5smqPwJXlZrAoK3vEgrLpRA
	 ul5WYmnBfWKvh/CdSnXRLj+cB1rB/RIWu1HvLSgadOgb3o0zZQvrF158rFlJoctDkzhd9
	 Gm+VHhzQ4EB1WhketZE4YzlUaSFX+ljTA4aDif2sBIYwcLG/XR157LiUy+NR3C162Yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983593;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=mVTBUj0pZRKi8ENl/iY9NvCW2vHsYAYsGB/UM7VAfQ8=;
	b=5bl3bD6YXy9rN4BPCQoSM8JdFmsOxjEpwZ4g178eYzIR5EBoin6HOWI5QDz8dd+icIA2
	 bQZIJyn0XQcjuvA3YXxE04CP6APqjyILCt1u2LjRl6mUP+zJ21Q1jGBGfOp1D6+fMZpo4
	 imHnkiYXriEe2zoS9kpwIJHrj+FgHpG7Elci9qSjNZhMhmUxRj4jyUyMuU5tjwq6MeXWX
	 L2mGLN8ma9X8rBlGcyzzpXb7OX264RERij7ddWiWmSjrjcm1VyBpG1liH+wgNO9uOf+It
	 Oyb95tOXWhc+AusNzgcxiN7+0Yc4Wd9GPNl+0gfOYCMNwWveACklJK7b0+g7lgIextQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=UIUL0lyF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.18
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012018.outbound.protection.outlook.com [52.101.43.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E707A606A326
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 16:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E707A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=UIUL0lyF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGpYODCu36EPeG1uwdWkiOCyD6rdmJZQuCTs5N8w22q2DEdxYWAE12x+Qfho2vHWS2j7hRjaccUN+9IiaYLomKL5uImdSeYaxGB5frkwSwAFMjALBXhifiuHa6lT/tEIIW2KGr5rrsmsfkhiE7SHf6VU1Eu3XplORhtdFHpirKdfeUx3AEisAIM7ivrnv/HKdKEe1YbjrBYcHu4QaI68ixVmIUrqNyWZefLG4fckTiAjPPvYSYhX7LGOi1okBafoXCh2gUCnDS1OrNudLJbbAw6dkUZoXpkNEOWaHOd+Y+2HesJf17IwKt0Pqoa2xet1c61Dxiun33gFeuv8EoeqIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVTBUj0pZRKi8ENl/iY9NvCW2vHsYAYsGB/UM7VAfQ8=;
 b=FQS2v5gr8EXTWuYn5GS/EazHauU8FzhUIxi02n+e9GuG1dONA0+ISwgNlQAEdOaw4i5yNUYT43L0hIj8FDxmSw3WUPlaACerT+V/jBTPnymxLeRDrVVb6eNOefuNaLPJDcT4yNiOzoO3AFy++a/cZamoTi58/UpHzpwiMYtrQf3Sst7b02Okw/+TJ9x+dWGDjECF2NBdSdkdMl95qVOQrJMqgQgrQXye/RPpnm3bNFM7EgJ7eCqbzDE+ziD+sLaM0A3GTeypv/oFWEEcnFHvcMMl0/rG25Gr/gKBSKYry1zWZ8w9xWF0UfGtWJ+A8VEmR2/ENGf+9oL3UCi8cTxuUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVTBUj0pZRKi8ENl/iY9NvCW2vHsYAYsGB/UM7VAfQ8=;
 b=UIUL0lyFIYYRKOgZ3CwW4wrcu7R86Y7/ZU1xYHKotzZte9zQZvLVWMV8sOIyKBoW+TvYI6EuVEqHKD6pbAk7kXPR9W23qqCz29sb1WIayYL5vKu71X68jiU0RKnLy5xlCCtxvVJ9BwAl8la0hVQF8Jjamxp0kBa4+ZjSpbgnQGY=
Received: from MW4PR04CA0386.namprd04.prod.outlook.com (2603:10b6:303:81::31)
 by SN7PR12MB7179.namprd12.prod.outlook.com (2603:10b6:806:2a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 16:46:24 +0000
Received: from BY1PEPF0002695A.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::63) by MW4PR04CA0386.outlook.office365.com
 (2603:10b6:303:81::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:46:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0002695A.mail.protection.outlook.com (10.167.244.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:46:22 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 10:46:15 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v2 02/10] platform/x86/amd/pmf: Add 1AH_M80H static slider support
Date: Fri, 6 Nov 2026 22:14:21 +0530
Message-ID: <20261106164429.30738-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106164429.30738-1-Shyam-sundar.S-k@amd.com>
References: <20261106164429.30738-1-Shyam-sundar.S-k@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002695A:EE_|SN7PR12MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: 37665647-4b1a-4e52-9227-08df3c257d86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|261028144727099003|261026121527099003|11063799006|56012099006|261021121427099003|261009223027099003|261022105027099003|261022075727099003|261102123227099003|261021123027099003|261026140227099003|10067099003|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	zHF+d1fzyDjSLXDj8MQ+WdiuxXgwlWV8hflZ2C1eNdtPJZtALzviDyHfnJjEm1Y/wyuG++g8cRGkjUnalgb7kWBZ2thtZ+/7MNpQUnuZsDrefWF4SAPAnNdC/jBPBVG/bzLzhp+wxEL8Q+Qx3oS0iHuz6VNzuM7ZvCUdEJ64qLBYfL44jSv2+wp2HifcxcQT2NczyzEwMzb2jp8WDVvRwO/tQA5Az7e1VST5zlOuicElPqIdl8pD8F++OzTbYNmhOxYszkdcp8ou0suRi0qNChXpwvFqSA++GJkHyMTgDmjV8NnjsmwyWvwTBSjm/5wmmquQ0/wTelEUVPInkgSDd8PE3rlm/DgCaumTHEf7nAujYzl+FW4Rkwel60ml15atuLd6fHMCmw1R07/RljbRuuQX/yHCeEqvpNJHNAffUBg5paHlW6ftoxpQ6ndh04H+96QU7Pf0UchqDeSxC8FVZA2kBfVutLlRCKckmICOePEAMlPbgQeNI+MXYmQwIjIMJjPAZDjMpN2re6i6n2u677rYvJ9L8VGbxlsjLlD6H76NXmg8uRmk7xDMvNcJoYMytKLgvApQWEivlr/7sieOq+6CKQ2N0/qha7nkYjMYuCVeqDZbh0+MKfwL42tOKYzG/gN4zcN1o1GeufKUN8ERt8DH9jugrMYE2D+CVe/RDXsT+J1obFC9wTKgDHXoni1w0ETqjzQ2x2uqgU1EPJWnZQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(261028144727099003)(261026121527099003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261022105027099003)(261022075727099003)(261102123227099003)(261021123027099003)(261026140227099003)(10067099003)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Gaa/jcynABP8xHeKtTRGtA2ZpnKmwlCy1HUK/YPw5eWGXQoCWWmyfeR4JUHiTC5tOI4RwU8W4azWHzqkVotlW/oBov580hJ3SG8PYVTsGD+JTZFrHcatRaZw+NJIGXlcTBxWi1X1gVRBFV7roY42CH0WdQ3X8lmriRJtlnO5BGdn6Zud2z3bI8IPgOPRnpYKKaSphwQJFfZGsMn6D4T1tejAfggGN49a1JKIoC26MUmD9tYz3tm7BXuzl5c3NmI3ESPtafTGfCtRPC/uyVJuZNIpLNRbhscOtDgKHtmjiq6USzgxZDaK5iqKZ16EGObOtR/Ac5HTXS7ex7bet1jNGYaheVVCsqNYbgBPpRczOw8OJp/4trXHaUH6nz857jLYiMUyyZg1yLw4Xzjj254rgiElNRdeNlRFDaXAZ3fwdP20TPd93shwT8fC7eAfZV4j
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:46:22.6062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37665647-4b1a-4e52-9227-08df3c257d86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002695A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7179

1AH_M80H follows APMF specification 2.03, which changes the APTS table
layout and uses a different set of SMU message IDs to program the
static slider power limits.

Add the new APTS table structures and use them on 1AH_M80H to read the
slider defaults from the BIOS and to program them with the new SMU
message IDs. Other platforms keep using the existing path.

If reading the APTS defaults fails, do not program the slider limits on
1AH_M80H, so that zeroed limits are never sent to the SMU.

Key changes include:
 - Add the 1AH_M80H SMU message IDs for SPPT, FPPT and STT limits
 - Add struct amd_pmf_apts_output_v2 as per APMF 2.03
 - Add amd_pmf_load_apts_defaults_sps_v3() and amd_pmf_update_slider_v3()

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 45 ++++++++++++++
 drivers/platform/x86/amd/pmf/sps.c | 97 +++++++++++++++++++++++++++++-
 2 files changed, 140 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index b29c5192d878..226c3aa50500 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -82,8 +82,15 @@ struct cookie_header {
 #define SET_PMF_PPT_APU_ONLY   0x26
 
 /* Message IDs for 1AH_M80H platform */
+#define SET_1AH_M80H_STT_MIN_LIMIT		0x06
+#define SET_1AH_M80H_STT_LIMIT_APU		0x07
+#define SET_1AH_M80H_STT_LIMIT_HS2		0x08
 #define GET_1AH_M80H_METRICS_TABLE_LOG_SAMPLE	0x0E
 #define GET_1AH_M80H_METRICS_TABLE_DRAM_ADDR	0x0F
+#define SET_1AH_M80H_PMF_FPPT_APU_ONLY		0x10
+#define SET_1AH_M80H_PMF_SPPT_APU_ONLY		0x11
+#define SET_1AH_M80H_PMF_FPPT_SPM		0x12
+#define SET_1AH_M80H_PMF_SPPT_SPM		0x13
 
 /* OS slider update notification */
 #define DC_BEST_PERF		0
@@ -173,11 +180,34 @@ struct amd_pmf_apts_output {
 	u8 stt_skin_temp_limit_hs2;
 } __packed;
 
+/* As per APMF Spec 2.03 */
+struct amd_pmf_apts_output_v2 {
+	u16 table_version;
+	u32 fan_table_idx;
+	u32 pmf_slow_ppt;
+	u32 ppt_pmf_apu_only;
+	u32 stt_min_limit;
+	u8 stt_skin_temp_limit_apu;
+	u8 stt_skin_temp_limit_hs2;
+	u32 pmf_fast_ppt;
+	u32 ppt_fast_pmf_apu_only;
+} __packed;
+
+struct amd_pmf_apts_granular_output_v2 {
+	u16 size;
+	struct amd_pmf_apts_output_v2 val;
+} __packed;
+
 struct amd_pmf_apts_granular_output {
 	u16 size;
 	struct amd_pmf_apts_output val;
 } __packed;
 
+struct amd_pmf_apts_granular_v2 {
+	u16 size;
+	struct amd_pmf_apts_output_v2 states[APTS_MAX_STATES];
+};
+
 struct amd_pmf_apts_granular {
 	u16 size;
 	struct amd_pmf_apts_output val[APTS_MAX_STATES];
@@ -1115,6 +1145,11 @@ static inline bool amd_pmf_supports_accumulator_metrics(struct amd_pmf_dev *pdev
 	}
 }
 
+static inline bool is_amd_pmf_1ah_m80h(struct amd_pmf_dev *pdev)
+{
+	return pdev->cpu_id == PCI_DEVICE_ID_AMD_1AH_M80H_ROOT;
+}
+
 /**
  * fixp_q88_fromint: Convert integer to Q8.8
  * @val: input value
@@ -1143,6 +1178,16 @@ const char *amd_pmf_source_as_str(unsigned int state);
 int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
 int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf);
 
+static inline int
+apts_get_static_slider_granular_v3(struct amd_pmf_dev *pdev,
+				   struct amd_pmf_apts_granular_output_v2 *data, u32 apts_idx)
+{
+	if (!is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
+		return -EINVAL;
+
+	return apts_if_call_store_buffer(pdev, apts_idx, data, sizeof(*data));
+}
+
 static inline int
 apts_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
 				   struct amd_pmf_apts_granular_output *data, u32 apts_idx)
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index b0031afae33b..938ce34e7f94 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -8,11 +8,18 @@
  * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  */
 
+#include <linux/array_size.h>
+#include <linux/dev_printk.h>
+#include <linux/printk.h>
+#include <linux/string.h>
+
 #include "pmf.h"
 
 static struct amd_pmf_static_slider_granular_v2 config_store_v2;
 static struct amd_pmf_static_slider_granular config_store;
 static struct amd_pmf_apts_granular apts_config_store;
+static struct amd_pmf_apts_granular_v2 apts_config_store_v2;
+static bool apts_config_store_v2_valid;
 
 #ifdef CONFIG_AMD_PMF_DEBUG
 static const char *slider_v2_as_str(unsigned int state)
@@ -97,6 +104,27 @@ static void amd_pmf_dump_sps_defaults_v2(struct amd_pmf_static_slider_granular_v
 	pr_debug("Static Slider APTS state index data - END\n");
 }
 
+static void amd_pmf_dump_apts_sps_defaults_v2(struct amd_pmf_apts_granular_v2 *info)
+{
+	int i;
+
+	pr_debug("Static Slider APTS index default v2 values data - BEGIN\n");
+
+	for (i = 0; i < ARRAY_SIZE(info->states); i++) {
+		pr_debug("Table Version[%d] = %u\n", i, info->states[i].table_version);
+		pr_debug("Fan Index[%d] = %u\n", i, info->states[i].fan_table_idx);
+		pr_debug("PMF Slow PPT[%d] = %u\n", i, info->states[i].pmf_slow_ppt);
+		pr_debug("PPT PMF APU[%d] = %u\n", i, info->states[i].ppt_pmf_apu_only);
+		pr_debug("STT Min[%d] = %u\n", i, info->states[i].stt_min_limit);
+		pr_debug("STT APU[%d] = %u\n", i, info->states[i].stt_skin_temp_limit_apu);
+		pr_debug("STT HS2[%d] = %u\n", i, info->states[i].stt_skin_temp_limit_hs2);
+		pr_debug("PMF Fast PPT[%d] = %u\n", i, info->states[i].pmf_fast_ppt);
+		pr_debug("PPT Fast PMF APU[%d] = %u\n", i, info->states[i].ppt_fast_pmf_apu_only);
+	}
+
+	pr_debug("Static Slider APTS index default v2 values data - END\n");
+}
+
 static void amd_pmf_dump_apts_sps_defaults(struct amd_pmf_apts_granular *info)
 {
 	int i;
@@ -119,8 +147,34 @@ static void amd_pmf_dump_apts_sps_defaults(struct amd_pmf_apts_granular *info)
 static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *data) {}
 static void amd_pmf_dump_sps_defaults_v2(struct amd_pmf_static_slider_granular_v2 *data) {}
 static void amd_pmf_dump_apts_sps_defaults(struct amd_pmf_apts_granular *info) {}
+static void amd_pmf_dump_apts_sps_defaults_v2(struct amd_pmf_apts_granular_v2 *info) {}
 #endif
 
+static int amd_pmf_load_apts_defaults_sps_v3(struct amd_pmf_dev *pdev)
+{
+	struct amd_pmf_apts_granular_output_v2 output;
+	int i, ret;
+
+	memset(&apts_config_store_v2, 0, sizeof(apts_config_store_v2));
+	apts_config_store_v2_valid = false;
+
+	for (i = 0; i < ARRAY_SIZE(apts_config_store_v2.states); i++) {
+		ret = apts_get_static_slider_granular_v3(pdev, &output, i);
+		if (ret) {
+			dev_err(pdev->dev, "Failed to read APTS v2 defaults: %d\n", ret);
+			return ret;
+		}
+
+		apts_config_store_v2.states[i] = output.val;
+	}
+
+	apts_config_store_v2_valid = true;
+
+	amd_pmf_dump_apts_sps_defaults_v2(&apts_config_store_v2);
+
+	return 0;
+}
+
 static void amd_pmf_load_apts_defaults_sps_v2(struct amd_pmf_dev *pdev)
 {
 	struct amd_pmf_apts_granular_output output;
@@ -190,6 +244,30 @@ static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
 	amd_pmf_dump_sps_defaults(&config_store);
 }
 
+static void amd_pmf_update_slider_v3(struct amd_pmf_dev *dev, int idx)
+{
+	amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_SPPT_SPM, SET_CMD,
+			 apts_config_store_v2.states[idx].pmf_slow_ppt, NULL);
+	amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_SPPT_APU_ONLY, SET_CMD,
+			 apts_config_store_v2.states[idx].ppt_pmf_apu_only, NULL);
+	amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_MIN_LIMIT, SET_CMD,
+			 apts_config_store_v2.states[idx].stt_min_limit, NULL);
+	amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_LIMIT_APU, SET_CMD,
+			 fixp_q88_fromint(apts_config_store_v2.states[idx].stt_skin_temp_limit_apu),
+			 NULL);
+	amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_LIMIT_HS2, SET_CMD,
+			 fixp_q88_fromint(apts_config_store_v2.states[idx].stt_skin_temp_limit_hs2),
+			 NULL);
+	amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_FPPT_SPM, SET_CMD,
+			 apts_config_store_v2.states[idx].pmf_fast_ppt, NULL);
+	amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_FPPT_APU_ONLY, SET_CMD,
+			 apts_config_store_v2.states[idx].ppt_fast_pmf_apu_only, NULL);
+
+	if (is_apmf_func_supported(dev, APMF_FUNC_SET_FAN_IDX) &&
+	    apts_config_store_v2.states[idx].fan_table_idx != FAN_INDEX_AUTO)
+		apmf_update_fan_idx(dev, true, apts_config_store_v2.states[idx].fan_table_idx);
+}
+
 static void amd_pmf_update_slider_v2(struct amd_pmf_dev *dev, int idx)
 {
 	amd_pmf_send_cmd(dev, SET_PMF_PPT, SET_CMD, apts_config_store.val[idx].pmf_ppt, NULL);
@@ -264,7 +342,14 @@ static int amd_pmf_update_sps_power_limits_v2(struct amd_pmf_dev *pdev, int pwr_
 		return -EINVAL;
 	}
 
-	amd_pmf_update_slider_v2(pdev, index);
+	if (is_amd_pmf_1ah_m80h(pdev)) {
+		/* Do not send zero limits when the APTS defaults were not read */
+		if (!apts_config_store_v2_valid)
+			return -ENODATA;
+		amd_pmf_update_slider_v3(pdev, index);
+	} else {
+		amd_pmf_update_slider_v2(pdev, index);
+	}
 
 	return 0;
 }
@@ -418,12 +503,20 @@ static const struct platform_profile_ops amd_pmf_profile_ops = {
 
 int amd_pmf_init_sps(struct amd_pmf_dev *dev)
 {
+	int ret;
+
 	dev->current_profile = PLATFORM_PROFILE_BALANCED;
 
 	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
 		if (dev->pmf_if_version == PMF_IF_V2) {
 			amd_pmf_load_defaults_sps_v2(dev);
-			amd_pmf_load_apts_defaults_sps_v2(dev);
+			if (is_amd_pmf_1ah_m80h(dev)) {
+				ret = amd_pmf_load_apts_defaults_sps_v3(dev);
+				if (ret)
+					return ret;
+			} else {
+				amd_pmf_load_apts_defaults_sps_v2(dev);
+			}
 		} else {
 			amd_pmf_load_defaults_sps(dev);
 		}
-- 
2.34.1

