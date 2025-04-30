Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2052.outbound.protection.outlook.com [40.107.96.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF2D1DAC95
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Apr 2025 12:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016746; cv=fail; b=Pc6H3ZtES0kB7+uuhCPNHwrTN/tZ8FCRl3NCTDWc+AeLdPqEJap/EBYmGvroker9FB9c60uX2wRVYD+JdlACYT7yb9ZgV67zcdff/8s9pUxPPBc9C7yaznj6yFAqSogzJLdaFTYsQWgSudPgAW44aYD+zlEPYIr5W9c/Oy8AtUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016746; c=relaxed/simple;
	bh=Xu7+YdO1r/MRsgaicMtJuiK54uOnWtzJQxDXns4AK9A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PY3jrWrGbxne+D6kEWydEYLgN3q6t7VdGcaifZW1D4CHaSf/2SmR484NNMUPQtxRS1etoRrNivSl6RmtMfhyT8ZZoZIc/1ia7CZON+IR/K5ROy3TYvRsOqqbwf8rQYYPZMO3e05ERIOqCCxu69wr+u6OnndzQgErmcHtNzymfdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AnZrILvo; arc=fail smtp.client-ip=40.107.96.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AnZrILvo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r83MK4csjknKu/P7vie1t13I74KaELVTj0Oijg3pi/NKCkSdMuzQDwE5UvjUuvG2KIwYEJNPTXxkGjxl1TuTETUvYrwJIJMkEkv0cl/8Ha7z2VXXAWKy3NTCsfSldFS9dxJ4bF87Ydn97qoh+QacmvJ7WvS6s8KMiMFSrjEcUQgtFSnHBCh+xHlsFINIv4SUe/7OpImIF98enAQi892MTZqHFTIA2gXwBmvO9xKiCobozv7CY7PTha4gPzotm8Aj/D980UqL9MhSDpu1jsqckSQg6P5Dkp6F7OFrO2wWZh4IyY1kNuXjGU5wBRBAlyaGaLqBx8QdcH23TUriF+rg0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uL8Bvc4DWj5oGBOWUD3tXMFeZIoLgiil/6/L3KTdiY=;
 b=tLGDW02fFF8bEgJ9OdEZZzuczwy1D9QpWeRdzIbYkxpjzAvtd23VOeyWK0gsEfDAQAH4tGWD1Ga7q6XWxcEZ6ccrs8TcqUZeMD4vQ2vqsY3M8DWZ6wwNCkgpG+iZQO1I0SMA9l1G1IZMqz/BAV7hG6kRwG01bDfOFivftc74jmAaWqqviJLHJXARelrUkPZK0gZd15/Zf1GygXkDYKWsA0novCGd8fHOF1lgOswD8GbPONbE11702hsK+UNfSVJlkJrA/6/2wgU3OmR8nl6puJGV9uqYLqVcZDSZzWRVe26sjlNwf5w5a0xR60Ex6hoabxkpeEauHneKW7BqQvCaNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uL8Bvc4DWj5oGBOWUD3tXMFeZIoLgiil/6/L3KTdiY=;
 b=AnZrILvo9naB3qv2ibw9bCYrcD+lSsBhgQPP0uUKeGe4LH30BkVwD5gCdy7hwQ2X5xAn7GhBgXALsJNqJWdKW1Ux12/rshuDfMYJyAXOkm34LDjKNPQqrfm3ofkWJZS5CX+RZ7lcNz3fIl7N3jEE1hwFUu0SZOAgcYGQdfs4Ros=
Received: from BN9PR03CA0398.namprd03.prod.outlook.com (2603:10b6:408:111::13)
 by MW4PR12MB7481.namprd12.prod.outlook.com (2603:10b6:303:212::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Wed, 30 Apr
 2025 12:39:01 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:111:cafe::7f) by BN9PR03CA0398.outlook.office365.com
 (2603:10b6:408:111::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Wed,
 30 Apr 2025 12:39:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 12:39:00 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 07:38:58 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v3 2/3] platform/x86/amd/hsmp: Report power via hwmon sensors
Date: Wed, 30 Apr 2025 12:38:18 +0000
Message-ID: <20250430123819.1289068-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250430123819.1289068-1-suma.hegde@amd.com>
References: <20250430123819.1289068-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|MW4PR12MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: 5666a3ed-22bc-4fbf-0853-08dd87e3fbbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWw0Z21ML2Q0QlBET3JkV0JPSVNKRWdacUdPWG5TTUQwamZUYklXYWswT2Fr?=
 =?utf-8?B?bG5BU0ltUHZDT0lsejJURGFYRGlnU0VuL29HeXlHWit1d3ZKMlJlQ2dITlNZ?=
 =?utf-8?B?STMxU0pockZaakl4K2ZENzJVRU85K1NsYWlZTEdob2o2dlB4SmdGdmNSM3lq?=
 =?utf-8?B?NWJRMFovd252UFlIYW5NRlZZdDczbEE1VUVKbWNaMFJJUkE2cjVyUFFpUWRR?=
 =?utf-8?B?RDdGRm9YUExVS29EbUdkVlNHYWIzcTJOd1BLT1h4dXIxdWhKQ3BTUlVGTDJY?=
 =?utf-8?B?QnA3NHQ5VHgxRWxoUjk0dkJBMTFadWtOS2trY05jTTVmNEkzTmR2d0EzV1Bt?=
 =?utf-8?B?dzRaL1JhVlBBbTMwMDJPRmdGU1ZPOEYrYVpsdThNY09EaS8wd3ZVSDRTaUxY?=
 =?utf-8?B?TFZlQlVSSGZhdCt2UCtadWtBemY2VVBNZ0VwK0dCSExLTEJBYkE5Q3BBV2Jo?=
 =?utf-8?B?SStKR1pab0ZzYytTTU04LzhrWTJSSC9mS3pDSjVNTnhLSXJuTUFKUjVvZXUr?=
 =?utf-8?B?NlJuay8xclBHMUg3S01LZ0JRT0QrUTIxdmM0Qy9IZ0RMTWhibjVsYlJGNnlH?=
 =?utf-8?B?WXFLUTIvdHp0a1dPdjN2dVRkbkdsY2F2STdYWlE5enJIN01DdFRNZ0xPZkdq?=
 =?utf-8?B?NFlPZ2M4UTRiTXc2dnd2dTVMZEE5a1NRN1NiVWVYaVRWQndoY2pEbFFDYmNC?=
 =?utf-8?B?dzNvNmtPTlJYb3phbDBGUVR4NUxKN1VrUEVrWUhlMWJvWC9WR1ZPa3Nid2g3?=
 =?utf-8?B?QUZjeDU4aGpiOGY4RE5OcC9iNUdIZU5FR0EreFIzMEU2TmNhdmNRbnpuVnVj?=
 =?utf-8?B?czNmR2lJdzBPV094U0EvZ0NFREM4ZzVqdU5EcU1FZ1p1VXpGcEZPeWZRZGZu?=
 =?utf-8?B?UlpMSkJuVlVYNVVkaklwTi9YdTd0TDJPbzRrT0VUN2tMZmdvdmIzOHpSWVo5?=
 =?utf-8?B?UG0rNnZSRCtGQXZobGU0dmRNSEQxNDA5enpvMXRYU0FzUUJWYnZuUXkzcXBB?=
 =?utf-8?B?ZFpKVVRwMzBtN3hKSzdFVjhKbVBuL0NBa3JZMGg1N3dDK2ZSTGs1blNTVHBz?=
 =?utf-8?B?bXVCR1dtT2V2bEhlREZZU29qbmxPVDlwdXBaR1V0bmRRK1A3UDNDODZ4Z0kv?=
 =?utf-8?B?L01NNnN0M3IrTElta3JqRTdHNGNMZy9OV0Q3NHZ6NlRLWGthUEsxcUNHOUFm?=
 =?utf-8?B?bjZnVFdJY242aFU5QW9tK1Q4aWRrODNmVDdjKzBqNnhUVFBmc0tsRlpkUjJ3?=
 =?utf-8?B?dnFwdFFIeEIrdnlkVUVKRm1MdDBhQmxmZGxBMEtVcDNhS2t6TS93dlZVa2pD?=
 =?utf-8?B?UXBDU1ZFRC9jWmJxdU1VbkU4Y2dMOEN0NjFidzAwbjdsamQ1bDBlMitPMWJ4?=
 =?utf-8?B?RnJTeHJoZ3Y5RG1MSFhyOFVVZVI2NE0ydTlldU5mK3NXcTNRbFVmTkVOQ1VL?=
 =?utf-8?B?UTJvODBTSlpTeHV5NnFyd2ROeFFOLytud1BRWVpJMElUWS9nc1pNdFRnM2pp?=
 =?utf-8?B?bGxVSWFrczhWZTFYL1VLbnNnZUNxQndGQmVxN04wK3F0Z0hxbW80WUFCQjZF?=
 =?utf-8?B?UWJka3M1TTkxdXRJQnZ0MjJ6b2JVcjBHWEpYbjBxbk9maE9iZmVwMmdFd3ZI?=
 =?utf-8?B?N2tsL3VOc1ozdE5QU0ZDSHMrNzU5SzgvMmtMKzRGK0FOSkxIWklaSkk2VURy?=
 =?utf-8?B?YkNqdE5XNHdRUlN5QllpRnZiZHpUMXBKcTREaytaRFpQQ3JNSkVLdm1VUHRL?=
 =?utf-8?B?b0s1ZFNxMVVZaWJGVkVFMEFQK29na3U1OGd4OW00U1VSSmJYQU9rbGswWTRL?=
 =?utf-8?B?Nk5XNGtmd21zVjd3R1dkdHNSUEhzUlcvQzIwNmZoVTh4Y1hTcUZrMlpHb0E0?=
 =?utf-8?B?Q2llZ2FCS1I5aWh2NncrTklpN1h4VzE2WnBlU3JzalZJMWY4ZjhaVm1Wemor?=
 =?utf-8?B?L3VIMmxCV0ZVc2d5d251YVVxekNWc3FNWHBMTXNkUnVUVWw0QTNaaFNieE5n?=
 =?utf-8?B?RWk3S1ZXWnlOVk1teWExS3dYeU1aN0JEUVBVYXE0c2hOTUxwUUNjL3ZvSVlJ?=
 =?utf-8?Q?ECs9ga?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 12:39:00.6932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5666a3ed-22bc-4fbf-0853-08dd87e3fbbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7481

Expose power reading and power limits via hwmon power sensors.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
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
 drivers/platform/x86/amd/hsmp/hwmon.c  | 122 +++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/plat.c   |   5 +
 6 files changed, 147 insertions(+), 1 deletion(-)
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
index 000000000000..93827c38f169
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/hwmon.c
@@ -0,0 +1,122 @@
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
+	/* Convert the power value to mWatt from µWatt */
+	msg.args[0] = val / 1000;
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
+		/* Convert the power value to µWatt from mWatt */
+		*val = msg.args[0] * 1000;
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

