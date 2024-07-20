Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD47E1EB40
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jul 2024 17:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721497601; cv=fail; b=g5huZl2qacKqeIpfNt6oowg8IAFrlpNl1ufTs4Jlv210eRjg2V3S0/uqmUl03WiLe0achIdFRNMztOsdxwZheN+kH6GKStMDc3ckS/TI+suAdHGcNUEVT3ewtsbCtpdwglpCjqQNIQ7XtoAdKfmNjU0Kzc/XePolocSWbq88cik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721497601; c=relaxed/simple;
	bh=x3LngRlDLsEVv4ykbWPNVAAJc7+YvysQLL83QXYYBvg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bBFoWYkNNTD/tNQhYPxdshS3KQU+EkA314McvXI6Jln/GnpQqIAW8gis9V+xq+jR/vXOwCpxrUYMZFE7X5m5fmmoCC04EVtzv7uwBhlnGeN61xVEM15+Kxx+v+gB4QWv2L1UtiqO3jicRqfADCjXZvXUrP3xbpwI5955uv0IzFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ya63fxrO; arc=fail smtp.client-ip=40.107.244.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ya63fxrO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o98QhgqDTNxwXu015zB5x7xLXdN9x8e9KyBuP0dyDcOnhX5/wctP0+OJCgyhNTMV+q5nWeUtx4Wfee/WsP9kl5H9m4gqIyYJ1xVAIlnPmIqtBOAR9AyEVuf6uLcTG8LtO3aTwLJt11nQb7DGaWEFGrXF68fPD3MAXJzdFRzMpYrQMWiD4DEwKvgwh7qjlhqNHhqm9DGz6ZTbqxkY+9aUDiCcb+3jlfPxu0xk/lMLOXPi0SJdXP3VCpMFQQdN8GtqC5I3Cj0UEtryJmhLaVeY8WpjzBpi68kzjOPkN+qNeJ2O2IdikCLx39veAMC+/KftrCilqCd6bGFeYTrOY1khjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOYiw15y3pIaQ1i12n0z6nAGb1v3WDssTT6qCbN9XwA=;
 b=ViaVWVvWXyYpLICdWRbMdKm90zR6XykiX62uWS/lcSeQPY2woUQeMqfb/YDAGRsdDl8eXhQ5AK8X7bSzqTywYXhd4FTDKVGXeyUeqH3NjOE+qn+yv+OUNS1lOWNGhF8/UuYFEjH18Vi1AfqvzowxXibnEqpat8vsu3eiLoachIw5SicEBb3rrcvBbFpT0zKgDIIic/SGw5fsv4u5BnWNez0+hEkhKH6zxm6N1bdSPZXA+ilttVMPp7A4OabtJ2s1+5C8vwGbF0QCLWkoFnOYPnUoW7znTW4bkwoImx0rhVJN7vlq/3UAq6K+AY70WYCIYVTNMEC946EjyTWjgIKlqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOYiw15y3pIaQ1i12n0z6nAGb1v3WDssTT6qCbN9XwA=;
 b=Ya63fxrOIUOPVOYdL+k5G1HHVji99Xz+NAX++f+hgv1fYUNxio+ROvXWo/Tn5CVoMi3qhXtQyPa50w9TNY2IIFmXjpqztLsxH1gtU32Y9vqIiwlRvDCoOkkzqjaS7eUO42wWKGmBul6+fMSQJW2KOFOsznsuh4zpeTJnKQDy0zs=
Received: from DM6PR01CA0016.prod.exchangelabs.com (2603:10b6:5:296::21) by
 DM6PR12MB4185.namprd12.prod.outlook.com (2603:10b6:5:216::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.14; Sat, 20 Jul 2024 17:46:34 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:296:cafe::9f) by DM6PR01CA0016.outlook.office365.com
 (2603:10b6:5:296::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Sat, 20 Jul 2024 17:46:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Sat, 20 Jul 2024 17:46:34 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 20 Jul
 2024 12:46:32 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v3 06/11] platform/x86/amd/hsmp: Change generic plat_dev name to hsmp_pdev
Date: Sat, 20 Jul 2024 17:45:47 +0000
Message-ID: <20240720174552.946255-6-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240720174552.946255-1-suma.hegde@amd.com>
References: <20240720174552.946255-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|DM6PR12MB4185:EE_
X-MS-Office365-Filtering-Correlation-Id: f28e0586-7a11-4f89-f480-08dca8e3e5ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aISDWfOrIgPBCyen9nTnUPSIfqbRFPDjWM0XhQw7b5Zdg0zye+HrPskVdD8g?=
 =?us-ascii?Q?tDpVO8/EFhQOPFoy6BHcCoNIxMz0ytvwFgrL2XGnWXNQW6vSuo5gQfCSjpfb?=
 =?us-ascii?Q?Om2ZVCtITzKR0h0UQCJYr6gr2h0Y5hI8A5aGjtADGD73Y940mc7ptVrWL26W?=
 =?us-ascii?Q?ciAbFnD2maxBFoveOINCLUU1ha8H5fD5EKWxsF74ZroYB22gwOf2mtS5a/Mu?=
 =?us-ascii?Q?SyFLerjpjllfJXla8uNPVRum4qzEoWWNYcB+biJpQ/dje7lkofCLzgPc2Pgz?=
 =?us-ascii?Q?+DrOBvg8gSFpmcRFkx0gz2mNBa/Fr6ummaTrLJRCJSRfiHfdvYsu5e03CWUa?=
 =?us-ascii?Q?oapxTC06VPc3aSp33gfpOCmFqT65D9Y5Zub1R/rO85/QIIAGDRPUP4CSZuBh?=
 =?us-ascii?Q?lbL74xg0k65ui6g54o7be1/Ewg4jk+HTlg1HAE5mfZfAyor1+TlE5IzxjEAX?=
 =?us-ascii?Q?S0U/no+BCJRKg7zLB7po5B+ISd4u4QlZtnisIMEeY22LxGk3nnyIBpt7zTc+?=
 =?us-ascii?Q?lgQOJ8RgcpTOT2ET8siuKWJIrkCxNFkfHHbl02WQWwTE+YgOP80YVaFYa1j2?=
 =?us-ascii?Q?Jo6oM5yMz9lecB0KK9LDelk3H9FVahtcTNo3cLQreDvXDjpoJYzMQNCuY5Dn?=
 =?us-ascii?Q?1FF6A53VzxREjyv007SKYIGA5BXkhX0y6yKmimlx7jJ4sTGSMYJG0JGujKlC?=
 =?us-ascii?Q?5KZp7oG5Ngr9uPmH0mJsvDEGJtDXPrqMl2k1TsHjzzNyE/KGXUssmO/CtmB2?=
 =?us-ascii?Q?7/VbEExHBx6RgAIvwsDOPid4OxlnNy78JXeVmC1dTEU5wECcw8czlsSDyDUg?=
 =?us-ascii?Q?E2wFjDZvpL+Qej0sf49J5L5xmkdRKA943QlxGgdovL7lVHKDia/5V4tNvGiz?=
 =?us-ascii?Q?mCf15wn6DlGJS/+nliXrhhfyiEcBGopOCa1OKv8i0h5dS1uxzdpovhN1Pacj?=
 =?us-ascii?Q?yZwlMiMFYBiDRRyBoy2uDFdwIayQtt6IMfFqMeMYb5Mh2QJEc3bIc4nh2Gkf?=
 =?us-ascii?Q?XrHb+rzwemOE55VXfLUkFhb8IjE7XwpMAKYN8PYh5jpVgDrzCZW5nYBowGQ2?=
 =?us-ascii?Q?k88/HDqkkJHiXOPCRJC+/EWUrRM30VZKlRFA61nrAJiB4VYlSV9ngWHo7ptS?=
 =?us-ascii?Q?EtSb8akw/BNTzpNderIcTeg7rTNC73YpDqtyt466eyhV5/X8gKWoiwyB3Kby?=
 =?us-ascii?Q?kqFM7WxaHKctM5xIHZk1zc+L0nZJZJIxK4FAb7PPcsSQlyBSAVhJEyqZ7hsh?=
 =?us-ascii?Q?vvAMcGWQjCTWCo9Lbg9OiT5c/1Lvn8R+CsHGUNSrmKlzzlOZLXtlp7K/EQOP?=
 =?us-ascii?Q?fgxOG9yX+G0B6FKasEe+WKxIAzNpc6IgEko7Sk4HRHMxgSq/OfBm6AjKM3gf?=
 =?us-ascii?Q?M0UbxBOmqpIs0TrmiU+/gJO0JkQPDQo2XQiDApzl4h+4XDkid5WotllhlPt1?=
 =?us-ascii?Q?GRb63Ruz660Dq2WYwSCpIefkcXxXZ+q+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2024 17:46:34.7228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f28e0586-7a11-4f89-f480-08dca8e3e5ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4185

plat_dev is a commonly used variable name, since its made as extern now,
change it to more specific name.
Also change miscdevice hsmp_device to mdev.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v2:
None
Changes since v1:
1. This is a new patch to rename generic name "plat_dev"
   in hsmp.h, hsmp.c, plat.c and acpi.c to more specific name "hsmp_pdev"
2. Rename miscdevice hsmp_device to mdev.

 drivers/platform/x86/amd/hsmp/acpi.c | 10 +++---
 drivers/platform/x86/amd/hsmp/hsmp.c | 22 ++++++------
 drivers/platform/x86/amd/hsmp/hsmp.h |  4 +--
 drivers/platform/x86/amd/hsmp/plat.c | 52 ++++++++++++++--------------
 4 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index eca324774141..46cb86d5d550 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -191,12 +191,12 @@ static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
 /* Parse the ACPI table to read the data */
 static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 {
-	struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
+	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
 	int ret;
 
-	sock->sock_ind		= sock_ind;
-	sock->dev		= dev;
-	plat_dev.is_acpi_device	= true;
+	sock->sock_ind			= sock_ind;
+	sock->dev			= dev;
+	hsmp_pdev.is_acpi_device	= true;
 
 	sema_init(&sock->hsmp_sem, 1);
 
@@ -240,7 +240,7 @@ int init_acpi(struct device *dev)
 	ret = hsmp_get_uid(dev, &sock_ind);
 	if (ret)
 		return ret;
-	if (sock_ind >= plat_dev.num_sockets)
+	if (sock_ind >= hsmp_pdev.num_sockets)
 		return -EINVAL;
 
 	ret = hsmp_parse_acpi_table(dev, sock_ind);
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 8473c2d1258b..14edaace4379 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -29,12 +29,12 @@
 #define HSMP_WR			true
 #define HSMP_RD			false
 
-struct hsmp_plat_device plat_dev;
+struct hsmp_plat_device hsmp_pdev;
 
 static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
 			 u32 *value, bool write)
 {
-	if (plat_dev.is_acpi_device)
+	if (hsmp_pdev.is_acpi_device)
 		amd_hsmp_acpi_rdwr(sock, offset, value, write);
 	else
 		return amd_hsmp_pci_rdwr(sock, offset, value, write);
@@ -177,9 +177,9 @@ int hsmp_send_message(struct hsmp_message *msg)
 	if (ret)
 		return ret;
 
-	if (!plat_dev.sock || msg->sock_ind >= plat_dev.num_sockets)
+	if (!hsmp_pdev.sock || msg->sock_ind >= hsmp_pdev.num_sockets)
 		return -ENODEV;
-	sock = &plat_dev.sock[msg->sock_ind];
+	sock = &hsmp_pdev.sock[msg->sock_ind];
 
 	/*
 	 * The time taken by smu operation to complete is between
@@ -220,7 +220,7 @@ int hsmp_test(u16 sock_ind, u32 value)
 
 	/* Check the response value */
 	if (msg.args[0] != (value + 1)) {
-		dev_err(plat_dev.sock[sock_ind].dev,
+		dev_err(hsmp_pdev.sock[sock_ind].dev,
 			"Socket %d test message failed, Expected 0x%08X, received 0x%08X\n",
 			sock_ind, (value + 1), msg.args[0]);
 		return -EBADE;
@@ -315,7 +315,7 @@ ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 
 static int hsmp_get_tbl_dram_base(u16 sock_ind)
 {
-	struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
+	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
 	struct hsmp_message msg = { 0 };
 	phys_addr_t dram_addr;
 	int ret;
@@ -349,7 +349,7 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
 umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 				  struct bin_attribute *battr, int id)
 {
-	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
+	if (hsmp_pdev.proto_ver == HSMP_PROTO_VER6)
 		return battr->attr.mode;
 	else
 		return 0;
@@ -357,17 +357,17 @@ umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 
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
@@ -404,7 +404,7 @@ int hsmp_cache_proto_ver(u16 sock_ind)
 
 	ret = hsmp_send_message(&msg);
 	if (!ret)
-		plat_dev.proto_ver = msg.args[0];
+		hsmp_pdev.proto_ver = msg.args[0];
 
 	return ret;
 }
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 1ff652dc0ef0..a77887d298b6 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -44,7 +44,7 @@ struct hsmp_socket {
 };
 
 struct hsmp_plat_device {
-	struct miscdevice hsmp_device;
+	struct miscdevice mdev;
 	struct hsmp_socket *sock;
 	u32 proto_ver;
 	u16 num_sockets;
@@ -52,7 +52,7 @@ struct hsmp_plat_device {
 	bool is_probed;
 };
 
-extern struct hsmp_plat_device plat_dev;
+extern struct hsmp_plat_device hsmp_pdev;
 
 int init_acpi(struct device *dev);
 ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 2ed5a9452244..c297540bb64c 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -68,21 +68,21 @@ static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
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
 
@@ -105,10 +105,10 @@ static int init_platform_device(struct device *dev)
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
@@ -173,11 +173,11 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
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
 
@@ -201,19 +201,19 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
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
@@ -225,9 +225,9 @@ static void hsmp_pltdrv_remove(struct platform_device *pdev)
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
 
@@ -299,15 +299,15 @@ static int __init hsmp_plt_init(void)
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
-- 
2.25.1

