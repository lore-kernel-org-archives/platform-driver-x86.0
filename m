Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0482915A5
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jan 2024 02:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WppfxJ8A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFT8M5J1/zqWfT9MGER/7QGCLgs33KRQyUHSg/Vrqqpdlv/7g1YyyAMvYJ3DH2dt00v54kDCGvzeLITCUr1G8wbFxJdIR6usgS3zUcKbJR4axXLVypr4I+tpcjfpcy0nRx9ZBfBeuDN97OhFO0YbY6P/QGTV6Sm2BnY2DFbHjnmnf/NEIGJnvtJaK6DI+2KUxu0+jG89Unff4aCKXboxP+mGkgdosvVNDXVm0t+EqdrnWcuLcM/yFLamFogBoYIGd3t2gYJRrm+VbGcCJ/L8/e1eJCrforo82UGylwsNGvmWWlNCQwUrzvhV2u49C1cw4STBKMfA+KH38fDwEo1i7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYs+h06LtWuYABVyyi4qprkUKy3aCkAEne9DV7PQ5Wc=;
 b=f0oISVRm0DfyejmTcIHqGyDiu7fnrIBj8qPX5hDQijQdqzo8fjHuo/LI8LXeh5gpOriYwZ06BZVIRWcdlbSehivL3SQK3k44iTXNl7eCwvp8XzAIIndKM2sjAEBhnUeimBCmweUIxt4+lmOFJvQDLcCXAY0moG8r4zGvJcV7VxjMJXtAmLVONaGuq3jOeRsBebF6Ygpq59BolQX+PLcwx+pSccKtPignY+9W6fWWNLeP3lw8/OvHdkHYPDFOMXQhWF36bIDp0wkboc2obLXMhglshaCmEAVtUJh4jQdVB08rzB0zzwFGQjqvcQer7DiB3rmCWWSAo4jmLquk4alrqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYs+h06LtWuYABVyyi4qprkUKy3aCkAEne9DV7PQ5Wc=;
 b=WppfxJ8ABVK3+o63+BoA2lj629CVRBHbNUogAJ3GRiaro1e79EYZNaLlxbIGDmDsVC1cROMuOqWGKXPh9JZROI+ZKgOncasWOTUZzSlGPP3o7JtZipOwGE5nGk+vv8VpbZzNrfWwTY+iKkmlI9OBc3hKX5/q15Z/JdA/J7T0g2c=
Received: from PH8PR07CA0034.namprd07.prod.outlook.com (2603:10b6:510:2cf::15)
 by DM4PR12MB5214.namprd12.prod.outlook.com (2603:10b6:5:395::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17; Sat, 6 Jan
 2024 02:26:17 +0000
Received: from SN1PEPF0002BA52.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::96) by PH8PR07CA0034.outlook.office365.com
 (2603:10b6:510:2cf::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.18 via Frontend
 Transport; Sat, 6 Jan 2024 02:26:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA52.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Sat, 6 Jan 2024 02:26:16 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 20:26:14 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v5 05/11] platform/x86/amd/hsmp: Move dev from platdev to hsmp_socket
Date: Sat, 6 Jan 2024 02:25:26 +0000
Message-ID: <20240106022532.1746932-5-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240106022532.1746932-1-suma.hegde@amd.com>
References: <20240106022532.1746932-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA52:EE_|DM4PR12MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: abc6a0a3-df79-4dd2-5c5d-08dc0e5edc77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DbE/RUwUucUQ8UoRa7+atO469ygEQ+opQtLuWfsX1LO+aGsq4vg3DU8O6azw6CoMEnqfQuB7c92wJfbx81zt1sSJ14XM5JJ7bjsWDJSlMrmqvWuYQNgWqtQ0DQD5o6j+kWsn5TsWlRSKBiwJ9/DSIWya+LGMHGvdPQfkL26+/jV/Z2aTBRUlRUyFKYRrVgNHN7jk39XQ4ry7zFtzMksxOnNSbAid3tYzogND76T5vmvGVMqrLsiVEQSQLGoX66M00QXjFpSVvpGRZFxqOM6zEDMpW/Hse8InKLSGODjLSEnLe/J/8w/BDMkdlh1jpbp6TEuU/ivy2ZFGyQfa4hlKsLd7S9W+lB3AiHGXtmUowKzR/rnA0lFYL9vCKgzaXI9ayrBN0iK7vRZmQClah9JYx+LNSmyacFQzNwCBM9kZ5AOU1doPIef/pmWdwCgGZXizJzwiuJhXvRMOzVgMTSohcbiRMePVfjyvvtjx4df2cMdhaVmvFpbEigXD7d31IvvPmo37xrP5O4bKQ3pIcW44+p7/PNeSWCsEFNfwFxsxNXssH5IoDI7H8maf3XVj8cMMjSzfz4fH2nptoPIwhr0XK+icf8oUHDMJ3T24iDZRgeLgAlbX/QMDQeDu4Td5AkY+aY+fGoAmAixx/avpaua4AMlRJEVFYx0X7mjT674RJaqE3/bCGWA71eQCUlbXPFg3H6nlDsiexi4n1kZydRY2cbwLGStX6oFMLO/cSU+Y8Hsm0qlfry4GFkYltEM7wOUzQBQzRm8xPJXx7kymAd0QoA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(82310400011)(1800799012)(64100799003)(186009)(451199024)(46966006)(40470700004)(36840700001)(26005)(426003)(336012)(1076003)(2616005)(478600001)(6666004)(7696005)(47076005)(83380400001)(16526019)(66574015)(2906002)(5660300002)(41300700001)(54906003)(6916009)(316002)(8936002)(8676002)(4326008)(44832011)(70586007)(70206006)(82740400003)(36756003)(36860700001)(86362001)(81166007)(356005)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2024 02:26:16.7198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abc6a0a3-df79-4dd2-5c5d-08dc0e5edc77
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA52.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5214

On an ACPI enabled platforms the probe is called for each socket
and the struct dev is different for each socket. This change
will help in handling both ACPI and non-ACPI platforms.

Also change pr_err() to dev_err() API.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v4:
None
Changes since v3:
None
Changes since v2:
1. Edit commit message
2. Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>"
Changes since v1:
Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"

 drivers/platform/x86/amd/hsmp.c | 42 +++++++++++++++++----------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 287eaa9b0dda..0bf94e2bd022 100644
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
 
-static int init_platform_device(void)
+static int init_platform_device(struct device *dev)
 {
 	struct hsmp_socket *sock;
 	int ret, i;
@@ -512,6 +514,7 @@ static int init_platform_device(void)
 		sock = &plat_dev.sock[i];
 		sock->root			= node_to_amd_nb(i)->root;
 		sock->sock_ind			= i;
+		sock->dev			= dev;
 		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
 		sock->mbinfo.msg_id_off		= SMN_HSMP_MSG_ID;
 		sock->mbinfo.msg_resp_off	= SMN_HSMP_MSG_RESP;
@@ -521,9 +524,9 @@ static int init_platform_device(void)
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
 
-	ret = init_platform_device();
+	ret = init_platform_device(&pdev->dev);
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

