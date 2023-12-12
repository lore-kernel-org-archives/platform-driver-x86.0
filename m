Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="H3c8wsGk"
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788C1AC
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Dec 2023 02:39:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qw4/jGpPfqY+z3wjTPhQvGyJOXGAlCXUcTn8MKMnoopVUzqIoM1xQbfvYV/pzRZx0PKV/e19oSYTO12GYWnQ3OWeOUEUOHIoOkFWVo8+f8OkBXKdmQtg77PkrVdd40QIc15FVvkjRBUb2Kaz5AzenMbqxbLdHyYujMiqvhPUZf5ch024JOlsF0yRigqjK9W20ud/yQg1v+LLOKyVfx96QOqTp1bW++3e+Zc8Odj/0i0U7/03Lf/BfegRo9U3OlUKUFEnigk0SEbg/s57DLGFLcvfrk4muPxBZ2jVXJ3COEAKhvpWNsPbb4QqedeMt7BF/4tSiufdeeyQ6XsZgd4hug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0RdTmrBKYP28EXXuoYkGqs2CxWd7khMarlFoNMH9TQ=;
 b=cONzG1HO5XfGaCVcav1bSVIVm34Br6SCl5bfocW3u8pZ6gvShP7j84XxfKIWDF0xAam9QiY9SIhuhJ9UPaC8U9sxcQYPUF05MYPw4f0dvceOsfi8qytfZPAnjtM7ZEn6CP+7kbD9S4dkuarkVR0eg07e5hb4NARaX57YijwUAHJ0T6v7PuvUSidXVVbFK6JkHgwLlIqxKzkCA5qDseP7Q9IYKb67j9SubtpenYZefanQeA2Wd34buC51zCpHJlOnSS5occJkC6zSy9N+Bi4Ep7O6JbgyXXL92q5AJR1+DBRKrF9dK5v57i1WHFic24nRNseqok5C5t2M0B89e1oFmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0RdTmrBKYP28EXXuoYkGqs2CxWd7khMarlFoNMH9TQ=;
 b=H3c8wsGkMQKUEXOaN28TTzFweWvBrnAQfw2k6STa4fSlp+PSovFunbOq+v5J88mokQbpiNxxzw74EaSAsQgpQXW4PCUvdwidVB8QsGA0TGgWkcc1Nx/F/g1VbDxhdNY8Fh7vnXHR8O+d3jGHpx87kTjqyoD8n9z0xwuC+rFZG6M=
Received: from CYZPR11CA0018.namprd11.prod.outlook.com (2603:10b6:930:8d::27)
 by SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 10:38:57 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:930:8d:cafe::71) by CYZPR11CA0018.outlook.office365.com
 (2603:10b6:930:8d::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26 via Frontend
 Transport; Tue, 12 Dec 2023 10:38:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Tue, 12 Dec 2023 10:38:56 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 12 Dec
 2023 04:38:38 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 4/7] platform/x86: Define a struct to hold mailbox regs
Date: Tue, 12 Dec 2023 10:36:41 +0000
Message-ID: <20231212103644.768460-5-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212103644.768460-1-suma.hegde@amd.com>
References: <20231212103644.768460-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|SA3PR12MB7901:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a5c7060-1270-4c5b-fbca-08dbfafe8b43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nFM/nmkqof1WdxmTgibaB1un4eHf1apsaMtIb9nXDtExK4Qb25z9eEE6G9ctUA7gwmrIsbnKlSuu33kxM1sEQ1so019uRS8q34QwA/0AfLCEiCN8+qlARDeh8a3ADKHQNa+h+U2nHL79vm36BJYG+e4QPxJyjJmfSqZTx+E6Vya7PrLXRPnd95T+zI08HBSCYdX5N4XjqA60oOSOc4e98bE8EcN8uR2QQRgXhqY0lSP5wi7u6RWLLYW+587/WwhCcEPvQbrHXzSUklWNOqcld6R6XSYSAg7tzeupGsawM5JkQGtoWwaLDDHkJm0VKkSKqOK2I31N16EPfy+8y70PouiPvVs8CzNdibJo5h7mXrO8WY7JtoZ0CtfYzzwCvYra/aC/a8wZLndoX7DFQkovACTZ2+3s3Fo5yevGCxULgMPu23MicIvCkMlMiY5y6uG1SoaGkYWv5KFUiycuomyI535IDQnJiItssxRJpP7UxCi4l5tIf/1gb6/Jyafd5OkJJetFQUg1V1fktx5pDri65ZyEb8ZwJLhgbSj8IwQeRC2vJHoBP0cmhTETZdCG5+N97YTYBCpQv6S2UABlY5Pl4fBrtY6VLThwcOVr/E/d/8MWf9Ts7ssGEOH/9yQQLZd2M4P/brCSbcIupsZFFqr+GzzXWLv1uM3q/s+8muAUduaZENRCNaxWySeCJho3+7SnQQNeMzDsDdYGHIkSJbS1nwUvuyNG+V0iIXn29JVfSR0v7A0F3HVOFBDRBL0NdJvGYWY96J8JbQr+NwfOi2jdMA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(39860400002)(376002)(230922051799003)(64100799003)(1800799012)(82310400011)(451199024)(186009)(40470700004)(46966006)(36840700001)(6666004)(7696005)(2906002)(54906003)(70206006)(70586007)(81166007)(356005)(86362001)(36756003)(6916009)(15650500001)(8676002)(8936002)(4326008)(316002)(44832011)(5660300002)(40460700003)(478600001)(40480700001)(41300700001)(36860700001)(26005)(82740400003)(16526019)(1076003)(2616005)(336012)(83380400001)(426003)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 10:38:56.7245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5c7060-1270-4c5b-fbca-08dbfafe8b43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7901

Define struct hsmp_mbaddr_info with register offsets and populate
them during probe, which avoids the usage of macros in core functions.

During ACPI probe, the same fields can be populated from ACPI table.

Also move plat dev init to a static function.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Co-developed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/platform/x86/amd/hsmp.c | 80 ++++++++++++++++++++++-----------
 1 file changed, 54 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index f0db7a480ace..44b15c1fab6a 100644
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
@@ -488,9 +502,28 @@ static int hsmp_cache_proto_ver(void)
 	return ret;
 }
 
+static int initialize_platdev(void)
+{
+	int i;
+
+	for (i = 0; i < plat_dev.num_sockets; i++) {
+		if (!node_to_amd_nb(i))
+			return -ENODEV;
+		plat_dev.sock[i].root			= node_to_amd_nb(i)->root;
+		plat_dev.sock[i].sock_ind		= i;
+		plat_dev.sock[i].mbinfo.base_addr	= SMN_HSMP_BASE;
+		plat_dev.sock[i].mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
+		plat_dev.sock[i].mbinfo.msg_resp_off    = SMN_HSMP_MSG_RESP;
+		plat_dev.sock[i].mbinfo.msg_arg_off     = SMN_HSMP_MSG_DATA;
+		sema_init(&plat_dev.sock[i].hsmp_sem, 1);
+	}
+
+	return 0;
+}
+
 static int hsmp_pltdrv_probe(struct platform_device *pdev)
 {
-	int ret, i;
+	int ret;
 
 	plat_dev.sock = devm_kzalloc(&pdev->dev,
 				     (plat_dev.num_sockets * sizeof(struct hsmp_socket)),
@@ -499,22 +532,17 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	plat_dev.dev = &pdev->dev;
 
-	for (i = 0; i < plat_dev.num_sockets; i++) {
-		sema_init(&plat_dev.sock[i].hsmp_sem, 1);
-		plat_dev.sock[i].sock_ind = i;
-
-		if (!node_to_amd_nb(i))
-			return -ENODEV;
-		plat_dev.sock[i].root = node_to_amd_nb(i)->root;
+	ret = initialize_platdev();
+	if (ret)
+		return ret;
 
-		/* Test the hsmp interface on each socket */
-		ret = hsmp_test(i, 0xDEADBEEF);
-		if (ret) {
-			pr_err("HSMP test message failed on Fam:%x model:%x\n",
-			       boot_cpu_data.x86, boot_cpu_data.x86_model);
-			pr_err("Is HSMP disabled in BIOS ?\n");
-			return ret;
-		}
+	/* Test the hsmp interface */
+	ret = hsmp_test(0, 0xDEADBEEF);
+	if (ret) {
+		pr_err("HSMP test message failed on Fam:%x model:%x\n",
+		       boot_cpu_data.x86, boot_cpu_data.x86_model);
+		pr_err("Is HSMP disabled in BIOS ?\n");
+		return ret;
 	}
 
 	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
-- 
2.25.1

