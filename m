Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012061.outbound.protection.outlook.com [52.101.48.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553E73ECBEA
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 08:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992714; cv=fail; b=KaxvRZgqWin+qOYeLiFHDPFQDs0W9MASO8+dgMXQ7EmINAh07MxDLLG8FXHWkG05ZtuBuKAKp2e4JTMZlG9+3bvNTCjS7+ysqRuIg6aJX1zWqVnhh7ajH36b2c76lnF1UbgUw3gdapk95GcB1rmeIbROzOe1rxrDYLz05oXqkFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992714; c=relaxed/simple;
	bh=ZpiWg2bBOUrtEDJyGh1p2KarZo85k2s6TYE/Zm4SFNs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IFrjxRaiqVI4Zi2ZiZlWliGT14IYKdFHwAs0z+O83lH+012lav//DmnuZE0kpT9Itc+yKm+ymdw2kz31aq4T2FUw7QvD3blI79cWSQEli/ciYX8Fa+UqiK1qmEHAjLGDHHY26ztciQ+I/STNB6slYfZOk4iKNQazbRJFvr/h20c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OlKojnV+; arc=fail smtp.client-ip=52.101.48.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OlKojnV+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQzyhUael+wivODqkFm5e1ziI3sUZfdYqMJlYcCMw20qy9Hs8cSfneFTpRps6Moxbu3K4O4GMpYkU9sPcN96+2P4XfGAEYOgglQOOpUkcjCEvd29ywnr4F47G8jvU3lCVxe0f7x50C+X9tgRSjU1EhZ5v5L9VYq9fuidTYhPDJRQhzbN0GeBa0fW8jgsazGDjgTYcrFdwqyg5T9flLGan4XOke1k+me1X6kp65cZwifhNG+lOEqtPsMAt7SgqTs42x+b/uxJnP9KdolvK1LY+n0xSTtnm29idcyEgmNDhqPymnH4Ba1GnqhQytdPi6SCdshdO+41FSV9vdUE/NxJsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rw3+K6EZ/hqINCbzsgU+sNF0009IixfTYJRRzwz/p0c=;
 b=ozCFkUvXsyNjPOnFm4rEBR1SsJ7u6PxO0eGBteDcGbcX1bQYl8DUrPMsV9bMFy9MQB2zWJIKEq+gWFvCxFMXXaqrAJ1xqGb9fljSM3fG4dMZwSa1or5WLQpXBo4xnMiAP2s4a/qt6UMcjGLAENarH6f4/m81VuKBvO/YT/nGrGR/imEPXwUy7a3wRNO4jkaECepcuuIG8FSMnfEnTUOBQ/EPc1LLtbU97IwaOD1ZP6DYvgQYchvWwj8TNqQ7NQHUI7VMvXJzD8d2TDXCro3CIStkOZU64mHh1Ck9D0o2UPOPi25rxsp+7EA9PTpJdEbI/rt5eMuirh0f45QHowYkWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rw3+K6EZ/hqINCbzsgU+sNF0009IixfTYJRRzwz/p0c=;
 b=OlKojnV+Jw/VIvP0SY3J7KBrvfzoLH0N9goHsvZw/Za8xZFTEUziw6eP/a4h6/dUDa1PFXinq/tlj0uwezhMMt86aNiWQ8NA2qffvyedxugi8p5ffRZXuz5iQLAQFRiv+JfRsZrknCdp8A+z562pIn3eyaKyP1vqpQkyA/DxhM0=
Received: from BLAPR05CA0003.namprd05.prod.outlook.com (2603:10b6:208:36e::10)
 by DS0PR12MB7825.namprd12.prod.outlook.com (2603:10b6:8:14d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 08:11:48 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:208:36e:cafe::8d) by BLAPR05CA0003.outlook.office365.com
 (2603:10b6:208:36e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 08:11:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.1 via Frontend Transport; Tue, 9 Jun 2026 08:11:48 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 03:11:46 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 3/7] platform/x86/amd/pmf: Store commonly used enums in the header file
Date: Tue, 9 Jun 2026 13:40:40 +0530
Message-ID: <20260609081044.2416731-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609081044.2416731-1-Shyam-sundar.S-k@amd.com>
References: <20260609081044.2416731-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|DS0PR12MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d40f9d1-b5fc-4c6c-b024-08dec5fec105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099006|11063799006|5023799004|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7+DCxTcb3m/z3FRtZuMMCMZMVKeOPoI1SDBUmtSbTs6k4D8P7TZhcVyWkcuHNjuqI6JJLqdrjHinso6drD7sb8ddJM4zGUzRsm+14G1tBfiM3NkSQwhx17J98ztbychAcm5seUuT+ABg0sgSPooIY922/7RcBTFcd/X4N2CtE4kArR+k59qE7zFsXlKzw5uyPRWP8vqUNEZXoSn0QYI5MGkupDj4WOgfbOdhIvCkZOtW/bOsW3qHbuuXb4TDgQ67lryhJik3b2MbJSD12OIykBXxL/UHmyQJEhAmIM+wLAYCxxNOkj/DRChjtRHNK3NjpBTM4UT4CbXi4wvPqxH6ktWNYgRUAMd2sqfsxsK6q9N4B2/dARi+COKhJDmkpnj3NFR5vq9H2vznvtACRvtnB1xt+VPq2wz0IVHkqqs4JY/0oOvwFZ8odL7bFcLcM99T3DNr8YVnFfNCd+ZPiCsEcHdzAhXq0TNYX6x52KqMrjQj940Dwow6NaHI86qcZbNDwYzNivKIoGC8XwW/0o59c07+t3n+iP3PJ7cO/0eZZ6oAR6K7SNhqtj1N7YCznGu793is1BBCkl5JEVUj8bMNLaQlgRUUbWwRACdcdS3m8nTkf9Fp997k4pJGtxBRlBZUpKC8xe5uIopOZZI+GMMMBii76Rsg6le5OIWPU3F5L1AP9n71meGy4Kyk9bZVvyAxvhzPx1B5iik2BcD23gTsOIuv7BGBK3H6BYcIxIE9wag=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(11063799006)(5023799004)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DjktZWy5zwl6VZDUM8Iks/EvfjsDBC8NpSyebqnNs94TOJAauYVCGtHuR0ARFb6eNCV1tWd4Dh2ymX33aI7/2moU+gMaW5AOMGrkCbXtShifyHFlqAxzyYGS70Gz45l+hDihBSmViYT7heeJGWNIZrgZqsa50bvbicnNnRE4WbokkVIgeK8AIzP796iN05Is9uFeDhm1owqc9MEw7efnPNoMahx0dBks9lNGbCIoCS3JRT4YwvKr4bAmf7dE2eOzk6+nIFER9dvxgHVGcORIIighdV5tnyIhUp8qHybJI1EveKRWkRt7j4jeuy5hbKHBHReI8oqsIxfmru56T7ABIae7p+BUyc0qpPXrJtsYjM9VScLbRzyE3y4/FqFLBGGkbblIylRjvOsMWTG0XcWPGEKVRv8Aede9jSh+pZfbnq01mb4okjPaYc5QKFMy9Aui
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:11:48.3492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d40f9d1-b5fc-4c6c-b024-08dec5fec105
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7825

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
index 90bc2970665d..bd802f25a717 100644
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

