Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8669A14A0A0
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 07:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720683237; cv=fail; b=fWBlKD0QdhZD2vsptFfZBb6kFfsQ5k1eKOYDtikTYfJ3v5TLfsGaOR10FurneZs5RXj7oDKo8tAzayoHvuL6OIqqfMPzrRoS7NnoasfW+D9l4x73ZUWaq/YO4RajqWmHoCL6eqZ+A954yvs/3XL/GvABZiug4nPNT51rTpsNZfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720683237; c=relaxed/simple;
	bh=npmvtuxfwV3SJpACFWyxraTNMTDVx4U6UxP2f44Iy5E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pj0aPa3u48lRnx+51NGTdvGytGaS3tely8pT1+hrTOgDFs0Zc3G8wDhzg5HX689eYetEqFNE0zKaMB99B5kV86M8fA/X1QARP9HZFSTRu91q0v9+vfvxOYagakIGQb2hrci/gmqFm1QUnTytkgBR3678pbGTJhIR4MFguO4WHnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ejNbvk57; arc=fail smtp.client-ip=40.107.94.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ejNbvk57"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iztjxE3fysPUKjH85NXluhMiofMYVD8VIXEA47UhnzN3AkNKQGkFOMjLn2xypugEpKO0Yri+4Tvinc9LGYmyyBknLRzByVU/qC4N9V1CXRvznUuFdrNDqWUxNYpeJ6NgSETXoKBsF2U+FEHgtoV4TP1G83wClKaU1WcF3O+aBqaApJnZMqOXqn/hn+bJhYuRKyIIkO/gF3xnRSE5fpdCGX/DIhahe7pX0Wkm/p/xPy/E7AO2QPuFH2K9E17ydd7KvACiTraYE+iE0ELUpcjFsbqjsxwFlXUHt4Hd0H966ZfdWwcZ1K9PtdeWhdC1MOj4Uj6yvJOlGQJ6CW9e7pYGNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QRdl4zbYX/Bp1FboAJa70H87jkaCwdEcMysJUZFsVM=;
 b=uGmL3RUernJu/rJDiLXX351i3nq+sKV/0IpHcPRyLcCt2ian7txGS15D3C+vxOv6ZVp/8ipvG5j7CNWL99/DbgGh0vU1RCgZChYBhdk55yludIa/RZw5eRDygSvKekU1RRuJ7S2+NcBaBMmVeDwPrZa5Wobo+KvQ9HbJmGLkYgVfi/A7KUvM1/AQa8NJnKl8WdZmnrYZgt2J447F0QOX3zbwZl/vvgzQLMxg5Oco6Gtc7xkLVz4rvPPe0QBPUWBTFT6nOexWDb0VFUOIp23aSbWWq4VQ8DBGJNnr4OCuDFHcF8geIW8uNSEylIiAcqjHyZ2rgXsY9u9N5NMLodDMcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QRdl4zbYX/Bp1FboAJa70H87jkaCwdEcMysJUZFsVM=;
 b=ejNbvk57cntwJUClWFwCtEs3GL06NVhWttedxCus7FtSKGkbd7aqdwPBJhlrUoGuvxwdURbo6OAVKYq/we3fp/cJza3eQYwBnH+Myj7oQY1SqldB2WsnnmJY+3O/hXfgacwfvCKdP6oHmtusyAYp68weGyd0X6IcIbbuD5jMaiY=
Received: from BLAPR03CA0139.namprd03.prod.outlook.com (2603:10b6:208:32e::24)
 by CYYPR12MB8892.namprd12.prod.outlook.com (2603:10b6:930:be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 07:33:53 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:32e:cafe::9a) by BLAPR03CA0139.outlook.office365.com
 (2603:10b6:208:32e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20 via Frontend
 Transport; Thu, 11 Jul 2024 07:33:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 07:33:53 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Jul
 2024 02:33:50 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v2 09/11] platform/x86/amd/hsmp: Move read() and is_bin_visible() to respective files
Date: Thu, 11 Jul 2024 07:33:12 +0000
Message-ID: <20240711073314.2704871-9-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|CYYPR12MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: ac5868a2-f25b-4ab4-1e03-08dca17bd0c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vQLyZC7NLf21P9TZz1av3Oy9CSBV9fBCCtNrfEl8j57nQV3Tbsckjs9BVT84?=
 =?us-ascii?Q?KCA+Um8gQDOHJzjuylZcVtuFbhakv7t2SNe5ExjnLrSVY3SUiOrFXF8EOPqd?=
 =?us-ascii?Q?WjkDeGUQrsVebAHei3fM3uvuYJsELOhB97q1xwhCUxWTzweKrErlH1YTYdrW?=
 =?us-ascii?Q?SNfIn+SqhMRMw+0oq+uY7vKEhd5ipiEoUlockUsfkZHGkzf4GCwPIrl9xvuN?=
 =?us-ascii?Q?AIvv8KYIIAMS95Efbm38/HHWxEqYCuI2gH750wKap1DFlwNSb5bWkelrhs71?=
 =?us-ascii?Q?fD6UtWc18W9zn4UQmQ9oS2VAzEhc85stVmd+Rn86Ad2VDRD9RW2vFCeFfuCi?=
 =?us-ascii?Q?VyIpJ9GAlByCcQpYDxoK9lDD4PhRGUQkkPZCeiF0uNkHKdvez9g8HHfHly0I?=
 =?us-ascii?Q?sgK5DU7ZwZEdGYSkQ9FY0gms0Wbobc9vgYNxI0MlO/NcCWdPhJ7ySV/KSjCr?=
 =?us-ascii?Q?RHxhNAtF9T0wBOu2Ed1sMRLEuZV9bDht7+UQB7Eqb+QduRq6sSShx1CcVY7m?=
 =?us-ascii?Q?ct/8UmZLmhxdTehkJt48qfwL2+nKjpPSBqyyTctgyBmamXsBsrWH6NbsyPfK?=
 =?us-ascii?Q?mZ950hkPuVVWC4XNnJbBocH52s/0rpEoQqjNUEzcjUrNxuFHY5+fA0QYjYzV?=
 =?us-ascii?Q?oGzRyBqO4oLOW7g8W4vxzujSLS5dToxPDmFcq9e4F0HHzRzY38ZZBF5mSBo/?=
 =?us-ascii?Q?0AhSz6Y/gmC4qK55Aagi31OL1UYtUsd3PvEVrajqPV7hfGFiXb1OBMs4mvBa?=
 =?us-ascii?Q?LhbgJHlySjch2roeBm5vOqz20sKh/NQNFrkVZpYuTe96+GFWwuW4I7uEMKk9?=
 =?us-ascii?Q?429dvLTBp+1zHpmxgZ8GXS/fFNbKQNLG+c8oyk/EPXyz2EBgT054Kb0aLVjS?=
 =?us-ascii?Q?xacu7RQcFX3hultAXDaY9zuAbZC6C37ABvpu4YEKD5frEuGvTmI0SNVOENkT?=
 =?us-ascii?Q?26QePR0YNPiDSLRb4hiN3moUb+8FooO4SXFzGFkJqHbLBEyHEZdumyK3XKuL?=
 =?us-ascii?Q?oFDgf53GTUXWNM/e6DpGUDk3jmv3jiPjj3bM3vNFoaw3vSobbAp6zL+HXytH?=
 =?us-ascii?Q?AmcRg63EXUUQgSOh8bEae9tqcboxqS67p3ptKodpvYRFsH8NqAhy7g4MYDBC?=
 =?us-ascii?Q?Vl+gdg54TEl7G7zLa9VD7Dcwxm2m9JdtX4LU1+YaqoyLN5L4CnQMeFzdBF+7?=
 =?us-ascii?Q?Yoe00FOM0HTpPEPMeZP7iYzGWYq8OLIpZAXtBfDSxNQrLrHCf1wQQNRpUmJa?=
 =?us-ascii?Q?N4mxOeBBISZeuLg7/pZOyH4O4fgkd6aV3INTqbWP/JonLCFq8TLjYBubcYVq?=
 =?us-ascii?Q?7RKoh/y1vvTkdLXYJCSCNpSpKXLDZ1sLv/bslilHAhMIcVkUXLM+xVQvZaUZ?=
 =?us-ascii?Q?iQu6THTeJshl7zmFTME+vTrPjTv6TccUA3SkmZdkDh0hgJ/04lG5eUtwcH2B?=
 =?us-ascii?Q?D4jXy/WWVLb63o257c2o0Wgg+vLwzdIs?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 07:33:53.4352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5868a2-f25b-4ab4-1e03-08dca17bd0c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8892

The .read() and .is_bin_visibile() need to be handled differently in acpi
and platform drivers, due to the way the sysfs files are created.

This is in preparation to using .dev_groups instead of dynamic sysfs
creation. The sysfs at this point is not functional, it will be enabled in
the next patch.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v1:
1. Change is_visible to is_bin_visible in commit message
1. Add parenthesis around read and is_bin_visible in commit message
2. Change plat_dev to hsmp_pdev, hsmp_device to mdev
3. Remove unnecessary if, else conditions in hsmp_is_sock_attr_visible
4. Change un cached to un-cached

 drivers/platform/x86/amd/hsmp/acpi.c | 41 ++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c | 37 ------------------
 drivers/platform/x86/amd/hsmp/plat.c | 57 ++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 86100943aadc..7cb38c8dc627 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -11,6 +11,7 @@
 
 #include "hsmp.h"
 
+#include <asm/amd_hsmp.h>
 #include <asm/amd_nb.h>
 
 #include <linux/acpi.h>
@@ -214,6 +215,8 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 
 	sema_init(&sock->hsmp_sem, 1);
 
+	dev_set_drvdata(dev, sock);
+
 	/* Read MP1 base address from CRS method */
 	ret = hsmp_read_acpi_crs(sock);
 	if (ret)
@@ -246,6 +249,44 @@ static int hsmp_create_acpi_sysfs_if(struct device *dev)
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
+	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
+		return battr->attr.mode;
+
+	return 0;
+}
+
 static int init_acpi(struct device *dev)
 {
 	u16 sock_ind;
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 119a1f8895ca..c906723ae2f2 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -274,34 +274,6 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
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
 	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
@@ -335,15 +307,6 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
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
 static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock_ind)
 {
 	struct bin_attribute *hattr = &hsmp_pdev.sock[sock_ind].hsmp_attr;
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 3bce2c570f2b..c2b83363713f 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -11,6 +11,7 @@
 
 #include "hsmp.h"
 
+#include <asm/amd_hsmp.h>
 #include <asm/amd_nb.h>
 
 #include <linux/device.h>
@@ -90,6 +91,62 @@ static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
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
+	if (sock_ind >= hsmp_pdev.num_sockets)
+		return -EINVAL;
+
+	sock = &hsmp_pdev.sock[sock_ind];
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
+	if (id == 0 && sock_ind >= hsmp_pdev.num_sockets)
+		return SYSFS_GROUP_INVISIBLE;
+
+	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
+		return battr->attr.mode;
+
+	return 0;
+}
+
 static inline bool is_f1a_m0h(void)
 {
 	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
-- 
2.25.1

