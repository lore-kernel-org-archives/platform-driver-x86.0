Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013061.outbound.protection.outlook.com [40.93.196.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBE337646A;
	Mon, 13 Jul 2026 04:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783917634; cv=fail; b=XvIR3CwJsu2lAHuJwqFPpb8ilYACbOlxoQieyQHcbkMWyWNERQ+mGgcfe0bqzbdjWSfvUB3iXZi6ZSikVh6502y2QEkVcm8csl42o7XxLfjKLk8i6vLTL0a14ILH5aTYPIXE2X0GnTkW5xJx9k0wgHLytzQDojzNjxmv5g6Y2DA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783917634; c=relaxed/simple;
	bh=XitKQOIx8UmTWhOV/W9LPUVmUm38q8G/PXkZ0MWlw48=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dBe1Ts+0tjpofKrgBa3gT0de/4I41fGxf8pL65SWVwu48NtDQpjNXFmUB83C0Q9Vjmr0BKZfPtjKMXO8UDNSBKyEWQ4NjXg3nNEHPJByj063buaVLJiaqWYy4PCL+ffjT45FyiWp0TOMbSOxCBoMVb0v8u815g4oIXUu6/z2zWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=K/82QRWB; arc=fail smtp.client-ip=40.93.196.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="K/82QRWB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azR9XIM0NcRLyaf5gGNxyZN/ehM1hS2M5nG+zYGk/nYCAysQiNXxXbwmV/Nh0Twy1kV+L8ySI8NrJTcizhzf3GCZzOtHPjppU4q0HSmFjUf4+lK7m/Js3JPbT2vZo+5z6kcIk67SLLke+CRDZFxsVdfnTKpt5cVDdgXagdjqi/iy/RVIxjLWBQ9lyhsz1sdyDMtNMtA3Nj6M9DbXvX//CA3u8QNeCaD/EZgg+U8Ie2VDyQe02jYJqoSbal2ZzpeI32aR/9OirzNd8yqV+pIm/v6BzUPoX3f/pdILEMYRp/C8QTl4+4XhdUQkeMh6XnP1ZQOzhp/LWsAKBaFM8c4Zhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3XZeIuQn/pJE53Mejk9HVsw1h7wIkwrG1Rx7VMe+q4=;
 b=eqPA4HLx7fvk1rQG/f8sELxFSuvAD9SrbtbgKAWoVYquLr/J7Gx3Q9fr8Ud/xLlbvlL027rho9nm9+6kGm/3J3aMZ+uVODUNQyReYiYR+trqUFK05qNUpBw/2PSW7SVPXsoYw467CJXr1C9RRP7/gqX88J7yB0pdUJSiKHhux0HE/xObCL0eF8825MVqRMNxDI4WNWBgbxJ39SVVT4X+fQvUBpzmCQrR4svvPguhjpEHyCAZiizj15625Zy1whHNRvJo7P+bPkSQBvMbxlur68CYWRUZNVi3fHcNe6JC/LgYJ1wMswHqg7yVLDRH0EgqwF6iqZeW1E31iclodP/9oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3XZeIuQn/pJE53Mejk9HVsw1h7wIkwrG1Rx7VMe+q4=;
 b=K/82QRWB4k8qlyGzDFWaTJHS6yK+2d13HZzLbhyLYwGRD/qmQh9nLU9oA35x+1gNQMvLRpJhHF84jS8RKoTGqE8riHMXSaf0LOMAGllEV/FYd//PyVnjFLrffUfkTp2T8Q12J3AlsfVCUm938ZcLvYkc+2xPsu/yxrGAGYQncuk=
Received: from MW4P222CA0020.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::25)
 by MN2PR12MB4046.namprd12.prod.outlook.com (2603:10b6:208:1da::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 04:40:27 +0000
Received: from CO1PEPF00012E83.namprd03.prod.outlook.com
 (2603:10b6:303:114:cafe::3b) by MW4P222CA0020.outlook.office365.com
 (2603:10b6:303:114::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 04:40:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E83.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 04:40:27 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 12 Jul
 2026 23:40:25 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v6 2/6] platform/x86/amd/hsmp: Map the metric table with ioremap() and unmap it explicitly
Date: Mon, 13 Jul 2026 10:10:01 +0530
Message-ID: <20260713044005.1194115-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713044005.1194115-1-muralidhara.mk@amd.com>
References: <20260713044005.1194115-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E83:EE_|MN2PR12MB4046:EE_
X-MS-Office365-Filtering-Correlation-Id: eb252a3b-290f-4ab0-0ac2-08dee098dc8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	GSJXyWCH6C/ayxOBhwkOPZOpgo6f+gerZraESP5jgaPeYh8CpHqRklpYGm7NZIlvLb1nqouT2s6qjAJMepW4VDpPRKhGdKcglwtjU4MBQgS9gQP0+5o3kOCVizoVpfeTzWl66GpPnA5XjK1NPoR8zsYLgeUd29H0OOB3MamVzAFKGkdtYP5L86JdvM7p1FJY85Lz46k9QX/ep6hygczytWiu2aW64LZpOxbPXtoNsUofbLMtINF3yZeylqzNwr0oGYm1+nP9rQL3UtnlqXEPNCL3JfejSUFHyc9NtwJLBtQy7cU/j8HUeZoMVa5y4dgsofErkM338Ep7GsWU9SzWh9prH8D92vRsgaSpHRCxbwR5xs1T72B3sukWCliabXWVlmlv6y4uRVMkDYw2hDPO4WNhIJ8fjhx9B773VXTVQkJudNOdYLmWQZi3TKTcSg2egc0qNqazcNeGlR/kNCK/ZhEeM22F0FOFVDri9SG3Ydyfgx4r2mTkf98MXxpnlhlxI91Q0O5Ohn+whiTmURX3pdsgPCGVVv7E6ozeYVQD8CMgbRjMCC6cDVzjGs2/V4fhUxL1qmKENySYvz5QvYdGFDmTPlUgHsobm6L4vSNPZOqwLfH10ZwOmR+s7dQJFjnqtkcCdsanN3oev7A2z72Tfd42mkHK0h4XQw/vZsVHnCIBMLrbD2DbuF/bW9fosxHRJ3jHVP/QsOn6taySA1SeHQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AjAIKdHOJAkpitjudVaR5gVoWkY0Rzv60gg6d4ukp3XImw9TzELRWeGuVyCtYN0ai3HcNg6dxj2bUGChjcNm6apSHVWx6eHu/BN2ZM2xUzQjWztI4ATqYhy4iWdalli9TEGw8Nm++wOdsbhXRT9Mok0DwaGbAZ8kOOMi3rFGFeSH7J+ENsjX6eYqW9UJbxwPa1jSmarcZ+yd1EdN/lDeS83WK4KIq85ug6rTfQublK9ar9MxP8TxS6hrrSuAuDdVMC1Il6fUy3zIv8enRKFRLiRZyPfO8qefOMX95PxN8YFBz8RCq7wI5CEvYvvzGfO/RbWsc04OcKvUa1d14lFvd+/UDXzDbbXTh/L7Q7EDuyH6LOv/dn8O5bvQ0kiVKlvk5yoyR4AsF5Qwx/Ov1MimcbsPlVfqL7M7fRB9NHWyLfAWW1rrK5ajn37z0+qR0ncb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 04:40:27.1725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb252a3b-290f-4ab0-0ac2-08dee098dc8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E83.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4046

The metric-table DRAM region is mapped with devm_ioremap(), which ties the
mapping to the socket device's devres scope. An upcoming change lets the
ACPI front-end share the socket array across sockets and run its own
coordinated teardown, so the mapping can no longer be pinned to a single
per-socket devres scope.

Map it with plain ioremap() instead and add hsmp_unmap_metric_tbls(), which
drops every socket's metric_tbl_addr mapping. The platform driver registers
that helper with devm_add_action_or_reset() so the mappings are released on
both remove and probe failure, while the socket array itself stays
devm-managed.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 19 +++++++++++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.h |  1 +
 drivers/platform/x86/amd/hsmp/plat.c | 17 +++++++++++++++++
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index e9c17698983c..008f3c0b2ad7 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -12,6 +12,7 @@
 #include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/io.h>
 #include <linux/rwsem.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
@@ -423,6 +424,21 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, "AMD_HSMP");
 
+void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev)
+{
+	struct hsmp_socket *sock;
+	u16 i;
+
+	for (i = 0; i < pdev->num_sockets; i++) {
+		sock = &pdev->sock[i];
+		if (sock->metric_tbl_addr) {
+			iounmap(sock->metric_tbl_addr);
+			sock->metric_tbl_addr = NULL;
+		}
+	}
+}
+EXPORT_SYMBOL_NS_GPL(hsmp_unmap_metric_tbls, "AMD_HSMP");
+
 int hsmp_get_tbl_dram_base(u16 sock_ind)
 {
 	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
@@ -447,8 +463,7 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
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
index 129200d0cf81..b0d67b93363d 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -64,6 +64,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
 void hsmp_misc_deregister(void);
 int hsmp_misc_register(struct device *dev);
 int hsmp_get_tbl_dram_base(u16 sock_ind);
+void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev);
 ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
 struct hsmp_plat_device *get_hsmp_pdev(void);
 #if IS_ENABLED(CONFIG_HWMON)
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index e07f68575055..b5f2120765c8 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -201,6 +201,19 @@ static int init_platform_device(struct device *dev)
 	return 0;
 }
 
+/*
+ * The socket array is devm-managed and freed by the driver core, but the
+ * metric-table DRAM regions are mapped with plain ioremap() during probe and
+ * are therefore not covered by devres.
+ *
+ * Drop those mappings from a devres action so both remove and probe failure
+ * unmap them exactly once, before the socket array they refer to is freed.
+ */
+static void hsmp_pltdrv_release(void *data)
+{
+	hsmp_unmap_metric_tbls(hsmp_pdev);
+}
+
 static int hsmp_pltdrv_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -211,6 +224,10 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 	if (!hsmp_pdev->sock)
 		return -ENOMEM;
 
+	ret = devm_add_action_or_reset(&pdev->dev, hsmp_pltdrv_release, NULL);
+	if (ret)
+		return ret;
+
 	ret = init_platform_device(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
-- 
2.34.1

