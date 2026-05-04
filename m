Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011067.outbound.protection.outlook.com [52.101.52.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65BD3D9DBB;
	Mon,  4 May 2026 14:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777904516; cv=fail; b=Hs97mS5vhQ2b+y2tzukTEXED3Dl9WnA+Fsp35IwjQ927XQExB+hxROOJ27agKtjnnnOfz0d11YRgxsVTNQkDwJ7rhG9MlAQDXU4FiksY1dk5Dl3QNjIRvtn/qpzvh81GrduKcC/+sS8RyVJWtDnxLaV2DgCnKP72sGTt0nZb7XY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777904516; c=relaxed/simple;
	bh=Ls5iNVkuwnTW1g0IXXJ/Z7612usCzA5UbipKxu86CqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=h5bA8slwlkkisHLuOJX9JYVX8pQlWIeAlDwJkPQWb+68oxI12SNwfqehH+zVQD9fCbzoiZTHuZumruR5H3YfDDvm10W0VMjMdCg0gGgW1Rr2V3/0T/84C8SDJDGjnvuwrj6a3idQ7Dfv7pVTCjd5mxTkirWOqKUl+NHsJa4/+9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GxpnPEWp; arc=fail smtp.client-ip=52.101.52.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GxpnPEWp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFlEzeHUPeiTNAwJSRjnC0bK/Gs1tfa/LomOj2WzEOfqbv/+HJy3fowOljCh68M1+asA2fA7szxt2LIN3B0hUBXyLeMeXtp+kh+ahPOHlDLo1Wc2OTbSU+XV23qwkr3ESiw2+wf0lFjFc8hL4PPxqIS90auWcmjoLoY1vaQa4X9UASUHAMfNDm5F28pO4SubBquBD5myb54AaO83m2j0MDZ/2p2ffnNnjhE0z1w9Ow6Zclc2cz2s4UXISmTGXy9ogzYVD6fICylC1Z3X+lxktIC6yFgKJUILpzPt91YyHrTUX6dw6Pzxcc+bRI5pEhoVDDaSH/oOhbyG4zTWXE+XVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LUePUs93QteCMaRjc8H9i5aLF8mGR8HfwMzILa/rOQ=;
 b=kFVhMWpjimUKGA1UKFUdTgkDNe2EgvRc7ANUAdkm0BTa6Y1P9RX74k3EnfF61U/M4meSzl5ef7rvI1L9zetnEobSBdMRfdI+9i2+4S5WxfN0sDIIGF1I4C49OQh8B450Ndg5k+vMZMYal6IrcfOMk5s1B0n+bMbRvAH8XUFlSlyvDTiLyp2TJ8alPrMpcJdkIQusDIle4sN54+AuKfsFqmRK37i/hOS6hC9CuMeYXXyTTLZ4HRTqv7XHFh2sG2yr6wxC6GWQ9M2HpB21fzO0inGE2wusjwr+hD/nAm4LZqcDDqEvqBnR/dtEhl+KWxh99gI+tO+BKY+GyNIO7k/+Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LUePUs93QteCMaRjc8H9i5aLF8mGR8HfwMzILa/rOQ=;
 b=GxpnPEWpHoa6MARcOL9/C8fHbvPs/yL4xbdXTapeMtshQ1XVrprmM/WIV3d02u93l55MWA0eFzMbQWcsSgrwJr3iHFqOMVZ7a4PhcsK7EkEDgjJFiVqomZMC5zfMiAmghiWVnmbob+0KjVjAcHEjy5FErkKyjunvmYMiMXMcMpU=
Received: from SJ0PR05CA0173.namprd05.prod.outlook.com (2603:10b6:a03:339::28)
 by CY1PR12MB9602.namprd12.prod.outlook.com (2603:10b6:930:107::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 14:21:45 +0000
Received: from MWH0EPF000C6186.namprd02.prod.outlook.com
 (2603:10b6:a03:339:cafe::28) by SJ0PR05CA0173.outlook.office365.com
 (2603:10b6:a03:339::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.14 via Frontend Transport; Mon,
 4 May 2026 14:21:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6186.mail.protection.outlook.com (10.167.249.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 14:21:44 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 4 May
 2026 09:21:40 -0500
From: "Yo-Jung Leo Lin (AMD)" <leo.lin@amd.com>
Date: Mon, 4 May 2026 22:21:09 +0800
Subject: [PATCH v2] platform/x86/amd: Introduce Halo Box RGB LED driver
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260504-halo-leds-v2-plus-v2-1-af027727605b@amd.com>
X-B4-Tracking: v=1; b=H4sIAFSr+GkC/03MTQ6CMBBA4auQWTukDMiPK+9hXDQwpY2FNlMhJ
 oS727hy+S3eOyCxOE5wKw4Q3l1yYc2gSwGj1evM6KZsIEWtamhAq31Az1PCnTD6LWFHNPaqr7X
 hHnIXhY37/J6PZ7aRsODbCuv/U6eIrk1bVo3qBqqxwrRFlqW6v1hW9mWQGc7zC0j489ShAAAA
To: Hans de Goede <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, "Mario Limonciello (AMD)"
	<superm1@kernel.org>, "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
CC: <linux-kernel@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10639; i=leo.lin@amd.com;
 h=from:subject:message-id; bh=Ls5iNVkuwnTW1g0IXXJ/Z7612usCzA5UbipKxu86CqI=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBp+Kt0mDHOS+WQhjjynunQoVXI9J58+EmuZzhRa
 CkP1ff4PJKJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCafirdAAKCRBfF7GWSinu
 htOnEACwcxm71C90bgBUY6KbLe4dDat7wc0R6MpUoKFoFGIs/HBbzKHddaJTjgi+u1rqa7hx3QT
 IfitnuwqJnrfv0jag9YWJSTwrEQ802QB/Md01Mz1SBZHMSvilpxVlJsXXhMM9GhZprTODMEh2MX
 ytD/PLdXePMi0NpBvO2S/hPnJN7WiKBLcFZTcXvJFBQLTiaE6f055QvHwp1keTuzbq6m5XikH9E
 iqoaElOLWm/H5MA8f09s4ovt7t7NFTlTpifYcl70JbnG5eNewM0W9LHRUP/eB5/OWyUNKhoLxw7
 5xbucHB8Rseo0Xjvw4hRG6TOQr3OwW+F9eoLd/tTs+99CL4NqiBpA1ngvejmUJZnVJ7kp1goeA0
 Zx8aHmlK5qNPgteuiMgh7ldOgPYSHLE0h4bEf9vavFq6N6pYBi/SJLNeB4ljFT15hbZQvKqsaJp
 z8ujjn7cAk4zd6WABwyTDx9MgaYqghgkEn6+EpmrMbci8CRi9nIkSAaSAyoi6rogVmFK80cg5SS
 BMnESKNgTD1Ot/sWAhDHsMUXCzyK/oST6NkCo8wcfBfMEku5MQITEleNN9SODdYedZoSK8B4YYj
 ZrbZd5nW0ZtWbf+gZ6parzMqGYOOiKbCGIQLWDh/6caP/eqE6fnr/wCF1sBKbn2DcLsP7VTTh5U
 wGnZqWKpq81DONg==
X-Developer-Key: i=leo.lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6186:EE_|CY1PR12MB9602:EE_
X-MS-Office365-Filtering-Correlation-Id: c2f1fbd2-3048-4763-fbe7-08dea9e8782e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Bbc3GkxEW82VURAee1UX7KBPLEDIlbxec2JSj9YF6DPXt8iEqjemXFkw+3lCEXYtXxUi84avxg8oHdxhWpUVKvu1HHsW5ny7ixkOj6Fus7C3Up+VrrXX+AbzejlsDWB4NOimF3B9HGH67ye1brNDyC7GjewG+wWvg10pSoYYOAOVwgSohtV7q92oMBiykbP9oNuOMISY4wGlCtcmkLWTczIfvjrOIn3zrslj2ZWZIs1pYJoyF/Yn3SuCLFYqRnzGR6ccS+Q5ksWTbNmA5DVJGriri4W+pEBQuxbI8A2AaXEd5hO3Ln4RkwsPtitLlGkFFT9eeMQj21vq1YJTk2/TL1prx0LM/GhXXqUA9XgA1ariQVqdFMxmX5QEDK4893aYYJbjrpz7oEsQ1ynrnSyuwdGui6xuloL7GrDBfxSy8rXpFOAPJq7MwEqTOnZHT5dzAjAr8Sigue4i/r88/s9/6jbhWLgFdSnC4dJr76dR2SWwBKu2urjSYEgoNafb+39/c317Z1jMsrgnitN7pf+014VXZS8/S9EJ7+/+EUfwLTSTtKsYcrtqf201o8aokMfJeE+b6cRIZwD2OLvLtHN04hVkpBbZqAoaoiO4lUFiHO1ifmfyG17Busi8v/jwkmHwPLPfifkPSfxny+VF2bMPyn2cvQ4YmHy5Qba0iSw8cp0XNGqdq/1YXVln5AQD8u/+odYA6DDOlCVjZkGqJB1CATf+HtzqiDQg3os3KntVOzc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3nrLuXng5Nb4JfBRH0C4qS4dHZEOpeAQr2Isusd/bjMoWiA6C49LHyc7OuEGbRsaEd+dKtLIsnPjALJiOKCdtl/XjYtYP/roi91b1JWjA43soRhcOH5b8WhEpxRo5buh1GHF9FXA8HIDUkCpmt6mMKg5YFT4kNv5xtHetMAKsqV7fuMukWCT/qu2ILfo91fdL9WuOxeAlpYXn/XHOCNsnYTy0mVgcioNFp3R75lGVlIvZ6jB9WlvdR2pJbN88h/zpIz53l5qkkwLmFLpKqceuKfLumrAZ2S7GxEc1+h4aDHoQ7TCy6m3xq/ctYQEC9o/ITAzrPnNGTJ5oOT4/0jWvurMA9CGNRty/Bl8qgPqbw4H3hEK5zm8PUJeihWbfiFO+b1Cr6MO/KNf/zcRIDRn8QStKKswN523SJjhRHTn1JMeqphTXegFFbQTnfJngRGf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 14:21:44.5702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f1fbd2-3048-4763-fbe7-08dea9e8782e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9602

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
 drivers/platform/x86/amd/amd_halo_led.c | 222 ++++++++++++++++++++++++++++++++
 4 files changed, 241 insertions(+)

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
index 000000000000..12188571c7d9
--- /dev/null
+++ b/drivers/platform/x86/amd/amd_halo_led.c
@@ -0,0 +1,222 @@
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
+#include <linux/acpi.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/unaligned.h>
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
+	struct amd_halo_wmi_args args = {
+		.arg0 = channel,
+		.arg1 = brightness,
+	};
+	struct wmi_buffer input = {
+		.length = sizeof(args),
+		.data = &args,
+	};
+	struct wmi_buffer output = { 0 };
+	u16 result_status;
+	int ret;
+
+	/* Validate input per spec */
+	if (channel < AMD_HALO_CHANNEL_RED ||
+	    channel > AMD_HALO_CHANNEL_BLUE ||
+	    brightness > AMD_HALO_MAX_HW_BRIGHTNESS)
+		return -EINVAL;
+
+	ret = wmidev_invoke_method(wdev, 0, AMD_HALO_WMI_SET_LIGHTBAR,
+					&input, &output, sizeof(result_status));
+	if (ret)
+		return ret;
+
+	/* Return buffer per spec: Bytes[0:1] = Status (little-endian) */
+	result_status = get_unaligned_le16(output.data);
+	ret = (result_status == AMD_HALO_STATUS_SUCCESS) ? 0 : -EIO;
+
+	kfree(output.data);
+	return ret;
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
+	red_hw = mc_cdev->subled_info[0].brightness;
+	green_hw = mc_cdev->subled_info[1].brightness;
+	blue_hw = mc_cdev->subled_info[2].brightness;
+
+	/* Set each channel individually - 3 WMI calls required */
+	ret = amd_halo_wmi_set_channel(data->wdev, AMD_HALO_CHANNEL_RED,
+				       red_hw);
+	if (ret)
+		return ret;
+
+	ret = amd_halo_wmi_set_channel(data->wdev, AMD_HALO_CHANNEL_GREEN,
+				       green_hw);
+	if (ret)
+		return ret;
+
+	return amd_halo_wmi_set_channel(data->wdev, AMD_HALO_CHANNEL_BLUE,
+					blue_hw);
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
+	data->wdev = wdev;
+	mutex_init(&data->lock);
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
+	ret = amd_halo_brightness_set(&data->led_mc.led_cdev,
+				      AMD_HALO_MAX_HW_BRIGHTNESS);
+	if (ret)
+		return dev_err_probe(&wdev->dev, ret,
+				     "Failed to set default LED colors\n");
+
+	ret = devm_led_classdev_multicolor_register_ext(&wdev->dev, &data->led_mc,
+							&led_init_data);
+	if (ret)
+		return dev_err_probe(&wdev->dev, ret,
+				     "Failed to register multicolor LED\n");
+	return 0;
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
+MODULE_AUTHOR("Leo Lin <Leo.Lin@amd.com>");
+MODULE_DESCRIPTION("AMD Halo Box RGB LED Control Driver");
+MODULE_LICENSE("GPL");

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260429-halo-leds-v2-plus-722c8083afe8

Best regards,
-- 
Yo-Jung Leo Lin (AMD) <leo.lin@amd.com>

