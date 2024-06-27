Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857CD1CA80
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Jun 2024 05:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466842; cv=fail; b=jH1VrwlToyz8pd9A7vgUtYpTyBBf31/7RI1tWNsH2JbJNTi3kLsK2htcCNyTtxzJvsWXP00pVTr986HcJGz8COFmdt7OmpjwhtR3+uJiNe+VhDLMDkg0xe3bDAzNndDfaPB2twW2Mp8jiJ30uigYP5KDadTa3GxrB7P2wPzQ+HU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466842; c=relaxed/simple;
	bh=OXEeE68SEIL3J1NCnVhNYez/wf2LEb1AO+kQWlwnC9c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DxhO9j6wE5AWVAS/M9tBv/LE5j46tlO7vPv/lB7KNR1UuhBV9uDlOqZ50i2USIBOX/k60lt3sEITb7stw5GS3+PyEvYbBYcAD2aQU7dol6YJBetX4QbbTIJPomyzkQxLvIZVjZXscAEdGmEgxRWgy3KOVwG5tQFhH+gQezdt9Bg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NpGqIjFP; arc=fail smtp.client-ip=40.107.220.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NpGqIjFP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZPttGU8PDxgfJYtUDE+MD/9OnCqGktjmCd1e0tyNkPgsLy1RWPxggXvSMDjyGPPkQzb8pw4a47SZJeAIv6g92L3l05cNTwP3s9XYDapNYTm8gnDH1sHCvzVMkIlDx867pC//UX/jxOKEskO5+/I7LY8p/1M+tJIpNBKBSlIrQbd3muELx+qwzV8Z7H6/zrdNy+/yT1MqeJMRVUFwEsQpyQ7Y7UDvaUyQfZGDHYWIBFTmG9ChYS6igQNKR0F4gIysgPnWsa7IuqO1k0NNMZMqUTvXJaY6jf2SqDUAy6tSC3CtNSXZb0HX4IZm7536qj7ElcVtQLmqg/6XFmLSr0QOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucGVGOdpB4IAnE8wA0LxecSqAW/syncsvVOYDvx5thY=;
 b=Y8Z9lwFXwJUEuYNMi3woSvA2NiNW4OQuOGLdnw9gW0QghQFI1EkgBJvUkkub6C/9ukuMGh4EvpQBllkX5B+/3EPQwYTH92cyK1FUvdbgTW2l5qobRJ2mOsxW7znKcisaKQfYV4pVVSP/o8/U6mb47njhJohXx7QJELoDZLtO4cP1aacY7sDK4cXs2vdVLExG5Orq2rLiKNjBPRHlUfqhsXbLc0p0GYKhgk8iiAwhjXlNhLnf/xlaAe7lNxJkzeoA529SwMbwWgPY9E8HCZPVnZLYV1IpCkrhKQNBEV8bwKnjbolTafyO9h6P3GlBqoI7ox7MW3yURTwURbKPtyu8WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucGVGOdpB4IAnE8wA0LxecSqAW/syncsvVOYDvx5thY=;
 b=NpGqIjFPIZFarxnvfMnBmlN9+txzFG0SQpzM8+moe/ZFe3AFyGa/meHRuBGfeH+spxDm6gjZaqV+/+ZHo2HWukWhiaS9+03ozFCYEVD/MqraBL6N4etH2U/Ow9qc+t7/PH8k8cFRJX6Is924a257saGf1F2wcuMU8CHVz6gmziI=
Received: from SN7P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::12)
 by LV2PR12MB5943.namprd12.prod.outlook.com (2603:10b6:408:170::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:40:37 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:806:124:cafe::16) by SN7P222CA0008.outlook.office365.com
 (2603:10b6:806:124::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Thu, 27 Jun 2024 05:40:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 27 Jun 2024 05:40:37 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Jun
 2024 00:40:35 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 09/10] platform/x86/amd/hsmp: Use dev_groups in the driver structure
Date: Thu, 27 Jun 2024 05:39:57 +0000
Message-ID: <20240627053958.2533860-10-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627053958.2533860-1-suma.hegde@amd.com>
References: <20240627053958.2533860-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|LV2PR12MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: 54abab71-6b76-4495-f1fd-08dc966bac5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GBnEM++9vSUjJd2icOpnVhp7eat5feianw36i/ITC5gH5o4YRyeCUrJVTeca?=
 =?us-ascii?Q?okoka64r0ilxGRVZO67EaJ1fm4JkKQnlYmzdn4gCcnK5Cv5nSMbnyZyXZJ68?=
 =?us-ascii?Q?1Aq9yCpv5X4fw6QPr3RZQJwg07Pi9k7FMgHLiGaGW/yDBfJfM/IspfPV29lT?=
 =?us-ascii?Q?sDjfIgVw4QqroPpre/SdVY6rL1uGtLngrxZ7GtzhwdSpi8GVgbxXgJmviiYG?=
 =?us-ascii?Q?B379xzL0Bp9RtF3tIATQ3npx9fFOrzoFU3KJ1OGrffCXXEPk9sMfPx5tnnjt?=
 =?us-ascii?Q?PFk2l8ha4gm+OmPLVNsse1hoQuRj8r08yWGF1GWj7ZAhQYIwUX3OAS7DQn2I?=
 =?us-ascii?Q?2ofNxqh9jpZ3KZp2L4BfShdtdh/kD+yr8QW/RFNcKbS/XL1OAQgbJMlnXQm3?=
 =?us-ascii?Q?3bqY66EgcoZur4G32Mzj690PWOID4jsFw3Y5+D3JRxKx/2/ZadLTkGviSCcT?=
 =?us-ascii?Q?MciJAIdaxQmDhAlBuPcMoNPY1bxXEwXD0YGMrHyYmiCX6HJODQmYmV8Y9V+x?=
 =?us-ascii?Q?xHfRwVMLjPE3fMhBaEpcOuKLAfgZ4X2J7gPUkIcUMRZo/10epJNPt205cOR8?=
 =?us-ascii?Q?KhSSnRNsCc1GsGucyNjJ6QnVVuCREJx4VmjTc3B9HhjppeeuQzQ5MAgNLzkn?=
 =?us-ascii?Q?G4jE2b5XSno+1CH9HaMy8lXK90nyiiTv/C7gCuU6VyuWd/5ttxGVs6wUIc2P?=
 =?us-ascii?Q?iKiYLm2lslTpQ78hrKj/Kj/4dCzWDMxN8IPnzolYzBZLDKZj9bBMILPQI+1I?=
 =?us-ascii?Q?XHJH0OlVt3v+goqlEJCHAOIvanG8EFr0MxnMUVrdUzwJp+HsRKXWHsVBb118?=
 =?us-ascii?Q?mGYRR32dJJqUsclQltbIsOMK8YfpYQQ+kpQn3x3gW4x3JHk3r8lUROxKdrv5?=
 =?us-ascii?Q?9ubXYhzVUpC+ozTC9pMNY4SoKhSNQb5n9C1t42gBdNNa06bEHtA5Rp3ZOMf6?=
 =?us-ascii?Q?3c9u3oAYKhNwRBv0b/niK/PMHHLIy+pzceC678u3+UtoQUTw1l7KDnZ+XSDu?=
 =?us-ascii?Q?f0k/zSZ2PFliSYOt6hSXiJV7w6nSL0yas4bTZYHhWROjuHdVxciOoYZOBZUJ?=
 =?us-ascii?Q?mGH7o8IKTnAX8vMuCikuBdhbkCpF33b/V8g6pkISFihqlspaRzIcrcrcMk3u?=
 =?us-ascii?Q?rIOflg3G3IzDvExIlOf+T500TTc60IDu5jJ1XSldqv+gGgtVf2Xh+9CthAIC?=
 =?us-ascii?Q?cAyOgyykDkWUYBKsrTtE/kOV6Db0eHYr3Xi/lRBSmNEeNe5Qu/mrga4a0XIi?=
 =?us-ascii?Q?M8qnVEokfwuViYrnxPgVpE9iBK8nRDIcS+rbqXk751OhT1CWuif7uz8P+Kzb?=
 =?us-ascii?Q?OEAF9yS7DHnJmd/mQK5n+6SinxOchdlK+UbLZns1sF5rt4THPT1cJiQasa8w?=
 =?us-ascii?Q?BVmroIN55Jff6WtzvPwge/+5fzYjymdWWBkdpWyaWvQqVAPBtn2ZWa6c4F4t?=
 =?us-ascii?Q?7sRNGR54pvHWMP+Hc6u500uTyj/R/knc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:40:37.6491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54abab71-6b76-4495-f1fd-08dc966bac5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5943

Move out of device_add_group() variants, instead assign static array of
attribute groups to .dev_groups in platform_driver structure.
Then use is_visible to enable only the necessary files on the platform.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c |  65 ++++++++--------
 drivers/platform/x86/amd/hsmp/hsmp.c |  40 +---------
 drivers/platform/x86/amd/hsmp/hsmp.h |   8 +-
 drivers/platform/x86/amd/hsmp/plat.c | 106 +++++++++++++++++----------
 4 files changed, 102 insertions(+), 117 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 1ea17aa296c7..087cb360814a 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -218,32 +218,9 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
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
@@ -270,8 +247,8 @@ ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 	return bin_attr->size;
 }
 
-umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-				  struct bin_attribute *battr, int id)
+static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+					 struct bin_attribute *battr, int id)
 {
 	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
 		return battr->attr.mode;
@@ -311,9 +288,36 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
+	if (plat_dev.proto_ver == HSMP_PROTO_VER6) {
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
@@ -357,10 +361,6 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
-	if (ret)
-		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
-
 	if (!plat_dev.is_probed) {
 		plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
 		plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
@@ -396,6 +396,7 @@ static struct platform_driver amd_hsmp_driver = {
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.acpi_match_table = amd_hsmp_acpi_ids,
+		.dev_groups = hsmp_groups,
 	},
 };
 
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index c199a0ff457d..5120d8ff707b 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -273,7 +273,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 	return 0;
 }
 
-static int hsmp_get_tbl_dram_base(u16 sock_ind)
+int hsmp_get_tbl_dram_base(u16 sock_ind)
 {
 	struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
 	struct hsmp_message msg = { 0 };
@@ -306,44 +306,6 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
 	return 0;
 }
 
-static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock_ind)
-{
-	struct bin_attribute *hattr = &plat_dev.sock[sock_ind].hsmp_attr;
-
-	sysfs_bin_attr_init(hattr);
-	hattr->attr.name	= HSMP_METRICS_TABLE_NAME;
-	hattr->attr.mode	= 0444;
-	hattr->read		= hsmp_metric_tbl_read;
-	hattr->size		= sizeof(struct hsmp_metric_table);
-	hattr->private		= &plat_dev.sock[sock_ind];
-	hattrs[0]		= hattr;
-
-	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
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
index f876370ba65c..c2d451c7c9fd 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -54,14 +54,8 @@ struct hsmp_plat_device {
 
 extern struct hsmp_plat_device plat_dev;
 
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
index 57aa64b18e0d..da4ddb6e9819 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -59,39 +59,9 @@ static const struct file_operations hsmp_fops = {
 	.compat_ioctl	= hsmp_ioctl,
 };
 
-static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
-{
-	const struct attribute_group **hsmp_attr_grps;
-	struct attribute_group *attr_grp;
-	u16 i;
-
-	hsmp_attr_grps = devm_kcalloc(dev, plat_dev.num_sockets + 1,
-				      sizeof(*hsmp_attr_grps),
-				      GFP_KERNEL);
-	if (!hsmp_attr_grps)
-		return -ENOMEM;
-
-	/* Create a sysfs directory for each socket */
-	for (i = 0; i < plat_dev.num_sockets; i++) {
-		attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group),
-					GFP_KERNEL);
-		if (!attr_grp)
-			return -ENOMEM;
-
-		snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
-		attr_grp->name			= plat_dev.sock[i].name;
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
@@ -126,8 +96,8 @@ ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 	return bin_attr->size;
 }
 
-umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-				  struct bin_attribute *battr, int id)
+static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+					 struct bin_attribute *battr, int id)
 {
 	u8 sock_ind;
 	int ret;
@@ -145,6 +115,61 @@ umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
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
@@ -195,6 +220,12 @@ static int init_platform_device(struct device *dev)
 			dev_err(dev, "Failed to read HSMP protocol version\n");
 			return ret;
 		}
+
+		if (plat_dev.proto_ver == HSMP_PROTO_VER6) {
+			ret = hsmp_get_tbl_dram_base(i);
+			if (ret)
+				dev_err(dev, "Failed to init metric table\n");
+		}
 	}
 
 	return 0;
@@ -216,10 +247,6 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
-	if (ret)
-		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
-
 	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
 	plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
 	plat_dev.hsmp_device.fops	= &hsmp_fops;
@@ -240,6 +267,7 @@ static struct platform_driver amd_hsmp_driver = {
 	.remove_new	= hsmp_pltdrv_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.dev_groups = hsmp_groups,
 	},
 };
 
-- 
2.25.1

