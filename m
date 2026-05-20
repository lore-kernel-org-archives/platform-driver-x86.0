Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011028.outbound.protection.outlook.com [52.101.52.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30FF3FCB0C
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 18:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779303365; cv=fail; b=PG2EjmgoxOxqILCVnvwO3etydnn0FIl0xOSCCuQGlEJAQqOOcDrUqhJIxzKA8vy6MCwqcIwJ9I4TFlGJ14f/31EmrFzsn6fUKGEGnsGeVFnuONWsohKpoknEr5B93hgWyenmpl53BJPvN0QJPPYATUXRuxQq8lzXe1V8Z64CGU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779303365; c=relaxed/simple;
	bh=/UcG0yFMp0rZNm4PEa9xJ/6L5VTr7WOkpNvUtTK6fJc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HL6QygOZXmR+zyn5HBU3VvZiCQ6oq1WSujegsOThXpk0U/p5lJDBYmWbJeqZa1SXJPxWc7gyPI3qLDrhpv5hdBLbCGHnuWiPSxEA8YECzkjcOpt77JRZdK/1KEp1C31JZ4rhP+dtS3CLBnqDULecg1OmYq7kTFsNUx8OTIBZUe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lBocl3Y0; arc=fail smtp.client-ip=52.101.52.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lBocl3Y0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gljR3LxSdc8KH7307TwIPykdrTwIXqsQxF8SxYFbCmnKUtWP3Klc7ttWQawP8rhsQoQNcnrDckahyUqBD0BP1ziTWL2pA27x68BCSxoytP8lyfZq4ieeW99uQh/kEnkFgV5Rpg8KZYc9SrBNYC5YkECbNeYJ8hTE5d8pPpeNzwzBpnA2drlJaNSdRxtN9dUBE34Yj3aUc0CySIIyC+OP0Mj6BjiIeoLgfgnl8I7YkfLn+BPZ7NIFPwvfgoHe6n5BTxyLYoQIOqKYYuq7kb5OFRGXf5akfN6mDDAsL3O28pStRzIxe7H8Uc2l8B5chPxW8UVSxgTW/vBaFchDyqb1Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFiLs79C3HzdrAThNA16P2+ykUhiCX6VL+5FD1PkgcI=;
 b=ETbsI6Zyg5RjjwJ5Z2L3GNC7mVITOQqXEOTUvK22bOyoiN/GIVF4p1pGazKvn+q+IyVS1ZYLipofkTw0xw+S+HU2izpzFI36QMK88R8XlP/c43omheebK55iwfjblMSZaIJftJIKFKj1KOO9Khp4jNj8gdNfN9s2Goeav5B/J59wc8FhabMJm6ymg4hPLbZRzfQUhMalca5LpfdMMLnTblWhaztglNZQVnQX28FPPyjutUWnpMOs874r4IeUl/XKzfOH9gCfewV7fJPH7vXgyWwGsYjm0fGZrjoLXWH58/BbSOVF7PxuBaymQFZdr2o9E1d8bgh97BT6G0AreOaC2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFiLs79C3HzdrAThNA16P2+ykUhiCX6VL+5FD1PkgcI=;
 b=lBocl3Y0QeB3DTAVkPzPEjb8G8zk0u5y6NLxFD31iTVlv3FqWqWzvlCEXFuREOigPAiVG4aODvyiD4HzPXMJsGPOM97eyrQN4PAr7cJ9K6J4zruSBeADxTjmct1DsHN7dM+WtNQ2kblR/Yd9ehcbR0PFYkJm1bMwqX8yGakMMbo=
Received: from DS7PR03CA0266.namprd03.prod.outlook.com (2603:10b6:5:3b3::31)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 18:55:58 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:5:3b3:cafe::a6) by DS7PR03CA0266.outlook.office365.com
 (2603:10b6:5:3b3::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Wed, 20
 May 2026 18:55:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 18:55:58 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 13:55:56 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 6/8] platform/x86/amd/pmf: Implement util layer ioctl handler
Date: Thu, 21 May 2026 00:24:22 +0530
Message-ID: <20260520185424.770772-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com>
References: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d900852-d5d4-4b1a-1cb0-08deb6a16de4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|22082099003|18002099003|56012099003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	CYxdW/PHG/EJEm6BSFW4FdYAjDqBS+99tBw1Q/Yq5tO6NsQ7wrQdeNEpIvAse8Gng7PCOfzKtbG6uCNzqE9H5MOf28zmD7gZ21iIvD+32PZB+ijFT1s0aSsf1wPKA3RspoWPqRvBmeueb51vf4A2IiYlWyQHqd+fuokV/LmJPMDm9AchYChOHiRe1uhUdCaKiJSIFfWKrYnz9FbUyccWpQqnFduCHTJML/7sISsXXt2yaOMCSPdTZ+KJmvp+R96Wkdt/mIVGqBBIcy3mPn1vlKi/F29H5pDFodMMf+y1mqIJN9e1dh8u85CPYQRLL/+pbisTowTtwQZpHbwRf7YZsfB3UKA6kQKcJfKrL0dDmtTDiTx2rSeAnQ75K7k4ofOWGlz1zHzU4txLe36wTs1/1pOj+z2aBqHhdqy6vDiG8GoU63jwlZEg16aq9cRORCJ1e9vjFGFoZ2ZpbRW81fYyviT+wea9gXpOgN1+luXXYIinpePdV3dJ4uw90s1TUu/tn0whVox4hOyZb9L60UaOEVc74WFQ8R298O8JKcUavWahDe0kRPzVz/VEMIqeTlIcVxfF/Vw3yUelSfVyZdZN8ST3KVPwxAWx+2hIMRshnx3sJ3co5ra/N+UsDdiBKyzd9YFvJUnHeVuIfNS/4+jyXcgPCW/uAjR1lhV8XewSgA2TmM2AgPXkWKbr6Vj81m8X+pqBvkN9GGbKuecTMdNul351hKvwEGaLQ5nE9TaTmMw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(22082099003)(18002099003)(56012099003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rLX7aEn2hqh3KUwacjLZaRjeArT9sDehPVZzVFC9jtGpVCyFjZI9EQB4850LrxgIfbqDGBvd4Z9mbh2uwtGipXswaCtAZv0TJv8+Ry2GwY1UjSr8SRhhJtCcJ3C3Zxi27nO4zN4Sa7umLt8oxy83m1BrZgEv2WSfk8N7bLigoQgcUoUIoQiA05WtCzZZWG1iQ2RZBILxjwM9++fA3fvB2gxyfq+GWcE4uu8LLncKOl89V7UNcwag5hLy/gZxNOEx0m1qkVv48uwbCCN77097mTW8kBZZXxSF0srCcFJKxaLesMWJkB+AxS9MUzu/b1VQEH2So/OLnjWaNvN4ksPVHveZMx3IzEC0fKYW/1Rrk5afGU1Xy1KFQrLdBeZrInHLVKLqLTDAaLfLGmyoLPNHtFpW+4TOpe1bnTIwk1uTV8hDYcgkurQUGPpe4ZHEqKmd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 18:55:58.2433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d900852-d5d4-4b1a-1cb0-08deb6a16de4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442

Implement the ioctl handler for the util layer character device. This
support adds the actual functionality to populate PMF metrics from the
TA shared memory buffer and return them to userspace.

The implementation includes:
- amd_pmf_populate_data() to extract metrics from TA shared memory
- amd_pmf_set_ioctl() to handle userspace ioctl requests
- Size negotiation for forward/backward compatibility
- Feature-based population of struct fields

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/util.c | 90 ++++++++++++++++++++++++++++-
 1 file changed, 89 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
index 0052f0b6a7a5..eb9a02e135a9 100644
--- a/drivers/platform/x86/amd/pmf/util.c
+++ b/drivers/platform/x86/amd/pmf/util.c
@@ -19,9 +19,97 @@
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
+	ta_sm = pdev->shbuf;
+	in = &ta_sm->pmf_input.enact_table;
+
+	/* Set size and version */
+	info->size = sizeof(struct amd_pmf_info);
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
+	for (idx = 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++) {
+		if (idx < 2)
+			info->bios_input[idx] = in->ev_info.bios_input_1[idx];
+		else
+			info->bios_input[idx] = in->ev_info.bios_input_2[idx - 2];
+	}
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
+	if (user_size & (sizeof(__u64) - 1))
+		return -EINVAL;
+
+	guard(mutex)(&pmf_util_lock);
+	ret = amd_pmf_populate_data(pdev, &info);
+	if (ret)
+		return ret;
+
+	copy_size = min_t(size_t, user_size, sizeof(struct amd_pmf_info));
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

