Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011064.outbound.protection.outlook.com [40.107.208.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3606E317171
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Mar 2026 13:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772370726; cv=fail; b=PR+dSChN/Nr+C7SpEaTd7G0f3F2/Lv+v5eA/xeXw5tQSOFoHiFCz4CtDV4nMref9wBXv1gph4uOEZTfTEWr0t8I3rg20b8QTiIVuoSKWoZpz/KdfpMVULY5PRdx+eV6QNZgMizOJSdA0+421SIdx86kBXo0zTG0I73V7tDiUB5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772370726; c=relaxed/simple;
	bh=gCoHxumyIF2UEbeYIkqZ7zbmtW3RoF01/m3txwf7O1g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dlfbv37S9bdALUUyK877moTTYA8evBc3iyhKvNVeiKCJFctos9zRMaLfYZMSLbYQESYuZ52/hbC6t6KdAdD/ObUbM1FLhOmudpwqhAMKQMLid39TrHSdh0YwuozHezRnU1zcAagvIz0KzgupK6JKlbF3KD8MsjXsslzhFwuqcvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4jd326Po; arc=fail smtp.client-ip=40.107.208.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4jd326Po"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFGKRULrQeyj1Pr+bsHBLJOP/JH7DQoMaHMprn7ybmNisI93H2rF189oIQaVTOmx8x8SyTzoaDCAUsT8++dTwqBwVi9zNjW0EfXC12M7o39LKgaCKJTWRCp9W7Ac2vejBCf3HpMCblreMqCK72YQ8Wzoy0n4D2sP3NH61Rd+XRLG22RYHHh/LXSc31xoxapMlzZhVRXsVJVFRsLenJDEsw01XiBSEskErSUOiXl8vNERVvgRhGb8fSMP3YV44QdRVtwTccuhAIk085novzn4VCOsP3n7PYfJqUzzAsd8ru077a4lF3N14U+toMSQ8c7HN5dKtW2Y6sBVomr00Y3DOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wDF7yiCltQQQJQyYJ54A+uuVE2PDp3NbIfanBF9vkM=;
 b=cmKEP0lZc968n/tzjfTMN1iswRnG/6OY+MqttkVF9XLa3MyO2QpJeld4xMHLrbXmMkmq1m9Bax6NA1/ZiHeVeMfb1zFYgr79FXkfDQ2wGnGZT/N/xPm/BCpz2P2Nwa6o5mIqxEVrxc+KbcYazRIAXyH+OVBkxw2rscAVASJDgD/I55JpYjlroJ9dU/FNYAzkF7DBpVnL0Q7blismUsZ7DPulENoDQLd/sHC9t5UU+o28BG1jzE31wwo1LvShdU/ac2/r8ddQQ9G+cPuJFI6mIAI607uA1UFAw3/xmB8Zh9x80C6QrvlC/mgsJB84rXXrXUYn3eG+6Ov1jXdaZBeZow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wDF7yiCltQQQJQyYJ54A+uuVE2PDp3NbIfanBF9vkM=;
 b=4jd326Poey22UaQsq98PAF5sW39KJk8kQD+/bhrUTmly3iUwTyAfnGWDQPqb7cufV451Q3VFw13qFVQXzkfd4yMYyZlRxN45kJF+QPbvqAIdZls2ul5w4B5ZrlwlFOSA8IqhiH+aWnu6dBr2RcK0Cs/lFdzg2Gkpx9wT4AIadyQ=
Received: from BN1PR13CA0009.namprd13.prod.outlook.com (2603:10b6:408:e2::14)
 by PH0PR12MB7906.namprd12.prod.outlook.com (2603:10b6:510:26c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Sun, 1 Mar
 2026 13:11:59 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:e2:cafe::48) by BN1PR13CA0009.outlook.office365.com
 (2603:10b6:408:e2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.18 via Frontend Transport; Sun,
 1 Mar 2026 13:11:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Sun, 1 Mar 2026 13:11:59 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 1 Mar
 2026 07:11:56 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Yijun.Shen@Dell.com>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 4/7] platform/x86/amd/pmf: Store commonly used enums in the header file
Date: Sun, 1 Mar 2026 18:41:21 +0530
Message-ID: <20260301131124.1370565-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|PH0PR12MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d62ce6-1303-43b7-0bc1-08de77941ef2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	jamr3dCIhN+VLldTUTBzw5t90rz/lkdrX1jGD+fDQl4KWbPb6/wBLqdwerkgFVV2N8zlmSRV+0TlVZbC+m4y5K65sN16wer88PHqUspVdAOOcMnGw8ZHM4PZyimqnSefC1q1mUEdKVMfxueYUZ4r8aDKnsZSkR4ftUswHPM+YIyqDhCBpkawHdKpPlEfTBXZ34Tg8kfdUcfDQfd/KzNtPbldzNSfM3NprSm0DjBzjWuwZqxeXQgn4IOPCXavv4ZBrHfe35mRvdllaok3Bpzrz8vmZlOr26TTMTS7fPUz+2lJskHtABnyNMosJIkQW1xYNEt8T41hZ5bTXhE9CqZK3ormLd9kPTEkIILcypq2byAvUkxHGy42K53Dv1Xpde4zvu0C/nGJei2PBRTL9NSmLexTwMet/yy3tvkkyQy3j/yjQOP/ux+IWPut3aXlXO2nZbg9jfailBPHrF2ET6gHHDjKmwyR8M8KuGbGE+bQVg4fdyCNugxROaCCaNOYt9QlYaulPUKDstun1Gtd8pVLc5OXspVueptyopy6WvHCHiPD3o1JEWKiie8gRQd1JTwBUZ6HAON2+f3zx9Jce9ZugnJzMfna+uAF/GJQdZ1fQMHryZkReDEGW6T4/7eWe+7cL9N+dDDIss5IwGdGmeJbYz+tQzwtQbDMFSE8Xfnab4YPWw+ckJcHxLDagN7RR044H4aBvH5YzibvFszW6HIiaDjLTsrT+s6BVcEB3LWUZY3o/P63dC2GmQs+2yHiJEJKmWuNQwOP5+mm+owG81Qjz05f42o9BSgz877ZG461wrV9myTEMIcXTzxlGoKnBnGNWR5ccwNw+gkagMcUNPmGTA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xdo2PWbxfrVK+kC1cOtRYOu/cEcZyBO6KvVXfPk3Ygp0WaDxVUrrNBbD34jQgH4gy11C1mAk9SyiyPXfAuhALwzp9FgUZj9pFg1SZM+SOD2KAJckxVSW5ZZ9QrogJERwgp8u79zYrnim3fH62LTe7VQxRCohO5Tt0oFbax+BeyD1DpjylF69DGSzUV65QWykZPOS/2C0lOPfb4Nnn1dUo5ORJRGuMQhtMEQHGld6iz1a8RESVQnIUnoAiIjzC6ik8297PcsK1RrHtXCTETvZGba3rSQ0gRzmxVX4AUEMmnBpn08gdG7rvUzknkWgSINWsDQGFOybUDKI4Ky5897aPUnKAgkAuXuOfWplyjHb+IqcScoBNKhzkZsjh0SWag+mrAxFFjrufaV7SaoLt/NQwUu38bo9Ef12WuP43RjMeksoAZTWV5acguPvfyqzwdAk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 13:11:59.0809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d62ce6-1303-43b7-0bc1-08de77941ef2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7906

Relocate commonly used enums from multiple source files into a shared
header file to simplify code structure, improve readability, and
enhance maintainability. Also, remove the initialization of the first
enum member, since it is not needed.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    |  1 +
 drivers/platform/x86/amd/pmf/pmf.h            | 22 ------
 drivers/platform/x86/amd/pmf/spc.c            |  1 +
 include/linux/amd-pmf-io.h                    |  9 ---
 include/uapi/linux/amd-pmf.h                  | 74 +++++++++++++++++++
 5 files changed, 76 insertions(+), 31 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
index 837d59e7a661..d9751c9ebfe8 100644
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
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 0d879f0fd8e2..f668c0450457 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -681,14 +681,6 @@ enum system_state {
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
@@ -720,20 +712,6 @@ static const struct amd_pmf_pb_bitmap custom_bios_inputs_v1[] __used = {
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
index f48678a23cc7..a40419b5e1b7 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -10,6 +10,7 @@
  */
 
 #include <acpi/button.h>
+#include <linux/amd-pmf.h>
 #include <linux/amd-pmf-io.h>
 #include <linux/cleanup.h>
 #include <linux/power_supply.h>
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
index f34c5d744039..00fab9269238 100644
--- a/include/uapi/linux/amd-pmf.h
+++ b/include/uapi/linux/amd-pmf.h
@@ -32,6 +32,80 @@
  */
 #define IOCTL_PMF_POPULATE_DATA		_IOWR(AMD_PMF_IOC_MAGIC, 0x00, struct amd_pmf_ioctl_info)
 
+/**
+ * enum laptop_placement - Describes the physical placement of the laptop
+ * @LP_UNKNOWN: Placement cannot be determined
+ * @ON_TABLE: Laptop is placed on a stable surface like a table or desk
+ * @ON_LAP_MOTION: Laptop is on a lap with detected motion
+ * @IN_BAG: Laptop is detected to be inside a bag or case
+ * @OUT_OF_BAG: Laptop has been removed from bag or case
+ * @LP_UNDEFINED: Placement state is undefined
+ *
+ * This enumeration represents the physical placement state of the laptop
+ * as detected by platform sensors. Used for adaptive power management
+ * and thermal policies.
+ */
+enum laptop_placement {
+	LP_UNKNOWN,
+	ON_TABLE,
+	ON_LAP_MOTION,
+	IN_BAG,
+	OUT_OF_BAG,
+	LP_UNDEFINED,
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
+ * @PTYPE_UNKNOWN: Platform type cannot be determined
+ * @LID_CLOSE: Laptop lid is closed
+ * @CLAMSHELL: Traditional laptop mode with keyboard and screen
+ * @FLAT: Device is lying flat on a surface
+ * @TENT: Device is in tent mode (keyboard folded back, standing)
+ * @STAND: Device is propped up in stand orientation
+ * @TABLET: Device is in tablet mode with keyboard hidden
+ * @BOOK: Device is in book reading orientation
+ * @PRESENTATION: Device is in presentation mode
+ * @PULL_FWD: Screen is pulled forward towards user
+ * @PTYPE_INVALID: Invalid platform type marker
+ *
+ * This enumeration describes the current physical orientation or form
+ * factor of convertible/2-in-1 devices. Used for optimizing power and
+ * thermal management based on device posture.
+ */
+enum platform_type {
+	PTYPE_UNKNOWN,
+	LID_CLOSE,
+	CLAMSHELL,
+	FLAT,
+	TENT,
+	STAND,
+	TABLET,
+	BOOK,
+	PRESENTATION,
+	PULL_FWD,
+	PTYPE_INVALID = 0xf,
+};
+
 /**
  * enum pmf_ioctl_id - Control codes for PMF ioctl operations
  * @IOCTL_POWER_SOURCE: Query current power source (AC/DC)
-- 
2.34.1

