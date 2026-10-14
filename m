Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011012.outbound.protection.outlook.com [52.101.57.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A4E4A5C28
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 11:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976507; cv=fail; b=UnT8WrMfyf8b0emgDcCyhnMMDXXtj7rVyAJJOns7nv/J8QdbROV/B/i15uxaslJ/c+ItwMnGaQLyPpyo/66KkKn4Xt7m4iulDmfRutAXgbWsC1NwgEUuKgYOB3FhZdzAJ5vSeJQxCkRNFfTYRRVuWjtN//O1JVaFM20jW8P3FQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976507; c=relaxed/simple;
	bh=ZSFSYBSIT1B+PI9Atm0GX73x53M72iS5wPpXud9fiGA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KDKdtH2I/O9GA33tQwYIdjNh3IZw5TyKRm7vuQazWopW9bjVBheH6GiNdwAAfGYB92ku5OtnqMlUEu8JcQvH8fPw3xjXmEVGfhod+5b2gy2efI+p4sYmNlUZxSqLYzfMggMzkH+4gXVIERYdGSibeZpfFjg57Ak6Y9PFRS8vfS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gsBnnWrj; arc=fail smtp.client-ip=52.101.57.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gsBnnWrj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yca0j8P7Wq8GaEQ+SEkez4TASuVj+CjNCV/YZ8GjOXGVS/zF0yFZq3A8UoRNKwZoIjXZKLhsaltaf86xoOVJJ5HaUjDIw0ax78HjgT8AzUCnEqpb5jDaqPOaLY/KokHDkQF926T4TVy6gTLoWcBpEDoGOh1HIHGrxDOMUH91h8SWw4SggSG7TIiz6p2qyIqiQ/n+uqWHIkWT8lupmlBFpqPZ1xzCHw3jqPAseW/r3V6j+kRMTMchGWqv1eXslbzViwvq/7IvIm6LdMOt/h2qCV2k8I72D3UBdFbzLKnS0yN0lq0mDBbtfvGpBgy5GhYy6hIxSa0JT+SrohwQBX5EFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxzL23HScl+vaUtDdZDaNZJKUvSfB7IC/QDyUuZmLJ8=;
 b=j8T4JL+k6VA1/jC2oMoppYcfQLuBMf8UNQSCfvpWDNvlf2Yh1d/x/zIB7EDGtYhx+ULyOI8ayPLErPGI6IDCWFXD4yo81yv1AnELO/Jc2i8DhzStqCJE16LO+9H5j1PrVfKmuQczEk+meNsFuh7CJ8VDXThEsswbSCWOHHg31b6bBI1149UPPvGOzgtKNlCDOngx6mnzLSFm32buP7fPKjoR70q3D7S/+KpaW0XLHURq0e3eqdiIjm/p6kyoVrJbYS80nb8m1/tcn4MHtLRQo4Kq+OI2JiHIVd4FiSuAlk7yhFKH5+6PTeJgwMNmUgFf+fR4L3z9zx9hb52FHQUfwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxzL23HScl+vaUtDdZDaNZJKUvSfB7IC/QDyUuZmLJ8=;
 b=gsBnnWrjslsEZiZljYi5OJ39wWdKzVeCgB7YwKh496MhV7IX22ZlqWt4K5vEt/v0NxPk2tiBb+ogy8eyzHTsyFiwMjwOZMjgb9Zzn6akF1jyKQXCS02UNI0yV14Zx+ztgzQc9XgFJW1fzZcZdho8ztuh4qApUK/aqYcC/KvayRw=
Received: from PH7P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::12)
 by PH7PR12MB5997.namprd12.prod.outlook.com (2603:10b6:510:1d9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.24; Wed, 14 Oct
 2026 11:15:01 +0000
Received: from CY7PEPF000000F7.namprd05.prod.outlook.com
 (2603:10b6:510:326:cafe::12) by PH7P220CA0006.outlook.office365.com
 (2603:10b6:510:326::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed,
 14 Oct 2026 11:15:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY7PEPF000000F7.mail.protection.outlook.com (10.167.247.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 11:15:00 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 06:14:52 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <muthusamy.ramalingam@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Suma Hegde <Suma.Hegde@amd.com>,
	"Muthusamy Ramalingam" <Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 2/8] platform/x86/amd/hsmp: Add amd_hsmp/socket sysfs links for ACPI devices
Date: Wed, 14 Oct 2026 11:14:24 +0000
Message-ID: <20261014111430.23156-3-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F7:EE_|PH7PR12MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a41ba75-82e1-49dd-1cec-08df29e46390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|261009223027099003|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	PJindcZOWoBMD/2SVH3IoM+OH4ltjbcVvgdeoXfJEbmsTEYCLgz9TNbH5Qn6AhPqR9AF9rUbY0sza4KEwlZQak/BkPY6uh/2hjnXJ+lV0g2sjICIGp1SAeVfFiGD2+bFeIZ4fJOBSc1j77/WbG1BSR5cv7Cf+8bmCj4jq+PzyVm3AfNOoTQlnh5ihqihezfi0i1nTh0uuTi4QIq+22dhGHCBFwZXtK2JQqQtja9WDvW0LyuC10evx6nV4zNhXEIa7zd2R1KrdUDcFxTaWXQuNdSFow/iwC7/BCQ06/6v0toeIZoCDtPv11gvQj6C6vWhGK5xjsPth4oLLwBIvoIfc9pBtEd6esPav7S8BGyDSPXLkiVqPlvS3siA9yyw7H1rI55ORo+rJ+I/oG8BjUFpnTh1CXddXsikvideAc9r8a5FptVND9pLok9F4oAoCTadyJOi1RLh3pSQGLVUlVuL9VrzWpll6uLooJwfQb843tNRFmZaLVBsIpW4YeCCgndhz948C8DffeCZ4Z0HxfYZTh1o9JOlTyvU7SxNuOVPAroDgXDcFUXkIrGyteVAFQwa3bjjHoTR0weOaP3QQ1NzT2bSjPUmsAkl/wrqxlDjV/cC4/HlaswY9EbAeD+a+8GOJh24YIGInKmDML+JXkLju/9bE0dyWLNg5PyNJV0sJiUQgiOy4b7d2WXSXsQgxI7tc8juL4EisSE5gF+ysEIurQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(261009223027099003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QAY3eHuBc8/bpD0NYwS/6CRgzq9VVdRgLBVWLR83KCu+4Es24seyllXYKrjSFaNarKWskZhLalC3oRnB5HzLQfRI+6RRDBnbHp4SgKfkPXZuEPfokMaO3s2NQYEzghZ6W3d1q83qlS1RXUTf+G23kOQ5QZavr4VVcRdRsMUmHCKISoEcdTDYdBO23p9CDSNpNEBCXgQhk/m8R5uxVt5sw33n+dulvxE9FFjxu/WebWzwTPcP7X7z7VDTftW2l4qym7alOFGJUhRoVTwBc/BoRUQBqDbxQhQ0ClnVw8WnvJt69zkEFPYslmEWJk/PjgTcUQgT3Zjc8ppXaeSoDq5qDnKdcuxeXDxNsXPeI5+wSXaNt0pP4VnX/a97E0pjXEk8MeQ0zhzDCoZ8uHyFmks781O7gbrjbnKqhO2wT3nvIc4UMfmiHsF0KCVknsnNsjFZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 11:15:00.8685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a41ba75-82e1-49dd-1cec-08df29e46390
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5997

From: Suma Hegde <Suma.Hegde@amd.com>

The platform driver now exposes per-socket attributes at
/sys/devices/platform/amd_hsmp/socket/socketN/, while the ACPI driver
registers each socket as AMDI0097:0X under /sys/devices/platform/.
Userspace still has to know which driver probed to find the attributes.

Create /sys/devices/platform/amd_hsmp/socket/ in the ACPI driver and,
for each socket, add a socketN symlink to the corresponding
AMDI0097:0X device so both drivers share the same amd_hsmp/socket/
path.

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 48 +++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 21dc03e1b05f4..2813dec12d3c4 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -45,6 +45,9 @@
 
 static struct hsmp_plat_device *hsmp_pdev;
 
+static struct kobject *amd_hsmp_kobj;
+static struct kobject *hsmp_sock_kobj;
+
 /*
  * Tracks the ACPI socket platform devices that share the socket array and the
  * /dev/hsmp misc device. The first probe initializes it, each further probe
@@ -661,11 +664,34 @@ static int init_acpi(struct device *dev)
 			dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
 	}
 
+	if (hsmp_sock_kobj) {
+		snprintf(sock->name, sizeof(sock->name), "socket%u", sock->sock_ind);
+		ret = sysfs_create_link(hsmp_sock_kobj, &dev->kobj, sock->name);
+		if (ret)
+			dev_warn(dev,
+				 "Failed to create symlink for %s\n", sock->name);
+	}
+
 	dev_set_drvdata(dev, sock);
 
 	return 0;
 }
 
+static void hsmp_create_sysfs_kobjects(struct device *dev)
+{
+	/* Create amd_hsmp directory under /sys/devices/platform/ */
+	amd_hsmp_kobj = kobject_create_and_add("amd_hsmp",
+					       &platform_bus.kobj);
+	if (!amd_hsmp_kobj) {
+		dev_err(dev, "Failed to create amd_hsmp kobject\n");
+		return;
+	}
+
+	hsmp_sock_kobj = kobject_create_and_add("socket", amd_hsmp_kobj);
+	if (!hsmp_sock_kobj)
+		dev_warn(dev, "Failed to create socket kobject\n");
+}
+
 static const struct bin_attribute  hsmp_metric_tbl_attr = {
 	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
 	.read = hsmp_metric_tbl_acpi_read,
@@ -754,6 +780,16 @@ static void hsmp_acpi_sock_release(struct kref *kref)
 		hsmp_misc_deregister();
 	hsmp_unmap_metric_tbls(hsmp_pdev);
 	hsmp_destroy_metric_read_locks(hsmp_pdev);
+	if (hsmp_sock_kobj) {
+		kobject_del(hsmp_sock_kobj);
+		kobject_put(hsmp_sock_kobj);
+		hsmp_sock_kobj = NULL;
+	}
+	if (amd_hsmp_kobj) {
+		kobject_del(amd_hsmp_kobj);
+		kobject_put(amd_hsmp_kobj);
+		amd_hsmp_kobj = NULL;
+	}
 	kfree(hsmp_pdev->sock);
 	hsmp_pdev->sock = NULL;
 	hsmp_pdev->num_sockets = 0;
@@ -783,9 +819,14 @@ static void hsmp_acpi_probe_failure_cleanup(struct device *dev)
 
 	lockdep_assert_held_write(&hsmp_sock_rwsem);
 
-	if (sock)
+	if (sock) {
 		sock->dev = NULL;
 
+		/* Remove per-socket symlink from amd_hsmp/socket/ */
+		if (hsmp_sock_kobj)
+			sysfs_remove_link(hsmp_sock_kobj, sock->name);
+	}
+
 	kref_put(&hsmp_acpi_sock_kref, hsmp_acpi_sock_release);
 }
 
@@ -820,6 +861,7 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 			return -ENOMEM;
 
 		hsmp_init_metric_read_locks(hsmp_pdev);
+		hsmp_create_sysfs_kobjects(&pdev->dev);
 		kref_init(&hsmp_acpi_sock_kref);
 	} else {
 		kref_get(&hsmp_acpi_sock_kref);
@@ -878,6 +920,10 @@ static void hsmp_acpi_remove(struct platform_device *pdev)
 	 */
 	sock->dev = NULL;
 
+	/* Remove per-socket symlink from amd_hsmp/socket/ */
+	if (sock && hsmp_sock_kobj)
+		sysfs_remove_link(hsmp_sock_kobj, sock->name);
+
 	kref_put(&hsmp_acpi_sock_kref, hsmp_acpi_sock_release);
 }
 
-- 
2.34.1

