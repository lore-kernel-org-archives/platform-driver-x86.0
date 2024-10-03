Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2080.outbound.protection.outlook.com [40.107.101.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5101547CE
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 11:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727954160; cv=fail; b=mankhcR51nnxDpOVKGJf0P9QK/JsZHMzJQQccJqtU3ZYlEUNjmbCkq+6K0A1J6QP35bwzybDLLPrmjbvW5AkwPtl8cXVjBwy4gK1gi0QllVpsCBqSqMK2M9Nu0MYGbk3rbuCWXNY2TO7QbNIejDVyzuGlkjud6CG9bnrSG0/+kQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727954160; c=relaxed/simple;
	bh=jwqc/9iXbqwEwcsORExtgRzJednr5IWw1dXrRabtrIo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oDpQ1kNPk59ZW9+28lBQxIDhWQbh9yfogQFMsClEpBMkZzcT78Mw2TbQ1o8vz13bwSrmKy6j824qt4LAse+e/mLekY500FwPMZREKhEbTAGuk1fh4tIo/y+Q8sDx304he/mU3UzTzNuBQaBAnzvrnNLPc6W7agPycZ8DX2mtKV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=j0npAM9D; arc=fail smtp.client-ip=40.107.101.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="j0npAM9D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQOoA36r/7BefFCBxRJ1lhpZ7ye7lHlKczj3FAAcJkIMo9zgIldXNXRl5s2fT7p3LIXyaSDMfpbemr/AFRwzWdkHyZGx/Avy8dAY7RszLUB8PgPB4orXmOQQUJPj0MYOih6O5IZ/FyVPV3k9DhJYAkhpdqRtplb9PkGcRFFjO7tGBfK+k1OYnQKe0bJ8zItN7DCQLwpECKb5QNYOLSwBTlOE0Zs+bbLnYrzSstSu6xL4W11iMqoXIQ1ADZiJpr2nuJKSppivMieNJfBfCtxt2UBriJt3q/8dj9G5OH2DO8iLwTbeKJlNBxZF9amm0+iw0dKpXz2HEXLvotFwdq8rJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWTDpyGLr53Om/SclUNbnKH6VFJ0MtyLM4mBBlhKqnM=;
 b=qkXNSGQQThEE2YTTco3cqD5vBJoQ66ltQ7PVQ2WlXidh17cBV/wFqUAJ2Vu2CDG/OoighKcV7jS4u5QDINa5Gy5JdPcqsKObOKbMQ8Z6sH/za6czvDfhjlvJwdwVSgWdAPuWKidtzbEOPNjLtGlC3Tq6Siof8UGGcYFXCntolLaIYrUqLmZ9KJvNKQAKmKVVzGVm4znAPqAFnDY1kMxz1A975FNf7bRAAP9+ndjQrQ3lSMXItsjuYW+VRlSQF3/cKQ2kq0g4oWqcWVwyVz/UjjVATiUHOSyYLXfmDRYdh4M8v4tm/YHLySedz5gG6OY7NPW2LASpzlJqR1K29rx69A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWTDpyGLr53Om/SclUNbnKH6VFJ0MtyLM4mBBlhKqnM=;
 b=j0npAM9D71UFezxfXxrv6wFpgT9NocfGGzU6k9mDbMopdZTtl53llV3EhDCO1GRHb5dybJQY+Y7HpSMR65UU/XQuc/48aQ4ror+L0hQnt3YwCADKghsJr83nSrKyxLYknectbONa0Xe8GmRvpuUryhg11ehnC1ZmDDFy06pKY/I=
Received: from CH0PR03CA0277.namprd03.prod.outlook.com (2603:10b6:610:e6::12)
 by CYXPR12MB9387.namprd12.prod.outlook.com (2603:10b6:930:e6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 11:15:55 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::1) by CH0PR03CA0277.outlook.office365.com
 (2603:10b6:610:e6::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.17 via Frontend
 Transport; Thu, 3 Oct 2024 11:15:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 11:15:55 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 06:15:53 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v9 11/11] platform/x86/amd/hsmp: Make hsmp_pdev static instead of global
Date: Thu, 3 Oct 2024 11:15:15 +0000
Message-ID: <20241003111515.2955700-11-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|CYXPR12MB9387:EE_
X-MS-Office365-Filtering-Correlation-Id: ace67948-bce3-4317-ff11-08dce39cc02b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VsWdvu/hiF0aQxcaXPEBjFZT9Z5a0D+eVjOvba3O4idKpSIbE/a1Uoh4rb/Z?=
 =?us-ascii?Q?TLJbt/dbf/fJgT6taKfGoigo4K0kneQvmJaGglPUkpdMxYqd9NXKheO6jDsm?=
 =?us-ascii?Q?fZAZFXNDnvbuISPRxLB1G5/iXSu3d/NqMqNKXif5gWZcBqTP3gBLCCBZO/Jt?=
 =?us-ascii?Q?2qOLuLrMQm7oL7yaPkgsO3JYg3OvwPx7gZF+N6GS1lIvvCPaBy7SU/pv2Xee?=
 =?us-ascii?Q?2W//6ImVCh4dI8n3KGjlDSCcsdp5J7eDZC+rUg7IGcJC/mKE1jdqkJ3pNKUI?=
 =?us-ascii?Q?3Y0aMWtlH/M02TcD3lc0NNoxcBve+S7ajnIHLHjHKEPTKxj0RiIA1yCjQaPr?=
 =?us-ascii?Q?bl6m54oLKg/CzbIpdZrOMBFNCywz90rKqFFFB4iq8KUxeSo35rc5EzA1ZDd2?=
 =?us-ascii?Q?tgAtFLZNULfoXY/NZnHfdU1pf170XgObKoZXer97c9u9UMBs8kvUtVetwrgT?=
 =?us-ascii?Q?UAzx+oPo6V+2BNZrmah5VI6joCIBRWMI7hIcKPAy0022413xA5YyerG0T4lJ?=
 =?us-ascii?Q?6N8BUeEktrc8E3PfnVToTrLjiFjM4dAV8IQAZ4momfTYBIeZo4tMYCgH4KpH?=
 =?us-ascii?Q?H5yV92oS8Dz4vcptgtS48MvVARgB5bk9v6dKHbV3pTRmAqV1WAiPAhgnAknB?=
 =?us-ascii?Q?Ze7er8kXiiaUBazc+ANplWSl/fQq2p7l45y5uJdFTLnDMrdJfjwQz32VLqEu?=
 =?us-ascii?Q?oZ/C0shG5MSyMnhI8c9xcuyXXSZJ9wDtrNY0tfLODM5pEUWtORW8Wz9e3mXF?=
 =?us-ascii?Q?T0EPgg8zXBydNQhDjMHs2+GSO5DfchPYaCZMW3bPXttN9ADcn10f1979xQwk?=
 =?us-ascii?Q?4NZ3ChCOJSNZ9bJuZ0WKDg3YtZEJli7HWOCZgqHvpLzEXW/PPpvCDqgXjeIj?=
 =?us-ascii?Q?XO2xuvtPyZcTXDm37ypJ3eCOZk44TRKSC9pLUOtje6WpyxAs79kd2OVZxY7n?=
 =?us-ascii?Q?lN5gt/4OPwHn4xKcDaPuNoOs7WLxNXjDSY4C7Hwi07g+6wzy+pAs3O+Jf/ku?=
 =?us-ascii?Q?V9cZBYflPUHFNl6xQu2CHJzyRDEfS/3s+H8yzqWlphidoRGBWCkgcgx8orpt?=
 =?us-ascii?Q?o7kudaJRqztqGpsptGWu8sjK8mGL7gvJiKyuUgqwqoszs4LiyqNJILB5TPHx?=
 =?us-ascii?Q?KFUndgbWHn/8xkzasAfNR63gRr+1MwPk+QJ/wZ6GqjYrlnT//UbE5FobV8pb?=
 =?us-ascii?Q?A1s0wzrdPkEJRJ8cScon2WOIrlUAD0/wTt1Kk+SdkHacHCSv11tFQmUEDV2W?=
 =?us-ascii?Q?VBB4clwKRPjC1fUjp6Q9pyFuRw/DjpIlJjNpfLW8ldge5A/motYkVaU3qFmg?=
 =?us-ascii?Q?8zvgCBaDv47UqxKpVaPx+ZAhEyRkyZ4B8aM1btlV/iS/N/YhKJrFFqEPnQ2M?=
 =?us-ascii?Q?HRyPd+O8kPsnh4VYVvv48G9hNQM2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 11:15:55.7186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ace67948-bce3-4317-ff11-08dce39cc02b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9387

Instead of making hsmp_pdev global and exporting this symbol from hsmp.c,
make it static and create a wrapper function get_hsmp_pdev() to access
hsmp_pdev from plat.c and acpi.c.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v8
None

Changes since v7
New patch
 drivers/platform/x86/amd/hsmp/acpi.c | 36 ++++++++++++++++------------
 drivers/platform/x86/amd/hsmp/hsmp.c |  9 +++++--
 drivers/platform/x86/amd/hsmp/hsmp.h |  3 +--
 drivers/platform/x86/amd/hsmp/plat.c | 32 +++++++++++++++----------
 4 files changed, 48 insertions(+), 32 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 9435e40bbf25..360b7789b192 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -35,6 +35,8 @@
 #define MSG_ARGOFF_STR		"MsgArgOffset"
 #define MSG_RESPOFF_STR		"MsgRspOffset"
 
+static struct hsmp_plat_device *hsmp_pdev;
+
 static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
 			      u32 *value, bool write)
 {
@@ -203,7 +205,7 @@ static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
 /* Parse the ACPI table to read the data */
 static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 {
-	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
+	struct hsmp_socket *sock = &hsmp_pdev->sock[sock_ind];
 	int ret;
 
 	sock->sock_ind		= sock_ind;
@@ -236,7 +238,7 @@ static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj
 static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 					 struct bin_attribute *battr, int id)
 {
-	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
+	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6)
 		return battr->attr.mode;
 
 	return 0;
@@ -250,7 +252,7 @@ static int init_acpi(struct device *dev)
 	ret = hsmp_get_uid(dev, &sock_ind);
 	if (ret)
 		return ret;
-	if (sock_ind >= hsmp_pdev.num_sockets)
+	if (sock_ind >= hsmp_pdev->num_sockets)
 		return -EINVAL;
 
 	ret = hsmp_parse_acpi_table(dev, sock_ind);
@@ -274,7 +276,7 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
-	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6) {
+	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_err(dev, "Failed to init metric table\n");
@@ -314,15 +316,19 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 {
 	int ret;
 
-	if (!hsmp_pdev.is_probed) {
-		hsmp_pdev.num_sockets = amd_nb_num();
-		if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
+	hsmp_pdev = get_hsmp_pdev();
+	if (!hsmp_pdev)
+		return -ENOMEM;
+
+	if (!hsmp_pdev->is_probed) {
+		hsmp_pdev->num_sockets = amd_nb_num();
+		if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_SOCKETS)
 			return -ENODEV;
 
-		hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
-					      sizeof(*hsmp_pdev.sock),
-					      GFP_KERNEL);
-		if (!hsmp_pdev.sock)
+		hsmp_pdev->sock = devm_kcalloc(&pdev->dev, hsmp_pdev->num_sockets,
+					       sizeof(*hsmp_pdev->sock),
+					       GFP_KERNEL);
+		if (!hsmp_pdev->sock)
 			return -ENOMEM;
 	}
 
@@ -332,11 +338,11 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (!hsmp_pdev.is_probed) {
+	if (!hsmp_pdev->is_probed) {
 		ret = hsmp_misc_register(&pdev->dev);
 		if (ret)
 			return ret;
-		hsmp_pdev.is_probed = true;
+		hsmp_pdev->is_probed = true;
 	}
 
 	return 0;
@@ -348,9 +354,9 @@ static void hsmp_acpi_remove(struct platform_device *pdev)
 	 * We register only one misc_device even on multi-socket system.
 	 * So, deregister should happen only once.
 	 */
-	if (hsmp_pdev.is_probed) {
+	if (hsmp_pdev->is_probed) {
 		hsmp_misc_deregister();
-		hsmp_pdev.is_probed = false;
+		hsmp_pdev->is_probed = false;
 	}
 }
 
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 7c3fb090684f..82d8ba2e1204 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -35,8 +35,7 @@
 
 #define DRIVER_VERSION		"2.3"
 
-struct hsmp_plat_device hsmp_pdev;
-EXPORT_SYMBOL_NS_GPL(hsmp_pdev, AMD_HSMP);
+static struct hsmp_plat_device hsmp_pdev;
 
 /*
  * Send a message to the HSMP port via PCI-e config space registers
@@ -384,6 +383,12 @@ void hsmp_misc_deregister(void)
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_misc_deregister, AMD_HSMP);
 
+struct hsmp_plat_device *get_hsmp_pdev(void)
+{
+	return &hsmp_pdev;
+}
+EXPORT_SYMBOL_NS_GPL(get_hsmp_pdev, AMD_HSMP);
+
 MODULE_DESCRIPTION("AMD HSMP Common driver");
 MODULE_VERSION(DRIVER_VERSION);
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 9b4ab6a3598c..e852f0a947e4 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -55,8 +55,6 @@ struct hsmp_plat_device {
 	bool is_probed;
 };
 
-extern struct hsmp_plat_device hsmp_pdev;
-
 int hsmp_cache_proto_ver(u16 sock_ind);
 int hsmp_test(u16 sock_ind, u32 value);
 long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
@@ -64,4 +62,5 @@ void hsmp_misc_deregister(void);
 int hsmp_misc_register(struct device *dev);
 int hsmp_get_tbl_dram_base(u16 sock_ind);
 ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
+struct hsmp_plat_device *get_hsmp_pdev(void);
 #endif /* HSMP_H */
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index d9fe87fc85bd..2d06df0cbcff 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -37,6 +37,8 @@
 #define HSMP_INDEX_REG		0xc4
 #define HSMP_DATA_REG		0xc8
 
+static struct hsmp_plat_device *hsmp_pdev;
+
 static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
 			     u32 *value, bool write)
 {
@@ -64,10 +66,10 @@ static ssize_t hsmp_metric_tbl_plat_read(struct file *filp, struct kobject *kobj
 	u16 sock_ind;
 
 	sock_ind = (uintptr_t)bin_attr->private;
-	if (sock_ind >= hsmp_pdev.num_sockets)
+	if (sock_ind >= hsmp_pdev->num_sockets)
 		return -EINVAL;
 
-	sock = &hsmp_pdev.sock[sock_ind];
+	sock = &hsmp_pdev->sock[sock_ind];
 
 	return hsmp_metric_tbl_read(sock, buf, count);
 }
@@ -79,10 +81,10 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 
 	sock_ind = (uintptr_t)battr->private;
 
-	if (id == 0 && sock_ind >= hsmp_pdev.num_sockets)
+	if (id == 0 && sock_ind >= hsmp_pdev->num_sockets)
 		return SYSFS_GROUP_INVISIBLE;
 
-	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
+	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6)
 		return battr->attr.mode;
 
 	return 0;
@@ -156,10 +158,10 @@ static int init_platform_device(struct device *dev)
 	struct hsmp_socket *sock;
 	int ret, i;
 
-	for (i = 0; i < hsmp_pdev.num_sockets; i++) {
+	for (i = 0; i < hsmp_pdev->num_sockets; i++) {
 		if (!node_to_amd_nb(i))
 			return -ENODEV;
-		sock = &hsmp_pdev.sock[i];
+		sock = &hsmp_pdev->sock[i];
 		sock->root			= node_to_amd_nb(i)->root;
 		sock->sock_ind			= i;
 		sock->dev			= dev;
@@ -194,7 +196,7 @@ static int init_platform_device(struct device *dev)
 			return ret;
 		}
 
-		if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6) {
+		if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
 			ret = hsmp_get_tbl_dram_base(i);
 			if (ret)
 				dev_err(dev, "Failed to init metric table\n");
@@ -208,10 +210,10 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 {
 	int ret;
 
-	hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
-				      sizeof(*hsmp_pdev.sock),
-				      GFP_KERNEL);
-	if (!hsmp_pdev.sock)
+	hsmp_pdev->sock = devm_kcalloc(&pdev->dev, hsmp_pdev->num_sockets,
+				       sizeof(*hsmp_pdev->sock),
+				       GFP_KERNEL);
+	if (!hsmp_pdev->sock)
 		return -ENOMEM;
 
 	ret = init_platform_device(&pdev->dev);
@@ -298,12 +300,16 @@ static int __init hsmp_plt_init(void)
 		return ret;
 	}
 
+	hsmp_pdev = get_hsmp_pdev();
+	if (!hsmp_pdev)
+		return -ENOMEM;
+
 	/*
 	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
 	 * if we have N SMN/DF interfaces that ideally means N sockets
 	 */
-	hsmp_pdev.num_sockets = amd_nb_num();
-	if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
+	hsmp_pdev->num_sockets = amd_nb_num();
+	if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_SOCKETS)
 		return ret;
 
 	ret = platform_driver_register(&amd_hsmp_driver);
-- 
2.25.1

