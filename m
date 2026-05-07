Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010011.outbound.protection.outlook.com [52.101.46.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29354336892
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 14:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165153; cv=fail; b=QITbJo6IBrB07DbEgsSiDs+/N3fK9CCZ2bKo8OtwlrSVWOh1eU1K4oxU5fMX/aLehoQneNR1n+mSr7/anbt0gd+GcVTfP/57A8FjtXVbHu5WbXI9M7r6bjp0R6ymxYJ+V1cK5xVscD915I7jtWPJcsMrLO189oCdlnOqymqQyKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165153; c=relaxed/simple;
	bh=kNpyGzeuR4haXJjUAxEPGpMf9Hi6j/leNr5By+lky4A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aAj+v0bqGQkZEtFhY8jYBSzGGyu7q1A0mbtFF9zQxIZZSUlFYiVpSLCuaEpfrmGJbfuzCyJRy4BkmToggkqysog8r/1FM0zSFNzLbsN+EDIFjdWv2IH/td8EeqCTNvMYbkfS91PnWwOHjHSqZHwiraCMIGlnEJAZ25suAW5tCSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IHqhWJRn; arc=fail smtp.client-ip=52.101.46.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IHqhWJRn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEtebjrlffEOw+VDW93AbBLRIaFmYoCH4E4+25d1AKmh8rJkYlXi3GdmMydhzFN+HDoUVsde7OXcvNMqEqreG9fUsB6/LfJzUR+xOLCEyAaa1mJ2Ij69G1lNLZoHH/CjwkDNovxPhkmw7jxjpcnDQ+0PbDjcVoFt146cpUHPFVTjHLnP68IG8CvBb0q6eHieQui53mq6JHF3jGftH/djqqVQcXr/BWkZdSkcOqQAhqw9VvzgIDK5nuZjTNhazdM+GLWsohD4T9TomVY+J1nDuAn/mDRbpcrjNbRr1KMDpJF+zoDhw75k/PzuaBrYPH9IUhpV32r3/CdHinvJ+1Kyzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibvBlaE3SD0/fqdSf6qtc1A1/zQBfz4w2VgfwTcbHwI=;
 b=Wjx3OR+wnvRoiUEtqTnGdLr4Gzp1iCSVh3B38p9XHjAjmi8tUeG5dV0/WT9uLpwC7j+JRfBmoTCJ7ZIGmQVCW9r5to/0VB/eYGoQNWJCO1S6dOCQwJeNHjYOk7bCv1ZwhpowCnNPbeNbP5C29rPRBsHrJMZnptB2Z9vokGuexYYF/TiAhPCrj6eTKGXekmfVuilqH41JOvO1jhWluBdA7iyaTIM+CBn5wZ8B2CwmuktrbI02pKMDHgH/tcD4jKvAn8zRVK0E4ebqnMm0yWREd3F6TL8/aL5yx0dnoCDxevrKJmWBmZZhqch5OE+3qQVBP/ofR0etuXToYbVxl+JhOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibvBlaE3SD0/fqdSf6qtc1A1/zQBfz4w2VgfwTcbHwI=;
 b=IHqhWJRnGUGX566wBEsjDp5NgvmulAIKTwdDNXeTpe4+TOAeLuTTa9FW4B6VS0hmNsMu+F9LBBjY5sD44Y32/bioUw2l3CwL/941+XLkT689QQS52QcNg1024ykWcR3N8zrgPgK33Zi5+75a+S7czXtCyX3QD32qdVvvRpBPHgg=
Received: from BN9PR03CA0582.namprd03.prod.outlook.com (2603:10b6:408:10d::17)
 by SA5PPFF3CB57EDE.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8eb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 14:45:49 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:408:10d:cafe::40) by BN9PR03CA0582.outlook.office365.com
 (2603:10b6:408:10d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.18 via Frontend Transport; Thu,
 7 May 2026 14:45:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 14:45:48 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 7 May
 2026 09:45:46 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 3/7] platform/x86/amd/pmf: Add feature discovery support to util interface
Date: Thu, 7 May 2026 20:15:20 +0530
Message-ID: <20260507144524.664001-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|SA5PPFF3CB57EDE:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dc72a30-20e7-4e16-9853-08deac47543d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|56012099003|22082099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	uzVHUASLiWpKqWvvqhzmGM0dvL8uKRvREAb8NBUQjNk8AKcudL1rA3olEDFR676gOmVpeagpXdJ2oXUJMRbYU1qrRo7OIdGjmJ6WoCfr4zKaGADnM5uQ44D1RRZkCsGtd/Df50BjVMGwukJOTZKeYxblGHD7umqpiDG6CXsNkv7pHY7koaTgiTlW9kCoRRPfRqYhyKrBlXEQ+20lDVjqTChosLB1I2H9XV+Sv3Vp5WTy1n3vyPvZM/k4/9TaCmCMmiHkyMf4EgXm4WAPfl4rXEaYMYO66p8c6BPwDna5pAkTghhL7CihfkV5Hs2jemElXyltgnjCReBVM+K7bDHN97OkCo69D/69P+tM23GriLs43gvCVlLAWD5v5CKADPhLeAwY9rsbfHqPdMEMC/Z7uW+ja57KYVL4iDY+tOXFFHPVdKyuCziOE56bly9Lohugb64LRFBHkZ1TjSMQsU9Lgn30s1lPDWt4EUD2r+CdBKgxwp0nW+iwDYGa/8HJVZFs8mbuxmu7SzqfJwhM532pOoQPvQ7DEfbpCZM7kQK+F9PbrR4sSEukhYghSKMyBNxtjZZorsB+8R5itjY3ew0Y/9L3ke9/VRvDK9FmbAM/G4gmMEY/7jX2pMoYZIzYKIs1AJR20Vj+IJDKfdCyqE1KAZs6X3E/mlQbHnIE0XtBosNR7CN5RY9UAeOOyBrshCi3qjB+R3b7HfF+mTYbBfN3LRiZ29hHbpVJdDPVDIxzf9o=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(22082099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7BGT15AJp8l2SxAqt9UZKFul4Mn5CfP2zXRapr8roDSdFY73hKCDR1bqey674VmZQHS3aBXTkQnwYrp4dAqS+Dw265rxAIfwHoHO9wXAPlVpeUt5GQS5ktGCH8vDF2gtRdwDtTvtle0aYb+dk+dOQG8Nv54jg3x5oXrqV9iOORPA5qWVlf6+aex/Hq+3wfqBjmRMyx+tePGkwRi0qKXAoE3h4K0QOJJUdmSNbYXy2odQ6Zs5Tuebpg4CD5p/IrD4HFV4oTuqDqw/uXRuMlcU0OgmG6kVhECeHejjZ9uGBLgNbscr4UcSw3UhpVV8w65XtdeswTlzl3DO2IKm99Ly7XchfY4y13CpUmtDU7MS8/DRfErvnyYa95uoXBfrKLtAF6XuevUw9FPJJhVG1kAY5iNe/BwWGE3Tfs0Z0H8aYcLq9OxKfx8aU8gTtdJBK5sD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 14:45:48.8734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc72a30-20e7-4e16-9853-08deac47543d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFF3CB57EDE

Add feature discovery capability to the util layer interface, allowing
userspace tools to query which PMF features are supported and enabled
on the current platform.

The following features can now be queried through the
/dev/amdpmf_interface ioctl:
*  Auto Mode: Automatic power profile switching based on system activity
*  Static Power Slider: User-selectable power profiles
*  Policy Builder (Smart PC): Action based policy management
*  Dynamic Power Slider AC: Adaptive power profiles when on AC power
*  Dynamic Power Slider DC: Adaptive power profiles when on battery

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/util.c | 12 ++++++++++++
 include/uapi/linux/amd-pmf.h        | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
index 3a30fd4f063f..c96e6b3fef53 100644
--- a/drivers/platform/x86/amd/pmf/util.c
+++ b/drivers/platform/x86/amd/pmf/util.c
@@ -34,6 +34,18 @@ static int amd_pmf_populate_data(struct amd_pmf_dev *pdev, struct amd_pmf_info *
 	/* Set size and version */
 	info->size = sizeof(struct amd_pmf_info);
 
+	/* PMF Feature support flags */
+	if (is_apmf_func_supported(pdev, APMF_FUNC_AUTO_MODE))
+		info->features_supported |= AMD_PMF_FEAT_AUTO_MODE;
+	if (is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
+		info->features_supported |= AMD_PMF_FEAT_STATIC_POWER_SLIDER;
+	if (pdev->smart_pc_enabled)
+		info->features_supported |= AMD_PMF_FEAT_POLICY_BUILDER;
+	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_AC))
+		info->features_supported |= AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC;
+	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_DC))
+		info->features_supported |= AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC;
+
 	/* Device States */
 	info->platform_type = in->ev_info.platform_type;
 	info->laptop_placement = in->ev_info.device_state;
diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
index 54b5cf08f3fb..0fe68e21ee5b 100644
--- a/include/uapi/linux/amd-pmf.h
+++ b/include/uapi/linux/amd-pmf.h
@@ -34,6 +34,13 @@
 
 #define AMD_PMF_BIOS_PARAMS_MAX		10
 
+/* AMD PMF feature flags - bitmask indicating supported features */
+#define AMD_PMF_FEAT_AUTO_MODE			BIT(0)
+#define AMD_PMF_FEAT_STATIC_POWER_SLIDER	BIT(1)
+#define AMD_PMF_FEAT_POLICY_BUILDER		BIT(2)
+#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC	BIT(3)
+#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC	BIT(4)
+
 struct amd_pmf_info {
 	__u64 size;
 
@@ -57,6 +64,9 @@ struct amd_pmf_info {
 	__u32 bios_input[AMD_PMF_BIOS_PARAMS_MAX];
 	__u32 bios_output[AMD_PMF_BIOS_PARAMS_MAX];
 
+	/* Feature info */
+	__u32 features_supported;
+
 	/* Reserved for future expansion */
 	__u32 rsvd[8];
 };
-- 
2.34.1

