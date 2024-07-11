Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2048.outbound.protection.outlook.com [40.107.96.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A88614885D
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 07:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720683235; cv=fail; b=ePn5AGDY2qoMb2BNuvWEaYainAv+eRClAXOhqNPyH3PTTQGU80sJ+/tFtg3+zGiegY+QOA+LK2KtZlIYe1O2DX5lbNskySPoxH1rtiIWiuLi9WPU5ewC62TzcVHw0HuXkkLf44KLDz4Wcvy1KuqL0dlik2Kv3p55wyGPKN15SPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720683235; c=relaxed/simple;
	bh=1buVQeUPNQVLNhISQSFJ6EIyzbEjxP/glAOMyD109QU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TeCze96ar2qFKrljlqi/xfSprBrxTAMk6u3zSb432ZczTJnpu/17xHth1yR+EnV6MQkNE4Wh7rQAJLhrGXWjq5hZ27r3Rumwez800He2Ensy4FKmbjvQ9mYOYHlx3W1JGWSRnohTEp5hoLedBNppk6BuHjstPpbWt2r4az08+B0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KBLVHJVd; arc=fail smtp.client-ip=40.107.96.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KBLVHJVd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpzuizKqlGZEpMLPf4IUJ9XwgZgq0ImpjWA5TBTbo2VwM5b2Tfb5i3GHNmFeax0cZzUHc/ItDveIEpEr5UTDUaFyk9aSBkHc+76rqvvCoUJ7WW3ovjOha5J9Lq0HxkeVMhU3reEoPpLnjvGtUjpPzY9AfnOz7tA3KQNP3nnkg/xosKrEQmasnRtgpvuuhgvvkJ9qcjKzt0I83HgtbZmUAXxk9Rn8A2gmj1e4Q23P+P9kT/XuE++fIu6LuIBxJKBgZs/XKS6ndzRu4ThLUkjlpqSnzUErM3sxIkHbZHTMLiMnAPuxrn4oo88II+vbErkWI71I3jESbO1y1jnl/lcM+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oDFQog46eCRyjMsF9/0HRU4f67Hpj2MaBicStU+FJ0=;
 b=ori7rHz6/u97hVsGed5QiFcZK8wiq9ogGJPx90u/0uvEZRBVgipE9ZuIM2VxA7LvdY92MLOEop6ILBDiWDBOImP3idLoM6CRgKi/KfZ0cZ2wjQ7m03ioa/6UpB0ZBOwyZMffO1PmjMyk4rPpbRZQvv9OPpEk8Xtilrec/tkarmjFYZiU/nfetNilePn0aTWrtP6hcGInZAr6mLs8k4eUc6Y/c0oC0Y6Ub1A4Tv2S0VKdCWfQ2Ayl30WaKAcWKvaEpDagrt4pNtsHdRHLhwOvdDE8ZnXsRKyMkKy1UGscygJgcD+LDYNnnYCXTMNhY6b+WfWqKWCgunQbAcSSZCfHBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oDFQog46eCRyjMsF9/0HRU4f67Hpj2MaBicStU+FJ0=;
 b=KBLVHJVdN9NPm7FS7VNCMaIyPESKDBbapo0OQr0pScBQocE3SAHU+lR6xzQtyI0oqvuiH+dHf0eyPTCjkruGHAEi6fJScfopzULz1u+nSRiXcIaz3psJbB8afMw9ciRU0qI4IhRFs/1UBumLAxMpgfxm7pdcF5KmH2lp4iWf1hw=
Received: from BLAPR03CA0134.namprd03.prod.outlook.com (2603:10b6:208:32e::19)
 by SJ2PR12MB7797.namprd12.prod.outlook.com (2603:10b6:a03:4c5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 11 Jul
 2024 07:33:50 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:32e:cafe::a3) by BLAPR03CA0134.outlook.office365.com
 (2603:10b6:208:32e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Thu, 11 Jul 2024 07:33:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 07:33:49 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Jul
 2024 02:33:46 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v2 07/11] platform/x86/amd/hsmp: Create mutually exclusive ACPI and plat drivers
Date: Thu, 11 Jul 2024 07:33:10 +0000
Message-ID: <20240711073314.2704871-7-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|SJ2PR12MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: 37784621-4a66-4b38-e7ce-08dca17bce84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DttSuwrENPO+Atd5o1JErR6jYliaWei/inlwv7f9pYtVwnlks5TIZQ68zsyR?=
 =?us-ascii?Q?/tyftyinA8lMAKiLsXUCc2OBG1jSPHr7hgYKBq3NnLTtCzvps0pUAB9PV1/D?=
 =?us-ascii?Q?bZWE26yrpy130RdvmQMVJ5mo8Df+12Q7sKPyG78zQAyDozZLMO6kix/qi8ps?=
 =?us-ascii?Q?F9jVX7Np3hlXQjd1ZsW52a216dU49nivgqaD9UBu01tOL3b7NViJ/TE6IPxf?=
 =?us-ascii?Q?GdbJYO9QAOz708XQySshpYKh87luZdjD95Mv/wxLsvIxW20HAzuAt4VB22mm?=
 =?us-ascii?Q?owjv8UrZl97kLluis4dLdD3a2rfxcvH2+Vvsr3Lex+lPtioKKQWR1vAe5cyJ?=
 =?us-ascii?Q?8BrpOhS9g4Pq27GyxctXczIKnHD8RvdEA648P00ydSNBrYmhg/j/PEUu9sA9?=
 =?us-ascii?Q?pXNRBphm/zHEHKMSU08LZtFBOJCAD9tdQSNg6j1x92VlIDyzq/VwbJid1yUD?=
 =?us-ascii?Q?RgS6bMUmVOSFb9q5syA1ZnQXPx9eMX7hkmDGEcLQ45QiGroKh9wfwewvefJw?=
 =?us-ascii?Q?zOiPRkXnBUn3yk0Uds9D3gWH4xp8r7gOuBqPbo+FbX6ng9D9GnC/m7S+kUc6?=
 =?us-ascii?Q?2daeXHWdqqN43RlC5EXYaULCRg07KpB0c+LI3CXrIhljirHnBfpqt7DFR/L6?=
 =?us-ascii?Q?iFEFfim8QKJhvSl8ob1Wey/kYdws/n2FO/fr/nwKhw/wzoh+G1Vh5KiGFj12?=
 =?us-ascii?Q?h6/Q/1FFAiM+o+S7q8XBDjZD3t4ome2vJNn7ObrlXu6xTuxzZfkYGgVKiRP+?=
 =?us-ascii?Q?+83f+JMVY9nC8ZhWB/ZmvIFMK0cw6493I+bGpHaBBCT+/1JqI3M1Bv42ZqPI?=
 =?us-ascii?Q?o8CwH5GPuLAc9qaQNP/LZPF0BR8JE3Vvz66JSxEXXtk9lRKkILtT8aZBsBic?=
 =?us-ascii?Q?LY7z89sFHiBaspaaQoEcRfQu3+vyIbHNDytu/yfr5yeAX4KW9aS78+HzE87d?=
 =?us-ascii?Q?SaDAe1pDwDO3n5TZ8V0/Yhl94ileIWnOpHrjIYA3w0sVCRbCtatislQZ2C3S?=
 =?us-ascii?Q?3obc07gLnlZZiN5YW0hJXJnzyDTKTl1UO3dH/Ojp1dEw5K7ASC6lTdQIVmcv?=
 =?us-ascii?Q?YzLPVpUx4PGoI8xqvoY0CdvFlnnu6uhf+KebLFC0Pu4SVmchPZ03FW/dpbC1?=
 =?us-ascii?Q?yDh43D8k4rVJuo+1uauG/n96LiySa8iGUW84RspPQClFfD0YyoVfNxZLUEmv?=
 =?us-ascii?Q?kj/Q+IuzoWe8p7sUywPkGYGFatSd3sgI2Qb9RIAnpyWYlsDSCtISZeWfaRSN?=
 =?us-ascii?Q?WiQJ+mMcjmY3Y2TAEKUM3veumfjx9zqO+kz6VxBCX9PZOOtN/balO4gv0qWv?=
 =?us-ascii?Q?9IGLR+MeWAhCn9Eu0K4cokQ2B5nwwkfVAW2wT/5cwGfO4T/h3KqfNKvC6kSC?=
 =?us-ascii?Q?YtlEHT70f3ADlvm2Hkyz1GFe5+fY9VBF2xXQt8UhGVZuGc+L6U522U5XwLoF?=
 =?us-ascii?Q?/zV8hoTPAZEOClBGlVFYy+cFzvbDniiY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 07:33:49.6696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37784621-4a66-4b38-e7ce-08dca17bce84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7797

Separate the probes for ACPI and platform device drivers.
Provide a Kconfig option to select either the
ACPI or the platform device based driver.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v1:
Rename "plat_dev" to "hsmp_pdev"

 arch/x86/include/asm/amd_hsmp.h        |   2 +-
 drivers/platform/x86/amd/hsmp/Kconfig  |  25 ++++-
 drivers/platform/x86/amd/hsmp/Makefile |  10 +-
 drivers/platform/x86/amd/hsmp/acpi.c   | 119 ++++++++++++++++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.c   |  25 ++---
 drivers/platform/x86/amd/hsmp/hsmp.h   |   8 +-
 drivers/platform/x86/amd/hsmp/plat.c   | 122 +++++++------------------
 7 files changed, 186 insertions(+), 125 deletions(-)

diff --git a/arch/x86/include/asm/amd_hsmp.h b/arch/x86/include/asm/amd_hsmp.h
index 03c2ce3edaf5..ada14e55f9f4 100644
--- a/arch/x86/include/asm/amd_hsmp.h
+++ b/arch/x86/include/asm/amd_hsmp.h
@@ -5,7 +5,7 @@
 
 #include <uapi/asm/amd_hsmp.h>
 
-#if IS_ENABLED(CONFIG_AMD_HSMP)
+#if IS_ENABLED(CONFIG_AMD_HSMP) || IS_ENABLED(CONFIG_AMD_HSMP_ACPI)
 int hsmp_send_message(struct hsmp_message *msg);
 #else
 static inline int hsmp_send_message(struct hsmp_message *msg)
diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
index b55d4ed9bceb..15888a89581a 100644
--- a/drivers/platform/x86/amd/hsmp/Kconfig
+++ b/drivers/platform/x86/amd/hsmp/Kconfig
@@ -3,9 +3,30 @@
 # AMD HSMP Driver
 #
 
+menu "AMD Host System Management Port driver"
+	depends on AMD_NB
+
+config AMD_HSMP_ACPI
+	tristate "AMD HSMP ACPI driver"
+	depends on ACPI
+	help
+	  The driver provides a way for user space tools to monitor and manage
+	  system management functionality on EPYC server CPUs from AMD.
+
+	  Host System Management Port (HSMP) interface is a mailbox interface
+	  between the x86 core and the System Management Unit (SMU) firmware.
+
+	  This driver supports ACPI based probing.
+
+	  You  may enable this, if your platform bios provides an ACPI object
+	  as described in the documentation.
+
+	  If you choose to compile this driver as a module the module will be
+	  called amd_hsmp.
+
 config AMD_HSMP
 	tristate "AMD HSMP Driver"
-	depends on AMD_NB && X86_64 && ACPI
+	depends on AMD_HSMP_ACPI=n
 	help
 	  The driver provides a way for user space tools to monitor and manage
 	  system management functionality on EPYC server CPUs from AMD.
@@ -15,3 +36,5 @@ config AMD_HSMP
 
 	  If you choose to compile this driver as a module the module will be
 	  called amd_hsmp.
+
+endmenu
diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
index 0cc92865c0a2..53ebc462b0f9 100644
--- a/drivers/platform/x86/amd/hsmp/Makefile
+++ b/drivers/platform/x86/amd/hsmp/Makefile
@@ -4,5 +4,11 @@
 # AMD HSMP Driver
 #
 
-obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
-amd_hsmp-objs			:= hsmp.o plat.o acpi.o
+ifneq ($(CONFIG_AMD_HSMP), )
+obj-$(CONFIG_AMD_HSMP)          += amd_hsmp.o
+amd_hsmp-objs = hsmp.o plat.o
+endif
+ifneq ($(CONFIG_AMD_HSMP_ACPI), )
+obj-$(CONFIG_AMD_HSMP_ACPI)     += amd_hsmp.o
+amd_hsmp-objs = hsmp.o acpi.o
+endif
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 46cb86d5d550..86100943aadc 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -11,29 +11,43 @@
 
 #include "hsmp.h"
 
+#include <asm/amd_nb.h>
+
 #include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/ioport.h>
 #include <linux/kstrtox.h>
+#include <linux/platform_device.h>
 #include <linux/uuid.h>
 
 #include <uapi/asm-generic/errno-base.h>
 
+#define DRIVER_NAME		"amd_hsmp"
+#define DRIVER_VERSION		"2.3"
+#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
+
 /* These are the strings specified in ACPI table */
 #define MSG_IDOFF_STR		"MsgIdOffset"
 #define MSG_ARGOFF_STR		"MsgArgOffset"
 #define MSG_RESPOFF_STR		"MsgRspOffset"
 
-void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
-			u32 *value, bool write)
+static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
+			      u32 *value, bool write)
 {
 	if (write)
 		iowrite32(*value, sock->virt_base_addr + offset);
 	else
 		*value = ioread32(sock->virt_base_addr + offset);
+	return 0;
 }
 
+static const struct file_operations hsmp_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= hsmp_ioctl,
+	.compat_ioctl	= hsmp_ioctl,
+};
+
 /* This is the UUID used for HSMP */
 static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
 						0xa6, 0x9f, 0x4e, 0xa2,
@@ -194,9 +208,9 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
 	int ret;
 
-	sock->sock_ind			= sock_ind;
-	sock->dev			= dev;
-	hsmp_pdev.is_acpi_device	= true;
+	sock->sock_ind		= sock_ind;
+	sock->dev		= dev;
+	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
 
 	sema_init(&sock->hsmp_sem, 1);
 
@@ -209,7 +223,7 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 	return hsmp_read_acpi_dsd(sock);
 }
 
-int hsmp_create_acpi_sysfs_if(struct device *dev)
+static int hsmp_create_acpi_sysfs_if(struct device *dev)
 {
 	struct attribute_group *attr_grp;
 	u16 sock_ind;
@@ -232,7 +246,7 @@ int hsmp_create_acpi_sysfs_if(struct device *dev)
 	return devm_device_add_group(dev, attr_grp);
 }
 
-int init_acpi(struct device *dev)
+static int init_acpi(struct device *dev)
 {
 	u16 sock_ind;
 	int ret;
@@ -266,3 +280,94 @@ int init_acpi(struct device *dev)
 
 	return ret;
 }
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
+static int hsmp_acpi_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	if (!hsmp_pdev.is_probed) {
+		hsmp_pdev.num_sockets = amd_nb_num();
+		if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
+			return -ENODEV;
+
+		hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
+					      sizeof(*hsmp_pdev.sock),
+					      GFP_KERNEL);
+		if (!hsmp_pdev.sock)
+			return -ENOMEM;
+	}
+
+	if (!check_acpi_support(&pdev->dev)) {
+		dev_err(&pdev->dev, "Not ACPI device?\n");
+		return -ENODEV;
+	}
+
+	ret = init_acpi(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
+		return ret;
+	}
+
+	ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
+
+	if (!hsmp_pdev.is_probed) {
+		hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
+		hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
+		hsmp_pdev.mdev.fops	= &hsmp_fops;
+		hsmp_pdev.mdev.parent	= &pdev->dev;
+		hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
+		hsmp_pdev.mdev.mode	= 0644;
+
+		ret = misc_register(&hsmp_pdev.mdev);
+		if (ret)
+			return ret;
+		hsmp_pdev.is_probed = true;
+	}
+
+	return 0;
+}
+
+static void hsmp_acpi_remove(struct platform_device *pdev)
+{
+	/*
+	 * We register only one misc_device even on multi-socket system.
+	 * So, deregister should happen only once.
+	 */
+	if (hsmp_pdev.is_probed) {
+		misc_deregister(&hsmp_pdev.mdev);
+		hsmp_pdev.is_probed = false;
+	}
+}
+
+static struct platform_driver amd_hsmp_driver = {
+	.probe		= hsmp_acpi_probe,
+	.remove_new	= hsmp_acpi_remove,
+	.driver		= {
+		.name	= DRIVER_NAME,
+		.acpi_match_table = amd_hsmp_acpi_ids,
+	},
+};
+
+module_platform_driver(amd_hsmp_driver);
+
+MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
+MODULE_VERSION(DRIVER_VERSION);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 14edaace4379..759ec1d4d60d 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -31,17 +31,6 @@
 
 struct hsmp_plat_device hsmp_pdev;
 
-static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
-			 u32 *value, bool write)
-{
-	if (hsmp_pdev.is_acpi_device)
-		amd_hsmp_acpi_rdwr(sock, offset, value, write);
-	else
-		return amd_hsmp_pci_rdwr(sock, offset, value, write);
-
-	return 0;
-}
-
 /*
  * Send a message to the HSMP port via PCI-e config space registers
  * or by writing to MMIO space.
@@ -64,7 +53,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 
 	/* Clear the status register */
 	mbox_status = HSMP_STATUS_NOT_READY;
-	ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_WR);
+	ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_WR);
 	if (ret) {
 		pr_err("Error %d clearing mailbox status register\n", ret);
 		return ret;
@@ -73,8 +62,8 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
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
@@ -83,7 +72,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	}
 
 	/* Write the message ID which starts the operation */
-	ret = amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR);
+	ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR);
 	if (ret) {
 		pr_err("Error %d writing message ID %u\n", ret, msg->msg_id);
 		return ret;
@@ -100,7 +89,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	timeout	= jiffies + msecs_to_jiffies(HSMP_MSG_TIMEOUT);
 
 	while (time_before(jiffies, timeout)) {
-		ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
+		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
 		if (ret) {
 			pr_err("Error %d reading mailbox status\n", ret);
 			return ret;
@@ -135,8 +124,8 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
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
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index a77887d298b6..5d4fc7735a87 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -41,6 +41,7 @@ struct hsmp_socket {
 	struct pci_dev *root;
 	struct device *dev;
 	u16 sock_ind;
+	int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);
 };
 
 struct hsmp_plat_device {
@@ -48,19 +49,14 @@ struct hsmp_plat_device {
 	struct hsmp_socket *sock;
 	u32 proto_ver;
 	u16 num_sockets;
-	bool is_acpi_device;
 	bool is_probed;
 };
 
 extern struct hsmp_plat_device hsmp_pdev;
 
-int init_acpi(struct device *dev);
 ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 			     struct bin_attribute *bin_attr, char *buf,
 			     loff_t off, size_t count);
-int hsmp_create_acpi_sysfs_if(struct device *dev);
-int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
-		      u32 *value, bool write);
 int hsmp_cache_proto_ver(u16 sock_ind);
 long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
 umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
@@ -68,6 +64,4 @@ umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 int hsmp_create_attr_list(struct attribute_group *attr_grp,
 			  struct device *dev, u16 sock_ind);
 int hsmp_test(u16 sock_ind, u32 value);
-void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
-			u32 *value, bool write);
 #endif /* HSMP_H */
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index c297540bb64c..3bce2c570f2b 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -13,15 +13,13 @@
 
 #include <asm/amd_nb.h>
 
-#include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 
 #define DRIVER_NAME		"amd_hsmp"
-#define DRIVER_VERSION		"2.2"
-#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
+#define DRIVER_VERSION		"2.3"
 
 /*
  * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
@@ -37,8 +35,8 @@
 #define HSMP_INDEX_REG		0xc4
 #define HSMP_DATA_REG		0xc8
 
-int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
-		      u32 *value, bool write)
+static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
+			     u32 *value, bool write)
 {
 	int ret;
 
@@ -113,6 +111,7 @@ static int init_platform_device(struct device *dev)
 		sock->sock_ind			= i;
 		sock->dev			= dev;
 		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
+		sock->amd_hsmp_rdwr		= amd_hsmp_pci_rdwr;
 
 		/*
 		 * This is a transitional change from non-ACPI to ACPI, only
@@ -146,89 +145,39 @@ static int init_platform_device(struct device *dev)
 	return 0;
 }
 
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
 static int hsmp_pltdrv_probe(struct platform_device *pdev)
 {
 	int ret;
 
-	/*
-	 * On ACPI supported BIOS, there is an ACPI HSMP device added for
-	 * each socket, so the per socket probing, but the memory allocated for
-	 * sockets should be contiguous to access it as an array,
-	 * Hence allocate memory for all the sockets at once instead of allocating
-	 * on each probe.
-	 */
-	if (!hsmp_pdev.is_probed) {
-		hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
-					      sizeof(*hsmp_pdev.sock),
-					      GFP_KERNEL);
-		if (!hsmp_pdev.sock)
-			return -ENOMEM;
-	}
+	hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
+				      sizeof(*hsmp_pdev.sock),
+				      GFP_KERNEL);
+	if (!hsmp_pdev.sock)
+		return -ENOMEM;
 
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
+	ret = init_platform_device(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
+		return ret;
 	}
 
-	if (!hsmp_pdev.is_probed) {
-		hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
-		hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
-		hsmp_pdev.mdev.fops	= &hsmp_fops;
-		hsmp_pdev.mdev.parent	= &pdev->dev;
-		hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
-		hsmp_pdev.mdev.mode	= 0644;
-
-		ret = misc_register(&hsmp_pdev.mdev);
-		if (ret)
-			return ret;
+	ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
 
-		hsmp_pdev.is_probed = true;
-	}
+	hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
+	hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
+	hsmp_pdev.mdev.fops	= &hsmp_fops;
+	hsmp_pdev.mdev.parent	= &pdev->dev;
+	hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
+	hsmp_pdev.mdev.mode	= 0644;
 
-	return 0;
+	return misc_register(&hsmp_pdev.mdev);
 }
 
 static void hsmp_pltdrv_remove(struct platform_device *pdev)
 {
-	/*
-	 * We register only one misc_device even on multi socket system.
-	 * So, deregister should happen only once.
-	 */
-	if (hsmp_pdev.is_probed) {
-		misc_deregister(&hsmp_pdev.mdev);
-		hsmp_pdev.is_probed = false;
-	}
+	misc_deregister(&hsmp_pdev.mdev);
 }
 
 static struct platform_driver amd_hsmp_driver = {
@@ -236,7 +185,6 @@ static struct platform_driver amd_hsmp_driver = {
 	.remove_new	= hsmp_pltdrv_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
-		.acpi_match_table = amd_hsmp_acpi_ids,
 	},
 };
 
@@ -295,6 +243,12 @@ static int __init hsmp_plt_init(void)
 {
 	int ret = -ENODEV;
 
+	if (!legacy_hsmp_support()) {
+		pr_info("HSMP is not supported on Family:%x model:%x\n",
+			boot_cpu_data.x86, boot_cpu_data.x86_model);
+		return ret;
+	}
+
 	/*
 	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
 	 * if we have N SMN/DF interfaces that ideally means N sockets
@@ -307,19 +261,9 @@ static int __init hsmp_plt_init(void)
 	if (ret)
 		return ret;
 
-	if (!hsmp_pdev.is_acpi_device) {
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
+	ret = hsmp_plat_dev_register();
+	if (ret)
+		platform_driver_unregister(&amd_hsmp_driver);
 
 	return ret;
 }
-- 
2.25.1

