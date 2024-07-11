Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7345A4EB55
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 07:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720683229; cv=fail; b=kFg9AjCAIhJDliDkuauGNc5BIlxIR+2alL0tT7iAF+vYl2Ibj626Y5Pjh2y+mYks+5IUl2tAz4IO+VpXJN9+de6sn+bPqfQA+EIzBE+RLhKaZI0Kp/zh0CXFfeXTLwsPIOpJjN/eg9D4p1hcrCynXHk/QcqU6kuIxPDG3an1dtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720683229; c=relaxed/simple;
	bh=t2tgD1md/lvDtK4+ypAHmahr+LmkYPgN34y4/4B8eQA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ib4j8LlT5AxgAfgvHQBsKIeDK3671CR8QeQXe3lJU7Tc+JxcIV1GyoYAxkjhQCb5kyFhIXpsa1nOyoki4qKEmOjZyNJ0U0lxDfTG0Qv3ODl7kcriTPEaUk/cspcqIBAuKZLoEXkX17DKOALcHu8ykrlMhWbqZTnWbal45S/Rjf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fAFtSNVE; arc=fail smtp.client-ip=40.107.236.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fAFtSNVE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBDAH+3VVpah0UeIEPm9aM8K+QcoScikgF0EIXuQwDmvaZTcLoxkFoo/scjdVDHg6/v0MurBzIgicLuJRb8JHfI+HLDO35AYDWTf1faABkpvDYT8kSAcweAKyd7qfKr6LnMvVyv+uLDoXGPFR4ZpPkrgwiQ3oE44WgQ6HVJPoY53uCFGhwEEXrIDOU/UbvOiaotzQhDcdBD0EQyypuOc5cG4LpbkL6Z8Y4uHjHTg2igaHQO6wnHJ3wbDjG6P2aU/MP1rp+L2Cmkw8oQ0CSMk56j89MDEt0AfJ5y/u+lb6hEeKi69tOxmps8CvRyhXfais7y+k6/PUxzTGSgHSCDKQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EykfnjH9rYwO/Y4szXbYocUW0AP6q1qwp09E/6IZ6xY=;
 b=ym2N+v9f+2350AJC/QQnuVnaLCqHWsr5fywJN16t5Gi4r5zjZ6EIANP35+vdCAlwrBdYvW1GH3DMHM8pS18iUlQoD7bqqbiLhfH2qbbxvSYg3hkTtqIg1ytGxKxcQMWvdcfrcHSzkfCoxc5NGp3MEW/ee0Xp+vJuFEj7TDWy4/+SVKnKu5VqoSTSDqAG8kggPLBqexBS5r2Lub2MVGx16k0LSb1p2y07zM17qmS8ewRi0W1X8NLKXHogb8xwOLlda/k8tY/vqEoKYowwSpVsNTawJjhoAwsvsComHS/vThi8pwiXUsk2ne9xkfdtX/Jh8vSUG7+C+jmEboScvFetCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EykfnjH9rYwO/Y4szXbYocUW0AP6q1qwp09E/6IZ6xY=;
 b=fAFtSNVEHDPnE/5G9d2D4bLSw/HjYE72XJ1YC+ifLuk5/L22Lq8gH7jIukFspmGmnov7X9M5KPVaEvr1iYzNkP0Lq4RVoivv4Vk7ziBomjBCCQDY2R870Yo1n/Fask3cXrDHBs+zYmTfxeSnS+YAGgHCaDP2QqyfIuPTxbIHe+c=
Received: from BL0PR01CA0034.prod.exchangelabs.com (2603:10b6:208:71::47) by
 IA1PR12MB7493.namprd12.prod.outlook.com (2603:10b6:208:41b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 07:33:43 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:71:cafe::5a) by BL0PR01CA0034.outlook.office365.com
 (2603:10b6:208:71::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20 via Frontend
 Transport; Thu, 11 Jul 2024 07:33:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 07:33:42 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Jul
 2024 02:33:40 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v2 04/11] platform/x86/amd/hsmp: Move platform device specific code to plat.c
Date: Thu, 11 Jul 2024 07:33:07 +0000
Message-ID: <20240711073314.2704871-4-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711073314.2704871-1-suma.hegde@amd.com>
References: <20240711073314.2704871-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|IA1PR12MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f0dcda7-3d60-4e56-d8c1-08dca17bca7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vJYqy/0ULkTK9U1SGyzMf11DO1CvGeVa2atWW7LreGMEnZqi0YipOyX5N0Lr?=
 =?us-ascii?Q?dNLKwIBPjge8InhjxEck3gWypPmp0DZNRemFPtw1vjXs3Yf3tIRQ3dn7oTNO?=
 =?us-ascii?Q?tmtEJNsSaH/99yCAn1pDulapJFV4Wes6BBCyFCqohXAIfcBnaRm+YvY3F6h7?=
 =?us-ascii?Q?9hj8+DTzjl3UdGYYrduagBKFRzV/Sp2wT/AengMjRRplytQiTI1OdjOHWZ6b?=
 =?us-ascii?Q?6DPwcpa0KalQZCSHtgNxnSzrosEnz0ZwkTao54bpjMjZIHnzMY36Q3lnVjgh?=
 =?us-ascii?Q?8s3/p5jGQRhtU3gHVVL0LlsS29ECMtzqLs2L6kXMHWnYLpWfNAqo+3oM+KrE?=
 =?us-ascii?Q?6IriYlvaAmIDF3jR9O3OgHtVVgtBRijm2IIACl1Hazl1Z0GFCYaUQPOydEpd?=
 =?us-ascii?Q?VKDWg/cKFSmliKqPzoJVG7dMYrGAUh04ZCeaGEK4JqglPuP0jwEUTQ/4/Tce?=
 =?us-ascii?Q?hL6J01GnIHwrRmestOQ7ziwCYGqJ3fkjbj2tgmIXfBjLSjiyKCM9j7MrRRpT?=
 =?us-ascii?Q?QKFvD3CAXTjX7Z12wVgxwh0X1jXCp/sv7bY2Wf4errT7w6R8Up7/DSPq97kU?=
 =?us-ascii?Q?KtTMgCj9kRrQwBpLsExvwVJsm9KnAg2HYSPTHv5KH4MoPzgCGXUu+9aTcrfO?=
 =?us-ascii?Q?qHBuZEYU/8GACkp/Ujclmf4G2x/t0Sv22IFs8ss69UcOvlJtXSDfApsXErzH?=
 =?us-ascii?Q?tLUrmJZ/aLAC5P6Bm+LxRtn229mcsaaZbhoIeGed4uv7Upq4lFxfNqzcKJzg?=
 =?us-ascii?Q?MwIVLX/OtWsd9aZUutDpiW28Ea2P6NG8m7a3wps5zciG5mEXj/Xl0o0Dv5Pl?=
 =?us-ascii?Q?OFWRkDdxdGN6tWU1fFc1DR2qs6u2TVed/LtvmhNQYIFeteUZQ+u1eLWAGqGZ?=
 =?us-ascii?Q?KjZpungKAGzusDptmmVLSws5+s/GN+Rc4WF1NgrZD1UJUxK1Zj1BZ2xObT8o?=
 =?us-ascii?Q?WpTfyQEsq5tgKKq+arI6SB1nVqneRqqAzYjGQ7VEK07q6Cso87wQ0uDmftLU?=
 =?us-ascii?Q?fBB/aQZmXPukjWwBZb5i5WkPuqK5KqP9+9ny5bXtNJe2en7I+ZXIqtppec2n?=
 =?us-ascii?Q?pGOUCXjXsIQ9v07ce2vnm93KzQOJ3wsvuf3+ELiDxZ2ZNI37H8G2ZvL9vGxu?=
 =?us-ascii?Q?SjvxOILomsZBStd7nm3oxUqo/XK8/0oxT1DLtMBmc+MIhD3peFCMyWf5L4Sa?=
 =?us-ascii?Q?6C0TJgyme0JxsPm298p5QECq2ovhSlebxCOwsCxsJ/s+6txRGXwbY5HgreT2?=
 =?us-ascii?Q?XaPLoX8ECeHBUg5llSw9AXa9iG8PU5o0m76/kx1DjxvPZjI2YNrEDRczgQRJ?=
 =?us-ascii?Q?aCmgsVC8TPm8xHOHwlj7o5DQRxU0MxNT/4yDR7gsuHih8el9ZujvTgMd6bCd?=
 =?us-ascii?Q?9uFzLIHGUBBmrU+Ci2b9JCwxoYCG40UiNrn0KSzIYC8mD1+O9CdFK+tWjPrC?=
 =?us-ascii?Q?uG7tHDaZ+X4lk/ViX3dFBWr0Oim/UgFJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 07:33:42.9412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0dcda7-3d60-4e56-d8c1-08dca17bca7f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7493

Move platform device part to plat.c.

No functinality/logical changes.
Common code which can be used by ACPI and platform device
remains in hsmp.c.
ACPI code in hsmp.c will be moved to acpi.c in next patch.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v1:
1. Include new header file device.h in plat.c
2. Arrange headers in alphabetical order
3. Add an empty line between asm/ and linux/ headers
 
 drivers/platform/x86/amd/hsmp/Makefile |   2 +-
 drivers/platform/x86/amd/hsmp/hsmp.c   | 350 ++-----------------------
 drivers/platform/x86/amd/hsmp/hsmp.h   |  17 ++
 drivers/platform/x86/amd/hsmp/plat.c   | 338 ++++++++++++++++++++++++
 4 files changed, 371 insertions(+), 336 deletions(-)
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
index 2c9ba51b9614..d15a978ff71e 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -12,16 +12,9 @@
 #include "hsmp.h"
 
 #include <asm/amd_hsmp.h>
-#include <asm/amd_nb.h>
-#include <linux/delay.h>
-#include <linux/module.h>
-#include <linux/pci.h>
-#include <linux/platform_device.h>
-#include <linux/acpi.h>
 
-#define DRIVER_NAME		"amd_hsmp"
-#define DRIVER_VERSION		"2.2"
-#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
+#include <linux/acpi.h>
+#include <linux/delay.h>
 
 /* HSMP Status / Error codes */
 #define HSMP_STATUS_NOT_READY	0x00
@@ -36,45 +29,12 @@
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
@@ -253,7 +213,7 @@ int hsmp_send_message(struct hsmp_message *msg)
 }
 EXPORT_SYMBOL_GPL(hsmp_send_message);
 
-static int hsmp_test(u16 sock_ind, u32 value)
+int hsmp_test(u16 sock_ind, u32 value)
 {
 	struct hsmp_message msg = { 0 };
 	int ret;
@@ -283,7 +243,7 @@ static int hsmp_test(u16 sock_ind, u32 value)
 	return ret;
 }
 
-static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 {
 	int __user *arguser = (int  __user *)arg;
 	struct hsmp_message msg = { 0 };
@@ -339,12 +299,6 @@ static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
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
@@ -520,9 +474,9 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
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
@@ -581,8 +535,8 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
 	return 0;
 }
 
-static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-					 struct bin_attribute *battr, int id)
+umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
+				  struct bin_attribute *battr, int id)
 {
 	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
 		return battr->attr.mode;
@@ -611,8 +565,8 @@ static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock
 /* One bin sysfs for metrics table */
 #define NUM_HSMP_ATTRS		1
 
-static int hsmp_create_attr_list(struct attribute_group *attr_grp,
-				 struct device *dev, u16 sock_ind)
+int hsmp_create_attr_list(struct attribute_group *attr_grp,
+			  struct device *dev, u16 sock_ind)
 {
 	struct bin_attribute **hsmp_bin_attrs;
 
@@ -628,37 +582,7 @@ static int hsmp_create_attr_list(struct attribute_group *attr_grp,
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
@@ -681,7 +605,7 @@ static int hsmp_create_acpi_sysfs_if(struct device *dev)
 	return devm_device_add_group(dev, attr_grp);
 }
 
-static int hsmp_cache_proto_ver(u16 sock_ind)
+int hsmp_cache_proto_ver(u16 sock_ind)
 {
 	struct hsmp_message msg = { 0 };
 	int ret;
@@ -697,76 +621,7 @@ static int hsmp_cache_proto_ver(u16 sock_ind)
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
@@ -800,178 +655,3 @@ static int init_acpi(struct device *dev)
 
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
index 5afc7167fac1..1aa33c5633d0 100644
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
index 000000000000..2ed5a9452244
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -0,0 +1,338 @@
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
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
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

