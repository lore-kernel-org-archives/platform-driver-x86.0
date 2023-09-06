Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0864DEB8FA5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Sep 2023 07:13:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbjIFHNi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Sep 2023 03:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231221AbjIFHNh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Sep 2023 03:13:37 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DD5DE5C
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 Sep 2023 00:13:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UN2SuxXeDuFSFLb2WzV1RHB46ccAfYEY6lRpFpFfFawbD4pC2ZPyJLn7Yio2rMLHA7Z4VW7IUGMhcVwjnMSjediQ95Cumqrnphe6cwc864ixwnTfFbX2Df8ByFLgpwjlIhQTlQK/bNP77YFr0mAXtwFG1H+Sbc9ztNVDk9Y95pnGOD2vEbso2Lc62Lin9xewPMAwugmeOFEUqcDUDevjHak3NsxBSS03D3Ct9Paage/v5OQ7xtyHmkUcE33UwVgKB2jdK4n1GXeq9p19cIEQD6dOAdiyoVPdmedP0KAdAo8IAmFwcxYGtRITAD2YfuV3pcZdG7kmYFCuMBY1ZeUK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7wCecgzFAzZLQCRWdMP8g64UZtZtisnEjktaQereMA=;
 b=eeWHucCbnvXgCWSWtte+/xpqHEdt7bJc384BfdoPgs4/pJz//mrngNbBHW+sf6eUg7nTCMHcv9nKCkevDeLZTJNObmko5fVJVxx4sTDqmnEXZlj7PfO/Zh2BipxpPFOABfvsXCtOSwjHX90htbEBzCbjP8p604LW0T4tAf9NZIbj387YzzucXGbT7V56xeT/hhaiY2haGEoK/R1zUiA+izmM9M3DY6sTMsdTK3iG15bTuYUDyze6mdlx83OYTFcJ68Qqy39Auv16izBBU7x2FmQTXbDf07wP23M5h3h9ELO/UZx9DPnbfUZQDmGxFwFl3rC/IjeG732GR/pkMemeIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7wCecgzFAzZLQCRWdMP8g64UZtZtisnEjktaQereMA=;
 b=LBAeRdlb0MmpK0kNHeAmJk27xxe6YjJNB69Vjn3zjiKnrq7ow6ALfa/hwdQwrbh5JrXWKWa2UzTxmDhBSVUFP1U6m8lzPE4fQRyLS7B4FengqHkxUjlCpvp3tZXppZlmbKEdqSV9T7mR6dHAiSI7yFp2RP6mc/HwgYq3ipzrn6Q=
Received: from SA1P222CA0047.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::20)
 by MW4PR12MB6998.namprd12.prod.outlook.com (2603:10b6:303:20a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 07:13:30 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:2d0:cafe::16) by SA1P222CA0047.outlook.office365.com
 (2603:10b6:806:2d0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36 via Frontend
 Transport; Wed, 6 Sep 2023 07:13:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 07:13:29 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 6 Sep
 2023 02:13:27 -0500
From:   Suma Hegde <Suma.Hegde@amd.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Suma Hegde <suma.hegde@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v2 1/4] platform/x86/amd/hsmp: create plat specific struct
Date:   Wed, 6 Sep 2023 07:12:59 +0000
Message-ID: <20230906071302.291260-1-Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|MW4PR12MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: cf482099-03bb-4bf7-808c-08dbaea8c5e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /TQa76fLYdLimo9s+HNnqFsEW9R5/x0HHNaf8+o74Sx1TY0Slxz+bqJDpV0BCEIxFKjK3pdwqCnd7M0koSOpnIhofIuWx+6Evcnk6Pbi7dVKtWeCSLuAf48ei+1DhlbFSP4fEQyNnN7T7iFsBnjNx39Txc9zA+ot6VtG38CmMOHSYM/KX1biU0N78pS0ljsTHpWVd4Ky2BrLtr6YZ85V2HZzX9Yw62vCEEbLY7m2cJdKxhfPcLA6GLwtSWrIP2WapROR4plgCJySDQTdf51n/OkKm/v4dswG1FjIjqI37IXC32OpQ6IEiYgtJav7Ax2pVScz0Nn0dLW3MGuktT/D41KQhUgL9CUJmsO/CTFX39t+K/3t5QUFUnQuW6wr1/D3JGJEyFlQqZBy23cG0fM/hB/7hyvP3GxZ+a5t60tFXD27xYTsM+4MqSlnhvfmlo2nwl2Fls7ketNIj6u+mJFAp+FGjyJZfsysuaIBJwJrX9gBgXfuUuPqwRVj/BWQNuzJZp5Laq/OYX3CmyJOm0q47cgH2chnVuarv9LkRdH4PhEQCRAzWVUjZ8bGBrhiIF4yBpbec8ZhxFEP8PsE9aqN6cWL9x6aX5pEmJbJPluwvE6Wt9zAvDECwC67L0c5+dJL35HtHMOgJQNeldUNUDc7n1VgQGBLb6lNg/Hoh862XbpJrveFEm1l4PhuWeptn228X5d1u9FyQc0gssAp0K8zZz1x36E6x+Qjgiah9QyeCg55pTWJBgnwEkKDzJDW9s2DbFP7OULOt3J0KM97KjaJoQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(376002)(136003)(1800799009)(451199024)(186009)(82310400011)(40470700004)(36840700001)(46966006)(8676002)(4326008)(7696005)(8936002)(6666004)(70586007)(316002)(70206006)(6916009)(54906003)(41300700001)(5660300002)(478600001)(2906002)(336012)(426003)(36860700001)(1076003)(26005)(16526019)(2616005)(47076005)(83380400001)(356005)(82740400003)(40460700003)(81166007)(86362001)(40480700001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 07:13:29.9904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf482099-03bb-4bf7-808c-08dbaea8c5e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6998
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Suma Hegde <suma.hegde@amd.com>

Having a separate platform device structure helps in future, to
contain platform specific variables and other data.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v1:
1. defined HSMP_CDEV_NAME and HSMP_DEVNODE_NAME macros

 drivers/platform/x86/amd/hsmp.c | 56 +++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 31382ef52efb..94c65320bdcd 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -47,9 +47,23 @@
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
+};
+
+static u16 num_sockets;
+
+static struct hsmp_plat_device plat_dev;
 
 static int amd_hsmp_rdwr(struct pci_dev *root, u32 address,
 			 u32 *value, bool write)
@@ -188,6 +202,7 @@ static int validate_message(struct hsmp_message *msg)
 
 int hsmp_send_message(struct hsmp_message *msg)
 {
+	struct hsmp_socket *sock = &plat_dev.sock[msg->sock_ind];
 	struct amd_northbridge *nb;
 	int ret;
 
@@ -208,14 +223,13 @@ int hsmp_send_message(struct hsmp_message *msg)
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
@@ -321,28 +335,31 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 {
 	int i;
 
-	hsmp_sem = devm_kzalloc(&pdev->dev,
-				(amd_nb_num() * sizeof(struct semaphore)),
-				GFP_KERNEL);
-	if (!hsmp_sem)
+	plat_dev.sock = devm_kzalloc(&pdev->dev,
+				     (num_sockets * sizeof(struct hsmp_socket)),
+				     GFP_KERNEL);
+	if (!plat_dev.sock)
 		return -ENOMEM;
+	plat_dev.dev = &pdev->dev;
 
-	for (i = 0; i < amd_nb_num(); i++)
-		sema_init(&hsmp_sem[i], 1);
+	for (i = 0; i < num_sockets; i++) {
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
@@ -358,7 +375,6 @@ static struct platform_device *amd_hsmp_platdev;
 static int __init hsmp_plt_init(void)
 {
 	int ret = -ENODEV;
-	u16 num_sockets;
 	int i;
 
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD || boot_cpu_data.x86 < 0x19) {
-- 
2.25.1

