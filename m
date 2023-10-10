Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A59B4CD80B9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Oct 2023 12:04:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbjJJMEI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Oct 2023 08:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232007AbjJJMD4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2023 08:03:56 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 876BE10B
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Oct 2023 05:03:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIehTv7GBF4VVx7RW9XsGEOgB1f/PjMbuVy5uRrlqYu5kplM1HOCFP1DdhW/J9hGstKoWry+EdP/Ep509b0V2jezzVxgsDf1K5wym5GklTJ+Wkslncsh11VZRjWOwTUf4O+NPleCO9GbyRmrvjIPZb38PB2oZvIIM2gkpei9Upc2iR4XTjp/o60SyOfi7tL+E9j9wl1pxZ0IKXK00w7fglz233zH+bEJj8sDfoTiTEhrEDlt+GESuus4iT95XftuoYwosP2uQlc7wt8/biD1aRVkhs3YVfAX21ygK418/rhZ3IiUcIs/p/W3NLsLMl1hMTBn+zwD3ZpuYPCG8j0Y3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJf3l9706AXqwplQWmkX06soCGJs9NMvJmoAcX0I7P4=;
 b=Igy6nX35LzZLGutbgivX+P6q3Vj9RcNovJe+iOHda+o4BnV1vnf5cYDLE1VZHZZbJl/sefh4cO09JSmY5ZpmHUBjREmTtOOMo1OOrJ5h4uufeAR0n5ygeLjPuMgQnNJxVaUpRUK5mbUWShA4T6hcb1PD+apTxg08YkQrYejNPowwXIojQBGC83W0tTkAB5aT2BXXCootEotIFcpBBRhkqGMxoc6M03eQkoQ2AxcT5k6H37Toczap1IIRq7L/iv8T3QIzb5MaNi5D3orcG6VY2PcExeVdrpFYl/3D6nplWT3BfeKDO7TRmCMAShwp/sKFOl3oN1ATOVnfq0r3a7APaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJf3l9706AXqwplQWmkX06soCGJs9NMvJmoAcX0I7P4=;
 b=H+9c6LBirXzHe4zKIfuJB4dbHn3mcNoq/NOIJlv5D36C6WeEIR9Nu16AvGyqbKF8V8DiIXwt/jAnKQIYesSbC+ZP1tvs3HjXINt2gYIHllglyQsWBpTyIMWTEuTPZLYgbTEP5PPLvX9sO1hnJmJUCNVJF4bEKfZS9FaCk12hbxg=
Received: from BLAPR03CA0128.namprd03.prod.outlook.com (2603:10b6:208:32e::13)
 by CH3PR12MB7713.namprd12.prod.outlook.com (2603:10b6:610:14d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 12:03:35 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:32e:cafe::6f) by BLAPR03CA0128.outlook.office365.com
 (2603:10b6:208:32e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.41 via Frontend
 Transport; Tue, 10 Oct 2023 12:03:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 12:03:35 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 07:03:33 -0500
From:   Suma Hegde <suma.hegde@amd.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
        Suma Hegde <suma.hegde@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v5 1/3] platform/x86/amd/hsmp: create plat specific struct
Date:   Tue, 10 Oct 2023 12:03:08 +0000
Message-ID: <20231010120310.3464066-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|CH3PR12MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 21df5cd3-2ead-4c0f-385f-08dbc988ee33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YH/IsndpsV1nHraXdzKQy09bBxH6TDH1fhxRQK629tY1TawOeoBpbaXXUhfSsiIUtXc33AETXgiSFJJmgTr5lHWNE8G0BaS8T8v+LHxHw9u+Uo8CGh1bFMYot4uewqWFxuzBgICxLytP8iyy6wjvxgpJw8Ypxu8uZ5jhjePkEgQ+Bgmy1w0l9zrJ5muql/rsX4JlJcHlDV9Lui6+5TEgNsGgSEzxsCrj2mcAyVSBv9R245HacGHcBqO427FijdWYaZoEKB8zumXibNatZ03KAZ4vv0VZ5P6nINbtDrpusH7ATfy/L7xB7TX9fb+CgbNW2uF6reD/611kOquOKTMBhECBoqelHPWI2uFsysg/1PX0Oaoqt6yg4eLT3qdBFSXdcnv+1mTAREudemzQC8rNw2T/J3UaWzW9WFvNKYObpdaq2Gkm2TH5BpW4JWA+Q08VxMHtFzbmoq2jBxtuh57DxWIkV3jNB668eXBjgMQgKigXbcMR/8NoKfgA0JWYWmPSpjFyepzvIr5fO619QmwX+wQKlUoR55Fmg00ZvkhlhXK6SVU8o43/HtDdq0n+VKViPXrzUHUnz58B3bOblOFeOKeWAZ93fIeX8ABk0klp6sSyvK1dmGF5qhRvlJInlPfQqPhM1Rd8AsoLySfXOkQLWm0RAqMg225Nz3JfNjr/LwrBQ8O3aaIx4snlAA+KJeEOJUphm/HyZVNKnMH6AjS0f0335VT+yc2YKcXchkmB4fd8IpeLT6VzqbHrMONNO1o2SJIs55LdPEo4rJoMnl26KQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(346002)(376002)(230922051799003)(451199024)(82310400011)(64100799003)(186009)(1800799009)(36840700001)(40470700004)(46966006)(40460700003)(66899024)(86362001)(47076005)(2906002)(36860700001)(82740400003)(81166007)(356005)(40480700001)(70206006)(70586007)(6916009)(54906003)(7696005)(316002)(26005)(1076003)(2616005)(478600001)(16526019)(36756003)(6666004)(44832011)(83380400001)(5660300002)(41300700001)(426003)(4326008)(336012)(8676002)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 12:03:35.1657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21df5cd3-2ead-4c0f-385f-08dbc988ee33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7713
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
Changes since v4:
None

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
2.39.3

