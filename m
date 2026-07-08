Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010042.outbound.protection.outlook.com [52.101.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C143B7742;
	Wed,  8 Jul 2026 04:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783484693; cv=fail; b=cnKNzefErLXLRKC/4ETd94mQ4kAGSzMirujtuC6MqhbscWAAzeTzjjDqy6Gu0z3NYNWG9FT/CzOwsS3Uh7pcm1sbLEWir6EfdUxWGvl1wQQWPAu9gQZ1hG3ZDab+MuKpVU4easDljqTkpy3xcZPXW39lLQWKDwRaJ2qf4uAhRaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783484693; c=relaxed/simple;
	bh=ZfAV+2O3D45iZkWK+C2uvtP3OJrSg0QZQob09EfYjI0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IP0PCgLTsgHFllimHQq+ocH40a0gQaQVVJXcr55CqTKonNWjFfDejR/vi9ES7DCtIL15hvpzNdgCbRTjjg7KsKqFuYHhuPpv0JCrDgh+b/DiW7PG04jnwtCpHfZOEFgRNBuPkmy0a8xxIVsew4tKF8NrT7QXLShAd2Nwll0gVQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=e3dUxkeY; arc=fail smtp.client-ip=52.101.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="e3dUxkeY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKCL0sSaKE0z9XUaSNYVzgyDCxo6OvfdBIvaRNgXL2YVw7T399A9yGuhoLtcj8ogkhOAeL6iUdaRLlT/ir73h67/b9teqdMHDgj038INzzk30tXgspzA1dY/iqruU+hzG4/uxaNe10+y/3rcg5xaHmifmYoVugxakNtoHur5lfx+JWJgFIjN7+3hnsGmi7jlkSr9DafWhY3lURSSJvw2TGeRONwGF/E+86sUwQd9GVcYSezt6KPeovJ2jpnLeOjAiY8rRZaVSVkv+LQO9e4td3Gs/Q8q0nlQAO7+o3+RBbBtaXm/6Kxdz3BWUCMtz3hl96laBTwH+yy/yhdY0OCl4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRFN/+j2x5KF7RoK+hVpTEo/H4VsUm1tKacSOJ132bk=;
 b=m5RluDx+8ZN++5TGw6JT7Bf0rPuCyPuSUSRvy16OUlP68ch44VeNhk2rsQEQ+scEQFcNIMy1Wv7GBMGvYQE//1HO2y4dcHYblzVjIwNjZKKs14hG0vze4TOoHqeN9iiZ23sp6OI+mxnHcG5kPy+hF/BMjdOKQK4SBDMQ8MgU+hPT6EXUVyBm9pWcDcibyq/0fFF66m24WrSOzQSPCQo6D+j9mrlswrRxCWCQioposxvZ4SjUoD6b/k1YXN6lg4W4YpSW0CO517h1P/LKqTQUkN2x814v3So1uRDJrq9Jw0dQKgVzZT4QsEJrohGjH9Et1Px6gqTcnYYwpX72RgF4cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRFN/+j2x5KF7RoK+hVpTEo/H4VsUm1tKacSOJ132bk=;
 b=e3dUxkeYW+c/iU9c02Zp4ADksedZUpSA+oZMNE8qV4jKUUxFLKGW3S+2OBz995m4/7D7/MouXEnNikS2tbZiRIz8WkPv9nAppFMZiRMe/POvJllZ7moOOcyGwO9P0KfDYAVtiXPUPyMzmPNUfWQD7hi3xkKW0YQm34HzwqkIqeI=
Received: from CH5P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::10)
 by LV2PR12MB5894.namprd12.prod.outlook.com (2603:10b6:408:174::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 04:24:41 +0000
Received: from DM2PEPF00003FC2.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::f) by CH5P222CA0021.outlook.office365.com
 (2603:10b6:610:1ee::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 04:24:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC2.mail.protection.outlook.com (10.167.23.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 04:24:41 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 23:24:38 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v4 6/6] platform/x86/amd/hsmp: Serialize the data plane against socket teardown
Date: Wed, 8 Jul 2026 09:54:05 +0530
Message-ID: <20260708042405.3758294-7-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708042405.3758294-1-muralidhara.mk@amd.com>
References: <20260708042405.3758294-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC2:EE_|LV2PR12MB5894:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fce45a8-31ac-4ef4-dab8-08dedca8d483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|5023799004|11063799006|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uIl0oOxTuPnpI5rYfcct+Gq34Y0hHEw5cb4hPgrPZGIxg36jiJqa8Z1iT88L3PR6HC3ECuGxYGh0JegLv0ZakSo0uwLcBSH5isHXW6EqsodlDdWkx9ZQ6RQ17TaCf8SHIkLQtz+E2kwxpwm5Sbe3fwNyPWClOgF0MQHqmBi2PXMqLjCiIsUOk51HMz/l5hdMmP1VYuRCf9S8llB+/EVtxRFjqLJGvOtF+/icY9gAVtQki/N4lrN3UzBcaV7Jw2WP9lH/z8P8puMXt/3cbXcfe0K1QK6jTlmkwHNgKzopnbdTF2//XJES26L/4LUKLoBlVsmbI7aBltqVYKg6ucPBPoSPvYriQW/0oiyBfL7O/o8f1LBpvL+vwbtNiJ5WPjEonhor6I+VT5i5vsDGMglSIQkDUz4gAqHfGhaeZqh16PXWxIQFVJMBB4+sm+zFhFpy3OaAuXn6M/PfOJ262OL23HOsi6aCXSQvWkvvsy2vu3l+MZ0B3kDHncOBqZ7bTnm5GqihPsMHOsgwkjvJo84O5fkX0KrJY8HXN7q+g0k9tCtRX+UIy/y5r94wqs3J0QVl9TpOhsloKLWaRSNzPLe3Io8YNjRO9/xRZmJh0HXtwsGz3is3oQBIm0zP/yYnjHUiXtWzC4u0j0B/mWpxJV0thgf1W3coAXjS1dp8V4XEECFReFxqqKfCSbDXwsCblvZxmuYKe7clqXfQDFD1co/PHg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(5023799004)(11063799006)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3rxY5BQ7jO93d9w39M+BDYWUc8TOh4MI5Ej75jCgnaAWeaBuR2vrie/y4vRfj1aQVWauNX1QkMeFJ7+XIea7DbmT0svdauTDFtvbKY9e45A5XKV3EljBtvpH+KIK8YodTBiIpRBuz+cYruPiRdyAnetSa49cknI0vFHY405e0yHvLyr+uoqW0Dxwci6DT+PEriglS2Z5jXX6Q1hlU04OCo2mRrkK1UIOIvUkqjf17HWFP2pd/4YZLNzZusXhuPliXJci11PBYmKrg10IXPkqRh3X3BQx/NeUHeWxhn+6SfsP58ofjUmnofIZcO37kznA6QbWE6iulvXKBp1SYPdFJ6wiWi9qZLSPue32fS3MaIo9OLixtNVM7KFsJnkyJWtBHeoZaLD4vcHWm4yIS2XkCBvASBpgl7MAWa4g53hMsGpGSwhYiXaR3KdRYyUCFzpf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 04:24:41.0415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fce45a8-31ac-4ef4-dab8-08dedca8d483
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5894

The HSMP data plane is lock-free: open /dev/hsmp fds and hwmon sysfs reads
call hsmp_send_message() without any coordination with driver teardown.
misc_deregister() does not drain already-open fds, so an in-flight message
can race a concurrent unbind and touch a freed socket array or an unmapped
mailbox.

Add hsmp_sock_rwsem and export it so the data plane and the teardown paths
take it directly. hsmp_send_message() holds it for read across the whole
bounds-check + MMIO access via guard(rwsem_read), so it is dropped on every
return path without an unlock label. A teardown path holds it for write to
drain any in-flight message and keep new ones out while it tears the socket
down.

Wire both teardown paths into the drain:

 - plat.c: the devres release action takes the write lock, unmaps the
   metric tables, destroys the per-socket mutexes and drops the global
   socket pointer before devres frees the array.

 - acpi.c: hsmp_acpi_remove() and the probe-failure cleanup take the write
   lock (nested inside hsmp_acpi_probe_mutex) while they clear sock->dev
   and, on the last unbind, unmap the mailbox and free the socket array via
   hsmp_acpi_sock_release().

hsmp_sock_rwsem is deliberately separate from acpi.c's
hsmp_acpi_probe_mutex, which serializes the ACPI control-plane handshake
(socket-array allocation, misc registration state and the sock refcount
lifecycle). The ACPI probe path cannot reuse this rwsem for that: it drives
the data plane itself through hsmp_test(), which takes the rwsem for read,
so holding it for write across probe would deadlock. The two nest as
probe_mutex -> rwsem write.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 19 ++++++++++++++++-
 drivers/platform/x86/amd/hsmp/hsmp.c | 32 +++++++++++++++++++++++++++-
 drivers/platform/x86/amd/hsmp/hsmp.h |  8 +++++++
 drivers/platform/x86/amd/hsmp/plat.c |  8 +++++++
 4 files changed, 65 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index d35465079eea..814f0a812a85 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -24,6 +24,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/rwsem.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
 #include <linux/topology.h>
@@ -629,7 +630,9 @@ MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
  * destroy the per-socket mutexes and free the socket array.
  *
  * Called with hsmp_acpi_probe_mutex held, serializing it against a concurrent
- * probe.
+ * probe, and with hsmp_sock_rwsem held for write, which has drained any
+ * in-flight hsmp_send_message() so unmapping the mailbox and freeing the array
+ * cannot race the lock-free data plane.
  */
 static void hsmp_acpi_sock_release(void)
 {
@@ -659,6 +662,10 @@ static void hsmp_acpi_sock_release(void)
  * pass every gate in hsmp_send_message() and reach the unmapped mailbox.
  *
  * sock is NULL if probe failed before hsmp_parse_acpi_table() set the drvdata.
+ *
+ * Takes hsmp_sock_rwsem for write to serialize against the lock-free data
+ * plane: init_acpi() drives hsmp_test() and a previously probed socket may
+ * already have exposed /dev/hsmp.
  */
 static void hsmp_acpi_probe_failure_cleanup(struct device *dev)
 {
@@ -666,6 +673,8 @@ static void hsmp_acpi_probe_failure_cleanup(struct device *dev)
 
 	lockdep_assert_held(&hsmp_acpi_probe_mutex);
 
+	guard(rwsem_write)(&hsmp_sock_rwsem);
+
 	if (sock)
 		sock->dev = NULL;
 
@@ -731,6 +740,14 @@ static void hsmp_acpi_remove(struct platform_device *pdev)
 	 */
 	guard(mutex)(&hsmp_acpi_probe_mutex);
 
+	/*
+	 * Drain the lock-free data plane and keep it out for the whole
+	 * teardown. This covers the per-socket unbind, whose mailbox devres
+	 * unmaps once we return, and the last unbind that frees the socket
+	 * array in hsmp_acpi_sock_release().
+	 */
+	guard(rwsem_write)(&hsmp_sock_rwsem);
+
 	/*
 	 * Clear this socket's dev so hsmp_send_message() rejects it before
 	 * devres unmaps the mailbox. On a non-final unbind the socket array
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index e47e86116f16..ab77a4996ebb 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -15,6 +15,7 @@
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/mutex.h>
+#include <linux/rwsem.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
 
@@ -43,6 +44,25 @@
 
 static struct hsmp_plat_device hsmp_pdev;
 
+/*
+ * Serializes the lock-free data plane (hsmp_send_message() and the per-socket
+ * MMIO access it performs) against socket teardown. The data plane takes it
+ * for read so multiple sockets can be driven concurrently; a teardown path
+ * takes it for write while it clears sock->dev, frees the socket array or
+ * unmaps the mailbox, so a reader can never observe a half-torn-down or freed
+ * socket.
+ *
+ * This is distinct from acpi.c's hsmp_acpi_probe_mutex, which serializes the
+ * ACPI control-plane handshake: the one-time socket-array allocation, misc
+ * device registration state and the socket refcount lifecycle. The ACPI probe
+ * path cannot use this rwsem for that: it drives the data plane itself through
+ * hsmp_test(), which takes the rwsem for read, so holding it for write across
+ * probe would deadlock. A teardown path instead nests the rwsem write side
+ * inside that mutex.
+ */
+DECLARE_RWSEM(hsmp_sock_rwsem);
+EXPORT_SYMBOL_NS_GPL(hsmp_sock_rwsem, "AMD_HSMP");
+
 /*
  * Send a message to the HSMP port via PCI-e config space registers
  * or by writing to MMIO space.
@@ -214,6 +234,15 @@ int hsmp_send_message(struct hsmp_message *msg)
 	if (ret)
 		return ret;
 
+	/*
+	 * Hold the teardown rwsem for read across the whole MMIO access. A
+	 * teardown path takes it for write before clearing sock->dev, freeing
+	 * the socket array or unmapping the mailbox, so the lock-free data
+	 * plane can never dereference a freed socket or touch an unmapped
+	 * mailbox. guard() drops it on every return path below.
+	 */
+	guard(rwsem_read)(&hsmp_sock_rwsem);
+
 	if (!hsmp_pdev.sock || msg->sock_ind >= hsmp_pdev.num_sockets)
 		return -ENODEV;
 
@@ -234,7 +263,8 @@ int hsmp_send_message(struct hsmp_message *msg)
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
index bc2050dcfdb5..9c36a9252c73 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -17,6 +17,7 @@
 #include <linux/miscdevice.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/rwsem.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
 
@@ -70,6 +71,13 @@ void hsmp_init_metric_read_locks(struct hsmp_plat_device *pdev);
 void hsmp_destroy_metric_read_locks(struct hsmp_plat_device *pdev);
 void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev);
 struct hsmp_plat_device *get_hsmp_pdev(void);
+
+/*
+ * Data-plane teardown rwsem. hsmp_send_message() holds it for read; a teardown
+ * path in plat.c/acpi.c holds it for write to drain the data plane while it
+ * clears sock->dev, frees the socket array or unmaps the mailbox.
+ */
+extern struct rw_semaphore hsmp_sock_rwsem;
 #if IS_ENABLED(CONFIG_HWMON)
 int hsmp_create_sensor(struct device *dev, u16 sock_ind);
 #else
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index d46dcb8c7f03..f704095eeeb0 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -13,12 +13,14 @@
 
 #include <linux/acpi.h>
 #include <linux/build_bug.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/kconfig.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/rwsem.h>
 #include <linux/sysfs.h>
 
 #include <asm/amd/node.h>
@@ -206,11 +208,17 @@ static int init_platform_device(struct device *dev)
  * per-socket mutexes need an explicit mutex_destroy(), so tear both down
  * here. Registered as a devres action so it also runs on a probe failure
  * after init_platform_device() has mapped some tables.
+ *
+ * Take the data-plane rwsem for write to drain any in-flight
+ * hsmp_send_message() and drop the global socket pointer before devres frees
+ * the array, so a late message bails out at its first check.
  */
 static void hsmp_pltdrv_release(void *data)
 {
+	guard(rwsem_write)(&hsmp_sock_rwsem);
 	hsmp_unmap_metric_tbls(hsmp_pdev);
 	hsmp_destroy_metric_read_locks(hsmp_pdev);
+	hsmp_pdev->sock = NULL;
 }
 
 static int hsmp_pltdrv_probe(struct platform_device *pdev)
-- 
2.34.1

