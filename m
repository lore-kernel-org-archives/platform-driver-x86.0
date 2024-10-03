Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC921547CE
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 11:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727954158; cv=fail; b=dPSd22S5yvrd4VxcnsO7F0tq9/jLRyOqGkw1nH3CaBdRfMXNXYUVIj/u7VGgaIwntjXHZOTpxKrvUkR361kSuAExJjfXHqK3GwfOtR4mmjNf3RlVuVT85hPCzB64PNnnGK3tw9VJ2FoLixiRlxJXfY9l5L2tfumEEbe8/qpdI18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727954158; c=relaxed/simple;
	bh=G/ySLvAnzTQqoTeQ7c2sctoX9W+ubyC1lQPYSqOhn4E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rmktwldPTGS0J210YG7Is7o+pHXRX872RnpKf9tNbTsEe3a6e5K5gDaPtu5ZiwXEDihGxaGyCsTKPzdMmYM6pZSft9nDUDtlSQqxK3k8Vx6l16PRdtlEX3/daBpd9t+dBPOYLV4jbnvuZmbYcrRHNB7Kw+SjqCF51syQPSTuoPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4NyinbLR; arc=fail smtp.client-ip=40.107.220.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4NyinbLR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rUVbhUrRHcesBTXNjVhbbpG0mWtUlYir7DSVoLYWmXV57/V+jLNnVbFmRZcAewDj+ty9Ydvn9MrkZB0aQFiKQbfSPSL5VAcX/yW3XcTnsTXTrfS2VgV7OlzEGs/AQdRfl3Co8+yRRRKPt/HKMZioF6HZ0kj+ri7+gNcitfBIUA7TJbwTvIKKBf70tjIsvKrXXIHailzx9ScPQoa2rkYUbJ+v5JCR1h7zKJzW9NVWD9E/dgqweEceOxSlzE1TtICdi22/d/kzoOvE5MWnQuO1VdcfOGh1jZrStDKrKvFnGopMejrCBYuY1lKo9S1BYTTpaX7FF0xmBNaYrNe2N+nbhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07rODr/Rn8BKDT13vgMQs3qZYu6/2ovsRyxiKbhLge4=;
 b=q02GTFGTjwYLX0z3I6HOZnRBHClucdwbZysut1eiIAmjOpL0RTSaYQ5vfoosaTiiBK/sTMG4GRfThVJp5sy8nXJoVGEmx2jNvQyzVRw00Xlm8xkV3Lbbk1u2pCfS8e4+HCb2zycfItyHKbuK/jNPWyrohvzZrHaQWaw2RWERj3oIXuU6Ez9VTaPMp4sBksarhMLe70l0kh2vn7QyB126fhLppCM8OkbD12TYXyYYYOfpr1jq6/ZE2+7Y11OnOgJw2K1kBxwc/2R6wvV5Frf0ssmzpyJFaVMJk+15MNJBBr2H/6IShcg4M/6XfzKEPJNMA1CzVHEneHFQGjsA8u35DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07rODr/Rn8BKDT13vgMQs3qZYu6/2ovsRyxiKbhLge4=;
 b=4NyinbLRPJkyexzDAqTXuQQ9RCp/5ejEPV6AVAlwXS4Ra8LyyGQxxwrjL9jIMQmt0RAFwCl9Z45FwNAcpaA46yCae4De8BG+C0S94B+YuXZNMgBFyIZB3JLV/2K29ysxNetygdKgcODXZlhPI/Y36pOQCqkzMI3sU+tuTae/Yc0=
Received: from CH0P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::12)
 by SN7PR12MB7322.namprd12.prod.outlook.com (2603:10b6:806:299::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Thu, 3 Oct
 2024 11:15:52 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::fb) by CH0P221CA0014.outlook.office365.com
 (2603:10b6:610:11c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 11:15:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 11:15:51 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 06:15:49 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v9 09/11] platform/x86/amd/hsmp: Use name space while exporting module symbols
Date: Thu, 3 Oct 2024 11:15:13 +0000
Message-ID: <20241003111515.2955700-9-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241003111515.2955700-1-suma.hegde@amd.com>
References: <20241003111515.2955700-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|SN7PR12MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 7837923e-cc65-4731-d794-08dce39cbdd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0IclFYH+rYMQkfhvvN/N8jsU1rGDWCiVAFQyzMAMbBTLpW+Spp/WrXd9MzYj?=
 =?us-ascii?Q?NAN6MsPJfsRP3tJJny0duiTu55njzsIyxR8dOYP7I5YTxMCtfWyebWZg/CyG?=
 =?us-ascii?Q?tCCRy7bh/aPpwLF4vSAFm6TrvcKeuOkSVrp+/aNN7kfGhwSXIGIDoDvT9iy+?=
 =?us-ascii?Q?atRqpYaiI7kxHJoTHzRMUh9IW+T6FXjBKcGz1pxKv9ObEQaj53RkKHtH0nm7?=
 =?us-ascii?Q?l9Y4QWfkmZWhTVBzzZV15wQoamDTBalfxw2q4jpVw4WfuYV8mnNHr4Q2WTP5?=
 =?us-ascii?Q?YAFM0TPJ+RS/nsed8tjWKSEXc/qfA9DBP6V6wG5q63X1YJfXkDq13QTYp2WH?=
 =?us-ascii?Q?2ubQ1aftJ5gheTnIA665Hlhc7nlZRXmEpskEjacqCmwjxMS53d90RrozOYxL?=
 =?us-ascii?Q?AaReEnPmh+LjcwOtEbFhP98fFFRUM0suLVRP+UqDOs+xskM8K7ERVU/TtS75?=
 =?us-ascii?Q?5pjNE5i9CyUWdRsf0lxVvwnfcl1XWMdI/jYy8Vbzt8QdBkFN40057XMbKsm8?=
 =?us-ascii?Q?8HSSHXqkEIJku1AeypBIUwL7USA7834qsl06v7knxtwn3PBFXTm6KaAwKzBh?=
 =?us-ascii?Q?64IgtIKQHLr4GtaKqgjxhTTd4OUt8gKbf0FGQk/tAYOv28/Vye+eHpnktrJd?=
 =?us-ascii?Q?4oMrj/nwN/NWCzZjgnOECEe3jSZTB+Z+WSVtSWPVx4q3iS6TlT0FtO7aA+i0?=
 =?us-ascii?Q?9sqTJIN18CZCz9q/N40cjjCA8GQsjBnqPRmbfiDQeDY97y8K19vaEj0jafUz?=
 =?us-ascii?Q?wqgJbAhKwT/LRADqssoCPfzArKzI5eglGukyMcy+w+FYfqSCyDZ/gxTFm2Mp?=
 =?us-ascii?Q?2/Lz1CCdvIoIdXUhD1Riz8e6yeWKfJ51Q0+PMjiCRaZNEHU+TTnp7b89P2p9?=
 =?us-ascii?Q?QJjEgW+66QDPLg7lVXQfF2cChma2kGtqh32dv/yO57BDFq6qwkLVSz/taY2x?=
 =?us-ascii?Q?J5yXezxC9Lq70y34x1gFXJyC/ttC60ji5PY2EvkHWS2AWSO58Pm1yjyFMnwX?=
 =?us-ascii?Q?Wn7UzmK5ga/5pWN2OdEzYX77fBt8pUYah4YGezpTVN8Fbc6gUeWajN6MXRKx?=
 =?us-ascii?Q?ZBHqpPZgBdgRSNmvDjjAs2xjrvx6tU70FKiCljsKcx0elhZWQC+IrB/wqWAO?=
 =?us-ascii?Q?Lcy0WimKhIdksZ4RFgFn714Ih6mp2/VxJytdWzyezkst7ubxCU+ssuEQprsZ?=
 =?us-ascii?Q?1hsH4xl4wedaeBHpS3DLeQdFQIX4q1Qn+nhI+qnoTspz7gS0RiiujHFlIUQQ?=
 =?us-ascii?Q?aPwRpLXZMhm7kOIYkJL9fHMTLuZDCdvIT1k03Eh5cs+ITF0I5LVAgZDg8HBL?=
 =?us-ascii?Q?v8qsn3pCY/jDaDe/F6qS+Gk0N5pufLwPUs2w3YrTA76PoGTBorWJx/ICo2ct?=
 =?us-ascii?Q?oEnlKZdyCng1T59sT/X8mX1EUBmn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 11:15:51.8403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7837923e-cc65-4731-d794-08dce39cbdd9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7322

hsmp_send_message() is exported with AMD_HSMP name space.
The other modules who would like to use this symbol,
need to import AMD_HSMP namespace using MODULE_IMPORT_NS()
to get away with warning.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v8:
None

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
index d2e207820bcd..6049dc126d49 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -265,6 +265,7 @@ static void __exit hsmp_plt_exit(void)
 device_initcall(hsmp_plt_init);
 module_exit(hsmp_plt_exit);
 
+MODULE_IMPORT_NS(AMD_HSMP);
 MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
 MODULE_VERSION(DRIVER_VERSION);
 MODULE_LICENSE("GPL");
-- 
2.25.1

