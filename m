Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012000.outbound.protection.outlook.com [52.101.53.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC7E356751;
	Mon, 13 Jul 2026 04:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783917636; cv=fail; b=JNwjwcR8/8jkKk+TYXkEh1IZO6bIoUwGTF5edazxU8RDOtdfirGujtO39BoeMkB+aBWmCXqitxyjAOwTmzk5BAICBI72GaLP7loLaDrC74Y6XULra2UdwC+mhaWD38C+xyXHapjOxphG+J+ku82vOEWwBBG84gcy8Abl5XNupj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783917636; c=relaxed/simple;
	bh=Hy89uS3vuNGV/PYrOnuTL72Zr4yRo+AfDvK7Hn/ln9k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fwey0vjEMtiVDEJw66H2/Gb4StYeGrdBbkLDUP1ODqlV+6HGTBRDmi2CcTZtBk/e7tDxtkjavAiQqJBSvERS0WZIwb9veZXTnKh3JJK6pX4gjdS6poK3362YYE7qCn2/xLIh6IQH4vThi8MrvnLpxa9ZOpuP2CV+tJQeYEvM6aQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=l6iGNNy+; arc=fail smtp.client-ip=52.101.53.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="l6iGNNy+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kF1WlwiLjX7t4WsXhnx3yIE4RQSqlITr4CuTqnHCx4wpl4nm73NWEiuecxg8WG8ZYqpXApOPc4A9/TMLK3RkDUVTeYnrFTPRjqwbFFrR3BBknLzr6he/tG+EmmfDJlg7IC0NZ/6BO0SiVp3hSgHkGy9GuFiMt959v2MyywbCW7D3CArIcTk8vlts1QDJo1kbDiCU3u7ZKUoyYBB3XX8jHqkc2XN2UvZDx3OeESveRKoKIAV+nrJvy/NSHmKEMFEUw/ZqCOhvZC9eLBVCGfXyjMfLsyM1W0aMw3bWRq1PJqgZmaSEqaNl1Q+S8UCugelsxQx9dR9evWcbwcGsmvLziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oZHusnDBPzwzc0a7UxSnYcfVMLkGswZs9HVPFlp9kc=;
 b=i0Y21dWSwnyZSz0ij2Zs9G026vLE4+Bm+rOLbLPO7L0drZ7TuoT7ICPppanJRijvugVike8zfmFp/1zZxsVJNoHieztDcJzy1NcvmnkhNTG2tqw7HyvkD59KOf9as7eYbJoCqRY2g9goJZWCqx7o28pyI/2hP1n/zBaaAqYXsz5WAGEhDfCVHaXuDNwZfzYPQ5J4wGAimNoHPu67i5UzO0uFMs39jS5OJvEvKeDzh1WlUxeEa1vwhNLrTWPuLsjdfs/qRxMS1SfHF1vKHCcwutYwBu8J91IvQls6r0+GntWQqFeMW41r6SxPzIAN72nxuJ+K4BnEwKDuQwA2LTeB6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oZHusnDBPzwzc0a7UxSnYcfVMLkGswZs9HVPFlp9kc=;
 b=l6iGNNy+0fOHxvtYmo8t07/mR7tSnwSjIizuSt+UqB75aqfrVhF2Va7MvJhkmUDlqdT2nTxXq/AWs6VwVKe5yVRUPzNB5KFU+pO1DdAFvJjWp+e7Va3wk6cxFh0/YpD8y2kOVSdfuoOi7BLODLyTUSOMc/MhM6hx0X9JGq8cgvA=
Received: from MW4P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::22)
 by SA3PR12MB7950.namprd12.prod.outlook.com (2603:10b6:806:31c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 04:40:26 +0000
Received: from CO1PEPF00012E83.namprd03.prod.outlook.com
 (2603:10b6:303:114:cafe::73) by MW4P222CA0017.outlook.office365.com
 (2603:10b6:303:114::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 04:40:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E83.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 04:40:25 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 12 Jul
 2026 23:40:23 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v6 1/6] platform/x86/amd/hsmp: Serialize ACPI HSMP probe and remove with an rwsem
Date: Mon, 13 Jul 2026 10:10:00 +0530
Message-ID: <20260713044005.1194115-2-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713044005.1194115-1-muralidhara.mk@amd.com>
References: <20260713044005.1194115-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E83:EE_|SA3PR12MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: 66a6a7b8-b124-41b8-0cd9-08dee098db9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	qXeH7Gwq8uC51wUngSOPoSrzHXTgjOep9RJd4ozVlrp0NQZPGExkNRvabb54CjRPnK0yhVWccU8y/d18vhezCNT3Kyrk3Z0KDuEMGHHnI+hSkBfYHfYnwtw2cUIyUB/nJavuVMEuMCH53YDa/zUuCxA4VyFYQUeToCKtZ7OeqPuEM27bISRQ1a1ryrCraXLnYkxXgXL3bQUi2qGzRHetJnY/suNQ+JkHClLQQGkY5Bwyec0taGsU24cArbKPtkC7wSmBm/joE9iGssSs7HldbK3u9lVuK/VzI+AoT1OnIV0brgRqfL9EH3r8JHETpRXs5A+qxDY9ncUnLmT4fWo3jbRcKkpe7RWD/dL7PxsPEcgU9xbLsRnaNgP8Zdbq+qUUM2ZdiZ9FfO7zlqdRcf93nakHxfk57SruJlTsi9GTzJDK0pVf1TayvyeABMK+0WQdH7tn+Zp5YgjWvRPXO14iOaFHDUBgcqW3K3/I8vIV75NGcNht5JTrLqDRvy8vxGe4Yo38ZEV88+m6xx0uMMKDA9uxNiVQc7YlB80VKkkd9npt7h77js42036O/lQNfcKCDyTavxo2VdtOZ/bITy5Q7z3K8k3wUQyxybp4j3g6eOgk0Nuhwbcinsp499qNVgTwBZgMsSU3iva2EGB/9LZpTCoa9FcR7yGcRpXg/lxwgSI1x6YKCL8F9sjJiDEDYUZA7OYSiAeFt+E9Qxq451/fQA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5ypxIn1mwNZ2qrZVWLTwTlfabx4gM7RqdYA5g1WPs5yDCo+fAfRX5MC7fGqHf6vX+ifnszY0vErnAwIBNPBQW+m8ihlLaAxdWVVnOC0h+PDO0h9LRUBkL1/hKlAb8IWzJdgzNtYBXftBxfZArc0bWYuF63fQCbkGKu6s72pCpvc5gckIroZG/JoYVqueFd2WaAxwg3tjhOBU4yGppW2iWGhTDyBCy9KZ+byUVgXl+zQtEJkTSU8beEavPjowBHO9jrjvOMONUfgQSxEvI6jKPd/Efm7RBb9g2FWeYmZaX6noo6SEpDME08eNVi4vpfNUMed+m+dzBKZ/YHp+NHBplOFqITcmrd+8MWYqh+Cun1almw3kJnzXlm52GzIzRDGQ5/SawKFSC5CKtqmnG+BuztwYG+W4MAsy3hUV21HdAXH2fYSuoThLshrqUSnc1S82
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 04:40:25.6300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a6a7b8-b124-41b8-0cd9-08dee098db9e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E83.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7950

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

