Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8A8189BB5
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Sep 2024 12:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727438403; cv=fail; b=Nh8UGZclgLNlPPB7b/c7RJAwJb3ieUZfLy+YwGUs7tdNXUJ39/eAxEcHmVOLItmP0Td9XFqFs74ZP02a/yH2QijtLRPbRj0xNrlMiRZJi1AfaihdGuW6eGY2JKpspmjjgcFURNsYlw5zct6RsubG6YLxHmNHi2j0xb6TvPO0ncw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727438403; c=relaxed/simple;
	bh=ZqsJ7i/QjXnnT12h/kyiU273tXfv6rGm2fZiSHQDoJQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E52YN+/0170sLsGUyy1d5RPkT9+dfMOMWiHfQYycuJciMfq7uD+BKHv95gI/YwVO4i8LG+4fz8AOwVy3ksOH/fuVTTm6iTjMo6F9eEOIHdWiwxvmIr1FO+e2QrOOUpu360fhwlwIpIjEFzBC6cPVsCVcwcAqbbyBUeWFTn3BaVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AGVFZMeP; arc=fail smtp.client-ip=40.107.93.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AGVFZMeP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKSxlgXp9qRsCO4ADF8PKSTPvl52rhOQrW+J+NmSt6gIQHdCzS7fXt3pkb2riwoAqRdyJDzne0SqP4Yj7PyUXmsFahVVuGdQsUKK/AeijOWaC4cMTEiTQhWDjxTUDC8rTA6XTxgUUbxgC7IQG6RjD8UyVO/GjAkbBWMHKkZ623IvfaYcu8VMS0/UksKJzNGLcbmhMdu9QP45XqbA0/7+ZrNpv2rI1JuQkgmCrfGVuKzDmJ6TvR0ntoIio2doiYyjZLA03iHSgj/NMU9oFRK+eE1Ynun6xc3W29JJctEM4yf+J5lnP1AAvNeb8bVOfny2Dr3qpsk/NB1Py3B4ozhuLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/HYUVVz4MX4Zx0zd9bhQ4ivDNI6s56AULszRNJ9zL8=;
 b=Q4yY0vRxGKdC0c8gaXM3MbKJCr4JxU1T7yvJCfEuBGMJ8U5zkIRYspj8azXSZCMqrfJskYQmAs+6/tlXYr+zp/hNEx+IgeauAN6q1YJCs6XdSllHWfeJLuwMD+AtcmwprrblGCF1OXoFQhZUqLQ0ByvnxV1b/rKsSlVZGRstFdSDbby1oE7rC7/0Gdx1aIpXtb2R/2sunDTXmlwxu2s/FeAkVGtHjFuXKwlGSNsCxIrBOs8iNwp3WVXEzbw8AspYoPV4GDqyLjQJAhARfoYQbR0q29khZaKvU0tl5P/sgzgVl/hRGvgOrqcUDD7AYtX43YO2CrUXGMMn16oOTb0hdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/HYUVVz4MX4Zx0zd9bhQ4ivDNI6s56AULszRNJ9zL8=;
 b=AGVFZMePH7KClSb6wRnuKTxLh0RbV4B8mB8fw1JZHiGg9aeaR0VULFvABr1BgSaAtdFtTtBNYXDJkTx/PS9MMvnvVuE+a+GoBx6tBLC98d44BJeauiYpG1d14KFlz7pcS5hwQsuVunm+U3+FZURzwGlhQMU32y70H1eDMyVja0U=
Received: from SA9P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::21)
 by SN7PR12MB7935.namprd12.prod.outlook.com (2603:10b6:806:349::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 27 Sep
 2024 11:59:59 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:806:26:cafe::8b) by SA9P223CA0016.outlook.office365.com
 (2603:10b6:806:26::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Fri, 27 Sep 2024 11:59:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 11:59:59 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 06:59:56 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v8 02/11] platform/x86/amd/hsmp: Create wrapper function init_acpi()
Date: Fri, 27 Sep 2024 11:59:12 +0000
Message-ID: <20240927115921.10909-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927115921.10909-1-suma.hegde@amd.com>
References: <20240927115921.10909-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|SN7PR12MB7935:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d996c99-1da3-4032-9d35-08dcdeebe94b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3NrdkdXdDNGTWpmRGp0UnN1Zm5DSWE2R0pBQXEvRlR4TTI0RVBlV2x6Kzhh?=
 =?utf-8?B?NEUvMS9PaFVFMEdKWWtZaTVqUkZCVy9VSzRuSFBLWXhodGhNK0x0TnlmMHJj?=
 =?utf-8?B?VHk5OE1sYWdIZ2pKRVRwVXpKNURkdUJMUmJsdXNtcHljRDMybGo4dGc0QUJW?=
 =?utf-8?B?ZFdRQVd5VzY3aHhDNjVkVUtib2Y4dFlLUEpJd1NLa2xiRlpDWVB1WjRwMDNL?=
 =?utf-8?B?SE5PVFZLaEovaWFBUTJoRXFid1RpZVpvTHBkR0lXamNJS0xQZlpZRzBYZm5r?=
 =?utf-8?B?eGVrMnd4U0p4UDZoV1FFT0EvMWo3VTBLb0RoNGNQSWg5UE9zOEZrSjBycU5Y?=
 =?utf-8?B?aHN6aDU4dHZRc0E2N3Brem1XTTUva0ZTZ21BbCtwem0wZUlpMlZpV01Ncktl?=
 =?utf-8?B?VFVDNEFja0oyWEZmczdWRHJxbWdLQXBubmxwRDNFNTA0MHR3SkVNc2FUNHRs?=
 =?utf-8?B?am53aTlXTklmbERhZEIreElLMzNBbU4xSThadkFsTjVRU2l3bHNiQXdFTC84?=
 =?utf-8?B?b2tkOXBXWjR4cGJuOWpvaWlVbk5VM3EyVUVQai9JSUdwZFFsSlJ0WUszWFBO?=
 =?utf-8?B?Mytkc1EzZUZscnp3bDNTb0d3MDNJbUFldG9MbzMraDJadjJobVM1dldxQ2tF?=
 =?utf-8?B?aWp4RVR3UjliMTFGYWVQOXVVb2p6YjdtZ0tONTlCZnFyTkFUT1dQSnkzVVVp?=
 =?utf-8?B?VjU4ZVhBaHFIREMwaTdjWVZVZTZDY1lCY3IrR3J0OFZNRjFkS1hZcGJFUytJ?=
 =?utf-8?B?WDJjdmpES0tKNlV5UTVRNVFHOXRFZDRkZmNxV1htMkZ2VFVHZG5FQ0FxRnRl?=
 =?utf-8?B?ZDg3RnkwWURSdzNKM2tlSVRzUHptRUpZaG4vUW1DWTNtb2xJRUNqakp3U0xD?=
 =?utf-8?B?OVFFYmNQUTBqUzdxdmV1clNTeSs5UG1Rd3VUL2VLWHFia2EyM1kxbXVyL2J2?=
 =?utf-8?B?VVV5NDVLRkd5cnorT3J1dkVvZFVpME8reFcvcEJTNDBTMUtCV3p0OHk5bmh6?=
 =?utf-8?B?L0JjcWd4RG9jNDNmM1pnallrMW50emF3c1F0SnpkMm12YWtpeTRCdmRqNzNR?=
 =?utf-8?B?UkpWVE1MU0dlQXMvS1NudUZnc1FQT2NjYS9TYmdpcGt6Q2d0a2RtTGhueUpK?=
 =?utf-8?B?bEQ1USs1SkRzbno4aGdsL2MzSkNJcGpwWDB1dnBQVm5FUlJKNXVscDVkS1Zt?=
 =?utf-8?B?NzM1cHkwMlhhQTBCV3JNMGQ4VFIxQ0hLOEFiWGs2VC9BNmlYdmRTQVExSTUz?=
 =?utf-8?B?Q2xVbGl2T1FoTWgxUlJ0NWF4Q2d6dnBJaFJucGh0ZWtHZkNxcStlOSszUTRV?=
 =?utf-8?B?OGZSSU1SRjUyc2taQW95QktVM0lnRUpjNHoxcm1Ib2psbmZUaEhRN3hFSWxV?=
 =?utf-8?B?M3RNWHpyOUVSL0JMUzB6QzBITXRKS3pQN1BoNHZYLytxVHlFVXlzVTVsQ0VN?=
 =?utf-8?B?bGkrdFl6bWYrOFc3RlErNVd2Mzg3bVVtanlqdzNobiszdlhqaE1zR0dYd1po?=
 =?utf-8?B?ejVWQTd3ME1PV0ZiTThGb3VGVDNOUmlZcFRKODBEd2FHL1RmTUJRVmRPUXhr?=
 =?utf-8?B?N1NLQjNnV0hFSWFrbDBqU0pabm01WTVMYnlFcW5VdkhiVHorbGhzWjA2SjVs?=
 =?utf-8?B?RTZIc0w3S0JPMFRYdTJxNHM4QkZRQ1VzbGFqYWtoc2ZnWG9RUkhVWjNxdWRR?=
 =?utf-8?B?SGNDeWZrTjlwSjNxT3E3ZTAxNlNjN3RwV21sbnJpWkZzVFlZUktFdWNaZENC?=
 =?utf-8?B?YmdkYVVwZW9ibzZvb3RXYmhvajBCYlRCNHllaXU3c0Fla1pMU1pTaGwxdlhE?=
 =?utf-8?B?cWU4azc0VHZSS3FoOGQrTUpqbG0xTzZVaG1NZFIzUWFURDNrOXNUVmRxdVVR?=
 =?utf-8?B?Tkw0elFPbW1kK1R0ZUtXZ0d0S0Z6Slk2Zml3NnlXL3poMWF3SFZjV1lrYS9I?=
 =?utf-8?Q?WBtSlMBQ4aK5TuvV1u3Po9CfrCRxQb+P?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 11:59:59.1557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d996c99-1da3-4032-9d35-08dcdeebe94b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7935

This is in preparation to splitting ACPI and platform device drivers.
Having init_acpi() helps in smooth code movement.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
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

