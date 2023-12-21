Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EC05991B
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Dec 2023 17:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oeUci9r9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X18HRew/ocsqcxOQA1tqHmPsKi6Ztf/xlBtUfM/70NdC7nAqEsNia3rObA4YeiYI17NPK4yAJsqLBIMTl1UkCD2M8rqkc7/2ET3pJd6wFUkGAFC/jLqMA6SMMuuq8H/c0nCyP5fFg0G1uGFXooiB48VLAqQbpu9EN1s9hUHUjSkhJ8f+zDzJIgNYl6DaDEhvWJnjik7E8BEnGyhnDhTnQLb3Fbc/mGQSoTT0q9AN2CU2awa4BNJyqvDHpTngth0GFrJ3AQjsHaskQ4p+mpBsxL3voXPneWRGfMcCkeYAlk2Bv3aCgVa9l/F2wRQrzl3POacKXEqbeh3BWZ28QsiKpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKhscZiRetpeJ7yYEBe6Ju6naMJZntWAHZXFhfOd188=;
 b=Bw82Mg/ntHkCx+r+n4jrjOI+/pdXKqBTA9NKWP1PWOipZHM+M154+t2b2Xv53dxXiJzTj9ReKmJNDmlGKBjwEcNiwHDVsFvsx6sh26buu/hxPyKj+FH2NYbJDLx6zjLf8CcnkJURZsFcsXFJfhmYPhaR+e+EkOyd+CvmAFrsuQaqIBRLLYLqC8u4zQJ+rVffDQBEm+V/aaYohK/5hsLFv4n1zvp7c7pj9mfl717wShzY2/sRC3aOdmFm+lYFzNwfo0CUJfdyC8FPLPglZdi4bKIPajbIj8ZQHF9tYSoWSXf00hMhQ1bT3/d5VVLr94Tx8/16MOWHk9mEduz8uAj9Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKhscZiRetpeJ7yYEBe6Ju6naMJZntWAHZXFhfOd188=;
 b=oeUci9r9Q1qdsli5dPE1jDya8RZQvO9sa32IaSxwRYwIQ+bMbffAsEYWreE8GgEJquxiXh/0pX0jcXRGeJTGMhq0d9ZcEjsTIv3EGMbZe6Rp5Vsgts4vz0+EANsru0/A8f97At3RwoKx7SAfYqcl2d+CJ5KIzOKygWyQtp4DREY=
Received: from BL1PR13CA0308.namprd13.prod.outlook.com (2603:10b6:208:2c1::13)
 by BN9PR12MB5162.namprd12.prod.outlook.com (2603:10b6:408:11b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Thu, 21 Dec
 2023 17:21:45 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:2c1:cafe::d4) by BL1PR13CA0308.outlook.office365.com
 (2603:10b6:208:2c1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20 via Frontend
 Transport; Thu, 21 Dec 2023 17:21:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.18 via Frontend Transport; Thu, 21 Dec 2023 17:21:45 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 21 Dec
 2023 11:21:43 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v3 5/7] platform/x86: Move dev from platdev to hsmp_socket
Date: Thu, 21 Dec 2023 17:21:12 +0000
Message-ID: <20231221172114.1569559-5-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231221172114.1569559-1-suma.hegde@amd.com>
References: <20231221172114.1569559-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|BN9PR12MB5162:EE_
X-MS-Office365-Filtering-Correlation-Id: 034b6740-8fb8-4576-bd32-08dc02494ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7/irgPfJLXd6ZXfQDI9F1fDgYYQMzrESaMfd8Y63G4qVu7g9soSrrhloeD7AoybuxPdqeONgxnungGjY2tHp5Q8tgV2P2rhkwgXQyAsG9M5GkLTnKqZxX0w10KA0EsoKs5OnbDdMuzklhrxVMhn1OQLZXPzyE51dSfvxWIaMN5/zw2r2XTQDgEaTI/CovjPSdg6tKEyTv+hg3V3hvATu6B10Kuqfx36BkTilAotvSQZ+g8L4Gasi2F8E5Z+sbcaTv2McbM78xvVVHhX0gFzuagKKituw46aiw2SIE//fArgdcbUm9b9nfSDpMhMwX4tZHCryIk5UW4Iv/yHm1HruzMp89gFwcxnAj7W+QScw0MdyqIrmvkmAejINKdHjz3hgdctqv3bC/zO9B55eI35AWt7qCHNGn2rxk7bAsC6lNiMW0Gg+P+wqQFtemV1NdLxvxdmLRTPSq5KglJzTgcwPTwcvpAg/YJjxO8zIqxnL1W8ueYK0GcN4Zt1aXKE+VQgCtABXnt/BNV4adgdH4sDU4fR7U1XV9DSBqVKlFw3YJClqTlFFrQRN3utksvTAkx+cFqoA3X512P06YHHrt46GwdVeVzhTqTIECu1F3+/FVSCVsYUR91hq/td3R7WnjP6adldMgVdwF+K5JWDfrItnRF+KrXBTqiVxqn2vtjZwDJIDx0AVYcIKLioFMUx7eNy/+DaVc5yTUlFTw8W0Ev2sZkritTHrxlgiZFxQNy52LreMru+uDNMmPzueUUmiMdWwEtPLWuQU3s8dsAN4oerE+w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(1800799012)(451199024)(82310400011)(64100799003)(186009)(46966006)(36840700001)(40470700004)(41300700001)(2906002)(5660300002)(8936002)(8676002)(4326008)(44832011)(40480700001)(47076005)(36860700001)(36756003)(86362001)(81166007)(83380400001)(356005)(82740400003)(316002)(70586007)(40460700003)(6916009)(70206006)(54906003)(6666004)(7696005)(478600001)(1076003)(66574015)(26005)(336012)(2616005)(16526019)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 17:21:45.8649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 034b6740-8fb8-4576-bd32-08dc02494ee2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5162

On an ACPI enabled platforms the probe is called for each socket
and the struct dev is different for each socket. This change
will help in handling both ACPI and non-ACPI platforms.

Also change pr_err() to dev_err() API.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

---
Changes since v1:
Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"
Changes since v2:
1. Edit commit message
2. Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>"

 drivers/platform/x86/amd/hsmp.c | 42 +++++++++++++++++----------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 9b040c0b0d04..e77d4cd83a07 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -69,13 +69,13 @@ struct hsmp_socket {
 	struct semaphore hsmp_sem;
 	char name[HSMP_ATTR_GRP_NAME_SIZE];
 	struct pci_dev *root;
+	struct device *dev;
 	u16 sock_ind;
 };
 
 struct hsmp_plat_device {
 	struct miscdevice hsmp_device;
 	struct hsmp_socket *sock;
-	struct device *dev;
 	u32 proto_ver;
 	u16 num_sockets;
 };
@@ -278,8 +278,9 @@ static int hsmp_test(u16 sock_ind, u32 value)
 
 	/* Check the response value */
 	if (msg.args[0] != (value + 1)) {
-		pr_err("Socket %d test message failed, Expected 0x%08X, received 0x%08X\n",
-		       sock_ind, (value + 1), msg.args[0]);
+		dev_err(plat_dev.sock[sock_ind].dev,
+			"Socket %d test message failed, Expected 0x%08X, received 0x%08X\n",
+			sock_ind, (value + 1), msg.args[0]);
 		return -EBADE;
 	}
 
@@ -358,12 +359,12 @@ static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 
 	/* Do not support lseek(), reads entire metric table */
 	if (count < bin_attr->size) {
-		dev_err(plat_dev.dev, "Wrong buffer size\n");
+		dev_err(sock->dev, "Wrong buffer size\n");
 		return -EINVAL;
 	}
 
 	if (!sock) {
-		dev_err(plat_dev.dev, "Failed to read attribute private data\n");
+		dev_err(sock->dev, "Failed to read attribute private data\n");
 		return -EINVAL;
 	}
 
@@ -399,13 +400,13 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
 	 */
 	dram_addr = msg.args[0] | ((u64)(msg.args[1]) << 32);
 	if (!dram_addr) {
-		dev_err(plat_dev.dev, "Invalid DRAM address for metric table\n");
+		dev_err(sock->dev, "Invalid DRAM address for metric table\n");
 		return -ENOMEM;
 	}
-	sock->metric_tbl_addr = devm_ioremap(plat_dev.dev, dram_addr,
+	sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
 					     sizeof(struct hsmp_metric_table));
 	if (!sock->metric_tbl_addr) {
-		dev_err(plat_dev.dev, "Failed to ioremap metric table addr\n");
+		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
 		return -ENOMEM;
 	}
 	return 0;
@@ -453,14 +454,15 @@ static int hsmp_create_sysfs_interface(void)
 	if (WARN_ON(plat_dev.num_sockets > U8_MAX))
 		return -ERANGE;
 
-	hsmp_attr_grps = devm_kzalloc(plat_dev.dev, sizeof(struct attribute_group *) *
+	hsmp_attr_grps = devm_kzalloc(plat_dev.sock[0].dev, sizeof(struct attribute_group *) *
 				      (plat_dev.num_sockets + 1), GFP_KERNEL);
 	if (!hsmp_attr_grps)
 		return -ENOMEM;
 
 	/* Create a sysfs directory for each socket */
 	for (i = 0; i < plat_dev.num_sockets; i++) {
-		attr_grp = devm_kzalloc(plat_dev.dev, sizeof(struct attribute_group), GFP_KERNEL);
+		attr_grp = devm_kzalloc(plat_dev.sock[i].dev, sizeof(struct attribute_group),
+					GFP_KERNEL);
 		if (!attr_grp)
 			return -ENOMEM;
 
@@ -468,7 +470,7 @@ static int hsmp_create_sysfs_interface(void)
 		attr_grp->name = plat_dev.sock[i].name;
 
 		/* Null terminated list of attributes */
-		hsmp_bin_attrs = devm_kzalloc(plat_dev.dev, sizeof(struct bin_attribute *) *
+		hsmp_bin_attrs = devm_kzalloc(plat_dev.sock[i].dev, sizeof(struct bin_attribute *) *
 					      (NUM_HSMP_ATTRS + 1), GFP_KERNEL);
 		if (!hsmp_bin_attrs)
 			return -ENOMEM;
@@ -482,7 +484,7 @@ static int hsmp_create_sysfs_interface(void)
 		if (ret)
 			return ret;
 	}
-	return devm_device_add_groups(plat_dev.dev, hsmp_attr_grps);
+	return devm_device_add_groups(plat_dev.sock[0].dev, hsmp_attr_grps);
 }
 
 static int hsmp_cache_proto_ver(void)
@@ -501,7 +503,7 @@ static int hsmp_cache_proto_ver(void)
 	return ret;
 }
 
-static int init_socket_objects(void)
+static int init_socket_objects(struct device *dev)
 {
 	struct hsmp_socket *sock;
 	int ret, i;
@@ -512,6 +514,7 @@ static int init_socket_objects(void)
 		sock = &plat_dev.sock[i];
 		sock->root			= node_to_amd_nb(i)->root;
 		sock->sock_ind			= i;
+		sock->dev			= dev;
 		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
 		sock->mbinfo.msg_id_off		= SMN_HSMP_MSG_ID;
 		sock->mbinfo.msg_resp_off	= SMN_HSMP_MSG_RESP;
@@ -521,9 +524,9 @@ static int init_socket_objects(void)
 		/* Test the hsmp interface on each socket */
 		ret = hsmp_test(i, 0xDEADBEEF);
 		if (ret) {
-			pr_err("HSMP test message failed on Fam:%x model:%x\n",
-			       boot_cpu_data.x86, boot_cpu_data.x86_model);
-			pr_err("Is HSMP disabled in BIOS ?\n");
+			dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
+				boot_cpu_data.x86, boot_cpu_data.x86_model);
+			dev_err(dev, "Is HSMP disabled in BIOS ?\n");
 			return ret;
 		}
 	}
@@ -540,9 +543,8 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 				     GFP_KERNEL);
 	if (!plat_dev.sock)
 		return -ENOMEM;
-	plat_dev.dev = &pdev->dev;
 
-	ret = init_socket_objects();
+	ret = init_socket_objects(&pdev->dev);
 	if (ret)
 		return ret;
 
@@ -555,13 +557,13 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 
 	ret = hsmp_cache_proto_ver();
 	if (ret) {
-		dev_err(plat_dev.dev, "Failed to read HSMP protocol version\n");
+		dev_err(&pdev->dev, "Failed to read HSMP protocol version\n");
 		return ret;
 	}
 
 	ret = hsmp_create_sysfs_interface();
 	if (ret)
-		dev_err(plat_dev.dev, "Failed to create HSMP sysfs interface\n");
+		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
 
 	return misc_register(&plat_dev.hsmp_device);
 }
-- 
2.25.1

