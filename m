Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012013.outbound.protection.outlook.com [52.101.43.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5E0407CC0
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 18:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779303364; cv=fail; b=tozbKjADM4xSUcwV6jt8U7Z3AeCd6zv5qrvezlBJNla3ZVqLL0fYfv6PE6fybPL3XndzKF85mMUtg2WjX/POJ8nnp6IQtQwIN5veQzdelM7tUfHg4ch/L/iUyIaSeln8MHck+UeYJSdxEP4u6yGEB75VhIsXGD+KYHIUsd1irqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779303364; c=relaxed/simple;
	bh=CW29WFYv++l0FsLqHFFDa03qfYUtCEf4fZ+A3BBazzY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TLm8ODEDwc22bfneAxidBJZBQpNYsEDidP5eHJVBV4gS2fkzY9QdBPsatUHxN0Qvo/Ewd7cbyA6GIecolKOeRBVavWBPDRPM7FYeQ5g8ESBJEcGEDZSjUS+vbs9o5QbfFB6Xc4t3EV49Fi3MZKYif++0SFPP4eGWVX/nM3wi86I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1OWs11ld; arc=fail smtp.client-ip=52.101.43.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1OWs11ld"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Smfp4eBWHaGAqsloZDPIEMMVab6zrLZJkX0PPN9a8qPKEhVgTMcs7Epxbhp4WDNzl9Yo4MnOe42rJqwLS4z5kXHrelHHrso91BYcLzP7sAXCxiWUYAvHNkfptKqV59UxbptRqDsmTimQaherYpsm65/VkJPEZNVmS3Fw8M2VPhaFDMKEUXHoAZLCj5dfsWTUJlwno1QPJ0Q9Qf4sNuerW3/Jt0w2sq09UP0OPRgVr94uCp+pI1unX57bldiYQPm1xX3KzwBOHQ/WbnA0NCoqdrXMFKs5mMmmKfu/ALr2mRDTaAyi6GldsSlsWIMqTqBB5bc7tfhBE5BZ8lXX5g+Big==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozgPkVVCEaEGOv/2uNJf57qUo6COyJwzUln0HZz601Q=;
 b=QKjbXTr7texKcQQclVzMlalKoOE9yJBqG8X+IILuVhRfnCgA76OjxeDdR1SFspvl/cXP61PX1U/3e5JuR72uUutmdwJn/D1vldx0hpSmVyMNFbWjYuyLwVVIrf+DVHRbEi0YgR3pMz7wXckvSq/026Vi/yhMDZYMM6S7Umuf/dOMPRDBGgFVH+R9z/gJkcU7y6ficteo8+JSEfnVqJmjfPWsRwst7KBIYlRAZlKV3IF4jH5UBG18ZggLaPHQJIJtEO0nVzOp8Hp/ttLpeNxKkwJOb9cZNrCBiY7VFH6t96ir5CbS+3HiqXNzUCPi0rXflrABCOocm60ZOtOgd2feZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozgPkVVCEaEGOv/2uNJf57qUo6COyJwzUln0HZz601Q=;
 b=1OWs11ldWmjufFDQEBVNVNN0wJwQXyMEEL9Qb56DakGz7C0HkYY07Tf0f8r8SkyMUtzuGlZ0K3+vLEt5UEk3oQ0VBrn+GytiivPe7OtFfV/zVwrEZfvUil+rgvgTkkWYYaxa7RtXKr94ZvKPfIC3GcnQJ4shcYIupsD8VHpzuYY=
Received: from PH7P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::21)
 by DS7PR12MB8276.namprd12.prod.outlook.com (2603:10b6:8:da::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 18:55:56 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:510:338:cafe::ad) by PH7P223CA0023.outlook.office365.com
 (2603:10b6:510:338::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 18:55:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 18:55:56 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 13:55:53 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 5/8] platform/x86/amd/pmf: Move debug helper functions to UAPI header
Date: Thu, 21 May 2026 00:24:21 +0530
Message-ID: <20260520185424.770772-6-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|DS7PR12MB8276:EE_
X-MS-Office365-Filtering-Correlation-Id: df42e3bb-e7e7-46b2-fb7b-08deb6a16ca3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|3023799007|22082099003|11063799006|18002099003|56012099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	CgdrJwx0vaU9XkAqW9b+rhjxOG1eWWXbc6w78Ck59mkim08XwQXv/tvG8SIrCIe+0pUe/82akjRvlcyYPlYCfLL5bBUqjrvb+wUNkbV51obqYcZmZCIJJ6XV1FFgA+00SWGuUm6cGw1c/5ynEIhys1ca65c3QTmLPMwDUrdoxE8b6SUO8iiLWdOo6JnYTH+m5O33W6n4ew+M5jH4YrIJmmeLVSfNx1h0mhvmmpKOzOpkm3A0h/vtcDeBcTr1GmB2nPSMbejb2XZQ7Qv2gi0pObSV4YqD4jsAwcyAztDw7qFQisK008ZtzwYnAw663mFzp4E3mUhL4ev9OdUiZSPCAIsZHtAe9kDoFmGDLTfyR3MwwkbEQpEh+yF9L8wQ6G0ncWx6zTVAgSov54761jK0+/BX3hjO2kTNvPgUCE1UfK6QBEmXeMZ7dcTQhNKe//rT9zRMkDY31UumEPq64cpPNl52/KCTJf5SqS3fuYHcsSmtYP7VD9ksExXLXoz3tKvABoVWVqYLg0dWDWKbmeKYn6KStiu7M9wQ8f3nHRrHiZhks+rJBg21k8Uz5fz7K8tqEWp5+CP/Go6oFf/4nTsrkq5P4tqxjrL5R2d14own6OlAgadVpHINwJuA9mxyaSGGYzJ6IrDfFQd39JDnZ/aU+VwTUSW17Px3NqKxX22besgWupa4qsDzjaDCpaO86FvyqlFGtFOTRaEF33jtuAoWOQ/3C4xUSaaTprmj/Ioy0XY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(3023799007)(22082099003)(11063799006)(18002099003)(56012099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TUzgMJq8PmWrBQgzU89ZKMsxD1pRazJcIjh9CMzVjMSaYstIUb23piKzYwknPoqq6t+naVid5t5Lmr/WOpgrAmgctR+Ze7ieGH3e0Ma5PXqzHLhHsK8fk4dERvnqya/nj32SGNtDG8O8h5QXat56TaG9y/VWbcuRNBzx/t8M3Ak/kf6h8HUmM3ROfrKNH7c+cXHk+gXTnCjWUV4lIFYQwrrbE3tgDEVmh7qO+cMYa4qLxeGoOSmNY7M7lKQqcFkjbR48wVU1JJMt8bQtnmgadHC/6qAlnvBs9JrI9fLpTdhqKBJgpTFxtt+hvY3ybfbEs0vWUzCgLupFlDWs2bmBUDlEf8D06dO96K1X8gLhgJF8D1vI8ZpWxdDR/wUBp8V4DC8yQJfGbM7O5sYVv5mXtVv54CuvUQJKhT47aezqTjGcOKjgrEKSJ5rHsjdBcaq7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 18:55:56.0988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df42e3bb-e7e7-46b2-fb7b-08deb6a16ca3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8276

These debug helper functions convert enumerated values to appropriate
message and can be useful for userspace tools and other kernel components
that need to interpret AMD PMF state values.

By making them inline functions in the UAPI header, they become available
to both kernel and userspace without code duplication. Also, prefix the
function names with amd_pmf_.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/spc.c | 61 ++----------------------------
 include/uapi/linux/amd-pmf.h       | 57 ++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+), 58 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 05998946d1bd..0606d3b0adde 100644
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
@@ -89,7 +35,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	int i;
 
 	dev_dbg(dev->dev, "==== TA inputs START ====\n");
-	dev_dbg(dev->dev, "Slider State: %s\n", ta_slider_as_str(in->ev_info.power_slider));
+	dev_dbg(dev->dev, "Slider State: %s\n", amd_pmf_get_sp(in->ev_info.power_slider));
 	dev_dbg(dev->dev, "Power Source: %s\n", amd_pmf_source_as_str(in->ev_info.power_source));
 	dev_dbg(dev->dev, "Battery Percentage: %u\n", in->ev_info.bat_percentage);
 	dev_dbg(dev->dev, "Designed Battery Capacity: %u\n", in->ev_info.bat_design);
@@ -103,9 +49,8 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
 	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
 	dev_dbg(dev->dev, "Ambient Light: %d\n", in->ev_info.ambient_light);
-	dev_dbg(dev->dev, "Platform type: %s\n", platform_type_as_str(in->ev_info.platform_type));
-	dev_dbg(dev->dev, "Laptop placement: %s\n",
-		laptop_placement_as_str(in->ev_info.device_state));
+	dev_dbg(dev->dev, "Platform type: %s\n", amd_pmf_get_pt(in->ev_info.platform_type));
+	dev_dbg(dev->dev, "Laptop placement: %s\n",	amd_pmf_get_lp(in->ev_info.device_state));
 	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
 		dev_dbg(dev->dev, "Custom BIOS input%d: %u\n", i + 1,
 			amd_pmf_get_ta_custom_bios_inputs(in, i));
diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
index 54baf015e4c1..a8c715bee9cc 100644
--- a/include/uapi/linux/amd-pmf.h
+++ b/include/uapi/linux/amd-pmf.h
@@ -115,6 +115,63 @@ enum amd_pmf_platform_type {
 	AMD_PMF_PTYPE_INVALID = 0xf,
 };
 
+/* Retrieve the platform type as a string */
+static inline const char *amd_pmf_get_pt(unsigned int platform_type)
+{
+	switch (platform_type) {
+	case AMD_PMF_CLAMSHELL:
+		return "CLAMSHELL";
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
+/* Retrieve the laptop placement as a string */
+static inline const char *amd_pmf_get_lp(unsigned int device_state)
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
+/* Retrieve the slider position as a string */
+static inline const char *amd_pmf_get_sp(unsigned int state)
+{
+	switch (state) {
+	case AMD_PMF_TA_BEST_PERFORMANCE:
+		return "PERFORMANCE";
+	case AMD_PMF_TA_BETTER_PERFORMANCE:
+		return "BALANCED";
+	case AMD_PMF_TA_BEST_BATTERY:
+		return "POWER_SAVER";
+	default:
+		return "Unknown TA Slider State";
+	}
+}
+
 struct amd_pmf_info {
 	__u64 size;
 
-- 
2.34.1

