Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011012.outbound.protection.outlook.com [52.101.52.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4DA2E7166
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Nov 2025 11:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762513305; cv=fail; b=i7wLKYDol4nEFD/Df9Cv/JlX7fLJhgaqcOrpU6RtwCrfiruNyoYH1QjmNMk3Fs+oUmu3CtWVctxKtsB+TjpjYnB+Bc9mQfSIu5/BslvAeiEVFK/xnDrCB8Yz7BmkV4yOw1OY0v1Qxb74EgczYvrAsBcG5XuCDBJ/U7VY0D/M9i0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762513305; c=relaxed/simple;
	bh=h7U/ezu5OhuH3Lw2rc43Oy7e1OZwyQeUJ0v/MG6kDuY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H0hN2KuVpiDHx5Fnez8stC5DjxdIH7BFX7iejoSF0H8QfAkl4j5QxEn5anMFtmBdhs/lkGl3KTJh1cXSanSzFoSq6iNZpBZslEpGEdd7tePDb28UtsMzxF47ap9jBcahlFuONcSZ+b6tzMc3u3SR2KJP6/9W0oxZPMO4tselV/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fuzy825P; arc=fail smtp.client-ip=52.101.52.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fuzy825P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ly274rO4WC9R3gwyEh+IsYG1JaR22eEoQwlV1s3Q45msLbTPCFSzYnFHeODVpCKGk1eJNu5hSP4FxyeivdLdq4pJH3jFGmeKoRqq7LBEB8MyiWLj7s9ipMtYNGIH/iHMUlmyPhu5GyWPDFePaSRvZ3ftL8V+3R/aqv3VpdbHqfEP5lyFfr+/+rdak+Ithf1jOnPBFrORS/GUyZR1VW5mwwEtFsma324fJHTxNcvZ9aBe+0QeLdyxcgMk1p9lDDOrdAi6HY1t2mpSjuWmFUIlUEivcBHeyX7El46Y9EpKtOvjeQSbBN/2cFl5DLrk2BkpsHoStP7Zo5/SkJEbNHf/uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ee3fVvM1Gwiw0VDIPTvpB3lPHX+WP2KsTtvsf9DMw74=;
 b=AZWkLjQ2qvjRndtTlkPB57TeE3OzjrIcqJpjgXlHCqRrjEYVKLIoDXd53a3BLXeGMtm+UC68GAsoBE4KV7LwGgRJLR5SfIGmrB0fTKXSR40G0tKqSyhAPWzRqUD0qNV6+GkwHOPeSwCLSLIQZVTM2CfYJWZGnP7ScedHt4MbLEhRRoqL9q4tIDEN5CHIO20TM6yV7HLiZ+Evbt3rT//Ei3srVzSMag9nVSiy0/KVCu/SSfR3DDqMbNZ/eURNdzeK0zw5GL0i7mgatudlKa2PIkodiXWBfDA9avjQkPMa9wHY2LxPZJvEUikF3KgrNvOc4+71+tS0YALmJubnk0/7WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ee3fVvM1Gwiw0VDIPTvpB3lPHX+WP2KsTtvsf9DMw74=;
 b=fuzy825PEznGenLm0J4NDnFdMxZSIuFtu4uYzPY97n1aWqH2HGAp/Wz+p8WfXuV6yyqsQvpQQX6EwWWdDuiUo8QeOECYFxHRyA8G0ndMzPe0bGdGWGuMgZww8o1CQ21K35uz+DOLIcuMePl/i885LM1/SogH1vXWz6mNu1xQVc0=
Received: from BN9P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::11)
 by BL1PR12MB5946.namprd12.prod.outlook.com (2603:10b6:208:399::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 11:01:40 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:13e:cafe::9f) by BN9P220CA0006.outlook.office365.com
 (2603:10b6:408:13e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.13 via Frontend Transport; Fri,
 7 Nov 2025 11:01:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 11:01:40 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 7 Nov
 2025 03:01:38 -0800
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<superm1@kernel.org>, "Yijun Shen" <Yijun.Shen@Dell.com>
Subject: [PATCH v3 2/2] platform/x86/amd/pmf: Use ring buffer to store custom BIOS input values
Date: Fri, 7 Nov 2025 16:31:05 +0530
Message-ID: <20251107110105.4010694-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251107110105.4010694-1-Shyam-sundar.S-k@amd.com>
References: <20251107110105.4010694-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|BL1PR12MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: f455c5b7-11f1-4cad-fd67-08de1ded0793
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CDIbpsaSeI0tJ2pmR4kvQ0vvnlxQksCQfCdCyj+zFaR4RtuQA26WOVZvUP5R?=
 =?us-ascii?Q?heINkWxhESpRBGJ/T8t1EquSCCN6g90XYrO6LucEZSF5aC3OoGPqFcgVH6FZ?=
 =?us-ascii?Q?Bt40ZcIbOxyD+xDZUefpNP9osdf/DmE9/7MSWzEL3CZd4d2V4TGFcF5wbvif?=
 =?us-ascii?Q?r1ReoydPtGbOLroRhuru3JCU6roMMTyqYp9o4un9fe1CP6CL8tMIHk3yPjNt?=
 =?us-ascii?Q?OxcR/+OQG1wFTDbprXE7FWw7hNb3xQmKtNVA8f93xYrv9ZHVIkzookxF1l+7?=
 =?us-ascii?Q?2IH/QFoaZqk2L7JAVWvWDPdh9B4irT2YpLUOyapysHCxedXl9MsUiBsO4chv?=
 =?us-ascii?Q?708++2gB0vab31cdjQlBusSoby5zFvpm/ozxMaeigZL/JAy96hyWj1dwGvvk?=
 =?us-ascii?Q?h22x7n845ZEeCfo2YQUSxAP/Xy0h2iPWOlOOVpI+VFrEwdVe5m6BHobdXk7q?=
 =?us-ascii?Q?zaJ2hsiI4MxWdciUuVhKJdvS08gBC7314ITk9w6Y8g/9ZyVB5qGVdXQA5xiO?=
 =?us-ascii?Q?M7FbxucntDcd469e+ilR7tXnIl+Cby249fJAv4IsrH+PiHqgGWQff7L/DFHd?=
 =?us-ascii?Q?te4t2gI+TFhaQsfbXYXBzmiMlmVXLRLO8AVU8ItE31tDp8jQRAkFxJWOLQK/?=
 =?us-ascii?Q?XRWwJtbzzoIQdpro22ed7OMBc/AaaEmW7VLt5FOeF9i0Irc/hyERSZyhsf/h?=
 =?us-ascii?Q?q93b+r+coCzEwnzg6105SmYjXKqOl+6sh/f3Y2knE1Aw7SDmqaaNgx0vo2zy?=
 =?us-ascii?Q?B5PeinSGVxyDn5cIs7+++8EgdtQtl4prjICHj2A1fr0ZFP+1aEtzpK6bo3Ya?=
 =?us-ascii?Q?OsO2J4Ifx267hGelcZ1S+MQuLiZ6A+Q/96plyaq1YdBgbuTLm/wYQ0PAo33m?=
 =?us-ascii?Q?GdGJt2velmlCz0BGGYDR3yGBUk0jLE5pNssICrGqm7EGJowE2dp87u6Gc931?=
 =?us-ascii?Q?ASOEsQK52gzlQ9mLwSLADU0jX/GpUEhy65eV9AEZCh/MMMwo0xeWiI5R39yR?=
 =?us-ascii?Q?0EraSkP+FRCg7hLO1O65bnW2cjBk4twXY9fymIl/KztCPUIa4jX0VLgTx/7E?=
 =?us-ascii?Q?ytasmD2MkvjV8SXTjeQB+XkcmOsqw/lUGEL3oN5RKDdPzgcEFG9L27wCLs2w?=
 =?us-ascii?Q?3cBqD1W9+wyn5esVMZRqJnSh2rrA12VlD63iOwbpsCqjOz2x2bQgeRkBpJbC?=
 =?us-ascii?Q?0WahpqxqSVvihkL+AvHT/dQOnZoh49Av/RJJYMvOy2XA4VYkb35p/3zN9Qu+?=
 =?us-ascii?Q?aswb8kpysRLiXRPj79bYxY42NZGxD7yER47kspqtIATjbAUIMXIPGxrAjiza?=
 =?us-ascii?Q?yxd6GPG84iq0jShSttm0D746+zfVwXUylB9AhzyVtPBDcu85nRIXzEhw9eiC?=
 =?us-ascii?Q?jSwPOH8Zy5+XeyPJXwdO8DAuYYC2GPdICYk6m+x62WnibnohwbsZekkLUPZn?=
 =?us-ascii?Q?L0WfTnnENcgM2NWllU7r5tAVVeOqY59on0ZazDLTIodZdvEzT9S+32nTfC/0?=
 =?us-ascii?Q?A5wix/1Gb8MJlbpMjBexuf0UzDicfoZXXFFTj/lQhQoE+qrNifcJ+d5RfruH?=
 =?us-ascii?Q?ywzO+kzD/Ct8+KDokHo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 11:01:40.4364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f455c5b7-11f1-4cad-fd67-08de1ded0793
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5946

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

 drivers/platform/x86/amd/pmf/acpi.c   | 42 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c   |  3 ++
 drivers/platform/x86/amd/pmf/pmf.h    | 21 ++++++++++++++
 drivers/platform/x86/amd/pmf/spc.c    | 36 +++++++++++++----------
 drivers/platform/x86/amd/pmf/tee-if.c |  2 ++
 5 files changed, 89 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 13c4fec2c7ef..4750ae6d70b0 100644
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
@@ -331,6 +334,41 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
 									 req, sizeof(*req));
 }
 
+/* Store custom BIOS inputs data in ring buffer */
+static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
+{
+	struct pmf_cbi_ring_buffer *rb = &pmf_dev->cbi_buf;
+	struct pmf_bios_input_entry entry = { };
+	int i;
+
+	guard(mutex)(&pmf_dev->cbi_mutex);
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
+	if (CIRC_SPACE(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RING_ENTRIES) == 0) {
+		/* Rare case: ensures the newest BIOS input value is kept */
+		dev_warn(pmf_dev->dev, "Overwriting BIOS input value, data may be lost\n");
+		rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
+	}
+
+	rb->data[rb->head] = entry;
+	rb->head = (rb->head + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
+}
+
 static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)
 {
 	if (!pdev->cb_flag)
@@ -356,6 +394,8 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
 	dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.pending_req);
 
 	amd_pmf_handle_early_preq(pmf_dev);
+
+	amd_pmf_custom_bios_inputs_rb(pmf_dev);
 }
 
 static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
@@ -374,6 +414,8 @@ static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
 	dev_dbg(pmf_dev->dev, "Pending request (preq1): 0x%x\n", pmf_dev->req1.pending_req);
 
 	amd_pmf_handle_early_preq(pmf_dev);
+
+	amd_pmf_custom_bios_inputs_rb(pmf_dev);
 }
 
 static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index bc544a4a5266..8d5ac84ae025 100644
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
@@ -468,6 +469,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	mutex_init(&dev->lock);
 	mutex_init(&dev->update_mutex);
 	mutex_init(&dev->cb_mutex);
+	mutex_init(&dev->cbi_mutex);
 
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
@@ -494,6 +496,7 @@ static void amd_pmf_remove(struct platform_device *pdev)
 	mutex_destroy(&dev->lock);
 	mutex_destroy(&dev->update_mutex);
 	mutex_destroy(&dev->cb_mutex);
+	mutex_destroy(&dev->cbi_mutex);
 }
 
 static const struct attribute_group *amd_pmf_driver_groups[] = {
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
index 85192c7536b8..7c6bbfaa785a 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -11,6 +11,7 @@
 
 #include <acpi/button.h>
 #include <linux/amd-pmf-io.h>
+#include <linux/cleanup.h>
 #include <linux/power_supply.h>
 #include <linux/units.h>
 #include "pmf.h"
@@ -132,30 +133,41 @@ static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int
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
+	struct pmf_bios_input_entry entry = { };
 	unsigned int i;
 
+	guard(mutex)(&pdev->cbi_mutex);
+
 	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
 		amd_pmf_set_ta_custom_bios_input(in, i, pdev->cb_prev.custom_bios_inputs[i]);
 
-	if (!(pdev->req.pending_req || pdev->req1.pending_req))
+	if (CIRC_CNT(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RING_ENTRIES) == 0)
+		return;	/* return if ring buffer is empty */
+
+	entry = rb->data[rb->tail];
+	rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
+
+	/* If no active custom BIOS input pending request, do not consume further work */
+	if (!entry.preq)
 		return;
 
 	if (!pdev->smart_pc_enabled)
@@ -165,20 +177,14 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 	case PMF_IF_V1:
 		if (!is_apmf_bios_input_notifications_supported(pdev))
 			return;
-		amd_pmf_update_bios_inputs(pdev, pdev->req1.pending_req, custom_bios_inputs_v1,
-					   pdev->req1.custom_policy, in);
+		amd_pmf_update_bios_inputs(pdev, &entry, custom_bios_inputs_v1, in);
 		break;
 	case PMF_IF_V2:
-		amd_pmf_update_bios_inputs(pdev, pdev->req.pending_req, custom_bios_inputs,
-					   pdev->req.custom_policy, in);
+		amd_pmf_update_bios_inputs(pdev, &entry, custom_bios_inputs, in);
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

