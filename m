Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013042.outbound.protection.outlook.com [40.107.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F63279DCC
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 14:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890561; cv=fail; b=WgejYBfOxThzS7EmjtzUbUlAou/6qYiZtov82tazhPmKK7depkwuP00rYXqpvy6m1Rt4Q4fCw36m0biUbI7xTWFRvCkcvqpZrbQm37mLoflZt1bwmqOL17idfdIXUVb/HIRf03L866H7H7Kl5VldQCG8tWhdExwBAWjrs/5DWt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890561; c=relaxed/simple;
	bh=rhLPinAgfYFMaTBOOiMYuqDsjmVaf41iU6+0XzUfZwI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PBJYjzo8tanm/tWkhjD7Gj05pkNOFLiMuvnqulJSL5V/reCEIJqkq5JH4kgmt7OkGbscTRp3k7L/yJ3nxuFTwLNpz03s97f+rJXvKLdTg5slA55QlqeYBnLNkG+wsIw3l8TyzGnpbTMQrAxmml+cPgyZrkI7qmvpp7C+AgXxkc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JVcdCcGO; arc=fail smtp.client-ip=40.107.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JVcdCcGO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KapLlJuZCESU+w7xhf70djf5LSBR24v2+ZVt1uInOVnoljS4R7A4MV9DIMsQFWQ3k9LZQs0Z9pkO2iyu6Rp+tdA+G9dcp/wpQYiwQDDrbTINUROkY/D86Sjf+Nk2vJpaO9+ZlLw/ufD29y6Dy1g4Bdm49IxRR/gZChei6YDzNuaNrJLH80HNiKFa4Sf36J6sUF0owYtQPo0atEzKPKJefpUdwgkfg0eF/QkCd03Iua0SDdtP/81vGj1IMIzEbn9LfZe0dapCSWar+pFF8sBSrhg26C0V/EAU99MPYDV63xxeEJ64L83/X7lL1ICD2qbm7oRihzG1t3bGCKQpDhty3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7SCyPJquZduipsYPKQVcoig3AO2TvGy/8uRZAKZ5dzY=;
 b=i3R0R+Vd/3jFYwt3lR+bkRQRknm76h98nRsiuYxYt09+DLdmtlXOJtydy7MnlXVxUPI5zk3O9EmbfHwgj43FQHpo4b7fmjTxLcJyzdUsA3lbb+UW/i7CAesOAi4k9xvVQyd+uovbjj6dmab3AvcaZ/XQZZc7GXfSExidGFu4R65I2FJGaYIqapAi3B8iXrv6Jg6VI6QnZRv55ByPPzNarAqnCul+thcN1vxxMix2dZoXEEv4Q/3YE33uGAaQHpM9phKCNNLjD0PUcznJULL+GVp4ypx/sa2u1mjRyP6fu+6WjVzQE/wRVrNTYU6/1Vmy/WyvLjcc0u8u1dCG/bd2Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SCyPJquZduipsYPKQVcoig3AO2TvGy/8uRZAKZ5dzY=;
 b=JVcdCcGO/Xf/t0a2ly1KdmYT3AzeBUrRsUlB5y4vQCqviiUGFaQkytgAONb7ly932zg1W5cisa7Q+b2vuiD/zL002ih3wyQwcR/rwPN8eoB38EYJafG7MIm6cyJE2JOYfgEWyRK7FKiy5wGMEbp4ZI4h81w6tijR2WztI/KtVwI=
Received: from DS1PR02CA0005.namprd02.prod.outlook.com (2603:10b6:8:452::6) by
 DS5PPF266051432.namprd12.prod.outlook.com (2603:10b6:f:fc00::648) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 14:02:33 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:8:452:cafe::9) by DS1PR02CA0005.outlook.office365.com
 (2603:10b6:8:452::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Wed, 27
 May 2026 14:02:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 14:02:33 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 09:02:33 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 07:02:31 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 4/8] platform/x86/amd/pmf: Store commonly used enums in the header file
Date: Wed, 27 May 2026 19:32:01 +0530
Message-ID: <20260527140205.4073335-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527140205.4073335-1-Shyam-sundar.S-k@amd.com>
References: <20260527140205.4073335-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|DS5PPF266051432:EE_
X-MS-Office365-Filtering-Correlation-Id: c12effa6-e0f3-4cfc-1e87-08debbf899ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|22082099003|18002099003|56012099006|5023799004|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	I+GpIGpJ7UCSQSlgMHfYc11xdTZ/8gpyPlR12BxZFLa6cWIAe/CywqTHghQitW3Vph6Qo+/FfyA4mrcz0mEGebZkW5sgogkNQkMPysZpmNVM5zP2WN1YiY1JeEiuoob7PF+hq+bXSGx3LCQNleu7yzrgrGw3876QToRLqly2vmRs2i2BIIoGQMmhrF968//s/68wdd8es1G7b1VI3HWbEVxAfSG2jqBOJ2PYQGASmItW+HxDvHRG/fEOkul2+ZbDM5MIzdiNyA0tQW+nbx/N3NLlMEVlib89fxkU/FDTutmZM/6d+rYvuNIEWbkT2jEs2Z6AR6S0u+AS/bn/jBm1kMD8F25w6FTOprIaGvGJ9Y7E2tms9ggAVPAcZKNFYPxnmTYUAQKgNLl+IU6cZMY0vyXZI1eGN7huzC8lNWnA2dARo0uRrE2/grOPc2uRX9GGhbeNzIBQvujzZm9lVRpmSVrrlq+r5bkFZfuneWTeG3M8pRTVPTwl4gBX3ZSxLUySj84aEYopWOIg1PIE9UAt4N4eW+04M3ii67DUE4ssj6q9a2ZQRJ59CGV3J+SQTULgzzM/DJaWLJ8kpMPMcOCYHxuNHptVH+IIU3tGS53wH49SjW/67wmTBuGmPCw3b2sRscBxYjd/dIiwQlUX6iT9yQph9h0pUvm3eGbv91UXl4TEi7OYhPRLMO5Qe48A1WvYLQXlCuVfsjDt+DpfBU+Wd704NCXqzdY4ktbytzSgEhw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3XsVpqVOL6UO0isFQqjN4gzIfwEahM3dAluId4XcVn/lk3LAN85bvGSsVqCENiKy1HvRHf4p37+3K/mmM00vqv4+3gVD6dJoQMcZ/OzDuMDCoKc7BJHK02sucraGkuNAXhufCarmIyczJnJcZIoZwu8V9Dty/2JKvu251KomvVJuaSmmKnqWkIsWY3zEQJeyVJZ7b0mNAcsP1cQDiQZ6BzV3YOo53jKYXp7q+b94NNJOHPrnmr4PXoOQZbuVRnPJsFOo7BTjotVTU+eCDVkfpQJQpTdCcyncUZZ2v/8KGd6XlS/7eWXnx+VyScydUzO3SeCLPvkmyTK65bWGPqtIzpu/TXZ+Yk6M4ZC04wYvNWSyJBDzFTpBA7Z1Urox6WJa5fx+pcofzshfOETol6R506wD4EFwZajtOmBV+4RCGFbWqs8U45hXex0myjw0/KnD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:02:33.6900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c12effa6-e0f3-4cfc-1e87-08debbf899ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF266051432

Relocate commonly used enums from multiple source files into a shared
header file to simplify code structure, improve readability, and
enhance maintainability. Also, remove the initialization of the first
enum member, since it is not needed.

Add the AMD_PMF_ prefix to the laptop_placement and platform_type enums
since these names are overly generic for inclusion in a UAPI header

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 13 ++--
 drivers/platform/x86/amd/pmf/pmf.h            | 22 ------
 drivers/platform/x86/amd/pmf/spc.c            | 37 +++++-----
 include/linux/amd-pmf-io.h                    |  9 ---
 include/uapi/linux/amd-pmf.h                  | 74 +++++++++++++++++++
 5 files changed, 100 insertions(+), 55 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
index 837d59e7a661..8ac44368a37d 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
@@ -7,6 +7,7 @@
  *
  * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
  */
+#include <linux/amd-pmf.h>
 #include <linux/amd-pmf-io.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/iopoll.h>
@@ -102,20 +103,20 @@ static int amd_sfh_mode_info(u32 *platform_type, u32 *laptop_placement)
 	*platform_type = mode.op_mode.devicemode;
 
 	if (mode.op_mode.ontablestate == 1) {
-		*laptop_placement = ON_TABLE;
+		*laptop_placement = AMD_PMF_ON_TABLE;
 	} else if (mode.op_mode.ontablestate == 2) {
-		*laptop_placement = ON_LAP_MOTION;
+		*laptop_placement = AMD_PMF_ON_LAP_MOTION;
 	} else if (mode.op_mode.inbagstate == 1) {
-		*laptop_placement = IN_BAG;
+		*laptop_placement = AMD_PMF_IN_BAG;
 	} else if (mode.op_mode.outbagstate == 1) {
-		*laptop_placement = OUT_OF_BAG;
+		*laptop_placement = AMD_PMF_OUT_OF_BAG;
 	} else if (mode.op_mode.ontablestate == 0 || mode.op_mode.inbagstate == 0 ||
 		 mode.op_mode.outbagstate == 0) {
-		*laptop_placement = LP_UNKNOWN;
+		*laptop_placement = AMD_PMF_LP_UNKNOWN;
 		pr_warn_once("Unknown laptop placement\n");
 	} else if (mode.op_mode.ontablestate == 3 || mode.op_mode.inbagstate == 3 ||
 		 mode.op_mode.outbagstate == 3) {
-		*laptop_placement = LP_UNDEFINED;
+		*laptop_placement = AMD_PMF_LP_UNDEFINED;
 		pr_warn_once("Undefined laptop placement\n");
 	}
 
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index ffe74ebc46f8..269c0a4b1cae 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -682,14 +682,6 @@ enum system_state {
 	SYSTEM_STATE_MAX,
 };
 
-enum ta_slider {
-	TA_BEST_BATTERY,
-	TA_BETTER_BATTERY,
-	TA_BETTER_PERFORMANCE,
-	TA_BEST_PERFORMANCE,
-	TA_MAX,
-};
-
 struct amd_pmf_pb_bitmap {
 	const char *name;
 	u32 bit_mask;
@@ -721,20 +713,6 @@ static const struct amd_pmf_pb_bitmap custom_bios_inputs_v1[] __used = {
 	{"NOTIFY_CUSTOM_BIOS_INPUT10",    BIT(16)},
 };
 
-enum platform_type {
-	PTYPE_UNKNOWN = 0,
-	LID_CLOSE,
-	CLAMSHELL,
-	FLAT,
-	TENT,
-	STAND,
-	TABLET,
-	BOOK,
-	PRESENTATION,
-	PULL_FWD,
-	PTYPE_INVALID = 0xf,
-};
-
 /* Command ids for TA communication */
 enum ta_pmf_command {
 	TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index f48678a23cc7..05998946d1bd 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -10,6 +10,7 @@
  */
 
 #include <acpi/button.h>
+#include <linux/amd-pmf.h>
 #include <linux/amd-pmf-io.h>
 #include <linux/cleanup.h>
 #include <linux/power_supply.h>
@@ -20,21 +21,21 @@
 static const char *platform_type_as_str(u16 platform_type)
 {
 	switch (platform_type) {
-	case CLAMSHELL:
+	case AMD_PMF_CLAMSHELL:
 		return "CLAMSHELL";
-	case FLAT:
+	case AMD_PMF_FLAT:
 		return "FLAT";
-	case TENT:
+	case AMD_PMF_TENT:
 		return "TENT";
-	case STAND:
+	case AMD_PMF_STAND:
 		return "STAND";
-	case TABLET:
+	case AMD_PMF_TABLET:
 		return "TABLET";
-	case BOOK:
+	case AMD_PMF_BOOK:
 		return "BOOK";
-	case PRESENTATION:
+	case AMD_PMF_PRESENTATION:
 		return "PRESENTATION";
-	case PULL_FWD:
+	case AMD_PMF_PULL_FWD:
 		return "PULL_FWD";
 	default:
 		return "UNKNOWN";
@@ -44,13 +45,13 @@ static const char *platform_type_as_str(u16 platform_type)
 static const char *laptop_placement_as_str(u16 device_state)
 {
 	switch (device_state) {
-	case ON_TABLE:
+	case AMD_PMF_ON_TABLE:
 		return "ON_TABLE";
-	case ON_LAP_MOTION:
+	case AMD_PMF_ON_LAP_MOTION:
 		return "ON_LAP_MOTION";
-	case IN_BAG:
+	case AMD_PMF_IN_BAG:
 		return "IN_BAG";
-	case OUT_OF_BAG:
+	case AMD_PMF_OUT_OF_BAG:
 		return "OUT_OF_BAG";
 	default:
 		return "UNKNOWN";
@@ -60,11 +61,11 @@ static const char *laptop_placement_as_str(u16 device_state)
 static const char *ta_slider_as_str(unsigned int state)
 {
 	switch (state) {
-	case TA_BEST_PERFORMANCE:
+	case AMD_PMF_TA_BEST_PERFORMANCE:
 		return "PERFORMANCE";
-	case TA_BETTER_PERFORMANCE:
+	case AMD_PMF_TA_BETTER_PERFORMANCE:
 		return "BALANCED";
-	case TA_BEST_BATTERY:
+	case AMD_PMF_TA_BEST_BATTERY:
 		return "POWER_SAVER";
 	default:
 		return "Unknown TA Slider State";
@@ -287,14 +288,14 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 	switch (dev->current_profile) {
 	case PLATFORM_PROFILE_PERFORMANCE:
 	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
-		val = TA_BEST_PERFORMANCE;
+		val = AMD_PMF_TA_BEST_PERFORMANCE;
 		break;
 	case PLATFORM_PROFILE_BALANCED:
-		val = TA_BETTER_PERFORMANCE;
+		val = AMD_PMF_TA_BETTER_PERFORMANCE;
 		break;
 	case PLATFORM_PROFILE_LOW_POWER:
 	case PLATFORM_PROFILE_QUIET:
-		val = TA_BEST_BATTERY;
+		val = AMD_PMF_TA_BEST_BATTERY;
 		break;
 	default:
 		dev_err(dev->dev, "Unknown Platform Profile.\n");
diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
index 55198d2875cc..e014d4ce5a20 100644
--- a/include/linux/amd-pmf-io.h
+++ b/include/linux/amd-pmf-io.h
@@ -52,15 +52,6 @@ struct amd_sfh_info {
 	u32 laptop_placement;
 };
 
-enum laptop_placement {
-	LP_UNKNOWN = 0,
-	ON_TABLE,
-	ON_LAP_MOTION,
-	IN_BAG,
-	OUT_OF_BAG,
-	LP_UNDEFINED,
-};
-
 /**
  * struct amd_pmf_npu_metrics: Get NPU metrics data from PMF driver
  * @npuclk_freq: NPU clock frequency [MHz]
diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
index 9de054cfeee7..c0bd818c0dab 100644
--- a/include/uapi/linux/amd-pmf.h
+++ b/include/uapi/linux/amd-pmf.h
@@ -42,6 +42,80 @@
 #define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC	BIT(3)
 #define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC	BIT(4)
 
+/**
+ * enum amd_pmf_laptop_placement - Describes the physical placement of the laptop
+ * @AMD_PMF_LP_UNKNOWN: Placement cannot be determined
+ * @AMD_PMF_ON_TABLE: Laptop is placed on a stable surface like a table or desk
+ * @AMD_PMF_ON_LAP_MOTION: Laptop is on a lap with detected motion
+ * @AMD_PMF_IN_BAG: Laptop is detected to be inside a bag or case
+ * @AMD_PMF_OUT_OF_BAG: Laptop has been removed from bag or case
+ * @AMD_PMF_LP_UNDEFINED: Placement state is undefined
+ *
+ * This enumeration represents the physical placement state of the laptop
+ * as detected by platform sensors. Used for adaptive power management
+ * and thermal policies.
+ */
+enum amd_pmf_laptop_placement {
+	AMD_PMF_LP_UNKNOWN,
+	AMD_PMF_ON_TABLE,
+	AMD_PMF_ON_LAP_MOTION,
+	AMD_PMF_IN_BAG,
+	AMD_PMF_OUT_OF_BAG,
+	AMD_PMF_LP_UNDEFINED,
+};
+
+/**
+ * enum amd_pmf_ta_slider - Trusted Application power slider positions
+ * @AMD_PMF_TA_BEST_BATTERY: Maximum battery savings, minimal performance
+ * @AMD_PMF_TA_BETTER_BATTERY: Balanced towards battery life
+ * @AMD_PMF_TA_BETTER_PERFORMANCE: Balanced towards performance
+ * @AMD_PMF_TA_BEST_PERFORMANCE: Maximum performance, higher power consumption
+ * @AMD_PMF_TA_MAX: Sentinel value indicating maximum enum value
+ *
+ * This enumeration defines the power slider positions used by the
+ * AMD PMF Trusted Application for dynamic power management decisions.
+ * These correspond to the Windows power slider UI positions.
+ */
+enum amd_pmf_ta_slider {
+	AMD_PMF_TA_BEST_BATTERY,
+	AMD_PMF_TA_BETTER_BATTERY,
+	AMD_PMF_TA_BETTER_PERFORMANCE,
+	AMD_PMF_TA_BEST_PERFORMANCE,
+	AMD_PMF_TA_MAX,
+};
+
+/**
+ * enum amd_pmf_platform_type - Describes the physical form factor orientation
+ * @AMD_PMF_PTYPE_UNKNOWN: Platform type cannot be determined
+ * @AMD_PMF_LID_CLOSE: Laptop lid is closed
+ * @AMD_PMF_CLAMSHELL: Traditional laptop mode with keyboard and screen
+ * @AMD_PMF_FLAT: Device is lying flat on a surface
+ * @AMD_PMF_TENT: Device is in tent mode (keyboard folded back, standing)
+ * @AMD_PMF_STAND: Device is propped up in stand orientation
+ * @AMD_PMF_TABLET: Device is in tablet mode with keyboard hidden
+ * @AMD_PMF_BOOK: Device is in book reading orientation
+ * @AMD_PMF_PRESENTATION: Device is in presentation mode
+ * @AMD_PMF_PULL_FWD: Screen is pulled forward towards user
+ * @AMD_PMF_PTYPE_INVALID: Invalid platform type marker
+ *
+ * This enumeration describes the current physical orientation or form
+ * factor of convertible/2-in-1 devices. Used for optimizing power and
+ * thermal management based on device posture.
+ */
+enum amd_pmf_platform_type {
+	AMD_PMF_PTYPE_UNKNOWN,
+	AMD_PMF_LID_CLOSE,
+	AMD_PMF_CLAMSHELL,
+	AMD_PMF_FLAT,
+	AMD_PMF_TENT,
+	AMD_PMF_STAND,
+	AMD_PMF_TABLET,
+	AMD_PMF_BOOK,
+	AMD_PMF_PRESENTATION,
+	AMD_PMF_PULL_FWD,
+	AMD_PMF_PTYPE_INVALID = 0xf,
+};
+
 struct amd_pmf_info {
 	__u64 size;
 
-- 
2.34.1

