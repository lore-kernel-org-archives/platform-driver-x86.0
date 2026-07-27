Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012064.outbound.protection.outlook.com [52.101.48.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219D936CDF2;
	Mon, 27 Jul 2026 14:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161775; cv=fail; b=CrNoKUq4uqP8Wb5pk/+WT/3nsUH+hFA+s0stf54XTYFunm5uiAKe8rdGTqmnK8QGC5fOs3bRRI7JJSGKALUpkxy+wTRDQQz8/prCSsL5wCdY+Ty6z21UMSNDFWuE9mh7PWfHDGye/hUQoFXWjRUUmTlrrZoUQoufQgzQnBidwYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161775; c=relaxed/simple;
	bh=5RjEfFls6lFpcXy0gGcPUYaLL44+/RMOCVzDYqDOoPc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dNsLvRfjqVOPk00ftJsPzWHIkPlE2SwRPaAucOKB/yWnTdi4ypHRRU3bS/Tln9E7a8/EUV22BNXyuARELZxEouX/K264wrUhckZ1NjqTns1BZ8hfGR+rp44avsPl3WkG8EGNg06+EDcYRzMogInnP4m/RG8nKfiSpr49YzT2v9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=urZh5C9H; arc=fail smtp.client-ip=52.101.48.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="urZh5C9H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ET715tAzTGMMrJwJbumWD0uqLBwtZhmCA2dyND7yGthwzxmEcvdvmW0FnSJcjnMM1xdJuanfCuIYRXCfm4M/TA8mSDd8jOnoiIjsUZusiJNKMEI8vY3CWgJIXdIUqR7nhzp6G7XSCXfwE5NoGdZ/5W86GgasgsUK25Hhx0Wa5eIx6iaB/tAxUt4teIdFt2bPcoLbUx/mZPf1/Wnb7/cTsY9D/NiliQMu7gt5GWMvg8kHIvqKgAPatxMan4C1RAxeSRJOws4v5ILphrOWpNOVVxOTFCZ5GHMNTHsCGekdpmY2hMIN5puC4p3vxMLuuzakjCexAtD93AcuQvO8xWwnMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Do3/K7RN2M0B1VkLj4jF56ann64/JAmyBd4Sh1kep7Q=;
 b=mEhuFw5iUyLrqGrsD0Q1QGEKFNE8MQr1Xbf82N45WlpRVTFzH1NnK3+XYc30lb+MIuqhOg4qa48J/LZQAnm9xzKQCPxoRGPqFJoCm7/quO+fSuXF8PAVWU3TIhYrhPfk308kSZqcq6/Gdc1lFP1aThXBJTLyZE64BsJ0ok6aELI+UtH65KQedqCDcI+D0WR7FTXb29TrH6OSGKKiomRvkz5vkC725uitBKhXAUj1jEgvg604CstDCLpSLTadoK7l74z4+h0whYWyyCmlcKVgNG8RXpAhPppgPBH7VM1KGnnoYcaqJvZViUbZWyGAAlIgmbY6lGEK0f7zhyEJ+K1v1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Do3/K7RN2M0B1VkLj4jF56ann64/JAmyBd4Sh1kep7Q=;
 b=urZh5C9HPvWlAjXWVErzjaH7ydwQZDX0FRGnIWkhi7YN68k7gZEP0vD1OO6iz3bjNCug9iQOgo8cJyke+H4lyD+MhVFqcvaZ7JVi0RDJv8jav4lkFq5B9xTn+KVkqgr6iurjJ8rDdsaSLXxooaRjKvPCIrdEHG7jSUgsChbayjA=
Received: from MW4PR03CA0212.namprd03.prod.outlook.com (2603:10b6:303:b9::7)
 by CH3PR12MB9195.namprd12.prod.outlook.com (2603:10b6:610:1a3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 14:16:05 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:303:b9:cafe::7d) by MW4PR03CA0212.outlook.office365.com
 (2603:10b6:303:b9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 14:16:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 14:16:05 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 27 Jul
 2026 09:16:03 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v7 3/5] platform/x86/amd/hsmp: Source metric-table size from firmware
Date: Mon, 27 Jul 2026 19:45:40 +0530
Message-ID: <20260727141542.3370108-4-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727141542.3370108-1-muralidhara.mk@amd.com>
References: <20260727141542.3370108-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|CH3PR12MB9195:EE_
X-MS-Office365-Filtering-Correlation-Id: f085a5e9-29de-4f1c-babe-08deebe998c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|11063799006|56012099006|10067099003|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tAmzqGH91ZJxN8y75PghTu9wp/qjyELYH2e5mxhQkxyHFybaPoUOMjBqgjqu459cHBChHFPIpIbSotgDNL74JuSB/v+WANBq38mHzFMl68av5GUqQxWD0paNxhJdhItgk8ly8+DcjiIFJv5mopxyiqA9N9BuxhdGzOjzkHijJMqQ3RiCR6QzWl/BqBeogYh/bB3QpfvLnvK1p3gEU/yaMA3j6hyO1L70+XCkDipPAV/eWLbflot/CxU8D9Llp//PFF47r4ZO+pBS2T95GWVOPoE42SZKwR5V3eFMCEpLkvD65FBxZZcz4m3Q/I1R+kl/lwiLEE6p/fGd7atL0AhQIxOlUNgoU3ew1naadE3mg8pKZB0kjJ25iSVT4/SZ8rKdlVM5WlW3OSUQyIm7x5gXMtuAvFGNJ2BsS7NSC5fmq+HqU+DUTzYrZYr5jMWIpkiTVPxDweek/24vlkJDdZFr/sWWSve3oTKUdA4ZFAyHlXnXwv7JjXgSk/A9z0clIDhtUoYzTsPBHEPIyM1C7FnA5ec7rcGEJsw/1G/DLMG86RUGBphZjG0bD476IecS0OHrfoC4BlZJl13UJ5dKLZf25xeQtUYAzbZI0yjsftftTV8ub6yZcWn3Ghym216ihzFytMAjTDciaU2CWlR6xW4juxVLf7Avui2VnblwwRalkMrQg2HJLFqwAHCpCMuKHhcLY84M/s9OGHzy/oYICf49fQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hTK9y8Ou+x4hqpyGacXw8MYoJUWiRUTdyE9DBC9FbjXujQyWM4eKZSmNW745EUB3i7fngwOw+uExeu8eDCcLsAqFyUKEPIHGNujigfkk2FGANlf0hFvWW/l1qUntd07QbdsL9umG5KB2wDz13gDUZ+uxa28ZXuO9/4NBT7XJTHb10mGlRK5Yq0Zh6UbHKrCCGXQZbQkva9vRn3fo/h5xomenADyj0favkTjf6zEV+SBMq1XbNjfsAvHhVo9tHWiWzjvjg3jF2Mkc3n7FE2qTo2LphSC/4q+b6cMzDNWL/KUOmHca1EQ5n4k1k9ktZ9flfpogjz6/JL4LdJVqua9jIcc/k8LAGiFOUZ+IYO/bKWqWpNuOM2o6zlJwk0b88vZO0XSwQDl963UEE6izfkW/WLzmwbAiG5PSm1HaZZIS97ni3zWX2C1Iw603fIXyNOLZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 14:16:05.5714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f085a5e9-29de-4f1c-babe-08deebe998c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9195

The driver hard-codes the metric-table region size to
sizeof(struct hsmp_metric_table). That is correct for HSMP protocol
version 6 but mis-sizes the ioremap of the SMU DRAM region on newer
platforms: Family 1Ah Model 50h-5Fh exposes a ~13 KB table under
protocol version 7, and the table is expected to keep growing on
future firmware. The same hard-coded value also forces
hsmp_metric_tbl_read() to reject any read that follows the actual
firmware layout.

Pick up the table size from firmware instead. SMU on Family 1Ah
Model 50h and later populates HSMP_GET_METRIC_TABLE_DRAM_ADDR's
args[2] with the DRAM region size in bytes; older firmware leaves it
0. Bump the descriptor's response_sz to 3 so the field is read, and
store the result in the new per-socket hsmp_socket.metric_tbl_size,
which is then used both for the ioremap() of the region and as the
expected size in hsmp_metric_tbl_read().

The size is stored per socket rather than per platform because
hsmp_get_tbl_dram_base() runs once per socket and each socket maps
its own region. A single platform-wide field would let the last
socket's size be used to copy out of an earlier socket's smaller
mapping.

Bump DRIVER_VERSION to 2.6.

Behaviour on existing protocol-version-6 hardware is unchanged.
Reading a third response word is safe there: for this command SMU
leaves args[2] as 0 rather than a stale value from an earlier
mailbox transaction, so the fallback always applies, yielding the
same value as the previous hard-coded one, and both the ioremap and
the size check produce the same result as before.

Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 arch/x86/include/uapi/asm/amd_hsmp.h |  5 +++--
 drivers/platform/x86/amd/hsmp/hsmp.c | 17 ++++++++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.h |  5 ++++-
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index eff35c3c6ce0..d1d3bc60cffc 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -367,11 +367,12 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
 	{0, 0, HSMP_GET},
 
 	/*
-	 * HSMP_GET_METRIC_TABLE_DRAM_ADDR, num_args = 0, response_sz = 2
+	 * HSMP_GET_METRIC_TABLE_DRAM_ADDR, num_args = 0, response_sz = 3
 	 * output: args[0] = lower 32 bits of the address
 	 * output: args[1] = upper 32 bits of the address
+	 * output: args[2] = DRAM region size in bytes
 	 */
-	{0, 2, HSMP_GET},
+	{0, 3, HSMP_GET},
 
 	/*
 	 * HSMP_SET_XGMI_PSTATE_RANGE, num_args = 1, response_sz = 0
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 02425f7e6f14..3e9bdbcd9ea9 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -429,8 +429,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 		return -ENOMEM;
 	}
 
-	/* Do not support lseek(), also don't allow more than the size of metric table */
-	if (size != sizeof(struct hsmp_metric_table)) {
+	if (size != sock->metric_tbl_size) {
 		dev_err(sock->dev, "Wrong buffer size\n");
 		return -EINVAL;
 	}
@@ -484,6 +483,7 @@ void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev)
 			iounmap(sock->metric_tbl_addr);
 			sock->metric_tbl_addr = NULL;
 		}
+		sock->metric_tbl_size = 0;
 	}
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_unmap_metric_tbls, "AMD_HSMP");
@@ -493,6 +493,7 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
 	struct hsmp_message msg = { 0 };
 	phys_addr_t dram_addr;
+	size_t tbl_size;
 	int ret;
 
 	msg.sock_ind	= sock_ind;
@@ -524,11 +525,21 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
 		iounmap(sock->metric_tbl_addr);
 		sock->metric_tbl_addr = NULL;
 	}
-	sock->metric_tbl_addr = ioremap(dram_addr, sizeof(struct hsmp_metric_table));
+	sock->metric_tbl_size = 0;
+
+	/* SMU returns table size from Family 1Ah Model 50h and forward */
+	if (msg.args[2])
+		tbl_size = msg.args[2];
+	else
+		tbl_size = sizeof(struct hsmp_metric_table);
+
+	sock->metric_tbl_addr = ioremap(dram_addr, tbl_size);
 	if (!sock->metric_tbl_addr) {
 		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
 		return -ENOMEM;
 	}
+	sock->metric_tbl_size = tbl_size;
+
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_get_tbl_dram_base, "AMD_HSMP");
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index cfd1a8cbd459..8dbff16a87b1 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -20,6 +20,7 @@
 #include <linux/rwsem.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
+#include <linux/types.h>
 
 #define HSMP_METRICS_TABLE_NAME	"metrics_bin"
 
@@ -29,7 +30,7 @@
 #define HSMP_DEVNODE_NAME	"hsmp"
 #define ACPI_HSMP_DEVICE_HID    "AMDI0097"
 
-#define DRIVER_VERSION		"2.5"
+#define DRIVER_VERSION		"2.6"
 
 struct hsmp_mbaddr_info {
 	u32 base_addr;
@@ -43,6 +44,8 @@ struct hsmp_socket {
 	struct bin_attribute hsmp_attr;
 	struct hsmp_mbaddr_info mbinfo;
 	void __iomem *metric_tbl_addr;
+	/* Size of the region mapped at @metric_tbl_addr, as reported by SMU */
+	size_t metric_tbl_size;
 	void __iomem *virt_base_addr;
 	struct semaphore hsmp_sem;
 	/* Serializes HSMP_GET_METRIC_TABLE fill-and-copy for this socket */
-- 
2.34.1

