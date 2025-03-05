Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2066.outbound.protection.outlook.com [40.107.100.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54D024A077
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Mar 2025 14:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741184911; cv=fail; b=XrIxCzsL06Qc1+RqVSsEEtOA+BG2/LY3pSuI+cJzxDEsH2RLpQxoHX7wJ+hzyO4wRWjJiUwNhChJQc2Yuk6NtgvYDsaVWap0Jixawdh1EljRec5EvZaKDDAq17BDjEXh6zpJm0mATgMTe6rymdK8lVVJTEEHKiGqaaCOjD3Ubys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741184911; c=relaxed/simple;
	bh=51K9CnFW/SVGMsqmbBrnaJT/1OaPi1J/Dr8Dawz/CcU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eGTomta/r26ml2LQugDh9uiLdLn+KWwIJ06taO4KPBdurYQOR+0r0ulskblNKAVJ/XxBEzfcHAE69IqrW/9bt3X41Lf+e7zl2PDOHURQynXEow6sW9hbp+yqddVbjLBghvVFZGaf5KUB+mLbfLXHd+5nWm9xlL2FORySVBaCrYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=J7+VEgvH; arc=fail smtp.client-ip=40.107.100.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="J7+VEgvH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mR68iCkjbeuMufOJSY1nyxY3zzDsxsV/cWGUZYvfnWu5hS9Wo/dWC4asyvdaeoxfxQwwROKLjqeyUSH0yLE8ZV1hnV5dp6+TuC0wKwcSBjhKPZDujn2lB+JHjCJp95ZEAAytaFu7EkOJ3DRNLSLwLxKMGL32VAz2XRLRIE4CyeZm+M8l/fNgFto7zoosbKNEK1HpgBOtlUuKlan84Vx+NLa1Xnw7j1FKrfWHftASMpbuWEIU4CSKye1iPul4fESg83fv9TQ7LWwBo3B3m+AWCJSthgsgMGUtqz9wL3PddgcD7+Pd12MjN/zSCsRlfXuxuJrloeF9+vWZ7yBsembHug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2So+/XMCFStmKc2Trc4JntAMbBkT0vAfPQKb0q+QD7U=;
 b=hKhOaJWEjEiHESmjfJgMDNrBOPTZBAXL2qYB6hAOIzuD0Qhps1HvaGex3H3oKe+7Ztkp2odcE75VtvgAZYznrVWxpjYotsKyLQJYg9RXVaEpmfFP2RAEt+tpGs4XJGgK+PmNb0nyMvajDd6QEImmQ/C84VWChuZA2NYKE3JvmPDInuGaQ2S8oHCa5SN8PAOibHkeiNNfVujR/HfZfc8e2oTvA25xJ2OMJIPFZWIM4frDgJFnPTpZcw3NZ5DrcnkPjEClknMtHXtypU4HM/PEx115QL3FhGhQsL8bYA+3nvy+3lbubV24kYgPc/zUOtAELywPTM90NqZGSG9jgF05vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2So+/XMCFStmKc2Trc4JntAMbBkT0vAfPQKb0q+QD7U=;
 b=J7+VEgvHeud5JTRZEsatB0FAFZLX+wmOM7QVi/lBE20a+eK/D9iaiErcIxxDjoT+L/hHgJ3XH+JLzvR2OACgniBFbK40BPCl5dSI1bkyDwBWeezVDeb3ALia5aRNXiFtm2V5mHSnfVRz9ToObAx19Y9rFZf2609BfYaskIDGzgE=
Received: from SJ0P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::8)
 by CH3PR12MB9026.namprd12.prod.outlook.com (2603:10b6:610:125::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 14:28:25 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:41b:cafe::67) by SJ0P220CA0021.outlook.office365.com
 (2603:10b6:a03:41b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Wed,
 5 Mar 2025 14:28:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Wed, 5 Mar 2025 14:28:25 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Mar
 2025 08:27:58 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/4] platform/x86/amd/pmc: Move macros and structures to the PMC header file
Date: Wed, 5 Mar 2025 19:56:13 +0530
Message-ID: <20250305142615.410178-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305142615.410178-1-Shyam-sundar.S-k@amd.com>
References: <20250305142615.410178-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|CH3PR12MB9026:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a65fd22-9c87-487e-8002-08dd5bf1fd70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uJFYhsYrhw6rcmDdRVyXyGtgStiyvyqx0VIcg34mbxKxMsNT/wHx4oEEwRYT?=
 =?us-ascii?Q?NW2IGClqU95Uy6cLxMdS4nPgyih6qzXzZbhtGoFZ/Nq+t+4NZCd1YK2x6zFI?=
 =?us-ascii?Q?AZAFLNrDzKbATA+zCY2YQJEWuM5yBwU41kmmzsdnTCoaMfSdn9rS6Q9LWOVL?=
 =?us-ascii?Q?SfMVn0gTZNUG+sIhNXDGWLKqNItXk9CNB/xYiKxHFgw8H4YBdU/RcjK33/jt?=
 =?us-ascii?Q?Bl7RC9YZ9M3t+th7wWTckml253CkS6dq4yLVQyY+UW9D4a1/gib/m0jBIuDY?=
 =?us-ascii?Q?phV/8FbzyZEUwLME0UiZoeJVvBBAJ6CvdRJBlX3GCVXpxGa/+wfLJ/tIUxA7?=
 =?us-ascii?Q?0+HZXZ8Qm5+8gQfBs3XMH8d0kKMP4XxZTs5sd0/v/a0AY1dWFmQmc83qKbLx?=
 =?us-ascii?Q?VE9PV5t5wFvWVGOswAHM/TKM0vNOiRE+cZrV7JUw74Bjb4JWkWVuSVz4uxz1?=
 =?us-ascii?Q?FaAlMfpZtkzC/RvVQlkKGZSjpP+Vm9TJkaAxgmivI3HPOMVQYPNfJ/C7Sv/X?=
 =?us-ascii?Q?cI7QdA/wypXBBi3INAe13Pm277QHd9MBn1ZlB7HMJOvRU31DBXjg7i0kZD+K?=
 =?us-ascii?Q?9P8QdeLg60oAbO3Q3gx+SM28NBIu1mmCpg6gnTdkdvrRFBXkOwM3DN/SzOPh?=
 =?us-ascii?Q?Fu7ZhFFAAEls2DwetT2Y2JCzbUM9Hcxqujk8xXo5dGCgcWldvG5hWUaHFgMf?=
 =?us-ascii?Q?ydCgQzcSiIU+vB8WbX8jq7GXkXkTCn5tW6Ye58b7636JaL0phucLJvkb20Ue?=
 =?us-ascii?Q?2p5QwZjd/ow9tPhcc4AxYYS+raaxIsCaUoWVQsuMqT4RrQOg7UaYF+hoh33/?=
 =?us-ascii?Q?JgKMbpfQOLXKAepUOaLIlAIT/O68Roi/iIvbQDd0/CjVrdGH9IMGjcVNoiLY?=
 =?us-ascii?Q?9XSLrdk5qLZAQDewSLCTa0eKIwxxvsUiKB5WT8zCb3sEw/NYaQx3klqlLsge?=
 =?us-ascii?Q?VwKNhaR4PiWKCzF+GZLsmvhUfgfG46LwuKEzs9h8I/30ZyB7ah8yS5z8oi6t?=
 =?us-ascii?Q?6F9jjfBfX0+A9XG8W7gcFKU0npk1lp2mfmg2jaYv18xWBI26/mvFyc3s2jiH?=
 =?us-ascii?Q?/tDqScyvx6hLMMkTHdwfW+IviasuiYxlqHOiYjKGKRMLLNOw6Gq96XUTECNV?=
 =?us-ascii?Q?sJ4R8fxsDCmKcyT4JXvSePQuqIFfBCLpL9SgZFv4fnfAlAamgUL+/5/RhYjl?=
 =?us-ascii?Q?Zug/WNePtvPDMyQl56JOUVyurCvQxXLihSO1Foibo0kDsmQH+hTkW72iK9Ql?=
 =?us-ascii?Q?IMGI7kSeA1e5xD3Z03lrLNbPH8EAiSoDTrL/AJa60uqjhbaQGtMlpJIvVQlA?=
 =?us-ascii?Q?5+DbB9S/jVhI/5L2ZkYRCaAGIV60KgvlSdssY5WGCJluTrDa7faL5ODjelmA?=
 =?us-ascii?Q?+sWqrVZRWvRDzBQE2/PxtjTXjycaOuoXpXAgH9fCcbZ+y5C7mLtv+7/Ooh98?=
 =?us-ascii?Q?807aWA2twXKbBojtt4XqnRyk+ZWyw6MXazAog3ymftXnLt5qqhp/ai8hN6gM?=
 =?us-ascii?Q?OsvopHbaAxa+ZQg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 14:28:25.2014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a65fd22-9c87-487e-8002-08dd5bf1fd70
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9026

To improve the code organization and readability, move the macros and
structures from the AMD PMC driver to the PMC header file.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
based on mainline with tip commit 48a5eed9ad58

v2:
 - no change
 
 drivers/platform/x86/amd/pmc/pmc.c | 81 ------------------------------
 drivers/platform/x86/amd/pmc/pmc.h | 81 ++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+), 81 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index c7c7afb8a431..742920530987 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -32,70 +32,6 @@
 
 #include "pmc.h"
 
-/* SMU communication registers */
-#define AMD_PMC_REGISTER_RESPONSE	0x980
-#define AMD_PMC_REGISTER_ARGUMENT	0x9BC
-
-/* PMC Scratch Registers */
-#define AMD_PMC_SCRATCH_REG_CZN		0x94
-#define AMD_PMC_SCRATCH_REG_YC		0xD14
-#define AMD_PMC_SCRATCH_REG_1AH		0xF14
-
-/* STB Registers */
-#define AMD_PMC_STB_S2IDLE_PREPARE	0xC6000001
-#define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
-#define AMD_PMC_STB_S2IDLE_CHECK	0xC6000003
-
-/* Base address of SMU for mapping physical address to virtual address */
-#define AMD_PMC_MAPPING_SIZE		0x01000
-#define AMD_PMC_BASE_ADDR_OFFSET	0x10000
-#define AMD_PMC_BASE_ADDR_LO		0x13B102E8
-#define AMD_PMC_BASE_ADDR_HI		0x13B102EC
-#define AMD_PMC_BASE_ADDR_LO_MASK	GENMASK(15, 0)
-#define AMD_PMC_BASE_ADDR_HI_MASK	GENMASK(31, 20)
-
-/* SMU Response Codes */
-#define AMD_PMC_RESULT_OK                    0x01
-#define AMD_PMC_RESULT_CMD_REJECT_BUSY       0xFC
-#define AMD_PMC_RESULT_CMD_REJECT_PREREQ     0xFD
-#define AMD_PMC_RESULT_CMD_UNKNOWN           0xFE
-#define AMD_PMC_RESULT_FAILED                0xFF
-
-/* FCH SSC Registers */
-#define FCH_S0I3_ENTRY_TIME_L_OFFSET	0x30
-#define FCH_S0I3_ENTRY_TIME_H_OFFSET	0x34
-#define FCH_S0I3_EXIT_TIME_L_OFFSET	0x38
-#define FCH_S0I3_EXIT_TIME_H_OFFSET	0x3C
-#define FCH_SSC_MAPPING_SIZE		0x800
-#define FCH_BASE_PHY_ADDR_LOW		0xFED81100
-#define FCH_BASE_PHY_ADDR_HIGH		0x00000000
-
-/* SMU Message Definations */
-#define SMU_MSG_GETSMUVERSION		0x02
-#define SMU_MSG_LOG_GETDRAM_ADDR_HI	0x04
-#define SMU_MSG_LOG_GETDRAM_ADDR_LO	0x05
-#define SMU_MSG_LOG_START		0x06
-#define SMU_MSG_LOG_RESET		0x07
-#define SMU_MSG_LOG_DUMP_DATA		0x08
-#define SMU_MSG_GET_SUP_CONSTRAINTS	0x09
-
-#define PMC_MSG_DELAY_MIN_US		50
-#define RESPONSE_REGISTER_LOOP_MAX	20000
-
-#define DELAY_MIN_US		2000
-#define DELAY_MAX_US		3000
-
-enum amd_pmc_def {
-	MSG_TEST = 0x01,
-	MSG_OS_HINT_PCO,
-	MSG_OS_HINT_RN,
-};
-
-struct amd_pmc_bit_map {
-	const char *name;
-	u32 bit_mask;
-};
-
 static const struct amd_pmc_bit_map soc15_ip_blk_v2[] = {
 	{"DISPLAY",     BIT(0)},
 	{"CPU",         BIT(1)},
@@ -165,23 +101,6 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
 	iowrite32(val, dev->regbase + reg_offset);
 }
 
-struct smu_metrics {
-	u32 table_version;
-	u32 hint_count;
-	u32 s0i3_last_entry_status;
-	u32 timein_s0i2;
-	u64 timeentering_s0i3_lastcapture;
-	u64 timeentering_s0i3_totaltime;
-	u64 timeto_resume_to_os_lastcapture;
-	u64 timeto_resume_to_os_totaltime;
-	u64 timein_s0i3_lastcapture;
-	u64 timein_s0i3_totaltime;
-	u64 timein_swdrips_lastcapture;
-	u64 timein_swdrips_totaltime;
-	u64 timecondition_notmet_lastcapture[32];
-	u64 timecondition_notmet_totaltime[32];
-} __packed;
-
 static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
 {
 	switch (dev->cpu_id) {
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index 8f39988ce7a3..62f3e51020fd 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -14,6 +14,59 @@
 #include <linux/types.h>
 #include <linux/mutex.h>
 
+/* SMU communication registers */
+#define AMD_PMC_REGISTER_RESPONSE	0x980
+#define AMD_PMC_REGISTER_ARGUMENT	0x9BC
+
+/* PMC Scratch Registers */
+#define AMD_PMC_SCRATCH_REG_CZN		0x94
+#define AMD_PMC_SCRATCH_REG_YC		0xD14
+#define AMD_PMC_SCRATCH_REG_1AH		0xF14
+
+/* STB Registers */
+#define AMD_PMC_STB_S2IDLE_PREPARE	0xC6000001
+#define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
+#define AMD_PMC_STB_S2IDLE_CHECK	0xC6000003
+
+/* Base address of SMU for mapping physical address to virtual address */
+#define AMD_PMC_MAPPING_SIZE		0x01000
+#define AMD_PMC_BASE_ADDR_OFFSET	0x10000
+#define AMD_PMC_BASE_ADDR_LO		0x13B102E8
+#define AMD_PMC_BASE_ADDR_HI		0x13B102EC
+#define AMD_PMC_BASE_ADDR_LO_MASK	GENMASK(15, 0)
+#define AMD_PMC_BASE_ADDR_HI_MASK	GENMASK(31, 20)
+
+/* SMU Response Codes */
+#define AMD_PMC_RESULT_OK                    0x01
+#define AMD_PMC_RESULT_CMD_REJECT_BUSY       0xFC
+#define AMD_PMC_RESULT_CMD_REJECT_PREREQ     0xFD
+#define AMD_PMC_RESULT_CMD_UNKNOWN           0xFE
+#define AMD_PMC_RESULT_FAILED                0xFF
+
+/* FCH SSC Registers */
+#define FCH_S0I3_ENTRY_TIME_L_OFFSET	0x30
+#define FCH_S0I3_ENTRY_TIME_H_OFFSET	0x34
+#define FCH_S0I3_EXIT_TIME_L_OFFSET	0x38
+#define FCH_S0I3_EXIT_TIME_H_OFFSET	0x3C
+#define FCH_SSC_MAPPING_SIZE		0x800
+#define FCH_BASE_PHY_ADDR_LOW		0xFED81100
+#define FCH_BASE_PHY_ADDR_HIGH		0x00000000
+
+/* SMU Message Definations */
+#define SMU_MSG_GETSMUVERSION		0x02
+#define SMU_MSG_LOG_GETDRAM_ADDR_HI	0x04
+#define SMU_MSG_LOG_GETDRAM_ADDR_LO	0x05
+#define SMU_MSG_LOG_START		0x06
+#define SMU_MSG_LOG_RESET		0x07
+#define SMU_MSG_LOG_DUMP_DATA		0x08
+#define SMU_MSG_GET_SUP_CONSTRAINTS	0x09
+
+#define PMC_MSG_DELAY_MIN_US		50
+#define RESPONSE_REGISTER_LOOP_MAX	20000
+
+#define DELAY_MIN_US		2000
+#define DELAY_MAX_US		3000
+
 enum s2d_msg_port {
 	MSG_PORT_PMC,
 	MSG_PORT_S2D,
@@ -65,6 +118,34 @@ struct amd_pmc_dev {
 	struct stb_arg stb_arg;
 };
 
+struct amd_pmc_bit_map {
+	const char *name;
+	u32 bit_mask;
+};
+
+struct smu_metrics {
+	u32 table_version;
+	u32 hint_count;
+	u32 s0i3_last_entry_status;
+	u32 timein_s0i2;
+	u64 timeentering_s0i3_lastcapture;
+	u64 timeentering_s0i3_totaltime;
+	u64 timeto_resume_to_os_lastcapture;
+	u64 timeto_resume_to_os_totaltime;
+	u64 timein_s0i3_lastcapture;
+	u64 timein_s0i3_totaltime;
+	u64 timein_swdrips_lastcapture;
+	u64 timein_swdrips_totaltime;
+	u64 timecondition_notmet_lastcapture[32];
+	u64 timecondition_notmet_totaltime[32];
+} __packed;
+
+enum amd_pmc_def {
+	MSG_TEST = 0x01,
+	MSG_OS_HINT_PCO,
+	MSG_OS_HINT_RN,
+};
+
 void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
 void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
 void amd_mp2_stb_init(struct amd_pmc_dev *dev);
-- 
2.34.1

