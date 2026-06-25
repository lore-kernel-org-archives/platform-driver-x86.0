Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013071.outbound.protection.outlook.com [40.107.201.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5EB3E3C7B;
	Thu, 25 Jun 2026 12:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782390864; cv=fail; b=a4dQPS+plUh+kIfzAtSrv4eQRw8oMlVE97ixdABXmnD90WkcoPdppgxja7F/Gwgj6ugvjiOak5PItx87J241wGB8QDycfoXBR5z/gub6RvFaXduxLlu70IwQfusEV5foKWPqBOeepAKo75JG+dYMVnrAy0owxG6Jwn2szcesO6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782390864; c=relaxed/simple;
	bh=yRP4wQ7ZO15zxA1ZjM1vxwVf3bzJfaYGqdEgA4PzqnY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tZphQYFKpnL7kyOjKduVzFapbf6B77DsT7x7D9Tp7H0b+6peYFo0xCzlP6XtdMbBCBSIle5eUjZ7bFLEHDw6Xob+KFaeMw15ebNCSDmOiTISv29N//qZCuY4QVkelQUSGeKn2dwgPlvSCO8a2cx+yipyFVl51ANnwY+Z/8KBJoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=b4gYP8CW; arc=fail smtp.client-ip=40.107.201.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="b4gYP8CW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBmEB8pTkHotLNbl2h6N6McHkKD9fNvwMpv1G4bn5CgfMW0BHSQ33978YchhcRdtc+nloGMsXP6m4oUArnjQ63lDDS06aBq914lBIPb6LK28RLvfClvK9aoje4QrUus/zv/a7S9WDjFHCxqDhvox5d9hl6qzq8foB5R2BVEQajF2bU8jbiChw/CdJ13SL8BlWxaV0NTgwNdXpt2q+DAlaLO59QWWukVDuP4mbInrhKBQ2pxmxCeQIh1YrQ2gC3TEqoyU71KbpkwF8MHfm2HagiZNiQx85S7Abewt2zgFStSG7dKD99oqXUtYZmxkU1P3S0ac5naPCWjODeX5xfe78g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Cvk1xmJi10KDkqkQchbYyqgUDvwHoM8btD7Ey8l8aI=;
 b=le7HbI/bfuReiE0qgQteZ2WKDqeUtMyj5Ux+rWasNx2Z07gC2yV6iImaD4Gk9FzMVgn/7tqAWLZMyVMw4cyjgIH7pOtb3+C42S9jHGN/+7D/AVpEUzJ8u6JrRRf6rbgBhU/G4cj6Kgzgv5uGrmfVSOCdlm6IRVosUfgisYhpLR1gwHmdZb3tT/siwFCTV2XpRUFMwRB9EtE/swwVzEeVUpZyrabQuCwiFd+DG4zw+eM6JOu2G62EnWU9cQP/nnPzQdwABF22+0jRQygBhGLgBnFIDeB0ZYhy0cfW1Pq7v+qtxGOJGqD9kwYaVVRSOjSbqK+YAc2jaNCn29yLnEfyFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Cvk1xmJi10KDkqkQchbYyqgUDvwHoM8btD7Ey8l8aI=;
 b=b4gYP8CW2j2JpypVUCOa7p1HMbIpfh+a5MTMjHvITXj6JrS1kUsOK+tO93x1migT+jFqQeZfEKPaY3zTrLuw1jXpnbXEIyfH5RUnQs3vkbspADvxMQg8NEGgCXzVxGv6wMLa5Er5SGFUombzpIiiGR216msKb4yg4SZqyX9KwKw=
Received: from CH0PR03CA0246.namprd03.prod.outlook.com (2603:10b6:610:e5::11)
 by CH3PR12MB7667.namprd12.prod.outlook.com (2603:10b6:610:14f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 12:34:15 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::2a) by CH0PR03CA0246.outlook.office365.com
 (2603:10b6:610:e5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 12:34:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 12:34:12 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 25 Jun
 2026 07:34:10 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <muthusamy.ramalingam@amd.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v2 6/7] platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinated release
Date: Thu, 25 Jun 2026 18:03:36 +0530
Message-ID: <20260625123337.886435-7-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|CH3PR12MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 07b341dd-13dc-45f2-94e9-08ded2b60fe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	+7n0rITZZijM585zWj1UGEf5XzLWw0Sm/BFkHr4I6TJW9Gumr0SjB49vaXVdEOPNoB5DwIqZtjAOKsbKT3vNrjX++kRdVwzmm3IDPuJJvDmuJF75nQbMPXNAKfQfiZFbIl0f7vR3bZ/KEgGU52wL8cVAXqXUWOHeiu6I4lbHxDqQSjWdUJHoxIcJ6n2hAWZmw2MUm+4ezcxYmgrWT3s4YdpJmAHBI7LkPnjp6GKq1iLMyhFfCq3hild2z/DK5VmONBi+2ZAAG0fpFGeX4z7K7S97vnPU4ephaoGE2q/2F10Ps3TZee78EVVmpSI+JGs4ivfurd/+3STCsTF+aSvmVdtWUwa4ZfpMLUV39JXWRLHwCOg82k6Qnfac3KYqiNh6l74WpEtpy3f+YZHNgE1wSHmzOMfKt5j1asQrM20sx7i7XQe9m7qn5N4duOTiRapxjB0TuidwRVJraqIXtuZMJV82vW9mh7gOwkui37LWTEsglDsiJHA4BDD/MqEqOY7zLmUgbMZTumS/srcEF/mS4+58E1laLOBMG9otWUzIkieonDmy4QYhLzyfHP6r7nj+/90t2v0BmZoCfLe7f91EIEmV/n30tunKNV/cREBRzrIxo6KXT8KT2ZLzdc8DAzAgmz181NZBUbAHvI+1dkpAfszTkhDZpBknIyUyo7CtxkmQ+MlyNZBdarScHptmjLnxriJNTUiCCTpB8MmKGP5/NA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fgIn08vmcIWLVYjOdjT/lIif9cUJO7bQlVmZa4DzOQee196sEjIczeuacPlCXMEyqJg3yMyfXkTVyAY09tSYe1P6JdFZtP4/0jaQj55rxt47KkSq3waJK2jBj5dlRkGW1eEpy6L7P80aQmzDkGucHWqo5q9kwSS5kN+W8jd1BUbanT6K1w81DycL0aKYd7/wMgMn2qevy//0sfkGgDxS7bVqQnoe+Trx08q1EkFVbhMufk3N32r4jYMfEoecaC3risFRtUr4zgPTNdcFs6InzvF89lv7ohkgizNfOgIH4jrFdu2M73hQbsBUzHBGdR2PDe5qv4Cl0rCl+W0BcV8m4jzL9bvrTo4IKpXUuntptVbZEbdCcPaveQvEp7AFt7qEk8tK5WmZoh1q1EKt8CY82al5chiWBltuT+MSMtoiWtw8sJBxsL+wYw19Bk2uw3QV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 12:34:12.5575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b341dd-13dc-45f2-94e9-08ded2b60fe7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7667

Replace the global is_probed flag with miscdevice.this_device for misc
registration state, count ACPI socket platform devices with struct kref,
and run hsmp_acpi_sock_release() on the final put to deregister /dev/hsmp
when needed, unmap metric DRAM, and free the socket array.  Extend struct
hsmp_plat_device with acpi_sock_kref and acpi_sock_kref_started so ACPI
teardown can coordinate with the refcount, and clear mdev.this_device in
hsmp_misc_deregister() so a later re-probe does not skip registration on
a stale pointer.

Switch ACPI socket storage to kcalloc(), initialize the per-socket metric
mutexes once the array exists, and free the allocation on early probe
failures before any kref reference is handed out.

Both teardown paths run under the data-plane rwsem via
hsmp_sock_teardown_lock(), so they are serialized against the lock-free
data plane.  hsmp_acpi_remove() clears this socket's dev under the write
lock before devres unmaps the mailbox, so a message issued after a
non-final unbind cannot reach an unmapped mailbox on multi-socket systems.

The probe-failure path clears the socket's dev under the same write lock
too.  On a multi-socket system a non-first socket can fail inside
init_acpi() after hsmp_parse_acpi_table() has published sock->dev and
mapped the mailbox; remove() is not called for a failed probe and the
array stays alive (owned by an already-probed socket), so without this
clear devres would unmap the mailbox while a /dev/hsmp ioctl to that
index still reaches it.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 124 +++++++++++++++++++++++----
 drivers/platform/x86/amd/hsmp/hsmp.c |   6 ++
 drivers/platform/x86/amd/hsmp/hsmp.h |   4 +-
 3 files changed, 118 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index bf5601229c6c..475f0076d262 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -610,6 +610,72 @@ static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
 
+static void hsmp_acpi_sock_release(struct kref *kref)
+{
+	struct hsmp_plat_device *pdev = container_of(kref, struct hsmp_plat_device,
+						     acpi_sock_kref);
+
+	/*
+	 * The caller (hsmp_acpi_remove()) drops the last reference while
+	 * holding hsmp_acpi_probe_mutex, so the get/put and the teardown done
+	 * here are fully serialized against a concurrent probe.  It also holds
+	 * the write side of the data-plane rwsem (hsmp_sock_teardown_lock()),
+	 * which has drained any in-flight hsmp_send_message() and keeps new
+	 * ones out, so unmapping the mailbox and freeing the socket array here
+	 * cannot race the lock-free data plane.
+	 */
+	lockdep_assert_held(&hsmp_acpi_probe_mutex);
+
+	if (!IS_ERR_OR_NULL(pdev->mdev.this_device))
+		hsmp_misc_deregister();
+	hsmp_destroy_metric_read_locks(pdev, pdev->num_sockets);
+	kfree(pdev->sock);
+	pdev->sock = NULL;
+	pdev->num_sockets = 0;
+	pdev->proto_ver = 0;
+	pdev->acpi_sock_kref_started = false;
+}
+
+/**
+ * hsmp_acpi_probe_failure_cleanup() - Undo a failed ACPI socket probe.
+ * @dev: ACPI companion device whose probe failed.
+ *
+ * Runs the whole cleanup under the teardown rwsem so it is serialized against
+ * the lock-free data plane (init_acpi() runs hsmp_test() and a previously
+ * probed socket may already have exposed /dev/hsmp).
+ *
+ * Always clears this socket's dev: on a probe failure for a socket other than
+ * the first, the socket array stays alive (owned by an already-probed socket)
+ * and remove() is never called for this device, yet devres unmaps its mailbox
+ * once probe() returns.  Without clearing dev, a later message to this index
+ * would pass every gate in hsmp_send_message() and reach the unmapped mailbox.
+ *
+ * When no ACPI socket reference has been handed out via kref yet (the first
+ * socket's failure), it also frees the array and destroys the per-socket
+ * mutexes; hsmp_destroy_metric_read_locks() additionally unmaps any metric
+ * table DRAM that init_acpi() may have ioremap()ed, so there is no leak.
+ */
+static void hsmp_acpi_probe_failure_cleanup(struct device *dev)
+{
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+
+	lockdep_assert_held(&hsmp_acpi_probe_mutex);
+
+	hsmp_sock_teardown_lock();
+
+	if (sock)
+		sock->dev = NULL;
+
+	if (!hsmp_pdev->acpi_sock_kref_started && hsmp_pdev->sock) {
+		hsmp_destroy_metric_read_locks(hsmp_pdev, hsmp_pdev->num_sockets);
+		kfree(hsmp_pdev->sock);
+		hsmp_pdev->sock = NULL;
+		hsmp_pdev->num_sockets = 0;
+	}
+
+	hsmp_sock_teardown_unlock();
+}
+
 static int hsmp_acpi_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -620,34 +686,44 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 
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
+
+		hsmp_init_metric_read_locks(hsmp_pdev, hsmp_pdev->num_sockets);
 	}
 
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
+	}
+
+	if (!hsmp_pdev->acpi_sock_kref_started) {
+		kref_init(&hsmp_pdev->acpi_sock_kref);
+		hsmp_pdev->acpi_sock_kref_started = true;
+	} else {
+		kref_get(&hsmp_pdev->acpi_sock_kref);
 	}
 
 	return 0;
@@ -655,16 +731,34 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 
 static void hsmp_acpi_remove(struct platform_device *pdev)
 {
-	mutex_lock(&hsmp_acpi_probe_mutex);
+	struct hsmp_socket *sock = dev_get_drvdata(&pdev->dev);
+
 	/*
-	 * We register only one misc_device even on multi-socket system.
-	 * So, deregister should happen only once.
+	 * Serialize the final put (and the teardown it triggers) against a
+	 * concurrent probe so the refcount cannot be revived from zero.
 	 */
-	if (hsmp_pdev->is_probed) {
-		hsmp_misc_deregister();
-		hsmp_pdev->is_probed = false;
-	}
-	mutex_unlock(&hsmp_acpi_probe_mutex);
+	guard(mutex)(&hsmp_acpi_probe_mutex);
+
+	/*
+	 * Drain the lock-free data plane and keep it out for the duration of
+	 * the teardown.  This covers both the per-socket unbind (this socket's
+	 * mailbox is unmapped by devres once we return) and the final put that
+	 * frees the socket array in hsmp_acpi_sock_release().
+	 */
+	hsmp_sock_teardown_lock();
+
+	/*
+	 * Clear this socket's dev so hsmp_send_message() rejects it before
+	 * touching the mailbox that devres is about to unmap.  On a non-final
+	 * unbind the socket array stays alive, so without this a later message
+	 * to this index would reach an unmapped iomem region.
+	 */
+	if (sock)
+		sock->dev = NULL;
+
+	kref_put(&hsmp_pdev->acpi_sock_kref, hsmp_acpi_sock_release);
+
+	hsmp_sock_teardown_unlock();
 }
 
 static struct platform_driver amd_hsmp_driver = {
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index c15acba241c4..2e836124f486 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -546,6 +546,12 @@ EXPORT_SYMBOL_NS_GPL(hsmp_misc_register, "AMD_HSMP");
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
index 5d0a6d819865..118922785d18 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -14,6 +14,7 @@
 #include <linux/device.h>
 #include <linux/hwmon.h>
 #include <linux/kconfig.h>
+#include <linux/kref.h>
 #include <linux/miscdevice.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
@@ -57,7 +58,8 @@ struct hsmp_plat_device {
 	struct hsmp_socket *sock;
 	u32 proto_ver;
 	u16 num_sockets;
-	bool is_probed;
+	struct kref acpi_sock_kref;
+	bool acpi_sock_kref_started;
 };
 
 int hsmp_cache_proto_ver(u16 sock_ind);
-- 
2.43.0

