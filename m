Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2058.outbound.protection.outlook.com [40.107.95.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79679251790
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Mar 2025 06:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742882730; cv=fail; b=ahTDZhm4aPLHDEI3V07oOzFq9292SlEauLQoWKJeqCtBcTDQ9fuMlZn2ZnyO5ykLrkAn7S+x35B25uAJZdCZmlbcDMOEPFYsK7OBYHBOxMA+AZ2V+KKhkUbH10JKnyJ/LI6VFRVoYAjemCoBvvilgpnKEa1hAnfZp9/On6awszo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742882730; c=relaxed/simple;
	bh=bg4ukpYN9X8Tvrw1P0319FzvNQ4WHMyZOXjA5Oo8wNk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N5LR87ROHHxjzQAFnCVyBktpa1bAfAVm0j1ipfzQFNK7Rqhsvl4MwD5XYxnCiW5HFuGbPLsqU4QIDDpySUpi9KcRHZg6ThOXXxv6xb7o5FsY4KcBMUT2MmjOQ1KVEbs1m97cQWaxBOGq4RUbele+O5pRHFzCWogu4oqff2gqOWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=37fO0DL1; arc=fail smtp.client-ip=40.107.95.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="37fO0DL1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKgVoiCrUalhCGi+KXHR0ex3RAO7TvHdtfSV3Sq7dif2AG2ZJLTDNBDZBOrRLJKdfvtLZU/RvuBCdrfcLujhetc99a2xBq1MBeMrlzhwmanwaVN4xSyWjBB0JFu/pCVgYCYNoelgdwWoeYbkGRLvAB+xGdB5rZi+RZ8qB0dqJeITkkB/GDuudtqXJ2RprSg9NO/qnWzMDHqBMICrjZ9bmAUY6kaqrkjw0AjRNVQkr5R4MgfVDrVNLmXu87W3NqN90Zy+FebfLQKoTe9sdzi7iia3a5KNbmEG+z7GPk+sa7u/3/etAcC5rqUmqYsp1UdCo5EjQMu6TFmUYFXLrkeUjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjadRKaRQyZgs6wON2dAEAyHwfuavjCTuMWZKzsRXTI=;
 b=fhq9Mee065DIg2YhyblC5hCWey1FHycSSzaZkpx6qwMXPn3hb34tHKNhZdJYSBDwfopIKadbqptf0lMAYkGcCm0gj8eLQzIT5wshUZY/YoDrMtlByLHfUCTYSNAmRtAn1Wip1MOU7ixaKZHFEHGVL0IUk5mwEmnCv/gftavtcWpZDQJyRxu7U8jubc5f4lmyagqVKgSjvPIKY424akd/nmXhGlhQ15ka0fUs7XEkuwY+mc7Bu3vzr5st7rp2elC7A/WyLkj+AUYNnDhFYDkxDecEEXqoE7qzFWWYa92yOiV63XHpi/29jNtzvklulfdB3ic0KS4+WK0q/WRWuZ5fxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjadRKaRQyZgs6wON2dAEAyHwfuavjCTuMWZKzsRXTI=;
 b=37fO0DL1ByLrTo3m0Vj/O2BqRSJY8h5PRHd66bQZgsURH4wzy/E2NObs7rlZGlPnXmpAl3DbRRqvuYBmAHmwIJEpLAKmqPKiJBFaamv8n2ADxy041+say/WTprlYg9wYv+DgW5SEUJTeeytSVxjpqFUHUPKHnlsmginBH/Oe+lA=
Received: from MN2PR17CA0012.namprd17.prod.outlook.com (2603:10b6:208:15e::25)
 by DS0PR12MB7948.namprd12.prod.outlook.com (2603:10b6:8:152::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 06:05:24 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::88) by MN2PR17CA0012.outlook.office365.com
 (2603:10b6:208:15e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Tue,
 25 Mar 2025 06:05:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 25 Mar 2025 06:05:23 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 01:05:20 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v2 2/3] platform/x86/amd/hsmp: Report power using hwmon sensors
Date: Tue, 25 Mar 2025 06:04:56 +0000
Message-ID: <20250325060457.3643613-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250325060457.3643613-1-suma.hegde@amd.com>
References: <20250325060457.3643613-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|DS0PR12MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae0d79b-6e14-4215-efad-08dd6b63081e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YuqsQGIrnvQ7JZGqrOrt+28n9ziqt47tRdTl32kT3jwY941GOJlORJiwjytm?=
 =?us-ascii?Q?wM7z+yQ9ItXuXlIfNcIegZS6l1KxNGzoHK4v2/B5UU8xSG2MwfMB4rL1WUyH?=
 =?us-ascii?Q?sqUU4voxRyMyIqcCOO8qJC5cBBEd++YAktIZBycmbq94kOkzBbCkkvxVv67g?=
 =?us-ascii?Q?pq7XRDW44Xf0x9qmDhlB+XR4S01mrTznt5QlPW9rVH4px565nWh0Wr4fGEWt?=
 =?us-ascii?Q?6niWgWNnFIiZ2yI1jR87Z+1V5PQPdW9Mo4Mc5gYJifitA1LzBXrnwHoiF+rQ?=
 =?us-ascii?Q?nZAv9E1e3GUL9VkvJ825QmkrO5gLYvhvyAifdqo2KkrU2+InSyJpRpEtV5Z/?=
 =?us-ascii?Q?n57bgJ0x1v8z4rZqkXCAnUtKsNf27LBQycKZ9cpRDefvE2EXApLFMu6Ei792?=
 =?us-ascii?Q?YcEKipUtHHKTRl4auQBljcJqiU+w1BCpXiNhHbbbjRYHOKIndORo+o0EGzj1?=
 =?us-ascii?Q?zbDp2a4DM+Q8nP1X1pkvYLdQ1GCwZiraA1u33IR53iswhdvl7kzGDCl3EFsz?=
 =?us-ascii?Q?OQtpaPahG1pzLdtLqVVlSEjN5uHfev9381TF5PU6oCeGmQgor0zSfllfe/VH?=
 =?us-ascii?Q?oyYyu+HEVaktJinyOtW45Ti5kY/dbF6ja4xbtXd+OfnVHlO2nEo/TE4cu0TN?=
 =?us-ascii?Q?4JAJEnkOWkX0Luusp0jJkiRlrIhSh2doNRUSzlfbf1fRE7EIMEAKITXYJ8wJ?=
 =?us-ascii?Q?UPVguJJGNB6MHiTzWS61GeHHD9YvdxYUQcTxcNevL0arqmB0wOf7QXrUI/p9?=
 =?us-ascii?Q?KwadUYiKLwcE+xnFOle8KL0Fuuu0mN2hNrVTIzZeJrHvXLQ74uN5Pc2mL4Hd?=
 =?us-ascii?Q?thtfXq5OhKn6QAvoZ3Bq8E6+OMQraJToO2Al6lYE8/6dIngbxpqPWn1OXh4u?=
 =?us-ascii?Q?z+5lza2wOJPqb6JK+3Ij0LTrBH6Swl7Jh48OWADmipbwzIzukA4gKeNhH3qE?=
 =?us-ascii?Q?Glik+nm2TJsdzee2cActmUvrY2AHBdbstwBdnID+2sq/4ImC+GqoNrrle6tO?=
 =?us-ascii?Q?wNpLSiOIy93YSVWoV1/essY/0sBvncsOYbaV8uwgJKi6a9VuBINxiWh1M4Ux?=
 =?us-ascii?Q?HgV1YVeMEUySO4sTbJ4lct15nXIPp5cgijXjdQ1erTQMkXtpWpr3Wb9o4g6b?=
 =?us-ascii?Q?M5Ir22Jow92hRY1VCH5X6MbOInc5KOnkswMTPYeoBegB4vjZ1ypl3B6ra5W3?=
 =?us-ascii?Q?oSlBGghNSWe3g2Lyfc9Zg3UHfmt+86fARQ0WsRQfwdXltKZRqGDKMSEE68id?=
 =?us-ascii?Q?a6FUsiTnIBXF9XeAwmTtMRLaKSFz9X9K1ECy7Ok1wXw6afSaHKQcnsFT/WgS?=
 =?us-ascii?Q?cjNAhH99QG4D1DczTCw2cirtMUILhICHbAn8aIQi9saynjcH2a9HQzGcqk6U?=
 =?us-ascii?Q?JaYtcZXrSNbQSdFtVsP7zMbsIBHVhlgLmhoEdJ+WUVLbjCIQb46suWB6Bsgu?=
 =?us-ascii?Q?zrRRL5lLzEyWs/lKRbQOzGbid/eQq9sPthw0kl7ybM+3H4nXAQHdL/J+PJf+?=
 =?us-ascii?Q?Taa4NxlrW6LcAm0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 06:05:23.8189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae0d79b-6e14-4215-efad-08dd6b63081e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7948

Expose power reading and power limits via hwmon power sensors.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
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

 Documentation/arch/x86/amd_hsmp.rst    |  10 ++
 drivers/platform/x86/amd/hsmp/Makefile |   1 +
 drivers/platform/x86/amd/hsmp/acpi.c   |   4 +
 drivers/platform/x86/amd/hsmp/hsmp.h   |  11 ++-
 drivers/platform/x86/amd/hsmp/hwmon.c  | 124 +++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/plat.c   |   5 +
 6 files changed, 154 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/hwmon.c

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 2fd917638e42..1d7b159a35d5 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -117,6 +117,16 @@ for socket with ID00 is given below::
 		}
 
 
+HSMP HWMON interface
+==================
+HSMP power sensors are registered with hwmon interface.
+
+One hwmon directory is created for each socket and following files with 0444 permission are created
+inside the hwmon directory.
+- power1_input
+- power1_cap_max
+- power1_cap
+
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
index 0c54c91b5f1a..abbb680b9c71 100644
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
index 3dee0bb684c7..0063904904ed 100644
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
@@ -65,4 +66,12 @@ int hsmp_misc_register(struct device *dev);
 int hsmp_get_tbl_dram_base(u16 sock_ind);
 ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
 struct hsmp_plat_device *get_hsmp_pdev(void);
+#if IS_REACHABLE(CONFIG_HWMON)
+int hsmp_create_sensor(struct device *dev, u16 sock_ind);
+#else
+int hsmp_create_sensor(struct device *dev, u16 sock_ind);
+{
+	return 0;
+}
+#endif
 #endif /* HSMP_H */
diff --git a/drivers/platform/x86/amd/hsmp/hwmon.c b/drivers/platform/x86/amd/hsmp/hwmon.c
new file mode 100644
index 000000000000..98b1d66f491d
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/hwmon.c
@@ -0,0 +1,124 @@
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
+#include <linux/hwmon.h>
+
+#include "hsmp.h"
+
+#define HSMP_HWMON_NAME		"amd_hsmp_hwmon"
+
+static int hsmp_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			    u32 attr, int channel, long val)
+{
+	u16 sock_ind = (uintptr_t)dev_get_drvdata(dev);
+
+	struct hsmp_message msg = { 0 };
+
+	if (type != hwmon_power)
+		return -EOPNOTSUPP;
+
+	if (attr != hwmon_power_cap)
+		return -EOPNOTSUPP;
+
+	msg.num_args = 1;
+	msg.args[0] = val;
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
+	struct hsmp_message msg = { 0 };
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
+		*val = msg.args[0];
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
+
+	return 0;
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
+	.info = hsmp_info
+};
+
+int hsmp_create_sensor(struct device *dev, u16 sock_ind)
+{
+	struct device *hwmon_dev;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, HSMP_HWMON_NAME,
+							 (void *)(uintptr_t)(sock_ind),
+							 &hsmp_chip_info,
+							 NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(hsmp_create_sensor, "AMD_HSMP");
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 63034408985c..63a5d31341e1 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -200,6 +200,11 @@ static int init_platform_device(struct device *dev)
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

