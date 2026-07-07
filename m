Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012021.outbound.protection.outlook.com [40.107.200.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF402580F3;
	Tue,  7 Jul 2026 05:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401416; cv=fail; b=htHfH2FhIVgWT5a1Dbuym452IwXBrX3WMcpELytFiq5jZ67Qb5Uaa1V0P8P4SGZFSEGqJQhXmSpJ8oB4w9/dqSpS/Atx2tl0xcjExRh5qJvtj57Vu2ycY5rU58bpYTrWEjzFC+Z9PHFXp+L4YZ6C5a8K7gcLy04upiQS3wm3MXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401416; c=relaxed/simple;
	bh=Y+TNdg+wG1kdET1Hi2Dd+h7GQkeX3JjH+2yEdiN0g1c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tPWLPXEdPM7FHyrMdTKtwt9X/T9q2W5r04YMty2JIPHOFulqic1DQAv42kl8SMUMg2K8UHU96/R41yU2eZuuwwlTTYflrydSQ4Q2na+h3q4pNkwO6xJxrXGJgIThqOJKI4tOAhgPDPVw/EOmKxKGBVQs4r+A11OyI2iLQVG46hM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Lt+klhje; arc=fail smtp.client-ip=40.107.200.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Lt+klhje"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCtOddJo9f+zKYFGMdDbB6VsGCR4QJ9gwjV3M9Y/LEMCup+ssBUpqBdXjn9FKEirHDAF9B+5ROxXmhb3NjCOmmixY/t9cWcRSi9xdxHdlXWzc1p1SdupSN5yuPv/7//P09Mm+8OC9wtECcZz27IDghrOjJgr/PELYPzxq2C4iJVCOofDPrLnXYes2Htzvhe59CKnbKqoosub4r+qroxQ6KsbtSM7P8SWCKRr7Tz+foA83eLNSfakTID6cqDpUh8tFKKJ/qCEfIcricuQ0zw1/n70nHt97X8Kjvmtr0XHUWesjrv2iJA/whB+2QEQ34xYnnS3R9LRUbHATKkmziubcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkCIOYtnJKVF8Isihu3Ur7ytImEBCFJeVt5QNE8wX5I=;
 b=BF5UzSuiJwi2ZabmfGnYNdW19CVlGNjY7Kgo3WVG7OwT/50M1zwLxp6olV51qB6daIh0YT70YF/juFN/qil1CXHipXjHzYYviMtwHOeZdooR7G09x/HDF0iFCpAE+zPwKR/HiD/oyYAYSjArfMAiE8GSP9vgUuX0HfrSnD2A8dnq0mHLTM7vSKMsopt2kxMWSxW58ZUBHY9IPF3/xXqycwf2KKb1EUlUEbvrMTa4ayT9pQMw63gjRJsHT+Ndhc/vySyLgJxm5WLbyYtw8W/YSWOUK1actWOwfymS2WA2RpqLaDTbuqyt5F2o4RoRqetVJp8K5iSM3RJtZcybg9uDLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkCIOYtnJKVF8Isihu3Ur7ytImEBCFJeVt5QNE8wX5I=;
 b=Lt+klhjeP8mv3FutrNt3hrsIwCu7dLvzDdpUpE0Eflyk5LtxF6czoMQGSE2XsrGzjixl7XHBoDV2unlmgZ/oqwJoWXv0JEAllh2ATwE7VA+eMxDzPFz+AH/h2gIeuukSX108FSJwviSS+JCJlv2Vn0Guxsfdyer1X7TsYKqMBMk=
Received: from MN0P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::30)
 by MN0PR12MB6199.namprd12.prod.outlook.com (2603:10b6:208:3c4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 05:16:45 +0000
Received: from BL6PEPF0001AB54.namprd02.prod.outlook.com
 (2603:10b6:208:52e:cafe::8a) by MN0P220CA0006.outlook.office365.com
 (2603:10b6:208:52e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Tue, 7
 Jul 2026 05:16:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB54.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 05:16:45 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 00:16:43 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v3 2/5] platform/x86/amd/hsmp: Map the metric table with ioremap() and unmap it explicitly
Date: Tue, 7 Jul 2026 10:46:30 +0530
Message-ID: <20260707051630.3381945-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB54:EE_|MN0PR12MB6199:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a34d92d-bc27-44b6-4e00-08dedbe6f034
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	3NhbA7grZtgVRKQ99AQex2VHNpzNOH+BATK2Bk095vPMHRJ2N1ihkQJpfa/jumprvI/uGwDwbDZ/hk1gnW9QKX/nzJKKCaBKZAEfbOUljyMzxttzvZ6RIJwJZeEyBNe+NoxZHFLOCcwK/AltPGo5HTvJspV2+3T6NC2C1urmSzMBtw6NmKg41JsK31UVsG/c+PGeo30yj8GyeuaHz4WR2kcb2c5mYuPrlJnWbpTCfmwXy7LzIyUZWe9UiEOfjL0xS8ZOCxZmg3mc3Hweh/zT2/y+cbaFoRxkOP03C2zSa9G5TiQGaisr9Dy0mTmNTJaxBee8+V0C2e6V92AezVRslVOvdJn4Wdwh3yvXNfsdDtf32XOAm48P2a9AJjU1MT7T3aO3NI6FOK+ZhJC3eYMWLcJ9tHJqyjFTfTns6BrW6HC3UUJDRH/MC5vHEXy34FYv4zigG0VUHhAsrfTK+LdV/ypDmc213UeQqcz6helth3ZKSm4Brg/FUEg2t25A8jylstTfp7snP2TdkPHGxYh8pdnz1r03HDMVXG/ULwWcO+nxEq86y9iYyVshKkp2o9Vwmg8TT2lX0vCn2UhgF15jWouI0U1kobTjxdfgM/tOLfIH1njAXVHa9cVN/POhsmMoMUbIm7741KpBkEFc0dnrZ/i6ioiBtd5ksDE7IDr66D959wcc/BfqvHpb4LiaPPgykmqFb/0O5qW9iLahXj1Erw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8aN06Oz3Vzr6JjKatdjCmJRCjjnPvhmCQmxUyaiI+pV3LrRk8/Fp7KeaoXoi6gJd2leZYz11dA/Plof7GNbiMTvDHr7JNO2JDrMCWVdR1iweY6pR80r0dOolql3ydaEcoBwIcDmUlbNA/H6qXzbHCJMvk2Y0tjcUF0oKRn8eo+25e2GzBoTMeYPVWhSw+cmmTryAujm/N/f/BU010yCsqBQl1aJEO1EvjIo9VeKl2S3U8z4ZbBFeDh4l5KW+noO+Ht2O0JdpBxhkKjyl/V2PZBjdFX/QAXxATK2t+jaVMzS1kjJBHZRqXvoYznPmmMLyzjlDZshG0Tw8Hm6WYz9CBMoWd2UZq+uwQp3CODkAtAKYupBt3uZ3+MR82k0Me1yPSD/QYVnGeKfc/Bb6iVhZMBkUbKj88APvfE7VM7XxABWJIXcTrgmd0+aN3kVifyC0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 05:16:45.1667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a34d92d-bc27-44b6-4e00-08dedbe6f034
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB54.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6199

The metric table DRAM region is mapped with devm_ioremap(), tying its
lifetime to the socket device.  The ACPI driver (a later patch) needs to
share the socket array across sockets and coordinate its own teardown, so
the mapping can no longer be pinned to a single per-socket devres scope.

Switch hsmp_get_tbl_dram_base() to plain ioremap() and add
hsmp_unmap_metric_tbls(), which drops every socket's metric_tbl_addr
mapping.  Wire it into the platform driver's probe-failure and remove
paths so the non-devm mapping is released explicitly; the socket array
itself stays devm-managed.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 22 ++++++++++++++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.h |  1 +
 drivers/platform/x86/amd/hsmp/plat.c | 14 ++++++++++++--
 3 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 1a87931136fd..ccf21f2d230d 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -12,6 +12,7 @@
 #include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/io.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
 
@@ -414,6 +415,24 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, "AMD_HSMP");
 
+void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev)
+{
+	u16 i;
+
+	if (!pdev->sock)
+		return;
+
+	for (i = 0; i < pdev->num_sockets; i++) {
+		struct hsmp_socket *s = &pdev->sock[i];
+
+		if (s->metric_tbl_addr) {
+			iounmap(s->metric_tbl_addr);
+			s->metric_tbl_addr = NULL;
+		}
+	}
+}
+EXPORT_SYMBOL_NS_GPL(hsmp_unmap_metric_tbls, "AMD_HSMP");
+
 int hsmp_get_tbl_dram_base(u16 sock_ind)
 {
 	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
@@ -438,8 +457,7 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
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
index 0509a442eaae..98c82a4c0cc3 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -64,6 +64,7 @@ void hsmp_misc_deregister(void);
 int hsmp_misc_register(struct device *dev);
 int hsmp_get_tbl_dram_base(u16 sock_ind);
 ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
+void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev);
 struct hsmp_plat_device *get_hsmp_pdev(void);
 #if IS_ENABLED(CONFIG_HWMON)
 int hsmp_create_sensor(struct device *dev, u16 sock_ind);
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index e07f68575055..e0a99e8f2be8 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -214,22 +214,32 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 	ret = init_platform_device(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
-		return ret;
+		goto err_unmap;
 	}
 
 	ret = hsmp_misc_register(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register misc device\n");
-		return ret;
+		goto err_unmap;
 	}
 
 	dev_dbg(&pdev->dev, "AMD HSMP is probed successfully\n");
 	return 0;
+
+err_unmap:
+	/*
+	 * init_platform_device() may have ioremap()ed metric tables before
+	 * failing.  They are no longer devm-managed, so drop them explicitly;
+	 * the socket array itself is devm-managed.
+	 */
+	hsmp_unmap_metric_tbls(hsmp_pdev);
+	return ret;
 }
 
 static void hsmp_pltdrv_remove(struct platform_device *pdev)
 {
 	hsmp_misc_deregister();
+	hsmp_unmap_metric_tbls(hsmp_pdev);
 }
 
 static struct platform_driver amd_hsmp_driver = {
-- 
2.34.1

