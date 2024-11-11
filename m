Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2056.outbound.protection.outlook.com [40.107.102.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBCC146A6B
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Nov 2024 09:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731316771; cv=fail; b=QkNMc66Dj4sVSuJuS+LS1xo0pduXJSC5uHzqBb4ZpOwsDGfN4WgJQBqlSqK54TRIRrAuaVfXveMlOysyRWC7DMoX7KwjO7lzvbTj+y05XUHtSZtGYnQx1jptT+4R31AajjNQQs0TaSNOb0wNeocQ38JbP+5WClNVp1dMwm+sdbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731316771; c=relaxed/simple;
	bh=j75YEiPZeILZDMeY83KaaDpuvs5UYEozpt7ReZtbx2o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AL+GNR4nUDuWFKP0MIggcWcnWXFOAVZcY76F+9/LkatfMdCWSHp1ryzPVh8XjsbBX2QTLXQq6lSmjXukZKOCo02KtiSLlxoEo/oqRG3cKnN1JYzrFCeZYZaQYSc2qWlQk4jV4Zhj/vy+9TSOk5R02SB/dj/PGiyaZuCgxQRuFC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2+Nw3m8O; arc=fail smtp.client-ip=40.107.102.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2+Nw3m8O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/4XCC5MZbNgNgTD8DfJxACEruzZu1Qr/mvWIsewSc1S6qLI5ScW55rfCo+TVbaPXwKvBW1r+p3c7enQyEVBAyLtlHzTwqhTFSFBhaDHVIC5ltcP0WCLXx5yhJv2Ks0HydhE3yv/LPQBcgvZpg3ISJG0iVUh+zYH93irs8NcUttP5L1bDNr0xUT3Oqj2OwuBlw9JUoc+IiTdYuIAkYF7t0ZDipvAwunLOrS3yWE/eDcLQdggnHB0N+J1VxBZ9R0RfnCUF8XwpxGRDuxxKDVu1ZsGz/YbN9QDRo2aD/QihhqSJDUV66E6XKmSt/GUt17v+Nd4xh3A3h907Pe0O7gPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBGmW0dcyOtDJfOq23WuVIhN6kgyxAamGAFF5PW+CJk=;
 b=DcCjTx0nmS7dzwk4dWBsqAGTTChst+v5EeTSvHTm5XddX93kTxspQObKk5/6UoTKsS7ZjFLiE22PDd2LC/Wg6PrIGtt1xZ2v7fHgRaIBWumSv2uHXdfvX9dPctiq1JN2rF255W4HgUzRj5pAk9agvjIHqld9iE+3dg4GUuLPHJPlNGQR2md44ao28794+RVLRWMf5IiIAWYxVfgvvSa8e50oYZVdUxDnsz5rxIhOsK/Omlc3jTYEfyGQxdFo2wzPHT64lbXasdwF3eWA4wkJ0R4boDuBmEH5j0lbbD3s+p+QYcZv0AuYZfu8Sz+Wmnp3OO5OvrivY5+Z2fezyY29WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBGmW0dcyOtDJfOq23WuVIhN6kgyxAamGAFF5PW+CJk=;
 b=2+Nw3m8O5YqzVzQskrDt2PW197UDc4/8tcCGzzlPGIwYsmvS6QGj+Nlc4mDyH+4BfnDJvjHE1WIPMH8gmCJRMX38POXSMW6nviwyXguOqZZoBKpuZ5WN06swSGf+71Ql4uMMg7t+VBStlKX/p4VSGN5TQ1+Rp96x4TZJmng46QA=
Received: from BY3PR04CA0022.namprd04.prod.outlook.com (2603:10b6:a03:217::27)
 by CY8PR12MB7707.namprd12.prod.outlook.com (2603:10b6:930:86::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Mon, 11 Nov
 2024 09:19:26 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:a03:217:cafe::8e) by BY3PR04CA0022.outlook.office365.com
 (2603:10b6:a03:217::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Mon, 11 Nov 2024 09:19:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.1 via Frontend Transport; Mon, 11 Nov 2024 09:19:25 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 03:17:45 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH] platform/x86/amd/hsmp: Add new error code and error logs
Date: Mon, 11 Nov 2024 09:17:22 +0000
Message-ID: <20241111091722.1565061-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|CY8PR12MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: 3123f91a-df71-4cc7-89cc-08dd0231f024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FCxacNB4lp4AqdB5iec/D+uQgyhOsS8X38Gskl5n4b7q2rsBUcKe4hOWeZVr?=
 =?us-ascii?Q?tFuhnFLVHLjE0EN5yjHejeJg5DSumOrvufwakeIErC2KOUalescSjFeKc3es?=
 =?us-ascii?Q?RhLeoYxiqWQXA9ET6A3wXM18XtJS7iO6K8L5ySvvP9ygCdoBpfuF+JOwwe0U?=
 =?us-ascii?Q?3zO1T5i0+NpRBt+2MBiJy2f5pe1MZK/7A+NR9O8zOnrm9mUINZLUTegEVh37?=
 =?us-ascii?Q?kbtRBcuh/XvyZW++KcmPrL5XYvBTpmegtTzEnhaeNNeZd3FDcU6aOZD0Jsqo?=
 =?us-ascii?Q?sheRCyAOG3fILH+h8j7juwUSyONpWj2crA8Oue4pjiuQcwmX3sIKUEnVDpjg?=
 =?us-ascii?Q?rCZNBWFC/Ddb4ch7JKxGn4j7ur+FXRra8Vyc+RI3eq4t8QMJ/25o+isVRKQG?=
 =?us-ascii?Q?8dfXCvIK0Q+VUbgDqOVaK2cPNF9vDpkmpWOE+bQh1ZlMy5gfBr+8HJIc+NOS?=
 =?us-ascii?Q?Yj19GNkKi8cPE6y85TYMprc5RFrotCVmymDme9OfL1UsmaUAFBjnWSilOqU8?=
 =?us-ascii?Q?fJgLlxGcP7VGGP4nkB4PV8KT63jYC6kHic4V8ydA+0u8K3ASRAf4lqmauZY+?=
 =?us-ascii?Q?oT/xRDiCO69TP4W16N4mKI+8rh6J9SsW7u5BfjiAEXVhlOHNKE5K7losHUN2?=
 =?us-ascii?Q?wy8TshRBNENyMvLoFVYTt6WuEAxPL62TEbs326W8ELAZgM+pHAvqqmzZbV6p?=
 =?us-ascii?Q?04+EG1dFTDTLHoMi8Cn7ZAcQgPtTBLIByocxe5cV5naalg4UARHA/BgZfYQo?=
 =?us-ascii?Q?GwDZgtLdJS7eNnkBDHm8SgRkd4QoqxDR4c/IciIkoJ6dpegQ2QDLCXbSKLz6?=
 =?us-ascii?Q?WSRQa3o83F+ZRsMNY5JBD9AJQIv+BazhHzyImyf0hGIrVOkKDeI4jvSI3URu?=
 =?us-ascii?Q?Qw+AAmd4eMB6DcUs86JXVnZaAEOJC1YECyHd0lspJq1Qxzk/ZR2vyT+62COP?=
 =?us-ascii?Q?1O+Y3uF5o1UW+440fuM9OcUyExD2Rkxy96ALPP54zEc6KhAtrakkeMdAduFS?=
 =?us-ascii?Q?njAFYayUTltKDoJ+LzOpw41/oEowWE7IVcTPLJSfKr2LXFeDPd0bxIMfD4CZ?=
 =?us-ascii?Q?N5r/QhXBJNGC6zVd2Ft3q3sjDUZL8COb7rA8nI9mzkIwcqNFgtbhRmbmURa2?=
 =?us-ascii?Q?veYjPiR1sbEdUN6YSyZHaA8iCKOeCnEhL/ocCSiESwLHmunqdrGfDwmG9vvZ?=
 =?us-ascii?Q?pd6BUVH0s9kO0SK0kVYCIwHUtT/Pp3buRJZjBztPoRrlevHJnMQQjI8BaGy6?=
 =?us-ascii?Q?ghsKE27YLZolX6S7H4mv8Csw7xiam6l7RnMNyiWa5sLi6sFiIHH8RMWCtbJ8?=
 =?us-ascii?Q?pax5toWLQp3U//CTffbQD0/+mRJZ9MAaIn2w1PajDO4gNdWS/C2MWMYeM/vw?=
 =?us-ascii?Q?rrwgoJeUQpZJO/F1muTGONFUNcdZo8eePVLOPS1MDMwA4LeMyQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 09:19:25.3776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3123f91a-df71-4cc7-89cc-08dd0231f024
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7707

Firmware is updated to send HSMP_ERR_PREREQ_NOT_SATISFIED(0xFD) and
HSMP_ERR_SMU_BUSY(0xFC) error codes. Add them here.

Add error logs to make it easy to understand the failure reason for
different error conditions.

Replace pr_err() with dev_err() to identify the driver printing the
error.

When file is opened in WRITE mode, then GET messages are not allowed
and when file is opened in READ mode, SET messages are not allowed.
In these scenerios, return EPERM error to userspace instead of
EINVALID.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 40 +++++++++++++++++++---------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 82d8ba2e1204..f29dd93fbf0b 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -7,8 +7,6 @@
  * This file provides a device implementation for HSMP interface
  */
 
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
 #include <asm/amd_hsmp.h>
 #include <asm/amd_nb.h>
 
@@ -25,6 +23,8 @@
 #define HSMP_STATUS_OK		0x01
 #define HSMP_ERR_INVALID_MSG	0xFE
 #define HSMP_ERR_INVALID_INPUT	0xFF
+#define HSMP_ERR_PREREQ_NOT_SATISFIED	0xFD
+#define HSMP_ERR_SMU_BUSY		0xFC
 
 /* Timeout in millsec */
 #define HSMP_MSG_TIMEOUT	100
@@ -61,7 +61,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	mbox_status = HSMP_STATUS_NOT_READY;
 	ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_WR);
 	if (ret) {
-		pr_err("Error %d clearing mailbox status register\n", ret);
+		dev_err(sock->dev, "Error %d clearing mailbox status register\n", ret);
 		return ret;
 	}
 
@@ -71,7 +71,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
 					  &msg->args[index], HSMP_WR);
 		if (ret) {
-			pr_err("Error %d writing message argument %d\n", ret, index);
+			dev_err(sock->dev, "Error %d writing message argument %d\n", ret, index);
 			return ret;
 		}
 		index++;
@@ -80,7 +80,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	/* Write the message ID which starts the operation */
 	ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR);
 	if (ret) {
-		pr_err("Error %d writing message ID %u\n", ret, msg->msg_id);
+		dev_err(sock->dev, "Error %d writing message ID %u\n", ret, msg->msg_id);
 		return ret;
 	}
 
@@ -97,7 +97,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	while (time_before(jiffies, timeout)) {
 		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
 		if (ret) {
-			pr_err("Error %d reading mailbox status\n", ret);
+			dev_err(sock->dev, "Error %d reading mailbox status\n", ret);
 			return ret;
 		}
 
@@ -110,14 +110,28 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	}
 
 	if (unlikely(mbox_status == HSMP_STATUS_NOT_READY)) {
+		dev_err(sock->dev, "Message ID 0x%X failure : SMU tmeout (status = 0x%X)\n",
+			msg->msg_id, mbox_status);
 		return -ETIMEDOUT;
 	} else if (unlikely(mbox_status == HSMP_ERR_INVALID_MSG)) {
+		dev_err(sock->dev, "Message ID 0x%X failure : Invalid message (status = 0x%X)\n",
+			msg->msg_id, mbox_status);
 		return -ENOMSG;
 	} else if (unlikely(mbox_status == HSMP_ERR_INVALID_INPUT)) {
+		dev_err(sock->dev, "Message ID 0x%X failure : Invalid arguments (status = 0x%X)\n",
+			msg->msg_id, mbox_status);
 		return -EINVAL;
+	} else if (unlikely(mbox_status == HSMP_ERR_PREREQ_NOT_SATISFIED)) {
+		dev_err(sock->dev, "Message ID 0x%X failure : Prerequisite not satisfied (status = 0x%X)\n",
+			msg->msg_id, mbox_status);
+		return -EREMOTEIO;
+	} else if (unlikely(mbox_status == HSMP_ERR_SMU_BUSY)) {
+		dev_err(sock->dev, "Message ID 0x%X failure : SMU BUSY (status = 0x%X)\n",
+			msg->msg_id, mbox_status);
+		return -EBUSY;
 	} else if (unlikely(mbox_status != HSMP_STATUS_OK)) {
-		pr_err("Message ID %u unknown failure (status = 0x%X)\n",
-		       msg->msg_id, mbox_status);
+		dev_err(sock->dev, "Message ID 0x%X unknown failure (status = 0x%X)\n",
+			msg->msg_id, mbox_status);
 		return -EIO;
 	}
 
@@ -133,8 +147,8 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
 					  &msg->args[index], HSMP_RD);
 		if (ret) {
-			pr_err("Error %d reading response %u for message ID:%u\n",
-			       ret, index, msg->msg_id);
+			dev_err(sock->dev, "Error %d reading response %u for message ID:%u\n",
+				ret, index, msg->msg_id);
 			break;
 		}
 		index++;
@@ -248,7 +262,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 		 * Execute only set/configure commands
 		 */
 		if (hsmp_msg_desc_table[msg.msg_id].type != HSMP_SET)
-			return -EINVAL;
+			return -EPERM;
 		break;
 	case FMODE_READ:
 		/*
@@ -256,7 +270,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 		 * Execute only get/monitor commands
 		 */
 		if (hsmp_msg_desc_table[msg.msg_id].type != HSMP_GET)
-			return -EINVAL;
+			return -EPERM;
 		break;
 	case FMODE_READ | FMODE_WRITE:
 		/*
@@ -265,7 +279,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 		 */
 		break;
 	default:
-		return -EINVAL;
+		return -EPERM;
 	}
 
 	ret = hsmp_send_message(&msg);
-- 
2.25.1

