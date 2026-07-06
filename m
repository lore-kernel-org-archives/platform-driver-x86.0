Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012024.outbound.protection.outlook.com [40.107.209.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D064A379C2F;
	Mon,  6 Jul 2026 14:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347702; cv=fail; b=R29TwbWoaVkTZmt64IQRI5dAvrTPjom1FYG8tFbi3u+TaVThTtzsJ3XQwgMKeSqZBkt9D4MIOQLcF6/FqY+AHt1eIvzZ+sX532f1EV324VJuIC1nWA7wk6cthdDb9fUTQWER4WS1vtTugXlfyUTgcm7WpRugbHuEV3kOE8nwP3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347702; c=relaxed/simple;
	bh=cz7QTXhoRFJGJhjBtIozmE12PLtcEZOulkz14xyqRus=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BvnIjPkgGja87jilQ9WbxHu2l/ilA6S/+mHuTDpOwuBtLld2I9WfVm1jouUSlsBHLBHMeQTuVlgnYvGyqLYWEsf+ZbOfzmKKR/GbXwCmuhy1LS8gAA6brF1XmzK59QW8P+gdhyeJChnyYsgePqe7KzEPgIHFpC1aQxm/o7Cfdgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3baWX0xH; arc=fail smtp.client-ip=40.107.209.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3baWX0xH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTPzj+QmZ8g1sMXyD7YqMvdqBOi+VC0NWT+THe2E04BpvUKLGNyygJy6ij/R0bs19WpbjnoxX1dtGu6kuRwdGoW4xqqoNQxuHe+VB7mHpYwZdFWMmOlxfK6F4l8ZEEdczvu1PskRSNNlkVi4WoJ4TjZhB/9Rk5cYTvnjikZN8SIZzamq9GVIjBDltsIYgTjP5GBy2t4k9ze39WAM1GeKaLibClHp4LUsb7UNTFS7JBXwJsbPCzZSxYWjmjPhHAWEyyEswveoYfYQfBLr8iLVomuPHr05DAYgU5Oen3XhTeCya8RUHS4P3rp45h63Bv3ovT9bCGX3TsRfZjBlIilZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQwIFs9A0zHn8MKQCqqY8leADIsBITGGbxFgF/bRVgU=;
 b=YvGRMGB1HLYVGrfJoE6A9AEcQRgXuJbgeZrce3YzzmgE81YL0rsyHv87w3m6Ne+r6AVIGUsZmfSycvYhxVUpvZ1hm15Oxc5rluyQmFLK+KfYz6xnGAQoxYQKWNC1BP5ZNPHR+aZvK62kiOqL/PUhZXi6CUYI76PRebDMO2Wrm7S24EEFy3m936xEnpoLWdmQ+hktdgLP8CnacR0+TceATNRzkAvmxLP5tH71fHAYObnfOw86xQujUCDjKPVqIkzDZoeZiJtWlqbndKirwLu/9HPGhYBMEB4PVC4CNY5F22XjkUq/mYX+PVXxuxLsCcE+bFaS4ZQhJkHy9lHTzE+wiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQwIFs9A0zHn8MKQCqqY8leADIsBITGGbxFgF/bRVgU=;
 b=3baWX0xHQwa0ggqEtyxsx7h2Ug1MTuLH61JAJ6do98+9V1baaCbXkTVv359iqkdQL7J+Z4qogiYYxtiF1Q/1WRBVpLFQfwrrSjV9fLY4RD08j7Gcz98CyD8wo11H6MAlxb8JdZQF57XdDUZb95uQMZiVy/eCo2FDSWd5XXcReLk=
Received: from SJ0PR05CA0139.namprd05.prod.outlook.com (2603:10b6:a03:33d::24)
 by IA1PR12MB6628.namprd12.prod.outlook.com (2603:10b6:208:3a0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Mon, 6 Jul
 2026 14:21:34 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::84) by SJ0PR05CA0139.outlook.office365.com
 (2603:10b6:a03:33d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.7 via Frontend Transport; Mon, 6
 Jul 2026 14:21:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 14:21:34 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 6 Jul
 2026 09:21:31 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v3 1/5] platform/x86/amd/hsmp: Serialize ACPI HSMP is_probed with a probe mutex
Date: Mon, 6 Jul 2026 19:51:10 +0530
Message-ID: <20260706142114.3202259-2-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706142114.3202259-1-muralidhara.mk@amd.com>
References: <20260706142114.3202259-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|IA1PR12MB6628:EE_
X-MS-Office365-Filtering-Correlation-Id: 563a0013-6ad9-400e-0e0e-08dedb69e20d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|11063799006|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	OSfoqkJa5Mf/8haBzJRr0fcEs7AOx9AAHKeyHg/FVKFdOv3jPlDPTt2dZqHLANAQYbodi2VVngrOIAf+iaYWr1z2D7speJ5OSmTXFqBTeqXbVIKJXAMbUNwNpIJXwGckhlc0CflHpvodpPK6pn1v61gbZMSfLkrKpWZV+6bSdDg2i9rpZc+5hfu16zCyGq3EmNEqK5nx2nPo6MtSV4ZvTlfPifmc9WqmJKuVYxmq3NamHl8ad6nE19DitA4c5S4FDH3R+Ye5hjWVcwFGp0lhS5mjmSZUqfDBPYJ6xRhp1kytN9ZsmZ1AJYg7N7gNX6+lAoaydlzf9JEnmnkFrWxx7XeuBhITAF6O/KX8/nAG2A3lBjthY4O5q0SkDCmglqdqWXJRST2WMSpWb9CZUSDUGcH3w6dXRzKdZobjiGlVmvMd1uk5uON9RuvkcxTVDxqGo6RiNL371ySDzfSgAGOuakL9Z/VXwk35rPWSB6AO49kxG0VguyYyF+pT6/2ic6p3iAzcWg95kWF8m00IQzejxImRRIzUpd7q7JjdelRgtouwYwc4onsfw3gfQpqrqMnMEmdBc0KF81ZcyfA15UeCvdOHJ1VkUQ2p3U4ccjzZDt86ZHV7Eb8RtoLuO5Dxdyul0Gj6KJd5esaKKuHliideGjuoTq/gINiT9CPmIOg0ZqmeS2jo/nVxVKwKbkBtZCQkqN1U1m2uMbot4BD8TAzBjg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(11063799006)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vYq1JEbi+9rPaAMjZpNuTeTWUf9GNlsNEOr5vG7yWhKk2VTqJfnANXihL608D0028iJdEyGFKtrHxxF4NtDo2i3uXItg2l7AYAy+tx1CE4f0iRaEVeerG69FvlgsfomaldzNw12JoL4G2/D75KpLysSaNNz0TIoZ4TpElfy8VMPacrPoI4DBoGxHYfwFUS/dRmvynLRlZhU80SSaYchLnzII8kNXnn5CyMxll1fev56tTqfmIV8NW0ZuGCbzpKl90YA5hFFRXuM5ZujZ+6j7tiBCmwEFk4rR3IDG6d5v3iFk2f+FhYL8bgXqdrZbILS/sweCJ0SAV3DBU1TGT0VpqeSa60cIEqlMwIgGeRk+bi899kzUkBaj6wzfdvGlUuUP0glOpHCQRK1DqqDJPnefTKi57KZHz8pJ98YGaqpSjn7Ul46HaotBk7z8GjhXTJeU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 14:21:34.2467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 563a0013-6ad9-400e-0e0e-08dedb69e20d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6628

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

base-commit: ff7836fa850c2f815bc219f1e48f6ec8699f4ae7
-- 
2.34.1

