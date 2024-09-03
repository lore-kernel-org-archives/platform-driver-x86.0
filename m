Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A911B12F0
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Sep 2024 12:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725367138; cv=fail; b=mxKoBBg+9MjUldAERDozsGRSglepVcsE4+NNc3CfI0qVNUZ4+acsnDAB7F1hmtyNvNzmEtOf6pvjAGtK4Ts3CgG4P7GUFl6tudqs0xBW97NqbwbxRy8aLZd23OChEW5RvWisdGUxbnWhOnPe58r5BnTpDAl+DftrHxo2sJVPAJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725367138; c=relaxed/simple;
	bh=qvdmhoZbkZ9MIHwM9eP40DAREQeem5tH7XoYNWnP4IE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SKFBeYzr3M2SM40RetcWLmcVRhq84ZhNowd7oPnUKne3rDiGv4uk9aPYp4uq4NGDbiWOjWEVZgmmq+YMTp+z4tle1V3mtZUGcRsqoKDuyU+QqjmNEiOrOZ3/vjall23NWQi/e+ivUHLnzSJOgd+ai8Tzdk0A7ezZ3b1e/L3y/84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IglE+Btf; arc=fail smtp.client-ip=40.107.92.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IglE+Btf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVSYhJcdkRzEcgwLdhLgcNi7NfN+LHV+aqWdTRQg6GxW6jSywufHmtQSO0A4FWKMnt0S3f4qAE3snm7xNaYeV7yIqQ3LBF6ot7/flQTNuLzgdNRe3CDEqC8/KuaSllNn1NIhHe6pMPwcelYGI+DXAWF36MoelfwtjGZr5UG2Illcazq+AOwLkG2m2zpvaQNbw6gchcmZ9TohKVH+ygG3hkOxUI95CJUIFAPtTcpxYiBPUPOawS5iMVUNSQ2ag5QMLJhYF9cliJaWFhB2lKggx7gqFjMAv6l2B328sv4Xl3Mg5awOMo9jTCFr7MOPxENyulBRnhCCdPwYabyt8k25Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3c537tLL9+s+2ZuZzRSIfnwbmdJQE5PvFtAMYfC9jU=;
 b=m6cgPpTU6RviMYWW7s7cGivEoTPFAnl52V67Mco4Z8frlR34poAiBW+4J58Z6kY9sT3ciYWBMIqIzPlsdcssYbj5NupVlULiAYnDmkjULajxlKDjxr+/KrunOJ4vrVMoj6Ae/XTFXvzMebncUUBEtrtoq0q2HediodU3X4ZkHNncEMCXNpZeFDMCUA88929qoGSTaf9HEL1K6vL8bO70EBpJlJM300p4yMOpSz+yk2N/vLha6Fr9OQJcd1KN3GMbmIEMaBhDJXzsVqBPmHk3XKWW1CXZnZ3UjqqNGHencCDpxzZyhDFNa/Hpz3MWhqAdVh+3X/IWuL6GswrgE9NHSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3c537tLL9+s+2ZuZzRSIfnwbmdJQE5PvFtAMYfC9jU=;
 b=IglE+BtfR9nRDOkLv00BrkK/rUdrjgkSxdoCb2SwA7ss1aeZzcpOiA/gAvHvKtn8eEjh1jnt9scgcka2JtEwWzZXRmNTtOPu7JxcEOeW+GWV7hmuq/Ow198fNvSN7slXcjo8+xT6fE2ViIliJQRl/HRfmYN9c5wKsJvy9UUqhRM=
Received: from BN9PR03CA0342.namprd03.prod.outlook.com (2603:10b6:408:f6::17)
 by PH7PR12MB7967.namprd12.prod.outlook.com (2603:10b6:510:273::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 12:38:51 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:408:f6:cafe::53) by BN9PR03CA0342.outlook.office365.com
 (2603:10b6:408:f6::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 12:38:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 12:38:51 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 07:38:48 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v7 02/10] platform/x86/amd/hsmp: Create wrapper function init_acpi()
Date: Tue, 3 Sep 2024 12:38:22 +0000
Message-ID: <20240903123830.2717196-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240903123830.2717196-1-suma.hegde@amd.com>
References: <20240903123830.2717196-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|PH7PR12MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: da51ec18-2c62-4c17-2bfc-08dccc155d43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFJXdXdtYU8zc3pyTENobHJadjZEU3RpNWhvQVpZNWwxWXBuRThGZ05MVzht?=
 =?utf-8?B?OEVxVVlYR0FwZWYwUVhOZjRaSUZucVNuMm5MNWo2aGI5Z1k3S1NKS1BiZWZP?=
 =?utf-8?B?N1dPYyszSHdQT2YvLzdyd2N0QzYxZER6ekxnWVB0eWlvQnJIT2F3djVhS29q?=
 =?utf-8?B?NlJtR0FhSFhYRUNFZ1lTeE0wTG9HeXFkazlHWnJEcHdnVC9SRys5MmkrM0Mr?=
 =?utf-8?B?b01lV0pCVTdNTXZDL3Jzc2M4SUhJdHdTMFF4UUx0QTcwdEZQeXl6bll5Lzd3?=
 =?utf-8?B?MGZiSnNWS0hOeU56MXF3emVVYmVlSGFoMXBUWCsxTUdpV2F5TDU5VjFURWxD?=
 =?utf-8?B?TSs0SXJJb1U2TzhCdmIwaEwxeVZ0dUt1MlROSlg5WTZXSnUrR0srM3N5V3lQ?=
 =?utf-8?B?RVNzZUI3WnFTZTVWS0xPSW5sQ2dMODZmYW9uTHNzaGc3aFdsK29mM2VQR2FH?=
 =?utf-8?B?aVo1VS9XNXpFd2JTNXVsNU5wRHVFbkZtMTdYNG9IcHNPWlQzTnBvd1V5VTVm?=
 =?utf-8?B?eVkxYnRtcFpRdXJUTlhoRERKQVo5WjNxdzZwaURzUUEvZ1RVZnFvOGRJV1lU?=
 =?utf-8?B?MGhOTGdGdDZvZFE3aThlZlBaZ2FCckkvSVFBOUFva2pvT3pFQzhPRTViRkVr?=
 =?utf-8?B?UEkvSlYycTdGMjBMMDVSUGNxenVhSTBqOHhEUmVtS3h3RjJIS0JGU3BaQVYr?=
 =?utf-8?B?bloyeTF1ZWVDNjZIWjhzS01oMWU4bFAxQ0FhM0RpcFZNSW8wTVNqZGNTRUJZ?=
 =?utf-8?B?QmhsdmlKU0dqbm5Ock05MktTRTF5Tk9KcjREekhTdEd2RGd6RllycTBRSGtT?=
 =?utf-8?B?YkJra2tVZzRWdmRaUUlldklkRTRlVEk4My9DeG5PT0gxMklRMnhRVFRIc0s4?=
 =?utf-8?B?MGJjZ0MzVkR3ZTc1cmE5UHdYMTVhMkZMYTI4bURYODBwMkdkdGd4dytzT0hU?=
 =?utf-8?B?NzUrTE9LUlMvb3lvSTZnb09hNFlMSFlWdGloOTVIWE5oUkJvcnBlaUNxVW9l?=
 =?utf-8?B?S3VObzBtN1BWdzhGdE9hUjBtY2REVUZXRTlTUEp2aHJqMTkrMzB2V2ZjME9t?=
 =?utf-8?B?dmdETUQ3WWpvZUJLL29mY1llRXBHQ0FkanVaOTR2Q3pjbHN6V2Z5S0k3VjhI?=
 =?utf-8?B?RVJjMHA3aEZXMzcvaEdvcjBybUFWZDdQSE05aytKODZZenBmWVVEazROdDJG?=
 =?utf-8?B?RGVBZ2FtOUVKaXpSOHYrdzliM09HTDRQTHpHKzNHbW9Db2NKT01uZFdHd3Nn?=
 =?utf-8?B?VUJaRVk1a1pvS1JOak1vY1dPRlE4LzJKWXVISUMrWTREY2tIbWV6eFBEY2Y5?=
 =?utf-8?B?bGtDZGVFYnFpTnNscEtjYTduRXBLcFZ0N2NuY3l5TUtQejFPVFVvbVFuay9w?=
 =?utf-8?B?Q0VWRTJ1c2xBR05DWXFHVExpekIvUExtbXNPdjhvU1NqTjRraktFWGFKN2R1?=
 =?utf-8?B?K3F1eTFRWERXZXhGbkJUYWpnOFRGd1QrZUhhVkc1MUI0RnB5aEZDWmFHSHRj?=
 =?utf-8?B?cGFRbEFFbGtzTTBqU0VPWDJlYWFoN091cWp0a0wzT1BTY0tzTVZlUEVBcUFB?=
 =?utf-8?B?RUhkY2dOYUpxRCt0bW56UElhVEw3ekliSG5OS2VLRnBXMEQ0MXFWN3pmNDBj?=
 =?utf-8?B?SmVRQ0RPaWtqaFJVOGMybXpqNEg1WmVMOUJhOWFSMk55MkZDSm5RODNkRDZD?=
 =?utf-8?B?WTQydFU0anVqc2dxWjFRdTRtcStPRDNNTXQ2b3lwdGZMSWVxTGpTRUFUamQ4?=
 =?utf-8?B?djZHYk5CT1U1VmhtaDhhWEliRGt6UC9rTUpWT09LaXR3YXNtbW5TZjc1WEJk?=
 =?utf-8?B?UHVxNDh3SHRkSkhsUWZ5NWMzejllZllXL3p5OEVZQ3VXYVBZV2grV0F5c2tG?=
 =?utf-8?B?VFhHdGt2VWRVRWxCNW9EcERmRWo1TC9vR1ZPd0J5Snl3TTVLK0xnUmd3M01N?=
 =?utf-8?Q?cTKRzns2kJNnFlwctQ4hahItSop6Q7VY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 12:38:51.0049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da51ec18-2c62-4c17-2bfc-08dccc155d43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7967

This is in preparation to splitting ACPI and platform device drivers.
Having init_acpi() helps in smooth code movement.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
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

