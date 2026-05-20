Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012044.outbound.protection.outlook.com [40.93.195.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EF5407CC0
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 18:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779303361; cv=fail; b=uaFUKDjDMbXfwzIlhs2jBO2NP3wROdX4BR8waFVXtxvCqzIoJH2yKVDu7/yepoPI75VsETwD7Z+VvBI68UFUDQBQE6hMGz4iN+3UMBeNOLRZrzqcB7lSocVX7vPOFaZ/WgJqzPS3J9dXKk9x/JlYRClq/84oaDjo0bjTXAP351U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779303361; c=relaxed/simple;
	bh=xOsQ5NHWrEXc0nQrYIreJEIpsXWchEjpZV3IPsFzj1c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L2r1E3fgq5EWK2TRQmqmd9HfV8BOwClryDxepPu/gPywEGR2aFuPl43O28FeY5CI4m2Giiob6+O2FY1JXEP0bviC8LbIKtuBJvwjwZ0tGN6bpJo05CDlEyPF5nLXv5r568PBTP6P+wpntlgVDRT170sYPZAgtzS3Kyw4zAU7rBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QaHTrWua; arc=fail smtp.client-ip=40.93.195.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QaHTrWua"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVq58bQ7aL1WNaGDDamW+IQByC9UyzBWuMCxp4EJq5rxmCmUdVY8AI65xdHWVD6cZ4z9lFJHkJ32ThkD9QCy3mY4GvTLdfZ9YEN+6JkIIRtZoEE2wDfJhPocSz8cG5I2uY9CrD41Z32hbvvlf1EOMEYnhrWoXs+Wrw0WSO4m8ZhkK+n99e0FyddzYLfZZknnx5nq9g95+SbyxMnYpZXoQt5kajMeNANWKYQGQB5h7FCY96fK0wg3u9u/aoSEAV6mnD70FnBQc0hgPSQlR9vxz6JfOg+TIBixiIey0c6ntoEwIZeiLtM/tJkE95oRnrK9qsF3/eb+0sDjS9BO4G3A3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExUClq52L9RRw/xPUNqCtW9oWU7y3khKQJ5PbZjO9zY=;
 b=KahYCZSZkHYSpNlPaLQMQErmz5ZmxnEstYSinAAjak6IONOp+4q6Kea7dqYnY/1sTaQLzipaOrSCALDOy6YlBEc84mPpQ1/iw9kvrf0DzmP8ne3BuwkmSkMVcrLvreezCSTG3rAA0G3/1Zp2aShQsRcGDZFAWH8smqQRbN8rQiE1SggAamcL78dw3fF115QF2VnrPCf3cowOfEeHEgvg1LkvshjfRcTMi24V+xgbeNebB7BoV3ZKkj/ksXavhy3nS3F6b726r39CtE3LQBHjcodip7MqAeKv4HtXMnGcLVnOtwl1l2SEVDVfLkHV9pEvyXORw0dXYtJEh3BcBt/19A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExUClq52L9RRw/xPUNqCtW9oWU7y3khKQJ5PbZjO9zY=;
 b=QaHTrWuatyJSSXc6OSALompL6LmdeowpUI6h5uqq2bWUOqca6L0hqN5/OyaK0AAZbnBF4VI2ai6FI5kLH5xB4ruWnbpM5AhbMM58tUr50/JtnyUOJK6y24cV66lqWORafsitwHE1/xlTsSbPlCg7JNBm78Bs7xqld3H445JM8ng=
Received: from PH7P223CA0009.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::25)
 by IA1PR12MB7614.namprd12.prod.outlook.com (2603:10b6:208:429::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Wed, 20 May
 2026 18:55:54 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:510:338:cafe::4b) by PH7P223CA0009.outlook.office365.com
 (2603:10b6:510:338::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 18:55:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 18:55:53 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 13:55:51 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 4/8] platform/x86/amd/pmf: Store commonly used enums in the header file
Date: Thu, 21 May 2026 00:24:20 +0530
Message-ID: <20260520185424.770772-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com>
References: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|IA1PR12MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a2c9f75-e9ad-4b1e-3b62-08deb6a16b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|11063799006|22082099003|18002099003|5023799004|6133799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	uMilXqp2/4jGrpfe0AX80GdQ6cC7OmI7RVNk5LziL7t6wemeIs5t7PbFOSM16+u/rFqxFS5IgtyDiXrVhfEMsHQnuJbcOWS6cgGvMoEvN4WzU9ZuzdL7E7J6qao+lIcEbn3LiZZiw8hL67OLJ/QFCHGkgcPfatZ++YWTh4+wQtDEGk58LnpBjsQ3Po02cESCgNBvj41GGgqRrg4wNmON+DuXkLDE6xhRGDipXUzOV4UXy1eY2PBRsB2YvAEzbg7ESdVO5m76ChPFbDvLcx3L1B3f+kvJ/m14pYIqu4IFTSL37NceJLMNKv3XZDmPCmb1EO0wJVIXmKZlw1SKisdAJ7+6Oeg0HFcBqNW3+8r8Yxe5uhEB4ghQSE57VB27ADP6MQ/AfMtvlN/ZxykAx/dxxkdgvscgOet5wFlfJJek+MW8Er0LE4MiBY/I8Fma2VE8ruI+4TiXUDDjHZLkzxgOD9II7vev6SLJJH1cZvQvSCJBbnkG0yyfV5xBgZj7VWVVAswMDlzsbC0YVufw5tueWGyMy3Stk7jzU6MAVdS/uAlV//LgNuiCXCzi3U+VERVxe6eweERt8OGl7wUXBTn4WWwJla6/mG2ICB5gH5UafHmNZjjNq5b/hBTOKsN+8pgfBe9P7Q83O+FzavN0GkXIaDFqTHBghYhZCpaMHpJ/1IndKEmBGqtDNHjNNdloNLUYqZ6cZ4hribi3AFwKxHA+QRWuz02jyf1AKbOvxOP+53E=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(11063799006)(22082099003)(18002099003)(5023799004)(6133799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FBqGsHBbWvvNw9hdxZgI9Ghq7FUD0l27XWMkLQMPp52iQa1KwRtPMxQOHGFT6z21gbvkUN1mMKoIyZlZ2mC18ehTenqJnEZxcL7gGcJx851ERAtGrWzXS9Pe4j6DQ0bCtBzls3bZ5ElIgxK14JSQ3q99ZlERFIN+xe6N81N+5liwROUTSPFZfdR//mZUd4goavYFo8nHsyC2kiWSSmkweAdW/7WqExxXy0iaMrBDiztd7jzraNuzULJl0rx9K9/9kaiwilQdZ2/MN2yq5khHGS5L0MAPnCvZZnQ2fE+g2j54waLyN8QPSBeERQsKPksuZHFZAxQr/2QyDjLnT22Fz02DjvgY8jL05QUfrZ9p1UGXEM8RlOXqvAqrTeomS48O0xoTH7xnTd10m3qCvt/5mKMJCk/LN1zw5gCkJt3+p7ioWdIwJhYzlj61mY+bD43F
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 18:55:53.8070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2c9f75-e9ad-4b1e-3b62-08deb6a16b46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7614

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
index 38ab5362fe62..54baf015e4c1 100644
--- a/include/uapi/linux/amd-pmf.h
+++ b/include/uapi/linux/amd-pmf.h
@@ -41,6 +41,80 @@
 #define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC	BIT(3)
 #define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC	BIT(4)
 
+/**
+ * enum laptop_placement - Describes the physical placement of the laptop
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
+ * enum ta_slider - Trusted Application power slider positions
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
+ * enum platform_type - Describes the physical form factor orientation
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

