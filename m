Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010000.outbound.protection.outlook.com [52.101.193.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A808E3D524D;
	Thu,  9 Jul 2026 06:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783580362; cv=fail; b=LQA7KQHMwDWX+sgdO7ZMKAHB3HQ7L1ACJnaRm0sdTMe5W3lZhSSkKJkqvavyWThXx0M0V1Bh8N3uHYSeKH92NQgXJkYxBR+wINEB6bFsK641nNLnABC/GqUmHLeknw/8alRmJUH93BMQ3Du6/TJIMLU2hB+Lcwn54H235q7u7OY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783580362; c=relaxed/simple;
	bh=e/bFcRLWlCWk3kR2s2/5PzJXRq3rN3j3PaSez+vix6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=II93RF0/6u1FKn2tTLsVkFeSBPcHSyvxtK3AHm2c8eD+BRN8pOjKHrrn96uiz3Q8QZUFl6gO52KsoFa3ZCeCmM+hIc8CGqb8GyOMNE8ACyVRTDwQ6mIc3g0ZO37qjWwz2HQkYKdNWIbRYpC/ItHGXb4WrQK3/vFq8jMm77xkzPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eedhYx2c; arc=fail smtp.client-ip=52.101.193.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eedhYx2c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itmiKA+XxXwawR7v1YCMvqIGgeG7emNCEvs/z3Xw6UVHCPOuzW7fS5XlnxNd8G0IJu3Hwl/KOeHo3Jn+EJNlejOmpLA6rO/TD9+RMtzSjRrjyp9sQWClrUx/ww9+QbEm2CoUFH2xySZ7XJior2doqYeFLK4yjbxF0hGKXK3lB1124AYHMSqIfP4BAjWxDuj1NsEUQTpnYnTtPlTzOBytwpYPkzWMpGUJw+Oy7uTbLKdvkAh8vSDTZLQ6+2Ipdl2HQMiV2DaKl1iko5w8gx3JSwKnLJkgAt8WVKsO2yEEnzmuUC9/5Xf8Xslfl9VGR27FbLhP/GltzfUqa5a6SVEYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/WvB8TYtFbHpoI4Muay6nEw1yBlOLl/HHxS3dkPDEg=;
 b=omRXHJw3mkpxzqqTBJnVHVcGHvlPEQz1BpsQffqdN6sd/f9kVwCSagYbvevsSzj5wLCLyed1WhSlF9SbG1xQ8/tREUjAUk3OZX3WGH63Wv/2bXEWprbJUjSH4qPHWb/8o1qa2vfqTXGzn+b3aHTvpPamnJ6MSsdODBXWCLlDNlmOqzzO0B2TFP4mQ3sckb2cUPBdORUO1LT66UQUP9Wq1BqsEBLcmuN4Ts7w0jZCAEF4/PdGCaFxZi/F2HTg76/l4PMwXTXLABmB71o6j4yAFORweOoFud2s2ncNN9ZzApo5I0ZdI589h8+RXH7pbaliRuh0Uj647zqAdbMV6cNueg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/WvB8TYtFbHpoI4Muay6nEw1yBlOLl/HHxS3dkPDEg=;
 b=eedhYx2c720+BoGcC9AI6UWNfS49QVTJfrJxciAgqumIjs8oQYJfQdyk4zInegA8buSEwxxG6zwLlRGawWqr/rWMM9gYolkAIaoNRGz18pIB6s4eBB/HIdkMhiN01QOCN0tpP8Mx4TQidc0yLpXfOgeyML5rf3xzjLpPc9F1nbk=
Received: from MW4PR04CA0087.namprd04.prod.outlook.com (2603:10b6:303:6b::32)
 by SJ2PR12MB7964.namprd12.prod.outlook.com (2603:10b6:a03:4cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 06:59:09 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::96) by MW4PR04CA0087.outlook.office365.com
 (2603:10b6:303:6b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Thu, 9
 Jul 2026 06:59:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 06:59:09 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 01:59:03 -0500
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Thu, 9 Jul 2026 14:58:18 +0800
Subject: [PATCH v8] platform/x86/amd: Introduce Halo Box RGB LED driver
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260709-halo-leds-v2-plus-v8-1-b34c64277193@amd.com>
X-B4-Tracking: v=1; b=H4sIAIpGT2oC/23RTW7DIBAF4KtErIsFY8xAV7lH1cVgQ2zVf4LEa
 hX57sXporbkFRqJ7/E0PFnysfOJvV+eLPqlS9005sG8XVjd0njzvGvyzECAFgosb6mfeO+bxBf
 gc/9IHAFqI0xJwRuW3Rx96L5fmR+feQ5xGvi9jZ72SSgAKqULqQRaKLnk6TH7OMjrl4+j74sp3
 ra0tkv3Kf68Ci6wZf4lVEKddMmn5BQEIALmS+5KQ1PU08C2Jku59+bMb0WsbIKqjNXa09GrnQd
 55lX2TlnjHLlSExx9tfflma+yVxab2qK0JM3R670/+4tFb++jC+isUCT10eO/1/K0P2ZviBosQ
 107vdvfuq6/SfDEyy4CAAA=
To: Hans de Goede <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, "Mario Limonciello (AMD)"
	<superm1@kernel.org>, "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
CC: <linux-kernel@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Armin Wolf <W_Armin@gmx.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13178; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=e/bFcRLWlCWk3kR2s2/5PzJXRq3rN3j3PaSez+vix6U=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBqT0a0seu2uXNYz0t3tTeaR3JcPIPQg1Ush/tJz
 np373KKDXqJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCak9GtAAKCRBfF7GWSinu
 hieTEACP8Jm33/7Lh6HzwcNKF6hJS+zLfDA6dwCQIbexoZx6GTYd0mndRyu/afs60W5OCgcWn6G
 9updOhvCIygmUvdozDQUqDefEtiSnN4qf/6QKaHgXtORmUuB6ZWkkDvtkEDTQz2EIu1dgwTvDEd
 aXb2RM9NP/nQ3tmQy9vxe6InrDMT2aucVvzq2bi6ssOIxJHqodHMmAlGKxAU1GeSxeP5ZXfZ0n3
 FDs7RhgsiuJ3mAKEHIcFVKqm9IZfptRycYAqy+hqBdmSsIWrSjGtUPYVRPPlRPWu96NCPF7uscM
 a8ph044Sf04/5NHEMKe4ZsTcREW0L1V4bqPX9Yz+fWPIrRnMWnfrWhOkVpz/niQKlKro25Pyy75
 Et51/7v/IbddiaZT16RVncFLR3gUAQDeacqFUxwnZr6R+un/6abBwm0clxdmJFa3uvOyMAeMiGo
 drRLACzzNg0UAatekSAKOBqzQQ/NPhswwUNWw5QbIvlH/izAcMKVdxU80bgGQxtuIu9gWwPWiHN
 vwPOi2CiP8rGlORtllwFexYTDDe5iR9AZ9xpVUMH+inVxjtUpKsQ4Wye7o/QC0wOieirvSDROvj
 ZkviZolutwOEVdy+aQWv8FnLOd/BwqF+hmYgESlO/yxp1cPLo1T2YGTu5N9Hq2QijQ/3h9Ls2zg
 p+HfVmVEUdudNCQ==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|SJ2PR12MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: 685b5ea7-17d8-4bb6-744f-08dedd87931d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|13003099007|18002099003|56012099006|5023799004|11063799006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	yu6N6EBQGM45RtjcsvTqqWzCMwkpRk5gsELr8TxlMq85VfoLkQQpzDA9aceaRasc0ug60j+MkzQnehrgghSf0nxWx8OOWGzcJ6SHTJrer2LijUICz3cGdtbJSEXrQotJmfs4zQPFPbecoqjDvNhmrAHS3K6FIO94FwFjVQvyFAQsLV6f3HByEydj1tyQr3TXVmnDtuXZ8/r9NC+hiPYUeTR4Vu5y1CiCi5E8KrBMfEFKZNSoJTroMuxtEYDLNNH1M4ZkFhqKBpJDXJuvxUwUuQqJ4CfdcgciofNsHxouye+HD9ni5I94dM+UFums6N52GuavGCgalht7jeEodbMuKc1d0PuLjxTWKu4mPKH0jO72sHlUuuShIyUUuyNOLVhtZxc4pZxqqYfTh9ECpCNygt2UY27oPeqWwEgQnu8k0HjKAbNYNe6sM3d/KTWKR7yv7uGKaBrvgsfdC3nBBs7lj6eKZJW4LwWq1jK2Y/OmJbZpwGgTvZcDKuJrzdgWc2p/mx7k7tcmlkPQpf+uemrWE2HeAx88YIRbJgmueooo9wAa8sWyLuPPV3c+bQAtE3b9PNfzt13eVrNmN+UsmzDoRg3cfQfOcbI0seCWucueVYh385/QhdqCZHeJz/mb/bySQhOQp756j01KY1L1u5xsGJclgFl5tbpFwA8phVkek4M7vVUnC3ZR6ii6vUTHVUKYp8QPMNZsEuuvRmLoY54zpg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(13003099007)(18002099003)(56012099006)(5023799004)(11063799006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m3cvqI045xeC2TbEEBeHWdYAf6RQONezJgJVey+UKamyia36RqiUnvJ/rpLKwVLazLpezYuGA4RLIymbJbTo9Q5ydXkIMc8uhc7R8poj0zk81rfcU9jQXJ9oins32DJR4wUW7klAGoKpnCfVMZQ5UCIAl/HcKkXcIOeEx739xk/6rS0+TUC5ZnpB/mGXupNq+PvP95n9cCcoJyVlG4zYM2RJOmID9pVG4boCDznxRM2FBByMzUMiJeBqV7CJyYiBfE/HTMsqVvZTg/751S3rvHxMGEen+roZcfVTVF4hBqG0fHCpYKnV/evH75VBRKo+XjiQb3oOzz8q86KxQfPTuqcS2uGMuTqqM6Jb1nGRjp/KUQnW0uZnF4Cf2gdbLAslchqbi3QS6antRjY3HgCxHVbs7mDcTgAWQ4b5PeDYd/16y0QOonCWfksIf7xDaxWW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 06:59:09.0392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 685b5ea7-17d8-4bb6-744f-08dedd87931d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7964

The Halo Box features an RGB LED light bar that can be controlled
through WMI methods to display any color combination.

The driver exposes the LED through the LED multicolor subsystem,
allowing userspace to control RGB values via sysfs:
  /sys/class/leds/amd_halo:multicolor:status/multi_intensity
  /sys/class/leds/amd_halo:multicolor:status/brightness

Hardware interface:
- Three separate RGB channels (Red, Green, Blue)
- All 3 channels are configured at once with a single WMI method call
- Value range: 0-100 (matching hardware range directly)

Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
To: Hans de Goede <hansg@kernel.org>
To: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
To: Mario Limonciello (AMD) <superm1@kernel.org>
To: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
Cc: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org

v7 -> v8
- Move local variables to the beginnign of function. (Ilpo)
- Add trailing commas to enum declaratiion. (Ilpo)
- Fix more white spaces
- Remove redundant comments
- Link to v7: https://lore.kernel.org/r/20260611-halo-leds-v2-plus-v7-1-8aad73fccb6b@amd.com

v6 -> v7
- Introduce a amd_halo_wmi_get_rgb() to get WMI values of colors, and
  read them on probe.
- Remove hard-coded RGB values.
- Link to v6: https://lore.kernel.org/r/20260529-halo-leds-v2-plus-v6-1-b7bf7b904a16@amd.com

v5 -> v6
- Add missing includes and sort/group them accordingly
- In __amd_halo_wmi_call, remove some unnecessary intermedaite variable assignments
- In __amd_halo_wmi_call, move declaration of pointer managed by scope-based cleanup
  helpers closer to where it is used
- Add trailing comma to designated initializers
- Link to v5: https://lore.kernel.org/r/20260523-halo-leds-v2-plus-v5-1-497dc9719a18@amd.com
---
 MAINTAINERS                             |   7 +
 drivers/platform/x86/amd/Kconfig        |  11 ++
 drivers/platform/x86/amd/Makefile       |   1 +
 drivers/platform/x86/amd/amd_halo_led.c | 315 ++++++++++++++++++++++++++++++++
 4 files changed, 334 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a99..3b774bc8889c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1138,6 +1138,13 @@ F:	drivers/char/hw_random/geode-rng.c
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
index b813f92653686..a1a74ef6c8593 100644
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
index f6ff0c837f345..2f467dbbfc8a3 100644
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
index 0000000000000..b21d956c7d96c
--- /dev/null
+++ b/drivers/platform/x86/amd/amd_halo_led.c
@@ -0,0 +1,315 @@
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
+#include <linux/array_size.h>
+#include <linux/cleanup.h>
+#include <linux/compiler_attributes.h>
+#include <linux/container_of.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/device/devres.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+
+#include <linux/byteorder/generic.h>
+
+#define AMD_HALO_GUID "081E747B-E028-4232-AF24-EAAEAB2B1E86"
+
+/* WMI method IDs from MOF */
+enum {
+	AMD_HALO_WMI_TURN_OFF	= 0x04,
+	AMD_HALO_WMI_RGB	= 0x07,
+};
+
+/* Arg0 of the AMD_HALO_WMI_RGB Method */
+enum {
+	AMD_HALO_RGB_CMD_GET	= 0x0,
+	AMD_HALO_RGB_CMD_SET	= 0x1,
+};
+
+/* Status codes from spec */
+#define AMD_HALO_STATUS_SUCCESS		0x0000
+#define AMD_HALO_STATUS_INVALID_PARAM	0xFFFD
+
+/* Brightness uses 0-100 range */
+#define AMD_HALO_MAX_HW_BRIGHTNESS	100
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
+	struct mutex lock;
+};
+
+struct amd_halo_wmi_args {
+	__le32 arg0;
+	__le32 arg1;
+};
+
+struct amd_halo_wmi_args_rgb {
+	__le32 cmd;
+	__le32 red;
+	__le32 green;
+	__le32 blue;
+};
+
+struct amd_halo_wmi_output_rgb {
+	__le16 status;
+	u8 red;
+	u8 green;
+	u8 blue;
+} __packed;
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
+			       u32 method_id, void *data, size_t length)
+{
+	struct wmi_buffer input = {
+		.length = length,
+		.data = data,
+	};
+	struct wmi_buffer output = { };
+	int ret;
+
+	/* Return buffer per spec: Bytes[0:1] = Status (little-endian) */
+	ret = wmidev_invoke_method(wdev, 0, method_id,
+				   &input, &output, sizeof(__le16));
+	if (ret)
+		return ret;
+
+	__le16 *result_status __free(kfree) = output.data;
+
+	return wmi_status_to_err(le16_to_cpu(*result_status));
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
+	struct amd_halo_wmi_args args = { };
+
+	return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_TURN_OFF, &args, sizeof(args));
+}
+
+/**
+ * amd_halo_wmi_set_rgb - Set all RGB channels atomically
+ * @wdev: WMI device pointer
+ * @r: brightness for red channel (0 - 100)
+ * @g: brightness for green channel (0 - 100)
+ * @b: brightness for blue channel (0 - 100)
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int amd_halo_wmi_set_rgb(struct wmi_device *wdev, u32 r, u32 g, u32 b)
+{
+	struct amd_halo_wmi_args_rgb args = {
+		.cmd = cpu_to_le32(AMD_HALO_RGB_CMD_SET),
+		.red = cpu_to_le32(r),
+		.green = cpu_to_le32(g),
+		.blue = cpu_to_le32(b),
+	};
+
+	if (r > AMD_HALO_MAX_HW_BRIGHTNESS ||
+	    g > AMD_HALO_MAX_HW_BRIGHTNESS ||
+	    b > AMD_HALO_MAX_HW_BRIGHTNESS) {
+		return -EINVAL;
+	}
+
+	return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_RGB, &args, sizeof(args));
+}
+
+/**
+ * amd_halo_wmi_get_rgb - Get RGB values
+ * @wdev: WMI device pointer
+ * @r: output buffer for red value
+ * @g: output buffer for green value
+ * @b: output buffer for blue value
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int amd_halo_wmi_get_rgb(struct wmi_device *wdev, u8 *r, u8 *g, u8 *b)
+{
+	struct amd_halo_wmi_args_rgb args = {
+		.cmd = cpu_to_le32(AMD_HALO_RGB_CMD_GET),
+	};
+	struct wmi_buffer input = {
+		.length = sizeof(args),
+		.data = &args,
+	};
+	struct wmi_buffer output = { };
+	int ret;
+
+	ret = wmidev_invoke_method(wdev, 0, AMD_HALO_WMI_RGB,
+				   &input, &output, sizeof(struct amd_halo_wmi_output_rgb));
+	if (ret)
+		return ret;
+
+	struct amd_halo_wmi_output_rgb *data __free(kfree) = output.data;
+
+	ret = wmi_status_to_err(le16_to_cpu(data->status));
+	if (ret)
+		return ret;
+
+	if (data->red > AMD_HALO_MAX_HW_BRIGHTNESS ||
+	    data->green > AMD_HALO_MAX_HW_BRIGHTNESS ||
+	    data->blue > AMD_HALO_MAX_HW_BRIGHTNESS) {
+		return -EPROTO;
+	}
+
+	*r = data->red;
+	*g = data->green;
+	*b = data->blue;
+
+	return 0;
+}
+
+/**
+ * amd_halo_brightness_set - Set LED brightness
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
+						      struct amd_halo_led_data,
+						      led_mc);
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
+	ret = amd_halo_wmi_set_rgb(data->wdev, red_hw, green_hw, blue_hw);
+	if (ret)
+		goto out;
+
+	return 0;
+
+out:
+	/*
+	 * Consider the light bar non-functional if AMD_HALO_WMI_RGB failed.
+	 * Attempt to turn the LED off completely as clean-up.
+	 */
+	if (amd_halo_wmi_turn_off(data->wdev))
+		dev_warn_ratelimited(&data->wdev->dev, "Failed to turn LED off on cleanup\n");
+
+	return ret;
+}
+
+static int amd_halo_probe(struct wmi_device *wdev, const void *context)
+{
+	struct led_init_data led_init_data = {
+		.devicename = "amd_halo",
+		.default_label = "multicolor:" LED_FUNCTION_STATUS,
+		.devname_mandatory = true,
+	};
+	struct amd_halo_led_data *data;
+	u8 r, g, b;
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
+
+	data->led_mc.led_cdev.brightness = AMD_HALO_MAX_HW_BRIGHTNESS;
+	data->led_mc.led_cdev.max_brightness = AMD_HALO_MAX_HW_BRIGHTNESS;
+	data->led_mc.led_cdev.brightness_set_blocking = amd_halo_brightness_set;
+	data->led_mc.led_cdev.flags = LED_CORE_SUSPENDRESUME | LED_RETAIN_AT_SHUTDOWN;
+	data->led_mc.num_colors = ARRAY_SIZE(data->subled_info);
+	data->led_mc.subled_info = data->subled_info;
+
+	ret = amd_halo_wmi_get_rgb(wdev, &r, &g, &b);
+	if (ret)
+		return ret;
+
+	data->subled_info[0].intensity = r;
+	data->subled_info[1].intensity = g;
+	data->subled_info[2].intensity = b;
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
+MODULE_AUTHOR("Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>");
+MODULE_DESCRIPTION("AMD Halo Box RGB LED Control Driver");
+MODULE_LICENSE("GPL");

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260429-halo-leds-v2-plus-722c8083afe8

Best regards,
-- 
Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>

