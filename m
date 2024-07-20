Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397771EB40
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jul 2024 17:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721497591; cv=fail; b=h5CRCmnFB+G5tUnWBaJHiX6qLSl8R84FZBcN5doIGS4YxDoGMlD37M9bgD5u7UXFhH7xTUhAVW2LARBU4bIhS0Q5ROlEhXVw9elsLTtV8a0QEfddxtUZV/SwyVEz/TFqCMOWoamdALwGJV5K387wHNTl5Q3A3YoYGayMRIQOJC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721497591; c=relaxed/simple;
	bh=zz60Ck+H2NX/3RiAjysxasRfWeSV5Bd67VrWcXmneec=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u9qmnOpdaDPrIt/ju9QTgGxOebW5HsZIUxDV0BFER7zX2Icb0/0dgrnyrKcCzjgraKFgSmrB6jMjzb6gozSCcvzRt8JFKVXm39avjfQo9NPDCFpr98A1xE8rCK99PxoLtvBHGgPk5UDPp794tkHRXa/Lrs3/RV+jT1Rn7t3xmUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=POjm0Qro; arc=fail smtp.client-ip=40.107.93.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="POjm0Qro"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYoTQYPBn6/5vGR+oMGSgeMSeoY2f4ZyCbdCgFTx+Gj/0JaaP1sKHY2AfZ1HUWXH4zcve6ko3/WwxHD735ylHrRf+vGxgtrZYAh5/xVeiGGrnCgjzoD2Vz170yi/l+yw1zXRHJNTx8Fh/6TeJfnA8uYrscTz5939gNoISiBFzEWrwHNUUikkTgQ4eoLAAvdM0Aglwim77s9YRWT72DzG3+Fny1B/p3IO5GBr43gOJzWO/qAh3gsH1jgxu/7F04ME7kyEebTOziaTBIDRHSY1rpzsPkuuo+XLUCP9+kfCPSKm9E5LPvg3y2K6N4jD0sMejjzCP0L6vNjSeoaKY1XUNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ztupg6Wi3XIWuPjDdczin0CN0rrQ8w6vd4IgMwARPUY=;
 b=P1+hfidRw0xYy6mKOrcaStCjdkfhnKkZCChKVIGCVkz40gzP9hqlSlEp8SDWvIgwz/qpGiHs0WZDnuQ23Vlnl+lDJRUHzfW6eEee7N3+55JcR9zYWV330pX2z+UfipKh3688w3uPEQkKRVUb0nlItPlEc1WAz3QDoAcEsoZhXNiSgvrruJ8x9PH48y+WNcd5wnMCYYTXP9hxn9oZKQTuRbd0CTc3OUC+uwiHq4IM8ea2DdfwHyHK2A2NroXKDXyVyOVLrZbUKf6fnvIbDusM3SVDBdUO30op1/Amql9uF92DjE3eKwlDzlL+H+aprqwyoYOmHeqAsT55g2gMU6FcXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ztupg6Wi3XIWuPjDdczin0CN0rrQ8w6vd4IgMwARPUY=;
 b=POjm0Qro/+0xrQkayZFt/OsD+cz6zJEt9kPohTyHXlJCyJ2Rz+ompIaZZIpEQ+6GDhMxrGKqb6N0rnXqIeL1AHQacMO40Q158RIfy+x0K7LdfSDkLk7VqVzzfluZ/0eeBseOppndnfp9VYL6IffV5L78kdQZiuyn9XPUV6B+ZaY=
Received: from DM6PR01CA0030.prod.exchangelabs.com (2603:10b6:5:296::35) by
 IA1PR12MB6162.namprd12.prod.outlook.com (2603:10b6:208:3ea::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Sat, 20 Jul
 2024 17:46:26 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:296:cafe::9c) by DM6PR01CA0030.outlook.office365.com
 (2603:10b6:5:296::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16 via Frontend
 Transport; Sat, 20 Jul 2024 17:46:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Sat, 20 Jul 2024 17:46:26 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 20 Jul
 2024 12:46:24 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v3 02/11] platform/x86/amd/hsmp: Create wrapper function init_acpi()
Date: Sat, 20 Jul 2024 17:45:43 +0000
Message-ID: <20240720174552.946255-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240720174552.946255-1-suma.hegde@amd.com>
References: <20240720174552.946255-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|IA1PR12MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: 199cecce-7aa3-4a0c-5345-08dca8e3e0fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXJoUHNpWTVZRXFjSVAwVXZ4KzNoblo0bUI3MEpJMXJOWCtLcnl4eUVXQXR4?=
 =?utf-8?B?UnFpRjhWYkczRUQ5M3R6K0ZkbGZEcGsrR1NWMmFZTlVCaysvMVhmRURiTHFB?=
 =?utf-8?B?OGhLSHR0RzBwaFVFS3U3SU51WitZb2hQOVhrakNnRDgrcm5HYTdQTm1UUUl2?=
 =?utf-8?B?Mk5PRndKeXc5ZXVwNHhBeWp1VWt4eW1xZkFaVzg4NFk2TWJCZ3pmS3hYcXhn?=
 =?utf-8?B?b2JrQzNRR3pzNFhFTDlQNHVnWVlkMXlOc2dTcWhOTkxPbFp3Z0tJY0RiZ052?=
 =?utf-8?B?MmxZclpSSEd2NFJtdjNKK3h3TEcvKzE3NWg4VFpib0xlTFk1aURCaWFYZkpr?=
 =?utf-8?B?VTRRU2xoRCttallvWE1wcHBVT096ZHpyVDllWlZiMVY3RWY5NllNUEVLSmkv?=
 =?utf-8?B?eW05TVJmVmRqYm4zVFpjSzY3N3RlblhITFB4WU1QLzJhTlc3dkFrT2k5cllE?=
 =?utf-8?B?YWh2U1pZZ3hkNlZ4Z1VwVTZKcERDUGg1WFNGNFp5akZNaDZuRlcveFVNY0VN?=
 =?utf-8?B?Z1JiY3FWbE9mdElsU0lkQ2FkRGJ1ZU4xN1o5OGFyTFBlM2tScUZRNVZtaTZX?=
 =?utf-8?B?aGlwZVZqUk95QXkxLzBXOVpHVVJIdXBTRUx5dDhTdE10MmFVUlRkdTNjckVB?=
 =?utf-8?B?b3RGREdYL2FCNE5PdkMvcXB0Z1grbnE3RUpSd0pubnJ3SkpLdnptaXIxZHVu?=
 =?utf-8?B?YzR1dU1yTXpIZUlaTEVEVHlaMEZBdllSQU1RN1ZFZE5icUxtUGNob3lGQnVq?=
 =?utf-8?B?aHAzTDA3dzJKY3B5UXBmSGRLOUpjMVFqN25FNUs3S3NXNGJvcTdCT3ZmRnNh?=
 =?utf-8?B?NDdrU1p2d0RjRS9veUtLWmV1Zk9sWlRCazVBSkpWb3BaMmExeUk0TWJyanJu?=
 =?utf-8?B?bmRrY2hyUTAwVlJnUHc0L0FOc3V3UHd3c3ZGa3FRMDBZNXpYaXZtWnVBSUlk?=
 =?utf-8?B?UnJNZTNRb3dHaGpjTDhrdzVYYkdWRVRvSUlSQnlOLysxbW5NYm1QemVOSlZw?=
 =?utf-8?B?M3F5dzgxNURvRGJXd2tsWXN0MDczY1hlaUMvRVJUamczbEdId3I2VGdBZG5S?=
 =?utf-8?B?ZmlEYS9pTzAzTjMrZHdndkN4YTdpOTc4elhlSzZlUS83UFZvRlJEcCt3RDk2?=
 =?utf-8?B?VWg0eTFBY1VXT0ljRDBhQWdzeG12K3NzZVZuR2NpelR0R1l5UFZISGFUcllo?=
 =?utf-8?B?WHltL2lRL3E5M3U3NjltZktSNit3ZlRLRlRrdm5FUzdGejRETURlRGwyV3dM?=
 =?utf-8?B?dXFXRFdjdjNVenU4ejllTXFXanZVaEJVb2V1ZmMzc2d2WU5pYjdEYStSZ2w2?=
 =?utf-8?B?VkQvQndQRjd6MlR5cnJUSzRYSU9JdHB6b2lkc3NORHo1MVF5VnMxa1cxYkE0?=
 =?utf-8?B?VnB0RUw2Nk9uNE91WDRrY0Qxc3JNY0dhak1uK2tmaU5xeHVRWXZGVXo4dkNI?=
 =?utf-8?B?K0NHdHFVWTIxakhGS21ERDdYTmxmbEpwM2U5NWJjeVFlT0xHd25aSWtwZ2Vi?=
 =?utf-8?B?Q25jVG94NE9yTVFkOTJ6TEFSNngzUnZtbVkyMlFPTlQrTW54TDJnajlOeHR0?=
 =?utf-8?B?UmhqMGtsZGc5T3NyL1dTdjJBRG9qNEN0R21PZHNzSTZUbUFuek1IQWZ2dURn?=
 =?utf-8?B?cHhIZUtCRzE1NmRERDhEVEI3Q0lrS2x2aVA1Vkxqd1JpVmd2aGRHNC9hK0dC?=
 =?utf-8?B?dk01Wk42Q0U1dXNRN01TZys1RHFCSDk1TGRUOWhOdHlWNlp2ZTVlcFFjVFln?=
 =?utf-8?B?dnEwcnVuam92QjRDUkxLdURlZC9ubDg0K2JaV0NYZHArWjk2amlmMnloTjl2?=
 =?utf-8?B?dkMxYVM1UlNSUDI5bFZmVGtxRGtrbU9hSks4cW5sRHp1T2krWVF3ZjM1T1o3?=
 =?utf-8?B?eDRrN2xLYnVyUXFDb2dSK2FwTG1JSWVLaWR4R2ZhWE5vSGQ1NWtlZXYvajJj?=
 =?utf-8?Q?55x1BOEpKwJcAdoh0XyYPXBSDOdCKS/C?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2024 17:46:26.4414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 199cecce-7aa3-4a0c-5345-08dca8e3e0fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6162

This is in preparation to splitting ACPI and platform device drivers.
Having init_acpi() helps in smooth code movement.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
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

