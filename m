Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="udY35Tri"
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 897F89F
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Dec 2023 02:38:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ej8iQtH+JbmGSyrhbXt22bLoNgL3B5X6Db5TJH/W+jPwXThW5pFPxY8r7n4VzeFBbYI9vkW15Lnj1/c+ycRZGz7Zh1hpsQSH/lbJ5o+gsoAdwIIlKB3Vgacznmi+FHNBC5CGDIG3xyJsF/0iQSwPJZ0GI1kuRCSW40PSZLIpf4NEVvKUqepvqWO0oIzyjrqqBo7O+Xo2wXAtxmA0ALal6o3UKF0FNdgGTLiKl0cFTk2N6REzJYdiOA8++KhpaszBg5HN8bHrV7DeEwtlokpStUMAURzuNWvnQK0i4LuVqF1I3chDRa5AKN0OxqPQg1+5TqLrcOrKubSvTTQ36Q+GIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1N9Fq8XjPtuGZLbqTd8oxLVcVQA1kA+IZLu/4tPVQo=;
 b=PEG8j39ufSO+yHyskG7+XmPaRAVejvPEo5FC0/OCvjM/FjjmVMPcWoRIADwVqBs4TR9NZoezSW4aJDy0a16i6Oh74lmSrTJuyCAz/2UqAkDMDWJYwsjYFilBjInHEb+RSrmXGs3n8ARwRpkzar1cwRp+v0muFaiIHOhAOJ8MOv8Y6iv6BKltObr8urJULnsWvxTkmZZsAjuo4iM5kRJgvpquegot2KLMA4qAXkNBPTQgS3KfLmjduMXGijVBpw9tQjv3qFHN5HOGYf13Rl9sn5S4kpTha/20xJzh7YP9iLy7tspIOTnAvj3iek0xdGY/sWY2qptkDoLxOuoYsOcZ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1N9Fq8XjPtuGZLbqTd8oxLVcVQA1kA+IZLu/4tPVQo=;
 b=udY35TriINAp+1v7KfNMJA7x/LRABcGT8LPh3q0jtLwLE3EtyxivZoRjzZ6jl9MsAkhhFb8QdgtstPASKKKENXNYH89PKse+cavZb0I4Qu6S3Z4eokpkyojBQ3TquU3fnSAOteaRRtg7a6D+dyMoO0BBB2T10lkiWU+rWOcGWxs=
Received: from CY5PR13CA0009.namprd13.prod.outlook.com (2603:10b6:930::33) by
 MN0PR12MB5955.namprd12.prod.outlook.com (2603:10b6:208:37e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Tue, 12 Dec
 2023 10:38:39 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:930:0:cafe::f1) by CY5PR13CA0009.outlook.office365.com
 (2603:10b6:930::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26 via Frontend
 Transport; Tue, 12 Dec 2023 10:38:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Tue, 12 Dec 2023 10:38:39 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 12 Dec
 2023 04:38:34 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 2/7] platform/x86: Cache pci_dev in struct hsmp_socket
Date: Tue, 12 Dec 2023 10:36:39 +0000
Message-ID: <20231212103644.768460-3-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|MN0PR12MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b0b998-2e16-4276-3d79-08dbfafe80c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7W0EYu9SnxFQ0aYDGJUXDAY1lAKzEXPb8ip6Jw9pafUaC33cCRzM8tWlibUY98y9pRkZhlrDZyLeHS/aicCWAv7dsGtSnGEyekfZU3o9M4wPNl3Sus5Wpl4YhNDBKwKNfv+3u7FZT+mLZR+XLMmsyUPdtMXmVsJENxS+1ivb+rc1hfaGpdXBQ+8AjBmfPhkQcLJTPTysv1sCd897ztU5AO+buAtqs7h0y4w6A7TVYYp8c/TM8CAlT6jeKctwYFuRBKi5kpAcQN6X2xpD+uzMRIZoc6inOiEP+po8hOjkSe79a3ZGjkU9PG530QROFaK2JeQZkwUB+YsAiR89N3iT2icw4dBvyVtFxzR4Km3RiQ715QMg6gdQPyxJhFUJegi6Q96dw4eZ9wUAt7q+Ord7Se5M/aS7x/0HhrjW9A/xAw92UzJB977RL8Loo59AmkSrx7CE0vVFXC4eWP5Hh8lj6shrCEYLE+zC1SYLDCBPE/ytsl+H0MgJFR8sTnY2DmoRvwzRHgRQtH9i3xlh7AWx1KefOfMRinr7hvUAaOKi0rG0F2gN5L4srQFHis+4XSuboDCUWyAmT96nDvhjOYdK4+tcsN39tsfRHb0cJRgwHuwnyCuQZm2tZ+1zuLcXWblNiXNQ46QepvBxYO719lIzN+SUymaqmKtMMFdhwOf1dACRVQG/9a7NA3X4FzY76wgx1c7IyCl13lAmbn0HSlWuzMrkr036AcxjQ7wNVX/hM1ocBvYOZD5qUeo/XowPSdZSt+bborepNUnXQozzdt4FjQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(82310400011)(186009)(64100799003)(451199024)(1800799012)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(70586007)(70206006)(82740400003)(81166007)(356005)(86362001)(36756003)(36860700001)(47076005)(83380400001)(26005)(336012)(426003)(16526019)(1076003)(2616005)(7696005)(2906002)(316002)(54906003)(6916009)(478600001)(5660300002)(4326008)(8936002)(8676002)(44832011)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 10:38:39.0682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b0b998-2e16-4276-3d79-08dbfafe80c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5955

Cache pci_dev obj during probe as part of struct hsmp_socket
and use in amd_hsmp_rdwr(). This change will make it easier to
support both non-ACPI and ACPI devices.

Also add a check for sock_index agsint number of sockets
in the hsmp_send_message().

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Co-developed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/platform/x86/amd/hsmp.c | 43 +++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 3c17b488f4f8..62a274c84f25 100644
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
@@ -208,21 +212,20 @@ static int validate_message(struct hsmp_message *msg)
 
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
+	if (!sock)
+		return -ENODEV;
 	/*
 	 * The time taken by smu operation to complete is between
 	 * 10us to 1ms. Sometime it may take more time.
@@ -233,7 +236,7 @@ int hsmp_send_message(struct hsmp_message *msg)
 	if (ret < 0)
 		return ret;
 
-	ret = __hsmp_send_message(nb->root, msg);
+	ret = __hsmp_send_message(sock, msg);
 
 	up(&sock->hsmp_sem);
 
@@ -500,6 +503,10 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
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

