Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2656DE7AD44
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Oct 2023 16:39:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbjJEQip (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Oct 2023 12:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231499AbjJEQiS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2023 12:38:18 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::600])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A894559A
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Oct 2023 22:40:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4gOJiGnHaP+oAPW2/c8IOizp2DCAN5oyQUF13xje1jlBYh8s0Ye1APObSeRotXvzwP68fzty0btww7ltIiKc6ERsQjFo8iFynEvmDK+WeGUabZQ2xXVo5Q4ESHfAZ+2DhTMzGYJMp6rdTz9ryMf5g8OE6/Zshz0BHCHljkr5WU36jRqLdc//j+uAALVx0cMhK6LJEzeKg3EUDeEYw70w7C8GpYE8IwqE61mq8Q5UJ7cIxFAALou/apoz5REtDvhGMCLsRlY1gxRUjuWzCNmaqEdzJdBDEhlEsLyau52+VKs0YmozqU75yCC5rkAdVLqaw/w3ExlqNWZDH+Bm+8J+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxR6fAGoLEzz0oVY5RwBn9jPHVzGMOIy7wLEfJtwrEY=;
 b=crjbpKuDVQpFysX8NwdLNJ/ntSprWZrMLWHfSL0oyPkEhV08APhXCkE6xImpfTIwvbGfX6ufN+m7v5SoTu770QFdcYk/A5uJxsnzQkrs2Dxobn14YCB4rDHw/WZnxtVb9YMAwdN763iRDfZxcioOnq6172y7uqnpHlkgHbBFj6m+RUzLOFevzLGw6SCiSVwO/e04+2KearaYn2qOxAlR/2NKjT900AL4PqiNg3XEtw/5BY2pWKxMrmFnNY+6FIaWhBXS1U1yZNHnvlnrom/tLCvJtVkxLL/OPNM23sCLfidwlWdqRRHWlpQnkx5CQN7WeN6sykUu7II1trJH7duBcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxR6fAGoLEzz0oVY5RwBn9jPHVzGMOIy7wLEfJtwrEY=;
 b=trgtKqWP/P9oXm4NmEZJ60xO0YXHg8s7FMqDeBLRYauIJMx+rlWPEOKyiobkRfe2+V2g7JONo5W/cZEF6PhjUX2LNeniEvNsjmFeB+1wkXHBRV+jJ9pyD1NmtZgrPpp2OLx6gZEX49k6pq6nkyhSWh3Mktqt4U8p/nXTOE6ZM2U=
Received: from MW4PR04CA0316.namprd04.prod.outlook.com (2603:10b6:303:82::21)
 by DM6PR12MB4385.namprd12.prod.outlook.com (2603:10b6:5:2a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 05:39:58 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:303:82:cafe::b) by MW4PR04CA0316.outlook.office365.com
 (2603:10b6:303:82::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.25 via Frontend
 Transport; Thu, 5 Oct 2023 05:39:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6863.20 via Frontend Transport; Thu, 5 Oct 2023 05:39:57 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 00:39:55 -0500
From:   Suma Hegde <suma.hegde@amd.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
        Suma Hegde <suma.hegde@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v4 1/3] platform/x86/amd/hsmp: create plat specific struct
Date:   Thu, 5 Oct 2023 05:39:30 +0000
Message-ID: <20231005053932.149497-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|DM6PR12MB4385:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ac30ec7-ceed-49e3-a704-08dbc56582c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Podu97AgJCq+AW6ADyspyLum6ERx1jUZkZXFe2Orz8SfN9Pzax1mQ5fPYOBaASkvxsVCu07S9IVNlYOkl5kBqGI3rGi6YtmsqAxiu8h5ZCIRV8+48M2ypZf/JKTaJ884exEA8E5qAJswxVzbzBMekdrVF9QQ9xabEcGi6aGSnmI71CVlnrQ9FCKpCJwsl0gncEz2WKmwVTAveLlX8CfK4OEydepBPKu3SSaEPfgZJ3mrMdPwN3M/S9Nnd/atwB4P5s+F17u8kVAspJXcVtH3CPtPLDAqjRrWjq1dfWzykR/CsRzz4u6OQ0c9h/zM/o72iWBPtgRxjDeyn5BNFsCQIxlySGuspKYtHjL0rQ7Gm37ygTLjfhPOfbwIPpAPk1sf77GVEl4ct25s2KFw4nfzROvWs53OR2HAw78KDu+cPitIfxR2vVwtVey5LADmcdu/o6h8HfvYEXsYIil5HF5IArzDxapOnXTGtAwX9VTgggN9Erm08zGfXEK402tDNp75ibBBxRKbvrVeYw4+V02QjyNtfgeV82J3okUO/0rVNwQlLAStCsT/Xos7KEn1xfKSTRl32vpkRcG2eulK0Ts0jth+uCH/g7tXexeTpzV49n++w5pHxbBCw8rO7l5T64D4tawTmRjCV3CRzgCrVpn/N13+StuvpE+cGrWsfAz84dmMcNiVEgGIYjUMiDH6G9HI5MFrxl+7zrcA/sKhUjeMBkodMruSLhegzoDGHK8DHEkzuL8dO9QzLYE7rAGG0ecfamDkTLNojgEGeX7jd1qY4w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(230922051799003)(82310400011)(186009)(64100799003)(451199024)(1800799009)(46966006)(40470700004)(36840700001)(36860700001)(16526019)(7696005)(6666004)(478600001)(26005)(83380400001)(336012)(426003)(1076003)(47076005)(2616005)(2906002)(8936002)(5660300002)(6916009)(316002)(8676002)(44832011)(70206006)(41300700001)(70586007)(54906003)(36756003)(4326008)(356005)(82740400003)(86362001)(81166007)(66899024)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 05:39:57.7281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac30ec7-ceed-49e3-a704-08dbc56582c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4385
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Having a separate platform device structure helps in future, to
contain platform specific variables and other data.

Also, define macros for dev nodes

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v1:
1. defined HSMP_CDEV_NAME and HSMP_DEVNODE_NAME macros
Changes since v2:
1. moved num_sockets variable to plat_dev structure
Changes since v3:
1. updated commit message


 drivers/platform/x86/amd/hsmp.c | 61 ++++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 31382ef52efb..99727cd705cf 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -47,9 +47,22 @@
 #define HSMP_INDEX_REG		0xc4
 #define HSMP_DATA_REG		0xc8
 
-static struct semaphore *hsmp_sem;
+#define HSMP_CDEV_NAME		"hsmp_cdev"
+#define HSMP_DEVNODE_NAME	"hsmp"
 
-static struct miscdevice hsmp_device;
+struct hsmp_socket {
+	struct semaphore hsmp_sem;
+	u16 sock_ind;
+};
+
+struct hsmp_plat_device {
+	struct miscdevice hsmp_device;
+	struct hsmp_socket *sock;
+	struct device *dev;
+	u16 num_sockets;
+};
+
+static struct hsmp_plat_device plat_dev;
 
 static int amd_hsmp_rdwr(struct pci_dev *root, u32 address,
 			 u32 *value, bool write)
@@ -188,6 +201,7 @@ static int validate_message(struct hsmp_message *msg)
 
 int hsmp_send_message(struct hsmp_message *msg)
 {
+	struct hsmp_socket *sock = &plat_dev.sock[msg->sock_ind];
 	struct amd_northbridge *nb;
 	int ret;
 
@@ -208,14 +222,13 @@ int hsmp_send_message(struct hsmp_message *msg)
 	 * In SMP system timeout of 100 millisecs should
 	 * be enough for the previous thread to finish the operation
 	 */
-	ret = down_timeout(&hsmp_sem[msg->sock_ind],
-			   msecs_to_jiffies(HSMP_MSG_TIMEOUT));
+	ret = down_timeout(&sock->hsmp_sem, msecs_to_jiffies(HSMP_MSG_TIMEOUT));
 	if (ret < 0)
 		return ret;
 
 	ret = __hsmp_send_message(nb->root, msg);
 
-	up(&hsmp_sem[msg->sock_ind]);
+	up(&sock->hsmp_sem);
 
 	return ret;
 }
@@ -321,28 +334,31 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 {
 	int i;
 
-	hsmp_sem = devm_kzalloc(&pdev->dev,
-				(amd_nb_num() * sizeof(struct semaphore)),
-				GFP_KERNEL);
-	if (!hsmp_sem)
+	plat_dev.sock = devm_kzalloc(&pdev->dev,
+				     (plat_dev.num_sockets * sizeof(struct hsmp_socket)),
+				     GFP_KERNEL);
+	if (!plat_dev.sock)
 		return -ENOMEM;
+	plat_dev.dev = &pdev->dev;
 
-	for (i = 0; i < amd_nb_num(); i++)
-		sema_init(&hsmp_sem[i], 1);
+	for (i = 0; i < plat_dev.num_sockets; i++) {
+		sema_init(&plat_dev.sock[i].hsmp_sem, 1);
+		plat_dev.sock[i].sock_ind = i;
+	}
 
-	hsmp_device.name	= "hsmp_cdev";
-	hsmp_device.minor	= MISC_DYNAMIC_MINOR;
-	hsmp_device.fops	= &hsmp_fops;
-	hsmp_device.parent	= &pdev->dev;
-	hsmp_device.nodename	= "hsmp";
-	hsmp_device.mode	= 0644;
+	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
+	plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
+	plat_dev.hsmp_device.fops	= &hsmp_fops;
+	plat_dev.hsmp_device.parent	= &pdev->dev;
+	plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
+	plat_dev.hsmp_device.mode	= 0644;
 
-	return misc_register(&hsmp_device);
+	return misc_register(&plat_dev.hsmp_device);
 }
 
 static void hsmp_pltdrv_remove(struct platform_device *pdev)
 {
-	misc_deregister(&hsmp_device);
+	misc_deregister(&plat_dev.hsmp_device);
 }
 
 static struct platform_driver amd_hsmp_driver = {
@@ -358,7 +374,6 @@ static struct platform_device *amd_hsmp_platdev;
 static int __init hsmp_plt_init(void)
 {
 	int ret = -ENODEV;
-	u16 num_sockets;
 	int i;
 
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD || boot_cpu_data.x86 < 0x19) {
@@ -371,12 +386,12 @@ static int __init hsmp_plt_init(void)
 	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
 	 * if we have N SMN/DF interfaces that ideally means N sockets
 	 */
-	num_sockets = amd_nb_num();
-	if (num_sockets == 0)
+	plat_dev.num_sockets = amd_nb_num();
+	if (plat_dev.num_sockets == 0)
 		return ret;
 
 	/* Test the hsmp interface on each socket */
-	for (i = 0; i < num_sockets; i++) {
+	for (i = 0; i < plat_dev.num_sockets; i++) {
 		ret = hsmp_test(i, 0xDEADBEEF);
 		if (ret) {
 			pr_err("HSMP is not supported on Fam:%x model:%x\n",
-- 
2.25.1

