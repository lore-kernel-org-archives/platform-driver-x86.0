Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C5BC7113E
	for <platform-driver-x86@archiver.kernel.org>; Fri, 18 Aug 2023 12:52:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241866AbjHRMwG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 18 Aug 2023 08:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376978AbjHRMvx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Aug 2023 08:51:53 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C86826AB
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Aug 2023 05:51:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WuGD/4JmWufPmITfBwUQEucy1JSb/O99txtC73XGj472B32GZGmvV98Xa/aH6Bi0e8NPGCiZ4lfOVq6aWt9U/bEj6L56Ci59evgI24nDuH7cL7Ol/ua1sqZtUBqAMdWNo6R7eidVgF+Qm9t5uX5pZhtfH8HNAGhBYQzO0KDe2ZZmdK+G7iMx5aVQ1fEp90VTwDYqrR3txxN7z5OceIY5X7nd4dqs9a9YNQ+o672oXWu4aDG9JmDDnRh+kB80jIouBfT5dd6fwINJCX1VCSwnqhQX2v35yjiJzg4G2bPpsPdJitdec9spO1v9nMSITjrGp5mL6UrjyE+tVHUMEAPigQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7H6ytSIckiWRUw/mZjyTG0OLdsXSX+BVCZ7Zkj7ABhQ=;
 b=UckocO6YjdTC7EkQY0awD71yyh0AxpgrOufnqL9eMBVYvb5lvUNQaIkxvwHc9fF+PV5ChEZtBBGq6NIPr6Wo61mAngJZQod9VtiMltzJBT81c1Tx/iM5RE1Ur2Wsv/TKKITDLuW3MbAT7+mIzrNgvomMv1+hvPoEfhN12XqYIzXR5KquC5Q+SIr7VWISypWzrCzlu+664+Ezd37ZyaJd/ZPjdzeqFzAcaiKlp9fhiqbfn7gyvDm7UkrMLi1tYtnX2jTRKwqmMNxFtmsGmsCTi/7SRrMu2+tMqPudjHBrTBe7nipGfgw2LtLxNGyt2IDQ3+XHHnb2UlTXrddpsBoXjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7H6ytSIckiWRUw/mZjyTG0OLdsXSX+BVCZ7Zkj7ABhQ=;
 b=hpo6FL1gP5omHrtB+UeD8WEL06t4QjnpsGCu+eCXXE9szAxUJIsyoQb8O0aPasb9Hdrh4X4njBmmpSqmv8RA7SwLxcPQORqEc5kfOAv2ihsXmeeyLye2IL2qQGXm1OtwB7hVTfc0mw/VC3scolWNK1TqkilrXmXssKHC7Hw7RCY=
Received: from SA9PR13CA0158.namprd13.prod.outlook.com (2603:10b6:806:28::13)
 by DM4PR12MB8499.namprd12.prod.outlook.com (2603:10b6:8:181::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 12:51:50 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:28:cafe::e3) by SA9PR13CA0158.outlook.office365.com
 (2603:10b6:806:28::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6723.6 via Frontend
 Transport; Fri, 18 Aug 2023 12:51:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Fri, 18 Aug 2023 12:51:50 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 07:51:48 -0500
From:   Suma Hegde <Suma.Hegde@amd.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Suma Hegde <suma.hegde@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH 1/4] platform/x86/amd/hsmp: create plat specific struct
Date:   Fri, 18 Aug 2023 12:51:17 +0000
Message-ID: <20230818125119.1323499-2-Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230818125119.1323499-1-Suma.Hegde@amd.com>
References: <20230818125119.1323499-1-Suma.Hegde@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|DM4PR12MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: 13ede0b0-ebca-4495-16ec-08db9fe9e3d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Olny7CiujzA9wdEzbzTEsOIW2BJn8uctUOKAT0CibYl8qwK7xc9TH/uvtLYlzHVw+wlB7kMYqdgumU2g7bJSY9jUe5sfV1R+ZzsChR0/qcCIK57ecv/JzEcvnuk3eEPVy0xWMtGT1sBWR461T9cuprT64tEKlhUmPhY8VF8qkSrWs7DiXohFd6sg8LTSKi5SL+wnOsXlVBkuq54YCwe2cTO8bTbF6E7jA3qcKZegrlpfJ06GZf+e6ZzrqJ1qdxJ0FQ9DTDDY4HFOu3y2iWzp68vg4xTiNx50KcxCgWQU4RcHXHUfCyQGgdzZOo7aSoC2NqsAHJzsn8/vbY9uyFi4jvOL2008iUuxuURCe4Wxc2cKhLCe9+4mn3qRrpF6gGiwiuQpNKvM8Go+HT/XERkFfJC9E1Ly6+/VK+e6OPyWwXMQRsFikQ6zXjHQOfErwM2iYrUIURzI/GesriC6d6z+euUcV88Dftkpnpw1TTJF4oNgeTfCeHVdajuFFQ1Q7vlmKngpmnDC1PyCkzTQbUdcqd0BZYb25VaI9v+VNX+dJ/a1JFJjTIEwIg8qJCddpJh18BIyEYlNOlBsvOq/iHjsR3V3y5E9FsInjaYgI1haJe5BGhmeXYzMFpIERstVDBGR35nVVK+gAaqsG9GG97noZGtJfVt3FM3P3e0nIMfP2jX/hzToSvS7dfbZjvmmOYEbnuvQfanTIDFqkcfpI/ZLPsv74v4GDboHh/yx135cwP4sdyycnSEV1esOR8HH923+ZHoROvUoYMRGdZIAFtvzUA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(376002)(396003)(186009)(1800799009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(6666004)(7696005)(40460700003)(86362001)(16526019)(336012)(426003)(1076003)(26005)(40480700001)(83380400001)(36756003)(36860700001)(47076005)(81166007)(82740400003)(356005)(2616005)(2906002)(54906003)(316002)(6916009)(41300700001)(70206006)(70586007)(5660300002)(8676002)(4326008)(8936002)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 12:51:50.0824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ede0b0-ebca-4495-16ec-08db9fe9e3d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8499
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Suma Hegde <suma.hegde@amd.com>

Having a separate platform device structure helps in future, to
contain platform specific variables and other data.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
 drivers/platform/x86/amd/hsmp.c | 53 ++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 31382ef52efb..699c22f7cd42 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -47,9 +47,20 @@
 #define HSMP_INDEX_REG		0xc4
 #define HSMP_DATA_REG		0xc8
 
-static struct semaphore *hsmp_sem;
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
 
-static struct miscdevice hsmp_device;
+static u16 num_sockets;
+
+static struct hsmp_plat_device plat_dev;
 
 static int amd_hsmp_rdwr(struct pci_dev *root, u32 address,
 			 u32 *value, bool write)
@@ -188,6 +199,7 @@ static int validate_message(struct hsmp_message *msg)
 
 int hsmp_send_message(struct hsmp_message *msg)
 {
+	struct hsmp_socket *sock = &plat_dev.sock[msg->sock_ind];
 	struct amd_northbridge *nb;
 	int ret;
 
@@ -208,14 +220,13 @@ int hsmp_send_message(struct hsmp_message *msg)
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
@@ -321,28 +332,31 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
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
+	plat_dev.hsmp_device.name	= "hsmp_cdev";
+	plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
+	plat_dev.hsmp_device.fops	= &hsmp_fops;
+	plat_dev.hsmp_device.parent	= &pdev->dev;
+	plat_dev.hsmp_device.nodename	= "hsmp";
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
@@ -358,7 +372,6 @@ static struct platform_device *amd_hsmp_platdev;
 static int __init hsmp_plt_init(void)
 {
 	int ret = -ENODEV;
-	u16 num_sockets;
 	int i;
 
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD || boot_cpu_data.x86 < 0x19) {
-- 
2.25.1

