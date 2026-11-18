Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795012358;
	b=ITDeksOV862u4AbUlAkFK6lwFUC0Cy0NaFmBhdD7sX7erXUz95K68yccymfB/wx85pHv
	 e3dpDVmfarTBGkOAqNqxPEus+bcEguBJfJInofTcKsQ3d8etDo2Qs+afF1AbGmhGp8iez
	 cQV7MOw0Y2AQmbqYRhZSyGUXd6l1XeG5+BXEitV9r3u3iJwD0VzYwmRWZl+MwHCLJ8VWH
	 50QXgV90eX4q+cKXkECom7pdM+T9FZ5v2Jbdtk8+TaGtDgZyFg5NU3ud35hzH9MXDkHkI
	 G1BfyVbCspxxrdL+onVU+eriwDuFDlaHiZWZklEgVrfDNrsl7p2ME1tNFugSCKYy8WA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012358;
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
	b=XnRmRPH0cjOj+hOhMWeUDjTKEpyKS7OeN0VLbuHJxmlOFhro+xWMX/Pqefsb9OZ3pALO
	 CvmiyG69QDbqC2PoUTtwpRRHD4KdnIxAhR8DJBv+w9/Cf+g5Ya39CBMhlztxP5RqPZyzI
	 5nCODnDwZGBStdovhcuArBUqqYv4AA8mbDm0ctA8p+83MlmewcCWd/AcuLNfn3sNUGort
	 mTBo4OGeV/3TAg4r5ODBuMb4vAIN8JW2slojl6Hjkw0hMYYe26ZVNYPkZFDeoFeNRHCUU
	 UPsKOdKZWkrF0OlTArjRtBU6eTxQVWdbF1iZuHzGmc78dfXvx+y55ymrbpMFtuf3WRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jUJLzYE9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.69
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010069.outbound.protection.outlook.com [52.101.46.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84E360A2605
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 14:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A84E360A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jUJLzYE9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCgjjxVWZZKqDtGMFdc1HwUoBNw7ftiJSYxdEsIyBwyCWRiV/jmLozWdUia4Snjt92ia8dP5eJ+VmC1DKyk5gyOzD78/UmKJ2SqOYyjoA1oTztHxLP+qZG5zYV5RbtCRUzv+d2aHBEAhj0QIK0IwUWWg6HnG2eK8LsjX/DYjFl5iI9zpTPSW3kIZN3x1R2wcbWNUZ7sT8U4j3FawXYlyAaPHmnwJ98juLEWP4p1pZEnhUkCTFH6kuUOVtnH3o48rpsxG7zXZj+wpP4fdR/1tcbGLRspGetjRfp4IvH7OLdQF0yJ762+GtKdHZSiKmU8oP/Yb9WM6UWuMGn1ifq+T4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVTBUj0pZRKi8ENl/iY9NvCW2vHsYAYsGB/UM7VAfQ8=;
 b=rzRODziYbAP+vDPQb+QkeHHvDq4NYv3Pj9HsHB3llzKF5XwUswvXIfOlyod2hIveHHOFUhmJ/zkrgr4oUxUnJX4n2KGltyWxI1q8JZ8WrqNsaKEf1OtrR2mzKV9wCadJu+ylGN/NQ+RlCBVMT917dEIZc3CrwD2grqYEq4jGv4xliEi0USyyv+L5yi3Idrz7L/vtepQc+WxMOrdxGProrDfPbzvbgyR4wIPowD0GFflRVtTd8z7RmOJUmYEphRTVehSm4fsBioBL9mrWT6N2ur+Dw8El464MDgPksOLmuTL2FjeIe798kkW0SzVT3hni3QKCMjHpJ3gyi5jDnFdz+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVTBUj0pZRKi8ENl/iY9NvCW2vHsYAYsGB/UM7VAfQ8=;
 b=jUJLzYE9HoplUE3NCwC4KCYTukcUfWGwoCmdZMpusYOE5RHJXqDskMVidwE02Ns8NR+Jpx1HLa0SJne8QtFvSdKeWK1dhdWIYoOtxBMeWoNunZQ8844BiIjUUk7DP/BPXahU3TTelVWsxR1/+fjTVhOW4a520mybUhjmV9jJbNk=
Received: from CY8PR10CA0029.namprd10.prod.outlook.com (2603:10b6:930:4b::10)
 by SAWPR12MB999140.namprd12.prod.outlook.com (2603:10b6:806:4e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:32:32 +0000
Received: from PH3PEPF00059618.namprd05.prod.outlook.com
 (2603:10b6:930:4b:cafe::7e) by CY8PR10CA0029.outlook.office365.com
 (2603:10b6:930:4b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Wed,
 18 Nov 2026 14:32:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF00059618.mail.protection.outlook.com (10.167.243.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:32:31 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:32:28 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v3 02/10] platform/x86/amd/pmf: Add 1AH_M80H static slider support
Date: Wed, 18 Nov 2026 20:00:26 +0530
Message-ID: <20261118143034.3566684-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118143034.3566684-1-Shyam-sundar.S-k@amd.com>
References: <20261118143034.3566684-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH3PEPF00059618:EE_|SAWPR12MB999140:EE_
X-MS-Office365-Filtering-Correlation-Id: 17dfa14d-7d93-41cc-ca76-08df4580c7bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|261102123227099003|261026140227099003|261026121527099003|261028144727099003|261022075727099003|261021123027099003|261021121427099003|261022105027099003|56012099006|11063799006|10067099003|22082099003|18002099003|261009223027099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	L/WSVTN3fohKQ48CKFRtWI6PhGDvmlQceBqwvUzVcWRcnqVi3NaXJD22flm6DwrunM84QfZjS2Olp5fQJwtS8/gUjEbfELR+keNvphA2eevywfKMLqzSWoQzj9xBBCHblKNozxuu6lWLfGwGeBGsbswtioEkNaztpMQzgWDO4AORAPB9zZxGLPYuxufAxzzBEQb5CraMsdRmJhBswfnxo4dZXOL6UaB42XpKHvjLs9yKKHMIk66Anpxr9ekvmI4LPbGUPqbCjSm984KmwS4vskAz5muFyqT7yIiWI4PpMT3pZQKSqxwpcw++0vvM1QoCOg32DDw5JcKpzP9LZTcsGccs4PoygiKiKEy0hEAVZ1eIs7wTWvWtHqsgNBQ5N+c5JMe/4nl2Awvp6WbMt1JaYGxzMAcL+v2xm7jmMuGosvN7pyFQlYeL84IMWTiq52XRi+0ricddGweDKnAePKTNA8Xgr+rzqvYuAxVkZ/jqr4gwXplTh+zJSi7CGhf3IoukKXfD2uXaL9l0QGWuYFBDdQejUAxRXhkHwUKQySyhVznwDeOFULGcLVioB+MRx5NOPbCxJCQSnZ9fNO5emY50g4bo9syWIjv3PwEZWumpaRKUOqdIwcg4WFW5JyOvjsCa9jguYJOLd/fJo7pLmJLj/pU8Slh9Ixjha4QgFquRBObf2KYVG/c7qcWWqdyRJeo52DnLoR4yAlS6nITsbB7V/g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(261009223027099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sHrB1bt6cxndK0UPudk2MbVE7W3iAkoAL5T/UkzQyZoULyr4kR8k3wfZYON2OPAHXN0T0X/9/hoycIMG6nmOCQu71+MhDJbRVLl7MUF2wNT+w5OD9uoXLpV1WUtRSPthPO/Zzo4LMhbfFbIR1taYB9Pkt+3LQ54fmdWykQVTFHF/9fENgPJFo4Wddy21t7JwdgfeBgoUZ1V85Dui12jpiv6ACN2RwrIs3cMaVaNrXfkPZyr//W08elJhTHhBADYkCPoKrhAxWoslOcOu/GTLFrvAa0sIjFDoRkoBP2mdamWWmQibLIM0rKJd64ccY3F7bN41BgbQgd0A48ijIq6XQ9PRVy+Y5auFDQ2QW5p4EfXQwSMNZKHLlGcW74ojIlxsPQubkxG04JQGfR53slNncS+DSiKQQiGil0lGgIs1EtheVlpDgG113ZORIRUpQuGg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:32:31.8332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17dfa14d-7d93-41cc-ca76-08df4580c7bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF00059618.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999140

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

