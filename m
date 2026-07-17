Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012061.outbound.protection.outlook.com [52.101.53.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426C4429CDA;
	Fri, 17 Jul 2026 16:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784305289; cv=fail; b=Hqawg+ngCquJcEvlTTsGNTiaECPVbIfIBLhyaJ7h9A3LqPO+HPm0ZR/plwJqlO4QDqswha30kIYppZBN3CG1OV9b9Cp1lLfNXl4WsszWDPTJEeQpVnCfJhXHDFS4uvkpkiORpinl1xSjT0PNjKg+IQEavpMQojHPbAbXXRvbLY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784305289; c=relaxed/simple;
	bh=dm4QLg59v2LOvLDXHolPxJme5UtUr1DZa50x/G84UEQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ski4Oz7Q7DXEHfyUOTcSrVNPGGVIos37uCcwKhrlc4uFj42+hh55B6HrGAMILdy+n/D0+UyQtQU4KLuG63uvZiCUoZIFBXlWTjBpBsjoFVntK6Qdn5GseqV7N7N89QisWTWDFxz11ycF8yHUhEz3e6L/o8mV2hGo0xs/Qcksy34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oZjWppIS; arc=fail smtp.client-ip=52.101.53.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oZjWppIS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egIaSP5CAxpUUl4PzsnG6X3KI4Yuj/ueWms4WE17Ir8UOo9jvFJbaBPWiyLJRQ4Gw1BpPA4djAe//8mQYmkj/iEhG4bMrLg5hsJZE40F8MV0w8K6fTI13gZBvybUsj3HiWHjCr7UFLIRTMbIuqZrAoLEPBYnimi1ONLi6AwLzXD4oUDQ9Lgyw8MYekk1JORyulgrioHJEratjmqEMFWFhRrHpRl5mlJozX3CgUItF0q12DsrcaJ7EIEV70WQ+LWdgvN7r01O6UFpmprb2WAPrlQZpt5yd+MZlcwIadml3Xyt3bS72BP79000dDidTrG+uhI/wIWl8bP+A8RtfgyZ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfDxeVyiIMuBjd+8PvRR/S8uQtq/+RQYSjmK+x4Ga1M=;
 b=GLGJTb8Di5oK9o8HsgQ1X3ilFGP3yWrmQgBxFJRnpzMGfQXX6xLolA6nGkjZvvVq+Szdp36DRa0PEc9muEmCsMNa6aFwKn2cY+xouE7u1NBP7AYPkMjUIzdtQpr9EkkiuntqrKKPRAhh+GOZ2uXMtDkiRpg7wKLJSJYishf/BsgP6NwOzNr4adFi87EmAr7b6mfqzVrJESL6R7BQkf2Ax5kEGp/KFnVIfvC/bDMdj0NZ9vQDcSxFF380pS3155ylMdZ3FKmDPBUW1heSEyxmHz0wfjOOkIOy6IKxMrsJ5U2D2bAWkcCYBJ9kKu5UgkeKcv6VKvAxGek/1Z3cFmul9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfDxeVyiIMuBjd+8PvRR/S8uQtq/+RQYSjmK+x4Ga1M=;
 b=oZjWppIS3131rzwFfHJKXG60/Q3w2hcburq2w+aJVUS3i6pLhaC8iKJ1u0zoBUL1Gnx+tw6NLBM57+LyaIPEsTFJ0lx+ADmDY4mzqD1G3K4GCHDwWwW0qTzhv0Tyum9rifUzhVFj1zQwKTbAh2Kji0R+hlv3t83h5Wl2d83AdgM=
Received: from DSSP220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:3d3::18) by
 DS0PR12MB8320.namprd12.prod.outlook.com (2603:10b6:8:f8::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.13; Fri, 17 Jul 2026 16:21:22 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:8:3d3:cafe::2b) by DSSP220CA0006.outlook.office365.com
 (2603:10b6:8:3d3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 16:21:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 16:21:19 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 17 Jul
 2026 11:21:18 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, open list
	<linux-kernel@vger.kernel.org>, "open list:X86 PLATFORM DRIVERS"
	<platform-driver-x86@vger.kernel.org>, Mario Limonciello
	<mario.limonciello@amd.com>, Francis De Brabandere <francisdb@gmail.com>
Subject: [PATCH 3/4] platform/x86/amd/pmc: Do not fail probe when STB init fails
Date: Fri, 17 Jul 2026 11:20:22 -0500
Message-ID: <20260717162023.956346-4-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717162023.956346-1-mario.limonciello@amd.com>
References: <20260717162023.956346-1-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|DS0PR12MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: c7648a86-e5fa-4ecb-9cc2-08dee41f6f8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|18002099003|22082099003|3023799007|13003099007|10067099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	nRCmAmYZkNJMFhw5spCzSihlb1AZvA5h97ggHURLS3TqO+PBRxP6ERC3usqexnL2F01F7P1zmXkwvlPPB0UtW37s7W2zDMPHTKMRrC/tHFI8sMvTv9Kj7kA8Fb/X65kJefN9usIFoYtJVMkXheM04YbHgBHYarON+BiNKqAlQgsuXlz2vBfAhv2EmN0bmiuUeT96Wi8hG56nTcddPJ4EtEQTjhpNortW+JMVqbAeWPPW8yCGgyyhbDcMwdCCzgt5G32bkCWLBkeSjJ6jGOLeKwiwTMjavs3rtr9jU+CDtSl9pTb8QdlhygTiSgCtmKKByjdqGJtGHo8P8h5GChN71x+6h1nn41LC+BO/jZrbgU4dV2+SOUYY0n2cNq6Uep2qO0T1iHCg8Fa4TGUcNl/r98KUCjlaxWdK1Vm2oS/tHr6ohoMb7JW5fBsXLTUdFC1QUinBLktwuGfWINWnmIqDERlM4NcDX33gTk7wEpPuiWei7pq9iRPkaFX8onuOVZUw6nOCVEw2tWk2XmgR4wSBpUViMgdBw210qEkttliZmIOy6XN4LUqj7ZeCt6+I1FrS7XnMqXzU+5jwS9BcCd+nvbTCfVekTyJ+fX4MtwoL1YxJHQCRqf8PU7zDHnN9+9I6QLCZe6LaelqWWOUWW4ihcR/D8u4phaL2Pl6xyxNugEdXVR3k7Iii/DZB6ufqv5yTOnm0FapdJMwNUlB0h/nu+g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(3023799007)(13003099007)(10067099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0ws48aCGfMvfp1Rfrq800l+7FjvBdaEVryu0Qb9rfL4x9XMvoc0OHWwapyhVXlVoItTZ1F6j3acK1EUTs4k+Pk0Dzu41a6O7tRVEHqw+v0OLtSdDiXoaIaIEP2yGU4f9R2Bq5raVTD7qTx3bZmpswlaohqAQK8GKSkPbmGv10lxXOpXdisi7iQSVxdkkRddlJDhcs7PHE2X+mU4pk1HBH2Rhn52YUxLj6NRaPzZY2PTtpllM5fT9ygUcM9ZRiwjnWEY/cU46DGeCb8f4vkKax7SkChCaXG8qrYFeHWDgDxBzz8a+9XQphDc4xZ1f0xSzwVC5vfIbweo40BW7Xpn3Fw5Jnmt26/JW73UP0m0E5qBSl24bYWOsvhYznjgt2vx+SB4a/00+APRn4900PkN1mdC4oV8aiamaAZBOBNTiBF3lz8ALcGs+lrMzo8dmF2HI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 16:21:19.8942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7648a86-e5fa-4ecb-9cc2-08dee41f6f8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8320

STB (Spill to DRAM) is an optional debugging facility that is only
enabled through the enable_stb module parameter.  On some platforms the
SMU refuses the S2D setup outright, and on long-running systems the large
telemetry region can fail to ioremap.  In either case amd_stb_s2d_init()
returns an error and, because probe treated that as fatal, the entire
PMC driver failed to load - silently disabling s0i3 support even though
STB is only a debug aid.

Downgrade the failure to a warning and continue probing so that s0i3
support via the LPS0 handler no longer depends on an optional debug
feature.

Since probe no longer aborts on this path, the LPS0 and debugfs
unwinding added by the earlier fix in this series becomes unreachable
and is removed.

Assisted-by: Claude:opus
Reported-by: Francis De Brabandere <francisdb@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221759
Tested-by: Francis De Brabandere <francisdb@gmail.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 630a664bdd2f4..5b6c90abd4e5f 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -917,19 +917,24 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	}
 
 	amd_pmc_dbgfs_register(dev);
+
+	/*
+	 * STB is an optional debugging facility, only enabled via the
+	 * enable_stb module parameter.  A failure to initialize it (e.g. the
+	 * SMU refusing the request, or the telemetry region failing to map)
+	 * must not prevent the rest of the driver - most importantly the s0i3
+	 * LPS0 handler - from working, so treat it as non-fatal.
+	 */
 	err = amd_stb_s2d_init(dev);
 	if (err)
-		goto err_dbgfs_unregister;
+		dev_warn(dev->dev, "STB initialization failed (%d), continuing without STB support\n",
+			 err);
 
 	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
 		amd_mp2_stb_init(dev);
 	pm_report_max_hw_sleep(U64_MAX);
 	return 0;
 
-err_dbgfs_unregister:
-	amd_pmc_dbgfs_unregister(dev);
-	if (IS_ENABLED(CONFIG_SUSPEND))
-		acpi_unregister_lps0_dev(&amd_pmc_s2idle_dev_ops);
 err_pci_dev_put:
 	pci_dev_put(rdev);
 	return err;
-- 
2.43.0

