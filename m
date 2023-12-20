Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2055.outbound.protection.outlook.com [40.107.96.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A4B4642E
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Dec 2023 16:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r1fUQKXB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqKRZPNLGrW7w30CpalVflKg07FynfpiMQTW4uNtVxquALwppZ9OPj7eVMflyyzc8MDk+2g55Nd6zH9G0emNzRuLBPpLwJzCFVv1uPddK6R+1lR+rimDfIFUtM7zJKWxgRhXfL4QGA6ys6TgFDedOZ8u5Qkw8CPHddbhwOzcMu1BsZR4mYlMsLEG/pyU1T7KyWIGPc6Tg0YPUZpsQXyjSZG0Zm0WyhSxLYLWKjQ58VlAevl6NqCctFAL4VqoZFmAJbXWauRweOTB0RQXBy/RYqNnuMO1Q5PGuYudnLigc44Pj1jnY30pQ7T3QOvNwRIJNmcAPE0ph+cj6hWNQSoNAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRTBqENC1AM8W7u4sYCcAWGSw9QlIqc5tiqWVbrhIHk=;
 b=RgTda7d/qsTYzEbt66S8GY24m0Q3YMqyfIpvOL+liuCka+e6EjRnWZiw5BB2BCZPrcs0FZz88Ttu1k4VOCAl+2/EjZhQXY/aNDinqHkv6X/FtOrs66By4uI5EC7nOlXgNy++fg/ZKfkgfXtU+UHOMMryXzzLK4GMXVUZK3ASv1Goy6v1ES22/ri9G0rqLAQa8KjYUyzj0VNR2dj7RLsqcUoUZl2qSeniEaZ9IG1qslG62cL/YTHaunL3Doe3FzKz8uVaysrCFtdSGVu3+eoFP7rSj2xDGtdTOfANKWMq047JCm5oSr2K2DhlhP074WPbn5UcwAFzxTV5rbGcBz6J7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRTBqENC1AM8W7u4sYCcAWGSw9QlIqc5tiqWVbrhIHk=;
 b=r1fUQKXBrx+R8p5bXNFACBAv4hoVUHDoBz9OTXWHQvNNT7M4WQxZpEKAP1ox/E9vxC+ThZmgfG/vH4weIkxPrtTd4uGtEDw1chpD6BkjTBNZAUh14nO5mTkqjOtMEPw2JbLAeNLK7s6PuUaajCtBuHAg81YgpCuzMoIyrQrlgKk=
Received: from BL0PR0102CA0062.prod.exchangelabs.com (2603:10b6:208:25::39) by
 SA0PR12MB7461.namprd12.prod.outlook.com (2603:10b6:806:24b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.18; Wed, 20 Dec 2023 16:55:50 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:25:cafe::54) by BL0PR0102CA0062.outlook.office365.com
 (2603:10b6:208:25::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18 via Frontend
 Transport; Wed, 20 Dec 2023 16:55:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 16:55:50 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 20 Dec
 2023 10:55:48 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v2 2/7] platform/x86: Cache pci_dev in struct hsmp_socket
Date: Wed, 20 Dec 2023 16:55:23 +0000
Message-ID: <20231220165528.1351200-3-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|SA0PR12MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: ffc467b2-0405-4b43-ff78-08dc017c8559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eMXJiScnLiw4u9AUFBJaJyIqduqUI+9jy5dnlSp7ZLTZPldo7fcUiZgM4SRgNC+PaUH1SVE+Fb5dNf4OVOSiWq3Ta2A3fBwk3UfuWVwqb/cpqvscclOxrBcdUten817BKL+ScEkujIANM2WaOueGHdTFpEJPFJ/JytJmkqS53qjRn8m0ibO2jCxTTb1/U1A3vLAjTOXTY1eZBhVaBBXSnaHJTPETRj1J9iyvAxTBGo6O7RVhnpgmuyfeXUsfQVZ/B9YytoEfE4YH9YgT93262LK6PSleJjy421WmWY01AfmpgUvpSP+CdgcYZ7fb4PcbO65F+hBVerXqAkaZX91At5bxY+LWwJuIMk0GWYAcLcRcTrN5dcNfEP5dDoiPMUqWVeDvn9xcwBGY0vQSv+lBvrL3WSXi1QOKRqVkjoMvf+v+xmC8ZEqRLrBwlIT3yQ1tnatBt/zx3IQgmEuer1L0Z98xYpH2mexoQN9Ub20jMAzSN3uekyPMv0+Bq1AsgKKmV5uzbanh5sradEki3TrxW/vikliOzVHIyTu6891BuADGRLLIqaUAiXe3evpGtqXIcQjp8zUNt4QmQsvSJ/wBHHGiIAAdSkQzudTnwcCX11hORRyEPhGXOeuA+hG8rdd82XYubhA+duYlAz9MD3gUl8jjD/Wi+wd8nhzfW+iUbJtzoBMmUdq92fDgNfe/iixqGd/tqlFzOEVKWZPUYFPB7TmDazOhyLWDGQp3zMOApTCoXIEdyZnZm+720jnbaiEgCkMyWBN/FD9ybSv3fgIlbw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(451199024)(1800799012)(82310400011)(186009)(64100799003)(36840700001)(40470700004)(46966006)(36860700001)(2906002)(47076005)(41300700001)(86362001)(81166007)(36756003)(82740400003)(356005)(6666004)(54906003)(6916009)(8936002)(8676002)(70586007)(70206006)(336012)(426003)(16526019)(1076003)(4326008)(5660300002)(7696005)(26005)(83380400001)(2616005)(44832011)(316002)(478600001)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 16:55:50.4139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc467b2-0405-4b43-ff78-08dc017c8559
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7461

Cache pci_dev obj during probe as part of struct hsmp_socket
and use in amd_hsmp_rdwr(). This change will make it easier to
support both non-ACPI and ACPI devices.

Also add a check for sock_index agsint number of sockets
in the hsmp_send_message().

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Changes since v1:
1. Remove !sock check in hsmp_send_message()
2. Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"

---
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

