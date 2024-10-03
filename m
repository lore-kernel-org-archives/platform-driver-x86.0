Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5775A156231
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 11:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727954163; cv=fail; b=TibLsRET4AABlE+m1gxvaRMZ43dPuXVdlXOoxogCdf7MPwpymHvjrwKVRmydIGxLkh5fzHlMugpmUAqDlGUDXdgyEe8BacZ13Bwn6pNYN0WhLkZGmAi/vVZM+/TOW/l2b9q3eRLetdOABpMngE3iITcg49uiIY2jqcLkYzY1heE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727954163; c=relaxed/simple;
	bh=N0/2U/dNOyeyTjE6pWro9nYR3W9NrQfja9ZYTbW4AEM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GZR44MxkaixdZVLJzjzV3vBjZyZjIpklszpa4w55W0508ytG/Zz4bbZrPYKphJasC7si40kWYGAHYwg/qP4MkwjpxOuRyP10uZ1z4IOxHLU6UXaO8ZKW32KdaTg4utitfZ6Kzcypx/9Q/7qQs36m127cnBw2orSaFk4CcGIgOpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=x0O3JhwU; arc=fail smtp.client-ip=40.107.94.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="x0O3JhwU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxpaNEEp0iID/3DI+CGrCMyGcF9ZLXGlI3or5zzk7XsH5FyZ+OmVfe4BKN243uD+WqAInKxf2gTmlAfS3Iwz0zIaPZEgf1sRUKqxT9nf1Otgc5OT105KJX97BjRXJeFLAKDAVlqSCoRDRzDZ0wJ54Yp+xXjb+pdzQdsOz2sFst7qIgozH3ErjPW5JqvTYR27dGxIFCXvMhrYOLmeyNLS8noh4zG6dCa84YH5vqSuo2M/yL0VgegIDm/cxVuRGllnLYWRU+VPtDvLTpzohfHwe9a4Zy82U7wJEauKNmqSF/kkSpgyuCC30GetcrocXrXsW/BQ/QjyPQItYv7ukg4wkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cV9/VsmdXwaVw+29UCBe4i6/gXQCG7sV0z3a0XqtqI=;
 b=FAekr8gLYFOe4RUadIcyAGAIMNvT6mLrJE5trgGRMrOvmGx4z9OU5waEd4QxQBFzbAAOcWSiVPbBIMqB0dRpsXgHbOP/RFRa3v3vK0sCBoTnscclIf4PtYv+WcYyL0IrTJeTFn/njn7+RazzpW0LEIp+dRflnZDNkMmFDMjJM2In4mkwYs1CJi9AlSibYycKLIVSLobgZMUWLXah8T+aXiE3+QQCEj1/jg7M13UbxSHpYiI6RB4DV3snkzjf9pfautNrX7UB7iPnYVhpH5mfSzp3+9syA5ZxUu6GYBjJBkvSWp2KN9KN7hFq2SFQ3q7vtSi6Iy2DRhcxMJVNGq8sBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cV9/VsmdXwaVw+29UCBe4i6/gXQCG7sV0z3a0XqtqI=;
 b=x0O3JhwU7nCGQ9y6t7i9sjlINI3xXNeyPv1Ls6dxcUCr5pl2Z9KlkZy23MUHWrpFF9pnB5QfC7sfPFtU66KEjuDsMAnsI/8aUfQ14mi/DLCqiopdJbS1/53yJPA7Ewe18aE6KwWXLiPDigXtls2f1/nNzXNDMGGiyrdBd1XN6cQ=
Received: from CH2PR16CA0030.namprd16.prod.outlook.com (2603:10b6:610:50::40)
 by IA1PR12MB6354.namprd12.prod.outlook.com (2603:10b6:208:3e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 11:15:53 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::a5) by CH2PR16CA0030.outlook.office365.com
 (2603:10b6:610:50::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.30 via Frontend
 Transport; Thu, 3 Oct 2024 11:15:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 11:15:53 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 06:15:51 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v9 10/11] platform/x86/amd/hsmp: Use dev_groups in the driver structure
Date: Thu, 3 Oct 2024 11:15:14 +0000
Message-ID: <20241003111515.2955700-10-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241003111515.2955700-1-suma.hegde@amd.com>
References: <20241003111515.2955700-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|IA1PR12MB6354:EE_
X-MS-Office365-Filtering-Correlation-Id: a17a7983-a2cf-4840-30bb-08dce39cbf03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o/PyCdtvxZ2pQkVkEZUm7SSTaJ/vQOEaeywuitPeZbXgk3cfulb+bo7qgPau?=
 =?us-ascii?Q?7VAoRQmdryA0gBxVm3gsluwxejwoL7OUYth1iOZlt0x12Qica2Wkps8jhL5V?=
 =?us-ascii?Q?hTLtKXXPPMT+cNb0fP00cqLvC3Mg6feUE0sOkMN07/8kxbvcSC00KoQHdxme?=
 =?us-ascii?Q?balIlvGRXVj/goOst4SgGO5muYeb01H1UUhm+9cm3/5SzZ9aNUSp0o3HN1Mc?=
 =?us-ascii?Q?KHPmpLD5fTu3Jj8DTo4TP8hg2jj9ymEoN8SvQD4sdCYPElyuOwhuZ98BoA2z?=
 =?us-ascii?Q?cLSueixlAyj8SitSxCd+zT8kuh9BIq9TNL+frEvAjKJ2gNWz6+eIQsIpwFGz?=
 =?us-ascii?Q?x8AcwAr70aCVu+F5jLbApYqSAElny2RkZrkOX1TGSx/IuZGPYlc7oacbNJbB?=
 =?us-ascii?Q?QK8jR0k0tbsXI4HvfbMPTh/Jq96Ee0hlLyTQdM7SN0dpIYabvTa0jQ6I8Qh+?=
 =?us-ascii?Q?hIpeJGxdm3CHgHkD5a9Zqey97d+WpRW+L9BR/1pbpf5iOZyt6pw2NQlh1A5Z?=
 =?us-ascii?Q?lIPS0sksNxeBTHlEvrPm6RwYT0K254+IZN/53XvKHBZuLwESC11vOYfdk8KE?=
 =?us-ascii?Q?AqJPMhcdkVKs0EkKu1S5rRX5OVeiNp70OBy/vsZ49Z5hCGveTV4/2j/3xM5a?=
 =?us-ascii?Q?mEYqKAz3zdVwb7tiYEhkQ7HT7B7OBdqbgbxIP4H7bUvSFePFfQGeukJ1+qdr?=
 =?us-ascii?Q?Ft3x4OGnvmnTPcqi26a45EQHWCqubbNlhXnbkpkNopEmYG68/VcxZwVO6ZHR?=
 =?us-ascii?Q?gG6OM208bx84pq9xNoZGP88OnHPnU9rT08iATeZvKgLknOpsGeZvsdBPUdFq?=
 =?us-ascii?Q?aizwsrWnyBzMqiDfDMPySWfibwxUEHd1G+WDMp64mC6l4frypdHqPkcKwcfo?=
 =?us-ascii?Q?Ctrt5xmIx4FvOxOSu7mrL1b9tPe7u/wpbUm/0UY6txOUIXnForD+XZdm8W1n?=
 =?us-ascii?Q?3YQPon2Z99dS3JxKshEwGrH9Cd33McDEng0EX1an4tSbrGBuDM+9EFON5hFM?=
 =?us-ascii?Q?0jD/6CwfRs6Sj17GOrPE8xMC5XwVTZMpSPTCGecADcpn6PrrwmssMY+cQ8Wy?=
 =?us-ascii?Q?g1glqv887GBFgTKrIUXyXoS9eE+lra/xM4OIeolfNbbidYAHn5Cm8+lMcvbK?=
 =?us-ascii?Q?dltEyEZKz7e5Nv1SP3cvbYDh5cNhDfDlNmVdKG9kYBO+TxWNf8FQS9eJxrIV?=
 =?us-ascii?Q?9uPnH1CwRvgPkKpRtAZx2jldDeqtjGI8/XJ+9tpK+kemsR3N4kujtWsxjg/+?=
 =?us-ascii?Q?DDd+Psv6A+AWpLWi5JfbINMFB47f9BxEmDGnozGYrS2K39WHnzZIG/FihsLE?=
 =?us-ascii?Q?gaBipqo4eUKkSyVYGedlomW+bOY36qkhGBS93MH4Igk9hQ3xLzJYvLDEI7tl?=
 =?us-ascii?Q?jxI23Ds=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 11:15:53.7734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a17a7983-a2cf-4840-30bb-08dce39cbf03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6354

Move out of device_add_group() variants, instead assign static array of
attribute groups to .dev_groups in platform_driver structure.
Then use is_visible to enable only the necessary files on the platform.

.read() and .is_bin_visibile() have slightly different
implemetations on ACPI and non-ACPI system, so move them
to respective files.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v8:
Resolved conflict caused due to change in plat.c.

Changes since v7:
hsmp_get_tbl_dram_base() is exported as a module symbol.

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
 drivers/platform/x86/amd/hsmp/hsmp.c |  67 ++--------------
 drivers/platform/x86/amd/hsmp/hsmp.h |   9 +--
 drivers/platform/x86/amd/hsmp/plat.c | 113 +++++++++++++++++++++------
 4 files changed, 141 insertions(+), 113 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 53deee86f456..9435e40bbf25 100644
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
index 6fd08f16933a..7c3fb090684f 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -282,19 +282,16 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
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
@@ -305,13 +302,13 @@ ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 	ret = hsmp_send_message(&msg);
 	if (ret)
 		return ret;
-	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
+	memcpy_fromio(buf, sock->metric_tbl_addr, size);
 
-	return bin_attr->size;
+	return size;
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, AMD_HSMP);
 
-static int hsmp_get_tbl_dram_base(u16 sock_ind)
+int hsmp_get_tbl_dram_base(u16 sock_ind)
 {
 	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
 	struct hsmp_message msg = { 0 };
@@ -343,55 +340,7 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
 	}
 	return 0;
 }
-
-umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-				  struct bin_attribute *battr, int id)
-{
-	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
-		return battr->attr.mode;
-	else
-		return 0;
-}
-EXPORT_SYMBOL_NS_GPL(hsmp_is_sock_attr_visible, AMD_HSMP);
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
-EXPORT_SYMBOL_NS_GPL(hsmp_create_attr_list, AMD_HSMP);
+EXPORT_SYMBOL_NS_GPL(hsmp_get_tbl_dram_base, AMD_HSMP);
 
 int hsmp_cache_proto_ver(u16 sock_ind)
 {
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
index 6049dc126d49..d9fe87fc85bd 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -9,6 +9,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <asm/amd_hsmp.h>
 #include <asm/amd_nb.h>
 
 #include <linux/device.h>
@@ -55,36 +56,93 @@ static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
 	return ret;
 }
 
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
@@ -135,6 +193,12 @@ static int init_platform_device(struct device *dev)
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
@@ -156,10 +220,6 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
-	if (ret)
-		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
-
 	return hsmp_misc_register(&pdev->dev);
 }
 
@@ -173,6 +233,7 @@ static struct platform_driver amd_hsmp_driver = {
 	.remove_new	= hsmp_pltdrv_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.dev_groups = hsmp_groups,
 	},
 };
 
-- 
2.25.1

