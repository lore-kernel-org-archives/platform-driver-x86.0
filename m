Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2080.outbound.protection.outlook.com [40.107.212.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D9D1EB3F
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jan 2024 07:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Az56a75I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8TprNX4z7pa00eYz2BS1QsL3DFsbKS4VZrccarbn8bmfsKIQkUb224VLUCkWarCtmGWVHJNJUj+TVmxkfNnXVadLragrvVO3CSKpIwzQtwRzaOySenNbLU/Cu1DRM/jA34l0yrE2pQSuBMUPGZmGGxiwenlUs8j4LXzswCYxs0FEBF50rwwpvwdn/p6O+PDz6L2MMV4Sy72IQeMvcOXmToUKknFl2heKkcWZScoLRaMfTlke/8M7U0LrnlzBDDjt6soXob0GD0l3/YnZIaYwPK5BWVCOr/aODRqH5mCOOXHe6PaZinxnnSXMqeGNiZsAD9ij+G1BTpWRambLpcK1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNQKpXZFbpLR8GwrVVsVZUGdxUoi7S7zpLYSzyQcmCo=;
 b=QEv/+t4PvC+zP9RY8PwdWFrdfMJuFW0SckMNL+LDtrRx+ATPs+pe5xhO411cvP/i2W35xvJNB4X7bZKNhnFeD78sISH8mY4nZ0v8OKwMVC4BI+1Tv9CxbTzDhmNFqwtSgLkwdh00jk5QG4BEKD+YN53E85CZ9fe9hLz+6KkpSNun7PzJPzjW8OWrd0jGDUZGPUT5B7aK47PKf+HXOXdbyCxbuMBFhq3LdrE6USQJ0MOMpfivHkZSghIS4Rmo3ZPBd4UbQ7QdYA/teLoEwN2SxawOxI8EvfQb6gppZJGdDCt5ZQyeosXQQ53zTBjuL+k/WWu3OeGZ5gUUNTJ7wTW+dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNQKpXZFbpLR8GwrVVsVZUGdxUoi7S7zpLYSzyQcmCo=;
 b=Az56a75IAeEfLHRj7r13/5xDb3DpdeVaF3t9OG3T4JVr728v8NPksSg7t2loEXA+z2bo1IWGiOIQ2QmqCCgjgYaL3OXTYlh7a7yuMxq6lVMfWKOALLSCglfga2DlSW8RK0IWgpivT0GJWFojDqy+q0SdM/ShuSkIKf+vDjk4WEg=
Received: from BL1P223CA0026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::31)
 by DM6PR12MB4170.namprd12.prod.outlook.com (2603:10b6:5:219::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17; Fri, 5 Jan
 2024 07:46:48 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:2c4:cafe::ab) by BL1P223CA0026.outlook.office365.com
 (2603:10b6:208:2c4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13 via Frontend
 Transport; Fri, 5 Jan 2024 07:46:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 07:46:48 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 01:46:45 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v4 2/9] platform/x86/amd/hsmp: Cache pci_dev in struct hsmp_socket
Date: Fri, 5 Jan 2024 07:46:11 +0000
Message-ID: <20240105074618.1667898-3-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|DM6PR12MB4170:EE_
X-MS-Office365-Filtering-Correlation-Id: c9549128-342b-4978-bea7-08dc0dc278cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dWsTjeMvxqM24nzchcoDAcM/Yyn31fHg4el5zG34HZ5wwXoO6MUJC324EWzNcAz3rJLicZMLrWXxaJs7RMcSP9IHs+VJDNahkKbjqbHvLMaQxkJl+2E94hFjVAl2IiHnGJt+9+A7YzTi/191Nf5DnWfN0LZVERMF7faEbFeiEUMcyrWnVa10uL5uBEbqnujqDLBasUgCHwX8vOCEtSEGdE6K7STutJesGCvgzqSYbEQ+foKtUVM7lorwONLOiahdgqlarB8daMEjSfMIPVtpwry5OWEO0EON/7Tbm/PInFidKR8ZTpihK86NwJLnx95CIf4MM5G8suzUYRN8ur9k5EFMPpuROups6LQ6NPm3YC7SYxrIeTdTSn53eMXdcAjYtQfT4Gmok+CO7TskaW8Hq8wB3DEmh5OzgI9TIUWTFjca4iyT1RQGZZYba6xgMWrZuF7w95knI8weRKJ75BY/bh99DbyWOp9TmkV0N14E0gzffWyChjNG58HBCigqQ00Hg/wD+sLlcolPwwI5XUqVMBHa1L+XYlLvT89Eq2QJlKqH8fvI5yAm4kdIKDVwPlF/qW+/MkXtVDx3A2d+MxJc5a9WpO/UTEVCF4EYQwC6wFX+WgM6VqAGSLVOQZetKSM45TmWqGgE004c0zdgq413NWvWe3Ksq1LS4vRPHzkhoAsBrdwvMiiUPzt9v+dTGJNlI+XeAiD6zoaexR3hmB0RrELkTYbh//kDZdgdmXjRFogW40e3r/gdZojKT3FSIygKO9aeKvqv6Mgq05Cdsf2rsw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(40470700004)(36840700001)(46966006)(83380400001)(2616005)(6666004)(44832011)(4326008)(82740400003)(7696005)(478600001)(36860700001)(1076003)(26005)(426003)(40480700001)(40460700003)(16526019)(66574015)(47076005)(336012)(316002)(70586007)(8936002)(356005)(70206006)(8676002)(6916009)(81166007)(54906003)(86362001)(41300700001)(2906002)(36756003)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 07:46:48.1152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9549128-342b-4978-bea7-08dc0dc278cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4170

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

