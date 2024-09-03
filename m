Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6C71AD270
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Sep 2024 12:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725367141; cv=fail; b=IcBgE0o/cJC1gjPyurzJ65/nkx22nOcFbLVCEBjbd1XQuBQ66DWTFSKzd8hPIVjkWgqTJjsK3cdijYuRCXe7JSsrxzE1QrhE96adICyU8Nho6+dj2iyzaqGLEwD7YTuyazg520wI4GPmkkRFhZ85Ho8hbKufWUbvUcNLSRXFYJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725367141; c=relaxed/simple;
	bh=LA3n5GRzVRaXPvjCXYLjgxRWr5+Ql1x4rgL1HHq6Xis=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RzuApEHacJ1t/vSe+IUTh5R7uB6PhzKPsvT683qfk/XXOUmw8zPmuS3jcI4ZEi7r/vSRj6d0dkYMuuKSCl9WNbNisi2VaA+Nzzvzi2yPdqBjImIAIX2tzjIUq9owJa8szeclZ/3m5qK/uifch2r9LysMVAHhg+VpS4Lj0SvlLbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2bjkVrAz; arc=fail smtp.client-ip=40.107.223.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2bjkVrAz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZowYECT2eC408rvypByHdVBZ/XgW3YDlMw4WkoKgu9jCjBKkXvzF7RvJ4sBktke6DG0eVSHkHBuyxB+JjGHlqlqN8/AGafCkclS0Ug++k7YdH7yI8L/uBS44iohcUmxM/hkl2FhdGLf+jGnAZjPcyXnGe6vFnKMKbrRJWtzgcGiO3jWw+OhmsHOuLewMc+PpEk+UrKnx2QCBSWpIvY4wsoJTy9AHSuAsyLM2NBtTIFEVIHK5dl/YIsggq7e67o7u+EtVL+Bb+4oUmYtcVTqlGa5d6NyLMrqGzQ93uD04ohTa8M/K+6lHoNP9+s/W+IUwRTRuMi2wsGvzilTW+QgVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHeTmT1v0JQCzb+Cu24x1njdeIrWyIzEJ2Jo/lFtIkE=;
 b=l15GFNq+n1wSOEa040CSDRxq17JI2Cs7MhrhL2Rn+HFsSQFNRgYTFs7bD1Paad1+pc8KXlUAFuYoH9Bsvpsd2r/XMxpg1pmEh7WxGFasoRPwfQiJog6NId9F4yn5jUADW8DoeNHxzT0120ApTDoUCHSN7j2zT+NHxoMppzfTUU9BsELcQFm6u+Flzs0QWdVL1sJN9mb1sWBs5GT+RMgxHxyHvCfm+vgF8ZUZfBSB03l1K2ynC2Z4WBrywS2XEazgNvfucs1peU5tIz2YJxr1boQHTD269qIlSMOrxZ2ZC53lLQZAz39L58ZVs9fSFtw+xT4TI6tiJx28Kxmu/Jp/oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHeTmT1v0JQCzb+Cu24x1njdeIrWyIzEJ2Jo/lFtIkE=;
 b=2bjkVrAzkZrFRtGV+F2PAOrATrAr5kK4e3c0CIZzUwd/n0sQjVsHJ7JNqDE0X4VQdb8Xcg2X9oZzQjcysyCMLIt0ZfPrZ7LnNQ5NJoQcJNBubWQMzU3cuS3hXua9BxmWN+pEks9mBavTZTPC42O6/KJaVilWQM+3Up5+OSwRVVs=
Received: from BN9PR03CA0874.namprd03.prod.outlook.com (2603:10b6:408:13c::9)
 by SA1PR12MB6752.namprd12.prod.outlook.com (2603:10b6:806:259::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 12:38:53 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:408:13c:cafe::1a) by BN9PR03CA0874.outlook.office365.com
 (2603:10b6:408:13c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 12:38:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 12:38:53 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 07:38:50 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v7 03/10] platform/x86/amd/hsmp: Convert amd_hsmp_rdwr() to a function pointer
Date: Tue, 3 Sep 2024 12:38:23 +0000
Message-ID: <20240903123830.2717196-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240903123830.2717196-1-suma.hegde@amd.com>
References: <20240903123830.2717196-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|SA1PR12MB6752:EE_
X-MS-Office365-Filtering-Correlation-Id: 3890eb8b-8d62-40b6-b841-08dccc155e82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0pCNVh6T2xiRi9hcml6SXZKS1dhY3plRnZTVXBORkNUM2V3S3lWWXVsUVZN?=
 =?utf-8?B?c29CdUZBZlA0THY0ZlRuMXVqcW1IQnU3aVVKSGdKZ1JuNGpMd2o0eFdkRFky?=
 =?utf-8?B?SWJlNTNoa0kxbExXbVdJL2pTT1RTTTlsMEliRUFhMFRiNTdldVlkMVk0YUZy?=
 =?utf-8?B?UHJqZWZYNlo1Kys1TjVpL1ltVDE0MlIwQlUvdEFTOC9YQVpmQkROZllpclVr?=
 =?utf-8?B?NWxBbFdMRWZycjNhZnFDRHZwN1J4eWxlUytlbU5sV2xFMjk4dFdFcUpNd3Nm?=
 =?utf-8?B?eEhpZjQ0Uk5ocE1RRng1eTA2ODl0aHdYRGhwU0MrT0xIc29ZaVJDOGlPb1Jp?=
 =?utf-8?B?R2YwUXkyNHRaNW50cjJaY0FvOHhtbStFbWFIa0dlb0xGbVErRXhFeWdKUzlH?=
 =?utf-8?B?aTNpcTF5ODhBSU02bEMyeDFoY1dtRk54WHRlOFljYVpna1ZRWStheGpGeHFW?=
 =?utf-8?B?UVkwUVZTaUZ6OWtlekFqeWZkWFQ1Q2ZHODlKUGRyYmNIMUJoNFl1UmlWS05n?=
 =?utf-8?B?Q2RjVGx0ZTJ6OFB6a0hSTXBiSGprcjhtTkRJRkVQcGFvWWpjTDZQMWx1Ymxk?=
 =?utf-8?B?bE5pS1pYR0ZkeUIwSzJHcWZnYVA0VlBCVjJuSFZiUnNvZFJuMU1ueTcxOW5M?=
 =?utf-8?B?Z0U0RmNsWlg3Q0tUMDA5Z1NmK3pwUDJoYWQra1pxVi9MN1lKandDV1ppNjAy?=
 =?utf-8?B?Sy9GTHpReU5GMTczL3l4aXI5aG5FL0xVZkhGL21lN1lyYUJOR0VPUmZpRVJr?=
 =?utf-8?B?OU5NVUJDME9la21DN1RRelJmc3MwRDFpNnI4RzZOQ2U3OUxFMkJYTDZ4VHRB?=
 =?utf-8?B?N0QvVm5tZFkvZGFSSFhsb3BNSXVLMWFzNE1WMFQ1Qkd5RnAwb3E5OGtESDhG?=
 =?utf-8?B?TGFDd2ZOdzN3ZHVGRW9teGFlSHBNandhNWVYWThVRTEyczl0S1k1K3h6RUdT?=
 =?utf-8?B?ZE9VTXIxdlBUZmlEVFFjRDRscE5ZREQ0ZTk0RTFCMWthdHByZm1lRFlJVTht?=
 =?utf-8?B?UFU4NzhzUEZsNDZtR3hUWUJ6dTVQSlJPNlZoYU9VcjRDRU1uQUtuL0tob2dB?=
 =?utf-8?B?OTJMRUdJd3VCRVVPWWtJaVhSOElDZnJOcEJwemQ4RHY2djZNYlZsN3A2VWpx?=
 =?utf-8?B?Vy9GbDgyTzNHdUU0UjVBTGhvejJBeVNhZXZBdkxJVVluVVpSRjVQaTZLTUdG?=
 =?utf-8?B?R0NBQnZDdW1oaExUbUhnaGpxeSsrTHJBSlFiR2tWRmU1ZzlvbVpzRWdESUln?=
 =?utf-8?B?QTRRRUFNbDhBTFVkSGlBcFlUK3d4TUIycUliMnlFOXRmMzByaXVqZ1RzVFow?=
 =?utf-8?B?N0ZWWlF3SHowYVZWekVRb2V2ZHZDMkpvaWFtM3B3T0h5Q2pPVUwveDhiVGZy?=
 =?utf-8?B?OURxQnFmR0NJR3BLQTZxKzQ5bHV2cm1GTVBVYWZQK1FWUUdid2NQQUxlNXFF?=
 =?utf-8?B?MWk4MjZRaXUwMlpZNDdNL3djaVJIWHVkNzdRN090Tk45YjltVUo5T05DSEsw?=
 =?utf-8?B?K3U2ajRFa3FEcFc4NmQ0cDR5S2lhVzhKSWNOUGJHUDVTZ3hsbGZVdUZBN3Vk?=
 =?utf-8?B?Mkl5dGlnM0lHc3B4QVFLRzdXS1FLMlBrc2srVUt2N3phYkpiRmxnTUlGOWVE?=
 =?utf-8?B?UzMwbEpyeGdUZ1RHaEFkVEN2UU5TTmVKUHdhL0ZoMDRGaGYyUWkxSm53eG1P?=
 =?utf-8?B?SDNwdW5jWks1bFRCUksrdi83V2o4bXQrdU5HZjdoN1djZDlGV0pabUg0SWhO?=
 =?utf-8?B?NHZuT1pDRlNmc3VNYjJlRGo3YXhWbmFOVzBUYllDcmpJN3FaV1VEYUo0NlRk?=
 =?utf-8?B?RGZQbWpldnhvQWR1alVjeVJZRStTLzV6UHVoeS9BMjJzWi9qazN2amNPRnNp?=
 =?utf-8?B?RmlwSS8xQ2t3T1Z2bVVxbWZKRm05eWpGOFhBWFU3clJuaUJzM3BxK29KeTFq?=
 =?utf-8?Q?m10k9cxm8ZgEBqibYk7G1V0PUg3z84G5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 12:38:53.1147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3890eb8b-8d62-40b6-b841-08dccc155e82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6752

This is in preparation to ACPI, Non-ACPI split.
amd_hsmp_rdwr() is used to access HSMP protocol registers.
ACPI and Non-ACPI use different methods to access these registers.
Now that code is split and common functionality is kept in hsmp.c
we need to define a function pointer to handle these functions separately.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
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

