Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0729246335
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Feb 2025 12:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739882377; cv=fail; b=D/gfvL/MkZNrM+5h23WZ18QnAUMuRcuKZoJF05T1SJ1/Nyaq0Te3HB1JHcj94N/Ko+xEiTIJZCk8z2cvzhpkm7oIqGExGB/z7pAvUanJe/QWgRiOEE4erJC4ornQ1Aytzu4GaxXecKo8Q+//rIsDr8TMjr0vuYCi86XA0M+eRPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739882377; c=relaxed/simple;
	bh=QXV2qU0PorSWGuOHxMYJFHklkSR3vgHqZEHFjXhkzLw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JDpg1vAA5Ol2vg2AU083O+kziYbnEnzRVZo5sdUaliq0u5ASUiKG+umqV/72lUbAXhTADb98JWfYcd6B3oH+7inwpJ5JM52FbapOQxULE/5Wyt1BpEihyOSCi8QV+oukIf5KdrWvJsBfzI3nPLcQWv1NEPB4aPU9KJk183qX540=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NuJCQZW2; arc=fail smtp.client-ip=40.107.237.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NuJCQZW2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ylOzhb56ljmISnz/QJQLjc+IdGtQOamDPAxeA2UeNzWl+HQLRE63Fz1911wePFqo/d+ffaidXOpqZjXtGngqYN6AqoRWHYO3RO4lJyZctOpUJJJRs+XmGVpprdYKeJyLFtgQaHMDHOmRhJJJMSXmYAiDo3TKYdd3tNhQvetQE22TiS00q+3Iy2eGK9nNDG/sVXFNMjcBUslnBNgV2ihh+xunI2dyVZwu6YaIVJC1E+BGLqOkQlnDU7feplt32GF2BiPNHTX4f5Vc66A6Z7nKZZ2JC9D1IB2iUauEcGT2A0Ui4hlT/z4ebWDKNzOf6XPmznRX0txjRlcQjDo8yeMCNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMkSvY3fAebY95xJXMZ6gTcnXz2jSKBGEgF12nQuLBQ=;
 b=V2DoOL9G4ZB9k5JNEc+3YpCMdci5HksAqIOWrbqDXzATy03tUZqbeJsRaduvQdX0pndy9flBTWjZyi1r6okNmpXt4fgvgxnaIE3zwTJAQO/LSeaq4b0FDfdCjYBrYTxICQIhLltgXeNW7l8lee58/zckyOdJy2nzdpnPSloeReZw4H4sFD2Sn2JNfHEIMtXm4BxEfakzM8d+Tt838rhDRmDaAjvR+3PLvB1tiuc8BBSrm3xwap/wGwXZmZ1jj040224q7rXrmLgtTr6Kb4540mnUUct4/fsN7RjvHI0gBefZhP5c2ET3uSx4N04efhpuNffeCB2jkpaoWqYlxG6gfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMkSvY3fAebY95xJXMZ6gTcnXz2jSKBGEgF12nQuLBQ=;
 b=NuJCQZW2dFeVl9E+DKNPCRtwKvo2V7X+SehrijXqL4J2SS4CZSaQkjH9y+yb0fjG1DVNQ0ehPjV4fUfaswn+JzMBOSVCUFm/AzNHmwg21RYVa+1fapByY1dG8XJ2x02CqTsMRG9YK40JVID8XuPBUdniDsBO757c3K5HWYZLoJc=
Received: from PH8PR15CA0019.namprd15.prod.outlook.com (2603:10b6:510:2d2::21)
 by PH7PR12MB8593.namprd12.prod.outlook.com (2603:10b6:510:1b1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Tue, 18 Feb
 2025 12:39:31 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:2d2:cafe::cb) by PH8PR15CA0019.outlook.office365.com
 (2603:10b6:510:2d2::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.19 via Frontend Transport; Tue,
 18 Feb 2025 12:39:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Tue, 18 Feb 2025 12:39:30 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 06:39:28 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 2/3] platform/x86/amd/hsmp: Report power using hwmon sensors
Date: Tue, 18 Feb 2025 12:39:04 +0000
Message-ID: <20250218123905.51984-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250218123905.51984-1-suma.hegde@amd.com>
References: <20250218123905.51984-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|PH7PR12MB8593:EE_
X-MS-Office365-Filtering-Correlation-Id: 94682f2f-232d-4261-0e5d-08dd50194a80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sA2VoKPeL8ktCoDoKsz0Tls+Jmx88t1ZYGo9oVvHjOEBvnt594+ndPOBFL7g?=
 =?us-ascii?Q?NEv29osn/oXm6nphlxO0q1P/k1Wrsh8PXEj4mXLg3zzMWI3JC7h+7DI+yYW8?=
 =?us-ascii?Q?oG2tgcjMcu1LFs8HQONzBgw1zaqM9JzK3wkPgHsNQ+kw+L0yuIJs+F6/370y?=
 =?us-ascii?Q?09je5MOpWgjEjIjWqwIm4vNYeVD0BGQ703jWYp3gYpeZWF6KZOblECT/oatY?=
 =?us-ascii?Q?sOuSova9W0AKWVi0a1NKrdwTHYFeXWvIMUYIyGOJctN3k2TPgxqznKBBZJeU?=
 =?us-ascii?Q?WZ2oQmuqNF5NbiCP1S3mbNdbZwIaRCR9pxRiK0+e5dVHt9x5iUez3Yi3ZHAT?=
 =?us-ascii?Q?tMVv5nY38zdWGn3oaVqAKCTweazNhKGKgmJXypvnykI0s0oMnVOOjpJZsecV?=
 =?us-ascii?Q?i46NAOE9EDMRQ3hd8LdtHy/EzQ5nbkGsi8q0NoUPUNiVu63xTHsfKm4FdnVt?=
 =?us-ascii?Q?ecQcQc2OvxrAuH09qpQyf60myRKQdpSDedqO6vY04hMhlwk1X+L2mfbJdJBv?=
 =?us-ascii?Q?hjjQdywjeT9gi7gGkkMNBD64gAMvV9pUVVSynHYZvHxvrHFSoNmMlKjWlc/1?=
 =?us-ascii?Q?tz7NBwRuHyRXmmoHvmR2jzurVCKP5c8pQ3XcD23SsFFaOuiDmV5Vw8KMf1HU?=
 =?us-ascii?Q?5cZALC3ooyemYk8cnWc6+BCucesxM1/WxacVQ2g7CCfWlFTwMOTf02iC4X4b?=
 =?us-ascii?Q?itsnNzAAXVxNfnIolnkfovApXrPRlWVxZO3/pgz9bk8vELwQTZsnPHINJMcm?=
 =?us-ascii?Q?Rjlvs765PMCE1yvJIRMTeiL2uPc9WwWMjuA1/0hUv7YC/Oo8Apv44/CPGSHy?=
 =?us-ascii?Q?4AY5K0KBgoD0XHe2PJH5apnKI2/HLo27lZW6LaODcuzVRnPRVpIznYsQ0sjl?=
 =?us-ascii?Q?0N3YZcXuIoCrHkyQTgufE+ZwJIz+fRObh7hQ+1/2Q+8CVzC9fWmX2GnhZ8rE?=
 =?us-ascii?Q?H1+GjDdnW2E1osHPmbaWnjcjhEvNpO/j5HOLpTAxNG4Xmne6TZ1yZvSxHtEx?=
 =?us-ascii?Q?Buj5Riizx5FVc6BwuK+31Jewrxf0yS+tiqTY1K0ttLVs+pjaS21goE5ZXMgo?=
 =?us-ascii?Q?QccLUmiz6iCGMcNeZULjPW7QuWai04CE3pnF/9f7wKk4aiC/AF9wD7mBbpJc?=
 =?us-ascii?Q?xKH/q8DQB9vkO32C06baIF+/NFBFq2h555A4ye6+phljSasnrZMtOfIJdt7r?=
 =?us-ascii?Q?Fiv/WIagvGkdrPmqyAF8GOMDlQcG2vetOYNJTLpmWVb2qIZJEk3/S9evxyYL?=
 =?us-ascii?Q?vbo/lfQvmkWTNvu1/SA/92RJnLf72u9I5Z6rw0TRRkO/WFChdun2NCSzR3jF?=
 =?us-ascii?Q?w4xOYqbsat8ijF4T+ulS47j0IRVoe0e+vtcPB9Jso87FOxUzo1qy9mmqO8/A?=
 =?us-ascii?Q?pYgWmyk3vbNGjMWNu2/AyzsySqi/9OMLiPgYBVYBH0r2j8rsZFvLlLuZ+KB3?=
 =?us-ascii?Q?17pJNWSQiNAsYZgNKzQZibTEDHTsRCSjUUjZeO7GErt4T1N1wCRL9+rIBjZ6?=
 =?us-ascii?Q?5n/ry9soxvuIEU8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 12:39:30.9070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94682f2f-232d-4261-0e5d-08dd50194a80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8593

Expose power reading and power limits via hwmon power sensors.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>

---
 Documentation/arch/x86/amd_hsmp.rst    |  10 ++
 drivers/platform/x86/amd/hsmp/Makefile |   2 +-
 drivers/platform/x86/amd/hsmp/acpi.c   |   3 +
 drivers/platform/x86/amd/hsmp/hsmp.h   |  12 +-
 drivers/platform/x86/amd/hsmp/hwmon.c  | 191 +++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/plat.c   |   3 +
 6 files changed, 219 insertions(+), 2 deletions(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/hwmon.c

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 2fd917638e42..9e5fef538f4f 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -117,6 +117,16 @@ for socket with ID00 is given below::
 		}
 
 
+HSMP HWMON interface
+==================
+HSMP power sensors are registered with hwmon interface.
+Following files with 0444 permission are created.
+- powerx_input
+- powerx_cap_max
+- powerx_cap
+one powerx file is created for each socket. powerx_label is used to
+identify the socket to which this info belongs.
+
 An example
 ==========
 
diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
index 3175d8885e87..f63fdc12def1 100644
--- a/drivers/platform/x86/amd/hsmp/Makefile
+++ b/drivers/platform/x86/amd/hsmp/Makefile
@@ -5,7 +5,7 @@
 #
 
 obj-$(CONFIG_AMD_HSMP)			+= hsmp_common.o
-hsmp_common-objs			:= hsmp.o
+hsmp_common-objs			:= hsmp.o hwmon.o
 obj-$(CONFIG_AMD_HSMP_PLAT)		+= amd_hsmp.o
 amd_hsmp-objs				:= plat.o
 obj-$(CONFIG_AMD_HSMP_ACPI)		+= hsmp_acpi.o
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 0c54c91b5f1a..f73b6aedb986 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -342,6 +342,9 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 		hsmp_pdev->is_probed = true;
+		ret = hsmp_create_sensor(&pdev->dev, hsmp_pdev);
+		if (ret)
+			dev_err(&pdev->dev, "Failed to create hwmon interface.\n");
 	}
 
 	return 0;
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 3dee0bb684c7..e0227247c995 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -12,6 +12,7 @@
 
 #include <linux/compiler_types.h>
 #include <linux/device.h>
+#include <linux/hwmon.h>
 #include <linux/miscdevice.h>
 #include <linux/pci.h>
 #include <linux/semaphore.h>
@@ -26,7 +27,7 @@
 #define HSMP_CDEV_NAME		"hsmp_cdev"
 #define HSMP_DEVNODE_NAME	"hsmp"
 
-#define DRIVER_VERSION		"2.4"
+#define DRIVER_VERSION		"2.5"
 
 struct hsmp_mbaddr_info {
 	u32 base_addr;
@@ -49,12 +50,20 @@ struct hsmp_socket {
 	int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);
 };
 
+struct hsmp_hwmon {
+	char (*p_label)[20];
+	const struct hwmon_channel_info *info[2];
+	struct hwmon_channel_info power_info;
+	struct hwmon_chip_info chip;
+};
+
 struct hsmp_plat_device {
 	struct miscdevice mdev;
 	struct hsmp_socket *sock;
 	u32 proto_ver;
 	u16 num_sockets;
 	bool is_probed;
+	struct hsmp_hwmon hwmon;
 };
 
 int hsmp_cache_proto_ver(u16 sock_ind);
@@ -65,4 +74,5 @@ int hsmp_misc_register(struct device *dev);
 int hsmp_get_tbl_dram_base(u16 sock_ind);
 ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
 struct hsmp_plat_device *get_hsmp_pdev(void);
+int hsmp_create_sensor(struct device *dev, struct hsmp_plat_device *pdev);
 #endif /* HSMP_H */
diff --git a/drivers/platform/x86/amd/hsmp/hwmon.c b/drivers/platform/x86/amd/hsmp/hwmon.c
new file mode 100644
index 000000000000..a2925c53fbe9
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/hwmon.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD HSMP hwmon support
+ * Copyright (c) 2025, AMD.
+ * All Rights Reserved.
+ *
+ * This file provides hwmon implementation for HSMP interface.
+ */
+
+#include <asm/amd_hsmp.h>
+#include <asm-generic/int-ll64.h>
+
+#include <linux/device.h>
+#include <linux/hwmon.h>
+
+#include "hsmp.h"
+
+#define NR_PWR_CHANNELS		3
+#define HSMP_HWMON_NAME		"amd_hsmp_hwmon"
+
+static const char * const power_label[] = {
+	"pinput",
+	"pcap",
+	"pcap_max"
+};
+
+static int hsmp_hwmon_read_label(struct device *dev,
+				 enum hwmon_sensor_types type, u32 attr,
+				 int channel, const char **str)
+{
+	struct hsmp_plat_device *pdev = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_power:
+		*str = pdev->hwmon.p_label[channel];
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static int hsmp_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			    u32 attr, int channel, long val)
+{
+	struct hsmp_message msg = { 0 };
+	int ret = -EOPNOTSUPP;
+
+	switch (type) {
+	case hwmon_power:
+		switch (channel % NR_PWR_CHANNELS) {
+		case 1:
+			msg.sock_ind = channel / NR_PWR_CHANNELS;
+			msg.num_args = 1;
+			msg.args[0] = val;
+			msg.msg_id = HSMP_SET_SOCKET_POWER_LIMIT;
+			return hsmp_send_message(&msg);
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static int hsmp_hwmon_read(struct device *dev,
+			   enum hwmon_sensor_types type,
+			   u32 attr, int channel, long *val)
+{
+	struct hsmp_message msg = { 0 };
+	int ret;
+
+	msg.sock_ind = channel / NR_PWR_CHANNELS;
+	msg.response_sz = 1;
+
+	switch (type) {
+	case hwmon_power:
+		switch (channel % NR_PWR_CHANNELS) {
+		case 0:
+			msg.msg_id = HSMP_GET_SOCKET_POWER;
+			break;
+		case 1:
+			msg.msg_id = HSMP_GET_SOCKET_POWER_LIMIT;
+			break;
+		case 2:
+			msg.msg_id = HSMP_GET_SOCKET_POWER_LIMIT_MAX;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	ret = hsmp_send_message(&msg);
+	if (!ret)
+		*val = msg.args[0];
+
+	return ret;
+}
+
+static umode_t hsmp_hwmon_is_visble(const void *data,
+				    enum hwmon_sensor_types type,
+				    u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_power:
+		switch (channel % NR_PWR_CHANNELS) {
+		case 0:
+		case 2:
+			return 0444;
+		case 1:
+			return 0644;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+const struct hwmon_ops hsmp_hwmon_ops = {
+	.read = hsmp_hwmon_read,
+	.read_string = hsmp_hwmon_read_label,
+	.is_visible = hsmp_hwmon_is_visble,
+	.write	= hsmp_hwmon_write,
+};
+
+static int hsmp_create_power_sensor(struct device *dev, struct hsmp_plat_device *pdev)
+{
+	char (*p_label)[20];
+	u32 *p_config;
+	int j;
+
+	p_config = devm_kcalloc(dev, pdev->num_sockets * NR_PWR_CHANNELS + 1,
+				sizeof(*p_config), GFP_KERNEL);
+	if (!p_config)
+		return -ENOMEM;
+
+	p_label = devm_kcalloc(dev, NR_PWR_CHANNELS * pdev->num_sockets,
+			       sizeof(*p_label), GFP_KERNEL);
+	if (!p_label)
+		return -ENOMEM;
+
+	for (j = 0; j < pdev->num_sockets * NR_PWR_CHANNELS;) {
+		p_config[j] = HWMON_P_INPUT | HWMON_P_LABEL;
+		p_config[j + 1] = HWMON_P_CAP | HWMON_P_LABEL;
+		p_config[j + 2] = HWMON_P_CAP_MAX | HWMON_P_LABEL;
+		scnprintf(p_label[j], 20, "sock%u_%s", j / NR_PWR_CHANNELS, power_label[0]);
+		scnprintf(p_label[j + 1], 20, "sock%u_%s", j / NR_PWR_CHANNELS, power_label[1]);
+		scnprintf(p_label[j + 2], 20, "sock%u_%s", j / NR_PWR_CHANNELS, power_label[2]);
+		j += NR_PWR_CHANNELS;
+	}
+
+	pdev->hwmon.power_info.type = hwmon_power;
+	pdev->hwmon.power_info.config = p_config;
+	pdev->hwmon.info[0] = &pdev->hwmon.power_info;
+	pdev->hwmon.p_label = p_label;
+
+	return 0;
+}
+
+int hsmp_create_sensor(struct device *dev, struct hsmp_plat_device *pdev)
+{
+	struct device *hwmon_dev;
+	int ret;
+
+	ret = hsmp_create_power_sensor(dev, pdev);
+	if (ret)
+		return ret;
+
+	pdev->hwmon.chip.ops	= &hsmp_hwmon_ops;
+	pdev->hwmon.chip.info	= pdev->hwmon.info;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, HSMP_HWMON_NAME,
+							 pdev,
+							 &pdev->hwmon.chip,
+							 NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(hsmp_create_sensor, "AMD_HSMP");
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 63034408985c..2bb590a34642 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -220,6 +220,9 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
 		return ret;
 	}
+	ret = hsmp_create_sensor(&pdev->dev, hsmp_pdev);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to create hwmon interface.\n");
 
 	return hsmp_misc_register(&pdev->dev);
 }
-- 
2.25.1

