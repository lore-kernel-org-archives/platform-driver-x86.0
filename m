Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C06314B978
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 07:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720683223; cv=fail; b=oMte4Uss0hzY20O1cyuh93gvmfITQ88875FF4T4ZxZNHPVcBLeXcwNar0ODPc3IZuL1FB5uH6Kh6lMQnfGy5VVPSRtihiTN3zO6VmDEtjlKDTW1ldugo+ozBPV7dtSnjoOr88WYyb93/wEoBRwn43eJFbMPcPWYH8s7qt4/gmJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720683223; c=relaxed/simple;
	bh=TFv5Y03eXRapwLxvXhe46TkvZsVApwtxP0n2vIABWS8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xyz9VQJPDNxCvuppJA3ddSfMU99VebddjFJkw/Iwu+MkLZLXTyw3qAu4RE0B/ZvddrcmlvHfkKYvxG/O0+4Cgjlr9dXKPjMLSnVSMG9dIbbuBsWRjKFUMIy98YeRbPzdU29ybT2OH5iAbKGqqz/SETMuanDm2WKdGQM/7Y+UGJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Co/+JXv3; arc=fail smtp.client-ip=40.107.94.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Co/+JXv3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6uHh86w2/0Fgiw7sjHRl7ptJj6Fb4HNVY0tkRjWqKpHIz1i8Uz0d0agXWaHg7cnuvOYlsi3RixvFETNk0eol0wAeVf3CR3EQS1brWmCBxqe2dfppxnIoUulidO2Jw4aAhi2MzMF+89I8xiGgrzR2mhZ3dcHc6qImvgUUCr+p/gEq1YlHay5ciRzsMWPE2wTVkDTMa00B8JaYfSzxNlnyO6wj19wtJyxb0GFmcG9bLP0zY7Q1RGCqJ3RQo+Ec5lBqnhsxQVlqG9R62MpsvAnHys/1B8le3hsvnPGOx1GXjsz2C7cBX44wbkZm3KybK29PbrFmTZVhttc6XEXpQdfOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sp7oHV0Dwmi3+5Ac/9pJYTml25UB/nZdCmKaocxSKMA=;
 b=rOMEylKkSXodJi+oqsuov0o76xPXY0k+up6coqt+nT9kAZ9o/VlQVWJEavsQQhVrpDn5SMil1OXHZtM7QJiK9hWmkD8cXCbdxkBwAm+k6zJCp5tYvRFZNK008TTp+YopMW9srhqRAlHrZ9EsvUuwt7mH1h93z0lAfVddxqZEZtlRcFsJ/uRyd7PEUlCZFcCUM3DM/f8BDhWAgDgOyIwtKb2NRL3GokQCA8N4sFB+0I8c7fSHBHfOz35AR3a8jUx9mHcBy0Lzy+TstEQtrZAjTsBmY2EIvXqkvAtfl0vYg06nePsc65RSDcoare07R37D2ej+mk44H50UgU7qvpgy6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sp7oHV0Dwmi3+5Ac/9pJYTml25UB/nZdCmKaocxSKMA=;
 b=Co/+JXv30HwKYb9vp1pOUp7nRzLwlErJtZMkogYtH5bIhSpNpWf5FFnP6R50YOBxpLX8ykzY2To9vfmJ/Ne1jRMHXmT760yCi5sg5yrcatiwZolFDORWS8ziPQ7q3VtussJHIACKkk5Zo00ixyW7iceww2Eshkm7aG77cBXpC90=
Received: from BL0PR01CA0023.prod.exchangelabs.com (2603:10b6:208:71::36) by
 SN7PR12MB7347.namprd12.prod.outlook.com (2603:10b6:806:29a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 07:33:39 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:71:cafe::76) by BL0PR01CA0023.outlook.office365.com
 (2603:10b6:208:71::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Thu, 11 Jul 2024 07:33:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 07:33:39 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Jul
 2024 02:33:36 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v2 02/11] platform/x86/amd/hsmp: Create wrapper function init_acpi()
Date: Thu, 11 Jul 2024 07:33:05 +0000
Message-ID: <20240711073314.2704871-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711073314.2704871-1-suma.hegde@amd.com>
References: <20240711073314.2704871-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|SN7PR12MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: b851cfd6-df34-46f2-7d13-08dca17bc83c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2VDTUxzdmgzQmNjZjBtYXRxcE5GMTcyMFdVbTIxbEcvWjNKRkNNa0wyT051?=
 =?utf-8?B?UW91NXNMcVZUbjRhaGpmV1Z0TVovR1ZGOWZ2YzlDT0QzWVViMW1zRWg4ZExm?=
 =?utf-8?B?aTNHSmFTUXNFQk5jK29ISGVvV29mbHVWVlVmaVVLejFkbTQrUlNaVG5NQlpM?=
 =?utf-8?B?YmpObWxNM1pCVFRaTEV5SkgzU212N2JRazlGbTl2aFBkOThZNzUzUWxaTGNu?=
 =?utf-8?B?bm9NZ2pVSkQ0Zkt6QjNKcjdwVDdjQzI3MFlEUHRlNSs1eG50TmJDeERRaytK?=
 =?utf-8?B?TFlLUE1Lb1Nob1VkN080L3pBMTM2NlRLTEp2U3F1VmZvSG9vcU1RWDNaMVpq?=
 =?utf-8?B?cUFHUWJtZW1zdElRVXo3cFhEdGdwSnUzc1ZpQklnUGppT0dpL0crU2sxMEFP?=
 =?utf-8?B?bVd2WDBManRQQnQ1ODFTYk1IL2dxSW9TUnJUVmo2dWtSZkMwWmh0K1NuRzMv?=
 =?utf-8?B?Q1J5bzgzY2NYM3NEMkJuWmFqMjhNa0RKTExoQ0I0Z01jWW5za0FOV1lHSVpG?=
 =?utf-8?B?ZExjcXFsRUFUOVVCelBZT01NSElSTzI3czdGZGF0TzUyb2d6ZTMrcFNCQXdD?=
 =?utf-8?B?ckNyRDBZWTl0eW04OWpsaTZXaVMxRXJRK3R2T041M0M3bXUvUzFpMUJuTFZ3?=
 =?utf-8?B?bHRuRFA3cCtYMXlRY1lqQVc5VGU1OTNTeE5NWjFiQ1c2KzBTNW1IaGh5YnRB?=
 =?utf-8?B?Zlg3N2ErQUVmS3V4WjRHOUthcEFSVmlabmpRUnl5MjFiTmtON2Z5Y2JVWmRU?=
 =?utf-8?B?bHJXZE54NVgzOHlJRzljSjRGbERyKzF3ZENZU2FrcG9GcGhGZVJUTWQ1b3BU?=
 =?utf-8?B?UlQxSUc0SUIyRkFWcHZya0RvTXNYNkRtK3ZpT2J2a2RFQnYyMG02d250cDlM?=
 =?utf-8?B?dmVjT0tGODFYQ1lHL25JKzFURnRibGVrZm56MmpXRHpadWxsRmxzUHh5TTV1?=
 =?utf-8?B?Ujd2Z0RpMW9OOVBMRjMvc2NjNDVpS2YycG80RWx2MG1mTTdOR1FEUXNKNndM?=
 =?utf-8?B?bWZGMUV6d05HS1pNbzJpbUFNbnU5anp1ODBZNjZ4WUlOcC9yeUJDWTRLd0xZ?=
 =?utf-8?B?cWhxcHhzeUhIcHh4ZHd5UE91RVRxbWJCZHJZdnlsaXZjYTRwL1lYVGN3Y3c4?=
 =?utf-8?B?NXo4U1NVa3QxNVR0YVJDR3BibFp0YzIrR2ZYMzQwSm9oWXY1Y0FzeXVkeC8y?=
 =?utf-8?B?Kzh1dVVyWnhFb0dTKzhsN2tySkF1Zm14VFo4M0FqSU4wSFBuR0JkS3VsQWp2?=
 =?utf-8?B?S1B0aENMT3kxQVhtVHU3WGxlbWNqTUVwaVJnSFgwYWJqQnR1U3ZmaTJxT0tB?=
 =?utf-8?B?Tzh3Nllabm94YmxnajhEUGlqcTkwa1ZidzRSckxCcFhoWCtiUDN2alZFTHBP?=
 =?utf-8?B?dUcrbUVDazV5NXNvQmh2cTFmdkk5MEhldFJUOGsxQWttMC9MWjhOMzRmZk1n?=
 =?utf-8?B?NnZWc0N1Z2h5SzhFOXNRUzR3amdGR0hYcVhrbmdxKy8wemF2WXBrUnZEYS9s?=
 =?utf-8?B?amd3SlZUZnhST1h0R09XOUxPajA2NzRzVTNOMjNZWS83UUtzNk5SdktMOTZt?=
 =?utf-8?B?NVBNRWFoT2NUaGRyUW5wR3V1ZFhqeTlNUTJ2RGV6b2s3NkEzaDVER1BlNXNm?=
 =?utf-8?B?L1h0UXY2cExXVStZSHp6aEh3NnpOeE1tRUVpV25IN1BaRWZOUFhlZGZPZ01z?=
 =?utf-8?B?UDZWTkFxanQ4aitQSnUzL3ZLTXkvKzZ4KzM4b0lZa0w3N2pWUm12YXpyaFYx?=
 =?utf-8?B?UDF4emdsZXB5S3lwRTZRajZqcWFuVFRvd1hZWU1VK2hwRDFaR1NHVVU4cFU4?=
 =?utf-8?B?VFcrRTdERGRBYU94QUlrS0I5TzRFUnRSai94NWx6RnpiOXhEanV2YlFJaVBw?=
 =?utf-8?B?UXE4cXNPancwZ0MwTngxRGZVLzZ2OURUTGNLelNIRjR1T3FNeWlKZ21jcU8w?=
 =?utf-8?Q?1j2a4QGrLkS4sJrUdQQ+PMmlJU9NloP2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 07:33:39.0661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b851cfd6-df34-46f2-7d13-08dca17bc83c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7347

This is in preparation to splitting ACPI and platform device drivers.
Having init_acpi() helps in smooth code movement.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
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

