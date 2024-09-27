Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754EF18C00E
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Sep 2024 12:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727438418; cv=fail; b=MwZeOFZP3c+en1ArQzf2Og8Bhg7I/Dx1MVmhWiYRCayBcFV78o/ajuy7gHvKJlfMso0yDuTEhPogiDgl9dNKlkHkOu58TmJPCX2zTY8hRiV82mTXLjuqB2rfHr2lH/DWlLRC8CTdtk7dvVYJ9vw81jSZ6JjQOwX/k1fOz72Oixs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727438418; c=relaxed/simple;
	bh=R6IEF9gdF2BrP26N6eBuDmlljwlq0Og8uiRNScQ3B9w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qLLXTpiOnCn+aqok+taV8VrCfM8tLQMa6gfwk1c6NOB8DvJYpRQ9stGOJ3PyPtbxcP/aZFTj0ZXv81pGMsLAsGRPRHAeGDjrPas0vZFMlg2Qk8YshhegySMUSPzEQkVWk5KrWA0P0cqzPP6DdVNwt7s5NLQcTYh1vilrNCudkxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oiz918PO; arc=fail smtp.client-ip=40.107.236.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oiz918PO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekWzWmPZtO4DkK+NWuc0Whzzli20Mj61MZjJwdw0T4JQjD79APYgzETgtL00vsezeGcqeBIhY/M0lX0dxYqqXFpXD/aINEfoDMqqb6WqI2jvZyxBFxnJ9x6Oq04CCqEhd4OpH8qHfPIZJXpfPHOH8lGM+iHBoXgmTD9xizcmUYLlZRiC+5TRZv9/dIq7gGG3CfAEqgTuIWP1GOCpZ+K3BWXJ57WPMAwXSUF3J0HZibaAo0jAf1aoscrzryHzOb8i3PvPDSxvVVsMcYRqeoUMz1XnwYR0k6XRIrQOdrty+aA+vOFco51YLFqa+BSX2gX6Eug+UuxSSHgg5ydNR2Lqog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cASPamzJ1Kl8U8FvH9z+RplpIX25E9lWaufxtaMktYw=;
 b=Sd52VXKjiMYy/fWehcx3tQiB2K/ngWCD6eNc2RUs0bdmAIH9x9qhl4qrlyXLssN3JgYhvGfBpjvEZZBLsBbiAWH8sfU3VXV+f+NJMi3L2CrYhP/S9baf+5o5vUHhP37/ZT/XsvSSe5kaMZQrYcSgp7FwAtlmvMxLGBk3IUAFTJiwAcQFN2KncIcXP4zgxF67ntFgoRiG5wpDEMtdDGbcfsq9gR5Jmd7co9AbB1UxD73DIYLuLJKysdPa+tdT45ALm9Tq+FQ+V0BRKQ++RbfE4ubnDHvFmI16XTXkOhVNHFCstzcqOAIjKq7NDik5NVR3SGFJ66PDncickn7L5u6Pjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cASPamzJ1Kl8U8FvH9z+RplpIX25E9lWaufxtaMktYw=;
 b=oiz918PO/fKYPGYsE5vTiuNhtO+LMlmcg9tCj9gvuFFwnWOi87nko3dmkoau/nB/LnDrtzDlcjAiXQRr7TMKpBM7px0/Y90yd8R/e3BX320U5wyZFpL+6pow4PY+GPrnHEUth8qKk2YCABhvaLLG9zhJOqC7g6tUwgO9Qm//52I=
Received: from SN7PR04CA0053.namprd04.prod.outlook.com (2603:10b6:806:120::28)
 by PH7PR12MB6418.namprd12.prod.outlook.com (2603:10b6:510:1fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Fri, 27 Sep
 2024 12:00:13 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:806:120:cafe::51) by SN7PR04CA0053.outlook.office365.com
 (2603:10b6:806:120::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21 via Frontend
 Transport; Fri, 27 Sep 2024 12:00:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 12:00:13 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 07:00:11 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v8 09/11] platform/x86/amd/hsmp: Use name space while exporting module symbols
Date: Fri, 27 Sep 2024 11:59:19 +0000
Message-ID: <20240927115921.10909-9-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927115921.10909-1-suma.hegde@amd.com>
References: <20240927115921.10909-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|PH7PR12MB6418:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dc8981d-adbf-48c2-f72b-08dcdeebf1e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JP1wo4rtX5qfKTmZfsaDzrgp63LD2PjoejuPjB9yMBrA2h7IyBbIgoGtc+4a?=
 =?us-ascii?Q?EETg3htO3ZTVd2Y/9AJrXDx4NVEZnF2upqrwKFqNwMAYRA1ZmHjc+GqRhwqB?=
 =?us-ascii?Q?x84XSrxX2wB9h0QNKmt/lpwtUg5+uVYuI35h/wcxYwG/IyBSgjn4QDvaD3HL?=
 =?us-ascii?Q?kofpAqz5r4Rt2KSek/eE7yo9J/v09kcpIfk8kAgsNsb/QIlYf5XOh0ARd8Ld?=
 =?us-ascii?Q?ZlWZpEDnblvdTXsV98hMm4ln4kOFY/lGct4jOjkhqvnbRWknO4DESz13mASJ?=
 =?us-ascii?Q?fSIecNiuEWmfqX/n/onlGF4BvfVeJ9GVUDhrlstCKZas8mXqZeMBanfulmyQ?=
 =?us-ascii?Q?03l7/GtDRH4p7y5lKOuodMv04mhZ0sdKirhlwEzou1iMJtzonPkx92dVTdDW?=
 =?us-ascii?Q?aNZ/TrTyjmzK/I75UHKKMJeC6lMqPC0dKwX39t+wYhPYrf5F8RQrMvbr8Bka?=
 =?us-ascii?Q?7o/jN39UjslzsxDQY8B/NJf8U3D7C0ufFpNphBMjg/2b/Y53iN26jWD/b5te?=
 =?us-ascii?Q?DfPVOSael81EzUD2VGs+EmCITtBGyTurjfcyWriGN2GF9UhyJgFmqGiABK1c?=
 =?us-ascii?Q?ckLYs3qJ281x1i5Q9yyk7P6LgLaTbg16JzUABDz4YokWHthKBEY4cgefVmWe?=
 =?us-ascii?Q?kATLXISr51Z6sE/erAXRkN/1QKDQAM2ADqB3l4OOMn+JVwwiceU2D41aHLbt?=
 =?us-ascii?Q?jUabXtxQwhfo4EFD3AevTC8ueEEA7EtNCbLpczWqyb0fjFg1vyhJ76O2+awO?=
 =?us-ascii?Q?cMZ06hVImmf90tn6aBX9D2jloeqlZKIbkZUdlNfE2LNQQ4LbQAv+Cc33QJcy?=
 =?us-ascii?Q?9W4NfrVhyZzCDhG+Wn0mMzUK4ky07r19zgSrZGuA8f8XmUAhR/RMfjk2pnrN?=
 =?us-ascii?Q?1Rqu20M9l0v6w6cncge0f68IntuwMncYDRxL7kqeSkDQf1pzAeBjW3/u54U5?=
 =?us-ascii?Q?Qb+MwU35AqzzVXBgyTbTxa96BRVpV3s7HQ5ljP/uTtgSiy4v3cwEpU20KWZF?=
 =?us-ascii?Q?9BF4+FakkbBfQjhZ0Ag0mLKa0GX7lZ4ZkCIHWW1jLaHVbY2E5fPobr8Ew5FV?=
 =?us-ascii?Q?d9OhN7saENPPIMvNWTag/dwigXucHEsr0lnZe2K5GWznTUsKYZWSIf5mYz5B?=
 =?us-ascii?Q?Z7nBloj7H0OtkerfyMVLjsQOBI2fDwRB2k6OvJXc5zstB5QwiRYApngg4oF0?=
 =?us-ascii?Q?SxMIHuYkTlC6o31j0MYS5BTcfk2/u4gWwROHNHNKksFfFjtV6Ffx6AljJK1Y?=
 =?us-ascii?Q?csejdeRd4Bilgt5csRqcSCZg17grKbn+jJssjmnpZPwkyOSTjOnWDCGbUy+E?=
 =?us-ascii?Q?fxfM5sAVMGYOkofc1DIlwDUrsD/s4xj3O4zqapsUgWhOVqz3pfbQhgBLEjLV?=
 =?us-ascii?Q?810nKRU5OvybX4/gHuaOyKNlVHbUDmOcTOOvRq06EGDMYSjtt1/n6S2xtLcc?=
 =?us-ascii?Q?kfzE+J4PygDwfMWibWw1rjl9MPN+uuC+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 12:00:13.5785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc8981d-adbf-48c2-f72b-08dcdeebf1e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6418

hsmp_send_message() is exported with AMD_HSMP name space.
The other modules who would like to use this symbol,
need to import AMD_HSMP namespace using MODULE_IMPORT_NS()
to get away with warning.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v7:
1. Changed from EXPORT_SYMBOL_GPL() to EXPORT_SYMBOL_NS_GPL() for the newly exported
   symbols in hsmp.c.
2. MODULE_IMPORT_NS(AMD_HSMP) is added in hsmp.c and acpi.c.

Changes since v6:
None

Changes since v5:
None

Changes since v4:
None

Changes since v3:
None

Changes since v2:
None

Changes since v1:
None


 drivers/platform/x86/amd/hsmp/acpi.c |  1 +
 drivers/platform/x86/amd/hsmp/hsmp.c | 18 +++++++++---------
 drivers/platform/x86/amd/hsmp/plat.c |  1 +
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 766617e6adc7..53deee86f456 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -343,6 +343,7 @@ static struct platform_driver amd_hsmp_driver = {
 
 module_platform_driver(amd_hsmp_driver);
 
+MODULE_IMPORT_NS(AMD_HSMP);
 MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
 MODULE_VERSION(DRIVER_VERSION);
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 4fa0850c7824..6fd08f16933a 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -36,7 +36,7 @@
 #define DRIVER_VERSION		"2.3"
 
 struct hsmp_plat_device hsmp_pdev;
-EXPORT_SYMBOL_GPL(hsmp_pdev);
+EXPORT_SYMBOL_NS_GPL(hsmp_pdev, AMD_HSMP);
 
 /*
  * Send a message to the HSMP port via PCI-e config space registers
@@ -193,7 +193,7 @@ int hsmp_send_message(struct hsmp_message *msg)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(hsmp_send_message);
+EXPORT_SYMBOL_NS_GPL(hsmp_send_message, AMD_HSMP);
 
 int hsmp_test(u16 sock_ind, u32 value)
 {
@@ -224,7 +224,7 @@ int hsmp_test(u16 sock_ind, u32 value)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(hsmp_test);
+EXPORT_SYMBOL_NS_GPL(hsmp_test, AMD_HSMP);
 
 long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 {
@@ -309,7 +309,7 @@ ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 
 	return bin_attr->size;
 }
-EXPORT_SYMBOL_GPL(hsmp_metric_tbl_read);
+EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, AMD_HSMP);
 
 static int hsmp_get_tbl_dram_base(u16 sock_ind)
 {
@@ -352,7 +352,7 @@ umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 	else
 		return 0;
 }
-EXPORT_SYMBOL_GPL(hsmp_is_sock_attr_visible);
+EXPORT_SYMBOL_NS_GPL(hsmp_is_sock_attr_visible, AMD_HSMP);
 
 static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock_ind)
 {
@@ -391,7 +391,7 @@ int hsmp_create_attr_list(struct attribute_group *attr_grp,
 
 	return hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, sock_ind);
 }
-EXPORT_SYMBOL_GPL(hsmp_create_attr_list);
+EXPORT_SYMBOL_NS_GPL(hsmp_create_attr_list, AMD_HSMP);
 
 int hsmp_cache_proto_ver(u16 sock_ind)
 {
@@ -408,7 +408,7 @@ int hsmp_cache_proto_ver(u16 sock_ind)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(hsmp_cache_proto_ver);
+EXPORT_SYMBOL_NS_GPL(hsmp_cache_proto_ver, AMD_HSMP);
 
 static const struct file_operations hsmp_fops = {
 	.owner		= THIS_MODULE,
@@ -427,13 +427,13 @@ int hsmp_misc_register(struct device *dev)
 
 	return misc_register(&hsmp_pdev.mdev);
 }
-EXPORT_SYMBOL_GPL(hsmp_misc_register);
+EXPORT_SYMBOL_NS_GPL(hsmp_misc_register, AMD_HSMP);
 
 void hsmp_misc_deregister(void)
 {
 	misc_deregister(&hsmp_pdev.mdev);
 }
-EXPORT_SYMBOL_GPL(hsmp_misc_deregister);
+EXPORT_SYMBOL_NS_GPL(hsmp_misc_deregister, AMD_HSMP);
 
 MODULE_DESCRIPTION("AMD HSMP Common driver");
 MODULE_VERSION(DRIVER_VERSION);
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index e49b53f8c5e3..0c34312d1a50 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -271,6 +271,7 @@ static void __exit hsmp_plt_exit(void)
 device_initcall(hsmp_plt_init);
 module_exit(hsmp_plt_exit);
 
+MODULE_IMPORT_NS(AMD_HSMP);
 MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
 MODULE_VERSION(DRIVER_VERSION);
 MODULE_LICENSE("GPL");
-- 
2.25.1

