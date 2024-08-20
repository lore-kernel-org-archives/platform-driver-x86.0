Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6507418A940
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Aug 2024 10:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724149817; cv=fail; b=BcVvPyoudEus2qUHUdaXB2xM+FzOwdZq1Jn2MT0Jjb3NVtff6YLgjAj3aSl8ZkUTnd1H8SrGVUR96PSotODq/DRWRHgNShHsA2nPvayV3PnqIudRq4M0p7Yb445aENIw1XrPpDmP02VskWiLEECjfWnvqpp0a1ckdJMjYNXhMuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724149817; c=relaxed/simple;
	bh=JtqHGIZ4jkMPcZbTPDxKCD6XJbjYB4djePvMtzqI9Ro=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jY4/oXK/0v6ZI9RlGTFxHm9D2hmXmdrhd2qHrc2kHJfCGskqDiE3wsvflB+IPqSaakhjdO+xUolxl1c0X8NrxM80TYoZJcwmGXtIFN5V6/zIMnzqPxDKbI4kCIISEAtmYXFwKSwWpTVW6gZkzwekA0FIhaTNCmeYRSrZaiakOPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FWQTAqSe; arc=fail smtp.client-ip=40.107.236.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FWQTAqSe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZmdEYqW8Yo/Hprk6Da81+Ith8OMMh3GhuGhTNsDi4Lyyk5fv3AIN8BdS3u84JfP6z+u2vv3ViaJ/dqREU/K1/rPlFjSEJ0jDNioB/CCTB5fUqO2o6GrhegDMZOiEEiSL2cXPV4DjQ8kwpSC1FUU5+WttSv2plzYYwekYxwIeSiZYrPXFTLp6/I5ItPUd5KY2FVuctSCi04yF4E2WTyoIob1zzB2BrYZVY3ptQpK7+rLXl3yPovYhUXmEE7LL7f9QWNhUsXLuU2SMkuco1p2gfOnTehovmqbpqFTHskMcEVDCDGmRaTsTd3k4dUa3dA1bJxHYCLS/kk3Z7BWk+WlDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmoOq8JvQh1NRlqKfL0Xvub0nBGwI0sLm5NRiOrvIwI=;
 b=xQigYWBPCH9wWCZmt0dj28VFfDPWczJ3s/fkoRKWXjiX39fKyLx/cZZBUXu2IyaE+zRFh7kxuDd5MqofslIFBoeGagRECf1vofqX3wJLpmWZGmxaQp4umw4ChmSY/0dsdj0ZTXNCdWFQ47igrwMwpUMjoST97lJMJPL7KtU1AjMH5ECudfqH4xYC2Q3Bpocq+2AyIFay+4/jFAFob2RRB19oDCOHmIbRpqC8Xvcj5PLChb0ls9YTnVN+FwJesjtcinS1i3Nyv9TKdPr3DfyiVZawMsqxxrxDFD4Dzwuh4x9aIpp8vAhP2BLEU1WbiCAptO++w7BQgZK9c+2ikZKeKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmoOq8JvQh1NRlqKfL0Xvub0nBGwI0sLm5NRiOrvIwI=;
 b=FWQTAqSe+fzTxEn/nci4kqztJrbp4+ffx9uUUBGBebS85A/HkOSyah66lAeXEipi71J7QfgiVAjYHvB6TBDMw9YdEmgr38Hd1tWH/T7uZIfOjAHpkN/QoeDadpBfuhGkC74xPh0F1FHfW8wbhHiX24hn6MwygYLeZk4/pMzRyyA=
Received: from BY5PR04CA0017.namprd04.prod.outlook.com (2603:10b6:a03:1d0::27)
 by SN7PR12MB6982.namprd12.prod.outlook.com (2603:10b6:806:262::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 10:30:09 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::3a) by BY5PR04CA0017.outlook.office365.com
 (2603:10b6:a03:1d0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Tue, 20 Aug 2024 10:30:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Tue, 20 Aug 2024 10:30:08 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 05:30:03 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v4 02/11] platform/x86/amd/hsmp: Create wrapper function init_acpi()
Date: Tue, 20 Aug 2024 10:29:32 +0000
Message-ID: <20240820102941.1813163-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240820102941.1813163-1-suma.hegde@amd.com>
References: <20240820102941.1813163-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|SN7PR12MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ff881b-731e-4f8f-7a8c-08dcc10310a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0tUYkV5eHhnOUNsd3k0ZzBiZ2tLaEdsRVI0azlIZkF3TVRidlJSaHlQOGRw?=
 =?utf-8?B?N29kSWM3UGwxRzZGNklaV0R3SHBiV1ZPTVVyUlJwR0F4alAxWGJPZk1kYUYz?=
 =?utf-8?B?NXoySEJMUGdUeE9RMEZ6aXdXTERwYmJUYmlNbmhFYUFocGxHdXFhWXZHalNC?=
 =?utf-8?B?ekJmSUhVR096YS9nbkswY2ZPTUpXRXRQWHloSnIvSmhKMFZpRExNanNhR0JR?=
 =?utf-8?B?bmpuNUNXSzdvTjByWnkyVG1GSGNFKzYxc0VzK0c4cFBhaUdsUHJGMVBodHFO?=
 =?utf-8?B?eml1ajE1RHh3dndVams1VGg3MGZiN3Bocmh1aDhUV2o2OWp1Z2Y1TnZIck4x?=
 =?utf-8?B?QVRpTitKMHZFMlpHNHdTaFVkYzFzU2ZmUGhIcXJtQUN4b1llTnZPT2pCazNx?=
 =?utf-8?B?NHAxTkVHbzZiL1VyZ1FGZVhSS3dUaEF2MWJYZ0ZHdDh6Z1NUYmZTeHJReVBG?=
 =?utf-8?B?VC9sc0Z3MWlZeWFXUGpvYkhlaWtFQnVkU1pxT3EwYktVWWltdU1rQzk4RHQ1?=
 =?utf-8?B?NWJJeFB2dU5KM3o2bDdvVmpoUVdkWldxNmpsYkpMVVBZMk1hV2p5Tmd0NTA4?=
 =?utf-8?B?b0o5U3pSVTM4dmFMTFhyNkJzT1UrbjUxeXVmZWdGNmZMeFN6b2dLTU1ESVNs?=
 =?utf-8?B?NW9PSEIxdUpNcWRkb1JBMHdnWXdiamsxaTBVWFBsc0t4cXQyOVQ4KzVieFBx?=
 =?utf-8?B?WE5Id3JKWlFja2dGb3kveHVNRGVEQ2ZidTl4TWtFOEJkUmFoeVJkRER1WlFa?=
 =?utf-8?B?VkUzanhDeTJlS3RadElPNXZTMEZucHFzeld2YnM5Q0ZJTXhNRGhvZ2tKRGxy?=
 =?utf-8?B?NjU5TDFidWdDdDRlWVk5RUh2MEY4c01SZjFKS09wRUEzV2FObmx4djFqYlFD?=
 =?utf-8?B?MjFMQnpDaUZNWlJFb2JNMGIxOW5mVXBhUmRybnY2RHc0NVBBWFR6dVhRY3ow?=
 =?utf-8?B?NEpCeWMzUktxbDZzaGZIa3llc3BCTzlhM1V0VUIraVoxbzlrN2p0cG5oRGkr?=
 =?utf-8?B?TkdxbkNkbGxlaXc2bHByT2I0RVBKN1FVTWM3RnpKWWdLYU5vQW9SVG9acVRT?=
 =?utf-8?B?TytVNGc1ZkZEWFRHMFIyWHhYNldWT05CRHdxdWVQTmJsbFVlVkozU2hUSTZz?=
 =?utf-8?B?OFRxMmk1Yno2QlRnZzJRZmJEYklhdENTemkwTDJ5ZkdqeUpxeXR3dmRDSmI0?=
 =?utf-8?B?K1A5QWhUWlJvWE1WaVRYSzY5SjQ0WWVLRUlCL0pCdGtLSXI4L0g5ZG5aditC?=
 =?utf-8?B?Z3pQVUoraXZxbVFyQlFQMkZzSVNUWlo2TW9kYldCY0tHdDFFSnB2WFd5a3hz?=
 =?utf-8?B?bmwzMEpNQVU0SVl5YWp5T2tOaUpEWFh1UE5NTGFnZzBWQm1ZWDB0NVVqdmpM?=
 =?utf-8?B?NWdMVDJzZUJuWnNmeCtBVnRMQXBrdHR5c2duVHc5dHpQQlltRE5JK0JDbmlY?=
 =?utf-8?B?eE9GOG5Ub2UrVTluKzBGMi9wZEZYckJNb2VCNW5ScWxCTFh0YjBORUVEekJF?=
 =?utf-8?B?NVZnOG4rV2VVdmh5cmZWVUtuTEM2NnFWOGthdFlRVU9ZNjFEVDE4WjZJWVIz?=
 =?utf-8?B?UTlIQXhSRWM2TmQzOTZsbGFUK0J1WlBuMDhQTTlYSk9MS2NDSi9yS2hTU2Q5?=
 =?utf-8?B?Z2RyRStBNHpIVnBmcFNwUlFZd3p2U3Nodlh2UUtheDFDaHM1VEJwWGV1ZHRF?=
 =?utf-8?B?akZORitGNmZ5RUY3UEY3NkkvY2hNRHk2Q2VDWUpzV2UxcXBXajYxNkxrVnZ4?=
 =?utf-8?B?N0Y2QWZVcWIvS0JqM0JqTnZtcUdHTVRmZ3FtZ2pQcTk5MXFjM0ZPVzRsL3J6?=
 =?utf-8?B?SlpoaWRYejVXY3h1anBMYXlQSFVuU1MyYS9XajZwZjNtUUZBbFNEVjFFUWs0?=
 =?utf-8?B?R0IySkxUalhJOVFESmNJQlE1WGhJVUk0TE1hemRJMDVlQmxVNzdQTWlxVGRT?=
 =?utf-8?Q?tFFWVTDhTCu5hAFhxod/P9DKIeNdquOi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 10:30:08.6376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ff881b-731e-4f8f-7a8c-08dcc10310a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6982

This is in preparation to splitting ACPI and platform device drivers.
Having init_acpi() helps in smooth code movement.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
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

