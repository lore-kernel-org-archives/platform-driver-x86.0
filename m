Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012048.outbound.protection.outlook.com [40.107.200.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488163A16AB;
	Wed,  8 Jul 2026 04:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783484684; cv=fail; b=ofYaUpyqmojfDa9f64zix+fUHM5rY4s+UepH4lTZgSy7/6RUwtVVDJd6Osfft6/naQJC7NX2lc0ugDphpdSz3ufZXQNjpLJuANgW1X9y7bPvdBwjlAabcs8fdm/h99+SmVZDy2dO9nDDhMUiwwJ5lSpmMqogMqcNFALWwUH2P+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783484684; c=relaxed/simple;
	bh=si97/NKqYYoIrxoz3QaiYNREHGPd4C4GDB5nGk1iKU4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=glIQ9VGe5MDMuaH0z1QLmRd2gtHbGkGfKYDRtvRvSwtHbFasQ3PGmgQsx9iTKTquJK8oXzhzxQxLHONmXSnbkaL45CBKV1aa7fCddxRNJaZHUOOUTu410tPoKsWXCf/atpXbexLv4eXKKvRCODJJnkVYbKUgpZcMRG7aiL8o6oU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FVzkMDn5; arc=fail smtp.client-ip=40.107.200.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FVzkMDn5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H9w82aLnmv5kbqhKRkp/gMuKQlieall594wk016HgwNqqAFifz341w0829RCnuw1IDiGakgtoMKRCCDGQxoZdEhFZS2zQUKbBVQCi8iSw+DBLzEwW5dU/YFBYVVKP57T2KTyQUZkkMftwLUEGj04JOifc4xl+8oyuF0Wp9AnPXHaceRl+s8tfa5PEJPxHBIuq05OWaO6IcTJnOr8asxcGUnMUxCQMLPZbjA903MLDmqvYtDWuig7WgmeW3TwoPkFbGeml7IHmxsTm1SuzymDhBPCQ7bdfqJCOOcfqmw+yo835RCYF94QeCMLtG3d1N4e5mN0Oyy6j0Uxm2Ogcqusnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXBO7P5/T78bzMb9PL/N4LZ+yz8wzcJfEt9WHs7zYb8=;
 b=MZ8gRaY977IDOEm9bt4Lc9d8WXHgbHfi8mUxelpQZpVjaVg/CJPTHg1bzA5NkQqjC+0qpl9Y2AsEaNuP/R4wVDgmwMvF7NbNwD+Q9RS2t2ICsKoUAhHrj5H17V/utjgsT8y3h+fyJ6twmZger1BGWCPOOA/twUvmDFRfIy7ein/v+modsqt9fXT2khnVMHcGgmn/ajengvUuSJtPMDgSUXaH6zJGFBd3OI11k9lqOyuSw0fVXdvnYWfgNKQc8PmysHWmXIx6+rT1ASnWubJkSGTRS6QhfVGXAjCOJ1LMCkxLhTPjJyIutXDeCMMWzY64XTDFrqOityFRLWR1LpLndg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXBO7P5/T78bzMb9PL/N4LZ+yz8wzcJfEt9WHs7zYb8=;
 b=FVzkMDn5jKeEaIOIjePDcWf9OQ38Mi6KpJbMU9neVnM9plc5eP2WLFJth2PMsLIheHDNdniVbCX9zHga2Y3ZFtnhTpoUzSmMigK+7wYm9I3d21ic42NgbwpwTAEZZasLFjSggrAWqeUU/019S0peeaXnW//vfr1vilfTQlGg5HM=
Received: from CH5P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::18)
 by IA0PPFAF4999BF6.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Wed, 8 Jul
 2026 04:24:37 +0000
Received: from DM2PEPF00003FC2.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::85) by CH5P222CA0022.outlook.office365.com
 (2603:10b6:610:1ee::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 04:24:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC2.mail.protection.outlook.com (10.167.23.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 04:24:33 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 23:24:31 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v4 2/6] platform/x86/amd/hsmp: Map the metric table with ioremap() and unmap it explicitly
Date: Wed, 8 Jul 2026 09:54:01 +0530
Message-ID: <20260708042405.3758294-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708042405.3758294-1-muralidhara.mk@amd.com>
References: <20260708042405.3758294-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC2:EE_|IA0PPFAF4999BF6:EE_
X-MS-Office365-Filtering-Correlation-Id: ee71401b-1330-49a0-d115-08dedca8cfd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	XJgaLsXI8UmW3/oVQDNjJC8ehNGwml0PkHdjvU6x6HiRw+YZ2bCrCcfl25C4aGBjlvo8B1jEeFnNKj2rRau/+QSDbuoeDe3AF7H/msIdEu3bHGclw/Wp1PmMPv9zV9RsnQaxhJJhkYLcvicJNCmxKjLKhoM8aRGHOpORqCKyAv/0k56BLxzA5r9IAWMyu1vkXSwAeI0O+PC+kTCikYNTaF1pKFD+uGHGeFytiz6SC/aa788QTqROgS7FQrv4O8sXKDBAakARhgYsIjRCdNygHzDyQp2krSB6Q/TfOrEKvFpnnn4I+G1/RQsXcRQ6rhxJTC/6y+IAkgOafMy6AqUy/nMXNKq+zGvpX+cPwv96QNvk6VKrkbU6j6KTWWbjogcdKYgDgzGWKnRtLBKyUa833T9Y3Fx0Uv2zW9lUq2vQkjSVwBN2E3zuWhU8wRHNK8UFGy5ytpg4oIw5uhSRy2gogfs6qpqqnMdOwsqKMvuZA8S6zdk7Sajln4NqaDiyqzliSBtIkyaytRA0r7glhTtUgPAna1+83rwD1Emz1o3Qwfq07WHxzVtgoXwGnl0VMKo/IMojl53LEFHm52hVEppzIP/q+u99TabZM399ZNqMObgZcnkHRQguOoALwDFiiCSPO2OrQJiPhhz9wNjowFnIPqrlu6fZKdXsbC6s/VEGjFVXzvQ52HYOiLoWp5mMqy3WlwLmMzLzw6UsIy3H1Wb2aw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V5FYsLsOV5V/FnX009fncHflF1plUPcwLzVWdH9WRqCZGfmD/FLASqKaew1Ns+1DLmnMV3sBo7PbN7UtmUaXOJJRzQadunhPvU2qTCrI2SpvW/M4v5eWW5m6PTdoN6oKvlOSNvwLTt58M0EwVFuG3W5jxWDZy02bgakhyVXhJXFtwSPZsHKbcTVP2IvXmmpEPbGQJk6zioavapYxhc1cbaHhx/U6sPxvLHprFNzw3H7XG4Xv5IOqzMTc21fAE2AaksIisV0wm5Uwf6vVIxDxkhK+6lAHt1jKjAcr6A3MNnmnMiBy7lLm9lgXAPn0Xy4ZSAtbOaPyuSqn08iSvKAt6/n+tEYXYp5D1Z3gAPwmwPT2XuRIQWEw+rnxXggFwb+dpsQTLDEi2BZ7eB665a3XvRRdV+KbcEoMFgQhMunJY//Fw3D3xdPOhy+sL/gmoan/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 04:24:33.2152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee71401b-1330-49a0-d115-08dedca8cfd4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFAF4999BF6

The metric table DRAM region is mapped with devm_ioremap(), tying its
lifetime to the socket device. An upcoming change lets the ACPI front-end
share the socket array across sockets and coordinate its own teardown, so
the mapping can no longer be pinned to a single per-socket devres scope.

Switch hsmp_get_tbl_dram_base() to plain ioremap() and add
hsmp_unmap_metric_tbls(), which drops every socket's metric_tbl_addr
mapping. On the platform driver register it with devm_add_action_or_reset()
so the mapping is released on both remove and probe failure; the socket
array itself stays devm-managed.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 19 +++++++++++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.h |  1 +
 drivers/platform/x86/amd/hsmp/plat.c | 14 ++++++++++++++
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 1a87931136fd..4586d86f72a3 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -12,6 +12,7 @@
 #include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/io.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
 
@@ -414,6 +415,21 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, "AMD_HSMP");
 
+void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev)
+{
+	u16 i;
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
@@ -438,8 +454,7 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
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
index e07f68575055..e7ee6e701e5a 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -201,6 +201,16 @@ static int init_platform_device(struct device *dev)
 	return 0;
 }
 
+/*
+ * The metric tables are mapped with ioremap() rather than devm, so release
+ * them explicitly. Registered as a devres action so it also runs on a probe
+ * failure after init_platform_device() has mapped some of them.
+ */
+static void hsmp_pltdrv_release(void *data)
+{
+	hsmp_unmap_metric_tbls(hsmp_pdev);
+}
+
 static int hsmp_pltdrv_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -211,6 +221,10 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
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

