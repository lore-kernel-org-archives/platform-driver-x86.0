Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010009.outbound.protection.outlook.com [52.101.201.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123172FC87F
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Oct 2025 11:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760439806; cv=fail; b=gtp7Y2dgSGMSCLHp/tClCw861OfstCcG09OG3dLuTZ7uIVkr7MoHfOLcZB5K6tuUsPXVMRij8gEuoYsn2BxZVw9VZ/4ksB8BcGOWtAy73jPsXLGw1Tma78tsQ4GWCwLnw7nM6Ip/BayDDrefs1xHX/fANF+A2HUfn55z47U6Zpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760439806; c=relaxed/simple;
	bh=0R8N0IBSsoZckDy8c+eWcr6NM5GkTT2XcPOJU6bcNGg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sNGEj7Zw9cGwSX47xldWw9dAwcG0nO7DmOhnQlOGeC3vMdZk6TFhZNKmXol6DdLI8dygRt+IW0Gea9eV6Q5e2CvNmxX+6hCXYDZbfmiExdouUfObw9wp7Rhtq90WQO4RajPeca6vdNDTZhB09fqRmBW2hVPaF7usPXTqc9lWFOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rxG0BTGp; arc=fail smtp.client-ip=52.101.201.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rxG0BTGp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/+8fIi6efMZqc8dx+KdEzLDbEvVUXWWoxFK0EptYgkXP62QLR6JMD4SX3zQ67yUnusW1byNY9FEYk31Lk4cOWLhYSRuLzVmD/XSm1j9pEc9KJS8rkQZ25Sy60kAFJmQooa29iUA5Cxho7qF9pAQmXZU5rQPHavTANzwYW2E+v3V5P7Ci5LyunIgu8yvgGO/L5gRTOKu+Ksb4crqxY/B6LPLOe/SglYmxcW4v8RnlQZfs7bEf/EwFzMv4gj3wrnW2VU06axZCt9ny1xFXZLSoCXOlndAcysyH4GIBb+JoPmPiD1kwIWxTk5XZivObZdt7c9TYvrAE+DRkTNJHDhqmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1qSW3ZjqysFT9x8FYK3LGfLEjHT3J6pRUcITA2U+ME=;
 b=wBh47goawH3wAr2TqvXTzUft8dGcS2/P01z/zHrjf4Ep0LtPcbhB1UlhUwIuChHGq2XviAV6pJtPR1dvhBr5NoL2T4Ed2mh7jmx1ISP03HSB7/8aYoNzeMYHOPVi3ER1Wq8bq6BgZrhk4zlLGFH/rDHv2vKuTfUenwVSRi6DLpPQJvllUoBfMCbebBi4t82WM3jg7BGPFdN+wLkAyNKawrwdILPVtEVsLf5HEtnSG0MX2YhwxnTjv+z+xLMZ/8lFlOzxcxDcd9v7g/XWcpaeKZE9qxSPi/kiVpqEjaIjCdcXYcL0zXOMpmpetC0nXGq/xFnnH/UgQZBZpGEv701/5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1qSW3ZjqysFT9x8FYK3LGfLEjHT3J6pRUcITA2U+ME=;
 b=rxG0BTGpVnojyYnAx3qyakDS+07ZwZeEgLWdF9sL1+WQXshviHUDfax0l3igMCUvh+aI5ZQgNhqth3HFez/q7HOFha4iGEpKY5JBZi8S+w0BMab1WW85PXZta0PLsZpKxlYdU8yUw2xMzx1L1VaZpE2WVdtnCXDeBJGWdYes/C0=
Received: from BLAPR03CA0008.namprd03.prod.outlook.com (2603:10b6:208:32b::13)
 by CH1PPF946CC24FA.namprd12.prod.outlook.com (2603:10b6:61f:fc00::61c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 11:03:20 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:32b:cafe::b) by BLAPR03CA0008.outlook.office365.com
 (2603:10b6:208:32b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Tue,
 14 Oct 2025 11:03:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 11:03:20 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 14 Oct
 2025 04:03:17 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@Dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86/amd/pmf: Use ring buffer to store custom BIOS input values
Date: Tue, 14 Oct 2025 16:31:41 +0530
Message-ID: <20251014110141.1844925-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|CH1PPF946CC24FA:EE_
X-MS-Office365-Filtering-Correlation-Id: d372f8d7-09cc-45bb-4e70-08de0b114936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Cfgp15TbBNNONsDaJq+4vJ5VA5L6R6YbDp09EX12I1VjxNctls5gRb55g682?=
 =?us-ascii?Q?BqiPNl8hWISx9ABj3lB5tcFAYB59j51hpEIQh8H0tB8VYvtjdnT/zzb4fQhp?=
 =?us-ascii?Q?UOeAH7NgIMxvywTIjTQ3fBTxaq9uvVKszYIe6C7qdXW9AsnxOSuyJ3WETQRL?=
 =?us-ascii?Q?oW5qfCmsVS7JqP4GqptPyNaEtGm2GZakoQY+zPHuHiUgkvbil4fitlhy8cMh?=
 =?us-ascii?Q?AxQux4VgSBvb/8qcXJQIphViplphOKpuiPRwwGgYNcrYihZkY77TWmhqynz8?=
 =?us-ascii?Q?yFcoDeVBjfVvXzXLCsOpekQjsGLun8roo6WR8+gsJVpyuWNkhApWY01pdcOb?=
 =?us-ascii?Q?w5S5l2JcdRE7y91zyG/wJXjBBR63PtgoClRQOl9ofT8PgoXBFaXzjQOTUrZR?=
 =?us-ascii?Q?f7spKTyiq6FLAuthMwlUKywotB72UBaPURtA0/vK8ne2zb22MeqzjQGCOxh5?=
 =?us-ascii?Q?QrcCEN2PcShoUuX8ZTCxNbSvb1oXSxxSZYkh0aquViwgwBjRI9NpppCV4ySi?=
 =?us-ascii?Q?QEH5O1DntreHLmPUKGThvK65mMFkoSYiI/llqZh1BTKgDkcTsvJ7ahRYGStF?=
 =?us-ascii?Q?xhwSM4FKpN74b4irEGaeCV+QEt6vUP6uSmw7+q3uOs8eC8Xit8IXbnvkReZo?=
 =?us-ascii?Q?6o7ORLEGb5EzDpyLdX6jinPRHnjXETKmlxOThBl2i53NhS4i3ZPDLGbdRQtJ?=
 =?us-ascii?Q?Cqof5/QZg1rg4yqdJOF8GnUqyNBBvC9OHj+417nhBmeRds75qfz7b713MuUn?=
 =?us-ascii?Q?8zo5kpS1dulVGKtMhEOGDkqnDw+Ib1ikEporDqZd+9BYYod3zdIvKkk6E3D2?=
 =?us-ascii?Q?E7Aaf+criHL1hppWxfDZrcB43fjrvyxsXgXAJV4rEliNwyDDpF7Rulvy5Xam?=
 =?us-ascii?Q?l4wJSgt28dInptWGOjRMmA3FEB+eGj7+JYvFiUbzEg5zZqmOTyk4KBIt6cqQ?=
 =?us-ascii?Q?E9TiauPxrOWFKg8/HeUM0aGDqVnTSUKlTrsRmJLTMiyjvU+6imYQL32kDuhQ?=
 =?us-ascii?Q?ksGBBF29M9SSLJalVrhdA1PlWCOfEQf/U9wQrhERfghRdPJz+egZSINfqRXH?=
 =?us-ascii?Q?wjNUkUxOv5rgeNg+Wbr6ZGQtSk5VmfFEoQPa8PR6IoSp6iWE9NcF+5Pujk+2?=
 =?us-ascii?Q?4lBZ2ggyLA+2rzNGg20NmiocdDzaqCb0gzbNKKOjhGUKrG17pamCrdTJAk4U?=
 =?us-ascii?Q?RuWbsBh0eJbb6eYkYSiN5HETC/gejHrupb7sWKlcBkx8YDZ0P6aKCZVqVfyN?=
 =?us-ascii?Q?M0/HG1pMkrYYYvhmsiRqotHiYURA30+n/RnRbpH1R/dkEXzG364Ta3cnOYQt?=
 =?us-ascii?Q?bgw705DY4g5W11o4E+IzeNv6yo6PSfR6zJ+Vi+kKGzKK4/OzsTId3mDaUsLD?=
 =?us-ascii?Q?5/Fxpm4Q8xIS/pwMbua8CA4oo0uG9jsHX4cplIYF7y74gTczGH8/efbUd1IJ?=
 =?us-ascii?Q?jLdCk1Hw/QcxTLwiKALVRH/l7/PcRAloTShzI4VwNZJmWtAGb7/t2qk8Bl0s?=
 =?us-ascii?Q?ylaXNlNRmYgEzDHBm9FpgauUHNB0T5ZyPLdvhFnL3e2iiKbHocEokDCCyQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 11:03:20.3398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d372f8d7-09cc-45bb-4e70-08de0b114936
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF946CC24FA

Custom BIOS input values can be updated by multiple sources, such as power
mode changes and sensor events, each triggering a custom BIOS input event.
When these events occur in rapid succession, new data may overwrite
previous values before they are processed, resulting in lost updates.

To address this, introduce a fixed-size, power-of-two ring buffer to
capture every custom BIOS input event, storing both the pending request
and its associated input values. Access to the ring buffer is synchronized
using a mutex.

The previous use of memset() to clear the pending request structure after
each event is removed, as each BIOS input value is now copied into the
buffer as a snapshot. Consumers now process entries directly from the ring
buffer, making explicit clearing of the pending request structure
unnecessary.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c   | 40 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c   |  2 ++
 drivers/platform/x86/amd/pmf/pmf.h    | 20 ++++++++++++++
 drivers/platform/x86/amd/pmf/spc.c    | 24 ++++++++++------
 drivers/platform/x86/amd/pmf/tee-if.c |  2 ++
 5 files changed, 79 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 13c4fec2c7ef..8a5eb3eeba55 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -331,6 +331,42 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
 									 req, sizeof(*req));
 }
 
+/* Store custom BIOS inputs data in ring buffer */
+static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
+{
+	struct cbi_ring_buffer *rb = &pmf_dev->cbi_buf;
+	struct bios_input_entry entry = { };
+	int i;
+
+	guard(mutex)(&pmf_dev->rb_mutex);
+
+	switch (pmf_dev->cpu_id) {
+	case AMD_CPU_ID_PS:
+		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_v1); i++)
+			entry.val[i] = pmf_dev->req1.custom_policy[i];
+		entry.preq = pmf_dev->req1.pending_req;
+		break;
+	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
+		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
+			entry.val[i] = pmf_dev->req.custom_policy[i];
+		entry.preq = pmf_dev->req.pending_req;
+		break;
+	default:
+		return;
+	}
+
+	if (CIRC_SPACE(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RB_SZ) > 0) {
+		rb->data[rb->head] = entry;
+		rb->head = (rb->head + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
+	} else {
+		/* Rare case: ensures the newest BIOS input value is kept */
+		rb->data[rb->head] = entry;
+		rb->head = (rb->head + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
+		rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
+	}
+}
+
 static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)
 {
 	if (!pdev->cb_flag)
@@ -356,6 +392,8 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
 	dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.pending_req);
 
 	amd_pmf_handle_early_preq(pmf_dev);
+
+	amd_pmf_custom_bios_inputs_rb(pmf_dev);
 }
 
 static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
@@ -374,6 +412,8 @@ static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
 	dev_dbg(pmf_dev->dev, "Pending request (preq1): 0x%x\n", pmf_dev->req1.pending_req);
 
 	amd_pmf_handle_early_preq(pmf_dev);
+
+	amd_pmf_custom_bios_inputs_rb(pmf_dev);
 }
 
 static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index bc544a4a5266..98aa9712b7f6 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -468,6 +468,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	mutex_init(&dev->lock);
 	mutex_init(&dev->update_mutex);
 	mutex_init(&dev->cb_mutex);
+	mutex_init(&dev->rb_mutex);
 
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
@@ -494,6 +495,7 @@ static void amd_pmf_remove(struct platform_device *pdev)
 	mutex_destroy(&dev->lock);
 	mutex_destroy(&dev->update_mutex);
 	mutex_destroy(&dev->cb_mutex);
+	mutex_destroy(&dev->rb_mutex);
 }
 
 static const struct attribute_group *amd_pmf_driver_groups[] = {
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index bd19f2a6bc78..31dfd671f44b 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -12,6 +12,7 @@
 #define PMF_H
 
 #include <linux/acpi.h>
+#include <linux/circ_buf.h>
 #include <linux/input.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
@@ -119,6 +120,7 @@ struct cookie_header {
 
 #define APTS_MAX_STATES		16
 #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
+#define CUSTOM_BIOS_INPUT_RB_SZ	64	/* Must be power of two for CIRC_* macros */
 
 typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
 
@@ -358,6 +360,22 @@ struct pmf_bios_inputs_prev {
 	u32 custom_bios_inputs[10];
 };
 
+/**
+ * struct bios_input_entry - Snapshot of custom BIOS input event
+ * @val: Array of custom BIOS input values
+ * @preq: Pending request value associated with this event
+ */
+struct bios_input_entry {
+	u32 val[10];
+	u32 preq;
+};
+
+struct cbi_ring_buffer {
+	struct bios_input_entry data[CUSTOM_BIOS_INPUT_RB_SZ];
+	int head;
+	int tail;
+};
+
 struct amd_pmf_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -406,6 +424,8 @@ struct amd_pmf_dev {
 	struct apmf_sbios_req_v1 req1;
 	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
 	bool cb_flag;			     /* To handle first custom BIOS input */
+	struct cbi_ring_buffer cbi_buf;
+	struct mutex rb_mutex;		     /* Protects ring buffer access */
 };
 
 struct apmf_sps_prop_granular_v2 {
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 85192c7536b8..436ecbf07aec 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -150,14 +150,26 @@ static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req
 static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 					   struct ta_pmf_enact_table *in)
 {
+	struct cbi_ring_buffer *rb = &pdev->cbi_buf;
+	struct bios_input_entry entry = { };
 	unsigned int i;
 
+	guard(mutex)(&pdev->rb_mutex);
+
 	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
 		amd_pmf_set_ta_custom_bios_input(in, i, pdev->cb_prev.custom_bios_inputs[i]);
 
-	if (!(pdev->req.pending_req || pdev->req1.pending_req))
+	if (CIRC_CNT(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RB_SZ) == 0)
+		return;	/* return if ring buffer is empty */
+
+	entry = rb->data[rb->tail];
+
+	/* If no active custom BIOS input pending request, do not consume further work */
+	if (!entry.preq)
 		return;
 
+	rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
+
 	if (!pdev->smart_pc_enabled)
 		return;
 
@@ -165,20 +177,14 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 	case PMF_IF_V1:
 		if (!is_apmf_bios_input_notifications_supported(pdev))
 			return;
-		amd_pmf_update_bios_inputs(pdev, pdev->req1.pending_req, custom_bios_inputs_v1,
-					   pdev->req1.custom_policy, in);
+		amd_pmf_update_bios_inputs(pdev, entry.preq, custom_bios_inputs_v1, entry.val, in);
 		break;
 	case PMF_IF_V2:
-		amd_pmf_update_bios_inputs(pdev, pdev->req.pending_req, custom_bios_inputs,
-					   pdev->req.custom_policy, in);
+		amd_pmf_update_bios_inputs(pdev, entry.preq, custom_bios_inputs, entry.val, in);
 		break;
 	default:
 		break;
 	}
-
-	/* Clear pending requests after handling */
-	memset(&pdev->req, 0, sizeof(pdev->req));
-	memset(&pdev->req1, 0, sizeof(pdev->req1));
 }
 
 static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_enact_table *in)
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 6e8116bef4f6..add742e33e1e 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -579,6 +579,8 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 		status = ret == TA_PMF_TYPE_SUCCESS;
 		if (status) {
 			dev->cb_flag = true;
+			dev->cbi_buf.head = 0;
+			dev->cbi_buf.tail = 0;
 			break;
 		}
 		amd_pmf_tee_deinit(dev);
-- 
2.34.1

