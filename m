Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0790523CB
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jun 2025 17:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750352722; cv=fail; b=aXsPLr1HF39ctOoaJZGDOz5PUVuRkO6GEqVi4ZOolQYkZ7FVV3n8MHbhZ2nkp2EPK1qduZVskFkdG9a+IaO6CCpXT0GwYvvTRz2KcRLh/DiK1OOl+pWYdZLapGoSPQludS0/qvaNsMv5+amB7ssdvBatbWzCldr+2geQXj3XwC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750352722; c=relaxed/simple;
	bh=38Lu7G7Q/8oT4AJOElJx0qaBACx1sOITkzx8JcuoRWA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sCwbWTi66Gflo8vyjIWmzmjWTolbMF6FXontwvbch8UkTswbe1MafBhwCR5cbxm4bR917Zd9w7UFg45NpSapMXrzw8RJ1gLoQS4fuyXaZHBa+lo80La5TG09EZODhOpyu4KvYac17cPNewNT+GJcYGnaklbMqUQyRamV4xrq464=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jiCvDnu0; arc=fail smtp.client-ip=40.107.94.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jiCvDnu0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfsukqC7dOkUANB5oGYCnLIj1N3Ta4v4zDKU+WfQNDebh5H3oPiQa5Xph1Y1TqFbv1SKXxLk5LNMfQVbOEOjwPsi7gSsiY058UR6xAQICXASB/9EliKRdddmThogVFLVMJn4/2hux/eQ0PHHAR/tYgvA7NKK2/33VGYHc1002qVzU8Ylv5uu8Y1q2JRWZH6FRF9CHbl+0/8zLDgZIDDWLCccRwp//Zi1qmZtwQHP7IaZJEyygpDfLIbft7NxkO+7SpGXlFP5W253ocf10XYNsgXfwUBNyXXk7NFa3+irub74mXQt3LjKh7H6P7QL1LDDEuUEXM3C+csDL4lQYnCryA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPuMG+0h+YcJ6MtxjkD0OsHQn4lz4fv8cLGWXjnnHkc=;
 b=qKJWC1jAC+N8shnV0pJYT78Fz1wTrUKs5sL82zyiGSlaSfBUJPK+NrNKI+4XyZaYTYq6ft/ROp6D0kbIQAMgKYT8VvNeyMk1+TxXHo4vyBaZAaZv0znFVNtqR8yHZEP9lqsyhNWrLiuWRgI+hP2Igam7jSHS1esV4tdetFwAsAGOSFJUW2ZwMVepjONPFN1s0F/XW/YxkU5U1y1B+DHijnp165Uf9IpdpcImfkEt73oUX4fNXoyn4KJx4EfD8vl3eK5HxLyrNeDGXuk8uKiPZjWmis7PCN2Vn0Jvo+fosF0crcJ9rFpoEqGGPcWgv8jKPUjvjrmPC2N2FiC+IQrZiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPuMG+0h+YcJ6MtxjkD0OsHQn4lz4fv8cLGWXjnnHkc=;
 b=jiCvDnu0i/qKfs9bjxulvQ7V3z98aEB+aqC9r2NfsWT7Y1T2JTOgxUPO6dMc0tC+YoF7Pg/lKHA2S8QRKTME9tV+4ahLPQr6vXrfBOQCweA2zE6Bj9xPhW2Rat6VMJlQnLOz8rHXnCLnFkhvHsQ/+WE2LOOWmyJXCxKZWDfyLUM=
Received: from CH0PR04CA0110.namprd04.prod.outlook.com (2603:10b6:610:75::25)
 by CH2PR12MB4102.namprd12.prod.outlook.com (2603:10b6:610:a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 17:05:17 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::55) by CH0PR04CA0110.outlook.office365.com
 (2603:10b6:610:75::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.34 via Frontend Transport; Thu,
 19 Jun 2025 17:05:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 17:05:17 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Jun
 2025 12:05:15 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v2] platform/x86/amd/hsmp: Improve the print messages to avoid confusion
Date: Thu, 19 Jun 2025 17:04:39 +0000
Message-ID: <20250619170439.5548-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|CH2PR12MB4102:EE_
X-MS-Office365-Filtering-Correlation-Id: bf794660-2f8a-4be8-6c83-08ddaf53770a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sxaRRAUE/dE8u7nLE+GT62QK9Z6Jfwk3g7Q0xy5BUAu4A6/ZsUngi9BQbwPa?=
 =?us-ascii?Q?qkgHifDQY4uFJK0U+elFTvVQTVGo3qGom/1l7O5C3d34Aq9vw/JDoLDurTeg?=
 =?us-ascii?Q?vuG3/86jJ//Zvno0hObgCaEJmvbeksbTaVThinWKWTedXaNvydWdQryHIM+f?=
 =?us-ascii?Q?m0BkeFPzJKQip/8KIiGJi7l7nrUBQ4uPlWu7DptOz3CLOFVdUYhKCrN2ECpH?=
 =?us-ascii?Q?nB7mR4jVgwvr4QPZBRiDtcReL+c3SsxViUX3mK8HX6E/dNltuMir7pPBSO8r?=
 =?us-ascii?Q?J0iIy6Yb3qeApv0WBqSQRRZ3VgnNXh2cMAu/0dUJEbf/My71ChcnaaCAKu5h?=
 =?us-ascii?Q?mXzzQbpClXQRpTPJbfsK3ie3D62H+SoaGKVUMgFrNOXEeUcrmbn2zaundCLa?=
 =?us-ascii?Q?0qTr/1M04a2eTtAZtzoUSo1xU8wJXMsR4Rk9Abhpbam5RiwxKS+yh79r2r5V?=
 =?us-ascii?Q?XBDFZOWpO7wCfH6t/II0YPqyhy+IYsb3SB2DiL8b5uMSEXrQm8kJ3CF4/KoA?=
 =?us-ascii?Q?BxCt0izLoNu7pauCxzyzzw5T7AAdw3zbLJDsCPbLFVgbySI3PXrdn5SfTB8q?=
 =?us-ascii?Q?Ft90ewNHaOB44VVx3wB+M/MAo5Q4M62481B+b5EO6M1ovbiHwA4JogNAeyzA?=
 =?us-ascii?Q?SfTfnSAQSarWhwVYs12uqw5xXt1EZfE8UXkmOOv61tRl3ObL4M2X+F98N01/?=
 =?us-ascii?Q?DDtEX3yNyqnZJL7kHXSTbqbe0qtrI1/DIGtJ4H5LLXeISknkJf8BbCYjI8Wf?=
 =?us-ascii?Q?l8tETGUkMbPn+q7uzzzmzsXdfvh1hYLgCLjnFponFaAKGx+WZuDDthyLW3NU?=
 =?us-ascii?Q?SnDSrfZYSQcofoq4k09tGKRlFJhb6wrT9zJsZtX81d0qiEAHJbWhiCkX3FXa?=
 =?us-ascii?Q?8c2gvoWC9kNjm3wiZvTYTFDUR/c823dP8gLtoEPmndZuLy5L1axUW32++a3d?=
 =?us-ascii?Q?F98LCciiwbztBcY1T7JqaKSJRDBZlceFrBzY8vujNLxRdmlFXLGIWbHzQiAq?=
 =?us-ascii?Q?bG+JsoZpjUl9K1mOj+O/49cp2NklnVZp6luy27xDKlvn61WcVBINLr7BHV85?=
 =?us-ascii?Q?5fFJrvoS6Lfr0IZMPCBRBvehPqnLGdZrLn9MRvRKbhtq5ez+v1iE7FImewAX?=
 =?us-ascii?Q?+MqV1JbpD4nLJOFjRhOFO71X7O/FO1QPbmSMXYPwh1YSM8NsKEXMG97fN6S1?=
 =?us-ascii?Q?tsHLA8wI4sb0yO2H0QfirALBSSXy1vsz5oQBZSoyDbVBz8qPf9pEQxqwrZcd?=
 =?us-ascii?Q?eCGf4GtVEUBTepJtjtUSpom8HXEgePI7UErgeJtfQ76wKUu5Vy8RZ0Xp7dMq?=
 =?us-ascii?Q?NKj6UYJKBGgyPLtZAUamsb/8QxBhzR9BykIkVRVws1xG5+w+frBtkP4s7M+q?=
 =?us-ascii?Q?hjZK/O+ACLyvORN0rTBuL1+bWcmw0oMmC/zIUcqHb2LTCSVJvTRHODUpRqK7?=
 =?us-ascii?Q?Oq43dlETdSlYFkxJA3NnKQyGjO8bMTvziNgvZjdFKZZ57pD4cUqzGC9/AXOB?=
 =?us-ascii?Q?LV1zD74ArThLFOKahxbiwTXccTDcH6jf9/ZP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 17:05:17.0191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf794660-2f8a-4be8-6c83-08ddaf53770a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4102

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
Changes since v1
Move successful probe print message inside the if condition in acpi.c.

 drivers/platform/x86/amd/hsmp/acpi.c |  1 +
 drivers/platform/x86/amd/hsmp/plat.c | 17 ++++++++++++-----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 2f1faa82d13e..bdfb86eeecf2 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -608,6 +608,7 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 		hsmp_pdev->is_probed = true;
+		dev_info(&pdev->dev, "AMD HSMP ACPI is probed successfully\n");
 	}
 
 	return 0;
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

