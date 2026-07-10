Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013066.outbound.protection.outlook.com [40.93.196.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9820342E8FD;
	Fri, 10 Jul 2026 14:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694839; cv=fail; b=rJSx5v/yUYns952pKeIjTbZkdNzBg7WvZHnh1kVV9VZdOfojvsjIUrOdsBTEb1wRL23TncPyGzIO6yH+ZbcIdkzuphT7fN9cUKGXSC/3nlUy0VSDW9u3Z2gFv9KLdSUdj7JJTmf0SmZcxGvGM92tOWcU34Gk/VYBkIAXRcBQPus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694839; c=relaxed/simple;
	bh=XitKQOIx8UmTWhOV/W9LPUVmUm38q8G/PXkZ0MWlw48=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W4Od483+g+a99Uy543k99xbnsW/wxlLiP1J7iHP2D7+8nTt1cayECYqziiFZIRTbgwifkI6E2aBkn7zM4Dlr9HA6yNl2WIAl3HeRZut9rpW/edd/5AsLJ8AKMQOqoBx74EhxNoDDIhV1DL6ICgU6W9d90mKvFDVIfU8gMpu/rR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rvKetxy1; arc=fail smtp.client-ip=40.93.196.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rvKetxy1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hk+dSe52IkWtVaIK/nbNHAa8kXiPNxALPLDlWQsfZVqaQufa66YbZ+yH/Z/6EGNQvWxqPvYqZiDJg2FjqT1tK2/9NyPgv2OYzmEIYp5ZGa9VmYgFn/He/WHHAYmC324CUbJOSvxvkub/D2GKqB6y1QkqQmaWYp885gUKdS8k19gNEkUERwrljOumTLgZs0nQmyD2fC73jN9eNyR/dxpiEnx9Vy8pU+JajETGOGl4KTnFqIvmUWd7fGLRuB2bCWydyQsTtdrPITAHsaTmefSSIc+RrYIEwCIXmmWZJoA9ctkeJ1bv3hkLwPywgtGEO25phZPhohJEXt0YC5xtrQlOlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3XZeIuQn/pJE53Mejk9HVsw1h7wIkwrG1Rx7VMe+q4=;
 b=jxncvvrzKjW4s8OQyH1DTMg3dEMHtFVCME7EWPF5i3cTLoZgC03ZgIMtUjKS8jYTtloWeUSHy0DWSz8OU7UAYDHAvoyqKcKGY9+xm38hgx1KNyh/aS548x4vr9rb0Q/jVzHmsKFXa8lgnlZgXAEop//g2yqGcjrapJdUnDQHvF64qILKY+cTwT5kCoDV0sPACJlsllLqkPj0QWgvRu/eE69YZ9q4vrwFum4i5VPp8MEfoylikhzJhqftbfwgcd7S1j+zm6Wn9p10X8jKxaR28xSfZQvHesuEzoCLOfENSKqJ48wOXJDDfvw/7xnk6PFNlN8w10OqIe1gt7nPyvGT4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3XZeIuQn/pJE53Mejk9HVsw1h7wIkwrG1Rx7VMe+q4=;
 b=rvKetxy1f48BstcwlTh3/2sFxXEWmQfszOponwKrAEwMCFKRttWZ/vQp4h9KcNvkfZhM0hKiHaaLw8Fhk3wZs6zqCuLWJB+VGYs3dlhXgGBvB6v1zo5A0/YGq2v9Usj2rnGJH7XCy7RhxnL/K0pHG7YK/5qm/lfWckGj+5q0LiI=
Received: from BN0PR02CA0006.namprd02.prod.outlook.com (2603:10b6:408:e4::11)
 by PH0PR12MB7816.namprd12.prod.outlook.com (2603:10b6:510:28c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Fri, 10 Jul
 2026 14:47:01 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:408:e4:cafe::d) by BN0PR02CA0006.outlook.office365.com
 (2603:10b6:408:e4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.13 via Frontend Transport; Fri,
 10 Jul 2026 14:47:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 14:47:01 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 09:46:53 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v5 2/6] platform/x86/amd/hsmp: Map the metric table with ioremap() and unmap it explicitly
Date: Fri, 10 Jul 2026 20:16:29 +0530
Message-ID: <20260710144633.879018-3-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|PH0PR12MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d5b967d-2986-47fc-e1ba-08dede9219cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	57LjyiTp41TTdqJiBEYd9tHRQLb/L8tLKfta+qI76W63UONctNEh/0CLQmUKGthcUZDBuFLnGcLBTYE0myEXAFWHg5rrksr3Xu12+n4G0dGW5PMfjC804kDSrqF0p1/gkKhF52Jn4ijkV0DwyryIczLBvfmQ343kMgXfJuQiFK+xsJLFQcgP5MSiFSzoi0cg0xRjyefG25DTHHctmwsxrG5A7UHnbNCcUHIXoz7MUX5sCbe7pES+AyewmTN3uySAX67HcALBHpeFHAaVUFuBMWP0vYbWYbynJcwpKokP2OTy15gMKPmun1/J3JacQ3GKeIw0L8sNYRQKttD82WFG1izNbjjeAy7W2gaLjuTqbLq757abaCxk3Zb3hVt1V22yKsIDDyroesFm6sEQ+ujTeYy6wlAPZOU6ZAePzqp1upiGNX7U+bvD3pdqqRZjKcHS2FYkQBDE3ED8rKzSBnHEOGXckwB9CKxOBgToMifkkgWfEKGu84diGiQhbLr25RgHq/QZuzhl0vOwym5XRUK0FIvO460D9Ts6QNFCo3hMejuJPiwDFjlu/YMELIJR/vFsY6y6z1s+kJg79Am2qCWYcM0ci6KJK52EC1I5eE7/OdXGISVj9guue5w1C7/WADjocp8ZzohE52KlBRY+fhnpAXB0BKyqOP85zGiM2mZbldgHOzEXMoAQGYpljS9RmuyXAxCzwcq0r2Kf6Ew8Dkge9Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mfKCnuJfq318ZiXVeBB8JxyNiAjqPftBSQ7PBhJi1FHm1mb6inV1XGZ343TBMTT1JK8bhF9u7qE3dbPhr3MlZRV0ywlvTrc/S4By+4ppGi8Ji9mWVEurDxWCJANASna06ug28AbdrjCY1DV8v9RHpIM6BdRp2snGJz/5502lNPn7oj0gAqw8F+UD9eYji26ip8hkdeElWoTSjAGtrQAuOBojmNJSVmvOkXarQuIBosNf0LlvrRIqTWSnQHBOrPIUcEDZF+gsqnbOZFVev2EUT35Y6H1IEYlamkD+xli4MjZIHoZzBi1ZQR5l/N8AWtFR0qce5DL1NF7tTdtXC++Ry2vzPRg2fGvHIGKSCYMYMiH/iA4JG7B49Uw2s3lTY1ZJZMORPOTnMscEPwXqsCfzJu4erRq5LXOHRCflkrfl742iPn5nq7hUv17K9IouuPA0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 14:47:01.2204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5b967d-2986-47fc-e1ba-08dede9219cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7816

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

