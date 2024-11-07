Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DD6196D9D
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 07:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730964458; cv=fail; b=clFYGD10WwK+OD3RTuTc3F9uQmzGVpcNHcZt+PM8A9pSaKFwOwvuYM6fLXRElVoH5iw+0tT7JkE/4xDSy3pXDAyNJPhSOfIYzvjQiUaWMy62XSeB1MR3wz13TCLNqLbEZ+Mm7ZUKceR4LNgj1wq6Kj74KPh+hF/qmviTGv2mpx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730964458; c=relaxed/simple;
	bh=rD7vMsmapalbnGPg1jrxRVMKgIYEllVfd9AM/PPlEus=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bJRiWG31UwvS7zsh3HhE2WuXPbm49Eg0PRy/wfdCAnsrkB2wWZcbzzYXAs1LUlFjnHVT90iNn7I1741TZQbDN0wH0CjglmK16ApxeiDy+RAWfyEEbr9cQ130Y1O3m+8AcM39J6J5HPPOmZs1HR3XRNmL9aaHJ3XF0LUFJymMRNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GJTTHgOY; arc=fail smtp.client-ip=40.107.244.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GJTTHgOY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rl3xiAqTN3zWrhz3K3n+4qnTKhN8XW4nD9KsnU0dZzCejtKUBhtKYo9L6SuBti7KXUqQKeLLJLZtS/I/OYTefH3uL6CmT9UYKtsaQ119ZDYGimOkHzzgoeeDlhxmN6cB3H7U5+RIXG+nuiFGI/Cecuy7VxCvQgLsQwBCkmS1Rt8CpIahAj/UF+yKD/OygWshF1nzdr1aD7ZcdkyQ3VK3+sozlX6sCDsPKoQ05IdZkbksW4ajL4iXrc9pFnERhCLN7WxqjD9XqlSYqCQydEPkIkCWFu7b3d7yYmcj1XKUFDuQgwLdMsi5W9XtSaxWa48K05Hm3Kfn15nhXeSDc2uLlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/Q20RiwkHVURWSriocR/wr6qlqdTsfOYuelVrrP0F4=;
 b=EmAYucohMLbrV8niuZN38OQyl9oaXJr1fOLIKKYruG1QDaX0/p+E4ygzelFdoKzH87U8aDjCEkTRtOTvf+W5kdopoBwIyKCFDN4d7qEzkHUVW6UDdNylAkC8MdVQB+xfZ/mz4OyU+vk4aKgKOEPGq3AXbKjiG4aQWh3WvAEFs/vvYlV+jRUglRff/2/VwVHLff6GRc++Oq7OaMiVpC/DEz7p5ophwl0oEz1jqkbXGx0ZCK2LUEAf6CfUNVdNlNOPWfXnYAOcRpEZVjamIum+Vjq1+pd0LoSq+Bv372Eetama87yP1vNurB1vIXui+fjObfO2f7XoHMNp5EACzdjPeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/Q20RiwkHVURWSriocR/wr6qlqdTsfOYuelVrrP0F4=;
 b=GJTTHgOYieQsqJNXqwC5U1iS3kSCGrkSSsqePkpWhieyrbHeGSc3872LB28LI19R6n1R+fDDgc3oB09fJd2jrdLVlefaVqQQUqOgQysiO6+g6SBDzYaEBAr9kYaE33zga0gnkYr+S+MMfpDJn1aItFEPAdcNorBIqmeZAN/+E/s=
Received: from SN6PR16CA0037.namprd16.prod.outlook.com (2603:10b6:805:ca::14)
 by CH2PR12MB9519.namprd12.prod.outlook.com (2603:10b6:610:27c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 07:27:35 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:805:ca:cafe::40) by SN6PR16CA0037.outlook.office365.com
 (2603:10b6:805:ca::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18 via Frontend
 Transport; Thu, 7 Nov 2024 07:27:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 07:27:34 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 01:27:32 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 02/11] platform/x86/amd/pmc: Invoke amd_pmc_s2d_init() Post Debugfs Registration
Date: Thu, 7 Nov 2024 12:57:05 +0530
Message-ID: <20241107072714.943423-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|CH2PR12MB9519:EE_
X-MS-Office365-Filtering-Correlation-Id: 66cc48d4-2552-4f65-9645-08dcfefda632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l7X2SrTRhQmfAl2OXbXilLfTDOmWy+GZSQD28mqTbhhqEl1MEnUoJpic0ySD?=
 =?us-ascii?Q?Q2P8Qswuwp+dMTl3SiMMGJg5ZC55XneH6YI6XNyZoaPlCVResZwdlkYK5AFX?=
 =?us-ascii?Q?rd6WRKvJufCukrLBbBkpgien7yrDRYHYjjREKbChjWaYxVJH1GcWXwvIbYWL?=
 =?us-ascii?Q?8NrHa7DCV85okpshfx9yb5TydnYfqcmPVeKVhdamP33/wOqH9kvjfCMoT0ep?=
 =?us-ascii?Q?WVBcZRP+3CX/cBGY5M85pvda+8n1HpGMvbO0L2j+B9QTKUysZ9XDR/11CXCP?=
 =?us-ascii?Q?jWyvWZmcuWMilNhHJ1CPZP9KIjiAMX1xrk5l6I5EDS+rFIASLgpYwwD+u9G3?=
 =?us-ascii?Q?+B3iHhWW8um86SJ0NuHRrLAQx4jje/nBiux6nLwdxqZdu1kTl1tL2KyfY2Dy?=
 =?us-ascii?Q?DFvN8bjPxbUbVuwDcvMQpIC2AEqBVXXDB3yBNayNAa1hw0oDIzoTFiOrouho?=
 =?us-ascii?Q?ilXyyWrN1ToRzodwrB1ZThulERIPFGcjWC78e7fMC6GHcAkJZXXAdUDiKvSi?=
 =?us-ascii?Q?lKQOdLj2RiFFyROpUsC0hlhMtqrxy97j8yUaQEvV3kPrOEOeN8ovQzOze1lx?=
 =?us-ascii?Q?K0OKaT4gfCIrnJV9rkcBkA7iD41GcJjEE1nrwWkWvP7Ta7azA+WYCjnkI4yg?=
 =?us-ascii?Q?r3L9viGcdVHDuvvENNUo50g+SwqX5MXVvVZ6yncjWJL9quC0YcbLkmxJWlN5?=
 =?us-ascii?Q?NHejwJMTh+nLfvWCMIiEehzQjXy7BzvbfeaxavJoj7h7IzxPH7ND5ztp6CpW?=
 =?us-ascii?Q?/et9LetiUqIS/VDaQ4/2BEZ6N32tBrLDTlGFeOrYQpN9YiddA2J96dte+6W8?=
 =?us-ascii?Q?d3r9kFi/S72u7vChi12pKzbeCspRFo8knxfF/JHsdiV5TE5PBxoKrSxMw/7w?=
 =?us-ascii?Q?H3W+51ZIuqF3Gr4ylz5vsGG/Jf4NiPx8Z0csEkwwa/Snlnc6Z+ShEeiMQen1?=
 =?us-ascii?Q?2numl3sx40zCVplJK9rQDAWrqGhJ7+q5JUS8glQ846Iqg68pdcQKD9EvIqlw?=
 =?us-ascii?Q?/E4JWfrz3TmxSyBhRStMTrKV7Y1kf6FWNO/av/Va9dImTRH4R4MykevYbPpc?=
 =?us-ascii?Q?O6fUGBFRHiRX+UGGuJyVWtXlAd5d4Yzu5Za8r09A+EizLyTIPIxaa+x9qbup?=
 =?us-ascii?Q?FhynILstZzEXBP8PM28MpwX1mwDC2bpaOqQZe4pjDO3M8oUDvx1LaEiFm3pR?=
 =?us-ascii?Q?ZJOy9lMWit1i8VD3JfsD60ms807SJdVf1DOSOC9JbSwyC8WxdUQr9x2xF6NF?=
 =?us-ascii?Q?d3bMwduVluhKUsjk+n0wtXLHiAtD650QeLlqS8AGKoUrxjl0IVutbNkUkFPC?=
 =?us-ascii?Q?umn3T1m6U04J5QiY9yZ7bb2Y59i4lMUo1mCNImOlkWaPeEo9mtaQzLeQLHFw?=
 =?us-ascii?Q?712W8UdQHUAMPe8fKIZQlLnKGcp3yLk225p/dBYN88b7r/Yjgw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 07:27:34.7500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66cc48d4-2552-4f65-9645-08dcfefda632
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9519

Relocate the call to amd_pmc_s2d_init() to occur after the creation of the
"amd_pmc" debugfs directory. This ensures that the driver's root debugfs
directory is established beforehand.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 54ceb2f9bf56..c89560f29607 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -1095,12 +1095,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	/* Get num of IP blocks within the SoC */
 	amd_pmc_get_ip_info(dev);
 
-	if (enable_stb && amd_pmc_is_stb_supported(dev)) {
-		err = amd_pmc_s2d_init(dev);
-		if (err)
-			goto err_pci_dev_put;
-	}
-
 	platform_set_drvdata(pdev, dev);
 	if (IS_ENABLED(CONFIG_SUSPEND)) {
 		err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
@@ -1111,6 +1105,12 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	}
 
 	amd_pmc_dbgfs_register(dev);
+	if (enable_stb && amd_pmc_is_stb_supported(dev)) {
+		err = amd_pmc_s2d_init(dev);
+		if (err)
+			goto err_pci_dev_put;
+	}
+
 	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
 		amd_mp2_stb_init(dev);
 	pm_report_max_hw_sleep(U64_MAX);
-- 
2.34.1

