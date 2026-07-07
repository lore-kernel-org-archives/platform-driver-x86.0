Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010013.outbound.protection.outlook.com [52.101.85.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4382B3612EC;
	Tue,  7 Jul 2026 05:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401454; cv=fail; b=SOxzOWSGd2CkU5jfbQ80ytfyLv1wxTqMRzceTqZ53X+30MCOuC654z/d70s7xlbC7LWL600IkxGjYq7qxy0b3ATEbDPIpIsN/41tTrTskpdJMHd6o4B9dK5ZfBkTv2UXZ3PPnqqLFJCVWu2CuZ9of2txSfAf4/bNQDhzj1DP7Rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401454; c=relaxed/simple;
	bh=xJv7gjbQOZM0eZelV19zItQK5pQSi+wJhydsKMLUltU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VyASj/QrX9JC4CsFmb5i9yygJ0Yc27kx3s3x2MgOyAzsgovYlo4yA38lrmuRL0ziAfrkcrfrr6x2JTbgaIqZ+i5qVpaq03bouPY0OL42iBZxAr5wKD+JssWyDLqXFWSFFjvEmfHEo0gmH0DkJ0sb/aZmvlRtVHnFjejZ9LRT5bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PWJ5VAQp; arc=fail smtp.client-ip=52.101.85.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PWJ5VAQp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ysafI476gTNlxcUaT7YE4a8Ftd3eqXri2/xs26O2wg8WhM/uQauxHcuLUSvn9YYB84W4T8mTXZj2G92zt+iTgD/wwqOfbQAZlARuTIMGtnMz06c07GdtuAtbErwGauDKDqnMNWhPwnqQWzMdW1iN8LbK+rEZIxAIh449fqb4EZzGoYsseX5YctVwPFnWj20ZBYFJjFNNuzBQ+pf1a6akA35UR+Ptqhsv+BQY+UGzVg+sY6bJ296qP2ips/zDSgfdJDKTWpECi4QFAKdQn1IBlwTKhufKt139ZMF+AReaWIYr7l3EtH1xajFDBGPRGHngLHPj15/QKLiY+ibrV+a0+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOLIHwktxiqeCHey4ksOHtOiO9PsFDB8CMWSXR0kFhs=;
 b=tfpQeexqCUpzYbi/eVoo30Ei7+lmGec+e7a9p0KrS69+i3aqwfA9izNuPpDvn8RJbu/r0Kxl8ENMaMAD7q8I+/SpYU3Dm5tVY3q9w06TUv1pYhEHnG/R5EI7aVzEGiQiGMR1pzBmKKMRqLVBBHOPtXGInFUYafwyrPeF+xjkUpH/kJcw1lt4fDi/XbZYVLle50NfAmnhsJPWvBwMTbqBhAunL7GrCRsEmllWJJ1/dHfVYu4fw5YQJcCORyy+pxIjGRqRlDfBCs6qKjHzkJjY3LRlZpBk0TMvFEGybBlo6CP91ZWaU5zk1AahtikiiuK48D99KyDtAQByDM38Twv6uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOLIHwktxiqeCHey4ksOHtOiO9PsFDB8CMWSXR0kFhs=;
 b=PWJ5VAQp91Q6p6cyffU/G4GF/8hoi1uiwithOlMBeHkwn6l3UHoSJ5e8OXJe8Diwd8gA5ECqshFOv69i9ps5QLRQp+7d2TjmoVpOq4UgHZtdTU4RYBLp/T/sWhaLmVMspgf8PSXHRkAJhoeygNuj9q2s3u4Elrb/wB0b14j7Lu8=
Received: from IA1P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::12)
 by BY5PR12MB4306.namprd12.prod.outlook.com (2603:10b6:a03:206::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 05:17:26 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:464:cafe::a7) by IA1P220CA0024.outlook.office365.com
 (2603:10b6:208:464::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 05:17:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 05:17:26 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 00:17:24 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v3 4/5] platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinated release
Date: Tue, 7 Jul 2026 10:47:11 +0530
Message-ID: <20260707051711.3382354-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|BY5PR12MB4306:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc90966-8aa1-42a1-7517-08dedbe708c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|376014|82310400026|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	92lxtdnub6fSgFqPAkOPmNJqw+hInXIzyVW3U+mupQL78AbKIfvHldd7qmiMyUq0TqvCV4cn+1ssYtmPLKClXwaxVLWfkBnUeObVIDBvsgMJoXgeupmybq+rKLGry7cwLz6Wh6Qvx8mjYg4Lc2M9Snw3Lx2JMNEFEbHni0vja0RN89SudPL4m5KMZ9VyIoJfAdyc+1oUcBItiPRZR4/YtH2hb5BM5d8xBMZAEZbBd5rR+fnrmYJQooJLeNzB8LrDI/3GqEpSLh+DXDrTyfO8iA9OkQaTDhi29kCjNujVSL1t8YOnmXoBdYoskeI2lveFCQwfZGnIHDU1S8usyRhlFltQttWGTFT0hFcsZkMEyRiDOQ+QyGJG3LqSiFv0AB0XmKB5foa+nb71eP+0hYRZfQPUZN0S5kMpA9JGsfkj3HenJip5et3D5SEt83P1AipYyJM33M8tCBsFsSWSwpXuxcCTTsIJ5M/xCy3Nt2tJLc9DfEAUNxVXOcz6fTB7o8YYc/Co2TOKQQYBcXOPFxvB65akcU03OehC7OmvoQ+aeQucy8nAzqW7tFaJ49CNSnJZYdc9L9QTZ/VWwco4WDQUweflvYlxKOgFjiXY6EWRzhp+8k2uI3PNKJPhRWGQRx4VNRc/kg1Il9jzaSKPgqRAiAllw/7p7VcZEW3MLl/aqau6JhswxKqPfO59FvM60pYKzejx3J0YAxphnTg3yQv6Jw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(376014)(82310400026)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iz8UCtBaKFevdy3/SiEA/DaTKLBIRz16Z1rtB0yUzE37f5fF2+NbdFjOvwV9DAkzbA1EXqTNDLRHjMtzfFqAb9dKQympytRYaBeOeMm+71F3/dJA2svTT2yij3kzeoyHCOviO8Z8ItXpjcKrhL5qpHhRVVU46b1xEgJOSFi0qCOPRJABXwzgprmWO+QblRcxL8muLD5VXxV8Q+buTsbA3ZUBHeoRxcJY1J68AjAA81EjjtGheDobmKTszz9o4g2ogKFHPZ9A3cPGHqaZ3S2GZVmclCWyRDln9UKDl0iDZ9MNHfL/TPZWM0+Qs51rNPkEK7e6tj4z8dbI3W3E0djcuDcI/6eIb4SQpSEg1UP1E9azA68r8DxKylmPRJagZoXMZ1+rltmxyVvfcNnPTlnZ9y1CU+tsRECdpXwv1X5lws3SBzR8tsKwhZDutejFrxg8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 05:17:26.3777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc90966-8aa1-42a1-7517-08dedbe708c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4306

The ACPI driver binds one platform device per socket but shares a single
socket array and a single /dev/hsmp misc device across them.  Replace the
global is_probed flag with state that tracks this shared ownership:

 - miscdevice.this_device tells whether /dev/hsmp is registered, so the
   misc device is registered on the first socket and torn down last.  Clear
   mdev.this_device in hsmp_misc_deregister() so a later re-probe does not
   skip registration on a stale pointer.

 - hsmp_acpi_sock_refs counts the sockets that have probed successfully.
   It is guarded by hsmp_acpi_probe_mutex, so a plain counter is enough and
   no atomic refcount is needed.  The shared socket array is allocated with
   kcalloc() on the first probe and freed by hsmp_acpi_sock_release() when
   the count drops back to zero.

hsmp_acpi_sock_release() is the single teardown helper: it deregisters
/dev/hsmp if registered, unmaps any metric-table DRAM, destroys the
per-socket mutexes and frees the array.  Both the remove path and the
probe-failure path call it once they are the last owner, so the teardown
lives in one place.

Both paths also clear this socket's dev before devres unmaps the mailbox,
so a message issued after a non-final unbind (or to a socket that failed
to probe on a multi-socket system, whose array stays alive and whose
remove() is never called) cannot reach an unmapped mailbox.

Two lifetime fixes fall out of the array now persisting across a non-final
unbind:

 - hsmp_get_tbl_dram_base() iounmap()s any stale metric_tbl_addr before
   remapping, so a rebind does not leak one mapping per cycle.  It runs
   during (re)probe before the metric sysfs attribute is exposed, so no
   reader can be using the old mapping.

 - /dev/hsmp is no longer parented to a per-socket device.  Sockets can be
   unbound individually and out of order, and the misc device outlives all
   but the last of them, so parenting it to one socket's device would leave
   a dangling parent.  Register it unparented instead.

This provides the refcounted socket ownership the ACPI teardown needs;
the following patch wires both teardown paths into the data-plane rwsem so
they are drained against the lock-free data plane, nested inside
hsmp_acpi_probe_mutex.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 103 ++++++++++++++++++++++-----
 drivers/platform/x86/amd/hsmp/hsmp.c |  26 ++++++-
 drivers/platform/x86/amd/hsmp/hsmp.h |   1 -
 3 files changed, 112 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 16edcf51c971..11a478503fa7 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -44,6 +44,13 @@ static struct hsmp_plat_device *hsmp_pdev;
 
 static DEFINE_MUTEX(hsmp_acpi_probe_mutex);
 
+/*
+ * Number of ACPI socket platform devices that have probed successfully.
+ * Guarded by hsmp_acpi_probe_mutex; the shared socket array is allocated on
+ * the first probe and freed once this drops back to zero.
+ */
+static unsigned int hsmp_acpi_sock_refs;
+
 struct hsmp_sys_attr {
 	struct device_attribute dattr;
 	u32 msg_id;
@@ -610,6 +617,56 @@ static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
 
+/*
+ * Tear down the shared ACPI socket state once the last socket is gone:
+ * deregister /dev/hsmp if it was registered, unmap any metric-table DRAM,
+ * destroy the per-socket mutexes and free the socket array.
+ *
+ * Called with hsmp_acpi_probe_mutex held (serializing it against a concurrent
+ * probe).  Coordination with the lock-free data plane (draining in-flight
+ * hsmp_send_message() before the mailbox is unmapped and the array is freed)
+ * is added in a subsequent patch via the data-plane rwsem.
+ */
+static void hsmp_acpi_sock_release(void)
+{
+	lockdep_assert_held(&hsmp_acpi_probe_mutex);
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
+ * probe() returns.  Without clearing dev, a later message to this index would
+ * pass every gate in hsmp_send_message() and reach the unmapped mailbox.
+ */
+static void hsmp_acpi_probe_failure_cleanup(struct device *dev)
+{
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+
+	lockdep_assert_held(&hsmp_acpi_probe_mutex);
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
@@ -620,16 +677,16 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 
 	guard(mutex)(&hsmp_acpi_probe_mutex);
 
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
 
@@ -639,35 +696,49 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 	ret = init_acpi(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
+		hsmp_acpi_probe_failure_cleanup(&pdev->dev);
 		return ret;
 	}
 
-	if (!hsmp_pdev->is_probed) {
+	if (IS_ERR_OR_NULL(hsmp_pdev->mdev.this_device)) {
 		ret = hsmp_misc_register(&pdev->dev);
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
-	mutex_lock(&hsmp_acpi_probe_mutex);
+	struct hsmp_socket *sock = dev_get_drvdata(&pdev->dev);
+
 	/*
-	 * We register only one misc_device even on multi-socket system.
-	 * So, deregister should happen only once.
+	 * Serialize the decrement (and the release it may trigger) against a
+	 * concurrent probe so the count cannot be revived from zero.
 	 */
-	if (hsmp_pdev->is_probed) {
-		hsmp_misc_deregister();
-		hsmp_destroy_metric_read_locks(hsmp_pdev);
-		hsmp_pdev->is_probed = false;
-	}
-	mutex_unlock(&hsmp_acpi_probe_mutex);
+	guard(mutex)(&hsmp_acpi_probe_mutex);
+
+	/*
+	 * Clear this socket's dev so hsmp_send_message() rejects it before
+	 * touching the mailbox that devres is about to unmap.  On a non-final
+	 * unbind the socket array stays alive, so without this a later message
+	 * to this index would reach an unmapped iomem region.
+	 *
+	 * This teardown is drained against the lock-free data plane in a
+	 * subsequent patch that wires it into the data-plane rwsem.
+	 */
+	if (sock)
+		sock->dev = NULL;
+
+	if (!--hsmp_acpi_sock_refs)
+		hsmp_acpi_sock_release();
 }
 
 static struct platform_driver amd_hsmp_driver = {
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index c3d0e64c415d..8440671235de 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -492,6 +492,17 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 		dev_err(sock->dev, "Invalid DRAM address for metric table\n");
 		return -ENOMEM;
 	}
+	/*
+	 * The ACPI socket array now persists across a non-final unbind, so a
+	 * stale mapping from a previous bind can still be recorded here.  Drop
+	 * it before remapping to avoid leaking one metric-table mapping per
+	 * unbind/rebind cycle.  This runs during (re)probe before the metric
+	 * sysfs attribute is exposed, so no reader can be using it.
+	 */
+	if (sock->metric_tbl_addr) {
+		iounmap(sock->metric_tbl_addr);
+		sock->metric_tbl_addr = NULL;
+	}
 	sock->metric_tbl_addr = ioremap(dram_addr, sizeof(struct hsmp_metric_table));
 	if (!sock->metric_tbl_addr) {
 		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
@@ -529,7 +540,14 @@ int hsmp_misc_register(struct device *dev)
 	hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
 	hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
 	hsmp_pdev.mdev.fops	= &hsmp_fops;
-	hsmp_pdev.mdev.parent	= dev;
+	/*
+	 * /dev/hsmp is a singleton shared by all sockets and, on ACPI, is torn
+	 * down only on the last socket's unbind.  Do not parent it to a single
+	 * per-socket device: those can be unbound individually and out of order,
+	 * which would leave the misc device parented to an already-removed
+	 * device.  Leave it unparented so its lifetime is independent.
+	 */
+	hsmp_pdev.mdev.parent	= NULL;
 	hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
 	hsmp_pdev.mdev.mode	= 0644;
 
@@ -540,6 +558,12 @@ EXPORT_SYMBOL_NS_GPL(hsmp_misc_register, "AMD_HSMP");
 void hsmp_misc_deregister(void)
 {
 	misc_deregister(&hsmp_pdev.mdev);
+	/*
+	 * misc_deregister() leaves mdev.this_device pointing at the now
+	 * destroyed device.  Clear it so a subsequent re-probe does not skip
+	 * registration on a stale pointer.
+	 */
+	hsmp_pdev.mdev.this_device = NULL;
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_misc_deregister, "AMD_HSMP");
 
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 71a8b202aa92..9036cb221635 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -57,7 +57,6 @@ struct hsmp_plat_device {
 	struct hsmp_socket *sock;
 	u32 proto_ver;
 	u16 num_sockets;
-	bool is_probed;
 };
 
 int hsmp_cache_proto_ver(u16 sock_ind);
-- 
2.34.1

