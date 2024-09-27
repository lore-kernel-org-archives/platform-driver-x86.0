Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E77188CBE
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Sep 2024 12:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727438412; cv=fail; b=YVPtCP70FbPJaWjGHkWW5rhJjF38jWH9sxlZrC6UVsMaZ6o+XguZ6YRDgwFwLpnEWrmN2+mSjGFNmK9PHw3gANJU2L9Vdi7ImKphCMnLTuedEo4VNMbEOaP/Ilkn1pUV2D++rvD7lVxbqhGMKWvsTdoa53xoENzbyvCpN+RXeX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727438412; c=relaxed/simple;
	bh=h/tBkvly/m2lSb6nCx5ZTmKltqfW0kGcXlBXnuqp6jU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KD/XcatjDO/9vqvVzsMPL0oVz4C9jfQav5AfvMH0PMwM0pcHvJRO5sn2MsNZ+0TsrjrzVZK1fGszBXL0AoGkNHyn/Pabdcxuox2n2Dc/zaStO2QpBr35Yjt3QmfGe4sm3oSiZQ2uKD6e8Mx/isFwqSM41HWIEBguKyU/vFCpBdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cDV2CTow; arc=fail smtp.client-ip=40.107.220.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cDV2CTow"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7zA+pz7IFWt0yy5YxGUgZSgsBhcDFgoOMqwr6glWfh/OKQTOPdCw8KjmAC59yJP2SZT3RnbBDowD9r22MQTzsWJvHbTW5Su/FZ+Z32DuXKtHeHduHGZogWFTVA0hPgOFr0KYjO8u57pn1qCZUd+ixiIYl5tTTpyDghqSlro6ZLSDDQIrnsrDvVLqd4MjQK5VR3+lJFlYl7/Fx99AnvJeiFrTQBd8dfNvPIgUDFTlfJ3CviL/FwvNkHdipkxezV7Qbwh5TF03Ki0tKj2pt9sqBHS41qW5bjGWSt6HzznR+URq3G8jySGP2QBx1bpmhLFC04zMwrzI2zdoIYCDyFvFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyanLgOaNZonVZ/U3YfiJLj9lpjN0a96PYnpfo4ypN0=;
 b=GiP+32xWi66cyUtCD8AABT8T56Rj7YI3QzB0rcetcYjIGZVQQueWkt700K/6kz+3VM0gPdtSRHpM3XH1zzQi/jHUw+kjn7mTh6D5KZeXBhRCO9SwjG1AkLIr+Ffb+rXqV4xvDBotCEW6+jJyERVsnotmSqgBDgtAD9O2UcHaI5QSwfyH82HCVHDo0b7r5Kpqy0RCle1cIGPYIdDkoBDjdkHX3sEXNbvFoLZ6s3PbxvM/Bqy2NH3bMw5ziUiFTJprA3WQ1qWLMVwtoN4mkqZxaXH9kanbv4sVClLP4UZQG7zh286t6k+XOH43Vb9qtM6bAQvgAXgnQ19SRax6DQ2xng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyanLgOaNZonVZ/U3YfiJLj9lpjN0a96PYnpfo4ypN0=;
 b=cDV2CTow018AHpI5BfxraerrEwLS4G3ikB9H+zxw43lWeba/ZmqDHym2UsmA68mzPrS6ppRfOFzRyIqAAPW3catUhUh7B6rX4OWqanc8DDRiNKphSoMXFfso1cw0QrKV0UdfMGnp12pRlPDV62WbM9jhucowYaelGfw95bfw9Tc=
Received: from SN7P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::32)
 by PH0PR12MB7838.namprd12.prod.outlook.com (2603:10b6:510:287::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 12:00:06 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:806:123:cafe::41) by SN7P220CA0027.outlook.office365.com
 (2603:10b6:806:123::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Fri, 27 Sep 2024 12:00:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 12:00:06 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 07:00:02 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v8 05/11] platform/x86/amd/hsmp: Move platform device specific code to plat.c
Date: Fri, 27 Sep 2024 11:59:15 +0000
Message-ID: <20240927115921.10909-5-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|PH0PR12MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 586170db-8817-411f-1a6c-08dcdeebed7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yzl0disxQWk1M0VHRmVLc1BHU2Z6eDlSWlpyVzdKa1hvSTFmak9aT0s4a0I0?=
 =?utf-8?B?UzlETld3NklETlNRbU5yUXNKOFQ5YzkyRGhuZnQyWW9IcXRDdXQ3VndBMmdO?=
 =?utf-8?B?NjB1TlJlLzE2dnlqVVJKekhGbkFtOFhZenNHaWJaMmR0bHhHNDlvN2JubDUv?=
 =?utf-8?B?Z1FQTHNLblRkTDRJR0hwSXV2aFVSOUlMbFlZb0ZmN0czb1o3T05RaTFlelJi?=
 =?utf-8?B?YzEvVFZtck8zWUY1ZnZ6VGhuazcrYWhuSzNnRlA4L1JuWE5JRDRjWWVEL2lz?=
 =?utf-8?B?VExOMDNBVjhITE9HL0NHUWlJOFBLSEhicW1VMS9iZllDVTI4SFo5NnFTNWVC?=
 =?utf-8?B?VEkvWFl0a3pwTzY0U2lZMElLK2F6T2RoOFhSV2JEck1VRnVzZjVHMWZ0aldu?=
 =?utf-8?B?ZjR3Q2QzNlU3SjIzaEdLMnhvaDVlY25GeVlqeXNLRjZsaHFiNndkYVRLdG94?=
 =?utf-8?B?VG9zdXBCNVhZR3pwUzlEdm9Ha1pDbERha0ZTbUFNNWR3dXFUaFhjVmc3b3dH?=
 =?utf-8?B?VUhqUTRGOFdEU1ZvRnlaSDlwVUpXTkZJV3pZcnkwd3QzMmZ0MXBCcFByZVVr?=
 =?utf-8?B?dW1lOUxJVzFvbXNqV0hHMkVqajRYMFcrZlZ4cjIxZEZJK2tkR3VYNGszdXdV?=
 =?utf-8?B?R1VDWC92ekZ4cEtaRzNDVTUrZi9pNXdHNkYrNGluQUdjZlNQbnA4c2ViZEFs?=
 =?utf-8?B?QUt6K1NyV2wwK3pZQ2pWY0RaWnJ0cDFHQkQ4ZkZ1bkdGaDR1MWxXd0UvYW05?=
 =?utf-8?B?KzJUWStaWkh4WXoxZEJvKzhoK3NGbFFTelcvQXp2Qy8weWZRZjNEZm9KTzBS?=
 =?utf-8?B?VGdnUlJNay9lcUJOMEU1THNOeFlvSnd1ZWFDNFZPYXFRU01aRGRtZWhoQThs?=
 =?utf-8?B?VWpTR21BclFuY2hYVGVwNHVGZGljWFZjcVpXWSttT1gwTU1qK2JSS0F1Qk83?=
 =?utf-8?B?L0s0cmdnYW1sT0hna2tJbmg4OW9xS1QyZVdJNnMza0hGRXV5S1crVmpCMFlP?=
 =?utf-8?B?WHJ3dmRydWRhWEN5OUtiUXNXV2gvTDJ5cmI2U1I3aEhxU2xYd3J4bUdkdkhv?=
 =?utf-8?B?OXdwSUYraC9XSzZOUUlSdFp4V2VISGZLTGsxdWh3OEhaZTZlak9ucnBHMzBC?=
 =?utf-8?B?Z0tUT1Y4VkZ6WEI1Z3EzeFFFMVdWMFByaXRMVkJOQWUwekMwVVJKeDE4NnZL?=
 =?utf-8?B?VDk5eVZVWlNaY2VLK25YMkluVkFVb1FJQWlWaHl3RUxTSWQwZ1dDWldCWXhr?=
 =?utf-8?B?eDZjR1EzdlFDeXdaQXF3VGRlQlpQWnlDMEtQVnZUVE1tdWNsN1ZhLzFranhZ?=
 =?utf-8?B?bElHMnRrd1JGZnZiaytHdEZ6bnAzSjVJODhPR2pSUGhVQ2cxWWhKTWJ2T013?=
 =?utf-8?B?bHkybXNYUis3NUlaOXVpb1BsYjhObzNzUWhHM0R1M1psNEZQU1orbG9ER1h6?=
 =?utf-8?B?MW4rUXlWeHpQa0VENFVrU1AvTU1lN0VxV1VzMFBSeDZzYkJVNGxMZVExVnJK?=
 =?utf-8?B?Tjg2L1loQm41REI3blRWSlZvcFRFdVhqS2tVcnR6QmN0UjgzQVNGS3pOL2Mx?=
 =?utf-8?B?WCtqcHlaM1I4QmtMRXpRRE5zN3VQdHBRWmg2Ymw5VC9acU12cUVhMGdVZGg2?=
 =?utf-8?B?eHMwQ3RxOFA4d3ZweGV5QnRCY1FmbG1DK09ycDRhQjZNb3NkcUtNVTQrYlh0?=
 =?utf-8?B?TGtuTXpQT3JuRFFjbGVMVWgzY0srZDBxVmdhZ0JOUkM5SnJMSHVDU1NreGtO?=
 =?utf-8?B?U2VlbERYUjVJcFBCelh2cUVxdHdPaFFKbWQ0eU42OWF0QmRNbEh1dUxvNFJV?=
 =?utf-8?Q?++52TJNqNOQWPeTF8v/TrnZxsKr491CBIKDYs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 12:00:06.1844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 586170db-8817-411f-1a6c-08dcdeebed7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7838

An upcoming change splits HSMP driver into ACPI and platform device
variants. Prepare for the split by moving platform device part to plat.c.

No functinality/logical changes.
Common code which can be used by ACPI and platform device
remains in hsmp.c.
ACPI code in hsmp.c will be moved to acpi.c in next patch.

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
1. Update commit description.
2. Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com> "

Changes since v3:
1. module init, exit code, probe, remove functions are kept back in hsmp.c
   not added to plat.c in this patch, as per review comment.

Changes since v2:
None

Changes since v1:
1. Include new header file device.h in plat.c
2. Arrange headers in alphabetical order
3. Add an empty line between asm/ and linux/ headers
 
 drivers/platform/x86/amd/hsmp/Makefile |   2 +-
 drivers/platform/x86/amd/hsmp/hsmp.c   | 138 ++-----------------------
 drivers/platform/x86/amd/hsmp/hsmp.h   |  14 +++
 drivers/platform/x86/amd/hsmp/plat.c   | 136 ++++++++++++++++++++++++
 4 files changed, 161 insertions(+), 129 deletions(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/plat.c

diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
index fda64906a5e8..fb8ba04b2f0d 100644
--- a/drivers/platform/x86/amd/hsmp/Makefile
+++ b/drivers/platform/x86/amd/hsmp/Makefile
@@ -5,4 +5,4 @@
 #
 
 obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
-amd_hsmp-objs			:= hsmp.o
+amd_hsmp-objs			:= hsmp.o plat.o
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 9ed1fc0aeb00..6da7c6189020 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -16,7 +16,6 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
-#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
@@ -40,45 +39,12 @@
 #define HSMP_WR			true
 #define HSMP_RD			false
 
-/*
- * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
- * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
- * Below are required SMN address for HSMP Mailbox register offsets in SMU address space
- */
-#define SMN_HSMP_BASE		0x3B00000
-#define SMN_HSMP_MSG_ID		0x0010534
-#define SMN_HSMP_MSG_ID_F1A_M0H	0x0010934
-#define SMN_HSMP_MSG_RESP	0x0010980
-#define SMN_HSMP_MSG_DATA	0x00109E0
-
-#define HSMP_INDEX_REG		0xc4
-#define HSMP_DATA_REG		0xc8
-
 /* These are the strings specified in ACPI table */
 #define MSG_IDOFF_STR		"MsgIdOffset"
 #define MSG_ARGOFF_STR		"MsgArgOffset"
 #define MSG_RESPOFF_STR		"MsgRspOffset"
 
-static struct hsmp_plat_device plat_dev;
-
-static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
-			     u32 *value, bool write)
-{
-	int ret;
-
-	if (!sock->root)
-		return -ENODEV;
-
-	ret = pci_write_config_dword(sock->root, HSMP_INDEX_REG,
-				     sock->mbinfo.base_addr + offset);
-	if (ret)
-		return ret;
-
-	ret = (write ? pci_write_config_dword(sock->root, HSMP_DATA_REG, *value)
-		     : pci_read_config_dword(sock->root, HSMP_DATA_REG, value));
-
-	return ret;
-}
+struct hsmp_plat_device plat_dev;
 
 static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
 			      u32 *value, bool write)
@@ -248,7 +214,7 @@ int hsmp_send_message(struct hsmp_message *msg)
 }
 EXPORT_SYMBOL_GPL(hsmp_send_message);
 
-static int hsmp_test(u16 sock_ind, u32 value)
+int hsmp_test(u16 sock_ind, u32 value)
 {
 	struct hsmp_message msg = { 0 };
 	int ret;
@@ -516,9 +482,9 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 	return hsmp_read_acpi_dsd(sock);
 }
 
-static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
-				    struct bin_attribute *bin_attr, char *buf,
-				    loff_t off, size_t count)
+ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
+			     struct bin_attribute *bin_attr, char *buf,
+			     loff_t off, size_t count)
 {
 	struct hsmp_socket *sock = bin_attr->private;
 	struct hsmp_message msg = { 0 };
@@ -577,8 +543,8 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
 	return 0;
 }
 
-static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-					 struct bin_attribute *battr, int id)
+umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+				  struct bin_attribute *battr, int id)
 {
 	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
 		return battr->attr.mode;
@@ -607,8 +573,8 @@ static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock
 /* One bin sysfs for metrics table */
 #define NUM_HSMP_ATTRS		1
 
-static int hsmp_create_attr_list(struct attribute_group *attr_grp,
-				 struct device *dev, u16 sock_ind)
+int hsmp_create_attr_list(struct attribute_group *attr_grp,
+			  struct device *dev, u16 sock_ind)
 {
 	struct bin_attribute **hsmp_bin_attrs;
 
@@ -624,36 +590,6 @@ static int hsmp_create_attr_list(struct attribute_group *attr_grp,
 	return hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, sock_ind);
 }
 
-static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
-{
-	const struct attribute_group **hsmp_attr_grps;
-	struct attribute_group *attr_grp;
-	u16 i;
-
-	hsmp_attr_grps = devm_kcalloc(dev, plat_dev.num_sockets + 1,
-				      sizeof(*hsmp_attr_grps),
-				      GFP_KERNEL);
-	if (!hsmp_attr_grps)
-		return -ENOMEM;
-
-	/* Create a sysfs directory for each socket */
-	for (i = 0; i < plat_dev.num_sockets; i++) {
-		attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group),
-					GFP_KERNEL);
-		if (!attr_grp)
-			return -ENOMEM;
-
-		snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
-		attr_grp->name			= plat_dev.sock[i].name;
-		attr_grp->is_bin_visible	= hsmp_is_sock_attr_visible;
-		hsmp_attr_grps[i]		= attr_grp;
-
-		hsmp_create_attr_list(attr_grp, dev, i);
-	}
-
-	return device_add_groups(dev, hsmp_attr_grps);
-}
-
 static int hsmp_create_acpi_sysfs_if(struct device *dev)
 {
 	struct attribute_group *attr_grp;
@@ -677,7 +613,7 @@ static int hsmp_create_acpi_sysfs_if(struct device *dev)
 	return devm_device_add_group(dev, attr_grp);
 }
 
-static int hsmp_cache_proto_ver(u16 sock_ind)
+int hsmp_cache_proto_ver(u16 sock_ind)
 {
 	struct hsmp_message msg = { 0 };
 	int ret;
@@ -693,60 +629,6 @@ static int hsmp_cache_proto_ver(u16 sock_ind)
 	return ret;
 }
 
-static inline bool is_f1a_m0h(void)
-{
-	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
-		return true;
-
-	return false;
-}
-
-static int init_platform_device(struct device *dev)
-{
-	struct hsmp_socket *sock;
-	int ret, i;
-
-	for (i = 0; i < plat_dev.num_sockets; i++) {
-		if (!node_to_amd_nb(i))
-			return -ENODEV;
-		sock = &plat_dev.sock[i];
-		sock->root			= node_to_amd_nb(i)->root;
-		sock->sock_ind			= i;
-		sock->dev			= dev;
-		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
-		sock->amd_hsmp_rdwr		= amd_hsmp_pci_rdwr;
-
-		/*
-		 * This is a transitional change from non-ACPI to ACPI, only
-		 * family 0x1A, model 0x00 platform is supported for both ACPI and non-ACPI.
-		 */
-		if (is_f1a_m0h())
-			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID_F1A_M0H;
-		else
-			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
-
-		sock->mbinfo.msg_resp_off	= SMN_HSMP_MSG_RESP;
-		sock->mbinfo.msg_arg_off	= SMN_HSMP_MSG_DATA;
-		sema_init(&sock->hsmp_sem, 1);
-
-		/* Test the hsmp interface on each socket */
-		ret = hsmp_test(i, 0xDEADBEEF);
-		if (ret) {
-			dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
-				boot_cpu_data.x86, boot_cpu_data.x86_model);
-			dev_err(dev, "Is HSMP disabled in BIOS ?\n");
-			return ret;
-		}
-		ret = hsmp_cache_proto_ver(i);
-		if (ret) {
-			dev_err(dev, "Failed to read HSMP protocol version\n");
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
 static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
 	{ACPI_HSMP_DEVICE_HID, 0},
 	{}
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index d54b9681d514..d59a9efb4799 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -55,4 +55,18 @@ struct hsmp_plat_device {
 	bool is_acpi_device;
 	bool is_probed;
 };
+
+extern struct hsmp_plat_device plat_dev;
+
+ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
+			     struct bin_attribute *bin_attr, char *buf,
+			     loff_t off, size_t count);
+int hsmp_create_non_acpi_sysfs_if(struct device *dev);
+int hsmp_cache_proto_ver(u16 sock_ind);
+umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+				  struct bin_attribute *battr, int id);
+int hsmp_create_attr_list(struct attribute_group *attr_grp,
+			  struct device *dev, u16 sock_ind);
+int hsmp_test(u16 sock_ind, u32 value);
+int init_platform_device(struct device *dev);
 #endif /* HSMP_H */
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
new file mode 100644
index 000000000000..85a104859acd
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD HSMP Platform Driver
+ * Copyright (c) 2024, AMD.
+ * All Rights Reserved.
+ *
+ * This file provides platform device implementations.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <asm/amd_nb.h>
+
+#include <linux/device.h>
+#include <linux/pci.h>
+#include <linux/sysfs.h>
+
+#include "hsmp.h"
+
+/*
+ * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
+ * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
+ * Below are required SMN address for HSMP Mailbox register offsets in SMU address space
+ */
+#define SMN_HSMP_BASE		0x3B00000
+#define SMN_HSMP_MSG_ID		0x0010534
+#define SMN_HSMP_MSG_ID_F1A_M0H	0x0010934
+#define SMN_HSMP_MSG_RESP	0x0010980
+#define SMN_HSMP_MSG_DATA	0x00109E0
+
+#define HSMP_INDEX_REG		0xc4
+#define HSMP_DATA_REG		0xc8
+
+static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
+			     u32 *value, bool write)
+{
+	int ret;
+
+	if (!sock->root)
+		return -ENODEV;
+
+	ret = pci_write_config_dword(sock->root, HSMP_INDEX_REG,
+				     sock->mbinfo.base_addr + offset);
+	if (ret)
+		return ret;
+
+	ret = (write ? pci_write_config_dword(sock->root, HSMP_DATA_REG, *value)
+		     : pci_read_config_dword(sock->root, HSMP_DATA_REG, value));
+
+	return ret;
+}
+
+int hsmp_create_non_acpi_sysfs_if(struct device *dev)
+{
+	const struct attribute_group **hsmp_attr_grps;
+	struct attribute_group *attr_grp;
+	u16 i;
+
+	hsmp_attr_grps = devm_kcalloc(dev, plat_dev.num_sockets + 1,
+				      sizeof(*hsmp_attr_grps),
+				      GFP_KERNEL);
+	if (!hsmp_attr_grps)
+		return -ENOMEM;
+
+	/* Create a sysfs directory for each socket */
+	for (i = 0; i < plat_dev.num_sockets; i++) {
+		attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group),
+					GFP_KERNEL);
+		if (!attr_grp)
+			return -ENOMEM;
+
+		snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
+		attr_grp->name			= plat_dev.sock[i].name;
+		attr_grp->is_bin_visible	= hsmp_is_sock_attr_visible;
+		hsmp_attr_grps[i]		= attr_grp;
+
+		hsmp_create_attr_list(attr_grp, dev, i);
+	}
+
+	return device_add_groups(dev, hsmp_attr_grps);
+}
+
+static inline bool is_f1a_m0h(void)
+{
+	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
+		return true;
+
+	return false;
+}
+
+int init_platform_device(struct device *dev)
+{
+	struct hsmp_socket *sock;
+	int ret, i;
+
+	for (i = 0; i < plat_dev.num_sockets; i++) {
+		if (!node_to_amd_nb(i))
+			return -ENODEV;
+		sock = &plat_dev.sock[i];
+		sock->root			= node_to_amd_nb(i)->root;
+		sock->sock_ind			= i;
+		sock->dev			= dev;
+		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
+		sock->amd_hsmp_rdwr		= amd_hsmp_pci_rdwr;
+
+		/*
+		 * This is a transitional change from non-ACPI to ACPI, only
+		 * family 0x1A, model 0x00 platform is supported for both ACPI and non-ACPI.
+		 */
+		if (is_f1a_m0h())
+			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID_F1A_M0H;
+		else
+			sock->mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
+
+		sock->mbinfo.msg_resp_off	= SMN_HSMP_MSG_RESP;
+		sock->mbinfo.msg_arg_off	= SMN_HSMP_MSG_DATA;
+		sema_init(&sock->hsmp_sem, 1);
+
+		/* Test the hsmp interface on each socket */
+		ret = hsmp_test(i, 0xDEADBEEF);
+		if (ret) {
+			dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
+				boot_cpu_data.x86, boot_cpu_data.x86_model);
+			dev_err(dev, "Is HSMP disabled in BIOS ?\n");
+			return ret;
+		}
+
+		ret = hsmp_cache_proto_ver(i);
+		if (ret) {
+			dev_err(dev, "Failed to read HSMP protocol version\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
-- 
2.25.1

