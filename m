Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2068.outbound.protection.outlook.com [40.107.236.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905741CD3B
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Jun 2024 05:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466840; cv=fail; b=duo0voFq749eCXCzCPjbfnq+Oa2tP2m1GQ5dMXAZrQdLgyguXFhBfNRrBoBo+HMr/uLbtj7zJCS8tTf5gJ3XZZsp3Im4xjBSP19lDSrlQsOvIVvQnO8+LOfv14dnNLQJUMtOqozm+dFsuNC1SEO19FHOCsonSAd5OuJ+ohF4rdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466840; c=relaxed/simple;
	bh=gdx/hSIJb978aaYqCGhwBzKhnM+f2oFcXRY16nKAZTk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HBrHc1Hq5txE/D8FTzKGVTc4BD50IZfax1v/rxWRYBxpEYra0TyITHh6PtICf5B6bQbTH+tBpAw5R2QSREQjb5gDdATY4bOmHRsO2bgo0izQ2LxX27g1XCqwILxNeoDuUBvPZ6gtcYEDmsnDiJI+yTSgmSDjv5cEdYmJfpAtzq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=T0dB9d3q; arc=fail smtp.client-ip=40.107.236.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="T0dB9d3q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqHKnLM7wnO2MBIM2796wtg9aOWnRtqhVnjhNjNy9O/V2NL9fjxQtUoQ99Qp4bTFMHELxrAolEr4kS2vtUJoZiYaIiYuho3Wk1qVYnW5ExcBQ2SYaWC+gPOt0Xiqy/+yui5vgJaPDJ/lx2RGflbrXpQmF/Q+Yti6htdf78NeE3iNvNAppgsbGAf3dal4V74KdIcU4oBR+qVZgvoJL6pGlC961qbHevgEte0jsX9CFqantsA2lfTn9GTc59/diIGM7Wk7U+7o1yt4AeewuY/0Egv7+vPm/B/4XDr8ctx2AdGHnqEcdq46z58Fyg60y61kGeDTTdZtRkzjKmTNRVfjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PU9CVpfgtD1XkWs2wlwDfO1KT/MPGfCLz0qP3UzYX4o=;
 b=WSIOGno/7fzrXsPa0DJItIEQRX0FQbnV/P+9qGS37ftXz8ofl9Vq7KTxJZ0q806824lK2bCwocOh729gWMSElcAr5tsyL0AN01ocxOfuS/BWs9x24UhPy6AXbf5SGZv25Ih1+6cAuzCqgmyKXqY4L3tXO8u2AqF6ggzCkRP689rVhr9SLxehbBclAsSmLI5ZcAHU/9ytk5ziSBvkHSTJmPXCUYIGHjMY8CcKg4L+uS4iWd+WvOPfDktWA10IF8wxKB04Oi7Zf0TaUxsYteazfGsMrw13qmUyYkdwdjf1Sva0r9U+6dzbiC72h0bPQfdvGxfVBb+BC3eA4hWsiw7NhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PU9CVpfgtD1XkWs2wlwDfO1KT/MPGfCLz0qP3UzYX4o=;
 b=T0dB9d3q59f6PBjHQVsgXE0FY55oWccnA1EbBNYEtaJJrdxAgi3dhn+C5/Jv+cidF/nlqNx5eM8gu631AyOS9ydizFQ6pIGcDDdMI9UMOtGTA6GmvDpZsdeSS6FZdN7bXhypQyuxcv+kcX6Ja47B67myA5aZTlmhwWpwniP3ad8=
Received: from PH8PR07CA0039.namprd07.prod.outlook.com (2603:10b6:510:2cf::7)
 by PH0PR12MB7488.namprd12.prod.outlook.com (2603:10b6:510:1e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:40:35 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::5b) by PH8PR07CA0039.outlook.office365.com
 (2603:10b6:510:2cf::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.25 via Frontend
 Transport; Thu, 27 Jun 2024 05:40:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 27 Jun 2024 05:40:35 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Jun
 2024 00:40:33 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 08/10] platform/x86/amd/hsmp: Move read and is_visible to respective files
Date: Thu, 27 Jun 2024 05:39:56 +0000
Message-ID: <20240627053958.2533860-9-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|PH0PR12MB7488:EE_
X-MS-Office365-Filtering-Correlation-Id: d3914a8b-6647-43f8-73c7-08dc966bab32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xGSPNQ5XPDviZQ6QgmPsyLQssyxHnQ68JB6n4g7BNOD3uA3y7qs0X+ctgfM2?=
 =?us-ascii?Q?Pk06MOEizQaO9YBBktL+6E+1iXkyF2TfQVzi8GBOCRrRKErDupmIEGoGSN3O?=
 =?us-ascii?Q?zgmXvZ82P/b4TdmOwbSwGAtX7B+sVq+OZhRorbCv3k6y/83a6v5SYc6cflKc?=
 =?us-ascii?Q?5Covam9Z7LrWdY1gjoyaSRVlVarAcyZWwwDq0ECWoxAp83CyKek6ts6u06Ra?=
 =?us-ascii?Q?RMnx00SCn4md5ZOgegZKk/A9jpTI4RfJ0QXolj+4JhkYHAXF8sNzMVbijZLd?=
 =?us-ascii?Q?AevnEltWra3Za65pvdUpOSqGyt+Al8nZnmzgIO7d61nSkj8JuO766B9P8AiM?=
 =?us-ascii?Q?hS3RwBbxjF+XE4D0pRi11ntRVBRb3mJO1pFUZ8zn8yEqUtEpEbtieyp9Mray?=
 =?us-ascii?Q?GbgJ2We0iJhUFEDq2i7oal0X3eGnXSJR81ZAJZdUDVUnx1LGfK/rwxJdME7D?=
 =?us-ascii?Q?u9gyI6v30W1my9IykVMY4tHoe1kUKZYLU6xMhbuwISF7VTLFfjOKplsQK0VU?=
 =?us-ascii?Q?BHMRwDO4cezyjKl51gO0HCt37tbZJ9DX6IClewcxXJYRxRHKhPi5WsNhVjce?=
 =?us-ascii?Q?EV9MprXDCHBRK8BUVHIUaDJWqfc2j3jYNexUp4J8x0Wo2usNhXX9I/NKnaHW?=
 =?us-ascii?Q?P5KpoZhD82nMD5oticAitr9uh+4OpdmHned+vu1cdUbb615EnEbdUPcFLrH2?=
 =?us-ascii?Q?9KyuNAVQOQlNY8o8apJ1C0wMS0kKTr/hqY0WZ3JvFHab+5KrUE17aDIw1Oi6?=
 =?us-ascii?Q?qA0CIKOt5jVPwdDPTefIUa+VxlDNwBNNnT//OKU1lb6u9jVD6j9EWIh28Awc?=
 =?us-ascii?Q?2TXhwL8IJq9TUJPgx9dT9aF29FT61GBvpxTrFtX0Hsck4HoyMt2cz7DdTSFP?=
 =?us-ascii?Q?fn/9X9+lTMmR7CSZ4jcLP+itnNgjn5JnQKrODD2eUSMcvYTBBd0ICgY7pIQQ?=
 =?us-ascii?Q?QIeuRk0iz/dfn7dR3iJgsonsesJIxasuwvZSLU5xMpujkWx1RE1OnuD83dOw?=
 =?us-ascii?Q?6qFqgqOSzFnesegQRvSRtGSNDzSoNPtfQpw0hHejpBD5PLPj4gW8laeh+3At?=
 =?us-ascii?Q?BWkFifixRZr6cWCR+uD5xZozZaDI6TKIWeEAUXQxbwuyX5S3reC0bV76p9sE?=
 =?us-ascii?Q?PiWePYJN9mqIkmuJ7fI7aqlhmLExkDqrhU0Yj4lZB1zuwBVS7Uj1SKLwCvwA?=
 =?us-ascii?Q?GK/4l3rycueLXIW8XWKqTTnKYwAUqJOvpoleBMAe86oEjAwHwT9blzwooW9E?=
 =?us-ascii?Q?FNkrb1yo84o76rVFSOvtpieqij3sUlkaLYNYc0CfmnPcwbqgnu6RQO5fAxK5?=
 =?us-ascii?Q?UeEJOCIGVO8g7jL7G1e+wz5BGqcF/cMoaSJ8M2bfWt556fCVfRNhvyMXDoP1?=
 =?us-ascii?Q?oJ2VOKKNbENaO4twoIYsDXvPYorDfRpAEyMOr3RP9fgaMfgBVA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:40:35.6863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3914a8b-6647-43f8-73c7-08dc966bab32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7488

The .read() and .is_visibile() needs to be handled differently in acpi and
platform drivers, due to the way the sysfs files are created.

This is in preparation to using .dev_groups instead of dynamic sysfs
creation. The sysfs at this point is not functional, it will be enabled in
the next patch.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 41 ++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c | 37 ------------------
 drivers/platform/x86/amd/hsmp/plat.c | 57 ++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 0307f4e7176d..1ea17aa296c7 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -12,6 +12,7 @@
 #include "hsmp.h"
 
 #include <linux/acpi.h>
+#include <asm/amd_hsmp.h>
 #include <asm/amd_nb.h>
 #include <linux/platform_device.h>
 
@@ -206,6 +207,8 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 
 	sema_init(&sock->hsmp_sem, 1);
 
+	dev_set_drvdata(dev, sock);
+
 	/* Read MP1 base address from CRS method */
 	ret = hsmp_read_acpi_crs(sock);
 	if (ret)
@@ -238,6 +241,44 @@ static int hsmp_create_acpi_sysfs_if(struct device *dev)
 	return devm_device_add_group(dev, attr_grp);
 }
 
+ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
+			     struct bin_attribute *bin_attr, char *buf,
+			     loff_t off, size_t count)
+{
+	struct device *dev = container_of(kobj, struct device, kobj);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	struct hsmp_message msg = { 0 };
+	int ret;
+
+	if (!sock)
+		return -EINVAL;
+
+	/* Do not support lseek(), reads entire metric table */
+	if (count < bin_attr->size) {
+		dev_err(sock->dev, "Wrong buffer size\n");
+		return -EINVAL;
+	}
+
+	msg.msg_id      = HSMP_GET_METRIC_TABLE;
+	msg.sock_ind    = sock->sock_ind;
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
+
+	return bin_attr->size;
+}
+
+umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+				  struct bin_attribute *battr, int id)
+{
+	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
+		return battr->attr.mode;
+	else
+		return 0;
+}
+
 static int init_acpi(struct device *dev)
 {
 	u16 sock_ind;
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 4bf598021f4a..c199a0ff457d 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -273,34 +273,6 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 	return 0;
 }
 
-ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
-			     struct bin_attribute *bin_attr, char *buf,
-			     loff_t off, size_t count)
-{
-	struct hsmp_socket *sock = bin_attr->private;
-	struct hsmp_message msg = { 0 };
-	int ret;
-
-	if (!sock)
-		return -EINVAL;
-
-	/* Do not support lseek(), reads entire metric table */
-	if (count < bin_attr->size) {
-		dev_err(sock->dev, "Wrong buffer size\n");
-		return -EINVAL;
-	}
-
-	msg.msg_id	= HSMP_GET_METRIC_TABLE;
-	msg.sock_ind	= sock->sock_ind;
-
-	ret = hsmp_send_message(&msg);
-	if (ret)
-		return ret;
-	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
-
-	return bin_attr->size;
-}
-
 static int hsmp_get_tbl_dram_base(u16 sock_ind)
 {
 	struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
@@ -334,15 +306,6 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
 	return 0;
 }
 
-umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-				  struct bin_attribute *battr, int id)
-{
-	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
-		return battr->attr.mode;
-	else
-		return 0;
-}
-
 static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock_ind)
 {
 	struct bin_attribute *hattr = &plat_dev.sock[sock_ind].hsmp_attr;
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 62423581d839..57aa64b18e0d 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -11,6 +11,7 @@
 
 #include "hsmp.h"
 
+#include <asm/amd_hsmp.h>
 #include <asm/amd_nb.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -88,6 +89,62 @@ static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
 	return device_add_groups(dev, hsmp_attr_grps);
 }
 
+ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
+			     struct bin_attribute *bin_attr, char *buf,
+			     loff_t off, size_t count)
+{
+	struct hsmp_message msg = { 0 };
+	struct hsmp_socket *sock;
+	u8 sock_ind;
+	int ret;
+
+	ret = kstrtou8(bin_attr->private, 10, &sock_ind);
+	if (ret)
+		return ret;
+
+	if (sock_ind >= plat_dev.num_sockets)
+		return -EINVAL;
+
+	sock = &plat_dev.sock[sock_ind];
+	if (!sock)
+		return -EINVAL;
+
+	/* Do not support lseek(), reads entire metric table */
+	if (count < bin_attr->size) {
+		dev_err(sock->dev, "Wrong buffer size\n");
+		return -EINVAL;
+	}
+
+	msg.msg_id	= HSMP_GET_METRIC_TABLE;
+	msg.sock_ind	= sock_ind;
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
+
+	return bin_attr->size;
+}
+
+umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+				  struct bin_attribute *battr, int id)
+{
+	u8 sock_ind;
+	int ret;
+
+	ret = kstrtou8(battr->private, 10, &sock_ind);
+	if (ret)
+		return ret;
+
+	if (id == 0 && sock_ind >= plat_dev.num_sockets)
+		return SYSFS_GROUP_INVISIBLE;
+
+	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
+		return battr->attr.mode;
+	else
+		return 0;
+}
+
 static inline bool is_f1a_m0h(void)
 {
 	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
-- 
2.25.1

