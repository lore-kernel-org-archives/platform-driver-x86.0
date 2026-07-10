Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011043.outbound.protection.outlook.com [52.101.57.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BAD42E8FD;
	Fri, 10 Jul 2026 14:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694830; cv=fail; b=OXuJjghtinJiGznYFyVS9InCmKG7xzApFz5Dqmh0l1YC2TH+vrMfmmmdp23NQNencnYQD09HoCxinWDQqIpW9+DExDaV6xpL/x0LcdkHhg76mBSztbyvUayBRhXCszcTrIfCbyv5INVP2r+Xo7JnQsXUS85MsyT4cSQ5vDoe6ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694830; c=relaxed/simple;
	bh=Hy89uS3vuNGV/PYrOnuTL72Zr4yRo+AfDvK7Hn/ln9k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uSnTyAs4nFmD0073aqXgw27QUwncNNZPv2V5PwJXcumphkZQOq4UWDgQMzc0nLFVnmY+RSkAVPKSkK3jijR/7Yu2aXX0Nbd32h2UHSpUnjZ2U3L8tzAbGwM3cfWP4Ni6PJcuInZe929OoJI9bVGwl3TYTCU3+lDTbqP0J0PIYYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=p8L7HzWI; arc=fail smtp.client-ip=52.101.57.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="p8L7HzWI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G8EDl2qFUutSFcf00l5lLTxY/SYvo0mBeiYWmyz1Mlh0HJ4BGNxMGMI+NJMuKlAz+d0uwO7VIzvK0C7E4wn3NvBRTura3ulWqKazVYdnPwlryNOlrHbNFPpuwh8Trt/OdVcQXfqMEmwOHvPY/S1XSoPbyyckHg1yU8V4hZ1eNpNTLYi5F84nc/TGmVU+JbkwiXcMXmXOWfYAFwkoj7LcEpaxwEe2/4NQvLuzMr8ICbDfphbCuB+6FLI284DYrekZntbamzRnlJnp9J5bOD5HD+xg/Vdim0HeMhAbhPWxyAWcbbOaMhDira78lFQ7K6++RQ+ZOUQQpuu6XNLdBmTKQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oZHusnDBPzwzc0a7UxSnYcfVMLkGswZs9HVPFlp9kc=;
 b=cyy91G7N8tKg29lFvEt/H1avKi1jPZZAiK8+lkqd5WX1wvWsLm6WPpjVoclbAAF7x+vFrycPV3TmBDRSt5G1QR4v2cM8MbIYUalqMQBJxsu+OWtnEA6gfEgPvygSBg9K1BOxR53cW51NHCz1LPicpufCfAlk48SpX/rjTA/HjTFLwtTtXiK0PPDBJlHm6WiGJjNj6y9nEW516fjg9Atr7tx3GdjCo6ulHWORhQGnl1OvFDY37OJsV18tizZ6PTJ+IPvEdkho/INutgzTrgqnBVsc16W6xYC7lG1Gz3TL8EwdSlYP+M7clDtJa0416Ra7IS8CLGDh2hzDiPPUpn78gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oZHusnDBPzwzc0a7UxSnYcfVMLkGswZs9HVPFlp9kc=;
 b=p8L7HzWI7ccMVySL34m6NpSBzI6Z0WC9l85ZM2qpOUabMgn9/DeL67ZdF5PsLqIlsjDWjwshhDnjSNVBjimFXGHH8ONtegaBZmzo8BJ0nN63/Mz9WP5Tz4W+SdYklFhCUtkqF2VTY+31m8J/CkSMwn1PfyWalIlSU8T48U9/iKY=
Received: from BN0PR02CA0003.namprd02.prod.outlook.com (2603:10b6:408:e4::8)
 by LV3PR12MB9187.namprd12.prod.outlook.com (2603:10b6:408:194::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 10 Jul
 2026 14:46:59 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:408:e4:cafe::3e) by BN0PR02CA0003.outlook.office365.com
 (2603:10b6:408:e4::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.13 via Frontend Transport; Fri,
 10 Jul 2026 14:46:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 14:46:59 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 09:46:51 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v5 1/6] platform/x86/amd/hsmp: Serialize ACPI HSMP probe and remove with an rwsem
Date: Fri, 10 Jul 2026 20:16:28 +0530
Message-ID: <20260710144633.879018-2-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260710144633.879018-1-muralidhara.mk@amd.com>
References: <20260710144633.879018-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|LV3PR12MB9187:EE_
X-MS-Office365-Filtering-Correlation-Id: f5223c26-a813-462e-ff5e-08dede9218e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BvyhWfLxRubBe1uN9XcEPTvo1pslflR5R+yCbsojxGB05HcTDYYKn2k+J8VukBuTRwdxJSEMwLjuTOs5HYJCd5nh2ps8jmErXO1X/EXigklaXLSv3gxMHhhGsLN4ALJ6splmu8rJPAXC7dGiChPwmTgbAxGYhjMlUaUpPXrvX1syuAq64t/7e+S8VPE5JCJxAB0sQpOrmmadyQ7FLEoWQHFR7bcWJ92peackxMUHRE8PZUxyB9P1ECG42zp9zXoRgpsFo5M2Mh1RHuJIY7jUtNH6AVzuZ1SyvhTlzcNLtg4R7NrKRTo5MTJVlaz+NjZBnTrxxcVjwKN3t7ZzlkfPC9UMqHeYeGw7kP/++kx8dztrGkhAf7EpjUYlhR2PPfA8al3vxJpV5t/HytYrMi9XLsgjcvShs5Jpw//e7ONpykat4rsWgKDJsAjFjYi6o3rQwIaQQqLLH/Zs9v91oYR63ZQ1j5JKn5I+FAUY09bBhtXlRadLmo+MSQ2Z9jnttTqbqf3gFSyc4hZ2F44vjGewc3eHWju8LWtlGvPHBg0unPTsCEsFpJ/FyhXlVzAJbCLynjWySLCtuvnBB1AykC1S0nKQHXkXIC3z5oCttCJ3uJioofwn2msD1Sku70PHq0v4/vo/rhoep+P8gMcOQuYAMhY/eDlBz0D2SP1Yu2OIs6sOgLq8MJiitcJ3KSqS1pmXVxyFNHtgBlnP5q7w9pwAwA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T8om5tBq3YPoZNOZ//ER052r2XVCaXOjSBcD1408ONQAGntffJrLHdmaWunplHKmmiGuo698SW38TvlcCunAiJm7bgKqzvqZYLHsv5PGK/rIHOLaOka7wes4ZfCvkkgJaBddCXUvJKnPv58hoFyCLGheQI2MvK9Zxh1zRxyG29POlQnmRvXsOO5AOWMsFEuT1MLrau1ZFgrXi3bORubto3IzPYjUZLBIRMYB5gy/iqPCoZFHd/LwuWtSScq9ap92tqAUO9iu2wcN+03vQyZvmYireKqnuPgLDdzRoYtb4YzSHM0Ot+AduNdaeCPe2/nKlS2Z01fn/K6k/kywH/x6pEVJ/9LpySTBFUlnvJH2ypzOd0NHKszidyUqQeGklj9JVOHrivqE/65G3QtY4f+ZYvB4JSAhQ9H0zJXYWtkzb6iMKwIFjhh3fvFRPHYAMCI4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 14:46:59.6880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5223c26-a813-462e-ff5e-08dede9218e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9187

Add hsmp_sock_rwsem and export it, then hold it for write across ACPI
probe, remove and init_acpi() so concurrent per-socket platform probes
cannot race the is_probed handshake or the one-time socket-array
allocation. Use lockdep_assert_held_write() in init_acpi() to catch
incorrect locking under lockdep.

An rw_semaphore is used rather than a plain mutex because an upcoming
change adds a read side so the lock-free data plane runs concurrently with
itself while probe/remove hold it for write to drain in-flight messages.
Introducing it as an rwsem now keeps the lock type stable across that
change.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 22 ++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c |  9 +++++++++
 drivers/platform/x86/amd/hsmp/hsmp.h |  7 +++++++
 3 files changed, 38 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 72f68cef1297..a23797bd1dd5 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -15,12 +15,15 @@
 #include <linux/array_size.h>
 #include <linux/bits.h>
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/ioport.h>
 #include <linux/kstrtox.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/rwsem.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
 #include <linux/topology.h>
@@ -482,11 +485,20 @@ static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_att
 	return len;
 }
 
+/*
+ * Bring up one ACPI HSMP socket: parse its ACPI table, run the mailbox
+ * handshake and register its sysfs/hwmon interfaces.
+ *
+ * Called with hsmp_sock_rwsem held for write by hsmp_acpi_probe(), so the
+ * per-socket bring-up cannot race a concurrent probe or remove.
+ */
 static int init_acpi(struct device *dev)
 {
 	u16 sock_ind;
 	int ret;
 
+	lockdep_assert_held_write(&hsmp_sock_rwsem);
+
 	ret = hsmp_get_uid(dev, &sock_ind);
 	if (ret)
 		return ret;
@@ -607,6 +619,14 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 	if (!hsmp_pdev)
 		return -ENOMEM;
 
+	/*
+	 * Multiple ACPI socket devices probe in parallel, but the is_probed
+	 * handshake and the one-time socket-array allocation below must run
+	 * exactly once.  Serialize the whole bring-up against concurrent
+	 * probe/remove by holding the socket rwsem for write.
+	 */
+	guard(rwsem_write)(&hsmp_sock_rwsem);
+
 	if (!hsmp_pdev->is_probed) {
 		hsmp_pdev->num_sockets = topology_max_packages();
 		if (!hsmp_pdev->num_sockets) {
@@ -642,6 +662,8 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 
 static void hsmp_acpi_remove(struct platform_device *pdev)
 {
+	guard(rwsem_write)(&hsmp_sock_rwsem);
+
 	/*
 	 * We register only one misc_device even on multi-socket system.
 	 * So, deregister should happen only once.
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 1a87931136fd..e9c17698983c 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -12,6 +12,7 @@
 #include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/rwsem.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
 
@@ -40,6 +41,14 @@
 
 static struct hsmp_plat_device hsmp_pdev;
 
+/*
+ * Serializes AMD HSMP socket bring-up and teardown: ACPI probe and remove take
+ * it for write so concurrent per-socket probes cannot race the is_probed
+ * handshake or the one-time socket-array allocation.
+ */
+DECLARE_RWSEM(hsmp_sock_rwsem);
+EXPORT_SYMBOL_NS_GPL(hsmp_sock_rwsem, "AMD_HSMP");
+
 /*
  * Send a message to the HSMP port via PCI-e config space registers
  * or by writing to MMIO space.
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 0509a442eaae..129200d0cf81 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -16,6 +16,7 @@
 #include <linux/kconfig.h>
 #include <linux/miscdevice.h>
 #include <linux/pci.h>
+#include <linux/rwsem.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
 
@@ -71,4 +72,10 @@ int hsmp_create_sensor(struct device *dev, u16 sock_ind);
 static inline int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
 #endif
 int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args);
+
+/*
+ * Serializes HSMP socket bring-up and teardown. ACPI probe and remove take it
+ * for write.
+ */
+extern struct rw_semaphore hsmp_sock_rwsem;
 #endif /* HSMP_H */
-- 
2.34.1

