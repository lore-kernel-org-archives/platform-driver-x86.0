Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011058.outbound.protection.outlook.com [40.107.208.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9625A3E1D05;
	Thu, 25 Jun 2026 12:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782390861; cv=fail; b=udiDFNnsMN5+3hGSBwa7NS8r1MWzR7NewEqWkRbTPuquQ4XvMW1wTFaQMB9OI8LHzickI7TZs+aVyXJ2GuHTxBUQ9vl/vcqM4rHIJ8jvl+KmE9Td96WKDKvQCmV6eC2qy8JDblMK3JEedSEuyjW71/gwpqofzSimaNx0bOTPKkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782390861; c=relaxed/simple;
	bh=3g0PL0FJgRIuDXjtwlBcAZFW1U9Sq/B1IYJ/4LNk/yE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eu13wZfttK+1gl7Emzl+qHjEC0yjUhEfje1QxSE+pVI7ReS7IFNBbHNKR48QYPWw4iprL/9JdQr/W9VXNdfuIwudf/GTv+FUsl3sn060fulyPChMOPUmNqW9/tZjV8F/D90MB7bw8roeACI8Tj2Q8fzhCBdsI4LjTGhtEBBu1zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=csVEcLi/; arc=fail smtp.client-ip=40.107.208.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="csVEcLi/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flr2wLYaIQ48tx0rFgVq9L2l8Or3UsRd2d+tCqTYYvlbKo27GLuGwws/57/NZbWtaqZWEypa0g8e2/cNmu/FhpiOQMZj90G/SCkxwfK42pPWcGUYB2xGfYR20DSOw3aJZyhSmL/P2Pn9/5tHSiykTFqXFGMklpBqf2DCux44d5WlybNDfCu4wnpu+R6qxKq+cryoIRV1H6w92Vikh947DBHFbjkCGnYdd4wfd4Ahy7dBObPk5V9ZWb3mhxd47/UW7ERKzwar/JmMUPb6+4GX9auYXQWNpQvvwonH0W2jWQun+Y/KqEoxn2mOQ9LRfiJX8LXpJcUCzzCVZM5LBSW33A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUbC/b40DDpFo3ki6b58CFb6D7y6abbKp7ZLeCBtwyE=;
 b=oHfiDvw0uGGlgghgPzySTlVnP8iPkITfHvjEEtCLUCYjdQlxAJxpgjDS1G0o84vw5EtNGnzdi6cHFtRBVpiQl0PeilbH23BH4VMZ8GTEJdDzk/2VvIePoVwO0BOwCd6wQ2PSdihnvs45Bdw/Ps4R4+rOTibE4+XMuztZDsZjPZZ3OjLuMlasLxN9EC+J2Pa+1fQalGgV5gJJ1M362IURnBgmcwQUQzOhKwFTpr1DVmG/Tuk3Ar2FTSeSHXFooZ3OQE0M4n9geRfuQsVXnvpRWd+/v3B0HtJDzorc6fycNCvQnQ8uz7K48ntcix/9fIsBPxkBijl1JBIgvuS4FHbx/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUbC/b40DDpFo3ki6b58CFb6D7y6abbKp7ZLeCBtwyE=;
 b=csVEcLi/B3qTC/WhI+h7WfFJUoLCsga5YdqgfqyH3+DbertZ1AvnoXiCK3ysA4d7/0K/BRPp6TpigFtDuzu6cKfKNUmdUIWpdK/AjbLOv48BlwemWIkYdnZEKKZMBK3q228sWiUMy197uR3WpvoXU08FUhvm2Zboop4+9LdH1Gs=
Received: from CH0PR03CA0261.namprd03.prod.outlook.com (2603:10b6:610:e5::26)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 12:34:11 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::9c) by CH0PR03CA0261.outlook.office365.com
 (2603:10b6:610:e5::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 12:34:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 12:34:10 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 25 Jun
 2026 07:34:08 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <muthusamy.ramalingam@amd.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v2 5/7] platform/x86/amd/hsmp: Serialize the data plane against socket teardown
Date: Thu, 25 Jun 2026 18:03:35 +0530
Message-ID: <20260625123337.886435-6-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625123337.886435-1-muralidhara.mk@amd.com>
References: <20260625123337.886435-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d26032-161c-4682-7747-08ded2b60ec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|11063799006|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	slTgnZoYBwn3WYPJBV9w/bc3GCSVLoJjn5je51EKOT6VNAmAcw8g9UL1paZYYPDu9vSOcjbzlwEQCwTcTxrJ/asfIuwk3RJpvdgLp9Va+nwvPXsJEG2iL+XIO+OgywvKUKUeX6IBQtstf+UDzBjIDXI1U9RPl+u6cOhpYqoAUO1YwqxJjylm1tuaMm9g4yVVnUMbTi9dqZ3k4h2HgwTGwTEDRZVmD+HosxNYTP3AtfPVsNZ4dFpN2ZLQwiFD/nE+THZQWy2N0ZtxMcyFpxCz5/M1+QLYP54A0KyPo6KSz3BnVAUYt+dX/RDAeHzsdSJMVgglpzunI9XMTvJ1MkYi4rd1eBcJ47bucnGYjqRJF1GVPanh98RAkEcwOX58hrXmWEanUCL+qYXAer5THk8RM5uXCLKV5no4L4GlhB1yPClejoOZlTt+M0Em+yUQAVD+s/p2PavxJB+nkrwMo+CUlDZ2cIYg8UUF9dtxOrEq5pzmcTPqaamPMiIFhAHTKET2aRk6kL42t1mRakvDfkLZ1lqufXEIQpDCajFf9GWeMWIIhAd2qmZHrb0JEvP41T+Zz098PqwqMzbfjzojDdjxcJY0qNRmAgvjwJhsCAXJdkAuItf7igcBev7tPSXwrqsiHYBNQvmtqYdsVQ0Rwt1wtQLU+CrZ7jP0w91JSrjb5c6gvJM7OeUcIJNaRWHSvpstpu/ZmtHzU+Q587x9DARS2A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WpTgdQbbCNihF5cSKnHEX9s1VMUO4Y2WQPvfwOrFep2FeUFujDh0JCL2LsD3pLZy0WHmHMITG9GRCu2TzSppDVonCsZXyHEgg6JqJ8BA+BNRyZvvixKr0YobKVqWH73BPa7//gY4vQzUPr6jn9heRdtLGDDbfS6VfAW5+kTyQ8meL86KXZU2XgC0eCy92HuUTYQVPp23YIBNFaq9eKQBYG2TRPwDtzm6K+NUNS9BHOxSK/IIlZlglXLWcLed3vw1JMbF/y0EDX4eT6bAkbJXuzamY4r834Apulp2dpQ0ld/0wR5g4eNOR6xbnlqheqZpS0U0Qqbp+rzAHkGWsE09x46/WF0rLcKp1zLuqlgHwkeforhyDk7Gcllv5CQNx122/34DHTkMnnWh5qvdAFW1fzJYrKzYXV7Oy5gYrc+9osv5usuXRAfJRD0o4OXOhkNF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 12:34:10.6598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d26032-161c-4682-7747-08ded2b60ec6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287

The HSMP data plane is lock-free: open /dev/hsmp fds and hwmon sysfs
reads call hsmp_send_message() without any coordination with driver
teardown.  misc_deregister() does not drain already-open fds, so an
in-flight message can race a concurrent unbind and touch a freed socket
array or an unmapped mailbox.

Add hsmp_sock_rwsem.  hsmp_send_message() now holds it for read across
the whole bounds-check + MMIO access, and hsmp_sock_teardown_lock()/
hsmp_sock_teardown_unlock() let a teardown path hold it for write to
drain any in-flight message and keep new ones out while it tears the
socket down.

Wire the non-ACPI platform path into the drain: hsmp_pltdrv_remove()
and the probe-failure cleanup take the write lock and drop the global
socket pointer before devres frees the devm_kcalloc() array.  num_sockets
is left intact so a later rebind can re-create the array.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 55 +++++++++++++++++++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.h |  2 +
 drivers/platform/x86/amd/hsmp/plat.c | 23 ++++++++++++
 3 files changed, 74 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index c3939908d95f..c15acba241c4 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include <linux/mutex.h>
 #include <linux/nospec.h>
+#include <linux/rwsem.h>
 #include <linux/semaphore.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
@@ -44,6 +45,16 @@
 
 static struct hsmp_plat_device hsmp_pdev;
 
+/*
+ * Serializes the lock-free data plane (hsmp_send_message() and the per-socket
+ * MMIO access it performs) against socket teardown.  Callers of the data plane
+ * hold it for read so multiple sockets can be driven concurrently; ACPI
+ * removal holds it for write while it clears sock->dev, frees the socket array
+ * and unmaps the mailbox, so a reader can never observe a half-torn-down or
+ * freed socket.
+ */
+static DECLARE_RWSEM(hsmp_sock_rwsem);
+
 /*
  * Send a message to the HSMP port via PCI-e config space registers
  * or by writing to MMIO space.
@@ -215,8 +226,19 @@ int hsmp_send_message(struct hsmp_message *msg)
 	if (ret)
 		return ret;
 
-	if (!hsmp_pdev.sock || msg->sock_ind >= hsmp_pdev.num_sockets)
-		return -ENODEV;
+	/*
+	 * Hold the teardown rwsem for read across the whole MMIO access.  ACPI
+	 * removal takes it for write before clearing sock->dev, freeing the
+	 * socket array and unmapping the mailbox, so the lock-free data plane
+	 * (open /dev/hsmp fds and hwmon sysfs reads) can never dereference a
+	 * freed socket or touch an unmapped mailbox.
+	 */
+	down_read(&hsmp_sock_rwsem);
+
+	if (!hsmp_pdev.sock || msg->sock_ind >= hsmp_pdev.num_sockets) {
+		ret = -ENODEV;
+		goto out_unlock;
+	}
 
 	/*
 	 * Sanitize sock_ind after the bounds check.  A mispredicted branch can
@@ -235,18 +257,22 @@ int hsmp_send_message(struct hsmp_message *msg)
 	 * semaphore or an unmapped mailbox.  A non-NULL dev also guarantees
 	 * virt_base_addr, the mailbox offsets and the semaphore are visible.
 	 */
-	/* Pairs with smp_store_release(&sock->dev) in hsmp_parse_acpi_table(). */
-	if (!smp_load_acquire(&sock->dev))
-		return -ENODEV;
+	/* Held under hsmp_sock_rwsem; pairs with smp_store_release(&sock->dev). */
+	if (!smp_load_acquire(&sock->dev)) {
+		ret = -ENODEV;
+		goto out_unlock;
+	}
 
 	ret = down_interruptible(&sock->hsmp_sem);
 	if (ret < 0)
-		return ret;
+		goto out_unlock;
 
 	ret = __hsmp_send_message(sock, msg);
 
 	up(&sock->hsmp_sem);
 
+out_unlock:
+	up_read(&hsmp_sock_rwsem);
 	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_send_message, "AMD_HSMP");
@@ -529,6 +555,23 @@ struct hsmp_plat_device *get_hsmp_pdev(void)
 }
 EXPORT_SYMBOL_NS_GPL(get_hsmp_pdev, "AMD_HSMP");
 
+/*
+ * Take the write side of the data-plane rwsem.  A caller tearing a socket down
+ * uses this to drain any in-flight hsmp_send_message() and to keep new ones out
+ * while it clears sock->dev, frees the socket array or unmaps the mailbox.
+ */
+void hsmp_sock_teardown_lock(void)
+{
+	down_write(&hsmp_sock_rwsem);
+}
+EXPORT_SYMBOL_NS_GPL(hsmp_sock_teardown_lock, "AMD_HSMP");
+
+void hsmp_sock_teardown_unlock(void)
+{
+	up_write(&hsmp_sock_rwsem);
+}
+EXPORT_SYMBOL_NS_GPL(hsmp_sock_teardown_unlock, "AMD_HSMP");
+
 MODULE_DESCRIPTION("AMD HSMP Common driver");
 MODULE_VERSION(DRIVER_VERSION);
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 91bc21232646..5d0a6d819865 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -70,6 +70,8 @@ void hsmp_init_metric_read_locks(struct hsmp_plat_device *pdev, u16 num_sockets)
 ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
 void hsmp_destroy_metric_read_locks(struct hsmp_plat_device *pdev, u16 num_sockets);
 struct hsmp_plat_device *get_hsmp_pdev(void);
+void hsmp_sock_teardown_lock(void);
+void hsmp_sock_teardown_unlock(void);
 #if IS_ENABLED(CONFIG_HWMON)
 int hsmp_create_sensor(struct device *dev, u16 sock_ind);
 #else
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 685f2d2c574b..26c1363e79a1 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -233,15 +233,38 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 	 * init_platform_device() may have ioremap()ed metric tables before
 	 * failing.  hsmp_destroy_metric_read_locks() unmaps them and tears
 	 * down the per-socket mutexes; the socket array itself is devm-managed.
+	 *
+	 * init_platform_device() also runs the data plane (hsmp_test()), so
+	 * drain it via the teardown rwsem and drop the global socket pointer
+	 * before devres frees the array.  num_sockets is left intact: it is
+	 * only computed once in __init (amd_num_nodes()) and is needed to
+	 * re-create the array on a later rebind.
 	 */
+	hsmp_sock_teardown_lock();
 	hsmp_destroy_metric_read_locks(hsmp_pdev, hsmp_pdev->num_sockets);
+	hsmp_pdev->sock = NULL;
+	hsmp_sock_teardown_unlock();
 	return ret;
 }
 
 static void hsmp_pltdrv_remove(struct platform_device *pdev)
 {
+	/*
+	 * Drain the lock-free data plane and keep it out while the sockets are
+	 * torn down.  misc_deregister() does not drain already-open /dev/hsmp
+	 * fds and the driver permits sysfs unbind, so without this an in-flight
+	 * hsmp_send_message() could touch the devres-freed socket array or an
+	 * iounmap()ed metric table.  Dropping the global socket pointer makes
+	 * later messages bail out at the first check.  num_sockets is left
+	 * intact so an unbind/rebind cycle can re-create the array; it is only
+	 * computed once in __init (amd_num_nodes()) and is never recomputed on
+	 * probe.
+	 */
+	hsmp_sock_teardown_lock();
 	hsmp_misc_deregister();
 	hsmp_destroy_metric_read_locks(hsmp_pdev, hsmp_pdev->num_sockets);
+	hsmp_pdev->sock = NULL;
+	hsmp_sock_teardown_unlock();
 }
 
 static struct platform_driver amd_hsmp_driver = {
-- 
2.43.0

