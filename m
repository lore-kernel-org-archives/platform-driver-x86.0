Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012013.outbound.protection.outlook.com [52.101.43.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425C91E8826;
	Sat, 13 Jun 2026 19:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781378309; cv=fail; b=DaEHsd2rMbbbtnEhdy5DL4Sqtr+jgkWK//hdYKDQDn8sp3DcR8UBwhNKSfEaBS7/ZwbG/LqBtxK6KAhPyUK69GihPLBWVso25wug8BrNcK0OQddfgXPgn8PBAHHIubtgl6xn5m2zV7EegKMbuy4fxnXVLBYO+qGhi9KV2LaXQ2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781378309; c=relaxed/simple;
	bh=qjntSWxLNsihP9wF1SS7kat9qaKbiZSVV6t6aLEdylM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Av/kBFXJUBjG7n3dW1S02JS2Ef2qCUINDR3MQSBqJJdsoSDOpWzV+5FPhwt/xWL09q6uhnm9oywzRA5JU1dWC55xiXahBQpK3S3SrhaRu7kN3NGQIC6FgExqWfynnKvzKu0pnEzEaRQVD187eRAFUHQjemcrg39z5CD4GmcKTxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eceUtZMG; arc=fail smtp.client-ip=52.101.43.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eceUtZMG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NY7QHUFIwmOEXQTRsGD5IMhfVqCEuNweGA52PPdNPuBgxkWqhiMfBuHAw9n5MLUjL2UKqdcn+JdMqYIDZuQ/nOATB6eFbxqjBSXtpB2A2QkAWKAIYDvn+8EEv0K4jUBIShWrDS3RkvdNIx3ge7uHBRzddBHoMGTJ1WhL7LYWBWmciJbQU7vOkkf1dfh35VmwiYfdWo/xtNgRHmEiKa7Uc8liiJzPd/I/4KxdddUDpyHjy59oqGRjotMcS9x03JhpJLJZ04pdRNGimiM4qcYvTnKvL5RU+LyMCRJW1w6UnNOtZFCekPjVHskr5UfMoxq0iL1gmFSVbOFT3ba61sLkvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvCayFiZW4sd56rB58fVbT8zEfgAtardnZyYeYjxMYg=;
 b=if254aKk7SZXrAJb1dryolZ1eRzT3HTIRwSiUJ5u1ZgVaRz7B2Avukj5PTnv5rdwD8XnJ0CRc6Z7kmEorFRsSEPiRSjIYTSe/bpt8SJ9bnW/NNd6CahwXfxF3KcwRIKnFyg8KHuRccFqBacwVaVVzIg0Q7WrenEozGvFZoY0irGW4sDhA9o3p6GLM/13u1IpyIs26EDhmI0iJoJD48370h2AkT148geYtBC5t/JPaKjPUQ4grFNrCrOIgFGLhxQGBFo0e/JQX3wLyxFydBP5b7NYUhYsUk0En8JwlSYzzTLkHtLl45MhuZT9MXSNK0AUnVQ15oSuZvRiQ/13B3b+xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvCayFiZW4sd56rB58fVbT8zEfgAtardnZyYeYjxMYg=;
 b=eceUtZMGOJArOz8UOoYp0xW6IGwXcGtR0OaAK4DVgjWZFgVNyERBSp1QXPOL85qBzT9REwWuvUOd4eWFt5X81+wU5qLfwcVykh2hYVAmHEoH5fSi0zVhprnGfPBlQ7gExoEPtAkCroN8mzSCLLQILbfh3vfENVfAYONys//t+FM=
Received: from BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::10)
 by SA3PR12MB8812.namprd12.prod.outlook.com (2603:10b6:806:312::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Sat, 13 Jun
 2026 19:18:24 +0000
Received: from MWH0EPF000C6188.namprd02.prod.outlook.com
 (2603:10b6:a03:59d:cafe::20) by BY1P220CA0003.outlook.office365.com
 (2603:10b6:a03:59d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.16 via Frontend Transport; Sat,
 13 Jun 2026 19:18:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6188.mail.protection.outlook.com (10.167.249.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Sat, 13 Jun 2026 19:18:24 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sat, 13 Jun
 2026 14:18:15 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH 2/3] platform/x86/amd/hsmp: Add explicit metric DRAM mapping and per-socket mutexes
Date: Sun, 14 Jun 2026 00:47:54 +0530
Message-ID: <20260613191755.2358969-3-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6188:EE_|SA3PR12MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: 95bd7942-6ca4-41e7-6ca1-08dec9808a0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Y0dvsjnm4/9oD26enEK3lPAN8mLVbRTSKtZKYvX1MexYDAE+m1IAY+LM49CGIHJUvQi40x3K0KzP4x45kgLA2jEUJTcDPV4uTrKUMEHu5zGqtJWY89CP//w2N7I+z2y0FAaT3QmsRtfTqtgO2zYgCsM8XiLMnMd8Msb7hcvYUB0ttDg0ODlJBxaFrkONtVYuVjMMgRhxmMuyU+uCPUnCeMcj6Lr+R1XDOwvHT8kR/M9OmbKDZGE6mIAaXuJOiekaFaKwdZgovcU0t3WI259RIT2Gu4L8PJxJFbpHP369oZorcHRWgdbEUrfjPcrmlEcftcCKQn10Bl3f/gbkQ4VhpdthQzQ2mjeYK9seumgxIIT6HPKB7WLXIVbwG8GznyhlSI1oJJPSjwNsVEqSiPA/d5Dpr8CywbUD4dw575lgu1sDAU7DEAzoabiHl0XSv7heNs474OYvTHYXixwtY9gHn1DiJugdG2nIS1GSVyZFFgIUgRz10xKtfFp4T6EgpnOB+P3kIHsP7ou+ezrgUJr99c25Mg8LERitojh6bb6CutJ5w/ZZ2mDna/ME3/TMIlaLZBsUNS7bzO6AYHctFU7LVmmi9owyQ6VHYgxNRMGD8viHa2ZQeRAhoUblnzop6hW9QNmX7/h3gOk8z2UvZTbOoYCSIIfCmXvyXkHGy5bvkogkM9Ny+ygwYUlcTL3KAcFcrh8mnx6QfoqMinhI/6F0JEXEcF0WBhWkdY6uI48qNGY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1xLQ2dOONohRi1PHHxv9w5nh/6Y4pCG70z/H6LKJozAcFrRDys6ON2S+j+royERTEKEE2KUcq471UrbhuXmEHboPpm8/IRZ3BfFhX4ku44JB2VqNCCipV2Yw4ojibXZeOOotUYb6vV+5SyiUfcraztWvpZQZr/oHdxjZNKxvQIvvLKfkQrCRmMkpQGFqN/57akrqF6BR3k2eDU3qeOT/C4hpVmG0Lx0cTscAj21YLua1XjNn87PJal3rHjeuwI8aDDbvFxq0V3egE7NZEQBwTAKx/O58umB4KBHSmjstnHw1fXoe7M/Xb4vqWmyMA5M54jNzaRth5C0k1sOteUIzQrc4stvMpL7Km4Qcj0JdpePOcN/MWdMuXMc5C8DKScKMKQTFk6d4fz7eaQJUrK2dTVB5ec0ZAcY7xk4UzWPrrJjIc9rJdE8VXciza6o1SOE2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2026 19:18:24.0793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95bd7942-6ca4-41e7-6ca1-08dec9808a0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6188.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8812

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
 drivers/platform/x86/amd/hsmp/plat.c |  3 +++
 3 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 631ffc0978d1..81b6c24c3d3a 100644
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
@@ -379,6 +383,37 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
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
@@ -403,8 +438,7 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
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
index e07f68575055..f61d6cd13e3b 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -211,6 +211,8 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 	if (!hsmp_pdev->sock)
 		return -ENOMEM;
 
+	hsmp_init_metric_read_locks(hsmp_pdev, hsmp_pdev->num_sockets);
+
 	ret = init_platform_device(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
@@ -230,6 +232,7 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 static void hsmp_pltdrv_remove(struct platform_device *pdev)
 {
 	hsmp_misc_deregister();
+	hsmp_destroy_metric_read_locks(hsmp_pdev, hsmp_pdev->num_sockets);
 }
 
 static struct platform_driver amd_hsmp_driver = {
-- 
2.34.1

