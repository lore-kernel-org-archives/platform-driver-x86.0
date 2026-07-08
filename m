Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010038.outbound.protection.outlook.com [40.93.198.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4093A8750;
	Wed,  8 Jul 2026 04:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783484695; cv=fail; b=eNt1HhUbxDOk7BmxbwBApPwcN+JKcl3D3BNB/XjxJhI+rviUczFDnncSMxXXmuPLmcmgMeyQKUeqxno6JoohTdSTy55n3effEx4u7FRzOn0SsPgAy5Dm77TOjrqTtOnUge2kGHrpWs3/Ta9mi9qc0mmLAWpvt6t+2QL5tuOZiDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783484695; c=relaxed/simple;
	bh=cTt8WYwXbXx9fio6T057/JjmuWbeg/qIx4R+gmhkj4o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e8rx6VH26kYA6lRsFu+fH6V4RfitIQ43tbXYWhza3c39TrXOTqZjcGQJcsyyTxLiXxEt5zN1RTEKwv3P4Juz9LKLKjqVVTyLeZBbOh9BKw9BT8810pGJ6j/nOR/ydu2GJDCfsQ7yRDPYJfhyVTuzo0rTahjRPOsZx9fPEdrFU6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2w5lJGur; arc=fail smtp.client-ip=40.93.198.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2w5lJGur"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lrhaM0MJaFm4AxZrIASx4zTg5ZYka05GbmdwkgaFvxkTy4YHAXgk1XszlmH3m8ARZgSvNccUuj/seLLVCAP5ffaoowN75mKAHpEnYJx1Ub1LaqVdfrp28Ie6LEnJlXodQtiaM7/9RdImBWzQ8e5dw7j/O27ewlYoOy4+1NTvWm8biDV9lMHHCeXmYedVdMj4eUf8dX1TIRcc1nQxeg7HnN8+j2ExcVgdtJjLb//O0Db5EqfP3sohRtU1JyGilj1Z67BbbaI5wOmELXN/3VHSxUYCvlPF0U2HvcsWoMCm53/Vi0Xio+ZUDhz7j0/BNGQhtmWMvMW0JUj93scZ8guyGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIRAS7gzvOm5Gl5fO24gapSxldJU1J2QoPVHr+AXRHg=;
 b=GcFx5jjrGxc1LihLIz0eY52kYoA7kytev0v5MU22mVDPcph+J+GgFGmz7Z1OSYgyKdH5ERvrLqZe58dRzfW/ibON3SAmzKqZtGiSj7aXHDG6u0JSlCF2qqnW3II/gfjUgXVkwwyNqWEFCmHQ+sEaByho2t8sw5qIqxT+JlCyAk3xNELd1m0DEVDxPEVlUgi5YhvavMc7k6Na5cTQX1Iem3xzkm/IuhdYLeansjAwszQ81vcpgST3Hzqml2hl263m6fA6qs7htuwzrM6VivsLzK7I13uWYH2he6e/X/ZAnCGwlAgsDZcJAUKPo4sK5iZxXIM0f/R9sEOagDJ14DQ/Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIRAS7gzvOm5Gl5fO24gapSxldJU1J2QoPVHr+AXRHg=;
 b=2w5lJGurqu1gfyCOjDGAFX0jalT4UAdUCjN4sqdwoKVqLqsigBbocgaNzJv9D3G3wha+VsHp4UIkWZMhzAYG3jVOq3miDXV9mGRWvCitb/lTU0JNTceiCkMBAbCFYS+h3P8KVcF2YfW3+Iv+cORA9BeaYn/8bdO7mapItED2e88=
Received: from CH5P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::10)
 by SN7PR12MB7021.namprd12.prod.outlook.com (2603:10b6:806:262::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 8 Jul 2026
 04:24:39 +0000
Received: from DM2PEPF00003FC2.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::a3) by CH5P222CA0021.outlook.office365.com
 (2603:10b6:610:1ee::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 04:24:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC2.mail.protection.outlook.com (10.167.23.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 04:24:39 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 23:24:36 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v4 5/6] platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinated release
Date: Wed, 8 Jul 2026 09:54:04 +0530
Message-ID: <20260708042405.3758294-6-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC2:EE_|SN7PR12MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: a3136f05-6a1f-42d2-9aff-08dedca8d384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	eIS05b45Lsucsk4bvzb8fgzQP1d7TqqIHV52g3vCoa2YAOx3QLXybRBRZr9eTNEVTsAjh2RZpfqOT3ctd0bjjjUhaOQ9LcPqU4unJGEiICeWWRqQWMxVyu6jMcpOr5JxFfb6XcDsaOsyJmikAitxhNZxe1O15pDYvtAYaYth29+Ey/8tJPIEV1s4mrNhG1Uz0RXMjZYJn1Ue4l9YCjdLbhTHcvYn3u4oTteWQIWp529xaF3K1Ac/Mx4OKX3D4P87SHzqW7gn45IEOV/wfBf5Nw+2XalCgWB6glzSfnPCcPo/OaO1TrghVUwlNzgFku82WU8AM8QJgrfM8HBnGivyyFuw7yDO6cVl/MFgM+n9qvf03OKNxHgD4pEvPzZc3nZHID/9tnrCzUZDgx7wWdcvpCYCuTouqCYifZZmfaca2smNvPgzvjunUXRaoTBvpkcoeswfUp94I5xZoMgR4agElE5Jqh4EU3/RtXuzB/8F594wxlyfUJ1AseTXe+E7pEseGKGuOptQVMYTh5m8hQ45WtbxJMkhupuGF+UAv3895CwJBO5BGCagBJmrROzYiHohBcqMDijVExBI5COFKOwnOJb79l6XtMkBCYqcEkYKjrjUIH6Ua839wNcgmz56X1ZrZh2qBNWQ2rFdnn/E8q77WEeE9Wb1tnyfH8/K94mpKYFx8kOQaknieVh5N8G6MAoALp/RA6NJ27Sse2R2mXOZwA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gSDHGm1BCrhMnBbvOv4NBM8HBtnxaNUVGC2bAqCmq/eSw+S9PT6mWnvh1Gh8MI7xkJZuFRoXAAaSHecxXKeXVjIl2aVO+Jc0x/XF6IAkXmfToiWk1v9Nop7eh7X4UpxDRVF9H1nRL9SQKj/OzqhHxgjfnoWRPNKAp1f0lj+ywDsnwmCWZR5YGc7k8AcEGaEqxXZONZDHGXFONYGj7p+CnHwsKLjX0cmOYAnejaiu+HYpeaUvW8YE5YpOsDYsVOlYwlTujGxlBBM3hHT7mQkP+Yy4ezGsyUn2ylRNfobkwTllM5Uu++3XZG0YcbXLkRGs/pwebbTlUh5jz1I5qxo61bIyq/TEwhsD/CFT9GOrKcQeOuZZic6zCCqzexBCixQyKpBnShVIuWk2Ts5x8OJcFD6QQ9FkqUSXdElaUjNzhCLSiyB0keoRqODCtHSEDOoc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 04:24:39.3685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3136f05-6a1f-42d2-9aff-08dedca8d384
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7021

The ACPI driver binds one platform device per socket but shares a single
socket array and a single /dev/hsmp misc device across them. Replace the
is_probed flag with state that tracks this shared ownership:

 - miscdevice.this_device tells whether /dev/hsmp is registered, so the
   misc device is registered on the first socket and torn down last. A
   preceding change clears mdev.this_device on deregister so this gate
   stays reliable across a re-probe.

 - hsmp_acpi_sock_refs counts the sockets that have probed successfully.
   It is guarded by hsmp_acpi_probe_mutex, so a plain counter is enough and
   no atomic refcount is needed. The shared socket array is allocated with
   kcalloc() on the first probe and freed by hsmp_acpi_sock_release() when
   the count drops back to zero.

hsmp_acpi_sock_release() is the single teardown helper: it deregisters
/dev/hsmp if registered, unmaps any metric-table DRAM, destroys the
per-socket mutexes and frees the array. Both the remove path and the
probe-failure path call it once they are the last owner, so the teardown
lives in one place.

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

 - /dev/hsmp is no longer parented to a per-socket device. Sockets can be
   unbound individually and out of order, and the misc device outlives all
   but the last of them, so parenting it to one socket's device would leave
   a dangling parent. Register it unparented instead.

An upcoming change wires both teardown paths into a data-plane rwsem so
they are drained against the lock-free data plane, nested inside
hsmp_acpi_probe_mutex.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 102 ++++++++++++++++++++++-----
 drivers/platform/x86/amd/hsmp/hsmp.c |  21 +++++-
 drivers/platform/x86/amd/hsmp/hsmp.h |   1 -
 3 files changed, 106 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 095289ddb7e7..d35465079eea 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -43,11 +43,20 @@
 static struct hsmp_plat_device *hsmp_pdev;
 
 /*
- * Serializes ACPI probe, remove and init_acpi() so concurrent socket probes
- * cannot race the is_probed handshake or the one-time socket-array allocation.
+ * Serializes ACPI probe, remove and init_acpi() and guards the shared socket
+ * state they manage: the one-time socket-array allocation, /dev/hsmp
+ * registration and hsmp_acpi_sock_refs. A plain counter is therefore enough
+ * for the refcount; no atomic is needed.
  */
 static DEFINE_MUTEX(hsmp_acpi_probe_mutex);
 
+/*
+ * Number of ACPI socket platform devices that have probed successfully. The
+ * shared socket array is allocated on the first probe and freed once this
+ * drops back to zero.
+ */
+static unsigned int hsmp_acpi_sock_refs;
+
 struct hsmp_sys_attr {
 	struct device_attribute dattr;
 	u32 msg_id;
@@ -614,6 +623,56 @@ static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
 
+/*
+ * Tear down the shared ACPI socket state once the last socket is gone:
+ * deregister /dev/hsmp if it was registered, unmap any metric-table DRAM,
+ * destroy the per-socket mutexes and free the socket array.
+ *
+ * Called with hsmp_acpi_probe_mutex held, serializing it against a concurrent
+ * probe.
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
+ * probe() returns. Without clearing dev, a later message to this index would
+ * pass every gate in hsmp_send_message() and reach the unmapped mailbox.
+ *
+ * sock is NULL if probe failed before hsmp_parse_acpi_table() set the drvdata.
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
@@ -624,16 +683,16 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 
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
 
@@ -643,35 +702,46 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
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
+	struct hsmp_socket *sock = dev_get_drvdata(&pdev->dev);
+
+	/*
+	 * Serialize the decrement and any release it triggers against a
+	 * concurrent probe so the count cannot be revived from zero.
+	 */
 	guard(mutex)(&hsmp_acpi_probe_mutex);
 
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
index ccd19c7bf115..e47e86116f16 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -483,6 +483,18 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
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
n
@@ -520,7 +532,14 @@ int hsmp_misc_register(struct device *dev)
 	hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
 	hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
 	hsmp_pdev.mdev.fops	= &hsmp_fops;
-	hsmp_pdev.mdev.parent	= dev;
+	/*
+	 * /dev/hsmp is a singleton shared by all sockets and is torn down on
+	 * the last socket's unbind. Do not parent it to a per-socket device:
+	 * those can be unbound individually and out of order, which would leave
+	 * the misc device parented to an already-removed device. Leave it
+	 * unparented so its lifetime is independent.
+	 */
+	hsmp_pdev.mdev.parent	= NULL;
 	hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
 	hsmp_pdev.mdev.mode	= 0644;
 
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index a43a8043a6cb..bc2050dcfdb5 100644
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

