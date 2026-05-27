Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011068.outbound.protection.outlook.com [40.93.194.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4451E279DCC
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 14:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890566; cv=fail; b=I9JFACoEgakzbRGXR2n5kKjuF3CKC3wfXcQ8EeE2wIcSmh0TZGgqzVWaM3JjHiEjUpBsczCCI4Dui+h0bxiKLpndhyksYHNKsMrdbMEIQYqFSleEQA/GehUBuGPHuixTbANXh+BclWGu6NS7uGGaAHngZ6Qz+MxPGzAtbuvLyf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890566; c=relaxed/simple;
	bh=XuPxuxyEOLcG0K0hMG02r+T1MtVAhNCKyB79TIB392g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nCnurcYa+pQviy7WhuAHUK+xhFA9RONbYE95JAvGDGGOS+oPbuqC82jdeiYLf/Ejxq5TVIwxod0ZnIc27N7Wcyy0fRgodEop18LJGDZdRslLWzppoCHaN4f8fqJltFlb+wstn0qEMNbeCKSx4vYWTiRr5lwyhneRSh3WRXwyT7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=A2fJ54tp; arc=fail smtp.client-ip=40.93.194.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="A2fJ54tp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jN560nLkaIwrnMNUCZRfx/Gn9Dpg/kOepA1Y8oI1nZQBVtxBGddCLzkMPSVMHBinXRZUb+e3tL8tH2Z1mnRt5k7LjgCaKAfi6r4nk+yde7q7W0/ZGZ2uZAjxlQLkdrv7DGEVjNXzd6+UVR+NjzjFlAICZveHUIdGlxucOfhgd610vIvHwQ1ebCugagsCPcmH++4oVWO2SZkr7wSVWQe74AUckunKJBJQJh4JDClj8YnYrF8GWojq228s2a04j2avNatPOf//2svfvRCzJ5N0+Bow6+W4WAftK+eKTCBzDVcCYWHcxozjgPh0v3r9C4iNW4UqVx1pZongLUtBM3o0hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbM1NKx23OkZnY4s4UtVAX9ZSRd2gHDjqEbxdSWeB5I=;
 b=tTfOLRKVBpAP8goMURX9QC6KD+KYbtrtxCgh7hXdRR0+thO/GFuwSxNVDf7Yw5B6+bqDsRAhLJLBDc6Xji8CmM18+iIiZGgv1QAs6N6U3qHqRDAdwlGR/EuIwtfNuUbM5ZZRx2gD2DXgXIpH+ImK2UXqlLJwZiPCR27MY7SK1Jv7XVpAkzyuCCNoFAz9XNiqjGZzr6srYrihyteMyhKumuL/hlR1xdTp9yXIZJPMd9aWn0LtGIpwl4IWOYQUE9auhGZKN1uC2hQZi/MEvAnHqTy3LYTN9M7hW/34JqBsfH/aFJF9xDRdDYUZO3sGZZpD0RejRIBJ25yeByAtO6Ggeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbM1NKx23OkZnY4s4UtVAX9ZSRd2gHDjqEbxdSWeB5I=;
 b=A2fJ54tpUS8+wUXNyTNRFeLKfDhJQJTycrPQdAFYWCK+A5wrYLq3/qqSn9RrQJj5U7CE2DDU20T99BOSvNWWOzAvlw8j3BrV81Y5NI5PeJVU1jVj5hFMWH+5OGXZq8K/wt4SCKUbl7Z/l2yd73RoKV49F2Cey7QtwJ2d7TA7gW0=
Received: from BN9PR03CA0538.namprd03.prod.outlook.com (2603:10b6:408:131::33)
 by MW4PR12MB6825.namprd12.prod.outlook.com (2603:10b6:303:20d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 14:02:40 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:408:131:cafe::4d) by BN9PR03CA0538.outlook.office365.com
 (2603:10b6:408:131::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Wed, 27
 May 2026 14:02:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 14:02:40 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 09:02:39 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 07:02:37 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 7/8] platform/x86/amd/pmf: Introduce AMD PMF testing tool for driver metrics and features
Date: Wed, 27 May 2026 19:32:04 +0530
Message-ID: <20260527140205.4073335-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527140205.4073335-1-Shyam-sundar.S-k@amd.com>
References: <20260527140205.4073335-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|MW4PR12MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc9b8ca-bbc2-4c5e-def0-08debbf89d76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|22082099003|18002099003|6133799003|56012099006|11063799006|5023799004|3023799007;
X-Microsoft-Antispam-Message-Info:
	RJusNuefthDM+cV85wKh7bjqq82dltHKlqEm8AK0+h06zd079Ptvfhcj1MmQ+dNzl9CD35yLKC5Ffwy8jaewYlCoRHUh9UKl2/NiAN5aF1At3WGlwBwu6L4wVBjnvcCa7qwAox2q1oYyMVnod7ZfhvMrsEmF0LjmESbCaDXTqIkJxkhrxt0ycBEvZR1q9lRcgcIUy83b570R/sbOMgSeZoOdyEKQur8iXdiy5XIPnBV1/mthbXqXsrZC42kOSntLoYNZrXDUqJA51IlZmYCER3gCayby4R/ZFrcUvJ6weElti7lPUHYrhFAs0DcZasCxRA0r1CfPQxy4Jb8IIryf7vSww5iyXIutE8AjyJ83HKm05xG+NeOcH68Z4TNkX4/KFZbgh+pdnfFXMwfmmSdTZsLm/h21/WoMaSgupRCcaVgf7Zz/Rn0upMweLSztAAdm5gy0v0C1m4WxAT42rfEm9vEobD0gNtzKUxFDN8nE2gLvJ2Tj2CFCTWrAJR23epFjgLGiEGgvOkx1Cw7QFCtSqq9DJx4z9FBriFCQtZbkhAx/o4IMKVGmWH5Sjx4putvDtDGt8ia3L3nUQNxbkkDYN92whEgp/FcGCz/gZhBDOBupqi5bsA+53R65SKuohEQsVobuEcfwroqHwwvxglbTUKKpH/Ec3HCJPEqaekNKuVylvceZx5fJ7Jh1u0BzDLcr9gUv0HYqwCsf95sfq86jmeSeMRxFNpXPklW/H3wNQGY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006)(5023799004)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	imPeF45jMO9dSUAxDxh1aIvqV25QwioH3AN/vE7wInUri4MAUo2r7gYl5JZT/4DfQ+Hy5nXIpOpjG+nY357rhEcdqjivQ40Ylrk3j8fFt1/teG+svJ4jHeLEJsSVz8RNMPPM7M9M44P1oTXTX++cucB0yUzANPDJXbZpE0aw1MH5yOQwpg/hHopP2AfXQWhkSTfdPorymCTBmGVuWLrxg2KRkP5DoZHccwvU2BYF7SMIU0lBfOhzoS3sNpOLvU1Dtzt8ZjMhGYNR6NLMaNy2dGoGmZrHsAnnfAUlanhynjh69fFOBAEjv7ahEAe7QOU09Qi9ypQ4DEYw/ba//F9ZWSCQoHYvx7InZnXjEOkWsFS7iTYPbSjrUnn/uaxQdulM7C6F3LteM2i8zfJ+30xWPXzYEZOROfnrTGO5MNwmPXqRVTERirdqLPXPTvTMi9Qh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:02:40.0829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc9b8ca-bbc2-4c5e-def0-08debbf89d76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6825

This tool leverages amd-pmf ioctls exposed via the util layer, allowing
validation of its newly integrated util layer and /dev/amdpmf_interface.
It includes a user-space test application, test_amd_pmf, designed to
interact with the PMF driver and retrieve relevant metrics for the
testing and analysis.

It provides definitions for test metrics, feature IDs, and device states,
and includes tests for various AMD PMF metrics such as power source, skin
temperature, battery state, and custom BIOS inputs/outputs. It also
enables the testing of PMF metrics data and feature support reporting.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 tools/platform/x86/amd/Makefile   |  60 +++++++++++++
 tools/platform/x86/amd/test-pmf.c | 142 ++++++++++++++++++++++++++++++
 2 files changed, 202 insertions(+)
 create mode 100644 tools/platform/x86/amd/Makefile
 create mode 100644 tools/platform/x86/amd/test-pmf.c

diff --git a/tools/platform/x86/amd/Makefile b/tools/platform/x86/amd/Makefile
new file mode 100644
index 000000000000..5d820df5871f
--- /dev/null
+++ b/tools/platform/x86/amd/Makefile
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0
+ifeq ($(srctree),)
+srctree := $(patsubst %/,%,$(dir $(CURDIR)))
+srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(patsubst %/,%,$(dir $(srctree)))
+endif
+
+# Include common tools build infrastructure
+include $(srctree)/tools/scripts/Makefile.include
+
+CC		= $(CROSS_COMPILE)gcc
+BUILD_OUTPUT	:= $(CURDIR)
+PREFIX		?= /usr
+DESTDIR		?=
+
+ifeq ("$(origin O)", "command line")
+	BUILD_OUTPUT := $(O)
+endif
+
+# Include paths: tools/include has linux/kernel.h with ARRAY_SIZE
+INCLUDES	= -I$(srctree)/tools/include
+INCLUDES	+= -I$(srctree)/tools/include/uapi
+INCLUDES	+= -I$(srctree)/include/uapi
+INCLUDES	+= -I$(srctree)/include
+
+override CFLAGS += -O2 -Wall -Wextra -D_GNU_SOURCE $(INCLUDES)
+override CFLAGS += -D_FILE_OFFSET_BITS=64
+override CFLAGS += -D__EXPORTED_HEADERS__
+
+TARGETS		= test_amd_pmf
+
+all: $(TARGETS)
+
+test_amd_pmf: test-pmf.c
+	$(QUIET_CC)$(CC) $(CFLAGS) $< -o $(BUILD_OUTPUT)/$@ $(LDFLAGS)
+
+.PHONY: clean
+clean:
+	$(call QUIET_CLEAN, test_amd_pmf)$(RM) $(BUILD_OUTPUT)/test_amd_pmf
+
+.PHONY: install
+install: $(TARGETS)
+	$(INSTALL) -d $(DESTDIR)$(PREFIX)/bin
+	$(INSTALL) $(BUILD_OUTPUT)/test_amd_pmf $(DESTDIR)$(PREFIX)/bin/test_amd_pmf
+
+.PHONY: help
+help:
+	@echo "AMD Platform Tools Makefile"
+	@echo ""
+	@echo "Targets:"
+	@echo "  all           - Build all tools (default)"
+	@echo "  test_amd_pmf  - Build the PMF test tool"
+	@echo "  clean         - Remove built files"
+	@echo "  install       - Install tools to $(PREFIX)/bin"
+	@echo ""
+	@echo "Variables:"
+	@echo "  O=<dir>        - Build output directory"
+	@echo "  PREFIX         - Installation prefix (default: /usr)"
+	@echo "  DESTDIR        - Destination directory for install"
diff --git a/tools/platform/x86/amd/test-pmf.c b/tools/platform/x86/amd/test-pmf.c
new file mode 100644
index 000000000000..34630534b0a4
--- /dev/null
+++ b/tools/platform/x86/amd/test-pmf.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD Platform Management Framework Test Tool
+ *
+ * Copyright (c) 2026, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *          Sanket Goswami <Sanket.Goswami@amd.com>
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <inttypes.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+
+#include <linux/amd-pmf.h>
+#include <linux/kernel.h>
+
+#define DEVICE_NODE	"/dev/amdpmf_interface"
+
+/* Feature flag names */
+static const char * const feature_names[] = {
+	"Auto Mode",
+	"Static Power Slider",
+	"Policy Builder (Smart PC)",
+	"Dynamic Power Slider AC",
+	"Dynamic Power Slider DC",
+};
+
+static const char *banner =
+	"====================================================\n"
+	"      AMD PMF Metrics info and Feature Status\n"
+	"====================================================\n\n";
+
+/* Print feature flags */
+static void pmf_print_features(uint32_t flags)
+{
+	size_t  i;
+
+	for (i = 0; i < ARRAY_SIZE(feature_names); i++)
+		printf("  [%c] %s\n", (flags & (1U << i)) ? 'x' : ' ', feature_names[i]);
+}
+
+/* Print BIOS parameters */
+static void pmf_print_bios_params(const char *type, const __u32 *params)
+{
+	int i;
+
+	for (i = 0; i < AMD_PMF_BIOS_PARAMS_MAX; i++)
+		printf("  Custom BIOS %s%d: %u\n", type, i + 1, params[i]);
+}
+
+/* Open the PMF device */
+static int pmf_open_device(void)
+{
+	int fd;
+
+	fd = open(DEVICE_NODE, O_RDONLY);
+	if (fd < 0)
+		fprintf(stderr, "Error: Cannot open %s: %s\n", DEVICE_NODE, strerror(errno));
+
+	return fd;
+}
+
+/* Query PMF info using the single IOCTL */
+static int pmf_get_info(int fd, struct amd_pmf_info *info)
+{
+	int ret;
+
+	/* Zero-initialize and set size for versioning */
+	memset(info, 0, sizeof(*info));
+	info->size = sizeof(*info);
+
+	ret = ioctl(fd, IOCTL_AMD_PMF_POPULATE_DATA, info);
+	if (ret < 0) {
+		fprintf(stderr, "Error: IOCTL_AMD_PMF_POPULATE_DATA failed: %s\n", strerror(errno));
+		return ret;
+	}
+
+	return 0;
+}
+
+static void pmf_print_info(const struct amd_pmf_info *info)
+{
+	printf("%s", banner);
+
+	/* Feature status */
+	printf("Feature Status:\n");
+	pmf_print_features(info->features_supported);
+
+	/* Device states */
+	printf("\nDevice States:\n");
+	printf("  Platform Type:     %s\n", amd_pmf_get_platform_type(info->platform_type));
+	printf("  Laptop Placement:  %s\n", amd_pmf_get_laptop_placement(info->laptop_placement));
+	printf("  Lid State:         %s\n", info->lid_state ? "Closed" : "Open");
+	printf("  User Presence:     %s\n", info->user_presence ? "Present" : "Away");
+	printf("  Slider Position:   %s\n", amd_pmf_get_slider_position(info->slider_position));
+
+	/* Thermal and power metrics */
+	printf("\nThermal/Power Metrics:\n");
+	printf("  Skin Temperature:  %d\n", info->skin_temp / 100);
+	printf("  GFX Busy:          %u\n", info->gfx_busy);
+	printf("  Ambient Light:     %d\n", info->ambient_light);
+	printf("  Avg C0 Residency:  %u\n", info->avg_c0_residency);
+	printf("  Max C0 Residency:  %u\n", info->max_c0_residency);
+	printf("  Socket Power:      %u\n", info->socket_power);
+
+	/* BIOS parameters */
+	printf("\nCustom BIOS Input Parameters:\n");
+	pmf_print_bios_params("Input", info->bios_input);
+	printf("\nCustom BIOS Output Parameters:\n");
+	pmf_print_bios_params("Output", info->bios_output);
+
+	printf("\n=================================================\n");
+}
+
+int main(void)
+{
+	struct amd_pmf_info info;
+	int fd, ret;
+
+	fd = pmf_open_device();
+	if (fd < 0)
+		return -1;
+
+	/* Query all info with single IOCTL */
+	ret = pmf_get_info(fd, &info);
+	close(fd);
+
+	if (ret < 0)
+		return -1;
+
+	pmf_print_info(&info);
+
+	return 0;
+}
-- 
2.34.1

