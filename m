Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011002.outbound.protection.outlook.com [52.101.62.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CD53A759E;
	Thu,  7 May 2026 19:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778181033; cv=fail; b=T/ZOvET5rbUt4ueOn//rH8jufJ+Kk+unVB1f/vcqvOfQcsn29q6NgacKsXcfQKjV5svOV5a91nXhCzX8FXoR1JV0LpMuUaVAKzdQm04H3826S+oD0dlQykgg2TsLeVSzEplDWWTisdIt7ZllrzLqT+fooRNXc1zbSFrO3QXruzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778181033; c=relaxed/simple;
	bh=0DDJXbjx3Mqh+N3GThXKjPkfsNT/B0PBYNBHoGDgve0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bf3VePJjjJM73q9D6oUrLGoWNfjM3fWA2j3/wD5H61g5IS5rCMRAeGEBgw0zjVvMm/UH/bKu4jHyjUpfeGTJcgJGKTkMvn44nEwIJD0gaTRPJYSEhIJowjGd+bDUNOU0zfaELeEPQ3/A3pV2jetR5CDbLw7qqIW/riXcMnwoWw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rgHUWLL8; arc=fail smtp.client-ip=52.101.62.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rgHUWLL8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2VSfM3UlVoU9bhSnOl4gAIdkdj7bQLWzMZV7fiJ0vgRnDANiQd9lZyrd0Si76zUfPQ02c9xpMmejsOTrOSpiBXNREC0d0AVKtMvZ3Z84T05Yy4w0URNH5QgHd3raW+XU8P3oiCMMlGiROH9YbaJ12p7qBcohC0rATORj5etcHF7FIWw4XfCGQToHrFINe7z5jBLUlV6h4yzdOce8kddccy9TtfGV+jwmtLSK9NXxsXcS+1tXyVDUcfGWTgPvp0iHpRaLB07WQcF5W2SopoRWp92hFt8aidC7Vzk9tyDT6OJLNCs9cXVhyLAailu9HftYUcveF29Y9EynwboO0rSVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chHzZx9jGUMT7VDMZHdTYQy8CrrO7GCnK0lZ4gRZXUs=;
 b=CvzvGovn/9OMPpaBF/oqxgtMSmqgbToXL/zpEeZolfZLkilgeo+82Fau5PDuRP/0Wj8YjYb5SeBWLXSvrLF1U8aIxK/xFWzJHTlzrEjxj+ZWI2lZ5GFkyLRmA/HsFKJjU4eWLR3uY2sLv1WmBiMuJX5kgD5av/Oc4IQnPIZRqahOVQQXHGVLpz7+Z4aDt6FvDjAGqxlmEtF6kNkRy6pSgN7uLYXgOtdRB0QQlZFjfczWi7rktORdzs9xPFaO0ch0pSeL9QK0RYveZcGUwob8IRIBN1mR9co8w0tOSVcqmr9ZPqKL7eN8ct/YiLftQDU6CEpiR+wywgVTKjN5XGTbBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chHzZx9jGUMT7VDMZHdTYQy8CrrO7GCnK0lZ4gRZXUs=;
 b=rgHUWLL8rBqjGZALknhYMWbZ2lXXgmPOSGFtpD8ENdm6VUEQf+RigDWWD99CGr4XLr5xuoMFcT5kG09GXQyajvFUsYg9WUUwEyEvb/B+exk3LG4DbupXqComqT02QagH2btR4iQH8kWCi1hDz2um8e58bueDnAzf42CHEWXGoZM=
Received: from MN2PR07CA0017.namprd07.prod.outlook.com (2603:10b6:208:1a0::27)
 by CY3PR12MB9580.namprd12.prod.outlook.com (2603:10b6:930:10a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 19:10:24 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:208:1a0:cafe::d7) by MN2PR07CA0017.outlook.office365.com
 (2603:10b6:208:1a0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.16 via Frontend Transport; Thu,
 7 May 2026 19:10:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 19:10:23 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 7 May
 2026 14:10:18 -0500
From: Krishnamoorthi M <krishnamoorthi.m@amd.com>
To: <mario.limonciello@amd.com>, <hansg@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>
CC: <Shyam-sundar.S-k@amd.com>, <perry.yuan@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>
Subject: [PATCH] platform/x86/amd: hfi: Support for ranking table versions
Date: Fri, 8 May 2026 00:39:26 +0530
Message-ID: <20260507190926.1211726-1-krishnamoorthi.m@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|CY3PR12MB9580:EE_
X-MS-Office365-Filtering-Correlation-Id: f4269ad1-a25d-497e-5921-08deac6c4a2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MK0APezsMGiq99ubS6NxD+KwX5fsD0waii+RsldH+zJHIUZFAFtvmxwINbqaWj210pEy0EiFvxbs/AUy9Gb13wpfw1rL3WIUUCQza2/eyLqM6HjGIN9J53ovwIe8C7z7+qJ+shwxveGhzDjPbjhGFTMpC1X9WxDK/tJyvcBrXXcf1Jx4vEcV3FmPdH5Z1lSfSzUH3OF1gHjwOh2RXfqua9FPrCt3EjLUCmO9gxTjwDd37Kv0vgFQkR5vMlVctf1MkUqAeom4UWekCooSALUxgp72LOAQNIBt4be3y9iP7XvAqNSJGVFhDM92vorPWcJ3O9xu4mF0CM2lexNO02CZc7Cv1mi5scIrfkZldWoIrX+usUHDE+LoQqIda6KbQ0T4jmQmD75I7167feJI4eW1YAuUefjzLA47WBFg5Oq1StXPHFkNG1jfdTBsGm8UYZSKC8BdJRDacp6bx6tdnf+qNwo3YgrERxNryuWAriM7tM71Kg2bSo5mQVucVgpIU8u2/XMF9edyllP0kgJGorIUJUbrX09FZLX7OF4FdqKXpBHvc2301WfYYnWuQaYC+lzR2iC6qDbA3G90mbT47MCmMrrvNu+/HUA7jEPqvqLnX3IgJL7eK/+yUj0aVd8Sjuuwtt+kcwfpOBqvFB2dFzkhQHeVD4oeePcbs1cDNLc9AfRCUkfpYBjlQoqEZ5B7gcpidAZi0Hcom0GancK1qSAKLQDkzpM155bsI84uIck6TVQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ew554wW2+XSYxys4XaS2F0aHRFcCTnNDPHAprIM7BcGlsMIc04rO0yq+7JiTpkSlpMPp8G7v/9NldWtd181pQppuf2FDQwR854DIKosikfE7J0JI3LY5XRKv7pUvNd+ENXzgVu+fjt29H68qEyvs/nfLs6pIMZY6r5l2xVPdLJXspt/Lv93v8Q6LNDbq2UU755xCaRnYZav32TNN8BVF/jQjs9vRXZcMnyyDJhJ+bD8Mej8KHPbsOyT8PIzG5ehve8XNKUK979lx+qwx/qPRLIg6/lJIOhyAAxlAplgi8/9V8RXlsSv4d/G8t6+6uMvoPcoKEMLKGkdTxlHFnDqrJFU19MIEQxDL277SbKHitcYgPSC1khipFzyxdG6oH4qhEpJNpr0HddxTWy4TLSXlmEFhoxK8+aw/2jRz3C6vRmjch25EdKVQcthHvQ6pRVTg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 19:10:23.3633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4269ad1-a25d-497e-5921-08deac6c4a2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9580

Add changes to support new ranking table version. Version 2 of the
heterogeneous ranking table provides static CPU rankings. Version 3 adds
dynamic ranking table support on newer AMD platforms. These changes ensure
that platforms still reporting version 2 continue to function with the
existing static ranking path, avoiding regressions on older hardware
that does not supply a dynamic ranking table.

Signed-off-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
---
 drivers/platform/x86/amd/hfi/hfi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/hfi/hfi.c b/drivers/platform/x86/amd/hfi/hfi.c
index 83863a5e0fbc..e0ebcb0c4acd 100644
--- a/drivers/platform/x86/amd/hfi/hfi.c
+++ b/drivers/platform/x86/amd/hfi/hfi.c
@@ -33,7 +33,8 @@
 
 #define AMD_HFI_DRIVER		"amd_hfi"
 #define AMD_HFI_MAILBOX_COUNT		1
-#define AMD_HETERO_RANKING_TABLE_VER	2
+#define AMD_HETERO_RANKING_TABLE_MIN_VER	2
+#define AMD_HETERO_RANKING_TABLE_MAX_VER	3
 
 #define AMD_HETERO_CPUID_27	0x80000027
 
@@ -158,7 +159,8 @@ static int amd_hfi_fill_metadata(struct amd_hfi_data *amd_hfi_data)
 		dev_err(amd_hfi_data->dev, "invalid signature in shared memory\n");
 		return -EINVAL;
 	}
-	if (amd_hfi_data->shmem->version_number != AMD_HETERO_RANKING_TABLE_VER) {
+	if (amd_hfi_data->shmem->version_number < AMD_HETERO_RANKING_TABLE_MIN_VER ||
+	    amd_hfi_data->shmem->version_number > AMD_HETERO_RANKING_TABLE_MAX_VER) {
 		dev_err(amd_hfi_data->dev, "invalid version %d\n",
 			amd_hfi_data->shmem->version_number);
 		return -EINVAL;
-- 
2.34.1

