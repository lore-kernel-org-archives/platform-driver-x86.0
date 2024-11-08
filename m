Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542B21D0E2F
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 Nov 2024 07:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731049749; cv=fail; b=hBlnlKBLmwR+ZxM7TCf79V9ysB+93qa+FfhSTM8Iz6odz6H14OEz2tcyWxZMM7t/gZ3aR9Zy9rjfWNDASAu6sn/EaV+xkz5NbHKSckIFRH9nKuPQapdINjeLkAlCW1R8xrpNY0U3dAiF9BhK8r9y4x0BuRiU3vcif/EYqgMBSqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731049749; c=relaxed/simple;
	bh=dIRMICjVE41WnEcNmA04aGSkgV3LIpyxFxvb73NTBas=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ohN+MBbMZFiDctAbJedgGEoLz9BXJje8TS6SZg9EN+TD5MiQaAIXbhLmX7dNpcSiaURVCTL8KBGOfsMN8Im/V7NUoj+KSY4H96NDj0L0av1Jv58zieKCxx0Tyu7EX8hhAciPAm6wbV/B4hIq57jXmJHC4gkqAi7/c2iqSWaadtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ydxkOWlf; arc=fail smtp.client-ip=40.107.237.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ydxkOWlf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D6CuCOejdOWCFVfkLQkfBTtQfzo4Ay57VU4Vsjk9UhZjwAqOmJfT8ck6ggBlLyaS5U+TEGcqaPwfpLvfU4Z14IMyHce1occ4M0VjViB+KQsGKx2PHWZzr1tvKsDFwWDKYVRdosTBKk6FOn98HBF8EsOZWj3IKfPQhxBi8lwlvbzyxPAl7E8nda1CkgYd5WUbeUw7PqBAdrIL4r9xXf98FhN7ouDHZsKNjAna8jQ6kpd0VpclQj6qp88BnGNOZDPJLqISKc9tSLVQ4TuKOf4+bahwM4uZhfaJ0op8EtTJSbfC4w+JccEokLYL7+MUkxAJyCs4xyEIC04+DAF3mfi+Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0ANNwIKMCZrDXEfj9MZ0QXxBje4DoNwgqrrMKT8N+w=;
 b=d5Lm4S0ainpDdmdIDlRI0tfOB2MH5CSa7FQP7qJGXfN4rLaTrORDnV8LKRHFPXRKoeA9u2fX8wjC9ZMbHkgzlVFboX6vhs7fh8z8u92Lq9y4gWFugXnNYUbxnbqn223DN3X0zVKFdG7aL8kTapdpTVX5yDDXzlXDaBwCJeHXhKrYuYURmCrRv9zGEFuTspS7lfiX+Il1aHZOJvbulwzfwKI9vWh2+GenDJ8OEOLEjd8wOlWB84naVeHaXNGFxSVt70ZFELbefAyOXE8omDB+EF48AfDmrJc8VahiDeCuIpZHxiKfPGOau7+iaBoRyvA5Qa8dMDblDigMF1FPcKZSrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0ANNwIKMCZrDXEfj9MZ0QXxBje4DoNwgqrrMKT8N+w=;
 b=ydxkOWlfxOpZBnQKD9F4WRsFCSuKrxqVVO7qakA2Mx9q2d84aNc3XUFgM3bH0PkG/dUibaPVAnuPZuYHp/sd1f4Wc1EGnKPYdDt6iXyG4icA8kNZvUh9RDVbNQgjamqjB1GEdPMPpDCrLzkXzijxMz7e7u3ouDJZ3YOlH41a8UA=
Received: from CH5PR05CA0005.namprd05.prod.outlook.com (2603:10b6:610:1f0::6)
 by MW4PR12MB7432.namprd12.prod.outlook.com (2603:10b6:303:22d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 07:09:04 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::92) by CH5PR05CA0005.outlook.office365.com
 (2603:10b6:610:1f0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.10 via Frontend
 Transport; Fri, 8 Nov 2024 07:09:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 07:09:04 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 01:09:01 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v5 07/10] platform/x86/amd/pmc: Update IP information structure for newer SoCs
Date: Fri, 8 Nov 2024 12:38:19 +0530
Message-ID: <20241108070822.3912689-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
References: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|MW4PR12MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b18bc9-5fa2-4bf9-7963-08dcffc43a93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HfNCV7qLDTKnt8YRIhZq+A4xKcII0QjAFA+kqoBOOsBqMNze35+D6wQXmUiH?=
 =?us-ascii?Q?6IPElsozshs/PD7J8CDc3r9EHvrU12SSLtqVm+Y55wiYGdS33LsalZFvRgot?=
 =?us-ascii?Q?5LS96E50rhBlr4XGm1KnEqM2JHcEtQQ98TN0hWO7YcZme8kyPOtGgHuo79H8?=
 =?us-ascii?Q?gDvB5JEFdpOfJzfQAfzhvMy1cIdYYY6FDHM2rAVoKlPDPL6SrZ408Dd1WtIl?=
 =?us-ascii?Q?IxmPW6MbaIZRYFe+DuJxG54wkpk3h/fgRpjDaDoY5HWXce4wrlCVjh+ZX2ZT?=
 =?us-ascii?Q?1vmGAg6IzG0UlvdpBJ4kTn+pYpc0Uuv4h7OBXvT9DidddqCqvyZUGonFPXzK?=
 =?us-ascii?Q?wo80qKZrlQt9XUW50H6ppXOU4LV1xEudgIilxZenkBlR8hDKgfSRTs2AWXAe?=
 =?us-ascii?Q?rISP1W5Ib66CEzxKyzjwwggCO+XKmQirIkY6Qi5mFg6y9wgNINA6WU3BQcRZ?=
 =?us-ascii?Q?dqXcNc01Yxx8ni+MZHRSF9uaUJLurCV/7LBaz612IQIakVgHgiis0xSJtc26?=
 =?us-ascii?Q?27xkHIoAXrilYv0xqi4KPRzQ5xzhwXSE1h23r8SpKjpokNqA3gdXCatvcF0P?=
 =?us-ascii?Q?rHfwr44dsv4bpYinJWg2rIdNoZ0d7ioRFKlA8+x5KTb67b87npdNphsxFzXz?=
 =?us-ascii?Q?Gcgqty01lE77zB4qKnMCU1jwpQQJY0LqDDbAuyFbpTrO8wf+cUUUfan1935B?=
 =?us-ascii?Q?aW3Gu/2aIvYtWxzctlvrt6WifHMIQEcKHOZHrrgi+6YTwdeoqGqk3NbgM60D?=
 =?us-ascii?Q?cJjh3u8ASfxnnVGWIYueE88xF/SEAt2slKliswlOVZTHcZS08q7zOzb7tC1e?=
 =?us-ascii?Q?gZvb54nnUk9IyNH8hV4qKs0p8d9GB83jcKPgGO8gkysu2s0dd4vVoP/zrmVv?=
 =?us-ascii?Q?CjbgBlsa3YGLgKbUHKNv5yjqXaZMlUJ787TayQROnMSS29NF4z3iJJZRYq61?=
 =?us-ascii?Q?JFy6tGQ9TCWwzZDFyeNGMac+d7kvAzL0SRuNLMg8u7xYHYlIMu7jDGmEpPs2?=
 =?us-ascii?Q?YylrxVhSixWoT4UX+XpEuhvucrrjzjqbziBD9kBoAI5959HqBOB2/DkJcWQk?=
 =?us-ascii?Q?X3QAH7ucxjSVnAzDoBa7teK79auGBhgGTJh41ViIPXk9kc4orkB4L5grlslx?=
 =?us-ascii?Q?ytjJADmOKVBIxObh9/7CIxOI51s0IuabgB53fG6/Yprm3UdERPDwH1NfShTW?=
 =?us-ascii?Q?PLqWdVAp7scke4sF0jVRCTRvDqF/rCZEKbTfFwViiG+rP4VaTWwqlSQstrsf?=
 =?us-ascii?Q?UsTD9mcQkq+q7pLjFzQkEYLiiiT7as2e8sDPqspopr4bAIIvvhuRIPkdD84z?=
 =?us-ascii?Q?NLAO+ApuHfWE+1vBCToC6gUp3MqhuLRGR3hNrA4B6Y2oWIMeuHXOdUYWavYN?=
 =?us-ascii?Q?0SEl9H2+CTSPrxJgm/4wdSnCZAGK/7GUMrNW5G4Wn8q9yyq1Ng=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 07:09:04.0246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b18bc9-5fa2-4bf9-7963-08dcffc43a93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7432

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
index 3a30809f187e..84b3eeab4f20 100644
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
@@ -161,15 +189,23 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
 	case AMD_CPU_ID_YC:
 	case AMD_CPU_ID_CB:
 		dev->num_ips = 12;
+		dev->ips_ptr = soc15_ip_blk;
 		dev->smu_msg = 0x538;
 		break;
 	case AMD_CPU_ID_PS:
 		dev->num_ips = 21;
+		dev->ips_ptr = soc15_ip_blk;
 		dev->smu_msg = 0x538;
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
-		dev->num_ips = ARRAY_SIZE(soc15_ip_blk);
+		if (boot_cpu_data.x86_model == 0x70) {
+			dev->num_ips = ARRAY_SIZE(soc15_ip_blk_v2);
+			dev->ips_ptr = soc15_ip_blk_v2;
+		} else {
+			dev->num_ips = ARRAY_SIZE(soc15_ip_blk);
+			dev->ips_ptr = soc15_ip_blk;
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
index 2c640bd8de82..fd2b19d8e5b5 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -62,6 +62,7 @@ struct amd_pmc_dev {
 	bool disable_8042_wakeup;
 	struct amd_mp2_dev *mp2;
 	struct stb_arg stb_arg;
+	const struct amd_pmc_bit_map *ips_ptr;
 };
 
 void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
-- 
2.34.1

