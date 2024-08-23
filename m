Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED15E13D51D
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Aug 2024 07:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724399790; cv=fail; b=U9MrHWTJ0+VEZol/eg62dI3xwXaISJWaC2/I2sP+NqcyeRl334WTbQWz/CNB6p5e/YiSLXye4qHB8s/UzUfgYGRwEVy2uZwv2q0KskNmrjaj4JEZRC/khdsDcVs3HLmCi7anIDam2C7GCPwQRGGOiScTeZS9ymImo3LmTPHsd6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724399790; c=relaxed/simple;
	bh=Zam9+1l7LWDl141DrbBvL0vxfYKE67xUM/QaBL+sy28=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tUhwC/v8yITzS+6qDeVeeelC0SGwY9Mu3korDvveQGX/7J9FOnnbF12gisPH+3hBisu7hsNAZik4iELArdwez68wltUqY9YMrDGRhpuhzjjqgIZktwDqhsEi78to97E4JnGRD8cLMO7L6K+cH1VwErC4okK2ZNhnpEi/vLiCV6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gcpEFY9X; arc=fail smtp.client-ip=40.107.244.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gcpEFY9X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cReFcOCDRM3efQ4W2M/Lt7C68XFHwTzwbmiOmJDco4Ei6/b/ol0saU6JOct0oN7fjPq6SIVyFV9p9+4HEs2xBp+W+yt2k5LHdh2FSPNXJBE9P1UqJtNVeHun+eqwb6/DLkFvQQ6x/QEcaPXgNPbuupzftdHgjkCRZIBU8OsjiSWB/lfTRTytnwBOcUHjNoo4wXozA45FhjfrCuvv9bfMHazFLVy/1J9NxstAB2itr23FEyCWfbtD7uIKqod6xdV8v38mGKvfxUzjFeSizu7ECAB9SaUEn6O1WlNLv/wwH1rqjXy9/zOZ0vOd8c1IgTJswwjAMSiXOCDCkCLO6BDKFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzQ/f/z5mGMN17BGi/zHxx0wv8UlwvcGwWkVUz50PdY=;
 b=DK38GG0Rw7f4UGR5BM0N9aZA8nLAN/DWgxKTGUvE0DvPFYBUMH38lKdmliEzscLGLH5qwiemqTShtTZs/PuOZeAI6Pt9SyALUAeqO8JFOl/kBW5bCku6O750F7obWJIgt1JVi8d3rPnCFYVJucJRIFuZsRbHCB4fABsQd9Hi/31Oa13iM1SdSmehs+a2UUx415BEMcb0DgnW0IEZ5EY88O5Krb+UH5H+7/ollIwUyogcBfcJO9rB44GJlEtj4tz0hq4VYLWlKv/5gYizTISo8wdCtw6r/4VTKtfujxhlxHH0vvZpZzcoqycHt1oGBx/4w6lpBx64y5Wj0a/h0bXj1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzQ/f/z5mGMN17BGi/zHxx0wv8UlwvcGwWkVUz50PdY=;
 b=gcpEFY9XPyy8QRUgroph52JpRrxBrBkgxmC2ePZWlDGx8LT8DMihqSMaHsmEB6eMCAkbdtHV61RWaATWGbjovKM8aIYLf31MG/VamoBnUPQC1JoL8z34quNgF68iOMUOiNbuJr8TZfrXLms3A+CkevtQErthTu7dF/g9KhSds/4=
Received: from SA9PR13CA0119.namprd13.prod.outlook.com (2603:10b6:806:24::34)
 by CY5PR12MB6623.namprd12.prod.outlook.com (2603:10b6:930:41::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 07:56:25 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:806:24:cafe::92) by SA9PR13CA0119.outlook.office365.com
 (2603:10b6:806:24::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Fri, 23 Aug 2024 07:56:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 07:56:25 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 02:56:22 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v5 11/11] platform/x86/amd/hsmp: Fix potential spectre issue
Date: Fri, 23 Aug 2024 07:55:43 +0000
Message-ID: <20240823075543.884265-11-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240823075543.884265-1-suma.hegde@amd.com>
References: <20240823075543.884265-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|CY5PR12MB6623:EE_
X-MS-Office365-Filtering-Correlation-Id: 117a6bda-1d3b-4af3-ea26-08dcc3491621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L5OXoNe9FrkeK/9zsNPolXkyUfZtbAjTAcJ7f5H7tWhbdf0wzYpfX2t1PiDh?=
 =?us-ascii?Q?UTLRIFFSMNk3a2RyVTXgKeXkLtT9Zx+I8zPCORtXslc6E2LEzFP8x6zBeuTM?=
 =?us-ascii?Q?TOJebUXdMqCq4dh+MWlozOetzrCgAS0lbDzs1fISJdovz1lmKYDXUa//HVZv?=
 =?us-ascii?Q?onNeDo5Rmd2ckXH0nUbP+I+8uZdgr/LIM76N95cC6cZOowTUTIblkEhSp4bA?=
 =?us-ascii?Q?v4ybxYoCt7ep1WnspoGK23nIs9ASuc0yQDTM91Wy3WKIyyIpuJsdugdxLvLu?=
 =?us-ascii?Q?U5bJtbCk0cPkegKLegwjyoNjV7y/krxFdOM64tk9qZMgoZmCuX/ldKDxSLbk?=
 =?us-ascii?Q?f0tjpnZ0n4IGwKtwFy5RO21/M+5GTLgajQdtphtUwTmy3KThsa6FgiHmYp3s?=
 =?us-ascii?Q?NJe/CTJrceKgWYF+xn+upJEEZfQ+qAT1zzSwxgmio+le9kLWyLBqWobkaKKz?=
 =?us-ascii?Q?GVTBztn8E2esPbr3inpUZPB+6blfRVD0XIQdwDNzm3pKVFs0/6FvFejDC1VD?=
 =?us-ascii?Q?2a9OZibTSYr3OM/G84ZNh7yP2pkLrIxXLVRgluv9Ww7CbUkSXqDd6eUCaaUf?=
 =?us-ascii?Q?DJk1/+f8A29pJAbf3hK5JIXdjAEdpCvbSix3tPqo0jHIil+HiC8yG2z/B6GM?=
 =?us-ascii?Q?Dnw3wKDNF2cgO56SkEk0GCWgANmDBENXaktojLWWrVY+rU6H7JOq/Y3EehCl?=
 =?us-ascii?Q?42Z+/xl9y+iVr2O8TyP1FNp9mP6mVCtxKx/exEZxQUy/ut0zco6hbPpr8oRw?=
 =?us-ascii?Q?ypo9mTn72JGbNsuOaehq08wTU6v8EjeJNvprrCB8xvAisXI7YZ/IErEr3ETH?=
 =?us-ascii?Q?+6n3/Xqak6yW8nSY0ooFuRys9HsstegadYtev0pdzNJwkSxqJxfgkJPFF/OZ?=
 =?us-ascii?Q?Gci74wJGUW+Td0AxdbLzK1P7mAJm4wJQUoVc7x7Kr5Y6vaDN+Fj5U/n0t+98?=
 =?us-ascii?Q?Q1poZAPvOg7wYqy0K/4Srs5T2NS4tYfrMdF1xi5aYq37ZoW6/AEUBCemjHXF?=
 =?us-ascii?Q?yySyV/aN+rGMdITrt920RAxlURT1fkU+vH36pmFENGCkpOqPzo5SqL30GBpO?=
 =?us-ascii?Q?1vMTINABGv1KCLFsOTcoj1wJKulO6U6G1pdXDH/+Lfn/S6iGFrQnsG9E2KvN?=
 =?us-ascii?Q?3L6otTv16h/gBDglouheRTQFoaEpv+k4CKg5cMSEvCuOKW/siRVWIOouCScl?=
 =?us-ascii?Q?4IEmVFGiVRAUKyqnL6bwfnZEU6EM1qqIfA4sU1Lb5cJ5rjR6HCdSLLizpLU5?=
 =?us-ascii?Q?r9D6UHtj1BZieZ38H1aMiI7ysU/mqGjigZroGEsfv2ux/J5AW9fME8RJdO3L?=
 =?us-ascii?Q?X+M37LEUS8iBAtI4u21eL7w7iAPe56/o39q7YmuRqLL5m5xWk86l+P0lD7sK?=
 =?us-ascii?Q?G7GmAH/Bs3lqUuw2IRMLY0qNprgrOH6pq4dwebGwazuOuXWrabLhsCOJvPzQ?=
 =?us-ascii?Q?x9xWPugtcQI42x20RnHXdJDt1EOUx7zq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 07:56:25.0336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 117a6bda-1d3b-4af3-ea26-08dcc3491621
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6623

Fix below warning caused by smatch by using array_index_nospec()
to clamp the index within the range.
"warn: potential spectre issue 'plat_dev.sock' [r] (local cap)"

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v4:
None

Changes since v3:
None

Changes since v2:
None

Changes since v1:
Change plat_dev to hsmp_pdev

 drivers/platform/x86/amd/hsmp/acpi.c | 3 +++
 drivers/platform/x86/amd/hsmp/plat.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index f2bfc5981590..16a82b8bce28 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -18,6 +18,7 @@
 #include <linux/ioport.h>
 #include <linux/kstrtox.h>
 #include <linux/module.h>
+#include <linux/nospec.h>
 #include <linux/platform_device.h>
 #include <linux/sysfs.h>
 #include <linux/uuid.h>
@@ -272,6 +273,8 @@ static int init_acpi(struct device *dev)
 	if (sock_ind >= hsmp_pdev.num_sockets)
 		return -EINVAL;
 
+	sock_ind = array_index_nospec(sock_ind, hsmp_pdev.num_sockets);
+
 	ret = hsmp_parse_acpi_table(dev, sock_ind);
 	if (ret) {
 		dev_err(dev, "Failed to parse ACPI table\n");
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index d55c984a9a5a..8fb395e91806 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -15,6 +15,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/nospec.h>
 #include <linux/platform_device.h>
 #include <linux/sysfs.h>
 
@@ -79,6 +80,8 @@ static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 	if (sock_ind >= hsmp_pdev.num_sockets)
 		return -EINVAL;
 
+	sock_ind = array_index_nospec(sock_ind, hsmp_pdev.num_sockets);
+
 	sock = &hsmp_pdev.sock[sock_ind];
 	if (!sock)
 		return -EINVAL;
-- 
2.25.1

