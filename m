Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012019.outbound.protection.outlook.com [40.107.200.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510BD3CC310;
	Thu, 25 Jun 2026 12:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782390859; cv=fail; b=WJSgaSyZ3mwa/JrzibMvPtNThTR0xw7Jd4pnRCVCBnIbsMVKD88A99i2RF4OZKu9+RGa7Dgf0MhhROmw+dHozFKzhVLTO38QLgLNN33W7h0rsjiF/e9JmwXU4FbT3r8ijHsHDZFK739vQdmW5OsIi2MwhmerFtDlYjKlNk2oCP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782390859; c=relaxed/simple;
	bh=fcIGb1cHAxCYS3EsgByHVW1DgtEz0M8o+Sp4KvnO8jM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EyFh0A/WK4sMJ8V/gwwntqPITOnNOOr6I7/O7srox5q6Jc8fyl5LLxUKHnXyDcM/OVGe91BTwuzYASf5GN7tEOAWM8PrAdrKiuFz6rrGEHw4anE044AfKPF8LJtQ97oAvKz18VrUGuwIY1Zd9UZLX2T7O0iKFbdJZQb3OINySFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IYDFdupf; arc=fail smtp.client-ip=40.107.200.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IYDFdupf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRJST3kaM718S1K7X31LnYMA5u9/+mdHAgS8wRzSROF8onH0zZ1C3MqskMQto27p+3h8dGZ0QwgUCd5nkEXzH+cBaydgO6UVg/9s1wHaSxNKP/CpQoxHsYUX7vm0uH7CHKUEBysnCXwNSbVuEzs1asOViq9wxQangtNt52sz5+UlGyW8FPEFuPL8LKEbsfsBd3x8RvVwcO0UIVAy3UzlEkO4PkKnu6s+KxS14bl6rBCCjgmtEVEVnUAWBxDHnYewUSj3dtU2T7gPIM0cXgBHu9LZoIE1yqnunwh4JXFEumFM+ZHt32n8U+uL6DxmWmOAKZzJCHXlubGO2R2b1bk0Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gx1naf0Mnaa6m88VdO04ixdNnrq6xP2WLHLgv3ppPtg=;
 b=hU7MigZdcZ+y1svSoXH3UQ/nAB4rvUs1eUUrPmxM6Gd16E1h7galdInSlnfrQJDnkMbvKS1Zd00zqxnkamCq7EW4OGhJg6gisEa7dqUAvMQ3GiA0/aHUqyeROmzOPkqvYEIBZfVtCfGfFWCIxEn+k5oNbdWcz+pwChS8RMmHPXv5VfbmYII0qhjwHBum4hOGea4oacYZinx+rMvZzO+BcHJZWuKH7kuxf860t8T0eSfzYch7v4meiGQ86YiaFmFgRl2ZyvcJFqEPDZzA6SHtwBq3k8NB417iZo1AJccD9qhuU5ZUBmPqfxBiwMptxouGHw7rfrNArT0q+mHhMUfuiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gx1naf0Mnaa6m88VdO04ixdNnrq6xP2WLHLgv3ppPtg=;
 b=IYDFdupfqcTverbCBE5FR/0haK/7DbqAITQ2XtZw/mH/575sQRhs7esUYB3Sbic6RVsSDhPVXhpD6RTb9HLlfklgJp8h212+iAzgTvouYwmPMy5uH/MCIhA1dX3I2kG3FubPaV3wd3k6UHNN0upZ6jsltIOQi2ualfOWMThMxcM=
Received: from CY5PR15CA0183.namprd15.prod.outlook.com (2603:10b6:930:81::29)
 by CY8PR12MB7337.namprd12.prod.outlook.com (2603:10b6:930:53::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 12:34:07 +0000
Received: from CH1PEPF0000AD77.namprd04.prod.outlook.com
 (2603:10b6:930:81:cafe::1f) by CY5PR15CA0183.outlook.office365.com
 (2603:10b6:930:81::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Thu,
 25 Jun 2026 12:34:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD77.mail.protection.outlook.com (10.167.244.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 12:34:06 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 25 Jun
 2026 07:34:04 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <muthusamy.ramalingam@amd.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v2 3/7] platform/x86/amd/hsmp: Add explicit metric DRAM mapping and per-socket mutexes
Date: Thu, 25 Jun 2026 18:03:33 +0530
Message-ID: <20260625123337.886435-4-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD77:EE_|CY8PR12MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: fea65757-1748-4e60-ef3f-08ded2b60c6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Vz9QsA43ClTv3S65s4p+s1Bo0JOkUdUd2DU0jI2Yrk78JjK87mGEP2PtjezLfc+EDGxMI1TQZxDF3UmSmvUmTyFCo0kxqH0d0qNKuMz0aBtbPwyEJ7bANkVw6YnJfBC/ubWf7V13wqPpfn0jWc/7T0JMtPEUp9RbpfQcCJ97+V60VSghgHXYoa8KF+MEuAZDVF10d+I/8LDnkmPYt27iVEWuRYtNGeoYypYSSJNAIxZ/Uc2BpyHK1yYMc8IUydCwTUrwY/ZfdcVlGQXTJPzyF10kVhbOFa47vzd2cq4uA/ecV9Ziff0yrqFBHDhQu0liiFtcOti5YHmWWtdAO7fHNaZPOZr7CTmefvbyoDSpVv+K9Us/os78Vw0xndwFvQHOSFXoPcBeRwR4n1ObBS9AH250Imf52xvom2vHMjW9/qeqnVbgMkRXg03eN/+yOJzFOSP+IA8N02/SmXoNvw5r+M6ph9aw5VKv5SfxDnjghmjmsUFvC7iFNMZWoFtEeTyreUq/C6CaBkc9SfONkPAbVoNCOW03N7yUTOc5KXjOCxJ/O7AIwGJpU/wU42HXOo6pJURiV6MsPNVMkwN/0TSMnLJNZC/T73j9PxReyq7TYXz7/KCwT1Tn/S+jkZpvPZVYNA4LqPfuP3hwpsdLl/zBmlZruepN71CnfDsjmEYhx4Hkoa0h7mlROnHcojBwKzNudrOTNc8QBBrK65oXNy6gcw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xHeA61Yj/oRilTW4u4iKePZLjw5Xc/B3SrsLQEOMZ0TCnnNPPjl8XwFHW4acbX5Y4lsRO/7S20SpPSXxvC1JCHeuKA1m5EkUrMSEMm8BSGRNktOEo+t2ItuyqiXNJjsSvaqttFtK28Mj+/nEVq4MpuYZe6HJU+9MhRYddTmfJSJ5ZZlspq2rCH19lcM2UK2Yd4J7zynJ5bd/Z2ApCevqy+3GuzQpkwp43FcbInRIO6se+trHoZMWb61M9+S2I2VqzIsjIZjvLqen2y1C2FhIbxxAf9dcfy1/Q+qpZtysw9FjdM8PBgxncA3mefywFCB55VriiwMEmbaV1wIl/cFMir7MieRgnOU/pqTvxykQSOt9DnLKS/zRgVAcyjVYuHwcRbbNBogBvpHIg0mc/YCFPZNREjLjQ1xQbaNSXTwEpGTxm1H61VbrzNOnsXj2gMkk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 12:34:06.7310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fea65757-1748-4e60-ef3f-08ded2b60c6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD77.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7337

Add hsmp_destroy_metric_read_locks(), hsmp_init_metric_read_locks(), and
switch metric table DRAM from devm_ioremap() to ioremap() so ACPI can
coordinate teardown.  Embed struct mutex metric_read_lock in each
hsmp_socket for later serialization of metric table reads.

Call the new helpers from the platform driver probe and remove paths
so non-ACPI builds initialize and tear down metric_read_lock consistently
with the ACPI driver.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 38 ++++++++++++++++++++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.h |  5 ++++
 drivers/platform/x86/amd/hsmp/plat.c | 16 ++++++++++--
 3 files changed, 55 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 91be0cdb6af1..a96c59fcba0a 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -12,7 +12,11 @@
 #include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/io.h>
+#include <linux/mutex.h>
+#include <linux/nospec.h>
 #include <linux/semaphore.h>
+#include <linux/slab.h>
 #include <linux/sysfs.h>
 
 #include "hsmp.h"
@@ -410,6 +414,37 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, "AMD_HSMP");
 
+void hsmp_init_metric_read_locks(struct hsmp_plat_device *pdev, u16 num_sockets)
+{
+	u16 i;
+
+	if (!pdev->sock || !num_sockets)
+		return;
+
+	for (i = 0; i < num_sockets; i++)
+		mutex_init(&pdev->sock[i].metric_read_lock);
+}
+EXPORT_SYMBOL_NS_GPL(hsmp_init_metric_read_locks, "AMD_HSMP");
+
+void hsmp_destroy_metric_read_locks(struct hsmp_plat_device *pdev, u16 num_sockets)
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
+		mutex_destroy(&s->metric_read_lock);
+	}
+}
+EXPORT_SYMBOL_NS_GPL(hsmp_destroy_metric_read_locks, "AMD_HSMP");
+
 int hsmp_get_tbl_dram_base(u16 sock_ind)
 {
 	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
@@ -434,8 +469,7 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 		dev_err(sock->dev, "Invalid DRAM address for metric table\n");
 		return -ENOMEM;
 	}
-	sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
-					     sizeof(struct hsmp_metric_table));
+	sock->metric_tbl_addr = ioremap(dram_addr, sizeof(struct hsmp_metric_table));
 	if (!sock->metric_tbl_addr) {
 		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
 		return -ENOMEM;
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 0509a442eaae..91bc21232646 100644
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
+void hsmp_init_metric_read_locks(struct hsmp_plat_device *pdev, u16 num_sockets);
 ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
+void hsmp_destroy_metric_read_locks(struct hsmp_plat_device *pdev, u16 num_sockets);
 struct hsmp_plat_device *get_hsmp_pdev(void);
 #if IS_ENABLED(CONFIG_HWMON)
 int hsmp_create_sensor(struct device *dev, u16 sock_ind);
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index e07f68575055..685f2d2c574b 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -211,25 +211,37 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 	if (!hsmp_pdev->sock)
 		return -ENOMEM;
 
+	hsmp_init_metric_read_locks(hsmp_pdev, hsmp_pdev->num_sockets);
+
 	ret = init_platform_device(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
-		return ret;
+		goto err_destroy_locks;
 	}
 
 	ret = hsmp_misc_register(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register misc device\n");
-		return ret;
+		goto err_destroy_locks;
 	}
 
 	dev_dbg(&pdev->dev, "AMD HSMP is probed successfully\n");
 	return 0;
+
+err_destroy_locks:
+	/*
+	 * init_platform_device() may have ioremap()ed metric tables before
+	 * failing.  hsmp_destroy_metric_read_locks() unmaps them and tears
+	 * down the per-socket mutexes; the socket array itself is devm-managed.
+	 */
+	hsmp_destroy_metric_read_locks(hsmp_pdev, hsmp_pdev->num_sockets);
+	return ret;
 }
 
 static void hsmp_pltdrv_remove(struct platform_device *pdev)
 {
 	hsmp_misc_deregister();
+	hsmp_destroy_metric_read_locks(hsmp_pdev, hsmp_pdev->num_sockets);
 }
 
 static struct platform_driver amd_hsmp_driver = {
-- 
2.43.0

