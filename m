Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Pb1nPf4h"
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A987A7
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Dec 2023 02:38:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqObomHi8juW/dWoiceowgyjxrJTLFGsBeNQfLOGoSsmz0YTN2n15JnxX7aCWveQblrRY94x175TqZJsnnBUBgSqVTWCRomWFdwD/h2O7yfocUZ0vpMycfphay+nA7f9Rf1UrR+ssQE4cQgpQS+ZtZ1VAZEJW+1N5s42Y5CUOO30n4sMpJBcU/VusXuuLIOE3SKzSkVuVlF8s9dY0k2ZlMTeykrjPZq6qgfNI+32BHnzPZl4G/+8K6juGX0RDhR+hUAi4OKyAZhS53Jiar5Fx+bODC/rIUpEod5ZX7sNakO4gMoV8LmshjMiNdO0ErWjmMdvP+PwYftc1lVVotxrQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBshEIKabNvKeNpsup35CUV8g2X8p4hN2OMHJmgK6ns=;
 b=HcIrjq2lkFx0z4LpwMmIa1iFW+KBmbEgvHhrRzR7PKgphgrcG35stDS53kaU339kFn55jkTquzoVSyCLoiotBfmlj+1S35tp/VIFAzy7vqpylFSy3Ur85I8l6i1/FiQWClHEbA4KM/xJQKtjqRm2ltDQbSqImnUxBZM9HN+okVD+JdOPHaXxkeHrwdROGdjsPH3hXzsMfbRNA1F0he7buMI5n+Ashd8mVXr8/UkCzoPnhm1i+jrgQ3MmNeNGNfgyURWqZr3UwtB5pDKmel5MooU0w3BTMuyttCM8kRqGWKJ0flusfQVkvmKOfOlx+QhHChxoaeWvkVZt1vG9YF2wQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBshEIKabNvKeNpsup35CUV8g2X8p4hN2OMHJmgK6ns=;
 b=Pb1nPf4hxBUC54U/nWtC4c9gLoV26UReK1gdMpMgf3QtSKzgM0qHQVV5j5K4oFqAFSx9ung0gpuMQPxmMSf7cCH9BcT7xe6bRJWb8t3c7UfWjFlkbL6QDrx+8uMQRsfhKV7GxeJVkwdTomFJdEqV0z4Wz/NzkEvuh7avWA7raDE=
Received: from DM5PR07CA0113.namprd07.prod.outlook.com (2603:10b6:4:ae::42) by
 DM6PR12MB4896.namprd12.prod.outlook.com (2603:10b6:5:1b6::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.26; Tue, 12 Dec 2023 10:38:57 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::14) by DM5PR07CA0113.outlook.office365.com
 (2603:10b6:4:ae::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Tue, 12 Dec 2023 10:38:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.26 via Frontend Transport; Tue, 12 Dec 2023 10:38:56 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 12 Dec
 2023 04:38:40 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 5/7] platform/x86: Move dev from platdev to hsmp_socket
Date: Tue, 12 Dec 2023 10:36:42 +0000
Message-ID: <20231212103644.768460-6-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212103644.768460-1-suma.hegde@amd.com>
References: <20231212103644.768460-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|DM6PR12MB4896:EE_
X-MS-Office365-Filtering-Correlation-Id: ddde69f7-8c79-4691-f871-08dbfafe8b67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5EPsbZJwsXW+ZzGuozNU80Q4URP4dK0wlcr5ur7rKK/pkiPtEDBYCFSp7qxPH3Bu7w4GayOEycGFwFWnTE31xkDFs32KCgkNLikf7O0XG1YMxjsMfVhT3eH7LO46oMmDUia90+2njYc/iKFuonzfa2l7btedP1K9osQcF7mx2+BGFt7DaQzxqPInlByXT3VT8CmWF4UwBHATJEuV4c5yfMHV2qd2VrfNuwqc/tstU5XmTihAbZzjahWhX/Entgsbhd2XE18v3Txf0oe8eKuig9xP5HqH721YodXhZVq9CEcHmlm8zTcf+pb5daZdnkymBxpqQfoHSpUhNIJWOdzfrfweUSHt+iMCaZvy0ILMgc5JyBzGUuvwJBE/9eFvx6UHbOZnreGhpa32lixpzAc5pMzbgvmkpCfxQK10I1j6FaDIrn5sloDDOnKNMaJ8oqazM4ruSkAQfBXECNiWguz3/nUNWtZaqKjOZKhP3DEQMu6NYcl+8y+MgAMYDLQiFwsTTyF1/9DxasSTUudTADPyYpWVUD2GitlWSfx5/sed262QuklXvEUuopfTzFDZFdPDL4/5h4WLDBSf3ABa9MhClfEkNfnEnRQqSSObd2RhGHY0Vyt5H8/d2on19F0AzBS84O0wZ8ICzTwv30/nUriYfnsvL3Wc+0bOnk8HYlL/zbcQCTpmE1eRSdawE76zMTwBUuA1Lk3VeNpVc+rumpACXr59PEOGE+rg4Oss0tvrjgTP9ylEXe3Y4tPAdPHbx3TR89O/JBnWw6W2GiY2kjljeQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(82310400011)(186009)(64100799003)(451199024)(1800799012)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(70586007)(70206006)(82740400003)(81166007)(356005)(86362001)(36756003)(36860700001)(47076005)(83380400001)(26005)(336012)(426003)(16526019)(1076003)(2616005)(7696005)(2906002)(316002)(54906003)(6916009)(478600001)(5660300002)(4326008)(8936002)(8676002)(44832011)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 10:38:56.9447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddde69f7-8c79-4691-f871-08dbfafe8b67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4896

On an ACPI enabled platforms the probe is called for each socket
and the struct dev is different for each socket. This change
will help in handling both ACPI and non-ACPI platforms.

Also change pr_err to dev_err API.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Co-developed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/platform/x86/amd/hsmp.c | 42 +++++++++++++++++----------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 44b15c1fab6a..87af1ad5c645 100644
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
@@ -279,8 +279,9 @@ static int hsmp_test(u16 sock_ind, u32 value)
 
 	/* Check the response value */
 	if (msg.args[0] != (value + 1)) {
-		pr_err("Socket %d test message failed, Expected 0x%08X, received 0x%08X\n",
-		       sock_ind, (value + 1), msg.args[0]);
+		dev_err(plat_dev.sock[sock_ind].dev,
+			"Socket %d test message failed, Expected 0x%08X, received 0x%08X\n",
+			sock_ind, (value + 1), msg.args[0]);
 		return -EBADE;
 	}
 
@@ -359,12 +360,12 @@ static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 
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
 
@@ -400,13 +401,13 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
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
@@ -454,14 +455,15 @@ static int hsmp_create_sysfs_interface(void)
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
 
@@ -469,7 +471,7 @@ static int hsmp_create_sysfs_interface(void)
 		attr_grp->name = plat_dev.sock[i].name;
 
 		/* Null terminated list of attributes */
-		hsmp_bin_attrs = devm_kzalloc(plat_dev.dev, sizeof(struct bin_attribute *) *
+		hsmp_bin_attrs = devm_kzalloc(plat_dev.sock[i].dev, sizeof(struct bin_attribute *) *
 					      (NUM_HSMP_ATTRS + 1), GFP_KERNEL);
 		if (!hsmp_bin_attrs)
 			return -ENOMEM;
@@ -483,7 +485,7 @@ static int hsmp_create_sysfs_interface(void)
 		if (ret)
 			return ret;
 	}
-	return devm_device_add_groups(plat_dev.dev, hsmp_attr_grps);
+	return devm_device_add_groups(plat_dev.sock[0].dev, hsmp_attr_grps);
 }
 
 static int hsmp_cache_proto_ver(void)
@@ -502,7 +504,7 @@ static int hsmp_cache_proto_ver(void)
 	return ret;
 }
 
-static int initialize_platdev(void)
+static int initialize_platdev(struct device *dev)
 {
 	int i;
 
@@ -511,6 +513,7 @@ static int initialize_platdev(void)
 			return -ENODEV;
 		plat_dev.sock[i].root			= node_to_amd_nb(i)->root;
 		plat_dev.sock[i].sock_ind		= i;
+		plat_dev.sock[i].dev			= dev;
 		plat_dev.sock[i].mbinfo.base_addr	= SMN_HSMP_BASE;
 		plat_dev.sock[i].mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
 		plat_dev.sock[i].mbinfo.msg_resp_off    = SMN_HSMP_MSG_RESP;
@@ -530,18 +533,17 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 				     GFP_KERNEL);
 	if (!plat_dev.sock)
 		return -ENOMEM;
-	plat_dev.dev = &pdev->dev;
 
-	ret = initialize_platdev();
+	ret = initialize_platdev(&pdev->dev);
 	if (ret)
 		return ret;
 
 	/* Test the hsmp interface */
 	ret = hsmp_test(0, 0xDEADBEEF);
 	if (ret) {
-		pr_err("HSMP test message failed on Fam:%x model:%x\n",
-		       boot_cpu_data.x86, boot_cpu_data.x86_model);
-		pr_err("Is HSMP disabled in BIOS ?\n");
+		dev_err(&pdev->dev, "HSMP test message failed on Fam:%x model:%x\n",
+			boot_cpu_data.x86, boot_cpu_data.x86_model);
+		dev_err(&pdev->dev, "Is HSMP disabled in BIOS ?\n");
 		return ret;
 	}
 
@@ -554,13 +556,13 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 
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

