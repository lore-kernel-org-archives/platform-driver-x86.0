Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012004.outbound.protection.outlook.com [52.101.53.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACBC8F5B
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 08:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763542735; cv=fail; b=WRvlMuR76Outkn0eu173AbWPKM5OG1zENWYruNrzwPEsKwykRt/+wGysy1EDFbNmBrOzxypb9clRGF8NHZtyNaxh5Y3YTL8IuECThabamXn6XR4kTkpsYJyTG8qIBmZ7igyX/dpydYnidYPrljBJsd+A3W9Ow40L3xnU9l174e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763542735; c=relaxed/simple;
	bh=0p6wJyOFzxq/yDWDkxNCk6LYBkm8PsrMiXOGbKujwDo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rw/W5qjxwXoxN4wvQj/I7OUSSkKG3a159HXswi56riA0qinkTP/LfG7HFvABFu1Pvqhjs1lSrwxiebxmb4TfPIxD+9ma5mjs47TKV1QT2zKRiOWSx1Z4RBRTcH8eEv6vv1PkjEvSd+5qRSMngRrzfYSMi9tmfwRREIZaILkCoyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pOBkDw/J; arc=fail smtp.client-ip=52.101.53.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pOBkDw/J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VBIZAkcyz4SbRsd4Umhl7p9hMD2hEslEAYjPa/dxm/Li4TM5iObT1XIGa5sWmnwpuokdZatrbwJbGg0nT+oyGIMguwPfUClg29sSvlvS5bxEaU4aGzRvp7KbIfhGy41kRkQsUFMikfVqo3HaKP6u8mB6dkRlglAE7JWJitPV2swjfz16XKjBd/AV5bGCTom0Kfg5u/9IgoweAA8ZxRkZwJS5rjg+YfS6xYvVU6JGfuB6qmt334J12dq1koLxaKx1qVSotqnONXbIFKPmZkAzFftdC+qA3rX9ZE8fOv9NTNJ1Mw00W+X/d8Q2ctm3k368nYpp35bZbAPC90qwyeCcUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgfC2kuBk9AZBHWrDDV9qC3UfRsT6E4q3NfKKW9yooY=;
 b=XYVwXmoreucR+PmGAeJhJG/KdHcpB4wJ3oYcmgyt882xFK7eTYWXBhE+CLlmlui4FBUzKZyO9BtDZZY8OXEGJyuDIaMAi9clt/kp1f6qPzPwrUZzLyYoj2bEVwv9FA+n83WOk7uUuvVYxighoh4c1PpuyEcv4HLFgVisE8MBWn66Zb6RqkbKnCjkke0ntVRl2FgYMA3CUpue2Ic9vYFPXmdrH92H94+BtkTHnl/1j3c3SaMXvDDm34f8petsqLkDYmg341mOzfs9329aKB2y95Y/MnUmLQtbZts3Y6qL5JzsQ1p56vs2ot8+MN0KrR3PBt1RHGIj0Geixu5AAnxaIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgfC2kuBk9AZBHWrDDV9qC3UfRsT6E4q3NfKKW9yooY=;
 b=pOBkDw/Jgba5ZCQY+An13yMS1fAEJhw8QoUahw7uMEQkJM0KNoJ/wd8p0wkmeajKfG+gclul4A8IGwPWcqb5Q8BuRJ2b1rbbDme8qmVPXxzIjYsRcJvWOgTb57BbG6edSBnnH1NRl48/pcscNOiS7gPfOOy9v94zzSV4dJruYlQ=
Received: from BL0PR0102CA0042.prod.exchangelabs.com (2603:10b6:208:25::19) by
 MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 08:58:47 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:25:cafe::4c) by BL0PR0102CA0042.outlook.office365.com
 (2603:10b6:208:25::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 08:59:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 08:58:47 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 19 Nov
 2025 00:58:45 -0800
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<superm1@kernel.org>, "Yijun Shen" <Yijun.Shen@Dell.com>
Subject: [PATCH v4 3/3] platform/x86/amd/pmf: Use ring buffer to store custom BIOS input values
Date: Wed, 19 Nov 2025 14:28:13 +0530
Message-ID: <20251119085813.546813-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251119085813.546813-1-Shyam-sundar.S-k@amd.com>
References: <20251119085813.546813-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|MN2PR12MB4110:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e0b6595-3643-4061-c1a9-08de2749da20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9ak/heFzUkB1Xu7w4VSZU+ym+hKcrTFeIoXkKHFhm7MKZVs4xj7wGlqzaVaL?=
 =?us-ascii?Q?8E5LcE9KhHhy/xW9Oc7qLKm/uwZY/L2fehsJDX3n/EoYGguI4xPccZIRF+sC?=
 =?us-ascii?Q?Ge/hHKK5JsbqBPmPs8tmXdijGLiq++PRfSv0TSBqV4gSnJIe2kahwGuiD5HI?=
 =?us-ascii?Q?7txv2XQBQab3pD8Th0gPUqEzosW8Rf0nQkAkOCtyl2UcdpwhYKPBqnA8U5Vv?=
 =?us-ascii?Q?yb9WQRZni+OuTVye7TH6GiysY1bDhgAn98HsmQTysFef4/OR/BWSztwDtrjX?=
 =?us-ascii?Q?QQ4zm7N8+ETpRUL3Nbd0Ua26yhPNfKMmdOS5E2zG86cybYr9mjUpLdiPls5I?=
 =?us-ascii?Q?aVWg7F9zEgVXtpEzvpyvxpb6FpBlA4bsuky9AD0QFRr0B/GluCo+urct3mjZ?=
 =?us-ascii?Q?aiphv0fkz1nDKiFEIveI94j1b42tM+Itx9z/xo0yN3F38lGN+y2TLi8qYVH8?=
 =?us-ascii?Q?Ys7IAQWpYOiNtYupRPY9HtIqaanMOeWy7g7p+Dgm3wZKEqD6NNh4NUFUDbr0?=
 =?us-ascii?Q?AsR2tosNIgi5JsD+mJ1sJtC0PyDPIGUrI7meC2vwNe3d/2fsOa70lb3CVX93?=
 =?us-ascii?Q?lypoROPu6rfl/G0HFVLWyOCoyxz+LAL9qgRqPS5BixgW6Za8u8wd1STi0+Kl?=
 =?us-ascii?Q?k0RC/HbqJ3v/fwNF2wvDfafPwNatow3CAuHvg//enKVQlAsjn/6Pmju4Gl4p?=
 =?us-ascii?Q?6Q+SMnX2Jug6PdB5XcVbQ1FnqTkWAqsnjGxw3tutXpCHzUaGWy9LXgSU3Ddp?=
 =?us-ascii?Q?FB9KYa8sHw2pSkOO/JZe84r9SnMhDxl/eSl/44XAKuInTLX3fr5/Oid88u8B?=
 =?us-ascii?Q?QXPc26gWQYyzQ5tn1N7aouv6X1rIEZV8SkVdAIkr8DzuDpXKu0jufEYfnK6a?=
 =?us-ascii?Q?Mf7iRJZ/vxutYWpH8uGcbLYVhs4f1Zvr9BigEjrbUm4/R1RqPZTkRGhflL4j?=
 =?us-ascii?Q?F8tRe6hm+jU+o+kJ2qREBqLkOCR93RrtQUMNrFl1AH9ruqf3kuoinuK1nWbI?=
 =?us-ascii?Q?bq8SXk1hZs8zj/WYmQ1wJZOyQ4oDPRcNGHuQyRQkIzdaJe2I3VGS+356+oL0?=
 =?us-ascii?Q?/5Kr58W53PCTY7cVn8c7Edn9oFzCSEZLsp/eFYuYsnTD8VlcBxflSo0Cwjq4?=
 =?us-ascii?Q?0OA3TxJ8iolrqEW1skClbXbn7qjznMSx72gOJQpPqwYTSe+3jw2NEcKyrRpI?=
 =?us-ascii?Q?Zd/vgulytudqIX1vX+0AliydqeGrwPHZt+En3MsbAt+n3FUa5tYUFsZ1jri5?=
 =?us-ascii?Q?jVCPTeflNCisU2G/wVwpRchdh+9o//KQsZITd09uT+/VXbO6g/t4IDkZsZtT?=
 =?us-ascii?Q?ff/PPmYNWKMnaVPZg5lkvYbOJ0lEyKq8wcgHg+UHvz2zT/bMtGNc87JMLDZ0?=
 =?us-ascii?Q?xWIeLkC6rsV8dmh6VMf2R7YHRLIzR+H5P5XdoI4PFhMEIWruiq5139uswXuC?=
 =?us-ascii?Q?K+A9G9b2JKgPDTcqteFyaMTPyLbarSwvuYs5vvroK2/lwzx4mUXJZ6AKQDkw?=
 =?us-ascii?Q?0LA311KxJQ3ew0y8JiyYPLFt0EwN7qOMAcokaMUYXfBW9GWiZlBZR+38GJ+B?=
 =?us-ascii?Q?qP3ot8I1Uas48LJTHrg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 08:58:47.8433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0b6595-3643-4061-c1a9-08de2749da20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110

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

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v4:
 - Do not store local copy of the ring buffer
 - use devm_mutex_init()

v3:
 - include headers wherever missing
 - use dev_warn() instead of dev_WARN_ONCE()
 - remove generic struct names
 - enhance ringbuffer mechanism to handle common path
 - other cosmetic remarks

v2:
 - Add dev_WARN_ONCE()
 - Change variable name rb_mutex to cbi_mutex
 - Move tail increment logic above pending request check

 drivers/platform/x86/amd/pmf/acpi.c   | 40 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c   |  5 ++++
 drivers/platform/x86/amd/pmf/pmf.h    | 21 ++++++++++++++
 drivers/platform/x86/amd/pmf/spc.c    | 32 +++++++++++----------
 drivers/platform/x86/amd/pmf/tee-if.c |  2 ++
 5 files changed, 86 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 13c4fec2c7ef..3d94b03cf794 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -9,6 +9,9 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/array_size.h>
+#include <linux/cleanup.h>
+#include <linux/dev_printk.h>
 #include "pmf.h"
 
 #define APMF_CQL_NOTIFICATION  2
@@ -331,6 +334,39 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
 									 req, sizeof(*req));
 }
 
+/* Store custom BIOS inputs data in ring buffer */
+static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
+{
+	struct pmf_cbi_ring_buffer *rb = &pmf_dev->cbi_buf;
+	int i;
+
+	guard(mutex)(&pmf_dev->cbi_mutex);
+
+	switch (pmf_dev->cpu_id) {
+	case AMD_CPU_ID_PS:
+		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_v1); i++)
+			rb->data[rb->head].val[i] = pmf_dev->req1.custom_policy[i];
+		rb->data[rb->head].preq = pmf_dev->req1.pending_req;
+		break;
+	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
+		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
+			rb->data[rb->head].val[i] = pmf_dev->req.custom_policy[i];
+		rb->data[rb->head].preq = pmf_dev->req.pending_req;
+		break;
+	default:
+		return;
+	}
+
+	if (CIRC_SPACE(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RING_ENTRIES) == 0) {
+		/* Rare case: ensures the newest BIOS input value is kept */
+		dev_warn(pmf_dev->dev, "Overwriting BIOS input value, data may be lost\n");
+		rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
+	}
+
+	rb->head = (rb->head + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
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
index 2ec4cb92e34f..71421a5d7afd 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -11,6 +11,7 @@
 #include <linux/debugfs.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/power_supply.h>
@@ -477,6 +478,10 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	err = devm_mutex_init(dev->dev, &dev->cbi_mutex);
+	if (err)
+		return err;
+
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
 	amd_pmf_dbgfs_register(dev);
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 2145df4128cd..5a18b3604b6e 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -12,7 +12,9 @@
 #define PMF_H
 
 #include <linux/acpi.h>
+#include <linux/circ_buf.h>
 #include <linux/input.h>
+#include <linux/mutex_types.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
 
@@ -120,6 +122,7 @@ struct cookie_header {
 #define APTS_MAX_STATES		16
 #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
 #define BIOS_INPUTS_MAX		10
+#define CUSTOM_BIOS_INPUT_RING_ENTRIES	64	/* Must be power of two for CIRC_* macros */
 
 typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
 
@@ -359,6 +362,22 @@ struct pmf_bios_inputs_prev {
 	u32 custom_bios_inputs[BIOS_INPUTS_MAX];
 };
 
+/**
+ * struct pmf_bios_input_entry - Snapshot of custom BIOS input event
+ * @val: Array of custom BIOS input values
+ * @preq: Pending request value associated with this event
+ */
+struct pmf_bios_input_entry {
+	u32 val[BIOS_INPUTS_MAX];
+	u32 preq;
+};
+
+struct pmf_cbi_ring_buffer {
+	struct pmf_bios_input_entry data[CUSTOM_BIOS_INPUT_RING_ENTRIES];
+	int head;
+	int tail;
+};
+
 struct amd_pmf_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -407,6 +426,8 @@ struct amd_pmf_dev {
 	struct apmf_sbios_req_v1 req1;
 	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
 	bool cb_flag;			     /* To handle first custom BIOS input */
+	struct pmf_cbi_ring_buffer cbi_buf;
+	struct mutex cbi_mutex;		     /* Protects ring buffer access */
 };
 
 struct apmf_sps_prop_granular_v2 {
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 85192c7536b8..34fff41b86fe 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -11,6 +11,7 @@
 
 #include <acpi/button.h>
 #include <linux/amd-pmf-io.h>
+#include <linux/cleanup.h>
 #include <linux/power_supply.h>
 #include <linux/units.h>
 #include "pmf.h"
@@ -132,30 +133,37 @@ static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int
 	}
 }
 
-static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req,
+static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, struct pmf_bios_input_entry *data,
 				       const struct amd_pmf_pb_bitmap *inputs,
-				       const u32 *custom_policy, struct ta_pmf_enact_table *in)
+				       struct ta_pmf_enact_table *in)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
-		if (!(pending_req & inputs[i].bit_mask))
+		if (!(data->preq & inputs[i].bit_mask))
 			continue;
-		amd_pmf_set_ta_custom_bios_input(in, i, custom_policy[i]);
-		pdev->cb_prev.custom_bios_inputs[i] = custom_policy[i];
-		dev_dbg(pdev->dev, "Custom BIOS Input[%d]: %u\n", i, custom_policy[i]);
+		amd_pmf_set_ta_custom_bios_input(in, i, data->val[i]);
+		pdev->cb_prev.custom_bios_inputs[i] = data->val[i];
+		dev_dbg(pdev->dev, "Custom BIOS Input[%d]: %u\n", i, data->val[i]);
 	}
 }
 
 static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 					   struct ta_pmf_enact_table *in)
 {
+	struct pmf_cbi_ring_buffer *rb = &pdev->cbi_buf;
 	unsigned int i;
 
+	guard(mutex)(&pdev->cbi_mutex);
+
 	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
 		amd_pmf_set_ta_custom_bios_input(in, i, pdev->cb_prev.custom_bios_inputs[i]);
 
-	if (!(pdev->req.pending_req || pdev->req1.pending_req))
+	if (CIRC_CNT(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RING_ENTRIES) == 0)
+		return;	/* return if ring buffer is empty */
+
+	/* If no active custom BIOS input pending request, do not consume further work */
+	if (!rb->data[rb->tail].preq)
 		return;
 
 	if (!pdev->smart_pc_enabled)
@@ -165,20 +173,16 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 	case PMF_IF_V1:
 		if (!is_apmf_bios_input_notifications_supported(pdev))
 			return;
-		amd_pmf_update_bios_inputs(pdev, pdev->req1.pending_req, custom_bios_inputs_v1,
-					   pdev->req1.custom_policy, in);
+		amd_pmf_update_bios_inputs(pdev, &rb->data[rb->tail], custom_bios_inputs_v1, in);
 		break;
 	case PMF_IF_V2:
-		amd_pmf_update_bios_inputs(pdev, pdev->req.pending_req, custom_bios_inputs,
-					   pdev->req.custom_policy, in);
+		amd_pmf_update_bios_inputs(pdev, &rb->data[rb->tail], custom_bios_inputs, in);
 		break;
 	default:
 		break;
 	}
 
-	/* Clear pending requests after handling */
-	memset(&pdev->req, 0, sizeof(pdev->req));
-	memset(&pdev->req1, 0, sizeof(pdev->req1));
+	rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
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

