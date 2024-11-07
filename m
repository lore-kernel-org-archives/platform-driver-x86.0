Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2041.outbound.protection.outlook.com [40.107.96.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B0C1957E2
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 07:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730964457; cv=fail; b=CUdQK9uc/x8CUyq6GdGsxPhjTa7NXDm8mLFoynVpiQ/SvGq4G1oTNmosScoDeJQk021ildJDh6mIAslPqlLuaK5UOuqlLIyJCZTKUubUgrlKBBOMC4Kp8XjPAgcJPhQiTCVT496IymHc2tPJ4JNLCTSfuwfNRIUKjPebdxRv368=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730964457; c=relaxed/simple;
	bh=gRhBZ54O1RNpQRgM4NrC/4WrGDI9PPU6px2QeJ3DK8E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MQnhRo2XeyxWVCouUWAhtyNLKq/KRisAPmQVKE0fMhKF5Z9l2rm7VHi3sFeC9fPZDOkoLxQoDy77OMR7AjgAKKvagTsfOtxaO8SncqPtzA3snwMi8N6wSUROkSEN5xpVRFBUZcF4ab/YSXHLMdapsKG7XtqfwdqWxqeLUt0KR80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=r1T/dfZz; arc=fail smtp.client-ip=40.107.96.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r1T/dfZz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wW7stDpvqYxvxBktSaEjHO0gxUzCHvOcVB/Ixg/k/FFsVyhS+tqdWfRDP0UcPIvz55zEJd4B4jxxRtoa3jbbdWyrwDhuoxVsSEoBQ7fJJttOHrepbu/hPj960EQKKQIqlcdcVYk+VBMrRKkTQxPSxNGlXi9FIdYEWV+y+SyDtpn23rDCgxiMO+0J0AX+5dy+k+TNC9Z7AcLMNRl9LcHLZD1mO3ISpVD5g4VVnmLJpcLAFSSOKbROTzGXgxf5f6R1GsEQm/F5L/elKxN0QbvCTInTDS0Tfkgw4A4wfDhvn1ctdBq4ONFE6oyW/zUl5/9wPR/h+oVHwp/S5nJQTIFyAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mSo4eapio26u44FeAWTTTcv7ZCbPaDLoFa54TUKevs=;
 b=WNVqRJVD4/4c9hXfFDuptzIvlqdKaX6avP421T7Kw5wNgAXMKvdgHWiBedlBKvnJTH9Sa+0Fx4QZUTGw7ezfA2X6Dh/ZBF3Jf5l+aaDPmrWqdiWCMUaOKDuVONKQcSspNfCIVbR7Ek/UBjbGOhhaprxHEM80ecUS1Sg2tHjzS2Xb+aWEK0W+4ja3EtHyvkjrsaNNkwvX7SNdzTo0x+EChkF6asgie1SpwVG2kBEbiA6+00BhC+epp2md6KLzg5N3l+Sh4LRpwGdbonBI6bbbR3H3uaZH9DI2C2Hku6AD9rVyLtKINTJUY3rHf5FUmmlRoAL90YZlF7BGUGUMdcU0DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mSo4eapio26u44FeAWTTTcv7ZCbPaDLoFa54TUKevs=;
 b=r1T/dfZziIsnUI1lK6JN4y+MEcCaVFeCi0CXTSj4lpRR6MXdSoltiK4K17nJMg58TW0X6Q7s3h67eQ06zQ7EZUz4qDvALMXl52Id8pS0IRsnrCZAUFCv1179SfuCGIolUM1jf/yVpy/h17GGUYNq2tcRusRGasSbX2ASWeO6aSo=
Received: from PH0PR07CA0030.namprd07.prod.outlook.com (2603:10b6:510:5::35)
 by PH8PR12MB6772.namprd12.prod.outlook.com (2603:10b6:510:1c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 07:27:33 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::29) by PH0PR07CA0030.outlook.office365.com
 (2603:10b6:510:5::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Thu, 7 Nov 2024 07:27:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 07:27:32 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 01:27:30 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v4 01/11] platform/x86/amd/pmc: Move STB block into amd_pmc_s2d_init()
Date: Thu, 7 Nov 2024 12:57:04 +0530
Message-ID: <20241107072714.943423-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com>
References: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|PH8PR12MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c2f8568-965f-4bdc-5c2c-08dcfefda502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MBVSLLqukcWnFZSbSH34QqrnnAFMAiHPFNcRyTZeRuD1TJqjLrcq8FoU8l1R?=
 =?us-ascii?Q?tQB53RsRh9+rTy7lsbVrN1VEKRAxagopKYrCiYmCB8vIimtcuRpSuyEjj5J4?=
 =?us-ascii?Q?NrDO33ajSxyReUEALpOiGq7gr4hQ7izl09dRrdLroPcSeY03U48vTUj7N/xI?=
 =?us-ascii?Q?Opc18g2h9N145dELhLiF7F4qZDRL0BliiaIUyfzphVCNez7QrDTbbVQtGkMr?=
 =?us-ascii?Q?1oESHOfd5HY2c3VTVWHRB4uWfECMQTIwtC+fyJBN/7U/Lms+WZ5Ylt0IpTva?=
 =?us-ascii?Q?xC0GKHM0Um/rFz5UC5SyC3SWNMjStZVb3iUjHhb+B2lbGJc+ka23gqUOvqAr?=
 =?us-ascii?Q?TYuFJmjTB7d4mgLMSHBnSYxrCyiLL/0usGtPL2iBrLz7PcylogNtzpb9i2YF?=
 =?us-ascii?Q?XS+dbk7kqOBKOl/RkwHbZ/MQBWDx9zuAC6aOLUH8lzJGSKd7dopzYpG74b5U?=
 =?us-ascii?Q?P/7gsH0HqEcjpfL7B1xj9ZaJvXDaB/+nlXNiJPc5dHDOyTKWtg6gyWZWO5Lg?=
 =?us-ascii?Q?OZd/cEZtIHjR6oYMSL/OQEkY+6m5Pode+9mbR3WRXmqFkWWOzNjbkQFPIDAD?=
 =?us-ascii?Q?DbSIXgqJxuO3v3pWJYkYiI6m/w23D/mmOyWYSBVm3p/Sc2K5+4dJ8wnAW+Tm?=
 =?us-ascii?Q?myrXpFQMVviCue603mwvaAYoAvQhzEFNHF4uvi/1rJyEkYASwmwXvxu4pZWC?=
 =?us-ascii?Q?m3VlOzrcD9yyNVyFZOCNhC+229AqO9WVD/ZhO5c+8nB/OkY9tY71oMFbXO4/?=
 =?us-ascii?Q?IfmxtxyNHhOVfIs+/Pzf7/zu8bV/WJC2fPz8rL2vO9DOah7fCx8qAdsvdibg?=
 =?us-ascii?Q?VdchToi/SZqDLL+f32Mlyxjbl9S8s6hmx9hFRSXmnBJAd5Z7570bQ7dS0d0I?=
 =?us-ascii?Q?QLMm+TN1YI5tkgbjx//HKdt1WEHGxxQk8+/BSYb2HddpJRntIVL43AjzeKpT?=
 =?us-ascii?Q?oGYf5Nl+6kyqB95JChCFUdDU51d3i588NdZxjNPLnm9zKM8oGwvcPRh32Qju?=
 =?us-ascii?Q?ld8t19AbJd3UzLazFz+qTFssA/V5M4mcGsZ1rglbpYu+OQQaCd2+4po6H1tj?=
 =?us-ascii?Q?LDNI117tOx+yKM0DqruEKVZgJPOsnrWmkMzCWFc2ruaiiXpBcYmRVQ0Dsan+?=
 =?us-ascii?Q?ZBSc6v4XjAD8C4W2JzyQL9hxybsqTs9oymgbTQBZDnW/1t/f+htwgeNH12v8?=
 =?us-ascii?Q?BvVJetpL5DY5CNXlb/MscA5BeH8pwWvoOvh95ZeZDUK/0EuF3e5XCdKCeHRO?=
 =?us-ascii?Q?Zb6o7SEiUrEuVXYZvXd1qP7l+Ag2V98B5ktyVAwceYvl1u3w8YisT3mMYUwP?=
 =?us-ascii?Q?Bee2W712WNnz+kJoSDpHSOp+gseSlFsOYii39MHX0hVONTDrxMPbbrItJXPR?=
 =?us-ascii?Q?PcvwZSdzTyXeUqtjOusnB/lcFGuItboelOfULU7lsvAejKRP/A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 07:27:32.7562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2f8568-965f-4bdc-5c2c-08dcfefda502
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6772

Transfer the support for STB-related file operations to the
amd_pmc_s2d_init() function, thereby consolidating the STB and S2D
(Spill to DRAM) functionality in one location.

For older platforms that supported S2D, exit immediately after creating
debugfs. These platforms may not support the PMFW messages available on
newer platforms. This adjustment is necessary due to the relocation of
debugfs creation into amd_pmc_s2d_init().

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index bbb8edb62e00..54ceb2f9bf56 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -648,15 +648,6 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 			    &s0ix_stats_fops);
 	debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
 			    &amd_pmc_idlemask_fops);
-	/* Enable STB only when the module_param is set */
-	if (enable_stb) {
-		if (amd_pmc_is_stb_supported(dev))
-			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
-					    &amd_pmc_stb_debugfs_fops_v2);
-		else
-			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
-					    &amd_pmc_stb_debugfs_fops);
-	}
 }
 
 static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
@@ -982,6 +973,15 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 	u32 size = 0;
 	int ret;
 
+	if (amd_pmc_is_stb_supported(dev)) {
+		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
+				    &amd_pmc_stb_debugfs_fops_v2);
+	} else {
+		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
+				    &amd_pmc_stb_debugfs_fops);
+		return 0;
+	}
+
 	/* Spill to DRAM feature uses separate SMU message port */
 	dev->msg_port = 1;
 
-- 
2.34.1

