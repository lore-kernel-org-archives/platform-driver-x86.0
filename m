Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011061.outbound.protection.outlook.com [52.101.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8859D2D3ECA
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 14:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540132; cv=fail; b=FUHiNaY2USPACugDhiXHZeFDrJZHw2A/2LcSecl7MlP+LJEorcwY7it23mxtckqt5I8oCaNDrNRqA5qtQiz0E9RRa3WdrXSpsiW3YUJbKwa0TnNvq/ld4bxfsfWtuwee3Qxu3x4WW81VXPxrCJIZE5vJ+c6+k7dzCk4Dwf86V8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540132; c=relaxed/simple;
	bh=7EIQmpQ/rJ7sQUx5/ZgdrUGOGuPORk8/awJtq59/7jY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QgvYz1L7Hz8zm4tJHWB4zcOdURrg8oMCEdV2pTASXyuU9FJSbvVYe7QWSyQNir/cHx/yASErpF4tyjF2UqWF3pftDf/yAaERJd+lX/m31dCtzO3Z6r0xBdjGHKVMi/qF8WWeg7ZGdgcS5yM6YKioFkdCoJm0pYXHxpvTwOSA4Ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iF0Qyj60; arc=fail smtp.client-ip=52.101.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iF0Qyj60"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDtSFzQNX3L7AWSsA174pbIcBjNXNsy6tGw7wvL3twXxi4JH/+u6sdOdF1KiwJjMTJ3OEEbLSQmIiQuhJGpsoArNOcN6jWINC/9YxYmdiVQ6OoG4vNi2t09k6xr+/1BJPIs81jFlQYyviIFGSQjSVDoXbSfGLQw7eKEYaqCRfagxjTF30ggE5DXikwa1zymk20TYVtv7EaLQnfkzjbFclznlHC5IMdoS5Q5STfbM2DC/Cz8wxi/gOhO6xK/5a8AOwHrKBEYJzQtdIuxBx8i+n3DNuUAKeU/7WCAGPQoJSVkiI5XG3fGxco9kDN/Osu5JZKVHf99K/SZTAP8r82MmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZUn+7T2sdi3Q9QMfVY7wdNDN3lOZ5FOqpC1mQcHkyE=;
 b=YbUncrzQmNo44qZ7zzNIg6GaHNXCnoTza9267K8S6FwPoBhkRblK66IiknLTawodD2Xeaj7yh9+95ZIOifyIhxt5U762sABgnPe6f5HQyQKNgBcZtHOxVGQ5gnTCemI2Z8pg2BFOQDh+gxLDnmxQ+qv9ZbTIfcILQGpTCHTm1TGgyVFW84h160/7K24VJmCzjxhXNaVIy8YONU5vu/YmPEa+fpk/RW2rzppPed//+8mkBvzoejFPbMbS8e/3Li4FKWh8zV1nhonZVeRoPm/aSAuxd0I+R8/eQMyhpDU1WBE8EpghL1JpSgI84JRAAEhuL491m7ELTFIqwD92s2niuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZUn+7T2sdi3Q9QMfVY7wdNDN3lOZ5FOqpC1mQcHkyE=;
 b=iF0Qyj60rj3h/MHTpXBptk4vU0zSbT0RebvmisbcmD/FGDy1j+dtnmMhQC0q5yQRqfPTAr5fKP8uIKk5AwxtFEXPAWbiSjBMY7gy/kUzy9jGVYAj+zIF2k8Idx6+PQ8arGqnuAB3M2w2jICUGB6eEMvDHrwCbeip8oXa39OVZrs=
Received: from PH7P221CA0037.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::9)
 by BN7PPFED9549B84.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 14:55:26 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:510:33c:cafe::aa) by PH7P221CA0037.outlook.office365.com
 (2603:10b6:510:33c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.11 via Frontend Transport; Wed,
 15 Oct 2025 14:55:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Wed, 15 Oct 2025 14:55:26 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Oct
 2025 07:55:23 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@Dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/2] platform/x86/amd/pmf: Use ring buffer to store custom BIOS input values
Date: Wed, 15 Oct 2025 20:24:57 +0530
Message-ID: <20251015145457.3231583-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015145457.3231583-1-Shyam-sundar.S-k@amd.com>
References: <20251015145457.3231583-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|BN7PPFED9549B84:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b11705f-74e1-43c8-6383-08de0bfae04a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ArghEZ4I12Is6v1PFMnQ84Fn808fK+877bZl5iXM7X/BfaSUFmx+IhA2L/mC?=
 =?us-ascii?Q?GeZCCk94baQixbOGjMcCas/ggakR/A/cKiOk59eUIiL+IJsOXRcLNsWNcO04?=
 =?us-ascii?Q?h6hkyx9P1E4FAorP8aNGE82kNd66ZS0wFMEkUi4tdzh1aLiYKzvcaMDiZyN5?=
 =?us-ascii?Q?E3GtG+wewja8A/FYxFWX88RiaMwl9FkqwpRTvh6Q9i3AsqWzGgVrUwzve6gK?=
 =?us-ascii?Q?bAmvNdyexmrZIhPjukgulVbVngEXmlBC7nDIEMTXT08H4sboJbc421u0Vrwy?=
 =?us-ascii?Q?IWsboDBVNT1xSaMP2UHn40xsWlmxrga4+KcYmp2KIxJ94jFjZOK7BQZmH2WU?=
 =?us-ascii?Q?7EJVEF3I/RXzpMRwNSbyl6prhd+Px97hfZ/2ryp8E6Be/foEuJW3595Q7wJZ?=
 =?us-ascii?Q?KBJ+zVNiZ/OMMEFgH5UJGXXlsx9T/8wJHfWYqSnK07nJJFO4U5z1BCjQHz1n?=
 =?us-ascii?Q?fb3YdFP+Uwc3JUJ3EVtUFkRIOCS9BRl5eOlRQfwnB+GIT03o7ZOn1NZ6PoSr?=
 =?us-ascii?Q?PdMVGBOxCarWbCuCeTVECmmFtaSybu1jr0M3MoOywki668ti7ES8GOYlSAkl?=
 =?us-ascii?Q?ENuYgrb/LXSGyDUpxXERos57ojcVx09EJxNXfv0KVtmPDHD8nmvkug+wpU60?=
 =?us-ascii?Q?1PV2rV1VZEbbKnb2GVubPu1LgyMLvAEtSpw3+O8VfI/qkyoQxwmHv41sCQ5I?=
 =?us-ascii?Q?jatsvFc6MaPdnP5d3sLIk/52CjcyBuxHIpiQM3H4miGmNpCmTj8dQVSjSCar?=
 =?us-ascii?Q?Pvsb3vE3l+ZzYquNriok3GI9Jcpyxtj/zu+02ipumCsZp4dDSJJOrmGXqpjF?=
 =?us-ascii?Q?80hkn3PW4f3sxjB+6CoRGL99/IZFmMkwG4eU3x1mMyDI5LEDrHvN/YKRfOqT?=
 =?us-ascii?Q?hv/o4oeGW7Xs1TGZQAgwGNeYXsDNbIST5yYGDu6gxZAvhcpGFlLWULjlDPNt?=
 =?us-ascii?Q?PbTam5Cj4jnw4/b7CUGce2mAbjStT7p6YgQAH2s0MzCriWW3M+z/6zxuF9fB?=
 =?us-ascii?Q?QYl8YmiOGRce8UV33lkV/VBCik1DtAGgqAoYzf2OuHiBl+88xl43a4TxLPrR?=
 =?us-ascii?Q?KgRljDFjokr3jHi1KGyFBLm8eLhycB3OdmfuhfLfU2OSxfClNSW1VAWdTjax?=
 =?us-ascii?Q?xIkaC8vHcSSIbcjN375JfUC36Ftotzduc3i1aHvkP2hXJGxR1nJneWsa+w/w?=
 =?us-ascii?Q?jOKJ+uIMF7f7Ha8otnFYB0fBBcaXDf3xOO55zuCt7vC3tevkyRtQmXosPNEs?=
 =?us-ascii?Q?r01kHjCw6HLVzk8AkQ7/1ZtQIgqd8AOVQ/PB6TK7LzwPqTyhINQb1hKxsCkB?=
 =?us-ascii?Q?EvvMBJuQAdYs8LRdHw7VmX16XBQqyi7MtpM3fXZ/adUq5cr3XPhqs9Z907U7?=
 =?us-ascii?Q?V+/Und/ptPKDKK1yDUojd8wakLDOrKfDz7dxGdMTQcWeL46R8Xyslp23Wwkr?=
 =?us-ascii?Q?Bqn2ayQqkAWUvvkH2fN4ufCI8fZh3MiLa5XSkyi0AYJygSQ60vIJ1hJwNl3f?=
 =?us-ascii?Q?hzP3qvXbJL4j/QWiT7KRxl8fkV7Kw6xbSLo0/99o93GsktA2SPKx5x7vWw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 14:55:26.4544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b11705f-74e1-43c8-6383-08de0bfae04a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFED9549B84

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
v2:
 - Add dev_WARN_ONCE()
 - Change variable name rb_mutex to cbi_mutex
 - Move tail increment logic above pending request check

 drivers/platform/x86/amd/pmf/acpi.c   | 41 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c   |  2 ++
 drivers/platform/x86/amd/pmf/pmf.h    | 20 +++++++++++++
 drivers/platform/x86/amd/pmf/spc.c    | 23 +++++++++------
 drivers/platform/x86/amd/pmf/tee-if.c |  2 ++
 5 files changed, 79 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 13c4fec2c7ef..870a56f1fe07 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -331,6 +331,43 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
 									 req, sizeof(*req));
 }
 
+/* Store custom BIOS inputs data in ring buffer */
+static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
+{
+	struct cbi_ring_buffer *rb = &pmf_dev->cbi_buf;
+	struct bios_input_entry entry = { };
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
+	if (CIRC_SPACE(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RB_SZ) > 0) {
+		rb->data[rb->head] = entry;
+		rb->head = (rb->head + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
+	} else {
+		/* Rare case: ensures the newest BIOS input value is kept */
+		dev_WARN_ONCE(pmf_dev->dev, 1, "Overwriting BIOS input value, data may be lost\n");
+		rb->data[rb->head] = entry;
+		rb->head = (rb->head + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
+		rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
+	}
+}
+
 static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)
 {
 	if (!pdev->cb_flag)
@@ -356,6 +393,8 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
 	dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.pending_req);
 
 	amd_pmf_handle_early_preq(pmf_dev);
+
+	amd_pmf_custom_bios_inputs_rb(pmf_dev);
 }
 
 static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
@@ -374,6 +413,8 @@ static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
 	dev_dbg(pmf_dev->dev, "Pending request (preq1): 0x%x\n", pmf_dev->req1.pending_req);
 
 	amd_pmf_handle_early_preq(pmf_dev);
+
+	amd_pmf_custom_bios_inputs_rb(pmf_dev);
 }
 
 static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index bc544a4a5266..8b97eba00dd3 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -468,6 +468,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	mutex_init(&dev->lock);
 	mutex_init(&dev->update_mutex);
 	mutex_init(&dev->cb_mutex);
+	mutex_init(&dev->cbi_mutex);
 
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
@@ -494,6 +495,7 @@ static void amd_pmf_remove(struct platform_device *pdev)
 	mutex_destroy(&dev->lock);
 	mutex_destroy(&dev->update_mutex);
 	mutex_destroy(&dev->cb_mutex);
+	mutex_destroy(&dev->cbi_mutex);
 }
 
 static const struct attribute_group *amd_pmf_driver_groups[] = {
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 2145df4128cd..6cb1e228c48e 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -12,6 +12,7 @@
 #define PMF_H
 
 #include <linux/acpi.h>
+#include <linux/circ_buf.h>
 #include <linux/input.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
@@ -120,6 +121,7 @@ struct cookie_header {
 #define APTS_MAX_STATES		16
 #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
 #define BIOS_INPUTS_MAX		10
+#define CUSTOM_BIOS_INPUT_RB_SZ	64	/* Must be power of two for CIRC_* macros */
 
 typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
 
@@ -359,6 +361,22 @@ struct pmf_bios_inputs_prev {
 	u32 custom_bios_inputs[BIOS_INPUTS_MAX];
 };
 
+/**
+ * struct bios_input_entry - Snapshot of custom BIOS input event
+ * @val: Array of custom BIOS input values
+ * @preq: Pending request value associated with this event
+ */
+struct bios_input_entry {
+	u32 val[BIOS_INPUTS_MAX];
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
@@ -407,6 +425,8 @@ struct amd_pmf_dev {
 	struct apmf_sbios_req_v1 req1;
 	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
 	bool cb_flag;			     /* To handle first custom BIOS input */
+	struct cbi_ring_buffer cbi_buf;
+	struct mutex cbi_mutex;		     /* Protects ring buffer access */
 };
 
 struct apmf_sps_prop_granular_v2 {
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 85192c7536b8..669680ce580a 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -150,12 +150,23 @@ static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req
 static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 					   struct ta_pmf_enact_table *in)
 {
+	struct cbi_ring_buffer *rb = &pdev->cbi_buf;
+	struct bios_input_entry entry = { };
 	unsigned int i;
 
+	guard(mutex)(&pdev->cbi_mutex);
+
 	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
 		amd_pmf_set_ta_custom_bios_input(in, i, pdev->cb_prev.custom_bios_inputs[i]);
 
-	if (!(pdev->req.pending_req || pdev->req1.pending_req))
+	if (CIRC_CNT(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RB_SZ) == 0)
+		return;	/* return if ring buffer is empty */
+
+	entry = rb->data[rb->tail];
+	rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
+
+	/* If no active custom BIOS input pending request, do not consume further work */
+	if (!entry.preq)
 		return;
 
 	if (!pdev->smart_pc_enabled)
@@ -165,20 +176,14 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
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

