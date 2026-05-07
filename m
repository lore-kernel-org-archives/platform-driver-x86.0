Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010001.outbound.protection.outlook.com [52.101.61.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10803E7174
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 14:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165159; cv=fail; b=XZnP+gAVoslOVC2sJhSics+3PHV+isiAGzxWR1LR6wFHjXkJyxqH201KSqXXuW6VhyRFrdlFRTUYRTT60Y7dD3DEeSyXp0Y4T/iPUcaPYV9Qss0HoJ1/OIp+rGIb0+0jhPSyV3WWmeG/LMCbKsmNcnllKufIKfsTEE6YftD0ZjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165159; c=relaxed/simple;
	bh=CDPSEw2ECHYaoEkVPIsgEqWLYl4UGsnXNjtiYFVQVXI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uprj0h+MaYcOAzOWstb4VNonyiBneX4rM3R48c7O+L5L4hquQpNUM4rfbtXWTyNsee7uuCRb1ZyXA4cF7r+E/v6/qeN4CWuW11iex9BZKLLBkwtwaKtUhyN+aihWKLi6DW98MrOfs8D9Sqr2DPCaIrX/OsRRyRgUvJAIuuLNWqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XFRd7ZfG; arc=fail smtp.client-ip=52.101.61.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XFRd7ZfG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKzo2xOBH7ppnVuI3kXOSvmeiuQxP9UhbTc+dM1hrKZE0r+OGocLUZYPyQ5F2YtlmO0FbwFSyy+jBjIu8KntG2h3ksCjnpQdSIQ4sm03fxBw7jRPTVaBhY8YPRDNYS2oZ0XRK/cqAW6QdJMM8zzXjWFBQeAGLinr1704ihT59cLL8dbyM6uOpc2OFrXCzMQhRex6N/TfG4VRZVofI/qr5cfyLo1YPjM9b9TJlijezDfyeZDo8FmKaAdxdQupxJgt/UzzQJWbQYaVeFuKRmsh12rlfdfi9aAN+e+vuP7P7G8U5Ww7Q4mMjWVW5ovpZUfm/afk3I7x5Q+OCX5E6Sevpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0u4H8KDrUZjnbyARGfdJ5+guyUgj8OGUkz8SHX83Re8=;
 b=UmjauTCwl2L+dDSG9iN+bVFxq+nx+srBmX6M0OgdS/PRsyjoVWvINS2GcA4fLolkBoyuU0y00AUzu1LaOOUdxs4NIvWI/MkJGeUnNIFj94YePhCt0/D18VGNwr0vmQEqBjlIxF6kMFznPSMFmhtcU8bRZggx9/G3LDqf+mASWV9pgtFGO9xKU0emh0d7xUB4jozrXLxonmRZsKmwrAhZFZlDL6nkKFPs3FLTxDxR9xjHlDWuEVXmQGK71CDLcOyCcJQXxtzFxZHQd68e3e9erbaEs0qV/vgeK7hOdJjVLlSMN3ok7sxlsLpnXSnJs0DUPo+Uk3gcYbzbM3XaKHHJRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0u4H8KDrUZjnbyARGfdJ5+guyUgj8OGUkz8SHX83Re8=;
 b=XFRd7ZfG/y0nbOd7gZT3jlnNVQ2q085Zf+w0BVPmwExlPzhzqSJh2FnRxfpznomTkEbt5podpHK162DRMxQ7GzDu9L/XBwgLICFMEH6kEJslMdwOSnegYnbRVQqBLy2QeZ9v27Zf3g3SFCrLuSwBsAUDBfoGQUQhEGxR9ZpO6lA=
Received: from BN9PR03CA0584.namprd03.prod.outlook.com (2603:10b6:408:10d::19)
 by PH0PR12MB5607.namprd12.prod.outlook.com (2603:10b6:510:142::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 14:45:52 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:408:10d:cafe::ac) by BN9PR03CA0584.outlook.office365.com
 (2603:10b6:408:10d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.16 via Frontend Transport; Thu,
 7 May 2026 14:45:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 14:45:51 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 7 May
 2026 09:45:48 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 4/7] platform/x86/amd/pmf: Store commonly used enums in the header file
Date: Thu, 7 May 2026 20:15:21 +0530
Message-ID: <20260507144524.664001-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507144524.664001-1-Shyam-sundar.S-k@amd.com>
References: <20260507144524.664001-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|PH0PR12MB5607:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b57ab2d-92f5-4e1d-a444-08deac4755a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4zcMmlwff7a7Wc9/Z+NTA/1u1dBB6i3pOHZbYK6uSAtasYS7+hreU8+pSj+oPjGa5ocmmb9aJNYJHmcfJ4F/hxts2150RTwSugoOJvFyTVR0LsaKy3yIsstp0cNjSAcWmFwOgsrBdCw8QVabZpQWA27kr1Yws5UxrNiMnR55N3xM2J/AZiIWuLXwjp949ZHJNKi79M77w0BZ9jywn4/WZyGCwrgDhWIjTLsF84sImLJfSm8fvgOjht4k5HSRt/B17IQwJ3TQCZUIHe8ZkU9EyFS4owxM6Pxcad28qchBx5mpgAvaLgOjM373ce2yVkODJTKPYq2Ltz+Bj0al0eSk2937p0fGMh0eg+f0vp6OB+i1PONlJtxYYixSI7jNQWrunPhfjNPv/G7U/GTHdU/xj2f07g+7OX1g1eHHayWsRU1yto/XYcme3r99rD5ozzALpom70AFzlE3aaL/x7rZA1etv9oAAIsu9k/IdYrVNj06KLC2fV2W1hUWKQNNcccp7BxKP8ZjEfUIdzSfH2HK7ZWX8cQJ8IwzPSJ+pEhP1EwTepgKOGehzMKDY0g89petyecdoGHNW1MZd6YEL1hXFv/8RcfYiY0fL3o4h3fLnEy3jL6jp+8M2QBcSUrnDRuCtZRtussqj9yGduEWW3mRbFeMQDb+m9nN1gLo7ObWLeBaFQho/X0lD4sSW1BbZZKsiCCBjufnpmUWOOTlXdzo1Lvr9sYxMBqIqFmxWvEquac8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EhnaCwqtHsnpGrmxRJ4WOljONZ9ELwGsT0iE4YRs4Jk66n+zRre0PSDmLZQbb98GuYuNoEpR7fXuc9wspFnrGXs8uBKU2T+sclDo5BYvXEs3FtAfJJEMNhhvxJwDA8zvaYY7EFxbxKJvE4BmuNe1XWOK7RuVYXGy+AfCw6vnqwdUIHXtjFnDULy9gBuv0U35eiOCIyqJbw2wFh3wHmu2+aE0CJz/QDMIXuAf2ies6VKsGddlGfagYXIQUNfM3uaOkzzbhaUkHshbACoa4iwSQgVclgx9V5+THm8XWxcr8ZXp9Z0t4LkDdYpJZ00VbVu82MzgKBtEecAmfI4Tn/to7Gr6qZSHELsRAi+yzz/WKE21+3Nlm9gRAG7C5yBBB9X1jX9ooLOBrVS1ZO23DiiNALeQ6GMXIdSymW1P91g4JQky4CcDAPyVpeUT0sQDXdCd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 14:45:51.2593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b57ab2d-92f5-4e1d-a444-08deac4755a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5607

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
 drivers/platform/x86/amd/pmf/spc.c            | 25 ++++---
 include/linux/amd-pmf-io.h                    |  9 ---
 include/uapi/linux/amd-pmf.h                  | 74 +++++++++++++++++++
 5 files changed, 94 insertions(+), 49 deletions(-)

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
index f48678a23cc7..cbfdf3256fb6 100644
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
index 0fe68e21ee5b..8bd2fdee6ef0 100644
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
+enum laptop_placement {
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
+ * @TA_BEST_BATTERY: Maximum battery savings, minimal performance
+ * @TA_BETTER_BATTERY: Balanced towards battery life
+ * @TA_BETTER_PERFORMANCE: Balanced towards performance
+ * @TA_BEST_PERFORMANCE: Maximum performance, higher power consumption
+ * @TA_MAX: Sentinel value indicating maximum enum value
+ *
+ * This enumeration defines the power slider positions used by the
+ * AMD PMF Trusted Application for dynamic power management decisions.
+ * These correspond to the Windows power slider UI positions.
+ */
+enum ta_slider {
+	TA_BEST_BATTERY,
+	TA_BETTER_BATTERY,
+	TA_BETTER_PERFORMANCE,
+	TA_BEST_PERFORMANCE,
+	TA_MAX,
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
+enum platform_type {
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

