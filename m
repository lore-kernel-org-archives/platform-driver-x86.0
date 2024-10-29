Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739CB802
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Oct 2024 15:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730217318; cv=fail; b=Hnn5qQ1tjlnwfEi8CmcWEvD4j5AEbMbDjjPEqWzyoSJ8RwkZmun1eNw9ORFHJ7mCCi++55V000nmRN4BSf1ibbBYAoHcF9+lrofCDMp7ssz8TOokbD5RD6KyQwez7f42hNZLZczJcEgh4is2gRm1DTnpKk69lCaYawBMGgDTq84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730217318; c=relaxed/simple;
	bh=jv7XLlsdDGi7DVuMGL6+tGYfhJHqm/ievDxQtBbYZ9A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K2QS+zGobvleAzOP5IAu+7QgJaJ/3Vq7nWFncaxa3tAuyRtsfb6hRVU9VXZ4pswJXCt0Y4jPJNUgtfX0tz/B8nfsp1C9E12Z+EBierSZTVHSHTWQFUlMp0lI40NqRVCHdFmb6Hff+Sg+JGbsGeonEZoF5XeoTFcyXStHb2x8RAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FgMz7sGm; arc=fail smtp.client-ip=40.107.220.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FgMz7sGm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxZxWIJqYJiALUAjO+Aj+K/D7OlXvnjH/7fU0y0jEkjNnvip3VMyOPCqpzaUk4pMyj2hQGjtS8sxi23116Hs8JwYKXLKbzV8XijgsrAeYnYLPjK4WCqtI9K0VNpA9wICsQtxqJp+4aT3H0WyESMwSmmTqfQNPHLeiXgEFVrgwjYWgPT2hwjXFA0qGs3BI6ilv5c/TTz7wf+6Lt0O+T6u12qMsHl10aTMfJ2AQLHhMZ60xrUxMnYu0jL0tESJpQm3B3sRMbcBE9PYq0eTx2gq+Mx+oe1ooPEfrH6eXZGZUP092OtuiFkt+mlQ4vS5HTj/i0d8MXIVsZhS5y8PdpR85Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjvmursIrdNWpyAaSRfRVnq1+Bq0WMx11CeEQe7JyOY=;
 b=HDMFlewv0lKKnDahSZyAkz6bszTZcmUHSStnZjBYhrc2QpcjPB8ZSRV1Qcd3leVfKTraBGRkF9porjC3CnjnJJBc2Rn93xr9UObWy0ty52nssv0bo1Io0h/5undJ7ungqcaH4TEhoayct4keivUcAlV5K3BkgnByd5czQolr2Abf7lkd2+iQjPLjbpFtFi2dh9KtGxcXTfYiL7g0wGp+YvtueEzAczrFrlhq2IcGsTqlLKWB8dBaEB0gyZZA6A6Spe2PUVwANm4HzS5qTIGx9Le1evoN/Ms/nhz1QowC+jDNgXIBwp3EkRoH9ciab/fJYxKtE35o7JTW5Klr+Qraww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjvmursIrdNWpyAaSRfRVnq1+Bq0WMx11CeEQe7JyOY=;
 b=FgMz7sGmRe8YXZ94xYCgMUFMVIVGQJVm0QI8ZUoTfTeCGVXQnoW8hXjJGZtSmC4cl/AamHE4IPxcQO/jrUjTmPgB19sr0X2IlA7TWX85GmPvSU6PcVpXH7kmX32LJ8s2iVPspYsPhI1VNXZYn92A9NebNS5mGZyw+833r04y7aE=
Received: from CY5PR15CA0144.namprd15.prod.outlook.com (2603:10b6:930:67::11)
 by PH7PR12MB7889.namprd12.prod.outlook.com (2603:10b6:510:27f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Tue, 29 Oct
 2024 15:55:11 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:930:67:cafe::59) by CY5PR15CA0144.outlook.office365.com
 (2603:10b6:930:67::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17 via Frontend
 Transport; Tue, 29 Oct 2024 15:55:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 15:55:10 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 10:55:04 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 0/8] platform/x86/amd/pmc: Updates to AMD PMC driver
Date: Tue, 29 Oct 2024 21:24:32 +0530
Message-ID: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|PH7PR12MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed2d7cc-0555-44bd-1d2c-08dcf83211af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?apWI6Nb/4fj2aD+pK3zL+oDoj3BjUsaNmxi/vvH0A90sBzj/p28dykkscmnO?=
 =?us-ascii?Q?ATyIkByhJCY4Aj/VAWOk3ICyjsQOUEsQp6hy57mg8b8CRJVJVd9vId6AqMsV?=
 =?us-ascii?Q?/mb10K6ygsVvtu1hrlQeDUzdx8MvB39qtnYq3oMG9nCo2FkA1JkWi9cGSHxL?=
 =?us-ascii?Q?cLGTTV+1LM5IgHJeS1NeqPVlVnL9NDCBrYIFmym5Lj2rqFqHbR399LcQm9Yc?=
 =?us-ascii?Q?NkrDmPK6AStmJPdEalcK5mJLpVqwh/nuH5bZnWioU0G+RFbtjwPCdtM7o/gX?=
 =?us-ascii?Q?+psXooUIBEAKPE3yb42xi+P4pmN+0bv2xhFUWhGr8U9WxJQXRXoj1gZhhrUK?=
 =?us-ascii?Q?wB6Uie2mkllb2AeYyIJtt911GYG3a5XAmgIkFOQZ34UpapOTUprBlwQCMc2Q?=
 =?us-ascii?Q?7Q1xoX9KJYvMkpe/K9+davu8xVv5Sp4sU+EULcvldHmKOKTNpIFbSZmoJXgj?=
 =?us-ascii?Q?/UHE81UcQ30d24KiXSNJjS75hAyZ61OKhiwodbBVR/K3KCNJTieg/M5ihK1X?=
 =?us-ascii?Q?ojclOI9S6Ak4UEXuAnZqXXfZP/mt5OZQDJtK/4mCHHKY7ZbsffVBJN0oeQQk?=
 =?us-ascii?Q?HAkVE1CADBX3PS1JjKZTBVVduSy5qQnGPeDYVBHUT4wrbJndNS5VHKEwDgQD?=
 =?us-ascii?Q?1kx+AzkOFqQQQU3abzeucV3tIqGjSQK3FKJuwTsnt7GZZyz/1cgFQOcB7caA?=
 =?us-ascii?Q?UYDiH1Ne6D7uDYjrDyj0p21cIVfOTrYT6DI4Lh4cXRWY7d2DGYU1kiLY/U4l?=
 =?us-ascii?Q?PfURLtZSnFJhsEyjymU4HoLnRSp/5OO9AQhqqXLmtzhQobGcnNO+fvNA/45v?=
 =?us-ascii?Q?XshaVM3oCFpntuq+xk3T1u0Q1o2cZqwPG3Lj/glsvp0EbKD8fuVp05nArZ5+?=
 =?us-ascii?Q?IvMrUXt9DWCcR5w91P5XWOW19tcsMxk3vHoOEgydvsxxRW6YCHr79CObWah/?=
 =?us-ascii?Q?51+vGsVhljFblJgsE8Rl1upgE5AqB+42M2SCfCJmLpba8EacG8t+R2mnicDK?=
 =?us-ascii?Q?914rylBWyPYFv8l+XvJKr0X32TdXTbFrg624SCtQhFTlnEM+5+vMRymUTZa5?=
 =?us-ascii?Q?khOKKf6klcCCDLTB+YoHYdd/akuu6BKPxFmBdjsc0IZbhkaY19AiyUvt+kD4?=
 =?us-ascii?Q?0m1j1RkZSsSv50THQmm5915+K60UImmSh0e3fgm8rbHfW3fY+hskumZSQALI?=
 =?us-ascii?Q?N+mU/rE13+UWO+LLDYbnCpXLwNCXCtTXY6MNk5qh57lhlpXAXqLcfn3ajES+?=
 =?us-ascii?Q?CdXhBMDpAD2OPFq3kerMYNrc3nCePhCsEeCdpfJKUpUZawnTCmDxd2plzV7K?=
 =?us-ascii?Q?n3m/3QmdqT8r6GsjWbGzoEyFMRllbLla95RTznD6zKK3p/xXOF/IfGHkURRj?=
 =?us-ascii?Q?VbzAu7Lo4ABW8AA/gdkTwHlpFbZL21oT4kdhjTNm1yHI2tOs3w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 15:55:10.6791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed2d7cc-0555-44bd-1d2c-08dcf83211af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7889

Updates include:
- Rework STB code and move into a separate file
- Update the code with new IP block information for newer SoCs
- Add STB support for new generation
- Add STB support for Ryzen desktop variants
- Updates to MAINTAINERS record.


v2:
----
 - Add Mario's Reviewed-by tags
 - Add amd_stb_update_args() to simplify code handling
 - use cpu_feature_enabled() instead of root port's cpu_id information.

Shyam Sundar S K (8):
  platform/x86/amd/pmc: Move STB functionality to a new file for better
    code organization
  platform/x86/amd/pmc: Update function names to align with new STB file
  platform/x86/amd/pmc: Define enum for S2D/PMC msg_port
  platform/x86/amd/pmc: Isolate STB code changes to a new file
  platform/x86/amd/pmc: Update IP information structure for newer SoCs
  platform/x86/amd/pmc: Update S2D message id for 1Ah Family 70h model
  platform/x86/amd/pmc: Add STB support for AMD Desktop variants
  MAINTAINERS: Change AMD PMF driver status to "Supported"

 MAINTAINERS                            |   2 +-
 drivers/platform/x86/amd/pmc/Makefile  |   2 +-
 drivers/platform/x86/amd/pmc/mp1_stb.c | 334 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmc/pmc.c     | 349 ++++---------------------
 drivers/platform/x86/amd/pmc/pmc.h     |  13 +-
 5 files changed, 402 insertions(+), 298 deletions(-)
 create mode 100644 drivers/platform/x86/amd/pmc/mp1_stb.c

-- 
2.34.1

