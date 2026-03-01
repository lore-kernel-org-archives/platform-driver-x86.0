Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010008.outbound.protection.outlook.com [52.101.56.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D38B31DD97
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Mar 2026 13:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772370730; cv=fail; b=jd3vYdadgmxoZ8tO+baVXR9wVEZX69Lm8lziLxEds3y+v0gB6spllS/690H1fObaW/73m2yNQ0idesY0Rzn4jvQL1QJz3d1vhL2CB4jHyavHFaIIlV1tPe1oP7PU+0MJvtlnCsEHMP0QZIyW8F5jqvfFHb7p9n4Z7cfdttL7rUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772370730; c=relaxed/simple;
	bh=wTTuyiS5sox4VSqGN+tNAIkqR8BUdb6ZX5zQ1grZyoQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IgnTHXSXr1E8I+vLof3l2Oru/T2G01Y/dVwugUqz93VuL7wMQIErvh0JrF0WeYVZzz3G5rh+nC26/ZQnLgLCd2W/CWBgDkK5czQoMj01tUBbQ2e9x0dYlT8kZEYC6KgsbyKnVXcrEt4xVV8i9XCLPj9Ke0vWBJe58URzU6/eLPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DjUcDuFZ; arc=fail smtp.client-ip=52.101.56.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DjUcDuFZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4LWQX8ZN2utvaDyFtaY8CPztD1q3ycFm0/YDIAVRc7xPBP2c7qfvEL1TI72J2fKR6KEsGwWomWGadXn2s+vFNHpxYEA20DFT9Er2lN5pIsyqCoV6ArrPLxqpu/9vhe+bgCur8d2yd3KA+bD3lMH6ZDcJoPv9QAZnjErGUbAMRbRRIiMvir6Gc6I9y+tGMTk+pGtC1bQh0CNlq1UGeTINgwmoq1sz3+Xur0XlchmYdpbuMgiXZNGoxnd/JxCwup67ai0jRJuLol0D3FxIhCS1mP+FM3ZKTjKva9VeaZXETmh8LCP0jT++L1ISp22OTcC2U8gXX6JWQMVuh+J9Q50EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j63iEK9ojFeFGYK/H/gfOL3c+RPGvPFbibQ6Y0qpCKA=;
 b=ISYBu/zCQZ4pFwPLIb9Rck1nEc6dOK2D9i6lcBJipgEZ3R5HpGHzj0oqhr9qS6gHIDQG7iiyoKwRx0sLVk38Y9v5q5J3sj3/9u+4T/q9Sx4EU3FmLTt9K7HptDNdIuRwmlVKvFx+mDLnjhEWF43B9fNgFGuH0tkZF/6TlPDVbJl7M6VWckiU6J3JhuD753lZyFq/t4devEJAqLOQqpmh6WAz6ZNuNKVKHbpeIAhtrIA1wH9mt5hHv4e/wRKfa0ctg9TdGizzEqlmLd/uBYfRVkILQ9gWvxq1lLrA9ZCLNQ7ue2ZHTdMCdWzWfzy7SGVV6lKcphN2nF1u+FYDyZT/jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j63iEK9ojFeFGYK/H/gfOL3c+RPGvPFbibQ6Y0qpCKA=;
 b=DjUcDuFZogwtqRFLNWlpsMLp3fFl70Te5yniQkOORCDNondkyKLECXPpXDev5livO2IZ6vVSu0lqmrSj3axKTSIy85GTQTcDb0IidI0YCLVZqqgsnoExmBTyuDDs65Xia9tVmyrQO261KPCKGzX3F6yz5lNIYxmUtC1SRHXiT1Y=
Received: from BN9PR03CA0758.namprd03.prod.outlook.com (2603:10b6:408:13a::13)
 by MW5PR12MB5597.namprd12.prod.outlook.com (2603:10b6:303:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Sun, 1 Mar
 2026 13:12:04 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:13a:cafe::ad) by BN9PR03CA0758.outlook.office365.com
 (2603:10b6:408:13a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.18 via Frontend Transport; Sun,
 1 Mar 2026 13:11:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Sun, 1 Mar 2026 13:12:03 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 1 Mar
 2026 07:12:01 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Yijun.Shen@Dell.com>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 6/7] platform/x86/amd/pmf: Introduce AMD PMF testing tool for driver metrics and features
Date: Sun, 1 Mar 2026 18:41:23 +0530
Message-ID: <20260301131124.1370565-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|MW5PR12MB5597:EE_
X-MS-Office365-Filtering-Correlation-Id: e5935ac9-01dc-45f7-d8ed-08de779421c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	dkP4bXck7DIdEj+TmRHllUtt/KJG0fSLR/AK+qkeVTlQmvCyoVCmLFK6SNusEw40bmh8KhhrvZmZG3iZXr4j9L60hVj9wTOMzGH4DoeD2v2nVUO2UXgy5imZRxTURlh/dgy1e8MGpvMApBqq3wUF1KAVDKMNdr9UXdfnofFY2TPaUD01+XHgdFgiO0PyR4vMhxKiBc1breoibXKQ+IkzXB4aHstHcQcVc+AnB85rwrBY213nQGcjgUws0/MeDQ2UsWdn4ovPr4kRfGLH9zCpexYHNeOhXPYU/tfBkD5uegekNiI0G39t8xMGA7sSp1DSieZDzLPBlTg1fsvhj0ax77hGb6uQHN58TqoiKaEvX/RVSuIdMu0TnrKrvB6ZytwAs0Vhf7/UcUV8alrpM/0hQ1pKgmXORFK6n3eufq1JrEtmqt24buPd/YKvi2ANNGkizC+bom5sriTMHOUkpHnfg9P2HcW1CkEwJjTqCB+U8El7bLnucmMqFHeqlr7rfVu9fnlQwVuHBW1DJO/du4pLJN+JBAPZYLISFploEuBcwdKgfabeCx4Iv8pRLmTfjeEbKbW3ImOLlU73hj9ttWH2a7L2+/9/aLU8ZtRA6MSwQ3fM/3A6OLBTp+t4JOgB65aAMt0rakWfzQdrltNsiStnTCNkEy5wjgeOlbwlSYv05Eh+CzFKpePxH3xXTq1Imp6DlC1KatJk4/G9Dj473zIgrGhpmrase7qGCTx8BnDYKczsc6RbyOJI9sTPOqdIW9XaGksorMZZOiKUBn8POvqQVT4Pqlh+VmANSZO9whJJDSfbHL4Put5OiR0LLINcJqqIwWv/3gjDyY984b17t52Tyw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OzYCcHqYqvoOoiDflQDzbC9EXpsogBTT0FyVjc0gOwh5t1XznxDESR6vhjmDs07sOHS0y3OFhe2jg4ylmtQGAVq65zhSLVrbuXddAFg1d1mz8OwAamfvRdrRxTGermEjaGqIuhD2ykoQDbhWqoKA4D8NLMA8VIojJ62cm6qhLuoYBJg9mTNGkmt4/HDHgmslt70yswym0aDfecW5nkJu6GB1nuMv/1oX13UnXGhZIbUi7VpakMeeFDRUdxj/r7emhrDJ3M+lbay6obZVeSajMOPt8utar/a/8adKZPlXGflFKin8mQokCs9Fkd8fvuOj8sO8TTsaucgTgHZcXyqzmmF5CrYLEzQdmS6HY8QnckD0XNIYQfkyaUK+uP0qQDXVmPp/hIgyGsBhoYVayhcRKxE1Y0TDDFejiXAARDsMUHe4G5QB6vpK4mAiUbr74CGm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 13:12:03.7945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5935ac9-01dc-45f7-d8ed-08de779421c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5597

This tool leverages amd-pmf ioctls exposed via the util layer, allowing
validation of its newly integrated util layer and /dev/amdpmf_interface.
It includes a user-space test application, test_pmf, designed to interact
with the PMF driver and retrieve relevant metrics for the testing and
analysis.

It provides definitions for test metrics, feature IDs, and device states,
and includes tests for various AMD PMF metrics such as power source, skin
temperature, battery state, and custom BIOS inputs/outputs. It also
enables the testing of PMF metrics data and feature support reporting.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 tools/testing/selftests/Makefile              |   1 +
 .../drivers/platform/x86/amd/pmf/Makefile     |   8 +
 .../drivers/platform/x86/amd/pmf/test_pmf.c   | 243 ++++++++++++++++++
 3 files changed, 252 insertions(+)
 create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
 create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 450f13ba4cca..d850fb09eeb9 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -26,6 +26,7 @@ TARGETS += drivers/net/netconsole
 TARGETS += drivers/net/team
 TARGETS += drivers/net/virtio_net
 TARGETS += drivers/platform/x86/intel/ifs
+TARGETS += drivers/platform/x86/amd/pmf
 TARGETS += dt
 TARGETS += efivarfs
 TARGETS += exec
diff --git a/tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile b/tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
new file mode 100644
index 000000000000..876424941e83
--- /dev/null
+++ b/tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+CFLAGS += $(KHDR_INCLUDES)
+
+TEST_GEN_PROGS := test_pmf
+
+top_srcdir ?=../../../../..
+
+include ../../../../../lib.mk
diff --git a/tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c b/tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
new file mode 100644
index 000000000000..a040ef01ba90
--- /dev/null
+++ b/tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
@@ -0,0 +1,243 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD Platform Management Framework Test Tool
+ *
+ * Copyright (c) 2026, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *	    Sanket Goswami <Sanket.Goswami@amd.com>
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
+
+#include "../../../../../kselftest.h"
+
+#define DEVICE_NODE		"/dev/amdpmf_interface"
+
+static int pmf_open_device(void)
+{
+	int fd;
+
+	fd = open(DEVICE_NODE, O_RDONLY);
+	if (fd < 0)
+		fprintf(stderr, "opening PMF Device Node failed: %s\n", strerror(errno));
+
+	return fd;
+}
+
+/* Helper to run IOCTL_PMF_POPULATE_DATA for one control code and return 0 on success. */
+static int pmf_get_fd(int fd, enum pmf_ioctl_id code, struct amd_pmf_ioctl_info *out)
+{
+	struct amd_pmf_ioctl_info info = {0};
+	int ret;
+
+	if (!out)
+		return -EINVAL;
+
+	info.control_code = code;
+
+	ret = ioctl(fd, IOCTL_PMF_POPULATE_DATA, &info);
+	if (ret < 0)
+		return ret;
+
+	*out = info;
+	return 0;
+}
+
+static int pmf_get_data(enum pmf_ioctl_id code, struct amd_pmf_ioctl_info *out)
+{
+	int fd, ret;
+
+	fd = pmf_open_device();
+	if (fd < 0)
+		return fd;
+
+	ret = pmf_get_fd(fd, code, out);
+
+	close(fd);
+	return ret;
+}
+
+static int pmf_get_feature_status(unsigned int code)
+{
+	struct amd_pmf_ioctl_info info = {0};
+	int ret;
+
+	ret = pmf_get_data(code, &info);
+	if (ret < 0)
+		return ret;
+
+	switch (code) {
+	case IOCTL_FEATURE_AUTO_MODE:
+		printf("Auto Mode: %-24s\n", info.feature_supported ? "Yes" : "No");
+		break;
+	case IOCTL_FEATURE_STATIC_POWER_SLIDER:
+		printf("Static Power Slider: %-24s\n", info.feature_supported ? "Yes" : "No");
+		break;
+	case IOCTL_FEATURE_POLICY_BUILDER:
+		printf("Policy Builder: %s\n", info.feature_supported ? "Yes" : "No");
+		break;
+	case IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_AC:
+		printf("Dynamic Power Slider AC: %s\n", info.feature_supported ? "Yes" : "No");
+		break;
+	case IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC:
+		printf("Dynamic Power Slider DC: %s\n", info.feature_supported ? "Yes" : "No");
+		break;
+	default:
+		return -1;
+	}
+
+	return 0;
+}
+
+static int pmf_get_device_state(unsigned int code)
+{
+	struct amd_pmf_ioctl_info info = {0};
+	int ret;
+
+	ret = pmf_get_data(code, &info);
+	if (ret < 0)
+		return ret;
+
+	switch (code) {
+	case IOCTL_PLATFORM_TYPE:
+		printf("Platform Type: %s\n", platform_type_as_str(info.val));
+		break;
+	case IOCTL_LAPTOP_PLACEMENT:
+		printf("Laptop placement: %s\n", laptop_placement_as_str(info.val));
+		break;
+	case IOCTL_LID_STATE:
+		printf("Lid State: %s\n", info.val ? "Close" : "Open");
+		break;
+	case IOCTL_USER_PRESENCE:
+		printf("User Presence: %s\n", info.val ? "Present" : "Away");
+		break;
+	default:
+		return -1;
+	}
+
+	return 0;
+}
+
+static int pmf_get_custom_bios_input(unsigned int code)
+{
+	struct amd_pmf_ioctl_info info = {0};
+	int idx, ret;
+
+	ret = pmf_get_data(code, &info);
+	if (ret < 0)
+		return ret;
+
+	switch (code) {
+	case IOCTL_BIOS_INPUT_1 ... IOCTL_BIOS_INPUT_10:
+		idx = amd_pmf_get_bios_idx(code);
+		printf("Custom BIOS input%u: %lu\n", idx + 1, (int64_t)info.val);
+		break;
+	default:
+		return -1;
+	}
+
+	return 0;
+}
+
+static int pmf_get_bios_output(unsigned int code)
+{
+	struct amd_pmf_ioctl_info info = {0};
+	int idx, ret;
+
+	ret = pmf_get_data(code, &info);
+	if (ret < 0)
+		return ret;
+
+	switch (code) {
+	case IOCTL_BIOS_OUTPUT_1 ... IOCTL_BIOS_OUTPUT_10:
+		idx = amd_pmf_get_bios_idx(code);
+		printf("BIOS output%u: %lu\n", idx + 1, (int64_t)info.val);
+		break;
+	default:
+		return -1;
+	}
+
+	return 0;
+}
+
+static int pmf_get_misc_info(unsigned int code)
+{
+	struct amd_pmf_ioctl_info info = {0};
+	int ret;
+
+	ret = pmf_get_data(code, &info);
+	if (ret < 0)
+		return ret;
+
+	switch (code) {
+	case IOCTL_POWER_SLIDER_POSITION:
+		printf("Slider Position: %s\n", ta_slider_as_str(info.val));
+		break;
+	case IOCTL_SKIN_TEMP:
+		printf("Skin Temperature: %lu\n", (int64_t)info.val);
+		break;
+	case IOCTL_GFX_WORKLOAD:
+		printf("GFX Busy: %lu\n", (int64_t)info.val);
+		break;
+	case IOCTL_AMBIENT_LIGHT:
+		printf("Ambient Light: %ld\n", (int64_t)info.val);
+		break;
+	case IOCTL_AVG_C0_RES:
+		printf("Avg C0 Residency: %lu\n", (int64_t)info.val);
+		break;
+	case IOCTL_MAX_C0_RES:
+		printf("Max C0 Residency: %lu\n", (int64_t)info.val);
+		break;
+	case IOCTL_SOCKET_POWER:
+		printf("Socket Power: %lu\n", (int64_t)info.val);
+		break;
+	default:
+		return -1;
+	}
+
+	return 0;
+}
+
+int main(void)
+{
+	unsigned int idx;
+
+	printf("Feature Name          Supported\n");
+	printf("---------------------------------\n");
+	for (idx = IOCTL_FEATURE_AUTO_MODE; idx <= IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC; idx++)
+		pmf_get_feature_status(idx);
+
+	printf("\nDevice State\n---------------\n");
+	for (idx = IOCTL_PLATFORM_TYPE; idx <= IOCTL_USER_PRESENCE; idx++)
+		pmf_get_device_state(idx);
+
+	printf("\nCustom BIOS Inputs\n-------------------\n");
+	for (idx = IOCTL_BIOS_INPUT_1; idx <= IOCTL_BIOS_INPUT_10; idx++)
+		pmf_get_custom_bios_input(idx);
+
+	printf("\nBIOS Outputs\n--------------\n");
+	for (idx = IOCTL_BIOS_OUTPUT_1; idx <= IOCTL_BIOS_OUTPUT_10; idx++)
+		pmf_get_bios_output(idx);
+
+	printf("\nMisc\n------\n");
+	pmf_get_misc_info(IOCTL_SKIN_TEMP);
+	pmf_get_misc_info(IOCTL_GFX_WORKLOAD);
+	pmf_get_misc_info(IOCTL_AMBIENT_LIGHT);
+	pmf_get_misc_info(IOCTL_AVG_C0_RES);
+	pmf_get_misc_info(IOCTL_MAX_C0_RES);
+	pmf_get_misc_info(IOCTL_SOCKET_POWER);
+	pmf_get_misc_info(IOCTL_POWER_SLIDER_POSITION);
+
+	return 0;
+}
-- 
2.34.1

