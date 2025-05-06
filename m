Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE34221F3D
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 May 2025 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746526584; cv=fail; b=F1RdwEN4BGOaq3YTKicbLLfqmJ0yWmfIITo2PBhSkUbPuw13iKVCgleNIChPllXC3oVeuIMTzzzGceOqWmKUqDKnkPBG3CWX0SFv495/4icNPj5Gj11SZ5lpNHJlE09nVcHfcDfIJHWQDonoDPPMtaH6X7u2E4OvOKIhDGsR0oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746526584; c=relaxed/simple;
	bh=Bg7PQ8jbgAwSrQ4f0zQGni7AQ9u221wdgnc0xr0q9b4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s/flI7ba8oKygWFL7J06P8GdB5wqJ+osVod3MauE5HMJ/33bW5jZRK8KGXvdKOlRNXLX6k40SQMzx8/aHQysGS3wwwzJsLoUAtr7at8/dAPZ+iNFyetTjTBpMelq35pFRMtzqs8Sxd0IBVeJLyj0xKuZtTyKd2rteZku4nRvK40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZDYE/P/N; arc=fail smtp.client-ip=40.107.92.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZDYE/P/N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scpd8mnsq4In1cXbcdq4ZE8Ef3NKE0YJ+obaW2iudCkSu3Q25bNM+LRbKW0XqvmXhIVQitmA8tVPozniOFY6nqB250wlBv8Q+xb+Z0yGU5E4TZwcrse9PbCcrzM7qyJ0qbXDIK/zBs4jjpZl5HhaG/BL+hTU+MGS5r+Ko0p8NDBQ0bCmp7n6+ldvrQVDnpbMvjJUua0KBZv/6yOeSJHfjZd6e9r9VntHw0JP68hkeIPkWDP31MIP01pPnUKGrqUM+rzkZ4w8iAkShfkhWMk7yjfiIbeQo3I35il4RHMx8LGJjGfZ/oE7olGdG38v5y6L3+8/6VgRUaQ1LUbiUdwWzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veQxF0HgUbTwBQDumVqk7vTINMf7HXENummElN6sLeA=;
 b=CgshPh+YRbcFZQXh4kLqOzsaaj7oqX4NzbjoVPvajZk8Q0+ef4Te5B+t4O1U/jFnlny0Ee/3kzNV4I7oNrfQEpVAy3ZXahhBhL0unyHPSFSkz+oARy/ZPCik0XmbKAR1KvC30y5wYUobRjpriWkVW8VhdUtokDAkHN4NGZ4eNzV1QALg0n8kNr3uF2Vr9qnfsf9SwAE39G9U/uAtVr2QgS268wWwrOo0Tn9CCvrUuDeDKxYPMNkwshbNDFCf5PSo3IFMcGCLGNZvbJXzvFlSGI6NmYyOBAOxs7UoMRtxf44KmFjMosCGj5r8rQsciqNu3HKbz1NfJvO3n83HOtDzzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veQxF0HgUbTwBQDumVqk7vTINMf7HXENummElN6sLeA=;
 b=ZDYE/P/N9AFjUMEEB4Q200cH8FNe71gZW7bRVbVQOudX+Qhb44AMTW8cVahk4Mm9TqOBnpz6Nddig3sKOU+rdIv71cZRDq9eBDHUPltIiaJZcv1zo2+fB+1U+4vpMRDhOiQRrbapXkNNv1PpRNWMIqyWvZG5ZpqGqBp/VtIoHIQ=
Received: from SA0PR11CA0126.namprd11.prod.outlook.com (2603:10b6:806:131::11)
 by PH8PR12MB6868.namprd12.prod.outlook.com (2603:10b6:510:1cb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 10:16:14 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:806:131:cafe::18) by SA0PR11CA0126.outlook.office365.com
 (2603:10b6:806:131::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Tue,
 6 May 2025 10:16:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 10:16:14 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 May
 2025 05:16:11 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v4 2/3] platform/x86/amd/hsmp: Report power via hwmon sensors
Date: Tue, 6 May 2025 10:15:41 +0000
Message-ID: <20250506101542.200811-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506101542.200811-1-suma.hegde@amd.com>
References: <20250506101542.200811-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|PH8PR12MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da5b4f0-df39-4c6f-5304-08dd8c870818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fXm7KB+MKDnDdwwbXxG9qIGmfXiEfTP/RyRJ/h8tUFALDyxnQH0DHEThh6qR?=
 =?us-ascii?Q?dbb6PeZ/cm+p0W9WD5bIEI6ukGZBM4kV1ZU7X36v9TV7fSPMOV3hwYcyDToB?=
 =?us-ascii?Q?BcFta+2YjfNIcujNeC/ZI0q7ipi4UcJIFs4XCxZISRT5gsO+QuWz5epjomnf?=
 =?us-ascii?Q?2j/BDVSlRd+NsQEvdZYzJIexvnttMBMrNX65n9gsIKSKdNURefXeVK26uiMU?=
 =?us-ascii?Q?/sxoW7NTSwZ+A8ZArlvVCMhgb4ozDhDY8NeaROuQvgib47A2e1hipb8+NKQ1?=
 =?us-ascii?Q?xvEIm90bGwrNPPmPNmmhPNp8tB1RqbXr+1JHFIiWQw7i7mKtgOQXams6bzd/?=
 =?us-ascii?Q?Hkg/QWr1PLJhhHLMufrlCuBuQBTK6WDH4YNHpmNdlGyDG01b/2MW4CrQfzG2?=
 =?us-ascii?Q?Gb11wDyEAn/GXoQ12oQv887sAJDaPq7gU0JXH/hkrQ8kUYKbYS1J7EsPG7+H?=
 =?us-ascii?Q?dxhQFq4kCOJmA4WEHPy8mgfM5PvdRwQIo/a++3H+bHGITxGbPdXDhoLQR3wo?=
 =?us-ascii?Q?PlC5mVdsQHBYoFi5U26sDj2ssKQ/XJfqY3q2zNJxHULUfzZJaCMj7W99mY6a?=
 =?us-ascii?Q?jpkM9dEOUsUDvailbmisZPF7VVJqMSPFaJ5lyCIgQn2JPJ7bJmb/sEqlNOoS?=
 =?us-ascii?Q?R5YdufNEya3FQecHiJWbDlnUAXlwsqNK6HZ6dkwzi4CNyriAgYVwHiD2zHyg?=
 =?us-ascii?Q?JSXwu+YloGT3DTKQlAGZ2vaOieN+hsf+023A+gDhGvCdfh4gIe5gXBPfyxNR?=
 =?us-ascii?Q?ApxGGnzv0fPjpTG2oZylCnyP7wcjEEsNn2AALMUxOMMLJC/X8cSakwjYbdxj?=
 =?us-ascii?Q?+9eFTgXHcB9vSSUW03ggNqGDdyF3LDOivALZqUIHH6tdkloODiO9bGebTtV8?=
 =?us-ascii?Q?Ev3CkDRDCB9kP4QuIgX8lC5hHchUzCQShov+VGBUycT038wgzvK5xCCU/tgE?=
 =?us-ascii?Q?XPlp0Na2dHFjQeOcFGWllduoAV7iZkRf3bzywyDbh3luZy2VxdAw9W1Tdi43?=
 =?us-ascii?Q?KQc9EDSnUq/xkW43Ko5PgPtFYlPOkrGgMXThcGxPn+8mxln9Jne+D8j2C3m7?=
 =?us-ascii?Q?kyAX6JlAPrbZDgH2aSQsU13bH3J5Y41fGnd17c7+hqPjcIn8Dn3BP5iIRnJ7?=
 =?us-ascii?Q?elR6PXssA48DZrhfwoXs5t9pu/PiRbAArkEwBZwmPD/H3gfe1rzLDO3oAH0D?=
 =?us-ascii?Q?ilw7bWH0c6GKcIOaYACbxOljcZy9qrfqU4e1tr8w+qh/FsVVTASzWM+J68AC?=
 =?us-ascii?Q?8vLZkBD+VJ2UIdx+5aZR5rGEM05I+YeqjHc/6j7cS3VoUJAtRidzZ4pG8ZDb?=
 =?us-ascii?Q?XP4PKxcHw8QE2ENH9iBE7NpfRCyjogb2GP4eMMvDzFHBsQfKcxu5KnS6O3Ag?=
 =?us-ascii?Q?7aLYSzbdhh98WMaULuEZUylKW7sgWEkl0iZwu7ipqc+42GhMz1UD6xuITjid?=
 =?us-ascii?Q?giLzIWx3CDxMwEVnCH1Hfjrcyko9TsKnVbLJDpE9FnpBVNYVAr3VRsZwyEqp?=
 =?us-ascii?Q?jcr6dM8K7i9tvaLRi4k6FI6Q9Cm43hR1sKVb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 10:16:14.0026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da5b4f0-df39-4c6f-5304-08dd8c870818
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6868

Expose power reading and power limits via hwmon power sensors.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v3:
Use MICROWATT_PER_MILLIWATT and include units.h

Changes since v2:
1. Remove hwmon related documentation content from patch 3 and add that content
   in this patch. Add space before starting paranthesis in power1_xxx,
   remove extra blank line before HSMP HWMON interface section.
2. Remove double semicolon at the end of hsmp_create_sensor()
3. Place hsmp_create_sensor() stub's code right after the function
4. Include err.h and types.h header files in hwmon.c
5. Initialize struct hsmp_message using {} instead of {0} everywhere
6. Convert power value to milli watt before writing it to SMU
7. Remove return 0 from hsmp_hwmon_is_visble()
8. Multiply power value by 1000 before sending it back to hwmon
   subsystem
9. Add semicolon after hsmp_info in hsmp_chip_info declaration
10.Replace IS_ERR() with PTR_ERR_OR_ZERO()
11. uintptr_t is retained to avoid compiler warning
12. remove parenthesis around sock_ind parameter in
    devm_hwmon_device_register_with_info()

Changes since v1:
1. Move hsmp_create_sensor() call to init_acpi() in acpi.c and init_platform_device() in plat.c
2. Pass u16 as parameter instead of void * in hsmp_create_sensor()
3. Change dev_err() print after hsmp_create_sensor()
4. Add CONFIG_HWMON dependency in Makefile
5. Add #if IS_REACHABLE(CONFIG_HWMON) condition check in hsmp.h
6. Remove hsmp_hwmon struct in hsmp.h and add hwmon_channel_info and hwmon_chip_info to
   hwmon.c file as static variables
7. Change argument to devm_hwmon_device_register_with_info()
8. Remove hsmp_create_power_sensor() and define power info statically. Instead of multiple channel,
   use single channel with different attributes.
9. Replace switch with if in hsmp_hwmon_is_visble()
10. Remove referencing channel related code in hsmp_hwmon_read() and add code for attribute checking.
11. Replace switch with if in hsmp_hwmon_read()
12. Remove hsmp_hwmon_read_label().
13. Update hsmp_hwmon_write() to remove switch and code related to channel
14. Remove int-ll64.h header
15. Update the documentation

 Documentation/arch/x86/amd_hsmp.rst    |   8 ++
 drivers/platform/x86/amd/hsmp/Makefile |   1 +
 drivers/platform/x86/amd/hsmp/acpi.c   |   4 +
 drivers/platform/x86/amd/hsmp/hsmp.h   |   8 +-
 drivers/platform/x86/amd/hsmp/hwmon.c  | 121 +++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/plat.c   |   5 +
 6 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/hwmon.c

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 2fd917638e42..3ef3e0a71df9 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -116,6 +116,14 @@ for socket with ID00 is given below::
 			})
 		}
 
+HSMP HWMON interface
+====================
+HSMP power sensors are registered with the hwmon interface. A separate hwmon
+directory is created for each socket and the following files are generated
+within the hwmon directory.
+- power1_input (read only)
+- power1_cap_max (read only)
+- power1_cap (read, write)
 
 An example
 ==========
diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
index 0759bbcd13f6..ce8342e71f50 100644
--- a/drivers/platform/x86/amd/hsmp/Makefile
+++ b/drivers/platform/x86/amd/hsmp/Makefile
@@ -6,6 +6,7 @@
 
 obj-$(CONFIG_AMD_HSMP)			+= hsmp_common.o
 hsmp_common-y				:= hsmp.o
+hsmp_common-$(CONFIG_HWMON)		+= hwmon.o
 obj-$(CONFIG_AMD_HSMP_PLAT)		+= amd_hsmp.o
 amd_hsmp-y				:= plat.o
 obj-$(CONFIG_AMD_HSMP_ACPI)		+= hsmp_acpi.o
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 12f4950afcd9..93b413e0a6e6 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -281,6 +281,10 @@ static int init_acpi(struct device *dev)
 			dev_err(dev, "Failed to init metric table\n");
 	}
 
+	ret = hsmp_create_sensor(dev, sock_ind);
+	if (ret)
+		dev_err(dev, "Failed to register HSMP sensors with hwmon\n");
+
 	return ret;
 }
 
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 7877cb97993b..02eeebfcb165 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -12,6 +12,7 @@
 
 #include <linux/compiler_types.h>
 #include <linux/device.h>
+#include <linux/hwmon.h>
 #include <linux/miscdevice.h>
 #include <linux/pci.h>
 #include <linux/semaphore.h>
@@ -25,7 +26,7 @@
 #define HSMP_DEVNODE_NAME	"hsmp"
 #define ACPI_HSMP_DEVICE_HID    "AMDI0097"
 
-#define DRIVER_VERSION		"2.4"
+#define DRIVER_VERSION		"2.5"
 
 struct hsmp_mbaddr_info {
 	u32 base_addr;
@@ -63,4 +64,9 @@ int hsmp_misc_register(struct device *dev);
 int hsmp_get_tbl_dram_base(u16 sock_ind);
 ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
 struct hsmp_plat_device *get_hsmp_pdev(void);
+#if IS_REACHABLE(CONFIG_HWMON)
+int hsmp_create_sensor(struct device *dev, u16 sock_ind);
+#else
+int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
+#endif
 #endif /* HSMP_H */
diff --git a/drivers/platform/x86/amd/hsmp/hwmon.c b/drivers/platform/x86/amd/hsmp/hwmon.c
new file mode 100644
index 000000000000..7ffb61e0ef62
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/hwmon.c
@@ -0,0 +1,121 @@
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
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+#include "hsmp.h"
+
+#define HSMP_HWMON_NAME		"amd_hsmp_hwmon"
+
+static int hsmp_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			    u32 attr, int channel, long val)
+{
+	u16 sock_ind = (uintptr_t)dev_get_drvdata(dev);
+	struct hsmp_message msg = {};
+
+	if (type != hwmon_power)
+		return -EOPNOTSUPP;
+
+	if (attr != hwmon_power_cap)
+		return -EOPNOTSUPP;
+
+	msg.num_args = 1;
+	msg.args[0] = val / MICROWATT_PER_MILLIWATT;
+	msg.msg_id = HSMP_SET_SOCKET_POWER_LIMIT;
+	msg.sock_ind = sock_ind;
+	return hsmp_send_message(&msg);
+}
+
+static int hsmp_hwmon_read(struct device *dev,
+			   enum hwmon_sensor_types type,
+			   u32 attr, int channel, long *val)
+{
+	u16 sock_ind = (uintptr_t)dev_get_drvdata(dev);
+	struct hsmp_message msg = {};
+	int ret;
+
+	if (type != hwmon_power)
+		return -EOPNOTSUPP;
+
+	msg.sock_ind = sock_ind;
+	msg.response_sz = 1;
+
+	switch (attr) {
+	case hwmon_power_input:
+		msg.msg_id = HSMP_GET_SOCKET_POWER;
+		break;
+	case hwmon_power_cap:
+		msg.msg_id = HSMP_GET_SOCKET_POWER_LIMIT;
+		break;
+	case hwmon_power_cap_max:
+		msg.msg_id = HSMP_GET_SOCKET_POWER_LIMIT_MAX;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	ret = hsmp_send_message(&msg);
+	if (!ret)
+		*val = msg.args[0] * MICROWATT_PER_MILLIWATT;
+
+	return ret;
+}
+
+static umode_t hsmp_hwmon_is_visble(const void *data,
+				    enum hwmon_sensor_types type,
+				    u32 attr, int channel)
+{
+	if (type != hwmon_power)
+		return 0;
+
+	switch (attr) {
+	case hwmon_power_input:
+		return 0444;
+	case hwmon_power_cap:
+		return 0644;
+	case hwmon_power_cap_max:
+		return 0444;
+	default:
+		return 0;
+	}
+}
+
+static const struct hwmon_ops hsmp_hwmon_ops = {
+	.read = hsmp_hwmon_read,
+	.is_visible = hsmp_hwmon_is_visble,
+	.write	= hsmp_hwmon_write,
+};
+
+static const struct hwmon_channel_info * const hsmp_info[] = {
+	HWMON_CHANNEL_INFO(power, HWMON_P_INPUT | HWMON_P_CAP | HWMON_P_CAP_MAX),
+	NULL
+};
+
+static const struct hwmon_chip_info hsmp_chip_info = {
+	.ops = &hsmp_hwmon_ops,
+	.info = hsmp_info,
+};
+
+int hsmp_create_sensor(struct device *dev, u16 sock_ind)
+{
+	struct device *hwmon_dev;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, HSMP_HWMON_NAME,
+							 (void *)(uintptr_t)sock_ind,
+							 &hsmp_chip_info,
+							 NULL);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+EXPORT_SYMBOL_NS(hsmp_create_sensor, "AMD_HSMP");
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 4f03fdf988c1..0881d7e01936 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -189,6 +189,11 @@ static int init_platform_device(struct device *dev)
 			if (ret)
 				dev_err(dev, "Failed to init metric table\n");
 		}
+
+		/* Register with hwmon interface for reporting power */
+		ret = hsmp_create_sensor(dev, i);
+		if (ret)
+			dev_err(dev, "Failed to register HSMP sensors with hwmon\n");
 	}
 
 	return 0;
-- 
2.25.1

