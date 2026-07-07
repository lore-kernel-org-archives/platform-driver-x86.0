Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170D52E7374;
	Tue,  7 Jul 2026 05:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401431; cv=fail; b=LMNpUtoCfmwsHo33UlWZ2HxHoSGpFsOwDEafED5aYIwFcndRvDaNMrGHaBvBqGrcRWQbDeG6n43xsHXHVzYF3AvmOIal7vo83VhsfKYO5b7RXc91N3OlwhRdOa8VmbHNnPT7M+d0VRlZEc2ioBKN5kfk5EAvgc7KCo7Y/ae4rbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401431; c=relaxed/simple;
	bh=dGmS4v8SaWrtQ/slfrLFzrxXGRMKuT1jhDE5KAwTAPo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DreyTXshwRQ2TMXYBP7s5l20fEV+nAR60DwW7NgI8oILNTVw8YQq3/Bvdm0Y2jvL9s7viX0Anfgle/vJejAl+TMstDBVgFQJmUgFNBJQCh7tcwfAETbWq4KxXxBfoHuNiu+NTVERVjbzYJEYI/WcOE60SmLn6WS108rc/6nK2fM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=s10qJBdu; arc=fail smtp.client-ip=52.101.61.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="s10qJBdu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bewI6IKMKzQw61ld6n8KXJK8chORheh4FRl1kDyiMeXeij7XKskXPRkSLanUoBl0rJ8uiMuwpA3ceGeYoaFVbMM/8O6fFTcLBV+UZzC9outiMGiOQeNBCtByaC9wysMNLMoY59lYa8RHfUXgd8z/gM0Iy/bajpPJ+PjCwxlw3Ar8673n020ptU0dRR1Yx8O/RIdvxqKD1g4nnNJvRncQvyfm7ryKXGiVIcjLADg54oBtyG+g7GIHgT5SjQGL8d6PPu8Nz77Mrtyx1KOzfHZXs0nKs328NK281HwPHPWej9eG8WIFsgKW8M0pssiZ5/4zmedHlFzgn4oVzFEwKKpS5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjsIXtJYLmvC/xKrZUYU5WoFQFrxZsVusWAC5XkohLc=;
 b=H14QD4txowtUhOldMLTE9EDdu7G7vs2gbbapJ6hnYLsnhTDoBLxzE6RHXssQEeXiBWXM9Gwz4jopmLuPzF4HIMRy0Sgd0/raeMbqsbrx5KaReic9u6cHlX1otAob6EmAlKIDXxP9w/LH6AAouGo2HKGJllKiSn3Q6IeQ+yAm/rkefk1r2gDTFWpNYIYJF9/LROptNlackpKgeswkzo2feAb3TpFKZdaP+M/rpNQG5Seql4bBFgkpAWcVuami4LNZ+kbkZ1s5xLxU2z5fTqpekBKNmTq+GG0YZGaz0iOLJ+oewHTtb/czFGLEPofUQEKBdKJHAf14OeD7hfTluTLICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjsIXtJYLmvC/xKrZUYU5WoFQFrxZsVusWAC5XkohLc=;
 b=s10qJBduPLO4uap7tEdZ179dWrjhqWNxOCcpeeUsla/zwInK5cYnxb3skzdR7UreJpFJaW2y7Qd1FjeKYN8TOuwOx+i9eyVJ7jb62qcGOCo5dXAwqyjnd4oFQmAbqOYKNokvWvQu75oR9GmCoT9ru3eYD62+NU/cDfzRpuSpO+Y=
Received: from MN0P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::27)
 by CH2PR12MB4072.namprd12.prod.outlook.com (2603:10b6:610:7e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 05:17:05 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::35) by MN0P221CA0009.outlook.office365.com
 (2603:10b6:208:52a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 05:17:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 05:17:05 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 00:17:03 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v3 3/5] platform/x86/amd/hsmp: Serialize per-socket metric table reads with a mutex
Date: Tue, 7 Jul 2026 10:46:50 +0530
Message-ID: <20260707051650.3382160-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|CH2PR12MB4072:EE_
X-MS-Office365-Filtering-Correlation-Id: fc01199a-9c2f-4211-5bbe-08dedbe6fc5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|56012099006|18002099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	UM3EzJbPWw7AsyKIh5Xg0IBOnJRJkpe/rVMYXuHsyphnU3P/7Ku6MQF66+ATTaZlkFX34FsmyOqV2ZHjQ7MtgPUYaNMwCOotr1xrwkcaq1uw76COvBcrHH7ePgXB/sUuayQiMz/B1XxIfYopdQwSqVqLWwoBJgI0pW5c8EjonMXNeywgXsSqM7KtDu7oZ62k1J5lwEBrKlXnvycO85PJD/8mZ4nmo0XzgJtKJvZFxNS1l/xb5S5EYggchXU2KrcQtyrWCgGxbCg1AAtKx2HdFacRfqz/7KH2ThhHOxrXE+3DefqA0Cq8OA+VTvTDQt+dQIxCOa9rWJIW4YK5TeAoknTKWgUTaeb4dSUVoL8iY57DwzE6V8r4z++nGEfXZxY+sXK/rAqVgdraVYlCTndGIxFqi/mLR1w+UM5E+p2DoKS0WDCrmVXeAO/gR5lAMoRbtuQ7NfMEu4ZYoFEj4UnH1uNomkG+TNP93z8AzWi1P1LYA6+hLy41EJqjTsTIrBSv8KYPYWi7AWr1JDbJt50zVd9gAa92i0xUjJLEk1okXPMeVe2PnOJaQJG7MPCqxwrnx+xT0y0WR3X4XYsCDIrK5EZZ9nOBfxKdfAb1iHnavmXGjpf6KRDNdekGgiERAQA4YEjLI3Nqu470j8AaAh6LWxqdt4m+CXeu1mo2uRtbhoE/OOHPvIFN5lfkF1J6AOHk9l/cK3nv0ZFKCbF5Kt/hJw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(56012099006)(18002099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OsaOj8SIIhJkBm52qY+BJ1Hg0rL0kf+TnNHUr567MX5BbSidK7RxZJo6FBaJCbdiVQM3OmxcHyBIqBr3Y3d1ZxslddoTLy/in/AJuRZrV4QRdNvN/kT71WT8ODXzU/K8IleK3ZE76owePE52hZ+1/hrcCTSCDDJ2n+ejeV15t1GinPrEfaSamGulTJDSlUDzZ3G8DkGs3tjWhdbYbzdo+O/Kql+APa8DM0EbVN2R0VmYoD5SUUdbUZ2BN22VHTSOZfEQbfamq+/S9vh8zsz8n+z7rZlSVsamD22aJ2e8ELQFh210XBqpTlQMTAm6xPx5hQKaUS+mBx4K39ipBhIoIjgUnryYsT3pQYC4DjXr5ZaQR5W0lx2DcylW7K8WQgybu5PovRw8bjDxSnrM5rHfDfdHoY9fV0Qtv+g9ZgcVvEhhC9A3Lr71senT8JaQb6h1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 05:17:05.5835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc01199a-9c2f-4211-5bbe-08dedbe6fc5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4072

HSMP_GET_METRIC_TABLE makes the firmware refill a shared per-socket metric
DRAM region, which hsmp_metric_tbl_read() then copies out with
memcpy_fromio().  Two concurrent readers of the metrics_bin sysfs attribute
on the same socket can race: one can trigger a fresh fill while the other
is mid-copy and return a torn snapshot.  (The hwmon path does not touch
this region; it only issues power messages via hsmp_send_message().)

Embed a struct mutex metric_read_lock in each hsmp_socket and hold it
across the fill-and-copy in hsmp_metric_tbl_read().  Add
hsmp_init_metric_read_locks() and hsmp_destroy_metric_read_locks(), which
take only struct hsmp_plat_device and iterate pdev->sock[] over
pdev->num_sockets so the caller cannot pass a count that disagrees with the
array.

Wire them into both front-ends' probe and teardown paths so the mutex is
always initialized before metrics_bin is exposed: the platform driver and
the ACPI driver both drive hsmp_metric_tbl_read() through the same 0444
metrics_bin attribute.  Doing this in one patch avoids a bisection point
where an ACPI read would lock an uninitialized mutex.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c |  3 +++
 drivers/platform/x86/amd/hsmp/hsmp.c | 35 ++++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.h |  5 ++++
 drivers/platform/x86/amd/hsmp/plat.c | 13 +++++++----
 4 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 206eb7897b61..16edcf51c971 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -632,6 +632,8 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 					       GFP_KERNEL);
 		if (!hsmp_pdev->sock)
 			return -ENOMEM;
+
+		hsmp_init_metric_read_locks(hsmp_pdev);
 	}
 
 	ret = init_acpi(&pdev->dev);
@@ -662,6 +664,7 @@ static void hsmp_acpi_remove(struct platform_device *pdev)
 	 */
 	if (hsmp_pdev->is_probed) {
 		hsmp_misc_deregister();
+		hsmp_destroy_metric_read_locks(hsmp_pdev);
 		hsmp_pdev->is_probed = false;
 	}
 	mutex_unlock(&hsmp_acpi_probe_mutex);
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index ccf21f2d230d..c3d0e64c415d 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -10,9 +10,11 @@
 #include <asm/amd/hsmp.h>
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/mutex.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
 
@@ -406,6 +408,15 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 	msg.msg_id	= HSMP_GET_METRIC_TABLE;
 	msg.sock_ind	= sock->sock_ind;
 
+	/*
+	 * HSMP_GET_METRIC_TABLE makes the firmware refill the shared metric
+	 * DRAM region, then the snapshot is copied out of it.  Serialize the
+	 * fill-and-copy per socket so two concurrent readers cannot have one
+	 * trigger a fresh fill while the other is mid-copy and return a torn
+	 * snapshot.
+	 */
+	guard(mutex)(&sock->metric_read_lock);
+
 	ret = hsmp_send_message(&msg);
 	if (ret)
 		return ret;
@@ -415,6 +426,30 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, "AMD_HSMP");
 
+void hsmp_init_metric_read_locks(struct hsmp_plat_device *pdev)
+{
+	u16 i;
+
+	if (!pdev->sock)
+		return;
+
+	for (i = 0; i < pdev->num_sockets; i++)
+		mutex_init(&pdev->sock[i].metric_read_lock);
+}
+EXPORT_SYMBOL_NS_GPL(hsmp_init_metric_read_locks, "AMD_HSMP");
+
+void hsmp_destroy_metric_read_locks(struct hsmp_plat_device *pdev)
+{
+	u16 i;
+
+	if (!pdev->sock)
+		return;
+
+	for (i = 0; i < pdev->num_sockets; i++)
+		mutex_destroy(&pdev->sock[i].metric_read_lock);
+}
+EXPORT_SYMBOL_NS_GPL(hsmp_destroy_metric_read_locks, "AMD_HSMP");
+
 void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev)
 {
 	u16 i;
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 98c82a4c0cc3..71a8b202aa92 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -15,6 +15,7 @@
 #include <linux/hwmon.h>
 #include <linux/kconfig.h>
 #include <linux/miscdevice.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
@@ -41,6 +42,8 @@ struct hsmp_socket {
 	struct bin_attribute hsmp_attr;
 	struct hsmp_mbaddr_info mbinfo;
 	void __iomem *metric_tbl_addr;
+	/* Protects metric table snapshot reads for this socket */
+	struct mutex metric_read_lock;
 	void __iomem *virt_base_addr;
 	struct semaphore hsmp_sem;
 	char name[HSMP_ATTR_GRP_NAME_SIZE];
@@ -63,7 +66,9 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
 void hsmp_misc_deregister(void);
 int hsmp_misc_register(struct device *dev);
 int hsmp_get_tbl_dram_base(u16 sock_ind);
+void hsmp_init_metric_read_locks(struct hsmp_plat_device *pdev);
 ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
+void hsmp_destroy_metric_read_locks(struct hsmp_plat_device *pdev);
 void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev);
 struct hsmp_plat_device *get_hsmp_pdev(void);
 #if IS_ENABLED(CONFIG_HWMON)
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index e0a99e8f2be8..8b3e5e767327 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -211,28 +211,32 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 	if (!hsmp_pdev->sock)
 		return -ENOMEM;
 
+	hsmp_init_metric_read_locks(hsmp_pdev);
+
 	ret = init_platform_device(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
-		goto err_unmap;
+		goto err_destroy_locks;
 	}
 
 	ret = hsmp_misc_register(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register misc device\n");
-		goto err_unmap;
+		goto err_destroy_locks;
 	}
 
 	dev_dbg(&pdev->dev, "AMD HSMP is probed successfully\n");
 	return 0;
 
-err_unmap:
+err_destroy_locks:
 	/*
 	 * init_platform_device() may have ioremap()ed metric tables before
-	 * failing.  They are no longer devm-managed, so drop them explicitly;
+	 * failing.  hsmp_unmap_metric_tbls() drops those mappings and
+	 * hsmp_destroy_metric_read_locks() tears down the per-socket mutexes;
 	 * the socket array itself is devm-managed.
 	 */
 	hsmp_unmap_metric_tbls(hsmp_pdev);
+	hsmp_destroy_metric_read_locks(hsmp_pdev);
 	return ret;
 }
 
@@ -240,6 +244,7 @@ static void hsmp_pltdrv_remove(struct platform_device *pdev)
 {
 	hsmp_misc_deregister();
 	hsmp_unmap_metric_tbls(hsmp_pdev);
+	hsmp_destroy_metric_read_locks(hsmp_pdev);
 }
 
 static struct platform_driver amd_hsmp_driver = {
-- 
2.34.1

