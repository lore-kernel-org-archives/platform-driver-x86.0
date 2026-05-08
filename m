Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011060.outbound.protection.outlook.com [40.107.208.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7E42D9EDB;
	Fri,  8 May 2026 08:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778229807; cv=fail; b=QyEyQVglaQphLaPcRlI+EKiX0z8cnXQJxQRh4dpyQxXV7UKnb9UD95ZNHmr7CEer87nJs6k1wnb5qEuzm8E101VqFpQoFEp4p/WaEKyTpm1KdB2/FQoCLaFsE0mCp8bSHpElophX/E2WPKDpFcd7oxg6V8IZpzeh11r2SZXb/AM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778229807; c=relaxed/simple;
	bh=EpTQ3Galy0tzT6/PpPcRJlwprsDR27Jtfwg58FUrir0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=AU5BwojoxuFlFo6QTOJOcC4Wc1afE/KZcVwGuNaCKn2xqH2WxF8uYTqLRRkwUCTAnHUF8QRUy3Jzfjlga/stzCX2YUAmmujum6yci5kVuGkdMNgjV3UiSchqVMGq9JGfiYet8Hrz1+C/YUV5aro/0A4pMvdk8k6KVEyIl7v2E2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cWc4Dr4G; arc=fail smtp.client-ip=40.107.208.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cWc4Dr4G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1f38tvQ4RfTtRyz3S+FSy/xPrgX2b3GCP2FkNH22/Rfphfi/o8ZIySh7LLY+gJ0jKQAdKSRhCOQCb67NRIQxW+ZVSFGmmzekcD3hejs/84OgZWZDAq2VGVgmcFJRO6igGYuBwsc4lS06x8k/XZalneI8ch0/uFv0A/ypwMOjKMbZPJ9flPYrKLnwPYBQNRERyTHaWZ3aQIfPaVrNAVZLCqENvBBZlBSIiaprVWuSPMN2pFFICYOgmoHHpfU1c3FyPgyHIlkSJRqy/CPQW+90aOy9UuheBvxfTF3r3fI6rxnrc0lfzx4+jRj/5XQ319rB9jphfzjH1DlFWlgD2T+gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hchXbV1fjz7oTedgchpRhhLp4Su/flEnDNSL4i7/koc=;
 b=krGs6fncoCnjuwJzD0WRMH0JDGAbDBU8qECyBDqUXpoM0y3fG+rbDDiwOY8bydRy39mQoZWVPEH7ACBe1um9GqIJL2koB1XOq03B1RrA3WO37SDdugvDLsL7Y3b8lqrwdgjABNMRKwJOckNy8VmR8tCrrrVVKu7o9Snahjs0shw8T7/JbFs7UYQJMzKTrrmxSn6a83oZUOR17kzGqSTHAphMixUkWkuy4vmhNi+OKJULrn4Xaa+rGFe7DAgeAV5OUeukOwOJukz4Edr6KDaIaRI2r4DK3XNdVdGoae4SmwarO0lhZEjDylJQ6xpK3RYiNgIFS2pAFwC1yV/n0MEaGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hchXbV1fjz7oTedgchpRhhLp4Su/flEnDNSL4i7/koc=;
 b=cWc4Dr4G/Jc863l8mdEc14gzi5DcFydx+7ZG5RLKTIrzTS1MJwL4m2WsVnFzYT643lKS6gGAjp86StXfjOP4DIekvAsN3wr9UPLWg7bfERZxZftM5wbWx3T5YuCPgJxk36hDdmf9cN608mNyVO7kdFgN0h871hzTUc8A+5MLD10=
Received: from SN7PR04CA0051.namprd04.prod.outlook.com (2603:10b6:806:120::26)
 by DSSPR12MB999236.namprd12.prod.outlook.com (2603:10b6:8:374::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Fri, 8 May
 2026 08:43:20 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:806:120:cafe::c6) by SN7PR04CA0051.outlook.office365.com
 (2603:10b6:806:120::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.18 via Frontend Transport; Fri,
 8 May 2026 08:43:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 08:43:20 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 8 May
 2026 03:43:17 -0500
From: "Yo-Jung Leo Lin (AMD)" <leo.lin@amd.com>
Date: Fri, 8 May 2026 16:42:43 +0800
Subject: [PATCH v3] platform/x86/amd: Introduce Halo Box RGB LED driver
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260508-halo-leds-v2-plus-v3-1-91df458966ea@amd.com>
X-B4-Tracking: v=1; b=H4sIAAOi/WkC/22OOw6DMBBErxK5ziKzfAypuEdE4cACVgCjNaBEi
 LvHkCZFqtGTZp5mE47YkBO3yyaYVuOMHT1E14uoOj22BKb2LFBiKmPModO9hZ5qByvC1C8OFGK
 VySzSDWXC7yamxrxO57303LAdYO6Y9K9JScQkToMwlirHCEJwy0Q8hMWTeKQ+sNwets642fL7P
 Lji4fwaEhn/+eIzBN1IVAqVLz0KPdRBZQdR7vv+AeNzrtvuAAAA
To: Hans de Goede <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, "Mario Limonciello (AMD)"
	<superm1@kernel.org>, "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
CC: <linux-kernel@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13416; i=leo.lin@amd.com;
 h=from:subject:message-id; bh=EpTQ3Galy0tzT6/PpPcRJlwprsDR27Jtfwg58FUrir0=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBp/aIlHprXDtzdT2AVn63PGgESRQhVvWpB9thd2
 WgBc9+g9TGJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaf2iJQAKCRBfF7GWSinu
 hi+SD/44G9GYmOEs5jcZy8Tr7FlgKsqKzFez+dOSpc3mLJjiSUYY2/24xtF1K1vkO3aWjWOgsJk
 YgfzW94r0pqkHToSbzeYvbXPd2rzAtU+ozUs4txWn3TfpajFFQJnhW1s9v8CO3O8n4fwv9QEGpF
 s2r5YViqSu/ePcoCq9NwZAKVtyL6aWnHrhI0+zOtOsRVjl4EXU7AmXB2a8e0UxiOD44uHAgHdzL
 4aWnw3Sexpc1jTl4IsBxXG+vD78t1YosmsUDIX/AgGORjZ9D+iSS1lRgErKhNvCfIKEug+gYit0
 fUsHzLordfj52FY2+JwA6ErES7gwrdmn7JCXHFJOft+ySFWasXtkqijJ9XbgFOLF62Vtj9NxMu8
 ra/vDfBlB+QJluT7n2sa3FKuWxqxu/5oPc94Z1R0/fcpt1PJjhO1CzIL9zaJKKJWiymOMsT7mg2
 yh+PN+3eJDJ9RZt3lnS4J4PS5M8SPhTkNzUlEFGLbZBbZ8857dSYyMjJfyJwhAM8kXWfg/fWShr
 7bPsAOKJNyQq2mhG6pS5n7iyPpVxf7Puh2nQbs/89FIkecj2blrEJ1lvF1qX8VoaseeaxgQ6A9s
 8FxMEJnJa7g/ak/QyJ+HuaJoeGoy/2QNQRmtlE6FW7PsjcIN+G84jQSd73Ako5yIx16mjvdQ000
 TN+IX9Ck9cRrsXg==
X-Developer-Key: i=leo.lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|DSSPR12MB999236:EE_
X-MS-Office365-Filtering-Correlation-Id: ff89ad1c-9f12-4272-55ec-08deacdddb94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|3023799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	CofUtAENFhieHHy4Eu0sXR5dUGyQICRvoOYqfXvgEXijwQ1RsVkO2ygsXm/XY5iC5FkeWMhSW8L2b+O32VWacpIIwYnyEHnNlUzUjYNNngMrZ4MLOxjQlxZs2oIn7NurlHiOIxx2+iDXzCiIDk1haz+Z4a3xz0CbCkyOFgqw6SV7rfY9UfwrffPcBH1i8wzfWVDX54JvSy/xaBLknThkD5JClI5MGT8x8kjejHTQ4jIF5+CnTkLPZUg1sBGDENAmfwlc5zaq45nrNmxyi4yavPIhj8+CLrNnMetgI/IXxvx07dqNEOSqjq+vq9MY4w8APEvbDoyICAnRZAkK/wE6tTSo6heGyUkT/fkcDaVAqWd9RaqWHyhhYEHDZzUp1x1B7NumhB0ydAEQSMZTDoOK/8teYh5pcaMRkl/mjXQ+ihBdsC8mTsODHrPf3NdzL4U4oL3bICKopC5Bz6VR5BFckhscqs1RuH/PaWnTg/eOttkBD/FERGbenqs4gOztB1/ez1bQ1HZGlBrVusOsolaBNpcSjlRbQ8bGsJ9GI2SwzVkpkPZ2gZ4jX87UyeWm2Hbf8FX5tJvLDBtW76T8KnLjiZ1t/tVq29qv2aCVg6HcySIldI0DShh+kaMqPua84iT6qJ1Y7fFY987ihy6IKwZvc3rbtWOY1z3XFTIBEFDPcHTz/B0Rp+jDGqSOYcdVvEIrYG2rTXznNWp8gfyMfhN5aXOBOcjf84Gm6lDeP56le4g=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(3023799003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dTgukPkp9pDVB6oPYYUx/e1o7c9vYqkwC6oIsS9LLXfUjd/Br2rWBCkOpzXHbgVmIHihTiSwpmen0qTFgSt6V4vr09BPOliH+WNhC9lCmJmjPkmQMKcnh+jKpz1qVx9mIiiRlRwk1g/0upJ7yXDIkl1g7ES05nPcS8QI4QCxH4FXKQUqQTX+lQ+qhjViANUPVdtW0/NZiOixCD35hkakir6xfxp0xwxXFUnlDYaGKDY+Le70XcDdVyrCW1ldMwQAzcEZpHGhKCrTSbg6nNAgkg9Ws+VOkqi3wFMHQPY4+kTXEQeqJD8m6YbEVbHHYYvzZFr5HFP3zmrYaufNlogWk3Yhcx0vxnEvTqS2YnVFJryg14u4LJ6s/w3t7QxVZOMaLTMgeexYImEKRvx4dy1CIKjQaRFgkt1b7Tie1hs3C2S/KvLChEUy4qRjSrSOT0Lr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 08:43:20.4219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff89ad1c-9f12-4272-55ec-08deacdddb94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR12MB999236

The Halo Box features an RGB LED light bar that can be controlled
through WMI methods to display any color combination.

The driver exposes the LED through the LED multicolor subsystem,
allowing userspace to control RGB values via sysfs:
  /sys/class/leds/amd_halo:multicolor:status/multi_intensity
  /sys/class/leds/amd_halo:multicolor:status/brightness

Hardware interface:
- Three separate RGB channels (Red, Green, Blue)
- Each channel controlled via individual WMI method calls
- Value range: 0-100 (matching hardware range directly)

Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
v2 -> v3:
- Re-introduce OF/OFF method: implement them with wmidev_invoke_method
- Explicitly call the ON method on brightness_set callback for
  brightness != 0; call the OFF method when brightness == 0
- Turn off light bar if TURN_ON/SET_LIGHTBAR can't function normally
- Replace get_unaligned_le64 with casting and le16_to_cpu()
- Add an inline function (wmi_status_to_err) to convert WMI return
  values to errno
- Use amd_halo_wmi_set_channel in probe to set default color
- Use devm_mutex_init() instead
- Remove unused includes
- Link to v2: https://lore.kernel.org/r/20260504-halo-leds-v2-plus-v2-1-af027727605b@amd.com

v1 -> v2:
- Fix Kconfig dependencies
- Remove amd_halo_wmi_turn_off(). Handle the case where brightness=0 with the
  same logic where brightness != 0
- Remove the brightness_get callback, because currently there isn't a
  well-defined global bightness in hardware. Note that the sysfs brightness
  stil works. It just caches the value last set.
- Convert to wmidev_invoke_method()
- Convert to ARRAY_SIZE()
- Convert some macros to enum
- Convert to devm_led_classdev_multicolor_register_ext()
- Rename sysfs path to amd_halo:multicolor:status
- Fold default LED colors setting in probe, before registration
- Add no_singleton option
- Make default RGB values into macros and adjust their values
---
 MAINTAINERS                             |   7 +
 drivers/platform/x86/amd/Kconfig        |  11 ++
 drivers/platform/x86/amd/Makefile       |   1 +
 drivers/platform/x86/amd/amd_halo_led.c | 312 ++++++++++++++++++++++++++++++++
 4 files changed, 331 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c871acf2179c..464bd4d16461 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1124,6 +1124,13 @@ F:	drivers/char/hw_random/geode-rng.c
 F:	drivers/crypto/geode*
 F:	drivers/video/fbdev/geode/
 
+AMD HALO BOX RGB LED DRIVER
+M:	Mario Limonciello (AMD) <superm1@kernel.org>
+R:	Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Supported
+F:	drivers/platform/x86/amd/amd_halo_led.c
+
 AMD HSMP DRIVER
 M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
 R:	Carlos Bilbao <carlos.bilbao@kernel.org>
diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index b813f9265368..a1a74ef6c859 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -34,6 +34,17 @@ config AMD_WBRF
 	  This mechanism will only be activated on platforms that advertise a
 	  need for it.
 
+config AMD_HALO_LED
+	tristate "AMD Halo Box RGB LED Driver"
+	depends on ACPI_WMI && LEDS_CLASS_MULTICOLOR
+	help
+	  This driver provides RGB LED control for AMD Halo Box devices
+	  through the LED multicolor subsystem. The Halo Box light bar can
+	  be controlled via sysfs to display any RGB color combination.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called amd_halo_led.
+
 config AMD_ISP_PLATFORM
 	tristate "AMD ISP4 platform driver"
 	depends on I2C && X86_64 && ACPI
diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
index f6ff0c837f34..2f467dbbfc8a 100644
--- a/drivers/platform/x86/amd/Makefile
+++ b/drivers/platform/x86/amd/Makefile
@@ -10,5 +10,6 @@ obj-$(CONFIG_AMD_PMC)		+= pmc/
 obj-$(CONFIG_AMD_HSMP)		+= hsmp/
 obj-$(CONFIG_AMD_PMF)		+= pmf/
 obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
+obj-$(CONFIG_AMD_HALO_LED)	+= amd_halo_led.o
 obj-$(CONFIG_AMD_ISP_PLATFORM)	+= amd_isp4.o
 obj-$(CONFIG_AMD_HFI)		+= hfi/
diff --git a/drivers/platform/x86/amd/amd_halo_led.c b/drivers/platform/x86/amd/amd_halo_led.c
new file mode 100644
index 000000000000..632ccdf07ffe
--- /dev/null
+++ b/drivers/platform/x86/amd/amd_halo_led.c
@@ -0,0 +1,312 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD Halo Box RGB LED Driver
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc.
+ *
+ * This driver provides RGB LED control for AMD Halo Box devices through
+ * the LED multicolor subsystem. The Halo Box light bar can be controlled
+ * via sysfs to display any RGB color combination.
+ */
+
+#include <linux/led-class-multicolor.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/wmi.h>
+
+#define AMD_HALO_GUID "081E747B-E028-4232-AF24-EAAEAB2B1E86"
+
+/* WMI method IDs from MOF */
+enum {
+	AMD_HALO_WMI_GET_LIGHTBAR = 0x01,
+	AMD_HALO_WMI_SET_LIGHTBAR,
+	AMD_HALO_WMI_TURN_ON,
+	AMD_HALO_WMI_TURN_OFF
+};
+
+/* Channel selectors for Arg0 */
+enum {
+	AMD_HALO_CHANNEL_RED = 0x01,
+	AMD_HALO_CHANNEL_GREEN,
+	AMD_HALO_CHANNEL_BLUE
+};
+
+/* Status codes from spec */
+#define AMD_HALO_STATUS_SUCCESS		0x0000
+#define AMD_HALO_STATUS_INVALID_PARAM	0xFFFD
+
+/* Brightness uses 0-100 range */
+#define AMD_HALO_MAX_HW_BRIGHTNESS	100
+
+/* Default RGB brightness */
+#define AMD_HALO_DEFAULT_RED		50
+#define AMD_HALO_DEFAULT_GREEN		30
+#define AMD_HALO_DEFAULT_BLUE		30
+
+/**
+ * struct amd_halo_led_data - Driver private data
+ * @wdev: WMI device pointer
+ * @led_mc: LED multicolor class device
+ * @subled_info: RGB channel information
+ * @lock: Mutex to protect WMI calls
+ */
+struct amd_halo_led_data {
+	struct wmi_device *wdev;
+	struct led_classdev_mc led_mc;
+	struct mc_subled subled_info[3];
+	struct mutex lock;	/* Protects WMI method calls */
+};
+
+struct amd_halo_wmi_args {
+	u32 arg0;
+	u32 arg1;
+};
+
+static inline int wmi_status_to_err(u16 status)
+{
+	switch (status) {
+	case AMD_HALO_STATUS_SUCCESS:
+		return 0;
+	case AMD_HALO_STATUS_INVALID_PARAM:
+		return -EINVAL;
+	default:
+		return -EIO;
+	}
+}
+
+static int __amd_halo_wmi_call(struct wmi_device *wdev,
+			       u32 method_id,
+			       u32 arg0,
+			       u32 arg1)
+{
+	struct amd_halo_wmi_args args = {
+		.arg0 = arg0,
+		.arg1 = arg1,
+	};
+	struct wmi_buffer input = {
+		.length = sizeof(args),
+		.data = &args,
+	};
+	struct wmi_buffer output = { 0 };
+	u16 result_status;
+	int ret;
+
+	ret = wmidev_invoke_method(wdev, 0, method_id,
+				   &input, &output, sizeof(result_status));
+	if (ret)
+		return ret;
+
+	/* Return buffer per spec: Bytes[0:1] = Status (little-endian) */
+	result_status = le16_to_cpu(*(__le16 *)output.data);
+	ret = wmi_status_to_err(result_status);
+
+	kfree(output.data);
+	return ret;
+}
+
+/**
+ * amd_halo_wmi_turn_on - Turn on all LED channels
+ * @wdev: WMI device pointer
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int amd_halo_wmi_turn_on(struct wmi_device *wdev)
+{
+	return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_TURN_ON, 0, 0);
+}
+
+/**
+ * amd_halo_wmi_turn_off - Turn off all LED channels
+ * @wdev: WMI device pointer
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int amd_halo_wmi_turn_off(struct wmi_device *wdev)
+{
+	return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_TURN_OFF, 0, 0);
+}
+
+/**
+ * amd_halo_wmi_set_channel - Set a single RGB channel value
+ * @wdev: WMI device pointer
+ * @channel: Channel selector (1=Red, 2=Green, 3=Blue)
+ * @brightness: brightness to set (0-100)
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int amd_halo_wmi_set_channel(struct wmi_device *wdev, u32 channel,
+				    u32 brightness)
+{
+	if (channel < AMD_HALO_CHANNEL_RED ||
+	    channel > AMD_HALO_CHANNEL_BLUE ||
+	    brightness > AMD_HALO_MAX_HW_BRIGHTNESS)
+		return -EINVAL;
+
+	return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_SET_LIGHTBAR,
+				   channel, brightness);
+}
+
+/**
+ * amd_halo_brightness_set - Set LED brightness and color
+ * @cdev: LED class device
+ * @brightness: Brightness value
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int amd_halo_brightness_set(struct led_classdev *cdev,
+				   enum led_brightness brightness)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
+	struct amd_halo_led_data *data = container_of(mc_cdev,
+						       struct amd_halo_led_data,
+						       led_mc);
+	u32 red_hw, green_hw, blue_hw;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	led_mc_calc_color_components(mc_cdev, brightness);
+
+	if (brightness == 0)
+		return amd_halo_wmi_turn_off(data->wdev);
+
+	red_hw = mc_cdev->subled_info[0].brightness;
+	green_hw = mc_cdev->subled_info[1].brightness;
+	blue_hw = mc_cdev->subled_info[2].brightness;
+
+	ret = amd_halo_wmi_turn_on(data->wdev);
+	if (ret)
+		goto out;
+
+	ret = amd_halo_wmi_set_channel(data->wdev, AMD_HALO_CHANNEL_RED,
+				       red_hw);
+	if (ret)
+		goto out;
+
+	ret = amd_halo_wmi_set_channel(data->wdev, AMD_HALO_CHANNEL_GREEN,
+				       green_hw);
+	if (ret)
+		goto out;
+
+	ret = amd_halo_wmi_set_channel(data->wdev, AMD_HALO_CHANNEL_BLUE,
+				       blue_hw);
+	if (ret)
+		goto out;
+
+	return 0;
+
+out:
+	/*
+	 * Consider the light bar non-functional if TURN_ON or SET_LIGHTBAR failed.
+	 * Attempt to turn the LED off completely as clean-up.
+	 */
+	if (amd_halo_wmi_turn_off(data->wdev))
+		dev_warn_ratelimited(&data->wdev->dev, "Failed to turn LED off on cleanup\n");
+
+	return ret;
+}
+
+/**
+ * amd_halo_probe - Driver probe function
+ * @wdev: WMI device
+ * @context: Context data (unused)
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int amd_halo_probe(struct wmi_device *wdev, const void *context)
+{
+	struct led_init_data led_init_data = {
+		.devicename = "amd_halo",
+		.default_label = "multicolor:" LED_FUNCTION_STATUS,
+		.devname_mandatory = true
+	};
+	struct amd_halo_led_data *data;
+	int ret;
+
+	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(&wdev->dev, &data->lock);
+	if (ret)
+		return ret;
+
+	data->wdev = wdev;
+	dev_set_drvdata(&wdev->dev, data);
+
+	data->subled_info[0].color_index = LED_COLOR_ID_RED;
+	data->subled_info[1].color_index = LED_COLOR_ID_GREEN;
+	data->subled_info[2].color_index = LED_COLOR_ID_BLUE;
+	data->subled_info[0].intensity = AMD_HALO_DEFAULT_RED;
+	data->subled_info[1].intensity = AMD_HALO_DEFAULT_GREEN;
+	data->subled_info[2].intensity = AMD_HALO_DEFAULT_BLUE;
+
+	data->led_mc.led_cdev.brightness = AMD_HALO_MAX_HW_BRIGHTNESS;
+	data->led_mc.led_cdev.max_brightness = AMD_HALO_MAX_HW_BRIGHTNESS;
+	data->led_mc.led_cdev.brightness_set_blocking = amd_halo_brightness_set;
+	data->led_mc.led_cdev.flags = LED_CORE_SUSPENDRESUME | LED_RETAIN_AT_SHUTDOWN;
+	data->led_mc.num_colors = ARRAY_SIZE(data->subled_info);
+	data->led_mc.subled_info = data->subled_info;
+
+	ret = amd_halo_wmi_turn_on(wdev);
+	if (ret)
+		goto out;
+
+	ret = amd_halo_wmi_set_channel(wdev, AMD_HALO_CHANNEL_RED,
+				       AMD_HALO_DEFAULT_RED);
+	if (ret)
+		goto out;
+
+	ret = amd_halo_wmi_set_channel(wdev, AMD_HALO_CHANNEL_GREEN,
+				       AMD_HALO_DEFAULT_GREEN);
+	if (ret)
+		goto out;
+
+	ret = amd_halo_wmi_set_channel(wdev, AMD_HALO_CHANNEL_BLUE,
+				       AMD_HALO_DEFAULT_BLUE);
+	if (ret)
+		goto out;
+
+	ret = devm_led_classdev_multicolor_register_ext(&wdev->dev, &data->led_mc,
+							&led_init_data);
+	if (ret)
+		return dev_err_probe(&wdev->dev, ret,
+				     "Failed to register multicolor LED\n");
+	return 0;
+
+out:
+	/*
+	 * Attempt to turn LED off as a cleanup if either TURN_ON or SET_LIGHTBAR
+	 * fails. For probe failure due to non-WMI errors, keep the LED in the
+	 * default color.
+	 */
+	dev_warn(&data->wdev->dev, "Light bar non-functional, turning it off\n");
+
+	if (amd_halo_wmi_turn_off(data->wdev))
+		dev_warn(&data->wdev->dev, "Failed to turn LED off on cleanup\n");
+
+	return dev_err_probe(&wdev->dev, ret, "WMI call failed during probe!\n");
+}
+
+static const struct wmi_device_id amd_halo_id_table[] = {
+	{ .guid_string = AMD_HALO_GUID },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, amd_halo_id_table);
+
+static struct wmi_driver amd_halo_driver = {
+	.driver = {
+		.name = "amd_halo_led",
+	},
+	.id_table = amd_halo_id_table,
+	.probe = amd_halo_probe,
+	.no_singleton = true,
+};
+
+module_wmi_driver(amd_halo_driver);
+
+MODULE_AUTHOR("Mario Limonciello (AMD) <superm1@kernel.org>");
+MODULE_AUTHOR("Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>");
+MODULE_DESCRIPTION("AMD Halo Box RGB LED Control Driver");
+MODULE_LICENSE("GPL");

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260429-halo-leds-v2-plus-722c8083afe8

Best regards,
-- 
Yo-Jung Leo Lin (AMD) <leo.lin@amd.com>

