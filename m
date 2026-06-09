Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010062.outbound.protection.outlook.com [52.101.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE833ED101
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 08:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992718; cv=fail; b=apnCcmpN64vOgGfsY5/McWqRzP7fN2x3Z3bclgRuYD7qOPI7kLNOFLiDyZFm2th2XQpQad0YdSfRuc1XTly00Iyk5Usa7SOFHchFiNzQfEaZ+HI8F61qoDYGqoURobti+ZaNJrNKdFURbpcByUC4tbBQ3zM6r4UiSijIHIJGwEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992718; c=relaxed/simple;
	bh=RZAtRdJ2lqB5XbmjjGceVpCRyPwZvmx169SXfhja5Fg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mzKeENE59gAC9cAKO+yKj5Zc4KGMmHrIPfEQcwk3z4SRKpHc4EMwKe2n2YFSUCMFjWD4+njvuQ16Gax91f8RnKw9bFUaRYjua/6Y3JHqBrbvrwbOTh5lf6vhAAsy3m9AFEaFvnor2dEZj5pOQqVsIz925lH9lX5ss41ze48r7MQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=217i37fD; arc=fail smtp.client-ip=52.101.201.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="217i37fD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bs4Ecn54wQOuhooFR4Q/PJrTkkQ7KrfbqC5F7w48JbsuViONiHi+n+6EWpks/0N6w+H+eCo6iP6g24256f0miMZvOJnG62KRmIoUhUxR5AC+B+fr4D+OuW+n00MeRTaXE5EzYPGOWEGfYd3jRGLAEeMqAyOle+I8H2o2IfQT6MznwzF7HOZjkxqqJ6cjro7yBy5hcSVvXsulSENvmfEh+Q1prmULmJEghOG+Pcpysz/r7t/Vc8Kl52Ij4frrRxRHP933XFoDwAxjAwqW7CMbLY0G65KxSP7ej3xI/Xa7BHU3u5p6KGYulybV40+LOT7kOIhWnpxc8dR0+aFzg5Ulvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slCWs7z4kcUDZzYf+ap5eV59dTOUiT+wwnp+j+ov4yg=;
 b=GW4nEIG3x+ZfjTdid7rd5sj2RLLNs6ZiL1DVFK6w9T8czOT5WiTH1wFOOHdImbBnKSSk/GdKG1mU4D0eiGcMwfLurZlbPDEf4jygdnDBsDG3ZvEKKQv5BKvejN8g4DW69aJdrF0Lu89MT4JxZsDow4wp1H0JmNllt20/hs03h9aidoq4CP4V1gU13rC5BcJ6rrXhWY22m6cpgvvgRcXAjZOJ/P7WSlTxDj6NTF24xq8j7ekHAJzDMtlfL+s9G4pFd9pjJFlm4q8NGfvUl4YE23+nS2wjnZrXCDYOpoBjjiufkzD/KbHJvOUKJKDyEAzhZpupBFqMTocU2FavDAYmiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slCWs7z4kcUDZzYf+ap5eV59dTOUiT+wwnp+j+ov4yg=;
 b=217i37fDw5grD1NTkSXWRiw+isRyeA2To6xUArfkpRSQsEKU/euQKHYrKgH8p+vXEpOzSxcAbothfqEBZr/l0IhRL3aDp+KPtLSmut7NC2eoUcLQUMNR8/M4nCHpOAI8u1vcHh2+LM8d+1qsF2d1bzTfwlblTTktztxwo9dONZo=
Received: from BN0PR10CA0030.namprd10.prod.outlook.com (2603:10b6:408:143::9)
 by DS7PR12MB6144.namprd12.prod.outlook.com (2603:10b6:8:98::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Tue, 9 Jun 2026 08:11:52 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:143:cafe::83) by BN0PR10CA0030.outlook.office365.com
 (2603:10b6:408:143::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 08:11:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.1 via Frontend Transport; Tue, 9 Jun 2026 08:11:52 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 03:11:50 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 5/7] platform/x86/amd/pmf: Implement util layer ioctl handler
Date: Tue, 9 Jun 2026 13:40:42 +0530
Message-ID: <20260609081044.2416731-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609081044.2416731-1-Shyam-sundar.S-k@amd.com>
References: <20260609081044.2416731-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|DS7PR12MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a05c99-fa30-4f84-2aa9-08dec5fec3ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099006|3023799007|11063799006|5023799004|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	P8C4uFyf0+TtBYLQx5R0N6gOmHowyupzEfuyrxpnLpsgqobgTbjYGdftydjJ+B8xOiwR24aYrHRdE9rH+EobxVD1PlwY2Zk7GfG862ESZFBy1RkyUMPzm6n/rfQsHzY7tenmzt9Qg6XfCqzXJKSnIw9NMXvG3CseeNbje6HJmoZlxMuPjm+qzZeDWKOG9dwOAk4zVhwW2V+j+xrK1UzzfYZS4K5l/eiqE/hf6X1QgI1LcSSZygVcDauWnk9X9l2TjSbgsfQraAenKIZqKHYhmwYbOQc3IHTT5kjK3qVxR4IbuNXBnJc075xSwne41ivUEsDXcjUpkZdWOGqAldyZ6vnuhns/fW257JdqjgOBNuZdEPInsHdlacTqO/7vnIbpQsrTcGgbcWBvWbs9rKWT/YJfnnTZkGs1yja2Iq93an/2XUOT/B3/SHl0uURn2namJLTWLbkdAprCseikHm9Bt2DkhK3NXEPguniUhSvApotgieA3uGPfH3cXJF1bjR23cbMJ7rm3lrkn6rkuOyyrnXWs3P2DUzna83RDdRRnEktNT8MojqGh4IFGdtzMhwA8FH8dqbXYELIBXavq5BI2R/mmdbykfN9nloksrY0bev/1rtaPEpTDi/fsr+gyUpBM2YfEUVpDAccwyCGAlrccIojE+6jzB/5qwicZZwXP9QXiBq0qwc5czTjvHY0PQFBfn+bWnOFjw6HVzkM/MT/3h4ZrF7eVbXj4d1sPnUofm8c=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(3023799007)(11063799006)(5023799004)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XC3iXgqjUhK974l4IxE9drrapw1+gKUcM/9bNem0aROKFu0OPhfROePfeDGN7KYLh3xNLUJr/4tasNwWM9VmTMno7jOnNrx6pH+kfnyfyc9e3eYj1Ybl3zTMLEBkS86er3Fxhi/rh6N0LuymvKvmDA5aIrLtIpUtL+fImNgUsIuBXdd3JQiHIw6VM26m3kHvbuRWU3FoijPzOl6elfh4XCG759V32Uu6eCEqo1EE/3Nip11Otx8EgCkJONJoL+CMXdQO7XSJdOXq4nymu3jtDrPXV7aRtqA6pWpDAcpn5jIKQuePup8yJXyytleANqMOIIV+pyGbVZXOkUiSnrpBfMsi2FVF+AoJzk6Sq6s55ytjgt+bwQhG9y41k8d4tj/vUrKTOFgLV2yKkHywDLRVVotWqzTBvdtM/zALMYfxxn9R03unliVpnlOREE4Y4svh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:11:52.7952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a05c99-fa30-4f84-2aa9-08dec5fec3ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6144

Implement the ioctl handler for the util layer character device. This
support adds the actual functionality to populate PMF metrics from the
TA shared memory buffer and return them to userspace.

The implementation includes:
- amd_pmf_populate_data() to extract metrics from TA shared memory
- amd_pmf_set_ioctl() to handle userspace ioctl requests
- Size negotiation for forward/backward compatibility
- Feature-based population of struct fields
- Export amd_pmf_get_ta_custom_bios_inputs()

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h  |  1 +
 drivers/platform/x86/amd/pmf/spc.c  |  3 +-
 drivers/platform/x86/amd/pmf/util.c | 86 ++++++++++++++++++++++++++++-
 3 files changed, 88 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 269c0a4b1cae..752fa5dd2267 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -903,6 +903,7 @@ int amd_pmf_smartpc_apply_bios_output(struct amd_pmf_dev *dev, u32 val, u32 preq
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
 int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev);
+u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index);
 
 int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid);
 void amd_pmf_tee_deinit(struct amd_pmf_dev *dev);
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 6e33824ccadc..94355b435a66 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -18,7 +18,7 @@
 #include "pmf.h"
 
 #ifdef CONFIG_AMD_PMF_DEBUG
-static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
+u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
 {
 	switch (index) {
 	case 0 ... 1:
@@ -29,6 +29,7 @@ static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int
 		return 0;
 	}
 }
+EXPORT_SYMBOL(amd_pmf_get_ta_custom_bios_inputs);
 
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
index f8a283192ffe..d0d592f21db8 100644
--- a/drivers/platform/x86/amd/pmf/util.c
+++ b/drivers/platform/x86/amd/pmf/util.c
@@ -19,9 +19,93 @@
 static struct amd_pmf_dev *pmf_dev_handle;
 static DEFINE_MUTEX(pmf_util_lock);
 
+static int amd_pmf_populate_data(struct amd_pmf_dev *pdev, struct amd_pmf_info *info)
+{
+	struct ta_pmf_shared_memory *ta_sm = NULL;
+	struct ta_pmf_enact_table *in = NULL;
+	int idx;
+
+	if (!pdev || !info)
+		return -EINVAL;
+
+	if (!pdev->shbuf)
+		return -EINVAL;
+
+	ta_sm = pdev->shbuf;
+	in = &ta_sm->pmf_input.enact_table;
+
+	/* Set size */
+	info->size = sizeof(*info);
+
+	/* PMF Feature support flags */
+	if (is_apmf_func_supported(pdev, APMF_FUNC_AUTO_MODE))
+		info->features_supported |= AMD_PMF_FEAT_AUTO_MODE;
+	if (is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
+		info->features_supported |= AMD_PMF_FEAT_STATIC_POWER_SLIDER;
+	if (pdev->smart_pc_enabled)
+		info->features_supported |= AMD_PMF_FEAT_POLICY_BUILDER;
+	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_AC))
+		info->features_supported |= AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC;
+	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_DC))
+		info->features_supported |= AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC;
+
+	/* Device States */
+	info->platform_type = in->ev_info.platform_type;
+	info->laptop_placement = in->ev_info.device_state;
+	info->lid_state = in->ev_info.lid_state;
+	info->user_presence = in->ev_info.user_present;
+	info->slider_position = in->ev_info.power_slider;
+
+	/* Thermal and Power Metrics */
+	info->power_source = in->ev_info.power_source;
+	info->skin_temp = in->ev_info.skin_temperature;
+	info->gfx_busy = in->ev_info.gfx_busy;
+	info->ambient_light = in->ev_info.ambient_light;
+	info->avg_c0_residency = in->ev_info.avg_c0residency;
+	info->max_c0_residency = in->ev_info.max_c0residency;
+	info->socket_power = in->ev_info.socket_power;
+
+	/* Custom BIOS input parameters */
+	for (idx = 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++)
+		info->bios_input[idx] = amd_pmf_get_ta_custom_bios_inputs(in, idx);
+
+	/* BIOS output parameters */
+	for (idx = 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++)
+		info->bios_output[idx] = pdev->bios_output[idx];
+
+	return 0;
+}
+
 static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
-	return -ENOTTY;
+	struct amd_pmf_dev *pdev = filp->private_data;
+	void __user *argp = (void __user *)arg;
+	struct amd_pmf_info info = {};
+	size_t copy_size;
+	__u64 user_size;
+	int ret;
+
+	if (cmd != IOCTL_AMD_PMF_POPULATE_DATA)
+		return -ENOTTY;
+
+	/* First read just the size field from userspace */
+	if (copy_from_user(&user_size, argp, sizeof(user_size)))
+		return -EFAULT;
+
+	guard(mutex)(&pmf_util_lock);
+	ret = amd_pmf_populate_data(pdev, &info);
+	if (ret)
+		return ret;
+
+	copy_size = min_t(size_t, user_size, sizeof(info));
+
+	/* Set actual size being copied */
+	info.size = copy_size;
+
+	if (copy_to_user(argp, &info, copy_size))
+		return -EFAULT;
+
+	return 0;
 }
 
 static int amd_pmf_open(struct inode *inode, struct file *filp)
-- 
2.34.1

