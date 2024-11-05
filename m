Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE91515C144
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 17:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828270; cv=fail; b=msAQ7cmWYvM7P4TaetjTRC/ozmhGGsUpAUoCT5JXKKA3ppPfLkDzu2o1fd8brs/oDjGibn0lXzL1Y/qtPKKwwUb1ruPF3fR9WAU2SYwO00NkswscenXOwWwqrZxlpMQENufCJUsJobP+stP7tQVdyKxxXd9NvedPk0J1I0qJm1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828270; c=relaxed/simple;
	bh=w7h+cRrwg2zH/sNGsaTzH5fbV7dBNPpe0eUmxWGIbA0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PM+P+T5FUfvpqhCvWJov4fPNEl0r9FX2gpRKVCgD+W8Aymipkw6NZEtH3kiFc1lEzOZaYQ6mPKHlSLUakB0bqnV9bY/xKJAf9I1+xGDumaDvk3mMXKPbLDXg881yEv3dAK2WqcoD5GLladD1ewvuNp86pDT9b1vdAiwm+f2USkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qY8p7jrB; arc=fail smtp.client-ip=40.107.94.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qY8p7jrB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkch9HFVF9X1e9DquGseP7GSvyO3BCdcec5751ty82c0cNJ2RZPf1UTaWOXzSTaW4cYkrp/2DBBFj67fLChZ1elhNXTTYNtayYIdKJoXxQdwlrGy9GTOc5MP6HXdkfgNLmYBLRMBM0dVjMJ/GzOZuQzP5R4dO/OF6SkCpsESJy2tqa8bkMGMDX8kgIQH311TMsw0yHV1RxzUOX7q3sB2IWaFCkPCuym9DbwWNCqOBQQceilzYoZsWIKIZi2VbwKMePFsWtQM4MaL9Tj3VC0HN16hGxQf6mV17mmyFfKG+K6A8k29AVxhXZ9MloCL0blA0WdjI2LgOsAGXdTMVvbonw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mslxaJtDUDc0VvJ2A8RB7PUXFgH0OLdVkhsf936jJjk=;
 b=w6p7rWozZvJupuG60pVNqWPEUFwsykIh114PYRNW+723pTowZ4KGxyqmQ5qiT1R2q4wXd7E2QckddwqM3AZ6R1elYJ0Q7hqcFhR9woloN/MtjF7yPke+/b/Y70QA0MFC3jpgowuIo+NKsUn8Lh17aqzKNNvFemPBX+Gfe9jgEw3yhe8DBD62vcJd8Kp/sqtsWL2B3LeqvNKHv+btrwjXzIm3s93R5rqwUZqieqF+VVlQjGCvL2xKYnece9yV+TqWmpXa9DsMYCSaONG/cL7755P65T+1f3jsbnL/CPSJu4/CEoxVNvRY8Izw30deBt908CUHTy/0CW0hRS6yecJNvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mslxaJtDUDc0VvJ2A8RB7PUXFgH0OLdVkhsf936jJjk=;
 b=qY8p7jrBW88jt1EO2Bn5J4imXgsxEuF9mn9NSdrH07x0k+ZWnwAEwKVZGc9lBlI60EIq5Dr83iOsSAIK+k1aQqGiySWrh7Kw7MdesTiJKnk+2nPzksCefm7UgEkV6jkqhw+GHYnMmdfDgetCllRw8KmWGTBnXNB1ziWZM2eiWlA=
Received: from BY3PR04CA0003.namprd04.prod.outlook.com (2603:10b6:a03:217::8)
 by PH7PR12MB6836.namprd12.prod.outlook.com (2603:10b6:510:1b6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 17:37:45 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::57) by BY3PR04CA0003.outlook.office365.com
 (2603:10b6:a03:217::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30 via Frontend
 Transport; Tue, 5 Nov 2024 17:37:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Tue, 5 Nov 2024 17:37:45 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Nov
 2024 11:37:42 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 01/13] platform/x86/amd/pmc: Move STB functionality to a new file for better code organization
Date: Tue, 5 Nov 2024 23:06:25 +0530
Message-ID: <20241105173637.733589-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
References: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|PH7PR12MB6836:EE_
X-MS-Office365-Filtering-Correlation-Id: e1688347-94f0-4572-0db1-08dcfdc08eff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CT5q2PIhI0CxwCNr7N/xQPkj49Fn8VD4jjHsMHu6JOWikZWQqcJ8faMYjRvb?=
 =?us-ascii?Q?E+EQhbwmxp6y5ck/eqa93jrVw9z3IdD9rfORtGtYO0iIlBd6awlw28yQqFKJ?=
 =?us-ascii?Q?Bjv5vPEfoxz6YaKr+zwO34ws8F9NipApNC8dpnsZeQYQ7RAZa1Vh7HpMC0BZ?=
 =?us-ascii?Q?uwYV9kDstuOs1RoiFFYGLid/qeF54iT9JeaNjdZhAb1D9lkOQIB4DC3CgrBA?=
 =?us-ascii?Q?B5TgbIh5C2JcQHkQoLuZD4H8aCLTqoPgyLyZui2i5WacBtcoyYdTO/Iz89sT?=
 =?us-ascii?Q?vkVlgyqsbZTCgRISGcPCELyr02RwZy6ejTKj0OYJcECZk6TC79ttNIVHqljS?=
 =?us-ascii?Q?kBC9BGB1p1wFCgiNaDm1pyrqG0gUiQaJeAL+nPnDSHLP1uKg4H8k1N6SqQuH?=
 =?us-ascii?Q?qNVDhaO7+SoLUHp8wVGZEEXDgzDgfG+ptJYyokSFgDbcjIj73pu9VV1y13D7?=
 =?us-ascii?Q?XMEVwp8VQg48o2M+quKsIftsMDdnzh/OliDvUKvk/M4t1Zgxwt23NIFcNKhq?=
 =?us-ascii?Q?dAzZZcruUYVjilzcIiFNd7ugCtI7wqL/jCeETIBPie2uxMUbHiVLCLsu7Wdy?=
 =?us-ascii?Q?a/qDi2ed63rEHzdyLoOKQRMtS+nAAeCkST2+sTlilvAnGggjPhoaPCQjZn/N?=
 =?us-ascii?Q?pZnLijiijSkH18nHwpUIHOS0w3v0fzBM7Guo6H70+aceHbpKIVD6Y06K0uGU?=
 =?us-ascii?Q?rIU6pRS/CzMRC0QGMaKfE19CBCNi0wHNaWLh1uvN93xV+uDOnxJtWOJPANVD?=
 =?us-ascii?Q?o5IxXQjWRpMq1cMawXzVxeUH4/6GMGFeP2HCBMMvby9vvQ+QJ/DqhiNM86x4?=
 =?us-ascii?Q?Ov7xIMmO+iPjB32RCeswHMZFa8NHziE1gyTLFlYAMDeAU2QlSl8BDxnUdDAE?=
 =?us-ascii?Q?awEYRIQ3seleVE0ZD8mBZmP0PFeYOygJqfW6RCwek0gIvny+1ve3OHjrEbYx?=
 =?us-ascii?Q?fYPN/8G433UPUBgbGIeI+TjFNxJS37RoqMrvnE6LEbNlNELcfZmmrl/QpnMf?=
 =?us-ascii?Q?y6LeQjfcD3CTHswrNeBYxr9hXv4+gEx4pfnv/ad7wYON2hDfrd8SagRyXsIG?=
 =?us-ascii?Q?382BgWP3oezv1Gh0sATyOL2DW9BTgDDA/SSPNtac2Vw08eaQkRPA43oaI8Lv?=
 =?us-ascii?Q?guEsybDGmHyYPg5q8R5ne9ra7j8LlerBPTZfHp9D4P4deXP8Ed353DNiPrfV?=
 =?us-ascii?Q?iFthSB/SdIlVU5CEBD/DHNkrmD+8Fj/ZxXjDEzPOntTX0Vge39jtYbwoSFq1?=
 =?us-ascii?Q?RexPIjLqcNEhqu1oWpEUoB3SLfDp8yg49WNZzHWmS0GR0UcnrlstU+cMaXXM?=
 =?us-ascii?Q?GgNymS5QBuEuA75tau9Ul8UDiOy4UD7trtKm3Li9MLwUbvAXCIYbRulWqhhv?=
 =?us-ascii?Q?Yg/AdaVGzlvJACLtnGOe1e3ccrSJq2rT4Pjm6cb26blQhpIMhA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 17:37:45.2833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1688347-94f0-4572-0db1-08dcfdc08eff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6836

As the SoC evolves with each generation, the dynamics between the PMC and
STB layers within the PMC driver are becoming increasingly complex, making
it challenging to manage both in a single file and maintain code
readability.

Additionally, during silicon bringup, the PMC functionality is often
enabled first, with STB functionality added later. This can lead to missed
updates in the driver, potentially causing issues.

To address these challenges, it's beneficial to move all STB-related
changes to a separate file. This approach will better accommodate newer
SoCs, provide improved flexibility for desktop variants, and facilitate
the collection of additional debug information through STB mechanisms.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/Makefile  |  2 +-
 drivers/platform/x86/amd/pmc/mp1_stb.c | 88 ++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmc/pmc.c     | 80 +----------------------
 drivers/platform/x86/amd/pmc/pmc.h     | 19 ++++++
 4 files changed, 109 insertions(+), 80 deletions(-)
 create mode 100644 drivers/platform/x86/amd/pmc/mp1_stb.c

diff --git a/drivers/platform/x86/amd/pmc/Makefile b/drivers/platform/x86/amd/pmc/Makefile
index f1d9ab19d24c..255d94ddf999 100644
--- a/drivers/platform/x86/amd/pmc/Makefile
+++ b/drivers/platform/x86/amd/pmc/Makefile
@@ -4,6 +4,6 @@
 # AMD Power Management Controller Driver
 #
 
-amd-pmc-objs := pmc.o pmc-quirks.o
+amd-pmc-objs := pmc.o pmc-quirks.o mp1_stb.o
 obj-$(CONFIG_AMD_PMC) += amd-pmc.o
 amd-pmc-$(CONFIG_AMD_MP2_STB) += mp2_stb.o
diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
new file mode 100644
index 000000000000..8221def898a5
--- /dev/null
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD MP1 Smart Trace Buffer (STB) Layer
+ *
+ * Copyright (c) 2024, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *          Sanket Goswami <Sanket.Goswami@amd.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <asm/amd_nb.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/uaccess.h>
+
+#include "pmc.h"
+
+/* STB Spill to DRAM Parameters */
+#define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
+
+/* STB Registers */
+#define AMD_PMC_STB_PMI_0		0x03E30600
+
+int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
+{
+	int err;
+
+	err = amd_smn_write(0, AMD_PMC_STB_PMI_0, data);
+	if (err) {
+		dev_err(dev->dev, "failed to write data in stb: 0x%X\n", AMD_PMC_STB_PMI_0);
+		return pcibios_err_to_errno(err);
+	}
+
+	return 0;
+}
+
+int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
+{
+	int i, err;
+
+	for (i = 0; i < FIFO_SIZE; i++) {
+		err = amd_smn_read(0, AMD_PMC_STB_PMI_0, buf++);
+		if (err) {
+			dev_err(dev->dev, "error reading data from stb: 0x%X\n", AMD_PMC_STB_PMI_0);
+			return pcibios_err_to_errno(err);
+		}
+	}
+
+	return 0;
+}
+
+int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
+{
+	u32 phys_addr_low, phys_addr_hi;
+	u64 stb_phys_addr;
+	u32 size = 0;
+	int ret;
+
+	/* Spill to DRAM feature uses separate SMU message port */
+	dev->msg_port = 1;
+
+	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
+	if (size != S2D_TELEMETRY_BYTES_MAX)
+		return -EIO;
+
+	/* Get DRAM size */
+	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
+	if (ret || !dev->dram_size)
+		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
+
+	/* Get STB DRAM address */
+	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, true);
+	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, true);
+
+	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
+
+	/* Clear msg_port for other SMU operation */
+	dev->msg_port = 0;
+
+	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
+	if (!dev->stb_virt_addr)
+		return -ENOMEM;
+
+	return 0;
+}
diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index bbb8edb62e00..e70a56d85ac5 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -40,7 +40,6 @@
 #define AMD_PMC_SCRATCH_REG_1AH		0xF14
 
 /* STB Registers */
-#define AMD_PMC_STB_PMI_0		0x03E30600
 #define AMD_PMC_STB_S2IDLE_PREPARE	0xC6000001
 #define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
 #define AMD_PMC_STB_S2IDLE_CHECK	0xC6000003
@@ -52,9 +51,7 @@
 #define AMD_S2D_REGISTER_ARGUMENT	0xA88
 
 /* STB Spill to DRAM Parameters */
-#define S2D_TELEMETRY_BYTES_MAX		0x100000U
 #define S2D_RSVD_RAM_SPACE		0x100000
-#define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
 
 /* STB Spill to DRAM Message Definition */
 #define STB_FORCE_FLUSH_DATA		0xCF
@@ -97,7 +94,6 @@
 
 #define DELAY_MIN_US		2000
 #define DELAY_MAX_US		3000
-#define FIFO_SIZE		4096
 
 enum amd_pmc_def {
 	MSG_TEST = 0x01,
@@ -105,14 +101,6 @@ enum amd_pmc_def {
 	MSG_OS_HINT_RN,
 };
 
-enum s2d_arg {
-	S2D_TELEMETRY_SIZE = 0x01,
-	S2D_PHYS_ADDR_LOW,
-	S2D_PHYS_ADDR_HIGH,
-	S2D_NUM_SAMPLES,
-	S2D_DRAM_SIZE,
-};
-
 struct amd_pmc_stb_v2_data {
 	size_t size;
 	u8 data[] __counted_by(size);
@@ -162,9 +150,6 @@ module_param(dump_custom_stb, bool, 0644);
 MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
 
 static struct amd_pmc_dev pmc;
-static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
-static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
-static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
 
 static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
 {
@@ -683,7 +668,7 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 	dev_dbg(dev->dev, "AMD_%s_REGISTER_MESSAGE:%x\n", dev->msg_port ? "S2D" : "PMC", value);
 }
 
-static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
+int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
 {
 	int rc;
 	u32 val, message, argument, response;
@@ -975,69 +960,6 @@ static const struct pci_device_id pmc_pci_ids[] = {
 	{ }
 };
 
-static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
-{
-	u32 phys_addr_low, phys_addr_hi;
-	u64 stb_phys_addr;
-	u32 size = 0;
-	int ret;
-
-	/* Spill to DRAM feature uses separate SMU message port */
-	dev->msg_port = 1;
-
-	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
-	if (size != S2D_TELEMETRY_BYTES_MAX)
-		return -EIO;
-
-	/* Get DRAM size */
-	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
-	if (ret || !dev->dram_size)
-		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
-
-	/* Get STB DRAM address */
-	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, true);
-	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, true);
-
-	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
-
-	/* Clear msg_port for other SMU operation */
-	dev->msg_port = 0;
-
-	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
-	if (!dev->stb_virt_addr)
-		return -ENOMEM;
-
-	return 0;
-}
-
-static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
-{
-	int err;
-
-	err = amd_smn_write(0, AMD_PMC_STB_PMI_0, data);
-	if (err) {
-		dev_err(dev->dev, "failed to write data in stb: 0x%X\n", AMD_PMC_STB_PMI_0);
-		return pcibios_err_to_errno(err);
-	}
-
-	return 0;
-}
-
-static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
-{
-	int i, err;
-
-	for (i = 0; i < FIFO_SIZE; i++) {
-		err = amd_smn_read(0, AMD_PMC_STB_PMI_0, buf++);
-		if (err) {
-			dev_err(dev->dev, "error reading data from stb: 0x%X\n", AMD_PMC_STB_PMI_0);
-			return pcibios_err_to_errno(err);
-		}
-	}
-
-	return 0;
-}
-
 static int amd_pmc_probe(struct platform_device *pdev)
 {
 	struct amd_pmc_dev *dev = &pmc;
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index f1166d15c856..ffc9eaf8a522 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -14,6 +14,14 @@
 #include <linux/types.h>
 #include <linux/mutex.h>
 
+enum s2d_arg {
+	S2D_TELEMETRY_SIZE = 0x01,
+	S2D_PHYS_ADDR_LOW,
+	S2D_PHYS_ADDR_HIGH,
+	S2D_NUM_SAMPLES,
+	S2D_DRAM_SIZE,
+};
+
 struct amd_mp2_dev {
 	void __iomem *mmio;
 	void __iomem *vslbase;
@@ -70,4 +78,15 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
 #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
 #define PCI_DEVICE_ID_AMD_MP2_STB	0x172c
 
+/* STB Spill to DRAM Parameters */
+#define S2D_TELEMETRY_BYTES_MAX		0x100000U
+
+/* STB Spill to DRAM Message Definition */
+#define FIFO_SIZE		4096
+
+int amd_pmc_s2d_init(struct amd_pmc_dev *dev);
+int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
+int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
+int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
+
 #endif /* PMC_H */
-- 
2.34.1

