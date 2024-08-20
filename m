Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2087.outbound.protection.outlook.com [40.107.102.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB96A18C939
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Aug 2024 10:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724149829; cv=fail; b=mNS68+9F+EUu4fjd1VF0XovXtLgUNXYaANj7MV+OWTXCVq94JoiWskVgGcu3gIyVlFax+jJFJr5jDXYzHMjt41pfGWTdWGS/VrGQrE2sieZGsgu0HhdvmxqjpLgrzaK6ct3kSrrjv4BSuC0OV7w01bccLWF56cpiA/jrbX9i6og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724149829; c=relaxed/simple;
	bh=Bd30lgmAsRvb4uLeD6KN5EVf9GerbmRRZsJKHLGq5fk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lQAMdq8pwtL0cj0Wm5cR8NnN/SxXVgA5386zADJAgI8+EGRIK9k4enXkQLHc8fC+w+OYU7fe+wEebZ/orXIXO8b5TMypryvQysMZAcUO2BpuRd48BHAMdJdqnC8ZeJOUScDcPWPVtmL3IcJkGjW3482zevu6ZsNy04tQHJXyA8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5VSAORBV; arc=fail smtp.client-ip=40.107.102.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5VSAORBV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWMCTYHspw/YGGxkzqsbclAXlXl05VYBK51fitiicENOmN6+hg4utaQXmIBuuYz/nSF8Gx6DbHgUkoYbWImyFHm+IfFEkfrrY79nkmnKHcYTnZZTBN5+VPRaHqGM/kcSCAs0Md+0OZdcsNykzJTA7SEkunZnEPFPN0A6cPqrvMhc9XRubVfxjmfM51LmJWOr1sS7dNvZUF2dXbCyx+4MEpWCtGdA7DkSlL1qOSrjTFe1hY5HOY10sFVWBDgaKS+zaHl+ZzYrd2zasU6vpbXVLewL+YfIDLcQYKX6VVxUt2JemJ+kSZ9Dw33rizBM58MpdFesZSU1z2Q/xeP6a/jFjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=605RR6vntj1wfLFXRuXJa4/sjWGJ31TOAECWXVRCpNY=;
 b=CfaE/3iA/5tomoHVmCknDX+mdPnWb0pEXApDtBc24RAE7pZ1+TDcG6hRLKKZ3wr4b86Gmz8Ieat6Do8zc52nAmggmBiH9Z8bt/QGBYIhqgvuuGNllHJzkQZlAqc8yPu+1WS9kHQzLox2B1GghgrVtL6WZs68T0RsnWtPgErWAxWKq9zSRNH3K9ZlXQ0b0m0EHubCzcMvZG7UDgDPKE4A95qx/Y0I1CUmViLYZV8uZNdkQdnc9ZWnlvq9K7TgqYb3aoQ1RMpdYhY8vA73mRdrMddT0O7SvhGqA2wzvxk3OcY6rKBKx/8ujfDAapQDIw+750DCDplR0z0BYLohKP/9bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=605RR6vntj1wfLFXRuXJa4/sjWGJ31TOAECWXVRCpNY=;
 b=5VSAORBVrb2OWuHCft3O+ceJsoW+3Z8MtxeZbH2kWdAipoY0bgh8+/GFMnUqUgUXjtATjSwqf3rvkTAiB1fzslu2XQI0nYl6XSbZQmwwSD5r9f/MIL4UnbaYiNk8cAKr0e66Hd4NhxCB6iOtx8oJtJuq04OA8rkOP8k+jvRl4TA=
Received: from BYAPR01CA0018.prod.exchangelabs.com (2603:10b6:a02:80::31) by
 CY8PR12MB7194.namprd12.prod.outlook.com (2603:10b6:930:5a::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.20; Tue, 20 Aug 2024 10:30:25 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a02:80:cafe::d3) by BYAPR01CA0018.outlook.office365.com
 (2603:10b6:a02:80::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16 via Frontend
 Transport; Tue, 20 Aug 2024 10:30:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Tue, 20 Aug 2024 10:30:24 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 05:30:22 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v4 11/11] platform/x86/amd/hsmp: Fix potential spectre issue
Date: Tue, 20 Aug 2024 10:29:41 +0000
Message-ID: <20240820102941.1813163-11-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240820102941.1813163-1-suma.hegde@amd.com>
References: <20240820102941.1813163-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|CY8PR12MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c943b4a-5491-4bb8-44f9-08dcc1031a3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?upAmbvN5UsXJDcdSpQgN8si/dWVV5enjLuYhYbpf0YABTEiySMCOQqAJ/SM2?=
 =?us-ascii?Q?+thV+LIoYjIn/ANpiORCY0TaP3DIX8XnXvFP1qWdU1L+wxk2BETZUshN5PF2?=
 =?us-ascii?Q?K4f6T7ZH1rmL9KJ+4rv7+GZfM7BTeOFeBBFQ7BRElTP/5ZVpoW/N00dvHryS?=
 =?us-ascii?Q?l/xdr1YPVtvirMnrk9UEzEJlPl7Rp6a1Om789vvjH+W9JXzC+DGjNrPOuuhm?=
 =?us-ascii?Q?YGFssNed+eZZ2tfDdrhhhN7gHDbQrUTiX61iIKtX16iAJgJbFZZQ6jjti9Q6?=
 =?us-ascii?Q?XLElQqKQ4bqo9+2LnWAN/YMAa5ifa+pEu4mZkGn4xg4a5ppa6/935LsybItN?=
 =?us-ascii?Q?Y/Ve6Vqm3wYNFY63ZCR2RkyjVF0+ibW8WSC9zNaL4upIABLUSTnFfgubPTSd?=
 =?us-ascii?Q?BLNcQnJoUcLIcPa6edU9WqIYTe67sKHAQS40HCfwxtPO6PNcc9STSvzzM6NT?=
 =?us-ascii?Q?9Ma78Q/opEUJ9A8K3yrQ3Ew8CbFyE2OzhMvR8jDXmBMMmCtNFuVGRVhaSGA1?=
 =?us-ascii?Q?FZdbUOmud9ii3KBXvnDjjIjY3O9emkCMQ8D8MtT5LwtO2/8FCX6be7oVbVJP?=
 =?us-ascii?Q?my3/pDj2lo2UxkeNwfg0r2DKKvliqOx6dia8drx1CSn2Wso7k2ci3zeXxJ+g?=
 =?us-ascii?Q?WSVRjlhO4LeMGEt3BRBsVFefWCtx6NCtr1a+Aextb3XQGrd+rGrKQlp7CqtN?=
 =?us-ascii?Q?K8hDMR3+1YkgW0kHDrK3l0jmtz+qll3ulr7eI8RxXqrarvZh0kRjaRPOCl9E?=
 =?us-ascii?Q?FsJqReGxXeUyjZFwny6hnyUrpOleUnWf82XZgIHyBzdhCvIuppb5LPvz7HTb?=
 =?us-ascii?Q?wXBcsqUTbSYdK9/tvilEPuZokp3mgMK783FeTDtz0pmXx7yYOjCO+kc1hUG9?=
 =?us-ascii?Q?VMJwER8BSzV8xlQGqm7P+xWpWzzZ7cPHNwWBEzOaEAqiXeWNABlXB83xlbL5?=
 =?us-ascii?Q?ucyooLNnXnyPpT4I2eGIsEQXF7hno66J4qmJzAS3jOMrYYSDi3M7WA8Fo/sO?=
 =?us-ascii?Q?QmEWYSWhFAqn9cm/r0f/pKbUgPx5+UhjpoM04QD7A4wLSHRl9skJ3+TjuEXN?=
 =?us-ascii?Q?+2xZob2/VhRGumN03U6d6rbf0zQ4gKunIGbnFug9N2ef8apiV5ZljlSgDeme?=
 =?us-ascii?Q?0VxwkX2q+oeuRGsqlweCslSiFdUGADMie3n/5vR1e7ctYdvPM7D4NHo07XWp?=
 =?us-ascii?Q?i37Izfed0/osxVx/fUm8NS7v5xZsagmEMAUTHmBRo75bgjYkSjyWzcZZox+3?=
 =?us-ascii?Q?jNZRTimFlujcENoV3UHMnoZrzNkzXSj7y/zq72a2v0b/Wp7OM41e72SSZIFu?=
 =?us-ascii?Q?F49VlYpHrgmCnin6CbG0cnPWI1dxayUCf9dpmUYZNu6CtqGKFebXoRqhk7p/?=
 =?us-ascii?Q?y/P6mC7lSzBV3SLtNliL1E/oKsCVSTwaK+vtB0SQ5CgejXVolCKySOzBOCMF?=
 =?us-ascii?Q?WpT3izLbiPLzLF6p7rta/jbSQxMD7Wo7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 10:30:24.7778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c943b4a-5491-4bb8-44f9-08dcc1031a3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7194

Fix below warning caused by smatch by using array_index_nospec()
to clamp the index within the range.
"warn: potential spectre issue 'plat_dev.sock' [r] (local cap)"

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v3:
None

Changes since v2:
None

Changes since v1:
Change plat_dev to hsmp_pdev

 drivers/platform/x86/amd/hsmp/acpi.c | 3 +++
 drivers/platform/x86/amd/hsmp/plat.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 81d49dee3f9b..1d9f3851dd2c 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -18,6 +18,7 @@
 #include <linux/ioport.h>
 #include <linux/kstrtox.h>
 #include <linux/module.h>
+#include <linux/nospec.h>
 #include <linux/platform_device.h>
 #include <linux/sysfs.h>
 #include <linux/uuid.h>
@@ -278,6 +279,8 @@ static int init_acpi(struct device *dev)
 	if (sock_ind >= hsmp_pdev.num_sockets)
 		return -EINVAL;
 
+	sock_ind = array_index_nospec(sock_ind, hsmp_pdev.num_sockets);
+
 	ret = hsmp_parse_acpi_table(dev, sock_ind);
 	if (ret) {
 		dev_err(dev, "Failed to parse ACPI table\n");
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index a0f2fb6750a1..a843609a7c81 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -15,6 +15,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/nospec.h>
 #include <linux/platform_device.h>
 #include <linux/sysfs.h>
 
@@ -78,6 +79,8 @@ static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 	if (sock_ind >= hsmp_pdev.num_sockets)
 		return -EINVAL;
 
+	sock_ind = array_index_nospec(sock_ind, hsmp_pdev.num_sockets);
+
 	sock = &hsmp_pdev.sock[sock_ind];
 	if (!sock)
 		return -EINVAL;
-- 
2.25.1

