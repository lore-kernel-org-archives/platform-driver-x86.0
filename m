Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2061.outbound.protection.outlook.com [40.107.101.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682C415B999
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Aug 2024 06:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724911634; cv=fail; b=LGPOsNgmoJSAwWdQEp/A8dRpROokPsRXrAA3A7cUUE7fAv2oZQESdZYbGZDX9E/WI6k3wICUyUIZ0Kyhuha03gUOmxyNObvQ/4U7/xylNeO77vBBEhrqc+03qS0dTzIrEK/rKuuXr3w2/aU7lrDbTTSBPLjUcTJChpnkGmxG8t4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724911634; c=relaxed/simple;
	bh=dWIyEIiPPzeGo0BWVJYwCBiJzgBd6NU6+bLSICaE3sg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ft4yYcwgBX6TOIgUjX+OJEybYSu57xsy2QTPvyYXZWMgN2+orUtiIc173MSqrTvtGbL8K8sR+naP6QlISx0YfY+WG5NQXIZGgjQ3HDhACjG4sUc+3q4D6WE+Q+dLBOimOGWRCeOB2cj1A4NZxAGGJgwi6QMcFye+iAPcbjzkSm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZTpy0qti; arc=fail smtp.client-ip=40.107.101.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZTpy0qti"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEz7j/vusy4sz3GY1buy+VN02Go3ca8xqMmCJF+mejsl8Zt7udDYddtjuWXZYbk3RYRzaQWfWPediqc6gwx4MOxiDL+V2W6bofWN8aeAN4mQgSCD5w+K6lKp9aZZeNjGm/gqAYLZ+sByuiYNvzNd03yGHVJk9T9LI0dB5w67swYj0UEO2Aqgw4w3sRYcSEJW0wX2hacTDXhI5wpW/45SHN1EmW8VAppGvdL9qUvkujrN+aFnSeoGonDlX5EpQj8J2UwCiSdmJQgW73uRW5cKnjiFqCT7KSk4E7bXD7cXKjNMAf/B4xf8BmF+jdZMa51QzoncNniUnJHrcMxP9O9Rtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RB1sVlAPf2E/jnV4Jq4ZPeg21A7x5SDLnCnFZPCcs8=;
 b=LMZWddqeF341i5JtJDtVZDMmqsdp+XnIsPDc0kwpSjXTYRem1KQvTVybmL+385uNlEAJ+qMd89arFxd+ht/d57r+0brnJlu5f4U02MOjojzP7UDIKkR6ncoLlBrajIsKUuTpHypt1iKvIFGBVyQwo+6hsEliQUTpEftoKOclyCdbxecZZmbVlr54/LJCKxsKtWDzIRQQ7FPz1yfr5n9vjHQ+BQEwVd9dz1g55WYwz8DCJQFtb55ArOgXL/YWyhsSuBGMh/vD+Vy11Lf+UgqwdX9AJD+fv0LWO7tQtYmorCKKtDUK7IJp8aq2ZQe99EleGwubacKBFtFn8C+ShXCRlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RB1sVlAPf2E/jnV4Jq4ZPeg21A7x5SDLnCnFZPCcs8=;
 b=ZTpy0qti+01zqyC06Qhi4G0SE7qW2U+AYR5ttkhmbZgkccy4g9Y842ZreU+kEUN3g4+sKOPgKx77dvqfa3VJ4/tG+8FBYgRrr5mc3azmMiAyaHlbeST9qBlRY7tUfrujAW6f852d5QYJqZMumSZ5mhsIAH19J/egtJ+2cbf+6wE=
Received: from BYAPR07CA0097.namprd07.prod.outlook.com (2603:10b6:a03:12b::38)
 by MN2PR12MB4127.namprd12.prod.outlook.com (2603:10b6:208:1d1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 29 Aug
 2024 06:07:06 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:a03:12b:cafe::d8) by BYAPR07CA0097.outlook.office365.com
 (2603:10b6:a03:12b::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27 via Frontend
 Transport; Thu, 29 Aug 2024 06:07:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 06:07:06 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 01:07:01 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v6 02/10] platform/x86/amd/hsmp: Create wrapper function init_acpi()
Date: Thu, 29 Aug 2024 06:05:59 +0000
Message-ID: <20240829060617.1548658-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829060617.1548658-1-suma.hegde@amd.com>
References: <20240829060617.1548658-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|MN2PR12MB4127:EE_
X-MS-Office365-Filtering-Correlation-Id: 122e457f-b95a-401a-de68-08dcc7f0cf50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2tHS0V0cGJSTEtlSFpTU1RZRFprTSsyRWRkc1NrZWtDTlA1bzVUQ08xekhF?=
 =?utf-8?B?NzV5eTRIWTlDMGVub295Q09RclU2WThDYm1nMW1ldmg4QWNLeE1jdmhJMU43?=
 =?utf-8?B?cXZXd2tuMmlpVlJjUnZ5aWQwYk1JVUNxeGJlUld5TTI3MWRUY21PQ0dOc3R0?=
 =?utf-8?B?YTU1NEZWcVRndzdkUFl5WjdPRC9oeWoxWW93WjgzZXNmS2J5dWhJRVpmMVpD?=
 =?utf-8?B?RWx3Z3RUL1VhZEFyZ1ZLWGZsTG5Lb2ZmNURVNG9IOUdxYVdYaE1CWThvNmpG?=
 =?utf-8?B?RHV4RndHK1BJSE80WER5L0VHWXlQd1l2cEpMZFVLVEs2cGR4ZkNTNkpUcEVY?=
 =?utf-8?B?bExkK0ZmcmpRb1c5dk5sa1BKMjFUOTNnY01JU1ovRTVpWEdqeDhyMGY2MVQ3?=
 =?utf-8?B?MWVyNGFramZMY2ZWb0QzS0k4YTFXWkl1YnZmeHE4ZUMybWswdHUwSDRrMUl2?=
 =?utf-8?B?Ums1bVltNGFLVWUrRHpBd3hUdE54Q2EreFVBb0NocXJMelBqZ1l4ODlKSHRT?=
 =?utf-8?B?V0RjZTdiMUh4dlVaSktjcEhCVDNabitheU5NTGNaUzB6eVFaMjVZL3dmOXFC?=
 =?utf-8?B?TGdvSmliMmhTSEgyT2pxTlR2Smxqc0JEWFVaYTlpTFphVkZWeXZvWGkyUjRM?=
 =?utf-8?B?ZnRqcEtMbXlpc051N0V3T3g5K1hYWXptM29uMUE5aE9xdjBhdnl2NzVPY3hF?=
 =?utf-8?B?aXRWSG1DQ0ZjZjIza1pPK2xzTlh3a2FKUXM3dWUvd1BiNndTVXgxSml1S2lT?=
 =?utf-8?B?bFJsN3RsVGpDVHJPVXRhT1NWZzZpR0Q4cVR3NnR3V3VXbmh3a09MN3YxZ2U1?=
 =?utf-8?B?VWoyZUF3ZDNSOFRTYnB6VHhRdXJRVnNLUFBLL05mR3hLT29welJtM0V2T2o4?=
 =?utf-8?B?WnYwWE5NSFgrZ3FIUVdQV2Z1YlMxVlN0WjI3S2dkK3ZYVVgrTVJzSGxlcy9y?=
 =?utf-8?B?TVJ5ZURjVnZDRTdObFJNdHE5ajE0eGJEWkhDWGhucWRsVFpGMFRudVBjOFZw?=
 =?utf-8?B?OCtnYWpUbnJZMm1EYmZIOW5WUUh2Y0QrVFErSndVMEMrd2JmVC9neTJYVWhM?=
 =?utf-8?B?eU5Bam9SU25hMzRVSmYyNVFtaXUxaVhoYldyOXB0V0gyZTFTOGRhRTBHYmg4?=
 =?utf-8?B?dlpmUkVwWkNGWWRPMmozSHlXR1dRK0Fab3ZuWjROUldnSHRsNnIvdU0zREoz?=
 =?utf-8?B?NkdyYXFUMVgybjlzbnA4S3krRUh5NWxyc1NmT0FOcmgwbVdFTnBIbHJVejRv?=
 =?utf-8?B?SE5KZWcwbFZ5dlU0c2UxZWFZa3NLcFBJYlFOemlpS3hOTWtCVkI0Nk9SOU0v?=
 =?utf-8?B?RjJ4bkQrbHFmanVCdnZUVEtJYzRySjZrdWpkRU1MU0xNc21idm93TGFiRGpP?=
 =?utf-8?B?T0UzRStHVm0xYmI4bDFJNlhtZndoZlFRdjVLek0zSmMxbGNqMTg4azBwdjVS?=
 =?utf-8?B?andIYTZaTHgyZWtreXV5TWZCMmczNWRNOFZCRktNYmc2SkdLcVNadjgzNEZy?=
 =?utf-8?B?K01UZ1dRTUNzZ2EyODFGd0I5eDVqSG81c2VUWkx4MUhVQXJoQnhrbml4Ykxh?=
 =?utf-8?B?Q0hROGJWMW0rQ3hzWThjVjhwT1R0M0VKQUFQemtPM3hQTGYvYnhYNlFXZVFv?=
 =?utf-8?B?Y2FSaUUvVE9ma2FCUmcwZ2plUDhJK09UeVErUUhxc2RSTCttUGNKWjFNTFFS?=
 =?utf-8?B?RWFnRVNReWFIWkR3cVRFQlR0R1RZRDNVWGEzc3NVemhjUGExUzFHZmE5cnQ3?=
 =?utf-8?B?NVVyUmhBelRmZHkvUEtCWEZhUHVDM1BqNVNjNzZoWENxcjJFR0pKSHFRV1BK?=
 =?utf-8?B?RVhWZHU3bDBQTlp3U3RERUtDUFhPbWF6Y1dtenRMQ2lsMTk2L3RibjFnKzhT?=
 =?utf-8?B?enBzaFlkdktTcE9jd21FeDVyQ2tuc1NYWFdSMSs5aUxKTDBPRFlVcTVvZ0Z3?=
 =?utf-8?Q?tENn4SMR+5dqzPjhwp/Kx/NbiOUdcsB+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:07:06.0748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 122e457f-b95a-401a-de68-08dcc7f0cf50
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4127

This is in preparation to splitting ACPI and platform device drivers.
Having init_acpi() helps in smooth code movement.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v5:
None

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

