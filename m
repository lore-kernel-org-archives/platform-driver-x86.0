Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9CBCD54AB
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Sep 2023 09:21:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjISJVu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 19 Sep 2023 05:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjISJVs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Sep 2023 05:21:48 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48430EC
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Sep 2023 02:21:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ikdk3hZuztBCAk0dnYgV0F3MwleR/yN1FSNlKea5u7mN+u8/2XAe3FH/u4BUHFPdhMRxCJNakJEEdMe8LNNW+H8oEQG06PXf5oCx0Ck9R3xxmfCGc5ZAugF0YMgwrql52oEpFLec/51X5a8MCRF3GnDC7liLwu+25Bhru/+dTQL/JaIDVbH8NVJeUZbS/wmDq9TKhBmzsPhTK5KIX3OCUdNLHDQCLbmB1QWfOJSjNOsbEMhl6wB1FJzO1Gur3c6Ou0nJTgCSpvrFkUmhSr1+vO+ZjwtsY/gQxzOCi36F6VtvKxo21ycewIeEJnkprq63ddaJ0UeUIHyqxwOzX4G4VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXITF5bB3VIZN9pkRgZXummGJIpEYwyxGOtIlxxUlTk=;
 b=IZiyogybebE0YAT8qsskno5jsDpE4rP6PZ0Ls+SOl7un8otKg4Qahmxw2OpViHpNL8GiuWBMLxXUmozqZlmuNk/wyIriZTGTGW138Cb+hdxQ+psua5THnSm1sau+ybotDW2NA0UHa10AXyKhodSZbvLGH3nQIygLviLezAAAAOim8irCPUEPfRbt5h3qF10wbLaGuGp+REAw507oVQqv3VYgmdiQk/+lM63/ITdmtQYpG/zHBb62e/VFVA8r/Zc6BnbDbvZKPEJUcrnawtCe2EmpPMO0qpjXaBch+4wIn44w7RC6UT+KfrNABZPTYgP1Em9eyxLLsahysVsO12LFSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXITF5bB3VIZN9pkRgZXummGJIpEYwyxGOtIlxxUlTk=;
 b=o5RNWcZ48aTbU3bTqDosDuvBIVHu2S62azppv/Ze6/5Fg/xtAiqPHAkME5y6eaFQERpTcKE5TWY0JO+EIf8+3DWGodMvCfaY+2b+gPCMvPBHb8Zk1McOA72fhkBpQ4LsRUzcZydLwF65vuNP5i9yJn0GEYQmrCLAt783j+io48g=
Received: from MW4PR04CA0124.namprd04.prod.outlook.com (2603:10b6:303:84::9)
 by CH3PR12MB8257.namprd12.prod.outlook.com (2603:10b6:610:121::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Tue, 19 Sep
 2023 09:21:23 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:303:84:cafe::c3) by MW4PR04CA0124.outlook.office365.com
 (2603:10b6:303:84::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28 via Frontend
 Transport; Tue, 19 Sep 2023 09:21:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.0 via Frontend Transport; Tue, 19 Sep 2023 09:21:22 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 19 Sep
 2023 04:21:20 -0500
From:   Suma Hegde <suma.hegde@amd.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Suma Hegde <suma.hegde@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v3 1/3] platform/x86/amd/hsmp: create plat specific struct
Date:   Tue, 19 Sep 2023 09:20:55 +0000
Message-ID: <20230919092057.2235437-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|CH3PR12MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c9d3298-faa7-4f89-6b78-08dbb8f1ca8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o4O3j6P4e3RvlloK7O0NDIGoRQ7RV+pO7IThJ7NAIJmqCS9JUS7lHQOzdK9aVTN42b1GGZFAqEkpKTPNNyzZD8KLTbpyCeY5+68lsQ4P8RASDuc2Y/EOzHecNi8oqIyYsNKqxDWMzs5W9iBwf9a7UdmorI6w8LWapF5MKKUW1EwqZZlUrdnJX87Ve/D5p94t4IPztSq7QGtCPESBM9xJcGz9Px+oYI+rMyLF0+fOX177gQ5KtnkpEymfb636/YoLxskoLxNmU59/twMm7U5vWbPlxmJ2hQ2IZ3/nPNIfeZo30IjK+sw4BFfLKjmXYomzTA0vD7yn25FsN/3nt1DyzAO6AYtJC8wseHEArejseku/6LfN+Xx6jFfUwFOdQER3c0uMJRRm7B9bkrPRVmKY9MUUfM25lL1C2TPkGMCpHxdtADvNk0zi/VUygG4iMMj9sSiV/gjFXXEXC6aXD1aTbGaLYQM3nh76da3vmLyuFjRSXy3irHRZlq9XFH48iuE3v7o9uB7K7MBVQq5y9AhfYC4lIY1CDNydomQIZtQzGGMigK8CkFMvoetmI+MxAB6UsDwCCyp4uxkUcO3jI/Dr11OlC0nEHr6Q4AmmevYKS/d9VvadOQffmpIE0yNJH2y9do0QayrN8/qKhLnZ6+bsY3ivZ3lKhiJ6ZcjTig/oM84UU+dWmQoCh84e7CTNGAUE0SdK4aelKlV5/fgUlSzeifgbpWpebAgnkSaZQzbdUIH7vIZjBRRrc7Q6snswtC/8K0nKvY/cAURf3imcSQj+Ag==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199024)(1800799009)(186009)(82310400011)(40470700004)(46966006)(36840700001)(82740400003)(2906002)(2616005)(86362001)(336012)(26005)(16526019)(426003)(1076003)(356005)(316002)(8676002)(8936002)(6916009)(44832011)(70206006)(41300700001)(5660300002)(54906003)(81166007)(36756003)(70586007)(83380400001)(4326008)(7696005)(6666004)(40460700003)(47076005)(36860700001)(66899024)(478600001)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 09:21:22.6676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9d3298-faa7-4f89-6b78-08dbb8f1ca8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8257
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Having a separate platform device structure helps in future, to
contain platform specific variables and other data.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v1:
1. defined HSMP_CDEV_NAME and HSMP_DEVNODE_NAME macros
Changes since v2:
1. moved num_sockets variable to plat_dev structure

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

