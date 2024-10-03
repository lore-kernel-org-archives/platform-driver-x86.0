Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5939A14D457
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 11:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727954146; cv=fail; b=sZ5jnrsRfGLCnu+soNv9fONaBE37B5rTq7GgrxjTP5M1xn20Tqpy7uzBMmxC+Pv2hCcBQirKSlUWOH8FvgQkadAL9blQvW6R9bBw2HkQKQrwgQBtu9WHNEeig9I12cgJVLilCxbdnXHJQzqA61mcA6hls2eg9T76TSJBcg5ME9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727954146; c=relaxed/simple;
	bh=j1BolzHuCm8KytExlTmnMxFN9zTZFzTC1GQ3kJIZSp4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mNWYs7otAYw3uDwqE08s1znQHQ+ncYGbIdIvuFbGIoWvlbr9/gffpSRUtSwd2I/o4HRkukukwruXNXyQ6Fj4OeIWJq7ISp8mmB2FjeGa0SGhd3BoPKR05XtoGoUgohNBWw4NoJz80pMu4dFFC5ryprOnSivFPCnXT52Eo2VE2SY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FxxDLFUG; arc=fail smtp.client-ip=40.107.93.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FxxDLFUG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUU7lUGsdFI6QP/4CIlh7eOTWs57fcO6MhMzGfP9XmJD5jEIp8ldVLL3dL61OmEmWN9COtdpeAtbfQ9+7rANJn4GFncjsI6kPKISzDV7EGX8KIdlnq8NBlp3XDajqb4GmAjl48pJiSDobCrT9mQgwsqVkqhqbCp3jdkvZD/VrbHVvwF9BdvJP/L4I5NW0iAKYLhF4uG7lyr7MdMdfOuz6IJ0QCH4mIMZoyPc3NMjzaDcDceJ4TAhEqghQDI0yIL7oDksFAGlFAv+Ajtm7uuAm2/fF8W9ea3R1bAV/fI7gycjILuMB/ZMRBIcM3zpVQC+0GQtTJk+RiU19Rdo3yOu5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hIG9Xsl5VZ3NFRdhVT5UWmvlGfCUmwaqyT0WrNkKYs=;
 b=Y2jb8ITtDjCFfcDQqFU56ba+fLIELOOm3JzBSr42LEUY7hyfn2RI/j2jSyTa6Yizfcfdq9k5YYX7Fc2Y8MJ4tnMs1f8wO8jiBqtv4wvnpjoCiccIFAp2YNhE3UxSOEM2kHFHq2QZyf/UORDxYQBzSDK5U6Ez4EvmzIP9mYlbXUu/XkvOy4P/S6JXZLgaxxBz/xHOlgnJ8wjb6rOqpfmgC5GY/egT1eojLhI1Mr5VGQRlO3Ley6i5lMozqj6Y8UCO/dL7afJOSdkaY4432AznW9PDEKWVOg0GGCEqqso9it0geBmQO1AqKxCy5yXtCzeejSS9Q8tF87HdcKqqY+tlZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hIG9Xsl5VZ3NFRdhVT5UWmvlGfCUmwaqyT0WrNkKYs=;
 b=FxxDLFUGmFp5IY9hYGxtmgnRVtTIyhTpIXTnz4MsKLAPpIB6d68Yy0TA6IwD3af0CcFHg00U+HZ7DKa9N5zAQEBMsA+DES7tEHJy0trXdzR6obocIu+bpDWHTmpKrwvZO1T8WMXW9yyM5NkMg1LW6MvBx9PDwxTw8Yv1vdOJkyA=
Received: from CH5PR04CA0015.namprd04.prod.outlook.com (2603:10b6:610:1f4::16)
 by CH3PR12MB8904.namprd12.prod.outlook.com (2603:10b6:610:167::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 11:15:39 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::85) by CH5PR04CA0015.outlook.office365.com
 (2603:10b6:610:1f4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.17 via Frontend
 Transport; Thu, 3 Oct 2024 11:15:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 11:15:39 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 06:15:37 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v9 03/11] platform/x86/amd/hsmp: Convert amd_hsmp_rdwr() to a function pointer
Date: Thu, 3 Oct 2024 11:15:07 +0000
Message-ID: <20241003111515.2955700-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241003111515.2955700-1-suma.hegde@amd.com>
References: <20241003111515.2955700-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|CH3PR12MB8904:EE_
X-MS-Office365-Filtering-Correlation-Id: ba41b767-8c41-44ab-8bee-08dce39cb6a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1NVWkZnY1NMVVRTeEFQTWNHTTM4ZGNUN3FubEZTZFh1b0FXYlRhVy9teXJp?=
 =?utf-8?B?WW9pZ1hEL3V3S0hsa3ZsNDhuclVZOVdyVld4Y1p1UWxYcU1nemlQYVU0VThz?=
 =?utf-8?B?aGVJMzZXeS9aTTBweHRqUEJFTjVESEN1djNoM2s4UEllL3lDUEtFSG03RXpy?=
 =?utf-8?B?TWxiSWJjOWd1Y0xtNUtvSzhodER2Um9EYWMrbnNxaFlnVTdjbHQ2TEd4TzZy?=
 =?utf-8?B?UUpHMW5wMXFkTU5FU1VQNXdvOWxTRGJmd2xVVjh2OEVtd1ZtZGdQYXZyVi95?=
 =?utf-8?B?d2k1STFxTk1KdmJvTEdlRVp0Vll2bUtBa1ZDYmczWk9mNGVXSEFNaTd3dVlU?=
 =?utf-8?B?NXh5aTZTbzZQclJvTFNrc2Zrci9kaUIyMnIwaFAydlBwKzNzNUt2MjUxYVpF?=
 =?utf-8?B?Q3ZFRUdiRVlKWElHcGFmRWJHWHI5MCs3a0x0UWdWenpFcVJLaG9OQnhzd2ZR?=
 =?utf-8?B?eGY2ejRldHZvYWZuS1NYSmZXTTRWcFV5ZnpzbmxJajRKUU1lbmVKSCs1QVBq?=
 =?utf-8?B?cTVuMUNTQzZ1d0x0YWdnczRxNEZyTHlZUGkwai9PR3ErTHJXTC9rUmkrQklo?=
 =?utf-8?B?b2JhWGdSTlh1eElBREwxZVk2RDlaZUo5YTRoZjVpa0JmNDdBVC9RZFR0Q1Ft?=
 =?utf-8?B?Z3V1a2x2azNuNWwraWtsR0R0SElVbEc3SUFBamE0alU3WjJwL0Z5YnJmMVl1?=
 =?utf-8?B?SGRha3VScVBsZ2JCeUtwUFlWR01vVmJkNGo2clZHNytiem03OWJtVll1bS8y?=
 =?utf-8?B?WXF3Vm91a21SZllENzFnQTVtb2tWV092SHEwNjBtUmxTbjUxY3pqS21OUUVJ?=
 =?utf-8?B?K00vWVk1SmFaS2hTbnVhcmR6aW0wa3ZXUytXZlIrQjkrTm41OFhib2FobUhS?=
 =?utf-8?B?SWNsVThGS0hTakZYTC9IVG9SNVJsaUhVNTV6M01SdGVFU0xtemViWVZWUmky?=
 =?utf-8?B?QzNjdjJoM0N6MmZmYnF2R2kwcjBiTE9sTTBiWXJXa1VBUFZ4c2hmdDFtMENP?=
 =?utf-8?B?eE1ZTTJVZGJJZ3lCNU9adk9TSXlnMklHOWtuM2VVSlVYWmRwZWxXZHZRSWxM?=
 =?utf-8?B?b1o2NkhZMFJDcklCT1JxT2FSV1lWN2NXNUxjOWplNjJSZ1VMcmxCREZudEtp?=
 =?utf-8?B?YjlxckJmai8waS9rNitvT2tjSHZRekZJZzV3RVd3U0wzcTZZSnhoZk0vdTVG?=
 =?utf-8?B?RjZnbG5raDc0RzM5WStiTGRoVjVGV0RGcnVOM1JDRG1MUFV0aE9xNk80ejdF?=
 =?utf-8?B?dnYxTFVMaGRLVjNGQVphQ3ZJM3ZIZDFOSnlhNzlFUmpEbmhTV2dCVHNNdUUz?=
 =?utf-8?B?c3o4aDRsT0RBZmtHeVZsRXY3K29QV05HNFhuMVlTTkt4UEc3bzBMbmZsVm9U?=
 =?utf-8?B?THpOUDJ0bzl3SlIwN2FkMWhJVktPdGE5Y29NM0hrcHRuNCtPMmhZb3hNeHVT?=
 =?utf-8?B?TFNjN3pjS3Y1QTBWeWZxcXh2WUk5VVZHeW9tb2ZIU2lCS0VuNjBQOVNmUGFB?=
 =?utf-8?B?SHhVUWo1ckFHY290SENoeGZqWEl6Q0VYUy81V3JIZENwT01RL28xUllCVVFZ?=
 =?utf-8?B?YTdkR3dqZjJLU0lTeVB5ejk5ODkzVXYzbVVlMmZnZHp5dDMxN0pDcnF4Ulgy?=
 =?utf-8?B?UnFPZzVUdlZncEZ5NEtIV1pPLzJlYWU3WTRIZ1B6Q2RKV3JqQms4YmZLdTgz?=
 =?utf-8?B?UXVlbURSRWhlOEV0bHBkQzNmYklqTXVGVmFLUmgwdlFVTkQ1QklLbHFOVG9Q?=
 =?utf-8?B?WDdrakdUdHp3eWhrRzFKa0xzTWlFQUtMc1lOSnEzVjl3WXkza3RWMU52WldI?=
 =?utf-8?B?U2Mvcm9vMnpCNFIxWmIvSElIeFNvMFZIb0w0VlI5NW9pWDVrclhVY2JJV2Mz?=
 =?utf-8?Q?8n7lLjRYTLROl?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 11:15:39.7052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba41b767-8c41-44ab-8bee-08dce39cb6a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8904

This is in preparation to ACPI, Non-ACPI split.
amd_hsmp_rdwr() is used to access HSMP protocol registers.
ACPI and Non-ACPI use different methods to access these registers.
Now that code is split and common functionality is kept in hsmp.c
we need to define a function pointer to handle these functions separately.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
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

