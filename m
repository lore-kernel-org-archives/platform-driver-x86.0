Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC911CD13
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Jun 2024 05:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466837; cv=fail; b=a8c//m/V/iPenrjKDb4+blzVqfWUKPFWTURY1r6PaGRve1YQZ3KRC4y32yhL0AxwuH3Tm3n9LrJICz3Uom6hqGkPi5u3i93OfJGaIyezosU+zkL+70RE9goW2MjVlf1909VGOBw13GZikuHrOnlvwLpGO2gkz3luKRhfre9IcOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466837; c=relaxed/simple;
	bh=yDmMcVl65yQteQmh1XZv14Rp2OIYWTGqCVPpLvKtCVM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KWudRCNAvnNS5P8VwRHaPvB51gmdlfT15hmnNAvccVNCrUcJFduv5dxf3vW/EcSJKYVQj3vd4WjNvAp9tJVmC1t8BtoB/HHvyw+XIYqI9mx6Pt+2y36LJ5+nCNz9mNvijSP1qXEFVj9Mawexj3GcPSLxiVjVmlwCC1iJSu6IqSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=23IXo9RD; arc=fail smtp.client-ip=40.107.236.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="23IXo9RD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmjzvdd90wTspstDWgzedXWIulFZNhB3/GYCWrb3As52c5DawzZzZLAeiN3KSqx/v7H6+pcW82Lm/yeM9y1dHWvWIGJhFj/X5SFR2JxtgS9kJWkZFkyCoEHmztTXmt1sL8NqwyqifB8D5RPAQOiByhStkCZHIZsi0rbQmu6P9o0bSKpHpLAHrEqjCiBlF70eNUJEncVU6rsrD2rDVEfDG/GD8imbv2SjL9Ugw8IiCKCmCEhFvySKeQFQIVIMBfIlaEpQxGocXwjdUGGPjvPRMzKqBmdw2BMlB6ucZdaxkphwDtneoIIfY5sIhCkmfhNdYx5CCXE1LK1ecA+vt2AZyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzdUieXGfyk23f6JMX07G9LMWRLDEiRcwNt34mFiD/g=;
 b=Zq2MOhy3CYabodvNMjHgz66XTB8M9llvLdqks8pZznUAgd6Km2vQ81y9SltwFALA6SMbTkMT7b6WMrWE8Xol3u0QMT2VeJP2xtU7RurDXD/GR/MKu9D2tpCT5amhZc0LCBr1tpOAiV5Nz1IVOLLFxdJc381FLwQ8O1hvh0EbZaA06Ir3B8gXng43WokgJceB8QOIxBqf7cBgY8FHrJhWTzVHZ3A7DW9avOYRGfNBL5elvW4ruibF2aUXkJQYD9itnZmUWkkMDB/AbREhybEbIucHCJlJAcLkn55ppRWsJSE65g1Y1ahpBnn+bcQe4TyDLj5pKv9WjULlxmu7njkxmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzdUieXGfyk23f6JMX07G9LMWRLDEiRcwNt34mFiD/g=;
 b=23IXo9RDQjOa/Ffjiuw/HuCsKHheBzYxl0Fo+mJjvjrHCK+EDIV3UX5rDpL0I73VP1dRYKoGpRzf1iz0073N87Rheg69QKmI84C6bzMfDLozXQ9zKC4xPJcYDG1PLr5JqPlHSNM7xK4eDFRWTPVLyUFbxYkxg+iPPYHkDkG9Tz0=
Received: from SA1PR05CA0001.namprd05.prod.outlook.com (2603:10b6:806:2d2::6)
 by SJ2PR12MB8184.namprd12.prod.outlook.com (2603:10b6:a03:4f2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Thu, 27 Jun
 2024 05:40:31 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:806:2d2:cafe::6b) by SA1PR05CA0001.outlook.office365.com
 (2603:10b6:806:2d2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Thu, 27 Jun 2024 05:40:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 27 Jun 2024 05:40:31 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Jun
 2024 00:40:29 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 06/10] platform/x86/amd/hsmp: Create mutually exclusive ACPI and plat drivers
Date: Thu, 27 Jun 2024 05:39:54 +0000
Message-ID: <20240627053958.2533860-7-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|SJ2PR12MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: fb0793ae-dee8-48c7-182e-08dc966ba8d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5HJ49I26Nczi6CAAl+DqYTME7YIUVYrhwDYqryCFMDLu1Co/nEjW5gMuTmkB?=
 =?us-ascii?Q?KIEGRr+xk7mywW9owugrE+EgodVdaEBZ/vNeGjsQaqbVGYOn+xmWsqVygl/y?=
 =?us-ascii?Q?YLMuz/qKgx3+jQnMWLspOR3aL7hemuGkqYxlech0f1GN1lW6mCLdHvdCcFRc?=
 =?us-ascii?Q?CvGodwm1igQhfFUS1ebYJ6xrIhJA8TLNInj7sHn2Iqr8XPKg53Tp9rHsmXw/?=
 =?us-ascii?Q?aivT1W6whrwbc17pN36HAd41dliawzSYqDiryxlm8K0bevoiH3L5sP4Is9mc?=
 =?us-ascii?Q?xKjPero4lo+VWm4wLUw/Ga9IR4kPphPIYdrQz6AQGGc31MocsLnlf3NPbVGX?=
 =?us-ascii?Q?Z8rwFfjCkC3GS9DeC7DCZVZVIQjh9kkQWVrjwcr/lEfaWk+4oc/lWV67lueT?=
 =?us-ascii?Q?8EAT4Hnh5JxMz5ZeeUcol7YcpfcFOtuyyooZ8zOQoZfQf2/4yyQ7T5fC5n9T?=
 =?us-ascii?Q?bW/uKyKuEDCbFqWKu+M7RdmHdilctgoqWufp3BMw6dAHTQ4tCjNWMGCuZHn9?=
 =?us-ascii?Q?4vKh02eJhj+YoyzNghEnj7+GKgG5LtGP/52wblzlvk5t4kWHrkibTSMYS4mi?=
 =?us-ascii?Q?vlBRQe0numBItrlnI7kiK9vJZyWKBr50oxWroMF4Urv1EkxRop3xSsVerWSA?=
 =?us-ascii?Q?1I/Ynb5cd6PTAWa4OEvMs2Za11hZtijLU7XjsA2XS4IbG1jLCz/ikPaB2his?=
 =?us-ascii?Q?JE+MkM/aE8taDtwUVBKUwa3vlYlnKz8qttslWH+oxITBav2OmwpsE+f6/Z7Z?=
 =?us-ascii?Q?p3nvpa2Y9lpYp6hEbFgm4XV0p4Fs60+194YXjU1xMz7YixC6RnQBQMwhEyfG?=
 =?us-ascii?Q?hTiFa5OkMSDyihzW9EKGghgUltiQogkT7BI8uK2PJAkYEjy1ZUmV0vu3FEsg?=
 =?us-ascii?Q?aazc2C0BqLrdg4nSxwTh4zLlb6pIF7DhCR6Hf4s4KZrr3Rsjtol22ZKwneZG?=
 =?us-ascii?Q?ZPORGbqodQ3ymKTZvu8loXXKvKbrLSy323BpELqzQXofOiR4CyuaHgQdt4Rz?=
 =?us-ascii?Q?G5YkQdzHK1WdaByJ1fY1HbHjxFbsxpsiWXiCj24DDAlkfOoiIWYJfrkuGgIP?=
 =?us-ascii?Q?xxCqQMvlpIUHyWNigvKhBqml+RpFpdnPxEViRfRCcfexW6/FJMvICI0Wy7e1?=
 =?us-ascii?Q?WJRZz2i6XwdnEmpjaYsx6zFXiClOaKW1QKQ6Of3uGVd3yLZphPblFcVjYfea?=
 =?us-ascii?Q?3I2ry5owoLANHEVhcdVbkn3di/yzEyxwb3Fq689tnY0y997SZRgTYcCLi9VY?=
 =?us-ascii?Q?1kdTvyGXqUjo9HxL1w8xvpoSsv/wzG7fd4ja4AKHojA7NY48CRExuZPTIjuR?=
 =?us-ascii?Q?ecoE3Rz+UYmFmjYB/WXIKfW9l+JK2ndLO6AtlxU3/LMmKCrX9gZTzxYKQbIH?=
 =?us-ascii?Q?AGNoZajtV+liXp8PgiwtVx21G0TuM41rE9OIIfGTLEOqukp6aVsOwl7LaSrG?=
 =?us-ascii?Q?g38UQyVJGyx1SObxPXA+OvXHRuonqPDz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:40:31.7453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0793ae-dee8-48c7-182e-08dc966ba8d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8184

Separate the probes for ACPI and platform device drivers.
Provide a Kconfig option to select either the
ACPI or the platform device based driver.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 arch/x86/include/asm/amd_hsmp.h        |   2 +-
 drivers/platform/x86/amd/hsmp/Kconfig  |  25 ++++-
 drivers/platform/x86/amd/hsmp/Makefile |  10 +-
 drivers/platform/x86/amd/hsmp/acpi.c   | 114 ++++++++++++++++++++++-
 drivers/platform/x86/amd/hsmp/hsmp.c   |  25 ++---
 drivers/platform/x86/amd/hsmp/hsmp.h   |   8 +-
 drivers/platform/x86/amd/hsmp/plat.c   | 122 +++++++------------------
 7 files changed, 183 insertions(+), 123 deletions(-)

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
index b55d4ed9bceb..1cb10d2aac77 100644
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
+	depends on !(AMD_HSMP_ACPI || AMD_HSMP_ACPI=m)
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
index 90bfa1ddadbf..0307f4e7176d 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -12,21 +12,34 @@
 #include "hsmp.h"
 
 #include <linux/acpi.h>
+#include <asm/amd_nb.h>
+#include <linux/platform_device.h>
+
+#define DRIVER_NAME		"amd_hsmp"
+#define DRIVER_VERSION		"2.3"
+#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
 
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
@@ -189,7 +202,7 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 
 	sock->sock_ind		= sock_ind;
 	sock->dev		= dev;
-	plat_dev.is_acpi_device	= true;
+	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
 
 	sema_init(&sock->hsmp_sem, 1);
 
@@ -202,7 +215,7 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 	return hsmp_read_acpi_dsd(sock);
 }
 
-int hsmp_create_acpi_sysfs_if(struct device *dev)
+static int hsmp_create_acpi_sysfs_if(struct device *dev)
 {
 	struct attribute_group *attr_grp;
 	u16 sock_ind;
@@ -225,7 +238,7 @@ int hsmp_create_acpi_sysfs_if(struct device *dev)
 	return devm_device_add_group(dev, attr_grp);
 }
 
-int init_acpi(struct device *dev)
+static int init_acpi(struct device *dev)
 {
 	u16 sock_ind;
 	int ret;
@@ -259,3 +272,94 @@ int init_acpi(struct device *dev)
 
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
+	if (!plat_dev.is_probed) {
+		plat_dev.num_sockets = amd_nb_num();
+		if (plat_dev.num_sockets == 0 || plat_dev.num_sockets > MAX_AMD_SOCKETS)
+			return -ENODEV;
+
+		plat_dev.sock = devm_kcalloc(&pdev->dev, plat_dev.num_sockets,
+					     sizeof(*plat_dev.sock),
+					     GFP_KERNEL);
+		if (!plat_dev.sock)
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
+		plat_dev.is_probed = true;
+	}
+
+	return 0;
+}
+
+static void hsmp_acpi_remove(struct platform_device *pdev)
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
index d3f0f08cebf7..8cad5e813947 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -30,17 +30,6 @@
 
 struct hsmp_plat_device plat_dev;
 
-static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
-			 u32 *value, bool write)
-{
-	if (plat_dev.is_acpi_device)
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
@@ -63,7 +52,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 
 	/* Clear the status register */
 	mbox_status = HSMP_STATUS_NOT_READY;
-	ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_WR);
+	ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_WR);
 	if (ret) {
 		pr_err("Error %d clearing mailbox status register\n", ret);
 		return ret;
@@ -72,8 +61,8 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
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
@@ -82,7 +71,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	}
 
 	/* Write the message ID which starts the operation */
-	ret = amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR);
+	ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR);
 	if (ret) {
 		pr_err("Error %d writing message ID %u\n", ret, msg->msg_id);
 		return ret;
@@ -99,7 +88,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	timeout	= jiffies + msecs_to_jiffies(HSMP_MSG_TIMEOUT);
 
 	while (time_before(jiffies, timeout)) {
-		ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
+		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
 		if (ret) {
 			pr_err("Error %d reading mailbox status\n", ret);
 			return ret;
@@ -134,8 +123,8 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
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
index 2baeef57ca54..f876370ba65c 100644
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
 
 extern struct hsmp_plat_device plat_dev;
 
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
index 0f181688c972..62423581d839 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -15,11 +15,9 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
-#include <linux/acpi.h>
 
 #define DRIVER_NAME		"amd_hsmp"
-#define DRIVER_VERSION		"2.2"
-#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
+#define DRIVER_VERSION		"2.3"
 
 /*
  * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
@@ -35,8 +33,8 @@
 #define HSMP_INDEX_REG		0xc4
 #define HSMP_DATA_REG		0xc8
 
-int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
-		      u32 *value, bool write)
+static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
+			     u32 *value, bool write)
 {
 	int ret;
 
@@ -111,6 +109,7 @@ static int init_platform_device(struct device *dev)
 		sock->sock_ind			= i;
 		sock->dev			= dev;
 		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
+		sock->amd_hsmp_rdwr		= amd_hsmp_pci_rdwr;
 
 		/*
 		 * This is a transitional change from non-ACPI to ACPI, only
@@ -144,89 +143,39 @@ static int init_platform_device(struct device *dev)
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
-	if (!plat_dev.is_probed) {
-		plat_dev.sock = devm_kcalloc(&pdev->dev, plat_dev.num_sockets,
-					     sizeof(*plat_dev.sock),
-					     GFP_KERNEL);
-		if (!plat_dev.sock)
-			return -ENOMEM;
-	}
+	plat_dev.sock = devm_kcalloc(&pdev->dev, plat_dev.num_sockets,
+				     sizeof(*plat_dev.sock),
+				     GFP_KERNEL);
+	if (!plat_dev.sock)
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
+	ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
 
-		plat_dev.is_probed = true;
-	}
+	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
+	plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
+	plat_dev.hsmp_device.fops	= &hsmp_fops;
+	plat_dev.hsmp_device.parent	= &pdev->dev;
+	plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
+	plat_dev.hsmp_device.mode	= 0644;
 
-	return 0;
+	return misc_register(&plat_dev.hsmp_device);
 }
 
 static void hsmp_pltdrv_remove(struct platform_device *pdev)
 {
-	/*
-	 * We register only one misc_device even on multi socket system.
-	 * So, deregister should happen only once.
-	 */
-	if (plat_dev.is_probed) {
-		misc_deregister(&plat_dev.hsmp_device);
-		plat_dev.is_probed = false;
-	}
+	misc_deregister(&plat_dev.hsmp_device);
 }
 
 static struct platform_driver amd_hsmp_driver = {
@@ -234,7 +183,6 @@ static struct platform_driver amd_hsmp_driver = {
 	.remove_new	= hsmp_pltdrv_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
-		.acpi_match_table = amd_hsmp_acpi_ids,
 	},
 };
 
@@ -293,6 +241,12 @@ static int __init hsmp_plt_init(void)
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
@@ -305,19 +259,9 @@ static int __init hsmp_plt_init(void)
 	if (ret)
 		return ret;
 
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
+	ret = hsmp_plat_dev_register();
+	if (ret)
+		platform_driver_unregister(&amd_hsmp_driver);
 
 	return ret;
 }
-- 
2.25.1

