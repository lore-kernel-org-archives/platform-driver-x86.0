Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010023.outbound.protection.outlook.com [52.101.193.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCE535C6B7;
	Thu, 23 Jul 2026 09:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800044; cv=fail; b=I8mt1oDAzIW8DNvoi3D/S1BDgoCfwzW6T4cThD7EAJJMPHugzF/f95tZ1EKXglHsK9e0ameJb9RijFeWxFnDaA/i3H2TnvDXG/6ZeTYiEV5tf5Mgl6SJjauEGocwGY8ZUKLIizc4m0P+OVtdAWB9FJTaeTbvVSz8qAwxTUit3/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800044; c=relaxed/simple;
	bh=XitKQOIx8UmTWhOV/W9LPUVmUm38q8G/PXkZ0MWlw48=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lkpfDp53QAHWUqhVz/X1lvmM3Yky75LdM13XuZVosjboDRlvUnZC+Xxfq9n0xra8hasroO19rjv91INLO+EINuNgFfoHD2jHSOeRMrT/2jSUeOXuOeCiWf7FMwpCbZ/r7mpNTJZKQ6TK70/hdhYeWtPmLRLaDa0VkJvbmAq83Po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G98dEgzJ; arc=fail smtp.client-ip=52.101.193.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G98dEgzJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snf1jV8YkN3T/L3yFiq1DFIkECdHXENbCMDxNDMsugdRPk0v9rUS/2SExyjDdLyiouET/sIR2xj0D/iEINCUhPzSI1VzQnRuuBczYw8wuio5xXFOvA/Y+p7UCkv8O3DHaZ6UyZd1xMhmkkFlrIkGRrJeYvVpuQBmb/EDX4jcx94jH4XOXRT54FOl9YxQIyRRTn+OrF/fs7t+8t+ywV47Xf7nd7ft0/IXnqFf1SeKkW/53RChD+uZ3jmJMhy/75/PMj6Ooz+rifWYvdcZudRkY/siDVw8ATSRKsAV2bKK0P79JHrJJLNEFS7nHAErXcfylU4/pTGDMO1ex00DkAxpXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3XZeIuQn/pJE53Mejk9HVsw1h7wIkwrG1Rx7VMe+q4=;
 b=RN6embKFf7wDtQU5rnLnR2SRcD3YXxYut1NdAJgMh173IXZVeVSPQPWsXNAjXn7NV5z/Bfr22tgU6IEvDOyZK0CHT1Xtny0TV+a4H8aIFbxl1ZeLpRbvDEv1xFXawI9VEjTRKz3DPI0P72CcR/j+cTFcPd/m5JRXAbR/51gfWK961PvH/W6pOhaCvhBARJGaPszvwRRtaQ0bPSFi/W9zJ0deu+0KIv1ATo50QwLOcR0qRmkHcKnN+TLr3T0SjdjJZIZk6rxLRWwLhhtaF/gSRDaVdVjJQMhfWFilvVpD7lcA39kTYzTyr/E+ibEyhqTwTeNwhtlUnhdlcVmJTkO5Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3XZeIuQn/pJE53Mejk9HVsw1h7wIkwrG1Rx7VMe+q4=;
 b=G98dEgzJ5pMG30qydlkl5809ibP7F/bNmbX4wn0DIBBm0qMKVZQlzZQbySeTU2yaEVq8YhVuQn1TRIdCZ2FKBJkQ7joNS0gbx/IHizXvmRqQrplUo6/ROIZomsY3a1d0GLicd5mIx1RvTppYvBLIjKXpHT3LW1bR5P0Fl/9ZIQ0=
Received: from SA1PR04CA0012.namprd04.prod.outlook.com (2603:10b6:806:2ce::15)
 by PH7PR12MB5879.namprd12.prod.outlook.com (2603:10b6:510:1d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:47:17 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::a8) by SA1PR04CA0012.outlook.office365.com
 (2603:10b6:806:2ce::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 09:47:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 09:47:17 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 04:47:15 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v7 2/6] platform/x86/amd/hsmp: Map the metric table with ioremap() and unmap it explicitly
Date: Thu, 23 Jul 2026 15:16:52 +0530
Message-ID: <20260723094656.3806028-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723094656.3806028-1-muralidhara.mk@amd.com>
References: <20260723094656.3806028-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|PH7PR12MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: f2fae844-d968-4045-4119-08dee89f6217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0R4gREA6qUycjF0P2IypHnW6bmHa+SC5+45ZeNZwrQin+gK43T8MXFpYckwHClKDI8UcaVWabgzaIKf+653X7SoXphMNijM7kaVjb8+Sszn+Y6BL2K//+DV0GVsvSGknh41u7Wj3ZL3Znlm7YHzVw8xkaQExD49blYcWBcp+bCCtAgq3FCt/AX14gwYDyiblbrO/6YoC6SFfZBLDz16xhEmioKR2KaqcelWEEOHRgQjm43TCpXtCAh3JJUgwEl+dHZRtXpjPvJQo9lV8aGFiAT/yVIWJIZiAAJg1Ux1M/vBMsIvz+X+3QThuCIyiJuHHZ5i1jTAMJZ1gQ1SHzgo23IrM/w+8gz9RuoQbc35CqejtOy4/BAv/aB7e4sH5rcBMUAGcpzJpIgtekb+9HeiGvz0GcG/ndTKnSC+k/e0L6NLEgA9H0dcVCz9yNSLqOV+F/BbfHEf9BMweIX0BW1S7lF0oY2mMF3KQOXwt9/pJR3l+nG1DOUyLpmcRd/TIRFU8iOmOFOD0rPay/xa7aa+WNsGdmGAWSscIhA8usJyxkdEsG6SoH5EDiYl89Tg4f0k/L8+Ua4YtOnmAJ84jdGAeZ1fku06wiSH5XN8enpCq2mqIXSBgXZYvy+Mwt4ctYx5WGYK6cmqa+qfqTMwAUfZBwnA6BgPA4VRqWgjLgCqqaeEbusKCI4DuTK11gS5SftHrBRJkjCAW3dLaE1LmW89aew==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	l7ZnggpnkaALzFlAOzlDdzqzHMf1n6Tcb69/y0TwTunUG6BUiJ3jlBGxayhkmNPcuIBnbOp8fpvB5nGZVLv69rT/eGDb1UDmoa3oMWba8HULcnZnHeWrR1FxobLCzPcey94Vao9kAgaOXldNUEjEgNGt0jn/AFcYqP6/xM9oWbSPDtTFxJNLeUPS1EtoU9QdgEPYv3QZuCFAbelH3aDj4CSzSDWk2v6kL2j8fZHlhXW8DXDBbCc2DNIHnwUum2GXzw0xax6A3fWbiOJoBASgYW1M9D1R5wWHN3AzlO+XbSf+P4nVbCdx8ciprYjWLg7O6fYbfAmYKhc1AFQ4iIuD0oud0ulSBXuFIYXT8kFdqBrcvUSMgGVsZAxFAtG5d0rFRFgBw8RtvNlYmrbSx0TbddHlVKd2OQoHjsmXv78/LM3L+A5DbboyITw9nbLlwtKa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:47:17.5707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2fae844-d968-4045-4119-08dee89f6217
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5879

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

