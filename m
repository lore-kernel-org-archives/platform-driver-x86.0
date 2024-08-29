Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB9F163A97
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Aug 2024 06:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724911655; cv=fail; b=KnfkctTLGyVA3H2HhRURquL1kIl3QtEa7Ub9qZkAKkxGJqfpcW40T2HgvWWPQbbzMJKjNtlMwG46OriDo0pFgBaB41ETyTEJKf1nNJ0Cb34W1vAl67zRzxvtA/VaP8sK8f/JzRyxqgwni+2hluXB9nhrYjXp9upswrbbb322Sco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724911655; c=relaxed/simple;
	bh=Nj2RmzBeLxCEZmCx3jyJ0YmkVWi3RIwRGgCAX4QoLS4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fmTNEm2Q4cfR+0VnlsQIeDuZymi3X3GvzRKYDh5xPskPf8iTSc7kaj2O4irzZfJvGo+XoCxWNfMHXw//5REeTL3lsHCRzgGVh/F/FErftp5XdF+Pnb7YAUphaxDgBTXmskEg2UNoPpjZT6Qq8DmmnCb2KXypc6VXscFkjgBOSfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GWC7Uxkt; arc=fail smtp.client-ip=40.107.237.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GWC7Uxkt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VYgLqRqbt+AtC4XIFdbpJPS6mdbUsPpKmUF6+Ajwc45pdsYVgkP33gZOwkEV8W4hlUnMx1W57tYl28zolBGJ5B43TVNR5hgq3QbE8cykH4+/w6gWckCwO4s9ZGYjjD3hoYwED2g4bXAN9syDWz6aKC48bZyJ2o3BgYE8jmUlGLW3U3Pe1uapVS9Us+7Fp8oYWElU9Y1Ryemx1D9+HWz01bJS++wN41NxVXQtvIqSMHMwwO5vfQvELB2NERD9e/MJTIh/Dbi++xk67hrUE2JKOWwh9Gwa/BDOGSG0OZ38b+BryHLQtJb4Y0nVCyecnUVGdJeNmoB29FByr1rOWHpUUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFcHCTrXo1gj3rxkf8bkcvXiYUSF7kCl/cNHqppwu44=;
 b=SIhfDykUaoOlSaNwSKPGWhN+AFqvdS8HzEaPIYm94kQ9S2CPLHrPXtMobTqccb1ULTMe+AA9XuFUX8BT+e8nIoELuFVwR1PlOqa20VA2rS2xzJmIV6iUAq9HToaQosmV6o5SHR0PE7zJBN38K0rmpgg4uLlWUiStAoB0m81TsMKxpQCK9a+VoZP1QeHVrAsJJkqrGyAVNJgIGlYySg/3UILtCugqirhQV3zSgiJWNwb5OdZcEJjJttzRzGvbF6b06nrFbj5gl/zJgZt7UPVI60wGtzR/6yLDGNYR1crsecKorRoZkv4VgbNLpyZN2OYsRVW9QUlVdnS0tVuLn7YwGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFcHCTrXo1gj3rxkf8bkcvXiYUSF7kCl/cNHqppwu44=;
 b=GWC7Uxktbab+huQo3S1eVKAEBYHrFIqg6R1PVgcdDD0fxHCun75Ox8RbmUBiD4gGiwv9WB8ZvDAKaCdAmdZ7jIu5p6nCf6M1r0IBpTe+tAYM2DE65X2SrDxp7HXwOWm4aP6drCYnYluJ/1riflFF6gC2t99dqBwYmBw/y4hw6cg=
Received: from SJ0PR03CA0292.namprd03.prod.outlook.com (2603:10b6:a03:39e::27)
 by DS0PR12MB6390.namprd12.prod.outlook.com (2603:10b6:8:ce::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.26; Thu, 29 Aug 2024 06:07:28 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::8e) by SJ0PR03CA0292.outlook.office365.com
 (2603:10b6:a03:39e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27 via Frontend
 Transport; Thu, 29 Aug 2024 06:07:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 06:07:27 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 01:07:25 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v6 03/10] platform/x86/amd/hsmp: Convert amd_hsmp_rdwr() to a function pointer
Date: Thu, 29 Aug 2024 06:06:10 +0000
Message-ID: <20240829060617.1548658-13-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|DS0PR12MB6390:EE_
X-MS-Office365-Filtering-Correlation-Id: 3745d793-f1d5-416a-6ef9-08dcc7f0dc49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXZUNmxWN3lpRGVSVDZ6bzBDVjdoMkhZWnB0T1pBc3BoR2VKWDR0ZDNZS1FV?=
 =?utf-8?B?aGJBRGo0MjVZd0t5UVkzcHFRRlZBOW5RblJtS0p6aE8yR1JINjVRQnUwRVo0?=
 =?utf-8?B?UUFqNnpndWtKVDlRcWdZOUJ2ajFwanUxNk1UK3hDUFEyN09STkErWkVIdDl0?=
 =?utf-8?B?bm1JaFFGSzNKbVpDc3E1b05ZbGQyOURkeEI4Z253MmgzcXZMZnpiTUVTSDZB?=
 =?utf-8?B?bTdQcm52Q3BSREJ2aXl0UWNaZ3J0TGlrSHpMM3RZZ1BTeHZ6eXFoSkEwU3JV?=
 =?utf-8?B?dnlteERuZE5wbGREYm5sL1c3a1dpSjBzZDlmS3k2M3UrQkFTeWhFeTlQKzRp?=
 =?utf-8?B?WWZaYkRKd3FqRUZsRXlYTjB0c0pWVU5kMWRrVnN4ZHZtbEd4ZGZtRTVOQVhC?=
 =?utf-8?B?L2c3T2xKY1dVRU5keFdPMDg2bkQvQUwwNTdhK1JzVzVWOVFOQ0xHRkZtNVU4?=
 =?utf-8?B?TWYwUTlTaXFSNVVCVTBhWE5DSWVQQTVUTEdia2ZTWnUxckYwVXpFYTBtakwz?=
 =?utf-8?B?eUE3VDc1aUJKaE9INmFmR0Q2RTFqOTlpZUlYVjhvdmRtVkxjUWYrc0NCaXVW?=
 =?utf-8?B?TzJ5blV1NWkrUElRSzlVOXJUYTc5Ry9pd1VFYlRNQlJQTU8wSmtLbDVUN2lp?=
 =?utf-8?B?a0toZHY4SFJHbGFIaXdveFRKemRLVU9FRktIaWVKZEZYVm05bDg5amRuSTU4?=
 =?utf-8?B?ZlRDYUtrL1BUcW81WFRrd3l3Vm0wTzc2bCswYnRuR2VxdmpLVkhDWFhOMnR3?=
 =?utf-8?B?YTkvcHczWTNOd0V3T3NjelovSnpydTROVUZId1FsMlhNdDRZTDR0ZTRHc0NY?=
 =?utf-8?B?WXFsUDZxVUNRakdwMTRqcEZEQjJCbUJDTTRsY2xicVhjVVpaZllDS1JhUXVm?=
 =?utf-8?B?Nk5iTDVIOGhkaHZTbjhXcmZjV0x5L0xBRzVDNVdnTUNBbFNIQVVYZ05Id0NY?=
 =?utf-8?B?Zm1iSHVCV0hBYStCYTczTnA2KzFyRm10djI2TzZoZHhZcUlxVTJ6MzdiWVpo?=
 =?utf-8?B?UHpwYnhHcXZVU1pGTGhEZkphTWtxRjJSaVBJQ0o2UUZGZVBDNnY4WlhZM3VI?=
 =?utf-8?B?Y000RDVZZTRwYlBVeFNpNStZWmhjSlJsL2R2cjJYU2NtQ3VqcVJkeGJ5SXRB?=
 =?utf-8?B?bHFJMVl3WGd0cUoxYnR2S0tDaDBVbGFSNXNNU3c0VEwvWms4YnpMYnJMRlpV?=
 =?utf-8?B?NUk0NWY4ZlByb1NoKzNQU2J2Y1R0cUQ2RE45K3RHNEpOam1hT2J1Q2ZLaDJr?=
 =?utf-8?B?SGtSNCtaN0pkZlhIWnFSNm9GYndCcGY3WUp6cEZRNXNMY1FTeEx1bThUTDRm?=
 =?utf-8?B?REdjZ3FQWjJBZEVpT0pFbFNsTE1FbGs5eFBGY1dONEFSdXpWYW5SVkp2eDEv?=
 =?utf-8?B?SzlZcjdUSUFrWmRsN0pHbXV1VFlCeUFsN29xSEYwVXhPMmU4SFU5WnFKZ29X?=
 =?utf-8?B?Wi9Ta0k2dzFHRExGbXJZdnR6RDd6Z3g4ZCtveFgxU2pHTnlaZXRjdEc3VHcv?=
 =?utf-8?B?SnlTaTFpSnpoYmVXMWw3MGgzd2tuemZTU1JsS1dtYlVlS3pzbWR3RXZmZEsy?=
 =?utf-8?B?UHFMQzNQcGxvWEVNTXdnOUNTakFRR2p4YXFNNEgvN2JRUHpuYitpYVMxTWVl?=
 =?utf-8?B?TVVQd2JBWXR0RXRoazBGRzd0ODY1NzNtNTgyTW52VmcvUWZxNlZrdWc3WXhF?=
 =?utf-8?B?bWhabkhSa0s3d0o2aDFMQW1NRUY1RjdOSEQrUFZpbEFWc1lPQmFlMHNyVXds?=
 =?utf-8?B?REhkTEowTUxDRXdIbGMvTHpIc2xmZWxYaEZlUUN6UDhHNG9qVkxPT243L1Ry?=
 =?utf-8?B?Qy8yeFdiRHJBc09naTh6aGhlc1lqWmducjNCWmpla3ZsRWFTKzNYK3BHYmFS?=
 =?utf-8?B?UnYvd05mays5M2xRZFhhVUlNbFQxY3I1OEpjN2s0STRiWnI3b3E1bi9pekkx?=
 =?utf-8?Q?n/73d/njh4dRPRo0/KelCOZJRmyaqXFD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:07:27.8990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3745d793-f1d5-416a-6ef9-08dcc7f0dc49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6390

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

