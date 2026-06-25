Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012068.outbound.protection.outlook.com [52.101.53.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BD63E3155;
	Thu, 25 Jun 2026 12:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782390852; cv=fail; b=fxQLPMSeJa1WQvu0cZVKzIrXgkpSTQ+7VdWO0y+VD+wl7nxJxSzLFbKP9FFjjNwHWsNdXaeHRWGssAux3tZbMji4eYC0hq/om6TwyYiCd1q+fikSBI/DsqoQ+yvvuz01mcuDBHSHf8RAcZlZh64CTZBx3GQ+3+J7BJn2dOmG/UI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782390852; c=relaxed/simple;
	bh=B1WosxVD4MRjlxixiH5uAuEhdqyVjj3uYoIlbEF3MTQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VFG8YTLAAiK4V2uWYvLGBtMKQhlRK/Bu9/lVUG2l7pAgsUtSu0ToUseiQNrA7fG/BQkz+MfIaMRbsqU7+9iDAT8TkyL6n434jq1tSPEqkQzmZrPwpdy0NSGiR8YCWEnkRg1Te/JWZrwtvBN7XkU1VStKRjw17g0vtqnkqCIPfHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=M6xf9liC; arc=fail smtp.client-ip=52.101.53.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="M6xf9liC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnYI2BKVVgQugxaoTWxIrS0fpZva3r+RItG1LbBK3SsmthftHENMJm6QypytLXQILZ2g8x2RI1QDBTSEOsk0gzUirjQQfrUjmhxa5co7739bCLG2o2O9whSQd+n1jxycOK6zDRB8Jb9PhKZ/KL2qp3XV2hptu5+sxV1GGdkRtoXOj7T0Oc6V1tNDhD2QWQahnDp89zK0OXFyEmXgDgXDtm+kbxhUmgKCJXNQ7ElXtTSQcaIr146sIyG1pxkJYtMqeadaTOGruAhJYph6U9a3jctBqAHrKpCKbR74+NOsHGoS00QCLjGaDqoEtlta0OjRIWBbqC4RNIgKQhLZLz6Gvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LGdKGYMV2UOx/mj/PsL2A8ARHfiW4JyO98geY57/Ao=;
 b=azzZcpTpgQNPb1tdjnItLEimW538TUTwEsY+v9oH4jDxFWu2mjYW8n/ISCszXYhURCNMorfxAwPNj4he+qLS3IqOpnlp9LVH1xTn5HbAKSSoOe9dksdUWtjoo13F/82Z4OvmQUVYoauA2BSafrl+oFh6BEu96V/ZSWzc9vyxKbzxuZEPEeVVsMCKjuBIQYFZXduvKgw/Wbulz6Bf4RAMmkW6iftkTPYqAnaFKGAn8luVS1Z1xH4C4wLU0LpgGXeNTj5v5P2waVk+7J0ZSVJmMU57DOFMxJeuo6DSsaOvaTAFmNeY9GlFC3BvGAy1HYDmvUghbM6zL0S9SWciEGXswQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LGdKGYMV2UOx/mj/PsL2A8ARHfiW4JyO98geY57/Ao=;
 b=M6xf9liC8wH4XkQifleazZvxscI+TZY1xrPOtupyBE2r1GhIcDdy7sb20n6xQGnjfe/5y752HsgMIW3W2PRymP3aZIUziaWH7c2qjmB+hY7wKr2hQ3vohYCUzm4/31qqfKd+yOsg0qN+E64EhMTi8zqgLnQKXzmZ4jE94kHIskY=
Received: from CH2PR17CA0006.namprd17.prod.outlook.com (2603:10b6:610:53::16)
 by MN2PR12MB4144.namprd12.prod.outlook.com (2603:10b6:208:15f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 12:34:02 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::1d) by CH2PR17CA0006.outlook.office365.com
 (2603:10b6:610:53::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 12:34:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 12:34:02 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 25 Jun
 2026 07:34:00 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <muthusamy.ramalingam@amd.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v2 1/7] platform/x86/amd/hsmp: Serialize ACPI HSMP is_probed with a probe mutex
Date: Thu, 25 Jun 2026 18:03:31 +0530
Message-ID: <20260625123337.886435-2-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625123337.886435-1-muralidhara.mk@amd.com>
References: <20260625123337.886435-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|MN2PR12MB4144:EE_
X-MS-Office365-Filtering-Correlation-Id: 5066757d-55fa-4e77-dd82-08ded2b609e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	5UXrCWympqT2PDb6UkCsQmlC81X5ftUQsjpXxl2MAgNhw1cbuCPK2U9at8vCiQb0QUxZfg+VUX4T9GcfFu1JVoHNRvvPUdWp78Rpgzlq3lxMKFTYmeJh2qmMHPSNje3vAQd+lDJs87xfoYT9l2gdq7Rq+8qWguL+o8+7BNFIcSffS41EM13zsDnpdg9Px8F3QyhI95nRmWo7Kh5enSk784uCcaKfKShAitnldwlaTxSodK9AjTBww8G0KtYd+95ibnmu1eiaOnHg8R6uEo5DZoBOD0pOW57ozNSPpRoidKNBxRv2hiDN+IZTezfpsXV03NZFxXD3/psIIGhkDYQjPEr0pUW6bUaMndCZN0n3sPoJfNUi948TnuVuh17vne3igNDHsBWGqdbysoRYlZKfiowocOSQEc1LSEQiaZB76dHKk7kiYKAwD2CSBi1VlJ5T6LcatJg0sWbiJQsHdNcc1V8rn0203LAG8sUJjd+UJUUbjpkqIB9njyDLE8ySQv/K6QlOZeIHqz5U3VfPwemX01JJ7JYVnq/Q6+GhduxHXR0KPzm5zmi0T5qhE1g9z06DrkVJwy7MODrQKad9E9fs8JQZTns4tX1WVkt35Z3avXQzaqFcRszz4hTpvxr7/adXVmZUfk8uilpcy6Yu7+UATAIyiEMMArF4GuuKUkp0aCGiYF826IXFr0TkvLZbWDUsMic/LIQPIJqCM5wLzlBpIQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8t945X/BJTrW4ljPVUckigx+W4x2uKPvfQnozvhyQwC82vOb++krdxnm0fPb46lRLDLjuKxl5Tqj71aeVzm4IiS1+1CrM+7pLtR0vldzWHfkVs7QrVnc9laVYuWLk7O8XdUswJe0ZoxIz/FBaQZ8bdrKrbvAlPj/J6htWrSOc/l3aUjSUjHB9ysrx/OwsB7TtuF/NQv7ahoBxdzWPZyftGMZlNtsKGQXrb9AWEzQEtHvBAJQmHmtrYQwwUPRgDnCkUiNVBiW5WABMNj7anl3kJq3oUtEN0RYcfjEBoBEqGOd01ccfjgKc9fsI6YeqEKQzBo6C545p5B754AGRxzvTzdOn90QMaSiiK01PHQ8JyhImkicI82sd7W+Fz4O8STOGwucBWMvAzKo5E1OfhyPDeYLV5DSybZMd0xW5hfiZ/qzBh7QgiImQCXyo0P0Rniu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 12:34:02.4706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5066757d-55fa-4e77-dd82-08ded2b609e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4144

Add hsmp_acpi_probe_mutex and hold it across ACPI probe, remove, and
init_acpi() so concurrent platform probes cannot race the global is_probed
handshake or the one-time socket allocation.  Use lockdep_assert_held() in
init_acpi() to catch incorrect locking under lockdep.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 15 +++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c |  9 +++++++++
 2 files changed, 24 insertions(+)

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
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 6a26937fc2b5..91be0cdb6af1 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -223,6 +223,15 @@ int hsmp_send_message(struct hsmp_message *msg)
 	sock_ind = array_index_nospec(msg->sock_ind, hsmp_pdev.num_sockets);
 	sock = &hsmp_pdev.sock[sock_ind];
 
+	/*
+	 * A slot exists for every possible socket, but its state (including
+	 * hsmp_sem) is only initialized once that socket has actually been
+	 * probed.  Reject messages aimed at a socket that was never brought
+	 * up so we never operate on a zero-initialized semaphore.
+	 */
+	if (!sock->dev)
+		return -ENODEV;
+
 	ret = down_interruptible(&sock->hsmp_sem);
 	if (ret < 0)
 		return ret;
-- 
2.43.0

