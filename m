Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012019.outbound.protection.outlook.com [40.107.209.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6543ED101
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 08:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992720; cv=fail; b=O8bAWZG+0td9MoDOhf9YiKqgq/3PgiBqAWcwG1qQ2a7SSsNoZl4jC2RFQganXf1c3vCv/NUcBhVPFVtFjW21h2rsdBCn8rZMUqKMiFGEJsdODEweyf5awTTwZYQogd1/gzrGDXytS3agKB23R3fx77FrgolN+VaDaqB33ejNv4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992720; c=relaxed/simple;
	bh=XuPxuxyEOLcG0K0hMG02r+T1MtVAhNCKyB79TIB392g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q42adFqYCDj7K0HMCBTc0kiKd4/UaGz1nKt+abSc3REeHKk2hbCBjCxkmIYGEx+4H0niqY5zF0Z1X4M4DWmu+lS4YbuENyoctNhsKHxEVPn7ESFxByhaR4CLaLnNgRSUN7MGRtv65goZzla61J2eIGU7v7/4cdpG8Mv9PAXcakI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1zIlydaT; arc=fail smtp.client-ip=40.107.209.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1zIlydaT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icqTcivQcEDcI+AJu8XF+ywRahVW+iRLenRz5T3g6fl+jvxMmxWrAXIIc2x8cX7ls6xPA1VslG4T1vlPPKLGzR0QV7Y/D2BAEEgaJs4jv1ZX/t6xw4423ddq0IORoxaj4tarkrGxn+WU24V7RrR4l3tIz0AAMk7C/41ZDMDdGgWqh1Bgm+FF+YSvIWSyWngUlJBH1tf7wCbedJBPInfc1O3OmEEo0gYqURIsjHo7ZYDBmfz08YhDveFtUywMCRtV0CsRs4VHHRE+vgMH7NzifBMIWdNP/lmKRjU1fMvEOAMydGKifrDN8ZRVEF0+KmmgUHy35vj8+QnhqGP0qJ+QRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbM1NKx23OkZnY4s4UtVAX9ZSRd2gHDjqEbxdSWeB5I=;
 b=Uj5NLhEJVQMLtWWmlJ+gq+0VklANNxQEBD9legOyWGY4IRkEaMdxHxjZlnK/YQMtbZ9JDH0F72YM+osd70iwtZUoxDKQBmVZdCqJIsq3CKD+TL7fo7w66VX7iITwd1d3EvH6Knobn7+Rn+QTecuSDMLvQCK0+q92dUSl6Io7O2OEIJMa/iaZsiV4l/bU4138TeeumFiJLIdhdMa7dS2ec/b/GdA41fMGoUe9OI2+RAu5FC6zUHDE+s2HtgdMGhYXrZ/kY5b1KZmLKMLR8M1HFblVR6jGC7upA109SvHbwn4k89QHwF3mOXnmOu6WyLS1BX2+H59scNigLAOOjm6XOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbM1NKx23OkZnY4s4UtVAX9ZSRd2gHDjqEbxdSWeB5I=;
 b=1zIlydaTc9SZW/735EFYFhNh/e7q/joonicomCgYKnQe0dE+zjNoIFovkXka9I+LdBz2RS5yk7lCGYVOa7J2SdjX/9Mj9fwkj6hKmJ6ju6jEuR762hTJLm6fFkB2T9pyC1xTLIXA326wJdsX3C9l/OpDvvi65Bku/o1gyH9ZOZ4=
Received: from BL1PR13CA0108.namprd13.prod.outlook.com (2603:10b6:208:2b9::23)
 by IA0PR12MB8303.namprd12.prod.outlook.com (2603:10b6:208:3de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 08:11:54 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:208:2b9:cafe::6b) by BL1PR13CA0108.outlook.office365.com
 (2603:10b6:208:2b9::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 08:11:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.1 via Frontend Transport; Tue, 9 Jun 2026 08:11:54 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 03:11:52 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 6/7] platform/x86/amd/pmf: Introduce AMD PMF testing tool for driver metrics and features
Date: Tue, 9 Jun 2026 13:40:43 +0530
Message-ID: <20260609081044.2416731-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609081044.2416731-1-Shyam-sundar.S-k@amd.com>
References: <20260609081044.2416731-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|IA0PR12MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: 493dbdae-eda6-4119-25d5-08dec5fec4d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|3023799007|56012099006|11063799006|5023799004|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gGjLwnw+xRDcgYApYfVFOWYeKzte03tdt02lkvDdbjCOTkWZtK5FkLAzfi+/KZzVZ2YNWKRGuSxvywdARY7mFv+b4eT8dJqrp0Uq1BQVg7GWkr5V/EAb5Km5sYap4wmiADGZMxW8n1qdTQfG1l46JHrCo+cVk2vNimQjmJu7dnbtKnORPhi+XS7Kx3mGrFCX0VRGdkltEkpYyEdpyg0ckdWXOWfK9Q4r1sgnqn0uDn0UhXgvMgjkIGtkSXmdO6blpA3cGRgsic3x/ZS3mz5kTkTxUnW53MhgaeT0Ff33LbRElGyVuB3j6lMSK0dJlq0Nih1V7nSxAwUZIFazuRUitBH2gAGYkGnJ2v4iZwAv3T3Kx+wnTKPPGk8tFB/UtfpMRxy00r3xOYEGuZ+5iKIUcKwUp/YHQFOY3S0/hNfxLhuExetS6XfkQluyFu26iAVWjdyvV79fq/yJRT6O1iNsORDmcBuImNUpz8XnE/avz9yQIfHwE82g0LB+OIuosxnjDwhwt0c1el2ArEgp2XsLbXkAH7WSOL0AxyPuznbhoNGrXe0zWPmlDcBKhIFT0OqFibT34aK4cTUsDH3z8BDC1PvVCd/Lc4bEUyU5HXLUQg2nwFZ89sgMd4EwpTCStCpj5oDF54X3ZDs2oZJkII0e7acrFHFTG4zrdaKaI93UPs7PG/odiPhfh+rn5atJQCTw8kEVAesnkFZohPbnGiNrKMqr2H0MvLaG9n/UCrJbn3g=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(3023799007)(56012099006)(11063799006)(5023799004)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xN9tcrBeuKCKBInC/qphCLaS9W8cd3fgza/ycpKweDwA/r1FBwR4488ytZ1M+VtLtmiUm0yATpZPJGNJkBqeLy+YJLP9TOp3KVlRVRr8onfmCSYmRBIyh7TXDSj8q3PagS1tEUDklimk00YH+yKaifO6xs1B18aa9Escehy5byvsqGRXFhI4U43r5BcB/onuTZJMoY5qUO/vdNTPH+iuPv0cTBqq5yKg1zMI+f6W17E9Tb+3t6Sj4EIyAHS4ilLB1AmmoGpl+IaiJx8UVb3wC/GJDeh5VdS/oWgLx0YsyV6/IUwH//2DWY6T+G/85lhSvAYDdJSX716fDm3+GtYxss5IuGt9+nCjBHFHLNTLBCaBU/UoIAz2MhAH78sh6H9r7VawV7jucTVuV7cjfKnu4ycwcqxP+MoXQBR1Pk4v9DK3ZwsMCpuA3wE9hPzAzcQS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:11:54.7458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 493dbdae-eda6-4119-25d5-08dec5fec4d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8303

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

