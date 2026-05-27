Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013069.outbound.protection.outlook.com [40.107.201.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93D4194AE6
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 14:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890559; cv=fail; b=JsNZMYeWQ2BjN0kyMKyKDkKW8J2tucPrMs3X7yh1u6+8j+OiEbZStuNMEqyqh5CsxK1zfL+kCLYB+yWwlHaA4jeq5/z9z4D3HyMslwukCHLcoQpAw+AvSHXadLrLouGquQvxy70SNuT9CxWTxXuHQDIdNCZi/mNIb537B35SlYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890559; c=relaxed/simple;
	bh=BAdjPVTvyEPAVOtBzEIXYfpVWlyVm+TkQjjfWLIDytA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eDsJztHw+Nu0QkXGtaS/SYcHSzhWad97lkXgwRsYV3y4HIXJvJVD+BLt6ZgDI/6ZmY9SoDaC4Zu/GIPOpiTNGuVPsGcRpz9yAeCY8MbhIY1jFWtmQNkY+ElrBMx+S4PDl2zfEOMeUvCjmFZNn9UCO36Q5r/eW3X2jAdpWQI8ei8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dXbFMoNR; arc=fail smtp.client-ip=40.107.201.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dXbFMoNR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wLxURtzCFN3D/Zv9xoBmWBxuEWWvq117Vw3gBH1YSZXS4XctDZhEKj1zfhQaUGQyJk6tIFzQ59Wb18JRYCGk0cqM/dqeEKtX+yXJozEVVcG9Hc/ySrEKOoCUBnt2cbTVnHU6ebH5wiSDlSGKB1gY/SDdY3Pctbi4+zwQCBvia1ELud5nXghDCgM1DW7YMAnlzlVKi4plPUo87Fm/2Qzw6TaUuRrR3aoX0m/orBfuXCssOWux9+diT/pjlKCKy0pDJbrw3PK6YGSkJ98977SuVMIuDJXg7FBRGQKqOVX2qvgVEBK7+Fa/QBNpL4/GeOV1rlPxH5hQj5y6Vv6IQxiYEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBOTPqgZ/F/jHSge/bMtSqMROptZZ5S0Pi7W0wJNOVg=;
 b=vo4TUlGCgOodRCQhcSav9fNk5QvrhftNtlDso/k+nCMJa3Z8TqntnbU1U2m26YZ3SAipdx1i5m//xuE5bIjnpCOEt0GCujXuPaJ4P/+nlagvR4qP07tufNGoC9WPXpGXPpb/RRfeMBcWvOcaoGIEIJnogp+H42VxNpwNnVcsZ4lJ+rJ7kCb4m09E1EYoABB+WsSG9epEaQrw3IK19NKqeIekfNkgTu46wF3WPL+9c3ac8arYcYVKUwnq9aiG1uzlbT5ms1AG5PSgdboYxue8HlU6tJfyCEItduVncRY5pR+gngOovkByKpQFhQGxB6J2zChtnYNwBPfmGzcAb8+LLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBOTPqgZ/F/jHSge/bMtSqMROptZZ5S0Pi7W0wJNOVg=;
 b=dXbFMoNRT7yLRmMAEYgzK3mSzyI3jhecX4HnQsbMPT7QnIwF12cYwyrvw1kKuUcBvwlhmYK8Ggnhf1lXIzJoUWwn3qYhlZxoVQsT2Y+PdsTnSRIpqWI10CE+s4AQ0fsBkl4nY2k8eFGFxyWTCGnYeBrQVOaTvEPlgAb09MebBII=
Received: from DM6PR04CA0001.namprd04.prod.outlook.com (2603:10b6:5:334::6) by
 SN7PR12MB6864.namprd12.prod.outlook.com (2603:10b6:806:263::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 14:02:30 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:334:cafe::7f) by DM6PR04CA0001.outlook.office365.com
 (2603:10b6:5:334::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Wed, 27
 May 2026 14:02:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 14:02:30 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 09:02:29 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 07:02:27 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 2/8] platform/x86/amd/pmf: store BIOS output values for user-space metrics via util IOCTL
Date: Wed, 27 May 2026 19:31:59 +0530
Message-ID: <20260527140205.4073335-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|SN7PR12MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: fc393ba1-3358-4c48-1d2c-08debbf8978a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|11063799006|5023799004|56012099006|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oVc6ccgpxusbK1DIu/d3zlea3trC4G+sbOtk8mBUeE6N2O209PB/VaMSP+CEGhKguOQQ6UUifWFIFg8nAERvPsQ3lyxWJ9nabo7QqgeCLgQgMf3UIU+O6/HUdBe2/OZ6OLFqtJ5NmMgwYvhrwVM7ZNyCftMHFKvNMS2GlxO1dDDiw/1ZpXfjk0tuh/nR9dhopXBsmOPOoEARXIx7PWKzYGvQe6p+M8P51Iy575ROXO6SmriMZuujdFrxWQQ+QnVRHuybuZCRFdXay2ZYGvts7GOI6c+eCljdSDwWsfuZJ9yUvgB+H7h6CYfJMNf6vKeNu2C4/PmvQGX6k3PERB9iP39s8KX4cikO1d8bnciGJ/Ta6iDVR1PldCKKr1XTa3db4tlCBPQfh5xVIZxMEN68LZAHvnQdJSh6yxJUMkrmnmFy/mnhORVwh8QJwefib29eXzhSS0FDGxhi32GGB46mZdXEHz7jK5HvpZ4bmh883NKr3Y5qNMQr84GdhgQ9o5VxZIQIWxAi/+c+8w88JQakEcZkxntNa1Lg0TlwypM4WrrnMHSAo+AvsPA2JE3/Fbx+ABIy4CstsBP21WMInAmvFT5+IJmGusne4DGOfy9JVTJvsF011az20qz607qH6IxUyhgOeI4ss5Zyy3CoF0onGQKr4/iO4GZAaMhCt9jfB18mvfkOxHAOYHd8tZGVzJFW6QNKMxw1MBEkkiSrLnrSkBk/Fg+6Uhxjl6RSTHHw9+I=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(11063799006)(5023799004)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uwE8IrvlZMGQJqr2O5oiNYQhj9JAUY2FtmrNxfvJjWXU8VLYUWfSO/8kDStlCv8k+2tPJvfcjo+fMhA0kvFum3DnbCE9cl43w/Q783UoG4kirdBVxcLwadCR8EiIRpyHxKZl6LLnfILNhIsTrzGc0KMnR959AMqtWxkgVfdzHy6gvQkexif9ncCZUSs4uL4+XV9uVLelXO6HS/se9ZIc1d0Jh7cL1/TFQ2xOn+Mq+vFZJVFakD+uG4yhttHN6E0d/GAyXL8dWz0zn1a90F2tqc5qIS2Eg5fF8sNbrJ+wHnmOjrXuo9Agl8A/l7n0fSLlE0gSYsyOMI2+yhquYY86WMrej8kn9x87nZZf/gxK2s6x3N6ViVwufl5/Tjx5vNFI2+lKlfpedtI1JhPFEe+mfadpAoZmxdQ3gK8KQdtlT+3Vo4VIMStM6RZsaLIFNc0R
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:02:30.1464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc393ba1-3358-4c48-1d2c-08debbf8978a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6864

Add a bios_output[] to amd_pmf_dev struct and store the latest values for
BIOS output policies when applying PMF policies. This enables the AMD PMF
util layer to expose these BIOS outputs alongside selected thermal and
power metrics to user space via /dev/amdpmf_interface and a new IOCTL,
supporting real-time monitoring tools such as SystemDeck.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    |  2 ++
 drivers/platform/x86/amd/pmf/tee-if.c | 13 +++++++++++--
 include/uapi/linux/amd-pmf.h          |  1 +
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 6f61076a9386..ffe74ebc46f8 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -130,6 +130,7 @@ struct cookie_header {
 #define GET_CMD		true
 
 #define METRICS_TABLE_ID	7
+#define BIOS_OUTPUT_MAX		10
 
 typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
 
@@ -442,6 +443,7 @@ struct amd_pmf_dev {
 	struct pmf_cbi_ring_buffer cbi_buf;
 	struct mutex cbi_mutex;		     /* Protects ring buffer access */
 	struct mutex metrics_mutex;
+	u32 bios_output[BIOS_OUTPUT_MAX];
 };
 
 struct apmf_sps_prop_granular_v2 {
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 7ccd93f506b2..3fe79f0f37c5 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -8,7 +8,9 @@
  * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  */
 
+#include <linux/array_size.h>
 #include <linux/debugfs.h>
+#include <linux/dev_printk.h>
 #include <linux/tee_drv.h>
 #include <linux/uuid.h>
 #include "pmf.h"
@@ -97,11 +99,18 @@ static int amd_pmf_get_bios_output_idx(u32 action_idx)
 
 static void amd_pmf_update_bios_output(struct amd_pmf_dev *pdev, struct ta_pmf_action *action)
 {
-	u32 bios_idx;
+	int bios_idx;
+	int ret;
 
 	bios_idx = amd_pmf_get_bios_output_idx(action->action_index);
+	if (bios_idx < 0 || bios_idx >= ARRAY_SIZE(pdev->bios_output)) {
+		dev_warn(pdev->dev, "BIOS output index %d out of bounds\n", bios_idx);
+		return;
+	}
 
-	amd_pmf_smartpc_apply_bios_output(pdev, action->value, BIT(bios_idx), bios_idx);
+	ret = amd_pmf_smartpc_apply_bios_output(pdev, action->value, BIT(bios_idx), bios_idx);
+	if (!ret)
+		pdev->bios_output[bios_idx] = action->value;
 }
 
 static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
index c7099e7f463f..d29a4abe1145 100644
--- a/include/uapi/linux/amd-pmf.h
+++ b/include/uapi/linux/amd-pmf.h
@@ -55,6 +55,7 @@ struct amd_pmf_info {
 
 	/* BIOS parameters */
 	__u32 bios_input[AMD_PMF_BIOS_PARAMS_MAX];
+	__u32 bios_output[AMD_PMF_BIOS_PARAMS_MAX];
 };
 
 #endif /* _UAPI_LINUX_AMD_PMF_H */
-- 
2.34.1

