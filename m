Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869BB35959
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Jul 2025 12:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751977590; cv=fail; b=CFTL9k/lenT2lxP5Gr0mfVwgu4xFnAA8S58ZSYNgJsSfXnNKvHRK7yE95cRu+IoE6QPIha54bZQPMfh8FYGmw3zLbL+f6c1yVP63lzIsW2C3pGtbV9UDRNCwP+uIe+LXRtly39w6gm4+pRcXgtUY59JDOVDlmFPfxvL59wCPugY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751977590; c=relaxed/simple;
	bh=8OyG68er712EaSsJNAE3+tCGN4E8JvOMDC1VyZ1IdDc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ijsDnDc28ZDCOQ2wk15Fn+IxE11CrsgZbDMTTIWn2TehSKraiujvhZUyQy2kd+OMgk8lgDFKpok72phuOhNMuLHbML70SLEySk6QKdCMAoXtoeRj+CF1VZAwedK0waEdozpXdGkYMaRDVqytsOdGFzEZVwKRs+VDUQ0198nHTlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rvNog1Ku; arc=fail smtp.client-ip=40.107.244.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rvNog1Ku"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmgjwdxXT9NolhgBWyfReKsG7HrwkzSYnJFiaN8fY+OE2JAbbNROVk6swqoi0jRmcnxeEoO7ol8lnAfdWZDqQaK9XMVxnzZuN8+T4Iix6vpfARz1v3g1UVO0pVggPa5/dgjHtdsRwFRnFRI4mqnAmR3oQE5NIqpem876ac5uvMDdmvSkP5p/2UVU4khIGSTbGjVq4jkuFduTVGZEQ0Fpz2t5fDb0sotj96gK6z4Ivls7WE77E84P1jtGuh95oicj28SK348Oc2uwRGbV/HD3FK+hdiFPwZqS+sksBU+K1+ydCWmn7a/609LfZDM9z0jZmLJTrVMKRwR+LSSOGPSLWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6eSv6t8cCbGcQ3Q4aEBG1/CuzAu7QlKh4y+62hNdoU=;
 b=qUeBtXAYqcC/XefOrW0xHPaNPHsmZfuT7i0e0uihFrTbhgecF8Go9t/bNpRNcAT0XqoihiMda2PXtL2Ar9QdaQCcdH+/a3DTfQfII/uX3MkiKTuvRZ9EMR+0tSjBQ6A3cwPrEZmFITxPPyNoQx5NxfWffgnbqcmss0Pj1ZU8KZvmlJIt1frDZBOVXSHpRVrcYXrde+aHShMohzRNNd5JQY9noGRnJ5U2QM+OQAPH5GdxiREmLYlTdbWyAE4+tPXwUFcUVnP4uQbco0YdsW+qIDFpesB5u5QV5buHgFvey7GLAMJ7z0dlauGCo7ODXJmHbR/Z/+tj3Cj+AoG3Crdifw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6eSv6t8cCbGcQ3Q4aEBG1/CuzAu7QlKh4y+62hNdoU=;
 b=rvNog1Ku2j2CtDP1C1i9H5/OS0QsqLr/bVm4UcTfgr7GkDHwz361UUXrdKaw0hh3nFZTcG2Lz21mFXdLFCApvV2WaBm0SyUc2VqEfh/wVxgfHjTImc5Pm7IV21we8E0s1B+VsYLkrMRT4yxv1sz1KItIvvNo9Goj/ZIYOGUsqhs=
Received: from CYXPR02CA0015.namprd02.prod.outlook.com (2603:10b6:930:cf::16)
 by PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Tue, 8 Jul
 2025 12:26:26 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:930:cf:cafe::13) by CYXPR02CA0015.outlook.office365.com
 (2603:10b6:930:cf::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.20 via Frontend Transport; Tue,
 8 Jul 2025 12:26:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Tue, 8 Jul 2025 12:26:24 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 07:26:21 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v3] platform/x86/amd/hsmp: Enhance the print messages to prevent confusion
Date: Tue, 8 Jul 2025 12:26:05 +0000
Message-ID: <20250708122605.1436917-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|PH7PR12MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: c6a86147-ad4a-4cca-3b55-08ddbe1aa7c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vIZBAEENtnkOxD7Hs0GZTLTIn732B6wzVsFBFT4vuo+gUVpgxyUG+HICVad8?=
 =?us-ascii?Q?T6HymOCv8QdaRYIC6nRmzHB1u8dSG0RFOPIfADx7BzN4Z8lZE5v6/ka/MRLE?=
 =?us-ascii?Q?4baZfidKZTmRz0IXkhUUt2v+2+gfQr1wsZQyxaaJL82TpkAOzl8jcmZ9nuaY?=
 =?us-ascii?Q?FoACjFBJDYzlBmp9gpgUvzQdyFl73zZavguXAtv3bBkAVsLkcwnbxLh4LlDf?=
 =?us-ascii?Q?lTPyPx8FCUDjfS0igFvjxIi+kx02pu6+SVRl9p9YWtWk2ycskaLB1qoAdsTC?=
 =?us-ascii?Q?Sn9rVXqqn32+gpksAWqpafkmAFjwnQBqH0DiLCNB39i4j8sEl6mPstJmNRil?=
 =?us-ascii?Q?IIq0weS5G6XsmgyvhyC9f3KAViYvmKRKDpXt1+OqqG1UhfY3lXl4TD/AUS7i?=
 =?us-ascii?Q?e2Dr4URZzv+vwo/3qUET/KkETBYik9XpkN+Va/J8qhSrnVj6uuqudf+PtWGf?=
 =?us-ascii?Q?9X9VrydYmdqLqQ7b5E3UGLlJeQdArJbQoKaWTL8UWFmnvW88IQyTNpzsOtDp?=
 =?us-ascii?Q?Z8KBYAor4QCYNpNagComvYFKHcGS8ZDblh4l7YmlC/3NG7hjeViHGXPNugwq?=
 =?us-ascii?Q?311rmK3BZ60h+VaNDHzLBGFAVvISmJsg25EfDJ6KkXVQ6BeuROWv17q6CvEy?=
 =?us-ascii?Q?fzAYaP8/KUAkjak0oZoHX7Zrawcf2opByM4rw8CbbkHtrgWNOK/EN+YqMH+0?=
 =?us-ascii?Q?x0UZBHxYVyt+FYqItNF3w8+SNJj4hhxjVBw/QU9cKvmxxIhof1n6R9HvMSSO?=
 =?us-ascii?Q?ugrnded1XOcw/xYL0cjnyRsoJK+39z0eKsA8H684gRjmm6y9oNZAi9A7CpOm?=
 =?us-ascii?Q?wuy2Y/YUjcrTtqSPrn9KcuPhbd3edPSUumQgyQYQueoFkAwWyusoEo3DIrVM?=
 =?us-ascii?Q?nfCw73DzjyAuCFSxp3yIy2LtOtCfmY/bhrlgnHqwYApeRKzwQD5U1xDs9608?=
 =?us-ascii?Q?47N/PBLhsSQXjM+FLBejKSB3oHoFapUwAhyW4COU+d0iRTK48OQ3za8eZAXI?=
 =?us-ascii?Q?+nvQG23Cvoo6Z9a6uEVqy2DvcNAIK9T2axlsvJdaewpusdP/P62jin8yxhwa?=
 =?us-ascii?Q?krOJOlhh6vPJy5tqrnuUghixkLNN/ffA1hHBDZg3kPgDIYGMmE9zonWc5OuS?=
 =?us-ascii?Q?/CIpWsv4cpJLQ4SXv23ZkdyuBfyu7avEJtAIIDAAMaZqFRDiXHs6IuThVsQp?=
 =?us-ascii?Q?82GzcvD3eAB8hSVRl0MhKaFw/LhJ14Y6/QEIA4p7FYeFRjgrngItK7R3un7c?=
 =?us-ascii?Q?141Ue96nZUN3VTe3y4rkczgRRBoZsGVb75WdbI9fxXw8P5Ga9EFCA3Eb6y1g?=
 =?us-ascii?Q?p8vVV8Eyu9IE/EuTnunZVRD1Ni+sj9twLlM1jslQuoHzhdEqlYd/3cUXOMR/?=
 =?us-ascii?Q?CtuxrrNxi/uxUsbhBfxOQunax4Wew+jXT1unQL1kJo2HyeWOXGS2qIo58ihI?=
 =?us-ascii?Q?4SxJ76l8Id76hHrwTA1lWKqvD4Mt/P6VLbhooNQYn83F2mEgAj7koJ/N7NlJ?=
 =?us-ascii?Q?UWVW9xrMyu32Nue4P2YpfyY7d0HsSKyTuf+f?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 12:26:24.8422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a86147-ad4a-4cca-3b55-08ddbe1aa7c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8056

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
Changes since v2
1. Update the commit message and description
2. Add dev_printk.h and kconfig.h
3. Replace dev_info() with dev_dbg()
4. Add few more err prints in hsmp_acpi_probe() and hsmp_pltdrv_probe(()
   hsmp_plt_init() in the error paths

Changes since v1
Move successful probe print message inside the if condition in acpi.c.

 drivers/platform/x86/amd/hsmp/acpi.c |  9 +++++++--
 drivers/platform/x86/amd/hsmp/plat.c | 29 ++++++++++++++++++++++------
 2 files changed, 30 insertions(+), 8 deletions(-)

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
index e3874c47ed9e..d4eeac0094ed 100644
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
@@ -287,15 +296,21 @@ static int __init hsmp_plt_init(void)
 {
 	int ret = -ENODEV;
 
+	if (acpi_dev_present(ACPI_HSMP_DEVICE_HID, NULL, -1)) {
+#if IS_ENABLED(CONFIG_AMD_HSMP_ACPI)
+		pr_debug("HSMP is supported through ACPI on this platform, please use hsmp_acpi.ko\n");
+#else
+		pr_info("HSMP is supported through ACPI on this platform, please enable AMD_HSMP_ACPI config\n");
+#endif
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
@@ -305,8 +320,10 @@ static int __init hsmp_plt_init(void)
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

