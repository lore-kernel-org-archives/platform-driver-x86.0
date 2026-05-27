Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011050.outbound.protection.outlook.com [52.101.62.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AFD279DCC
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 14:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890563; cv=fail; b=TdBe8Vkavugo6bYAG+UsFmKpfqPlfrYstGX7QmuBw2YRUgWDkFihWgx2U+UrZnbHiGeGWYsu4tfUDu3ciaHbZyxedXIyYOQimET7rfNQCMoqhhKB0DQORwfLrZyXCCItWI9BxQwpKiKlh5e6n5SziZ8urF3kWVG2CY3Ns5k3Ghw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890563; c=relaxed/simple;
	bh=aMcXXgR1ozx3XkZjzqlFXQZyr5K0X6FJUg6bDPV/4TE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OqhvRipxmQXlIkSnoUExe2fFoglNgxTYYJOhVdoMHfIV7EOOxJS5hK76hjo/OrYTtZRtyT2ifcnfr0y0kV3r/BSS2MQbHbMcNsL8lA/bDorU1/fBKQFBjQCUx2t4xRilCLJb9XwyBjvcCTkCa98asJkqjpseRDIOhXM3G2yb8Lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Knn3fJJN; arc=fail smtp.client-ip=52.101.62.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Knn3fJJN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o40sSwF8nsqIR9STpo1BZLXzJyFep0qcF46SSiLOawfMxAXPhXwaIXgvlkP+2iyDDhP1vf7P2nu0/yG7fkzml0gXB+jBJ7tP/wbfCNbQdshCk6waRZQ/ysbCj3+xVVaGiwXrFCbYWHcCdhP6YyvLXa628HMSowQyYeY2npW2h2DKN/7uKKLBUiAeOwL2zizc0CyLT2luhvJm4sKDe/52HrbA1e8w/GEV2vhEI/1LnlbPsl9g5BBIBUzuf4RTTpkIi9hwiV116/+kbuC2cfBmHmLyFS9fW0J0d+fQoRxBpsJ9h40rkKWqWCpzhld6Lf17zJ8jVsdDCFxldAiJTlJxUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMeoIaw9xkByNsangts1aBZ5AVidoG1PtrA0CYwAZic=;
 b=Ep7jYlrAyw4rHMPFVpuSXq++4O2JcJiQ+0o/sCC0Fx+RD87vUAXsiwEql5lk5ysOJHUvQXwBdDd8ZbN65/HfLz+dFkK93L8ISC8j7XaceyrnXn0xpWWByThOXi+01KWPyJoQ3X7uEQ3SJeAOkpuWuSLy6hn/4muX9ktmCocNRqRBwexsb4jyR5IjUdPuh9oHeWr8sBP/b9AGniLaPrMgeCwCD25M+elC7p69hifQouGvQwqgkzNDsgGqYTqxJ+sbCUdepySf0kj6zKzFNsU/AoSleH0xIvt0DNSnABdLDuO9GqJ61m3a9eAeHzSLkg4DOh+1ruaPEWskUaoZdFdJJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMeoIaw9xkByNsangts1aBZ5AVidoG1PtrA0CYwAZic=;
 b=Knn3fJJNHsDtMSeFGUGBI62kB7MaCk7NN5DMP17iOGPqrt/gZam6vh1QL47SAG+7sNF4a6fyvG2qhvgxaMbpHVMFVOx9ul+b0u8Q6fG9h2Lheeg0GOIhQzkMtajF5XWmD6kPHyi77LPZ58a2ZzPlJaIFpYXxGsEeh2q0noOtdoY=
Received: from BLAPR03CA0091.namprd03.prod.outlook.com (2603:10b6:208:32a::6)
 by SJ1PR12MB6193.namprd12.prod.outlook.com (2603:10b6:a03:459::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Wed, 27 May
 2026 14:02:38 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:32a:cafe::97) by BLAPR03CA0091.outlook.office365.com
 (2603:10b6:208:32a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Wed, 27
 May 2026 14:02:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 14:02:38 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 09:02:37 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 07:02:35 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 6/8] platform/x86/amd/pmf: Implement util layer ioctl handler
Date: Wed, 27 May 2026 19:32:03 +0530
Message-ID: <20260527140205.4073335-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527140205.4073335-1-Shyam-sundar.S-k@amd.com>
References: <20260527140205.4073335-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|SJ1PR12MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: e9b4108b-5e9f-497f-d619-08debbf89c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099006|22082099003|6133799003|3023799007|5023799004|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	sHN2hOwFU+8NI9BPNFtLh8B/yMuJJq1aI8VPhkcL5hv9QJNw6/DFJsJR7KGLGCz/bn8qE3Y7WN90rTGosvjMc1kMhAf5yB2u7VaEv35bs+zm8+d/OboE19oCcbc3NFOajbRwBxYf5JKNrHFY5WNQm91mZT42RpRtVO/E7dh+WIEn4OhSvO1PIoPglT4imlzMof2i35b8QkZ437nDh2DIJ+SsR2k/UMoDnrLnZKHQEAS6jZsSanH/dL5qLlf7WNiYBKgMyrj+vzqiMdt63jzZJf0UzOCnkoiOrbYwpeWtBEKPnTWEcju5h2k4lhF0BSPRXjSZ82cIVTelBRsqmW1JYL8gBl25/RdpV9ZlRITcqEoTFAttbovDdUTLbZtxRC7YrOpbubS/VibxBIOK7NX4FU3j7jLtrHsU04z79Weo3BpxTr5gZEZkX5VMhgceyBufIosUbNuB7ztidqnaSIrBZRnuTtmF+mi5lHZxWhI8pIZtZ+kZg66ZiuvOO0/MvLaxlwcc0lesyVtYlJSRYTvn+VjZMni6QEz+9oJ0eJqAoy96xn3ev0EJFRHU+nTAb1Jyu5kDmPVhOqhHUA1y28InyrCamJ3i/B9FBw7Qy9Ds75LkwOZbdH2uoyNUI3o23RvWiFZmIm7SqyZROkbebW7+W39pCfCZJ4LDWjxv9MC4mXrv3c2MwoKzSrx/ZtdRY+lohfN93C8I57YNri8poGHJF9/TJw1D+w4Xe24lTvVQgJU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099006)(22082099003)(6133799003)(3023799007)(5023799004)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j3caMvdsASVVwpo5qnLInPf1Hx2gJY2sASmX4iTJenX+0IEIakETA5tJMkPbAc7vSJ314UxokkAmnsB3ZdC3d0RJqJjFZQ5de1j+NFx1c3FE+3a68tKe2UCK9yP9iGQe4B364koJS5ga7HeLIcGi3l6tYg6HPi6Vrx/NYpV2f8JTyHNu+rtOeaR9BsiJfr5FCPu9Cr7i6RggCUzaXRyCsAKM/2VSR2Gji9ZN3LMeCqYinCpR6xDWinmWfDS60AP9MLFYIf5W7aCABrXr6UCgxqjyWHMXrDXUhtMFb780E/XwlBW2s5b8bwMSm98dY2pXSIYWx1LHJkNLBoJrYZZ6ig2nPFGcUcSEGLozxbu3pyVMj1B0m3UxN0Jot6TikXWvfjQyNoQnPB/tEDtnP43xbLo3Rh9vudLEyy3vtI2HAaunZ0ok59/aRmGIrSuPAv4e
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:02:38.0470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b4108b-5e9f-497f-d619-08debbf89c3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6193

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
 drivers/platform/x86/amd/pmf/pmf.h  |   1 +
 drivers/platform/x86/amd/pmf/spc.c  |   3 +-
 drivers/platform/x86/amd/pmf/util.c | 105 +++++++++++++++++++++++++++-
 3 files changed, 107 insertions(+), 2 deletions(-)

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
index f8a283192ffe..30fb5c250362 100644
--- a/drivers/platform/x86/amd/pmf/util.c
+++ b/drivers/platform/x86/amd/pmf/util.c
@@ -9,6 +9,7 @@
  *	    Sanket Goswami <Sanket.Goswami@amd.com>
  */
 
+#include <linux/align.h>
 #include <linux/amd-pmf.h>
 #include <linux/miscdevice.h>
 #include <linux/mutex.h>
@@ -19,9 +20,111 @@
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
+	if (user_size > sizeof(info))
+		return -EINVAL;
+
+	if (!IS_ALIGNED(user_size, sizeof(__u64)))
+		return -EINVAL;
+
+	if (user_size > sizeof(__u64)) {
+		__u32 features_from_user = 0;
+
+		if (copy_from_user(&features_from_user, argp + offsetof(struct
+		    amd_pmf_info, features_supported), sizeof(features_from_user)))
+			return -EFAULT;
+
+		/* Reject non-zero values now */
+		if (features_from_user != 0)
+			return -EINVAL;
+	}
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

