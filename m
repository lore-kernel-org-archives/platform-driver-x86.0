Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010038.outbound.protection.outlook.com [52.101.56.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BEF30ACE6;
	Sat, 13 Jun 2026 19:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781378311; cv=fail; b=ILKhQ5Fk5U4rPf1KF5+NsyQliel43fkrztzN3XNnfINOZI5ixd58ms8aURlhH+oySslMaS42KNJPnyLaSacxKL+C+Lmx23Vfi7tRMeCQVcRo2cXOaK+y74usy3BFTilp+ejAV9KvSAnjTwjt9hc8+Wt9NThN3kiPQuiuxFMqrHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781378311; c=relaxed/simple;
	bh=zjAZH6uHnRNYqUAlFG8EKypizmxIj2X2GXSGVPzZZ6k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fV7ycbMj27V/0ZaXHOm1IXhibJqq3Gh714Qgx5XBaLdWPTebmLX+i/l58J3I8dysx0lheRb9ClJa3VPY6OnrpliIMjFd3ye+TVbzOR//F0uCXGOzfaoorT8q3dd3QK6i81GF5zmM5NXJ0fa49zI2wYvhsC1oH+1FP7R6u9mHsp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ks7JUu1i; arc=fail smtp.client-ip=52.101.56.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ks7JUu1i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKiL2Gvnnb+vsaJMdaymZPBRIkZ25rFA+u87x15JukZUMU0qXAcon8+cUWfWHsEbw4NJHyVE1MlINfza+Iym3+yTieVNj3fDfOyDki2tgFFNvZFXZDL5LB7hS9R4GKoyFtVD1ZrWtXFq+SYPxV9lAlE1/cFGTvkkEfI1pt50Dm+1GtlpsEWDgEmpv4ZpkS57NpxInBwsfj8cZ573jlzIEbuTRmI/2QGfQLERgY3J+11MqRFim5GzO7XDQziq67qeP3ZGwE9IerYiRhZTTkcL9vxIcnEnRvIOlliMlZpKUZ2JBkMMO4dIQ4WpBIkrDLCE+ECIITo51EA1sHUSXzC56Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmalMuZhO5qeCkSjAK6khsb45LWiP3jhwg5cCyFS1Hc=;
 b=wqMvuj/5m9Y6tcutM6NHdP5IK8ybEINaFCMYbMiKOYJqhAAPUDHTuRLr1A8xAjXjuhhHiL9pabhSys/Y2U7WJ+j6RU0K3PScTyZdxiAXppcdwDT2x+rl4oeXy9JPzks5k1YCMh7sQaIAl+StjN+J2ToRkEulvovp2yzdXVIvqjif8z4EHT2zwFLZQsrDU6aAv+PhNdNqeNpxW+ZRqg+67pa1bGJQaZnO72XphtcKCIw/gtGNK729GLwRfabPkmYE/5jc2czqyOXfwf/YqKlmMTdVIMW6efvxe3I78JDltB2hMkFssAoEnwRTSTucV+iSRO02kh1o8DByqQdxUk8C+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmalMuZhO5qeCkSjAK6khsb45LWiP3jhwg5cCyFS1Hc=;
 b=Ks7JUu1i2o1a6NR/9XF/dCj+LWB0A0QhqfBE63osyN9amnAhQMRn+AJM670TFoJ++CSAbaY9hA5YeiPmEgg0OkKgm7DElb+O/ZJo3lOrRtN73Phsek/05WfGmtNc/cydMm+7ZWCrGW4Znc5IahzKfHHSILYM3cjXnSsPrZY0WxQ=
Received: from BY1P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::9)
 by SJ0PR12MB5663.namprd12.prod.outlook.com (2603:10b6:a03:42a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Sat, 13 Jun
 2026 19:18:25 +0000
Received: from MWH0EPF000C6188.namprd02.prod.outlook.com
 (2603:10b6:a03:59d:cafe::76) by BY1P220CA0014.outlook.office365.com
 (2603:10b6:a03:59d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.16 via Frontend Transport; Sat,
 13 Jun 2026 19:18:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6188.mail.protection.outlook.com (10.167.249.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Sat, 13 Jun 2026 19:18:25 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sat, 13 Jun
 2026 14:18:17 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH 3/3] platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinated release
Date: Sun, 14 Jun 2026 00:47:55 +0530
Message-ID: <20260613191755.2358969-4-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260613191755.2358969-1-muralidhara.mk@amd.com>
References: <20260613191755.2358969-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6188:EE_|SJ0PR12MB5663:EE_
X-MS-Office365-Filtering-Correlation-Id: 779d034e-6cfd-488a-d9a3-08dec9808a8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	q0dWR1g7e1roHcDbwYUxKeSIEPv7xSaM2zFSXJP4wTYVswnahMrRNc6sAC4NvRAXyOk8XKucW7O9oHIVZkRHMSSdbtFujPby9F9ueGz8QSTXjUtDRn2R6gTXB5fXASQ5tZKiOyipYFCC6iE6oQoLRknaWk3nzMInc7NKPEkcxjC3L1lS7t83UPAiSIyan1NpAVwGTdePKWQInGZjXKyApzX5kVTj67lviZ5g75nkfwnpXPNwPey1sg8+Sz1HPXsowS+Dv+X53LaF7h1/a2d43ZUrMC+HcM8kPvd8VwqA0Sb6ShEUBHV/0AZdUaFnJv20vU6MtrBHnPopnUB5m05LVaXD+/D3DaGtp7Wh0dMmHSzzMbtwZfZtuBlO/alFe/teHHdGfET1jNUzdS000DGTDfCSEjTZt+hO5ZYbGr7YaK6sB59TT5XY+8txSYqwpj2DSwNdUssywUn5U583JFtcf8e1s1DVgvU6JYcGtQjIo95y7oorpzM4ayYgEKCXMQrRM/73nuL2w+xn2SwxWloLBCP5gcKFJOnvWecrdOWVOUsHYl6G0YomdUhAb43YaSeHqOQPcZQlDVVE0ZU6Aiiw1c8xHm9oooot93Eewm24S3qMGVTANhABYLPHCKQ7nCPrNN1iHM34qTb745jugzuAoe65G9x/0P1cq1w5FNWhwXDLlDsChXOc1ALvukdR6eksalbezc/o2WxAhIxgulPz21DQWF8f0qevUTpDcZbgkmo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	F9v+jKF208K3WKvZ1O5ir8Rkf5QDW0dleblknzHUy39P+wHExjPY5hWTV/COw988Jh1rh5tMi7LMa2ReqrJ0cmOHqgD79pdqb8brlqxbQictI9P8xhmnOpMPDN4LOKyAhVRgow8io41WdPzyLUK6JCqo1TS9NypIhcctlOwoEAFWQEnvLLA49WpHtYfJqZawUGa1fzeP2XeRbDOZy8KtCYlJzQXQg8ew6OZuDrJOeYPZf7XudCWpsYFBQfXwFBkL7PD8DvK2eglwNiwgpgtAqtuJa7L/NESrQfk8v4TRYWtAkE4542EMvT0c9CqYo54Sw9F1WTlUB5CF3s4vQe+MKmPEEfXTPJu4NYq47WkmMKa0jV/u5Ql9BOcSK0hn0U+b0YV1wgDe5XcbdGL8JcnLK9MV42XfklaAAHkqFFpGSnKUx9zsU8o5feWTjbpvd8/d
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2026 19:18:25.0081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 779d034e-6cfd-488a-d9a3-08dec9808a8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6188.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5663

Replace the global is_probed flag with miscdevice.this_device for misc
registration state, count ACPI socket platform devices with struct kref,
and run hsmp_acpi_sock_release() on the final put to deregister /dev/hsmp
when needed, unmap metric DRAM, and free the socket array.

Extend struct hsmp_plat_device with acpi_sock_kref and
acpi_sock_kref_started in this change so ACPI teardown can coordinate
with the refcount.

Switch ACPI socket storage to kcalloc(), initialize per-socket metric
mutexes once the array exists, and free the allocation on early probe
failures before any kref reference is handed out.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 76 +++++++++++++++++++++-------
 drivers/platform/x86/amd/hsmp/hsmp.h |  4 +-
 2 files changed, 62 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 696884a91c22..c6840f6e15b7 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -587,6 +587,47 @@ static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
 
+static void hsmp_acpi_sock_release(struct kref *kref)
+{
+	struct hsmp_plat_device *pdev = container_of(kref, struct hsmp_plat_device,
+						     acpi_sock_kref);
+
+	mutex_lock(&hsmp_acpi_probe_mutex);
+	if (pdev->mdev.this_device)
+		hsmp_misc_deregister();
+	hsmp_destroy_metric_read_locks(pdev, pdev->num_sockets);
+	kfree(pdev->sock);
+	pdev->sock = NULL;
+	pdev->num_sockets = 0;
+	pdev->proto_ver = 0;
+	pdev->acpi_sock_kref_started = false;
+	mutex_unlock(&hsmp_acpi_probe_mutex);
+}
+
+/**
+ * hsmp_acpi_free_sock_array_early() - Drop the global socket array on early probe failure.
+ *
+ * When init_acpi() or misc_register() fails before any ACPI socket reference
+ * is handed out via kref, free the array and destroy per-socket mutexes.
+ */
+static void hsmp_acpi_free_sock_array_early(void)
+{
+	u16 i;
+
+	lockdep_assert_held(&hsmp_acpi_probe_mutex);
+
+	if (hsmp_pdev->acpi_sock_kref_started)
+		return;
+	if (!hsmp_pdev->sock)
+		return;
+
+	for (i = 0; i < hsmp_pdev->num_sockets; i++)
+		mutex_destroy(&hsmp_pdev->sock[i].metric_read_lock);
+	kfree(hsmp_pdev->sock);
+	hsmp_pdev->sock = NULL;
+	hsmp_pdev->num_sockets = 0;
+}
+
 static int hsmp_acpi_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -597,34 +638,44 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 
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
+		hsmp_acpi_free_sock_array_early();
 		return ret;
 	}
 
-	if (!hsmp_pdev->is_probed) {
+	if (!hsmp_pdev->mdev.this_device) {
 		ret = hsmp_misc_register(&pdev->dev);
 		if (ret) {
 			dev_err(&pdev->dev, "Failed to register misc device\n");
+			hsmp_acpi_free_sock_array_early();
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
@@ -632,16 +683,7 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 
 static void hsmp_acpi_remove(struct platform_device *pdev)
 {
-	mutex_lock(&hsmp_acpi_probe_mutex);
-	/*
-	 * We register only one misc_device even on multi-socket system.
-	 * So, deregister should happen only once.
-	 */
-	if (hsmp_pdev->is_probed) {
-		hsmp_misc_deregister();
-		hsmp_pdev->is_probed = false;
-	}
-	mutex_unlock(&hsmp_acpi_probe_mutex);
+	kref_put(&hsmp_pdev->acpi_sock_kref, hsmp_acpi_sock_release);
 }
 
 static struct platform_driver amd_hsmp_driver = {
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 91bc21232646..5fcc7400cacc 100644
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
2.34.1

