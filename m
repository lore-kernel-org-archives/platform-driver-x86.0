Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C0037C927;
	Mon, 13 Jul 2026 04:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783917644; cv=fail; b=SrRxpy0+jhFU5aD0pj8z03siCtFfTxBd5ba+5aKBHar7vFexEWGYZ3HfeUGOO+kKczoPiXFFg1xoiRZwRYeiGtSYia/B40rlrLRsFQT0+H+Bsq5VjebMle+A9ycibOWT7tRgXwiMRJq81EQ6lfkG5zzlHt7BRXJlxeDtpDr3/CU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783917644; c=relaxed/simple;
	bh=JJ94/XEbTEBTz5M6I/8nihR2FDdQirxv1Dw7JXZ9mLw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=heAHd2L2gl1AY96/iiwynk65QcPiJpw7BPzowc5SuL8ZzwWSVo/HtlYAL+Lq6agpIC8Oiu5g9DvPYKKbZJ/hBQzzmIa2pCXx4qFVTUXeJHbAgIWrhiFHb6U6mG5tVZKUCmODk70IxhjtFCFqLZ2t13ysnUIC8JsNQhvuH2rjcb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=K5IJiTrY; arc=fail smtp.client-ip=52.101.56.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="K5IJiTrY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCAabLjnrLNqy2p/Rh7SDnwpp2pbexZTJBb8OVJBiAP1Q1VUGKi9CgEwvEQmYf6RPijaYA5xvM33NJdMxb6sVzfauGd4XYCzC8XlYmEWKoVuKLXPW7FkACYiPfOKg9iNPSC1ckLRY1ObsVSyDFN8lxPizlfci1XjPklBOeFmiltq3c/UJH30ATd+g2ZoKrma8tNnY2MRpG7p/mBP+a5PTfcTlYO2u1pbLfOaHcQCoNkZolv1sAHoLBwUj7PIeTecAn7K371jxyTDrkkFAuJoBq/NfLcRNaFvp1jMuPWxxDh3UUrlEVOl+lW1Ao+cxNbG11KdHiCeosSyjU4pEFEEpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GMp/7Z7cYfAKTKgXYKm1t9HjOf7nYAODU6ky3rDNMQ=;
 b=HfEA1CUYbcBqjOMwECeFRSlmY1WlCgA8ypJ8Zu+x06cnCSBJ7vS9vfYz77GYo4bAeCBPcWkj2refegs0plWVe9E9SUmAGNz5ZtwzemtM5mb8Q+H1bAa4UezWoZ30LrXEjgS9YHyCaWSbLYbiW0hzWgA1x0jaHOc0VGUdM3u3naQ2znx4VTc97T0EgQBmUsaRiP31ZGH64eYosPT0ci5mBYmntFBgnIeIFFWlOjOBIClK3YQVsFAUKrLQhXIoCVeeOL3c/CQev8HM0XP13qgfSiIEmwrkJqY0FDRdufSDLtmJD9R+ZLlgvnI1djx+AOEUVenzQVKX9+B9EfD4W1vRXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GMp/7Z7cYfAKTKgXYKm1t9HjOf7nYAODU6ky3rDNMQ=;
 b=K5IJiTrY0zkzkVKxCfeA6R9LkloPO+iCT/SwHx7ZapOOhvfoV4J8qhRYA3XxLMoXFb+Ib+8ZlXu+JScJOhYGh1pdmALJFKV2uZ7Ui+rZ1sCBc2ObGXUknywUlYThlNKTrxEZTNAFoDKazy+LzvKM0+BAKlj5SvefQGjydQ5giDU=
Received: from MW4PR04CA0376.namprd04.prod.outlook.com (2603:10b6:303:81::21)
 by PH0PR12MB7792.namprd12.prod.outlook.com (2603:10b6:510:281::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 04:40:34 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:303:81:cafe::6c) by MW4PR04CA0376.outlook.office365.com
 (2603:10b6:303:81::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 04:40:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 04:40:33 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 12 Jul
 2026 23:40:31 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v6 5/6] platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinated release
Date: Mon, 13 Jul 2026 10:10:04 +0530
Message-ID: <20260713044005.1194115-6-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|PH0PR12MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: a9b0f5ca-a0f2-4fcd-e891-08dee098e021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|6133799003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yhMAMxp0LudEHnIG9XmbREUC2S6JP5ExHa74G8D+NWQrEBQ8pE/FpaRsBPN5ECXsyRXSNJkXoRSG6ARstIO8ggnL2ieS+42HcdNNN5H5TWkoNdfJUcB+LLDuSIZhSGGWpwmdXwnAZHAxkDdkFKzavMDoFhbMhxwmWfjbmjgmuR0Ese+CTwVDRRydx2YgHxiaH0fJafPFGwFBFX6WjiwlSWRsABEWEdLYq05EJe/A+sKCQvLL8/4SOuX+Uj0qEiF2OGt4S0QaG/g/Pt8GJOpxP868vQDWbfgGzDE5+nQRN9hheSjjmB1omtqwyBtC9StZObTw3eTnSq1u+RY/UOQNaKu9KM78hPWp3eSJdN5eKJp3IDufNoz5/GTdDkLg7lZpnuFzfB3lPi+q0hH6KUu+rORpqkleUVqEePcWZKnQnGjQ+T7czgod423sY+a45P/KKnq2/7KZ2LNrvY4xN/PAd58S+q/6CJXjGhZfh+wVw458YS0V3H82khqBjiIvxzSKn8eLz7nmFaQgrNkGaRqCMUtE2hRDezMBvMIXfUWVhqTX41lD0Gx3YofzN7XgNajoG2iUNusbYo9kBuaBw6y98aAXMZYR7vvbEOJMfHTZsC1KEO6lNFk1sxFtav7ZiQP88Eb7zNvJBI+d4is8hFOJl+R9fmPJnwaXo29nTMS8++xPZvMXqyPyUrLTZUVTEK5Say0J3xJIt1kBWQxm1oGg1w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Yr1pg3/hnOTwe9LRZQBu1YQXPZioRlOFFSAomA5W/kFG9O5is7KJns9b2skezoRt6AECJQ9XunHICAGuqB2Vj6OQ45MiXRzJmJP+iO3G0LsX2PcBmpxBV+ivteUZuv3tXzNar/HuAVioQGxUWXkBFYn4KrrzpY1XSDSyioXbXlV9Mj8dNhwTNqJBJDaF7tr/nT44gkLQocCmMk+YO/V+aC8AS/JggGeIvR5NHIbrrrUZQx67Fnw5MUrmTqWwwjO4r2IJG5Uwm26FC4iI5DSxAc9l3doDClKl88XcrWA0AhRo3iSDP70mK1x0qcfAkyEh2wJ/ZAXXz2UpjR/Tul0+HEp//MfpT8/J+h+v8wuuy8rmT813h8uHaDDMtA/X6Jm/P/ZrOGzo8B50gq3ZxFKkhtWb1iAeIA9vm/lP+5o55kkpynFzQRTQR5iHJNZS53Wy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 04:40:33.1844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b0f5ca-a0f2-4fcd-e891-08dee098e021
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7792

The ACPI driver binds one platform device per socket but shares a single
socket array and a single /dev/hsmp misc device across them. Replace the
is_probed flag with state that tracks this shared ownership:

 - miscdevice.this_device tells whether /dev/hsmp is registered, so the
   misc device is registered on the first socket and torn down last. A
   preceding change clears mdev.this_device on deregister so this gate
   stays reliable across a re-probe.

 - a kref tracks the sockets that share the array. The first probe
   initializes it, each further probe takes a reference and every remove
   (or probe failure) drops one; the last put runs the release callback.
   All get/put happen under hsmp_sock_rwsem held for write, so the counting
   is already serialized and kref's atomic is not strictly needed, but kref
   gives the clearer get/put interface and a release callback. The shared
   socket array is allocated with kcalloc() on the first probe and freed by
   the release callback once the last reference is dropped.

hsmp_acpi_sock_release() is the single teardown helper, run from
kref_put(): it deregisters /dev/hsmp if registered, unmaps any
metric-table DRAM, destroys the per-socket mutexes and frees the array.
The remove path and the probe-failure path both reach it through the last
put, so the teardown lives in one place.

Both paths also clear this socket's dev, so a message issued after a
non-final unbind (or to a socket that failed to probe on a multi-socket
system, whose array stays alive and whose remove() is never called) cannot
reach the mailbox that devres is about to unmap.

Two lifetime fixes fall out of the array persisting across a non-final
unbind:

 - hsmp_get_tbl_dram_base() iounmap()s any stale metric_tbl_addr before
   remapping, so a rebind does not leak one mapping per cycle. It runs
   during (re)probe before the metric sysfs attribute is exposed, so no
   reader can be using the old mapping.

 - The ACPI path registers /dev/hsmp unparented by passing NULL to
   hsmp_misc_register(). Its per-socket devices can be unbound individually
   and out of order and the misc device outlives all but the last of them,
   so parenting it to one socket's device would leave a dangling parent.
   hsmp_misc_register() now takes the parent from its caller, so the
   platform driver keeps parenting /dev/hsmp to its single device.

hsmp_sock_rwsem is held for write across probe and remove, so the release
and probe-failure cleanup run with it already held; an upcoming change adds
its read side so the same lock also drains the lock-free data plane.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 131 +++++++++++++++++++++++----
 drivers/platform/x86/amd/hsmp/hsmp.c |  20 ++++
 drivers/platform/x86/amd/hsmp/hsmp.h |   1 -
 3 files changed, 132 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index a092d7589bcb..fa314e9f98bb 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -19,11 +19,13 @@
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/ioport.h>
+#include <linux/kref.h>
 #include <linux/kstrtox.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/rwsem.h>
+#include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
 #include <linux/topology.h>
@@ -42,6 +44,17 @@
 
 static struct hsmp_plat_device *hsmp_pdev;
 
+/*
+ * Tracks the ACPI socket platform devices that share the socket array and the
+ * /dev/hsmp misc device. The first probe initializes it, each further probe
+ * takes a reference and every remove (or probe failure) drops one; the last
+ * put frees the shared state via hsmp_acpi_sock_release(). All get/put run
+ * under hsmp_sock_rwsem held for write, so the counting is already serialized
+ * and the atomic in kref is not strictly needed; kref is used for the clearer
+ * get/put interface and its release callback.
+ */
+static struct kref hsmp_acpi_sock_kref;
+
 struct hsmp_sys_attr {
 	struct device_attribute dattr;
 	u32 msg_id;
@@ -611,6 +624,60 @@ static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
 
+/*
+ * kref release: tear down the shared ACPI socket state once the last socket
+ * drops its reference. Deregister /dev/hsmp if it was registered, unmap any
+ * metric-table DRAM, destroy the per-socket mutexes and free the socket array.
+ *
+ * Runs from kref_put() with hsmp_sock_rwsem held for write, since the remove
+ * and probe-failure paths both drop their reference under that lock. The write
+ * lock has drained any in-flight hsmp_send_message(), so unmapping the mailbox
+ * and freeing the array cannot race the lock-free data plane.
+ */
+static void hsmp_acpi_sock_release(struct kref *kref)
+{
+	lockdep_assert_held_write(&hsmp_sock_rwsem);
+
+	if (!IS_ERR_OR_NULL(hsmp_pdev->mdev.this_device))
+		hsmp_misc_deregister();
+	hsmp_unmap_metric_tbls(hsmp_pdev);
+	hsmp_destroy_metric_read_locks(hsmp_pdev);
+	kfree(hsmp_pdev->sock);
+	hsmp_pdev->sock = NULL;
+	hsmp_pdev->num_sockets = 0;
+	hsmp_pdev->proto_ver = 0;
+}
+
+/**
+ * hsmp_acpi_probe_failure_cleanup() - Undo a failed ACPI socket probe.
+ * @dev: ACPI companion device whose probe failed.
+ *
+ * This device already took a reference on entry to hsmp_acpi_probe(), so clear
+ * its sock->dev and drop that reference; the shared state is released if it was
+ * the last one.
+ *
+ * Clearing sock->dev matters on multi-socket systems: when a non-first socket
+ * fails, the array stays alive (owned by an already-probed socket) and
+ * remove() is never called for this device, yet devres unmaps its mailbox once
+ * probe() returns. Without clearing dev, a later message to this index would
+ * pass every gate in hsmp_send_message() and reach the unmapped mailbox.
+ *
+ * sock is NULL if probe failed before hsmp_parse_acpi_table() set the drvdata.
+ *
+ * Called from hsmp_acpi_probe(), which already holds hsmp_sock_rwsem for write.
+ */
+static void hsmp_acpi_probe_failure_cleanup(struct device *dev)
+{
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+
+	lockdep_assert_held_write(&hsmp_sock_rwsem);
+
+	if (sock)
+		sock->dev = NULL;
+
+	kref_put(&hsmp_acpi_sock_kref, hsmp_acpi_sock_release);
+}
+
 static int hsmp_acpi_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -620,43 +687,60 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/*
-	 * Multiple ACPI socket devices probe in parallel, but the is_probed
-	 * handshake and the one-time socket-array allocation below must run
-	 * exactly once.  Serialize the whole bring-up against concurrent
-	 * probe/remove by holding the socket rwsem for write.
+	 * Multiple ACPI socket devices probe in parallel, but the one-time
+	 * socket-array allocation and /dev/hsmp registration below must run
+	 * exactly once. Hold the socket rwsem for write across the whole
+	 * bring-up so it cannot race a concurrent probe or remove, and so the
+	 * probe-failure teardown drains the lock-free data plane.
 	 */
 	guard(rwsem_write)(&hsmp_sock_rwsem);
 
-	if (!hsmp_pdev->is_probed) {
+	if (!hsmp_pdev->sock) {
 		hsmp_pdev->num_sockets = topology_max_packages();
 		if (!hsmp_pdev->num_sockets) {
 			dev_err(&pdev->dev, "No CPU sockets detected\n");
 			return -ENODEV;
 		}
 
-		hsmp_pdev->sock = devm_kcalloc(&pdev->dev, hsmp_pdev->num_sockets,
-					       sizeof(*hsmp_pdev->sock),
-					       GFP_KERNEL);
+		hsmp_pdev->sock = kcalloc(hsmp_pdev->num_sockets,
+					  sizeof(*hsmp_pdev->sock),
+					  GFP_KERNEL);
 		if (!hsmp_pdev->sock)
 			return -ENOMEM;
 
 		hsmp_init_metric_read_locks(hsmp_pdev);
+		kref_init(&hsmp_acpi_sock_kref);
+	} else {
+		kref_get(&hsmp_acpi_sock_kref);
 	}
 
+	/*
+	 * This socket now holds a reference (kref_init on the first socket,
+	 * kref_get afterwards). Every failure path below drops it via
+	 * hsmp_acpi_probe_failure_cleanup(), and a successful probe hands it to
+	 * hsmp_acpi_remove().
+	 */
 	ret = init_acpi(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
+		hsmp_acpi_probe_failure_cleanup(&pdev->dev);
 		return ret;
 	}
 
-	if (!hsmp_pdev->is_probed) {
-		ret = hsmp_misc_register(&pdev->dev);
+	if (IS_ERR_OR_NULL(hsmp_pdev->mdev.this_device)) {
+		/*
+		 * Register /dev/hsmp unparented. It is a singleton shared by all
+		 * ACPI sockets and outlives all but the last of them, so
+		 * parenting it to this socket's device would leave a dangling
+		 * parent once that socket is unbound.
+		 */
+		ret = hsmp_misc_register(NULL);
 		if (ret) {
 			dev_err(&pdev->dev, "Failed to register misc device\n");
+			hsmp_acpi_probe_failure_cleanup(&pdev->dev);
 			return ret;
 		}
-		hsmp_pdev->is_probed = true;
-		dev_dbg(&pdev->dev, "AMD HSMP ACPI is probed successfully\n");
+		dev_dbg(&pdev->dev, "AMD HSMP ACPI misc device registered\n");
 	}
 
 	return 0;
@@ -664,17 +748,26 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 
 static void hsmp_acpi_remove(struct platform_device *pdev)
 {
+	struct hsmp_socket *sock = dev_get_drvdata(&pdev->dev);
+
+	/*
+	 * Serialize the kref_put() and any release it triggers against a
+	 * concurrent probe, and drain the lock-free data plane for the whole
+	 * teardown: this covers the per-socket unbind, whose mailbox devres
+	 * unmaps once we return, and the last unbind that frees the socket
+	 * array in hsmp_acpi_sock_release().
+	 */
 	guard(rwsem_write)(&hsmp_sock_rwsem);
 
 	/*
-	 * We register only one misc_device even on multi-socket system.
-	 * So, deregister should happen only once.
+	 * Clear this socket's dev so hsmp_send_message() rejects it before
+	 * devres unmaps the mailbox. On a non-final unbind the socket array
+	 * stays alive, so without this a later message to this index would
+	 * reach an unmapped iomem region.
 	 */
-	if (hsmp_pdev->is_probed) {
-		hsmp_misc_deregister();
-		hsmp_destroy_metric_read_locks(hsmp_pdev);
-		hsmp_pdev->is_probed = false;
-	}
+	sock->dev = NULL;
+
+	kref_put(&hsmp_acpi_sock_kref, hsmp_acpi_sock_release);
 }
 
 static struct platform_driver amd_hsmp_driver = {
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 584fd9b1d31f..967307abe641 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -491,6 +491,18 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 		dev_err(sock->dev, "Invalid DRAM address for metric table\n");
 		return -ENOMEM;
 	}
+	/*
+	 * The ACPI socket array is shared across sockets and outlives a
+	 * per-socket unbind, so metric_tbl_addr may hold a mapping from an
+	 * earlier bind of this socket. Unmap it before remapping so an
+	 * unbind/rebind cycle does not leak a metric-table mapping. This runs
+	 * during probe before the metric sysfs attribute is exposed, so no
+	 * reader can be using it.
+	 */
+	if (sock->metric_tbl_addr) {
+		iounmap(sock->metric_tbl_addr);
+		sock->metric_tbl_addr = NULL;
+	}
 	sock->metric_tbl_addr = ioremap(dram_addr, sizeof(struct hsmp_metric_table));
 	if (!sock->metric_tbl_addr) {
 		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
@@ -528,6 +540,14 @@ int hsmp_misc_register(struct device *dev)
 	hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
 	hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
 	hsmp_pdev.mdev.fops	= &hsmp_fops;
+	/*
+	 * The caller chooses the parent. The platform driver has a single
+	 * device whose lifetime matches /dev/hsmp and parents it there. The
+	 * ACPI driver passes NULL: its /dev/hsmp is a singleton shared by
+	 * per-socket devices that can be unbound individually and out of order,
+	 * so parenting it to one would leave it attached to an already-removed
+	 * device.
+	 */
 	hsmp_pdev.mdev.parent	= dev;
 	hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
 	hsmp_pdev.mdev.mode	= 0644;
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index ec92c2a429bb..45dab9253c13 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -58,7 +58,6 @@ struct hsmp_plat_device {
 	struct hsmp_socket *sock;
 	u32 proto_ver;
 	u16 num_sockets;
-	bool is_probed;
 };
 
 int hsmp_cache_proto_ver(u16 sock_ind);
-- 
2.34.1

