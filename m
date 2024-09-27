Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16A718BB87
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Sep 2024 12:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727438408; cv=fail; b=GOOsPnRWSspOQQeAU+aTSipe2GVFRmIX8RQ4I+Y5kU8pi0qYKR9tbMGs6s5HnzczGEyuCp+Epvi+eQkB/QyGeY60m4/pc7t7avHUGGpKENbklfXvzdDSlOkv/phT+fhonEBTv7OK7DO866bGE4PuhVgn6FcRqGV0UozCOIltf38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727438408; c=relaxed/simple;
	bh=wl49sau62lKnL98xNwkeU3GztwYjNcn9By68nH0PILE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ATI3pGgJmZPDp0dA9COkt8OMwjljwJAyg122ngLCH1XaagjS+Mw8TRquGqRenRhNOgQniaJwWJe7ZAg30vkM+J9Mx4Gm36dbQE5daGNFOAJNlE8kQozxofd0CVAH8LOq1idnpWoEm+h7VG4Cj/B832LTpC8L2Z8xbfnGQe9ht1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gvEeUNmf; arc=fail smtp.client-ip=40.107.237.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gvEeUNmf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPs8uAL9FYxkhuSJ3RJdDdidWyumR4J2boqdmDHO+Xo0BqCFwch8u4L1f7GJ0co/nwhu/EN+FRc1Ad+lKIDAEaIAx40gYpYF4hVub9iXFeUkNmSZ9/DTTSjPh13WVqMSB8JpDE79+bblmgQHYMpN67YOHirhDJcilCFyPGkQ5otNph0Lqwl9x05HgehHvsNwk9nv18wFsq5p3Zt5WuREwWpnwaSw4EECIUdZWc7yBy92aVgl0q5WDFXwpHwHh7w713vsIYcpTVgjxr4Bt0ww+VCBHINRkIifpDX/ZcIorjeJ2eVVJ8V95Hza6T/6+4W7cYOJgAxboNWroaZwLXOvtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AN3bv09awG72973P8O4PAsrTuIIqYDyOGk2aKlcvWEs=;
 b=GtoAn0g3gLq/RJWcQ2TD//lmXhQLnPheMvMLzp0guxOee7W8x8rmMudkin2Ie1ZpAhst69Gf2MNkTTjvM8i7wVDQT6H8w+B/UCzUyJP7Jd3U0+S56awNkwziBrq61376HtIgfR4LJ6n/3Krh9hvHEXzwxLHZ0xPxPRK2Ysiy9oRLCSRiI/lAEwtdtVu8DC08SNmhzOW+uMX89ZsPMaoHgNCYigFcW8SOBgIFjG54Lni73TaYnB2IUd9+zTk92Gveom6QMtKhEjfydltWxSgucb1OvmJytKOPf9qZuiQnBu78l/H5imo4rePxamJ41rjCWFbWfLUbTUdBaXhwMTr0HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AN3bv09awG72973P8O4PAsrTuIIqYDyOGk2aKlcvWEs=;
 b=gvEeUNmfkNt2snuk96RUhhbEWjTFSxSq0lFj5vYeN3OTamvVt6C01gK6ZdAj1RGs55SM+StyvqLPo0U2EK81Q6C6uEvVRAn/KXgFomeEIBg8G3oy4H4UWZZd0NKl5dBbNDs7ylJy2ov9zqEQi0cRAzJD9+Y9BOVefztvSo+LhRY=
Received: from SN7P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::30)
 by PH7PR12MB7281.namprd12.prod.outlook.com (2603:10b6:510:208::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21; Fri, 27 Sep
 2024 12:00:01 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:806:123:cafe::8d) by SN7P220CA0025.outlook.office365.com
 (2603:10b6:806:123::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20 via Frontend
 Transport; Fri, 27 Sep 2024 12:00:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 12:00:01 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 06:59:58 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v8 03/11] platform/x86/amd/hsmp: Convert amd_hsmp_rdwr() to a function pointer
Date: Fri, 27 Sep 2024 11:59:13 +0000
Message-ID: <20240927115921.10909-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927115921.10909-1-suma.hegde@amd.com>
References: <20240927115921.10909-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|PH7PR12MB7281:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e63931c-3ad1-4718-261f-08dcdeebeaa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0ZzZEE3MWdjS2pxV3BHTHROZnRMNDIvTnN4US94ZjByUWpjU0p0bUJUQjMx?=
 =?utf-8?B?QnJUSGlyWXphazZ2Zkp1dEpPN1VwV1ppS0pUdUYzY0p0cU54cXo0bC9hN2o0?=
 =?utf-8?B?SG5uLzVGaEF5dHFaRk01RmltY2lud2VHWEk2ZmdzaXp0NjVsRUFYbjlaa05t?=
 =?utf-8?B?Z2JMSHdmckNRUWQ5MSt1TlVVbVlnUnBUcEtWQkRMekx0aVlnR0xQK3kwcTZT?=
 =?utf-8?B?L2tUb1oxZVpKZDJXYUVxOENoYW5TYlJ0OXYxSWdFMnBFSlcxYTdxOFJ3UGYy?=
 =?utf-8?B?bWNQeDFIK1VVYVhqNDdmRTZEalhEaUhCYU9oZWJPdDVLQWdsMmJObWJUQlRB?=
 =?utf-8?B?Ni9GWlhSQWJWQXhBYzFhUCtmZWROZ1VLZzVUUUpiQlB1ZmFIbnpwc0FJYW9a?=
 =?utf-8?B?Q3h1cVB4WGJtajh3MGdnSW9sR0tTb0FmOG03R01ORTZxWlI5R29vSFducGlZ?=
 =?utf-8?B?UU5oa2ZISGl2cW1HZ2J0OU1nUS9jVlRWSXpBMHZVKzYxemppWlNLaEVLTG1Q?=
 =?utf-8?B?TVhlZ1J0K0llc3EyTzh0TVhVUm5DWDlsM0xWWjdZMUliOTN1cGsrV2IvdlNT?=
 =?utf-8?B?akdsamIxRXlzU2ZubWswSzJkYkhvcVhUalhML1lDZ3lFUEFKMDlNa3JQMDZm?=
 =?utf-8?B?T3oxU0hBeC80UnduT2owWmNaQnVQeGdjRGhVcjNwMk1mKzZJOU50bi80SEFr?=
 =?utf-8?B?VUFzRC9WTmdwNXNiUmVRbHloNFdxTXZldW92R081M1VDL3dialdvenovQjBz?=
 =?utf-8?B?M1JyZENNRzh6OXdkZkkwQVE4QlRnZ3ZsOU5wdmxCMDlQWWRkZFdkTVc5ZFU4?=
 =?utf-8?B?WDFDd2hNYStYT21oRG43eUtWNkU3a0xuU2dXVEc1a2llZnFWN01seVFQQ1Fw?=
 =?utf-8?B?UXhoVmtqa1VSd3ZSWWxQVlVIRnF5NUJSS3NrVHNwR0RUQmZYTlhKckxJNGZt?=
 =?utf-8?B?U0RJbEk5c0xZeVB3TmUxUkVjUUt5em84TkNhRFhGbXdOTHN5eFg4dU04ZDU2?=
 =?utf-8?B?b0FOT2RPcHZPazdjaEhiMHBYaDQxWElNUWtOS2RCeTRXNUU0QTlVQ2pSSWdj?=
 =?utf-8?B?MUhkMTRxdmZQZ3Z3SnJKUk10cHBpRng4UXF0OG9nZ1BhT0hLK2xmYXA3RUM2?=
 =?utf-8?B?L0YxVEpvUWd2RHZaNERPVVdNcnBUL0QwaHVVRmpuZDQyRGRtaGRqdk5UbDBM?=
 =?utf-8?B?d0ovSWo4M2JmSHdEeFl4MnZKVFZ2eXpvVnRMYWhNQ2VQd25aTW00cGt5eGd5?=
 =?utf-8?B?QTlMRTNoTVdJZWFqV2tYTGtyRFl3NklwUVN4NE5rVGNORzZtNm9CNVdJZFhT?=
 =?utf-8?B?TGpOR3JRVkVaVmR4UURMUGRFRGRFQXpoczh3TWkvRy9zQ210bVN2bTk4R0ZW?=
 =?utf-8?B?UUNXU3JBenUyTHZyL3pJYVR2TkQvdisvc01vdlJkeE5Ddng1UkZvdHJneUZ5?=
 =?utf-8?B?WFRmSHVLbUZCTndDSE9BZkhucWJFQlBXTG9YQ1laYXMzbEJ6cGg2SHg2NHA4?=
 =?utf-8?B?NnB2U3I4Um11ZCtzY3ZBVWV6TGVSWTg4WWV0RzFYcjZXS1R2N05VK0tmUHBM?=
 =?utf-8?B?bzBrYklIMVBNTzF4QUNyZFFEZ0RkNkk0M3dDMXcrSzl2NUhiTEVOa1BpK0JR?=
 =?utf-8?B?cjYvcGNEcUdEK3V3b0lJd0JFd25JbW1zb3ZhR1FFdVlGQk5lYUhhMkRSQVlR?=
 =?utf-8?B?cllyTldBb3pSUEt3L1BPb3NRb0hyOUFQUGQ1dGk4WEVVdWRWbm1SbiswQ3VZ?=
 =?utf-8?B?MmZTZHNYdnI4TGhvcHJSTUhsN2RJazdXQ1VvQVZSbXZXLzEyYkt3Vkcvd1VN?=
 =?utf-8?B?VVJmUW9nRWpQbU1HNTNSbUp2OXY5Sk04ZDQzZGV2MkVhZWNWSC80dE9pN3RS?=
 =?utf-8?B?c0t0R2tZTDI5bDVkaE5YMnJ2QnVDMlJEb1NJYXdKRXl5RHA0YThYbVVEWFpF?=
 =?utf-8?Q?htIUFWbO7QTkBl8q9Dp7CP2M91nmOjNq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 12:00:01.3875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e63931c-3ad1-4718-261f-08dcdeebeaa0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7281

This is in preparation to ACPI, Non-ACPI split.
amd_hsmp_rdwr() is used to access HSMP protocol registers.
ACPI and Non-ACPI use different methods to access these registers.
Now that code is split and common functionality is kept in hsmp.c
we need to define a function pointer to handle these functions separately.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v7:
None

Changes since v6:
None

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

