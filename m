Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013033.outbound.protection.outlook.com [40.93.196.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A330F42EEC9;
	Thu, 23 Jul 2026 09:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800047; cv=fail; b=M+qi9l/jxG6C1xwK3J8YA8BavOYFJ4UCUEMOIBI17wy+RKlLkfKxogcFL+qAE38DQ8R6lfhlLefoFvjcdl0qfAoGs8rQQ0n0wD0M/ZmUTHpRYJy0UCuxQkmnNFRX/35vbkwSmy0BlHEsYWvsPG3pck7G2xgLr6Se/LPubgD/J98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800047; c=relaxed/simple;
	bh=t6pcNxzgxUnlbOibqB4NYzZYzG/BqEyfso1F39C2H7A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fo/ep1wTLliPHpvQP4Q5rxpolMVgXDfI/FUQyeyyyU5c8rzMiT+eTUG/L6hXY67x5CdH330CngirCObsHCjrmaJD7awCdvf6jDaQBYMY0kueKmS/spplWC5dwXmJ1uFYd9q/Du4A9MTc8z0pY7glIf04McXQdjKBZw32geM3Ylc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KnKMC18u; arc=fail smtp.client-ip=40.93.196.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KnKMC18u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6df3rRv346Brck7WY2L6LfQngGaTDH2+nHG+JWIDHziPIfLRO3x+di6huiIYMxM5LOKCHFP6k1LAIkoe/x2HCwwnxbIvoY2bT7gGj3kEq/2dTjrdjXU0VmQXqaiuziGXsu5x+p5jAXoyb1u53hL5489Y38bikdaeBOTB/2j+3VXI8BLl3m3g3T9TTrcjXzm34jI2f3Lvrj533IoYUkvEILRlk6gw18FO2ZvrId2c3HU2fwxRDw+1wrMdKy0ue5KbFtQ24iouTWUMhiKxDxy8K054XyFbuablcE+Vxe/5VF6Y1pmpf2furk8g8gs1KEtynnXv3EeWjevlUb5AYX3xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTQqoRjCR1NTLftlLud0dF1a5y0lq6my/fM6coKXjdo=;
 b=ZqkmIWxpS2GPs46fxOGutTsaI6Tg5TFc8dzRSpp4MpQoB5HXFx2AsynOrfZuBvER1UtcphN1Q1SJNUHUwho5NswnF/8IicH6SYnGmFqlhHm1AGjBNrC4qv2TOhKqcsnKpxSeKwRFffwE4x6ZKCpSlBjdzG3wyvTEryuhynOzuk1xGPWEUsNWEK2pczQ0hIfvuyCRo4CuoPeyttEoTj28TTcGcsBfg5YkF5HsS45ECte14kYbD0gPltNG9XqTM9XTVVXWSJv9kw03UNC1hg5+FbKjU+MvBZocdZZ/TNlAsS6el2tVXTSnmaEj6De8hyeAeB8P/3/q/YPymMN+5AnNVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTQqoRjCR1NTLftlLud0dF1a5y0lq6my/fM6coKXjdo=;
 b=KnKMC18uZjqalO4/WiMonyGTQGZDflnYyZTfcKZxUZovUMLBOGMCjIjAYWPhik6am3BqX31EHwlzVQyA9IT1h6owo96ER596acemmanIo8xq+xIzW70mO6NPLTMAxDSrHlv2JraQjKo0sgbNRRAVabrakaVp9/uEWShTD5Nqclo=
Received: from SA1PR04CA0020.namprd04.prod.outlook.com (2603:10b6:806:2ce::29)
 by DM4PR12MB8449.namprd12.prod.outlook.com (2603:10b6:8:17f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Thu, 23 Jul
 2026 09:47:21 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::56) by SA1PR04CA0020.outlook.office365.com
 (2603:10b6:806:2ce::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 09:47:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 09:47:19 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 04:47:17 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v7 3/6] platform/x86/amd/hsmp: Serialize per-socket metric table reads with a mutex
Date: Thu, 23 Jul 2026 15:16:53 +0530
Message-ID: <20260723094656.3806028-4-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|DM4PR12MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc71289-0754-4df0-1602-08dee89f62fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gXNxmA65dnUrnls2Pid+jR2STwfiDaGCSFFSjeW3u0KqMtwo01hnaAl7P4RzfHHcLhqGGWav/sSGcvmTm/GrcEqk2YQuNjYS25VtmU5/gi6TCMYKfrHm+GfSB5eaTlWjEch+i9nq8D2FTTq8yRmCX0aYLnMEkkHIR84gGhIl2XwYEmC+3MBwy5XY8E9jSNBWWBT1yEuPnLm8X0CvzzeRb0sCl6BiJuS3ClTF7WfU+P/cMryQqU/zfBlusAUZcDiuXfJhlxsfxy9ixitd/etM1UF9+qhmoWxJd9zMWZMtfXjFvrR/GacRaDQzB6XXlmQm0a/U3DhJYapOAYXy5z25MSvBo7drcS8l7iY+Uc1WMuNw1INJE/m1aedDjXfK9/2eYY39P/PuRRxMffNC0EJ8MY3WmEVuDdw5Av+QrE1ErgJPGrskreT4/0048MxDsFbcMmDsCDRd1q/Y1uqhDrfur+cXR9d2LSvMYH9nZ6gxbOD15pqwJ6rmb/jJRIk4exWZGD+20RB4Q45F3VCwSiB5HU1sTvahyKy3NxVXSYMiAdVcM2WNpSKIslAw74/mG1+mtBaTGwFFhpNQluyEWXSeUqYAtwqzyAlW5Lxk4Laq3/Kk8+3X3eN6yvyLSnM1pvNLLUtefRktQZJdO7Hx1w5/DdhwBwLhY26s6wbjf4qPJCeIJh0SpaQwD/fzED1bLnpkGVLOj9jEh6xqtCPGne7oHw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E1qA2rZVUKNrYxlncg3aA3LkmYuWovvzhJMtP0eo78R4AgwOeGrEiLRKWlnVEkiJS12wFTJDlIeFo1DN9TktfIMfQGyQ89Kx7nVMjmogmn1j6Y8kSu3C/eCiFSYB4nxiNTOcyZMA5CMui38oA73jHYUk0jRdcukt5g1uFanKW3dIHr5kUeDJIlv3pxPkT3QZM5368u88pC7CYDTaODLMnLmQ/nGaRKMB8w3a4km76pabORY7vVvftbWyzwUo1m9GV5AFjR4tQCrgraKLtsXdsFsTCyziPijb40UDl4inOBfRlYlhyq5JgLCDTbz06wViEDmGB9w/DbmPeAMQtg3LAS62x/DwVg0b0jzbyfY9vu0Py+VExf1FzvyAhhQ231EU4WFbr3PVoENY5wNjEnsroDQJcDX90GJih1yBGln2yl9QBsjl4UffFW0pnpF1TknY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:47:19.0913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc71289-0754-4df0-1602-08dee89f62fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8449

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
 drivers/platform/x86/amd/hsmp/hsmp.c | 28 ++++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.h |  5 +++++
 drivers/platform/x86/amd/hsmp/plat.c |  3 +++
 4 files changed, 39 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index a23797bd1dd5..a092d7589bcb 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -639,6 +639,8 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 					       GFP_KERNEL);
 		if (!hsmp_pdev->sock)
 			return -ENOMEM;
+
+		hsmp_init_metric_read_locks(hsmp_pdev);
 	}
 
 	ret = init_acpi(&pdev->dev);
@@ -670,6 +672,7 @@ static void hsmp_acpi_remove(struct platform_device *pdev)
 	 */
 	if (hsmp_pdev->is_probed) {
 		hsmp_misc_deregister();
+		hsmp_destroy_metric_read_locks(hsmp_pdev);
 		hsmp_pdev->is_probed = false;
 	}
 }
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 008f3c0b2ad7..fd36c8f142c0 100644
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
 #include <linux/rwsem.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
@@ -415,6 +417,14 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 	msg.msg_id	= HSMP_GET_METRIC_TABLE;
 	msg.sock_ind	= sock->sock_ind;
 
+	/*
+	 * HSMP_GET_METRIC_TABLE makes firmware refill this socket's shared
+	 * metric DRAM region, which is then copied out below.  Hold the
+	 * per-socket lock across the fill-and-copy so concurrent readers of the
+	 * same socket cannot return a torn snapshot.
+	 */
+	guard(mutex)(&sock->metric_read_lock);
+
 	ret = hsmp_send_message(&msg);
 	if (ret)
 		return ret;
@@ -424,6 +434,24 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
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
 	struct hsmp_socket *sock;
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index b0d67b93363d..ec92c2a429bb 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -15,6 +15,7 @@
 #include <linux/hwmon.h>
 #include <linux/kconfig.h>
 #include <linux/miscdevice.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/rwsem.h>
 #include <linux/semaphore.h>
@@ -44,6 +45,8 @@ struct hsmp_socket {
 	void __iomem *metric_tbl_addr;
 	void __iomem *virt_base_addr;
 	struct semaphore hsmp_sem;
+	/* Serializes HSMP_GET_METRIC_TABLE fill-and-copy for this socket */
+	struct mutex metric_read_lock;
 	char name[HSMP_ATTR_GRP_NAME_SIZE];
 	struct device *dev;
 	u16 sock_ind;
@@ -65,6 +68,8 @@ void hsmp_misc_deregister(void);
 int hsmp_misc_register(struct device *dev);
 int hsmp_get_tbl_dram_base(u16 sock_ind);
 void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev);
+void hsmp_init_metric_read_locks(struct hsmp_plat_device *pdev);
+void hsmp_destroy_metric_read_locks(struct hsmp_plat_device *pdev);
 ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
 struct hsmp_plat_device *get_hsmp_pdev(void);
 #if IS_ENABLED(CONFIG_HWMON)
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index b5f2120765c8..7a16d1ab463b 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -212,6 +212,7 @@ static int init_platform_device(struct device *dev)
 static void hsmp_pltdrv_release(void *data)
 {
 	hsmp_unmap_metric_tbls(hsmp_pdev);
+	hsmp_destroy_metric_read_locks(hsmp_pdev);
 }
 
 static int hsmp_pltdrv_probe(struct platform_device *pdev)
@@ -224,6 +225,8 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 	if (!hsmp_pdev->sock)
 		return -ENOMEM;
 
+	hsmp_init_metric_read_locks(hsmp_pdev);
+
 	ret = devm_add_action_or_reset(&pdev->dev, hsmp_pltdrv_release, NULL);
 	if (ret)
 		return ret;
-- 
2.34.1

