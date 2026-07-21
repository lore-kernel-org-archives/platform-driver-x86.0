Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012031.outbound.protection.outlook.com [40.107.200.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E33146EC6A;
	Tue, 21 Jul 2026 18:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657905; cv=fail; b=q1vEDl9UdT8Sdb4QLvRjhJC8icWnVyihCl2w1IZGPyAahBYgD2ZudRqPpKpSeJLEEGuod2lGQs3n9kyrTY6fZiWOwjlg4KUR3qQWECWI3enLIItN3qh+f71fR4As3WrZoX0XCYD3KjnKTyrDGWS8hd+SRNOXrDEopqIYqB4NWvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657905; c=relaxed/simple;
	bh=StbO4t8ZwbEYRfSVqONvpDcEsgJQOEElS6lNn1YkzQM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oKuM9iJf8Y5zQaeooviAL+j7caehbqoEp7/4dBfEiyO101iIuwhmBo7NqWdjgS63KBe95dIIWxjkXDL0bnFXhyYLEhED1yVF4sRZ0K2BRVeSLXaNjhnuxhltGwALYyO/kg+clOIcXcEW3l63UKQgWSbegupxjq2011D3ZappEUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eDbIgpc3; arc=fail smtp.client-ip=40.107.200.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eDbIgpc3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFi+CjWi8tudcyPbRLpybNC3aBFp2r5B44xci6/BchKiX27ht9SSzlLz8hTQu2eSPkUjOiN2uZTiXhLAQd/iUDClKX3TEuaeQj5tvh2pucmjKw55QyxNkFadSuCmx6twOlZgP5IdWoX/sodbmvn86aDYHGg8XkERdlzlXmK/ooWKglEC9G2fZiex2DRlwTM8L82mzIjrYi1CoWb6vTy9POhoYsw4WBs/rUir7+6zAISALBvN3oTdrCAjgs0engJFpUsVO3iHt2WEVaLG/fIwzhtbNQV1fawq8QprnCuUZ7CT9gHn6V533pmJ930If998JGbM/Gd/bMCZLORl/elQjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qoJU1NlY+ExnmIjiErOdmDMQrGhdQBLH5XVxsJloTc=;
 b=lZgDHHYvR27HuwltEjfUEyAcQ8tvowl+34z7jxND4PXPcGvAK9rOG65YAV4MuJVSctUL+C9i1TW9hzXnSdmJS0aT3EZw5dGh5dI7kawDWZBC1f0uiiWaZ5tzhiZ6N63fOpN9OCnHFkbLmZkrtKeROILefA4va1r27a5VZXFobD3FhVI79fH8uaExW2YGpWLQnte7MF1rynAs19djDYCInZZjf6sKMrftiSeSGFGoMqawoUNi5/lxB48f7ZycmyUBwyTF/wNF5X2omfa3JwSd4GEOikggFgAn7N2Bu+ELyzcorThLS4AUPOEq1CSRoKqIPcbUxSjbVLCjQGQCCnS+Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qoJU1NlY+ExnmIjiErOdmDMQrGhdQBLH5XVxsJloTc=;
 b=eDbIgpc3fmRc1kqF/WhFjFTuvYy7bzht9VgB0tBgz4YENeSYeizK0YlLfqjolETOLOLcG0yQvwW8T+ZEChSNxk+8jHouWwqo9DwxJMP6tOY0KNGPp5GyeIzaf0sr/5amh//Jl5CqdK+uxgZO9QREsjiDXAaBMvA0mn8jddJb6dc=
Received: from SJ0PR03CA0273.namprd03.prod.outlook.com (2603:10b6:a03:39e::8)
 by CY5PR12MB6323.namprd12.prod.outlook.com (2603:10b6:930:20::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 18:18:20 +0000
Received: from MWH0EPF000C6189.namprd02.prod.outlook.com
 (2603:10b6:a03:39e:cafe::1e) by SJ0PR03CA0273.outlook.office365.com
 (2603:10b6:a03:39e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 18:18:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6189.mail.protection.outlook.com (10.167.249.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 18:18:19 +0000
Received: from aus0006770c4n-lx01.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Tue, 21 Jul 2026 13:18:07 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, open list
	<linux-kernel@vger.kernel.org>, "open list:X86 PLATFORM DRIVERS"
	<platform-driver-x86@vger.kernel.org>, Mario Limonciello
	<mario.limonciello@amd.com>, Francis De Brabandere <francisdb@gmail.com>
Subject: [PATCH v2 6/6] platform/x86/amd/pmc: Do not fail probe when STB init fails
Date: Tue, 21 Jul 2026 13:17:56 -0500
Message-ID: <20260721181756.143084-7-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721181756.143084-1-mario.limonciello@amd.com>
References: <20260721181756.143084-1-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6189:EE_|CY5PR12MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b72830-dab3-4f8f-4f60-08dee7547156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|13003099007|22082099003|18002099003|10067099003|11063799006|56012099006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	XsHT/4TDXOm+53EJDOKpYP+kx9NfMgG/FSDSEEelsYxdLSlR0U1wjS4W2IS5HoTH7RUOfP9wrgfa8b/HcMHvr0nrRtrFQqIxcMmhYo7MECwcQCBg47gNRMceJGKE8Z7raCILdhTEAhi1hIjvoS+Urw54Kih13TADXOKPNt8WKPJ0gDrTs7jhb+vFgvlPMwL5QL+2PYJ/6UpCaWGSQ0Ic8z+XUwHAtSvV3aQC1C5FdINZl36vLfAr1cEty42ZOZS4YMol+coJtMAcT5v2iq/YFHNUEZg5KKLOsB6mOZBHmIMq1u6Ge1ca76JVAxrypXz2Jkaa0GVEu0iWWrLc+6urV26APqSNrMiUqLtg4BgvLFOnDPJWsa0iLKhWFYEr9FzcLhUOsqNgt4Hyb5VRp/i96GEAsEcQuxTotQTmXXRbtImiDpXQ6s91dyzoJACgODXrYoYlvoU0ey8ieRlC7Jl3EEcsZ/zMiUSWhWW7s0QsYG6xgrQAkDdnBoQrfJ1tXlBWY/eA8mnqGp2zPoUq96XEQRwhgv8sDfZi5PuoCgzgichBxyuffNQdaBwnnhwTLf4I0ynINtoU7ZGHcpiYdtw2t/0JPPAtoWcawLav3OcZJBz9F3n9eENfPnJVuSJB0KSvDPDyVldbIttki6r+a/XyPxZnBVmbXrp95Ss/8jqRh0loJxAgP1pOb2ZnRWkx8002jxHxDlK0cZ+HU6e0Ksv53Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(13003099007)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gUV909kBC6QWc36Mx5whMtzfX25D+XnIyPNCDT7jnvP/SQ/zTxirHu2CVr7I2/2daP7NdZ/TKg9Cxsdw3uVlrco+Csk6nEK5n2vgM5yZN/neZOdW1uL+ppOn+TPbSL8q/DqEdcyYipsuyO6DjnrSMbWFpnj1N5r8Zr0ziCZ3MVH0jEt2RutVXxqJE1ZtaKuHSl3HbEog6v/FajVLv+r5HZ1rm69KcJOgSHaBtRs3kPmcZIO2LUePzP7EpkyP8a1BlqYzcNgYR+NCxzsFlTPO2CLE11UffD2iOTjUojYRNRtbZHaaQY8MxvwceGj1Gnb7I/Ys9YcOHe1p5MxJ6pwC2jiNxJ8MFJMJhnuOVpfmn4Pv9HWm2bVIjTKQEzEojZyoHpZNSHqcBborMSlU0P61SIYuSgjgFyGYkTB8ACHF4fDi8ipLffdgHExA77zO9E7/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 18:18:19.7122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b72830-dab3-4f8f-4f60-08dee7547156
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6189.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6323

STB (Spill to DRAM) is an optional debugging facility that is only enabled
through the enable_stb module parameter.  On some platforms the SMU refuses
the S2D setup outright, and on long-running systems the large telemetry
region can fail to ioremap.  In either case amd_stb_s2d_init() returns an
error and, because probe treated that as fatal, the entire PMC driver
failed to load - silently disabling s0i3 support even though STB is only a
debug aid.

Downgrade the failure to a warning and continue probing so that s0i3
support via the LPS0 handler no longer depends on an optional debug
feature.

Since probe no longer aborts on this path, the LPS0 and debugfs unwinding
added by the earlier fix in this series becomes unreachable and is removed.

Reported-by: Francis De Brabandere <francisdb@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221759
Tested-by: Francis De Brabandere <francisdb@gmail.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 630a664bdd2f4..0e013402c1c65 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -917,19 +917,22 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	}
 
 	amd_pmc_dbgfs_register(dev);
+
+	/*
+	 * STB is an optional debug facility (enable_stb); a failure to set it
+	 * up must not stop the rest of the driver - most importantly the s0i3
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

