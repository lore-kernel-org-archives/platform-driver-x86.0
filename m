Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584A41E377E
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 11:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729509297; cv=fail; b=OCAL06/w/VCgyB3O7zhBv7zY2g6tQR9I05gCtZ1KFGS+O3uTJCj4AIi3pzvJ0qeHAJzG5W7NkiZNETM4q/SIO7dq/HwMVS/FaI+g8rSELmw+g1L++Zzx1AUxdd1oKwbWRIbb2s97IsNiLd82dhifOLC/+RWV4TSXNg9GySgbvSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729509297; c=relaxed/simple;
	bh=kNx80jrqgEOg6dtHXtDLyYbsQubemlWf9yqPtB4BMWk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cmOjkERaatEFeaNvx9KEMuf9WZh8ecW95OUyvMyS9giWEmvZ7GgUa2TaQ5+QNPD20jrpasTJ0v2/mINyIpp1gc0elPoVPUDbYU2dIjCPliE6S/PalIDBFnBvB+ZA6sYXKOnaaU4n4gjetZRqnOJAhbdtopyCPiTYIIrvyhbUJFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ldF0qDHg; arc=fail smtp.client-ip=40.107.94.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ldF0qDHg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3jBslXdz5BjR5SS5CiVQccji9vHvZKiUdLhhGwC37m52fskjlrPMo5bpvVhwEsTtonsfYGdCyoDuHv0cTDIIczJUpPKjOd3Wn27pOmlsqT6pS1ilJpH+8GGPZNEjxKt8iaqrzUF3c/03Yi11SYTiFtWr/c44+NAeF7+XjIoarlOWXJywbUYf7rr7oRWEE46qfko6wXIoWJt+KxsCaQ7v3ZffJQ9fKEj8QXyJlBRaeMmvNF5pQh4Q8QVKDHvzX6M6dfZWH0Fnkli1+N5ClOeHc04Fi+SGJqoonhwqz3dHuRS3ARTulN5IYbXxu4bbhxTr+W4xBe8KCSS0NQIrr+CCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmzU24QLpcoFku5jQrH+hpYpljKjKZVk737BDUHby1Y=;
 b=oLBlETC0j45hhWwKTbD4atxgZEaU5aph+hSfOLdG8W6/2pdIEEdTGL8qCRYC8r+P5Ik/EiBPZjkPHxLOYOC1grCe6cUAqBKdFYYqh3kOll4RlIhrgdJMUHLQPFci1FN3p4Astb8XHhjkXioaeSnRkw/mbLupW/SvUso8e9DtucTGdofBQGsxo7iFjSXk/uz8UPz8sLYHERUvT9v3zP/ZtQIR663S9IPj08PXlgAKeBMhKqooxz9Fb279o3WRk8XYpa9E+rBzBvvGr0ar7BspCW1B+e+qdHPLf1ZZ1V2CEO+nnSHrA+ff0m5A9PThSlwY4+i0QMhyUHCCEI0qcj3QoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmzU24QLpcoFku5jQrH+hpYpljKjKZVk737BDUHby1Y=;
 b=ldF0qDHgFlN4GM5sCJLrEfy+zL3zwtyuXIiM/8dv5E4XFWHUvo6GRHDObNKfxS5Be9Un4VWTJD8J82ATMmjLFWH1bjqOIOsODl4n8ba/r1w3x4UPTHjZOIFE1pAB37QxcJZ5k+mz4onApjjH/ZxYshnXkvqz87eJq5vIHYiOAp4=
Received: from BN9PR03CA0475.namprd03.prod.outlook.com (2603:10b6:408:139::30)
 by SJ1PR12MB6243.namprd12.prod.outlook.com (2603:10b6:a03:456::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26; Mon, 21 Oct
 2024 11:14:53 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:408:139:cafe::20) by BN9PR03CA0475.outlook.office365.com
 (2603:10b6:408:139::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28 via Frontend
 Transport; Mon, 21 Oct 2024 11:14:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 11:14:52 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 06:14:50 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v10 02/11] platform/x86/amd/hsmp: Create wrapper function init_acpi()
Date: Mon, 21 Oct 2024 11:14:19 +0000
Message-ID: <20241021111428.2676884-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241021111428.2676884-1-suma.hegde@amd.com>
References: <20241021111428.2676884-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|SJ1PR12MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de5999f-5345-483b-217a-08dcf1c195e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2trQTBpMk5Kc3BuZXkwQUtjc3A1ZzJISzFrRFdKVmw2WWsxUFd0amVLdDFs?=
 =?utf-8?B?OGNjVXBCNjk2NkZqKy90UDhiZXVzQWhaZHFWV3RXSGQxZCt2Ylg1eUkwZXVL?=
 =?utf-8?B?aHJWaEthdWx2ZjBCalZlMWhmeFRRZUtWR2drREdmdUF5U01QN2V6akE4SnZI?=
 =?utf-8?B?RUtSKzI3d0xuOWNBanBBSERYZ0ozU3MxSVZjWWpQQmFJSkQ1NnFCLzlHQ3ZJ?=
 =?utf-8?B?MUxrUWx6aFl0eXNGNjlRVVg4YzFzQmprTys4VlpSVngyTWcyMUx3RUcwOUoz?=
 =?utf-8?B?SER4SWorM1p0YUwzSTkwR2hBR1pndnhVSlRVMm1IeVp5N2xGOWFmUWQvR2Fi?=
 =?utf-8?B?dDVCaEJIZG03NUNzbjlpaEFlcjlGWVhKbDBaRi9xRFlzUkpJcjJkWXp2WjBv?=
 =?utf-8?B?L3V1bG1VWEI3UjFnVGhub0IyemQ1NTRNd1dhMFExS3J3eDJ3RTJwK3VEZmZq?=
 =?utf-8?B?bGM4UmhlY29PNzNCWlZ0VDlLUXpKQURlMjN0YXFoTnNSMS9ucll3b1UvVm1Y?=
 =?utf-8?B?NEZTS3BCZFBXTGZrWWthTWFueG9jZVd5UjlsQkFQOUVkQytmUTVpb0I5Q0J2?=
 =?utf-8?B?V3h0VnVVMFBYbFBNbUhaMjRBVEY2T0xlV0p4dXBRTGh1SXZkR3haa3pZMmNK?=
 =?utf-8?B?Zy9vcEdmOWhEcWR2SmIzd1pjUGZ0cjFzWWkxNHZ0UnNvVXRtWE02VGNwc1Q5?=
 =?utf-8?B?ejR0OHA3eXlHdGhURzFVai9SZXJKQncyMjVGVDNXbzhGS3VMUFVUNjRyR3dk?=
 =?utf-8?B?dWFpQlNLMWtYVW81QVZkVVRPTVRONUdocy83eUdPOStRa2tJa2xEMHhCSmFI?=
 =?utf-8?B?ZGZPUmdIaUdLa1k3NEpZWjhzbHdiZlcxOEVoeko5WXBCMHF1N29NOHpVNUpC?=
 =?utf-8?B?eVdMeFJpTGRRUnJ2RGFrYnlybVlpaWNPZXdJalRXN3JWbVZZMEcxaXlyYXh6?=
 =?utf-8?B?a2hvS21nRllQb0xXa3FzVitiWS9lWklrempVQVloYkpxaWtwSlFWVnR2N0hl?=
 =?utf-8?B?OWx3WXlvN2JmaytaZEhia2RBTElycnpTWEdzdHZ1NU5Bc1N2cHdpU1BIbklX?=
 =?utf-8?B?cFFBeWdWNDdDUEZ6K0J1YzdXMndYWWxTd2x4bHpjTVNhQ0UyUG5EZHhZcmlj?=
 =?utf-8?B?MUU1QzNadzFheERLdVk1SkdHWEFUSWpYME5JdGRGSVNLUXh1QnJack9wU2FX?=
 =?utf-8?B?VzhVQkVUWXBkOC9IMUphdE4wbFg4aDlJL3hxMHFJZGRkZGNZWHFDTnpBL0ZO?=
 =?utf-8?B?SWpOcjBrdGlaZmZmVTQySFl6N2JFQm45L3pQVnpXS0pKdXR6cVo2cmdkM1l0?=
 =?utf-8?B?NVVuZzIxMWZRcUY1N2FiTERvZmZxYXBxM3M1ZXBrc0hiMHcxUnlueHVyYjJr?=
 =?utf-8?B?WlZjOWdGQW5SV25WTW1xV1lYZUVmUDNaQTgzV2J1UUFud0c4aUpQcE94aXFW?=
 =?utf-8?B?S2wzZndmQ0crZmZqZUIwZWt2UHVPZ1d1bnFMaFZuNnZXK2RoR3IwRFllaGY2?=
 =?utf-8?B?L3pQNDBQNXo3MVZLWGlBeFl0RVVFTk5OOXhGZHNoVlZxcHhWd3cvL1V0QTBr?=
 =?utf-8?B?YzJGQmRUd1YvMFRMWFlvaGxHRTBSWGVwV01JVHB3c0xkOHVFdG9OaHVMRzRT?=
 =?utf-8?B?eHVVZEhHc1FaQ1BDNGdJR3pMVmtkWU5rZFFnOCtacU92eEIyOU15RGR3L2RI?=
 =?utf-8?B?MCtMdnFVT1BHUU5KbnBkTHFhbWpTMllFdzhqTEUyMTd4cjBvRFVhaTFIVFdN?=
 =?utf-8?B?NUtUK2d0bDg4eHFGaFU1NkVqbWJST2ZtRDgvaGloeWdrZ3dJNnJIYmlNcWxM?=
 =?utf-8?B?SStsSmh4WUxrKzJSRGRnV3k1ZGJjT2gvWnBKTXdFRFh2ODgwZW4rVHhlM2F1?=
 =?utf-8?B?a1IzQy9hN0E1U0lMbk1jY0E4b3RKZlB1dDlKanI5VTVYMGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 11:14:52.4855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de5999f-5345-483b-217a-08dcf1c195e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6243

This is in preparation to splitting ACPI and platform device drivers.
Having init_acpi() helps in smooth code movement.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v9:
None

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

