Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2044.outbound.protection.outlook.com [40.107.102.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB194645F
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Dec 2023 16:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fDLxL1hU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcADPY8Q97f9v3n9NWNhityr6OPTqC/9PGfuGVYec3QQP/n5a1ZHNiWY8Jx9+PckWFqwUaYfrkX5V2k2Yj8kf46W13IFH00ijyDzLObmyp20UGmyWMtEpHKezKM4fxZ5GYZ8fXQr730TdhCH3BXfeZjElnjmSTzKX4ZmwVWTZyCskheQoggmQzqFkmHecu45O71D8CoqKbcldpqJt12WdYtUiJkEblb50kdvoZvpT/ltfBpf3h9ZcxiKo9n7Wpnvjgr9kA+Rc2jD0D0EGn4qsgs2K1IcKtmsWVNGU/j54bWtoZ2uAG1e4IvMv+DegBexArlPMonjl/beSmJirKBDaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXZPaIZS0KDVgOtf1IcYz5jlsbGsnKvuRG95AC2QGeQ=;
 b=MQbsYKJ9DbHTcGfKGu2C1Ys9v2xkcd6AG6IANkGqhJGYy+Tpb3vP535qhWjXWnfQrj5sDQ2iXjFaxbwolf/1rZgdGd7plUwlJv0YqIX4cLYufcKuHky7Ugip+9D8ElyP4ap1XSZ0Q128UUGgH9URcNDtLJXUgaTMbXQP3dhC5Au5KrtzsnWK6glO6Ic4DaMWBVXpCkoqPDzgVcUPjSn2JmrLcnL2BB4c3Kz33SifjYBqQLp72pf7UhsBDVcJ8oZYqJAJYPJvcZ7KlQpfxI5xHfojyk14+j1KccvU2SadECjdRm8sWy7CGSOG1XkfdiF/9Cdnjx6q8C3R/iwDd+0qhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXZPaIZS0KDVgOtf1IcYz5jlsbGsnKvuRG95AC2QGeQ=;
 b=fDLxL1hUmNVOD3kAxlQeKr5IkPGMg6oiMa4ht0HnZHa3XcBrvrAJ39ynI4jqV+/9sdQwe1P8nKAm5FFRrqt95ZCLfIGZQ5vXINwRoL8BRhDGHcPe6G6JkjF69SOQHiHLvigNquDWte8N9FALyeJGqhsIFEXP4FzyCXhnd+JGWJk=
Received: from BLAPR03CA0124.namprd03.prod.outlook.com (2603:10b6:208:32e::9)
 by SJ2PR12MB8956.namprd12.prod.outlook.com (2603:10b6:a03:53a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 16:55:56 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:32e:cafe::8) by BLAPR03CA0124.outlook.office365.com
 (2603:10b6:208:32e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18 via Frontend
 Transport; Wed, 20 Dec 2023 16:55:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 16:55:56 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 20 Dec
 2023 10:55:54 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v2 5/7] platform/x86: Move dev from platdev to hsmp_socket
Date: Wed, 20 Dec 2023 16:55:26 +0000
Message-ID: <20231220165528.1351200-6-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231220165528.1351200-1-suma.hegde@amd.com>
References: <20231220165528.1351200-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|SJ2PR12MB8956:EE_
X-MS-Office365-Filtering-Correlation-Id: 406d4861-24d9-46f2-a63d-08dc017c88bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GiWrwJXpWJ0ErmDsKUWwy3C3IZIi1tPHjgMjOR395qZicVjRhEBZ/Hv7YPv3PIVZq3JevTQNh68SVeOtDIq8n8r2/O/GEWmjcHzBTgnciZLIhKwpHpX9ZUhL3Y2wct5Wr2Gf+0Tvy6ykhUAErmDxrXiLyLSwAtzkZLpzBH5XLKfx1160dxnd1WK931cJP1M2yr+Tu5tAOyoZ37ImPajpCDNi/GqE5sPCKGDL9vTCytTYYrng8Qv5kJ+1gPiKE9GlDFe19Lb5Hie+keZhUJ9pSgFfJVVgxgk+P411X4lwTxAAGHnu4qVBfbT50YhlFzce8EPEFzgi44d/teHaZbSOZoN1aivqK+k24OXT/jKVhex0mmSbaw7p28tTxiwyy8xIyBQ+M3iEmQtfLgwyFvrCFBS1cmuJdGe0IhbrSum/FR04CTk6rz7GKGgcnKKohU69vuxJP4AasEb0+SpGU67HKzx5UEnozUrxEYVnk+mxe5Taq02VIEIQ9KyJurADCAVqS85IAhgXqeDAla6JUEUI+awT5lnyf8BrdP1Y0jX+/4v6aJL0snAa1gEGbkt0hdn0mZmSjYtk2f7GYDw+ZVJcuTosruyNRKY/sjAdcfhO5640eXQtPhZP49X2rRpXF4/RWi+HF7beCny1phsIAVMMu1PENe4jC3uEawF0gvaRz0IFK3tXsGCYVH0AFIMjIntsO6zuNjag0OEucDqbAsCSOXutW7N+dde12erfsVI+P6qMLdogZ0H3imYzXhshQ7uo3Q4KRPRqLQwv+bkkGql0cQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(82310400011)(186009)(64100799003)(1800799012)(40470700004)(36840700001)(46966006)(356005)(81166007)(82740400003)(7696005)(26005)(41300700001)(86362001)(36860700001)(16526019)(36756003)(83380400001)(336012)(47076005)(426003)(2616005)(1076003)(5660300002)(2906002)(8936002)(8676002)(4326008)(6916009)(316002)(70586007)(70206006)(54906003)(40480700001)(478600001)(40460700003)(6666004)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 16:55:56.0845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 406d4861-24d9-46f2-a63d-08dc017c88bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8956

On an ACPI enabled platforms the probe is called for each socket
and the struct dev is different for each socket. This change
will help in handling both ACPI and non-ACPI platforms.

Also change pr_err to dev_err API.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Changes since v1:
Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"

---
 drivers/platform/x86/amd/hsmp.c | 42 +++++++++++++++++----------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 6beca5787e55..3508399c6aa9 100644
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
 
-static int initialize_platdev(void)
+static int initialize_platdev(struct device *dev)
 {
 	int ret, i;
 
@@ -510,6 +512,7 @@ static int initialize_platdev(void)
 			return -ENODEV;
 		plat_dev.sock[i].root			= node_to_amd_nb(i)->root;
 		plat_dev.sock[i].sock_ind		= i;
+		plat_dev.sock[i].dev			= dev;
 		plat_dev.sock[i].mbinfo.base_addr	= SMN_HSMP_BASE;
 		plat_dev.sock[i].mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
 		plat_dev.sock[i].mbinfo.msg_resp_off    = SMN_HSMP_MSG_RESP;
@@ -519,9 +522,9 @@ static int initialize_platdev(void)
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
@@ -538,9 +541,8 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 				     GFP_KERNEL);
 	if (!plat_dev.sock)
 		return -ENOMEM;
-	plat_dev.dev = &pdev->dev;
 
-	ret = initialize_platdev();
+	ret = initialize_platdev(&pdev->dev);
 	if (ret)
 		return ret;
 
@@ -553,13 +555,13 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 
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

