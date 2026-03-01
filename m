Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010069.outbound.protection.outlook.com [52.101.46.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C3031DD97
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Mar 2026 13:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772370727; cv=fail; b=sD7dT7+MRZThuGkSC/1YexWwekSfLuxqmEsyrnq/dEclmr5sFdjktRLUYqLZrQ/+VipoBSAZ7E9vRlwj5AeP6AB4GarH5IFnNaiAc9sMYIrb+T5e2U8ZM+fpa5HQ80W9EhQ+LK7EM6zRi2Fxfp9TheyuETI9jl18ZWnYvXO1GI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772370727; c=relaxed/simple;
	bh=2PH77U1R4+oWzoabUF+KG87T/y3O/6EFQ6iHfQjH+vU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tvAFrF3XloQJ25W5J8ClhXzELXaZ40n8hBnLPg3sc6YxyAbqXpr2HOwpPAgNQ2J/zB9py31WXiQIWoZ2Q39ESckwZIiDwl7nDsHeJwS98cDwgQHBQRJ7veOwxGXCLneLzbX2wXlNmsk5C00WxpdwYnvW/TH496FOmoFw1gksXsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=p2TQO60u; arc=fail smtp.client-ip=52.101.46.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="p2TQO60u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYZnL87FzWhxHhpyQiwb1AZ2jqvKQfN+1IrsE9gGcMorhu+Ucd9YT/glag8A7XVSMe+aRIHtEFnuAhg3NVXDveXoUoGGlJIc9FKL/g9plLm1o6xNq40PK9Yg8fb4/5CKmOQ6p33x5LEDpa+mlFaPH8WxDnh73s1rdXTvpJCrQ7yIjfKZnZuQtcUCBDdKPVdKgOPWK/FKSA0104VDG/qY+OFczKgX7hHLcAFMVcEaZigqHboO7ObiOuAj0l1QpEcK63c6/JWzBeCKVNcXNUrFBtJ934GdHIfU3jyT6BCLKGN8iejqxNlKJ7IbUSn23I9YwOaxpPUqE0wHT9sAHnNsLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2P1YmLH5fvoc3sjmHZECS4of9hJdBWciFnm2VnhDDHM=;
 b=GE97esiVl/vhbCaDLE6Bd1f+ti3sKAnqJ1ZbVaArgmW9XzOPP5O/PSqqy6ffJKPBdpIKxCUeGPztBK9bE55wOHQMcC4yS8EhqCbjRtt1/y2znKfwt7+HhtEhxv6qFPrjkX6338gSorZdv6rZKttRR1kRfjJSue5KlcgVD0oqe5ZB36SROpBMWr6SgFjZJq1C5KOzcIQr2QcZ+qjx090df/qfZnpKJ5GiW568CgKTLqwb4dnws8PWhS12AB4vVZy/ZqAOZQAdPQA2AdSopIeLLSNJiqsUh2wFBimAeLCBuaxn+BdbGcQHsS+SFf36lUvJK4x3QtUGeKUAAArzWbm6Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2P1YmLH5fvoc3sjmHZECS4of9hJdBWciFnm2VnhDDHM=;
 b=p2TQO60uQUZ+FkQXZxZHb5G2HUtFUVRYwE48O63ZKbPvymJnKGHl0C5XMxwXgyrPGonZYGTSdrXAaU7FLIK1tGxLP7WU7vnvLj59O/Enz068kU9/Mtqwjx0KZ1FYdnF2WPyPWt8WHP1/jVENNBG7au3G27RtRFgPgGpLGRkRLP0=
Received: from BN9PR03CA0078.namprd03.prod.outlook.com (2603:10b6:408:fc::23)
 by DS0PR12MB8199.namprd12.prod.outlook.com (2603:10b6:8:de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.19; Sun, 1 Mar
 2026 13:12:01 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:fc:cafe::82) by BN9PR03CA0078.outlook.office365.com
 (2603:10b6:408:fc::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.18 via Frontend Transport; Sun,
 1 Mar 2026 13:12:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Sun, 1 Mar 2026 13:12:01 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 1 Mar
 2026 07:11:59 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Yijun.Shen@Dell.com>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 5/7] platform/x86/amd/pmf: Move debug helper functions to UAPI header
Date: Sun, 1 Mar 2026 18:41:22 +0530
Message-ID: <20260301131124.1370565-6-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|DS0PR12MB8199:EE_
X-MS-Office365-Filtering-Correlation-Id: 55ce7526-aa11-4a0d-6eb5-08de77942059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	Dfsz3GNOv6TgdqTRqp3TMxeVuiQNkA+jIRF79b+mxPAPsZwer1Pj1DEMaANuNXkRImkEtWQIBDE3YE/9N/aHZJGyPeg77gz7A7EJAhU14PYZX37k6ES4YDXfwFLsjAu1+F19F795tL5X/6/2g7OolFa8JXIRYSTzeS8DaZ/gYwj4P7o1dVYVlVL9qksbOoql2H4wqY0h1GGdwdGFelVXliVPljrQ8SiBlaLk5hUwruOGL3SumnUqoLyzT/bO/xQTWDYXgbShKFSsi5HesamK0ddAKc5l2zxwLGIo3B84P24XvgxVNM4xYQDFmSoS3/l/w3EjjQb0rppMNHeCdJsUIVjNEBVn+HKF5o8sGYRERa1EQiJthF5eiYCLM/FRVrXlQpGgc+3tDwl/Eiu1VZtJEVlZQ+HIu2GaDaMHyZO4V4konnBVV5S+LfLCHrdubet/MAPOmX+hSR8aws/ixosTbrCH7euLRYVBDsyFSvWokBZJZJsvvdkfCEzgg4WzUs5aNzfPk2NT3290lt3blZ6kZcyASEL29BFpxsYNbTx/AAgAElgUrugNtnrNrmh82TGOGjFQBY+K2793qBjNF+Kh0J0kQFnmkbYF93jMChMsEmWF4OtolhmFJCWosvgh+hzyD1DAMs32iFFxGqf+7CB9TXJNnhCviQKMLPOP/qoQJjFux18m5UBiMQ3AVEKqoy2uoq9N4zvzkxTN4CynZkBzXPAHWibfklNs85LkjlBH2CMlz8NgeBOOqqUuoffgP5KsI5aFeyTqk6cYsuXAEp+MGWqp1G6rZ5xJLfmq+/5WQYRps4t6FnKHZpt0LnjHYJ1nvzwP/0uve3oIOcabsjMBSQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CKR/RikCmvEBWew2Z7xST2rtmOKLWc8M/WCdHqMhWy9aZ9tfPdM982RX1UDXJUgW67iwYclcDoJYXBgjvufKftm3DxE5XXfqX4692Zwl+4whnHSKDeTpVVmFO/rx5TzcnPMC4eco+rtkQYNuolt/ORLJE8t8xGXVFc4HRCEON3cb+Q+5byMyheFi6VTYbQTWRjaZajYoxiHlS0On8SQsSgH5ExsAkvZZRGceWuSiN1tuy1MFJiEGDmf4jEQMkHtaW+B+QWF7ERaEjlpXS4fdqGu8YajDJZHvD2XTjigHWvf4gi3XsPRTvnOWaOlff7RVaanjB3PqJU6jOtdG4O+hOMRo+enZVfTIJorqPoFLxk8376qkNPdndGiNgeyFVJZY6CRbG5kN/0Nye/gJbiZr5l8CCuu3PvF3IuuRRwMmJtg90NCldVosXOnpmGooXPA0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 13:12:01.4369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ce7526-aa11-4a0d-6eb5-08de77942059
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8199

These debug helper functions convert enumerated values to appropriate
message and can be useful for userspace tools and other kernel components
that need to interpret AMD PMF state values.

By making them inline functions in the UAPI header, they become available
to both kernel and userspace without code duplication.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/spc.c  |  54 --------------
 drivers/platform/x86/amd/pmf/util.c |  12 ----
 include/uapi/linux/amd-pmf.h        | 105 ++++++++++++++++++++++++++++
 3 files changed, 105 insertions(+), 66 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index a40419b5e1b7..f91feaac5238 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -18,60 +18,6 @@
 #include "pmf.h"
 
 #ifdef CONFIG_AMD_PMF_DEBUG
-static const char *platform_type_as_str(u16 platform_type)
-{
-	switch (platform_type) {
-	case CLAMSHELL:
-		return "CLAMSHELL";
-	case FLAT:
-		return "FLAT";
-	case TENT:
-		return "TENT";
-	case STAND:
-		return "STAND";
-	case TABLET:
-		return "TABLET";
-	case BOOK:
-		return "BOOK";
-	case PRESENTATION:
-		return "PRESENTATION";
-	case PULL_FWD:
-		return "PULL_FWD";
-	default:
-		return "UNKNOWN";
-	}
-}
-
-static const char *laptop_placement_as_str(u16 device_state)
-{
-	switch (device_state) {
-	case ON_TABLE:
-		return "ON_TABLE";
-	case ON_LAP_MOTION:
-		return "ON_LAP_MOTION";
-	case IN_BAG:
-		return "IN_BAG";
-	case OUT_OF_BAG:
-		return "OUT_OF_BAG";
-	default:
-		return "UNKNOWN";
-	}
-}
-
-static const char *ta_slider_as_str(unsigned int state)
-{
-	switch (state) {
-	case TA_BEST_PERFORMANCE:
-		return "PERFORMANCE";
-	case TA_BETTER_PERFORMANCE:
-		return "BALANCED";
-	case TA_BEST_BATTERY:
-		return "POWER_SAVER";
-	default:
-		return "Unknown TA Slider State";
-	}
-}
-
 static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
 {
 	switch (index) {
diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
index 9a14467f412c..20dc7aa9f250 100644
--- a/drivers/platform/x86/amd/pmf/util.c
+++ b/drivers/platform/x86/amd/pmf/util.c
@@ -18,18 +18,6 @@
 
 #define AMD_PMF_IOCTL_VERSION		0x02
 
-/* Convert BIOS input control code to array index (0-9) */
-static int amd_pmf_get_bios_idx(u32 control_code)
-{
-	if (control_code >= IOCTL_BIOS_INPUT_1 && control_code <= IOCTL_BIOS_INPUT_10)
-		return control_code - IOCTL_BIOS_INPUT_1;
-
-	if (control_code >= IOCTL_BIOS_OUTPUT_1 && control_code <= IOCTL_BIOS_OUTPUT_10)
-		return control_code - IOCTL_BIOS_OUTPUT_1;
-
-	return -EINVAL;
-}
-
 static long long amd_pmf_populate_bios_input(struct ta_pmf_enact_table *in, u32 control_code)
 {
 	u32 idx;
diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
index 00fab9269238..e2125b304b83 100644
--- a/include/uapi/linux/amd-pmf.h
+++ b/include/uapi/linux/amd-pmf.h
@@ -14,6 +14,7 @@
 #ifndef _UAPI_LINUX_AMD_PMF_H
 #define _UAPI_LINUX_AMD_PMF_H
 
+#include <linux/errno.h>
 #include <linux/ioctl.h>
 #include <linux/types.h>
 
@@ -106,6 +107,88 @@ enum platform_type {
 	PTYPE_INVALID = 0xf,
 };
 
+/**
+ * platform_type_as_str() - Convert platform type enum to string
+ * @platform_type: The platform type value to convert
+ *
+ * Returns a human-readable string representation of the platform type.
+ *
+ * Return: Constant string describing the platform type, or "UNKNOWN"
+ *         if the value is not recognized.
+ */
+static inline const char *platform_type_as_str(unsigned int platform_type)
+{
+	switch (platform_type) {
+	case CLAMSHELL:
+		return "CLAMSHELL";
+	case FLAT:
+		return "FLAT";
+	case TENT:
+		return "TENT";
+	case STAND:
+		return "STAND";
+	case TABLET:
+		return "TABLET";
+	case BOOK:
+		return "BOOK";
+	case PRESENTATION:
+		return "PRESENTATION";
+	case PULL_FWD:
+		return "PULL_FWD";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+/**
+ * laptop_placement_as_str() - Convert laptop placement enum to string
+ * @device_state: The laptop placement value to convert
+ *
+ * Returns a human-readable string representation of the laptop placement.
+ *
+ * Return: Constant string describing the placement, or "UNKNOWN"
+ *         if the value is not recognized.
+ */
+static inline const char *laptop_placement_as_str(unsigned int device_state)
+{
+	switch (device_state) {
+	case ON_TABLE:
+		return "ON_TABLE";
+	case ON_LAP_MOTION:
+		return "ON_LAP_MOTION";
+	case IN_BAG:
+		return "IN_BAG";
+	case OUT_OF_BAG:
+		return "OUT_OF_BAG";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+/**
+ * ta_slider_as_str() - Convert TA slider enum to string
+ * @state: The TA slider state value to convert
+ *
+ * Returns a human-readable string representation of the power slider
+ * position suitable for display purposes.
+ *
+ * Return: Constant string describing the slider state, or
+ *         "Unknown TA Slider State" if the value is not recognized.
+ */
+static inline const char *ta_slider_as_str(unsigned int state)
+{
+	switch (state) {
+	case TA_BEST_PERFORMANCE:
+		return "PERFORMANCE";
+	case TA_BETTER_PERFORMANCE:
+		return "BALANCED";
+	case TA_BEST_BATTERY:
+		return "POWER_SAVER";
+	default:
+		return "Unknown TA Slider State";
+	}
+}
+
 /**
  * enum pmf_ioctl_id - Control codes for PMF ioctl operations
  * @IOCTL_POWER_SOURCE: Query current power source (AC/DC)
@@ -197,6 +280,28 @@ enum pmf_ioctl_id {
 	IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC
 };
 
+/**
+ * amd_pmf_get_bios_idx() - Convert BIOS control code to array index
+ * @control_code: The BIOS input or output control code
+ *
+ * Converts a BIOS input (IOCTL_BIOS_INPUT_1 to IOCTL_BIOS_INPUT_10) or
+ * BIOS output (IOCTL_BIOS_OUTPUT_1 to IOCTL_BIOS_OUTPUT_10) control code
+ * to a zero-based array index (0-9).
+ *
+ * Return: Array index (0-9) on success, -EINVAL if the control code
+ *         is not a valid BIOS input or output code.
+ */
+static inline int amd_pmf_get_bios_idx(unsigned int control_code)
+{
+	if (control_code >= IOCTL_BIOS_INPUT_1 && control_code <= IOCTL_BIOS_INPUT_10)
+		return control_code - IOCTL_BIOS_INPUT_1;
+
+	if (control_code >= IOCTL_BIOS_OUTPUT_1 && control_code <= IOCTL_BIOS_OUTPUT_10)
+		return control_code - IOCTL_BIOS_OUTPUT_1;
+
+	return -EINVAL;
+}
+
 /**
  * struct amd_pmf_ioctl_info - Structure for PMF ioctl data exchange
  * @control_code: Input parameter specifying which data to query (enum pmf_ioctl_id)
-- 
2.34.1

