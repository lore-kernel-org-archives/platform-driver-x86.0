Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012051.outbound.protection.outlook.com [52.101.48.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372AD39989D;
	Wed,  8 Jul 2026 04:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783484685; cv=fail; b=LdvY5HvEtcie6IWoCgWldO8jhIOrnbR13oQ7Xk6KrV6FvlqFnoLFg6NEIuBRzLRXVVgDZjzPV+nSlA2sNOtZ1nKgDdL1NTGqobgCWyWspYaQt9Qw2AfSu6QjbaaB7b/8FAjgcSQHmh4Op8i0ZkgLcMdPOuIoWdZACw/gAj1kARM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783484685; c=relaxed/simple;
	bh=eR1vd+7U9ibi6z4DXBH1MwHcUNBVtALkdVRefw83C7s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gSZHGcz7wex5pfRu16hxs8acTmA3Q2qJohlUDFZ6tp70NQpG63lO+Kq+iLtKXZarxQ/PjJvpPFzKAe0UC5dWQIM+LdwWLTgDyIxNFcQkx9CQu3g2z8Mvesh0KuJJ/6M9PvbbJ2+O7iMHRY9P+eeqJSBHP1M1iK4gu9iVqmaU3EQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zDCNRPvM; arc=fail smtp.client-ip=52.101.48.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zDCNRPvM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VR+FrWSOl5CkDavqvGt1McNC8dRVBf6EAJXmiI+JVQwO2qZyv5/OvQ8Nv0ZXgMKpvwhrvFlLTVEZgueZLz9Mt82nkggfF+ukyuS+QNNlj2MV+7jUsGm3ipJ8EbEKWCGcJoUtOdjHLtQ4CUBzjPZ6u8RJGqPrkHyv0m58SE0t1dhZOja9k9istaMPfWaPh9eRPIOkMRIOEPg1y8D5w2r+L9zJR7icj2d7Rrq2khXjUXMrdTTMxda71nDsP/Q+IvpnwOf/licCczMJ1wdqx73FWOxaWjhQwnK9AzPJC+okiEOEN83tinF5k4vp6V0HByZATb9doFoe9snLUMeoDn9rKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIY68vcoQemGidhn/iMjjwcjOtS/zWdC9hqDwMHAW+I=;
 b=LLZrRzac4aG1NyNzrRx7lriZKQ/l89Gx5O58joJc1GtQEwEaD0AX5nUNaOGESSJACAgSTKtQ7gdouXxa2Hhu0nfkgDtFgLjf2d9eGAlgchBnZhEj6O+BdcAqoPeU404LXIXnLCp+qhAw0asaEhKDd53wRc/hR5nKy0TSZjlmNjvvc3b5CnkY932XnctEBl7adPtD554uE6y56MN0ezwuBZ+J1KtknlIp1wHStcK0whyWTkx14KBsVIrL6LQQphgEjbffdFcYmyGAUaOIIQt6Ue1W01Qv61Yj03gJfrll0kemIA6ZgTmS4aHreEtfMWHIPZFKlT1BDrX+sfKYNz3tJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIY68vcoQemGidhn/iMjjwcjOtS/zWdC9hqDwMHAW+I=;
 b=zDCNRPvMxOHUR8r7Bmy58XlsOnQpVDmCRmPdqMh2nfLQuEoQsoEnnPnvLfDSG727xjClXMaCo1kauy4IefhgVjGy9UoXoEMzf6Lh8G57ilMHgwYlF/YeLL+Pts/hV7r7jlKvlH3v60J4sajtA/WqxramaA46750ot9OWF+t+3nI=
Received: from CH5P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::6)
 by SA3PR12MB9225.namprd12.prod.outlook.com (2603:10b6:806:39e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 8 Jul 2026
 04:24:38 +0000
Received: from DM2PEPF00003FC2.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::38) by CH5P222CA0014.outlook.office365.com
 (2603:10b6:610:1ee::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 04:24:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC2.mail.protection.outlook.com (10.167.23.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 04:24:38 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 23:24:33 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v4 3/6] platform/x86/amd/hsmp: Serialize per-socket metric table reads with a mutex
Date: Wed, 8 Jul 2026 09:54:02 +0530
Message-ID: <20260708042405.3758294-4-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC2:EE_|SA3PR12MB9225:EE_
X-MS-Office365-Filtering-Correlation-Id: 9310a600-618a-485f-83a6-08dedca8d2e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	J4eJcAFTcOXeBfNwphddO4OV8mzieh7ts5genBCrDmK91gh5PzZWF//XT7siZ95V6F1pnI+pp0hkAobuZVrIZYibUOCz0O9+85qCNZwowCZTD/RjhVHT/B0J76UUCTCuoAlXAlqv2Eg4RrePfTJYAJfpW11aabxUugnyb2Bpg7p+YKxCTUQ4OtTj0lGB48ehX89yLn8/zjp3RCBFznu4hDYb9W3Ejjy1Fyv6pc85uegHAzNqCpr/rmvncotncu0F+2Mxu2kYxetpGAN/U5QA6EJ3/C9fVdWUvWyj57YFXbm6kACrmI4HUK9fHprtl+d/e2tDBLsTBvWF/zT5yMTvKyUSsRnvOT6lEE+MS2uSFwvXxXu0S20CB5IH/ch3A7E470ZCAazZ120K9EmxfbG0Fn1Wdde2XbC/ThJcd3U4Hxmv1TRbwxsQQqjw5sL2yVpHAFuKNkcd2fUATv/NSXw4XDMNw/dDaWKTkGrwRMzwtCbKZbFtduSrcloF/iCCjT3Hi2Ve/5FsR+tfUym9hTTlWiF8BoD0bKIs4DG2EJNACoiP+JxSdW4hoQjC6uufbiZd8qxAZGFToUMkr8/sefd0+km24jgY5RKhBcj+Jtsr5zLyex2ALFUMJ+9dPgkEr4hESQRdWo8FBmpgxmAZXC50Hz8uZB9lMylbAeLDesx99jDAI4DrR5Q21wt1C12OtLfLi46U5ESmecNPxUI+IuvTQA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hf1QpErpIOL4zu2H63r4yEmtQJimySpgCWRtanxzOhII4vlZXQIa2obT0zQjmx+C6Uo0yfG2JB3qcUNoO/dZQ+rYt9Lja08iRzOXaW0z6h5bfggXgV1pAdFqrGLLu3ImzxJI1OqZQyVZEdIOUn/GaTIbswqyTezu4VY4jem6Dbz+FMNEPmomMtN/ZXLX6gKFD8WNE6q6ICWRlJdn8YrGypmoRxuic/iIBQfVCZnj6IqxK+w4QZe+v/ircDPmlMW+Gi5VJRJ6xhZZDKow53CmzRHljFZcdQhACbkl8aI/JtGzd55iA6s8bsR6jSr2XUWxd0PqLr203nFXJ9D+EdvIjh/aNmIG3CBlMZ37kBAMaY52WbyQf6iQwpASN7ihIjhaHWM4bSUZpvzSMP+q1nAfl3rMX127iT96rqEysZ6VK3lNCCtBuCwNIbncpQwWgLQJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 04:24:38.2943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9310a600-618a-485f-83a6-08dedca8d2e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9225

HSMP_GET_METRIC_TABLE makes the firmware refill a shared per-socket metric
DRAM region, which hsmp_metric_tbl_read() then copies out with
memcpy_fromio(). Two concurrent readers of the metrics_bin sysfs attribute
on the same socket can race: one can trigger a fresh fill while the other
is mid-copy and return a torn snapshot. (The hwmon path does not touch
this region; it only issues power messages via hsmp_send_message().)

Embed a struct mutex metric_read_lock in each hsmp_socket and hold it
across the fill-and-copy in hsmp_metric_tbl_read(). Add
hsmp_init_metric_read_locks() and hsmp_destroy_metric_read_locks(), which
take only struct hsmp_plat_device and iterate pdev->sock[] over
pdev->num_sockets so the caller cannot pass a count that disagrees with the
array.

Wire them into both front-ends' probe and teardown paths so the mutex is
always initialized before metrics_bin is exposed: the platform driver and
the ACPI driver both drive hsmp_metric_tbl_read() through the same 0444
metrics_bin attribute. Doing this in one patch avoids a bisection point
where an ACPI read would lock an uninitialized mutex.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c |  3 +++
 drivers/platform/x86/amd/hsmp/hsmp.c | 29 ++++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.h |  5 +++++
 drivers/platform/x86/amd/hsmp/plat.c | 10 +++++++---
 4 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index eef799ce1fb8..095289ddb7e7 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -636,6 +636,8 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 					       GFP_KERNEL);
 		if (!hsmp_pdev->sock)
 			return -ENOMEM;
+
+		hsmp_init_metric_read_locks(hsmp_pdev);
 	}
 
 	ret = init_acpi(&pdev->dev);
@@ -667,6 +669,7 @@ static void hsmp_acpi_remove(struct platform_device *pdev)
 	 */
 	if (hsmp_pdev->is_probed) {
 		hsmp_misc_deregister();
+		hsmp_destroy_metric_read_locks(hsmp_pdev);
 		hsmp_pdev->is_probed = false;
 	}
 }
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 4586d86f72a3..10fc21887308 100644
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
+	 * DRAM region, then the snapshot is copied out of it. Serialize the
+	 * fill-and-copy per socket so two concurrent readers cannot have one
+	 * trigger a fresh fill while the other is mid-copy and return a torn
+	 * snapshot.
+	 */
+	guard(mutex)(&sock->metric_read_lock);
+
 	ret = hsmp_send_message(&msg);
 	if (ret)
 		return ret;
@@ -415,6 +426,24 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, "AMD_HSMP");
 
+void hsmp_init_metric_read_locks(struct hsmp_plat_device *pdev)
+{
+	u16 i;
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
+	for (i = 0; i < pdev->num_sockets; i++)
+		mutex_destroy(&pdev->sock[i].metric_read_lock);
+}
+EXPORT_SYMBOL_NS_GPL(hsmp_destroy_metric_read_locks, "AMD_HSMP");
+
 void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev)
 {
 	u16 i;
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 98c82a4c0cc3..a43a8043a6cb 100644
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
@@ -43,6 +44,8 @@ struct hsmp_socket {
 	void __iomem *metric_tbl_addr;
 	void __iomem *virt_base_addr;
 	struct semaphore hsmp_sem;
+	/* Serializes HSMP_GET_METRIC_TABLE fill-and-copy for this socket */
+	struct mutex metric_read_lock;
 	char name[HSMP_ATTR_GRP_NAME_SIZE];
 	struct device *dev;
 	u16 sock_ind;
@@ -64,6 +67,8 @@ void hsmp_misc_deregister(void);
 int hsmp_misc_register(struct device *dev);
 int hsmp_get_tbl_dram_base(u16 sock_ind);
 ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
+void hsmp_init_metric_read_locks(struct hsmp_plat_device *pdev);
+void hsmp_destroy_metric_read_locks(struct hsmp_plat_device *pdev);
 void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev);
 struct hsmp_plat_device *get_hsmp_pdev(void);
 #if IS_ENABLED(CONFIG_HWMON)
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index e7ee6e701e5a..d46dcb8c7f03 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -202,13 +202,15 @@ static int init_platform_device(struct device *dev)
 }
 
 /*
- * The metric tables are mapped with ioremap() rather than devm, so release
- * them explicitly. Registered as a devres action so it also runs on a probe
- * failure after init_platform_device() has mapped some of them.
+ * The metric tables are mapped with ioremap() rather than devm and the
+ * per-socket mutexes need an explicit mutex_destroy(), so tear both down
+ * here. Registered as a devres action so it also runs on a probe failure
+ * after init_platform_device() has mapped some tables.
  */
 static void hsmp_pltdrv_release(void *data)
 {
 	hsmp_unmap_metric_tbls(hsmp_pdev);
+	hsmp_destroy_metric_read_locks(hsmp_pdev);
 }
 
 static int hsmp_pltdrv_probe(struct platform_device *pdev)
@@ -221,6 +223,8 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 	if (!hsmp_pdev->sock)
 		return -ENOMEM;
 
+	hsmp_init_metric_read_locks(hsmp_pdev);
+
 	ret = devm_add_action_or_reset(&pdev->dev, hsmp_pltdrv_release, NULL);
 	if (ret)
 		return ret;
-- 
2.34.1

