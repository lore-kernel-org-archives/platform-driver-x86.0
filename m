Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011021.outbound.protection.outlook.com [40.93.194.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E38407CC2
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 18:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779303370; cv=fail; b=WFCnh5frTTrT+EAF6hCneba5LGike8DX3kN8Var5SieFjABUnKdzXdCp2YKRYdzztWS9gtNhlWzpbAr7jS1SUnlRoO47LTtq07VJR+7nSTgIl42Bqbew75fu/92juDgI/Oa9wcNY7f/8A6MDtr6p0zY/lVM9njcZt4OsgnqUpLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779303370; c=relaxed/simple;
	bh=i/my4avRcz+MldgVYWha+MfztDfRmpHqtcWo4CZMgGQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gPCPPziBPlxyuZivFI0g92K0RH+93aiSGEv4tkSJp+x2t274/QI1TKNYIsDykXaZQeHRqg4B53YIyalpocrTX8wRENM3umElNtavHIq6hoOAjpUZX5lmN09pz88kUOsjr5KFElAhZXQURwoxXX4rDnUV3K4sSkje2h70tqC7ePc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=i3ErJjWa; arc=fail smtp.client-ip=40.93.194.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="i3ErJjWa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUSqX9+dcDw1tjvjhU+AnRkJnum+L6IQbuubUINn0UdFGiIOi3X0A7esE5YLgcpBSCGuh7+fMRGj9D1XFpgpoI17w1RFo44wSCf4clDdsHU4GrfmJacGmdgOrCmehuwlihne9keXD1NWJwuhAR+uB+9dwlarODVc2Al7lprCTbmtRro74zIsLpkDlC8ybhS7Mml2f7E5ENeSnx3Q+jePd11Xfe1jIiqDeaVgJPsPiPdsGW3jV9Y/xgnp5/b6fWik0aDXF/KtnM2kqn0Zr+2C5Cqsw1xdT2KMLtfpQ93LwTruLaaaMQ81cqw/frVVoPpLdEGLC6rW1pQZ5Ca8m6oS4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmOdSxYk93LzkzUai48cQYv0iSh9pet08pIcEDtnBsY=;
 b=I7k5183uafzt+Rm1QxuV85bW0Lppogb8UQqQ+5HRXttGUpc7iS8sTF9Y5rXj+Dkec20AMCZig4JAujEcIecD4j4ylHnx6lEAocuX0/KjSi5JEwt75h37jdTyyGPcsKZX7TNkYPc/nQIAzPwnqOzRUDzud2XIUxwuG9tQOjzBmify0VSqJWY+QPr41PZtGnnutx0A0iVK3DHRpBKGbpyQgpasodVKzyGVqUjOLBkkzo1Vyzl20F1p85B9J3IxDGohx9h9zmHAKfu1kE5it9u6/2+UMCBS2Fs9AizZ7ZbcWBTfLqVfVGJckLWzKIb0m9WRnTuXy3PClYDPo1xms6ZClA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmOdSxYk93LzkzUai48cQYv0iSh9pet08pIcEDtnBsY=;
 b=i3ErJjWaBfqOWYHsFVnEJIH7Ovf7lgOVkhy7h0+J4r/08pr1xONrkVjRPCd9d0y40v49vbPbEfGVv7Zkh0ZLK/xhLKjbvI+ZJmcG+Q2vU/QWMjV9qfHkRRUcMhjV5KbwRStZkkbpBs7Ih9AAVRjdszkcMcWb2yvtBb31Oyz18qM=
Received: from DS7PR03CA0261.namprd03.prod.outlook.com (2603:10b6:5:3b3::26)
 by IA1PR12MB7518.namprd12.prod.outlook.com (2603:10b6:208:419::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 18:56:00 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:5:3b3:cafe::85) by DS7PR03CA0261.outlook.office365.com
 (2603:10b6:5:3b3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Wed, 20
 May 2026 18:56:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 18:56:00 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 13:55:58 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 7/8] platform/x86/amd/pmf: Introduce AMD PMF testing tool for driver metrics and features
Date: Thu, 21 May 2026 00:24:23 +0530
Message-ID: <20260520185424.770772-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com>
References: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|IA1PR12MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a05b43-281e-4783-554e-08deb6a16f61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|56012099003|18002099003|22082099003|3023799007|11063799006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info:
	5FhvwYrPO/dYNZ8Y7WUa3kmQsCGvAliMCjhhTEHAbSlZJ8PTjVZE7q/aEe4Hl+eKAXiVxhuuv8+WutE4uiwkoZBqjQ6l7YG8P+H5EiGEbd/HtfPciUhGBEE5h+jUaMSR5CIps4ACpWVnPFGrQMiGWQI3rRe8UuPhr7vUcgTL4xWxGNWzySpR4k9SqQNLC+72LiGs0kMyRHe9gpxw0FOU6tsTSVgWIWEP4mtWNFC/GRI0mfw8pA1VoR913VoUh62EoBVa/O1fpxh9tCTVox1TgEXqSgUT7l0yhBMYjV+zPrj7mqFHcF6CtWveszgJCHxRkdUhmrYH9LDO4i1dnHMBHkghkV/0TsW3aXkUr/yB4CGCbWj8UpnJ2+Gfy3A1/Rq0rr5jkXxDEeNwYGP5xbx5obrEJQhDnzAYxvolqpYMnk1BlFhXlxBWWh8fKFCigy4v/v4rlwYahyt3HrGTmP8BSwMGOVTvVPMccBUvRb6WCx1jyXw6tCXj4V1m7tsIKyY6B8+tpwF4zq0SxFDPRYNHWBEq7wz8IyB8hI9aE6hcEJI6udUi+IEz5o/gVAHPKMoMiWjEM3BjE1iQekBTc80Atmh1MvD/JEx0OGERPB38AhWja7RDC+JtypAIQi+XBRY6IvVpTr3Af1o8FsWdiH2XY+8SEECtrcpvxgCTcscbRx0/mW9NSh+P30mOOGqUEZSmGUrYXcKiiTq8UE+imkU04lDLMqgKwVBPsHdyfFjEz64=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(56012099003)(18002099003)(22082099003)(3023799007)(11063799006)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VsPBFRLurRbe0WRaNwq82ILyI3cWydAiBp6iiSxGRlT00/HzwQC08n3iCSSvHYZi/6mW3bHHw9SD8CtdZ2DTTQZ5J9jEkcm29CJMm/GsGbTilTsvEbgLgeIoWlO7CHs5OEm6Rv0SNJ+s3BJVy79WPgQgK64zVi5p16ulRlF09rsBomYlNhYFQDTq5AVB4g1uStpU8jPjyhZsDZxcex6ZI0VWpwJeWY0Z9sx3B1l3HCSJed4yuzDRwcQJ843sQG3vtou93AM78gn8wKPJHb/OCvUuXwoVIcpKqurPiJXIhCDNP2FrfupJpvhNwWyoyXOqT2qNawYnJRZiEWXLre0sfGDx7WLvXZ/1Z598Sf+xpjCmaC4+1KaptatKQQG85aWCi1h8EC9mHgMx8kYbHDRMGkhYhJH7mIvRzKS+e/TcAMuWbICrNpgf+jXWWxVuo1CB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 18:56:00.6956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a05b43-281e-4783-554e-08deb6a16f61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7518

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
index 000000000000..313e952189dc
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
+	printf("  Platform Type:     %s\n", amd_pmf_get_pt(info->platform_type));
+	printf("  Laptop Placement:  %s\n", amd_pmf_get_lp(info->laptop_placement));
+	printf("  Lid State:         %s\n", info->lid_state ? "Closed" : "Open");
+	printf("  User Presence:     %s\n", info->user_presence ? "Present" : "Away");
+	printf("  Slider Position:   %s\n", amd_pmf_get_sp(info->slider_position));
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

