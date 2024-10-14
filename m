Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D75612CD96
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Oct 2024 04:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728881925; cv=fail; b=DlHjESqzSbE4HQ1vjVUeA3Wpfx03+SoA6AvHtTsvyAiX5W0dDT8r8Rhgl8atcHsbqOY/LzMwsOgcivxb1rX3Vtav2awpNGGIGwE+YX5QCm/kHI92eqIHDQV2lQeWCt+K2yyAbl8kzOtiT2Q84ZCw+NgTu+TTCy7ncQRaARkVots=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728881925; c=relaxed/simple;
	bh=je8fVkpVkgeDr7N+z/t8YzpswML6S+Sr410n06+TBX0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c2GypCpAWdTJP8imqH/0xjpfPHupztuTm0yay50AuZ5p0saP//wg8B9uf92dZgq8GTVum+SJv7RbApBUqSlWOXgWYzaw4m7IonyF2KmZf37kRGbL0lURvshPCq9eAQ+0PrUGsSJUEILvgybOTYousBFibzb5QDgAkPgw3qnRI70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ty2wnMJm; arc=fail smtp.client-ip=40.107.243.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ty2wnMJm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsY558ZtOdei/Rq6aQ7IpCrOowPnnfDj31rq2HTOqgy+X3XjAiIeW0yLelxHHGDX5LwyZIO1CB4OQekAQrtv9Nb3/vrIZs0oAlKzdDs5rDHu28PGIkN6KFRns4ExuNDBPa2+Pw6ay3DrB/8ZKHcZD1ZmvUbppjN2mIXshUFZFFwp9+D/IEDw06pMCUfbkmePCEbNw3+wqQ3bPvmnsd+HMRaNL01pMGPzdQuCnrLLmSx7zYQvTBYaen7ME9wIHAgcTMmyqqof4FrsO0+w/WAX2rDMK1u5OmV5gFNRcp6OEP68EN2q3Sm1srrGppp8xS+iLYJfAwzLnspJ4ABjPh/cNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLo4vz4q9TpTcX1oYkIVPk7XG+r0Obo4aZBC5KDX6o4=;
 b=TaTiX2jFmhd1UfefbspmTHKuSMlxjra+7KRtMs45DO2LVYgpv5Ru7Gr2USsi7yIi1iktpNl9AHGqZbRb3T32F1MEVpRKcHUgUgSn9BaqxO/KwuP9RCR2E2k7KaWTdy9DQm29oGLLBUa5EszLkE9JYOcbO8nb3DvVctjF6G9UpbeEe5tGgbD2KG/UZPH5rsXJTC3fR5t4q7M1Ac2yIJA+zWaks8PpK0NVFfD+dTy/uFBycQiSmbFOo/J8Y5HLyPCJbEp6nfeqgHH4jlyKAEUqUq3M/Wq5VSyg/y791LzgMVQ2SMD4P8RYh7oBJOo6VO9j0Pk0KKH4e2ZE3nZLv8/Uvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLo4vz4q9TpTcX1oYkIVPk7XG+r0Obo4aZBC5KDX6o4=;
 b=ty2wnMJmEeK6dmH6rRE1qcpY0dJ4lnbTY+dfMhsf50d6QKS3YyKZSHt6zyGRNZOH6OSYzzl9r7RkkRBDf3mWVaaOnlhI5b0z+/lfmCDo7XVRuNkSY/iWVI0MUyu02JM3J2CMZupRJmFotqiZMTRH5W6tkgCiTuSlDJfAnp3xfxQ=
Received: from CH0PR04CA0064.namprd04.prod.outlook.com (2603:10b6:610:74::9)
 by PH7PR12MB6611.namprd12.prod.outlook.com (2603:10b6:510:211::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 04:58:39 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::3f) by CH0PR04CA0064.outlook.office365.com
 (2603:10b6:610:74::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27 via Frontend
 Transport; Mon, 14 Oct 2024 04:58:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 14 Oct 2024 04:58:38 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 13 Oct
 2024 23:58:36 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 5/5] platform/x86/amd/pmf: Add PMF driver changes to make compatible with PMF-TA
Date: Mon, 14 Oct 2024 10:27:59 +0530
Message-ID: <20241014045759.1517226-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014045759.1517226-1-Shyam-sundar.S-k@amd.com>
References: <20241014045759.1517226-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|PH7PR12MB6611:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d065f7-c43f-4ac8-32b1-08dcec0cde1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GxHLJ1dNsrQZckJFEWQ9m4dSenN0yh33KRvO7FTn+JOv7ezHJZ4hcWrl+G06?=
 =?us-ascii?Q?kwU24Orni8ZP1tMIF/pYnBifgnOiU2SiI9MVIe4mpwfOC09B+h+dx1N9QoCG?=
 =?us-ascii?Q?Ou8K3FRA3huKONBCNRkD+6WeaxaODB6tqsLSlpssyUY6F2Vxw4rPXcPzqXy7?=
 =?us-ascii?Q?v4htcLlhfipTOHyBeoDecWaHsQiE5XvNqGszO1z9eQLuqhYLaOl4XKe8NeDz?=
 =?us-ascii?Q?JNoA65EhFHzADugChGRxugMwPtqW2SPQ+r3YRr5p539Re/1xKcej00esKwxv?=
 =?us-ascii?Q?nxFSzaGE1B1dAvXmUSdlV6V2+uKCLA9bvvIUc0kiJgUwcU33cKv+RzTSta7g?=
 =?us-ascii?Q?oMFtJ3GMAjXAnfj6+Gi4z9blHbxwEiXWXdkgq+gmwStczr1RkjlDzdPxTkoU?=
 =?us-ascii?Q?NRt9wIXpn9jdqRHegXvtp3JQjCZXR/iBdgO5fjclBZZDEilKsS+jtT4RubQq?=
 =?us-ascii?Q?uCT/+hStaYtQ5jSpI1GdFx+6Kia8LlLcXTesrBLrXP04WjSGhcNx4lzANDgw?=
 =?us-ascii?Q?UFjr12jJR8HUp66s8+J+0SkdTCt5+zDBFR3Yk1Iq0WNwCkuoF5xrIPYPWPMK?=
 =?us-ascii?Q?poClD1dL6CZ9LjHZwKEnfZCfCZoITkBdFmbUEDsSyOkp/c7dTjvM7OyF4AKv?=
 =?us-ascii?Q?kXM8eRHcComky30jj+MqoUPzxowuP+hl/fuNVMirtTsthKAoS28450aEXR6/?=
 =?us-ascii?Q?lxtvKujOk7UKSlEDAjCOo5qh6zWjcRyb683H1g4ZKsLxWoxA/D20qhgpPNX9?=
 =?us-ascii?Q?vFzpe9gT627+k3F1CB78KUPwm8u7f8iKoPY7ikw769CiXmo22ajrShTktlIL?=
 =?us-ascii?Q?5T4aae8rvpEkrbkytawxdUe7Mnv7vgGYxsHTvEvY4cN7ZNaMqW6+PQpu7VAn?=
 =?us-ascii?Q?RbVhOaepknHFtExHFIDKPOTkAjKlYm8zpBP4PnxObHSezHY67UlnvWshbcv6?=
 =?us-ascii?Q?qoQMC0STfblfX2MsYaGX7rP2CBaBJtC9J5EhHOQIQWrLcahdmMD1sw1lgyhT?=
 =?us-ascii?Q?n+K991E2QdA0oV1tG/Q9LpT/0yGrOf3SPBq7GMCG7tbFV5SKHT8Ooe0rhDuj?=
 =?us-ascii?Q?e+377k2P75JClWk7wIyio7CXy0E5d87J3JeNHbLSzK5EAbMEsR3aXt9Eekbb?=
 =?us-ascii?Q?WzARncmSTJ+ji6ndvu5DdnEtmL3rrMaP/hug5uPSbR3X+ozbqQ/iGe1nyyre?=
 =?us-ascii?Q?58tXPwnnS2veiypuwjFhpsxJIqkfqeyCsxxaFNFe4zpku67CdarMJu6um7f4?=
 =?us-ascii?Q?qUjbRgQSbF55ruYb/ud2TKYW1BIyuOg8FuSkcUZhrZ0g4O354dYW14V6nB26?=
 =?us-ascii?Q?1njzoLGNVtKwP6una57M3COCGjbE9riRmhZpTfVNQVmhdzhZXVIL2Vtj0umw?=
 =?us-ascii?Q?PHTVAwk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 04:58:38.7914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d065f7-c43f-4ac8-32b1-08dcec0cde1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6611

The PMF driver will allocate shared buffer memory using the
tee_shm_alloc_kernel_buf(). This allocated memory is located in the
secure world and is used for communication with the PMF-TA.

The latest PMF-TA version introduces new structures with OEM debug
information and additional policy input conditions for evaluating the
policy binary. Consequently, the shared memory size must be increased to
ensure compatibility between the PMF driver and the updated PMF-TA.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index a79808fda1d8..18f12aad46a9 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -106,7 +106,7 @@ struct cookie_header {
 #define PMF_TA_IF_VERSION_MAJOR				1
 #define TA_PMF_ACTION_MAX					32
 #define TA_PMF_UNDO_MAX						8
-#define TA_OUTPUT_RESERVED_MEM				906
+#define TA_OUTPUT_RESERVED_MEM				922
 #define MAX_OPERATION_PARAMS					4
 
 #define PMF_IF_V1		1
-- 
2.34.1

