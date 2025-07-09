Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A855428DF22
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Jul 2025 10:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752058488; cv=fail; b=T/vBNPUtDZn4mkqg+zKcYr7SxfFfI+6VxJksHoF9UuP3n6t/RqEFgQ0E3JIKD/IMsLTgOSAkp+M5IaT9fMI2Po22mF3T4CzgYBud9maZknvEopIE+a+xZI0bSS76ao2Kr9L4YLPVc93mzi7Hxtr/q79uiuYPQ/IGRIEMWo6ZVxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752058488; c=relaxed/simple;
	bh=Cd3REQ9rRqJ6bvZULxmtfPR4jPrn8pzgTyei/Ft40po=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gSxLMEn4crgvm6RG4JghLX3vZYmQF4Lk1xw3h6GZq4y2tYF4onr2W9UaxTfiNlhAVrRVFB3WXrwQJaxbkqdRMvPf3Le2JAANjiiIs55oW7mVppYSJm2xhgXf9hnjk/ZwL05xLmLq3EWiVah/VG2hEbcf8KvI3zYvD7V7S6xcEXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nBLOqjnG; arc=fail smtp.client-ip=40.107.237.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nBLOqjnG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhYwHl/VAW3x+91rCuF2fY5jBIBdnFEtsXFh/6axFxLpiBbud6v1MAGrnQCOY2PQtBKJnscKk0jIv/t8J/axbgJDw8Fm7+8h1Shad2fz0IyHvUJ//vCZuDoXom3Smfi53YUPW47VTCncmGPZBFiGrZUw+uekg2NamFr4gCZkue90w8ZHUcTSSYg44BNvEyF7Wj3oOQi5Xuh1CmcuuS/s65m8WvMxCgFs6SZ2hV7Q5/8YJt2TLPfk97/fBVaUhITNAOT+OoC5Yp7FYDmMiGJYj0beZsVmEb/kgP4ewmVF2OTShZHVonP9GQ6B5+YXjjVxjkvRoVGgCAbyLeJwHW8Xhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDt2Ona5Ciyze8M2qQsA+fBuhDW7YfY9qLDnqShVp0Y=;
 b=IUMJFepYNdFwBtdkfBz3ihuds/+YNEgFYSvHBqehlYRT0m0P9CTZpEcuwEkrmDPlBRxzI5wyHM0SkC8b4MGElJ/1dvkf5yDvtgvdaOQU3WGvQM4bONHRG+xm5iLmKR/VvNNlf0eoOl6+V3AFfGlCbTxNNTxkIL8hbUKUEeJB/TSZjkAEpJ5Knuwk9gwEI7rmuQvJ+zrf3j36WQdlH8z9sL9ZBruQjFCoLizvs3L6E2vpp7j0UkeSY6A4dOFZnw1tqCzPEkOAXSmoWeeyt9dlgeqF5fChuXo511qPUJwZSsooq/pfJt2B4RqJSuuG4hqs1xM6YA+0Fjso1YyQScIGWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDt2Ona5Ciyze8M2qQsA+fBuhDW7YfY9qLDnqShVp0Y=;
 b=nBLOqjnGCN6JV6lk+VtVKMyMXrSb6hAG/hRH5iS2tbNhJsRWDLQP7mWcSMF0xZ924rLay4SFcc6sFPkEcTvsi4afg9AfY3Gjdabgx3DvPO5qCGLoO/Y/FXpqKvGBTF3jNsk3l81CD22JqPqNiTJ6xbdvW3Uu6KVvddWRWJIk+00=
Received: from BL1PR13CA0160.namprd13.prod.outlook.com (2603:10b6:208:2bd::15)
 by DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 9 Jul
 2025 10:54:42 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:2bd:cafe::6b) by BL1PR13CA0160.outlook.office365.com
 (2603:10b6:208:2bd::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.5 via Frontend Transport; Wed, 9
 Jul 2025 10:54:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 9 Jul 2025 10:54:42 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 05:54:39 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v4] platform/x86/amd/hsmp: Enhance the print messages to prevent confusion
Date: Wed, 9 Jul 2025 10:54:13 +0000
Message-ID: <20250709105413.2487851-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: bee823d2-062c-43bc-0574-08ddbed7025b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2vdi1gLjdr7IYBcAC79ygiYRIKF2Iti576wZHhfYZe0megF+DIalNo4gsxQB?=
 =?us-ascii?Q?qF3omSMRlbQ2sOzXSqJ0yWpHBTN5B72v0P0qqmW6BPB3GeePHC8QpsyT1mKJ?=
 =?us-ascii?Q?PtDGeuhTcffkTVr6aSCT6Q2eSJKlenJayoNOyseyZurqyeEbuLhPU82185tC?=
 =?us-ascii?Q?rE+hgzU9idPbiSCs8iM2la9SJn7kBrkG7inoB73xmOvYjCCLYssf0z+4SIat?=
 =?us-ascii?Q?aoFhAexbtStq+ZjTDUfcxowT34icPzV+mze6vpkzVwbuW4c/HuL/Ts4k8sao?=
 =?us-ascii?Q?hT/7z00a7nldK7WTaiVr3Z/oxSGdDzZ05z/pkrjDbPOX8ScAFUkkYd9VMvBl?=
 =?us-ascii?Q?39G98G0NqUOy23Nuv4zs65T5fAyEtn5+VymVa7W6XNqUq2ka1WVnney18yZq?=
 =?us-ascii?Q?0+xlfiYTFn1vPkBjBozy2A3la+A7L+oQeV2KnhIezaMgKeV3or7PKxYyWcNO?=
 =?us-ascii?Q?CfxJB26SKPeunv7jkBmi19LIGXjVHl5q/bIdAgjeRrxo2Vxpi1dKaqDQ/G4J?=
 =?us-ascii?Q?B9s2JbRPr9xHy/ICbtdiCGBENSXvppF0b9rTVIJESaMa1PXfv51vq+tDFitl?=
 =?us-ascii?Q?VYmOmOL1eYGnsTOevM76EdDbJ3EB3HS6fVH8Y9vNY+t+rpEN8svcXXvwZ17q?=
 =?us-ascii?Q?6hZ9aXGSns7ryDzLjy5t6yeIthp7O62Wm3vI6twmXrfBHa3gq0CWGZoe6WVr?=
 =?us-ascii?Q?En7rSDIKT3+UiClxEe4P6dwyDcCY8tq++ZvnLHQagJt4yJmiq5N88CCGnTl1?=
 =?us-ascii?Q?CsOhKYtOC9HVRz5N2OrVdRz+MRGlFSiEgjdavhqfT0dAoPDmOaiWSpBzMdDM?=
 =?us-ascii?Q?NPRObKO8BHmjet0f3O4P0yxkl1zQw3ftC1m+AcqutAzVDBVmq4T1zSruZAhV?=
 =?us-ascii?Q?Jo0zOM9YB/udFT51qKjZsSrffaqxYOebnhKlN8DxIuQ+kXazDudxqKliu33z?=
 =?us-ascii?Q?QJnA/aNnD51fYpK1xgoq1tBEvRzml2dM0i2NODnZKzF4OgpHc8unxnobxxMQ?=
 =?us-ascii?Q?IbB/+uAMUjwb3N5cwJ1EW9xNk2Tg6Gwo2aIl4kGYLK3vamXlnTJPnbArxfSI?=
 =?us-ascii?Q?rgVcd1tTiNj5DO6NAeWa+6nHQXJUeZuidcHWpK09FHABh0nCRJoyLl7VRBvR?=
 =?us-ascii?Q?kAS64nyQn5sSxZDDFMrzxf6QZTR5/mOyS6kBR5hEqzUhyI8yJJsUkqyZdPua?=
 =?us-ascii?Q?J11QPeuo686O5KMhL+/sIzbghR7KxTqApTQkmYejnMTF1jo+2TbNLwb90Zzd?=
 =?us-ascii?Q?IXhXNzK0xOOceohGifuunDCqK9N60ydlsxZkiCzP/lpDCPcggDBy/7BqhL7a?=
 =?us-ascii?Q?1LCq4VAqZrsEDB73HzjKTW4axSE1nrATON0co/mzrJbTSwBzKsJxBOzqyIjL?=
 =?us-ascii?Q?ifYml87LNKmJcxJtTXNQQ4LWqD8y9yhYeP8gVEr6OqMgfrAAObGevbR7lPlI?=
 =?us-ascii?Q?mSu5ALBAClUAOB2MiZ+26Eohf1mhmWtOUm/v9xD6c6hASGkjAEWQbRfm0qL+?=
 =?us-ascii?Q?lswHftybhvcj2EyO6RxwAbcxIgfq/JdugI+6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 10:54:42.2799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bee823d2-062c-43bc-0574-08ddbed7025b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

When the HSMP ACPI device is present, loading the amd_hsmp.ko
module incorrectly displays the message "HSMP is not supported on
Family:%x model:%x\n" despite being supported by the hsmp_acpi.ko
module, leading to confusion.

To address this issue, relocate the acpi_dev_present() check to the
beginning of the hsmp_plt_init() and revise the print message to
better reflect the current support status.

Additionally, add more error messages in the error paths and debug
messages to indicate successful probing for both hsmp_acpi.ko
and amd_hsmp.ko modules.

Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Suma Hegde <suma.hegde@amd.com>
---
Changes since v3
Replace #if IS_ENABLED with if (IS_ENABLED())

Changes since v2
1. Update the commit message and description
2. Add dev_printk.h and kconfig.h
3. Replace dev_info() with dev_dbg()
4. Add few more err prints in hsmp_acpi_probe() and hsmp_pltdrv_probe(()
   hsmp_plt_init() in the error paths

Changes since v1
Move successful probe print message inside the if condition in acpi.c.

 drivers/platform/x86/amd/hsmp/acpi.c |  9 +++++++--
 drivers/platform/x86/amd/hsmp/plat.c | 28 ++++++++++++++++++++++------
 2 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 2f1faa82d13e..d974c2289f5a 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -587,8 +587,10 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 
 	if (!hsmp_pdev->is_probed) {
 		hsmp_pdev->num_sockets = amd_num_nodes();
-		if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_NUM_NODES)
+		if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_NUM_NODES) {
+			dev_err(&pdev->dev, "Wrong number of sockets\n");
 			return -ENODEV;
+		}
 
 		hsmp_pdev->sock = devm_kcalloc(&pdev->dev, hsmp_pdev->num_sockets,
 					       sizeof(*hsmp_pdev->sock),
@@ -605,9 +607,12 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 
 	if (!hsmp_pdev->is_probed) {
 		ret = hsmp_misc_register(&pdev->dev);
-		if (ret)
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to register misc device\n");
 			return ret;
+		}
 		hsmp_pdev->is_probed = true;
+		dev_dbg(&pdev->dev, "AMD HSMP ACPI is probed successfully\n");
 	}
 
 	return 0;
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index e3874c47ed9e..f8aa844d33e4 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -14,6 +14,8 @@
 #include <linux/acpi.h>
 #include <linux/build_bug.h>
 #include <linux/device.h>
+#include <linux/dev_printk.h>
+#include <linux/kconfig.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
@@ -215,7 +217,14 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	return hsmp_misc_register(&pdev->dev);
+	ret = hsmp_misc_register(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register misc device\n");
+		return ret;
+	}
+
+	dev_dbg(&pdev->dev, "AMD HSMP is probed successfully\n");
+	return 0;
 }
 
 static void hsmp_pltdrv_remove(struct platform_device *pdev)
@@ -287,15 +296,20 @@ static int __init hsmp_plt_init(void)
 {
 	int ret = -ENODEV;
 
+	if (acpi_dev_present(ACPI_HSMP_DEVICE_HID, NULL, -1)) {
+		if (IS_ENABLED(CONFIG_AMD_HSMP_ACPI))
+			pr_debug("HSMP is supported through ACPI on this platform, please use hsmp_acpi.ko\n");
+		else
+			pr_info("HSMP is supported through ACPI on this platform, please enable AMD_HSMP_ACPI config\n");
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
@@ -305,8 +319,10 @@ static int __init hsmp_plt_init(void)
 	 * if we have N SMN/DF interfaces that ideally means N sockets
 	 */
 	hsmp_pdev->num_sockets = amd_num_nodes();
-	if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_NUM_NODES)
+	if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_NUM_NODES) {
+		pr_err("Wrong number of sockets\n");
 		return ret;
+	}
 
 	ret = platform_driver_register(&amd_hsmp_driver);
 	if (ret)
-- 
2.25.1

