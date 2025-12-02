Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010002.outbound.protection.outlook.com [40.93.198.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1398281369
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Dec 2025 04:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764649390; cv=fail; b=XFYmY5vGxQAsXXnG8WroHw1nt2U6uyVTvc5/+/Vib9QBnusgjMTFRk/le841yCFcbvAj5ssaLqvZUKZ1rymDJxEfJ/9l/kU/7zZj3wcy3j6HpcpAwDm00Y6dXdtU5eCp8kB2YStoYu3Yw/Er54lcdAvOSdFuollgQbrDvk5JQ6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764649390; c=relaxed/simple;
	bh=iBpNe6gpv2M/VEL7gEKMWokGkVy1huHLkg2g2vuvwVM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LO2otSwK2QrtBa4H+Fshgk0dzPxWbu0vBOCFrQWY3PXAr+XUK1kfGRbiikBSrGUZFOlOr7DHgOccnvjBaE2ZTmVRCwgRpKElnAwbvzF3hUaXi+a5ANCruNtzKaDAy3qTgUbpIRaxyYIOH/rc9x5kwYIkyxUuSl4tZ79lbdhn7qQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jbAM6Wz1; arc=fail smtp.client-ip=40.93.198.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jbAM6Wz1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZEgODXNJ54Xx1R5bRqxSNWArLu2B3p2YCOK5yC4Thjw4SEwjE/thCqf9BCYWXrUcDrzF7jr81jpfyCqvl5bDrreiu2MdwnmNLJzjO6KNHH8TePSIZ8ASFeeBo8zSzojG2m+lX6n/SJVIb2IO+bpOGoZ7cvkrulpTrvAmkWqrjWr3x1QkkAaxioPudkIYT8WtqShaxhAGKMzVkzZ/XyUwUEElLPJZmcSNyyrRp6r6h1w1KVhKp0Om0DLeFEM4oW0mZIH4hnTzp8W9HqZQ3w66q4erL2fH5x9lS8dFYXxBRSc9gQuO8UbjXMctdK+cU+WLeUliySMxEZl3wvdZ26sKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRlLvq+ci4ARlpjzBFWqMm6BlnT5DGtEhs73jw6T+4g=;
 b=Z9oF4QX5W8zrR+h/CuczinLZo36OYwXD4xmavNbnArp2P9aXkb+lUaHoo+WSW8yKLBW13CTpJyzGcw2lqgJ9t9DtoamQRRdEfevyL/kJ6KdwG1IGM+2JZX4f+tpxMQyPGGRwMl8vkw8S908cXS7QivhUAkg7sA+FwS6lMD6gMeYKgTxLRhxeQRR/kP7+1dKzT77SmX3zCzrl5Ae5Z7V9BpKxiwHjy2Uhi9DcNxnS2LqiYuv6HKgF0HvWJtAp5HLaC5ZodrEG0mohH/TuSVmLxPbMToCd4oGdIijKyqLECUSnbSCos51wJuNiNANIQiVF9kUwF4s1e7GksB8mV8abow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRlLvq+ci4ARlpjzBFWqMm6BlnT5DGtEhs73jw6T+4g=;
 b=jbAM6Wz15tLTqH1JgdhUEPuCPsrOZ6ff8Ed/Hjmu7/HfaDqlrd5+YEkGH0cdT1jliJpuKTGJMPkF8OuAKSyLOT+WBPxdsnsdMnfPY2SYVYT8O7zJnRir3t9ITzRkkDUAgtmhr6BPEes0dsjnvJJau7Axaz+EDOyyZXcm3IJeAO4=
Received: from SJ0PR13CA0120.namprd13.prod.outlook.com (2603:10b6:a03:2c5::35)
 by CH3PR12MB9024.namprd12.prod.outlook.com (2603:10b6:610:176::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 04:22:59 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::3) by SJ0PR13CA0120.outlook.office365.com
 (2603:10b6:a03:2c5::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Tue, 2
 Dec 2025 04:22:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 04:22:58 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 22:22:54 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v5] platform/x86/amd/pmf: Use ring buffer to store custom BIOS input values
Date: Tue, 2 Dec 2025 09:52:19 +0530
Message-ID: <20251202042219.245173-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|CH3PR12MB9024:EE_
X-MS-Office365-Filtering-Correlation-Id: 808e67f4-1566-4fc0-0876-08de315a7992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kZc0e9yTgvtb0s9UEUrnxTw1O5z8ABzn6YaWeO1Dn2ZDnO35MJ9o8q9rJdM1?=
 =?us-ascii?Q?W9NJzxi84f7gy6EsDI5Q0p6uj7jeHSRVXT4Zc+1GCRIACi62EsFOrOCUoAWw?=
 =?us-ascii?Q?VAyQudqUAmGsb9Epy52Pi2oyEsJ43k2J3Qr6n9uP5G4+OsrY9LqQcRsbt7hc?=
 =?us-ascii?Q?qe3ty6uIHe+12hSEWTtJGsdFcNvsNrTrS/A30S6JEiHHcn8dDZ4r2ATDsP/v?=
 =?us-ascii?Q?uTNM+LlVQ4peXzLUykRE24kmef1SpKP3yy8eLtNX7qCq5eLGCL8QMzCDLVFI?=
 =?us-ascii?Q?rVXuynWTiqkbARG4k/5/Tb/nLbrZUOqzXojxjWTug0YTHfBXxQZg0CGpZSF0?=
 =?us-ascii?Q?plsSSZHxUSs54WuOykjCLvVR5wCIuK7q78Hopy7ohr7kbECF35qyuSzvJj4W?=
 =?us-ascii?Q?nKKdDFqrURIvIFKukUqKWbESbEHI2dOMeQSYjQkZF4cr/+oFb9V9Vw0Ge6Iw?=
 =?us-ascii?Q?NFXFklS5E94779WZVFJpTV0dd6QnMlw9upacjpwV8MR29h7YXUT+6bdQB9t3?=
 =?us-ascii?Q?oMshQLvV1/7acz5r45P2zDrqlOCHt7AoL/jY9Uh9f19yFwOLF/Ev/6PRkYgK?=
 =?us-ascii?Q?tMjWBiKUx8h/wpE/yaqwNgksFdXSUuIeQKksgPk1X8yCaQj3dZ35/hxpmE+7?=
 =?us-ascii?Q?JYvutu93ymDgtkwes0DqYiPHZZ2+HN8tIcB3yT1jjtfvfmkQhm+yftT5ASLG?=
 =?us-ascii?Q?Jn+CMeu5pqd/eXMYgtAP2kcqY/IZYivxY4QRuy/qkSGxUlN7mhL3rnGESIlk?=
 =?us-ascii?Q?5DMgGBi7NJIqda2Paas7TMfgamxcItCqJ2V77a3epx0gOpkBSCIMpycj3TjU?=
 =?us-ascii?Q?e+Cit/m+wfSkGitL0ojwarJ8mJ2UvDuItfRk5xb8Hy/AGpKcafl86XwHSBXi?=
 =?us-ascii?Q?dfz28BFIoVs5qo2CTdkMV9tgylenxWBZGxJk+DWbgqi8Bb0U1bj3pX3Xk/Lu?=
 =?us-ascii?Q?K9E8qEeyRVNFRlkCd3eKJhhVpXq3GZKkH8IWip+9MF9n/ot+py/9dwHEaWb3?=
 =?us-ascii?Q?dXmRv1o1Q3rJMZC0AhNavyptUkMVFxsxSMOZ+7xspZeFUffG8ehxXnw4x3Re?=
 =?us-ascii?Q?g6DCeYAcEkzMb0hT1jRadNIxocFecd2/oBsI6H3XGt1VPyvQ72fKvJnj/+dJ?=
 =?us-ascii?Q?tdcBVxtpL111uvxPnlTKER0AObttYGRWePm+F/9cJ7w+0HbvnTGenI/diNsl?=
 =?us-ascii?Q?7+HIiEIO0v5mlNptFP6jXBBYoLZ2lZ/yzUYC3ueEVr2nPEE0/xdg3v7V9QtM?=
 =?us-ascii?Q?7uGBxpJ3lfakMh/DX8xJgBxramoKiEWtZNUfXh85nKHtObVpzHmEnVWLJu01?=
 =?us-ascii?Q?bd5R9sw9oVDZMUvXLa1YqZVXsUuyRscP9zV+Zo3JqDitk3vzOnzljU3Ef2W+?=
 =?us-ascii?Q?N36nvl9QrSKgv7mWpyN4Rs5Sd0hOle9daK/G3oIHyjbvsB3ypkdNx9CTTLIW?=
 =?us-ascii?Q?2p66b1BeJUmrN0t2NsIWr2e7UiMecYLEN2NCME4GutJv1c2WxeS+lNl6AnMl?=
 =?us-ascii?Q?+W9EygfcAZxJ5zKQGXLYe/tDSCz2YyYdYRg1JUi4BYjSuOyhkJCZdWKNDd0b?=
 =?us-ascii?Q?8Dc8npXRG6KSSAOM//A=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 04:22:58.8283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 808e67f4-1566-4fc0-0876-08de315a7992
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9024

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
v5:
 - Advance ring buffer tail with a goto label

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
 drivers/platform/x86/amd/pmf/spc.c    | 33 ++++++++++++----------
 drivers/platform/x86/amd/pmf/tee-if.c |  2 ++
 5 files changed, 87 insertions(+), 14 deletions(-)

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
index 8fc293c9c538..9f4a1f79459a 100644
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
index 9144c8c3bbaf..e65a7eca0508 100644
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
 
 /* amd_pmf_send_cmd() set/get */
 #define SET_CMD		false
@@ -365,6 +368,22 @@ struct pmf_bios_inputs_prev {
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
@@ -413,6 +432,8 @@ struct amd_pmf_dev {
 	struct apmf_sbios_req_v1 req1;
 	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
 	bool cb_flag;			     /* To handle first custom BIOS input */
+	struct pmf_cbi_ring_buffer cbi_buf;
+	struct mutex cbi_mutex;		     /* Protects ring buffer access */
 };
 
 struct apmf_sps_prop_granular_v2 {
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 0a37dc6a7950..f48678a23cc7 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -11,6 +11,7 @@
 
 #include <acpi/button.h>
 #include <linux/amd-pmf-io.h>
+#include <linux/cleanup.h>
 #include <linux/power_supply.h>
 #include <linux/units.h>
 #include "pmf.h"
@@ -132,32 +133,39 @@ static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int
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
 		return;
 
+	/* If no active custom BIOS input pending request, do not consume further work */
+	if (!rb->data[rb->tail].preq)
+		goto out_rbadvance;
+
 	if (!pdev->smart_pc_enabled)
 		return;
 
@@ -165,20 +173,17 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
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
+out_rbadvance:
+	rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
 }
 
 static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_enact_table *in)
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 0abce76f89ff..cec8b38c1afe 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -591,6 +591,8 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
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

