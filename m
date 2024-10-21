Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C951E7C05
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 11:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729509316; cv=fail; b=leH5taNuRqw/TavTZAcFEuyeWB0GXqikUHBe6YfoMg+yUPmwJHbEeziOS+928qXEcHSjhw36M7+NiBlCo1TVo8jJS3YrJLvohhSe3Rjqk45ABffx6Em2ANM1b+/rwjljrQAbGrA+epqrexwkyHhWjO3A9Y1Mw4ZjMj7JAWwzj/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729509316; c=relaxed/simple;
	bh=kEbdAvP9LPsUIgBHUMbrklkzRAKvWgoyUZD9Ts/Xuuo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YYm8tRG4Y06udvw2iOKd/seYrhMXP580iuN5L2J11VXYRG2TGmgeQp8Fmo4x+hO83c9hMUbVYR9r+fJ9NLtDzEpJa/770IvPquBP47g/KfPeFw2yHO0QuPHY8mwlImZWVrJsddiwGf+a53/MmfFiqMGRrlWBNLGAlWhzNV0ZnFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uUmWaqI9; arc=fail smtp.client-ip=40.107.223.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uUmWaqI9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ud0GEOE6CLWvrK2CFc1/x2fTWflLo4khwxk+IqAlumn8khlNTk95ajnheip9RysfhqKSIYtiOY/GZZBa4M99uYCRiNPmoILGsmzfxqKj+/4U/m6JdfXo8XR6DFnEWFznQGHjQY4ua8+rKwigibU3y9A76wPXnn9fHQx4l3cFwq5HS+dSHiWfLaz9/cIjkCR72Lj2E65kTpjCryjtuJSrAEQwCtNQICN3QI+n1fN7K3S2uiorv8pBHZ0T7SpefUsNZ2Ub1P51MvWE9k4uLrAD0n/P1al85IMv1qbHWQvIudmJD9TOU5kyJEERkdZV2gUZvKEyGxgl4q6oUpOIL7IaJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVGBJtXyqPkL+gVB6DqxfmlAsGwF9l4Xd8Wfd81hsFg=;
 b=o94Y/suqsMrNjbpwY1GYX5R0jBDt1p3oIJrFBG5AKHHDR9L/dE0+8vp5jCna4HbbbvVhmtENtwLO6Pbb9h2cb7rh5cWzxvT0yXcV2bq77srk+T6KRYC5YbgVj38qAQN6Ldthm0mT0NKVKVHFv4JiCxTuEiJer3K0v1YTOpepHGAAAGNkxNIi+UQx1Y3pSC7yHK67r6lxN/404gDzzKEySBW7sR84BSF4cocLKCrhtdq+A+lhBw/80WCUCpVapHr24u/C7P6rkVF2et5se5/iGEzYbjQCFRL2BXCZtjm4Mh/eggrWdfHxqllReIGTC6dMZ/CyAWnxRLc9TZ7LqINSQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVGBJtXyqPkL+gVB6DqxfmlAsGwF9l4Xd8Wfd81hsFg=;
 b=uUmWaqI9wuOYe+8LbvWxf0H5Uyn3owHY/5nQ/Qlvu3ftbKolmdjJu34VkxcGxUVtxq5KS/gY9cQhZJwjFyrj5O1+/UwlFnFV4c6Qb4xqMHUQsBX0lhU6uF/Ekw2rvmizVbzCdAvk8Gyk6/zZKQByH/JuI8GBnPZzpuSLsqzBGc8=
Received: from BN9PR03CA0671.namprd03.prod.outlook.com (2603:10b6:408:10e::16)
 by SJ0PR12MB6832.namprd12.prod.outlook.com (2603:10b6:a03:47e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Mon, 21 Oct
 2024 11:15:08 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:408:10e:cafe::a5) by BN9PR03CA0671.outlook.office365.com
 (2603:10b6:408:10e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29 via Frontend
 Transport; Mon, 21 Oct 2024 11:15:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 11:15:08 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 06:15:06 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v10 10/11] platform/x86/amd/hsmp: Use dev_groups in the driver structure
Date: Mon, 21 Oct 2024 11:14:27 +0000
Message-ID: <20241021111428.2676884-10-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241021111428.2676884-1-suma.hegde@amd.com>
References: <20241021111428.2676884-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|SJ0PR12MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f4bf046-6cb1-4d07-96cc-08dcf1c19f80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j+9my88l1o+uPaaSzl9j1MiBoV2/kPHXnlqaD1vJs3iV8QnsAGcQ6JvGBGt7?=
 =?us-ascii?Q?Mo5bw1kJHnW5uuH3G5jV1BroQB/gXbSFyucJtEFS503+m1qyXlI0mCWVmfGE?=
 =?us-ascii?Q?0vRcLpeYwSTuHA9iSIpQ+wf2Lr2IlB8XYVWBkiv+56/7BgN03w4Qhxy26tvB?=
 =?us-ascii?Q?4/V12LQOjDSgEkQKX1wJr6B82Qw6QHOosoNvkVvc++e8dYzQJ7CBmNpvPtSG?=
 =?us-ascii?Q?GD7feYm6C3HfKFLP0KB7vXCdWvOvhhgVxni1kfPolgDsX+c47/XDn6jT+m1B?=
 =?us-ascii?Q?rQAfYEPgveIcTVi0+8ZIiWw4sLfxzDcHhpAyby/NAbb7ytKKJfSrxT/IzEug?=
 =?us-ascii?Q?DqXyjRBUFfJAU9dxlwp5u6wFwB1rrk7PL0ljj8sJMvsG3sc87M5yVcgUg4VC?=
 =?us-ascii?Q?Twys0Zd+T8551/6qa+6PAsxTpsWiXPbjO2t0YjGD6q2uLBl2kLjl8xjotnQv?=
 =?us-ascii?Q?kC3IlhoU4OBSGNH1x3X9ebUJVo2moLDOPNjcO6dZP+MLvp5o61wRdWJgviuE?=
 =?us-ascii?Q?7J7os36MbxfmVIHX4hMRMdczwIG7mEjsQxnd33tQ3tnC9kzQhB6a4hZaf6pb?=
 =?us-ascii?Q?Wuv4MXNR4cG0t3zhrvoTT0PK513QBKmuawnKVBnjiYCNQT8NpSAJjGcwhe1A?=
 =?us-ascii?Q?STQXsHwRRE96ou6rWpbe4/EZmDcWrsbcpwT6pnHXgfBVkQc4YMtKEhehuIuW?=
 =?us-ascii?Q?kYGS0kl5D+vE6X2snGYG7n79V6U2iUqhta9XLqc2fM+OedQY3j7CyWKrsmpN?=
 =?us-ascii?Q?LOLkEA43IPY8vLr6n8P9bbDWNzMsh+TWym1xS7JCWx8uxaNhNNXTukbHri/Z?=
 =?us-ascii?Q?qkJwZcLRJQ00xMgVNvficYMVi2UwjAW6cEEyz6Pfkj5feEPFdA1p+7kl0QzC?=
 =?us-ascii?Q?KQfPZipb30ZHFoKv9Qt1IhhqDG9konTC7bLfrfBmyK/Kg81Ll4qBM4VeTdBw?=
 =?us-ascii?Q?V1BQIYz2ZvFxuqTR0J64UuQLbcGxEUMXtWbZG5YdMohIRXSe1Cn8MPpyXwhH?=
 =?us-ascii?Q?gx0qapPVx9dRTD+PBI4EA+WcBlWbIFguELyVkO0+zjBZ9YTripioSVQbluQb?=
 =?us-ascii?Q?JZuj+VokWys43+uVTBOlpGLnaXF1Oq0LNAugOXmT08QVF+Oz3NJ2IfpuCGxa?=
 =?us-ascii?Q?EyMYuu3KEzscuD0vmyd+2vEtEL5tnv/k8MEYPZ8YrLuw0dIeQLHJZ+sAnToP?=
 =?us-ascii?Q?U2xFWVxloDvXTYUUU2YenV8McrrBLlis2Vf9UQrJS/b15QUU7ChU/p9b6RWZ?=
 =?us-ascii?Q?+qcVKt7RhTKHITsAhuSSh5tO4ygcZ3Aa0xWl8SpLNzuF8GZZgVF1R0I21yBQ?=
 =?us-ascii?Q?Mr5GHdGPQIzYxDmMd2MP/O5Iv9heNaYpmeXCJ7tm+FlJosZOSADUjc+ez3oL?=
 =?us-ascii?Q?e21uEnwdEAAl8KNw8LkolJAVqrGrPhYw+jVxcItdWljPC4A+Uw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 11:15:08.5973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4bf046-6cb1-4d07-96cc-08dcf1c19f80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6832

Move out of device_add_group() variants, instead assign static array of
attribute groups to .dev_groups in platform_driver structure.
Then use is_visible to enable only the necessary files on the platform.

.read() and .is_bin_visibile() have slightly different
implemetations on ACPI and non-ACPI system, so move them
to respective files.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v9:
None

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
index 06315ecf0b5f..b953959c9adb 100644
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
index a41aa0979da5..905607b5cba5 100644
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
 	.remove		= hsmp_pltdrv_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.dev_groups = hsmp_groups,
 	},
 };
 
-- 
2.25.1

