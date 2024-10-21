Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E411E7C01
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 11:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729509315; cv=fail; b=ebrwv6ybm1PXcm+7igfh4SDtj2NC2f8O6TutdjOW7YLJrEajjMq/DG3EKdtbAyLOQQ3Br584ObG1XTeSbJInXfZoD3kVhLnlbPRSC6/5RbgxoG8559GzyIrL7r8AUaOpxjDWTRD85fyiqkSd7S+422e2fCABtquF8+Pju5Yr4Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729509315; c=relaxed/simple;
	bh=isxAJJhHuVVmWAWWfQsTbI5qEuiZ6SkvXbNvJg2dcr8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FzgHleQtiCLi1LRlxkIhxIW5UIK1W1FmENZgr3s4lr868cGdmMVOyCPufkES7hvq6ZTlnfMUSqsujiXdQjl/1+/dze9rPZ8nIyk3PA9D5Wr8tpZJ491LyNmzcmKGs+RbBoTTheQcu2LebS105i1tJtgZZfJUjzSPX9nL8cmzGJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IVDw2yBC; arc=fail smtp.client-ip=40.107.243.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IVDw2yBC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfBcZICh0+ZMxAaBOvx2iGzMumoljJRW3iBgTVU2k3yDN2WSWDAeg4PYXOnPfpIW85TMlLVuw2wGMlKBgV9eJiwjJY4Mxr5JgPrv9E5Zn7cDNs5yK2vWNguhrEl40ghTFYsNWAIK+bWcijcnsRLcV1WVjKHBBInj0dpx6WFkxmW782rfPObpf6pAjqOn0IyJXOmjgIOS2DX5+3jSCrWIdT/T52ODlPjxbYSb13lfx1UhFXRPVfPqlUVv7/1GxMQFS4GrXHnjd+NuWIG9nFDg9KcLfGlORQTIqKjY/4H/6ihQAa3bK/Z5L3aChsYyh7MHiZC0Z9AtHfwCGz4TyqtG1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUrwkdA1/zqpbYHYWlwm7Qn3jSSdsi5Veh+1M+z1Xyo=;
 b=wNTIZZ86kj/5pYSER2EXLdMVgpXTpV6FF/eXnjZBCq6eEGXJJ0OzLR0o1Erv81pA4tK8UrnYkJYCinCX0tzgrcneVo7X7KrbcboyNWe9UkX6jN7iu6xPwGQVxYyNCWC1c2l5f8xN9v12LbWBdTfcwtG9sV3rIvHo30YBiAqn5BYvQ0Fr92NA53H3w4Uptx+AOEJH06peu01UQA+6EwwJwgpMXPqwLHJN95QNE8MVYsSS6bgYpwTyLPtUfTNvtXFBYMh/vbGsPYGZaymu0clME217NTbeR6cma+tPRXMVcAICY7Qdbo+ZjNwePJhwvXW8XIY3GO/ZUyOcZSmcsNg/1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUrwkdA1/zqpbYHYWlwm7Qn3jSSdsi5Veh+1M+z1Xyo=;
 b=IVDw2yBCG4KIbQ1VudFAl+7JLYy/s2Fclf0JZVfZt2y3DSbrRMj09XAK+VohjYrIPTRaUUueXPBlRi3C8kwiGk7LjOOdPtgl/Qhy4DKrOA47XN9FgQinwlBWFGoRLPsIhcXLVbu07F5XGfrPx+wiFInhwYuQzoCzjbpssKpinh0=
Received: from BN9PR03CA0459.namprd03.prod.outlook.com (2603:10b6:408:139::14)
 by DM4PR12MB6470.namprd12.prod.outlook.com (2603:10b6:8:b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Mon, 21 Oct
 2024 11:15:10 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:408:139:cafe::3e) by BN9PR03CA0459.outlook.office365.com
 (2603:10b6:408:139::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28 via Frontend
 Transport; Mon, 21 Oct 2024 11:15:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 11:15:10 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 06:15:08 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v10 11/11] platform/x86/amd/hsmp: Make hsmp_pdev static instead of global
Date: Mon, 21 Oct 2024 11:14:28 +0000
Message-ID: <20241021111428.2676884-11-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|DM4PR12MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: 76ca65e9-bd92-415f-b95f-08dcf1c1a0a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xGXcsghjmmnlJ82+8C01Z39jn3p7gSkZTggronq6ZkiDYbMbYH09CpQQJX5w?=
 =?us-ascii?Q?rBKnw1fnyBl209JUMQ91JNSbl7AdsUUbnn3it/C+j4fxjMcxdX4MOrGv/d3J?=
 =?us-ascii?Q?BCcVb0oIm8MFhp48xPFVR0+8fmlL4YbI3zagPWMtVKTv1ywMHlDIjIXLelE0?=
 =?us-ascii?Q?B1UVJTf2E2cAnlBLxNlwBDm6TI9sv1RqNttx15jXmT4tkIM/oDVe09VEBoVn?=
 =?us-ascii?Q?C++jtetVqmhMZ+bn84wEcCxAkuCNqxwgIVao0c4x/tre1HSILiwK8SqYmhUt?=
 =?us-ascii?Q?YyW0NX+u75HAJxN5rvtZcDjarqb7xZRqIXPrH4YHdF8aiBiqgmk2Cea1R9PY?=
 =?us-ascii?Q?QUfH3vxkKhfLUU5gic4ZEndOVIYVjhD9LIfwpSFZ0k5Chnygr0LiZlVUaK2k?=
 =?us-ascii?Q?7b9QOdl9k7URpPH4VbUPjBoIQoSMwOOUwZ0VTni2cOuzbbgthclIsAHplntb?=
 =?us-ascii?Q?Eo39jQ5YjAeoeuhcZpw2N58l13AX94jxFbswrfC+h+5fcKk6yslNkvwEoE1e?=
 =?us-ascii?Q?IGRYfoiBSmASArSaW14qchN0rTr+gWzwNBvswhh+AQvTSOV1fMEdXcd/sySS?=
 =?us-ascii?Q?ZSQOV092RZnjrrty9ER9iBtIXRaGF6QTYv0Z4NOZ48wIpc6HWttAuK7MWHe0?=
 =?us-ascii?Q?3dtbhMYi40a7SIUqtThffo9KjkPxz4XWsoaV0ND/oIlxK0HE7Cq2+Ctld5Hp?=
 =?us-ascii?Q?LGzqFbQsIDoj5a526VzIJaw/1IYDjcqoBFy7avJlBNYNXO+u0LtEUsBu6jhD?=
 =?us-ascii?Q?InJXDGrPnXmuTYSE7kZc+hzMKRHlG5rd1zrYJWENh245/ITmv+1a19DZ8Dm9?=
 =?us-ascii?Q?lMjxsq7f+/x5ELSGFXfkZ2Tyoc8FMUoGjwcp9tITEMQvJMKKitNnITUddMb+?=
 =?us-ascii?Q?Uz2PhdyeJg8DsHcbmtssU1tl8L0iuXYFQ6jb51nw2KPCnV1JaCBAPbIQuThs?=
 =?us-ascii?Q?PmLqBGSO85JqZ6i9KwZGoT0bZhahz24aLOY4D7WHhevDE+Arvf4HBZVCInWS?=
 =?us-ascii?Q?u+HsGLlXxxDcmBheMLb72DJ6WY0MDHvLy5eOGrebOUO58RM6/UeKwjyvS33y?=
 =?us-ascii?Q?YUMc1DRg4nhxPHTCLa5gulqpxHIik2Ix17Ya/HSwu85dvEezW2eHqUC5Nvjp?=
 =?us-ascii?Q?IGmuISfoXGgQVaUV2n1FYitiRTqWU/Hh8Bi/k65Edjs8YReCrDCPNkUxWzn7?=
 =?us-ascii?Q?fORla6J0xPnluHmoZN7/d5KmX/TWuwDrTk+Z2MlWKoNSfBKCy1lBQSHEbYNz?=
 =?us-ascii?Q?7LvAskIlIZmIpkmF935R4t468gxrVRsG4uJfWYl2zZwyTXCo5LclwkGNUYjb?=
 =?us-ascii?Q?ZW7kj596TVBqx6TCFEPhlKGu1ONR1Av3LM7voPoFqV740Da/w+l2YHAqu6pI?=
 =?us-ascii?Q?ezFDxizqgGy0cftnPT9jHKPaM3V8TJgxcKjYh12zx4FUP4a8Hg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 11:15:10.4856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ca65e9-bd92-415f-b95f-08dcf1c1a0a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6470

Instead of making hsmp_pdev global and exporting this symbol from hsmp.c,
make it static and create a wrapper function get_hsmp_pdev() to access
hsmp_pdev from plat.c and acpi.c.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v9
None

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
index b953959c9adb..4aa4d66f491a 100644
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
index 905607b5cba5..f8e74c0392ba 100644
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

