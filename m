Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2046.outbound.protection.outlook.com [40.107.96.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A441DA0E1
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Sep 2024 12:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725367157; cv=fail; b=tu8D7BIoFQcS4KceaapEr3J5YTGOJcw2rZizzYRSLUBo30TkSpi4tURkyy/1NWK/AmGGK1JKQCB18YN8LgjHjXX/aZTjwaGqBnH7mhJ9aU+PEVZtK72OU99I8YlbmDz5wPyvI4DGa78liChpu0bF9MAoJ1gEAWkT6BCXwT2V7pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725367157; c=relaxed/simple;
	bh=OWgn1IfN9a3Hyc5TZZVw3gbJVE0C170X2OK3QBk7X2Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XmDB9D7WCeyhQtec7RA+to3HcPAE2ldL725010qbTTFQs9D9Vl0EzKXn0FR2OXoNfR9T94csgw9xmGkELZXYEnsQNR4dZosssnQiEbZGnqnBBOwiQx94hil8szTFPsrZ/T//Incyy1LbynXY9wLBamcmccSkLuvo+G72JyRgN4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TCKu1bzq; arc=fail smtp.client-ip=40.107.96.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TCKu1bzq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VI9qVKaNW0FHqqKfByoSW49oIfpoB0B6L7KjlCiuSveBr33Nag5TyP71WTa+72bwfnrsuoSvN0scSsXPlLndUbr1jyM15o7jhkw6JTLY2FVcIQ3gvEn1xHskl9Cd1Sh7/TR2hB0D1Ghtb7wJIicVsP1mL+iA7uWR0go2FA6sADsOyZhwG03cBD+yaOvdePPRkLqVElfSH++cau7rvZkgO5eie2tlNqD8XE12dSTbpe6bWJipShPCIZPj0y+aU17ufao8dNW2B/FMR8jgxaultK5MwS5xDBHHA51zhNX03YPQ7I2zXR4Ryk3TabCUVjD9gMWMEjVGwOCxVR2UEsTomw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0SgSDiwhSbFXZNk7knaao3OQx7iEeTGQoD1TxcEGlQ=;
 b=tpI7XFUbK3rVFkkJwRr3C6CQh4ij8EDNfdiEPI6BaXJmE/77bjqwZfQ6nnGC4k9ArJjkKdFehyDW/WiatHn6zCgxoz5u/Gc7YUncgLZxbax3BtD90oGiFffhEzQ0APd7wC9n2URY5wXpPoa2zRiPjGJY46m4jYo0yY0O5RgrWMzliamoc5xuGRqZi71/iEL6I9LxJehbra0ZoM2kqcHjg4UiWU9rXAg584Z+ok7AkibDjQlXUOeBl+Wqy23QnWsXVgTA6n0GeXS6o4c7sL3vEAjTCwY0gxhV9VMZycd+i57TwDVQNj8qDWMZ403N1mmblLxGxbSbMShiuaerMt83ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0SgSDiwhSbFXZNk7knaao3OQx7iEeTGQoD1TxcEGlQ=;
 b=TCKu1bzq4t9QXorJWrlK/yig91UfWxlsF2DGvE0+c2u5vrBniNn8QzXcGZXpUkgo7pnzIuMP/caq5cxd6eJG2bIARVY9OOAh3CHXiJwBpO3gVzrj5PbqlVbj3zknpOezfj7R5Sq2Tr7qTIxjtQuCh1VfUAqBABtMwhSqXx2LSEU=
Received: from MN2PR12CA0005.namprd12.prod.outlook.com (2603:10b6:208:a8::18)
 by SJ1PR12MB6025.namprd12.prod.outlook.com (2603:10b6:a03:48c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 12:39:09 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:a8:cafe::50) by MN2PR12CA0005.outlook.office365.com
 (2603:10b6:208:a8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 12:39:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 12:39:09 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 07:39:06 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v7 10/10] platform/x86/amd/hsmp: Use dev_groups in the driver structure
Date: Tue, 3 Sep 2024 12:38:30 +0000
Message-ID: <20240903123830.2717196-10-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240903123830.2717196-1-suma.hegde@amd.com>
References: <20240903123830.2717196-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|SJ1PR12MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e6ff99-f889-46ad-fa17-08dccc156823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?edAEZ4q+lkO3v7GChuh+Nn0/QyPTd8+sE7YRtZHkplhmOAwNjCgGreIYBs+I?=
 =?us-ascii?Q?bX1LxIoKIeQm7j0CFz3VJyGmIciFuF4wHlccL14IbVRRcF0ZsUWjju6+YsFT?=
 =?us-ascii?Q?pTAJGdHrz/Hq+7wmkmePlucN3Bv6URRXXSuXxcIOMOvMUHF0ww5YKBTW5iH2?=
 =?us-ascii?Q?9C6dhQV2GT88GWMMI6di50/CuNgOq5/gBNx9+HptuigRRDtBLBl5gAsIHtHe?=
 =?us-ascii?Q?bl0yBf4xBhdYEci2mAkg5FbIofRV49alGl1alJfvUvT7+o4hwAW2U88jFlJv?=
 =?us-ascii?Q?yxajD9XC5kC8+Wpk7HAR8mSNiEe4beCHazxFWFaOGivTjSywzWeymEalsbdc?=
 =?us-ascii?Q?xBCJ4AvBIegZ3BAcTTD/bZ7ngvJSx/OfnlJi4pZMDx6A7QJB81EI2Zl6rPh0?=
 =?us-ascii?Q?xuVbKL0Qv2vU6gvAukziglvgTWvBBaSuqiEpAH6LKN9xro0Aq0kJ6O8v7F1/?=
 =?us-ascii?Q?3QVG4VRtO2lT/zqsnYcBaKUrjNV2dAZ0BEv8cgk2tslyFDyKsyZX1R7CwTLp?=
 =?us-ascii?Q?FshcXe8Am1lHmawyO5otaVArc42J8Yf4Q/g2u48le3RplY/K9UXwwd07fCln?=
 =?us-ascii?Q?N9wSQ7CqI4GJApLZgDNGj+vQmxHUz1M3eE7NwyeL4+YlsHuq4nodI6lDclVr?=
 =?us-ascii?Q?IOyp6UMglZfF0s1eNp5gDNn91aFwN70Bqe4UQViIuxZ2IE8GJ/1hOSdbzgnD?=
 =?us-ascii?Q?WARxQRsQUajKX7xQ/SCeGesgIexshbJLNHD8DGSVv/891/6r/ALTftHlH2Cm?=
 =?us-ascii?Q?8bWWxih3baDwk99qhFGCRAMqWxsd7tRFRpYac3o86cKgfqKlLzic+D+At595?=
 =?us-ascii?Q?K1IgRFhQd4833jgQ/7L9NKCcxNHedYDOQnnVFsdoKg36ca4qd10vuFhOINBE?=
 =?us-ascii?Q?gYcRS3wRon8Qf5b9+9UlD6ML7zHu2Pc6hAHlUL2zDCbXT+zD7/7G+U5vc2r2?=
 =?us-ascii?Q?GlOHuqEFDAL6T8t3zQDps15EvNkdCBJq6Wy/hOV73+piA+jQfeStPVGfPaUT?=
 =?us-ascii?Q?FofwBu1gao5zzbFQpzomIcgYEmBC9uhFa4tV1rAzQay758NNw3qLRQzSGWKJ?=
 =?us-ascii?Q?eeSx3gDQUdtvTu80vt/MriOjmLXAkotCtniBHR0zoW+63FqJ4xaA6xY+Binc?=
 =?us-ascii?Q?OUKP7yXFE2SZ6U8b5yVcf1buZpvmY7U4DYzAu+UhCPXw9l992U56aEgoMpmN?=
 =?us-ascii?Q?0516x/PbKXwwwKk3hGhsOaBnH1TL9Iha7uC/+xEMKcR3GEXXLOujCkcnVvl2?=
 =?us-ascii?Q?jLKFDizOnY0K/ifIbum2tFRDgDsaaYpndZwaNy7YgJAHVgzRHBxT1btlogd5?=
 =?us-ascii?Q?qWHUgl+mhTmVG0+BAQTG5F83xDzKS/3HpQX3ZvsTFnwoZIPO7xHzUrUXJO02?=
 =?us-ascii?Q?yoummqtWi9taDEB3lpaTSf2rLIy8zDy8KRoveVjDrUjkPDZYdcj45UpNs0+Y?=
 =?us-ascii?Q?mrK3+tH3wzStls2if0a5tgINeKOPwAw9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 12:39:09.2554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e6ff99-f889-46ad-fa17-08dccc156823
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6025

Move out of device_add_group() variants, instead assign static array of
attribute groups to .dev_groups in platform_driver structure.
Then use is_visible to enable only the necessary files on the platform.

.read() and .is_bin_visibile() have slightly different
implemetations on ACPI and non-ACPI system, so move them
to respective files.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v6:
1. Move common code of hsmp_metric_tbl_read() of plat.c and acpi.c to
   hsmp.c with the same function name.
2. Rename hsmp_metric_tbl_read() to hsmp_metric_tbl_plat_read() and
   hsmp_metric_tbl_acpi_read() in plat.c acpi.c respectively.
3. Add tabe space in macros definition in plat.c
4. Keep only one cast for sock_ind.

Changes since v5:
Assign integer directly to .private.

Changes since v4:
Change ->private from string pointer to u16 pointer.

Changes since v3:
This patch and next patch(9th and 10th patch in v3 series) are merged
and commit description is updated.

Changes since v2:
None

Changes since v1:
1. Change is_visible to is_bin_visible in commit message
1. Add parenthesis around read and is_bin_visible in commit message
2. Change plat_dev to hsmp_pdev, hsmp_device to mdev
3. Remove unnecessary if, else conditions in hsmp_is_sock_attr_visible
4. Change un cached to un-cached

 drivers/platform/x86/amd/hsmp/acpi.c |  65 ++++++++++-----
 drivers/platform/x86/amd/hsmp/hsmp.c |  64 ++-------------
 drivers/platform/x86/amd/hsmp/hsmp.h |   9 +--
 drivers/platform/x86/amd/hsmp/plat.c | 113 +++++++++++++++++++++------
 4 files changed, 140 insertions(+), 111 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 766617e6adc7..d226f7deb49b 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -9,6 +9,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <asm/amd_hsmp.h>
 #include <asm/amd_nb.h>
 
 #include <linux/acpi.h>
@@ -211,6 +212,8 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 
 	sema_init(&sock->hsmp_sem, 1);
 
+	dev_set_drvdata(dev, sock);
+
 	/* Read MP1 base address from CRS method */
 	ret = hsmp_read_acpi_crs(sock);
 	if (ret)
@@ -220,27 +223,23 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 	return hsmp_read_acpi_dsd(sock);
 }
 
-static int hsmp_create_acpi_sysfs_if(struct device *dev)
+static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj,
+					 struct bin_attribute *bin_attr, char *buf,
+					 loff_t off, size_t count)
 {
-	struct attribute_group *attr_grp;
-	u16 sock_ind;
-	int ret;
+	struct device *dev = container_of(kobj, struct device, kobj);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
 
-	attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group), GFP_KERNEL);
-	if (!attr_grp)
-		return -ENOMEM;
-
-	attr_grp->is_bin_visible = hsmp_is_sock_attr_visible;
-
-	ret = hsmp_get_uid(dev, &sock_ind);
-	if (ret)
-		return ret;
+	return hsmp_metric_tbl_read(sock, buf, count);
+}
 
-	ret = hsmp_create_attr_list(attr_grp, dev, sock_ind);
-	if (ret)
-		return ret;
+static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+					 struct bin_attribute *battr, int id)
+{
+	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
+		return battr->attr.mode;
 
-	return devm_device_add_group(dev, attr_grp);
+	return 0;
 }
 
 static int init_acpi(struct device *dev)
@@ -275,9 +274,36 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
+	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6) {
+		ret = hsmp_get_tbl_dram_base(sock_ind);
+		if (ret)
+			dev_err(dev, "Failed to init metric table\n");
+	}
+
 	return ret;
 }
 
+static struct bin_attribute  hsmp_metric_tbl_attr = {
+	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
+	.read = hsmp_metric_tbl_acpi_read,
+	.size = sizeof(struct hsmp_metric_table),
+};
+
+static struct bin_attribute *hsmp_attr_list[] = {
+	&hsmp_metric_tbl_attr,
+	NULL
+};
+
+static struct attribute_group hsmp_attr_grp = {
+	.bin_attrs = hsmp_attr_list,
+	.is_bin_visible = hsmp_is_sock_attr_visible,
+};
+
+static const struct attribute_group *hsmp_groups[] = {
+	&hsmp_attr_grp,
+	NULL
+};
+
 static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
 	{ACPI_HSMP_DEVICE_HID, 0},
 	{}
@@ -306,10 +332,6 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
-	if (ret)
-		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
-
 	if (!hsmp_pdev.is_probed) {
 		ret = hsmp_misc_register(&pdev->dev);
 		if (ret)
@@ -338,6 +360,7 @@ static struct platform_driver amd_hsmp_driver = {
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.acpi_match_table = amd_hsmp_acpi_ids,
+		.dev_groups = hsmp_groups,
 	},
 };
 
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 8c8e361b1feb..e7df514c699c 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -278,19 +278,16 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 	return 0;
 }
 
-ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
-			     struct bin_attribute *bin_attr, char *buf,
-			     loff_t off, size_t count)
+ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 {
-	struct hsmp_socket *sock = bin_attr->private;
 	struct hsmp_message msg = { 0 };
 	int ret;
 
-	if (!sock)
+	if (!sock || !buf)
 		return -EINVAL;
 
-	/* Do not support lseek(), reads entire metric table */
-	if (count < bin_attr->size) {
+	/* Do not support lseek(), also don't allow more than the size of metric table */
+	if (size != sizeof(struct hsmp_metric_table)) {
 		dev_err(sock->dev, "Wrong buffer size\n");
 		return -EINVAL;
 	}
@@ -301,12 +298,12 @@ ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 	ret = hsmp_send_message(&msg);
 	if (ret)
 		return ret;
-	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
+	memcpy_fromio(buf, sock->metric_tbl_addr, size);
 
-	return bin_attr->size;
+	return size;
 }
 
-static int hsmp_get_tbl_dram_base(u16 sock_ind)
+int hsmp_get_tbl_dram_base(u16 sock_ind)
 {
 	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
 	struct hsmp_message msg = { 0 };
@@ -339,53 +336,6 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
 	return 0;
 }
 
-umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-				  struct bin_attribute *battr, int id)
-{
-	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
-		return battr->attr.mode;
-	else
-		return 0;
-}
-
-static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock_ind)
-{
-	struct bin_attribute *hattr = &hsmp_pdev.sock[sock_ind].hsmp_attr;
-
-	sysfs_bin_attr_init(hattr);
-	hattr->attr.name	= HSMP_METRICS_TABLE_NAME;
-	hattr->attr.mode	= 0444;
-	hattr->read		= hsmp_metric_tbl_read;
-	hattr->size		= sizeof(struct hsmp_metric_table);
-	hattr->private		= &hsmp_pdev.sock[sock_ind];
-	hattrs[0]		= hattr;
-
-	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
-		return hsmp_get_tbl_dram_base(sock_ind);
-	else
-		return 0;
-}
-
-/* One bin sysfs for metrics table */
-#define NUM_HSMP_ATTRS		1
-
-int hsmp_create_attr_list(struct attribute_group *attr_grp,
-			  struct device *dev, u16 sock_ind)
-{
-	struct bin_attribute **hsmp_bin_attrs;
-
-	/* Null terminated list of attributes */
-	hsmp_bin_attrs = devm_kcalloc(dev, NUM_HSMP_ATTRS + 1,
-				      sizeof(*hsmp_bin_attrs),
-				      GFP_KERNEL);
-	if (!hsmp_bin_attrs)
-		return -ENOMEM;
-
-	attr_grp->bin_attrs = hsmp_bin_attrs;
-
-	return hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, sock_ind);
-}
-
 int hsmp_cache_proto_ver(u16 sock_ind)
 {
 	struct hsmp_message msg = { 0 };
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 9ab50bc74676..9b4ab6a3598c 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -57,16 +57,11 @@ struct hsmp_plat_device {
 
 extern struct hsmp_plat_device hsmp_pdev;
 
-ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
-			     struct bin_attribute *bin_attr, char *buf,
-			     loff_t off, size_t count);
 int hsmp_cache_proto_ver(u16 sock_ind);
-umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-				  struct bin_attribute *battr, int id);
-int hsmp_create_attr_list(struct attribute_group *attr_grp,
-			  struct device *dev, u16 sock_ind);
 int hsmp_test(u16 sock_ind, u32 value);
 long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
 void hsmp_misc_deregister(void);
 int hsmp_misc_register(struct device *dev);
+int hsmp_get_tbl_dram_base(u16 sock_ind);
+ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
 #endif /* HSMP_H */
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index e49b53f8c5e3..a1f42163db57 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -9,6 +9,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <asm/amd_hsmp.h>
 #include <asm/amd_nb.h>
 
 #include <linux/device.h>
@@ -61,36 +62,93 @@ static const struct file_operations hsmp_fops = {
 	.compat_ioctl	= hsmp_ioctl,
 };
 
-static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
+static ssize_t hsmp_metric_tbl_plat_read(struct file *filp, struct kobject *kobj,
+					 struct bin_attribute *bin_attr, char *buf,
+					 loff_t off, size_t count)
 {
-	const struct attribute_group **hsmp_attr_grps;
-	struct attribute_group *attr_grp;
-	u16 i;
+	struct hsmp_socket *sock;
+	u16 sock_ind;
 
-	hsmp_attr_grps = devm_kcalloc(dev, hsmp_pdev.num_sockets + 1,
-				      sizeof(*hsmp_attr_grps),
-				      GFP_KERNEL);
-	if (!hsmp_attr_grps)
-		return -ENOMEM;
+	sock_ind = (uintptr_t)bin_attr->private;
+	if (sock_ind >= hsmp_pdev.num_sockets)
+		return -EINVAL;
 
-	/* Create a sysfs directory for each socket */
-	for (i = 0; i < hsmp_pdev.num_sockets; i++) {
-		attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group),
-					GFP_KERNEL);
-		if (!attr_grp)
-			return -ENOMEM;
+	sock = &hsmp_pdev.sock[sock_ind];
 
-		snprintf(hsmp_pdev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
-		attr_grp->name			= hsmp_pdev.sock[i].name;
-		attr_grp->is_bin_visible	= hsmp_is_sock_attr_visible;
-		hsmp_attr_grps[i]		= attr_grp;
+	return hsmp_metric_tbl_read(sock, buf, count);
+}
 
-		hsmp_create_attr_list(attr_grp, dev, i);
-	}
+static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+					 struct bin_attribute *battr, int id)
+{
+	u16 sock_ind;
+
+	sock_ind = (uintptr_t)battr->private;
+
+	if (id == 0 && sock_ind >= hsmp_pdev.num_sockets)
+		return SYSFS_GROUP_INVISIBLE;
 
-	return device_add_groups(dev, hsmp_attr_grps);
+	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
+		return battr->attr.mode;
+
+	return 0;
 }
 
+/*
+ * AMD supports maximum of 8 sockets in a system.
+ * Static array of 8 + 1(for NULL) elements is created below
+ * to create sysfs groups for sockets.
+ * is_bin_visible function is used to show / hide the necessary groups.
+ */
+#define HSMP_BIN_ATTR(index, _list)					\
+static struct bin_attribute attr##index = {				\
+	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},	\
+	.private = (void *)index,					\
+	.read = hsmp_metric_tbl_plat_read,					\
+	.size = sizeof(struct hsmp_metric_table),			\
+};									\
+static struct bin_attribute _list[] = {					\
+	&attr##index,							\
+	NULL								\
+}
+
+HSMP_BIN_ATTR(0, *sock0_attr_list);
+HSMP_BIN_ATTR(1, *sock1_attr_list);
+HSMP_BIN_ATTR(2, *sock2_attr_list);
+HSMP_BIN_ATTR(3, *sock3_attr_list);
+HSMP_BIN_ATTR(4, *sock4_attr_list);
+HSMP_BIN_ATTR(5, *sock5_attr_list);
+HSMP_BIN_ATTR(6, *sock6_attr_list);
+HSMP_BIN_ATTR(7, *sock7_attr_list);
+
+#define HSMP_BIN_ATTR_GRP(index, _list, _name)			\
+static struct attribute_group sock##index##_attr_grp = {	\
+	.bin_attrs = _list,					\
+	.is_bin_visible = hsmp_is_sock_attr_visible,		\
+	.name = #_name,						\
+}
+
+HSMP_BIN_ATTR_GRP(0, sock0_attr_list, socket0);
+HSMP_BIN_ATTR_GRP(1, sock1_attr_list, socket1);
+HSMP_BIN_ATTR_GRP(2, sock2_attr_list, socket2);
+HSMP_BIN_ATTR_GRP(3, sock3_attr_list, socket3);
+HSMP_BIN_ATTR_GRP(4, sock4_attr_list, socket4);
+HSMP_BIN_ATTR_GRP(5, sock5_attr_list, socket5);
+HSMP_BIN_ATTR_GRP(6, sock6_attr_list, socket6);
+HSMP_BIN_ATTR_GRP(7, sock7_attr_list, socket7);
+
+static const struct attribute_group *hsmp_groups[] = {
+	&sock0_attr_grp,
+	&sock1_attr_grp,
+	&sock2_attr_grp,
+	&sock3_attr_grp,
+	&sock4_attr_grp,
+	&sock5_attr_grp,
+	&sock6_attr_grp,
+	&sock7_attr_grp,
+	NULL
+};
+
 static inline bool is_f1a_m0h(void)
 {
 	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
@@ -141,6 +199,12 @@ static int init_platform_device(struct device *dev)
 			dev_err(dev, "Failed to read HSMP protocol version\n");
 			return ret;
 		}
+
+		if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6) {
+			ret = hsmp_get_tbl_dram_base(i);
+			if (ret)
+				dev_err(dev, "Failed to init metric table\n");
+		}
 	}
 
 	return 0;
@@ -162,10 +226,6 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
-	if (ret)
-		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
-
 	return hsmp_misc_register(&pdev->dev);
 }
 
@@ -179,6 +239,7 @@ static struct platform_driver amd_hsmp_driver = {
 	.remove_new	= hsmp_pltdrv_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.dev_groups = hsmp_groups,
 	},
 };
 
-- 
2.25.1

