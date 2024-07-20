Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E958D148311
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jul 2024 17:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721497608; cv=fail; b=jkWyom4waxL+DWUqKJ78k17K218WkjBeC9xjTZ+hJwHc3z89euk9fZIVXnL4zcIHMVjcpdz9E4HyIp1r1oqo5ANsHDSZvKaDGGaonIJxjlFgIL75hrcsFmpRsx6tNYBhxbTglpZ6PivLqrLDkiAxRMFolMatSnD+d0sfJKJ7H40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721497608; c=relaxed/simple;
	bh=mfU7ixi0isfXEJLUE+LKvtPFr1oTZm05L5SZiosfAy0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QJJeJZAupcV5RdzItvZJ9xyli5UVy/nEGLRRXmukWHFOrSxd1Il8uWbVzCZHAo7rLuIxs2Z3ZrK/4a73jpR1aT/zOTXtf27rUPJ3galtGPIBb9xEGxXuSA8jJz7H+1WjIP4bxWCpq3DfW9ClT2HyWsDTvb6vs6jgGFONPIes3+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=anMiinT9; arc=fail smtp.client-ip=40.107.94.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="anMiinT9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vTzVa3TFaECbEl3Cx20GxdBdaFLyYoVTgnHHQDvLcZuImYFA8HL2UPp2E3PXQJMUDbBcLwvbOsnmq8W/iEGhRs0gOg9XZnBSHy3TEGDLhWNzZjdjUiRyCr8DahoQhmzU/KFWM4nlqeNQ7GBdK1LTMiyJZy4Mp/8zdqCSYy2KqaXtKfDjc/Wem+1jKcu7zjloZzyTBSBN8K+SrIYrV2JKmPyWa/gndxA1coROqn+lMv2Bc/C/3gZvShJbs8FIpM9C5TP91GuKZb+huechaz99agu7ommBQAxhokj/kejEgrgvs8QCle/M4qg2QN77E4dYoKHEYKTR1ZBowPzmtqxepA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZNIBw9I5v4lJWd+QrIko9Lrwwz1WPAaHiiRMcnA1y4=;
 b=n4d6zHwUV/GAYsd1Dlt6YKl+dusESMY/jocNooyItKh8UL1ntxRvopKGQPxd2xZuJe0C/zvE9ehu4cpcEPN77mZGyUHF0pocyDfmTaH6FTS78iABmWb/2xNhlhpwjWUoks6yWguPybLvDWpJ+VKhs0L9Pa5ZiVVRFsj5IasKGmdIb/f71lj2Zo8bmgHngX+zO39cvXfnNZVZ6UGLPlq+lrhxDxyTyknGIGE1LFQwZj+Kl1twvK1rY3nIFYgw40xRGfRCHOpAFdaPFuVFP1LELmDOcYfRHs7M0IFV/T3itpb+gEa1of1BoPB6EcSsSS4DLR8/09L9BXNc2OcfDo/Auw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZNIBw9I5v4lJWd+QrIko9Lrwwz1WPAaHiiRMcnA1y4=;
 b=anMiinT93mT5j+yhS/oDBzYFOmLF0HA5TYhOKMVP8GQUf0wOEbu+Bg5OkPm5QlmYxVvirNNGHwj0a9GEfT/7lPlklm2D3BkJJ0RPTIPcSAygo6SK1Adohia+SA0UU8NDyXTtf+AT7iaD1zlB7WIFyGe+i+yVLB4kl3tCI5snprI=
Received: from DM6PR01CA0019.prod.exchangelabs.com (2603:10b6:5:296::24) by
 LV2PR12MB5894.namprd12.prod.outlook.com (2603:10b6:408:174::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Sat, 20 Jul
 2024 17:46:44 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:296:cafe::93) by DM6PR01CA0019.outlook.office365.com
 (2603:10b6:5:296::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Sat, 20 Jul 2024 17:46:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Sat, 20 Jul 2024 17:46:44 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 20 Jul
 2024 12:46:42 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v3 11/11] platform/x86/amd/hsmp: Fix potential spectre issue
Date: Sat, 20 Jul 2024 17:45:52 +0000
Message-ID: <20240720174552.946255-11-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240720174552.946255-1-suma.hegde@amd.com>
References: <20240720174552.946255-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|LV2PR12MB5894:EE_
X-MS-Office365-Filtering-Correlation-Id: 872aff71-8d94-48e4-3cd5-08dca8e3ebc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+EY99bZUwZjmpVqzd9uUX8KWL4NcdAs3+nu4b3cCzODARqDGS/cHvl+58qeE?=
 =?us-ascii?Q?7qrPmWNBCOrdBEIhnwWWwuVT21a4oHTXZCuS/bfq6UvJ3TnENFZNUO0jkiOq?=
 =?us-ascii?Q?yPmOkOSvohA1ba7P2PGxjRYRH13X0TTYdZC1OZQlm28QB9Sp+A0Fte9AhqQE?=
 =?us-ascii?Q?v/nRJ3lZGOWB69SEVrQVCqw2UxGC6ffiyZrwoo9SX+7v2ztmvPtN/GtnqkuU?=
 =?us-ascii?Q?1pQZaaqMOZpJEq3g9HIfCwAV8ZzvTasWi2mp8wC8r04bbEDkP3oiwr5mwjxn?=
 =?us-ascii?Q?Zhe725p36F5AhBZfy/wsjy3lWkhM4HZVSHufBndztTbbqesAHcn/s3zjZoLB?=
 =?us-ascii?Q?fKfS2V+TLBUvIvjRdNc8uIBUINrRzmaoA+IlI9x3YirXG2KBOtWSRFs4tLfh?=
 =?us-ascii?Q?enqTGhnEf/9/FzZjD59UqtuuQLPPevHE6tK9CWfXgZfAaGMpZ8H2XRKPn+Z5?=
 =?us-ascii?Q?b/cjptVGbsUG13fOcVGDLx59T0ji9GUg0SHGegCIoJmvlxRFIsOvwnKkcW59?=
 =?us-ascii?Q?jxt8/gAGrSwHBcmEYh5GDoD5gXWKFE+LRpniXipsxCarKSTLK7DMdFzqajtd?=
 =?us-ascii?Q?EQThptsAixiqq9/UChmgG5dUFWr0LELKLWV3Q+D+K+keI+FsZ0SPuWcl8ze8?=
 =?us-ascii?Q?YpoulqcFPzREoKULgPxXDq5OxqLB2w1L/F7uC1nLpfiO50vJLOZilgXLAIy4?=
 =?us-ascii?Q?qFdov0qXcrs8LDabGPUNSC1oXpwaVOxb+P2p4N1ZDLbQGRQI2dx3AaON+7jA?=
 =?us-ascii?Q?SsZNGJ+oFmB7KQdfQ07Qi81dGjG+xqLpa//Ldi1gxUvysKtebLORYdnUObZM?=
 =?us-ascii?Q?LsNr8auUVm+cL/N5OEUQFFlli52eF5Sed0Rtx/qD9tLZgSPo3dsc2mucuVjN?=
 =?us-ascii?Q?zz+xCcw0767CRo5Lzhumv2DdMktQnruYuGlZc/SIqUTbFh0/9jFF//T+gHCz?=
 =?us-ascii?Q?gxU0qsNIQXhK68u81TMnai/S0M761BjKR3I/fytzqetKtzC7/N7UNuVGNCjd?=
 =?us-ascii?Q?Wj8JxLej2yP1pFOD/b2jun3jmraDgC5mJypXPxHQj5EJpt47RvN+tHJw8yiE?=
 =?us-ascii?Q?VLjtddZR2WIfWQBvMUYHZ0rBh9ZRg1ET39zQIN0QkG7X6Z6otGIPeEJp2ofT?=
 =?us-ascii?Q?WvPkPQRzMV41FOWwANyKxnA2n9OBa7/xlIKlYMhU1/hlOfyFvZiDIffRn/Cp?=
 =?us-ascii?Q?jlkJ4V6GtaQ66XievZYJsuB4/Vq340515xb5d43RfH1qfxsNHThqYbWIbGa6?=
 =?us-ascii?Q?hhaHEoW1DSXSBLGq2g5V+0+3zDxiyztfK3w0vI2RYCYkD9ZYovtJBTKttQaP?=
 =?us-ascii?Q?nn+7KxAwVkFOX4CsJc4nArf8j5omeXP5fhv5Urzk6KHKO3kSTjeNTmTUj4Iu?=
 =?us-ascii?Q?qzrIXSBkOTmxtmBxD72PtgHGxGT6cDy2mAbEspzgvYtcXCF284keeQABUBRM?=
 =?us-ascii?Q?KKeIPW+7iKBXgpxzJv2uycNDQ6URT05O?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2024 17:46:44.5197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 872aff71-8d94-48e4-3cd5-08dca8e3ebc6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5894

Fix below warning caused by smatch by using array_index_nospec()
to clamp the index within the range.
"warn: potential spectre issue 'plat_dev.sock' [r] (local cap)"

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v2:
None
Changes since v1:
Change plat_dev to hsmp_pdev

 drivers/platform/x86/amd/hsmp/acpi.c | 3 +++
 drivers/platform/x86/amd/hsmp/plat.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 4b1470ca8675..cc859c9fe2dd 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -19,6 +19,7 @@
 #include <linux/dev_printk.h>
 #include <linux/ioport.h>
 #include <linux/kstrtox.h>
+#include <linux/nospec.h>
 #include <linux/platform_device.h>
 #include <linux/uuid.h>
 
@@ -275,6 +276,8 @@ static int init_acpi(struct device *dev)
 	if (sock_ind >= hsmp_pdev.num_sockets)
 		return -EINVAL;
 
+	sock_ind = array_index_nospec(sock_ind, hsmp_pdev.num_sockets);
+
 	ret = hsmp_parse_acpi_table(dev, sock_ind);
 	if (ret) {
 		dev_err(dev, "Failed to parse ACPI table\n");
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 33868346b5a0..00dc7a0d358d 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -17,6 +17,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/nospec.h>
 #include <linux/platform_device.h>
 
 #define DRIVER_NAME		"amd_hsmp"
@@ -77,6 +78,8 @@ static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 	if (sock_ind >= hsmp_pdev.num_sockets)
 		return -EINVAL;
 
+	sock_ind = array_index_nospec(sock_ind, hsmp_pdev.num_sockets);
+
 	sock = &hsmp_pdev.sock[sock_ind];
 	if (!sock)
 		return -EINVAL;
-- 
2.25.1

