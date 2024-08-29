Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1B515F40B
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Aug 2024 06:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724911644; cv=fail; b=L/0UeIylLPhPqVapUkDspqA/sHUcltCNjGqgcq/wb3bzJSJtU2r3k+UPEq0fPH/RBoLsTUCHLHHSMvfXOxsLIkQnsP70zZ1YEgpiICkA6sWkQRBGR4OJLyp5G1W1sv8ZU8j3ZPgUetSC85WAFiOyeZW5lylg8qzBsgijtgxjjp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724911644; c=relaxed/simple;
	bh=eqKGISA5V0S3Kvk8t/Nnp8u4AxAQa8JBSXvjJZ0+Cr8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D4I+5/NsNAy0zV3ollT6TlADD3ZK3mEzIJGdyyMumiHw5opXcFe+1iEv1/qifJgS7S4fy7720zwfSTAAhxb8VpniSFE84+Dz7IYGpzJWv9/Bd5eENdjPCq/q2DDeJibfeA2GxAteya/DvnrM7Gyqgo2EKZWQzFJYpkhRiF+LFGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LeqB2UzY; arc=fail smtp.client-ip=40.107.223.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LeqB2UzY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IrxqwZm/lTO/eJrPufah6rQhrelxLkNBvuTeVUiXCqcLasJFGFYNLimPAufbSlOPX5aZq84Ooucc3ipwNccKFssVgxLZlZXFh2H0vIMC3UgpwGz+698vMUL4fgQ8qibEM7sCHMoeCRY0yDXzJY+tpXK3W69qDzFF4T33LXV7jgMKqWG1V6xERVxN+oA5TSoQHl0cm1OP2pE40AxSVa8Rr7B0vPLYcf7igbIgQxlJwUS2LPENTKhZvEwQvl2mUCQb0kn8/dXzdqAazejo8aaiH8v+4cLrZ7CWMZ+04mBtnL3WY8FuJ0oHzSwsxysWlPAxN2b6CFhWp51JaQJTpSTUNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTJAG2/Oz7xFT9Ea+5otu6oBb9BCjqO8ArwAl4jRvBw=;
 b=eI06EAflzMi3nG2cl7DOx5M2RI0avPNfogQfJXyS3fzJoE14syD4W4nZVduL6/8gHbXjrl/mLKC0DtNd4uw7/LWT7sv8Sgjpv29uzg9ZUDP9JfuB8GtlJXvZfFLiHenZJx/snoPQ0gbuCYhCeHepQHZcNNJn4wXNL8LDXtfpuZ9PHUrKa6mClQ2FC6aHPIxyWrFcoQRO4UbxcZ31gOMnCRIgROBFC+MSC9+h76mSZkfBLsQIfh8qc7HenbI9ceeIOC95xoupDGV+GF9cmMWa9CZFpaIOh6eaUI5iVXDfvf5bcySLc/RqXUzUwGBMA0+sAkLO5QN5c0hXR3lvsF1hiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTJAG2/Oz7xFT9Ea+5otu6oBb9BCjqO8ArwAl4jRvBw=;
 b=LeqB2UzYLg/IB0StZ42jbd0Wz5YGM7Iyybc7GRJ9BxYsCTB5THK8UEEt1uRicWYusSaiPII2dwqDeXXIXFPPn0ggYy71h4bN/dJEmDHLbon257bCAK/MaKseTsb8LuN2hxY+zsVIbNoFi09o+MtPd9610YoZdvTWjwgwh5iftfU=
Received: from SJ0PR05CA0092.namprd05.prod.outlook.com (2603:10b6:a03:334::7)
 by PH7PR12MB6882.namprd12.prod.outlook.com (2603:10b6:510:1b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Thu, 29 Aug
 2024 06:07:17 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::ca) by SJ0PR05CA0092.outlook.office365.com
 (2603:10b6:a03:334::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.16 via Frontend
 Transport; Thu, 29 Aug 2024 06:07:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 06:07:17 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 01:07:12 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v6 07/10] platform/x86/amd/hsmp: Change generic plat_dev name to hsmp_pdev
Date: Thu, 29 Aug 2024 06:06:04 +0000
Message-ID: <20240829060617.1548658-7-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|PH7PR12MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: 718a51a4-7827-421d-b008-08dcc7f0d5ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEY2dEJzVzRoMjdUSHdNQ0VzTmNtN0YvOEJLbFBKOXFXRWFrOVpWYjJHSzRM?=
 =?utf-8?B?enkyNlYrUnBZaXpmWnpkUlBMTkpHVStiV2tOL3lrdGRCWHpKVGJnZmxrTmlD?=
 =?utf-8?B?RFdxRVI4Q2lqcy80enE0ZTd5WnZUSW56SmRNV3ZiN2ZtZnBIdXphTi9wUmZj?=
 =?utf-8?B?YVBZL3NLMHhVQ3dwZUFpejdSQnZGU0I0SVJ4d2pheE5OeitxcXl3YkpCd0h1?=
 =?utf-8?B?L1BOS2prdmdWUUhjTlovT0x5aGs3RDlUVXNEQjltQXVOajNSNjdHd1pHLzBC?=
 =?utf-8?B?dFRYbUc1dVJDYlF3N0NvejJvWjBMeHdBV2FMMzlSdU1XZ0FtekpGbkJkaUVv?=
 =?utf-8?B?NlZnZkI3WnRmQWV4TEpnclkzNm1tZTZGQVM4aklBd2RlMlkyaU1SazhBMmRG?=
 =?utf-8?B?TDQxZFpmakl5QmlmK24yM2tyZ1lqMjJVY2ZLUzRESCtxN2M2ZGphRGU0M3V6?=
 =?utf-8?B?MEVmSE12cEgxN1lrUFozSVdBa1JybXdTM1FhcUxhVkJzNFJsOVJwRTAwQWtX?=
 =?utf-8?B?eUU3WFZ1QVlEODVpMWdLSE1nUHJoandNM1Z0Rnp3QWFsWlpkTGZTb0h3ZDIv?=
 =?utf-8?B?di83RHZsdlpZYW0vR3A0UzlyOENFNDd1ZUg0aWNWaEZRLzUycmdXTjFxbkow?=
 =?utf-8?B?ZFB3d3U5U2REdjFmZGNyM1FGSDFIQjRGbE9iM1lPSzZYdGUrOHdYRVIzOVVx?=
 =?utf-8?B?NU1JdTlrdThIcy9OclU5eUJ5Wng1VUNubEZrR1M5Y2pPWGl2dTQ2TXB2YW1i?=
 =?utf-8?B?U3hWNlhMWHcrRzIyWnFsSnZDTlE3QkNINGdHZkN4MVBoamNYa2FwNGN2Z2xv?=
 =?utf-8?B?QXQzU2l1UUJDc0VocndCa2ZsbE5GMlRnK0RORURiRTYzcDl3V2RFMFV3MWps?=
 =?utf-8?B?d0FZR0FpTmFJSHB2VG84TUF2K1g2eXNucEZSaTkzVTE3NWFIMEYzOEFrRHlX?=
 =?utf-8?B?OHFpNzBaSnJnRjdjQXJSSEpPN21WTDFsbzVHYlVGYlp6MnRUUzByQ0tLMzFr?=
 =?utf-8?B?RlJkdlgrQkFXcE83bzVidE1OclAraENuL0J3Ylc4MTBPSjcrODBjVGw0MTQx?=
 =?utf-8?B?Ri9WOHRyWXFtc2EvRlNqbStXQ1NIdExMSVFheERhTnN1eWN0S1ExVGZGZmNp?=
 =?utf-8?B?QmJWSmdTMWp5REw5UnFPOWsyMmJkMkE3R1FteCtWUkVIRlJkVHhSN2p0MUY0?=
 =?utf-8?B?VzBjdm9wQjhaZVpXaEFpRENPakdqWDcvTks2eXQ1UkUwYmkxRVhybDFOUDR2?=
 =?utf-8?B?YjY2OVNVcW5YcVd6Rkw2S0ZoZ3d4dDE2UFZUa09QeW04OXJrb3l6UXpycStk?=
 =?utf-8?B?T0Jnb0tnRjB5SFBZK1l1dnRHUlUzcWsyemM4RWJCbXVvNUdSZ3M0bmx4WjF6?=
 =?utf-8?B?OHhLY0Zmc2FqS3JEYkhLZm1WaW9CeGRLTlZ4Z1FqWmxSL05ZKzIvZTQ3UXJT?=
 =?utf-8?B?YWtTUzNUUmxiQ0pHSXdzRjMxMm9IOXdWNWwyWXp2SDBRNHg1TVVqNFVTV1ox?=
 =?utf-8?B?Sm1qLzgyZE5JSUJZR1VIU09KU3g0REE3SW1lSzFidXhaM3N4MkFkOUttZFBL?=
 =?utf-8?B?K0kzYS9qL0JLeHdsVjJ6M3Zabk1mMFEwdGpjWjI2RzNPQi9LMTdpMzgrc0c2?=
 =?utf-8?B?VUoyYmlCMEF2UDlPM2NwQ0k1STI1ayttai90TnprQUhLRUdpTUZtOW9lNFQ0?=
 =?utf-8?B?RzI2ckgwdXkrM1lyeE42RlhjRTZXbUhvOTR3cmRJOFc3Ni9EUHdub3ZQeXo2?=
 =?utf-8?B?eHlZckdoWStWdVhkbThoL0hKOWZkSW1TZW1GS3FBY1VPQUtqRzMrNndDbEY4?=
 =?utf-8?B?amx6RDlmUXc4QTM1a3JNalYxc0VPNWJRN0VkZitiVSs3cHlYcWo0ZWhpaTQ5?=
 =?utf-8?B?eXo2clRNcENZUEdpWDlnSnVQUHUyeHNBNEpINGxrQTY4aUNJalozK3ArQUlN?=
 =?utf-8?Q?9rA9GCA047bV9RkpylkKuRNQCm3C9+Vo?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:07:17.1961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 718a51a4-7827-421d-b008-08dcc7f0d5ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6882

plat_dev is a commonly used variable name, since its made as extern now,
change it to more specific name.
Also change miscdevice hsmp_device to mdev.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v5:
None

Changes since v4:
Add  Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Changes since v3:
code indentation is removed in hsmp_parse_acpi_table().

Changes since v2:
None

Changes since v1:
1. This is a new patch to rename generic name "plat_dev"
   in hsmp.h, hsmp.c, plat.c and acpi.c to more specific name "hsmp_pdev"
2. Rename miscdevice hsmp_device to mdev.

 drivers/platform/x86/amd/hsmp/acpi.c |  6 +--
 drivers/platform/x86/amd/hsmp/hsmp.c | 60 ++++++++++++++--------------
 drivers/platform/x86/amd/hsmp/hsmp.h |  4 +-
 drivers/platform/x86/amd/hsmp/plat.c | 12 +++---
 4 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 61c072216fb7..6f8e7962266a 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -194,13 +194,13 @@ static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
 /* Parse the ACPI table to read the data */
 static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 {
-	struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
+	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
 	int ret;
 
 	sock->sock_ind		= sock_ind;
 	sock->dev		= dev;
 	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
-	plat_dev.is_acpi_device	= true;
+	hsmp_pdev.is_acpi_device	= true;
 
 	sema_init(&sock->hsmp_sem, 1);
 
@@ -244,7 +244,7 @@ int init_acpi(struct device *dev)
 	ret = hsmp_get_uid(dev, &sock_ind);
 	if (ret)
 		return ret;
-	if (sock_ind >= plat_dev.num_sockets)
+	if (sock_ind >= hsmp_pdev.num_sockets)
 		return -EINVAL;
 
 	ret = hsmp_parse_acpi_table(dev, sock_ind);
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 573867c17fd5..78945750d590 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -39,7 +39,7 @@
 #define HSMP_WR			true
 #define HSMP_RD			false
 
-struct hsmp_plat_device plat_dev;
+struct hsmp_plat_device hsmp_pdev;
 
 /*
  * Send a message to the HSMP port via PCI-e config space registers
@@ -176,9 +176,9 @@ int hsmp_send_message(struct hsmp_message *msg)
 	if (ret)
 		return ret;
 
-	if (!plat_dev.sock || msg->sock_ind >= plat_dev.num_sockets)
+	if (!hsmp_pdev.sock || msg->sock_ind >= hsmp_pdev.num_sockets)
 		return -ENODEV;
-	sock = &plat_dev.sock[msg->sock_ind];
+	sock = &hsmp_pdev.sock[msg->sock_ind];
 
 	/*
 	 * The time taken by smu operation to complete is between
@@ -219,7 +219,7 @@ int hsmp_test(u16 sock_ind, u32 value)
 
 	/* Check the response value */
 	if (msg.args[0] != (value + 1)) {
-		dev_err(plat_dev.sock[sock_ind].dev,
+		dev_err(hsmp_pdev.sock[sock_ind].dev,
 			"Socket %d test message failed, Expected 0x%08X, received 0x%08X\n",
 			sock_ind, (value + 1), msg.args[0]);
 		return -EBADE;
@@ -320,7 +320,7 @@ ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 
 static int hsmp_get_tbl_dram_base(u16 sock_ind)
 {
-	struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
+	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
 	struct hsmp_message msg = { 0 };
 	phys_addr_t dram_addr;
 	int ret;
@@ -354,7 +354,7 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
 umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 				  struct bin_attribute *battr, int id)
 {
-	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
+	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
 		return battr->attr.mode;
 	else
 		return 0;
@@ -362,17 +362,17 @@ umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 
 static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock_ind)
 {
-	struct bin_attribute *hattr = &plat_dev.sock[sock_ind].hsmp_attr;
+	struct bin_attribute *hattr = &hsmp_pdev.sock[sock_ind].hsmp_attr;
 
 	sysfs_bin_attr_init(hattr);
 	hattr->attr.name	= HSMP_METRICS_TABLE_NAME;
 	hattr->attr.mode	= 0444;
 	hattr->read		= hsmp_metric_tbl_read;
 	hattr->size		= sizeof(struct hsmp_metric_table);
-	hattr->private		= &plat_dev.sock[sock_ind];
+	hattr->private		= &hsmp_pdev.sock[sock_ind];
 	hattrs[0]		= hattr;
 
-	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
+	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
 		return hsmp_get_tbl_dram_base(sock_ind);
 	else
 		return 0;
@@ -409,7 +409,7 @@ int hsmp_cache_proto_ver(u16 sock_ind)
 
 	ret = hsmp_send_message(&msg);
 	if (!ret)
-		plat_dev.proto_ver = msg.args[0];
+		hsmp_pdev.proto_ver = msg.args[0];
 
 	return ret;
 }
@@ -441,11 +441,11 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 	 * Hence allocate memory for all the sockets at once instead of allocating
 	 * on each probe.
 	 */
-	if (!plat_dev.is_probed) {
-		plat_dev.sock = devm_kcalloc(&pdev->dev, plat_dev.num_sockets,
-					     sizeof(*plat_dev.sock),
-					     GFP_KERNEL);
-		if (!plat_dev.sock)
+	if (!hsmp_pdev.is_probed) {
+		hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
+					      sizeof(*hsmp_pdev.sock),
+					      GFP_KERNEL);
+		if (!hsmp_pdev.sock)
 			return -ENOMEM;
 	}
 	if (check_acpi_support(&pdev->dev)) {
@@ -468,19 +468,19 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
 	}
 
-	if (!plat_dev.is_probed) {
-		plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
-		plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
-		plat_dev.hsmp_device.fops	= &hsmp_fops;
-		plat_dev.hsmp_device.parent	= &pdev->dev;
-		plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
-		plat_dev.hsmp_device.mode	= 0644;
+	if (!hsmp_pdev.is_probed) {
+		hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
+		hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
+		hsmp_pdev.mdev.fops	= &hsmp_fops;
+		hsmp_pdev.mdev.parent	= &pdev->dev;
+		hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
+		hsmp_pdev.mdev.mode	= 0644;
 
-		ret = misc_register(&plat_dev.hsmp_device);
+		ret = misc_register(&hsmp_pdev.mdev);
 		if (ret)
 			return ret;
 
-		plat_dev.is_probed = true;
+		hsmp_pdev.is_probed = true;
 	}
 
 	return 0;
@@ -493,9 +493,9 @@ static void hsmp_pltdrv_remove(struct platform_device *pdev)
 	 * We register only one misc_device even on multi socket system.
 	 * So, deregister should happen only once.
 	 */
-	if (plat_dev.is_probed) {
-		misc_deregister(&plat_dev.hsmp_device);
-		plat_dev.is_probed = false;
+	if (hsmp_pdev.is_probed) {
+		misc_deregister(&hsmp_pdev.mdev);
+		hsmp_pdev.is_probed = false;
 	}
 }
 
@@ -567,15 +567,15 @@ static int __init hsmp_plt_init(void)
 	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
 	 * if we have N SMN/DF interfaces that ideally means N sockets
 	 */
-	plat_dev.num_sockets = amd_nb_num();
-	if (plat_dev.num_sockets == 0 || plat_dev.num_sockets > MAX_AMD_SOCKETS)
+	hsmp_pdev.num_sockets = amd_nb_num();
+	if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
 		return ret;
 
 	ret = platform_driver_register(&amd_hsmp_driver);
 	if (ret)
 		return ret;
 
-	if (!plat_dev.is_acpi_device) {
+	if (!hsmp_pdev.is_acpi_device) {
 		if (legacy_hsmp_support()) {
 			/* Not ACPI device, but supports HSMP, register a plat_dev */
 			ret = hsmp_plat_dev_register();
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index f465600cb843..9c5b9c263fc1 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -48,7 +48,7 @@ struct hsmp_socket {
 };
 
 struct hsmp_plat_device {
-	struct miscdevice hsmp_device;
+	struct miscdevice mdev;
 	struct hsmp_socket *sock;
 	u32 proto_ver;
 	u16 num_sockets;
@@ -56,7 +56,7 @@ struct hsmp_plat_device {
 	bool is_probed;
 };
 
-extern struct hsmp_plat_device plat_dev;
+extern struct hsmp_plat_device hsmp_pdev;
 
 ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 			     struct bin_attribute *bin_attr, char *buf,
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 85a104859acd..e18cf82478a0 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -56,21 +56,21 @@ int hsmp_create_non_acpi_sysfs_if(struct device *dev)
 	struct attribute_group *attr_grp;
 	u16 i;
 
-	hsmp_attr_grps = devm_kcalloc(dev, plat_dev.num_sockets + 1,
+	hsmp_attr_grps = devm_kcalloc(dev, hsmp_pdev.num_sockets + 1,
 				      sizeof(*hsmp_attr_grps),
 				      GFP_KERNEL);
 	if (!hsmp_attr_grps)
 		return -ENOMEM;
 
 	/* Create a sysfs directory for each socket */
-	for (i = 0; i < plat_dev.num_sockets; i++) {
+	for (i = 0; i < hsmp_pdev.num_sockets; i++) {
 		attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group),
 					GFP_KERNEL);
 		if (!attr_grp)
 			return -ENOMEM;
 
-		snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
-		attr_grp->name			= plat_dev.sock[i].name;
+		snprintf(hsmp_pdev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
+		attr_grp->name			= hsmp_pdev.sock[i].name;
 		attr_grp->is_bin_visible	= hsmp_is_sock_attr_visible;
 		hsmp_attr_grps[i]		= attr_grp;
 
@@ -93,10 +93,10 @@ int init_platform_device(struct device *dev)
 	struct hsmp_socket *sock;
 	int ret, i;
 
-	for (i = 0; i < plat_dev.num_sockets; i++) {
+	for (i = 0; i < hsmp_pdev.num_sockets; i++) {
 		if (!node_to_amd_nb(i))
 			return -ENODEV;
-		sock = &plat_dev.sock[i];
+		sock = &hsmp_pdev.sock[i];
 		sock->root			= node_to_amd_nb(i)->root;
 		sock->sock_ind			= i;
 		sock->dev			= dev;
-- 
2.25.1

