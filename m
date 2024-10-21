Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974C71E377E
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 11:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729509299; cv=fail; b=X9p2qE6IE0qLETgPzrgsBm2bSayYg4Kbg0biNapMsdKDZI5OjgHkdomeGF3bih39Pv/YPIx89COSYLGOCUVsg9/fkgHYdBGgM5psvggGQpAC29fN8xlJM/B6iFzbOXr2qs3GVfeSPI+5NUaHOov0wJtfqGiN9XFv0mCyL7l/3UU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729509299; c=relaxed/simple;
	bh=DY4dgIg5107+/uThHD1JX/4C6lf52SafeobeIAxjlxw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BmYMMQ8HvL9eUvP3x0voYwwLvEa3AKZ3va46VTouwDFGaJCmLpECOAYgJ2oAbaqmnQlQmQOlzXYk18nm3fM6x78iy2dJ2tGDRvqniqd/J93B+MTzGLl9ieCPLCDn3t1cLbe7y1pdkXbSBJ3ZCm5wPOjIp1KbkFrsMS9sFwkdyBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VPlUtNEf; arc=fail smtp.client-ip=40.107.236.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VPlUtNEf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFvmbiKX/2c1Hh/gZX1KFKww1xmFDinLnp2vaSeiJr8eA+9uCRbKhCS9cp1Sk99cVW4F8IoPWixBIc2Br1M7lHfv+shxSS5Jl7wKN9iC2II5fT+NK/n46FJCeP1ceoHLFqSFufREPZpcTqo2G9EkdZSvyPzPcoiijdYFtWR/h9WK7ZwJJTbQJL+kj1uxlHBTQft8UsfPmncAiUx57cImzYXplmCCqLYTppqs+koN7uxbC6Jh9PdrFqoE34ezdhf9SLDlhjrC6TBXfG1xKzoNhIzrbNp88jBqCmg2lmJH6rvCtT3pG02cVfiDCDPwwNL2xvkHrU2dyipReuzSZ4sV7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVk16Bo6M/bhsfwUoMnUXlmLz2YIJhkjHrFr2Ys7+ck=;
 b=mc5uEJkhg0uSpEorP3y7Xioyo/yofvtNzct7sFx9JuLdHnG2cDQvnEYkTdtb2xMyFbxfbSFhlbWuJfUqDd5sibf2D1wj/M3CiMyrmO9AvMaXXb8rhBAr8R++M9S1ZCSK1Uks7NfybgxHWn9cdkj7H4aIYX8fIApZShtB3o7emijlHkiGIA4pC78FhbkPfVD5U0PJpr2/OZCEjfQ03xTz2+HI9D2cPMNeoGBaOVUdTlfHGSmmptXHDzZ15YThSjQzzKNS1LTDenKj4out6TWrCgi0sRg9mBPnUBJgNZUVq/xxjgdjCzUvp5iB0zK8mu49q1Plro1bDcPqPJPDZBjdEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVk16Bo6M/bhsfwUoMnUXlmLz2YIJhkjHrFr2Ys7+ck=;
 b=VPlUtNEfz2tzAdQe/cdkxQJMvRSGbCFCzq0DT9q5AbnSlj5APQkwF1JqfRJdKa7BWIzesiNdF3FYUMsX4cr/uR8vOMfWfe96gtXIxZe/DANKF9M1SmBnkToqIjvuzzvGTUafAG22s1Umkux9MELI8M+7MNt883dxPWHDCdSn+BM=
Received: from MN2PR10CA0013.namprd10.prod.outlook.com (2603:10b6:208:120::26)
 by CY8PR12MB7657.namprd12.prod.outlook.com (2603:10b6:930:9d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Mon, 21 Oct
 2024 11:14:55 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:208:120:cafe::8e) by MN2PR10CA0013.outlook.office365.com
 (2603:10b6:208:120::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28 via Frontend
 Transport; Mon, 21 Oct 2024 11:14:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 11:14:54 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 06:14:52 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v10 03/11] platform/x86/amd/hsmp: Convert amd_hsmp_rdwr() to a function pointer
Date: Mon, 21 Oct 2024 11:14:20 +0000
Message-ID: <20241021111428.2676884-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241021111428.2676884-1-suma.hegde@amd.com>
References: <20241021111428.2676884-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|CY8PR12MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: 152d8d16-3c60-465c-47fd-08dcf1c19711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2Rvb1AyR0xNRTBXZWdnS3RqU2ZMMlVSRmt5cVV0Y1BRdlBZRkZyTHN1RzRs?=
 =?utf-8?B?b2x1MElLMEhYNFdURVJnRE1HMzBQOG5qUXRxTkFvazJWcW1WWGxldXFDS3R6?=
 =?utf-8?B?cnBaemdHNkVqeXBBMVlkUU0zL3krZW5FVThhV2tLVU9FY1FnU2xoYS9FNnlB?=
 =?utf-8?B?R3pVNmNEQWh0ejFEZXBzSGpyVlhkaTduelM4UVJyckN5dkROcGFVamhHaWlT?=
 =?utf-8?B?S2Y0akphRDBBRUxna3FlUDR0L0VGVHZ6bVE4VUdjWFFRSHhrOUd3dmdCUTNv?=
 =?utf-8?B?U0R4ZENXMjE2QlhjajIrdzkxRzgvYVdvK2pmYS9jMVlwSjBMaXFtN3lGZFZi?=
 =?utf-8?B?S2Yxd1g3OFZNeGVSNWJ3M2J6eWIzbVJBcXkzelQ5QUdybUcwWThucE40VnNu?=
 =?utf-8?B?RDl0T21KM3Vqa2FNSytkUlA3Ny9kSjRBYVZLUXVHaGpDL0pOTHV6NmdSSHZw?=
 =?utf-8?B?YlYyS2RTWGZKdTFZSGYxcDdtb3ZHbFdnblhmVnBjQ0dxeFdCbi9aZGhMTEJl?=
 =?utf-8?B?QlBJaFJUY3gwZXc0M2ErUDFtbUZUQVNzbFZ1azhINWw3b3h1RjhtVzNTNUE0?=
 =?utf-8?B?WGU5TmFiR2dpQTRjLzQwVTFWNjN5bWQ4SDlZSHkvU0xVMzhJc3B4ek5WOWpm?=
 =?utf-8?B?MjB3cXpxc1hHdHQxaVIyRkpNcHA0ZDZidW1GbzQ0OUhOYVpIb1VENkllYVZS?=
 =?utf-8?B?N3F0N0pKbk8rVUJaS0JuZVRLaGdmQzlLeUNRK040MjhBYjhKdW5Hd1FJcTEx?=
 =?utf-8?B?TG1sRURqZExCR01wWkJ0ckZZRVgyN0FmV2JFZVd4cGloMjcyU1hRUlREVmhQ?=
 =?utf-8?B?V0lSWTIrbkVjTVdDS1dTZXZOcXFhU25CTjFlc0tPNVJoKzNpcldyZHNNaWQ5?=
 =?utf-8?B?eFBTd25sWXlpenJCS24xSC9LcHBDQmlPb0lFc1J0aHNEMk4vMjNYMENsZDNk?=
 =?utf-8?B?NE9JNit4YURrVkJiSktJb3N0RURaVTZOcGE5WVZYRlRWemtBeGdEU3EvNDZP?=
 =?utf-8?B?dVdBS29vWlUvbWg1WVZ5VkxIQmZ6RnkxV003OVYyNWFubmVFY3h1QzRNN3Jv?=
 =?utf-8?B?TitPTy9vWkNoZjJGOTM4eFZwTVJUZXdOKzBqUEZocng3ZSszdGN1MjNOcWRT?=
 =?utf-8?B?RmZWMGxkR3dWT2s0eU9HQ1E0dXowVCtSWkQ3ZytHQ1grVjhGNHpjYjN5aWNk?=
 =?utf-8?B?L1NqM2dzUkdZMVBsNmhBMW8zOEpSQ1NXbWl1d2FzR1dJZmpLYWZ0MUh2UDJr?=
 =?utf-8?B?cFA5WmMyVE9wNWFtclB0K2Vmd0lzcC9BRlo5QzJpZ1NpQnB4VjBuYURJRmZ2?=
 =?utf-8?B?KzhDSUpYaVVTdVJ2N0dVSGZnazliNVd4dU51WWROQjVxNFB6WDlkem12emlJ?=
 =?utf-8?B?dm9DeE9WWjA0YlV0V1RDVENCamhqdndadDBkeWk1cFoxYmwvMmowWDE2TWRu?=
 =?utf-8?B?bE96T0VRZWthZkgrYWhIR0RCYU42YU1oaXFEQ1M5Z01yT2JiRVlHdVY1VTkx?=
 =?utf-8?B?L3ZuUCs5Q2dpWHZnVFFaU1pHOXdtR1NsUWh1QkhKY1I3aDhRUmlNY3U1TkhD?=
 =?utf-8?B?UGFUc2xXQjJuVXJqL2NXZjFtdjBGVEdLZTVkczBCQU1VQzFuVVYzc0UvS0Nj?=
 =?utf-8?B?K3l3NFhuUHAzV09zY0xqYjBRVUpKalBVOGsxWTE1V1U3T2tiQ0M0VnpmY1FZ?=
 =?utf-8?B?bUExYXZNK3JJTU9tenJKVStaV2tscXIzZkdCUkhFM0RNYkZwYkZkRTFRcnZz?=
 =?utf-8?B?dDdJVjdhVkR3d2V5QU5ZK0V2MTFzL0h6c2E5ekgrNUc5Qy9GUWdsZ1ZUMVNm?=
 =?utf-8?B?em5HQkdDZUx4eE41Mzh1OEV2dytsckJ0MjJET1p5WjJNRVhmWXpFbHFOL2hM?=
 =?utf-8?B?cUxGOU1oMGlLalIvcW9nNEhEbDQ3MUExbVFkZG1rcmJ5U0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 11:14:54.4460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 152d8d16-3c60-465c-47fd-08dcf1c19711
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7657

This is in preparation to ACPI, Non-ACPI split.
amd_hsmp_rdwr() is used to access HSMP protocol registers.
ACPI and Non-ACPI use different methods to access these registers.
Now that code is split and common functionality is kept in hsmp.c
we need to define a function pointer to handle these functions separately.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v9:
None

Changes since v8:
None

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

