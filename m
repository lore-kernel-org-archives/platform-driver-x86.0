Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012025.outbound.protection.outlook.com [40.107.209.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748CF317171
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Mar 2026 13:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772370719; cv=fail; b=RstEA27WSSOar5C9GF/918o1p6cl9BKlOZXVsRptRDf/BRhvvYh/mE0isGn9Eq1bmSy98vUmapZbLywd2N5ipWqB4N0h+56almrAbSqKTCKLim0Jlk7tJGKcyfnE8decZGDPvaGBG11dtrGaoFTpRJPvuHRpz5DwCSF/9hhTgJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772370719; c=relaxed/simple;
	bh=dDG+xyko9XMxvvZ7j2tfFma2scWvWVPmFo8EZiVBwUo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cl1QkA6+Zz8S/uPqL3vJm9QhLZJn/9cUVQRuHbdU78MqANIgL32BRdpmmfI0NtpNhwL9qaoM/sS9k/2gPRXEbc+CnGd6evBWL84NW5txOCKeG5QqovOclSjffSic9V4TBMW8XK7J8vDPN9iwOt37KqW/u3tDhoqAV5a5XkR6xSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=W5HG7TIF; arc=fail smtp.client-ip=40.107.209.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="W5HG7TIF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbHBqT7kzwSrOQ9x31sDV2TJ4Shpev1DlaI0Bpe/garlGaPeIe5Yi6jirmKSQCR/HoTjz7eIFr3n6cvRp2fBttZ+tVh/C8fXDxF1ghF/rPDV2cBFSg4sFNQRWqx2NXWI3fH2UftAPuApHMwViTw8S7T1C9TS2HGlx8zOD3aFSG4PCRr2jgw7t0vb7bsZr20ALN8UCXb2N2xD5uT5XLpMk5UubTOb4XwB9SFdzRydGydtGUHMzI0WpDyIKfF6fAIfgaanfka0dxHBlOHW4iRiY/RTnc8PjYopLAH+Yjv/fL3LwlMcgceYGo/+svqQD+IK1EMJ2WHZyBHu1NdLG1FPUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMyGX2J0RJ0X/HTI6MmFUcSTQxOm+k+AgFxsAYZU9TA=;
 b=wNmo9iH6r1vpStxvtWVK3W3ip1UWiTWpS4F6b8KWzSnGSp1J2fXIjxji+I6BBKUaCqy26enfW9h3mJftTAWnHDas4HfrKeo7O81EG2j2MPxfZ86AHc8XOkPcJ8QahjgqvgXUrHfMLQ8D4FqTHJOdSc7mTH7G7Q6CWeW/XmydZUaVQl7ZolXUlv/rTTLyGtxIC7+YzSxWJHl4gJq5IrYpQEONpDnBUE7KA9HTamjggt+j2XIZySCIGVrS/7aoT78Y0bH2f0fs/gYfGfjC8lY+RfBtVWyUr666sV6+EL/n6sLsM5TICUzrzRICPNz0K6gx6qOZgbMFQ0qXvTF9afOqgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMyGX2J0RJ0X/HTI6MmFUcSTQxOm+k+AgFxsAYZU9TA=;
 b=W5HG7TIFV+ZgqBJsN+AZFCXKFVDW7NL0gMYh+RFiDg4kzIIGq5yP8Ed2QCLrNeSWvLl5Ad5znpHsvnrJJ+v6KQeH7mO89BmP8TN3cV1y/tynEKMc1xCgWdHAjBLTJZQCOGtMi92ZSmdr4PYLBUOISvu+aoK4OuhO1v3oFIB/7zw=
Received: from BN9PR03CA0114.namprd03.prod.outlook.com (2603:10b6:408:fd::29)
 by MN0PR12MB6246.namprd12.prod.outlook.com (2603:10b6:208:3c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Sun, 1 Mar
 2026 13:11:52 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::ef) by BN9PR03CA0114.outlook.office365.com
 (2603:10b6:408:fd::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.18 via Frontend Transport; Sun,
 1 Mar 2026 13:11:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Sun, 1 Mar 2026 13:11:52 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 1 Mar
 2026 07:11:49 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Yijun.Shen@Dell.com>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 1/7] platform/x86/amd/pmf: Add util layer and userspace misc device interface
Date: Sun, 1 Mar 2026 18:41:18 +0530
Message-ID: <20260301131124.1370565-2-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|MN0PR12MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: c8534d6a-8e3b-4d68-5516-08de77941ac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	FkFeCZrX6J+xyvyrpnVrZnF0T/bbziMCJ6ey3Ck4YhKuAyjcVVTpUm50/QPxBQdPXwQZtr4hL6mAlJGobq9S76mhlRFCM/2JB8h26xDg284wZWnOGNi8SNbgaK7f25mypP1L1p3P+iEvl5nyRpa16rHnZ9wgtUGVUSuacLTlZFqH/Kxfam/WOoF3HikMZGC7dwGZiYULOnfmIQyydzE/aa59k+sAICul2SCKAn9/P+bXX0s0m8sNqBlX2ZQbOyWXPrHqRZh/2TnW5bfPgJIQCFEP451rp5p7qeXaoY9XGJ0YKbzMHmJdOH6BCnwJ5jsfslCoJoXaNjipCAojPPBRsipF9roD26AL0qlzi01w8+TAMInTWk7neJ5mudsXEmcJThwqP4kD/HB6muidd2WzNpWmUxqQ2TlB+QR2qpN9DjBuGJHawQCWWURnNX++Deffv9358emNYrcrZqu0Bt8xNiMXnQYy4I0a0humfIRfQaSrB3ik+rEjQ40Nl3cs5v8zL20Rd3l1Kg9fVooOw8LN78zWMIlL8Rhw6lqnGXuC2lWoyGFFd3ML1alYoSr+3MNoktvdjYHUbJ6XzmRwsO/jXjeMlDr3k1xgrdg6+5iYt2bC7AOVdqpC8msqutpdgvWWkH8rLSsiqG42orPQry3mkO+ceULqUjMue6tYVdYb/WsoPKzyRgpnFkehR2Y1oDCqaRzK8tZRakYz9JpjElQ0naSkUbGojSBdTlcYl76WgRYJLjSPWKcUCErTSaSphbRNcN7L3nCuhpVUK7ZWMMxCR722nkl7d0Z1s4nbmNPkXOfB99IgExL44D/uh/95GbJmaL7JocHn5IsRREcptgujnw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ixD/2OYv6xGs/EhdQwaUry2AfLnAbA0b7OIBckAAFM/TSaotHuxs4JCIVa+znlBJjba6SSLvdEI+K7sg3s/o65Gmbf5cff+YXOvPWKytxxphUuVZ9BPasD8mh6UePajy6P6CIRQ2J8CDB+esx5bF3/Tb/L3n+c1TEAJ94SfbfOd9qB5nhGvnuZQYq9DOACTZZQ0E7Sw+xe/pNTyrI4jBIHLTicQAlV2IjdnPFq7rdU1dJVwy35QO7NNHg0bPzvhDt+XnwKr3eRz2T+/15gO9pSDr8K4Q4Dvycwknnmzj+abde8BHUgt+zP2HrMnqcFsNtKLdif+5sVd/Lk2VsWX9UONnnfxgwbQAMW9UhDDJrmDjxsSfIvmoqgrtDMtDguviChsJuveJ9ezfjvVC8rHN9X1IEABfj/Us9ATh5Zc0T96yZgXGuga3HKCSDaUGl2AL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 13:11:52.0637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8534d6a-8e3b-4d68-5516-08de77941ac3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6246

Add a util layer to AMD PMF that exposes a minimal userspace interface
via a misc character device for metrics monitoring and feature discovery.

This creates /dev/amdpmf_interface with basic ioctl support to retrieve
PMF metrics such as:
*Power source and power slider position
*Platform type, lid state, and user presence
*Skin temperature and ambient light
*BIOS input parameters (1-10)
*Graphics workload metrics
*CPU C-state residency (average and maximum)
*Socket power consumption

The interface enables smoother integration with userspace tools such as
AMD SystemDeck [1], which is widely used for monitoring and controlling
power and thermal behavior on AMD platforms. These tools help designers
keep major components within thermal limits to ensure proper operation
and enhance overall system stability and reliability.

The feature is gated behind the CONFIG_AMD_PMF_UTIL_SUPPORT Kconfig
option, allowing it to be disabled if not needed. The implementation
uses existing PMF infrastructure to populate data from the TA (Trusted
Application) shared memory buffer.

Link: https://docs.amd.com/v/u/en-US/68773_0.50 [1]

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Kconfig  |  10 ++
 drivers/platform/x86/amd/pmf/Makefile |   2 +
 drivers/platform/x86/amd/pmf/core.c   |   5 +
 drivers/platform/x86/amd/pmf/pmf.h    |   9 ++
 drivers/platform/x86/amd/pmf/util.c   | 174 ++++++++++++++++++++++++++
 include/uapi/linux/amd-pmf.h          | 115 +++++++++++++++++
 6 files changed, 315 insertions(+)
 create mode 100644 drivers/platform/x86/amd/pmf/util.c
 create mode 100644 include/uapi/linux/amd-pmf.h

diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index 25b8f7ae3abd..ad21f679b8ab 100644
--- a/drivers/platform/x86/amd/pmf/Kconfig
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -30,3 +30,13 @@ config AMD_PMF_DEBUG
 	 in the PMF config store.
 
 	 Say Y here to enable more debug logs and Say N here if you are not sure.
+
+config AMD_PMF_UTIL_SUPPORT
+	bool "AMD PMF Util layer support"
+	depends on AMD_PMF
+	help
+	Enabling this option provides a character device for userspace to capture
+	PMF features (Smart PC Builder, Auto Mode, Static Power Slider, Dynamic
+	Power Slider AC/DC) along with PMF metrics from the AMD PMF driver.
+
+	Say Y here to enable it and Say N here if you are not sure.
diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
index 5978464e0eb7..bf7aad80b9e9 100644
--- a/drivers/platform/x86/amd/pmf/Makefile
+++ b/drivers/platform/x86/amd/pmf/Makefile
@@ -8,3 +8,5 @@ obj-$(CONFIG_AMD_PMF)		+= amd-pmf.o
 amd-pmf-y 			:= core.o acpi.o sps.o \
 				   auto-mode.o cnqf.o \
 				   tee-if.o spc.o
+# Build util.c only when AMD_PMF_UTIL_SUPPORT is enabled
+amd-pmf-$(CONFIG_AMD_PMF_UTIL_SUPPORT) += util.o
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index b9e5a2cf3aae..919d02f30aae 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -634,6 +634,10 @@ static int amd_pmf_probe(struct platform_device *pdev)
 
 	pmf_device = dev->dev;
 
+	err = amd_pmf_cdev_register(dev);
+	if (err)
+		dev_warn(dev->dev, "failed to register util interface: %d\n", err);
+
 	dev_info(dev->dev, "registered PMF device successfully\n");
 
 	return 0;
@@ -646,6 +650,7 @@ static void amd_pmf_remove(struct platform_device *pdev)
 	amd_pmf_deinit_features(dev);
 	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
 		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_UNLOAD);
+	amd_pmf_cdev_unregister();
 	apmf_acpi_deinit(dev);
 	amd_pmf_dbgfs_unregister(dev);
 }
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 69fef7448744..6f61076a9386 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -928,4 +928,13 @@ int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid);
 void amd_pmf_tee_deinit(struct amd_pmf_dev *dev);
 int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev);
 
+/* Util Layer */
+#if IS_ENABLED(CONFIG_AMD_PMF_UTIL_SUPPORT)
+int amd_pmf_cdev_register(struct amd_pmf_dev *dev);
+void amd_pmf_cdev_unregister(void);
+#else
+static inline int amd_pmf_cdev_register(struct amd_pmf_dev *dev) { return 0; }
+static inline void amd_pmf_cdev_unregister(void) {}
+#endif
+
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
new file mode 100644
index 000000000000..c6837caa44e0
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/util.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD Platform Management Framework Util Layer
+ *
+ * Copyright (c) 2026, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *			 Sanket Goswami <Sanket.Goswami@amd.com>
+ */
+
+#include <linux/amd-pmf.h>
+#include <linux/miscdevice.h>
+#include <linux/mutex.h>
+#include <linux/uaccess.h>
+
+#include "pmf.h"
+
+/* Convert BIOS input control code to array index (0-9) */
+static int amd_pmf_get_bios_idx(u32 control_code)
+{
+	if (control_code >= IOCTL_BIOS_INPUT_1 && control_code <= IOCTL_BIOS_INPUT_10)
+		return control_code - IOCTL_BIOS_INPUT_1;
+
+	return -EINVAL;
+}
+
+static long long amd_pmf_populate_bios_input(struct ta_pmf_enact_table *in, u32 control_code)
+{
+	u32 idx;
+
+	idx = amd_pmf_get_bios_idx(control_code);
+
+	return (idx < 2) ? in->ev_info.bios_input_1[idx] : in->ev_info.bios_input_2[idx - 2];
+}
+
+static long long amd_pmf_device_state(struct ta_pmf_enact_table *in, u32 control_code)
+{
+	switch (control_code) {
+	case IOCTL_PLATFORM_TYPE:
+		return in->ev_info.platform_type;
+	case IOCTL_LAPTOP_PLACEMENT:
+		return in->ev_info.device_state;
+	case IOCTL_LID_STATE:
+		return in->ev_info.lid_state;
+	case IOCTL_USER_PRESENCE:
+		return in->ev_info.user_present;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int amd_pmf_populate_data(struct device *dev, void __user *argp)
+{
+	struct amd_pmf_ioctl_info output = {0};
+	struct ta_pmf_shared_memory *ta_sm = NULL;
+	struct ta_pmf_enact_table *in = NULL;
+	struct amd_pmf_dev *pdev;
+
+	pdev = dev_get_drvdata(dev);
+	if (!pdev)
+		return -EINVAL;
+
+	memset(pdev->shbuf, 0, pdev->policy_sz);
+	ta_sm = pdev->shbuf;
+	in = &ta_sm->pmf_input.enact_table;
+
+	if (copy_from_user(&output, argp, sizeof(output)))
+		return -EFAULT;
+
+	switch (output.control_code) {
+	case IOCTL_POWER_SOURCE:
+		output.val = in->ev_info.power_source;
+		break;
+	case IOCTL_POWER_SLIDER_POSITION:
+		output.val = in->ev_info.power_slider;
+		break;
+	case IOCTL_SKIN_TEMP:
+		/* Convert from centi-degrees to degrees Celsius */
+		output.val = in->ev_info.skin_temperature / 100;
+		break;
+	case IOCTL_PLATFORM_TYPE ... IOCTL_LID_STATE:
+	case IOCTL_USER_PRESENCE:
+		output.val = amd_pmf_device_state(in, output.control_code);
+		break;
+	case IOCTL_BIOS_INPUT_1 ... IOCTL_BIOS_INPUT_10:
+		output.val = amd_pmf_populate_bios_input(in, output.control_code);
+		break;
+	case IOCTL_GFX_WORKLOAD:
+		output.val = in->ev_info.gfx_busy;
+		break;
+	case IOCTL_AMBIENT_LIGHT:
+		output.val = in->ev_info.ambient_light;
+		break;
+	case IOCTL_AVG_C0_RES:
+		output.val = in->ev_info.avg_c0residency;
+		break;
+	case IOCTL_MAX_C0_RES:
+		output.val = in->ev_info.max_c0residency;
+		break;
+	case IOCTL_SOCKET_POWER:
+		output.val = in->ev_info.socket_power;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (copy_to_user(argp, &output, sizeof(output)))
+		return -EFAULT;
+
+	return 0;
+}
+
+#if IS_ENABLED(CONFIG_AMD_PMF_UTIL_SUPPORT)
+static struct amd_pmf_dev *pmf_dev_handle;
+static DEFINE_MUTEX(pmf_util_lock);
+
+static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	struct amd_pmf_dev *pdev = filp->private_data;
+	void __user *argp = (void __user *)arg;
+
+	if (cmd != IOCTL_PMF_POPULATE_DATA)
+		return -EINVAL;
+
+	guard(mutex)(&pmf_util_lock);
+	return amd_pmf_populate_data(pdev->dev, argp);
+}
+
+static int amd_pmf_open(struct inode *inode, struct file *filp)
+{
+	guard(mutex)(&pmf_util_lock);
+	if (!pmf_dev_handle)
+		return -ENODEV;
+
+	filp->private_data = pmf_dev_handle;
+	return 0;
+}
+
+static const struct file_operations pmf_if_ops = {
+	.owner          = THIS_MODULE,
+	.open           = amd_pmf_open,
+	.unlocked_ioctl = amd_pmf_set_ioctl,
+};
+
+static struct miscdevice amd_pmf_util_if = {
+	.minor		= MISC_DYNAMIC_MINOR,
+	.name		= "amdpmf_interface",
+	.fops		= &pmf_if_ops,
+};
+
+int amd_pmf_cdev_register(struct amd_pmf_dev *dev)
+{
+	int ret;
+
+	guard(mutex)(&pmf_util_lock);
+	pmf_dev_handle = dev;
+	ret = misc_register(&amd_pmf_util_if);
+	if (ret)
+		pmf_dev_handle = NULL;
+
+	return ret;
+}
+
+void amd_pmf_cdev_unregister(void)
+{
+	guard(mutex)(&pmf_util_lock);
+	pmf_dev_handle = NULL;
+	misc_deregister(&amd_pmf_util_if);
+}
+#else
+int amd_pmf_cdev_register(struct amd_pmf_dev *dev) { return 0; }
+void amd_pmf_cdev_unregister(void) {}
+#endif
diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
new file mode 100644
index 000000000000..d29431c67eaa
--- /dev/null
+++ b/include/uapi/linux/amd-pmf.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later WITH Linux-syscall-note */
+/*
+ * AMD Platform Management Framework (PMF) UAPI Header
+ *
+ * Copyright (c) 2026, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * This file defines the user-space API for interacting with the AMD PMF
+ * driver. It provides ioctl interfaces to query platform-specific metrics
+ * such as power source, slider position, platform type, laptop placement,
+ * and various BIOS input/output parameters.
+ */
+
+#ifndef _UAPI_LINUX_AMD_PMF_H
+#define _UAPI_LINUX_AMD_PMF_H
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+/**
+ * AMD_PMF_IOC_MAGIC - Magic number for AMD PMF ioctl commands
+ *
+ * This magic number uniquely identifies AMD PMF ioctl operations.
+ */
+#define AMD_PMF_IOC_MAGIC	'p'
+
+/**
+ * IOCTL_PMF_POPULATE_DATA - ioctl command to retrieve PMF metrics data
+ *
+ * This ioctl command is used to populate the amd_pmf_ioctl_info structure
+ * with the requested metrics data based on the control_code provided.
+ */
+#define IOCTL_PMF_POPULATE_DATA		_IOWR(AMD_PMF_IOC_MAGIC, 0x00, struct amd_pmf_ioctl_info)
+
+/**
+ * enum pmf_ioctl_id - Control codes for PMF ioctl operations
+ * @IOCTL_POWER_SOURCE: Query current power source (AC/DC)
+ * @IOCTL_POWER_SLIDER_POSITION: Query current power slider position
+ * @IOCTL_PLATFORM_TYPE: Query current platform/form factor type
+ * @IOCTL_LAPTOP_PLACEMENT: Query laptop physical placement state
+ * @IOCTL_LID_STATE: Query laptop lid open/close state
+ * @IOCTL_HETERO_STATE: Query heterogeneous computing state
+ * @IOCTL_SKIN_TEMP: Query skin temperature sensor reading
+ * @IOCTL_USER_PRESENCE: Query user presence detection state
+ * @IOCTL_DISPLAY_NUM: Query number of active displays
+ * @IOCTL_USER_ENGAGED: Query user engagement state
+ * @IOCTL_BIOS_INPUT_1: Query BIOS input parameter 1
+ * @IOCTL_BIOS_INPUT_2: Query BIOS input parameter 2
+ * @IOCTL_BIOS_INPUT_3: Query BIOS input parameter 3
+ * @IOCTL_BIOS_INPUT_4: Query BIOS input parameter 4
+ * @IOCTL_BIOS_INPUT_5: Query BIOS input parameter 5
+ * @IOCTL_BIOS_INPUT_6: Query BIOS input parameter 6
+ * @IOCTL_BIOS_INPUT_7: Query BIOS input parameter 7
+ * @IOCTL_BIOS_INPUT_8: Query BIOS input parameter 8
+ * @IOCTL_BIOS_INPUT_9: Query BIOS input parameter 9
+ * @IOCTL_BIOS_INPUT_10: Query BIOS input parameter 10
+ * @IOCTL_GFX_WORKLOAD: Query current graphics workload type
+ * @IOCTL_AMBIENT_LIGHT: Query ambient light sensor reading
+ * @IOCTL_AVG_C0_RES: Query average C0 residency
+ * @IOCTL_MAX_C0_RES: Query maximum C0 residency
+ * @IOCTL_SOCKET_POWER: Query current socket power consumption
+ * @IOCTL_TA_BIN_VER: Query Trusted Application binary version
+ *
+ * These control codes are used with the IOCTL_PMF_POPULATE_DATA ioctl
+ * to specify which metrics data to retrieve from the AMD PMF driver.
+ */
+enum pmf_ioctl_id {
+	IOCTL_POWER_SOURCE,
+	IOCTL_POWER_SLIDER_POSITION,
+	IOCTL_PLATFORM_TYPE,
+	IOCTL_LAPTOP_PLACEMENT,
+	IOCTL_LID_STATE,
+	IOCTL_HETERO_STATE,
+	IOCTL_SKIN_TEMP,
+	IOCTL_USER_PRESENCE,
+	IOCTL_DISPLAY_NUM,
+	IOCTL_USER_ENGAGED,
+	IOCTL_BIOS_INPUT_1,
+	IOCTL_BIOS_INPUT_2,
+	IOCTL_BIOS_INPUT_3,
+	IOCTL_BIOS_INPUT_4,
+	IOCTL_BIOS_INPUT_5,
+	IOCTL_BIOS_INPUT_6,
+	IOCTL_BIOS_INPUT_7,
+	IOCTL_BIOS_INPUT_8,
+	IOCTL_BIOS_INPUT_9,
+	IOCTL_BIOS_INPUT_10,
+	IOCTL_GFX_WORKLOAD,
+	IOCTL_AMBIENT_LIGHT = 29,
+	IOCTL_AVG_C0_RES = 36,
+	IOCTL_MAX_C0_RES,
+	IOCTL_SOCKET_POWER = 50,
+	IOCTL_TA_BIN_VER
+};
+
+/**
+ * struct amd_pmf_ioctl_info - Structure for PMF ioctl data exchange
+ * @control_code: Input parameter specifying which data to query (enum pmf_ioctl_id)
+ * @feature_supported: Output flag indicating if the queried feature is supported
+ * @feature_version: Output field containing the feature version number
+ * @val: Output field containing the queried value
+ *
+ * This structure is used with the IOCTL_PMF_POPULATE_DATA ioctl command
+ * to exchange data between user space and the AMD PMF kernel driver.
+ * The user provides the control_code to specify the query type, and the
+ * driver populates the remaining fields with the response data.
+ */
+struct amd_pmf_ioctl_info {
+	enum pmf_ioctl_id control_code; /* In */
+	bool feature_supported; /* Out */
+	unsigned long feature_version; /* Out */
+	long long val; /* Out */
+};
+
+#endif /* _UAPI_LINUX_AMD_PMF_H */
-- 
2.34.1

