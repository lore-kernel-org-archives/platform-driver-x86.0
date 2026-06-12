Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012053.outbound.protection.outlook.com [52.101.43.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996CB397E88;
	Fri, 12 Jun 2026 04:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781238414; cv=fail; b=T9SAp5QU7GOYwDr7YUOt/0Jv7Kd72XQD8OjNvp0rCLNmJtC+8TiK7pBfhB25eOLr2uxejSkn5nnguyJT4zMzNoJzts+7+vaG+0Ny4uyAETVh56XmTPkthD7qOdgZ6c5z/Zb5aioDxGDl2Le/hZg326zg+Tymbi3sIxdWt/MYoUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781238414; c=relaxed/simple;
	bh=zhxwADPJ1c/SUwaUjvNbsjTYtEW64mYcIdEwLMQ10oo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lewan/DvQXufeLLvfj+eSETuXCDj8GjXTKYZQKs7RB6Y0e8mxdhUbqBBUG1DdTEhTVVixVpZR5k439aLr2TOU5nkGJi5Pfi+HjuBtNsI9adS2mclwPMCKy8A/lOPnS333qnJ03ohX+1mjQsvWZIt/CWZ74E9utf6K0QE22VxJAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eZE2NKxS; arc=fail smtp.client-ip=52.101.43.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eZE2NKxS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbZD140RXT6YwSK2t9p7k/figqmBBU8+8wMTwb4egrc9wJpmayot5Z9Bf0UMFYrHKOMsZa/mgsJuuS5Lxy0bdxt/5haYAMNHf3dQf7Idbw+ENOyri/D0Yu1MN09l/OfnmdccRm7IuPkIaRz2108dpdW3ahAYB/likqk2ex7BNTgMsRyynHZ6hEvVgMyuNLsoEDe8xDKDajOdPHN4Q2vMmLwvqyt+bRIXfhaxGSndBGi1Rs6u3ipmMaH0qzjQNt7mBKUXmLR9PcL/PcikQI41ntHsfoN/E6aW+WNyBPSeIqGgVZdsp9+4v2KBPWMqX9jTvtL2NbjpNgNJjamgEgHLdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHk9MIkGGWryyQaszyKwnuFWljo6WsIj3wIZfv4cwkM=;
 b=p9v+TObHLBBOdBr4aafrOZFDbxTJu9gDud7TscYyV0Cqo/Fm19F1Pt/HRopGf4rsaeqMdwqV5OBMGUFE4TU674pg7SK3FecRxK9Xo08SSB6ksLVz20wteS/W+ztu8LkYt5E6crOIAlnqmHNImkRyUAPHWmv7VXmyFaozAUhMqLfJeERdAFTFOgTsqL8a3vd/6GeXdSdrFgGAsKXpoIpFuJvVPQBs6od5kTq8+GWej0wScb8Ktc2t2ocKV5TanwVykLxTNCl+15lw8AYTsqyeb6u+1yiB8tle4pErfw+2mMAENi9/MuRj7GglUGazqTEp4yI4Zy/UpA4oKujQsdOnrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHk9MIkGGWryyQaszyKwnuFWljo6WsIj3wIZfv4cwkM=;
 b=eZE2NKxSTbUsVpS2ITuJhYxvyuzsPfkVIFViZjBHNxz4c3LS/60CC3ncyQ981l+zyKXBcDghuNcUdkQChgXZWOrH/Wvjwl5NJhmYTjPnxXco+rlEYpOpFzZIreDhYGnKSqTXyTQrgcfpS/QFCxxVTHwrYwITMMJ+PUOF7Q08y3g=
Received: from SJ0PR03CA0222.namprd03.prod.outlook.com (2603:10b6:a03:39f::17)
 by DM6PR12MB4467.namprd12.prod.outlook.com (2603:10b6:5:2a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 12 Jun
 2026 04:26:48 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::43) by SJ0PR03CA0222.outlook.office365.com
 (2603:10b6:a03:39f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.14 via Frontend Transport; Fri,
 12 Jun 2026 04:26:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 04:26:47 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 23:26:45 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v6 8/8] platform/x86/amd/hsmp: Serialize metric table access and ACPI HSMP teardown
Date: Fri, 12 Jun 2026 09:56:10 +0530
Message-ID: <20260612042610.1629037-9-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612042610.1629037-1-muralidhara.mk@amd.com>
References: <20260612042610.1629037-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|DM6PR12MB4467:EE_
X-MS-Office365-Filtering-Correlation-Id: afd39419-3dd3-4f34-d779-08dec83ad167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	2of/dW2T7U1xJOWb9WGdnMpfc//qwuhpwormIpNKaEMHO2S/fjQNaiPYEhw095BgBsXnmXJmcnzLWgOGyWADzS6OrQ1mwdIcDitMZRX27DsiPQLWiqWUQUW7F5RRVcdPnMxrMRzwpmY84zSjKWHZ7xGcleHgFxtYMrg2y2DKxG8qXOzqbgpKdNr/gy7tIN9vosqGOFqAdzDkSE1ccnK8kL4IpaCIovYZiDpuAeWz3N2BZABFo0dcmfuZUoN2RL1/mYxnmpx0cGsoKDyqq/oHdh0KIJCLNDjBhE2kJFDsExZQrMalyJxiFVUFl7/GSSGe32KJkHPb0fkutYHfnz8WkT/crCViMCY1Zv4C7Y+8VeohTLeNse4DSqE7ZB4NZAIzUxkjPaxjD7/S8LRRu13qA3XlQN1K51eU9Fj+L8+Ix/F3gxtfcFOdJPYPchvqRk4dkceeVoNEVlSZT6scslpEkKtstj2u8/rmEl4M770SO0k847pStgDFJwClkX1GpUUSlg90oWMG0x2kEeQQHyPRTZzw/vkF9dKTORIrCczV8CQPElTwGK8l33e9Pn2V2PBqtnuwir/fKE/S0dOuzRIMb9A20SjG8bD7P4a/nc5SLkWxqQs6kgNLfFlok9gwNOU0SNR7RhXYIEvJTt+5mK3z9Ou2F+LL215LxKZVyIyPp4fUI9gqo+75+F3CndsFeEnqYszKosc5tt+kOowsG3G/xI+O9RXJFiB7KQYCTv4qoIE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	03dprxezsE5xvAJ/1OTDUEBB9doZHc78uguwreWxKZUQOYV5H3ePS4v4Ai9mpiDWYl8jr6JfgZ0MClpzHdtA6ThZ0xIAcz97h0MQDoeE7AO+BdgWl/6L1KkRj9E4AHdLyI6OzVjsboyM8+vZkODcO5sMaIg76sg2ezNOci3sAHrm0rK8ORMiVWoNncCE44ZRSLTwOET5VoY0iRH0JWGkTAe+3B4bNWj0q5sIMFZvPuih+BlOhUznIIyQNW3ivrYgF3A5ROgcImlN+rZI+zlVlZ5OKFv74rFnmWyrdA7pxfpsAPu96NAe7PHE64SgDxIFcZzZbJNw7MpW19R/cL7EZDb+g9Vwf+rlFsGsdG32Zsl7N+loL7I48rvVPHJ4N8pIuT8s/yNmG3P/FTkA0jM4W8DxZthNwJ27kqaosd+kpL9yDe1Ds1c2/SN2Ok8kxuYm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 04:26:47.9227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afd39419-3dd3-4f34-d779-08dec83ad167
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4467

Each ACPI HSMP socket bumps acpi_sock_refcnt after a successful probe;
the last socket to remove runs refcount_dec_and_test() and tears down
shared state once. If init_acpi() or misc_register() fails before
refcount_inc(), call hsmp_acpi_free_sock_alloc_if_idle() to free
hsmp_pdev->sock so a concurrent probe cannot follow a dangling pointer.

1) Metric table sysfs reads ask the SMU to refresh the table, then
   memcpy_fromio() from the mmio mapping.  Concurrent readers could
   interleave those steps and return inconsistent data.  Serialize with
   per-socket metric_tbl_lock and guard(mutex) around
   hsmp_send_message() and memcpy_fromio() so each read() observes one
   coherent snapshot.
2) Every ACPI AMDI0097 device shares hsmp_pdev->sock[].  The driver used
   devm_kcalloc() from whichever device probed first, an unlocked probe
   flag, and misc_register() from the first successful path.  Parallel
   probes could race, and devm tied the array lifetime to one device
   while others (and devm hwmon paths) still called hsmp_send_message(),
   which could use-after-free the array on remove.
3) Metric DRAM used devm_ioremap() and devm_mutex_init() per ACPI device
   while the socket table is global, so devm teardown order did not
   match shared storage.  Switch to ioremap(), one-time mutex_init()
   (metric_lock_inited), and hsmp_metric_tbl_unmap_all() on the last
   ACPI remove together with the rest of global teardown.
4) After kcalloc(sock) but before refcount_inc(), one failing probe
   could kfree() the array while another probe still ran init_acpi() on
   the same pointer.  Hold hsmp_acpi_probe_mutex across init_acpi(),
   misc_register(), and refcount_inc() so setup does not overlap
   teardown or a concurrent probe.
5) On the legacy platform driver, call hsmp_misc_deregister() before
   hsmp_metric_tbl_unmap_all() so /dev/hsmp is gone before metric mmio
   is unmapped, matching the ACPI remove path.

Tested-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 58 +++++++++++++++++++++-------
 drivers/platform/x86/amd/hsmp/hsmp.c | 56 +++++++++++++++++++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.h |  9 ++++-
 drivers/platform/x86/amd/hsmp/plat.c |  1 +
 4 files changed, 106 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 8dc6b4a8bd27..e526e2cea3e2 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -20,7 +20,10 @@
 #include <linux/ioport.h>
 #include <linux/kstrtox.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/refcount.h>
+#include <linux/slab.h>
 #include <linux/sysfs.h>
 #include <linux/topology.h>
 #include <linux/uuid.h>
@@ -595,6 +598,19 @@ static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
 
+static DEFINE_MUTEX(hsmp_acpi_probe_mutex);
+
+/* Caller holds hsmp_acpi_probe_mutex. */
+static void hsmp_acpi_free_sock_alloc_if_idle(void)
+{
+	if (refcount_read(&hsmp_pdev->acpi_sock_refcnt) == 0 &&
+	    !hsmp_pdev->acpi_misc_registered && hsmp_pdev->sock) {
+		kfree(hsmp_pdev->sock);
+		hsmp_pdev->sock = NULL;
+		hsmp_pdev->num_sockets = 0;
+	}
+}
+
 static int hsmp_acpi_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -603,49 +619,63 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 	if (!hsmp_pdev)
 		return -ENOMEM;
 
-	if (!hsmp_pdev->is_probed) {
+	mutex_lock(&hsmp_acpi_probe_mutex);
+	if (!hsmp_pdev->sock) {
 		hsmp_pdev->num_sockets = topology_max_packages();
 		if (!hsmp_pdev->num_sockets) {
 			dev_err(&pdev->dev, "No CPU sockets detected\n");
+			mutex_unlock(&hsmp_acpi_probe_mutex);
 			return -ENODEV;
 		}
 
-		hsmp_pdev->sock = devm_kcalloc(&pdev->dev, hsmp_pdev->num_sockets,
-					       sizeof(*hsmp_pdev->sock),
-					       GFP_KERNEL);
-		if (!hsmp_pdev->sock)
+		hsmp_pdev->sock = kcalloc(hsmp_pdev->num_sockets,
+					  sizeof(*hsmp_pdev->sock),
+					  GFP_KERNEL);
+		if (!hsmp_pdev->sock) {
+			mutex_unlock(&hsmp_acpi_probe_mutex);
 			return -ENOMEM;
+		}
 	}
 
 	ret = init_acpi(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
+		hsmp_acpi_free_sock_alloc_if_idle();
+		mutex_unlock(&hsmp_acpi_probe_mutex);
 		return ret;
 	}
 
-	if (!hsmp_pdev->is_probed) {
+	if (!hsmp_pdev->acpi_misc_registered) {
 		ret = hsmp_misc_register(&pdev->dev);
 		if (ret) {
 			dev_err(&pdev->dev, "Failed to register misc device\n");
+			hsmp_acpi_free_sock_alloc_if_idle();
+			mutex_unlock(&hsmp_acpi_probe_mutex);
 			return ret;
 		}
-		hsmp_pdev->is_probed = true;
-		dev_dbg(&pdev->dev, "AMD HSMP ACPI is probed successfully\n");
+		hsmp_pdev->acpi_misc_registered = true;
+		dev_dbg(&pdev->dev, "AMD HSMP ACPI misc device registered\n");
 	}
+	refcount_inc(&hsmp_pdev->acpi_sock_refcnt);
+	mutex_unlock(&hsmp_acpi_probe_mutex);
 
 	return 0;
 }
 
 static void hsmp_acpi_remove(struct platform_device *pdev)
 {
-	/*
-	 * We register only one misc_device even on multi-socket system.
-	 * So, deregister should happen only once.
-	 */
-	if (hsmp_pdev->is_probed) {
+	mutex_lock(&hsmp_acpi_probe_mutex);
+	if (refcount_dec_and_test(&hsmp_pdev->acpi_sock_refcnt)) {
 		hsmp_misc_deregister();
-		hsmp_pdev->is_probed = false;
+		hsmp_pdev->acpi_misc_registered = false;
+		hsmp_metric_tbl_unmap_all(hsmp_pdev, hsmp_pdev->num_sockets);
+		kfree(hsmp_pdev->sock);
+		hsmp_pdev->sock = NULL;
+		hsmp_pdev->num_sockets = 0;
+		hsmp_pdev->proto_ver = 0;
+		hsmp_pdev->hsmp_table_size = 0;
 	}
+	mutex_unlock(&hsmp_acpi_probe_mutex);
 }
 
 static struct platform_driver amd_hsmp_driver = {
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 9f7a5fb67728..4dc3826a0d57 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -12,6 +12,7 @@
 #include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/io.h>
 #include <linux/nospec.h>
 #include <linux/semaphore.h>
 #include <linux/slab.h>
@@ -41,7 +42,9 @@
  */
 #define CHECK_GET_BIT		BIT(31)
 
-static struct hsmp_plat_device hsmp_pdev;
+static struct hsmp_plat_device hsmp_pdev = {
+	.acpi_sock_refcnt = REFCOUNT_INIT(0),
+};
 
 /*
  * Send a message to the HSMP port via PCI-e config space registers
@@ -488,6 +491,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 	msg.msg_id	= HSMP_GET_METRIC_TABLE;
 	msg.sock_ind	= sock->sock_ind;
 
+	guard(mutex)(&sock->metric_tbl_lock);
 	ret = hsmp_send_message(&msg);
 	if (ret)
 		return ret;
@@ -497,6 +501,28 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, "AMD_HSMP");
 
+void hsmp_metric_tbl_unmap_all(struct hsmp_plat_device *pdev, u16 num_sockets)
+{
+	u16 i;
+
+	if (!pdev->sock || !num_sockets)
+		return;
+
+	for (i = 0; i < num_sockets; i++) {
+		struct hsmp_socket *s = &pdev->sock[i];
+
+		if (s->metric_tbl_addr) {
+			iounmap(s->metric_tbl_addr);
+			s->metric_tbl_addr = NULL;
+		}
+		if (s->metric_lock_inited) {
+			mutex_destroy(&s->metric_tbl_lock);
+			s->metric_lock_inited = false;
+		}
+	}
+}
+EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_unmap_all, "AMD_HSMP");
+
 int hsmp_get_tbl_dram_base(u16 sock_ind)
 {
 	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
@@ -504,6 +530,31 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 	phys_addr_t dram_addr;
 	int ret;
 
+	if (sock->metric_tbl_addr)
+		return 0;
+
+	/*
+	 * Initialize the per-socket lock before anything that can set
+	 * sock->metric_tbl_addr to a non-NULL value.  hsmp_metric_tbl_read()
+	 * gates on sock->metric_tbl_addr being non-NULL and then takes
+	 * metric_tbl_lock unconditionally; both callers of this function
+	 * (init_acpi() and init_platform_device()) intentionally only log
+	 * a failure here and continue probing, so an init order that left
+	 * metric_tbl_addr populated while mutex_init failed would leave the
+	 * read path locking an uninitialized mutex.  Doing the mutex init
+	 * first preserves the invariant "metric_tbl_addr != NULL implies the
+	 * lock is usable" on every error exit.
+	 *
+	 * Use non-devm mutex + ioremap so the shared sock[] array (ACPI
+	 * allocates once for all sockets) can be torn down from a single
+	 * refcounted release path without devm lifetime being tied to the
+	 * wrong struct device.
+	 */
+	if (!sock->metric_lock_inited) {
+		mutex_init(&sock->metric_tbl_lock);
+		sock->metric_lock_inited = true;
+	}
+
 	msg.sock_ind	= sock_ind;
 	msg.response_sz	= hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
 	msg.msg_id	= HSMP_GET_METRIC_TABLE_DRAM_ADDR;
@@ -527,8 +578,7 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 	else
 		hsmp_pdev.hsmp_table_size = sizeof(struct hsmp_metric_table);
 
-	sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
-					     hsmp_pdev.hsmp_table_size);
+	sock->metric_tbl_addr = ioremap(dram_addr, hsmp_pdev.hsmp_table_size);
 	if (!sock->metric_tbl_addr) {
 		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
 		return -ENOMEM;
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 7343f8a1681f..5f5ad2885c22 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -15,7 +15,9 @@
 #include <linux/hwmon.h>
 #include <linux/kconfig.h>
 #include <linux/miscdevice.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/refcount.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
@@ -42,11 +44,14 @@ struct hsmp_socket {
 	struct bin_attribute hsmp_attr;
 	struct hsmp_mbaddr_info mbinfo;
 	void __iomem *metric_tbl_addr;
+	/* Serializes concurrent metric table refreshes from the sysfs path */
+	struct mutex metric_tbl_lock;
 	void __iomem *virt_base_addr;
 	struct semaphore hsmp_sem;
 	char name[HSMP_ATTR_GRP_NAME_SIZE];
 	struct device *dev;
 	u16 sock_ind;
+	bool metric_lock_inited;
 	int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);
 };
 
@@ -55,7 +60,8 @@ struct hsmp_plat_device {
 	struct hsmp_socket *sock;
 	u32 proto_ver;
 	u16 num_sockets;
-	bool is_probed;
+	refcount_t acpi_sock_refcnt;
+	bool acpi_misc_registered;
 	size_t hsmp_table_size;
 };
 
@@ -66,6 +72,7 @@ void hsmp_misc_deregister(void);
 int hsmp_misc_register(struct device *dev);
 int hsmp_get_tbl_dram_base(u16 sock_ind);
 ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
+void hsmp_metric_tbl_unmap_all(struct hsmp_plat_device *pdev, u16 num_sockets);
 struct hsmp_plat_device *get_hsmp_pdev(void);
 #if IS_ENABLED(CONFIG_HWMON)
 int hsmp_create_sensor(struct device *dev, u16 sock_ind);
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index e07f68575055..2ef2102d0af3 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -230,6 +230,7 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 static void hsmp_pltdrv_remove(struct platform_device *pdev)
 {
 	hsmp_misc_deregister();
+	hsmp_metric_tbl_unmap_all(hsmp_pdev, hsmp_pdev->num_sockets);
 }
 
 static struct platform_driver amd_hsmp_driver = {
-- 
2.34.1

