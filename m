Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734CA13C8FF
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Aug 2024 06:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724911635; cv=fail; b=cdqoSCecsY0n35FNqNkuSINzaN+ByO6QJtEdsmFiQtqrezrpgLt6wFMPVFCiSDAyvfiu0zQOvDA/Ox+ykiMImNvpuGkrMGXx3C1Vsr6ljrW6i4pSvILFjDhII/U0cJym5SZhKkhYTMJxNRnzjJCFPVGi8yHUOgdEGEM1cwEy+BQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724911635; c=relaxed/simple;
	bh=Nj2RmzBeLxCEZmCx3jyJ0YmkVWi3RIwRGgCAX4QoLS4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aBdWiJQUO0zwnKhS35NVBqDakngS7a1SIBGzWWQ6Wv/nz5fQ6swu3Y3T8gE5hDRgVsv/JHWPYPc/ML6caJ6esi4uAIE+k+dQe+Txbd5RFsaXdCGykVXWOhLxD1kiYaG0c/4NeBC5F4U4lOB9lzj2NMOtDpC2Fzdt3D/2yPTZ1Lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dHkgFwsN; arc=fail smtp.client-ip=40.107.93.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dHkgFwsN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z19XqLTn1sxFj5+e9jaBX/bIQlCOBCsyc34URWysDFeEIiJ5hbhkSuO5RH0Lf+v2eXhWQ58tTsaRHGU7LnVONJGhzpEljYsXIlhhUygdS7zsGF+DqB1DlZl4csL0olfy8srsAPGZb3uhmGFr0qF9C1eBcwke+mK4xB4x/no+aibTWffnvSK8RsaxuJtK3j7bYTcUFbXweTpExZfON+aT2wU2aMlTUp85kmVvZn1095+5d9ZRdKQ6r3KGLuZ2BU4GMT9Ac8Q9//niYPoI+z/hkqelQHLOPIrMLdOJ/AdwuEF0iXhQwBShlcdArXK2eVQbex5N1eX/xlDeA6mfJrJG2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFcHCTrXo1gj3rxkf8bkcvXiYUSF7kCl/cNHqppwu44=;
 b=Q6+xDO5NEJ4I7HL5Bu76ot6uVB5ZGjC0V0LN8arszAdeFxgn+ixrNLgOeY9FveXTjhvZFfqD+Uiap5W79IS3LUqpGiXgRQ+TrW8Cg4+E7gE8ymI0MqgT8vQyRjkHN3ri4y3yLxzW8AoXS2HENtIDwJKJ4+09Bvpc9FsUL0xw0wtdCr2e6ZMkXmTBUDd3sMeFr1sSMTsIc+TTPmoQ9PA8GqgguQIS39CEFjd5uZdQ9yhdFWn+ut8czQBAJZ36l7BA/jIGTCrY3aX6b6FPbOIhdxNLxQUHeCequ4DKZ27z4d5b6iLuTkfNCqJsFU5ekMAuRxaKtrT5f3xVnvCmp3t8qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFcHCTrXo1gj3rxkf8bkcvXiYUSF7kCl/cNHqppwu44=;
 b=dHkgFwsNxAD83Nr3/vFRjVOOcFGd2rsngL9Tq1CGtrnzmCPPr4H7OgmENaC9HmYODLN39MxlIvP/txL/5Jg/kL3cP8HqqyxDq5r8XQDTjkQyd2EIDDnxmtqt01VKBHuG1NwTtXdDMtJn7+1nrEQnXQiHDPluqlNuyGDjsPf/XT8=
Received: from BYAPR07CA0091.namprd07.prod.outlook.com (2603:10b6:a03:12b::32)
 by DS7PR12MB6022.namprd12.prod.outlook.com (2603:10b6:8:86::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.26; Thu, 29 Aug 2024 06:07:08 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:a03:12b:cafe::56) by BYAPR07CA0091.outlook.office365.com
 (2603:10b6:a03:12b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28 via Frontend
 Transport; Thu, 29 Aug 2024 06:07:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 06:07:07 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 01:07:03 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v6 03/10] platform/x86/amd/hsmp: Convert amd_hsmp_rdwr() to a function pointer
Date: Thu, 29 Aug 2024 06:06:00 +0000
Message-ID: <20240829060617.1548658-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829060617.1548658-1-suma.hegde@amd.com>
References: <20240829060617.1548658-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|DS7PR12MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1e6944-3220-4185-e7be-08dcc7f0d03c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGd1cm1WWklvSXdxNWtvcXM3RGRvRDdXMm1ybjcwclNqLzU0U20zOGc1MEpp?=
 =?utf-8?B?V0tDcUI4MnhOd25hQUhIQUFWMXZKbU5teXUrbENJUkZEam9tUGxGRFBndEFj?=
 =?utf-8?B?aXlNK3g1OUJZRlZBc2hoQUxuWVVWK2xPQWZuS2NFeGdDWjNaVWZuNEtzUnFZ?=
 =?utf-8?B?cFNUaFlwZnRiWXZjd0NPSjBzTFRFK284Q2FMUHI5aHV6Z1YxRjg0NTdlMU5B?=
 =?utf-8?B?TjFTcnd1WjRMMlA1cEV5cG1zRmRqN1E3MEVISlVtSXVCbHpVeGZsbTBmZVdx?=
 =?utf-8?B?SW1MSWduUUJKM0cyS2dFaCtwYS83aDdOcndmVHdCYitvUm56M2xhRmFTWFh1?=
 =?utf-8?B?SjJxTVFzQndSelNDbk5QYys0Z05zZFZJQmI3ZXVsM01JK0JFLzVGVXZUSDQ0?=
 =?utf-8?B?ZVJxaDBwaWtFRHJ0U1VrYmxiQnpJV2xiOVF5bnQ0STVOV1VSREJmZUlrVExV?=
 =?utf-8?B?cDMrWDdCMnprYjFyYWpKaFlvTXR0Q2c1ZE9RdzJhdXNqbTJpRWplWkhVdm9i?=
 =?utf-8?B?N3ZzNmM4WE0zT1JqNFFYVkdTRXNvd2VOWS9MMHN4WWc5dFpTZUtGQVdPcDBS?=
 =?utf-8?B?aVFSaWFUaE1pSDZ3Wkw5ZkxDWkR3RDlaQlNTRU9aczhwYytxL25ZbGd6bHdq?=
 =?utf-8?B?UTJGc0NlNDV5aWVvQUFDRnpyN3ZQTGdJdlkydnlxVEJHNmx2M3hqVjRsUkM2?=
 =?utf-8?B?YjFnd1JDOURWUnFQQTZrOFFpZjFzL01SeHRwNDVEMER3cGhrOEZVQnhybFR0?=
 =?utf-8?B?cFBJUDlrWWw4dlFEME1yd2xUazV4ZWcyRzJ5Zk9nMDhIWVZ2OENTbnlrS0JF?=
 =?utf-8?B?emswMEl2Vml3OVhhcUFUelFxOFRoOUxzZFJHaHJVRUNNZXp1K3Q2NUNMTlhT?=
 =?utf-8?B?Rm1neCttTHRrK283RGROYS8vbHVwNHdRL1VWWjRuWEZJemNpc1NBclRmcXJG?=
 =?utf-8?B?Q1psdDN0eEZtRzFuSUM0alI4b3dTYXhvNGxHR2daYkN4SURKRzhDbXM3cy9W?=
 =?utf-8?B?ZEFsdkx0M0dIdk5MVlQ3bXRSUkllVSt6emd2Zk5Pb05VRnJ0anVPY0U1ck5T?=
 =?utf-8?B?VENzUzJBVVVpMXhhbXhaMzAzOUdMZG53bXdrZkZhUVJjWHE5ZytDTk1tL1Y2?=
 =?utf-8?B?MGlKMVZaTnZNQWRqQmVTTFlWTWxBUVp6dGlXMTZqN2VQalJENFFqaUZ1Nit2?=
 =?utf-8?B?Zk9sYk1JL29ZS2VZd2YvdnByY0lnemhzT0F0SGZZbFNLLzNtM1NCNDlkTXc1?=
 =?utf-8?B?QVVrdWJ1T1I5TFI4TWVZZUN2SmZ1YWRnT0VOQWREQzRoNDR3TFgwM3BLVm5l?=
 =?utf-8?B?VjQzNjB5cDBSZDZaUXQydHBRejJtdjQyNUd1V2lIaU1vYjJFaG1yUW5ZWmVx?=
 =?utf-8?B?RDYvMEkraXM2RXVxbEk5Mnh1MGp2a0dpZ05VU0xZbjlWeW0yWGZUK0N6N3Fn?=
 =?utf-8?B?U1FtSE56LzJ4amdqSmM5dUpuSzhNcVd4RWp0S0FGcW5HcDNrTkNvbXR5RWU4?=
 =?utf-8?B?QldZNENkWGczTlI3VWRYU1VkZzR1Vy9qTWRTcmRxWDVYRS9mbjMyUjF3RkdK?=
 =?utf-8?B?U2xWOURiWmZtREZrZlI5bXU0QUs4ek43dWVQNTdMeDVwMUI4ZWNHaFdnbi9I?=
 =?utf-8?B?Qm5TcVNlb0NKTUJmTGVnUkEvUDRqekR4TmVadTgrZ3JIbkxSZnhzZWRLWjRE?=
 =?utf-8?B?ZW1FS2Y5ZkQxTDhHb2J1dHZQWEUwRE1aR0IycnhreEJCVWNKVWhwcDdtb0lI?=
 =?utf-8?B?Q05TMklkbEpkRTBoYVpRZktrNEFySmxlVE1sVmcwQlEzSmRxdnAxMjJOSFhU?=
 =?utf-8?B?bmN4bHhBT243TGNIM0xkRWdjNnFiVThreVdRYnBzMWZpdzNkeXpmTDFHeE15?=
 =?utf-8?B?MFc1cXhTeFQ5TWVkRy9tUDR4UFB5bG5qN2N2dE5Iei9XMjduU2tKeEd2UFFy?=
 =?utf-8?Q?3+Y/4N7qOKRcvjsQUxew5meEmH+FvUiK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:07:07.6373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1e6944-3220-4185-e7be-08dcc7f0d03c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6022

This is in preparation to ACPI, Non-ACPI split.
amd_hsmp_rdwr() is used to access HSMP protocol registers.
ACPI and Non-ACPI use different methods to access these registers.
Now that code is split and common functionality is kept in hsmp.c
we need to define a function pointer to handle these functions separately.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v5:
None

Changes since v4:
Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>".

Changes since v3:
New patch created out of 7th patch in v3 series, to address the review comment.

 drivers/platform/x86/amd/hsmp/hsmp.c | 30 +++++++++++-----------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 10ab9b2437f1..6d0c58c6a82f 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -82,6 +82,7 @@ struct hsmp_socket {
 	struct pci_dev *root;
 	struct device *dev;
 	u16 sock_ind;
+	int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);
 };
 
 struct hsmp_plat_device {
@@ -114,22 +115,13 @@ static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
 	return ret;
 }
 
-static void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
-			       u32 *value, bool write)
+static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
+			      u32 *value, bool write)
 {
 	if (write)
 		iowrite32(*value, sock->virt_base_addr + offset);
 	else
 		*value = ioread32(sock->virt_base_addr + offset);
-}
-
-static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
-			 u32 *value, bool write)
-{
-	if (plat_dev.is_acpi_device)
-		amd_hsmp_acpi_rdwr(sock, offset, value, write);
-	else
-		return amd_hsmp_pci_rdwr(sock, offset, value, write);
 
 	return 0;
 }
@@ -156,7 +148,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 
 	/* Clear the status register */
 	mbox_status = HSMP_STATUS_NOT_READY;
-	ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_WR);
+	ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_WR);
 	if (ret) {
 		pr_err("Error %d clearing mailbox status register\n", ret);
 		return ret;
@@ -165,8 +157,8 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	index = 0;
 	/* Write any message arguments */
 	while (index < msg->num_args) {
-		ret = amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
-				    &msg->args[index], HSMP_WR);
+		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
+					  &msg->args[index], HSMP_WR);
 		if (ret) {
 			pr_err("Error %d writing message argument %d\n", ret, index);
 			return ret;
@@ -175,7 +167,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	}
 
 	/* Write the message ID which starts the operation */
-	ret = amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR);
+	ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR);
 	if (ret) {
 		pr_err("Error %d writing message ID %u\n", ret, msg->msg_id);
 		return ret;
@@ -192,7 +184,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	timeout	= jiffies + msecs_to_jiffies(HSMP_MSG_TIMEOUT);
 
 	while (time_before(jiffies, timeout)) {
-		ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
+		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
 		if (ret) {
 			pr_err("Error %d reading mailbox status\n", ret);
 			return ret;
@@ -227,8 +219,8 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	 */
 	index = 0;
 	while (index < msg->response_sz) {
-		ret = amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
-				    &msg->args[index], HSMP_RD);
+		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
+					  &msg->args[index], HSMP_RD);
 		if (ret) {
 			pr_err("Error %d reading response %u for message ID:%u\n",
 			       ret, index, msg->msg_id);
@@ -545,6 +537,7 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 
 	sock->sock_ind		= sock_ind;
 	sock->dev		= dev;
+	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
 	plat_dev.is_acpi_device	= true;
 
 	sema_init(&sock->hsmp_sem, 1);
@@ -756,6 +749,7 @@ static int init_platform_device(struct device *dev)
 		sock->sock_ind			= i;
 		sock->dev			= dev;
 		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
+		sock->amd_hsmp_rdwr		= amd_hsmp_pci_rdwr;
 
 		/*
 		 * This is a transitional change from non-ACPI to ACPI, only
-- 
2.25.1

