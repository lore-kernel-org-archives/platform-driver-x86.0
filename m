Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011028.outbound.protection.outlook.com [40.107.208.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F90834C13D
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Nov 2025 07:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762845049; cv=fail; b=EOdvPot6BZX1cnWOfe5SZvKr/sUkwTT9eARtFxrwufuZcrIphk8sqtJQ7m/F3az64KgKOiQx8idwuok5bD4LkTKVnSlui8mPOrrE0Jg/4j18GFBhTeVpwZ/2Rab08oUAkYsNlQdqIukGq4K+w4mA1HBEVDqbnM3oDHhDeij3fBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762845049; c=relaxed/simple;
	bh=IvUn1Vxur3bPp00Rxw9j9VO18DdwQDYKEtqjl6rRngs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oormZLITVIjA+XCLFiSp13kMXTkH/ColRMMjUNfe4H9bpUIIuPYEfqZNKAK/+jOhprszGvYKgdYETQmSG4UrQO7VSUnSZMsqeSXMX4FznhDmLh6yTJXwH8l7NacKuhXCHi9Mr+h7efcIwHEAFR8XylP3bU0wY8b55qOEaOsanEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=B52fCWxE; arc=fail smtp.client-ip=40.107.208.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="B52fCWxE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttTcore1PmRTMHtcCRN6q/ovF55MPabHu4qaVijd3zOfc4UNJWwWNbRFiR3V9kXfV6ZmcnvLbZz8W0BVwvPjWueeKXlXFZEFiyOOFEwKZEoj6FfXZcigGU1oUFX0kJEG8rpXS9ToqAlgRI1VmYca6KRtBGUM/shqn49gfbhDHiMj8l3f2HWEQ9GX8Gj8WyDG0IydRbAunEXDyR85O+il4LerCsd48B7/xnFQ10Y3Kv4QRz1dSUoasF50pCHx4bRztZCA0OSkmieXWpa7Elpu+yCxBsRIeiy8RKtH1/01FltWfsb/2hQAvJutC9BMg77PTZaAjCP5TRoEkjqTL//p8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuFH9sp+KoAWo13GAlgdM2loJL3jvp7Dfkb3IzQNz1k=;
 b=blKwfCgu46dDowW0+3jdCbTXbiE/qeI9yRWfxMHS2ME0rCjFUSYCa9AYJMcecZfMJstH0lJSj3PJ9d8tcsT3i3rZMR/cynMSziUCjB8NjSunCCA55whEVgv//b8PDY7NnTeP/YSlroEiyKMOn0594l5PqsxChmiikFcvPbVypFralCBhWJ10tbBPvw5Z/Bb5q+bM4KrXPtfA17rat6YfrCA6o3GikFmTOzVnYcYlulP5i5jJaUqjIGui6goqEsGfHDSUhngC3bxvJC+pztyOtHsgJi4GbNKprtLm5WvRwN2lexJweQdRoqLPCiFqf9K0j81J/XAY12ynMye2OdUZCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuFH9sp+KoAWo13GAlgdM2loJL3jvp7Dfkb3IzQNz1k=;
 b=B52fCWxE1/rjoW/I+8n34rTlIVNE45XKMo8ZYQ03GiNZWkL5gTCZRZS+O0b7lacw42ma3aim1V1XgB4efN3l9s57I02KxdFOKi2OyyFWFjuuX1WkppgUJiP5xj4yYQfreNjZeA/swubB7k/jbM8wTvg4sNFs8BouOGissojEga0=
Received: from BL0PR05CA0006.namprd05.prod.outlook.com (2603:10b6:208:91::16)
 by CH3PR12MB8972.namprd12.prod.outlook.com (2603:10b6:610:169::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 07:10:40 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::22) by BL0PR05CA0006.outlook.office365.com
 (2603:10b6:208:91::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Tue,
 11 Nov 2025 07:10:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 07:10:40 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 10 Nov
 2025 23:10:37 -0800
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Yijun.Shen@Dell.com>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 5/5] platform/x86/amd/pmf: Introduce AMD PMF testing tool for driver metrics and features
Date: Tue, 11 Nov 2025 12:40:10 +0530
Message-ID: <20251111071010.4179492-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
References: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|CH3PR12MB8972:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e1a863-0ef1-46ad-d01f-08de20f16bd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FlaVOnEiWYG9oPLrxv+qwk8xgY9jFF6mJ6LHaVqkfg06fGQA+UB+INLgEJRN?=
 =?us-ascii?Q?GznoSMkY3b9VfRkkXnWuxdjhEs8NOU+zJiBtVYXqTRvDDLxDEPg8pm9CCvSE?=
 =?us-ascii?Q?LBDCojj4KJz3nQR5MxMuXs5Q4UQaWdmJkJwOxLGKaLWBhjy4iJXh8e1o75Yj?=
 =?us-ascii?Q?nnTHKC5dKZdiDd1goBxn1frsOL7YkiT3xeICHni+cWEgm94lXcgDDTTL7R/x?=
 =?us-ascii?Q?bNJ3bmSNyGndGuAWCCN7fT3lL5FHatq2SXClYD2QaxZGNse0PO1fKQ6R2daD?=
 =?us-ascii?Q?rmphnHVn3TvUpFbeBs5oUI4gqdqLsXAKnErHjVsz1Bn5Mh5LDA4KrzQNxM2d?=
 =?us-ascii?Q?wZqOp5JYNns3Tz0x97ZLzGMFI+Jb+sZQ3pZ+IXgk0AZ/pLnrC2AfhpsEGrwO?=
 =?us-ascii?Q?Pc7QXHu/QvvDjJ7jv2VAzB7LnkdVagqQtdLdoZf1/J8wbFqEi6o7yNxDgWjc?=
 =?us-ascii?Q?cFrIuhP6dgEf4xD38WNDQHa0yjOQ1/wGtxkJjGQt6aM3YTwXCLLyJekJ+0E9?=
 =?us-ascii?Q?SRRPIH+X1Bk9PAnYeW4CaqrjV7fjajBSK1GDHR2zgjRnPJLrmucG4yS6K9WL?=
 =?us-ascii?Q?yOthz0m3J4daQ/kfVU95dHei+R/elnA4iSDSu0uyQ5A5beIow/DOayxtX336?=
 =?us-ascii?Q?/02BBR3qTt0n6ILEVPJInn9L4PgHOdwf3XTNQ9psD77qrdHdHZ59P/X76G66?=
 =?us-ascii?Q?T5jZJy+vg48+kHs3oRzYuJLAvjylKu4w+2Dr4lPo7NRy7nEWg1DbPgL0+ecz?=
 =?us-ascii?Q?akjr8uS0BLBpm+iw0XRRpK7U5QaASr02R+sfbBQ6RKPwISQVDFzPreN16r5j?=
 =?us-ascii?Q?l2pY8j48ZM9G7e2/yS8lX2SLCZ0/3JTan2ohXpVh7BJZE17lgbg/V4HBZr0+?=
 =?us-ascii?Q?zBa7XspnaeyJNUab7TaWMof2UMKC92O7Wtb1O7x8HqhLHOm0oVNjv9jLC1IX?=
 =?us-ascii?Q?82rWhx8hb4QpHHYY48/kjaKyBzPMUTyBW7aY+1W6IjGzKb5A1LNbxARNQqyS?=
 =?us-ascii?Q?Yh8PSr592DCboFo2FhKS8cwu5dwO/lMK/SQwBB3V/YGG0HNkqBLjWWnEOgrT?=
 =?us-ascii?Q?XTtNQru4CDvprMOeN5CPTriEKW10lUh2RKTtRto0oZhClnvzTZOIBrXNS/O2?=
 =?us-ascii?Q?/ulzZWH40OQrZEoTMbu8UOFFUQNOwGMdYUkZ/snabX4wXnSq8+MqMF4EJqXV?=
 =?us-ascii?Q?Wos/om++X7rzprXCuRORiSQFZVMWOEzWWVkVyaa7xA25lAXZ7V9yx/9Fhvvn?=
 =?us-ascii?Q?rh9kf/PwC8PRJsQJnE9l1b6iEJgPVBX4c/pQW0GcQWSDwRfmkQFupW60UJv7?=
 =?us-ascii?Q?KXUaxFe7ZqqqMlO6Vv8tK9CewBmlF96Ca8IfyoMC5RpM//uHpbNA6YS1jZFH?=
 =?us-ascii?Q?8qj9LVQDQPd8xnQ79Qis9zzT5dIq8F+h70kM/wSg9ilbLpCOLpto2c0Px/Yi?=
 =?us-ascii?Q?Zvb456NmGoN7s4llkY8SuqB3/GWB3dh7lpegA6aHGqYPKIuf8ZmGbSCPqafI?=
 =?us-ascii?Q?FAqk1PsQHZsiDo1sxwU9nGI2BBLWzFlcYE4PQKrRxEYe9oHShqzNAgjPcsT4?=
 =?us-ascii?Q?M+7B5b7HHx/TX2am8rU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 07:10:40.1083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e1a863-0ef1-46ad-d01f-08de20f16bd4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8972

This tool development adds selftests for the AMD PMF driver, allowing
validation of its newly integrated util layer and /dev/amdpmf_interface.
It includes a user-space test application, test_pmf, designed to interact
with the PMF driver and retrieve relevant metrics for the testing and
analysis.

It provides definitions for test metrics, feature IDs, and device states,
and includes tests for various AMD PMF metrics such as power source, skin
temperature, battery state, and custom BIOS inputs/outputs. It also
enables the testing of PMF telemetry data and feature support reporting.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 tools/testing/selftests/Makefile              |   1 +
 .../drivers/platform/x86/amd/pmf/Makefile     |   8 +
 .../drivers/platform/x86/amd/pmf/test_pmf.c   | 388 ++++++++++++++++++
 3 files changed, 397 insertions(+)
 create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
 create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index c46ebdb9b8ef..6dd2549b5feb 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -25,6 +25,7 @@ TARGETS += drivers/net/bonding
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
index 000000000000..f376bc6f18e1
--- /dev/null
+++ b/tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
@@ -0,0 +1,388 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD Platform Management Framework Test Tool
+ *
+ * Copyright (c) 2025, Advanced Micro Devices, Inc.
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
+#define BIOS_INPUT_START			9
+#define BIOS_OUTPUT_START			51
+
+struct feature_map {
+	unsigned long id;
+	const char *name;
+};
+
+static const struct feature_map feature_table[] = {
+	{ PMF_FEATURE_AUTO_MODE,			"Auto Mode" },
+	{ PMF_FEATURE_STATIC_POWER_SLIDER,		"Static Power Slider" },
+	{ PMF_FEATURE_POLICY_BUILDER,		"Policy Builder" },
+	{ PMF_FEATURE_DYNAMIC_POWER_SLIDER_AC,	"Dynamic Power Slider AC" },
+	{ PMF_FEATURE_DYNAMIC_POWER_SLIDER_DC,	"Dynamic Power Slider DC" },
+};
+
+enum laptop_placement {
+	LP_UNKNOWN,
+	ON_TABLE,
+	ON_LAP_MOTION,
+	IN_BAG,
+	OUT_OF_BAG,
+	LP_UNDEFINED,
+};
+
+static const char *platform_type_as_str(unsigned int platform_type)
+{
+	switch (platform_type) {
+	case CLAMSHELL:
+		return "CLAMSHELL";
+	case FLAT:
+		return "FLAT";
+	case TENT:
+		return "TENT";
+	case STAND:
+		return "STAND";
+	case TABLET:
+		return "TABLET";
+	case BOOK:
+		return "BOOK";
+	case PRESENTATION:
+		return "PRESENTATION";
+	case PULL_FWD:
+		return "PULL_FWD";
+	case LID_CLOSE:
+		return "LID_CLOSE";
+	case PTYPE_UNKNOWN:
+	default:
+		return "UNKNOWN";
+	}
+}
+
+static const char *laptop_placement_as_str(unsigned int device_state)
+{
+	switch (device_state) {
+	case ON_TABLE:
+		return "ON_TABLE";
+	case ON_LAP_MOTION:
+		return "ON_LAP_MOTION";
+	case IN_BAG:
+		return "IN_BAG";
+	case OUT_OF_BAG:
+		return "OUT_OF_BAG";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+static const char *ta_slider_as_str(unsigned int state)
+{
+	switch (state) {
+	case TA_BEST_PERFORMANCE:
+		return "PERFORMANCE";
+	case TA_BETTER_PERFORMANCE:
+		return "BALANCED";
+	case TA_BEST_BATTERY:
+		return "POWER_SAVER";
+	case TA_BETTER_BATTERY:
+		return "BETTER_BATTERY";
+	default:
+		return "UNKNOWN";
+	}
+}
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
+/* Helper to run IOCTL_PMF_GET_METRICS_DATA for one control code and return 0 on success. */
+static int pmf_get_metrics_fd(int fd, enum pmf_metrics_id code, struct amd_pmf_metrics_key *out)
+{
+	struct amd_pmf_metrics_key info = {0};
+	int ret;
+
+	if (!out)
+		return -EINVAL;
+
+	info.control_code = code;
+
+	ret = ioctl(fd, IOCTL_PMF_GET_METRICS_DATA, &info);
+	if (ret < 0)
+		return ret;
+
+	if (out)
+		*out = info;
+
+	return 0;
+}
+
+static int pmf_get_metrics(enum pmf_metrics_id code, struct amd_pmf_metrics_key *out)
+{
+	int fd, ret;
+
+	fd = pmf_open_device();
+	if (fd < 0)
+		return fd;
+
+	ret = pmf_get_metrics_fd(fd, code, out);
+
+	close(fd);
+	return ret;
+}
+
+static int pmf_get_feature_status(unsigned long feature_id)
+{
+	struct amd_pmf_feature_support info = {0};
+	const char *name = NULL;
+	static char buf[32];
+	int i, fd, ret;
+
+	fd = pmf_open_device();
+	if (fd < 0)
+		return fd;
+
+	info.feature_id = feature_id;
+
+	ret = ioctl(fd, IOCTL_PMF_QUERY_FEATURE_SUPPORT, &info);
+	if (ret < 0)
+		goto exit_err;
+
+	for (i = 0; i < ARRAY_SIZE(feature_table); i++) {
+		if (feature_table[i].id == feature_id) {
+			name = feature_table[i].name;
+			break;
+		}
+	}
+	if (!name) {
+		snprintf(buf, sizeof(buf), "Feature %lu", feature_id);
+		name = buf;
+	}
+
+	printf("%-24s %s\n", name, info.feature_supported ? "Yes" : "No");
+
+exit_err:
+	close(fd);
+	return ret;
+}
+
+static int pmf_get_device_state(unsigned int code)
+{
+	struct amd_pmf_metrics_key info = {0};
+	int ret;
+
+	ret = pmf_get_metrics(code, &info);
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
+static int pmf_get_battery_state(unsigned int code)
+{
+	struct amd_pmf_metrics_key info = {0};
+	int ret;
+
+	ret = pmf_get_metrics(code, &info);
+	if (ret < 0)
+		return ret;
+
+	switch (code) {
+	case IOCTL_POWER_SOURCE:
+		printf("Power Source: %s\n", info.val ? "DC" : "AC");
+		break;
+	case IOCTL_BATTERY_PERCENTAGE:
+		printf("Battery Percentage: %lu\n", (int64_t)info.val);
+		break;
+	case IOCTL_DESIGNED_BATTERY_CAPACITY:
+		printf("Designed Battery Capacity: %lu\n", (int64_t)info.val);
+		break;
+	case IOCTL_FULLY_CHARGED_BATTERY_CAPACITY:
+		printf("Fully Charged Capacity: %lu\n", (int64_t)info.val);
+		break;
+	case IOCTL_BATTERY_DRAIN_RATE:
+		printf("Battery Drain Rate: %ld\n", (int64_t)info.val);
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
+	struct amd_pmf_metrics_key info = {0};
+	int ret;
+
+	ret = pmf_get_metrics(code, &info);
+	if (ret < 0)
+		return ret;
+
+	switch (code) {
+	case IOCTL_BIOS_INPUT_1:
+	case IOCTL_BIOS_INPUT_2:
+	case IOCTL_BIOS_INPUT_3:
+	case IOCTL_BIOS_INPUT_4:
+	case IOCTL_BIOS_INPUT_5:
+	case IOCTL_BIOS_INPUT_6:
+	case IOCTL_BIOS_INPUT_7:
+	case IOCTL_BIOS_INPUT_8:
+	case IOCTL_BIOS_INPUT_9:
+	case IOCTL_BIOS_INPUT_10:
+		printf("Custom BIOS input%u: %lu\n", code - BIOS_INPUT_START, (int64_t)info.val);
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
+	struct amd_pmf_metrics_key info = {0};
+	int ret;
+
+	ret = pmf_get_metrics(code, &info);
+	if (ret < 0)
+		return ret;
+
+	switch (code) {
+	case IOCTL_BIOS_OUTPUT_1:
+	case IOCTL_BIOS_OUTPUT_2:
+	case IOCTL_BIOS_OUTPUT_3:
+	case IOCTL_BIOS_OUTPUT_4:
+	case IOCTL_BIOS_OUTPUT_5:
+	case IOCTL_BIOS_OUTPUT_6:
+	case IOCTL_BIOS_OUTPUT_7:
+	case IOCTL_BIOS_OUTPUT_8:
+	case IOCTL_BIOS_OUTPUT_9:
+	case IOCTL_BIOS_OUTPUT_10:
+		printf("BIOS output%u: %lu\n", code - BIOS_OUTPUT_START, (int64_t)info.val);
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
+	struct amd_pmf_metrics_key info = {0};
+	int ret;
+
+	ret = pmf_get_metrics(code, &info);
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
+
+	for (idx = 0; idx < ARRAY_SIZE(feature_table); idx++)
+		pmf_get_feature_status(feature_table[idx].id);
+
+	printf("\nDevice State\n---------------\n");
+	for (idx = IOCTL_PLATFORM_TYPE; idx <= IOCTL_USER_PRESENCE; idx++)
+		pmf_get_device_state(idx);
+
+	printf("\nBattery\n--------\n");
+	pmf_get_battery_state(IOCTL_POWER_SOURCE);
+	pmf_get_battery_state(IOCTL_BATTERY_PERCENTAGE);
+	pmf_get_battery_state(IOCTL_DESIGNED_BATTERY_CAPACITY);
+	pmf_get_battery_state(IOCTL_FULLY_CHARGED_BATTERY_CAPACITY);
+	pmf_get_battery_state(IOCTL_BATTERY_DRAIN_RATE);
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

