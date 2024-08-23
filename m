Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCD513C810
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Aug 2024 07:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724399771; cv=fail; b=JW5KVRwGwa5ol/OLUWRPxMXmrf0zUo3pnd4c8ib0ljC28yJxUfNOFtqqRqpJQrlkkHjhFFL7vDQbUhCpY90jDIRkxrRG/6KU3Wcmm80HSZ4n3w8AgcsPQLP+U/f73B5bY+xMt10spY7EUBfCJ2P0PNFodOVYcCKFE7mmM46mUA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724399771; c=relaxed/simple;
	bh=sDNqHyqZ+QbswgOrbYMf/BVyseHmDGAl8kjjQNDBOLY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rgr67tfgUGso+5ws0fcKl52cct+Vr150A8PS/4GzscXnwS2trQxih+zvqJZKPIyWEPWxmwGlNtdQgFJ6c5E8DzuH1KvvyVHryDwMYhHHAr+tZJwkORtWJ0txx1Vi8T6mxX7XUw+bkABQl0GzJkw4T8BsUHdTy3pwqlClag4wVJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rryHXydA; arc=fail smtp.client-ip=40.107.220.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rryHXydA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKtxfwynp6Iv+KMMwXBdvMX1SPkoSCyoquJyMn1Qh571fs80qI48TbgL5u6DvBaib1U5lv+165UmKSLg+lkbw6XR3pOdEgulnofBuBHFm6yM7wbc1nlH++EVrYM7SSiboHCUjo1eP6KitjVn212+smjL1ry9ZbndrEVzYdU2DHo3Hzwgf1k9O95UIoDu2EMHTFba9oTCtooiIsGpX0Q5vxSDBV2ECMUxKtiPfXy2ew4ZwaZ/x2dB/HTAEh4elwlnJODc0brCrBV5Itvo23lXqnyoFkjyrMGtiYZxqM71DRMAajY+QPgJaUcjb9UV7cblcvyLlMMZsiEADmdpjtYRdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMR4uJjdkN7pA3afr5j342LYsf4CTkhz9C0lJdjW3LY=;
 b=hIYPn8cE0vLnijdLwf0QpngWiQepGPiFJSXl7pz0zaOaK0z3mV+MMnzHBQXJ2jy1R5fcDYEW1mrSyI7HknkSQ4IZBW8qedfsXWBbLNkIddDfAOKw8EkN6tZ3Hud2xxpXCHBfss1tvUfy4zsuFk8PUilaDhvXe6r2jTRC1Y+VArV/Y5w5hTMSbN1+nzAZhe19lUreHIUaikpnpqMsXeNOqF8k2bbPM1ZqecyMMI8+eeqTTs60bx+HqmGZ6G9OAOcnosHI3rdsLSfPOOf5lDLkHfk+OpWVWRqDz3C9YL1jNKTj8g8neoXO9X6rRyx0Zi8Q5jOZK//JmAlWTP6q811bQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMR4uJjdkN7pA3afr5j342LYsf4CTkhz9C0lJdjW3LY=;
 b=rryHXydA55vvZmRURrd904oNE2Iq3prTKS96Rave4ihr5CS6vqIPTZZ5d/fchNHWnxsohVGs7g3Wr8dyZY4f8iOhIY1NoAJNg+Huzj6w1u0DfMBm+GZNVIIdIJ44D2a3NubUAMKv5lqq9oftX2mF2u18uNNugp6gTDLzSZlCDos=
Received: from SN6PR2101CA0026.namprd21.prod.outlook.com
 (2603:10b6:805:106::36) by SJ2PR12MB9006.namprd12.prod.outlook.com
 (2603:10b6:a03:540::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 23 Aug
 2024 07:56:06 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:805:106:cafe::2e) by SN6PR2101CA0026.outlook.office365.com
 (2603:10b6:805:106::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13 via Frontend
 Transport; Fri, 23 Aug 2024 07:56:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 07:56:06 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 02:56:03 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v5 02/11] platform/x86/amd/hsmp: Create wrapper function init_acpi()
Date: Fri, 23 Aug 2024 07:55:34 +0000
Message-ID: <20240823075543.884265-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240823075543.884265-1-suma.hegde@amd.com>
References: <20240823075543.884265-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|SJ2PR12MB9006:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d532c1a-7e03-4cdd-a567-08dcc3490adf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjZNaXYzT1RtL0pVNGNXVnRhNElqWG94cHNJVE9weitzRkRYUE5RdHZjK2Q1?=
 =?utf-8?B?TVczRXcyMFR2Z09VYzRQUmxFNjhnUERobTBtM25mSGJ3M1RQakljQkpGMkRm?=
 =?utf-8?B?ZXkrQ1UyclFwcWFmWXlYemJXelZUdVFGa3RxRVZqRklFUUlya3k5QVRJRUhz?=
 =?utf-8?B?UHVjQThMcWVZNlhWcklPeWdGZVFsaW54K3dKVXh6dW1ab3RMb1VXSjRVeGQx?=
 =?utf-8?B?T2g1WGFFT1NtbVJSSmxyL2ZISnhJa3RxT2UyVkw2T2JuME9Xc2xWcjNKb3Ni?=
 =?utf-8?B?S0VidEJCNzZzbVEzYkRpUTJuMnRPU1dRY3g5RzkvYnptMEprM3ZHZ2Y4K2NE?=
 =?utf-8?B?a1FmWXhBU0x5ZTIrNnk2b2RGUGpTTWZzVDMwSFhXWmFYMVJpK255MS9PSkNQ?=
 =?utf-8?B?RGJVemMzdkVtYUsxdk9OcGgxc1hKTVlnRVp3Nkc2emFYRzJ4Y0sxRlphUVhi?=
 =?utf-8?B?ajBjbjZzNUZyTW82OEt1WVpEYU5RK1ZGWldVcTNwZ29YRU5lRnhwdzRkSGVX?=
 =?utf-8?B?Vjl3cWJ6dWlPbVRocUc0eU94eUZka1Q4UHhpVVh5eUJDNzlGQUVMUi9kZERD?=
 =?utf-8?B?OHlDamNWREc1d3FTMlY3QkdFREI1RjduNUlpNkVTYWdJb0NBV1VTKzNLUS9F?=
 =?utf-8?B?Zkt5VjF2bkNBK09Tbk1EcVRsMEdpSWdYVUpFMW1LQ0w3bm5pb29hTFMrdkc1?=
 =?utf-8?B?Mzd4aXVPcXN0Z1lidWlha3hEMUJzaXN1S2Q3MjF6RHk1ckloQlhaQjRGRGVy?=
 =?utf-8?B?dUpXVlQ1Ymx2bDB4WGZnYklDU2pqZW4rMERnKzBMMlpFbE5Ndk1qMlpTRmYx?=
 =?utf-8?B?MnN1YVVLUTVjL1ljNXhrWTRsbUw4T3drcE56YkV1aTl0U3hPdUh0S0ZQRTZl?=
 =?utf-8?B?L0Z4aVY2cmMzWUhFOTRNaUhmN053aEFFbVZ4WnNwdGZ0K2RHOHNNRWprVEs0?=
 =?utf-8?B?dms5WU5qbEdKaGtpRGQwU0dpcEFwYi9PdTRSTUlTSkRPK0hqanEzdDlKLzhM?=
 =?utf-8?B?ZjczUGwrbThRUDdQZ0hmZ3VZT1RkSU5Xdi9LUGk3RDB1Wm5GY1lXSldOMXRw?=
 =?utf-8?B?d2hCcFJuMWx3Z1JSSWRySk1GNDQxWk9OQkdxSUJCMU1WWGhIKzc5ODRRWDFk?=
 =?utf-8?B?TnhJZlE2Z1JlSUhLZDVBT3h0MmdkUFVjdFk2NCtNNzd2b3BmajYyZzlnZzRn?=
 =?utf-8?B?MWVtTEtvN2ludXJZYWh0SklOdFNGdVFmYm1VUXBYQUF4Tmo4SCtXL3FQTFBG?=
 =?utf-8?B?OGFUV3l4N3lMdlZ3WENTU01sQ2dJaG4rVGlRcEdUejFHSG9adkFtenZoSE9w?=
 =?utf-8?B?VFozUGZXSm1HY09yRFljT2JScnpKcFBNa1ZDVTNRd0ZwcVp1MkdBNzUvNmNG?=
 =?utf-8?B?d1d6UGlMMnlNbDI1Zk80OTBzcDJEL0hmMXhGb0UvdTZZOEFIc3p6amxpcU5T?=
 =?utf-8?B?ZENwTnlxSmR2eHAyVnhJSjJQVG1lL3RmYSt6eStJRkR5QlRMY1hJeEZxRWFo?=
 =?utf-8?B?OVl1aDFhWjhPc3RCdTk3cTAxcFExeWdzTm9RYm1HdzdENUFCUUZEL2QzY05r?=
 =?utf-8?B?eE91QlBPeGVDdzd0SzNWMmNYcUl0SVRNSG55UFI1dExkN0ZYdlhMeERsS0dl?=
 =?utf-8?B?MEJwS1k2NnJNdlBEYU5RbjFleFlYaDZqSk42WEtDZ1VQU0NGV1k3RDdldjFu?=
 =?utf-8?B?aUlJTi9zbitPVnlMQVlWUTVsREJlRTVQbFMxU3hUQmpPUzdORkpBZGlGVldG?=
 =?utf-8?B?SmNlWFNYVFJMOHhZU0FPdzBNdmVJZ3ExdnBtYWxDSGxMZGJCNktpZWtGSXp3?=
 =?utf-8?B?SjZDcVZnR2pUU1g3Z2IrNVp1US9ISzRIN2duQ3plZU8ydTQ1MFdsdWk0SFU1?=
 =?utf-8?B?eXRMZkEyT2RvQVYzVWo3L2ltOStjV3B5RlF5NkxJNG01OEpIb2JSZ0FjaDZh?=
 =?utf-8?Q?sUzfHsQLvbt+3sYxbdjI19QGi5eUtKF+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 07:56:06.1288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d532c1a-7e03-4cdd-a567-08dcc3490adf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9006

This is in preparation to splitting ACPI and platform device drivers.
Having init_acpi() helps in smooth code movement.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v4:
None

Changes since v3:
None

Changes since v2:
None

Changes since v1:
Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>"

 drivers/platform/x86/amd/hsmp/hsmp.c | 91 ++++++++++++++++++----------
 1 file changed, 59 insertions(+), 32 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 8fcf38eed7f0..10ab9b2437f1 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -778,6 +778,11 @@ static int init_platform_device(struct device *dev)
 			dev_err(dev, "Is HSMP disabled in BIOS ?\n");
 			return ret;
 		}
+		ret = hsmp_cache_proto_ver(i);
+		if (ret) {
+			dev_err(dev, "Failed to read HSMP protocol version\n");
+			return ret;
+		}
 	}
 
 	return 0;
@@ -789,10 +794,53 @@ static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
 
+static bool check_acpi_support(struct device *dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids))
+		return true;
+
+	return false;
+}
+
+static int init_acpi(struct device *dev)
+{
+	u16 sock_ind;
+	int ret;
+
+	ret = hsmp_get_uid(dev, &sock_ind);
+	if (ret)
+		return ret;
+	if (sock_ind >= plat_dev.num_sockets)
+		return -EINVAL;
+
+	ret = hsmp_parse_acpi_table(dev, sock_ind);
+	if (ret) {
+		dev_err(dev, "Failed to parse ACPI table\n");
+		return ret;
+	}
+
+	/* Test the hsmp interface */
+	ret = hsmp_test(sock_ind, 0xDEADBEEF);
+	if (ret) {
+		dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
+			boot_cpu_data.x86, boot_cpu_data.x86_model);
+		dev_err(dev, "Is HSMP disabled in BIOS ?\n");
+		return ret;
+	}
+
+	ret = hsmp_cache_proto_ver(sock_ind);
+	if (ret) {
+		dev_err(dev, "Failed to read HSMP protocol version\n");
+		return ret;
+	}
+
+	return ret;
+}
+
 static int hsmp_pltdrv_probe(struct platform_device *pdev)
 {
-	struct acpi_device *adev;
-	u16 sock_ind = 0;
 	int ret;
 
 	/*
@@ -809,46 +857,25 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 		if (!plat_dev.sock)
 			return -ENOMEM;
 	}
-	adev = ACPI_COMPANION(&pdev->dev);
-	if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids)) {
-		ret = hsmp_get_uid(&pdev->dev, &sock_ind);
-		if (ret)
-			return ret;
-		if (sock_ind >= plat_dev.num_sockets)
-			return -EINVAL;
-		ret = hsmp_parse_acpi_table(&pdev->dev, sock_ind);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to parse ACPI table\n");
-			return ret;
-		}
-		/* Test the hsmp interface */
-		ret = hsmp_test(sock_ind, 0xDEADBEEF);
+	if (check_acpi_support(&pdev->dev)) {
+		ret = init_acpi(&pdev->dev);
 		if (ret) {
-			dev_err(&pdev->dev, "HSMP test message failed on Fam:%x model:%x\n",
-				boot_cpu_data.x86, boot_cpu_data.x86_model);
-			dev_err(&pdev->dev, "Is HSMP disabled in BIOS ?\n");
+			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
 			return ret;
 		}
+		ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
+		if (ret)
+			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
 	} else {
 		ret = init_platform_device(&pdev->dev);
 		if (ret) {
 			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
 			return ret;
 		}
-	}
-
-	ret = hsmp_cache_proto_ver(sock_ind);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to read HSMP protocol version\n");
-		return ret;
-	}
-
-	if (plat_dev.is_acpi_device)
-		ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
-	else
 		ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
-	if (ret)
-		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
+		if (ret)
+			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
+	}
 
 	if (!plat_dev.is_probed) {
 		plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
-- 
2.25.1

