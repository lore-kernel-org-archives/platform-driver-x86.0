Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E733B196D9D
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 07:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730964472; cv=fail; b=ZmzqeGILP/1JVt2kppY1Cz6xQH1I3xqnskcsfTZfOFZggoHbGHt9sfOQu6PJ8ynwmraABZDrTCyTnAmYIaJKBhCXhH/+BzhKRJfNSEjQpqgqLOFnYGnWXwODMP3lYBD+4LemNd/djuo/Gd7L9FJHNsWPkSxRGy0u2fsbQYQXZsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730964472; c=relaxed/simple;
	bh=v/Lzk6bexhipwd+kAWwSfLfIUuXdxNLXJxjwJ19qmz8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ive83R5mtsY5NtWMpj31EWJ+DJTIascm4K1cchXUAWjkY8zVn3vMqUA3RpcAu2/qrSk3pPzo3hLCT8aMXsjjXQJJtT3Gg2L5/Fp2wivZyOXHv8KSW0c9dRfqPckyWSaIoasQmHuJ9aBo6yDhHqj8eHi4Zzl17vKhdnIDg5ETcc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UX2xTPvN; arc=fail smtp.client-ip=40.107.92.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UX2xTPvN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5LCy4HQlY5oUDAMQdcPnGQryp0LGuCN1rxOjxAlbwXserLITIj8l9b8jrvE7iLMVLklO6UTiIopWuoPl4HI9hZQx/anDqVZMsK6AiLNK8fisi1tVlfrT6P+PN0sXd1dg8Xexk7spzXF2STsVve3dgeZkSA5y479Q4OKSuddFZhuUjKCKJfKWlIWVBeATY7ydbN/7MNTVxdYKG5/UfSsdc8lRK0Oo2LojnDLk90sfdPQjYvX9Ld+PGjA4odYn1EByMyzMx/v8M7+oqnbxWXk1JgnOvSCq2Jj0npgukNqpbkE+GMwxrnUEFEdCVyyL2C7c8lpWONbzCHwMfQdZuJ85w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgrhRWs4QK7gHFw1rGcUrnn+rwx9xbzSl69zuWj/bck=;
 b=l4VcjbVzbDBzq5t8zT3Km9MOuyg+dvkDWVgNafLol0LNwY8h7PMQ9QxS0Gy/IDKciuh+pfxvmE7TWRqFpbT5V72IZ7O0UaDb+wx3tjn2ZLKWW0PpUlkumRMNAaHPgCpavNaxQLx5vcRu3wIrIvpB2o7xBOH/OTH2JjzOVt39ld2cR/nQTA2UPhWd4VZR/tkoRwmIvS+7uvQWJTuVQ9YVAp1ihSKXXgyhxpQ82Jg3yyp4XAfcXGE02Ii7kyshdTEA43xgoal70S00jREzDACMh94vk8alvA4vQOezf8BmEDcn9xagetEnHjrwG5ZlheL9pFCXed0BsbBfcLs/uAELSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgrhRWs4QK7gHFw1rGcUrnn+rwx9xbzSl69zuWj/bck=;
 b=UX2xTPvNTLyrb3R9hSQgKsGzKnGa/zLsj/GGfBjA9MzuDDO2rO2tPZBN30jdgR35ACRhNgGo1Pb2XPujnQGmwPNHKYPZi21b8tlJNfoCyQ3Ug0ON/1zZZxNQrfcsr9urtgeOPFQgccbo2GxfxxTDmK4blzIyebiaJl3/39SKsJs=
Received: from SA0PR11CA0156.namprd11.prod.outlook.com (2603:10b6:806:1bb::11)
 by CY5PR12MB6384.namprd12.prod.outlook.com (2603:10b6:930:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Thu, 7 Nov
 2024 07:27:48 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::4a) by SA0PR11CA0156.outlook.office365.com
 (2603:10b6:806:1bb::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31 via Frontend
 Transport; Thu, 7 Nov 2024 07:27:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 07:27:48 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Nov
 2024 01:27:45 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v4 08/11] platform/x86/amd/pmc: Update IP information structure for newer SoCs
Date: Thu, 7 Nov 2024 12:57:11 +0530
Message-ID: <20241107072714.943423-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com>
References: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|CY5PR12MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ea0a870-8a37-4f32-a960-08dcfefdae2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hF6ooRPk4k/WDdW4eNdnEhNEJwnv4rndwbtBhsHN10Az4dWLdGfKtSfhJ/6Z?=
 =?us-ascii?Q?IpPGGvfI53O1qcBeSkioxXzt99R9nrDR5fx/scxcmSfJK++C6/HIw3CDFNTv?=
 =?us-ascii?Q?gKIZdTnYR+rkvOqp3eQ3ocEaN8iITJC2CiCUCTx1Mc/4+dNF/U4DzGMJDxwk?=
 =?us-ascii?Q?H52v0e2tFItXHUD84sZmfK9YZYVJA7dfXW527Bm0B96kkpr+29ylCDJNc9z2?=
 =?us-ascii?Q?1fgglfOlCyhU5vNIFP5KGWsByZGl1G6Wy+i/FuG8oLubNmC8SDs/f7lKgthN?=
 =?us-ascii?Q?htitSLDRVKR3+QlIE9y301xOE0Nf0SLmjLLLPkNYVVqaq58iOuMxlUM7Uo3P?=
 =?us-ascii?Q?HG1xdGmVkEHAEKaTkgXUOHYHV9y9p+77HuubgecUEZlQmtFoKqlSzPY7J+1H?=
 =?us-ascii?Q?amy+rLBEoZg7MpQTla3Ul3VSqi4C2bVCWOy5rWQLxE8Py4OYFBQDLK5ln3/L?=
 =?us-ascii?Q?4VQ00GSvxrrRw5xMiB+UR1UOcJnojnbbjkAEW/t344uTfsHc2qT0AyS+PHob?=
 =?us-ascii?Q?/9f9k8ouiXvMC6jrONe8Zv98Td/NzKyCxEc0lWB8yizfHNNai16kfUWUhLFJ?=
 =?us-ascii?Q?NQvkZ2PPYfAS/wmbTsG5uQVJQqVfJuERoQIQJ+/t4agcOVljssI73Qn6/CCd?=
 =?us-ascii?Q?vcKXYR1EEr2xeh174tj5tD3vDbto+HUGb62brnqFwT7h2BfTBpTbkZ070PGA?=
 =?us-ascii?Q?8XVJz+IqS/JsF8UpPGhLc28lypatDNFDAZoLkrhqdDD+jfzXyakNKdzZl9AA?=
 =?us-ascii?Q?+1CWZ9J0vooYhovz025OELN63fTQdv22TnT4ZmDnOwHAgHSgb7lozhF1PyHj?=
 =?us-ascii?Q?JegJxDyP89wKRrOCW0ht8pGZ8Zrkr8chMWxe8vNpDTeydh2vqogcfZ8SnOHk?=
 =?us-ascii?Q?KfYDZbb1dgyLLydFGf10SZ2DOT5646dJudE0JaYYbs1azpY+vlCIcjFT/kvs?=
 =?us-ascii?Q?bMUQZeE41zCPfmlAVZHeV1JCEO70pa44m5vIk/dAfJw0h4fBZj5scMynGkf3?=
 =?us-ascii?Q?c/BAivCQTdKCVTYKbq42YOLiRh65W9BoKoD5pwyZpfApeKgIYhbfGn53eAKj?=
 =?us-ascii?Q?4EgnCLQ8JXh0dBQukbg4z030Ekdg+vvdr+Tu+RycRPGjoWHxmBlL0SemsEv3?=
 =?us-ascii?Q?LRmO187K7XW0IJF30AkC/oORpCjNPNPkdXKeO5jY92E2nY1WbMMQHBqbGAF7?=
 =?us-ascii?Q?hXR0uY3O+2Y32GqireuEr6yntc0K5sWtnWk32c0O+7ONXqqY6zb+jQ6JcxFk?=
 =?us-ascii?Q?hGeQEKgtWD49Ro1LpycOSQUeHU9gY940YpaCJ1LLU7w4u1HXwAJ+uqZk5saK?=
 =?us-ascii?Q?hViRPSLS3kG5BYhbXacISkRrFJvmBtuVaK09riqeup3QhxqrBBNhc7y5sv6F?=
 =?us-ascii?Q?roip5569gIs8mPtpsLxAGXAZaYIsD8qthlWFmUU896kudiRw2g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 07:27:48.1370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea0a870-8a37-4f32-a960-08dcfefdae2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6384

The latest AMD processors include additional IP blocks that must be turned
off before transitioning to low power. PMFW provides an interface to
retrieve debug information from each IP block, which is useful for
diagnosing issues if the system fails to enter or exit low power states,
or for profiling which IP block takes more time. Add support for using
this information within the driver.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 42 +++++++++++++++++++++++++++---
 drivers/platform/x86/amd/pmc/pmc.h |  1 +
 2 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 7c3204110bf8..5b99845d0914 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -95,6 +95,34 @@ struct amd_pmc_bit_map {
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
+};
+
 static const struct amd_pmc_bit_map soc15_ip_blk[] = {
 	{"DISPLAY",	BIT(0)},
 	{"CPU",		BIT(1)},
@@ -162,14 +190,22 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
 	case AMD_CPU_ID_CB:
 		dev->num_ips = 12;
 		dev->smu_msg = 0x538;
+		dev->ips_ptr = (struct amd_pmc_bit_map *)soc15_ip_blk;
 		break;
 	case AMD_CPU_ID_PS:
 		dev->num_ips = 21;
 		dev->smu_msg = 0x538;
+		dev->ips_ptr = (struct amd_pmc_bit_map *)soc15_ip_blk;
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
-		dev->num_ips = ARRAY_SIZE(soc15_ip_blk);
+		if (boot_cpu_data.x86_model == 0x70) {
+			dev->num_ips = ARRAY_SIZE(soc15_ip_blk_v2);
+			dev->ips_ptr = (struct amd_pmc_bit_map *)soc15_ip_blk_v2;
+		} else {
+			dev->num_ips = ARRAY_SIZE(soc15_ip_blk);
+			dev->ips_ptr = (struct amd_pmc_bit_map *)soc15_ip_blk;
+		}
 		dev->smu_msg = 0x938;
 		break;
 	}
@@ -337,8 +373,8 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
 
 	seq_puts(s, "\n=== Active time (in us) ===\n");
 	for (idx = 0 ; idx < dev->num_ips ; idx++) {
-		if (soc15_ip_blk[idx].bit_mask & dev->active_ips)
-			seq_printf(s, "%-8s : %lld\n", soc15_ip_blk[idx].name,
+		if (dev->ips_ptr[idx].bit_mask & dev->active_ips)
+			seq_printf(s, "%-8s : %lld\n", dev->ips_ptr[idx].name,
 				   table.timecondition_notmet_lastcapture[idx]);
 	}
 
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index 69870013c0fc..f6d9a7c37588 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -62,6 +62,7 @@ struct amd_pmc_dev {
 	bool disable_8042_wakeup;
 	struct amd_mp2_dev *mp2;
 	struct stb_arg stb_arg;
+	struct amd_pmc_bit_map *ips_ptr;
 };
 
 void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
-- 
2.34.1

