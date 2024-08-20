Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107AB18C01D
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Aug 2024 10:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724149824; cv=fail; b=WmSU58iDZg5NkyEEXSqC4TzJqep2Cf3N5POcpTW34UAyuq4aXdqBx4UTexNzVj+p8SnQLxWmPijes2ZhKmj+s/IrkDyOVYVoV77ms1W5rCmoa1VMOPAs5NCsX3Xaw/+fKAg6NPje5PUM+MSo5HEnJ/jYfyDZwMj0ib9sHLOFFAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724149824; c=relaxed/simple;
	bh=ImDnbK45PEOyapMyt5PkQWBnqMX1/HiCfVL5QZKADyA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dIlHSVycc17ywYe1GWUSKxE1PIwwAepOC7S+bKg1SrUmW3bjwlM3PSzgu8EduneMQm5KSsqchzFzqxeJwS5E5NIG5zKom/Ilty44RhBQrUp4Sv55I18ITDhbQbD/LdnR0nfbvIIYXA/fBIM25fx1iGE4gMBH/tnI3SrAWjYf6Gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=O2U3Nq9c; arc=fail smtp.client-ip=40.107.92.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="O2U3Nq9c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0ivzFfGE5TT038tEfm7kx1lbI3Pacc1n7PUKUdvdj8Ek19ap1MI5v7QmjGldfpHG9uT3j+rAKcAiwa0/wvAJP+rc3XbbmdtCY//lXxK2QnfZKNM3wgpfvjKC1ckGaObAA3PBfSwDFWRlRlccg96T56DAbRAti+u0gw/riHZ1hU8+Kf/Aq+lCb952cTl4GLSr7Fu16aIAcwPvGJ+FmSV728IW8XUxq6e9+dujpAiaceYxxixovzSa08GVg+iBIcEqcw3eshrNwHnDmelAAn6s1leJXyWZiM5Y1/J/RoSY2ktro5tEDziN+RqC7ulA6XTNN1fKiDk2a7iD7uJlP4lqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nA8YLMeaFYnXXB58l7Mwt8XJ+zGTEwazo0mHtAB2okw=;
 b=xdjuiwEsxKjDIFpHtSJ7rz8b6AkqaGVkQsZFaOY4GpSeVWafSj4DEKouV+gtlrKNrpbH4Xbb6mzTFovYdgu6LNJfrholCtIn0ekgcKMd7mfOjvybeg0qbXJkFRhjeq/y/sqGdQIkrQOk8bvp8PSMwTmXbKlwQRG9HYX7O82GjU9NlCc2ThQ/NzYrbyXI++aLqM2W+siGn4tU3v/CL/MrCNz5axaZ+NAOFA9OTD5ShuaZyBL7bhrgbXapPMgISVSS8Qp5qJHZAIph/R8GKmdI0qeF2EpavHQpWy8lvLQhiwWOM5mGpFWtrMkOFw1YOv7ZD5qO3x3u8/wQaVHZ2DYB/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nA8YLMeaFYnXXB58l7Mwt8XJ+zGTEwazo0mHtAB2okw=;
 b=O2U3Nq9cjVuOlvTjRx7QOD0hHcYFUDjXlTMTaGsFUtaVA8SLeo9VQWJ32bsUxVzIrNppyz6pvyXbahHsMB4y3doFezOsRKxaedHeXiJUKHVKRgHUikTUtQc/LsgQ1Kt6U0TW+XBBIBbpcrZgXSvcWY97jTlO7+tr9l+5JUsYabk=
Received: from SJ0PR03CA0108.namprd03.prod.outlook.com (2603:10b6:a03:333::23)
 by SJ2PR12MB7893.namprd12.prod.outlook.com (2603:10b6:a03:4cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Tue, 20 Aug
 2024 10:30:16 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::94) by SJ0PR03CA0108.outlook.office365.com
 (2603:10b6:a03:333::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Tue, 20 Aug 2024 10:30:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Tue, 20 Aug 2024 10:30:16 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 05:30:14 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v4 07/11] platform/x86/amd/hsmp: Change generic plat_dev name to hsmp_pdev
Date: Tue, 20 Aug 2024 10:29:37 +0000
Message-ID: <20240820102941.1813163-7-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240820102941.1813163-1-suma.hegde@amd.com>
References: <20240820102941.1813163-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|SJ2PR12MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: 624d6756-0751-45c7-954e-08dcc103155d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Gio/1LniCsMhPn76n23QfF2GIIA80Pe/litT5VYiF4VZA+OdKoptgMinse2M?=
 =?us-ascii?Q?P8f7kELwYBMEwAsz7uTTCb+7nvIipSLJqQcX656lYpPlbX2aWt54uWHrCdUB?=
 =?us-ascii?Q?V5LDwrPkoTTmd4YshC+Sb4Ataj8/kkU9boTJx3/h2zcFv4Fz0Od7VcJkjqK0?=
 =?us-ascii?Q?yQDmgxQRN9SiKt94TUSdzKEgIrUgccRnVOnufHTqgV0KaMEM13/219NXqIUP?=
 =?us-ascii?Q?8X5RIk3tFyF5mNAac79FG76wbHcRMxIPAq8h1vHwix36kpIhLT+snzPlShIY?=
 =?us-ascii?Q?K6iDwC4wWHPVdJ8lefM8/6kQVs5m9/zd8hzHCikVJZZvhLzXVvSkipqPR8fu?=
 =?us-ascii?Q?7WNR7KeVWTRotExxXgh9hUpjB2o2bUfgHAoidKb7MEzyFDNpwMZx/5cSpAFt?=
 =?us-ascii?Q?6QWbDzejwV1jHUxDjiJELQcwN514B07ZjlUrXGXRqsHqrXD86IVKnwoGRAnz?=
 =?us-ascii?Q?vG2r1s32AdvKWU66odrpUprkgbBs+hAZU9DTIPp9ATH4PC+kTvBsRtf3fawP?=
 =?us-ascii?Q?GVRnN8p9lCYi5s5xd71D4IJ087QcVaT92DjPjAPAY+WiyT5pCSF9el8osEZ0?=
 =?us-ascii?Q?cZUI2OU90renB386UNl+AnfVWXryxmxzpMV8mcsieox8vcIIfmkn1w2DbalP?=
 =?us-ascii?Q?u/bijzpQpBV/PQOumQ/Kfr0yDHslPdQZ1TusqWFY9ushvKMgMBslqwy/q1k7?=
 =?us-ascii?Q?ShsNRBptiK9NFWRu+7GojmutgWEZR7rifHrBXTpC3OMu2HR8kPQh+jdYIfEH?=
 =?us-ascii?Q?FbrEdfjWmZ53jzvRxoXDRJzVN5fr5y82y28UCPvklHwpNkisbJ0H6MNcxqLl?=
 =?us-ascii?Q?QX8ii6i4DrDIoit7ilKgV+BqGxcDmTagj4E8roFrNm4Sln/K3g0RG/UsOein?=
 =?us-ascii?Q?emkWHhQdLETKrRywrHwCbZRkxmm9f3fGk3xrUzz/wvbKf4oucBnRmr2CZez8?=
 =?us-ascii?Q?bq3JAJ+6mA5DEe6KAr2hheboidvnnGpWPRqAWK7Pjrx3BZTMZuaq2/AI1q0f?=
 =?us-ascii?Q?d5QL0KF2BcOMmV++054nbrzdM50T/PpvDrRJH+u1/3RgvURaLGwboaWmW7uj?=
 =?us-ascii?Q?xOy5fQGHrzgHJfRKIPic245vxlMEht0xjGCjHL601YNrBzcs42IcV+3rtL5w?=
 =?us-ascii?Q?ySIIPMN0r/MJ+QqAL0UJhnUy38q0zEtkGHaNZejPvFFZ+dBL2W84mmK62vvz?=
 =?us-ascii?Q?XgSFnoA1orsc8bFFiYAfL8RcHC6luTB14JOND7oUxQXEq69kw9PPOy9fra7r?=
 =?us-ascii?Q?ThCvL5Fx22LxbTpxUaU6ZbDeUi06zjwMqtV4SLSFkZ/JehLgeg8nm0RuvfV2?=
 =?us-ascii?Q?Oaj3Z55QSzNeqrzW4kXKBjIiiCiJ0gguMk/x/2W1CCDwxQW1bUK8YCZqYpLm?=
 =?us-ascii?Q?zJj6T6bqkiFitEYj1FQ5gzIYrzOtf6cScBG+1D9CeD/lPc+vKIgt6IO/O41e?=
 =?us-ascii?Q?ma8N78dJTdGsJ9Hznl5UmMDJeVW3UPxx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 10:30:16.5878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 624d6756-0751-45c7-954e-08dcc103155d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7893

plat_dev is a commonly used variable name, since its made as extern now,
change it to more specific name.
Also change miscdevice hsmp_device to mdev.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
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

