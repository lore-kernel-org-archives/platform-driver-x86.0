Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012004.outbound.protection.outlook.com [40.93.195.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2951431E4B;
	Thu, 23 Jul 2026 09:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800050; cv=fail; b=SQ7MvTV0xVbF0Sf8hNy9TIYg9CSkh8lrw8PhWYyLGhjdnEKWah+0jxsYDK4Ae4KLi6aTgPsswMKy+Ww46NQ37womJJnIFBxQh5tSUwupzOOYZoPrnWrQohp9iNoQu+RkwN+DSsM1GefODmFllTofjSpE5OqSsOQfzMa6WiLC3zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800050; c=relaxed/simple;
	bh=gUTHi3e/VcKLsB6QcWsNGl+dQab7fcn3JU0uAHJU4Bs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bAJ+PRqDecy/dIw9e3w2Oi8Vps6HC1zCYfmvW/T//blK4/iDKg5S/dRrcd7CYrg30RLTjw6/OEEGlqydc9eJhXFKyffKUBEX2SndnIrAAFG/GV+ZktKWJov0KKmGi4gVsoq0QbefCNVkkkUvrDqQDubPi/osEH4XWOGX/+I/Hho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Uax7YkdY; arc=fail smtp.client-ip=40.93.195.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Uax7YkdY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wf+xVA2j0gFDUEvHxk5OcHEESOaHxDUIHfyBJAqn4dVYFkJlY7VhTBndVp6Arjf594/fhkenmHQdGTefW8cTN9vHbvx5mDlDV1Uj5Z7YkBXYE6modn2vbsil2X3/GLASGhQZcpzH1j4Q5YwqLA+fyARXRMbv4m3QgKQlS+cNlfM/ruFrMVekssJg0c39ypXUyu0EaSNj7xrJhzNnWJUvWBmxFJle6zYOodbwLqf3tyRs5n8VDbbiyJHR5IQ1KH9P4JHFrf8FYXdVW3xvCpdLCEkKI0L0VmB1PPBfQU15cURYul/BZySbjQMBc3m/SdblpaRwwOGOaDA4AX0DAwE0sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsH+h3PKL1f/+YVQcPzLjAXsqNDRDMIdYtvuyBVmkQo=;
 b=pKRvxReyGuoZBCMagInuBs446bVSmay8yJZ2JsL2h7YAS43foC0jVWva7ashv69Rjzb9Mujw4U3jqqIdMMlzX5NAZJvcsheycfz63UNAEgzhs2dt1kM3Hr/CX/ai1o22OSx2YYxiB6rqo50LwAmCcy8uvMQiI8ji0JXkDw8Tv0VcpEOpQhazfcUpSXu3q2NOsHFBuAOZhf7XrC9I+XZBgfGTCT+4BHhTUPx9/0IgxM2/1o8kLljA77YHn2g9G6ZG6lD2l69BPKRq4XD0TguDWZ8lZ0HH8WyTapY+EYzv2H9n1vZerv1vvuN3yNZ17aEaxJr7ZgYeZUzB5TRRSPVfdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsH+h3PKL1f/+YVQcPzLjAXsqNDRDMIdYtvuyBVmkQo=;
 b=Uax7YkdYBk5g0xl8LQpOyooEFlFKfOJqyQhWfBG4wkvTjou6OVeXwGz6n26fkvJipWiJJ6jEQZLlmAt1+cUTWmphKiWjJCGMLU4EuvDgwbByNRFYQUKVwEyBCwOkz+8KBUrKPiGg0gt8rLasQ+5nwVFUYPsWEhymapJ0D/p3sXQ=
Received: from PH8P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::9)
 by DS4PR12MB9745.namprd12.prod.outlook.com (2603:10b6:8:2a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:47:24 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:510:2d8:cafe::97) by PH8P221CA0004.outlook.office365.com
 (2603:10b6:510:2d8::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 09:47:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 09:47:23 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 04:47:21 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v7 5/6] platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinated release
Date: Thu, 23 Jul 2026 15:16:55 +0530
Message-ID: <20260723094656.3806028-6-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|DS4PR12MB9745:EE_
X-MS-Office365-Filtering-Correlation-Id: 24aee42a-fb63-47ba-b4f9-08dee89f6592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	g6I9qQq60wmqAmB6rIE3vjjmsXr9uafkX83aE3+4SKuqxuckgau0SriPlOwn/nvTr3iWfwkC93B28Le8lzOedpnl1dSRjHM79vktm+Tm0RQ0XiLc9RvE/GWQ+cSmkRagX5vFH9oVSRtdh+peynWJVA4oBCsjz77q8/3walLig7umEKfN9zOI24fiasYMOUYf4mwoikUeHwryS5UWz6YRSNWOnhoWuGmY/d0/cd/7RkXSlmjB+dv8KMW0lesKmxJPKIZTje3mntvUoRErgi9izyU9wBWwEp/nBsBFJOT97viqKxoMhfHdhsEPAOe6r5Rl+rcTE02SXACuuzybwyPmIa1qwzoXu6tD50FAVJXjq6hUWmQpJu0NYGtyoQbhHL/QYjaH1a3Pfrx5cwzqpsY7q7E0L0Zhw3iSd7M/zNpL0eeyHdTt4q/SZOMcP5JMUJWCDpbdiTO3NRcMT6HcgG6iq0Ca/D/ZJzGbZHRpHLLnFixpvZnzWa9ygUMgH+8wO6A8lIDI1k2a/HV4cjNs4paiy0Y4CUWlMBKjURa58iLTzf5Zobp4jsOiEUVSsC6ysBxMQJafyaYIfitlqmZWpcFkI2epYCOvoOHUMIy/+lu0b1oFyJqFmxQcyr/gVUd0paAOGfUHa+Q/2DgdfBv9ZMVO8HkLIDQxJXnvXrJJ/9S57lBPVpn34e5JHXjN+agz9ngJpAVeVznJKOtU6SmI3Q7Fbg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x/RYZunmM19eL8oG5VyKoPek+Qctj9Rmd6bjvJkRGJap4oL96i2Ky+/HGvLO0He3Jn/HGxRAzTY4szPriFb+WNu+iM3tJ1rV+zx+4wHb8yVSP7/PjlBl/9Gz/2kALWqdsdMDaWbBhTZXFmf30Pv91tZstnW5nmzZAEgp41zxVKEu5OWBbUJJV9Dh0t8aHyni4QuSfAuH+bAXzF+YBtFTDLkOJ629m3Fn+0j0VV0TlQwxPdOXmPVQxCqBtlUFymd25ZPJrByUd3DXqoxgBDZY/lQae4A2oc24F+nD3PM57Yrx1CEsdW5NwT7idGiMhpvD2BIFJs3pZ8tUsB4aM58KuId3xJW1pvAYi71ScaDUKAZIH36OI0TNiEbo6HM6rGH5AFvkwT67/wpiQHlHRipEXTDiAoIU125oVi5JpwvcEhMdqFWQRaY4sNAJze6hS3Dw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:47:23.4120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24aee42a-fb63-47ba-b4f9-08dee89f6592
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9745

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
its read side so the same lock also drains the data plane.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 131 +++++++++++++++++++++++----
 drivers/platform/x86/amd/hsmp/hsmp.c |  20 ++++
 drivers/platform/x86/amd/hsmp/hsmp.h |   1 -
 3 files changed, 132 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index a092d7589bcb..24f54dc7254f 100644
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
+ * and freeing the array cannot race the data plane.
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
+	 * probe-failure teardown drains the data plane.
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
+	 * concurrent probe, and drain the data plane for the whole
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

