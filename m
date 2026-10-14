Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010044.outbound.protection.outlook.com [52.101.46.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09144D7948
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976521; cv=fail; b=I+PkcZQ7gaxiwahm9nsYDpfPu1prvt7dr3kzyzLcY5QZF9yjRvaQk+O2EzOabYcj7OocDxM03Dnb6G6wzzXbUlt2r5QaQiO9xeHAwFqY9IdRn9XTdZgGetVdybAjHsrG6LfV0glXTrAgGjE4/RoJVMdbnnrgAVGJKiwDiRNtAWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976521; c=relaxed/simple;
	bh=mzlIeI++8ZKQWjUiG+PEUJqN5vRURXDAeBTgkoH+u60=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JJwPpWp6yy0ojJTKxeMx6kABBCz568gvzen7qHmrppKi4CFz1QJt5mpNe2JcVhwOHGUh4QLZAAAXwUWyDNi1csuCx/Swv7nWdhrNm0S/u9wpsqYxklrZzpJHFHV2PiA1nHh1g1Pzs1BoVqyJ4Pjw380XPsL7GqX6rPoQIUsnkoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GHiqrxae; arc=fail smtp.client-ip=52.101.46.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GHiqrxae"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgt4Hnia8AjjEjgzrf43Y1vT7cLl33oDtlfY0KUbBvu8fSXfXyighMIeqrGRl573wxTcBD4VZjiDQWiJTH9bNYV9hEsG6rx2gCcvGEB7/Iw69HwU4i9pyNXMfbyfuY16Gvnh+dBEfwtY3ZhI7SZQ0dLvnIqW52N2h6lZ80Po7tqu6KUy4Y6l/NAhsIKYd0dT1FEkNJwLvbf7b8B3jfZirC7eV257oVOiL15RbmWOOhTbvImady4Xh4ksIBhuQx/rBByv6oEAoLLY08xnwOcZgJEimt6fAxibHuHhPB9RX6MTPJ03VQ2MaD39KppNxCoole29RTXksYTaz+ypYqNQvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaw2aY/gahaldEORN8OO37jckmwGG5eLHd2PmVkOWyk=;
 b=TgJ1XMtFS8mkS9CWmg52immLxaiVQfw/o1ux9EZp3ruaEKfK2IcCuKmoAgmfgQ9ui1gZvPuLBF3Fejin+lJePFgaJHbvKPatNpNpfX5PplgMPdstWztl1gzU3TlB8+JuffcrB/gU3TXi0+bxbYPWHgjGGYr//zH/DPrnA2hWRi6xJ7AQjCuLGl5nwA4KL0HUZanx7SzMC2635XEA/8YdaJacBmDEZy8c+LmPXxgHvO5vrQDVfuPaQiCwotgQLjAQ0JLmlEAcv7BjiA4Vr20kILNfxSeBmAsdRtkGALK0mgVGyCzeBZUuuVq/FUJ7GJlNx0U4E5F5d2/RkD5/iMSYiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaw2aY/gahaldEORN8OO37jckmwGG5eLHd2PmVkOWyk=;
 b=GHiqrxaeTXCdZGj2GBIHB6nRKg72NzpTyDDIqVSwswb+hCuam3PMoimcIwHP2hyDBTTIfP4EONHAznfBk9M+sLHBjMQK851GbzAcaxMjlVGAyN5v3Vs/6ia9ZsG4fHr4UMrmuUVPC16aiIti8zZE4UuNk2gsMB8YGxo/3Ripjk0=
Received: from PH3PEPF000040A9.namprd05.prod.outlook.com (2603:10b6:518:1::4b)
 by DS0PR12MB7996.namprd12.prod.outlook.com (2603:10b6:8:14f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 11:15:16 +0000
Received: from CY7PEPF000000F0.namprd05.prod.outlook.com
 (2a01:111:f403:f912::1) by PH3PEPF000040A9.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 11:15:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY7PEPF000000F0.mail.protection.outlook.com (10.167.247.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 11:15:15 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 06:15:01 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <muthusamy.ramalingam@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Suma Hegde <Suma.Hegde@amd.com>,
	"Muthusamy Ramalingam" <Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 6/8] platform/x86/amd/hsmp: Add per-CPU sysfs attributes for ACPI and platform
Date: Wed, 14 Oct 2026 11:14:28 +0000
Message-ID: <20261014111430.23156-7-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261014111430.23156-1-suma.hegde@amd.com>
References: <20261014111430.23156-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F0:EE_|DS0PR12MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: 93bc7aed-766e-4c35-72f2-08df29e46c75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|6133799003|22082099003|10067099003|18002099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	doDhsqEODGVdvgg/KmidwAoQZlCzBkQLEsCNzD4QM5lNYRpeoi9bVzZUqWtYCYSe0brI2pSA9HvDHkALOzHdVkxdN8pFDQ835ImcRQSkXpZCifyOa8H/eNCpxiMDoNQut2HWhzZpqAf9Czr1pcxjg1IzmrEaMfG7gaToQSokbpfWzr0vOiPQi19kESUDxtSvcNMtyqpSGK3RgFL9ab+T+uM14bmCPgbztmdts84YHHf8VHNZtFHu3C8sD9bzvX/60l/+2mWg0Vq4XiiSOOwGwDdUDA1U5HW+Wh4SEzmi4uLIAB28KPRUmRQKeNAwcKyhtztXTF5qt0TyB4SGzpKAezvw4O9cp/pcaKXbkrJ080ybew95Tcn1MM5fg034q0O31ZVgOScK/EHI5Oo4fr0DPRTkBXeXZImN2cMVzZYsAvBsmBf4u9oP0zCFOY3rGe+LTmAnZjbEzkyr5vucxo574fUp283GhLOMXS5o8SPJMsy0DXyEEy/CYm42S/4zfTGdopUAm4q9bGO4oWmGh0lVcldHQqfS988xFI6/OTVZci8xJML8cw+lsRYq6sUorq7a92kfr3bGEuYEiNGMI+ayqSjETwnFF21aZe7vKJ4v3VbWy+jMdaq3sjal0ZhzvjqnohljbCe8S3LtIJgK+EjvgNJtVG80vSZEwqppLG4SnT7TEXIxdlrmRgT+NL/OI22dDsgbbvDOzBm6OhYTKXbZBg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(6133799003)(22082099003)(10067099003)(18002099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mnaP+a4vU/i7A7mvL5DKq7cmfuJJIcTwhWgahknzyXb4qHCI832jaFJO+Af06VsF+p2iGY05gFbIPc4QfhiExpmrJIJeF56WO5DD+fmG0m1/aHsCVybro6QEPQGDjeDfDcEUnPguoBhjnrBu6cMqmRxfwwCPvKbGsJ21A3rHgJ71hV9Chhw7HKALvq2ogMLJmV4DzIJNrt7tpzhgAW3R2gEb0CjnekIe52SBVg7sOs9VTMB8ETCo/uD1qKT1zl5FcKmRleu3rZaU7Vrf5nhNFK8A1moVr0Tr7D05kh3ry2Yy7+VPLNeNcGqPDfsj1vsuwzOMz4xBLjwk6nT8MD9SmNMgm+e7uIu1gLwxAex4Bc5/aal22zW49qc/h+ZTuHT+elLdAFDHclYrQW4cQRd9dTPSI8kLeoqf296HenGARIRhgkchEYVEJN9niZS3AGd0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 11:15:15.7934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93bc7aed-766e-4c35-72f2-08df29e46c75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7996

From: Suma Hegde <Suma.Hegde@amd.com>

Expose per-CPU boost_limit under /sys/devices/platform/amd_hsmp/cpu/cpuX/
from both the ACPI and platform drivers so userspace does not depend on
which driver probed.

Create a cpu/ kobject hierarchy with per-CPU entries that map to
HSMP_GET_BOOST_LIMIT / HSMP_SET_BOOST_LIMIT. Keep the shared
boost_limit handlers, cpu_kobj_info tracking, and create/remove helpers
in sysfs.c; each driver still owns the parent cpu/ kobject lifetime.

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |   9 ++
 drivers/platform/x86/amd/hsmp/acpi.c  |  17 +++
 drivers/platform/x86/amd/hsmp/plat.c  |  44 ++++++
 drivers/platform/x86/amd/hsmp/sysfs.c | 185 ++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/sysfs.h |   7 +
 5 files changed, 262 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 3c3f02157edc3..836a6dc8e9502 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -110,6 +110,15 @@ device based driver.
 * pwr_current_active_freq_limit_source: Source of current active frequency
   limit.
 
+3. Per-CPU sysfs files
+
+Per-CPU attributes are available under
+/sys/devices/platform/amd_hsmp/cpu/cpuX/ for both the ACPI and platform
+drivers.
+
+* boost_limit: Get/set the per-CPU boost limit in MHz (HSMP_GET_BOOST_LIMIT /
+  HSMP_SET_BOOST_LIMIT). Writable range is 100-10000 MHz.
+
 ACPI device object format
 =========================
 The ACPI object format expected from the amd_hsmp driver
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index f8afc50461a65..8c3527540f8bc 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -47,6 +47,7 @@ static struct hsmp_plat_device *hsmp_pdev;
 
 static struct kobject *amd_hsmp_kobj;
 static struct kobject *hsmp_sock_kobj;
+static struct kobject *hsmp_cpu_kobj;
 
 /*
  * Tracks the ACPI socket platform devices that share the socket array and the
@@ -464,6 +465,8 @@ static int init_acpi(struct device *dev)
 				 "Failed to create symlink for %s\n", sock->name);
 	}
 
+	hsmp_create_per_cpu_kobjects(dev, hsmp_cpu_kobj, sock);
+
 	dev_set_drvdata(dev, sock);
 
 	return 0;
@@ -482,6 +485,10 @@ static void hsmp_create_sysfs_kobjects(struct device *dev)
 	hsmp_sock_kobj = kobject_create_and_add("socket", amd_hsmp_kobj);
 	if (!hsmp_sock_kobj)
 		dev_warn(dev, "Failed to create socket kobject\n");
+
+	hsmp_cpu_kobj = kobject_create_and_add("cpu", amd_hsmp_kobj);
+	if (!hsmp_cpu_kobj)
+		dev_warn(dev, "Failed to create cpu kobject\n");
 }
 
 static const struct bin_attribute  hsmp_metric_tbl_attr = {
@@ -578,6 +585,11 @@ static void hsmp_acpi_sock_release(struct kref *kref)
 		kobject_put(hsmp_sock_kobj);
 		hsmp_sock_kobj = NULL;
 	}
+	if (hsmp_cpu_kobj) {
+		kobject_del(hsmp_cpu_kobj);
+		kobject_put(hsmp_cpu_kobj);
+		hsmp_cpu_kobj = NULL;
+	}
 	if (amd_hsmp_kobj) {
 		kobject_del(amd_hsmp_kobj);
 		kobject_put(amd_hsmp_kobj);
@@ -618,6 +630,9 @@ static void hsmp_acpi_probe_failure_cleanup(struct device *dev)
 		/* Remove per-socket symlink from amd_hsmp/socket/ */
 		if (hsmp_sock_kobj)
 			sysfs_remove_link(hsmp_sock_kobj, sock->name);
+
+		hsmp_remove_per_cpu_kobjects(sock);
+		dev_set_drvdata(dev, NULL);
 	}
 
 	kref_put(&hsmp_acpi_sock_kref, hsmp_acpi_sock_release);
@@ -717,6 +732,8 @@ static void hsmp_acpi_remove(struct platform_device *pdev)
 	if (sock && hsmp_sock_kobj)
 		sysfs_remove_link(hsmp_sock_kobj, sock->name);
 
+	hsmp_remove_per_cpu_kobjects(sock);
+
 	kref_put(&hsmp_acpi_sock_kref, hsmp_acpi_sock_release);
 }
 
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 83f6b86896117..2ac934d59ae64 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -46,6 +46,8 @@ static struct hsmp_plat_device *hsmp_pdev;
 
 /* Parent for per-socket attribute groups: amd_hsmp/socket/socketN/ */
 static struct kobject *hsmp_sock_kobj;
+/* Parent for per-CPU attributes: amd_hsmp/cpu/cpuX/ */
+static struct kobject *hsmp_cpu_kobj;
 
 static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
 			     u32 *value, bool write)
@@ -469,6 +471,42 @@ static int init_platform_device(struct device *dev)
  * a devres action so it runs on both remove and probe failure.
  */
 
+static void hsmp_destroy_cpu_sysfs(void)
+{
+	int i;
+
+	if (!hsmp_pdev || !hsmp_pdev->sock)
+		goto put_parent;
+
+	for (i = 0; i < hsmp_pdev->num_sockets; i++)
+		hsmp_remove_per_cpu_kobjects(&hsmp_pdev->sock[i]);
+
+put_parent:
+	if (!hsmp_cpu_kobj)
+		return;
+
+	kobject_del(hsmp_cpu_kobj);
+	kobject_put(hsmp_cpu_kobj);
+	hsmp_cpu_kobj = NULL;
+}
+
+static int hsmp_create_cpu_sysfs(struct device *dev)
+{
+	int i;
+
+	hsmp_cpu_kobj = kobject_create_and_add("cpu", &dev->kobj);
+	if (!hsmp_cpu_kobj) {
+		dev_err(dev, "Failed to create cpu kobject\n");
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < hsmp_pdev->num_sockets; i++)
+		hsmp_create_per_cpu_kobjects(dev, hsmp_cpu_kobj,
+					     &hsmp_pdev->sock[i]);
+
+	return 0;
+}
+
 static int hsmp_create_socket_sysfs(struct device *dev)
 {
 	int ret;
@@ -504,6 +542,7 @@ static void hsmp_destroy_socket_sysfs(void)
 static void hsmp_pltdrv_release(void *data)
 {
 	guard(rwsem_write)(&hsmp_sock_rwsem);
+	hsmp_destroy_cpu_sysfs();
 	hsmp_destroy_socket_sysfs();
 	hsmp_unmap_metric_tbls(hsmp_pdev);
 	hsmp_destroy_metric_read_locks(hsmp_pdev);
@@ -545,6 +584,10 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = hsmp_create_cpu_sysfs(&pdev->dev);
+	if (ret)
+		return ret;
+
 	ret = hsmp_misc_register(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register misc device\n");
@@ -557,6 +600,7 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 
 static void hsmp_pltdrv_remove(struct platform_device *pdev)
 {
+	hsmp_destroy_cpu_sysfs();
 	hsmp_destroy_socket_sysfs();
 	hsmp_misc_deregister();
 }
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index 8d802b51b728b..871ff1638340f 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -10,12 +10,24 @@
 #include <linux/array_size.h>
 #include <linux/bitfield.h>
 #include <linux/device.h>
+#include <linux/kstrtox.h>
 #include <linux/limits.h>
+#include <linux/smp.h>
 #include <linux/sysfs.h>
+#include <linux/topology.h>
 
 #include "hsmp.h"
 #include "sysfs.h"
 
+struct hsmp_cpu_info {
+	struct kobject *kobj;
+	unsigned int cpu_id;
+	u16 socket_id;
+	u32 apic_id;
+};
+
+static struct hsmp_cpu_info cpu_kobj_info[NR_CPUS];
+
 static const char * const freqlimit_srcnames[] = {
 	"cHTC-Active",
 	"PROCHOT",
@@ -209,3 +221,176 @@ ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute
 
 	return len;
 }
+
+static ssize_t boost_limit_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct hsmp_cpu_info *cpu_info = NULL;
+	struct hsmp_message msg = { 0 };
+	unsigned int cpu;
+	int ret;
+
+	for_each_possible_cpu(cpu) {
+		if (cpu_kobj_info[cpu].kobj == kobj) {
+			cpu_info = &cpu_kobj_info[cpu];
+			break;
+		}
+	}
+
+	if (!cpu_info)
+		return -EINVAL;
+
+	/* Get per-CPU boost limit using HSMP_GET_BOOST_LIMIT */
+	msg.msg_id = HSMP_GET_BOOST_LIMIT;
+	msg.sock_ind = cpu_info->socket_id;
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = cpu_info->apic_id;
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", msg.args[0]);
+}
+
+static ssize_t boost_limit_store(struct kobject *kobj, struct kobj_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct hsmp_cpu_info *cpu_info = NULL;
+	struct hsmp_message msg = { 0 };
+	unsigned long val;
+	unsigned int cpu;
+	int ret;
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	if (val < 100 || val > 10000)
+		return -EINVAL;
+
+	for_each_possible_cpu(cpu) {
+		if (cpu_kobj_info[cpu].kobj == kobj) {
+			cpu_info = &cpu_kobj_info[cpu];
+			break;
+		}
+	}
+
+	if (!cpu_info)
+		return -EINVAL;
+
+	/* Set per-CPU boost limit: apic_id[31:16] | MHz[15:0] */
+	msg.msg_id = HSMP_SET_BOOST_LIMIT;
+	msg.sock_ind = cpu_info->socket_id;
+	msg.num_args = 1;
+	msg.response_sz = 0;
+	msg.args[0] = (cpu_info->apic_id << 16) | ((u32)val & 0xFFFF);
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static umode_t cpu_kobj_is_visible(struct kobject *kobj, struct attribute *attr, int idx)
+{
+	struct hsmp_cpu_info *cpu_info = NULL;
+	unsigned int cpu;
+
+	for_each_possible_cpu(cpu) {
+		if (cpu_kobj_info[cpu].kobj == kobj) {
+			cpu_info = &cpu_kobj_info[cpu];
+			break;
+		}
+	}
+
+	return cpu_info ? attr->mode : 0;
+}
+
+static struct kobj_attribute boost_limit_kattr =
+	__ATTR(boost_limit, 0644, boost_limit_show, boost_limit_store);
+
+static struct attribute *cpu_kobj_attrs[] = {
+	&boost_limit_kattr.attr,
+	NULL,
+};
+
+static struct attribute_group cpu_kobj_attr_grp = {
+	.attrs = cpu_kobj_attrs,
+	.is_visible = cpu_kobj_is_visible,
+};
+
+static const struct attribute_group *cpu_kobj_groups[] = {
+	&cpu_kobj_attr_grp,
+	NULL,
+};
+
+void hsmp_remove_per_cpu_kobjects(struct hsmp_socket *sock)
+{
+	unsigned int cpu;
+
+	if (!sock)
+		return;
+
+	for_each_possible_cpu(cpu) {
+		if (topology_logical_package_id(cpu) != sock->sock_ind)
+			continue;
+
+		if (cpu_kobj_info[cpu].kobj) {
+			sysfs_remove_groups(cpu_kobj_info[cpu].kobj, cpu_kobj_groups);
+			kobject_del(cpu_kobj_info[cpu].kobj);
+			kobject_put(cpu_kobj_info[cpu].kobj);
+			cpu_kobj_info[cpu].kobj = NULL;
+			cpu_kobj_info[cpu].cpu_id = 0;
+			cpu_kobj_info[cpu].socket_id = 0;
+			cpu_kobj_info[cpu].apic_id = 0;
+		}
+	}
+}
+
+void hsmp_create_per_cpu_kobjects(struct device *dev, struct kobject *cpu_parent,
+				  struct hsmp_socket *sock)
+{
+	struct kobject *cpu_kobj;
+	char cpu_name[16];
+	unsigned int cpu;
+	int ret;
+
+	if (!cpu_parent || !sock)
+		return;
+
+	for_each_possible_cpu(cpu) {
+		if (topology_logical_package_id(cpu) != sock->sock_ind)
+			continue;
+
+		snprintf(cpu_name, sizeof(cpu_name), "cpu%u", cpu);
+
+		cpu_kobj = cpu_kobj_info[cpu].kobj;
+		if (!cpu_kobj) {
+			cpu_kobj = kobject_create_and_add(cpu_name, cpu_parent);
+			if (cpu_kobj) {
+				cpu_kobj_info[cpu].kobj = cpu_kobj;
+				cpu_kobj_info[cpu].cpu_id = cpu;
+				cpu_kobj_info[cpu].socket_id = sock->sock_ind;
+				cpu_kobj_info[cpu].apic_id = per_cpu(x86_cpu_to_apicid, cpu);
+			} else {
+				dev_warn(dev, "Failed to create cpu%u kobject\n", cpu);
+			}
+		}
+
+		if (!cpu_kobj)
+			continue;
+
+		ret = sysfs_create_groups(cpu_kobj, cpu_kobj_groups);
+		if (ret) {
+			dev_warn(dev, "Failed to create cpu%u attribute groups\n", cpu);
+			if (cpu_kobj_info[cpu].kobj == cpu_kobj) {
+				cpu_kobj_info[cpu].kobj = NULL;
+				cpu_kobj_info[cpu].cpu_id = 0;
+				cpu_kobj_info[cpu].socket_id = 0;
+			}
+			kobject_put(cpu_kobj);
+		}
+	}
+}
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
index 297d6151001c8..fb9aa63dcf820 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.h
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -15,6 +15,9 @@
 #include <linux/device.h>
 #include <linux/types.h>
 
+struct hsmp_socket;
+struct kobject;
+
 struct hsmp_sys_attr {
 	struct device_attribute dattr;
 	u16 sock_ind;
@@ -58,4 +61,8 @@ ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute *attr,
 ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
 				    char *buf);
 
+void hsmp_create_per_cpu_kobjects(struct device *dev, struct kobject *cpu_parent,
+				  struct hsmp_socket *sock);
+void hsmp_remove_per_cpu_kobjects(struct hsmp_socket *sock);
+
 #endif /* HSMP_SYSFS_H */
-- 
2.34.1

