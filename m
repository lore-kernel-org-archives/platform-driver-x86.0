Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795506770;
	b=JS7QbmOcv/ykzshmuDaxxgo5dSNsnWmEz+ODYpuynTecvPrkFDFdeAKRATa8E9h6jobh
	 zOe/lHRNx0c39WJJTUOLVEFZqO2ZxQ8NyBTCDwvP+DP8WKXSLBO0+088wfJN4ffZ/cimb
	 uRvFYhgP7GrdURvadgZ6Tg4p5yg9t088e3R+Hkdkdae4AWwIYbAVHjoNuGrRag9Uy575w
	 ZcCLWNLPAHTmd3q8f93a5MALWZq4GI4l4YPFf/iQz4M0atvVeoOYW+KfvmKkY2cdmPLP8
	 E0BK/G2Qk9s0miIC68vb+1WLCdBtBbu/sf8BQGG/CGYLqqRq2WL0E66AEPj5dC3UyYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506770;
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
	bh=H7XmqRRzv/2PcxNVJMz+TXaIZFBGvZ3Mz/eqkgfe0fU=;
	b=2LtpgmTY1FgYUkJ5dffsduiSwznf/hEpDKcaoikL6RMOESWxcPppU5WciCuJz7sJY2es
	 h+XqEY7IMH3sH9qJ75cwX3WDJo/mOqDfCiiMCqkgYC8b63WFVOl3dnfFbbnK9PePHmkDB
	 QXposL0zyCxQkuXkFBL6C78qjK2C3yVcfR2eC0Gv8WwJrSF3Q4elKLQAVNMGTeIwnWSdz
	 zc+EeocTRBfgcStmqyj4jhYfIYsQp3Z5sLweQ3NzEuMKRUwT9iUJ0rlpYVxUtVh5Suqnd
	 HmAvw3WbtZqoW45xfd4hvb3dzv34fhL5O/HuXDHjDqogcezr2aTsNY2Jt0+KrCHAr8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CZNRf3XR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.7
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010007.outbound.protection.outlook.com [52.101.193.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68512606A31E
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 07:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68512606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CZNRf3XR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kU+inZuGwx2tFDB3pcwWC7rjcjUPAldjsQ5rmJ+fsu6h407Usiv8RovGPFRVrt/dxu6dIvHrP7QinIJufKqCPyVmUsiw0KeE21QeFbMSC1v+pzouPTG77tozeLt4wonVLKjwNcNSzMT7qQKBGSF3K+G8U1tywEJlNDaj9ZyxPaXxZeZeUnrOx7t0xK7fOCF8EPKKFsHcZu1Ov009cvN//lHF/zUxS7fjMdhmoi5TEkb5QrgWTKwqR8vP0IcVmFY1R/JnBo2yePVBpyvHfRWTai975AIyvSpVNRW/CcIHuANUmmBvvMhn94k7CpynkIuOheeZCkuagO+ctEcy+UjXEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7XmqRRzv/2PcxNVJMz+TXaIZFBGvZ3Mz/eqkgfe0fU=;
 b=ZuEAyppvdEqsbmR2RXzvQzzPrEksY1bjyP75TBrxnp5AxeVgyDhw5OPsKGkGDS7L15yedzMGaoBMsSTi8Q65NODHjRFhyHRabCnewX5Dn0ctz0MZeJrdd5TJzguJ1kPOfvf3j9GdMIQy9yAUQRMy06edX0smD3s2yFOKYNtsyMZ239C5CW+B3fbJbUSq5FWSSumoKOqmAdJXXfvc8tTPhcZbd8hKSTvxxNr5Jk82RaB1bGllsjF4oYc4984kDWnve6FIJhrHhob9aLvVPOiJDSzomrLMy1T5sQLHmp7/uc+cIJiRdTMFk+6hAs1VVQuco0Xmu9NePVlw633V1oPaoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7XmqRRzv/2PcxNVJMz+TXaIZFBGvZ3Mz/eqkgfe0fU=;
 b=CZNRf3XRApUfhJ3FFEtQqlxTzv1KGu7G/bemaUdxuP/oXmReOTzMc2P8vRTY5/YZFwY6QFILpCacv0A42fDE7MVia8AK/fv6mgvTS8N5MoHpVQe7G2kjFhmcPWRrNl6Tz/e8LLVY1hkZAIKaRyOsjXgPzEDFpsUOYE+9nm0Ev+U=
Received: from MW4PR04CA0388.namprd04.prod.outlook.com (2603:10b6:303:81::33)
 by MW4PR12MB5644.namprd12.prod.outlook.com (2603:10b6:303:189::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 07:52:45 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::5e) by MW4PR04CA0388.outlook.office365.com
 (2603:10b6:303:81::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 07:52:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 07:52:45 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 01:52:41 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v4 03/11] platform/x86/amd/pmf: Add 1AH_M80H static slider support
Date: Tue, 24 Nov 2026 13:22:05 +0530
Message-ID: <20261124075213.2317127-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124075213.2317127-1-Shyam-sundar.S-k@amd.com>
References: <20261124075213.2317127-1-Shyam-sundar.S-k@amd.com>
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
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|MW4PR12MB5644:EE_
X-MS-Office365-Filtering-Correlation-Id: e510e9ff-66fb-4a6a-ed82-08df49ffed25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|6133799003|22082099003|18002099003|3023799007|56012099006|11063799006|261026121527099003|261102123227099003|261028144727099003|261021123027099003|261009223027099003|261022075727099003|261021121427099003|261022105027099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	+2VdjPE4i6+I/aG0XZpkzB6jnSDcR0BuxaJA7JuP7aamBycYb62a/RAuS+MEBFkEUQ7xv93vv5dvv9YlVAsjcgng+KkhFoZEd5KEpsYSFZ8ULxw8uZixcd1yM+ZgXTSds1eSgKOAkV8nfqfSKp9bN1Aiq7a29GM+d+2tpnxE8r+xr8Ft3zu2hTyfqVSht+Kvty+6z5dZn7BVrhPTozB/+PpQflefPJri8vLKHHE/iwr/pUjJS6/J9LeRF+Ju5kOFb4dJV8YwRihhfCeIBKzzAp5iOWOvf7Z/c0A/xPe/Gf9RfzVomCFOxBpzTDfM8h9jJNcf2BDwPZkcJbTMepElu2s57ykGAE6j+tMWAT4dEt0N1PUZ7vWWVwXuFYcv8IsQfT1D/f6huPu0Q1TXsQ6SmRk0gFwgBI9o/PXiNFmeYWRLJtctbhmsa8c2XzKk63+0MwHovoKGUgW9WHavWnrwuyEbxvOPbSwGGRcianYHC8O4EmQfmCeB6m4C7sxMmrm9oFS3BJK3Mb3qW69xqej6dnefInOvyzqryzs+XztR/wYnaAf34ijDFHPPtShjMffQINJZX7OkugYJnGMuzWxrcEqyLxUQXjRnkz269wiem8M4dFTdkdotT+eQ8A3MhJd/SgZ1eosSSjwWWQoHsNhVFFyxIMfBA1o+uVG1tu+rPwBvhIE/7Tdw5cbXLScauhTGsS1HZar92SLj2ott4fQn3A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(261026121527099003)(261102123227099003)(261028144727099003)(261021123027099003)(261009223027099003)(261022075727099003)(261021121427099003)(261022105027099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	esALFN/3YTXL4ffHK86ZtQBPOjraV2FtonmEjhEX88JWci5qM9e9DmtabrQqY7syPUO1U0JDPtbP/p5j+iCDSyO7jtj8kcCRnnW/xRhXn46vEyDPswv93ELjJr5vb6cgrplwyPrSknLVNfYZQSeq3fzC2yb4DtoWFUVouRXjYzC5PLCPeDXNlmfBfF/liokekLxdzDmw6f/JM+0quGXuOJ6+aL6aV404FK5IyBp9HAXFiaK2bpiseuv/kzTGwGyl1tiExQyK29NKPDoQg0cyxcCWTb56i9Br/6HZzvafVcmog1vlj3Fe6z/RO8YEku15r0LhcwS1JFhbUJYAPT/uHYDX8663alkc73aeg4S5YtB/4Sw2AN+Kw9UdR8i9af/JG8WxbyfjFXW44DEXmceOrhLfY+Q04ApWhs1v4rIjiPfyYJXUAU7ry0+CokxMrJ7v
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 07:52:45.2815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e510e9ff-66fb-4a6a-ed82-08df49ffed25
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5644

1AH_M80H follows APMF 2.03, which changes the APTS table layout and uses
new SMU messages to program the static slider power limits.

Add the APMF 2.03 APTS structures and a new set of static slider ops
that read the defaults with them and program the limits with the new
SMU messages. Select these ops on 1AH_M80H.

Move the APTS index lookup out of amd_pmf_update_sps_power_limits_v2()
into amd_pmf_get_apts_idx(), so that it can be shared with the new ops.

If the APTS defaults could not be read, do not program the slider limits
so that zero limits are not sent to the SMU.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h |  45 ++++++++++
 drivers/platform/x86/amd/pmf/sps.c | 128 ++++++++++++++++++++++++++++-
 2 files changed, 169 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 215dedba5779..dcae081a4806 100644
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
@@ -1132,6 +1162,11 @@ static inline bool amd_pmf_supports_accumulator_metrics(struct amd_pmf_dev *pdev
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
@@ -1160,6 +1195,16 @@ const char *amd_pmf_source_as_str(unsigned int state);
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
index 2006aca200c9..c56b206044c0 100644
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
@@ -246,7 +324,7 @@ static int amd_pmf_update_sps_power_limits_v1(struct amd_pmf_dev *pdev, int pwr_
 	return 0;
 }
 
-static int amd_pmf_update_sps_power_limits_v2(struct amd_pmf_dev *pdev, int pwr_mode)
+static int amd_pmf_get_apts_idx(struct amd_pmf_dev *pdev, int pwr_mode)
 {
 	int src, index;
 
@@ -271,11 +349,39 @@ static int amd_pmf_update_sps_power_limits_v2(struct amd_pmf_dev *pdev, int pwr_
 		return -EINVAL;
 	}
 
+	return index;
+}
+
+static int amd_pmf_update_sps_power_limits_v2(struct amd_pmf_dev *pdev, int pwr_mode)
+{
+	int index;
+
+	index = amd_pmf_get_apts_idx(pdev, pwr_mode);
+	if (index < 0)
+		return index;
+
 	amd_pmf_update_slider_v2(pdev, index);
 
 	return 0;
 }
 
+static int amd_pmf_update_sps_power_limits_v3(struct amd_pmf_dev *pdev, int pwr_mode)
+{
+	int index;
+
+	index = amd_pmf_get_apts_idx(pdev, pwr_mode);
+	if (index < 0)
+		return index;
+
+	/* Do not send zero limits when the APTS defaults were not read */
+	if (!apts_config_store_v2_valid)
+		return -ENODATA;
+
+	amd_pmf_update_slider_v3(pdev, index);
+
+	return 0;
+}
+
 static int amd_pmf_sps_load_defaults_v1(struct amd_pmf_dev *dev)
 {
 	amd_pmf_load_defaults_sps(dev);
@@ -291,6 +397,13 @@ static int amd_pmf_sps_load_defaults_v2(struct amd_pmf_dev *dev)
 	return 0;
 }
 
+static int amd_pmf_sps_load_defaults_v3(struct amd_pmf_dev *dev)
+{
+	amd_pmf_load_defaults_sps_v2(dev);
+
+	return amd_pmf_load_apts_defaults_sps_v3(dev);
+}
+
 static const struct amd_pmf_sps_ops amd_pmf_sps_ops_v1 = {
 	.load_defaults = amd_pmf_sps_load_defaults_v1,
 	.set_power_limits = amd_pmf_update_sps_power_limits_v1,
@@ -301,12 +414,19 @@ static const struct amd_pmf_sps_ops amd_pmf_sps_ops_v2 = {
 	.set_power_limits = amd_pmf_update_sps_power_limits_v2,
 };
 
+static const struct amd_pmf_sps_ops amd_pmf_sps_ops_v3 = {
+	.load_defaults = amd_pmf_sps_load_defaults_v3,
+	.set_power_limits = amd_pmf_update_sps_power_limits_v3,
+};
+
 static void amd_pmf_select_sps_ops(struct amd_pmf_dev *dev)
 {
-	if (dev->pmf_if_version == PMF_IF_V2)
-		dev->sps_ops = &amd_pmf_sps_ops_v2;
-	else
+	if (dev->pmf_if_version != PMF_IF_V2)
 		dev->sps_ops = &amd_pmf_sps_ops_v1;
+	else if (is_amd_pmf_1ah_m80h(dev))
+		dev->sps_ops = &amd_pmf_sps_ops_v3;
+	else
+		dev->sps_ops = &amd_pmf_sps_ops_v2;
 }
 
 int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf)
-- 
2.34.1

