Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012020.outbound.protection.outlook.com [52.101.48.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3483317144;
	Tue,  7 Jul 2026 05:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401479; cv=fail; b=WU0cLgPwkA82vgdiI/u2N0oXlIvbyh3O+96dgo3olNWGjW2PHIx/2aW53KRBiPK6zYwXHpN05/NuW2fDf3YQtT22MhAljFzjcPP290bHExA/69kQZNpyNL8AcyiiJralZdu5zyLE53IH8Tbrx8AqseMfdFwwXLU0S5KTwoPsQHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401479; c=relaxed/simple;
	bh=wAxWI81LALMEtB0n/VhmAatErCi5Oz9+u7zq0CJAG9A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ivpHbXcci2TpTB0v+BXY7CZIMWULdzVhLDSUkhON6LiQiHy3BgnBYCUEVELiRRLkzocWf355E22ssLvXIRLOARBX1uXdU13KtQeAn5VGFUxggwsjRwhkNf4nV/wbLLpkxB7+Bj7soY5aVLisktbFe4isrnCliEzOA7fOrb+2Ico=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ex09PfZD; arc=fail smtp.client-ip=52.101.48.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ex09PfZD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIERBqlICAtcjTkIpgSAU610U6QYmTBr9wbd1npu/jtmfNOukI2Po4DmCPyJc98WFKjlHmxf9yFQVIKOmrwJl67Wr3m/QDsUAMxzZhad3flSYYwOT9pPMfTSfdSXl/x7fWl3zIEJlDAmLai1kGynE04j8KGUjK1Yc6tcjBU4BeFVTh2XxI10E1l7VOcXu3EZeTcylE32x0VfuOHPw1Jt0ENFvg/Qt/grvAJOWHO+0ISjmhBWkc39Y0A7Kx3fCBOaBtPaTyprBiFA79tjBIzvqKPsCC8VrNV2MEf7fHGBH285A1RAddr4YDqP/HP8VEhcLlXfzkcQPCUjyjWFo77QTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEn5iUPFv65WensWLQZB8Zrs31Mr6s8XL6NQUQdGINY=;
 b=h3h9B20wqZvpPAOGj02qLdLbfZvlHDp+XApsYi4wMO4Ef7iWAWOA6OGRN5B7CoaevI82HXeRArzXArFUFYo6kypKFqTRX7n2Ya4phTvUN5mgsr14XeaI1NsbATgLOOkFI0ALyzoxpQSmJqQrtDhMbcnYeNN/GHINwhVpLSDGhtd7Qow7rWA4znNwRUsEJB6R9Op8MYZhgdZMksIBigk5NvuU0RWdfRICSB+kdRnO15nBIkjq3k4OELJUi4cEPAARvSz7nXlF5KgiZ0OFGttcCK/lkBxcoXNDl5bJfRBiAxmDWnnlkKwP9oqGWVFR35Udb2UO0r2/zGIttfsj9tdN1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEn5iUPFv65WensWLQZB8Zrs31Mr6s8XL6NQUQdGINY=;
 b=Ex09PfZDx2Pf4DgRo2MWalBrFAFDKF8i1t8p64ThsRPPBxnjZwDl5LA3hxz8kEz6kHD8UxENsKKZJQpQrzVBbTnNKYMoHpDp0kVKT51pOJS7hzMprXwTrYRZWZVgS9i6Zfq3meBaGHdaM8IGFAf9UuMF9AkGQxBoabTdydI1yk8=
Received: from BL1P223CA0037.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::14)
 by PH7PR12MB8593.namprd12.prod.outlook.com (2603:10b6:510:1b1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 05:17:48 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:5b6:cafe::15) by BL1P223CA0037.outlook.office365.com
 (2603:10b6:208:5b6::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Tue, 7
 Jul 2026 05:17:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 05:17:48 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 00:17:46 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v3 5/5] platform/x86/amd/hsmp: Serialize the data plane against socket teardown
Date: Tue, 7 Jul 2026 10:47:31 +0530
Message-ID: <20260707051731.3382577-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|PH7PR12MB8593:EE_
X-MS-Office365-Filtering-Correlation-Id: b36100d2-1881-4d6a-3487-08dedbe715b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|18002099003|11063799006|5023799004|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	TJbiaIKdClQnYijVojptBLi5a58ePGxnMNNpyatm6wg13LSkC0Pk2VHh0gPvER65TVBAYDjBlBgCIbl+Jak4M1228Bi+fd5vbjzGnS6qOImjDVBxYAESqOSTYJVGBf7QLWsw2eMxbRk3ChReAzQ2HP2no5wRyuQhVc7t3NPkbaMyy84+bcKOCzOE3QcPZdtv+IWfSI8Hd7u9Sbs6kfnWbd5WF92daUh+vdi29U99TKHDTxtjt+WnMFSmc3dfJ2DrGwOvonGg6HITnVwBsN2bnEzWC8EUqq6zELEX3E4uvhJjaYJlk4v0M3iNtfS+jeVQReeft7TKEi9hVwMo6Q410bYGkAss15FvqnlgyvtU85l+Kgvp225/CyoxTH7Zh8YkTZ6dGBfdjepH5SVbzWOMKamudkETgGlFdJFZAN781kSwt5J76mCilKrqd4fQBuOL3YtmFNrJF5npleN2KjiU1nMcJvPFwiRWF5BL/7wX3aXGk5/VeEb91RV3B9IqAfbOY5aMmBZhwto5frBabSqzpcoqfIlJkXwKnBvR5a1jyo8ioPwcLiETzc6hGEVmfG499J85bdWWZWcA9iLy3u/pDJCWfaxCb05HAN+tQgsMTSma4xf9W5UXzcYSsGD2ZHZ2schfR+opv+ALDjj489yXf/dv9do4w49ZlHJOEmaBtO8CfuCO5/K3f51dqe5h7SZbzUhTKOnkyIxi4J/sY/4PcQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(18002099003)(11063799006)(5023799004)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BSPkGR31Wjb/17xaoMc5/Ickokpxoq+neWB6Z+IIrd+ZIEY5desFGewO3jL7ogAX559GnIl8kFYjL/BxJK5esvF7Q5uZalwTSphHhIqAKknZvhYw7+U7uBoBTpCMUlisSgk4x2b4vJ9k3a/dNmztWgZKCkIq8GIn70dpHL/VaIMfJhqKLJfs6t2N4f38ffEmBlCUwFMx+PgiT4cGBW6KMIVtWfv8WPFOtfLCbkDcx64GMUZhQcmeFx4dcFP4AVVTkwe3oQgsEkRv+hsrWf2zuMjMXs+vCh2353FMdt4KD7pHaZgQOeEzlUDPoDfyVbO3Py6T3RXPcvDV4j129ho4gQHCPLV3rGbKWBBNMWzuY6K+mK100mTTmRCXHsVYy+hEf2U9UviEd4HtWh6oPw+I+13XD9G83JExf5u9gLnALqYmcclMdFykXhDKwD6z0G2G
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 05:17:48.1135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b36100d2-1881-4d6a-3487-08dedbe715b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8593

The HSMP data plane is lock-free: open /dev/hsmp fds and hwmon sysfs
reads call hsmp_send_message() without any coordination with driver
teardown.  misc_deregister() does not drain already-open fds, so an
in-flight message can race a concurrent unbind and touch a freed socket
array or an unmapped mailbox.

Add hsmp_sock_rwsem and export it so the data plane and the teardown
paths take it directly.  hsmp_send_message() holds it for read across the
whole bounds-check + MMIO access via guard(rwsem_read) from cleanup.h, so
it is dropped on every return path without adding an unlock label.  A
teardown path holds it for write (down_write() directly at the call site)
to drain any in-flight message and keep new ones out while it tears the
socket down.

Wire both teardown paths into the drain in this patch so it is clear who
locks what:

 - plat.c: hsmp_pltdrv_remove() and the probe-failure cleanup take the
   write lock and drop the global socket pointer before devres frees the
   devm_kcalloc() array.  num_sockets is left intact so a later rebind can
   re-create the array.

 - acpi.c: hsmp_acpi_remove() and the probe-failure cleanup take the write
   lock (nested inside hsmp_acpi_probe_mutex) while they clear sock->dev
   and, on the last unbind, unmap the mailbox and free the socket array via
   hsmp_acpi_sock_release().

hsmp_sock_rwsem is deliberately separate from acpi.c's
hsmp_acpi_probe_mutex: the probe mutex serializes the ACPI control-plane
handshake (one-time socket-array allocation, misc registration state and
the hsmp_acpi_sock_refs lifecycle) across concurrent probe/remove, a scope
this rwsem does not cover.  The two nest as probe_mutex -> rwsem write.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 27 ++++++++++++++++-----
 drivers/platform/x86/amd/hsmp/hsmp.c | 35 +++++++++++++++++++++++++++-
 drivers/platform/x86/amd/hsmp/hsmp.h |  9 +++++++
 drivers/platform/x86/amd/hsmp/plat.c | 23 ++++++++++++++++++
 4 files changed, 87 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 11a478503fa7..ff6154426a81 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -623,9 +623,9 @@ MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
  * destroy the per-socket mutexes and free the socket array.
  *
  * Called with hsmp_acpi_probe_mutex held (serializing it against a concurrent
- * probe).  Coordination with the lock-free data plane (draining in-flight
- * hsmp_send_message() before the mailbox is unmapped and the array is freed)
- * is added in a subsequent patch via the data-plane rwsem.
+ * probe) and with the data-plane rwsem held for write, which has drained any
+ * in-flight hsmp_send_message(), so unmapping the mailbox and freeing the
+ * array here cannot race the lock-free data plane.
  */
 static void hsmp_acpi_sock_release(void)
 {
@@ -653,6 +653,10 @@ static void hsmp_acpi_sock_release(void)
  * remove() is never called for this device, yet devres unmaps its mailbox once
  * probe() returns.  Without clearing dev, a later message to this index would
  * pass every gate in hsmp_send_message() and reach the unmapped mailbox.
+ *
+ * Runs under the data-plane rwsem write side so it is serialized against the
+ * lock-free data plane: init_acpi() runs hsmp_test() and a previously probed
+ * socket may already have exposed /dev/hsmp.
  */
 static void hsmp_acpi_probe_failure_cleanup(struct device *dev)
 {
@@ -660,11 +664,15 @@ static void hsmp_acpi_probe_failure_cleanup(struct device *dev)
 
 	lockdep_assert_held(&hsmp_acpi_probe_mutex);
 
+	down_write(&hsmp_sock_rwsem);
+
 	if (sock)
 		sock->dev = NULL;
 
 	if (!hsmp_acpi_sock_refs)
 		hsmp_acpi_sock_release();
+
+	up_write(&hsmp_sock_rwsem);
 }
 
 static int hsmp_acpi_probe(struct platform_device *pdev)
@@ -725,20 +733,27 @@ static void hsmp_acpi_remove(struct platform_device *pdev)
 	 */
 	guard(mutex)(&hsmp_acpi_probe_mutex);
 
+	/*
+	 * Drain the lock-free data plane and keep it out for the duration of
+	 * the teardown.  This covers both the per-socket unbind (this socket's
+	 * mailbox is unmapped by devres once we return) and the last unbind that
+	 * frees the socket array in hsmp_acpi_sock_release().
+	 */
+	down_write(&hsmp_sock_rwsem);
+
 	/*
 	 * Clear this socket's dev so hsmp_send_message() rejects it before
 	 * touching the mailbox that devres is about to unmap.  On a non-final
 	 * unbind the socket array stays alive, so without this a later message
 	 * to this index would reach an unmapped iomem region.
-	 *
-	 * This teardown is drained against the lock-free data plane in a
-	 * subsequent patch that wires it into the data-plane rwsem.
 	 */
 	if (sock)
 		sock->dev = NULL;
 
 	if (!--hsmp_acpi_sock_refs)
 		hsmp_acpi_sock_release();
+
+	up_write(&hsmp_sock_rwsem);
 }
 
 static struct platform_driver amd_hsmp_driver = {
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 8440671235de..d9b6cb66ee33 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -15,6 +15,7 @@
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/mutex.h>
+#include <linux/rwsem.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
 
@@ -43,6 +44,27 @@
 
 static struct hsmp_plat_device hsmp_pdev;
 
+/*
+ * Serializes the lock-free data plane (hsmp_send_message() and the per-socket
+ * MMIO access it performs) against socket teardown.  Callers of the data plane
+ * take it for read (guard(rwsem_read)) so multiple sockets can be driven
+ * concurrently; a teardown path takes it for write (down_write() directly in
+ * plat.c/acpi.c) while it clears sock->dev, frees the socket array or unmaps
+ * the mailbox, so a reader can never observe a half-torn-down or freed socket.
+ *
+ * This is distinct from acpi.c's hsmp_acpi_probe_mutex: that mutex serializes
+ * the ACPI control-plane handshake (one-time socket-array allocation, misc
+ * device registration state and the socket refcount lifecycle) across
+ * concurrent per-socket probe/remove, a scope this rwsem intentionally does
+ * not cover.  A teardown path nests the rwsem write side inside that mutex.
+ *
+ * Both teardown paths take the write side directly: the non-ACPI platform
+ * path (plat.c) and the ACPI path (acpi.c), the latter relying on the
+ * refcounted socket ownership added in the preceding patch.
+ */
+DECLARE_RWSEM(hsmp_sock_rwsem);
+EXPORT_SYMBOL_NS_GPL(hsmp_sock_rwsem, "AMD_HSMP");
+
 /*
  * Send a message to the HSMP port via PCI-e config space registers
  * or by writing to MMIO space.
@@ -214,6 +236,16 @@ int hsmp_send_message(struct hsmp_message *msg)
 	if (ret)
 		return ret;
 
+	/*
+	 * Hold the teardown rwsem for read across the whole MMIO access.  A
+	 * teardown path takes it for write before clearing sock->dev, freeing
+	 * the socket array or unmapping the mailbox, so the lock-free data plane
+	 * (open /dev/hsmp fds and hwmon sysfs reads) can never dereference a
+	 * freed socket or touch an unmapped mailbox.  guard() drops it on every
+	 * return path below.
+	 */
+	guard(rwsem_read)(&hsmp_sock_rwsem);
+
 	if (!hsmp_pdev.sock || msg->sock_ind >= hsmp_pdev.num_sockets)
 		return -ENODEV;
 
@@ -234,7 +266,8 @@ int hsmp_send_message(struct hsmp_message *msg)
 	 * non-NULL dev also guarantees virt_base_addr, the mailbox offsets and
 	 * the semaphore are visible.
 	 *
-	 * Pairs with smp_store_release(&sock->dev) in hsmp_parse_acpi_table().
+	 * Held under hsmp_sock_rwsem; pairs with smp_store_release(&sock->dev)
+	 * in hsmp_parse_acpi_table().
 	 */
 	if (!smp_load_acquire(&sock->dev))
 		return -ENODEV;
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 9036cb221635..091c9e92a80c 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -17,6 +17,7 @@
 #include <linux/miscdevice.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/rwsem.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
 
@@ -70,6 +71,14 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
 void hsmp_destroy_metric_read_locks(struct hsmp_plat_device *pdev);
 void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev);
 struct hsmp_plat_device *get_hsmp_pdev(void);
+
+/*
+ * Data-plane teardown rwsem.  hsmp_send_message() holds it for read; a
+ * teardown path in plat.c/acpi.c holds it for write (down_write()) to drain
+ * the data plane while it clears sock->dev, frees the socket array or unmaps
+ * the mailbox.
+ */
+extern struct rw_semaphore hsmp_sock_rwsem;
 #if IS_ENABLED(CONFIG_HWMON)
 int hsmp_create_sensor(struct device *dev, u16 sock_ind);
 #else
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 8b3e5e767327..3ad4471ed46e 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -234,17 +234,40 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 	 * failing.  hsmp_unmap_metric_tbls() drops those mappings and
 	 * hsmp_destroy_metric_read_locks() tears down the per-socket mutexes;
 	 * the socket array itself is devm-managed.
+	 *
+	 * init_platform_device() also runs the data plane (hsmp_test()), so
+	 * drain it via the write side of hsmp_sock_rwsem and drop the global
+	 * socket pointer before devres frees the array.  num_sockets is left
+	 * intact: it is only computed once in __init (amd_num_nodes()) and is
+	 * needed to re-create the array on a later rebind.
 	 */
+	down_write(&hsmp_sock_rwsem);
 	hsmp_unmap_metric_tbls(hsmp_pdev);
 	hsmp_destroy_metric_read_locks(hsmp_pdev);
+	hsmp_pdev->sock = NULL;
+	up_write(&hsmp_sock_rwsem);
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
+	down_write(&hsmp_sock_rwsem);
 	hsmp_misc_deregister();
 	hsmp_unmap_metric_tbls(hsmp_pdev);
 	hsmp_destroy_metric_read_locks(hsmp_pdev);
+	hsmp_pdev->sock = NULL;
+	up_write(&hsmp_sock_rwsem);
 }
 
 static struct platform_driver amd_hsmp_driver = {
-- 
2.34.1

