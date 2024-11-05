Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D8C15C144
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 17:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828286; cv=fail; b=a6E+b62GvHTbuLRPB7PGoY5HHTGIryyL8h/sjPlPDzHDSpd52jL2MPiB7NyOZ6+KLIzejy50jr1QwU1U2N7cWOopldlKa0Qf6gFk/lOtH/bPuDCYCsOsr8QgYEVkC9zt4g1bcg2GUlNaX5yVDjKsfSCIUBXQ0sOJQ7pzWaYtnIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828286; c=relaxed/simple;
	bh=iMuqLDE8AiznDwXnE+85YS3+URLkrt1OP01qY0rGnT4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TIQgPC7LC9Pn9PrT1YdtxNlNIDCo6nuDLAp+j+eNgU7fU72UxGfljL3oXDtDZ1deOgX8TmwwJfH58wlySQ5eYpyhxenWZsD0trp8hvC8JTS5hY31C5nC4saVLWnaQMGxwi0bCFBYpHvRHX85CHOSzZKqyty1qSfooLVcafLmnO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ltb6jJMN; arc=fail smtp.client-ip=40.107.220.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ltb6jJMN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDTXWBuUTq3g/h7thc83qxyAACH8D/RDkSD6/5ZMOap3RsyNAQMYO0Risysok48c0Tg5YfXU7EPPqI72TUPfntLYpUsbx1F9k00448Wxf7lqUITNDwnL07hkqmWOOyRUPnWsEmEW4M5W99mqYMhlj32PjVSlU08Bz4DySXaahjEsLfuSzgrJWy+NDZXICfPsoFJsdHWTjOpTcxZOx3k/ALyr+lSa6wHRwQxf7bd00TcegqgRogYYv5cE7r5en2so2jt+PeFFEdnt1AEqfp/PvC53PRla5lb37O6par52d39ARkVv3+dgXQKiunId3K5ZFPJX+PJoTsp/qrSYCDKG5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXqjx+7bIxsJBducZiPf4EtiQdH9e1D7ua/KKJVY00k=;
 b=eOvzCkSKdlWQv3qgogR6fgn++hYhBUZyICkA1xwquB0v0d/gyI2xx7/2M9lGH5A4HVG2h1CTWFCkKxii0KhI13yy7gUS2BAzUT3NIoFpMtIXU7w/w3BW0Sj5c5x42qZQ9m67fGsWS3X5bSOuiP1ORfgRrV/2zL13qjCKPKzf5r7Bh6I48AA3kUzKLo2WANUAOOPSZakGYiYxtXJhKXCE3zeOCkAJCIEqeV9hW67GHcMCI9ennK+sOxDETH+A9HL5PM54RJsWpeJeSlS4fFwgtznV+fiKwvM97D3mShmCiv7JsNzuKRWrH5DAXo7RseUdceKo7pOncZo4DsEXrceYug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXqjx+7bIxsJBducZiPf4EtiQdH9e1D7ua/KKJVY00k=;
 b=Ltb6jJMNXuM7wJ6VC6lGhgl147s6Gf7CQOcC5yqToQHySdJHyxpEZI3JAUDUfCNXWk4OhCRWhpm+LH4G9WRDFeCshHqn4AVIqXve8WD4Nf39eZl4WdU728MlTp40XOJLW8M5VwjbwY0X8SsXuff75RYR5ffwCuSVdAEta8OyFm0=
Received: from SJ0PR13CA0087.namprd13.prod.outlook.com (2603:10b6:a03:2c4::32)
 by MW4PR12MB5627.namprd12.prod.outlook.com (2603:10b6:303:16a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23; Tue, 5 Nov
 2024 17:38:02 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::f4) by SJ0PR13CA0087.outlook.office365.com
 (2603:10b6:a03:2c4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.17 via Frontend
 Transport; Tue, 5 Nov 2024 17:38:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Tue, 5 Nov 2024 17:38:02 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Nov
 2024 11:37:59 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 09/13] platform/x86/amd/pmc: Update IP information structure for newer SoCs
Date: Tue, 5 Nov 2024 23:06:33 +0530
Message-ID: <20241105173637.733589-10-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
References: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|MW4PR12MB5627:EE_
X-MS-Office365-Filtering-Correlation-Id: 57348afb-f697-4ec3-712c-08dcfdc09920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VWJFDLJN8CuE+gLpY4mSZQuK4zPWiUMlJou1L16YDv4KD5MtsapwQLDKEKkq?=
 =?us-ascii?Q?N8vPcTavUCzbzhgd+66Jv1nAROKOtS3a0qbPjM84wKWafUPPGBlJlnyuJ4Yu?=
 =?us-ascii?Q?cBK4cweJifbIMx9lLJvfX8Vtmvd44KQaoil+OlSEs65U3eOi6Usc6+D2/0+4?=
 =?us-ascii?Q?e7OSqdmcUgkts+wEBS2bUf8c2tLQ2F6N7W4BDSNMS1iRsZ3fFzLuENawBjGW?=
 =?us-ascii?Q?7L2rmx+uQ3A4D5AmnMPc/bF1/XAVYLZOnWjZzPCybT5wIlnY0adwD/5Scrzv?=
 =?us-ascii?Q?hzp8DErTTgQIVntX1owIZ6sp8z5XlZ9CUek2AB2gaMR3K4FqZUjCId1lOXxT?=
 =?us-ascii?Q?n58UC+4HP3KBwqLdc6sOopiy0XG84CquHLEyBzvfDeUSlXLtBp7JAlazHS2V?=
 =?us-ascii?Q?5yrp8xO4s0nmJDk/jHjPSFY/ZsqJnJpq/eJRgHglrK2ZOt8qHEQYGoGZ1VIr?=
 =?us-ascii?Q?PiIggtyGMIPntLRll/oB4E01q4gZPGy/JO+H1UaS3fmBqmn0wr455BztiFhD?=
 =?us-ascii?Q?Ros8B4YMPcG3rzDHXulOy1PEKT4Ns8va3b7DMrwo7LmFvb9PYMSAOixcQdW+?=
 =?us-ascii?Q?dWBTfea7GYzq4IBVOMrdU1ieQYp0vOUs+naiP2Y7xVG95bo9kUrtiQ0cHV3j?=
 =?us-ascii?Q?fGeVwoWkF+Ln1T3GBl8lKzvyFq5QbI1Pe+ItaXOvzGrgar97ChRu6bfjy4hB?=
 =?us-ascii?Q?Q6kG885ywtZcvuMB3se9+yMzjfH537Htryq2RjtgxYn8bIEvx+Kx/5bFKF8V?=
 =?us-ascii?Q?mxGtcwjnflVu7DsrtA7rOjETFcZhr7pyth4q9gtrdHnDiOgP0y0B5KW7jvt1?=
 =?us-ascii?Q?nJKyJ7ZGBpbZe8KS7o0V/JRcGN3PUt6hG+xeAhWJ24WXnRqlZSvUnQ5ijhRO?=
 =?us-ascii?Q?OE5zJetJg5AUpdvAcdKmtT3HaWN8q68MKLch/XiOq1OwcYNn+GemYJ8+WfXB?=
 =?us-ascii?Q?tElZY3J7irwAKJFBr/2BUNwfm8+EtWCqxBzxzk9zMSCt0F0f27eQ7LcC4Tow?=
 =?us-ascii?Q?JXs+EoClg3gqEC9rv7QcX6fb+F6BXkQzRA3ZGUvDzTrbHs7EWViKAXym22tD?=
 =?us-ascii?Q?zqkne5BiiuDLa0+w+Qfyo+MRecy6B/W1WQotJkGHZPNWbeHr7Kba2O4bOwUS?=
 =?us-ascii?Q?sELiQV7JEXYE5p70HWywVGjP2Hg7c+7aDfWAssWRj+kgFBZD3qHvXkAOgVyt?=
 =?us-ascii?Q?WjeOU1KbUJLcFIxrAZpZVmBWLUvAKAVwuV/Ksdu71SFewUNRjKNS3OumMX1w?=
 =?us-ascii?Q?GgWHNhpHxw17Dw0O8JQnFJIcm8tHsn1cAnjQPj6UNzaSq0kFM5tTJOBDtart?=
 =?us-ascii?Q?zJtZNXCx+iBSTODbtfJa1IwppO61GxSyAK6vrX1jWlpfTqKWv/LEMxWo6m4d?=
 =?us-ascii?Q?0h5Db/wommCO+z/XqO1uCd7lIbBAgWw9NUY1Q4ltlzv1H33VBA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 17:38:02.2793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57348afb-f697-4ec3-712c-08dcfdc09920
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5627

The latest AMD processors include additional IP blocks that must be turned
off before transitioning to low power. PMFW provides an interface to
retrieve debug information from each IP block, which is useful for
diagnosing issues if the system fails to enter or exit low power states,
or for profiling which IP block takes more time. Add support for using
this information within the driver.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 43 +++++++++++++++++++++++++++---
 drivers/platform/x86/amd/pmc/pmc.h |  1 +
 2 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 1f0ddf5440c3..5ca97712ef44 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -94,6 +94,35 @@ struct amd_pmc_bit_map {
 	u32 bit_mask;
 };
 
+static const struct amd_pmc_bit_map soc15_ip_blk_v2[] = {
+	{"DISPLAY",     BIT(0)},
+	{"CPU",         BIT(1)},
+	{"GFX",         BIT(2)},
+	{"VDD",         BIT(3)},
+	{"VDD_CCX",     BIT(4)},
+	{"ACP",         BIT(5)},
+	{"VCN_0",       BIT(6)},
+	{"VCN_1",       BIT(7)},
+	{"ISP",         BIT(8)},
+	{"NBIO",        BIT(9)},
+	{"DF",          BIT(10)},
+	{"USB3_0",      BIT(11)},
+	{"USB3_1",      BIT(12)},
+	{"LAPIC",       BIT(13)},
+	{"USB3_2",      BIT(14)},
+	{"USB4_RT0",	BIT(15)},
+	{"USB4_RT1",	BIT(16)},
+	{"USB4_0",      BIT(17)},
+	{"USB4_1",      BIT(18)},
+	{"MPM",         BIT(19)},
+	{"JPEG_0",      BIT(20)},
+	{"JPEG_1",      BIT(21)},
+	{"IPU",         BIT(22)},
+	{"UMSCH",       BIT(23)},
+	{"VPE",         BIT(24)},
+	{}
+};
+
 static const struct amd_pmc_bit_map soc15_ip_blk[] = {
 	{"DISPLAY",	BIT(0)},
 	{"CPU",		BIT(1)},
@@ -162,14 +191,22 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
 	case AMD_CPU_ID_CB:
 		dev->num_ips = 12;
 		dev->smu_msg = 0x538;
+		dev->ptr = (struct amd_pmc_bit_map *)soc15_ip_blk;
 		break;
 	case AMD_CPU_ID_PS:
 		dev->num_ips = 21;
 		dev->smu_msg = 0x538;
+		dev->ptr = (struct amd_pmc_bit_map *)soc15_ip_blk;
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
-		dev->num_ips = 22;
+		if (boot_cpu_data.x86_model == 0x70) {
+			dev->num_ips = 25;
+			dev->ptr = (struct amd_pmc_bit_map *)soc15_ip_blk_v2;
+		} else {
+			dev->num_ips = 22;
+			dev->ptr = (struct amd_pmc_bit_map *)soc15_ip_blk;
+		}
 		dev->smu_msg = 0x938;
 		break;
 	}
@@ -337,8 +374,8 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
 
 	seq_puts(s, "\n=== Active time (in us) ===\n");
 	for (idx = 0 ; idx < dev->num_ips ; idx++) {
-		if (soc15_ip_blk[idx].bit_mask & dev->active_ips)
-			seq_printf(s, "%-8s : %lld\n", soc15_ip_blk[idx].name,
+		if (dev->ptr[idx].bit_mask & dev->active_ips)
+			seq_printf(s, "%-8s : %lld\n", dev->ptr[idx].name,
 				   table.timecondition_notmet_lastcapture[idx]);
 	}
 
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index be3e6b35433c..32b02ba95eeb 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -57,6 +57,7 @@ struct amd_pmc_dev {
 	bool disable_8042_wakeup;
 	struct amd_mp2_dev *mp2;
 	struct stb_arg stb_arg;
+	struct amd_pmc_bit_map *ptr;
 };
 
 void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
-- 
2.34.1

