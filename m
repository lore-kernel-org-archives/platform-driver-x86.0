Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88C11E47BC
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 11:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729509309; cv=fail; b=PiuCup/Ea0zOUnvxs39ntgZkWQHZ2OppmW6LnM6OflpXaFxBv/ZpQytZWHoP8Oav3ISiuGPJs85Bqs4MBJKu6g5oGgKOuavT2zHJr7GPNiq2VBb8YMDRbUrVltJkxmGE5Css3g3uYYoC7TqdbB0igXFIeoA0F7Y2ncnq4QzcITI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729509309; c=relaxed/simple;
	bh=OmNtKg1RJQTtD7m5UZisWQpYPjm41W6XY6NWVxV+qSA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tCtrrk92pOlJo//+hBIQFa/QWVXnL5WUOQhH+DvJIn3Zq2Y+4AljOem5vwRtgN5CQmKYBxRQhygKEq6uXtchKP4kyt5Io6KxyLriTUzBexCMv84uKNqg3TtXaPwNIj+vfOTmnh/QGFovSsddewVe2LXi+q+6TD8uvpDqTnmuwto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=10kAtRLk; arc=fail smtp.client-ip=40.107.237.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="10kAtRLk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtWmvTxEDrhbkZqcW64Zp6qcoXjLBV+LepxTXnYPaE+EBWoqHxJW2+ggVcwH1Yp1beWoG3NUFnyAsCMRHUoOiSbj/NA5Z8h3a95LK3E34VhZaxQkVzbZq5/z5mpGBTE17BfklB+Itzm/abxg5NN3TFqWBLVn5iNc6gBMTnLy5rUwzHcYibjhigyIuoUI0gTZ9MwqbTPGtaUHX1xnNuFhEJbw+A0KcYvdPvVOc45wKBDPZlKCZfo+CIrqUOA21Gnq4o6s3F6wnymZk+bu/hkIqx5CCSrT0Ik7cLlfmqUQ/LIVfrh6vG7DyEGvhdjN+E+1Guz5496yU+AFbvq26CsS+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=praEVRLiXdL2PSHfRmd6+wGMKt3DCbMfifIcqkwkXTs=;
 b=XDAVHWHc9ls3c96k8VyqzUDoKKDlSp4kzPNyM32AF0rVG6sP2lQrNyLnIlnR7giQ9145xop7/kf7UUa33GdKlV0iGqCVFXo2hsI17jPuWl5fBT8O328qxiLH6c9R5mgATMoptNwOEnCAvuNdAYYwTI64QnDZuF55mChM0ePMCNkYH6ddI6JJNQqEBmGuf/MRA1T2VEj0Rc//Bl01stomuqVQH+lj2FtumQDXnFGRP5IRD/iisp6vKRo1zU35wtrHw6xi1azkTrojNV5p0cbO7+vzEg2k9G+qW79xcFXsnvCDmY4UDat0zKRo1IB/TURRIZQ5vtOQdX2Jf7bbE4XX/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=praEVRLiXdL2PSHfRmd6+wGMKt3DCbMfifIcqkwkXTs=;
 b=10kAtRLkgJiMEnS2SN2taaOQAeae1VESfMAFx9FIXJaNYFXtoF4EXTnEeCVn1arCCGsUVyWQR69fGNWndpbnPrRYPh5i2Kpx0iFTfiW9B1JPWDYYEaJQtS1f93lAeorzf4d/wez9APRa62+q94MmYgdLXhvuEItpnaC5L540lvU=
Received: from MN2PR02CA0025.namprd02.prod.outlook.com (2603:10b6:208:fc::38)
 by SJ2PR12MB8782.namprd12.prod.outlook.com (2603:10b6:a03:4d0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Mon, 21 Oct
 2024 11:15:03 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:208:fc:cafe::1f) by MN2PR02CA0025.outlook.office365.com
 (2603:10b6:208:fc::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28 via Frontend
 Transport; Mon, 21 Oct 2024 11:15:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 11:15:02 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 06:15:00 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v10 07/11] platform/x86/amd/hsmp: Change generic plat_dev name to hsmp_pdev
Date: Mon, 21 Oct 2024 11:14:24 +0000
Message-ID: <20241021111428.2676884-7-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|SJ2PR12MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec349dc-1253-4812-871e-08dcf1c19bfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWRRdmprb09BNDdRTEl1c2loZmtsLzN4RWZRSm5MbWttMDJjR0loMjF4cDQ3?=
 =?utf-8?B?WURaaTd6ZFYzSWpuTEllL2VWWmplOFZKVHNpS0gzQmFNc3ZwMjJhYmgwamFQ?=
 =?utf-8?B?UisvUWhJVTU0TW81NTU0TEcvelFUY0FpUDVLYUxGMis3UWxkVUFnREtXdXNv?=
 =?utf-8?B?T1JvMVh3VThadmMrSUdzbFI2aUxtWXN1emR3Z1FaNVJsb01paUhDL0ptNGda?=
 =?utf-8?B?QkpIME5oRjFTSzZ2QkVDRUgvNVUwOVMzTmhHUzdQbUNKVUhEUDg1WVp1SW85?=
 =?utf-8?B?NllOM1YxSXBPUWw4RC81MGRYUTk5QmxBSGdpL0d3TGdmNVJzZFluMUtJM2tK?=
 =?utf-8?B?Y2I2SnlCYzVpVGN3R1ZCVFM5OEVWSXIwTXlWYUlNSGdxYjh0OTA3dTR4WmVu?=
 =?utf-8?B?NmtBTEdCb3pha0xPWXUybmVoMGhrV0lJM2ZLSzhrMVFJNlJybU1QRkpRaysy?=
 =?utf-8?B?LzhtWXN4VGRtN0Z6bWg3TjdKVGlKVG14bS95UXIwdDVUK0ExSUdUQ1o3U2tT?=
 =?utf-8?B?TmpPcW1ZM0MxS0JpUXQwVVBxUTFOU25YaW1BWCtrVlZodzRQZk1xZGZxUW9K?=
 =?utf-8?B?V3JqK0V4bnk4S1dCMlNFSGxIQTZicHBpaTF3OGQ3T1M3NG9zeFlBZExGdzFW?=
 =?utf-8?B?bGJiUHJvN3pLRitxMW5qNTNkZ3llLzV5K0VId1Z6alF6SXpHNUpOZWd1aDNi?=
 =?utf-8?B?OXl3ME1vcVBwU3pzYWNadHhwaUYxdEc3SkJSdjEwdGduN1k3UDRWUWJxTkor?=
 =?utf-8?B?K0ErQW9IdURkN25vUC9icUJ6QjJhSk51NUx0cmRTZ0VUcXFJakx4NWg0WGh1?=
 =?utf-8?B?OUhUNU5HTUdQMi80Z3NIc3h4Z2R2SG96Y0ZQR2tYZ1p6Qkk1QmN6ZmlZdEpk?=
 =?utf-8?B?ZElRQnJDVzFBSlJKSHJRTWF6WWFEK3RINThHNGZMdnNLUFlZcEZYcTNER0V2?=
 =?utf-8?B?bW11N3FNOUduMFBQTk1RT0MrYkRzcFFrOVJ4aytVb3M2VHlWSWpZNkNMRjg0?=
 =?utf-8?B?TmNBaU5GaVVKdTJoa3ZXYk5XQmMvaktMY0swMWhBN2pZRzdDTUZYQk5Dc3FR?=
 =?utf-8?B?TUM0eUVoeGQxc25rVzA0cS9BeDVDei9wZWNUUHMzenBDYXVqUkpKTjBIaDRD?=
 =?utf-8?B?T2szaDFiem1EaXBkbWdGTXFZa0MvU3RML3Qwb0ZLZE9DRlZSaGNKSFRQdGZL?=
 =?utf-8?B?MzRURzF6ZldmMnl0Rk5QOEJvUXFRZitxeTRpbFlaRWliSmFOTENRZEZWbHlW?=
 =?utf-8?B?bkpGSTllSmFNdXRHckNNQ2xWZmpYeHY0cGpVMi9oSHhVK3QzVEM5cXBCK2J3?=
 =?utf-8?B?TWlPSFF3WHJNRXY2UXRPcExxUXF0ZHlDM2Ewd3dwczh5Y3BhK1hFZUtkRXJt?=
 =?utf-8?B?VXFRY1FrbWFBR2FZY2JCKys2Z0VBK0JsNXJLaHZraEh4Qkh5d3NMZUEyT3Rq?=
 =?utf-8?B?aW1RdHlCZmdUUlpvamtaaVZKenhPMHZwbXg1c2ozYkFRMzN4eUkzcWx6M1Bu?=
 =?utf-8?B?OEcrckdNR1hEenB1WVVZUUQzWnJvRkJTWVI4M1ZtM245OXB3eUhnQzJLVFdG?=
 =?utf-8?B?K2M0WlFzbnYyWllHaVBaanM4V1FSWnhSMUZaRm1lODU3eXVYSU43dG9ZcVp4?=
 =?utf-8?B?dkVoam5pbHNobWlXWGhJdFhVWW80SmxSLzR1ZTcyMG9rTFZ2WVZQekFRY2lK?=
 =?utf-8?B?MEJOZy9xemVjeUxoUzJtSHdWNXFJRENuS2hRWU1taUhBeFdBZlZ1bXFnVkpN?=
 =?utf-8?B?dEJaeGJadnpzeVhGd3JiWDA2NzYvVjFmczZudVMzY1VXZm9SNFJhSVhjdXN6?=
 =?utf-8?B?MldNVE5zenl5Q0tHeS9mRUpWenhENk8xWUZvZ0NPd0QrVzh0SVgzY1QxYXVl?=
 =?utf-8?B?Y0E3Q21HSCtJTVBHTjlneUxlYlk1Vmo5VjlWditLdWxmRWc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 11:15:02.7208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec349dc-1253-4812-871e-08dcf1c19bfd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8782

plat_dev is a commonly used variable name, since its made as extern now,
change it to more specific name.
Also change miscdevice hsmp_device to mdev.

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
Add  Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Changes since v3:
code indentation is removed in hsmp_parse_acpi_table().

Changes since v2:
None

Changes since v1:
1. This is a new patch to rename generic name "plat_dev"
   in hsmp.h, hsmp.c, plat.c and acpi.c to more specific name "hsmp_pdev"
2. Rename miscdevice hsmp_device to mdev.


 drivers/platform/x86/amd/hsmp/acpi.c |  6 +--
 drivers/platform/x86/amd/hsmp/hsmp.c | 60 ++++++++++++++--------------
 drivers/platform/x86/amd/hsmp/hsmp.h |  4 +-
 drivers/platform/x86/amd/hsmp/plat.c | 12 +++---
 4 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 61c072216fb7..6f8e7962266a 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -194,13 +194,13 @@ static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
 /* Parse the ACPI table to read the data */
 static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 {
-	struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
+	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
 	int ret;
 
 	sock->sock_ind		= sock_ind;
 	sock->dev		= dev;
 	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
-	plat_dev.is_acpi_device	= true;
+	hsmp_pdev.is_acpi_device	= true;
 
 	sema_init(&sock->hsmp_sem, 1);
 
@@ -244,7 +244,7 @@ int init_acpi(struct device *dev)
 	ret = hsmp_get_uid(dev, &sock_ind);
 	if (ret)
 		return ret;
-	if (sock_ind >= plat_dev.num_sockets)
+	if (sock_ind >= hsmp_pdev.num_sockets)
 		return -EINVAL;
 
 	ret = hsmp_parse_acpi_table(dev, sock_ind);
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 573867c17fd5..78945750d590 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -39,7 +39,7 @@
 #define HSMP_WR			true
 #define HSMP_RD			false
 
-struct hsmp_plat_device plat_dev;
+struct hsmp_plat_device hsmp_pdev;
 
 /*
  * Send a message to the HSMP port via PCI-e config space registers
@@ -176,9 +176,9 @@ int hsmp_send_message(struct hsmp_message *msg)
 	if (ret)
 		return ret;
 
-	if (!plat_dev.sock || msg->sock_ind >= plat_dev.num_sockets)
+	if (!hsmp_pdev.sock || msg->sock_ind >= hsmp_pdev.num_sockets)
 		return -ENODEV;
-	sock = &plat_dev.sock[msg->sock_ind];
+	sock = &hsmp_pdev.sock[msg->sock_ind];
 
 	/*
 	 * The time taken by smu operation to complete is between
@@ -219,7 +219,7 @@ int hsmp_test(u16 sock_ind, u32 value)
 
 	/* Check the response value */
 	if (msg.args[0] != (value + 1)) {
-		dev_err(plat_dev.sock[sock_ind].dev,
+		dev_err(hsmp_pdev.sock[sock_ind].dev,
 			"Socket %d test message failed, Expected 0x%08X, received 0x%08X\n",
 			sock_ind, (value + 1), msg.args[0]);
 		return -EBADE;
@@ -320,7 +320,7 @@ ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 
 static int hsmp_get_tbl_dram_base(u16 sock_ind)
 {
-	struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
+	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
 	struct hsmp_message msg = { 0 };
 	phys_addr_t dram_addr;
 	int ret;
@@ -354,7 +354,7 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
 umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 				  struct bin_attribute *battr, int id)
 {
-	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
+	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
 		return battr->attr.mode;
 	else
 		return 0;
@@ -362,17 +362,17 @@ umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 
 static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock_ind)
 {
-	struct bin_attribute *hattr = &plat_dev.sock[sock_ind].hsmp_attr;
+	struct bin_attribute *hattr = &hsmp_pdev.sock[sock_ind].hsmp_attr;
 
 	sysfs_bin_attr_init(hattr);
 	hattr->attr.name	= HSMP_METRICS_TABLE_NAME;
 	hattr->attr.mode	= 0444;
 	hattr->read		= hsmp_metric_tbl_read;
 	hattr->size		= sizeof(struct hsmp_metric_table);
-	hattr->private		= &plat_dev.sock[sock_ind];
+	hattr->private		= &hsmp_pdev.sock[sock_ind];
 	hattrs[0]		= hattr;
 
-	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
+	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
 		return hsmp_get_tbl_dram_base(sock_ind);
 	else
 		return 0;
@@ -409,7 +409,7 @@ int hsmp_cache_proto_ver(u16 sock_ind)
 
 	ret = hsmp_send_message(&msg);
 	if (!ret)
-		plat_dev.proto_ver = msg.args[0];
+		hsmp_pdev.proto_ver = msg.args[0];
 
 	return ret;
 }
@@ -441,11 +441,11 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 	 * Hence allocate memory for all the sockets at once instead of allocating
 	 * on each probe.
 	 */
-	if (!plat_dev.is_probed) {
-		plat_dev.sock = devm_kcalloc(&pdev->dev, plat_dev.num_sockets,
-					     sizeof(*plat_dev.sock),
-					     GFP_KERNEL);
-		if (!plat_dev.sock)
+	if (!hsmp_pdev.is_probed) {
+		hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
+					      sizeof(*hsmp_pdev.sock),
+					      GFP_KERNEL);
+		if (!hsmp_pdev.sock)
 			return -ENOMEM;
 	}
 	if (check_acpi_support(&pdev->dev)) {
@@ -468,19 +468,19 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
 	}
 
-	if (!plat_dev.is_probed) {
-		plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
-		plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
-		plat_dev.hsmp_device.fops	= &hsmp_fops;
-		plat_dev.hsmp_device.parent	= &pdev->dev;
-		plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
-		plat_dev.hsmp_device.mode	= 0644;
+	if (!hsmp_pdev.is_probed) {
+		hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
+		hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
+		hsmp_pdev.mdev.fops	= &hsmp_fops;
+		hsmp_pdev.mdev.parent	= &pdev->dev;
+		hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
+		hsmp_pdev.mdev.mode	= 0644;
 
-		ret = misc_register(&plat_dev.hsmp_device);
+		ret = misc_register(&hsmp_pdev.mdev);
 		if (ret)
 			return ret;
 
-		plat_dev.is_probed = true;
+		hsmp_pdev.is_probed = true;
 	}
 
 	return 0;
@@ -493,9 +493,9 @@ static void hsmp_pltdrv_remove(struct platform_device *pdev)
 	 * We register only one misc_device even on multi socket system.
 	 * So, deregister should happen only once.
 	 */
-	if (plat_dev.is_probed) {
-		misc_deregister(&plat_dev.hsmp_device);
-		plat_dev.is_probed = false;
+	if (hsmp_pdev.is_probed) {
+		misc_deregister(&hsmp_pdev.mdev);
+		hsmp_pdev.is_probed = false;
 	}
 }
 
@@ -567,15 +567,15 @@ static int __init hsmp_plt_init(void)
 	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
 	 * if we have N SMN/DF interfaces that ideally means N sockets
 	 */
-	plat_dev.num_sockets = amd_nb_num();
-	if (plat_dev.num_sockets == 0 || plat_dev.num_sockets > MAX_AMD_SOCKETS)
+	hsmp_pdev.num_sockets = amd_nb_num();
+	if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
 		return ret;
 
 	ret = platform_driver_register(&amd_hsmp_driver);
 	if (ret)
 		return ret;
 
-	if (!plat_dev.is_acpi_device) {
+	if (!hsmp_pdev.is_acpi_device) {
 		if (legacy_hsmp_support()) {
 			/* Not ACPI device, but supports HSMP, register a plat_dev */
 			ret = hsmp_plat_dev_register();
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index f465600cb843..9c5b9c263fc1 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -48,7 +48,7 @@ struct hsmp_socket {
 };
 
 struct hsmp_plat_device {
-	struct miscdevice hsmp_device;
+	struct miscdevice mdev;
 	struct hsmp_socket *sock;
 	u32 proto_ver;
 	u16 num_sockets;
@@ -56,7 +56,7 @@ struct hsmp_plat_device {
 	bool is_probed;
 };
 
-extern struct hsmp_plat_device plat_dev;
+extern struct hsmp_plat_device hsmp_pdev;
 
 ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 			     struct bin_attribute *bin_attr, char *buf,
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 85a104859acd..e18cf82478a0 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -56,21 +56,21 @@ int hsmp_create_non_acpi_sysfs_if(struct device *dev)
 	struct attribute_group *attr_grp;
 	u16 i;
 
-	hsmp_attr_grps = devm_kcalloc(dev, plat_dev.num_sockets + 1,
+	hsmp_attr_grps = devm_kcalloc(dev, hsmp_pdev.num_sockets + 1,
 				      sizeof(*hsmp_attr_grps),
 				      GFP_KERNEL);
 	if (!hsmp_attr_grps)
 		return -ENOMEM;
 
 	/* Create a sysfs directory for each socket */
-	for (i = 0; i < plat_dev.num_sockets; i++) {
+	for (i = 0; i < hsmp_pdev.num_sockets; i++) {
 		attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group),
 					GFP_KERNEL);
 		if (!attr_grp)
 			return -ENOMEM;
 
-		snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
-		attr_grp->name			= plat_dev.sock[i].name;
+		snprintf(hsmp_pdev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
+		attr_grp->name			= hsmp_pdev.sock[i].name;
 		attr_grp->is_bin_visible	= hsmp_is_sock_attr_visible;
 		hsmp_attr_grps[i]		= attr_grp;
 
@@ -93,10 +93,10 @@ int init_platform_device(struct device *dev)
 	struct hsmp_socket *sock;
 	int ret, i;
 
-	for (i = 0; i < plat_dev.num_sockets; i++) {
+	for (i = 0; i < hsmp_pdev.num_sockets; i++) {
 		if (!node_to_amd_nb(i))
 			return -ENODEV;
-		sock = &plat_dev.sock[i];
+		sock = &hsmp_pdev.sock[i];
 		sock->root			= node_to_amd_nb(i)->root;
 		sock->sock_ind			= i;
 		sock->dev			= dev;
-- 
2.25.1

