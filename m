Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2087.outbound.protection.outlook.com [40.107.96.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A043627E8
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Dec 2023 17:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gT1f0Dx1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbQXQhoLNor5Cum+wbVuevLeN+F7P1PyiCGJypHrJrU47Pt887R7sO9BNB/PIZfOJXK1Mv6zGMtuPWr9IoG4SFB3e7/XPnJ+Ng/OMpkRu7dExmXvDYpa6v0UPnxWkostflRvfP7jiWYyl0eapEeMEIutk40JERtHSRZKENMvZlZnC+WBBCcCk3MnpmCsqkolGM+iR46R/RMkr8lGtWyeDV2y6uuK47jhwI3/Ny2hFtEraAHeWY/Dy7vAI+OfdxkGyPk5s4WKb/4xOHyS2x2oduWZTtVm0TfMVo3kXZ2owZxGJzsxC/nRGRhOZka1tSfeJoP3f9mcu2L7xqS+TAH8qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGUzge6cB90FOIliHroEvNRu7z01Wvu23jyP1MZ5M9Y=;
 b=T7sD0BZwrJJm1KIkp4ipUTdR6U9Qxgf9slyPTFcV5xxRQnIqMHbIVxFN/Hf8eGhfZt+3suoUP7Lz/0AKVYMeH1Un7dYd+zQp4W9iDZAd19DOUnJchJbT+6Sd7XuKGxJLpTF6spLm954HM1ESDshOI/BzkcWoOwTipDvH9JgtlzoN2hWayHnRw2PgsEXmljEdxtbeV5aA7mlBOZ+QwkpJTh9e2NO2OZweAazeABcxB/gW4KYKhTgqFeXU7UYVktp6GULNqdqwojGdSnKOow/c/Za+CWe3NLs/OgpTYGe1JfX7O4h2zNTesemh5GBRGIBX/NPF392PNtYuF3h2/2ozXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGUzge6cB90FOIliHroEvNRu7z01Wvu23jyP1MZ5M9Y=;
 b=gT1f0Dx1ANNMLfYKqd7yi7G0MdPcmZMiu209DLPWmeiBeyNBQ5Ym1UuNCqMrX30GgY1lajDNja39iNaR/ga6wbZiSvLc/tlK8+bdLNSmQ4gYdukQ0DzZ6lK4H8LrQY1CZzHPGMZ+sXWG+O8zKWI6hirmCcszChK/0IE1iTIoX/g=
Received: from BLAPR03CA0054.namprd03.prod.outlook.com (2603:10b6:208:32d::29)
 by LV3PR12MB9141.namprd12.prod.outlook.com (2603:10b6:408:1a7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Thu, 21 Dec
 2023 17:21:44 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:32d:cafe::90) by BLAPR03CA0054.outlook.office365.com
 (2603:10b6:208:32d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21 via Frontend
 Transport; Thu, 21 Dec 2023 17:21:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Thu, 21 Dec 2023 17:21:43 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 21 Dec
 2023 11:21:42 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v3 4/7] platform/x86: Define a struct to hold mailbox regs
Date: Thu, 21 Dec 2023 17:21:11 +0000
Message-ID: <20231221172114.1569559-4-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|LV3PR12MB9141:EE_
X-MS-Office365-Filtering-Correlation-Id: e4523460-2f78-41c4-939a-08dc02494dc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LOA7AeWXMQuzXzoFz8b26NsBz+QGp0hEn0v27lNKKKiHy2kyAVuaJ8dCM/eVoV7Q/4r9woY82CE5cBHan4E4BPZOC27KFc3cqdV2ac+laViyc11kyzPULJy8PdZuLSbl6SSFl3kOUFoF7bvgiI0PSlHltMAvqjLMsnv6EYwBH8PsOuKdU/Nku/SkW/2z93mM4XISqRqQcXUX1XVZyAqWj23Mycu0FbFGPuHwVySr7Zq1GQP1uTYNMn8FxNAFlBDc9JzEqIYuAuaRbyxsWB+MqKGW50WHwVI8rLJtCXT5r7bdTxS+bFkkd/GAjuM09aMQe7EJNKE1lPKo3oqxOHZJ+aLqZsSb6GJudiXe51HE5zRJLcoAhSctRNmrRPlp//Nm0MBxaRUGbEYabTd/cqkvPOYKgQ90gR2AQGgIrE+w9q0HOrXWpC+B/CZedXw5FPm2yH1NW+W3o9oCJup5fYtw/9HUt0kFTzgq5fZ6Qv+7SFCo1R14RnUtzZJC4YYpQMUG1w8L3Wg2kDeEzso25ED18fEEMNqrDu6XulB3jq/GhZKN0VWFmx/eKsEAaGMepaiXGI7ZO8epKIX/Lo0VHFs4FzRD9rXsv5375NroS4NQ4Rx5u/iZdPbbqJezktDu4gZ8Rq5anZlwWSj+yCTILSkIT9etp5hGtJ/eZBhOMJAv6tofO7HEl7BS03P+norAF62+jQodYGT/YhNFGiM+cmjPCOUONkyIi6gEYFeGGVXIsUdaAnCASvXJFeu86S9TqNPn0FtnCyu0MopoAR8mnZCUmA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(1800799012)(186009)(82310400011)(64100799003)(451199024)(36840700001)(46966006)(40470700004)(478600001)(44832011)(7696005)(1076003)(26005)(6666004)(36756003)(70206006)(70586007)(6916009)(8676002)(83380400001)(8936002)(4326008)(2906002)(47076005)(5660300002)(426003)(54906003)(336012)(40480700001)(15650500001)(316002)(36860700001)(40460700003)(2616005)(16526019)(41300700001)(82740400003)(356005)(81166007)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 17:21:43.9895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4523460-2f78-41c4-939a-08dc02494dc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9141

Define struct hsmp_mbaddr_info with register offsets and populate
them during probe, which avoids the usage of macros in core functions.

During ACPI probe, the same fields can be populated from ACPI table.

Also move plat dev init to a static function.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

---
Changes since v1:
Move hsmp_test() to initialize_platdev()
Changes since v2:
1. Change initialize_platdev() name to init_socket_objects()
2. Use local variable sock to hold &plat_dev.sock[i] in
   init_socket_objects()
3. Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>"

 drivers/platform/x86/amd/hsmp.c | 74 +++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index e3354683b138..9b040c0b0d04 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -40,9 +40,10 @@
  * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
  * Below are required SMN address for HSMP Mailbox register offsets in SMU address space
  */
-#define SMN_HSMP_MSG_ID		0x3B10534
-#define SMN_HSMP_MSG_RESP	0x3B10980
-#define SMN_HSMP_MSG_DATA	0x3B109E0
+#define SMN_HSMP_BASE		0x3B00000
+#define SMN_HSMP_MSG_ID		0x0010534
+#define SMN_HSMP_MSG_RESP	0x0010980
+#define SMN_HSMP_MSG_DATA	0x00109E0
 
 #define HSMP_INDEX_REG		0xc4
 #define HSMP_DATA_REG		0xc8
@@ -53,8 +54,17 @@
 
 #define HSMP_ATTR_GRP_NAME_SIZE	10
 
+struct hsmp_mbaddr_info {
+	u32 base_addr;
+	u32 msg_id_off;
+	u32 msg_resp_off;
+	u32 msg_arg_off;
+	u32 size;
+};
+
 struct hsmp_socket {
 	struct bin_attribute hsmp_attr;
+	struct hsmp_mbaddr_info mbinfo;
 	void __iomem *metric_tbl_addr;
 	struct semaphore hsmp_sem;
 	char name[HSMP_ATTR_GRP_NAME_SIZE];
@@ -72,7 +82,7 @@ struct hsmp_plat_device {
 
 static struct hsmp_plat_device plat_dev;
 
-static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 address,
+static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
 			 u32 *value, bool write)
 {
 	int ret;
@@ -80,7 +90,8 @@ static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 address,
 	if (!sock->root)
 		return -ENODEV;
 
-	ret = pci_write_config_dword(sock->root, HSMP_INDEX_REG, address);
+	ret = pci_write_config_dword(sock->root, HSMP_INDEX_REG,
+				     sock->mbinfo.base_addr + offset);
 	if (ret)
 		return ret;
 
@@ -101,14 +112,17 @@ static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 address,
  */
 static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *msg)
 {
+	struct hsmp_mbaddr_info *mbinfo;
 	unsigned long timeout, short_sleep;
 	u32 mbox_status;
 	u32 index;
 	int ret;
 
+	mbinfo = &sock->mbinfo;
+
 	/* Clear the status register */
 	mbox_status = HSMP_STATUS_NOT_READY;
-	ret = amd_hsmp_rdwr(sock, SMN_HSMP_MSG_RESP, &mbox_status, HSMP_WR);
+	ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_WR);
 	if (ret) {
 		pr_err("Error %d clearing mailbox status register\n", ret);
 		return ret;
@@ -117,7 +131,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	index = 0;
 	/* Write any message arguments */
 	while (index < msg->num_args) {
-		ret = amd_hsmp_rdwr(sock, SMN_HSMP_MSG_DATA + (index << 2),
+		ret = amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
 				    &msg->args[index], HSMP_WR);
 		if (ret) {
 			pr_err("Error %d writing message argument %d\n", ret, index);
@@ -127,7 +141,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	}
 
 	/* Write the message ID which starts the operation */
-	ret = amd_hsmp_rdwr(sock, SMN_HSMP_MSG_ID, &msg->msg_id, HSMP_WR);
+	ret = amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR);
 	if (ret) {
 		pr_err("Error %d writing message ID %u\n", ret, msg->msg_id);
 		return ret;
@@ -144,7 +158,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	timeout	= jiffies + msecs_to_jiffies(HSMP_MSG_TIMEOUT);
 
 	while (time_before(jiffies, timeout)) {
-		ret = amd_hsmp_rdwr(sock, SMN_HSMP_MSG_RESP, &mbox_status, HSMP_RD);
+		ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
 		if (ret) {
 			pr_err("Error %d reading mailbox status\n", ret);
 			return ret;
@@ -179,7 +193,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	 */
 	index = 0;
 	while (index < msg->response_sz) {
-		ret = amd_hsmp_rdwr(sock, SMN_HSMP_MSG_DATA + (index << 2),
+		ret = amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
 				    &msg->args[index], HSMP_RD);
 		if (ret) {
 			pr_err("Error %d reading response %u for message ID:%u\n",
@@ -487,24 +501,22 @@ static int hsmp_cache_proto_ver(void)
 	return ret;
 }
 
-static int hsmp_pltdrv_probe(struct platform_device *pdev)
+static int init_socket_objects(void)
 {
+	struct hsmp_socket *sock;
 	int ret, i;
 
-	plat_dev.sock = devm_kzalloc(&pdev->dev,
-				     (plat_dev.num_sockets * sizeof(struct hsmp_socket)),
-				     GFP_KERNEL);
-	if (!plat_dev.sock)
-		return -ENOMEM;
-	plat_dev.dev = &pdev->dev;
-
 	for (i = 0; i < plat_dev.num_sockets; i++) {
-		sema_init(&plat_dev.sock[i].hsmp_sem, 1);
-		plat_dev.sock[i].sock_ind = i;
-
 		if (!node_to_amd_nb(i))
 			return -ENODEV;
-		plat_dev.sock[i].root = node_to_amd_nb(i)->root;
+		sock = &plat_dev.sock[i];
+		sock->root			= node_to_amd_nb(i)->root;
+		sock->sock_ind			= i;
+		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
+		sock->mbinfo.msg_id_off		= SMN_HSMP_MSG_ID;
+		sock->mbinfo.msg_resp_off	= SMN_HSMP_MSG_RESP;
+		sock->mbinfo.msg_arg_off	= SMN_HSMP_MSG_DATA;
+		sema_init(&sock->hsmp_sem, 1);
 
 		/* Test the hsmp interface on each socket */
 		ret = hsmp_test(i, 0xDEADBEEF);
@@ -516,6 +528,24 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 		}
 	}
 
+	return 0;
+}
+
+static int hsmp_pltdrv_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	plat_dev.sock = devm_kzalloc(&pdev->dev,
+				     (plat_dev.num_sockets * sizeof(struct hsmp_socket)),
+				     GFP_KERNEL);
+	if (!plat_dev.sock)
+		return -ENOMEM;
+	plat_dev.dev = &pdev->dev;
+
+	ret = init_socket_objects();
+	if (ret)
+		return ret;
+
 	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
 	plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
 	plat_dev.hsmp_device.fops	= &hsmp_fops;
-- 
2.25.1

