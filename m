Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013056.outbound.protection.outlook.com [40.93.196.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED8A420861;
	Tue,  7 Jul 2026 05:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401391; cv=fail; b=Ep39VgfBeUYzuVdTuix4cdqWxTjb2vVpBgk8C36l52N0yR20/QSUyZ3WZZ3sgwAnHkODI8DVh+nWUXxBnlpCPCUyHuWILEk3k99hfJzNyz4TaQ+XmJkGMP8v7uA4Ldrl5WQfY6t+H0ScISnReup891JD59piqrYQR1bfdKeckiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401391; c=relaxed/simple;
	bh=aXIq2NMkVAm0yXczB3NAvE4HBYY2dK4fqzzuk/D/sqo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e4eVr+2J8/lbZT30V7OvV1EVRNxFDiVCWVoYLXwzm+RBYoA1sjL9K3Pe9BlbA8lXm9bOj2JenOhW151wDiJ+xhm5PK08CDCXsFEJOSPbIdqsJT9KYs+4+PnccZcAvYXL+bJPkvq0U3SIi5NrQqrdQgkDKPgUj13EBmar1IbrGX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xcbjpk44; arc=fail smtp.client-ip=40.93.196.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xcbjpk44"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXqPdWgrCn0/OJG+ER83ZdLvHWx8zXMCAQAtY9izOZ0P0cL/ZFgwJaKh41MupkISjyEYGeClx6nYM/Ojfynsb2LeHB1uc7rcqJgCSXolFqP0rHxSRg5MKmm6JOXYlKUBa6Ea/UNwZamwezoqZmmVb+G9Hz2BluMmMKfZFsiugL9yHf4iMnYfj1ixXt5TJk3KvM5dJvOBc1JJ6JZjlZfkU1O/g8F9N5HmA/YyVGSf9xlh71VCOMXS3XCrA8jknOlG6XXzbQtFsSPD69NvzRkjpChomTuL4tVmdOXXM2KBNmpDhmgqliqDzZDfC4I6fAyngrAmbX4QRhO1WZIxWMSWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smaXgm2adO3OjEUPUYB1x8MIJ4X9HYTq28vO0nUGaRU=;
 b=XzrIjhvEOTgQTFdG7TuLIjaOxbXuVrM35E58eJSec51N67hAB8u75Ezke3xl8IA7Y4axVioYGT5yMMlOzuZGS9DjB3oQaujQHZuITjDqmOleHTx5vJnjowCpOJkGOZrUs/ykVRKDMl3rDfqARpM80HK95bmCBY0cmKMqQDSIzSUQ7Vuf3PhJHt6pmUmpI/6BXe13gSwhoWBLjQ7NRYO10JHj2Pu60QuZwLWdp7sKtBAbKcv/lMQdPCo4MghYn6hwTv3nwccDHxl67u3frfQgm90TTFU/duof/TZLslW8PFs04T0Ar//4Ui7H38ezNwigvckAgmCBp6o8qHAQe/sidA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smaXgm2adO3OjEUPUYB1x8MIJ4X9HYTq28vO0nUGaRU=;
 b=xcbjpk44WRUX8iEdsxsAvOejuGKrybrfKaJXpcO3dXcFUvb67jAE5HNLvBiARfW+0o4RBghHb3SjlC1TVjsWKBFZ9y4hMhdwqmL0WVdo1dryScvq+crLL/4mb7/1+0+nbP2N+iQ+3KvsVS7JHAkBEVVA8oJnBdEyAU88P197hkI=
Received: from BL1P223CA0039.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::10)
 by SA5PPFE3F7EF2AE.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 05:16:25 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:5b6:cafe::33) by BL1P223CA0039.outlook.office365.com
 (2603:10b6:208:5b6::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Tue, 7
 Jul 2026 05:16:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 05:16:25 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 00:16:23 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v3 1/5] platform/x86/amd/hsmp: Serialize ACPI HSMP is_probed with a probe mutex
Date: Tue, 7 Jul 2026 10:46:04 +0530
Message-ID: <20260707051604.3381713-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|SA5PPFE3F7EF2AE:EE_
X-MS-Office365-Filtering-Correlation-Id: 938d4190-3c52-4297-5468-08dedbe6e44a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	GlgJoTj4By6rIRwSJfK1s5jh5bNcDqwh1ZQk/wVc0IGikpmDrAZIcvB4COicmBbGd0lBrMVo2YRumpi2SNdWi7Z7g/XZx9xFSI5rthaqU1tX5qEe5LSi+FPRgDVnY98GLkHg3uAggTLfGm0SDUiyvwL74vtBGxZMN3CTQk8YgQLd59DobeSTI0r2MbAbCoAnHDs7cvqf4wb2cHwmMpbwy6poRd6RgLtSWYPeBXv53iewwG/hE5DIz9oZgL18QbOYTithcMnv3EQGmUjWMlrPKNJpCFAGCz9xDMyXcs3elf5VH0tEHg6+U4pvo5y2MdQtgDIyXFF3dn8tUBaNnGuDM7sYZ3ZECofdPpxMpvsCM0uHYmkqO12Ptiny/KCy/7ZnRdDzlcqUIIt5otFHXn31fTrWlpGDaI+zed6ha7U70tKSFL1udPiu1fc8tRotx1zaf1ZJch1h2vh1WSUYQrmzFVzsKTwkQhEt7PaOnsH/2TnFQYT5cLKkF72hMVtO943TUrIkAD06kLGSUfyyG4p7AOQPUx9RzBtF6O7fcEvsVFkHm8oEPIIXHecO6QXQrszOVy7VdvGk2qc9GqjJzteFao8JEecQM84Km9ZKvPB1IL6LYku/gc5Ipl22YTRYCZxlqPYYnHk11S++0ScsxrJh9nvzUg3JjcJPrcCZvS+H/xAMhYbLbHsqK8V9S1yaNvsFIaf9x5DmYGWFRv2rqQZVvA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8L0VvesJzW029SlXKvQuF8R6gTNxYUOcDPU/wlIFoEAJNHqdfz+trPeXVxW2RJPF9ZKnfIhqCJ6szfgF20d3t/WqgrSIunbQnPMbWSWLpMPuCTierB53GgumRp8RXCKmLRGxgsuZakjRIVVYL6wNDl0iJAr/wRH+3/m8Jw859eGh0vrrt/je6jnz55R5+kTqF+6kS0DwofHi827gnZMzi7FsnNanQNOJtTXxRc+0TwafzLR0UfRGEI83G22Whm41j2WIwuQf6kmP/N2MWKYdPuj8Z4JFLRUSqTIe5uwrrgF0/ePSSqBTilmZUfTF/qnd7/U8rjBHYms0JTc/NxrToN25xGskqBrEsyBnSovgop+GaDwubBcDVpWP5VBbY8/wa0EORGoMhe+cGpzQT6lAXF81A7SnitwoURYuzDrZ4lNMJKFa6Y3Ydvf9cCPahIB6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 05:16:25.1791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 938d4190-3c52-4297-5468-08dedbe6e44a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFE3F7EF2AE

Add hsmp_acpi_probe_mutex and hold it across ACPI probe, remove, and
init_acpi() so concurrent platform probes cannot race the global is_probed
handshake or the one-time socket allocation.  Use lockdep_assert_held() in
init_acpi() to catch incorrect locking under lockdep.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 72f68cef1297..206eb7897b61 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -18,8 +18,11 @@
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/ioport.h>
+#include <linux/cleanup.h>
+#include <linux/lockdep.h>
 #include <linux/kstrtox.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
@@ -39,6 +42,8 @@
 
 static struct hsmp_plat_device *hsmp_pdev;
 
+static DEFINE_MUTEX(hsmp_acpi_probe_mutex);
+
 struct hsmp_sys_attr {
 	struct device_attribute dattr;
 	u32 msg_id;
@@ -482,11 +487,17 @@ static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_att
 	return len;
 }
 
+/**
+ * init_acpi() - Parse ACPI mailbox resources for one socket and validate HSMP.
+ * @dev: ACPI companion device for this socket.
+ */
 static int init_acpi(struct device *dev)
 {
 	u16 sock_ind;
 	int ret;
 
+	lockdep_assert_held(&hsmp_acpi_probe_mutex);
+
 	ret = hsmp_get_uid(dev, &sock_ind);
 	if (ret)
 		return ret;
@@ -607,6 +618,8 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 	if (!hsmp_pdev)
 		return -ENOMEM;
 
+	guard(mutex)(&hsmp_acpi_probe_mutex);
+
 	if (!hsmp_pdev->is_probed) {
 		hsmp_pdev->num_sockets = topology_max_packages();
 		if (!hsmp_pdev->num_sockets) {
@@ -642,6 +655,7 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 
 static void hsmp_acpi_remove(struct platform_device *pdev)
 {
+	mutex_lock(&hsmp_acpi_probe_mutex);
 	/*
 	 * We register only one misc_device even on multi-socket system.
 	 * So, deregister should happen only once.
@@ -650,6 +664,7 @@ static void hsmp_acpi_remove(struct platform_device *pdev)
 		hsmp_misc_deregister();
 		hsmp_pdev->is_probed = false;
 	}
+	mutex_unlock(&hsmp_acpi_probe_mutex);
 }
 
 static struct platform_driver amd_hsmp_driver = {
-- 
2.34.1

