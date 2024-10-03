Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2053.outbound.protection.outlook.com [40.107.95.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D33C154425
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 11:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727954155; cv=fail; b=Qlb6owmdVdJOIDLAFfrAxCgr0DPyVN+Bcws+RMZMGGPcH1kfAbWOmiNxUWVenwx1yyoT9nxebMTL4PvzylwUAUHq341I+9p3uHv8xfi6PXqKztXkdeEonEbESlvdcVQ9g3TK7dUpmqrdEROCiU8YHAhwpqODdbIrKQi47F8YYZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727954155; c=relaxed/simple;
	bh=HNe+WijCF7H/x2ASJSpqPnbRNcXYxMtZVk3iu4PaMUI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LNNvLTW7XRlaF3PuOPFYaWNHyRWn8YW3+i4/ployyE6VeITUCz1a7DG5xZ9aE57LsKVi+wtQm6ckJcUBI3SKf4NGCvGyWWbGOlRBRd2I3D2+ZF+DwM1faCuqhmci097R/TXIh0YlAb8YKIuBeTygQ9sb3BjGX1YvwsNcwEHlSFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TQ9Xz0xy; arc=fail smtp.client-ip=40.107.95.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TQ9Xz0xy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAaBBFaUvRq1Sb5jkz8Pzq79juhTsyk0I1VgghML2b+VrQ89OpsDLBU+kklTEOCP7O1c6eAr+ZlrGmGwuRJ3qSDLtEm2ejnAA/mg5NsqlUmEhHFuW728S0YVB8vXnCVv88iy4SSt8spd+DK+ObzjUEdovS9VkaWEGTe5bVVQGvyqKSlKXKFcPKpz67QiidHa1c2kawq2UQDyMwOPOa7XpMQaGXqmFWqV9wHmadI3+V48P/O5p5WTsIEtXHGMycx83lbK8YaaQlSs6Jt/6gIJVRJ7utalx4iu+luOM0wmkEOGsBewvz2NscJbdQABkUwD9TOgOmDbYYUSfAFNsZx0hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14Gpab3WygkX4TVsy4LJbEyxIzVW12NfPEqx36e91uI=;
 b=ZHp6y+Y0bHjfvePbKoKcYpf0ZH/zrpjt0M3jrCXRJIjhJYB/F1LWKGOUmX+CAtBQUJp3xYA6744UlP2bxRNtZBuMS5X4Kez3xJ+GBTA73Mll+49FT2mItFQfYxYLVooh7D7yo7yCg5oXrDb2nOnwwptiH/EwSMdc3AzaQKn/CGLblr+jpM2KVG/0qtsFW6KeT1wrf8NQ9hseRo3Wchw2IYsZXtkpk6Sp1K1HJVO1269y0F/2cZOvNmY/lODrM4F2pVVuCGyg0v2xfAKZBmRLuTgmF7W8i7ycx4eBAKt5hnfQU807ItRoDJWC+4uZl7kNWyni4i13XSHIhv5QnTtZUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14Gpab3WygkX4TVsy4LJbEyxIzVW12NfPEqx36e91uI=;
 b=TQ9Xz0xyHDKC05aeOMU3aACUNParP+vuYsVSfh5DVy0GMPvFYqdroBZA+lwsaKBGOXuzEpUSUJvIXdYeUu1QmO7IgYow2vtc4uWzh0RYEjl5DsXacSpYJfLiZ/iTzlRTzNMQp9Wi8i/5jj3OmdtspwE+92S406yMd4JFK5Cnp4Y=
Received: from CH2PR12CA0016.namprd12.prod.outlook.com (2603:10b6:610:57::26)
 by CYYPR12MB8752.namprd12.prod.outlook.com (2603:10b6:930:b9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 11:15:49 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::31) by CH2PR12CA0016.outlook.office365.com
 (2603:10b6:610:57::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.17 via Frontend
 Transport; Thu, 3 Oct 2024 11:15:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 11:15:48 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 06:15:45 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v9 07/11] platform/x86/amd/hsmp: Change generic plat_dev name to hsmp_pdev
Date: Thu, 3 Oct 2024 11:15:11 +0000
Message-ID: <20241003111515.2955700-7-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|CYYPR12MB8752:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c293aff-c3a0-4855-c369-08dce39cbc20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXR4cjh4TjdyZkdodVc4aGNOQ1BVeXBuRGdFcUM0ZUpTdGsxWHhNQldCaS9R?=
 =?utf-8?B?MXVhSzJ1cUhNWDdFT0R6aE9GekZMc00ycXVlcUJzbTVITGFrNDVUVjd5R0lh?=
 =?utf-8?B?ZmwxSnNzOFh2aUx5VFdpU2psRFBCNzNDUzBlaFpWbGFHbmpoSnMxb2pKTkVW?=
 =?utf-8?B?Q1BGRnZrck9RYzVuUFVRUFFOak9HTndJRXdyZGVhaUYxbStNcFQ2ek1CZW5S?=
 =?utf-8?B?TFBkWlAraXUyMWFLUjJod2d0Z0tkLzRIU2h0eWM2S2o4endSYXlTYmtqZ1lt?=
 =?utf-8?B?VElFdHYxUVJ3YkRQT0lpVldHeCt1T0lpQmduL3BkNW00N2ZmWGFqVVNJeURn?=
 =?utf-8?B?T0NhM2xYVWdNRWJYYUlOK0lLMENicFJlRGZGenhtTE9XVkJVRmg4UW42Vkcr?=
 =?utf-8?B?WU9EbmtCUXIzbThadGpRZkM0V0xpeG83Q3JCTjFmUEVUYmNvNkN3b2dlM2h3?=
 =?utf-8?B?c1Zpc2NzRzJrbC93bXpzOGtXSUgyVXJnWUpudkpOY1Z4aW1WM3lKR1FhMDZT?=
 =?utf-8?B?UEJEMXE0TTUwQU83aHhKazFhVk9xRW0rUFduSi9pUGx6eTU4WGl0c3QweWNF?=
 =?utf-8?B?dkRvcFhBUHYyTUVTZ0VnRHp0c0EzYk0rZ2lLcHRZTi9ldXRWNHVtS09IMG9D?=
 =?utf-8?B?K2VSdUluL29xbkVKZWNtS2ZCa3FBWk1VcmswMVdVdFRZQnJUTUVmZ3ZUWmt2?=
 =?utf-8?B?Qm1nemkvK2JrMXJzdWtyV0ZMRFQreVk2T1d6dWljTkIyUjRkZkdPZE54QTdn?=
 =?utf-8?B?aW4vQkJKYTR5VjdTdlFpRGd6TERBbVYvV0lmeDdRdW5OeEJGY0l4WkplRVhR?=
 =?utf-8?B?MjlWS0RRUUhuUjhaajJkdmhCN3VFOGV5SzB0RjNtcUY3aDZaaHR3Z0NDaG5F?=
 =?utf-8?B?M2F3QzBzYUF2QU9HRjBJR0NNZ1ZsWmhOWW1PR2NPYWprclZLc1pHeW5rZWFX?=
 =?utf-8?B?dFo1OFhIUndMb0dRWjJpeXdia1JwL0wwcUQ0RndPUnpkVkVRQm8yOFNic2JD?=
 =?utf-8?B?RmFVaCtNVjdhQkQ0d1RoWXFCSDhTbFByVUlhaXdtOFRmYXVRUlQwTm84WVFt?=
 =?utf-8?B?WStwdzJiVzlPSlJ1TjhIdDVhdWdWSWV3d05QYTAvajVmcVRoNFpGS0FQdmVM?=
 =?utf-8?B?UlQ2ZkV5RHBZNzhFN1FtMjZJSG5zbk5RRW92ZnVLRnZCTDJrb2Rhb3NYaEhV?=
 =?utf-8?B?dHRJdkxtdFFkVEErZFdYS2ZhT2xDeGRJR0JZclFVeEtuNmIwUTF4bEliZk9i?=
 =?utf-8?B?Q2ZldEhIaTZDenAvU3VKdEdhR2UxdzBnSHF1MWkrR043aUFWRXpDZXZtc2Jk?=
 =?utf-8?B?Y2VWUENPcXFsWFFiMzZTR3NUZEVsaXVKY0Z6NklZS1NoVU9oZ3RVVTBIcE5w?=
 =?utf-8?B?L3NvWFhIYmxxS013S3NUUjdKdGtRN2RwSHpxd0huRENLcTZPdnZJVFBFc3Rr?=
 =?utf-8?B?SXV0N0VuR1NSZXFvOUdUWktxK25iZzZxRVhYZTZkQnhZcW1sT2R0b09wUXh6?=
 =?utf-8?B?anhjcmxxY2ZMbHhhZGxDdHJ4UC9Pdy92WnNoYm1peTdqZm9XcFBJdlN2SnVQ?=
 =?utf-8?B?NzlXM284cnJUYlJscnNUaHhNbWxnbXlYVlYzNlJ5czFJRzNVYzdtSnJTdGVE?=
 =?utf-8?B?dU0rMjJBSjMwYVl0N3Z6UG1KR2dwZEJ1Ukt0Q3VVR1BPb1RaOXJMdWlCQ2VS?=
 =?utf-8?B?L3ZNWklNaVRhTGtKUjZ4WGZWRDNERzd4eEY4QVJGczlpMDJuTDRFMXRlL2JR?=
 =?utf-8?B?MjJ5ckNRSktuV0xaempaOTdSZkl6bkxZS2JTQmN6U1gxV1RST3RVaWJkVWdZ?=
 =?utf-8?Q?mpyoR5fsj2zMI5BdtCET2gbh2PVJzFdRuCBPk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 11:15:48.8872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c293aff-c3a0-4855-c369-08dce39cbc20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8752

plat_dev is a commonly used variable name, since its made as extern now,
change it to more specific name.
Also change miscdevice hsmp_device to mdev.

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

