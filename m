Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011054.outbound.protection.outlook.com [40.93.194.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA97D2D8DBB
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Nov 2025 06:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762843110; cv=fail; b=J3pMRe1NkEvWStQB8yLfCsI0eGSaNxBpprB4L7oaKzWjUXUqD3DPqyz8Ga7R9Z2fqExtt8RLRMJYW58Mk8zyXukeGvil8dG7E2MFNegGI/86OJkZkTTLmE/lyGGoXZFZlXvq4atYiN4UrwZPKmALTZcqY/CFbOUtzPufSg3l0bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762843110; c=relaxed/simple;
	bh=MrclugJkjfQffINI6k9mQzXP0T8bInGsNPbws+urjLo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R0auIZj6kYBdK6LJB0f5M5YpsAThwF9oH37U7/6sCMD06QQ6TNQFLOLZFTvqros6cyv2Zb7GMdqS3zZJbk6FI1frIxojhlL+GVPZ1xi2AFbvUb/MtI+ABmHyXtDqF5gc8B/ASSRHlUQgEUBRex5yMoHtRHcMKqg6mQk5s3Eq/5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1fUGu4Ii; arc=fail smtp.client-ip=40.93.194.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1fUGu4Ii"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o29ZgWi3BkXrh/t2NfPVdf0mSO6+oUstB9f1YBeoOp/NJkEasSM/F3jQspHPoH+hFE28DIfnU6+Di+ojIzRSJyHQdN5Zz9jnQOVNMgfnE5lrDBvXHwGmc07KVSbYplj6Z/LXxAxBVYNHmb2yLngQVk4/EmHt5xUB9ug+HMZwXB4HmBTodEn9fz5Ap7Fv1y8IxeKxNFj8cjSWveDBNcLSyRdLzpYJB4PVvSkeJK9Q3SaKgrG9kF0vJMHPexBQnbBTWrZX28cwcKuALZrL01Ag7a5qEXY6dKp6i27NVw6AHV4uL1mhIlXX0iJCefshKJaPna27Bh4v85X5wHm6WxMIzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAa0KSF1/IXfgH3psq0a3idJn3bEp7dKsoeGKY1QaB0=;
 b=SYPfCJz357MKBwv3hBIHvoJIhw88W/t2sAFMCj6AzLLCRygOdLQ/uVFhNi8FSGvxYW9/kFXtKqUWGdw185vwwdhzAPzm099DB3Sf9vy7QTKp3YWP0tm4EHCAGU/wOh9zpGqSRahhIGDf90hcANxnb4KcdC748qyHpw/wYPi90ymOIFDXk+dblXhxFFSMLX8w0DD5Gsr8bCfKdRn3y8wUaqJ8Dk+NhjComI/2OcUUPhH8oqJQZU3Lr1J30Z54h8mNGB49OFHJvkiE5YlEULinps1RDVnHEdY7h5gouCze1jeygecM2/jL1dFKfYxczjr1k1yBTyzmcREDkOQrBLpFbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAa0KSF1/IXfgH3psq0a3idJn3bEp7dKsoeGKY1QaB0=;
 b=1fUGu4IizF717q0Y8Z60m6+Ah62sKpxzclrJeehUH8mm3FCcfol76JuemZtYeIgByweQDwws7eGeQIrZX9Zn/9TxN+Io/kJlYuybqdmvoIw8DsYo9J/Nj8uR+2zbruXqQUvE+DSzjIwg982PRswykbHO1TFNhwALB7h8aPw/ZLE=
Received: from CH2PR03CA0017.namprd03.prod.outlook.com (2603:10b6:610:59::27)
 by PH7PR12MB5736.namprd12.prod.outlook.com (2603:10b6:510:1e3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Tue, 11 Nov
 2025 06:38:21 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::18) by CH2PR03CA0017.outlook.office365.com
 (2603:10b6:610:59::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 06:38:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 06:38:21 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 10 Nov
 2025 22:38:18 -0800
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <lizhi.hou@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/5] platform/x86/amd/pmf: Use explicit SET_CMD/GET_CMD flags in amd_pmf_send_cmd()
Date: Tue, 11 Nov 2025 12:07:34 +0530
Message-ID: <20251111063737.4156385-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com>
References: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|PH7PR12MB5736:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d8a04c8-c286-4763-7614-08de20ece84c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1AWN7zjqbAnNt5fHTUMd9pXDw1EaPgs96hXp/cBqXF8xtbexLQIa4xVCdQzP?=
 =?us-ascii?Q?Hoh0iYrLemHp20I+Bo8f9I3yUUF3huSXPQ9dmRn+DDjpWQeosWWRiCg5Ixxt?=
 =?us-ascii?Q?79+5JMe1HPp51Z9gA9tPrtN/V4vScfI3qfDjniIBcpCVT09orsF9pO++cFmN?=
 =?us-ascii?Q?nh+03b0a1Whyf3lFgvcrdviDaGwv2iLhcghZDEsdZ3U27F9zCMQBdqMaPXfY?=
 =?us-ascii?Q?dtsgCdcIxuYqu72+89cAlJGJhbGw95DROqPGamsYl8edrRDjc00HkGurRRdy?=
 =?us-ascii?Q?hUnFC5/F5YUmw+YC8UdJYXiGrctWDSpV/Q5RY0+SDND0j5sHIuJUiuPEHxZ4?=
 =?us-ascii?Q?IesTXkXxlE5EpaIWa5rEP82odfapZfdlwEOXNJ5sBrMelGel3OKDI7kcoMER?=
 =?us-ascii?Q?kzhSBvg1zKH5Re+h9N9Iw1Xf7l7wmuS24cwG0OBiJma8D4t3KERzQv2MO3m3?=
 =?us-ascii?Q?UMPNNboujUVU7yQ6j0IV8TeZ30TBOnAbL1RJCsQre7STHzbp2c4p/+MkcOwd?=
 =?us-ascii?Q?MOtVx/ftIFj5df9hb3NeEASa0ad3vm1QlJJEvzmGs5n3PDs677uJCU/69Ctb?=
 =?us-ascii?Q?gLW3LGKLuL08x736rn78uW39h8lnqLIhqlGStZpWOH7pxITdLOvkdo2wGKOD?=
 =?us-ascii?Q?CkscT4mU8i+2BL2T5K2TPbTVClG5XkkP8AC7gMki/qL7kAs5CABeXzbowW4b?=
 =?us-ascii?Q?oyq2aZVeEg2ozh9NmpGxjcutxGMp/zu/gbLegZDwhQDF0cO61q0ggwImTfgW?=
 =?us-ascii?Q?jqhUEU3gVygijmjlVCEHKAD20AjWsOndaCCvlh6nP7cEY/REpNptPkbPN1+8?=
 =?us-ascii?Q?950OmnhED/OwZ0lOpBtL/EkNS3ZuDOsxd5ulBJfW7HSk1wNuhhIjFeuIZaBM?=
 =?us-ascii?Q?BC7aKApqaSlJf9N3zz/eFOfkagYzMg9t6/Qy9eC196GPK1irdKMc2+zuF/x0?=
 =?us-ascii?Q?9xo4fNOJqtvPZeYa/VLkU4OQ25eyOe1wG7O/Ulg6rPn78QYKY12nS6KmmTm8?=
 =?us-ascii?Q?uHhvEjgkqrlM+/p+mdG3auvEAwQ2r4fiyKd8fB+QIiCX4Hmr/H4bqxv6OLLI?=
 =?us-ascii?Q?syqjKkgSaUmaQ17G9iL3QiyhhLtSc4hioKWT69lK/iiT4N2FvjJDXqsqcf2s?=
 =?us-ascii?Q?mHV+I3f1F//yeYNdOqDFBPSvH2IRNEUzyg+c7anxlH47dT5SCXWS4XZCa++u?=
 =?us-ascii?Q?N+GTx/nmsjb2mXYEifsn21Nh2wubvf0jb0g0aDru9Cjok35/mC3gpEqmXapx?=
 =?us-ascii?Q?5WDd+i2z5wnL0iWYRywTFNUj4b4iDryylaBZfk6COFrq7jUtM9LOTUS2ztFi?=
 =?us-ascii?Q?+D3x0/79d4lC3rdum7yF8el94hjKoFo56nazNc705EF/beKo6JD9RoTHhdpn?=
 =?us-ascii?Q?3NyIiWXUqQUvJWhY71P4LF2MdCsl7wbtn9UHjzCVX0MnsMG2M4PHpzxw0DxK?=
 =?us-ascii?Q?yd6orDCDrJSEsaII2PF3QPuCpMr/RL7RdlinssvSwjMetWajQ+soSr+1cqIh?=
 =?us-ascii?Q?lR3og2EuocwVIlZObF1lVSRhANZyatwSeFLeiwgiBp2H0fzj31+YaxD/jLsJ?=
 =?us-ascii?Q?2AxyWB1Glrci9XkEbik=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 06:38:21.4359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8a04c8-c286-4763-7614-08de20ece84c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5736

Add SET_CMD and GET_CMD constants and replace boolean values passed as the
get/set argument to amd_pmf_send_cmd() with the new explicit flags. This
improves readability, avoids ambiguity around true/false and 0/1 usage.
There is no functional change.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/auto-mode.c | 14 ++++-----
 drivers/platform/x86/amd/pmf/cnqf.c      | 14 ++++-----
 drivers/platform/x86/amd/pmf/core.c      |  6 ++--
 drivers/platform/x86/amd/pmf/pmf.h       |  3 ++
 drivers/platform/x86/amd/pmf/spc.c       |  2 +-
 drivers/platform/x86/amd/pmf/sps.c       | 38 ++++++++++++------------
 drivers/platform/x86/amd/pmf/tee-if.c    | 20 ++++++-------
 7 files changed, 50 insertions(+), 47 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
index a184922bba8d..faf15a8f74bb 100644
--- a/drivers/platform/x86/amd/pmf/auto-mode.c
+++ b/drivers/platform/x86/amd/pmf/auto-mode.c
@@ -114,14 +114,14 @@ static void amd_pmf_set_automode(struct amd_pmf_dev *dev, int idx,
 {
 	struct power_table_control *pwr_ctrl = &config_store.mode_set[idx].power_control;
 
-	amd_pmf_send_cmd(dev, SET_SPL, false, pwr_ctrl->spl, NULL);
-	amd_pmf_send_cmd(dev, SET_FPPT, false, pwr_ctrl->fppt, NULL);
-	amd_pmf_send_cmd(dev, SET_SPPT, false, pwr_ctrl->sppt, NULL);
-	amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, pwr_ctrl->sppt_apu_only, NULL);
-	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, pwr_ctrl->stt_min, NULL);
-	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
+	amd_pmf_send_cmd(dev, SET_SPL, SET_CMD, pwr_ctrl->spl, NULL);
+	amd_pmf_send_cmd(dev, SET_FPPT, SET_CMD, pwr_ctrl->fppt, NULL);
+	amd_pmf_send_cmd(dev, SET_SPPT, SET_CMD, pwr_ctrl->sppt, NULL);
+	amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, SET_CMD, pwr_ctrl->sppt_apu_only, NULL);
+	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, SET_CMD, pwr_ctrl->stt_min, NULL);
+	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, SET_CMD,
 			 fixp_q88_fromint(pwr_ctrl->stt_skin_temp[STT_TEMP_APU]), NULL);
-	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
+	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, SET_CMD,
 			 fixp_q88_fromint(pwr_ctrl->stt_skin_temp[STT_TEMP_HS2]), NULL);
 
 	if (is_apmf_func_supported(dev, APMF_FUNC_SET_FAN_IDX))
diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
index 207a0b33d8d3..5469fefb6001 100644
--- a/drivers/platform/x86/amd/pmf/cnqf.c
+++ b/drivers/platform/x86/amd/pmf/cnqf.c
@@ -76,14 +76,14 @@ static int amd_pmf_set_cnqf(struct amd_pmf_dev *dev, int src, int idx,
 
 	pc = &config_store.mode_set[src][idx].power_control;
 
-	amd_pmf_send_cmd(dev, SET_SPL, false, pc->spl, NULL);
-	amd_pmf_send_cmd(dev, SET_FPPT, false, pc->fppt, NULL);
-	amd_pmf_send_cmd(dev, SET_SPPT, false, pc->sppt, NULL);
-	amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, pc->sppt_apu_only, NULL);
-	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, pc->stt_min, NULL);
-	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
+	amd_pmf_send_cmd(dev, SET_SPL, SET_CMD, pc->spl, NULL);
+	amd_pmf_send_cmd(dev, SET_FPPT, SET_CMD, pc->fppt, NULL);
+	amd_pmf_send_cmd(dev, SET_SPPT, SET_CMD, pc->sppt, NULL);
+	amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, SET_CMD, pc->sppt_apu_only, NULL);
+	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, SET_CMD, pc->stt_min, NULL);
+	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, SET_CMD,
 			 fixp_q88_fromint(pc->stt_skin_temp[STT_TEMP_APU]), NULL);
-	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
+	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, SET_CMD,
 			 fixp_q88_fromint(pc->stt_skin_temp[STT_TEMP_HS2]), NULL);
 
 	if (is_apmf_func_supported(dev, APMF_FUNC_SET_FAN_IDX))
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index bc544a4a5266..a659cedc4533 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -131,7 +131,7 @@ static void amd_pmf_get_metrics(struct work_struct *work)
 
 	/* Transfer table contents */
 	memset(dev->buf, 0, sizeof(dev->m_table));
-	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
+	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, 7, NULL);
 	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
 
 	time_elapsed_ms = ktime_to_ms(ktime_get()) - dev->start_time;
@@ -289,8 +289,8 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
 	hi = phys_addr >> 32;
 	low = phys_addr & GENMASK(31, 0);
 
-	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, hi, NULL);
-	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, low, NULL);
+	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, SET_CMD, hi, NULL);
+	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, SET_CMD, low, NULL);
 
 	return 0;
 }
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 6ea5380f3b23..19e413bd89bc 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -120,6 +120,9 @@ struct cookie_header {
 #define APTS_MAX_STATES		16
 #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
 
+#define SET_CMD		0
+#define GET_CMD		1
+
 typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
 
 /* APTS PMF BIOS Interface */
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 85192c7536b8..b10229def18a 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -202,7 +202,7 @@ static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
 {
 	/* Get the updated metrics table data */
 	memset(dev->buf, 0, dev->mtable_size);
-	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
+	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, 7, NULL);
 
 	switch (dev->cpu_id) {
 	case AMD_CPU_ID_PS:
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index c28f3c5744c2..0b70a5153f46 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -192,15 +192,15 @@ static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
 
 static void amd_pmf_update_slider_v2(struct amd_pmf_dev *dev, int idx)
 {
-	amd_pmf_send_cmd(dev, SET_PMF_PPT, false, apts_config_store.val[idx].pmf_ppt, NULL);
-	amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, false,
+	amd_pmf_send_cmd(dev, SET_PMF_PPT, SET_CMD, apts_config_store.val[idx].pmf_ppt, NULL);
+	amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, SET_CMD,
 			 apts_config_store.val[idx].ppt_pmf_apu_only, NULL);
-	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false,
+	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, SET_CMD,
 			 apts_config_store.val[idx].stt_min_limit, NULL);
-	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
+	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, SET_CMD,
 			 fixp_q88_fromint(apts_config_store.val[idx].stt_skin_temp_limit_apu),
 			 NULL);
-	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
+	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, SET_CMD,
 			 fixp_q88_fromint(apts_config_store.val[idx].stt_skin_temp_limit_hs2),
 			 NULL);
 }
@@ -211,30 +211,30 @@ void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
 	int src = amd_pmf_get_power_source();
 
 	if (op == SLIDER_OP_SET) {
-		amd_pmf_send_cmd(dev, SET_SPL, false, config_store.prop[src][idx].spl, NULL);
-		amd_pmf_send_cmd(dev, SET_FPPT, false, config_store.prop[src][idx].fppt, NULL);
-		amd_pmf_send_cmd(dev, SET_SPPT, false, config_store.prop[src][idx].sppt, NULL);
-		amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false,
+		amd_pmf_send_cmd(dev, SET_SPL, SET_CMD, config_store.prop[src][idx].spl, NULL);
+		amd_pmf_send_cmd(dev, SET_FPPT, SET_CMD, config_store.prop[src][idx].fppt, NULL);
+		amd_pmf_send_cmd(dev, SET_SPPT, SET_CMD, config_store.prop[src][idx].sppt, NULL);
+		amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, SET_CMD,
 				 config_store.prop[src][idx].sppt_apu_only, NULL);
-		amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false,
+		amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, SET_CMD,
 				 config_store.prop[src][idx].stt_min, NULL);
-		amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
+		amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, SET_CMD,
 				 fixp_q88_fromint(config_store.prop[src][idx].stt_skin_temp[STT_TEMP_APU]),
 				 NULL);
-		amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
+		amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, SET_CMD,
 				 fixp_q88_fromint(config_store.prop[src][idx].stt_skin_temp[STT_TEMP_HS2]),
 				 NULL);
 	} else if (op == SLIDER_OP_GET) {
-		amd_pmf_send_cmd(dev, GET_SPL, true, ARG_NONE, &table->prop[src][idx].spl);
-		amd_pmf_send_cmd(dev, GET_FPPT, true, ARG_NONE, &table->prop[src][idx].fppt);
-		amd_pmf_send_cmd(dev, GET_SPPT, true, ARG_NONE, &table->prop[src][idx].sppt);
-		amd_pmf_send_cmd(dev, GET_SPPT_APU_ONLY, true, ARG_NONE,
+		amd_pmf_send_cmd(dev, GET_SPL, GET_CMD, ARG_NONE, &table->prop[src][idx].spl);
+		amd_pmf_send_cmd(dev, GET_FPPT, GET_CMD, ARG_NONE, &table->prop[src][idx].fppt);
+		amd_pmf_send_cmd(dev, GET_SPPT, GET_CMD, ARG_NONE, &table->prop[src][idx].sppt);
+		amd_pmf_send_cmd(dev, GET_SPPT_APU_ONLY, GET_CMD, ARG_NONE,
 				 &table->prop[src][idx].sppt_apu_only);
-		amd_pmf_send_cmd(dev, GET_STT_MIN_LIMIT, true, ARG_NONE,
+		amd_pmf_send_cmd(dev, GET_STT_MIN_LIMIT, GET_CMD, ARG_NONE,
 				 &table->prop[src][idx].stt_min);
-		amd_pmf_send_cmd(dev, GET_STT_LIMIT_APU, true, ARG_NONE,
+		amd_pmf_send_cmd(dev, GET_STT_LIMIT_APU, GET_CMD, ARG_NONE,
 				 (u32 *)&table->prop[src][idx].stt_skin_temp[STT_TEMP_APU]);
-		amd_pmf_send_cmd(dev, GET_STT_LIMIT_HS2, true, ARG_NONE,
+		amd_pmf_send_cmd(dev, GET_STT_LIMIT_HS2, GET_CMD, ARG_NONE,
 				 (u32 *)&table->prop[src][idx].stt_skin_temp[STT_TEMP_HS2]);
 	}
 }
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 6e8116bef4f6..44fc69cfe10e 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -83,7 +83,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 		switch (out->actions_list[idx].action_index) {
 		case PMF_POLICY_SPL:
 			if (dev->prev_data->spl != val) {
-				amd_pmf_send_cmd(dev, SET_SPL, false, val, NULL);
+				amd_pmf_send_cmd(dev, SET_SPL, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update SPL: %u\n", val);
 				dev->prev_data->spl = val;
 			}
@@ -91,7 +91,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 
 		case PMF_POLICY_SPPT:
 			if (dev->prev_data->sppt != val) {
-				amd_pmf_send_cmd(dev, SET_SPPT, false, val, NULL);
+				amd_pmf_send_cmd(dev, SET_SPPT, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update SPPT: %u\n", val);
 				dev->prev_data->sppt = val;
 			}
@@ -99,7 +99,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 
 		case PMF_POLICY_FPPT:
 			if (dev->prev_data->fppt != val) {
-				amd_pmf_send_cmd(dev, SET_FPPT, false, val, NULL);
+				amd_pmf_send_cmd(dev, SET_FPPT, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update FPPT: %u\n", val);
 				dev->prev_data->fppt = val;
 			}
@@ -107,7 +107,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 
 		case PMF_POLICY_SPPT_APU_ONLY:
 			if (dev->prev_data->sppt_apuonly != val) {
-				amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, val, NULL);
+				amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update SPPT_APU_ONLY: %u\n", val);
 				dev->prev_data->sppt_apuonly = val;
 			}
@@ -115,7 +115,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 
 		case PMF_POLICY_STT_MIN:
 			if (dev->prev_data->stt_minlimit != val) {
-				amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, val, NULL);
+				amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update STT_MIN: %u\n", val);
 				dev->prev_data->stt_minlimit = val;
 			}
@@ -123,7 +123,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 
 		case PMF_POLICY_STT_SKINTEMP_APU:
 			if (dev->prev_data->stt_skintemp_apu != val) {
-				amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
+				amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, SET_CMD,
 						 fixp_q88_fromint(val), NULL);
 				dev_dbg(dev->dev, "update STT_SKINTEMP_APU: %u\n", val);
 				dev->prev_data->stt_skintemp_apu = val;
@@ -132,7 +132,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 
 		case PMF_POLICY_STT_SKINTEMP_HS2:
 			if (dev->prev_data->stt_skintemp_hs2 != val) {
-				amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
+				amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, SET_CMD,
 						 fixp_q88_fromint(val), NULL);
 				dev_dbg(dev->dev, "update STT_SKINTEMP_HS2: %u\n", val);
 				dev->prev_data->stt_skintemp_hs2 = val;
@@ -141,7 +141,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 
 		case PMF_POLICY_P3T:
 			if (dev->prev_data->p3t_limit != val) {
-				amd_pmf_send_cmd(dev, SET_P3T, false, val, NULL);
+				amd_pmf_send_cmd(dev, SET_P3T, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update P3T: %u\n", val);
 				dev->prev_data->p3t_limit = val;
 			}
@@ -149,7 +149,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 
 		case PMF_POLICY_PMF_PPT:
 			if (dev->prev_data->pmf_ppt != val) {
-				amd_pmf_send_cmd(dev, SET_PMF_PPT, false, val, NULL);
+				amd_pmf_send_cmd(dev, SET_PMF_PPT, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update PMF PPT: %u\n", val);
 				dev->prev_data->pmf_ppt = val;
 			}
@@ -157,7 +157,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 
 		case PMF_POLICY_PMF_PPT_APU_ONLY:
 			if (dev->prev_data->pmf_ppt_apu_only != val) {
-				amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, false, val, NULL);
+				amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update PMF PPT APU ONLY: %u\n", val);
 				dev->prev_data->pmf_ppt_apu_only = val;
 			}
-- 
2.34.1

