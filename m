Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95CC147C80
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jul 2024 17:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721497608; cv=fail; b=nTyGGt2tknuX/dW6IvIj4KvZq2Nmx3idgApEOWuhFByc/YN6tV1qe56cF4DUr7Lt+I58AloTPVph2Iyj5SrtaDjEuLj+Vo+321kXf+PzQ68yOKIBwFK7oXv4RojjJaiRmGA2Y/uaVIHDQJwVHS9gqlWTS8fgLJ+61R7kRZw115Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721497608; c=relaxed/simple;
	bh=xL0o4Z8F4eXMXRhm60AsIRpUdNHXypQd+YE2rshj3cM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FKKTXmb9gkOKVhpC5hCeLx0kbzsmrR96cdzvQLHlQyFOIYjHbSKG18d7ZxiJZ2KV6v5WBNwoqKsU00aghqrlxTqOCGiAEHO7j4V6VIxc9n2OI6b4m0qVuZE2X/DscTO0rl1bd6he+c3myBF+cYv/YQc1k5KMwr/refU3J8HsEX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=R3aGNJ56; arc=fail smtp.client-ip=40.107.243.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="R3aGNJ56"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBZAJVPgL/pCpslcDO0qJSJSvB/qCzKneuwviO7i9X9tdhGHMpMNY4aRClEL3RoyHtvkKOpYKDo7twMd3DLRl+MXRRtcpHY7d4XNe1krbio6Oap/Tu5pIw+qcDWP/bRLFMG9xyvdgYvx9W/Ask2dPSDj+Cf4DEJA40Hw80r7dwlNxBQcX9TuV6E6y8o0jkOrLZNGYuDPnxmLL3F+ZgT3IbtBpPacn8RlWiA69V77hcXKMvOXlbcFQxC1gOTNY1ZxqCt4FbKE+XRxWPu0AGQU6E1zLVVzPc7AqQTeqUyg5QGn2H4yEEw6JOAK5/XVsexgHjLnOgarvVw2cFBI1ESG3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/qUZOYVEJ7YVj9yIxSL9whPjninKP3eLKerwMYMWVc=;
 b=fj+QsvqzQuptrEFkUGex0nD10Y9O3+z/OkKR7RZTK5VbwMjcswn3FFywxNhNdp/3JjBRFH+1cp5tkKVPO6WBdBXNEbyX/bMpxN/3GEuA9sI8K6/f2xqdPsFV4jx8DJroofJ0PJrRMg2HDbCBvQy9EyxjryWGaHVKkqprjKOK06ZqSXx3xb+val2mlNCBOfQpl/t6ckRs/4gc6H3Uj2M9MVZkfIyh8Ilb1WZVA8pXP4swUnnx4KInz1kvrSjNos9kvdDU/2geRPZY9nnbBfpDRKK40sF4CVesL5e9c6yz1QIF5tD/FEZVPsuxjse4rY9BbrmJ7y5SSOy20oVydL9pAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/qUZOYVEJ7YVj9yIxSL9whPjninKP3eLKerwMYMWVc=;
 b=R3aGNJ56DaILMCS57G2IbGXTOrrbP6uM86bUdCPozeQskk5eRiixFYnV9Oh2p2qZsnanQ3X50HmosYV4DBOcs5V2yU5Ua+dPakZUvaOASxNhl71CSS+FsA7FYCLsmEUsilB4czwwgwmbSh9o7h/GE2db2K9bVgy+6azgRhJEgjc=
Received: from DM6PR07CA0100.namprd07.prod.outlook.com (2603:10b6:5:337::33)
 by CY5PR12MB6453.namprd12.prod.outlook.com (2603:10b6:930:37::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Sat, 20 Jul
 2024 17:46:42 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:337:cafe::66) by DM6PR07CA0100.outlook.office365.com
 (2603:10b6:5:337::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Sat, 20 Jul 2024 17:46:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Sat, 20 Jul 2024 17:46:42 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 20 Jul
 2024 12:46:40 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v3 10/11] platform/x86/amd/hsmp: Use dev_groups in the driver structure
Date: Sat, 20 Jul 2024 17:45:51 +0000
Message-ID: <20240720174552.946255-10-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|CY5PR12MB6453:EE_
X-MS-Office365-Filtering-Correlation-Id: 48b30b46-9c33-42f5-4694-08dca8e3ea94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2f6mGhWx6e8Xy6sNmgXyTTuTUU0NCWxaHSO+osru6v8rORG7Fo2VfhEavcOT?=
 =?us-ascii?Q?+9iUAlzbsvDBhZfQ7shjp6Bv0fFLhJZ0uQSlsO6uNeOessc3Xcs6ZhI1ijKo?=
 =?us-ascii?Q?ea39ajNJrRSOluvofoRY4Fr/VKjDjK5FM0BGTygpISyE5QzxIK5/7i0QBTaX?=
 =?us-ascii?Q?eUw4CRuKMo/QsAiAJzSL7Htnua8xdPu7EeONLpsFbv7P+T+EdgXEsnzK6/Dy?=
 =?us-ascii?Q?iUfZswlhVsN/xO8aP1T/GIUGRXeb7nocFAAheA7tu0sXXWk+SYnvUTx1JuAb?=
 =?us-ascii?Q?0/FkvoPt+g5VBJWIr4pnyy4FvIooTu+nmWZuJPBoIOkrPgmFvJEhees5Eopf?=
 =?us-ascii?Q?j8gr5BMvNCtviJKZqz2820AQRoSp0IXX02SCTkKO8BpxCilzqsQz0k+Xyc5f?=
 =?us-ascii?Q?yVKjiYUwdfgIe3hJIcvtrgBNku00XEspsOIt9CVpLNnkerDmimAOIvruotJ0?=
 =?us-ascii?Q?QHQHrT8J311+U+77yu9l7Kna/CTVjjIulRlO0/x+MazJFl12sHZJ2DeO1kHW?=
 =?us-ascii?Q?Rl6A1joFmhHm7DXi9prTmZkYL2bLcz4ThOlCACjcVajXrLQ8Ym8mt4oYtBeo?=
 =?us-ascii?Q?grJq/xrCuBLlng1WMoQFAoXErG8Rb7wGkn9QndBI+yFT6s2xCWvGoxIckvW5?=
 =?us-ascii?Q?rNUuLqZOd/HHfftB9XIEPiV8geUlHvfVf0BQDpMDtdfReUzVEvKn2bD5e+SF?=
 =?us-ascii?Q?LEBAB2C0lhVvfxggz5x3JEVAB2OryNO3UyA+EScesiMYHuQAS7JVNAM5dIiM?=
 =?us-ascii?Q?OmcQOLwhashZHX9ugcSxBp+xqPkhVKcUC/PHGiMwH+m6fAX3NYXSltkZbp84?=
 =?us-ascii?Q?iy79vlKa3qTEl3qYnX42kHj3wzJXtwqTi/c80sct93afZEZl9pN4Jh9DbNAD?=
 =?us-ascii?Q?cvNQY0HWoVvleHfcGtkGP3E5MWixjYruURTsLOxt9h1HSVul25qqlQ7+Iqis?=
 =?us-ascii?Q?n5A69VxT0ZlLdFFbJ8ycNoh0Y79NNXwjf1ornIIGnK3Ch7lG6PftpbIu4Gh3?=
 =?us-ascii?Q?QBpkklgubGcjDEdN5ravvEeDI9vggEKohGy2RTKFO/dzGB6cukA0OQT68aP3?=
 =?us-ascii?Q?W2c1hxW7hrRYkFZ2vTqYpA/wGlFgA29NFq0FOBVq+UUlkSvSiYd48cGDWDAZ?=
 =?us-ascii?Q?I7rjvncQRZle5yLCQGGuxFdvL1dImUo8RX7GNXGzkKMjY7z1ulalVQDAmp5M?=
 =?us-ascii?Q?9P0SzK/Wo9RyVBp5OSMRMiG0EQePYdpzGA9lutwjfThnC2U3KFxBu4AzMuyD?=
 =?us-ascii?Q?KUaFRw5JDUb+oCAZcD8PaKiNQxs89OC29yugOteIxAN7adUaZgELyxfuMyZx?=
 =?us-ascii?Q?qe8aZG3o589jXFniYYHrrgiPp5D8JgxunZHAmk+qTaALCXcME2wL6afdfA/7?=
 =?us-ascii?Q?ipMHEGFz9dve70i5BYZ10sd9XHAC+dSBY/4ecCLcf4iajXxaQuiH+nR6u89u?=
 =?us-ascii?Q?akmWMD0REDI+aqyM/NnLLu8P3g0ZNGWj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2024 17:46:42.5302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b30b46-9c33-42f5-4694-08dca8e3ea94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6453

Move out of device_add_group() variants, instead assign static array of
attribute groups to .dev_groups in platform_driver structure.
Then use is_visible to enable only the necessary files on the platform.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v2:
None
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

