Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2082.outbound.protection.outlook.com [40.107.96.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465FC1F7785
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2024 12:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731413145; cv=fail; b=LeQAp1X/vGTKFm3bHquzq7B6LXxGOTsHVZMdzrSLhZgapqSx6ECaBeoB2NZpmHvYNNeI9KOXwS88XDLTO9/Mp28y535vtFCCRuu8ZWeoVYxt3R9qCen981Iv/gLxc0GRumTJcwOMNx61IlnNFe3FSkMVt8C5F+IxZr40weKli+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731413145; c=relaxed/simple;
	bh=uHar14TLvBTK9oahdYL04rGLPEUfcIOtmM0q3ZsIhzc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PtBupDbMeX0jdAD2sXztTy0gDQaaKxcH7ufBGmFW9X28zFZOjPHnHmKsKOZ6A3cK8fjLIlMNw9DcqcBUz++q+vr2sKwZv7S9oGKKFalzMnwzrCsGRXPCnN2kXU5BrtluEAmZE8t6JD0lt9Eyiagn8h/ZU/FsnlVUbTmssHaeYI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MnQYOjSq; arc=fail smtp.client-ip=40.107.96.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MnQYOjSq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTixpgC32f3zDZbgqVl+j4AeXNw0vbJmbX5VYKRpipqD2XubWKnNC1P+M/QT+4U8J8e/nRF2Vt0Eo1iQoEnmk/P3jgKqozRjauajANPlsfhJ0x0db3GYLbgoeXLTWJSaW1fDhWS3Z+RmMcOH2iu2Ze7FDRrN5k+VKukBadRHu/SArnHyT0YsSpM2zn631FGx55EDBuVRI2sMEHk6yo9Se7nNCHdQiFcu9ckYxTPdC5ky1Sv9L+dffyUV39YugwYpCUHRcL8/GgDrLmf7WGxvYGkXiYruf9gRC1DM1mkMsx96XnBuPQ9JcuPCKBIG/wRiG29u2DIlztfEbJrhwbtHtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxdYHHDEjlGCOOAvAIeefxAKH3G2HyDyqQimqDi6cGs=;
 b=oPRhPXsYagXEQ3FhZ2g3VZ/G0ZB3x+Jm7RD7UzVkgmgVou0oAC2xZQPC3Tj189NVRrsth+LnUDCZVhVr9XMBWkczxC2xqTl6Sr8Krkg2Qi4j4hWbT42kcyEsyfpbVGu0JzVImkrWrDnWSqK1DGG9ONVSHFbujgZG6DaAsRcUcr0C3wcTehUVUFYf+UyUc5rMZ9GDG1RP9qgifPdToxVV9p23WnHXSS9Vv+FLJdelEekj+VJwmh5CQgpJI6Q2tlkQkwx4JQfMQsXa/T8hn2IHVYlkP50FROJWexh87QOO2kxSAZU1yVByVBOUuB882LsFUgFcNga+VA/3D9C8Q6h6PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxdYHHDEjlGCOOAvAIeefxAKH3G2HyDyqQimqDi6cGs=;
 b=MnQYOjSqw2leO2ENpbkuZ/IxA7G5YBVRBvH2wm7RVTBdrMG3pz3z4+mB3ie2Z7VdhWCgX54mDKZz83LmSgdaBgdlRa4aFnkfM/xbMQgYnlHZHNMiLAEN67a+4SwKxebojSHMpM1/wPhDIWx7ODG2rXKwm4aQfULKdN5VKI96+mA=
Received: from CY5PR16CA0016.namprd16.prod.outlook.com (2603:10b6:930:10::26)
 by CY8PR12MB8265.namprd12.prod.outlook.com (2603:10b6:930:72::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Tue, 12 Nov
 2024 12:05:17 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:930:10:cafe::fd) by CY5PR16CA0016.outlook.office365.com
 (2603:10b6:930:10::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Tue, 12 Nov 2024 12:05:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 12 Nov 2024 12:05:17 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 06:05:14 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v2 1/2] platform/x86/amd/hsmp: Add new error code and error logs
Date: Tue, 12 Nov 2024 12:04:49 +0000
Message-ID: <20241112120450.2407125-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|CY8PR12MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: a6baa36f-bf72-4958-b6db-08dd031245d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TJmMWNZlU3uy+Y4AkdNHIGveIOPb/v1r6db3Pfnr9ermqAmD9uoHregWOMek?=
 =?us-ascii?Q?OsoZP85/04DCWGCXWKXpAJr5ndm8WWE6LeWLSvv/zTf8rOzy/CkQKBJtiLF8?=
 =?us-ascii?Q?9Zy/sAbUH/ljLUIHf9jJnOY0yWV1ZPxO1ibhZcUplecBbS1EULCjy5rUBfFf?=
 =?us-ascii?Q?kRvC8kTZMO7xbVJL8fbaStFEIU3FyajKd6nGkbvouxdawICxRGodyO0reOXm?=
 =?us-ascii?Q?vn+Z9Y6b+1+n9cbjmy/ohbOAfkYWoUFfL1zMq7zJf7x8wI5YyYxkbNIF6Quo?=
 =?us-ascii?Q?UdIHqSLZjYqH4wjW6mU01H0WZfUOI7m5Hjzj+QLjEwwOShkm5bqtYAI1tHmx?=
 =?us-ascii?Q?nBAhfEv7jOF+/IRB0TPNGv8QhDoi4ybZdBu72/A61ZQJEf0TEptPwKEq675u?=
 =?us-ascii?Q?gJl1GqF9ZzQ1KeOe2aPzUaxzHKxB3IGt7JNlzmlFRN5CNXvbsNsXh0ckyyc6?=
 =?us-ascii?Q?KRi7smHS0KtLHgZD1c8Dh2+VwSmFPvmBodVdqVy2VtRshdmxx2v069ooxTLl?=
 =?us-ascii?Q?Yy7scyT8DYBjH8TJ+wP6RA+SQ8tRVNYAy+JQiTQlXF/wDG1gcO0S532XfyhV?=
 =?us-ascii?Q?vDG9qoOhKZ18YTIcK43b0g5eFQgDxCXYRr3J24hl1TUU+0RSzPwXAU3WVRXM?=
 =?us-ascii?Q?9GHNbWcKJZ7ASlRRPtB8bTMKaN23jOyRnBCvKjknNgR9GUbWAznYddTOe3tX?=
 =?us-ascii?Q?hzBTpQIRvzvQd8qO/D0Hq9r64sfLdkWW0LTIqYCU51deF6yqGAyLu56Q2C0i?=
 =?us-ascii?Q?757bXcZ8m9k0l12JB9BQDsOByx50sEW3x2xvqOTEp4oelIuNXiJZk05nZS2g?=
 =?us-ascii?Q?w2rSK/dG2seX5Z+AwF7SlPoUhkizTlFNKSqUoVbvYVzgMs3m2GLrc1m1g+zJ?=
 =?us-ascii?Q?xG8dpWlgdjtr1PfGf+VSb2kgs5SeTj36ZEtAo6l1RKxkcCx80RX3k+OyOE74?=
 =?us-ascii?Q?fL4lSVPtIq5jc/3F5dvzTIrVFc80cx1z6R6nYFtbBFUegL4hQBYSdF4kFlme?=
 =?us-ascii?Q?YHnvQ397mQ2d3RAAMasdmwSF/0n4ucq2ui+z8dDcwijIW7mY9VOdXMAY/tmL?=
 =?us-ascii?Q?4vY0sbIDRwcIWQ6HPM71iFVf/pknNUnnOL0uUESLABYCXdF8FslBCMgoH3ZT?=
 =?us-ascii?Q?apKgGRMtto52l4TyaiIM6gz2QOr+oj0Ko9XWdT93tqImPL/vznkSoI+f/+0k?=
 =?us-ascii?Q?WwwAse7RFjG8niFq6u804qBSar2JwFZzoTj9hplsFU2od+ozhbrNbVXaTtQ0?=
 =?us-ascii?Q?B9mtmebrWUZY6NCZLzg1UNSk8Ae9bhnwCLWgkfCOxY4wi7lAQvZ4m/E19W3b?=
 =?us-ascii?Q?U9gLZP8bmc1HLlxRqnFWx9+htSV5gjDwAW1ylRKL99cM/w4voWjJleNbl4ho?=
 =?us-ascii?Q?/4bMxstsmVK0fkbTZzi5rMZoSucNdPraukNbWGZz33GGKjJyuw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 12:05:17.0426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6baa36f-bf72-4958-b6db-08dd031245d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8265

Firmware is updated to send HSMP_ERR_PREREQ_NOT_SATISFIED(0xFD) and
HSMP_ERR_SMU_BUSY(0xFC) error codes. Add them here.

Add error logs to make it easy to understand the failure reason for
different error conditions.

Replace pr_err() with dev_err() to identify the driver printing the
error.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes from v1:
EPERM error return code is moved to next patch as per Ilpo's suggestion.

 drivers/platform/x86/amd/hsmp/hsmp.c | 34 ++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 82d8ba2e1204..ce91b2cefca2 100644
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
-- 
2.25.1

