Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012025.outbound.protection.outlook.com [52.101.53.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DEC3ECBFB
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 08:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992720; cv=fail; b=oelFr9UhfVyr6+VfL4n/aF0sBDRISCON6gi8TosKtsD6pv0lCbFG9f96L24gYEnUpS8O7l/UnkXw4IHRFtA+Y9JjIyDxMF3A5Q7czz0kA0luN/HJyYQJdMN6EUAGwR15h73ndyeIHcaVJ+cYT59MJpikFmmIDpFtO18VlmcQf48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992720; c=relaxed/simple;
	bh=E9MlKBNP/4tEVaoS1khY/N6YRTAUHQ7/LzYYDV6Ovb8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=scG0wU/25kOXnoKN+FC5mKC+9SeuEzVDn/NpgJDVUcbbaZaCKDCzRNyMpUufDOY9i/UJQgunBLezqQC02MpttQYbu91ypst7eXaFwipoN5x1ro7836ZCvOMe6iY5ADLuRCBrzUx0V1hT8KUWnuLqEAwa3sF7hpfQX3RJWnTtGGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3whCrV8X; arc=fail smtp.client-ip=52.101.53.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3whCrV8X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJxDMihiuCANa/4b3r630mK/nILND/Aj0BXvp+f8+k7KaINZaeGplbJsHylOr67cCfx8Ml4aP+S5XEWGW8hjrflfaZw5L/erqA5PGzhAYAJ9dC3H8MiVacObZFTh35SN5U1D+akxDuCxhXyhsV+3DWYL2OJOi43iOjQ4zp/StTbBH7jUirAme2PAJYHcxSBBeB8NJiVdNCQwJA+L78u53F9Ks2Htx+qaR/59vskpxH0jKFyRh2HWuavn18ntyD2a838SgwCRpA/8OXqAacaShqbqQTVbcUnM/dbMjL7kXeCnX6ShOLwdmIzwmccJNJM7kz4n5BZ2LaHJS+TobofnDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YB7sobQwqMCTr8e/Nx2oB/r+aBZilP9tScaHDiDD4Ew=;
 b=qrxHhimf0IgPofAJvPiB6bgu4ObsbqYCpdcGrVqCzc0MuladAzWHP1C4Va8jahz9SWYa5r2T8+OOcNSY3M/QQYpC7S8RD2BtuU3R0TSQqJDZG+fVqSgveLOmOZb32kFWI2eN5zp3yRalkF85p1sb+NRjN+Qlu77P32Py9d78/4wDqcK8RqT+USOboGedfWb3dLQoOJ8AOtitvWuZE+G1Ca4aGwQtg1f7W8zFuciO9XKqnaBHyt0/+b+I6b77cX894RwENI3oqZGEfO3ucvHeAC4wXUUGQuA/wjM+CgZg929lhU3gdNbn0Hp2Ttwk//bUmriIKztOiKa2ID/7v9z0MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YB7sobQwqMCTr8e/Nx2oB/r+aBZilP9tScaHDiDD4Ew=;
 b=3whCrV8XZWT3E4VU6KvN33gmpRLGO0mwhFftYu8hpQbR8Ee9DbmqAcWroPOae74Wy73fTUvGEzDxkS5V8tvpYbxvMxxjL3tw9W74TG98JykYeZHSYgru1OTjAZQ7pT5ky6xdg+uBbhoRJpByAEXbLZh3L7580X+QMEfcvz4IJlM=
Received: from BN9PR03CA0389.namprd03.prod.outlook.com (2603:10b6:408:f7::34)
 by SJ0PR12MB6878.namprd12.prod.outlook.com (2603:10b6:a03:483::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 08:11:50 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:f7:cafe::22) by BN9PR03CA0389.outlook.office365.com
 (2603:10b6:408:f7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Tue, 9
 Jun 2026 08:11:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.1 via Frontend Transport; Tue, 9 Jun 2026 08:11:50 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 03:11:48 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 4/7] platform/x86/amd/pmf: Move debug helper functions to UAPI header
Date: Tue, 9 Jun 2026 13:40:41 +0530
Message-ID: <20260609081044.2416731-5-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|SJ0PR12MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: c618f9bf-71a6-41ba-5cda-08dec5fec24d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|22082099003|18002099003|6133799003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	d82DBM1EfZnzFwnp81zohY2AH88f6Tn5Dq92+NoyQCDxqwg9AuLK4FgmHW+hECnEUlwhcYz0DmbzE34tpO/VPIbdkGfp29+fTgNLT+iOxPN2O4JAZkh6kTE8yZ2UApQ/W2lPnL8BuYeqOKfXw9i0sgvzyaDYCrt4bPtOcYjhQ6Da86cFu6SjSwTDFK+FFqgOq8xX6VkCCfCfmpgdOau5uF3WbVU4D95dQRoYkxy1/gMksW20AB1Gox0OvBjU7XVy3+zHlfslbh44Mr1z8gAHtQni9KftokmQpeUPnovfuKy31LhPNzMzP3j7aq+2X4M+W4o/G98UxkMGMfgudi5NW/axXICoh7v+PXPbqTROsUtxcdVLPs/FcZQdbu6GA9I1i8LVcVf+SbI/GvcZCw2ZLG2KZj7pIT/D9WV8v2AfPOIRJip4y7lOz5Vse9j+H9tuNpl+F2S7gfMAava8BLyaccbUt14kdBo0JSoZ9PFWRrg+PPih9DcTEIQ8xcTIiXpH4gzPvullQDkkY714vhg3qo36fBU6F8hqe2B+n2TUapQE0BGXrVGYvhiVkf1SF1rtg9bn3Ih2OxyLPKHm76hdarmLkNGGs8hybyI7HBNW5NAAazADkLjK/ZslWC3JTJWAeWZT44woiHB6bNlM3dSyqRVAj7COSAv2DRhDhBx1yiXpL3hipQ0MxRH95Qjv6jEd4/fLksbWzlUolWTQpwVoJWrn4T3mI1QG4ywXobW29Qo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RSDePVvaYNj2GwGTvdhWSGhvoKV+qXWDXI6dsUqUC8ZYzHpdrW+oSKr5Tj9s1KXuPoBn2vEXr5QfZbg1bSmBAoVItCNcuVZ1JFuMWkMUnKXuOx59MgiOu9vbEgUsCVp8IswLJqCHSjLiDyj/8697xRd/DIwkVVPZSszg3peNHD1oyjSfD6n4+dRxt+gcaDjXv2gpM6yG0tefBbSRD3dCwHtOX5i9hrr6lL1mvjd4Pu0otYMaBIN0Ht1HgPAAQ4Gfv2ZpzJcyR2XmVY8gAkvyzwnZgfbdr/88XOPPJUzDQ2BdJ4iLCytcmzgyRe/7/kxWDYTzLqCJqDsBUwKoXIkQ19Qf5Hrbr9WfSleoxNZ4OU/p+iI5HHY0kRpadgl4e25aU154ByXjohJm9eWQhufnYRQWWspnAdDSrvh4JGBhqJYyj4X3SqGr9O3Q3NL7t7fJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:11:50.4956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c618f9bf-71a6-41ba-5cda-08dec5fec24d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6878

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
index bd802f25a717..24cf9926dc59 100644
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
+		return "BALANCED";
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

