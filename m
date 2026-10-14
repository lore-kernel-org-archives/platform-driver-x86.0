Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011057.outbound.protection.outlook.com [52.101.62.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2871A4EE87C
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 11:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976517; cv=fail; b=NqBBnwhzqnDum7OeHwnles/wHHeu2u6Eldoq5qSdYIoxrDYMtwF/09+EGzegChaTt0RoaQQKS1jxgJeEXJvkJ008ULTWA8BBO4jTCbVj0VYT0cOmh38sdcw+AbKBgJBxHbXAGeJGHXrOpIwjSrFQZAf5ye5M+dmBYL/rWjxWvXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976517; c=relaxed/simple;
	bh=nAk/YZGaZmfIk6k0/yYU3QQQ8lDVY2eACS5zY+TWiSQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hAv4mEof050HTiXlrzHifTvy0LMsALluw2omUXi3qdPfzW8pGDP42uyG6FYlKLPWoq9bFmLjFzgNruht0XBtAZS9hj/mElNUWdxendva+ZS1hqBgGlc1Jqx4leAV48onS1Gma684MCDrWF6M5t6yYNSsYUa9Ng6hf69qF6WPmvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pcjjQ3JL; arc=fail smtp.client-ip=52.101.62.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pcjjQ3JL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zctw2NcDQwrnGVMyC2ImQufpfZNuzgMsmSwI5iRMkO9FhVVh81U/O6yvld/JDHsdhAf0YaETkOk8iO9b46a6hwOrsXzTpYRdcJRluRkqLRI4zoWCsIjsgMRMpafgjhtLoyvYi9wKw/XQ9rZ1dE2+dFIiLRuhekHhVjkJSXw2hJAi32wljXwMJUPMudnsKY6eFI7ar+sJIyHFLqksvLYdO+sUXesndAVnh+brf0398rGgDvRl31IHRJTrwlzldbqU8lpSr7hAa/692RHwHthafYqEdTH+ZFK04y7B+VaWmkh8N5871lnGzdGyBcXrSvT9PdvH/hR/9lA2sYP6m8cjnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fipA204p+CUmXpUQHWm+4ZDsdUNwBsPf65LmGxOuNyA=;
 b=LmNO7GtBJ6US/dByc/Q/yDcHRGpM/VYJnAGNp63FvSqb+tRDn6oU3VBcTMzyU/QeiixdHTWkEAROiVg1ZFizDDYVjGx1lQSzFtnN2f1vqkWZ9G52qm7s5AXmZYkZ2PCeNWZmNBH0jtH1/cyN+2O/ioAKxpfLpPde/m0T2aXEG5E3Tm0vizSGSrbLOH5CqRuYPFOYj2ISfoNB18tycZkf8hiJ6AeaUnD6rKYiX3YjG4nP2ZARXKQz7SX9+OMBL49B2XUxHR1ZcQY7VABNtlFkOD9LVg0ZenaRABvLN+F7saIf3UIpSH1RFKMpC5b+zb8hOFU7KKxcBWhbC/aIXLUIdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fipA204p+CUmXpUQHWm+4ZDsdUNwBsPf65LmGxOuNyA=;
 b=pcjjQ3JLqfdDPO8Z3d7xlJm1M6WHSjvZTHqo9pPY7EgnB6GhRP/qPXCpawPIPn6W1i5cVb51f0ZNY139f+PapQL8X133lzjdA1SbeuOvil9y+TT0Ldc/4c2NqMyHrXutPMrtICDB8czG2ryCsEG4GKrg9teT2a8OiCVShE9HnSk=
Received: from PH8PR22CA0009.namprd22.prod.outlook.com (2603:10b6:510:2d1::25)
 by IA0PR12MB7721.namprd12.prod.outlook.com (2603:10b6:208:433::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 14 Oct
 2026 11:14:59 +0000
Received: from CY7PEPF000000F2.namprd05.prod.outlook.com
 (2603:10b6:510:2d1:cafe::5b) by PH8PR22CA0009.outlook.office365.com
 (2603:10b6:510:2d1::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed,
 14 Oct 2026 11:14:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY7PEPF000000F2.mail.protection.outlook.com (10.167.247.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 11:14:59 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 06:14:50 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <muthusamy.ramalingam@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Suma Hegde <Suma.Hegde@amd.com>,
	"Muthusamy Ramalingam" <Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 1/8] platform/x86/amd/hsmp: Create socket sysfs directory in platform driver
Date: Wed, 14 Oct 2026 11:14:23 +0000
Message-ID: <20261014111430.23156-2-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F2:EE_|IA0PR12MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: 59c6b7f6-ab88-42e5-8642-08df29e46281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|6133799003|22082099003|10067099003|261009223027099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	W0PBIBedHh9aUUKymfBWCZjQ84cznMEH9TDuflWO+s/S/K2mOejDiPe62AkTmF/U2UCvx/LRj+twP7dbptZaRTl10YI588ferhJYzGDjSddE5TrOxCWnCgBh4hCwyxhPPwdoHUvwo6HsvUw9dFxaZYmFQ/i9GGEwdAGr096SWOdWMZ/KodlRBRbPBqnlTvXMS7blWlo8oVjA+uTGBIktnoX+0nJRsL4ibejzXyQ6tk/8H4fykwqoVgBygRxgzbhexnTXyDmlwn004KO0IB9xuN4QxerpEYUMa02SsS2916iib2dg9ypbkJhcS6bNKF8+SqXoM0c7rkFpbvWFiQXzVbEzInWTY5COE8iexMNnbU2BC4DhM/AfIRrxaZK5dXet1lMKje7kky+tHYGJHdEb4CEvrUqOtE5PZZbtE3qLchKMNbMclOk9IDJVvBCou4NoUZtpE82REaJpijHuDWH9Zr6FqiV7fpe2Mmx5GO/hUO8p5J6ufkGunn+tF3hDFsCsg+rZ8CHcFO2aNEfSTEVwNi+PoO8Bg8nC1Cgt8K5Ruw/ks0al4z7B5dm1wNcl9mwNoZfu6U0IO/56r49Hd7Q+SwBhmghnb6swC/YzX46TE4FhlbaSjgGgV9K1sIBZFXJYBFrxRg90YSlcvEqaS0V7pb+mZmwkHp+kPxge7lRdg6H9qkFBj1H06ciMM/JZOBcSsSlYkXckS/eUot3R/QPeFg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(6133799003)(22082099003)(10067099003)(261009223027099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	36T1U1Q9epR8BZMw3zmaiMIjwz6Zgs13eNsAsUiASV7GgxoTPY0HGHKnNWs5e1xJY2waepwwRnMYzleVDOTk6QrcM0qBnodIBJNzRM4Vcj0dVUL7pwtM1EvNvsR1PjsyDed/8o95lP6oQqrMHgmCra4b6n5oQ+99jgcmdEPwyfRLn1FfISfqkZx4euanti4a5jkoMcUD6Gvl0BtGxZFi8STdhP9YFwznlmehVu/z08sUHuGKQdd2h5tc6XjpFJ1Xn5YRMZUxlqQgX5khaewV8+GirTJv7DJOHI5Ma62Q4GZdzwE/f+dgALDjSK72NgLmTXgVVOlg+kLIhhJCHr2Dr7LGYNEvvyYQ4N3x34wy9AgGb2bfngjmkZQrWzREzm8glotLtYwhaSG6yUtkkapuzhRxTZa60ry1j+KAzGX906dewr4FUymY8oipAB2CJrHj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 11:14:59.0925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c6b7f6-ab88-42e5-8642-08df29e46281
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7721

From: Suma Hegde <Suma.Hegde@amd.com>

The platform driver exposes per-socket attributes directly under the
amd_hsmp device as socketN/. Attribute groups can only create one
subdirectory level under that device, so an intermediate socket/
directory cannot be expressed through dev_groups alone.

Create a socket/ kobject under the amd_hsmp platform device and attach
the per-socket attribute groups there, yielding
/sys/devices/platform/amd_hsmp/socket/socketN/ as the common layout
for both drivers.

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---
 drivers/platform/x86/amd/hsmp/plat.c | 43 +++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 310a776125961..949d75a3e6de4 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -42,6 +42,9 @@
 
 static struct hsmp_plat_device *hsmp_pdev;
 
+/* Parent for per-socket attribute groups: amd_hsmp/socket/socketN/ */
+static struct kobject *hsmp_sock_kobj;
+
 static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
 			     u32 *value, bool write)
 {
@@ -232,9 +235,43 @@ static int init_platform_device(struct device *dev)
  * the global socket pointer, all before devres frees the array. Registered as
  * a devres action so it runs on both remove and probe failure.
  */
+
+static int hsmp_create_socket_sysfs(struct device *dev)
+{
+	int ret;
+
+	hsmp_sock_kobj = kobject_create_and_add("socket", &dev->kobj);
+	if (!hsmp_sock_kobj) {
+		dev_err(dev, "Failed to create socket kobject\n");
+		return -ENOMEM;
+	}
+
+	ret = sysfs_create_groups(hsmp_sock_kobj, hsmp_groups);
+	if (ret) {
+		dev_err(dev, "Failed to create socket attribute groups\n");
+		kobject_put(hsmp_sock_kobj);
+		hsmp_sock_kobj = NULL;
+		return ret;
+	}
+
+	return 0;
+}
+
+static void hsmp_destroy_socket_sysfs(void)
+{
+	if (!hsmp_sock_kobj)
+		return;
+
+	sysfs_remove_groups(hsmp_sock_kobj, hsmp_groups);
+	kobject_del(hsmp_sock_kobj);
+	kobject_put(hsmp_sock_kobj);
+	hsmp_sock_kobj = NULL;
+}
+
 static void hsmp_pltdrv_release(void *data)
 {
 	guard(rwsem_write)(&hsmp_sock_rwsem);
+	hsmp_destroy_socket_sysfs();
 	hsmp_unmap_metric_tbls(hsmp_pdev);
 	hsmp_destroy_metric_read_locks(hsmp_pdev);
 	hsmp_pdev->sock = NULL;
@@ -271,6 +308,10 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = hsmp_create_socket_sysfs(&pdev->dev);
+	if (ret)
+		return ret;
+
 	ret = hsmp_misc_register(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register misc device\n");
@@ -283,6 +324,7 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 
 static void hsmp_pltdrv_remove(struct platform_device *pdev)
 {
+	hsmp_destroy_socket_sysfs();
 	hsmp_misc_deregister();
 }
 
@@ -291,7 +333,6 @@ static struct platform_driver amd_hsmp_driver = {
 	.remove		= hsmp_pltdrv_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
-		.dev_groups = hsmp_groups,
 	},
 };
 
-- 
2.34.1

