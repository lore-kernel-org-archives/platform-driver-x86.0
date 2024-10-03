Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE41A15383E
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 11:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727954142; cv=fail; b=Ftla8+QWK1f6Pbl24JKFRzYcHalN/gFBW11/YOc8I7t52Sc+HLu79QC+26tuehKvb+/r9AiaUcrDXLegKtIl8k13UquJU6ycyCGYwz7AX0aRqaxiV46hWUmGjdO0Qyk/MD4sMO7fnmXSCf9L8Oefjmkh/hAYnniLh2rTdB6cw8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727954142; c=relaxed/simple;
	bh=szhQGfBFAAK4yKyBEHFB21mpAvnVQ12TMHCgTbImRF0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sDcV92bIrenQuTnQK602UmWXG9p7WfoVh3lpy07/E7SS9XLIDx/+ULOLBMxqy9XmLJA0HASzglXCkZqG9Ab97xScWZV2Rl89QsvldIIS/A5JTg26/xec6pBptP5Ak0aGbLutXF6DAc71+r3cA5f9M5Wn58eUhdrd9yzR0c5xtoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Dt3VnS9Q; arc=fail smtp.client-ip=40.107.237.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Dt3VnS9Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NoYRwXNf/kM8f4waFsNgjE8wj6b4kdswYeRQBxmzeL1onPeKlCqhITUnYzAazj1E1LVEJB1DgrDHos2PKqm54hnc1A4FLOL4NYbCyzBLLoNiB6DwSVUobEDUsgNwTXcIYSs2kyVdqUXxpSVot/TJaZyanjbv57kUlGP4KxAk3EYEQLcPVsrSiy8I+nAVvLyI8dznV8iVyEkDaA7/z3xaHebJ440C0OrwPhHY9Blt/Yo51dVAfzr5k4TiYQoOM6krzvoLab0m5b1VLf66AEaMI6tbXzK32Cyg8m1DWSRWL2YVF+PmlWCFoLQuePdxGbCHxuM6MbwHon/Bh3ooRUxhzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwuX7Ne035RuNni5QpO6ADXkmvLKYY7b6Nze1zdRUX8=;
 b=iOI3MxEuQBvVVvdbLWEtZLVnf1LJK0P3uM4OlUQnt2Vd6hAA3cVwgmfo/cYkQwg2n7iXZ5kBD1KRv6Luc05zVSff3NgMXOOxAjtPiiRrzoC0CJhB+RJPQFsKjH7GcJOvbv8jyP8KwABqJqZAOdPw9mtpSbKoxQFH72Ih3NpemwvMZs42p1bH82hlXUZMaoiQ+l7ONcxVqdJxI+xp3Xujjcvd1mbg9CU6TsQEhwcqV8mRN2lytATevdSCGpGwKOpaVCrR7VrIg4P2V13EIvxyEDhsqhoY/NeKC3vHEi9GuQiske4HDlslAJMPItMgIdMnUS0JHh3p942n7TJo431Iag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwuX7Ne035RuNni5QpO6ADXkmvLKYY7b6Nze1zdRUX8=;
 b=Dt3VnS9Qky4O7WMPxbt29wAWSHfs5x76URT4i3ELBkcmkOofPieebsPEEmyMqU/3gRW17d+F1vkl2+lAMnW69+1wFN2GKqp/TRnqiOIupwOg8TMEMsKtvkC5Hcn/YOzMFg3HRRPgra5cMe1ShDyj5xFXmbZvwEmAWC5vVqGlz0c=
Received: from CH0PR03CA0282.namprd03.prod.outlook.com (2603:10b6:610:e6::17)
 by LV3PR12MB9258.namprd12.prod.outlook.com (2603:10b6:408:1bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 11:15:38 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::ba) by CH0PR03CA0282.outlook.office365.com
 (2603:10b6:610:e6::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.17 via Frontend
 Transport; Thu, 3 Oct 2024 11:15:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 11:15:37 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 06:15:35 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v9 02/11] platform/x86/amd/hsmp: Create wrapper function init_acpi()
Date: Thu, 3 Oct 2024 11:15:06 +0000
Message-ID: <20241003111515.2955700-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241003111515.2955700-1-suma.hegde@amd.com>
References: <20241003111515.2955700-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|LV3PR12MB9258:EE_
X-MS-Office365-Filtering-Correlation-Id: 2593a21f-f258-4284-0291-08dce39cb58e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVNNUEFnMXJuKzZ6ZjBVUkI0S001a28zdXJCTStQYXlzbmxIdG1nREljZ1Bi?=
 =?utf-8?B?VzBPRms3OUM5dHFUSnk2SlBlRzRucXZQSzdxZ2NJYmw1WWd1RXl1aENmcTRo?=
 =?utf-8?B?dVRuSmp6L3ZLZ25iMm9CdmtESHdyNHZwWkFkeDI5Y0lCTDczTmZTNUlhY0VQ?=
 =?utf-8?B?emw4R0Zwc0VONlh3TlNmZHo4dXIxTDZCeE1UREgxSWJwalhuSGFEeGtCaUQ2?=
 =?utf-8?B?TFNNSmZOckRWUmNhQmkwMkpvbWluSXAwallBSTRndnlNTHo2cEQyNkhBa0NV?=
 =?utf-8?B?Q1U3MmpNSENldkxRZDRqakZCRG9SV1hySG80KzZ5OTlkeEp4ZzJkdGRIdjRJ?=
 =?utf-8?B?aTFYc29FM3NLOWlpbzdyRmRDWkR2c2ovbVV6Sk9UcWFpM2FXWVBUeVpRZ0Nq?=
 =?utf-8?B?RTdDRkZEbDJNNElGNnVNckp4TEcvWW9ya3B5ZzRiWGdEeU1HeUtFSnpMQ1Fm?=
 =?utf-8?B?dENSOE9xdmJsdEh2a3c1U25XRC82MlZUcUFFM1hGcUhBa2xsbi9hQ3NnRWp2?=
 =?utf-8?B?SEduZngwNmNDSHBaVXlzVFFVTHhHWTlkMktVUkhYOHpZa0J4bElHcFJKbnUr?=
 =?utf-8?B?WlZ1OGhzTFMvcmlXaVAwZm1pK2s1ZE5udGZuSDB3RERBekFoLzlDV0N5Tmhj?=
 =?utf-8?B?ZUxCbmNPcjdCb3BKRTl6K2hxOHk0amIrR2RxMHo3NDYvWm84T0d3SVRkM2dp?=
 =?utf-8?B?U29MM3NDODBjU2Z2ZlRxQjNkdzltalBUQ2ZGSFZWSGI0MStGRytRWlV2elU1?=
 =?utf-8?B?TDJzTTdaUW52eGE2cXFFVEdCb3AyZ0RPbGZsQ1lDSHZMQVN3Rng4TE1DTW00?=
 =?utf-8?B?SHFTVWVGN2ZFR2FBcm9yK0tLRFgwUWJNUFl3Qm81bFc5VmZGWU0vL2ZjcjIv?=
 =?utf-8?B?bnE1VjIyNlJSQytkeW1NMVNuWXMwQUZLSEhlcmhrdnErSWN6OGZCS2MrVmVF?=
 =?utf-8?B?MGRqS0g4Tnc1OVh3c2o0aWRJZEZzZkZORWR5bnRFcmdIVFo0a3Z6TU9XclRS?=
 =?utf-8?B?Y3NpRFdFVU1Ccm4xWFZ1NnBJRTY5STJncGxnMWhjODlrMmcrMm9veWxyUzFW?=
 =?utf-8?B?eHJaTVpxVlp2aGdJa2NHWUVjdnhwckVGUWtuQzRhcnpqakpESjhTOUdObXds?=
 =?utf-8?B?Z0RLUUh1eUxCTmpuVEIrWGlnMHNnK2lTbEE2bmJ5clZyYlJOUDAwQjVqbDU2?=
 =?utf-8?B?a0xTdnEweDY4RElabjNiWkJKWG1sdUpyUUF6SmI2Sy83NGFsOFFkS0xPT1Js?=
 =?utf-8?B?eHBWZTBvelBYZVhpUVluSkQ3MDMrcERtTmNFVTJjMnluem9JVmpIRVJ4R1Ra?=
 =?utf-8?B?S2lrRHpCamZXMTZ4Y0RzNlJFK0pLL1U0OURucjM1L2RHTm1sdXV3KzhPTllS?=
 =?utf-8?B?UXBiUXFNUWVrZHBXZXU0NnZzNnhiTTRENVdJbTlXYXZXL3Q4ck5Va2hIUU4y?=
 =?utf-8?B?ckk4Q2w3RDduV3Rrb2g0VkFYaWVvaElMVTQ3cUt6djNicmZ4Y0htMFpVZlFV?=
 =?utf-8?B?Y0Zncm1zYzllREFJb3IxeVc5ZW1mb29nc0lkWEhxdUZMRnMzUzgvRFhuZVZr?=
 =?utf-8?B?NWV1Z09vUEE3V3lvNXBvYzAxb2lZQXdrNUZtOGZKRE5mT3crWjUvZHJyeEc1?=
 =?utf-8?B?cEtKRzdDaGJDSkY3aFJkdkw0aFVMZVg1eFcvMnZvV3BFY1NWWlFlakVLTnRU?=
 =?utf-8?B?Tlg2S21DdGRuNlNrckk5TzQzb25qQld6blpwTUYvSVRBUk4vNUFsNXl3OGp0?=
 =?utf-8?B?ZjMvWjZ4VjFCSWR0d3BkbzhoanVBd0VrTk9oTStRdlkrcy9yYnU0dVhtNUVK?=
 =?utf-8?B?U3RvOHJHWUk0UXlpYTJWb0QzVWtwNmF2UG9zS3U0NFVVaGZBaFpkRlBxOWN2?=
 =?utf-8?Q?mU6BXocJmgQFz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 11:15:37.9060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2593a21f-f258-4284-0291-08dce39cb58e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9258

This is in preparation to splitting ACPI and platform device drivers.
Having init_acpi() helps in smooth code movement.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v8:
None

Changes since v7:
None

Changes since v6:
None

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

