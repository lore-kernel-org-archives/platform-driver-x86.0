Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C60F4307A8;
	Fri, 10 Jul 2026 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694838; cv=fail; b=KIn7NZyfpSWINJVO/N2xmi7oMrxBNAzzX/JRAL6sZSRzwv2u48uWZiPjYc+ENFsi5j2/CMU92XD7+GjY9Pnc5Vol8lygKaK2IkbdCrdLK7PRxxPB40xushlEV8GnaOshuv7rmlTMRGBmQbR4d2LECRqdKGjNqoRgj5rfZhZXcYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694838; c=relaxed/simple;
	bh=DzjGM70ccraJdRVkBcjY6TLBCF27C5/CgS1yRM52yrM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mCN/aXBUVSQcfx/Muqs2JEpfmqzWioXHBuViVKsbgmwRfHh086P/EjNY5mwO8dknzhZAn2UC/jjYOdJm5ehndMCHpGYQoyWCKDaFvCFbfntjlBuFlhRBshx1tqVuTD4zERwit5mwPar8tr4cK8vDVVlZV7+8IaTvwJ4YoK4gpRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=C9uykpNI; arc=fail smtp.client-ip=52.101.56.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="C9uykpNI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQMi0S5xegwRVOuv00xZIme007fQ4txoDj44EGjKPAinJWfwlHcxiN8kqS6zYoSPS2d0XVsYD22yVdUcMb6aWvRNnYi530509bfd9mGWtkGLNs9AXkMLkkY3OL/hTonnkOx5pt4CE8EamBdaaBATLz7GP9EpfAK+bDF+uioo9wJ4VixOb08bTswjkPhsi8osp5+/QnZE6HngzMeDVAw16oNxgXkQgPyUJH8nN1+UJ+gSehAMVFTFymNmO51s/WcNFrccvTXsj6/9WQH2zMOmXcLNGIrzlHWR7DOCg+RrEDO8zqoOvt2tf+2xIC4TJvJuF8Q/t9+vjAu7gSYPLF15Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WU0ZTv4R686eg7J+L3A36hCuMTr4wjy9VGbRZ5GXf5c=;
 b=tEoK6cdkP0IgOXT7xU6vmTh7UdMDkfzhw3DfUMbs0i2UaqZbWU7sUUjUHbYmD4CmbjIT7CiZ9OI4y7oiAlrRP35ygb1Yq4snDXsKms7cgzueJ9MH5Yv1pRRub1DHjftAeDnVlUZ8gwSvfUwee6FD2YD9dvFU/SQshwBk2IjjlAravXk8k4ThQPzHDabywIRSM3JTXwxfu9q2qux3QG8q9e7F/3KOTWmh0sGONDm3Ik1Ee3010nRVkMeBSMr2W4pZTdM77uSDFbgEumIkSq9lz0eTT1ULvZ9RriJea+ATyHTnEVlZTRcS6gTmX8re+8QyZSUQWF8pG24ltlacstFIHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WU0ZTv4R686eg7J+L3A36hCuMTr4wjy9VGbRZ5GXf5c=;
 b=C9uykpNIwxF4xtj1yG2/0tCg2wPQPguOSXht1EGzb7SDv71Mwy84GuGRqs7kWcfBFcOMIijD7KtuMOQAf4RpRZf8PRtYb9PKTTJKKoEPdlMfTaMDiB5E8DXBLYRz57S2xqIlYBC2lDGzqzIgtCRwRtLCO6fa6DAz5BFtyumiMZs=
Received: from BN0PR02CA0011.namprd02.prod.outlook.com (2603:10b6:408:e4::16)
 by IA1PR12MB6161.namprd12.prod.outlook.com (2603:10b6:208:3eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 14:47:10 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:408:e4:cafe::a5) by BN0PR02CA0011.outlook.office365.com
 (2603:10b6:408:e4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.12 via Frontend Transport; Fri,
 10 Jul 2026 14:47:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 14:47:10 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 09:46:59 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v5 5/6] platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinated release
Date: Fri, 10 Jul 2026 20:16:32 +0530
Message-ID: <20260710144633.879018-6-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|IA1PR12MB6161:EE_
X-MS-Office365-Filtering-Correlation-Id: 08b965c5-5969-45f4-3dfa-08dede921f35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|18002099003|22082099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	BIbGPhCyGO1Ta9kn9Jg2Tk3uCEdD8LRShuCZwznNOdYtYwix9KZcpbz6tWSYYpzxQTh4SmT3KOW2+VhJ8b8lFMlT1Mulyy1aEp7SaAjqKTp7NE2HnT4YnqiBmLkKEnKBOi+l0FNkaJ8VIA5hegz23pdXjt4CfbJrWakbY1GyLDjA3CF8b0/6iYdGEdMYcM8ZJRhyCDti5uuU2yT167sieDojW6Pj2Rl/db4CK+v0JMSkJXC6SUvRFeGsAgrtTEJLKVihJBGfTYPY2q6iU0joUENd48KBT3yV8tqHLaVK5aTtXOfDLKSJQogZKO4Y5emTfI4/nVwPeADdE4/8buLLE1xwvpj/HfzceWfKnjqNqw4UF10tMbA5p62PpeIF6jXzR5Cg0Pdfj/rTRn8fVfzlzKsrLf7ZVuCZGuUu4Mj0r46GYhdFE/OhXS9yEa3DfKv9HmpT0zWclUMjWSUMS0L5hWJF+HvievfB8MPBn16kFV/+65Fp5RmofqUbTGx07rpHJY3j3zHwcD1ttVQuW52qBwTZ3Y2ZYltogtHleR2PfUZJSoN1HZPHxcZg0Ey1ARNnQu3h5DAc69c1/kAS4q8ZLdtXgzF7hmh35rLynl/WaD4NGch7AqWB60c5UOr3JxZxBM8Vezkw4hWAfSg6FjqL+dvDCpvxCUsM8UZhR1D0NkZIciPzeq615BMeBCRG8EhqYMQsmf4IdQ4qSMjLJZS+4A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(18002099003)(22082099003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uPXED0g0CGDcRpRISXzZbZ4am4xy+TMWHJjqfvz//7ec9xRGFdJGYKvvPkWz5gM+HMrVxZuAxteifExwFUTec/CBxrdDcRXnZVLrRlMp8MYtFuza5YSV3Au8UZObQnot7c3ESM7CpErNpx+cvLWOW/Cud3aUvq9T3A8oaBdvLM30szlX+dvlUxUuvF8mIDW/DinDDFSenJyf6IezNewwiYQ/eLIFJ2xw/UFqEpFywfkEVX7yv0Y++DsUN7J74qc8sI3qqWPSD3l7icJCc46sRi6hskfXkqkLSIrqvzZvv/ybK2VKiwheKFtDMAF/MEiFCr8aiTU0IY09iEWBys55a8/0mN1pgMuoo2D5NqlMQAB/R136SH8kJoYbHlZxudcdtvZgc3QY0bunucX8+fPIzD7txgFC3x/EIynTGW76el+CXC90ehtLId/AN9TeSO0V
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 14:47:10.2924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b965c5-5969-45f4-3dfa-08dede921f35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6161

The ACPI driver binds one platform device per socket but shares a single
socket array and a single /dev/hsmp misc device across them. Replace the
is_probed flag with state that tracks this shared ownership:

 - miscdevice.this_device tells whether /dev/hsmp is registered, so the
   misc device is registered on the first socket and torn down last. A
   preceding change clears mdev.this_device on deregister so this gate
   stays reliable across a re-probe.

 - hsmp_acpi_sock_refs counts the sockets that have probed successfully.
   It is guarded by hsmp_sock_rwsem, which probe and remove already hold
   for write, so a plain counter is enough and no atomic refcount is
   needed. The shared socket array is allocated with kcalloc() on the first
   probe and freed by hsmp_acpi_sock_release() when the count drops back to
   zero.

hsmp_acpi_sock_release() is the single teardown helper: it deregisters
/dev/hsmp if registered, unmaps any metric-table DRAM, destroys the
per-socket mutexes and frees the array. The remove path and the
probe-failure path each call it once they are the last owner, so the
teardown lives in one place.

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
 drivers/platform/x86/amd/hsmp/acpi.c | 122 ++++++++++++++++++++++-----
 drivers/platform/x86/amd/hsmp/hsmp.c |  20 +++++
 drivers/platform/x86/amd/hsmp/hsmp.h |   1 -
 3 files changed, 123 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index a092d7589bcb..8339af1624f4 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -24,6 +24,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/rwsem.h>
+#include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
 #include <linux/topology.h>
@@ -42,6 +43,14 @@
 
 static struct hsmp_plat_device *hsmp_pdev;
 
+/*
+ * Number of ACPI socket platform devices that have probed successfully.
+ * Guarded by hsmp_sock_rwsem, which probe and remove hold for write, so a
+ * plain counter is enough; no atomic is needed. The shared socket array is
+ * allocated on the first probe and freed once this drops back to zero.
+ */
+static unsigned int hsmp_acpi_sock_refs;
+
 struct hsmp_sys_attr {
 	struct device_attribute dattr;
 	u32 msg_id;
@@ -611,6 +620,60 @@ static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
 
+/*
+ * Tear down the shared ACPI socket state once the last socket is gone:
+ * deregister /dev/hsmp if it was registered, unmap any metric-table DRAM,
+ * destroy the per-socket mutexes and free the socket array.
+ *
+ * Called with hsmp_sock_rwsem held for write by the remove and probe-failure
+ * paths. The write lock has drained any in-flight hsmp_send_message(), so
+ * unmapping the mailbox and freeing the array cannot race the lock-free data
+ * plane.
+ */
+static void hsmp_acpi_sock_release(void)
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
+ * This device never incremented hsmp_acpi_sock_refs, so clear its sock->dev
+ * and, if it was the only socket in play, release the shared state.
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
+	if (!hsmp_acpi_sock_refs)
+		hsmp_acpi_sock_release();
+}
+
 static int hsmp_acpi_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -620,23 +683,24 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
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
 
@@ -646,35 +710,55 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
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
 
+	hsmp_acpi_sock_refs++;
+
 	return 0;
 }
 
 static void hsmp_acpi_remove(struct platform_device *pdev)
 {
+	struct hsmp_socket *sock = dev_get_drvdata(&pdev->dev);
+
+	/*
+	 * Serialize the decrement and any release it triggers against a
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
+	hsmp_acpi_sock_refs--;
+	if (!hsmp_acpi_sock_refs)
+		hsmp_acpi_sock_release();
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

