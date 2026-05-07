Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012054.outbound.protection.outlook.com [40.93.195.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE503F23D8
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 14:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165166; cv=fail; b=SodU6g99NzpQt8d+kzGP06VjpQpL+FedU2tEade9ckMNB+LwL14AEOeCGlo613Xvot6S9gcFt1kG+RZIPtiWsPaPr43vX+zJhF8ZrXcSZij7m4HVhnqgGmDTAl5mMHZ1rVGiKDLE662v6VgEeroBUK9hoiTg2OAXjcHVNxQ9AS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165166; c=relaxed/simple;
	bh=FW1jf2c6ugtIqtQsqedEsxORZJcHwwDEKcZaZJFbyZA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R87Ygv/Fz1JU2gXU7kehCmMiiI3BoagEMN+h0N2CcOu/P4WuefIhDxvfOKYccTWzHznWVOmLcn6EmfHZPssUJEJJouSoA6CLTgoGmb7///LsmfUEYW2OORl1/+FV61q1jeZxAS0e9YQXCVBJhALTQD7aqk4FgvF1898cLnlZsAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Fhsz4ZH+; arc=fail smtp.client-ip=40.93.195.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Fhsz4ZH+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIkETxHc6pru/5jECniWRPJRjMZ0/FgyekXohY85hRDEWkeuVJA2Wjl9LsdgojMt5ssNQGV2FRSANU8UhX3rVuBPnBaU39Mh+RQMLajpxmw0ukVt1BjhCi0IIgxKEcY5wa5ysHWs0OD139AQT0Yr2YIa1ruCB3ml3AthmI24Iz7d7YrMVwe2h8IFIi9iy6pmf7McoxQHKcvNHk+s5aeJT5VLtV5F9vU94j7Ga8QqDTjZ8JLQMy+Qi67QUVCRY4wo+2RTfM6VizeTn8JPkR0nCabdyv1gVPWobl8XFs04+QkL1Krq0/4ObdM0BC0DwH6H1fmtmH3Z7QNaasI5EOf52Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36p+3Ggpi0KSAuZoTEzbl95k46YPhxAG6eWI5A4xP/I=;
 b=zRmS16LTeoeH9VU5231xD3fh0D+/xJNx23iSVXj0JEuJe0hr4I/iq4215EqxAwsZZmGSUQE4GQxd0T+2ubIYb7dmd9jPF+2Qmqsf51Nmxc/qavLtRQSHTeYO4UCU1X4NiKbE1SUnNI9p62/9swVG+FLZtC4Ha6f2AUWgH5XlwUw2MRelRlcEJETmK856f6YKT0jkC2d5B1qjuR3+8Ru98nM+TsuUSmJrp/TJIpG6oxy1dTYm7sicgxc2QOx1u6J1nMRfgCpj6W4YRtti7jyi1gyQBWdSErPuzVH82+se6EBjsUykVfXbRkw1ROfsixRFgBvnWpfvWjggJxzipZMyaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36p+3Ggpi0KSAuZoTEzbl95k46YPhxAG6eWI5A4xP/I=;
 b=Fhsz4ZH+Xmezan03WlKEzTcXKlJGY/u7mfTgSIadqRXVDYHkd/T5L+1f2j6wbNZ08yPDhmfQ7q4KPTe3gggv/qlLBgw14z1lY2nw27OiXgYfAj/K7ysmL1ZxQ3MZ3Ix8IO7+gLgLLjG47/ePDuYOn1aRfeC/bv26jZT6zXG3b7w=
Received: from BN9PR03CA0581.namprd03.prod.outlook.com (2603:10b6:408:10d::16)
 by CH3PR12MB9097.namprd12.prod.outlook.com (2603:10b6:610:1a6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 14:45:54 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:408:10d:cafe::7c) by BN9PR03CA0581.outlook.office365.com
 (2603:10b6:408:10d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.16 via Frontend Transport; Thu,
 7 May 2026 14:45:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 14:45:54 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 7 May
 2026 09:45:52 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 6/7] platform/x86/amd/pmf: Introduce AMD PMF testing tool for driver metrics and features
Date: Thu, 7 May 2026 20:15:23 +0530
Message-ID: <20260507144524.664001-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507144524.664001-1-Shyam-sundar.S-k@amd.com>
References: <20260507144524.664001-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|CH3PR12MB9097:EE_
X-MS-Office365-Filtering-Correlation-Id: c2d34b40-6480-40f2-c1d8-08deac4757bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|22082099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	yxEaBkSZjZkFPPl1KQ1TSdePi0X/BS3TnTN3fzcNt1ym7rgOp0wELvsGKEFUU6TpFkfOLgGbkdiF4/2TXbbJzZ/NEawzCc6KNWRBVZOT1108ZB9SvStGQnKx06UUuGE9SuWg3zoxSolixbp4rto64TMGWw2NTJq6kcUjsQG0Z13/FMcBTm/gWcOcpXQhfZk7fFbe0C5+h0tD+MAu5mA3/hd64ekIKtF6yiZ5kIjy20CTkVH7H1Yd5fQzQtVK2K8aB6gliPpTemwmQb6FDYaw1NgQjMw/Xx6T0SuLRCWKYZ2gADysB7Q/tR39nIE9WlFdtz0WJi1eddOu4txbUdIMVtiExZDbpJaVBCFcZ5zrzLOywO+XLQOq/Qeho8mVga/CVwRogze6rEv8BMecB2y6faG1rsqoJgSwiu1mVIRgEkzjmHs9i58s4kF91DcQQAZm7OTpmNRiBeh1QOD0hy7cMs6/pgFEO5iXamuo72SAIwMVMj8gWeRl5+IWghSMZH3hAEkahJ563MqGXTZ11dWblmhtPPVlamvYLQgFrV/GkFabOWo0tnvsGcQD/rNhAgc/DW6R7pGERO8zU41cj/TOOgyigz08zKWkvKprQQ9oxEpIJAvooJQczoMB9aRymVNAMVrK8bSIY9UjR+f6a44jZ6lehDB8QJSDv5wyMKXnvoZ1sLHSKe7qpjRWMqgCaydPLMxavmUqz/Mc0+XXN8Vu2N2B/I1qZ0ofrd5Qnx1YZDo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aiK97uP8IREl4KiN+ygGQMEb2I4onlS4VSslOzcEYHjC4sZB0prH9+Rw9vbDYku4NYVOCjfKnyOL9QFg7WYGh23EOthOnWXxMGRWUO8Ff1dRe8/98B36IqmpzX5ycgGQHCxcq0EaKT7GD2V72mGuQSyos5C60fVV7sNWgLaXWRnwbqBtvVtfDwGDeK0qCeipK5DDOqmx3npiik3iRcwv64VEZT0Dt1stt1HyB6bkASPIZ/TJVzeZt9rDcX22/q8xIJnxbttJYNMIr8r21vyAbrlC1feFgGnA7+eUX5AG9wMIcqco9NwCRgDwQo+h4wtFtvJXSrH8w/5uLRO6i67G2ObiZY7iUXTxg2EO9GgxyxbOgTBLJx6cyDc8FlPSNYsGBv+aT85KIjVzpUHtTrf2LQM/KV44Cgt1nSPUUBVeyT7SKdhyi1LYxwQ23sfSW1RH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 14:45:54.7406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d34b40-6480-40f2-c1d8-08deac4757bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9097

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
index 000000000000..a57f5c0e2565
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
+/* Print feature flags */
+static void pmf_print_features(uint32_t flags)
+{
+	int i;
+
+	for (i = 0; i < (int)ARRAY_SIZE(feature_names); i++) {
+		if (flags & (1U << i))
+			printf("  [x] %s\n", feature_names[i]);
+		else
+			printf("  [ ] %s\n", feature_names[i]);
+	}
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
+	printf("=================================================\n");
+	printf("      AMD PMF Metrics info and Feature Status\n");
+	printf("=================================================\n\n");
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

