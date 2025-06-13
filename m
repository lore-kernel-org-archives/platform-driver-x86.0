Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533AA2E3367
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 11:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749815114; cv=fail; b=ej3VSqMWfl+L0BfoM/3qZKH5pfrmGNgd2AxdLrEdcYCwiPzI9lEy06YPj5g/UreJVi4e0v+iq/D9pkNKTvxgsQPQYQckZShO1SDkcvORi+WIaWWIM8IB23NDJTscndahDzAchHdDsBKexry8Ph1bBHRzZxl7K6dnl2Ua053SfjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749815114; c=relaxed/simple;
	bh=yt3nwDDZzDU5xxTPnxt5uvBSry9nxgqMZPxmWeohj24=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TyOSwfITTQeocgrneDqSvYrT0bsUyfI5bCFNf3ex2Ce5gjRdg/8POMsF8COeDrYfZ61EkGiXbSOceyAETgwlo7yd2qJoLKuGA683E3KzT/sPmgjs8NQuWVoZ0t97TQWBN7wJSn7ku5l2lgJk7LxqoEHTPFhQ5Fq9MJnKEz/DtUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yJb7Fwt+; arc=fail smtp.client-ip=40.107.92.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yJb7Fwt+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6xMs5l/M4Mts0hGPNwYD1EeiygJ048V/uMjBzFRyEM1iqzx1K/UsAQiHOwaMRxLzs0SQ0BwHe+dDkCVrtZSL50l2LRQesdbVzavWSz/w9EGlEy4PrbnLCs1uxOGesj1jnv/61BozOu+BfzRqSKdRcKEP4v367o5FIkm5NRjmVju2YH4sO5hJpEZjwq8q8DdjFe8K5RL4nfP0WWVMGZ+eqUkFZd/VQu6DMrqTZqugmYCULXn0YiWQAcHESmQgWBbc8t5zvBCai1/evV+9lP5LUj4RyINZEqpGzPe4a5hTEi4NRs5KCA4rvYFqGI22lT0WqepOk4urA8ryEZQdRc22w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3oU4xUwiMuySL5/Q5U2iyyDa+KQxBKyNU07WWFOnBtk=;
 b=YicEM9nZgMRsAvEUS+3ulzmVxZvFuxprfvmH9hP08tvGigMK3GJTNf0L49iYlF5MtPqnHTyiFdne0wWgmrQFO3XjiwotZNUqEYhhne4LNmsd8F2eZ7sVpgx3dVDVT3ii0UaFT6tnQjF/k3/NMy982O5M4CJ4kRp5M4fUVLA07nDwDTghl37TXArItjQWPbI9DTWKwpAHt5kbDJr2A2R9x/0wxBqo8l+HK1JCyPnFhm1D7WC3kOwuaz8TFWriiceJE+yOFAmmif2AOU9+2z3d3Ozag8FzOqSgE0HQYkqsNlwFXV0ljew56hdOUUrUdkNUg6lRvvvMD1Z3UmlzUot9iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oU4xUwiMuySL5/Q5U2iyyDa+KQxBKyNU07WWFOnBtk=;
 b=yJb7Fwt+5w7w9EX5rxs23CCeI0xPTVHu0AEELEJgCLbwnZthMaJtbhH0kh99M6g0Z5hfOvWcGkvXAzyDW/lU/PbXRj5TvRMwzZyt3YAshNeQn0hDQHdP0qiwIwHXoW5vqTQneYv6SJPKmAf5wKkzQynTGkilwbGGi/eWmUbpLaE=
Received: from BY3PR10CA0007.namprd10.prod.outlook.com (2603:10b6:a03:255::12)
 by SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 11:45:06 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:a03:255:cafe::34) by BY3PR10CA0007.outlook.office365.com
 (2603:10b6:a03:255::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Fri,
 13 Jun 2025 11:45:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 11:45:06 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 06:45:00 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH] platform/x86/amd/hsmp: Improve the print messages to avoid confusion
Date: Fri, 13 Jun 2025 11:44:45 +0000
Message-ID: <20250613114445.1665728-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|SJ0PR12MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f0b62d0-f961-4ffa-3cea-08ddaa6fbe36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YS/zIgkNTf8a+mgM2ahIHrPh6hX4BexQHZoWElY9xF/Miwslj2w8CVM/pV8p?=
 =?us-ascii?Q?19jbuigc6HU4ytiTZYru1zj/stfRAsu3OR/Z6n3j2U8O+PmRzpr9mtTTBmha?=
 =?us-ascii?Q?a9AYcCexYmmtoEuIm0hhYXgI0dIDywdjhk7pYfHwqoF0mUDGMxbWV9VYyMnA?=
 =?us-ascii?Q?Y9TiE8oF9/fT2XXjb12FPIQ5EwOtgAH/bAtY12mcRiRBI6MyPy+mCHBxZWhu?=
 =?us-ascii?Q?OOb+EHHm9xuBSV9SD12wXgcZLetGycwnRaun2pyi7FUVtOJk6umotq3QZsxD?=
 =?us-ascii?Q?e8NXN7shyNapsZM5Ceap46tTnAknstKtdzbnZvYJ5tHpOs+W8ahz9XPfe2Yj?=
 =?us-ascii?Q?gdUH0aiulWI2HWpQYadmxeQ4H2NyR9Y8ldfaBj3JcFCmbdexHobfeuG4szti?=
 =?us-ascii?Q?7moJqpPyVR6xn5l2sspcdxFqS8eekl80nMOcaYALpn6Rg30cePba9nrSqefH?=
 =?us-ascii?Q?XA40jHzx9bA/64wBEMMwSn+um2ZgMv3AdGRoFsXfawsTHzqTgRGjXMdyoKU1?=
 =?us-ascii?Q?/c90FcYkinSz9myP9+IW6NLh4pHH04yBxk/IWEhis2OhldXkaeclz+yyaV3C?=
 =?us-ascii?Q?WJ8pGBVzz0f471JqXTIxPofhIhGUgIeodns5TxFqSldSjAjNjh7UY7P92jlW?=
 =?us-ascii?Q?5MR5fvRzZLOZXyVq7mThtjInaIazN9w0M6ZEEzIcVgukqxTSbtQmCFUyACdA?=
 =?us-ascii?Q?q6267etDpPlpv9auXbwytFnXfqOzkJlY1DRLYNGVjy8s3oAHiLru27QGKsNC?=
 =?us-ascii?Q?USIea2OJotmjDtgUgXIO/j2L0bg04MNSq4MoPBuaCjVzz2aRh4L0X5DKgnOh?=
 =?us-ascii?Q?7MIXwutu8Aq5C1ggagIDA0g8WB+guF5Cx7mApLyiofuJpHWGFYBYzJdHfSY6?=
 =?us-ascii?Q?QnnMpL6pFpvSPmVIN/4Y3MnO1uSo/BrlhuN4VXNPsuGCjSkfiCTF0xYMGv3q?=
 =?us-ascii?Q?caGBVrjytN7y+HGzxQQJbypzzd7imDSvwU+zB3Kxv21uOiBJNF6kGjxX333v?=
 =?us-ascii?Q?q+iLpMA2gVD7No4HD867Edk5dj+g7EAlnR4a3sRinIW3Qao+U9toVC0U3Bmr?=
 =?us-ascii?Q?qrMibVSLcWrTewrNEukX/0Sj/qjMH+7btBBEbekX3qdwrZGdGik8vbdjDys7?=
 =?us-ascii?Q?phqvpgk2f3L+R6Z5nEFM2/Vlu3gYVXHAI1Yw/WeZnYX1YVX0bW48iVY7gJv1?=
 =?us-ascii?Q?Q6Hm7VnXCDsDj//IOasfgP02VeXCANGwSSMw6gAQBqvwtN1DQDQQSEnlIGRi?=
 =?us-ascii?Q?oiPcP2bDU0fgOIk3RfCJ+sRIte/tKHFDm/GE8BuTgMWIK/joGIG62GQafe5T?=
 =?us-ascii?Q?1wo4FjHV7wXhDiOPCwrXiy4yFymT/U23X92pATDmaSim9Gj973Dl16l0RQEq?=
 =?us-ascii?Q?RVjKhu2Y/u+CeEnzPSM47exoAgJRLI/kYji2N+Hv+7+63SfSzCoIKYjZe6is?=
 =?us-ascii?Q?vqIKEl5RfcaOHVmlGsBW6N2A/Qtu1v8zwRpIcVQeMd8G1lwPt9kl3+/gK+sI?=
 =?us-ascii?Q?glzSNT5AAUuzEDxVQwVtJH2Dyc0O1Zik6T3Q?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 11:45:06.4522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0b62d0-f961-4ffa-3cea-08ddaa6fbe36
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6760

When the HSMP ACPI device is available, then loading the amd_hsmp.ko
module incorrectly prints the message "HSMP is not supported on
Family:%x model:%x\n" despite being supported by the hsmp_acpi.ko
module, leading to confusion.

To resolve this, relocate the acpi_dev_present() check to the
beginning of the hsmp_plt_init() and revise the print message
to better reflect the current support status.

Also add messages indicating successful probing for both
hsmp_acpi.ko and amd_hsmp.ko modules.

Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Suma Hegde <suma.hegde@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c |  1 +
 drivers/platform/x86/amd/hsmp/plat.c | 17 ++++++++++++-----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 2f1faa82d13e..b631110e5834 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -610,6 +610,7 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 		hsmp_pdev->is_probed = true;
 	}
 
+	dev_info(&pdev->dev, "AMD HSMP ACPI is probed successfully\n");
 	return 0;
 }
 
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index e3874c47ed9e..724e5c7fc819 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -215,7 +215,12 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	return hsmp_misc_register(&pdev->dev);
+	ret = hsmp_misc_register(&pdev->dev);
+	if (ret)
+		return ret;
+
+	dev_info(&pdev->dev, "AMD HSMP is probed successfully\n");
+	return 0;
 }
 
 static void hsmp_pltdrv_remove(struct platform_device *pdev)
@@ -287,15 +292,17 @@ static int __init hsmp_plt_init(void)
 {
 	int ret = -ENODEV;
 
+	if (acpi_dev_present(ACPI_HSMP_DEVICE_HID, NULL, -1)) {
+		pr_info("HSMP is supported through ACPI on this platform, please use hsmp_acpi.ko\n");
+		return -ENODEV;
+	}
+
 	if (!legacy_hsmp_support()) {
-		pr_info("HSMP is not supported on Family:%x model:%x\n",
+		pr_info("HSMP interface is either disabled or not supported on family:%x model:%x\n",
 			boot_cpu_data.x86, boot_cpu_data.x86_model);
 		return ret;
 	}
 
-	if (acpi_dev_present(ACPI_HSMP_DEVICE_HID, NULL, -1))
-		return -ENODEV;
-
 	hsmp_pdev = get_hsmp_pdev();
 	if (!hsmp_pdev)
 		return -ENOMEM;
-- 
2.25.1

