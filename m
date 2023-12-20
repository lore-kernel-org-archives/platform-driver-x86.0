Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F5346B9C
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Dec 2023 16:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hx+QOCgY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUyp9nOGZe0WXZhyKOHJZGTuFq9c9DX6mn7m0fYzfMZbuDFEs/BnR8GvC7mQYefDgBZ+rrlFtM313Jy5SGfq29986TTtx0IPLPlEtGuXYAqYUlBBst2u4i4KKwRXMMdXRkJr+ohENeJ4g+J07aZBWS0oNhC8J7UwnNTNJgw/O1/17Qx4kfi6cxUZJaLigFR9TSGYd7dRcPyCekEcRlXaPL6olDEHsKJAarCDNKaNYALInpXgx3zccjYjGjltZp3jOAseCV3A72Pb18YPTrFtlZISKXQLYBaiu5mVhOxpAoXFLPqMogaDQkIRAnS/deBWWkLyMZ38wX4enkbimoXvbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OP2mFGhUZb+QOL4Jkn8gEu8klkv7Met/SihoHx51c8w=;
 b=X/hB7+Xcw/hoc1mfTPkRzZdrxZJf6n02W+QxC+z9RFTalGvCb0IwG1YfFjXD/uWwW5UHSrSXWwErslb3+2L9XpOikIhTAxVKrFJux8IP52pzAKaDRvY9Z/hsWZkg2HKHEUNLf5gLaRsY7qGiA/G4cegIzQlIDN7yTLjJc+ku26xgcCEPlUk3Cs9W5L4pRGyGC1/HVTe73lLQBq5QFUfPon/XuhQ7pgBgE/Pa/wkBCfFBMiLz18Hj7OwZ+b4zRQl5EXbP8wiY/m2uhxRiyG53LLlqF7Ll48fUpYRGKJtQLPrf7PoRspkMDPtqjiNMMLt/EpG1yHvk1u+t7wMI9eKN/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OP2mFGhUZb+QOL4Jkn8gEu8klkv7Met/SihoHx51c8w=;
 b=hx+QOCgYt+A8+BK5VqS2/l016QpldfbeKi9EeEQZ9sJnValIyn2GZojq9/qfBYV98uWCaxuVrOVCAcwG4v8DEODFVWCcdiIlewRNfa3EZPWqOTu2wVGgajcfvQs7o+3T0DXizgC0Nr4FFKHXCXJsUQn9ePWKxnhamLetqZ30+eM=
Received: from BL0PR02CA0010.namprd02.prod.outlook.com (2603:10b6:207:3c::23)
 by SJ0PR12MB7475.namprd12.prod.outlook.com (2603:10b6:a03:48d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 16:55:54 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::60) by BL0PR02CA0010.outlook.office365.com
 (2603:10b6:207:3c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18 via Frontend
 Transport; Wed, 20 Dec 2023 16:55:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 16:55:54 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 20 Dec
 2023 10:55:52 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v2 4/7] platform/x86: Define a struct to hold mailbox regs
Date: Wed, 20 Dec 2023 16:55:25 +0000
Message-ID: <20231220165528.1351200-5-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|SJ0PR12MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 781a1dad-c0ce-4b97-c6e4-08dc017c8793
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t4QQI7AyV3oVr+vzKlViH+GaeHlifvCe2k4px2rBVsjxEg0eOowIVvMpQ/aT+t3MrAlOG0O5FLtNz5Iidpt6Ccm3/O1DFjhSdW1ieHExfe6Ofn3l+xYb94ITa4UT2X3i2AYti5bY6YTxXA1e4wpC5xjCU6npHqVjOErpLj6IIhTccvZzHSTD3LmVlX6DmCDNtJesKNvQpkv8KVLtsQQtS4FimvOOJcOodgE1fIb1U6JfsK1cs3xZdUD5Ytjw9PzUKpeZUqEquXp4KNv4MWpeA4b8o3f3hTAQkhZ+zvS8bRdbUzeh4a0dM5ViUm9FGGsKLDkYa9ty22r1R4gXDOIwniNq7To3IAgxEqH/bUd+e4B+5kEo3bfpxbAIovGmTp93S6hSKq+/1DODOeGAm4of1qqGHOjasc8GjBky7dWn9kUrWo1ws4dTMCMF/xHSfTYp9x66TJGdUHBUpAJ3V7SqY0ugNZs2EXh3URWfvAw8JSzvPEmWMjn/869ouR2w98KY0BA6JGPxeo0h3IO/ahupASnj0K2jRnQACF7n7jIQLPIdImY0OAOOIvBfbPl/3NL9uKysqnPzt0ZO1raGtiIP4nLyqnW7q+gLIfRxvoBzLrwBm3nN0Dw96NwHt2gxTUtuYXYlvzLQ4ZtbN+HzfZNbTB5cHaRWtrmcReRvhEGrih5NyoX8IOjMhgG4+0k00lwCe9qSzkf4dQdU36TWVwrVstSPGJpF6EN2WK/wDGLmFIfSIvbEdL/aE9xLq9oWItwLY/7eB568DZvZl4km8B+XIQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(82310400011)(186009)(46966006)(40470700004)(36840700001)(40460700003)(6666004)(7696005)(426003)(336012)(26005)(2616005)(1076003)(16526019)(5660300002)(36860700001)(47076005)(2906002)(41300700001)(83380400001)(44832011)(54906003)(4326008)(8676002)(8936002)(478600001)(316002)(6916009)(70206006)(70586007)(82740400003)(36756003)(86362001)(15650500001)(81166007)(356005)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 16:55:54.1480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 781a1dad-c0ce-4b97-c6e4-08dc017c8793
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7475

Define struct hsmp_mbaddr_info with register offsets and populate
them during probe, which avoids the usage of macros in core functions.

During ACPI probe, the same fields can be populated from ACPI table.

Also move plat dev init to a static function.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>

Changes since v1:
Move hsmp_test() to initialize_platdev()

---
 drivers/platform/x86/amd/hsmp.c | 72 +++++++++++++++++++++++----------
 1 file changed, 50 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index e3354683b138..6beca5787e55 100644
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
@@ -487,24 +501,20 @@ static int hsmp_cache_proto_ver(void)
 	return ret;
 }
 
-static int hsmp_pltdrv_probe(struct platform_device *pdev)
+static int initialize_platdev(void)
 {
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
+		plat_dev.sock[i].root			= node_to_amd_nb(i)->root;
+		plat_dev.sock[i].sock_ind		= i;
+		plat_dev.sock[i].mbinfo.base_addr	= SMN_HSMP_BASE;
+		plat_dev.sock[i].mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
+		plat_dev.sock[i].mbinfo.msg_resp_off    = SMN_HSMP_MSG_RESP;
+		plat_dev.sock[i].mbinfo.msg_arg_off     = SMN_HSMP_MSG_DATA;
+		sema_init(&plat_dev.sock[i].hsmp_sem, 1);
 
 		/* Test the hsmp interface on each socket */
 		ret = hsmp_test(i, 0xDEADBEEF);
@@ -516,6 +526,24 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
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
+	ret = initialize_platdev();
+	if (ret)
+		return ret;
+
 	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
 	plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
 	plat_dev.hsmp_device.fops	= &hsmp_fops;
-- 
2.25.1

