Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2078.outbound.protection.outlook.com [40.107.100.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22F3158D6B
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 14:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712758221; cv=fail; b=DXR/hvcTN8gyvvgd74dv4PP1guNT3/rabi56r9JninpKr8nHckg2a5FCknGWk75iyPiVsCB5IBcr28HzxtndPr4LR1S7urJlRh7mT/js6zPrs6WRkZ+VaCxAuYNJFUffdcFPiUQY8Ygb73JT9R294ck35qXkcuaTgGNPut0SDfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712758221; c=relaxed/simple;
	bh=gVjxVP6kJSSdLzU54m1vdkt6MfZwKCFo5qnkKGiy+fs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mqmo3oOH4zS44o20zWmbuiUXDXK2dpZuX/6mXeHqNVCZ//eX/KmMTg3ym01kRY+mZM7Dhqw+8/viWE+eSFgx2Pw34cLlGORojMjIRqvKq+Jvy54sLB+xJ6lPCI3OwWl45aRf3jQZaADQip4ZUru/OK3zKoJqLh82pVPSGVkYN0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xO/bmDi2; arc=fail smtp.client-ip=40.107.100.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xO/bmDi2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxqS8lLXz9DZfx11r27+Dr1X0jF0E7B8kbL7GmO49NWlfm4sdJVykXPFnq6fqNXNZ/ucIv2gWYN6voW7ALjYvpzxVqdFI3M9MNC9vKpeWARQH884yCaliEliBxWOUvi6GsXrGQqmScgw7zFO/9AFYsuTt25hYbAmsgX/L653WPIc4rvBTBXAizu9icANOjtURuksqjKifAoJicbAaHYaLcYEF446DuTpkMSQ/7qEjoApgJm6sGOuiXc2vO+RYYZ98NRZLbWEKfrcZPPBXmMuBHYPi32aKjFLDnokkqNveqZeUpPc8eWPe5+UYEq+ZUOYrWlLE9KvQodWzfik67JUpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZumNjKEWPcmFLrXFiH6uaSWICK8J3syqnmZQPj0blc=;
 b=MRQDeL/8liNpNqYjJLX9fbrx/v7pm2nickDtHI6H4tPM3afYSMrFPYM2F8MxQghWTQszk6bWlXqKGxFo2tbjH957royzbGl2VrS85H/CMwHcss718O30dNvel65cptUkPKw3sCuyJCORn8n46cb+mYJwp4lPnsho47Dhji2szJLhfjdUVDVt3AFJi1iXmE0v2NAMRr65SmEuubk6B+R1xfka1Bg385aJGDSvyj1/m0yIObPh5XO93oULCFItwEI9YuFpIV0phYez6DvBj5lpAdITyTFjEOibpir5WZHf9UEN22LP7m/T6X7hPrJKTZ6uMorbVfdVkXOPc1CRg1ZsVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZumNjKEWPcmFLrXFiH6uaSWICK8J3syqnmZQPj0blc=;
 b=xO/bmDi2jnQ3Aa00t83qauzN006TZQqSgPoKGkYniLOb9qUIat58WurGL78cJk5wsS7l3wC101iqruTAwUgUtJ4N/hcP7R6u9xy1urE7o6AdSMC+AXCPW/rt93htd6SRFm61ySeXIS0i10WzEkTf18ZjpXzjQ2XDllaIaSwtK7o=
Received: from BYAPR21CA0026.namprd21.prod.outlook.com (2603:10b6:a03:114::36)
 by SA1PR12MB7366.namprd12.prod.outlook.com (2603:10b6:806:2b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 14:10:16 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::ae) by BYAPR21CA0026.outlook.office365.com
 (2603:10b6:a03:114::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.8 via Frontend
 Transport; Wed, 10 Apr 2024 14:10:16 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 14:10:14 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 09:10:12 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
CC: "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, <al0uette@outlook.com>, "Mario
 Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH 2/3] platform/x86/amd: pmf: Add infrastructure for quirking supported funcs
Date: Wed, 10 Apr 2024 09:09:55 -0500
Message-ID: <20240410140956.385-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410140956.385-1-mario.limonciello@amd.com>
References: <20240410140956.385-1-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|SA1PR12MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a8b9891-b3e5-4733-faff-08dc5967f16d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cYMB1rcOyrtH1Oa3ILmuXgofV2bGtgLotb3cJiO+MNPookDEpwQXrClAi2Cy0mZLL3fItqn166VNQT4NLQ+ZlBuYwniJCUX22fZcQEBzNPLcHPtxrBkHZhuoWwDar/w8eMPqBUvz0dSSnhmNI7knpxD9wDBHTLhfAl5nLkPCZFUPZCyoFyrPIflrkr6O4lXOJ8c/zhHfrcI/FUtHRlm4OZ9Bzbnd/CmRRYz7Mb6kA+LmKXzWMWuXCzv7IY3Srv/zEs37zlFTH6Er6PpmedowCuXo8vpyjt1uONwOSwNE6vAaa/7o7K02t6XkHy4aFVbYRE/0bC3/gLqz2JaaDtYJlXpRZCP6v1rkiKX9Kd1RXH2IiBmxjJLhNLSW4XVqPL5+my7ByLkMPp2sXEAlDV+Y0FksZDNVu09tVxR9Q/QRCeuWDGyHxv425jiDUiYD4jyQk7f6Y1AhtI5AD03dWS46YIhg9l7XuC6CW0vGqNQEIaLpSqZzYwWza3BY/XRtXz4UFnWEe6t3UQvkDQvtj+V3UJzQq+P4d3CZFmuGW7U73L9lCpZyY/vgd54tK6mK6ff6dvzDNOd9jCwG5Dj6hX7v/Rjw8X6RoFZJdLfxSOcQBAPfNv6eDbvgTPkOkJLwtXLUwLcH3Ijo1U/BGfvJSmpYqr9xQoOwAXNl51ghCyuxgTRSpLlq9neoi21pj4gH9weUwFf2img+aSFphLHtvntz7RjV+9tMk/aC9TxZP4rKKPYh/75sulKGO8tMSR4xhoSpiLYUTU11C5aKKpw9SP0fC0PQ62Q0+mNzwQ7ohKuCjTc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(32650700005)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 14:10:14.5381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8b9891-b3e5-4733-faff-08dc5967f16d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7366

In the event of a BIOS bug add infrastructure that will be utilized
to override the return value for supported_funcs to avoid enabling
features.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmf/Makefile     |  2 +-
 drivers/platform/x86/amd/pmf/acpi.c       |  5 ++-
 drivers/platform/x86/amd/pmf/core.c       |  1 +
 drivers/platform/x86/amd/pmf/pmf-quirks.c | 43 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h        |  3 ++
 5 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 drivers/platform/x86/amd/pmf/pmf-quirks.c

diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
index 6b26e48ce8ad..7d6079b02589 100644
--- a/drivers/platform/x86/amd/pmf/Makefile
+++ b/drivers/platform/x86/amd/pmf/Makefile
@@ -7,4 +7,4 @@
 obj-$(CONFIG_AMD_PMF) += amd-pmf.o
 amd-pmf-objs := core.o acpi.o sps.o \
 		auto-mode.o cnqf.o \
-		tee-if.o spc.o
+		tee-if.o spc.o pmf-quirks.o
diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 60fc71c9fb0f..1157ec148880 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -343,7 +343,10 @@ static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
 	if (err)
 		return err;
 
-	pdev->supported_func = output.supported_functions;
+	/* only set if not already set by a quirk */
+	if (!pdev->supported_func)
+		pdev->supported_func = output.supported_functions;
+
 	dev_dbg(pdev->dev, "supported functions:0x%x notifications:0x%x version:%u\n",
 		output.supported_functions, output.notification_mask, output.version);
 
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 5d4f80698a8b..64e6e34a2a9a 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -445,6 +445,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	mutex_init(&dev->lock);
 	mutex_init(&dev->update_mutex);
 
+	amd_pmf_quirks_init(dev);
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
 	amd_pmf_dbgfs_register(dev);
diff --git a/drivers/platform/x86/amd/pmf/pmf-quirks.c b/drivers/platform/x86/amd/pmf/pmf-quirks.c
new file mode 100644
index 000000000000..9f3790eaaa30
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/pmf-quirks.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD Platform Management Framework Driver Quirks
+ *
+ * Copyright (c) 2024, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Mario Limonciello <mario.limonciello@amd.com>
+ */
+
+#include <linux/dmi.h>
+
+#include "pmf.h"
+
+struct quirk_entry {
+	u32 supported_func;
+};
+
+static struct quirk_entry quirk_no_sps_bug = {
+	.supported_func = 0x4003,
+};
+
+static const struct dmi_system_id fwbug_list[] = {
+	{}
+};
+
+void amd_pmf_quirks_init(struct amd_pmf_dev *dev)
+{
+	const struct dmi_system_id *dmi_id;
+	struct quirk_entry *quirks;
+
+	dmi_id = dmi_first_match(fwbug_list);
+	if (!dmi_id)
+		return;
+
+	quirks = dmi_id->driver_data;
+	if (quirks->supported_func) {
+		dev->supported_func = quirks->supported_func;
+		pr_info("Using supported funcs quirk to avoid %s platform firmware bug\n",
+			dmi_id->ident);
+	}
+}
+
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 8c4df5753f40..eeedd0c0395a 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -720,4 +720,7 @@ int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
 
+/* Quirk infrastructure */
+void amd_pmf_quirks_init(struct amd_pmf_dev *dev);
+
 #endif /* PMF_H */
-- 
2.34.1

