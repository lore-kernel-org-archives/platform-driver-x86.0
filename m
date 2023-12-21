Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD7E627E1
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Dec 2023 17:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="p++BnN26"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fo/mBUx8dUA3n2U3cPoP+lkasqzuEKWa3H2cBaEiaxesXSSjNt4s07NE2xOLPvDIQaAZfrCP1H4QFVzLb9VdDTyuAPPXX0XrmDVM01rtKqXIr92nGEunpUPhEBqpinpGYemFkA/nV0elH/BR650Cv2qioWsJ9nLp+Y46bSQpGR7SBeSnRG4QMNjt2mx0b5vDCRmghkwzHmE+sqcpRwVVAuV7XSjsuSH6K1ghs6zsNJga1HYMDZmdRPyEliZ2+9mi9TnKmsyfvsYkNkLRuvpq4zEzdAVcJAAewkoeY4G4eRomgBtfqZwmNekyEiQ/GrzC6fdj7Lv8DHfEGUhsZyO97w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOzCvljPpKVVMpSlQskiKHcfhF11OYjqct4kYdKfY2E=;
 b=CIVpU0h4L0f6tWvlBG6S0bU+8aV/d9AuNTXtLEJ6fSajHpFz+jDyuzd/RHbdzRMTSx1uZ7q6MRNx/5KVGEsb69lNwyKpgelqG+CGhoT1sc5NaVN8jE4o8lPDnx2tTFTnsjX0HKWDOKjtiURR9HIpd/+Us1ZlC5cBH3SWkT0+1pdB7ZjVYPO4XZerhkj7ZpFUuuq19r0TF8njxVkCeOgTu5NzJBizHpm7Mb3bj/36YiBmhddENU/AYe6SGD21IL3XV0ndTRzMGzwomvfVl+1JahGAkH0QxodAngxS5gGTjvXh2DHp1Ae5sfM9Z/UV+lhCF0X20qy4+BzVxPPYFQueEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOzCvljPpKVVMpSlQskiKHcfhF11OYjqct4kYdKfY2E=;
 b=p++BnN26ghCmuidChVCWEQp6UxaDIay3kEtvSlilFE9NO+ODbyv2R/lVAmPO/5Kn2UPlqdeVKwDihR/IadVBhA6TlpLByB0lfuKyB4JbOkFP7Jl/v0vgdYQU1o0NjivrY0l962OUl+jVg/6XlxzWvh4jEnd21bpd9t8XODfyfpE=
Received: from BL0PR05CA0005.namprd05.prod.outlook.com (2603:10b6:208:91::15)
 by PH7PR12MB7138.namprd12.prod.outlook.com (2603:10b6:510:1ee::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Thu, 21 Dec
 2023 17:21:40 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:91:cafe::2d) by BL0PR05CA0005.outlook.office365.com
 (2603:10b6:208:91::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21 via Frontend
 Transport; Thu, 21 Dec 2023 17:21:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Thu, 21 Dec 2023 17:21:40 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 21 Dec
 2023 11:21:38 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v3 2/7] platform/x86: Cache pci_dev in struct hsmp_socket
Date: Thu, 21 Dec 2023 17:21:09 +0000
Message-ID: <20231221172114.1569559-2-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|PH7PR12MB7138:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b2805c2-6882-4b4e-66eb-08dc02494b86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xBwFHWhqIwheZ65LyIanYJIZ1ZDigGJd5M0C6yZCT7TCpf+Hg6XxYT8w5z8TT3NncSIKM0bEvt6SDePtNH8w1X4bdgUEqcuwrxMvfQknQzi2Zn1Ga+ctphwlG+9w/V86RSJLwXmKPrpUAZf6ILE6YWT2wU6izJQOWqZ9o2BPE8cun1V3w/NTAqy70jEIeURy4PhSpfM4+/9AL+334kPO/qpdIzeneTjfjpYkKOrQj16BpfN3ZoT7ioKraxntq36BlTbRva+UANKGAR+OGjasMnc14qvuobKeZDDMo2PNttHksz6rhtapczr8iN1fmM0xTG3DD5wU1x4fIQMkTKWgr0d9yfzij+Ubzf6BdluOsKF80ZOCfCu/libWoOlKLoHDe3YElqqGK+WV3g60vwo05FzglCCG1GtCtr0NuYvCc4u9lAkG1Y7zIP6PSOdP5W3J1j5rthypB7qWk8D6/P0ADWDsnWYci1/dMY0VSRkGRiXEtbWoTDZ9Bdu+r9B1yD9OrK5OtikXXmfP2WUIm5qn0z9AMkbioQhuDVijTQaVn0bfT+AVHq9E1D/6xqz6oi7cO6sFvHf8zk6m2MhB/jIlXeaSPfRVsxzjHmii5EzkeLH0awkVH4u3wJs2inp7jIRB7cxwPa16XnjRYlEsUpUfvi6QNESeMha57Md68AuJuQvLynEm808BN4Dvi4XIatczXYXoqTY0G3quHuMVu9z9ngkHJ2H+b/BDWRJUl79SflEbePPH4EieW22GiUsTR4Y7nBas9Fdzuc4Hli7B6RMuww==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(39860400002)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(82310400011)(40470700004)(36840700001)(46966006)(5660300002)(66574015)(8936002)(8676002)(1076003)(26005)(426003)(336012)(16526019)(81166007)(40480700001)(4326008)(2616005)(44832011)(83380400001)(40460700003)(2906002)(70586007)(70206006)(316002)(6916009)(54906003)(36756003)(7696005)(6666004)(47076005)(86362001)(478600001)(41300700001)(356005)(82740400003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 17:21:40.2422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2805c2-6882-4b4e-66eb-08dc02494b86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7138

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
Changes since v1:
1. Remove !sock check in hsmp_send_message()
2. Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"
Changes since v2:
1. Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>"

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

