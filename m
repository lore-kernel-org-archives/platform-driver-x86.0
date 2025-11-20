Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012004.outbound.protection.outlook.com [40.107.209.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BA532E753
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 10:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763636085; cv=fail; b=WMNkseaC/kBnz7JbDZYBrocBjjTHbVLOce7DR/oaOj7meHLxVOfFWPmYLfDfNVRq4sZh5oNGgc5sAx3/UfHkFvyJXLndcTkoauTQp6MkjFKEWoTIcqQJD32IhtyWssMHtzNzHz64u81JNPqsqPGygsBGWO9JVEGP3O0ATgMXLTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763636085; c=relaxed/simple;
	bh=WZ3nNB6qIs52eqhTgp5JCqvslm59ByOAqFm1Aex/XJY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L+ylBJX0fNMpmmVS2mGCZNNf0EJAyDI7N5oa18+YdI+nEJfKGtxgab1LPDHnkuv0evI7mRUydpLbKFeh1aPgfSku3t7X1RFPMKpwMv3dZiGWGwixAJ97sBexPb1DPDcPBT7AyJ8T9BUVwmajbJjEsFWI684dnpV12BK73SVX348=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LAgC1RG8; arc=fail smtp.client-ip=40.107.209.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LAgC1RG8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wgp+r/YoCB6CpGx//WbfCeMhhlil5FiFveQ76HdWBt6hFuKlOOuy16kItXCNsg9Qnzh/g7kNrwNgQ/kuiVx5EfWFFz6Y3XjgoRvSulkUKce/2H/7A3U7v3MF1uM2v0t20id1zzjzFb/6PRMTnRY5tGaIbiNyFghjzwHDm3n6X40ASgfbBNaBpiEJagyKRp7DRnaOcGfScPfBKRFyB1bDr8N57LO1K986zQ4+1Q3vs1ielctTnEEI6O9IeTiL65OKIWyO2N2FzjS2185jebYjN8Q7tEeGn1aM+XtFf+oMareKmTGkGZIgtzA+WLIuykdJ6FS25SpqrnZzEPODaBhA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAjqcm4E8mTOg75j1aBzwUPww6eTmxV/8+vEc4UAGCQ=;
 b=SWW+FLgAiRRaiI2xr7VMUZ9Po6YTft9Xt9/+vpemMreHDpThBr5XP1URhKcLy2SqRz9ey/PUD9t8/yfEPAgnwbIiWXOOUbqqU3lnJvAuy9124Iq/2BFF4jf+W2A9/426dI6z2i4E4K+y5wGHAyKrOvlBH7pojsHoRKf8riTNAcQ/5r86rPvx2gfrc12pioSEL48mYqHXZ7H8zjQDTm0umWnA8cp7yrs7D9n+Dez06nRVnHWXkjUR62s/gEwXxUyUMAvnriPjSIMESowjBISzXGB/AzH6O6J7HlvNr1r0HqZWg39wEwaWRFb/Fwkh5EyObmwBqwC6ibcHmAcC5SuS1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAjqcm4E8mTOg75j1aBzwUPww6eTmxV/8+vEc4UAGCQ=;
 b=LAgC1RG8bi1ZVn8hPkVk5Tr30eZ4mYIkR4f9a3+B2bPGGjwOZB0U98NLbdRNTHAjYDg1LmRh4gN2RFKtXilBFa+ulqiLJXNU6FTKhraCkQO6tS4w8d55a9YxZ1Kxzh57z4p6+ThYmkRPcKKO8jslA2P/Ed4N4Ismp6XzOKs3TQ4=
Received: from SA9P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::6) by
 DS7PR12MB6119.namprd12.prod.outlook.com (2603:10b6:8:99::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.11; Thu, 20 Nov 2025 10:54:36 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:806:25:cafe::48) by SA9P221CA0001.outlook.office365.com
 (2603:10b6:806:25::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.20 via Frontend Transport; Thu,
 20 Nov 2025 10:54:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 10:54:36 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 20 Nov
 2025 02:54:33 -0800
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 2/3] platform/x86/amd/pmf: Use explicit SET_CMD/GET_CMD flags in amd_pmf_send_cmd()
Date: Thu, 20 Nov 2025 16:22:09 +0530
Message-ID: <20251120105210.3945710-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120105210.3945710-1-Shyam-sundar.S-k@amd.com>
References: <20251120105210.3945710-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|DS7PR12MB6119:EE_
X-MS-Office365-Filtering-Correlation-Id: fddb8a4b-ecf4-473f-3222-08de2823326f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aMRAeiugIcDzVDl32aGTXvQvkY251LYtECGpNSIh1uu9qNf+0/r8c/MnqeWM?=
 =?us-ascii?Q?aTqE6NumL5TohDiqnneDJf17Hm4FEFri1jGLywpM4kcZjfqdiYmNwed38QEm?=
 =?us-ascii?Q?SeBE5fbFRxJTylv2FzxnKZV330zP3e6cic/6hF1NoiPkQ0tJz6OWz0IT0Vsj?=
 =?us-ascii?Q?Um9ui+iTcJyDHSy2o86e5dnosHunXrCHLjGtcu6bk2HX02d1d9WiUoZfj29J?=
 =?us-ascii?Q?jWmbwsyrDihvJHIBujfmZ1XAUYKfXt0p4D6eesHz+cF/zFRDV1p5Hdlsv/jC?=
 =?us-ascii?Q?yfkwUOmfrYwTjQd2W0l2B4Z0yK0I/JPFJHORolyWnD2OE7lDpF+rFNjWTQqm?=
 =?us-ascii?Q?pRH2eVT8dlVZ/Q4qe6uycDg1PmO/mNtDhtAW7IaSGcNC/X3uWMTWMRnu4szz?=
 =?us-ascii?Q?gCwOrEknZ5lLh1m28LFsc7xbw9pCfQztDQNDaj31T7oq68Qr/c3gGqWNgX1+?=
 =?us-ascii?Q?MswSI0gJ8eFTXIKZ8uuxrD47ZF5Ynk2PsmqCTer1vnyF1iyhDbs6Ud4Maq7O?=
 =?us-ascii?Q?9lIm73+nw1ME4uafpx3CSFGEZjW+8PL0M7MMmrW+SW+4n4xBsrbkxS9JQLbd?=
 =?us-ascii?Q?SXq96bL9tAYBoydD9puVewgCAiAp2M/2Yj+uc0rONOCNHv4UYWl707pOqAjr?=
 =?us-ascii?Q?RRWAGucFSU72FxgZk8LRfaj+0fM5Gg/LA165Iwn65tWNgSAnDq2Izg7Oq9no?=
 =?us-ascii?Q?rKIoSGatpBuN7HULfYMa5wS+Pf1vO5YQ9gX6KVqxJ1p+aEyGZLrVlJjbtn74?=
 =?us-ascii?Q?VrQmLqA71+mN+0edXhLcQ1yij4wm2fSlLanhqkp5pWPhlZPfqfluCujcWnvW?=
 =?us-ascii?Q?RLk+l8Ph0e0JWYNwfTfpaGkovQKZBhZ7Q/9qHxvLGEXp5ttZu/bDtZVepP7c?=
 =?us-ascii?Q?6cdqy0OHBdY/CMed5KVS1oAxMaN37MENdwjp2K3ZxJ2klpQ//sVPnQtJwj9h?=
 =?us-ascii?Q?JsUAwvGzwjXGe1YhmVNuWqIrORexFTVIk5NV1TwRbBnKimuygR9FzjQ7GZJn?=
 =?us-ascii?Q?aP84Iv9kTm1jGPNA+EGyEF1eNYMIWeVBigAlwyY5yeLTpJDmOW42Wz/JEUn5?=
 =?us-ascii?Q?VkPs2droODI/rbdq0rGl50XssgDlDG1EVnGBRI+jvLmcN0aC2KhdtzHsv+9r?=
 =?us-ascii?Q?vgwOyGcafbUOJbhS2ilYeqwbxZUTnx1rcK0IIuteiToY8nHcWWewCFDBvvJA?=
 =?us-ascii?Q?XAxs/6O71NW/us5UvAx2fXnxHpQ040vD54yBPWUL4AuPdD+71avZQtEZOizE?=
 =?us-ascii?Q?4wHNuXDCaGPfdwOHaV5n+8AK+1VcByWDSDWUBzPx5YlodBivxsIxsj8ta21p?=
 =?us-ascii?Q?i65YBDwVNBjnVmfmxUdDMy609CtB5djzJr3lfW6cvmFLh8kfy2WZJ2oDBuMU?=
 =?us-ascii?Q?H2/HZvsrPaEfE7yFr1l8YDUdlloZuGcMYbf1ipwWuOCp0/3g1V4hujLgsg9q?=
 =?us-ascii?Q?2it9vSXJLxfoOnFmJr3hDpOl+4LvH41gtwVe6WJjB1mDfFwcOizNlEjwM0JB?=
 =?us-ascii?Q?Em/OUA3Z0IyubG1P3CmAvuiQ2ANO8pUtKqyVXYz2uTjijCEUj8FoLZWxuqQM?=
 =?us-ascii?Q?D1I0g/sbD+6XDP5Gmio=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 10:54:36.7693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fddb8a4b-ecf4-473f-3222-08de2823326f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6119

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
 drivers/platform/x86/amd/pmf/pmf.h       |  4 +++
 drivers/platform/x86/amd/pmf/spc.c       |  2 +-
 drivers/platform/x86/amd/pmf/sps.c       | 38 ++++++++++++------------
 drivers/platform/x86/amd/pmf/tee-if.c    | 20 ++++++-------
 7 files changed, 51 insertions(+), 47 deletions(-)

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
index 71421a5d7afd..e9dbf328d17b 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -132,7 +132,7 @@ static void amd_pmf_get_metrics(struct work_struct *work)
 
 	/* Transfer table contents */
 	memset(dev->buf, 0, sizeof(dev->m_table));
-	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
+	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, 7, NULL);
 	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
 
 	time_elapsed_ms = ktime_to_ms(ktime_get()) - dev->start_time;
@@ -290,8 +290,8 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
 	hi = phys_addr >> 32;
 	low = phys_addr & GENMASK(31, 0);
 
-	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, hi, NULL);
-	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, low, NULL);
+	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, SET_CMD, hi, NULL);
+	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, SET_CMD, low, NULL);
 
 	return 0;
 }
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 387e37ea3608..4478947385f7 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -124,6 +124,10 @@ struct cookie_header {
 #define BIOS_INPUTS_MAX		10
 #define CUSTOM_BIOS_INPUT_RING_ENTRIES	64	/* Must be power of two for CIRC_* macros */
 
+/* amd_pmf_send_cmd() set/get */
+#define SET_CMD		false
+#define GET_CMD		true
+
 typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
 
 /* APTS PMF BIOS Interface */
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 34fff41b86fe..b81ab58f1a80 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -206,7 +206,7 @@ static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
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
index add742e33e1e..2c74ba2a0b51 100644
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

