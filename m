Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010059.outbound.protection.outlook.com [52.101.46.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947F12773CC
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 14:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890563; cv=fail; b=A6nm+EJHzcAX7CejZKGKqrKPudVhHcxKyqfHR6ZvHPsSNpgcaItA34YUI9mLp6o+8sl+uUmdudK5ao6aKt9OHh2pwgc7mPNHXSYeWaam8wbp8ex0EsbCXx/TQGBJqqvxT7jED9TwTGiKhGefcfXM3Sy3/xk8fqprkgu5rhU2nHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890563; c=relaxed/simple;
	bh=guQ16/hrGRXNVAmkxCD4d7pHcOagQZyb+xjlj77kAn8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SPJNFgzsjyJZIflbuJTjeIaaB+L0wtKeGF0kw2+sSI+W45O0WWUY6+l1wI7Q3mn6bayN5d9z9TsYTmbUGb/bgz0DjNu71ChYLj52ESORkMcDeYqjwWN7BCqX8NWDrImZ5TisvJ+D3WgocuOwbPKe04FKoZIVwK9QCPTtkkKblic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4Igr+P0s; arc=fail smtp.client-ip=52.101.46.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4Igr+P0s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hlGL3wJZkFpl90Mpohxh+kVzU1lfLDFY3ukziiAUCwhjJQhu4oE5l8NgX/KbqVb5r50KaLyafMZAFq5e35bCk6pQ8SFCpo8G7ZNxHvLRrKdX77tFyTS5Bq7VXqDZpmU4lWoP+PFf20JYijfIxzUYr5e8UDF85RAZrL+sHMuWx1+91xRimlG6cLV/y7pvwqM/i7NDs8uZtq2KdxuS3+lxKlb3cZzjcPqB6y8M/Eg8yQY1BSXX+wztiS74O7kDs/IOVig1v0CSguapJ/WmnmpemcjRgq0oHyJ65ziuebmvkmHoEf/mLFdufZeKRTVbmV90awIQv1PYGl3npfNql02rrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4sx7s2MXMMO8Z6erUbeIVnhIJnISVEqoJP7H0/JZiw=;
 b=gpRoA+X97r/IlHgtNU8H/EA0oFVN72AHx/DRdZ3z1u0dD/UKCCG4g0GB1hADRj+ky6M8BbU7BLh3VlzsWwChx7I9VViwO+ItSUYR4Ku7VOtCxF89jm84DUWMwGBM94l1FNHxaGmzdqDSbqTAspdneepeX8NVwpFv6M2BDCMc7imkxBSYha2g8dyBr6z3jP7moDDFPraphAmo411OZGU1r8GfN4e+GitW2VGgXusPXy1QHu51Oc/RZHa9yJlV2goPtgakC3OjKXq/Ta2nCjvx/Ic0OSDtul0MP/qKAzwvgjFv+/6LGnK2YkfjJ/a/u+i4nP+otWC2ETIjI/6qz8EQVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4sx7s2MXMMO8Z6erUbeIVnhIJnISVEqoJP7H0/JZiw=;
 b=4Igr+P0s4xpFb74dcSvBB6Rib2zQfxDCpi/5Q4CrvjmCepEegdJVu+Jaj2dbuA0sIWX1AqIx627CjPnU/uTsCCGjVpX4J6ZwOP41zNnhJ7pcdsaFhJKDL7V+62Yj7Wr6HkBHA9DlNlssIg/iKZ8UeIn02uvRqrtC8zo1wbm+gi0=
Received: from BN9PR03CA0535.namprd03.prod.outlook.com (2603:10b6:408:131::30)
 by BL3PR12MB6404.namprd12.prod.outlook.com (2603:10b6:208:3b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 14:02:37 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:408:131:cafe::67) by BN9PR03CA0535.outlook.office365.com
 (2603:10b6:408:131::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Wed, 27
 May 2026 14:02:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 14:02:35 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 09:02:35 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 07:02:33 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 5/8] platform/x86/amd/pmf: Move debug helper functions to UAPI header
Date: Wed, 27 May 2026 19:32:02 +0530
Message-ID: <20260527140205.4073335-6-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|BL3PR12MB6404:EE_
X-MS-Office365-Filtering-Correlation-Id: 094d85d5-9c73-4190-01da-08debbf89aee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|22082099003|3023799007|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	4uneI8q1KGuqbE7Hxs2H//3MGnfEfjMFUIU5O5VbG/1gsyFhv34LWtIsDnc9SEDzJ1KaPE/rnsUTIvcVSpRsTtMG8GA0k84D8zgD6nYxrSE2J1cmn4Vv/Gv/7ZQM3S5nf7/U69d7rYJh4eVAVdTDvE6SwYD2fCukJazqqqKzFWZc/K6/SwJut0PpzU4c43AIgUgZryV7hcEYJUqueZ0Ub+9JyHvoQZVzejaYI0aLnkkpJ5H1klKaESSY77TXZgq91k81yeIExLASI1xY8BQzllJ26c51HiC6ohHug2hJZD5L0xsMb+Yat1SKScyCNPIGO8//PfhxxUEqgbNtdysyPiasfSVmmSa2g6dYDXwqhI0olrl6UfUPAKoGwHMiNgqeyLaXI9TIXEQWcL1zC0pEtjrfwRXFnBNKtsgNAXM/h01aYCjwtuQI7sps83qUfw0QIpiBuaqVHQgzeWfDS9P12nP4zqV5Sq92o6gDFQ3ZjLhChf+jkCoMDciXU/or/5dJ/c0lfQfRDd7W0Uer5hTflAXHPZ591yF4NO5B0LMOJiB76mLlkBVj17ZlCmlL1wNdp80//zTFEvdrLOY+7+ZOHNChIyu0PFYISzld5/uXsI9C9tIAJsJBQagVe8n17dX3xD+SzXlvRHuNTPyFaYFVoedhD6xtCc+aWnD8JaTqCPRGATqqZ/9ygER/7UNDoNOoqvgejPfw/V/0bQx3BhevjA2finVPCz696t/JXf0Kr+Q=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(22082099003)(3023799007)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DVnoxjP4pHD7xGcP0RQEEN6nG7362SOGB6wLkFzl67ur+SQqA/bguKfD8Z3AutQuGsikhwybJT+STbwqOHLkvo5YkUefJJ6Z81PitBrhcYmlN7SAn1G8gyVJ8HR6mriLHzi2VH1qCy8E/T7/0faCrK46qUMRjLd/lzHbBBes5iQXzqa9eeM/2+U5jjDIk1b57yYx8jN0q59aEwkdUoWxIeMIPXLRz5kWuZBDALnx3TigLrGMzoFtQbquPWuQgipPi2DwP9kQqHXKam+ILXzUB5NKh4tDFr869K6L1tmYCLh6+urMdIlBOy3Aru87a4N8DySmQcJ50xc2R8XtOMr05ctkweI7NuBy5TnKdSXX5sNZ8Tpkk8KWG6Cg4T0F9d98la4yap4bOYwMN3uugd436HQPIiATk79t5qQKmX2H2zaYFdGJebVNCzkYZ8FltxuZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:02:35.8338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 094d85d5-9c73-4190-01da-08debbf89aee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6404

These debug helper functions convert enumerated values to appropriate
message and can be useful for userspace tools and other kernel components
that need to interpret AMD PMF state values.

By making them inline functions in the UAPI header, they become available
to both kernel and userspace without code duplication. Also, prefix the
function names with amd_pmf_.

Also, include a case to cover unused enum entries.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/spc.c | 62 +++---------------------------
 include/uapi/linux/amd-pmf.h       | 58 ++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 57 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 05998946d1bd..6e33824ccadc 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -18,60 +18,6 @@
 #include "pmf.h"
 
 #ifdef CONFIG_AMD_PMF_DEBUG
-static const char *platform_type_as_str(u16 platform_type)
-{
-	switch (platform_type) {
-	case AMD_PMF_CLAMSHELL:
-		return "CLAMSHELL";
-	case AMD_PMF_FLAT:
-		return "FLAT";
-	case AMD_PMF_TENT:
-		return "TENT";
-	case AMD_PMF_STAND:
-		return "STAND";
-	case AMD_PMF_TABLET:
-		return "TABLET";
-	case AMD_PMF_BOOK:
-		return "BOOK";
-	case AMD_PMF_PRESENTATION:
-		return "PRESENTATION";
-	case AMD_PMF_PULL_FWD:
-		return "PULL_FWD";
-	default:
-		return "UNKNOWN";
-	}
-}
-
-static const char *laptop_placement_as_str(u16 device_state)
-{
-	switch (device_state) {
-	case AMD_PMF_ON_TABLE:
-		return "ON_TABLE";
-	case AMD_PMF_ON_LAP_MOTION:
-		return "ON_LAP_MOTION";
-	case AMD_PMF_IN_BAG:
-		return "IN_BAG";
-	case AMD_PMF_OUT_OF_BAG:
-		return "OUT_OF_BAG";
-	default:
-		return "UNKNOWN";
-	}
-}
-
-static const char *ta_slider_as_str(unsigned int state)
-{
-	switch (state) {
-	case AMD_PMF_TA_BEST_PERFORMANCE:
-		return "PERFORMANCE";
-	case AMD_PMF_TA_BETTER_PERFORMANCE:
-		return "BALANCED";
-	case AMD_PMF_TA_BEST_BATTERY:
-		return "POWER_SAVER";
-	default:
-		return "Unknown TA Slider State";
-	}
-}
-
 static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
 {
 	switch (index) {
@@ -89,7 +35,8 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	int i;
 
 	dev_dbg(dev->dev, "==== TA inputs START ====\n");
-	dev_dbg(dev->dev, "Slider State: %s\n", ta_slider_as_str(in->ev_info.power_slider));
+	dev_dbg(dev->dev, "Slider State: %s\n",
+		amd_pmf_get_slider_position(in->ev_info.power_slider));
 	dev_dbg(dev->dev, "Power Source: %s\n", amd_pmf_source_as_str(in->ev_info.power_source));
 	dev_dbg(dev->dev, "Battery Percentage: %u\n", in->ev_info.bat_percentage);
 	dev_dbg(dev->dev, "Designed Battery Capacity: %u\n", in->ev_info.bat_design);
@@ -103,9 +50,10 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
 	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
 	dev_dbg(dev->dev, "Ambient Light: %d\n", in->ev_info.ambient_light);
-	dev_dbg(dev->dev, "Platform type: %s\n", platform_type_as_str(in->ev_info.platform_type));
+	dev_dbg(dev->dev, "Platform type: %s\n",
+		amd_pmf_get_platform_type(in->ev_info.platform_type));
 	dev_dbg(dev->dev, "Laptop placement: %s\n",
-		laptop_placement_as_str(in->ev_info.device_state));
+		amd_pmf_get_laptop_placement(in->ev_info.device_state));
 	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
 		dev_dbg(dev->dev, "Custom BIOS input%d: %u\n", i + 1,
 			amd_pmf_get_ta_custom_bios_inputs(in, i));
diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
index c0bd818c0dab..9fc0f71f7bb4 100644
--- a/include/uapi/linux/amd-pmf.h
+++ b/include/uapi/linux/amd-pmf.h
@@ -116,6 +116,64 @@ enum amd_pmf_platform_type {
 	AMD_PMF_PTYPE_INVALID = 0xf,
 };
 
+static inline const char *amd_pmf_get_platform_type(unsigned int platform_type)
+{
+	switch (platform_type) {
+	case AMD_PMF_CLAMSHELL:
+		return "CLAMSHELL";
+	case AMD_PMF_LID_CLOSE:
+		return "LID_CLOSE";
+	case AMD_PMF_FLAT:
+		return "FLAT";
+	case AMD_PMF_TENT:
+		return "TENT";
+	case AMD_PMF_STAND:
+		return "STAND";
+	case AMD_PMF_TABLET:
+		return "TABLET";
+	case AMD_PMF_BOOK:
+		return "BOOK";
+	case AMD_PMF_PRESENTATION:
+		return "PRESENTATION";
+	case AMD_PMF_PULL_FWD:
+		return "PULL_FWD";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+static inline const char *amd_pmf_get_laptop_placement(unsigned int device_state)
+{
+	switch (device_state) {
+	case AMD_PMF_ON_TABLE:
+		return "ON_TABLE";
+	case AMD_PMF_ON_LAP_MOTION:
+		return "ON_LAP_MOTION";
+	case AMD_PMF_IN_BAG:
+		return "IN_BAG";
+	case AMD_PMF_OUT_OF_BAG:
+		return "OUT_OF_BAG";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+static inline const char *amd_pmf_get_slider_position(unsigned int state)
+{
+	switch (state) {
+	case AMD_PMF_TA_BEST_PERFORMANCE:
+		return "PERFORMANCE";
+	case AMD_PMF_TA_BETTER_PERFORMANCE:
+		return "BALANCED_PERFORMANCE";
+	case AMD_PMF_TA_BEST_BATTERY:
+		return "POWER_SAVER";
+	case AMD_PMF_TA_BETTER_BATTERY:
+		return "BALANCED_BATTERY";
+	default:
+		return "Unknown TA Slider State";
+	}
+}
+
 struct amd_pmf_info {
 	__u64 size;
 
-- 
2.34.1

