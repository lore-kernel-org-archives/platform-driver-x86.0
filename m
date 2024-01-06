Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85E2139C
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jan 2024 02:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Q1OV4rXl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsgZBOd3PqIAFonvEe/EqooFHg9lHyD3Ya+4RqmboECjZ6fuvu5h8SgqSmGC4CKovhDk26ta4W3wPTd8qGD2MOPGIC9yAvNuZs9hsJhc22QhMkDS5ahJMperYIB5wU9mOhOr9sWNC8kiFzO0OHTUhzt2/DCArqu/NCOdPsINJdVhnAVRaLVhFnF4sjhFD2lmt+2g53ARNb0tmWqRGgI5/pBZOgp8nZODNs87GOC9brs63nV4Ev3eRQmeG2a3SOggGtBxAGgc13AjG/ZYdX2fNZK4fcuWBnObptyGTgwnyBrWlXkuU2L+fC5G7ciTC4fHXKGz/ru/uxnJUn047hB1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXu7g0SjVM2PXOG8/tikO/DFLGIL69ExD/xoLVXFpzs=;
 b=kgySnVIomsX5wJvYf64RpK6S20jrknFiZ11P4kOhRLAv0MpPkIbaD7+Lmi5uRU349o3npzFNYdVLHkFG5D0khgdncZ3vqLaZwXtVaw4nLGk+BHkGIqjBR4Xrpl+BWsQYmHJCtHXEgvYngMu1tvRaNN2MU5Y2K35d089WR5aZcXZBLHxvmUJh9kVQJTKIukaZCY5l7TZYkr+26rakJrx2cpqNY9JDVhVcg+wY7q7YZpLpb38ZzwUwyb8rAFw2K7JnHltVbO6oXfoqDu0WiPOSYx9XzVu/2yIj+APHWyeLXHW5Ek0bS3BrysZtYahKprzVdM53Arq/86ck17B0GL2teg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXu7g0SjVM2PXOG8/tikO/DFLGIL69ExD/xoLVXFpzs=;
 b=Q1OV4rXlaII9S95MnACdPXPkAasq0mG1ZJRBmcrFYTtpcYfcDYEISzE0JNlPrt5FY72Ekc6GtBP7cabL5ZMsuGxY5cBHq900qY9TSCNSQrNGbnQ07LZ93o7/G7kZBUmiAr7LUUlskwlDudgUkPf0iMEMJHfMeLM+YQCK/9bnrqw=
Received: from PH0PR07CA0008.namprd07.prod.outlook.com (2603:10b6:510:5::13)
 by DS7PR12MB6288.namprd12.prod.outlook.com (2603:10b6:8:93::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7135.25; Sat, 6 Jan 2024 02:26:11 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:510:5:cafe::b) by PH0PR07CA0008.outlook.office365.com
 (2603:10b6:510:5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16 via Frontend
 Transport; Sat, 6 Jan 2024 02:26:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Sat, 6 Jan 2024 02:26:10 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 20:26:08 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v5 02/11] platform/x86/amd/hsmp: Cache pci_dev in struct hsmp_socket
Date: Sat, 6 Jan 2024 02:25:23 +0000
Message-ID: <20240106022532.1746932-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240106022532.1746932-1-suma.hegde@amd.com>
References: <20240106022532.1746932-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|DS7PR12MB6288:EE_
X-MS-Office365-Filtering-Correlation-Id: 86db6224-ef13-4176-5397-08dc0e5ed8f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4blS5inopZRy9vdmJEtqWaeE2urXlYUkAextC7+1rLrzg9EFJzAWf4OlaeLjiESjPxhZIRHpxjyxH7HrFP+LaIeOVj9lXY/wiJHQQJ2XJRj2ldDTN1uMhid0D6xNOmDTibUg7AqAzRSDiA+wBpLSLZTo/4nWtSErAUjJGEjJ2qIGY92vkUhH799Lo313lYaLkGrFVp6UVI/2MzGKnkQVVTVmw6FA99r6fkrqlYkuDTfPGTXAwwhCnZ2xihqkLUErU8pBLXFT83QtpXbQaT3bfo3MswLG7yU167elR8xuwq7qKbEice+ZD72FswsirmVm9CU4lHxnjv2P8pk8NDnORb5E9GA6h/kkXxewrFaYaWbrfZ5dlULt9vRdbZg9OZDv57PcSRTs/hnvoEI/hST7OgcWW50O4bbsKUnt9+eOp9ZxILEfRFs1w4y9yoXrUXhsyuTQkXVbLngMvV7EPj2sHvcTTwazGftkDDWeUWyUKaX/JBy4trDNsf05pcdqLU7lsSrTmq0untimiSucBK8pUe7WqpPAQmVhIup5jwK2pT0BGzvMEzSmQpTA1Pd8mx3knPVqNBehkdYGBaU9EW2qix8ybu2skZUIC+2CwYIjdw8TgqqL8RJSmiPQHAyxCBKVyiTR7v/EMrDr1jG5vrYlnIEJ73S2h0IgNrYgdMQcS5YtSgcYZlgUD1Yxb5nzT7TM+rbZYeOfaa+buOYLQYMH4phfRrJtWyHmoqt+eOM7ACaeXddNioztjvPmZ/XpIv0Q3WylgqRyPa+rKMAf5MCOZg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(40480700001)(40460700003)(36756003)(44832011)(70586007)(7696005)(70206006)(86362001)(478600001)(66574015)(2906002)(16526019)(6666004)(81166007)(336012)(356005)(83380400001)(2616005)(1076003)(47076005)(82740400003)(6916009)(426003)(4326008)(5660300002)(41300700001)(8676002)(54906003)(8936002)(316002)(36860700001)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2024 02:26:10.8813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86db6224-ef13-4176-5397-08dc0e5ed8f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6288

Cache pci_dev obj during probe as part of struct hsmp_socket
and use in amd_hsmp_rdwr(). This change will make it easier to
support both non-ACPI and ACPI devices.

Also add a check for sock_index agsint number of sockets
in the hsmp_send_message().

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v4:
None
Changes since v3:
None
Changes since v2:
1. Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>"
Changes since v1:
1. Remove !sock check in hsmp_send_message()
2. Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"

 drivers/platform/x86/amd/hsmp.c | 42 +++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 3c17b488f4f8..1a2abe4460f9 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -58,6 +58,7 @@ struct hsmp_socket {
 	void __iomem *metric_tbl_addr;
 	struct semaphore hsmp_sem;
 	char name[HSMP_ATTR_GRP_NAME_SIZE];
+	struct pci_dev *root;
 	u16 sock_ind;
 };
 
@@ -71,17 +72,20 @@ struct hsmp_plat_device {
 
 static struct hsmp_plat_device plat_dev;
 
-static int amd_hsmp_rdwr(struct pci_dev *root, u32 address,
+static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 address,
 			 u32 *value, bool write)
 {
 	int ret;
 
-	ret = pci_write_config_dword(root, HSMP_INDEX_REG, address);
+	if (!sock->root)
+		return -ENODEV;
+
+	ret = pci_write_config_dword(sock->root, HSMP_INDEX_REG, address);
 	if (ret)
 		return ret;
 
-	ret = (write ? pci_write_config_dword(root, HSMP_DATA_REG, *value)
-		     : pci_read_config_dword(root, HSMP_DATA_REG, value));
+	ret = (write ? pci_write_config_dword(sock->root, HSMP_DATA_REG, *value)
+		     : pci_read_config_dword(sock->root, HSMP_DATA_REG, value));
 
 	return ret;
 }
@@ -95,7 +99,7 @@ static int amd_hsmp_rdwr(struct pci_dev *root, u32 address,
  * Returns 0 for success and populates the requested number of arguments.
  * Returns a negative error code for failure.
  */
-static int __hsmp_send_message(struct pci_dev *root, struct hsmp_message *msg)
+static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *msg)
 {
 	unsigned long timeout, short_sleep;
 	u32 mbox_status;
@@ -104,7 +108,7 @@ static int __hsmp_send_message(struct pci_dev *root, struct hsmp_message *msg)
 
 	/* Clear the status register */
 	mbox_status = HSMP_STATUS_NOT_READY;
-	ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_RESP, &mbox_status, HSMP_WR);
+	ret = amd_hsmp_rdwr(sock, SMN_HSMP_MSG_RESP, &mbox_status, HSMP_WR);
 	if (ret) {
 		pr_err("Error %d clearing mailbox status register\n", ret);
 		return ret;
@@ -113,7 +117,7 @@ static int __hsmp_send_message(struct pci_dev *root, struct hsmp_message *msg)
 	index = 0;
 	/* Write any message arguments */
 	while (index < msg->num_args) {
-		ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_DATA + (index << 2),
+		ret = amd_hsmp_rdwr(sock, SMN_HSMP_MSG_DATA + (index << 2),
 				    &msg->args[index], HSMP_WR);
 		if (ret) {
 			pr_err("Error %d writing message argument %d\n", ret, index);
@@ -123,7 +127,7 @@ static int __hsmp_send_message(struct pci_dev *root, struct hsmp_message *msg)
 	}
 
 	/* Write the message ID which starts the operation */
-	ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_ID, &msg->msg_id, HSMP_WR);
+	ret = amd_hsmp_rdwr(sock, SMN_HSMP_MSG_ID, &msg->msg_id, HSMP_WR);
 	if (ret) {
 		pr_err("Error %d writing message ID %u\n", ret, msg->msg_id);
 		return ret;
@@ -140,7 +144,7 @@ static int __hsmp_send_message(struct pci_dev *root, struct hsmp_message *msg)
 	timeout	= jiffies + msecs_to_jiffies(HSMP_MSG_TIMEOUT);
 
 	while (time_before(jiffies, timeout)) {
-		ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_RESP, &mbox_status, HSMP_RD);
+		ret = amd_hsmp_rdwr(sock, SMN_HSMP_MSG_RESP, &mbox_status, HSMP_RD);
 		if (ret) {
 			pr_err("Error %d reading mailbox status\n", ret);
 			return ret;
@@ -175,7 +179,7 @@ static int __hsmp_send_message(struct pci_dev *root, struct hsmp_message *msg)
 	 */
 	index = 0;
 	while (index < msg->response_sz) {
-		ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_DATA + (index << 2),
+		ret = amd_hsmp_rdwr(sock, SMN_HSMP_MSG_DATA + (index << 2),
 				    &msg->args[index], HSMP_RD);
 		if (ret) {
 			pr_err("Error %d reading response %u for message ID:%u\n",
@@ -208,21 +212,19 @@ static int validate_message(struct hsmp_message *msg)
 
 int hsmp_send_message(struct hsmp_message *msg)
 {
-	struct hsmp_socket *sock = &plat_dev.sock[msg->sock_ind];
-	struct amd_northbridge *nb;
+	struct hsmp_socket *sock;
 	int ret;
 
 	if (!msg)
 		return -EINVAL;
-
-	nb = node_to_amd_nb(msg->sock_ind);
-	if (!nb || !nb->root)
-		return -ENODEV;
-
 	ret = validate_message(msg);
 	if (ret)
 		return ret;
 
+	if (!plat_dev.sock || msg->sock_ind >= plat_dev.num_sockets)
+		return -ENODEV;
+	sock = &plat_dev.sock[msg->sock_ind];
+
 	/*
 	 * The time taken by smu operation to complete is between
 	 * 10us to 1ms. Sometime it may take more time.
@@ -233,7 +235,7 @@ int hsmp_send_message(struct hsmp_message *msg)
 	if (ret < 0)
 		return ret;
 
-	ret = __hsmp_send_message(nb->root, msg);
+	ret = __hsmp_send_message(sock, msg);
 
 	up(&sock->hsmp_sem);
 
@@ -500,6 +502,10 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 		sema_init(&plat_dev.sock[i].hsmp_sem, 1);
 		plat_dev.sock[i].sock_ind = i;
 
+		if (!node_to_amd_nb(i))
+			return -ENODEV;
+		plat_dev.sock[i].root = node_to_amd_nb(i)->root;
+
 		/* Test the hsmp interface on each socket */
 		ret = hsmp_test(i, 0xDEADBEEF);
 		if (ret) {
-- 
2.25.1

