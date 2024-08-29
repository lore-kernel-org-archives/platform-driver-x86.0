Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEB8163A97
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Aug 2024 06:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724911653; cv=fail; b=oqGJY9DK5k/ZXzQ6O5TOMEbE6RWbxBDS0rGPo3iVbO14ujz8xrv4xKIDxxmwBDo+jmePIWc8gPYG3yAILHPjrCSjFuE7mcZXryHMbHGYWza2tAWBHAkgUv36LpEMD/ilJp6Qg+DeSXEc0T1uSmDFBvkg8cSIkPTc+b6+5eR7A+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724911653; c=relaxed/simple;
	bh=dWIyEIiPPzeGo0BWVJYwCBiJzgBd6NU6+bLSICaE3sg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mkpm9Br6mH9tYankiEnBwWRyInWg+DuffzOefnbilpt+wEb47MNco3CZq2ToRYOvNy6qI0AlxjWqXNCGYP19+rSxcJhIWi19V3FJdPpKBNKDq9oVkyywKABAzZ2CZMWYhLcNZdrhVKfTVIWpNXUsN0Fc/VjFRmUPP+gYpKtuLb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=B+DD9gi/; arc=fail smtp.client-ip=40.107.220.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="B+DD9gi/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RU0JPqcFZ+IGxdN1qk8eUrYEyo9abv85XZ1YUxNkdTpm5TuYrq4CHBtNvKh5MIlIXrFKkYk+pbWTu1t4jUz7otSaxLS3DEedfcrkpbB1J5L+GuL6e+YFtU+qeOwintU/4k0lP5a07vkzvbPa7UJzY5HDTFuONdLsmmXZ7z5AwRcdpn5n+eXapMQRTRwMVtkuaOPsv1bqZDkcM5X9KtRGi3xmmzog/jyC/MQc6Dn0auyGfF7q1AlQmaSn/Iuc4HkWrhAgiQpyLGPZKtflkwK5MFIb0UTlifQot8paLuRxY8iTHZmpxiiWBsOPlInKiISOZVmZM7uWpWX7O+75iK6RCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RB1sVlAPf2E/jnV4Jq4ZPeg21A7x5SDLnCnFZPCcs8=;
 b=Q44+zu57YUzuCPwaz9h0yYA0Sqz1Ca1Jv7KlqWRM/Zaahhq96m/qXMySj6pjeezAXjlVEBMWEz7br8UwCFBFH13mABITJvpboz/GlA5zyfuC6uFwWQPvi8FGB/FKoLfZdPYTzYYs8a1ScfGKW8Hlohg6m/JhI+KSmvGYqEp9AtESwf7DOGsubTr/OBv5e8f9Tn5C2ug8jWEuRVX+242vWqX7is1+23ch048+RcHEJnqS8UnbsjzdCQuctEJ0f+jUb+vDza5KxwSwazuIoN04m/18QNNMHS6VUPouMe6xjMJ9+5b9/vbPnonZTGDEw1D8U/aC55AKi4d3T78vt0N6AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RB1sVlAPf2E/jnV4Jq4ZPeg21A7x5SDLnCnFZPCcs8=;
 b=B+DD9gi/K3YrIWawM/RFIvFgI2Ag+9aQg2Wdh+WlF/0aTuiz4NqD3/bjT/ubr94j3iGFThr1T6+zbmjbMttBHyrrUkVHlXikXMsPYwZdPldLYWsvYtBS/xRSuExFHqPA2g5g5RyoWhiGJ5n1Sloha0G0fqZxWpQF8I4nghaTV20=
Received: from SJ0PR03CA0300.namprd03.prod.outlook.com (2603:10b6:a03:39e::35)
 by BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 06:07:27 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::c9) by SJ0PR03CA0300.outlook.office365.com
 (2603:10b6:a03:39e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28 via Frontend
 Transport; Thu, 29 Aug 2024 06:07:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 06:07:26 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 01:07:22 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v6 02/10] platform/x86/amd/hsmp: Create wrapper function init_acpi()
Date: Thu, 29 Aug 2024 06:06:09 +0000
Message-ID: <20240829060617.1548658-12-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|BY5PR12MB4116:EE_
X-MS-Office365-Filtering-Correlation-Id: a75c34b1-619d-49d9-ec5a-08dcc7f0dba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWdVT3BRYkVCamRJalVORUVKYjk3Ui9zckRUcHJkRm5ycjc2bll3TERIQ2p4?=
 =?utf-8?B?TkIxWUliNk1LZjdkZExwbnplT1FNR2lGVjkzU0NQSXdXUnlITmVPc200L0xQ?=
 =?utf-8?B?YjJmWjdrNERXdVBUdEkvbnhmQmpVaWoxNzM4UWZJQ1QweUljQnBSbjJPSWhS?=
 =?utf-8?B?M29wNmo1a09aVDIweXRxU0pkVWgzNzZRVTNreEdMbzIyNUpEd3d6RFhJREpP?=
 =?utf-8?B?M05uTnpYYU9BNURVeFd5eCtML21aMS9NTkt3aUsxbHA2eUJORElRdEZKRXQw?=
 =?utf-8?B?YnZzNFRIcEFTb1ZkVTNLZWFTdnpkb3ZuU1o1S2pHaGVUYnZxN0NubEVwWmRw?=
 =?utf-8?B?TSs1MmpzMThzd09QVlIwdy9jRVNDeVJoNmV0OHF4ditGZjh1NGFPbHZGRksz?=
 =?utf-8?B?Z1VMU1hFdW5LcWR0YXpSU1lXRmJzc1Q2blhBUHBXZXdMVTA5MzRMR0ZTN29I?=
 =?utf-8?B?dFBGTVhXVHQzSlE1TU9IS1kyd3FrQ0lGQ0dpMWxCRHhJK3hmSXg5ZHl2ZlBU?=
 =?utf-8?B?WVhpYTlQWVdMeExQWTBrM1hoNktSR2hsbVJKWW9xbnIydm94Qm8vckFSTkxa?=
 =?utf-8?B?UmFsWFFEOFlkVXlybUZnM1loYk5wQXBiak1rQ05IWmhYV2dYVjc5U0hPVmgr?=
 =?utf-8?B?anFBRHFpQWhmQW9KajJBK3JEQ0FRczlNQk9oQjlCWjNsb05TQzcvS3JWN1Ns?=
 =?utf-8?B?UUhndHYxMmt6TWJuaGVoRDJDZWVPZnhkUGE3OCtubXhSZ2x3dXQzd0R3dERs?=
 =?utf-8?B?OENHZGwzemNWSnZsOCtHTlhIcTc1eEU2K1VuREI0Ylo3WExpaEEybnZFSlZ3?=
 =?utf-8?B?QXhsblF6OHZMNGJldHBWdHFvUDM3SVZ6TENYL1dCSHBtME5ybGNkRCtTdmZm?=
 =?utf-8?B?dkJIWW10RllsTDlXeXN2dHE3UXo2QkIwYmFFMFhMUzZldGhIQ3JaNW8xK2la?=
 =?utf-8?B?ZUhzazY2YStPRlBIVXhHeVlXc0lTWkVZSTNOY0pSUktEd2d0aHZ2NkpCR1dr?=
 =?utf-8?B?ZUw2TlFvQ2x6WGVPQXFZckJJRyswbFBHMThlaGZRVm9ya1YxbzdXZzh3ZXgy?=
 =?utf-8?B?eDBnSS94SWpGUDRBdkh0NHJiQ08wUUdncXV3Z1BjaGd4NUhwVWNCWE5CK2dR?=
 =?utf-8?B?Rzg5eWVVeEdLU0d6ZHpZcExoS0NKUnF1N2VKblVrcm94N1VUTDZuaXVacHRv?=
 =?utf-8?B?cjd0eGRiU1kzeTlVNHVBUFQ0MStQSkthdjZHeStTc2UyRTltNWN2a0ZaQjNj?=
 =?utf-8?B?dXdTekNkVktGNnUxcmY2cERvTHY5Vk5JTnRxZ00wU2J0WVhaSEpDd2VaMXB3?=
 =?utf-8?B?NzZZcG13cmdrN3NOQ253TFY4YlJlbjVTakxtdEMyV0FBSEFwbEtBdExjZ2hL?=
 =?utf-8?B?V205QU4zNmRyalkxc0RqYVhod1VNaldmZjVLOFFZRUdKOTcxS2tpNEZkdnVK?=
 =?utf-8?B?ZjRBU09yLzcxTUdyMVFEd2d1cjdBTWZuMURZYTlPeWhodzdORHZyZEpDdklz?=
 =?utf-8?B?dWlmaWFsbGNRdmR0YkNBN3dDNXRJVGR6TjU5aGk0K1FrL29OZzFuRmFnWFJv?=
 =?utf-8?B?T2ZPWUxkeFlXZFJoL2cyb3ZxTkNLbVJ1WkxaZld4M1RvOVFuV1NhYU9keUd0?=
 =?utf-8?B?TDRNeURTNmh5ZFhxVjJERkxpdS94MHZyc1YvWFlyL1ppQ1FTcUZqNzlXRC8x?=
 =?utf-8?B?VHZTV1U1YlhiZHUxNElQUG5LMkdtUnJITnFZQXp4ZlROdXJ4cVlTYTRXWmIw?=
 =?utf-8?B?RHJNUlI0c1dyYThEalBMV2Z3andvZmZjZ1liMXg1L3BEWHV0VEovbDN3RGFP?=
 =?utf-8?B?c1BRNnVpTFVXUThhTGVWZXBJWmcxcFhHb0xteVV1aDhxb3Fpcis0dWx2VC9P?=
 =?utf-8?B?Sk1QTUpiaEhVcEdjSkZ5SGFaMUovVzNIZWJZaUhpOEJCQk9jamR2T1lxZTVa?=
 =?utf-8?Q?Sennd+7V1xRG6JyHMMKb1E8B+Lmw1/S6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:07:26.8364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a75c34b1-619d-49d9-ec5a-08dcc7f0dba4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4116

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

