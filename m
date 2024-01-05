Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2040.outbound.protection.outlook.com [40.107.95.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B04C1EA77
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jan 2024 07:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LIogI70v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtTrYATSaIz5zGM7VaUeSII9GCd9KCAdGsFeXb0wXcW5enkugdSDHYxdori1U2j6WYycf+9TQRGMMhj5Zb+OTdWju7WRTGTl2Aef0qBeolLUwcLCjWidxke5Gs7ToAr6wkPFaq7V57j5aqZRX+xAQBw+DozwD06mngGjLGzievHuqINfAMwtbMJQ/Yw+dV6rNOtnlWNAsW+X8NKvbF6Hn2ExZzAGM2r8BWt13QNtMSaYzWpZXKJgoEuaTPyqM7QHyxBi6Ytpn90FHAjklATcwHDCKXkAofGEEfqmrNsyIUOjaKDV9pxYZg3vC6PAGNDfWgNTmjuOQFb7TVM0//oNUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwN+ktZs8nVJ1xIctlhICgVyEjRyr1R6HY6CwkgUi8w=;
 b=HK98KSVrqTFEqfjpHgqgEk4rzwGqcM+3zfObVgmrfF6eM4ApxPwsuy/1/Z6fUK7WjB43GF+WEstlNo6/ebDUafHRhb4C6Fc42h4yE+Ad6q9mL2W9IQJNCrEvBhcbSWpX65TXzhKt8g5wIt4imZZPK+pNJRIPfeJtF+9TzfNrbjr154bYjzsxmkOWI7adGklYMDAHmxO5mCh/HaqvF+j8DqZjJtX3EfZ2cykzf4guacfRLrqiDGhSyZWN3zK04jhGmSYEZqrLl8IQuwWxwsv/h7lxBtPLJQrfAPVKsewgPRtjqJK5hnGxXteu4XgN66HPJilVAz38MBL6loNqJVqHMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwN+ktZs8nVJ1xIctlhICgVyEjRyr1R6HY6CwkgUi8w=;
 b=LIogI70v+gDwUWtnxRoi71T/tTBXueYJDtXxclJKtuCxjpq47ri3q8Jq4IV1jF2BiLtfgmpIOjkWHNlhumb9kQQzTa5gvfSJXCyff5TAhYmp5PHS1CGxd/2zkXhxVAtk709lfVCU+SrWfry/t7C3DSqzPl+YauRKAR0ZiuiaoEA=
Received: from MN2PR20CA0059.namprd20.prod.outlook.com (2603:10b6:208:235::28)
 by SA1PR12MB8599.namprd12.prod.outlook.com (2603:10b6:806:254::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15; Fri, 5 Jan
 2024 07:46:52 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:235:cafe::8d) by MN2PR20CA0059.outlook.office365.com
 (2603:10b6:208:235::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17 via Frontend
 Transport; Fri, 5 Jan 2024 07:46:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 07:46:51 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 01:46:49 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v4 4/9] platform/x86/amd/hsmp: Define a struct to hold mailbox regs
Date: Fri, 5 Jan 2024 07:46:13 +0000
Message-ID: <20240105074618.1667898-5-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240105074618.1667898-1-suma.hegde@amd.com>
References: <20240105074618.1667898-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|SA1PR12MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f60be10-35a3-41ce-c0c8-08dc0dc27af1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TOe+ZBFnxWxyoycNbRgg7AsxZxBeIL3U/gU5Ye78ANqPoMvrvcKYNPlngj0O5JS8rvurFkLBIQEmiy7eBl/AAdPaGNXd9B4QbganpDveDBYGZVGJS2MgrpklDG7zOQR4i6kkfMVKfe4H4QQSnfQHiebiocMeyckegoMR41Kniuo3TCH2N+NMbOD53q5oOvrU7ukINWdqt2/sFNVTYAYJ0hHS54sj8i+2Nb8OSNDa9lrwahOkZzGzveROPJ4XBEiSNN8jzLsKj9DHLtuAKIYLeoDy61a+KZkDji1zaCTw9boRFC27c9ZZjcrSBLTARUdw+BxixheUGItWtJ+RoGlTZOfQry+fggNh1mYFxktIR37zuQq5k9ZRX8gqsvuZDxnSZMp+x3+KsjzYnrmdcxw7mFvAizojzcmnLUqs/LFyOff9L8Ef/ORg0MJsvyaI1EUyIsC2WwsGEdXZ8mvTjRPLK4u97WiiyEIx7WuUWUbo1ATgE1zT3eZTtSlpvupoc5cgyihsksnRBf7e/1ObZmUXCZ80AzDQjqUeeX7zQdWeZgnDEkLeAHjQuYVOvcdykbuAM310iYGyd1X5J5XPH7mX1yKikeactshLTRapl2jMMb3dEgQCDNtOfTuYh4AAq3AyGcI15JgXrXh76qLWfDzuB+fKavEvmdgyttexzZkhv6jrKkH5xaNAiXVcdKha9cHtOX0giSZErrdaij5yI1r3BJ0UDtZxkiQ8b71HR7qTqDU9K1ncTbg7kKdkn8TaLBr56p/zKzdx09McLXjw9gIvDA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(1800799012)(186009)(451199024)(82310400011)(64100799003)(36840700001)(40470700004)(46966006)(40460700003)(40480700001)(426003)(1076003)(2616005)(26005)(336012)(478600001)(6666004)(7696005)(82740400003)(86362001)(36756003)(356005)(81166007)(15650500001)(41300700001)(4326008)(2906002)(47076005)(16526019)(83380400001)(6916009)(5660300002)(36860700001)(70586007)(70206006)(8936002)(316002)(54906003)(8676002)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 07:46:51.6779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f60be10-35a3-41ce-c0c8-08dc0dc27af1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8599

Define struct hsmp_mbaddr_info with register offsets and populate
them during probe, which avoids the usage of macros in core functions.

During ACPI probe, the same fields can be populated from ACPI table.

Also move plat dev init to a static function.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v3:
Rename init_socket_objects() to init_platform_device()
Changes since v2:
1. Change initialize_platdev() name to init_socket_objects()
2. Use local variable sock to hold &plat_dev.sock[i] in
   init_socket_objects()
3. Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>"
Changes since v1:
Move hsmp_test() to initialize_platdev()

 drivers/platform/x86/amd/hsmp.c | 74 +++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index e3354683b138..287eaa9b0dda 100644
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
+static int init_platform_device(void)
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
+	ret = init_platform_device();
+	if (ret)
+		return ret;
+
 	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
 	plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
 	plat_dev.hsmp_device.fops	= &hsmp_fops;
-- 
2.25.1

