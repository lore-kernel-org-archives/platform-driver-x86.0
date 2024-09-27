Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BCC189F59
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Sep 2024 12:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727438417; cv=fail; b=tBRzErOEaX8wrUgvQyv7IPvR1r1Y3oL3IyiM7bjZFl12BRw1ACta2PnAA0Hm3CmkI+bsZKOLBb6KJF1VgzfN5Dmk+j5zvHQ2N7Slu2crTu8IFNtve8Y0OhB/BdHFVJ+AbCJU74wqfXjY+Wr1ueKZFvwqTX5CUmPkfEfryJ5nLqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727438417; c=relaxed/simple;
	bh=q7IerrsjUbn6D/B7nZueK5Wuk74Y8ZAdO4nWuQDl6kw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C+dXWVqMbMJZh39616qL7WNPJLUsdUGmKzrjUiIZDKsQbpGPBJkvMOrTDsnAaoNt+nCgXRGWMEhKCuEw4mZccGGrdDn5y0Ro+V0B4GjYRFocHoh7z4/6rHTxbb6sUxlDeJUj6zGmJUKvSgSJI8yP8PU02T7k4Ux0rMZGNi0Eyqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cMHbJgjs; arc=fail smtp.client-ip=40.107.94.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cMHbJgjs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nv6a43M6xkgWsg3+02ANPph1KbvePSOXKo7zzGy79wzP+ZEarXWt1mM2SxDrDJMJGPLz15EjQw1oGgVjtFeY+fHj+kXWeHWCj37bA0c273Yov2ocsOFYp52XeoovvA1SgjneSqhm/xcedYehKeIoShRDmsUiqxi33dxH/2YF1ynn1rinToomdUfNkMm6nIftpx4T71cPhRiPVfMu6x+vtKJIiINsJTsYY4PAla+++3+3rUaEZsEtHTeaIASGRXFZ6XFnCO5Awp0pV4Aag9w7X6H7W0THnm2Mn4M3h5sZ5owKUO1m/Svf0uqr92zhlwaBW4HNyAfyr1lRUwlJb7ps4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETa5iBkJgYHnnfRPEMk/XFNwJpiVGeYwqelOHmvv3jo=;
 b=fz+ahp6HOCPBPDKYTAMDa1RwhOMomvNhu1512ugq8T5cjxCDgYndfkRWTqTYKGSbs//NW1zfpcRy9M5bBAp8ECoHVfSSiMzH4ueOb5eF1fNmNsQquKb3f21BZ9HScDkxyhcmxEjmk6wcd6LTJs3npJfDVEGXh5f5ZAa9vtgfcPOA3mW6bsU2iF4gnF5Dg3w7E6WWI1dpv4XSEtPYPISIj/1ie2lJ93KETOqinA6ayvp6MNNlPPNOSrre7NpBlfEVF60MlITTJSrbxe5WSl4J/bUkIfcktlWPn9Hnkf4J2VZmVQWcAmVWvrcfZBJbp0P/CFuU4NCpNU+cTzx8Bw+SIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETa5iBkJgYHnnfRPEMk/XFNwJpiVGeYwqelOHmvv3jo=;
 b=cMHbJgjs1LUZs9kaWOz1rk9pXhODD6fEoI8iDPf+akYXuk+WFL+IFbWJMq3h9PB7KpjzdhpHsHScwKaOg9TU+DHb6OZye1yhIkK3mSRc9tQj5ykXISZYAjygRHtq7qL3gIubnbpxGuhOmU08xdFvQjjkyAOOMcDnw3TvNAjcA9U=
Received: from SN7PR18CA0024.namprd18.prod.outlook.com (2603:10b6:806:f3::33)
 by IA0PR12MB8973.namprd12.prod.outlook.com (2603:10b6:208:48e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 12:00:09 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com (2603:10b6:806:f3::4)
 by SN7PR18CA0024.outlook.office365.com (2603:10b6:806:f3::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.28 via Frontend Transport; Fri, 27 Sep 2024 12:00:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 12:00:09 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 07:00:07 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v8 07/11] platform/x86/amd/hsmp: Change generic plat_dev name to hsmp_pdev
Date: Fri, 27 Sep 2024 11:59:17 +0000
Message-ID: <20240927115921.10909-7-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|IA0PR12MB8973:EE_
X-MS-Office365-Filtering-Correlation-Id: 80c604cb-dd88-4250-6a50-08dcdeebef39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWVxSUdNeE1wOTlONnZqaEgybnJReVNUR004VFA3UXZYNUNNWmJBRmpCSlVy?=
 =?utf-8?B?MmV2RU50TEROai8yZnlCZHdSZVRnQlFxeTFta0VBWEVQaHJIOGNhL05rL0FZ?=
 =?utf-8?B?aHZTWUtGektzandiYnFCMzN1NXhpcHlDRE85WGdJbVAxRDF2bFRzQ2sva3pq?=
 =?utf-8?B?eTA4N1pqSVc2SmJDMGRhUDJiVTZ2VE9mSmExa1hzUFlUVk1WWmIwYld1bmVC?=
 =?utf-8?B?U2doVi9zKzZydHc5L1luVzRaRTlQQXN3bEFXbDhreTE1cHpnRHRXc2JVMm81?=
 =?utf-8?B?TzJSTkc3eHdEVmRnMGx3NVRNTEtZM0V2ZStHVTFmbmpJUmFodG83bEMzZGt0?=
 =?utf-8?B?aVFhVXpEaGZ5V3cxS2MxeGU1ZUt0ZnpJemMvOEh0d2dYaWRFQXExaXVxS3dy?=
 =?utf-8?B?enhsQUcwMUJNNGcrTHNPTDl0OExqNklESHdobU9Sc08yK0FSZ0hPbmhRdks0?=
 =?utf-8?B?c3A0RU84aUpKNlIrWEY4bTk0dU4wY0RLYWgzNmtCbVdyWkM3MTdwaW9RSFpy?=
 =?utf-8?B?MVBNVnBFcS9hRmY5Y1o3aGgrN2NWT2JhZWcyemJxUHBFVFhGYklGaG5qbDNl?=
 =?utf-8?B?OFdFL05LRVdhaXpLcnRzRHRMZk9McVdISHFkRCs2U3FSblZ3VXVrbWNYakVY?=
 =?utf-8?B?QVBHMlVoUy95bXJ2OXZwcHM2M1FhS3hRL1hTazNyNUw4UUR4RGdGM3VxcWtU?=
 =?utf-8?B?T2pjWndDQ1VHMi9NbWVvc3pCd0RyL3FCYWZDMXV0TnNSNS8yWUhtYUxQV1ZB?=
 =?utf-8?B?TmN2c0MzZjh5d2xEbVdxRG9WZlpMc3FsYld1cVhtYzdGa3JZVytiU003MHlp?=
 =?utf-8?B?b3ZSNWtjV25GeFZXdU14d2JIbnAxV0s0RnBUS3RXSllySmhUWlZoUER1R3RJ?=
 =?utf-8?B?TjhXMjVDeGQ0NjJPalN6eGpQVWNQQTdhOEVwUFJ3bjBqUGpYbDg2dUhDbmp1?=
 =?utf-8?B?ckk1U08zcW5kNHBFelFhS0pYOVNMc3VWKzRtb3YyZ2FyaTdNdUV0d1VIdWFr?=
 =?utf-8?B?RVhaa0FtSG52dDUzamFvMkUrbnhTTFhINVV2aTZWemUvR2xCT2NKQ2EyOHor?=
 =?utf-8?B?S25kVE9rUW1tejN1V0RHdEdBN0RmTDZSOGNpaXJsR1Rqb2dtM01Vcm1rN2Fi?=
 =?utf-8?B?SVpaR2x4cWZxSjM5S2VMWHdiZzArNVlaUWZyTlZnL1ZhOVZ6cU1wblBwNExP?=
 =?utf-8?B?ZGw4eklPVUkwY0k4bWFsWS9rSFNRYUtEWnJ5MnNiZWE4MjFGT0c4Q1NscXRH?=
 =?utf-8?B?c2ltb0dPR0V5dkJ6Nk5iRXpBVldUY1dOSTN0Q01sVGF3Y05CM0ZyNCtVTW9t?=
 =?utf-8?B?N1RjTStpajdzZzBXMklhOGpiYURMUktrUjFpZjV0QWhTa1grWXV1SWlJcjB5?=
 =?utf-8?B?M2djcmZrekRGc3JtaUVudm1NY2NqN3hoZHg4NDBLVjVUcE9iRTJIK0JRbjBB?=
 =?utf-8?B?SitpU0ZUNlhkUHdXOGYxNU1wUjNvMjI0eWV2eTRVblJSc3lKUUd5ZlczKy94?=
 =?utf-8?B?cjVaZU1JbDJzTUdLc2daMVppd3pxdlhneDJ1eVMyeG1tWVcrcVdOS3FnVUZY?=
 =?utf-8?B?dFFUUE80UjR2MzhIK2pnNFZUeDh2YVZMQmFPaXRnV2ZZM2d1RmUzK2xZNUJh?=
 =?utf-8?B?WERmMFFiTzBsak8wSzRzTnluZCthWDRUeWFCTS9UV2ZFb2tVV0RhalJTUlJX?=
 =?utf-8?B?MmtjeG9uU1NnS0FKWkowdmowSmdEVklqcXpVaUZzVnF4UlB3OHovd2IyaUpM?=
 =?utf-8?B?UzRGVm8yUDNOdzhVZnNuUlZCYXVPWFVLRTlnUGNaZlovcHB3VDZ6bVBlN0tz?=
 =?utf-8?Q?JnX1O40j/WCQySDnU8d+kORMh8rlLSu29UdPo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 12:00:09.1340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c604cb-dd88-4250-6a50-08dcdeebef39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8973

plat_dev is a commonly used variable name, since its made as extern now,
change it to more specific name.
Also change miscdevice hsmp_device to mdev.

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

