Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8CD13C9B3
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Aug 2024 07:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724399772; cv=fail; b=gcg0tdIVFYv2H754O3m3YuSNbRauOh7VyleLbKX+Ihf+2wbCLU6+eRuAhdBU9iNH/UYd8mszrFzRcovpVeQ2lUHVOhnCddmHruDm08kweg7AoWcQP8CfWouAPnJKp+HW6o7qzvncuJ+6OiIvxW1LVJ1tjf1+cDfKKGqATkkYwuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724399772; c=relaxed/simple;
	bh=cq559UkfbGO3dt5S8H+p8tJdnMJQ7VfHOKr4LG+90RU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZEI1cmIBSFmKb3UlHhOiLoRoYbnEKIIxnEEUtfVW+9K17J9bAVQWtncex1IYXC0qWBO0EgsVyXnlOGVggWQ+oZHCPjXTiiGCCeDQb2ppBzfrI+sYvZBymlqDE2tosv0LU/gqG6J9IaTPBpvxevS7e0rR8FUyWCud2HrHB6BSI9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XGGzc+6a; arc=fail smtp.client-ip=40.107.94.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XGGzc+6a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iT0B7Oez/UgvPFAI9E+GOHjST5ABBkpPbzk5dOkiQ4WI2DsZqt/cqYpyiLwk29pR8DeIVe8niVcd4eo6PvOb9U5/n2bgqLX50P/uTTufHzj6ndIfKT89s0gEWXE0DfhbiIcbU/Qc0T4VOe9sn9TH3zuSth2Xo/VKI59FFLPuV345XSzXU2h7cqRzOdJ5EE4ocXXjvXcA3iOSrluteDv10ujtUb9I1uz2AMeKnzwVXUneTAQVDtv8mQ981qm8ybeLUpqsJCbIfEpbn7qm9RGfzdVum3J4fba7xDHHzA+wjyaIdadZNEuh5ka9a8/Tm38ZKUsQG09O1E1Ya+769ktzIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVhH4RXrWroCyXRh934MxgKr5kTTBzb3rjTk4D4OXfI=;
 b=XrzkL9b0uvP1fMCFJZSKESa2yIWKz8SFvUESKxSlKRzrvPMcLjOifY4a9PMBhbDKFcLJabtXKy3tXMcFQjx27/6vjPWfMopEKSOU0tWNdrOCL0El5PMGmDdBFzcG8FDwQmEzahLDofyU3VKPNuGUFiamWi6nTgQs62xrrTj7kvJ2mg7FXJMzv8uR1+yT/HaaGUjYYXmlCZ81zGF8lkPiH2HshltriY039PGJfJHy8krfyVvfQAwdgylvnyABldtpq12C/AApAz1FDEj5qs6xwcEuFgaYqFZjOL2rTs/3KHdCdaSp8ed0eU0xX1CvDQBflCV8GIfA27FjogQudBZjag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVhH4RXrWroCyXRh934MxgKr5kTTBzb3rjTk4D4OXfI=;
 b=XGGzc+6aVgDuExEQ2hM3errbippiGqbugQex0uMw2ERWMmgOghAR7NLRrQnxlRHGjKUFFcwmCiBMIaJUqwqK49ri8ezqA5fmpM/Sb7fElsZzCtEUz0KaBce7ajzoskSWcaIlUe3IULrrOaTVhoyuNxzQb4NyCT15BTU+Ms02oC4=
Received: from SA9PR13CA0014.namprd13.prod.outlook.com (2603:10b6:806:21::19)
 by DS0PR12MB8413.namprd12.prod.outlook.com (2603:10b6:8:f9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.18; Fri, 23 Aug 2024 07:56:08 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:806:21:cafe::eb) by SA9PR13CA0014.outlook.office365.com
 (2603:10b6:806:21::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Fri, 23 Aug 2024 07:56:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 07:56:08 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 02:56:05 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v5 03/11] platform/x86/amd/hsmp: Convert amd_hsmp_rdwr() to a function pointer
Date: Fri, 23 Aug 2024 07:55:35 +0000
Message-ID: <20240823075543.884265-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240823075543.884265-1-suma.hegde@amd.com>
References: <20240823075543.884265-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|DS0PR12MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: 20058067-ff79-4099-7f0b-08dcc3490c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjhPVjd0TWJVaCs3VnU1TmltcURKYWpGKzdCN0s5V3RxZUVVQVJ0azhKem4x?=
 =?utf-8?B?NHdtN1lCM2dNZklwa1BVZVRSK2hxaEwvRXJmUlBtbVBtTTV0YkZnMmVhcTg1?=
 =?utf-8?B?c1RncERQNmRNZlBvbWZwY0ZUU1pybVp5NFNJWU9WMnJiTUpKTitHTUpXemky?=
 =?utf-8?B?blJZY0lDd2tKUG5NWXFOWXphUjM4RU1xdTZZWldZa2h6akZlRk9IVXVqeDZS?=
 =?utf-8?B?RG1aTFQydzlUTWVKak1iRi9DS3ZNT3g5dVY1L3Y1dElCeTdDUCt5MXVsQ0Rt?=
 =?utf-8?B?SHBWMWRLQXJpRW1OdTN3STlJNHMxaFpxUllHWFlNMFM2Mzd6d0xrNXBrZzlt?=
 =?utf-8?B?SVZnTGEyKzVtWEVDMG9rdC9zNGN2KzNCblRoVjBoTDBuSkJRN2hReVA3WmxQ?=
 =?utf-8?B?eWlVVmdOdG1kTU9MdUZ1MUsyYWtONk1KbVo0TUNXMWtZaC9VTWZRYTEvQVJi?=
 =?utf-8?B?MWtuR1dKK3NvWFpUb2g5YzFVZjdlMEJCVzZleEVUbE9IT25WSk56eUhNNkpO?=
 =?utf-8?B?eTJ2VjJzZVJoamtaajdZSGdVMFV0eHNzWW1SLzFSdnQzc3hTL1VCNFN3cVRR?=
 =?utf-8?B?YmhWVGJ1QTREd2E0YU9kWXR2ellmMXV0Y0cyRno1d2FydExLOUtKVy9pQi9O?=
 =?utf-8?B?cDBhTWNQNjNZY2dBYzJQYWg4azAvTnMyaEVXUGdNZ0lqcnVCaTBYWFFnNFlt?=
 =?utf-8?B?ZTZPZmd5SzMvSlZmUHBZZEwyUitWekpSRmhudDJVSGlBYU1wSjQzMjlpSEJH?=
 =?utf-8?B?Ni9uWG5BT1RzeG5ZSTNicEM4N0ZsTGw2SXNPSGpnUGJGL29oQjc2ZjJNNWMw?=
 =?utf-8?B?Z2xKUHRBVTNoNEc5VjhsVW5JcjFRb1R5SXFBSEN1YS9IOCtOMWMyVDNuRm4x?=
 =?utf-8?B?Q2N0VzFGWGJxOTBBeFZ6Q2QrVWtzZ3ZsYWNkZUpROGUvcVNYUzJTWWdKNWZN?=
 =?utf-8?B?d29kRTBDK096aWtCcjBBdkRGa3U0czJNOFRYZUQxVE9IUTVjbXZrU09XL04y?=
 =?utf-8?B?RGVjcTFtOUx4aVJwMEZmUXUxQ1NTVnE4cGU0bE4rZi9pVHp4NThxZHc4aHRr?=
 =?utf-8?B?eUVUNUVLWGttdWgrQzQ1NmtjM0x2T1hGNUdtYnc4bWkyMVdSakl5c1VGRjA3?=
 =?utf-8?B?U0w5WXJvOFFqckRxY0F4N3JMS0wzQ1dFVUZpVVNGakpaVTBiRlNNSlRMV0RN?=
 =?utf-8?B?NEpRSkUxY0pNbnUyeXBaVE9qUmpBSEpSbTJxKzFFSTZaMTNEMUdQTjdwUTRQ?=
 =?utf-8?B?Mm9VMnY1WnZkZm8rKy80ckllY3IrNUtSYnFvUXJKQnJqSWk1MnBzbnVUN1lY?=
 =?utf-8?B?cWlBZXh3L2srWjJOTldLV2ZONGFTUkxsYWY2MU1iazNCWkplaG9BdTN6Uk1t?=
 =?utf-8?B?aVdQZzdMYmtiUzhjVmUxQ0VJTU9uTXhkMm8vV3FiRXZuNlR1b3JIdUd1OTFR?=
 =?utf-8?B?TG5TazdKb0xrR2UzZU1qbmdneHFGdjcwRTMwZ3pnOUdJdk1oQ0lpK0VHVGVC?=
 =?utf-8?B?N0RlVjh5Y2puclI4T3JTQzFNSFl0L3BuMkJGc3Z2Znk3Mk91ZE5rRlBZdkhL?=
 =?utf-8?B?YW52TFc1OE1LRVBJN1pUQjNZWUhNTC9CZmpMdlFhL3d0bEM0TFhyQURzQVlO?=
 =?utf-8?B?NkZYRmx6eHp2UDNtQTJjVTZySkxsYktRdGZidzQ3UzkxdkZTQVRzWDJjMTlG?=
 =?utf-8?B?THNDUEFod2pGRWdURDNFMHp6dDFLcTR1T29zdlVHdG9SbWkySXB0RUlqTnhy?=
 =?utf-8?B?dWpoYktCWHdhOGxaRmtoUFFkaHlNdkkySFUwcmFQVUVLajFtSGkxa3pnSkd5?=
 =?utf-8?B?dVhkVWZONUprU2NCUGpmdGZCZ0JjV0RaTFhYaTdFUTJ5ZHRKNmJkcjU5QlNw?=
 =?utf-8?B?OXlBOGE5cFZSRUMxb2VCKzU5eUFSbmpTM0dkbDBDUi8zQWkrOVNrY0lmVUJQ?=
 =?utf-8?Q?WdA5J7LNRG+2weJZpFS76xihZX4muC4g?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 07:56:08.1135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20058067-ff79-4099-7f0b-08dcc3490c0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8413

This is in preparation to ACPI, Non-ACPI split.
amd_hsmp_rdwr() is used to access HSMP protocol registers.
ACPI and Non-ACPI use different methods to access these registers.
Now that code is split and common functionality is kept in hsmp.c
we need to define a function pointer to handle these functions separately.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
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

