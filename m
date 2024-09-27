Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA4518C32E
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Sep 2024 12:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727438422; cv=fail; b=oDcsgj/QbDsLogwboDXuor/6y7bjoEF4HE+a1L1SMuEA5whWwFNWh7LWeIiLJ4JYjGBEeCkmC6baZtgV5UQenFSBaM+yl8nb/+UznABYDDNv803PbCe9JU1FU1Axpdgntm8qxbZltnauNqq1wCmA5U/mjfoZXxe7a8Wf/0Qclf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727438422; c=relaxed/simple;
	bh=2m7YpLlvzkGtnV1zrnt27dO8PnOv/ERBVX7oZ2r+ckU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GWzU4JnczGZlLWC+9KUipdB0n2ovUkDVy5VOJydcOOcBeyDMrq5ThivdlcYasBL4aWunhxb2rYexNz8RNPVT5sFeJJ5S9POw8IYC0B/h/whPquYxGaJwTf4DDHe7LUlpXEySJcfecPXJ6Z9JfapHZKG4fZ53nJenRDQznoGD1OE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hZ2ueeMK; arc=fail smtp.client-ip=40.107.92.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hZ2ueeMK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CuIBfDTwQsqd/W/VY6pEv50/vymFP7fM+wcUvlL3yTXIUE49KLajIW6TWqJXjU3tsRqtdrMlyHJ42BAO4uQJZRoa23dbDbSVanqhnA+aQZVUJPl4bM403NcQaVzgJoAw6zo+GiKpivrqONKYOLHmIHX26dr+agyekdm7V0t/tpnQd2FKMzFaoPoyRKlcG/tYr/REeknZYvkVV3Bk8PbgRvw2/NjS70HptCQ9pxtiPJ5tBlPqx/CfAW5xKFgvMHfiTLUPp01Jtv5Op14LVaatQzh1etwHNKJGe2OhiquLE2cw+fwObRmLl496GewbknkVZRGRwd7WHEyKjIL+w9tzMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1SWnGNVsDcDUAsUQLeVLuaW/KaQemi9MZCJjnoZr2M=;
 b=UmZUiWprek0aJBKmToCdf0C06cFtxRQQ8L9UrCaAo5uODPz0yMSt+yt9EL0uQ/eOzla5JMoM08nFSfjGT3DZq/XomixvigWyyLC6jqP5nkNSLcFezyr1tV7LX+IncSji9xDb1wus/aLGcCLe+yIEHVoQNBkvawi/q3m4M3s+yYIpSp/Kg1CxveKZrBJZ0rGBAzwqq3DnZ4GhNGCjhidmfn6Vp2E5p4wiS5oU8uVQEwg7MfIFg06+8IYlGC3LODQMQmKpUWD6rhKtv12W2KaZI2EyNAYItTrfYcIewBk+x3l1rlvwRuQIyYRLayPBgUKDacy5W2XUKPGVnAUWBsVcjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1SWnGNVsDcDUAsUQLeVLuaW/KaQemi9MZCJjnoZr2M=;
 b=hZ2ueeMKDJ3CvDtPvLRu/gvJVhuetgwb+0fZ8KxaU75m8DcAZ9oDNS+gaE1kOCtO1R2Iug74LKWExaZ28z/mIDjUapoM02SIcbcj/rirz26Ng0fe20SDWq2wZtYMgJLx93Ri+BXPptKk/jOoZWhXNUtiZDK11m1rFLPzRwiSXqA=
Received: from SN7PR18CA0029.namprd18.prod.outlook.com (2603:10b6:806:f3::28)
 by MN2PR12MB4471.namprd12.prod.outlook.com (2603:10b6:208:26f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.24; Fri, 27 Sep
 2024 12:00:15 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:806:f3:cafe::88) by SN7PR18CA0029.outlook.office365.com
 (2603:10b6:806:f3::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Fri, 27 Sep 2024 12:00:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 12:00:15 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 07:00:13 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v8 10/11] platform/x86/amd/hsmp: Use dev_groups in the driver structure
Date: Fri, 27 Sep 2024 11:59:20 +0000
Message-ID: <20240927115921.10909-10-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927115921.10909-1-suma.hegde@amd.com>
References: <20240927115921.10909-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|MN2PR12MB4471:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa0db6b-d3df-4511-b74d-08dcdeebf30f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u083XbIev57ilCtk7OALW6OA59GSQ22AFeFrYtenBQvx6tpvdMmg/lxam4Am?=
 =?us-ascii?Q?z16ZruIXw6E3PUPTUoVGb0v9wXipd5PitHC4o9j9vE8L8ihBzzILBj55oZyY?=
 =?us-ascii?Q?5j1bCmzsY6s8mBo+z0WZpjq90QHpatu19szSLYhSCanKv+E2O5jH2ybTOLbV?=
 =?us-ascii?Q?+2Fg5kdf4ddvfy3SSjLn23E3DRX/DRggAw1SrA+CwhZZAdArfwrGjJZxZAWg?=
 =?us-ascii?Q?yrNOnfWk7Nvl0K8shWnyG59HGmy6LJ7Lxkid/Y4gEMl5i1GowU+lV0I3rf6o?=
 =?us-ascii?Q?49v1nAFWzmHNK8wtj0qBmT0iazz1tX8ct0/98tQsUVO1kSBTRcrqnulAjwcb?=
 =?us-ascii?Q?/STItEYtD/5jBuvn+QM3cLDqkYPDEzKORs4rRjxCfpaXL3cVyzpyUBy6/egH?=
 =?us-ascii?Q?kwiGkE3nWyed28rNklIzFpQiKU4Ikah333cdXqkgqMsicjV0DYch1QIcV9Dq?=
 =?us-ascii?Q?dQSLIgMsDHQYlwQKe5IXDw7fNIsIHWcLIEpmFIDqQ/uFVUVPZLOmTPv9Paii?=
 =?us-ascii?Q?nZWYKHm4VT3c1pofD7dNawU2CfI4JMNyeiUem09vQFsSEww6smuwmyfKr15z?=
 =?us-ascii?Q?7OrSr+dshU86jH6yfDcU8ZhjyoEe2JzBCtxJI/OjTsgV3w0EL2edYggO++29?=
 =?us-ascii?Q?tapS8/dCYCzG3/eRkLkP0+o6X+qiKr19DXsP7iKnwwdBjglj3ZKdNXO+wgfT?=
 =?us-ascii?Q?4JWABlmzcZQGxEpyWncNR7wYs8XMqzaRfQjC5X9hrn8dGfY/8gt5NES2AI9h?=
 =?us-ascii?Q?LmzNosyaw8puSKSwKhVTqnSjiFudvbbuWtqviEvEbSJoEdYB0nQ3lNgmsaQu?=
 =?us-ascii?Q?lYaJ5jWGBzxTgb7vM1IhFcXOge7so9TbOCpf93aX+sdgpLa6clSDi39Sk6te?=
 =?us-ascii?Q?ETtYhoCUvPR8v75yFK9BGAONsbOafuM8Nmtiy6EnY0b4EmYer4H2eGgqMEtE?=
 =?us-ascii?Q?sUsVuaJvCuZ7ximk0DDkWdK1xFJzFfmFbK/sFfHbmpwq+Go/q8qAzU7JYhi1?=
 =?us-ascii?Q?RfMpGn1H5BIdWgG3wRXPb9zbURzjiqjHH1S28Xv98G25dJeKyWReyKsBRjsr?=
 =?us-ascii?Q?zfCoX1qHVzUrzYruaGE/hz+hd3sNWzxgxCzT7b9z8R6pJ7ylitQZAQF0iRYd?=
 =?us-ascii?Q?dbaaErgCnqQLXx/2Vh2BOjvJe8li8a2TZueDoptWptjmBxvg6mzIA0oppR5T?=
 =?us-ascii?Q?Kx1kpwNvyJcx5+qjj9olVyShijCOF2yHHHvQzppqLzgsYk0M6alK1o4no8VR?=
 =?us-ascii?Q?i4tQ93UyA+ZUCCEsPhojaYKyydDj7IJVZXMR8bO/EYtjKGlb1K7oadBF0TVS?=
 =?us-ascii?Q?zii4eTidI90K/5SbQCu9vlImCGGhXWp+H+hJS0LLKmLkwfz4afsHyZOmIWn1?=
 =?us-ascii?Q?ywhrcSA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 12:00:15.5560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa0db6b-d3df-4511-b74d-08dcdeebf30f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4471

Move out of device_add_group() variants, instead assign static array of
attribute groups to .dev_groups in platform_driver structure.
Then use is_visible to enable only the necessary files on the platform.

.read() and .is_bin_visibile() have slightly different
implemetations on ACPI and non-ACPI system, so move them
to respective files.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
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
index 0c34312d1a50..c1ddd8957f19 100644
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

