Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ACC14885D
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 07:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720683240; cv=fail; b=bXIN93q2gIcNvXOV9x5ddBmpKnGpCfC9PJifIf06trAIAC678V4twmXrt0A1la4OtcloR7IpvJT7x7uszhTZnljXP8sYoed6fJjTrrkDjepAVlBo12Tfi2qFHVdAroQGjMwrrYH8kUxoN2Gdpeaf0fvPh2RGSk47Ay5I/s2fvLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720683240; c=relaxed/simple;
	bh=rOX6y6pe9s0sax22CsvDI/zIxvX28Hb/dgIAYNEEpsA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g2qCih296izXf/McsyriKjNcM0HVH13nq8z759rKBPeDYM+ESsLDdJFyjhmu+XrWnkW82CPT5ksvBE0Gk5gvNZM1WRJF02yKpvuW7/949pDNVEfzr+Lg1UbX/pRP1Ao/9K6bFPii82fyCncfyBTvXfrYlpZjLUMaW/KxI4glqNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UqA8qfLy; arc=fail smtp.client-ip=40.107.92.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UqA8qfLy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKeyTQ5/mOO1NdZ6d8xZUtFMY6e7sZMJQJUhjAV65OTZQ9qHyjRyVX/qzom7CyqiLq/79G+/CuddQ+nquTVPSr5NOzUm4NUoNVK0kyFEnzoq+XSlDDAZUeenJBPPgqhy1EuN4D7HYteh4K6SEgWXSrMpenZh3g59AN84mULxXBUTrIinz6UqF3IaClbinUOMbyDcJSSTMvHZ+Ot8IEj3D6GsWER5LQ22FlEEPbFijeSgZ/TIPYY/X27Od4W+dL0EbUAgCnga20pvyNJ+74DQojXDNJlbi7H0XRS1M9UCYnL0MQv9vGQUv8DNJKczyqbYOh4BzlBASsrRv+3wso98ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pA7pJ6pTCI3KqbE4+J0/5up0N2CLZiRgW2rMWFbt90=;
 b=LwFDZ65E93veHa9PRn6hMS+ap+HdL/ICGa+IdUMFjDcCyS/Q7LgbFwoT6pmaTpmbQAQ9oiDJeWf+s7VsGN+rZyjiXBclSgxiuDN476dV3TDVlqfUhb9KSt7ftk/dJ8bfgyDu6I80Uhk4XqWo1tvtWKAaltOJejRVSDgetorrJeYvw51ch5/DaHnmHa3Gw5JbYwLIjVm1BxZKt5pd3AWevlVH6yXrDn/fZnFIpm9b/YCZiJc4kKRQmtQ6DXgzJbcpDNMgxsJ8tKsvtYxFmGzMR2AWj6uliY8aapbkuY8xcwzS2ghPMqBBFtu/0uK8mlElPWlE4qijr0ylyZl3CkKCEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pA7pJ6pTCI3KqbE4+J0/5up0N2CLZiRgW2rMWFbt90=;
 b=UqA8qfLy46BiYJLnYW/SOzBzWt2JmgStHZLnvbSRohTaXoAdeq3peJewnOUG1+S5mKYq87WGYmp/hhMIU+vxD8rPKg2wx7QF3YxwLHjdTlt/1JGZa0ocYkixK3BhtzrXWn1kxYUxw8ZSIcME0ScG3sssYx4QAPKFOI+RL7kC1RA=
Received: from BLAPR03CA0121.namprd03.prod.outlook.com (2603:10b6:208:32e::6)
 by PH8PR12MB6673.namprd12.prod.outlook.com (2603:10b6:510:1c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Thu, 11 Jul
 2024 07:33:55 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:32e:cafe::98) by BLAPR03CA0121.outlook.office365.com
 (2603:10b6:208:32e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22 via Frontend
 Transport; Thu, 11 Jul 2024 07:33:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 07:33:55 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Jul
 2024 02:33:52 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v2 10/11] platform/x86/amd/hsmp: Use dev_groups in the driver structure
Date: Thu, 11 Jul 2024 07:33:13 +0000
Message-ID: <20240711073314.2704871-10-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711073314.2704871-1-suma.hegde@amd.com>
References: <20240711073314.2704871-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|PH8PR12MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: a4adcf35-a678-423c-7581-08dca17bd1bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OFQ7ndoRVb2Ku+6RcoCWD2a/AVtYt05LLfFEaZ8/cxh8ekjIfJu9OUaqY4c+?=
 =?us-ascii?Q?UfiQdMepDO62UU34MlpN3KxGzU+MJTasnH9hd2IIB/tNl/Pe2rjdqeFbqnmf?=
 =?us-ascii?Q?YG3jRoX+T/9Im/60UEtCBRroFzmYMjfxpci4f5I7a8JjC4zXE1S9aaFMba6+?=
 =?us-ascii?Q?jg4/5F/86DKg/MCVsUflZCsj1o5E3Mp4RGyrrfV8kbRPTySH8E2WCRTqSnWa?=
 =?us-ascii?Q?5o0jVUvBX9HGpaL+yJx/3C7w7NiifE6pU4cM/0KFPLmfqkZ/g5EWdpUwfjqC?=
 =?us-ascii?Q?dU8XfMvxBUV+IvzBNuGYM77n0EORuHiyEwvJ1QIs98aozuFP/tV2pu5jSLiS?=
 =?us-ascii?Q?0nR4uKaHJL78qdWviJTa485zMbd8BnyNcP44O75KY6rYqlcR2k43w9pY0Qza?=
 =?us-ascii?Q?M01xF/A4kh1IttHkp4YELcGN0wUtVMxHycnoOb9smMQ8pjM2mRH58Z5mugeB?=
 =?us-ascii?Q?i9hVhJFUvj1a6HpUO9b2KVWuBaQi7MrG9Br9t2yZrc78pcKMoCU0BKeM+T8F?=
 =?us-ascii?Q?//GfLpfrPpZrrkrktHJ6vGRZBN3lumJyPIGCgjESwH7Smm+SxsWVulrDeyWe?=
 =?us-ascii?Q?0jRvUOBl892cxaHrhGjGbegcp4Uzr3DYQKxcFFkcW7e+x0hVGctGa9DTBG6n?=
 =?us-ascii?Q?qbuvRTVXUaJXK+IqLIiHhdYwD98A5/9wH+mzWB20j+ugdmkP8bNwh8SRr0hJ?=
 =?us-ascii?Q?fWxEFlK520lwpI9bzxPMJRe/2NcHQq8YBNLZeAaqX3wxZGWQ0SHBUm/9TI+b?=
 =?us-ascii?Q?vVPRqi/9XhB+FYPlsJ1IB6mxtmEAod8MCrx94xay+idZD6GG7yoa0UxTEBak?=
 =?us-ascii?Q?FgrrXqWfRHMiYnI6mIdode9FsB1OVPqQz9dE7Ld93CeHz2aP5reByQd22r+u?=
 =?us-ascii?Q?uDF4CfTKCJ2uisZMmq90MWiwHCwIdc0l9gqB7WA55rsZyWaS6ZADl+nIdat7?=
 =?us-ascii?Q?U9kS7lLJbdNgg1679y/RmgyaI/yZPB732wJxLUjtiUhABWu05jmwqkO5ULNG?=
 =?us-ascii?Q?rlJcM+5ufBwJ8y9DthNy/1Lq/Fi5V7/3fWf5QzQO2FMic4/Ryz4XrTqipw27?=
 =?us-ascii?Q?pJlrBx7jBvWV+RosRZ7wTPXcwUACRO1ZCnKv5lBUCs9t/JWlaND+fYY3NSEm?=
 =?us-ascii?Q?QkVKvvobeoKZddZmDMkCP4DFDJoyw8Hx0NQ7Gi4X3y+ZtJ4hhaD7EWby1DhE?=
 =?us-ascii?Q?qIGh2VZhCBasjNBGlOQtqoIe6HKLkCDofQNM6EfhVkU7OEFSWNRSIciGEP96?=
 =?us-ascii?Q?SHY6VKt3fxvZtN3NFAmPW3f6SR8I13hwZ67Ha3GYSflXdIlpYbGXnOgl47RI?=
 =?us-ascii?Q?ACi4fHyxFhhWLuOFXW2JHIykhk2ZwLWKPVfJRyfNEDgXfaZp5jrXqvpKzZCV?=
 =?us-ascii?Q?YTvcFeGo4wJ0d2rBF60VPa63RwKTenuEatqziRwfKz5G9tLZ+qwSX+RPHHzk?=
 =?us-ascii?Q?uUE0ZRh+p5WatZhbG5SnADFjKA5LmdTY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 07:33:55.0759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4adcf35-a678-423c-7581-08dca17bd1bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6673

Move out of device_add_group() variants, instead assign static array of
attribute groups to .dev_groups in platform_driver structure.
Then use is_visible to enable only the necessary files on the platform.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v1:
Change plat_dev to hsmp_pdev

 drivers/platform/x86/amd/hsmp/acpi.c |  65 ++++++++--------
 drivers/platform/x86/amd/hsmp/hsmp.c |  40 +---------
 drivers/platform/x86/amd/hsmp/hsmp.h |   8 +-
 drivers/platform/x86/amd/hsmp/plat.c | 106 +++++++++++++++++----------
 4 files changed, 102 insertions(+), 117 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 7cb38c8dc627..4b1470ca8675 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -226,32 +226,9 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 	return hsmp_read_acpi_dsd(sock);
 }
 
-static int hsmp_create_acpi_sysfs_if(struct device *dev)
-{
-	struct attribute_group *attr_grp;
-	u16 sock_ind;
-	int ret;
-
-	attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group), GFP_KERNEL);
-	if (!attr_grp)
-		return -ENOMEM;
-
-	attr_grp->is_bin_visible = hsmp_is_sock_attr_visible;
-
-	ret = hsmp_get_uid(dev, &sock_ind);
-	if (ret)
-		return ret;
-
-	ret = hsmp_create_attr_list(attr_grp, dev, sock_ind);
-	if (ret)
-		return ret;
-
-	return devm_device_add_group(dev, attr_grp);
-}
-
-ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
-			     struct bin_attribute *bin_attr, char *buf,
-			     loff_t off, size_t count)
+static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
+				    struct bin_attribute *bin_attr, char *buf,
+				    loff_t off, size_t count)
 {
 	struct device *dev = container_of(kobj, struct device, kobj);
 	struct hsmp_socket *sock = dev_get_drvdata(dev);
@@ -278,8 +255,8 @@ ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 	return bin_attr->size;
 }
 
-umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-				  struct bin_attribute *battr, int id)
+static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+					 struct bin_attribute *battr, int id)
 {
 	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
 		return battr->attr.mode;
@@ -319,9 +296,36 @@ static int init_acpi(struct device *dev)
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
+	.read = hsmp_metric_tbl_read,
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
@@ -365,10 +369,6 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
-	if (ret)
-		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
-
 	if (!hsmp_pdev.is_probed) {
 		hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
 		hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
@@ -404,6 +404,7 @@ static struct platform_driver amd_hsmp_driver = {
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.acpi_match_table = amd_hsmp_acpi_ids,
+		.dev_groups = hsmp_groups,
 	},
 };
 
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index c906723ae2f2..c382b494b9c7 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -274,7 +274,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 	return 0;
 }
 
-static int hsmp_get_tbl_dram_base(u16 sock_ind)
+int hsmp_get_tbl_dram_base(u16 sock_ind)
 {
 	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
 	struct hsmp_message msg = { 0 };
@@ -307,44 +307,6 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
 	return 0;
 }
 
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
index 5d4fc7735a87..b70f40c2726c 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -54,14 +54,8 @@ struct hsmp_plat_device {
 
 extern struct hsmp_plat_device hsmp_pdev;
 
-ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
-			     struct bin_attribute *bin_attr, char *buf,
-			     loff_t off, size_t count);
 int hsmp_cache_proto_ver(u16 sock_ind);
 long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
-umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-				  struct bin_attribute *battr, int id);
-int hsmp_create_attr_list(struct attribute_group *attr_grp,
-			  struct device *dev, u16 sock_ind);
 int hsmp_test(u16 sock_ind, u32 value);
+int hsmp_get_tbl_dram_base(u16 sock_ind);
 #endif /* HSMP_H */
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index c2b83363713f..33868346b5a0 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -61,39 +61,9 @@ static const struct file_operations hsmp_fops = {
 	.compat_ioctl	= hsmp_ioctl,
 };
 
-static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
-{
-	const struct attribute_group **hsmp_attr_grps;
-	struct attribute_group *attr_grp;
-	u16 i;
-
-	hsmp_attr_grps = devm_kcalloc(dev, hsmp_pdev.num_sockets + 1,
-				      sizeof(*hsmp_attr_grps),
-				      GFP_KERNEL);
-	if (!hsmp_attr_grps)
-		return -ENOMEM;
-
-	/* Create a sysfs directory for each socket */
-	for (i = 0; i < hsmp_pdev.num_sockets; i++) {
-		attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group),
-					GFP_KERNEL);
-		if (!attr_grp)
-			return -ENOMEM;
-
-		snprintf(hsmp_pdev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
-		attr_grp->name			= hsmp_pdev.sock[i].name;
-		attr_grp->is_bin_visible	= hsmp_is_sock_attr_visible;
-		hsmp_attr_grps[i]		= attr_grp;
-
-		hsmp_create_attr_list(attr_grp, dev, i);
-	}
-
-	return device_add_groups(dev, hsmp_attr_grps);
-}
-
-ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
-			     struct bin_attribute *bin_attr, char *buf,
-			     loff_t off, size_t count)
+static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
+				    struct bin_attribute *bin_attr, char *buf,
+				    loff_t off, size_t count)
 {
 	struct hsmp_message msg = { 0 };
 	struct hsmp_socket *sock;
@@ -128,8 +98,8 @@ ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 	return bin_attr->size;
 }
 
-umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-				  struct bin_attribute *battr, int id)
+static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+					 struct bin_attribute *battr, int id)
 {
 	u8 sock_ind;
 	int ret;
@@ -147,6 +117,61 @@ umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 	return 0;
 }
 
+/*
+ * AMD supports maximum of 8 sockets in a system.
+ * Static array of 8 + 1(for NULL) elements is created below
+ * to create sysfs groups for sockets.
+ * is_bin_visible function is used to show / hide the necessary groups.
+ */
+#define HSMP_BIN_ATTR(index, _list) \
+static struct bin_attribute attr##index = { \
+	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444}, \
+	.private = #index, \
+	.read = hsmp_metric_tbl_read, \
+	.size = sizeof(struct hsmp_metric_table), \
+}; \
+static struct bin_attribute _list[] = { \
+	&attr##index, \
+	NULL \
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
+#define HSMP_BIN_ATTR_GRP(index, _list, _name) \
+static struct attribute_group sock##index##_attr_grp = { \
+	.bin_attrs = _list, \
+	.is_bin_visible = hsmp_is_sock_attr_visible, \
+	.name = #_name, \
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
@@ -197,6 +222,12 @@ static int init_platform_device(struct device *dev)
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
@@ -218,10 +249,6 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
-	if (ret)
-		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
-
 	hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
 	hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
 	hsmp_pdev.mdev.fops	= &hsmp_fops;
@@ -242,6 +269,7 @@ static struct platform_driver amd_hsmp_driver = {
 	.remove_new	= hsmp_pltdrv_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.dev_groups = hsmp_groups,
 	},
 };
 
-- 
2.25.1

