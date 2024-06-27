Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CD6208A5
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Jun 2024 05:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466828; cv=fail; b=Jrhm0MIPfSpU4wEzfyr0/j3It5ndZQXge5k20CkAePQib4+fcBpvERr7BybjWrttflMxLrLn5fCT9u1bT19r61A2ckgWeuZakP5qpoogMvK2ErlTr5gZoM2cPN0LSEVcQwrLbg9UomTYebMfrOwFXy2PZ8eXNoXTlquLS5lkwfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466828; c=relaxed/simple;
	bh=uuo/DIE7syfiarAVApcO+6mD3y9NsavbFjAfzE+gucw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l5Sb2g/1ZyadSRPw3561iuH8GhTzovKUjt8mmED5WTR21yLo7k6hBEffELOLI4Z/pW7KImoq9WILKRIdUWNpBTy7Kq98mwNbpEnb9X73/8fkq/Z/7Y8ZtE6i3pydpdWPoSMuy2P3yY1ER9vhll6c2Am6XaUP8MoVLVaXJOCmf7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IdYvM0Gy; arc=fail smtp.client-ip=40.107.94.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IdYvM0Gy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4/auU4JP24W5K9RSRWmNNaitEVzUClP5UERMHuP7lmZaW4XxmDkLPoEXB5yNuOjbAs/4+pXQYWKQUdgnqFTYrdrqZXmwSXAg4io8H2HvFp398DnY/S58JbVY5rkE8wMXnMtOJb8uuwRvu4xmNHggqi4kQAbQtuQm/JLorDUCdPE8wuP8UiAlOrKNbkgE577xh74DalRxGyD2PJcYX1gmy2/3ojPes6MDHJrFOtD+2YTkSVDqNNeNfpDFzsbxkpe/XrSpzPRUfl6PJHRUpAaCd5yvwDmRUQLEDEwsMAXO5xh5pqkXq5DDiKhLwPnkWJlVhvxXZq+YgmnIwY+z+ibzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNmVgMMeGJPgI65Mla2T7buiGtaOIy3xZa6jH1l3JPI=;
 b=MYuWJJktVp+9qb326mFr3//2U1v/hm0Kb4xtMobqDs3cCSFm1/TiLC47I1tBoU3Hd7V+fCfpnUu4s+yXHzNcCnE2hoRNk2h+J1gdC62ousJ/f1g/lZbnwqaFh4kbxBL5hFW3re+Ox+upMXMbuG43d297Ny+iGtB32UG/1p3Snin6PjmjlrtNvUSetlL9FGg8KTSclct3iRGvAtqrT0zL5LP9i7hZgSAE2Z0y5uEi/DiGc5wPvunGdNGEbHwzoqO6vY1Xh80u5eCM++3zI8QgzK4mBXUETPxAH82eyuENzhhKIgoWaeQOa1RdJByVNCLFH5ghmKlcrMamnMNNYkPNtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNmVgMMeGJPgI65Mla2T7buiGtaOIy3xZa6jH1l3JPI=;
 b=IdYvM0GyYQOZGh2mF4/zT+d/oHpdi0lLFn+qtaesVHPDXxjlya15OxVnKi+b9Bu6zg+uxb4C/x4N76188kxUplIcNT4tF5gi8EPwHjiYJIGkpH9BnSmWwDPSt5jaFt1CBVNiMLgliIg035LTogpX95sjWNG1mB5FbsmOwBI2iu8=
Received: from SA1PR05CA0010.namprd05.prod.outlook.com (2603:10b6:806:2d2::12)
 by MN0PR12MB6149.namprd12.prod.outlook.com (2603:10b6:208:3c7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:40:23 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:806:2d2:cafe::46) by SA1PR05CA0010.outlook.office365.com
 (2603:10b6:806:2d2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Thu, 27 Jun 2024 05:40:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 27 Jun 2024 05:40:23 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Jun
 2024 00:40:21 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 02/10] platform/x86/amd/hsmp: Create wrapper function init_acpi()
Date: Thu, 27 Jun 2024 05:39:50 +0000
Message-ID: <20240627053958.2533860-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627053958.2533860-1-suma.hegde@amd.com>
References: <20240627053958.2533860-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|MN0PR12MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ff77abe-d6c0-4292-fecf-08dc966ba3d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KOWAGFBUq/el01e7CPeU5xpFha9lSJHJYXKxykSZedtrnMBkRslgXhMcfzly?=
 =?us-ascii?Q?xfEICIGPggvDIrb8StjZvg5SMkPusQ7VfJx+Ex/ttDdOwr+DtFRDFIXA0Hh2?=
 =?us-ascii?Q?EE+veTV1en0DgLEN+hSDBxRJIv9kkxIG1izWaNpjL56WfQBQed0gKllAV0UB?=
 =?us-ascii?Q?tXRuejazC8/5rcIulHIHzsVi7sX/gf1JCJ6Q77JQEf0+p+IrR8l3fAq6JlRY?=
 =?us-ascii?Q?JnkxOfip28Ly0Uot8/MYcRQoxLt7Ib1Xp3JhemK89HWVPlitB9BTK0nPxTP0?=
 =?us-ascii?Q?TuMJHn79skChvPzYa+RzYPWpyhrvZ7fmgaSaHvh0YyW7zyMG8DD8ccQkoXc8?=
 =?us-ascii?Q?dt3QXPTh/P7x3jD+1zbkpnDoYOPNfSFkn7ZykpKhnC5iHV7ll7fHW83xgCYN?=
 =?us-ascii?Q?fB3hTfn58KfmTFqMnLq/3Gt/nRT/41eURFJoDZUqxcwv5ibPe4q6yAJ3Gwss?=
 =?us-ascii?Q?3xuBh/LinsbkNiTA1z1VVY1fBFKwVuxG6LaLJlaGtGVP5sEtbL2h1vPZYQ8p?=
 =?us-ascii?Q?VF1j01bnOsHhuSPXu5VspqWjl4lIGe/Sx33YA9u+9HDAECB4xnLK0Xj1axqM?=
 =?us-ascii?Q?2p3Gwaqthc7iIASY13YyYWnHvhsBzdAQLMRm94bV+4+30SzzMAyrk2ptlux5?=
 =?us-ascii?Q?ZEm5IwJogidRHSvQQ1ptYjxMGxyZed4bA5JjS/GxCPVV8LGrqN9Bn1SKGeyR?=
 =?us-ascii?Q?L0+/IkREpZ3SLaWpe6+H0id1CckryNghOMZRBg2wgO4kWthcASdVPxZyymEh?=
 =?us-ascii?Q?GeTut5gm1kN+IJKEmg56N2+uRAnNMIvhk4j3XR/EHdKXoND0a/7+jtShc3FT?=
 =?us-ascii?Q?NT7WoxkMh6Ag1R5axr9k4CWvnbMIgKC9WX534Y9cUavqHbQVEJWdMvCDKFik?=
 =?us-ascii?Q?QlCbIXiT37pXHWiS7VfE3wQsP7yctinfny0HWV2fpa+w73ibqJccAadqEufR?=
 =?us-ascii?Q?wm9rcCCa2OiTPeU7171hz0JQONHWrm7y1A3fqaoHTwxLaZYU9gkgYr6gLUXN?=
 =?us-ascii?Q?DFYzUzr6ZUW68MKZhdsNGaNLek1EbSvW7zS087QDJJ+PE0Eg0vlgM/HwteZx?=
 =?us-ascii?Q?LUghXp74hKqpPxz/1mL49am/HaCMmcknNwOXggsgAtqz+637D8EJ6sxe7+yy?=
 =?us-ascii?Q?MnSyPebK4VUsg4cAWWYjoiFDqEBaSChx/u1u7Qgx8ncodzexmlAjsZOZwee7?=
 =?us-ascii?Q?rw93SHjcU0s7xHC1C337h6PUDJhLY74FmzS1gTSLJGGXBaPGzq362QtYN9J6?=
 =?us-ascii?Q?OJx3AHGTlHhEYzhq0zycyMHcu8W7WVgV4EHRnhjk1WAAkI5FT1+TetdhKa31?=
 =?us-ascii?Q?g3/qUCxtnrD8xKwGWWMnZy6c97jsJzJfWxNQhoG1bUIha48Etv9c2MIyF4o1?=
 =?us-ascii?Q?Hp1SwNqWovqG0/454mGCxjrkUeiNq/D7mJpRJDx/hCwRFaEvc4L6EI9P4hsT?=
 =?us-ascii?Q?ZXklaWU9Bx9YsRv3u2xbq6pFGUD0xsTO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:40:23.3233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff77abe-d6c0-4292-fecf-08dc966ba3d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6149

This is in preparation to splitting ACPI and platform device drivers.
Having init_acpi() helps in smooth code movement.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
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

