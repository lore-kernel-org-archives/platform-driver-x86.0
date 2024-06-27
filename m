Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2083.outbound.protection.outlook.com [40.107.95.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F331C6B7
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Jun 2024 05:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466833; cv=fail; b=gxfZan4NS8n4SCn/Dj7ZQp+4b4uSCyW4Zc7F8vzBWGrH1gort47xgLFON0RtWe7GzK3WT7MIKqdQhd/jUWEmiNWft1evTz/ozR9zjlVMcRk3e5CPwNRNdA0C8bsYkVmCdGB2c7NAPp0PlAajNL/9xsguxVhpzWr2nsaucn0Ov+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466833; c=relaxed/simple;
	bh=4ZdhQBjDZQYxGvFukQ9kWIHpNTpg79T1E4fH9uwU4Zg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LENz9+dG32etj1Q9V/gpse8z7smwmn3FOq5236g7oDJSHMjAX9tlSi6hfuzHqVoznyA9SPk/TkdTT+BvAkefaWmL01TxRy03AP3br1acsyVIC6Z+FEoz3qVEhzyL49BXmfM2R98HmdpB7OwACzEBf+9T/fVqkc+Ee9oFLzt7bb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZHNqLC7g; arc=fail smtp.client-ip=40.107.95.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZHNqLC7g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHrw3YF0rCTfHSDgzN/2H7AswYTlffYsukl8NxcyUEcl0bxmKTOnXPzQm2SgMLDQ1xpo0usBkNWwtinIXDYHOHEiL18Dt0+qERIYhU12tZEt7ZM2v+M3LGmYsxMug4Uxf+gAhcxPXRSsIa117L6bWQXUxCIoLy/5crOp2qr4Sp222jftk84YyUwug4+PKxWKPj5Gu4U6UChdkw4mOkfzmIE3YomGdpJKAFiGk/1hBqjTQYb4Y9hpq07O+e7IiBcmbppd72tnjyWWzKC8Nca/wavuKW0PppHQB/VGhi5Ze1GGg1qYdtaxWFsvuy8ZE0W9dNCliutMXvpu1fR50a4j0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqWNZXH5eBAQMLLQYzu58O0ws8RnRxSLElimrDCeT5w=;
 b=krtTF1stea27ZO1IhcUs7qXI++A7KmCSYpVjgR7w2AX0hsYwDK5ZUaIS2GxSZ87WAmyhqTESaU9jdqCa+RN1IQJ88KPEJqHr3ftjX2qZhcDi0hqJdanUBSj3Ypbo4GwOse2KT0LYG5vvmb9mIwjtqkfzKoTJyljQQQMcKZjq073swF75VXBWZ2v46wLBk/0ZHfqiTIAMCxbdr5S86T0FT/Mh/lKDA8TWbdESdmD75PyAO4g2Qe/XoKOYQSO4jiF795Ynn0/BxzLIPwIEHwRUqmiroGayQR/keUOAvMo2KQQP47j81gqQFRyKJVn6gMBD5TL9NIqv5PlhmM5G3oNpMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqWNZXH5eBAQMLLQYzu58O0ws8RnRxSLElimrDCeT5w=;
 b=ZHNqLC7gv9dVq4CxqLb0dj/89CbXnO7yhGP/wGJKEojNXtg33UJbk1RVIkRxs1imJUemiKYWyzg+xEqlw+ev0z4EkMixhqPc92F5UFjlFC9LcJBd3dhx4b0V3Gw41uovPihKMsoMvIT+6DbtgUewAHIM2Sn8MqUEvklCJgNvVuo=
Received: from SA1P222CA0180.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::17)
 by PH7PR12MB5781.namprd12.prod.outlook.com (2603:10b6:510:1d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:40:27 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:3c4:cafe::b5) by SA1P222CA0180.outlook.office365.com
 (2603:10b6:806:3c4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Thu, 27 Jun 2024 05:40:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 27 Jun 2024 05:40:27 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Jun
 2024 00:40:25 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 04/10] platform/x86/amd/hsmp: Move platform device specific code to plat.c
Date: Thu, 27 Jun 2024 05:39:52 +0000
Message-ID: <20240627053958.2533860-5-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627053958.2533860-1-suma.hegde@amd.com>
References: <20240627053958.2533860-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|PH7PR12MB5781:EE_
X-MS-Office365-Filtering-Correlation-Id: b6b2d904-537c-44bc-6b6a-08dc966ba688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lVoI6K8olnFqJuCY2C6Qp7HtG4UqbYHi37jWKnEafzb6a0qw9aFUmzLCyLL/?=
 =?us-ascii?Q?inTyCBCQSWDkhz+zuUHaO0eBrc+Uoot3kLbvvTgttCCjbiPYciT1E6frVNf9?=
 =?us-ascii?Q?iA0PUSS+hjcG7ud1Gbg0+ES/MDTVBRPYJfJ+lJQlQK8q0OVxQEpiMUg9X+GY?=
 =?us-ascii?Q?2yedVPjujF8UFw5PzO0rNy9lv6HMsjIXfva05SMi9BRYOiuVr+qwIJ003Sgs?=
 =?us-ascii?Q?0rmk8kbAc7/c0axqvfmZIXohi3ixbqbn012m20ZHlp/YBsG7QbmDmmooPAu8?=
 =?us-ascii?Q?R/zmenbyaGjRQSwOsQ0M+JnY4P8M+VCJIx5VIC9IhlDoqUIee0xBsQVAJV7O?=
 =?us-ascii?Q?jT6Visn8PgydV4s14mbmbWEz2LcFLbBLSD6Hv4CG80Qi9tds6i6d0XBC6qBV?=
 =?us-ascii?Q?vBRd2z6vGYYW1eEGzZR7Xr2LsHtio9JwTzaydPTR018VqYQWLH2bd6wmEQwX?=
 =?us-ascii?Q?8Xh4F7d5PiMsPFfzngk0g33BU+7ryugjL7IUP/IDb7/fSUB98f1z5Ey8IbSd?=
 =?us-ascii?Q?lseB/VXKgPO+4N3sohcfaOx45ZybQrHJoLiAxSn4watf11CE/UnqFekvmIks?=
 =?us-ascii?Q?6TBJ2sIxHsaFKGIxvE5JT5QACLKlgQAavvAew2PMDgz81EXxOhQNgJBZ2Hq0?=
 =?us-ascii?Q?rykYax/ijhxOZlQ7E0Bl64J/mPj1/GchgU93gPywDpHNNC+7fHcTQI5D6A+G?=
 =?us-ascii?Q?WFuuChEUJ8pW2QJ8OrjbaUHRZ9bgjbi7pGvwG/09CXIeItgQDy1CVopECC+4?=
 =?us-ascii?Q?ASaMxq56whJMILILQfCUv06wH1PdTJZRZKNHaFSKd/S4s1XIw5PgomOA1CAf?=
 =?us-ascii?Q?9gvhHaJAFR/5PutkHyywTAIdGzjcPFColONx6fA+pUzvv6/YSA316ok6gBHg?=
 =?us-ascii?Q?d0tyAJcUvNAQI7d11eSgtNXv0Af4RFN19DcTbrLv+AAJ3X+IOjr0dn7YWRq9?=
 =?us-ascii?Q?kH4Dv1W3KUHPmsvfOfQsB4TZtvwFDjwwtkXBO20Rz5wTS/H5+xFZ8nbUOfHA?=
 =?us-ascii?Q?GZLJrhe1IKIH1DmOOYcNuzP5SyQC2MsLXhJQSzcag2PrMMqMvRXJ1dmRhh3W?=
 =?us-ascii?Q?Uwm2te9vQqlnLnStPT5Y/8qd+fkJB63lz7sKBVf+SRQCjHS02GJshttniByo?=
 =?us-ascii?Q?jNqm7PPhX9ikTCEuyN0ru0I718jZlbSY81VHwWezLxd+g6SWIbqzeDQi6tem?=
 =?us-ascii?Q?QXtocxgVnWKNZT8KxJKaEay8BDBRejAKaOfO1IC5TSUH5BCV4CHBCydonyli?=
 =?us-ascii?Q?PLuJUyiz1W55AqMGUIxSqPzmELdr589/seau0z5lQepEQFdwRcsfb5OAYRup?=
 =?us-ascii?Q?CAhzh9NFIymy1tGeoI9Clucf04UBDXiZB9821FZI4Du8lKd25AKMe4GZrFhK?=
 =?us-ascii?Q?TzTTc3cpfj6hLdrhe1kEOZ+wZaWPq4ZX/7JtGndP89Wx+L2w8edJdSOkaXur?=
 =?us-ascii?Q?RGEDZmKv/MvAuQTWaguAq71T2z33ZA8n?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:40:27.8455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b2d904-537c-44bc-6b6a-08dc966ba688
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5781

Move platform device part to plat.c.

No functinality/logical changes.
Common code which can be used by ACPI and platform device
remains in hsmp.c.
ACPI code in hsmp.c will be moved to acpi.c in next patch.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/platform/x86/amd/hsmp/Makefile |   2 +-
 drivers/platform/x86/amd/hsmp/hsmp.c   | 347 +------------------------
 drivers/platform/x86/amd/hsmp/hsmp.h   |  17 ++
 drivers/platform/x86/amd/hsmp/plat.c   | 336 ++++++++++++++++++++++++
 4 files changed, 367 insertions(+), 335 deletions(-)
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
index 2c9ba51b9614..cd4de107a470 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -12,17 +12,9 @@
 #include "hsmp.h"
 
 #include <asm/amd_hsmp.h>
-#include <asm/amd_nb.h>
 #include <linux/delay.h>
-#include <linux/module.h>
-#include <linux/pci.h>
-#include <linux/platform_device.h>
 #include <linux/acpi.h>
 
-#define DRIVER_NAME		"amd_hsmp"
-#define DRIVER_VERSION		"2.2"
-#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
-
 /* HSMP Status / Error codes */
 #define HSMP_STATUS_NOT_READY	0x00
 #define HSMP_STATUS_OK		0x01
@@ -36,45 +28,12 @@
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
 
 static void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
 			       u32 *value, bool write)
@@ -253,7 +212,7 @@ int hsmp_send_message(struct hsmp_message *msg)
 }
 EXPORT_SYMBOL_GPL(hsmp_send_message);
 
-static int hsmp_test(u16 sock_ind, u32 value)
+int hsmp_test(u16 sock_ind, u32 value)
 {
 	struct hsmp_message msg = { 0 };
 	int ret;
@@ -283,7 +242,7 @@ static int hsmp_test(u16 sock_ind, u32 value)
 	return ret;
 }
 
-static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 {
 	int __user *arguser = (int  __user *)arg;
 	struct hsmp_message msg = { 0 };
@@ -339,12 +298,6 @@ static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 	return 0;
 }
 
-static const struct file_operations hsmp_fops = {
-	.owner		= THIS_MODULE,
-	.unlocked_ioctl	= hsmp_ioctl,
-	.compat_ioctl	= hsmp_ioctl,
-};
-
 /* This is the UUID used for HSMP */
 static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
 						0xa6, 0x9f, 0x4e, 0xa2,
@@ -520,9 +473,9 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
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
@@ -581,8 +534,8 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
 	return 0;
 }
 
-static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-					 struct bin_attribute *battr, int id)
+umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+				  struct bin_attribute *battr, int id)
 {
 	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
 		return battr->attr.mode;
@@ -611,8 +564,8 @@ static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock
 /* One bin sysfs for metrics table */
 #define NUM_HSMP_ATTRS		1
 
-static int hsmp_create_attr_list(struct attribute_group *attr_grp,
-				 struct device *dev, u16 sock_ind)
+int hsmp_create_attr_list(struct attribute_group *attr_grp,
+			  struct device *dev, u16 sock_ind)
 {
 	struct bin_attribute **hsmp_bin_attrs;
 
@@ -628,37 +581,7 @@ static int hsmp_create_attr_list(struct attribute_group *attr_grp,
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
-static int hsmp_create_acpi_sysfs_if(struct device *dev)
+int hsmp_create_acpi_sysfs_if(struct device *dev)
 {
 	struct attribute_group *attr_grp;
 	u16 sock_ind;
@@ -681,7 +604,7 @@ static int hsmp_create_acpi_sysfs_if(struct device *dev)
 	return devm_device_add_group(dev, attr_grp);
 }
 
-static int hsmp_cache_proto_ver(u16 sock_ind)
+int hsmp_cache_proto_ver(u16 sock_ind)
 {
 	struct hsmp_message msg = { 0 };
 	int ret;
@@ -697,76 +620,7 @@ static int hsmp_cache_proto_ver(u16 sock_ind)
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
-static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
-	{ACPI_HSMP_DEVICE_HID, 0},
-	{}
-};
-MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
-
-static bool check_acpi_support(struct device *dev)
-{
-	struct acpi_device *adev = ACPI_COMPANION(dev);
-
-	if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids))
-		return true;
-
-	return false;
-}
-
-static int init_acpi(struct device *dev)
+int init_acpi(struct device *dev)
 {
 	u16 sock_ind;
 	int ret;
@@ -800,178 +654,3 @@ static int init_acpi(struct device *dev)
 
 	return ret;
 }
-
-static int hsmp_pltdrv_probe(struct platform_device *pdev)
-{
-	int ret;
-
-	/*
-	 * On ACPI supported BIOS, there is an ACPI HSMP device added for
-	 * each socket, so the per socket probing, but the memory allocated for
-	 * sockets should be contiguous to access it as an array,
-	 * Hence allocate memory for all the sockets at once instead of allocating
-	 * on each probe.
-	 */
-	if (!plat_dev.is_probed) {
-		plat_dev.sock = devm_kcalloc(&pdev->dev, plat_dev.num_sockets,
-					     sizeof(*plat_dev.sock),
-					     GFP_KERNEL);
-		if (!plat_dev.sock)
-			return -ENOMEM;
-	}
-	if (check_acpi_support(&pdev->dev)) {
-		ret = init_acpi(&pdev->dev);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
-			return ret;
-		}
-		ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
-		if (ret)
-			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
-	} else {
-		ret = init_platform_device(&pdev->dev);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
-			return ret;
-		}
-		ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
-		if (ret)
-			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
-	}
-
-	if (!plat_dev.is_probed) {
-		plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
-		plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
-		plat_dev.hsmp_device.fops	= &hsmp_fops;
-		plat_dev.hsmp_device.parent	= &pdev->dev;
-		plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
-		plat_dev.hsmp_device.mode	= 0644;
-
-		ret = misc_register(&plat_dev.hsmp_device);
-		if (ret)
-			return ret;
-
-		plat_dev.is_probed = true;
-	}
-
-	return 0;
-
-}
-
-static void hsmp_pltdrv_remove(struct platform_device *pdev)
-{
-	/*
-	 * We register only one misc_device even on multi socket system.
-	 * So, deregister should happen only once.
-	 */
-	if (plat_dev.is_probed) {
-		misc_deregister(&plat_dev.hsmp_device);
-		plat_dev.is_probed = false;
-	}
-}
-
-static struct platform_driver amd_hsmp_driver = {
-	.probe		= hsmp_pltdrv_probe,
-	.remove_new	= hsmp_pltdrv_remove,
-	.driver		= {
-		.name	= DRIVER_NAME,
-		.acpi_match_table = amd_hsmp_acpi_ids,
-	},
-};
-
-static struct platform_device *amd_hsmp_platdev;
-
-static int hsmp_plat_dev_register(void)
-{
-	int ret;
-
-	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
-	if (!amd_hsmp_platdev)
-		return -ENOMEM;
-
-	ret = platform_device_add(amd_hsmp_platdev);
-	if (ret)
-		platform_device_put(amd_hsmp_platdev);
-
-	return ret;
-}
-
-/*
- * This check is only needed for backward compatibility of previous platforms.
- * All new platforms are expected to support ACPI based probing.
- */
-static bool legacy_hsmp_support(void)
-{
-	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
-		return false;
-
-	switch (boot_cpu_data.x86) {
-	case 0x19:
-		switch (boot_cpu_data.x86_model) {
-		case 0x00 ... 0x1F:
-		case 0x30 ... 0x3F:
-		case 0x90 ... 0x9F:
-		case 0xA0 ... 0xAF:
-			return true;
-		default:
-			return false;
-		}
-	case 0x1A:
-		switch (boot_cpu_data.x86_model) {
-		case 0x00 ... 0x1F:
-			return true;
-		default:
-			return false;
-		}
-	default:
-		return false;
-	}
-
-	return false;
-}
-
-static int __init hsmp_plt_init(void)
-{
-	int ret = -ENODEV;
-
-	/*
-	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
-	 * if we have N SMN/DF interfaces that ideally means N sockets
-	 */
-	plat_dev.num_sockets = amd_nb_num();
-	if (plat_dev.num_sockets == 0 || plat_dev.num_sockets > MAX_AMD_SOCKETS)
-		return ret;
-
-	ret = platform_driver_register(&amd_hsmp_driver);
-	if (ret)
-		return ret;
-
-	if (!plat_dev.is_acpi_device) {
-		if (legacy_hsmp_support()) {
-			/* Not ACPI device, but supports HSMP, register a plat_dev */
-			ret = hsmp_plat_dev_register();
-		} else {
-			/* Not ACPI, Does not support HSMP */
-			pr_info("HSMP is not supported on Family:%x model:%x\n",
-				boot_cpu_data.x86, boot_cpu_data.x86_model);
-			ret = -ENODEV;
-		}
-		if (ret)
-			platform_driver_unregister(&amd_hsmp_driver);
-	}
-
-	return ret;
-}
-
-static void __exit hsmp_plt_exit(void)
-{
-	platform_device_unregister(amd_hsmp_platdev);
-	platform_driver_unregister(&amd_hsmp_driver);
-}
-
-device_initcall(hsmp_plt_init);
-module_exit(hsmp_plt_exit);
-
-MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
-MODULE_VERSION(DRIVER_VERSION);
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index cc11e9303a83..d65ff2acdf3d 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -51,4 +51,21 @@ struct hsmp_plat_device {
 	bool is_acpi_device;
 	bool is_probed;
 };
+
+extern struct hsmp_plat_device plat_dev;
+
+int init_acpi(struct device *dev);
+ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
+			     struct bin_attribute *bin_attr, char *buf,
+			     loff_t off, size_t count);
+int hsmp_create_acpi_sysfs_if(struct device *dev);
+int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
+		      u32 *value, bool write);
+int hsmp_cache_proto_ver(u16 sock_ind);
+long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
+umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+				  struct bin_attribute *battr, int id);
+int hsmp_create_attr_list(struct attribute_group *attr_grp,
+			  struct device *dev, u16 sock_ind);
+int hsmp_test(u16 sock_ind, u32 value);
 #endif /* HSMP_H */
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
new file mode 100644
index 000000000000..0f181688c972
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -0,0 +1,336 @@
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
+#include "hsmp.h"
+
+#include <asm/amd_nb.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/acpi.h>
+
+#define DRIVER_NAME		"amd_hsmp"
+#define DRIVER_VERSION		"2.2"
+#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
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
+int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
+		      u32 *value, bool write)
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
+static const struct file_operations hsmp_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= hsmp_ioctl,
+	.compat_ioctl	= hsmp_ioctl,
+};
+
+static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
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
+static int init_platform_device(struct device *dev)
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
+
+static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
+	{ACPI_HSMP_DEVICE_HID, 0},
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
+
+static bool check_acpi_support(struct device *dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids))
+		return true;
+
+	return false;
+}
+
+static int hsmp_pltdrv_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	/*
+	 * On ACPI supported BIOS, there is an ACPI HSMP device added for
+	 * each socket, so the per socket probing, but the memory allocated for
+	 * sockets should be contiguous to access it as an array,
+	 * Hence allocate memory for all the sockets at once instead of allocating
+	 * on each probe.
+	 */
+	if (!plat_dev.is_probed) {
+		plat_dev.sock = devm_kcalloc(&pdev->dev, plat_dev.num_sockets,
+					     sizeof(*plat_dev.sock),
+					     GFP_KERNEL);
+		if (!plat_dev.sock)
+			return -ENOMEM;
+	}
+
+	if (check_acpi_support(&pdev->dev)) {
+		ret = init_acpi(&pdev->dev);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
+			return ret;
+		}
+		ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
+		if (ret)
+			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
+	} else {
+		ret = init_platform_device(&pdev->dev);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
+			return ret;
+		}
+		ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
+		if (ret)
+			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
+	}
+
+	if (!plat_dev.is_probed) {
+		plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
+		plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
+		plat_dev.hsmp_device.fops	= &hsmp_fops;
+		plat_dev.hsmp_device.parent	= &pdev->dev;
+		plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
+		plat_dev.hsmp_device.mode	= 0644;
+
+		ret = misc_register(&plat_dev.hsmp_device);
+		if (ret)
+			return ret;
+
+		plat_dev.is_probed = true;
+	}
+
+	return 0;
+}
+
+static void hsmp_pltdrv_remove(struct platform_device *pdev)
+{
+	/*
+	 * We register only one misc_device even on multi socket system.
+	 * So, deregister should happen only once.
+	 */
+	if (plat_dev.is_probed) {
+		misc_deregister(&plat_dev.hsmp_device);
+		plat_dev.is_probed = false;
+	}
+}
+
+static struct platform_driver amd_hsmp_driver = {
+	.probe		= hsmp_pltdrv_probe,
+	.remove_new	= hsmp_pltdrv_remove,
+	.driver		= {
+		.name	= DRIVER_NAME,
+		.acpi_match_table = amd_hsmp_acpi_ids,
+	},
+};
+
+static struct platform_device *amd_hsmp_platdev;
+
+static int hsmp_plat_dev_register(void)
+{
+	int ret;
+
+	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
+	if (!amd_hsmp_platdev)
+		return -ENOMEM;
+
+	ret = platform_device_add(amd_hsmp_platdev);
+	if (ret)
+		platform_device_put(amd_hsmp_platdev);
+
+	return ret;
+}
+
+/*
+ * This check is only needed for backward compatibility of previous platforms.
+ * All new platforms are expected to support ACPI based probing.
+ */
+static bool legacy_hsmp_support(void)
+{
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
+		return false;
+
+	switch (boot_cpu_data.x86) {
+	case 0x19:
+		switch (boot_cpu_data.x86_model) {
+		case 0x00 ... 0x1F:
+		case 0x30 ... 0x3F:
+		case 0x90 ... 0x9F:
+		case 0xA0 ... 0xAF:
+			return true;
+		default:
+			return false;
+		}
+	case 0x1A:
+		switch (boot_cpu_data.x86_model) {
+		case 0x00 ... 0x1F:
+			return true;
+		default:
+			return false;
+		}
+	default:
+		return false;
+	}
+
+	return false;
+}
+
+static int __init hsmp_plt_init(void)
+{
+	int ret = -ENODEV;
+
+	/*
+	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
+	 * if we have N SMN/DF interfaces that ideally means N sockets
+	 */
+	plat_dev.num_sockets = amd_nb_num();
+	if (plat_dev.num_sockets == 0 || plat_dev.num_sockets > MAX_AMD_SOCKETS)
+		return ret;
+
+	ret = platform_driver_register(&amd_hsmp_driver);
+	if (ret)
+		return ret;
+
+	if (!plat_dev.is_acpi_device) {
+		if (legacy_hsmp_support()) {
+			/* Not ACPI device, but supports HSMP, register a plat_dev */
+			ret = hsmp_plat_dev_register();
+		} else {
+			/* Not ACPI, Does not support HSMP */
+			pr_info("HSMP is not supported on Family:%x model:%x\n",
+				boot_cpu_data.x86, boot_cpu_data.x86_model);
+			ret = -ENODEV;
+		}
+		if (ret)
+			platform_driver_unregister(&amd_hsmp_driver);
+	}
+
+	return ret;
+}
+
+static void __exit hsmp_plt_exit(void)
+{
+	platform_device_unregister(amd_hsmp_platdev);
+	platform_driver_unregister(&amd_hsmp_driver);
+}
+
+device_initcall(hsmp_plt_init);
+module_exit(hsmp_plt_exit);
+
+MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
+MODULE_VERSION(DRIVER_VERSION);
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

