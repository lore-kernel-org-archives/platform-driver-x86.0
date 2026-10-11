Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011043.outbound.protection.outlook.com [52.101.57.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7252F42124F
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 Oct 2026 10:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791713237; cv=fail; b=N/hezDjyMJQ+H4wO6uNCwjlXaqOC73B+DT9p2BplGBktWrHTU/nN1/r3aRJTdgdRzAXUBep/5fvUVWar5leKjK72E5/7CaQYOPzxu4UiKPJzGSBIs3BIZqNi/wOi92n+GBXQPR3JVFBuSvHX1FmApUuQA0CHkpYeaeSMgZ3YMbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791713237; c=relaxed/simple;
	bh=Mlk3zb22Swg7VFlS/fGJ7fudB6y36NRyiVRZ6/DjfAM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CnAJDDxcwUBjd8mrzf8gbk3ymAPWwEHrpiRILRcSUChz1wG9fdQHDCnJvPoOj73xkSwWC4BAtThTR8vIbWKbAEhgcU/e9CmHBAkeV9GAwKD5yhYZLFQ9FpPNZ/UgsDw3SWDcgpeVG2zmzn69DsifAoano3+U8mQjY3q3zOtbXtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QH7ZBXiD; arc=fail smtp.client-ip=52.101.57.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QH7ZBXiD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpPtwbB+7ZThtCF2rk1qBNZ9O2PtxSAINIsNswa6QSvU5tZbX+eOzFJgr/i0ALLoiqrh/6G+tvTLVi1zzmgO/uJ0aFMbR15dvyPzAepeDzUpjRicunUU1maNqWUhLpf5Iess95SIdsuDELKVs6R/uqUwq1HIHQXcptK3lykHmedW9yk6ghR97zYH/jB+Kk8fIe4pubT9/RXDPMYtjGah7upaF35BUrzpNJAWv4GgzHVRoHqCIaObAfaBSjCZg6hqRxhX7odt5UTmpPOxf0sARTYkYPhMQMrVljHn+7LSq5nKQcRMA1ao5hu6UjE4Cs8cukfrM8VbshXUteoZKMPhzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcBm9AqLXdkEZC3z+1D4VVzE7qz/HnnR0BR9PC5QNAU=;
 b=IISSBpotq5oCDBgoWUe8YZNvezELMxfoR0hDMVyKanc/5C4w+r7RSMSB8oSYZnEIARAdKrywfEUFR7HgqgCblP1Ol6779wI2aFD0ovQwoOPbT6Gw6OuM12/+q7vFUZWnIKdB2Yc9VH16tnAmfdVBnR2A5EKJADD+qabxN8ZDCZfVyNoc26+nimEmDRDxH3xMtz+vv9DE6AQiIw4J+fmrpU3RP6+cX1GYZuagZlLYsnpdJ5HG0tznhQuQbkcelfFqhA+7d8nVX0e3xfUh3TpWZYiti2JdqG1YDQK2J8yAYoP5dHM/sXRWCIRt5O+zzFNeF1sRJ1KOtH3prEDcvExrag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcBm9AqLXdkEZC3z+1D4VVzE7qz/HnnR0BR9PC5QNAU=;
 b=QH7ZBXiDfqJ/tvSs5cI8C5tlS0HDG4EHvvlpaT9mCC5USXAT7C1F8f2HaPpjIQijnvpS2pRoyC7bmJN368PlbAJ+LGxYriCWTAXUMxHBTFPEPNVKbxzvQOCgBwj2oxYg4mgUVpOf4KvD4efl03v2FeI6lR6EkHOPPbgb0pJqtA0=
Received: from BN9PR03CA0458.namprd03.prod.outlook.com (2603:10b6:408:139::13)
 by DM4PR12MB7672.namprd12.prod.outlook.com (2603:10b6:8:103::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Sun, 11 Oct
 2026 10:07:08 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:139:cafe::5a) by BN9PR03CA0458.outlook.office365.com
 (2603:10b6:408:139::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun,
 11 Oct 2026 10:07:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sun, 11 Oct 2026 10:07:08 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 11 Oct
 2026 05:07:01 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/8] platform/x86/amd/pmf: Add 1AH_M80H static slider support
Date: Sun, 11 Oct 2026 15:35:48 +0530
Message-ID: <20261011100554.1841309-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261011100554.1841309-1-Shyam-sundar.S-k@amd.com>
References: <20261011100554.1841309-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|DM4PR12MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: b08b4e2d-5481-4c7b-17fb-08df277f68db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|3023799007|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	PszIm9IkCq+TVHGJC1T7ye/s6jSpfO1RL5NPoRqmYKzeWGOlME4p7VajB3NuQqTGKxbFLdBOa0OTKuUYQWvO3obNKGO2onyg8fQQqA0FrPtP5OkzDRMAXTHjJNtlQWE0bT7JK5dN4rRZSo7dEhI6HC5EnQ0tgaxQd65CQO0CoBc4WIIhWCu3z3rLMbRh0Ktvfd2zFZGjZbazJlq00yMPhOX7z5DsJRLwRwLZY3RCxyC4mptj5wcahMw6xxUQlbGaV2+9IQSzq9CtvlR7d+FYVomvxYqg8qpnTrt/n6jepm9DqT3YXkbnJAUBGrdE+tJLC45Xu6mROPLma0QlmyQN7q8PxmWlB4FiGRQVD+/MZU3k+wYrRkvjnskEWQWK26+lPemWya/y8wYqO/aJKa5hKY1/stx278Z2zbrpjyF4PX2HdpOV1kS4cDXdzz4UZsAJSJhNVxLHVD+8hhHOLoqeO4CXd5h+vjcsT+RMCtqIVCulrmEmWNV/cEg99PXX5/UB47YnxkqYHecWzNQi2pqn/C8YoID/cl1L3s3RCYwvsj0y2L5ApYmEXJZafUungLC4qwsM7zX4bZEXUkrACum+mbJ9ZFIGYUzKD5soD65sqKYq/LwuWkxyXgH5bwJOLpGhP8wVWOQBSHG8kiXJ0Ku8nIh1bf3ZYxC6r+A407HNQErdrjErwTp+rRQV93G8yPQDx8eD2ISvTMVBlPfWfOACQg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(3023799007)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eO5IoY+m4BhTz88LYbFmnHH3vT++GhB/sowDKd/9w9LeHb5ezDXHTsfm2lpHVKhfQUAmgaSU6UvOSJU9qmYhZL1QQ3CdgRJVajR62VzFCjkpwEAhivikF7hTPSFsKd5NJunuqgUC6KczWePc3WumCa0y8Airinl+orSWEe+sCOmAhp4HXrbWUhL9vC1Q6oUGvj6NG49qIXY9mPVWTl9YQPDNhyI9tMdKOdzGpTVFIKG9BfKVKJl0FfV49RrQr7qpkckj6PYh/cnPrfZ6QmBiS2yxcYtDuaXrg9/pV91Hop6/SskTKG4k5MvLzBx8LpfKKitdry6m30u6iDoVqkTlkcrcWmNuAW0NmJYRVnSMRfKCr9vi4VMZQ4a8xd3F3RjPybk4yT48mRQ+cSTc6FnP6sOWEkYOC+Dn2G00jcKyloNXMVWKCSkjZ94jalV8JA7F
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 10:07:08.3028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b08b4e2d-5481-4c7b-17fb-08df277f68db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7672

1AH_M80H follows APMF specification 2.03, which changes the APTS table
layout and uses a different set of SMU message IDs to program the
static slider power limits.

Add the new APTS table structures and use them on 1AH_M80H to read the
slider defaults from the BIOS and to program them with the new SMU
message IDs. Other platforms keep using the existing path.

If reading the APTS defaults fails, return the error from
amd_pmf_init_sps() and do not register the power source notifier, so
that zeroed limits are never sent to the SMU on a power source change.

Key changes include:
 - Add the 1AH_M80H SMU message IDs for SPPT, FPPT and STT limits
 - Add struct amd_pmf_apts_output_v2 as per APMF 2.03
 - Add amd_pmf_load_apts_defaults_sps_v3() and amd_pmf_update_slider_v3()
 - Register the power source notifier only when SPS init succeeds

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 10 ++--
 drivers/platform/x86/amd/pmf/pmf.h  | 45 +++++++++++++++
 drivers/platform/x86/amd/pmf/sps.c  | 88 ++++++++++++++++++++++++++++-
 3 files changed, 137 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 96e37eb56591..f7df72d3076b 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -356,10 +356,12 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 	/* Enable Static Slider */
 	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR) ||
 	    is_apmf_func_supported(dev, APMF_FUNC_OS_POWER_SLIDER_UPDATE)) {
-		amd_pmf_init_sps(dev);
-		dev->pwr_src_notifier.notifier_call = amd_pmf_pwr_src_notify_call;
-		power_supply_reg_notifier(&dev->pwr_src_notifier);
-		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
+		ret = amd_pmf_init_sps(dev);
+		if (!ret) {
+			dev->pwr_src_notifier.notifier_call = amd_pmf_pwr_src_notify_call;
+			power_supply_reg_notifier(&dev->pwr_src_notifier);
+			dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
+		}
 	}
 
 	if (smart_pc_support) {
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index b29c5192d878..73d981b25b38 100644
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
+	struct amd_pmf_apts_output_v2 val[APTS_MAX_STATES];
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
index b0031afae33b..8aea73722d4c 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -8,11 +8,16 @@
  * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  */
 
+#include <linux/dev_printk.h>
+#include <linux/printk.h>
+#include <linux/string.h>
+
 #include "pmf.h"
 
 static struct amd_pmf_static_slider_granular_v2 config_store_v2;
 static struct amd_pmf_static_slider_granular config_store;
 static struct amd_pmf_apts_granular apts_config_store;
+static struct amd_pmf_apts_granular_v2 apts_config_store_v2;
 
 #ifdef CONFIG_AMD_PMF_DEBUG
 static const char *slider_v2_as_str(unsigned int state)
@@ -97,6 +102,27 @@ static void amd_pmf_dump_sps_defaults_v2(struct amd_pmf_static_slider_granular_v
 	pr_debug("Static Slider APTS state index data - END\n");
 }
 
+static void amd_pmf_dump_apts_sps_defaults_v2(struct amd_pmf_apts_granular_v2 *info)
+{
+	int i;
+
+	pr_debug("Static Slider APTS index default v2 values data - BEGIN\n");
+
+	for (i = 0; i < APTS_MAX_STATES; i++) {
+		pr_debug("Table Version[%d] = %u\n", i, info->val[i].table_version);
+		pr_debug("Fan Index[%d] = %u\n", i, info->val[i].fan_table_idx);
+		pr_debug("PMF Slow PPT[%d] = %u\n", i, info->val[i].pmf_slow_ppt);
+		pr_debug("PPT PMF APU[%d] = %u\n", i, info->val[i].ppt_pmf_apu_only);
+		pr_debug("STT Min[%d] = %u\n", i, info->val[i].stt_min_limit);
+		pr_debug("STT APU[%d] = %u\n", i, info->val[i].stt_skin_temp_limit_apu);
+		pr_debug("STT HS2[%d] = %u\n", i, info->val[i].stt_skin_temp_limit_hs2);
+		pr_debug("PMF Fast PPT[%d] = %u\n", i, info->val[i].pmf_fast_ppt);
+		pr_debug("PPT Fast PMF APU[%d] = %u\n", i, info->val[i].ppt_fast_pmf_apu_only);
+	}
+
+	pr_debug("Static Slider APTS index default v2 values data - END\n");
+}
+
 static void amd_pmf_dump_apts_sps_defaults(struct amd_pmf_apts_granular *info)
 {
 	int i;
@@ -119,8 +145,31 @@ static void amd_pmf_dump_apts_sps_defaults(struct amd_pmf_apts_granular *info)
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
+
+	for (i = 0; i < APTS_MAX_STATES; i++) {
+		ret = apts_get_static_slider_granular_v3(pdev, &output, i);
+		if (ret) {
+			dev_err(pdev->dev, "Failed to read APTS v2 defaults: %d\n", ret);
+			return ret;
+		}
+
+		apts_config_store_v2.val[i] = output.val;
+	}
+
+	amd_pmf_dump_apts_sps_defaults_v2(&apts_config_store_v2);
+
+	return 0;
+}
+
 static void amd_pmf_load_apts_defaults_sps_v2(struct amd_pmf_dev *pdev)
 {
 	struct amd_pmf_apts_granular_output output;
@@ -190,6 +239,30 @@ static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
 	amd_pmf_dump_sps_defaults(&config_store);
 }
 
+static void amd_pmf_update_slider_v3(struct amd_pmf_dev *dev, int idx)
+{
+	amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_SPPT_SPM, SET_CMD,
+			 apts_config_store_v2.val[idx].pmf_slow_ppt, NULL);
+	amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_SPPT_APU_ONLY, SET_CMD,
+			 apts_config_store_v2.val[idx].ppt_pmf_apu_only, NULL);
+	amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_MIN_LIMIT, SET_CMD,
+			 apts_config_store_v2.val[idx].stt_min_limit, NULL);
+	amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_LIMIT_APU, SET_CMD,
+			 fixp_q88_fromint(apts_config_store_v2.val[idx].stt_skin_temp_limit_apu),
+			 NULL);
+	amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_LIMIT_HS2, SET_CMD,
+			 fixp_q88_fromint(apts_config_store_v2.val[idx].stt_skin_temp_limit_hs2),
+			 NULL);
+	amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_FPPT_SPM, SET_CMD,
+			 apts_config_store_v2.val[idx].pmf_fast_ppt, NULL);
+	amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_FPPT_APU_ONLY, SET_CMD,
+			 apts_config_store_v2.val[idx].ppt_fast_pmf_apu_only, NULL);
+
+	if (is_apmf_func_supported(dev, APMF_FUNC_SET_FAN_IDX) &&
+	    apts_config_store_v2.val[idx].fan_table_idx != FAN_INDEX_AUTO)
+		apmf_update_fan_idx(dev, true, apts_config_store_v2.val[idx].fan_table_idx);
+}
+
 static void amd_pmf_update_slider_v2(struct amd_pmf_dev *dev, int idx)
 {
 	amd_pmf_send_cmd(dev, SET_PMF_PPT, SET_CMD, apts_config_store.val[idx].pmf_ppt, NULL);
@@ -264,7 +337,10 @@ static int amd_pmf_update_sps_power_limits_v2(struct amd_pmf_dev *pdev, int pwr_
 		return -EINVAL;
 	}
 
-	amd_pmf_update_slider_v2(pdev, index);
+	if (is_amd_pmf_1ah_m80h(pdev))
+		amd_pmf_update_slider_v3(pdev, index);
+	else
+		amd_pmf_update_slider_v2(pdev, index);
 
 	return 0;
 }
@@ -418,12 +494,20 @@ static const struct platform_profile_ops amd_pmf_profile_ops = {
 
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

