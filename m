Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010024.outbound.protection.outlook.com [52.101.201.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ECF184524;
	Sat, 13 Jun 2026 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781378309; cv=fail; b=KuAr24xnXILt/gwIzA4krb3kevZR1RHEIQpV1ikyF4mPK7BmOttOudkXrwz7EGVifGYqWtsv/mamldSzomqPUzmGFOSBSFaWJP7tVaVqvW3I8dhiu30jiMINioZQ0DJaBqMgo9B9SeUkeVqMDtPrgDkIFboAgcBs9U74kNQA59A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781378309; c=relaxed/simple;
	bh=KU3JMb36j4buZXOnadBMMZ3Q0oEStn0ZpBbq7BkGamk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DbTqKyunp+F0s9qUETAh0W4LJ2Y9Lclc9h72KI62dGgJZlIRwQ8bXkhxAIkl7dmHrw/k1beGKeVEbJZCTK3B7NLsLQQAQP+Prt/XjWBUHHeI33A3cGHyISU9E5pxhyNTmPaFNWxxftebghyP84GMv/5jonzOHlV5JXZt65fHZ4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mdsEbe64; arc=fail smtp.client-ip=52.101.201.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mdsEbe64"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dque8frW5ZzTqnElHZ/xUsmjDgaXppbtl7fIGXiTjxsGENc97eIvBnMGPdQNza7Faq0+F9WPA96Vf1wbmKJwuT4nzs1A3drMN57YQgIP0GdoTa5k3j8cxq49pBoiucJ2tvHDl3QVtfd/2g+WJO/tDSilb+TtxQOhxlBTt61yU2Giagj3oGpqqrj2OKSqY8ZUtGJWR1EzKV9KBkqKt8bmnoCBomTp7nUyIauABInUeTU5no6rOMmlueM6tsh6Gal60iDOy8iugq4HW8e1lp4y+QBWo7fU8K3GxuU0oGu+Q2Uj5X2jYztaVIf/iTorSeOxRZVgCYKvPeeNPLrM4dWtRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/t89kBeruZUp+wUbjLTT/T1JLcrs3xz7vgbm4zAbY7I=;
 b=Kc2eYoF82789qx7E+tEAd7+lwx6BWq7/B7hd1iPqVLauQkeOP9CEKu2R3CXzb9SkIdXCfgMvjtnDvAuVbQpTt2EjzKZxV0yT4jjSRD92QqV7MxnsguzHC5oL3kgBQSKp1Yr5TVZ3vIhU631E76F5+nmzHuSzOV4m3t5awKasCdz4VqOzcHoQqKVxIVwFq8qwaLPFK9JpsxAcWtfjYmONhSwaUJEoMbtkwGlgz+RtgCv7CP4noEriaGuWGRaAw8BXb+xttgk/hNWbxn/cla6yrrzHrW5qf4nrqqcmuOZNpPaRIsKMVpKZMy7NpekL/eGND+qW98N9S22sSVvkSxEI2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/t89kBeruZUp+wUbjLTT/T1JLcrs3xz7vgbm4zAbY7I=;
 b=mdsEbe64eb1+DfVAJbbJiuJbjleQrjsk848H8F19Q0ULXDAyH0zf3EADKbTqT1sAX4KWcRPXH7wmPAKFaAuHhYxRDChhLo2nyOmTTDurqf/m3g6f+zGhn7xlRZg3/7BKkZkngvJBCId+g1Tq7R5h18YvNUbMoKEjfdhcGYIaI9k=
Received: from BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::13)
 by SA1PR12MB8697.namprd12.prod.outlook.com (2603:10b6:806:385::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Sat, 13 Jun
 2026 19:18:23 +0000
Received: from MWH0EPF000C6188.namprd02.prod.outlook.com
 (2603:10b6:a03:59d:cafe::6b) by BY1P220CA0007.outlook.office365.com
 (2603:10b6:a03:59d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.16 via Frontend Transport; Sat,
 13 Jun 2026 19:18:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6188.mail.protection.outlook.com (10.167.249.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Sat, 13 Jun 2026 19:18:22 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sat, 13 Jun
 2026 14:18:13 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH 1/3] platform/x86/amd/hsmp: Serialize ACPI HSMP is_probed with a probe mutex
Date: Sun, 14 Jun 2026 00:47:53 +0530
Message-ID: <20260613191755.2358969-2-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6188:EE_|SA1PR12MB8697:EE_
X-MS-Office365-Filtering-Correlation-Id: d7367a7a-7d2c-4386-7a43-08dec9808957
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ylRAA15LN1+S8Y2uqxn1CdAWTc9deTyBjeWKEjg18+Db7j3y5xZO299VpdupfApo6xSVb7sO6Ag+9Fce4BUkRN06RnOqnbj82hUOuUXIGe7Ilx2XEkKVmOCihjIyY4o4PvCSaoaqELxJdkF+Fm4qmX4tk//loTqbAWChtokNwEZppQu5GirNnGOVSJjl8R45VTal8fcoibJdiWUbpKWCUcJyigHXrplEEi2pmBUyrA+TLf21lr85lWpVQbuEOiU/sxDCX2ip3YuN3poQoLVfNB+fmZfnL+L9ukmqNkT4r10ZEifcLrn/A8aVjAKRwKOuLgkwrNtCjauaL/4z6vy8Ye5cPR6o3s9ny5ZMOUe0Pp3wfj5hcYnNLoe8CIyDwcy0pZHhpNnQsYBoISRpoUvAVf5e8YkBBTjmAhOFSMarUgtmVFfpPjUpT+g0PvekiC1e7RDuqQ3jTV8a8kkXWZA7Iy45ib4Mu2u/Tg5URRK8k8ZyShKAmARBfOGV5izR3zvCoLRazuyu5Z1GPjxar13XhKzxWjSMJgBn+tdN2KlEkfz7nMw40kjLPQlPG55W6mDukCDs1x3ZuABiFZqw8pAvjbpjfHVcQietJeEcjRedIoWrMX03P3KgCplXGdzKiobjgw9ATj+Zl95x0BXMDd1bss92BtaL/iebpZ8XwYD7MraARnLBonCrkOtU5mlvbRcBkCvVjZWXSaXKfbJnc03egpN6YqwDEXG9LTQJaEOwLt8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NqN16OshyVxsPkcngOmpDpNDP6Rp8d4Nc3CPsXBAQwsv0y/m9mJMercQaO5A9nSU5WKzX4Nvx4gRrcooyAmTrJ3ssirYcfU3sFpG8gsTSobl/JIRlLGf82dAp1BMkb7oaccon1jflD9o1nUlouMeGrJ320v4y+2jI/TzKOcuJMVh0vdj4SYSyZiUh2QgBiS53rwyF4DO8YJAbuVPujzh5TplaIMQK56eZp4wTiX3AQdZB5QppMvXgvEoNEspQzlnH16oXf4O67DzyAsnKtfNEAgcocFwSqTGPzbBXR9N516HkQAc0fIo45VoGBd4cxx2Vyj3Dp9rQMbENbgdE92tky904I6MJBGjwSbW/ZvAwkTAg3bQVoHMhGugna+GYQAjOmhkwiN/UduKlIjys4RdPpIW7GyiaG+55aTxqp9pX8BI43X3sKmCGNgcg7b7s7Gs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2026 19:18:22.8988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7367a7a-7d2c-4386-7a43-08dec9808957
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6188.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8697

Add hsmp_acpi_probe_mutex and hold it across ACPI probe, remove, and
init_acpi() so concurrent platform probes cannot race the global is_probed
handshake or the one-time socket allocation.  Use lockdep_assert_held() in
init_acpi() to catch incorrect locking under lockdep.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 97ed71593bdf..696884a91c22 100644
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
 #include <linux/sysfs.h>
 #include <linux/topology.h>
@@ -38,6 +41,8 @@
 
 static struct hsmp_plat_device *hsmp_pdev;
 
+static DEFINE_MUTEX(hsmp_acpi_probe_mutex);
+
 struct hsmp_sys_attr {
 	struct device_attribute dattr;
 	u32 msg_id;
@@ -459,11 +464,17 @@ static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_att
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
@@ -584,6 +595,8 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 	if (!hsmp_pdev)
 		return -ENOMEM;
 
+	guard(mutex)(&hsmp_acpi_probe_mutex);
+
 	if (!hsmp_pdev->is_probed) {
 		hsmp_pdev->num_sockets = topology_max_packages();
 		if (!hsmp_pdev->num_sockets) {
@@ -619,6 +632,7 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 
 static void hsmp_acpi_remove(struct platform_device *pdev)
 {
+	mutex_lock(&hsmp_acpi_probe_mutex);
 	/*
 	 * We register only one misc_device even on multi-socket system.
 	 * So, deregister should happen only once.
@@ -627,6 +641,7 @@ static void hsmp_acpi_remove(struct platform_device *pdev)
 		hsmp_misc_deregister();
 		hsmp_pdev->is_probed = false;
 	}
+	mutex_unlock(&hsmp_acpi_probe_mutex);
 }
 
 static struct platform_driver amd_hsmp_driver = {
-- 
2.34.1

