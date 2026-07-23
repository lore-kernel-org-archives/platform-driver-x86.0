Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010051.outbound.protection.outlook.com [52.101.56.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED41346ACE;
	Thu, 23 Jul 2026 09:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800041; cv=fail; b=Cd+iEbV16VD9x5vh6BoqaRKnjlSRsD9h++nPB/E4v3YyJp23tNQwlJcoiOYLgiLJpwEtRD9hNdZy8z4mjFvw3NQpJHdJnJzv9Zh13CN3esAVs6sM4c25fd/9626ngkgPnZ4dAIJ4tt7Jmu9ffk4ceqJM1oyFqRxWqlbZlJwVojM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800041; c=relaxed/simple;
	bh=0NXPWYua/Ovcc7dRZXcUwc9utJaJXIEE/Tc4VLgbXWY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C2Wu/cGYgz3Z9QTmYQ6yFEDEdyY/DyKpQxN+KT0wmKFcLXrxeHlXCmG4EL7v23YJYpW8qGUK8exSxqyAHodx+fmw9xDgCVUCZ3oDSwqLHGfP1Z+3HqxEVubDA64AwxfSuplBOWs5SG4oUroUwyNuNygTDhIohq/cs2q+FAu6jwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uPd1eklG; arc=fail smtp.client-ip=52.101.56.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uPd1eklG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSUnPAEBJNpvfp8Fo/VV3Z1pUCQx4l/PM+PmD/dq4z0Wz70q4vkPYlKWuBJrupthOkzOWjKUOpg2WN3firc75H51z2lYB7oWWmqsBzWoqpgDqJwQmo8fBUon7qXdLugxUYZ1hUWQ5oBb0X/vnOPVbhgI0jP4c78gFywbetzKl1UQeNJDQcQ0iJ8gmOlBelrt469tcS+StRl6ztBAE3iYaHi3njJOERbaHkhlMGcraDssuu1dBeL0YrXVRhmngCxiTFTMRb/SvDTXZzPC9lf9Pn7xXuY1CnbI/31NIXa1rVKxqv1Hx31MpH+C1fv0GnJlYPkHGpnuWHNr6g6DMRtFBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=su0fIOSQl1Jg5BSbfiAbCFUrkr0w/SPg8rkCPKxWD0U=;
 b=xLkrN1o1vrHCQFefOBY90P2MdWjxtqVQYz5SBkYVSefqQSPblkRGRCpFHDYqSijxys89Rcz7h/sAhh0D5vimPNwW/QkurLmTugOSrnyxJpY87JbLVGnBULF0iQmrAYGjhSwZz5T5aRYcojoT7CdMiSkZTON1/OolDiZi+OTwr70bdxJe+ewCYATlfcq4RsD8qNko6efsjxA2H5/Q08z5EIMCpCoj+zdZB7nPIG59pI9o1FPH66uRjMOk5SDM3cxxBWKbKr+gQHgATjLW0TT7/UCSJPbBsU7OwBkoKYr8oiAj/Mr5XSbq5LG7pY36NN7StiaF2fMTHoQaQhdblwHtUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=su0fIOSQl1Jg5BSbfiAbCFUrkr0w/SPg8rkCPKxWD0U=;
 b=uPd1eklGgZD+zwVdxpDcMvLnGjMVbSRo5WKUe9WC9kFpKpFdTIAbff8PL/Z7b3Yr6p0Wnb4O5faiP0JCCQmehVr0+KF5lt1CiIclUM1FZxb1Hyq6YvrWQhhPpjui6FioLEDacPVX3ZhevzKyp78VZZ3P4JsL5LSPtLsR86hsMBQ=
Received: from SA1PR04CA0018.namprd04.prod.outlook.com (2603:10b6:806:2ce::23)
 by PH0PR12MB8031.namprd12.prod.outlook.com (2603:10b6:510:28e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:47:15 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::ab) by SA1PR04CA0018.outlook.office365.com
 (2603:10b6:806:2ce::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 09:47:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 09:47:15 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 04:47:13 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v7 1/6] platform/x86/amd/hsmp: Serialize ACPI HSMP probe and remove with an rwsem
Date: Thu, 23 Jul 2026 15:16:51 +0530
Message-ID: <20260723094656.3806028-2-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723094656.3806028-1-muralidhara.mk@amd.com>
References: <20260723094656.3806028-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|PH0PR12MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: d3ba1d4b-88c8-46cf-77bf-08dee89f60ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vHxF6kn3y1A6Ry8MevzsIPcYKGvNPhshyuP7NwzrwPtn7TPg4nelJrwCibbDqNV4fawLoZjTuFRaMCJ+RoVMj3ajuk4Pu+4TOb8TCbNz5t3Eez8j0MlCUb4Akz74Z27P4k0Bo0FoDUiuzrgqD+CVJfq3VlwSj6CtmesFo1hrKGCMxk2E03XDOagJ/msPysqQIUOheFrR4VAXozoVdWVxxSeBz44A2acSYoaGpgYVuZXprEc5NllVa6XP3uuTSPKnK06Wb/rdX6oP993BwFcynkwluB5QARx0RcUmrgOHZC6OdLPBKO9yh4D5T2Qay0DZyC8IL9CGIFpJvJCphLXdNcTxRBXMRzuEhxXSfuBTZNe93OU4tfNWg7pWbFm0oO2gylCzX2A2BaEJHEN2hLqWDiRvvXq1RRAlmGbUJSvr2IqRzJyvj3RgYL0sXU/xa2GD/uhpMkB6eNFbGUeeHPyZeR9IBQ/wMchhkqFSgq3vaXHC8tmeYjdV1TFmBGZYoFJqx0c81fyk6oB1MuozHm8EbiPlLvDGzLDlpatcoLgQNSXvyQOR6rSk4wyBciQhLsG0oHhGVPfruDPd11yOLGF6JL0HzTZaoSpADLh8qR1/lvOwKz061UAyqKg/3A7/Hwhfw9CZVq0PApcnQhNAFo3bY/3Tg2Z8tC+NmLQLZDRfcRBo8HhYFUhlT/x4tFqDANcU
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0jYBbfKpMVBBqL2+R5B8PFMIhKuqK8wieu0gFKWv+CJUCz5XChI1vfXy1bGmVpGJrMrFrxnZ4vt6ecSZ+7yNpXVGrgr9PMcE97zBzXF7N7vW5XXivn/Qi4LopGMhKYA2gg3MS5Ee7czKI7ZxHKOjSol/hicqv12hsQhzFmw4c+4rNBc950StL6lwLAj9e/0AjgDlLY1IHjlD/RO7pFqZt9FNQBJ1bd49eoZlhUBlM78ASrHiMR3Vps5Kxz+4MqCSVjE6ZKrdh2hQAXPb0MmykpJDVgSdg0ZFdCCPOiewy1e8fKhjx0kVxRBzXZONdUOpdvshC0C64PneVwiTvmJNSQMaWO0BmiyyEi2g2HWc8c/LKepPgL0ZVQupaUPL2SJlPsmisEDcuTyrvqWOdnhI2hzRxdliFXlx3253fPV0cbFqKMLeArmv0BOw9my2FJi4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:47:15.3909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ba1d4b-88c8-46cf-77bf-08dee89f60ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8031

Add hsmp_sock_rwsem and export it, then hold it for write across ACPI
probe, remove and init_acpi() so concurrent per-socket platform probes
cannot race the is_probed handshake or the one-time socket-array
allocation. Use lockdep_assert_held_write() in init_acpi() to catch
incorrect locking under lockdep.

An rw_semaphore is used rather than a plain mutex because an upcoming
change adds a read side so data-plane messages run concurrently with each
other while probe/remove hold it for write to drain in-flight messages.
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

