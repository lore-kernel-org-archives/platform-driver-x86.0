Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDA62DAFA6
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Aug 2025 11:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755690686; cv=fail; b=N+E4iSY/rsCag0ghTWMCSPYf6g+jG0kUskWO7ObZxS5b1sRV0n1BIcnr5ecpwcof+Ppdn1E2ho73FkwSbmMy/spK6u/vXgd+e7pvw/bhwQUG2Z7Uu+dGn2/9xejRnYsZ/cXII0P1d94A/v94AbH5PQCPKsAxKIvC3LRmf96YJ0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755690686; c=relaxed/simple;
	bh=P8h1kxxVlz0eTLBK4i8tSwGX7fUMzKc+6yajYN+zMFU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rl82l30v8IPU2tgxMrdsUzXTYg/RG/zQTLFKOmDkMpmpt8kwgA3xn2s3Ce4fwobpaFCL8M68Rtzdhoxl7dYuTzEzOxbXw6qoNQR00CnT30CQvJb86S/AF4AvMY7br0lzLvBDc7F9uWXisjNo22S3Gztusx6QA33pAenarehQ/wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=godlCqba; arc=fail smtp.client-ip=40.107.243.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="godlCqba"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNVFLsafWo3BpkewqquYY7aCStB8sDn7f7EqZ4QLXlqZP7HRP3g/u0iyH2VKAGpONXkbWcLbFlY/1pLkzc4+RSn+E0b4g40VHEfn7sJamgpbz7iqIUYNEdzrAHEce4x93gY0GDg0JMp+2gukVEb3Nocp6ryq4067VtRryhaDGKLcXRz+0lGkuDKQ3jWUBVSIWlIaIt4mdL7LqrqPXnkYrjCFQ5JWJ5SEkLmm5D47MqlPmZX9LQE4c28bHJf+iG8ERgGef8YcYgtVwov29CjELoeBjpzj3XXJcAMORyfBrLb1jfpKPW/xJ3qKdjCavmcS5ksNhxZcQ78U2Kyrzvqcxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCMEmctqrQ5+NtrEED8OIypoBg8T3jj3Go2J/Z0Wfrw=;
 b=qGLLp9bOFOzM9lztbv35Q0P6VtZ8zGHmgImVm5oXBIkA3WgBALzzzZrrFk2K1TyKHX7QQ35ej+x0NeMCT66ecsZEeNyoe4KFj5XRqhebJIX8v1QE9JIbXIzKbBFS7AEHgHGSs8Z1oMMZVdMW5XVCrXzx6B2i8HntHjrYxUGRh7+3OPPc3E7lswq+nKbJgW5wxQg++CjlctjDa0sESHqoUdnxfFZW4inYrIPLq2tJPKpKtGf2yK2ixwYffcm5WbBuvMXYsWV17N70/NECMDEF6Bs6eYo0c4cj6d+W8Oo6vsOdwBo0DK/z72aXmAIQRU0CYvC3M+W1+7w5a+lErWVZvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCMEmctqrQ5+NtrEED8OIypoBg8T3jj3Go2J/Z0Wfrw=;
 b=godlCqba+kn3+9r2Bdjl4Kq87+YF4xD6m1nN7aVkVy9w0UMXfiTk7KiUzkXtl66UeFImCWkD3uX7nFGyX/qKcaqkW3X8FtDaIFay5mF1L6d08fuzD64UdjxFxVAtJDSmGTj2ZQ7MEhEumUPnByXO/nBG2DbDFleTpGQ/GfkUEQ8=
Received: from BN9PR03CA0304.namprd03.prod.outlook.com (2603:10b6:408:112::9)
 by SA1PR12MB6847.namprd12.prod.outlook.com (2603:10b6:806:25e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Wed, 20 Aug
 2025 11:51:19 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:408:112:cafe::b0) by BN9PR03CA0304.outlook.office365.com
 (2603:10b6:408:112::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.14 via Frontend Transport; Wed,
 20 Aug 2025 11:51:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 20 Aug 2025 11:51:19 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 06:51:16 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v4 2/9] platform/x86/amd/pmf: Fix the custom bios input handling mechanism
Date: Wed, 20 Aug 2025 17:20:04 +0530
Message-ID: <20250820115011.1448026-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820115011.1448026-1-Shyam-sundar.S-k@amd.com>
References: <20250820115011.1448026-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|SA1PR12MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d9f3b5-b778-4e22-9fe0-08dddfdfe051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o/kX5U0eT7dW1FBjWRUbtwQARSwakc23rqTh18Y9dhaw3Yihhd0Qmm5gvtU+?=
 =?us-ascii?Q?0O7TpuqqtQ0V3VnssRkDHf5BY3C/6CL5sFJ30F5Kc/IQocM25aDTCDhjFeIO?=
 =?us-ascii?Q?w84illGl2sE/dSQDyOVcXoF31tILIMm6WPox6KMfcFy6y0Uxgv+tT/TzayWj?=
 =?us-ascii?Q?l+43JSgHeZNZK5iptGum8ldjiQp+RPJYLZSJcN6nQKafGuVYzMvQb0M0nNzq?=
 =?us-ascii?Q?d6O7fod7P4MEdk1T+wQwuWNZszrOzWN3cpGaN5pQLLEBEvjwhh9v8k4PDTHd?=
 =?us-ascii?Q?5Inq90mqfJpQp6FBdeuquIJL1fP/Xs9Uh6jEm3RyoHJly/OoUnFggd/Mg+gE?=
 =?us-ascii?Q?p0rhs8iuywpQloGFSN02sXdLW4snbtT/ES8s1QMrIzVaaEb6aXBIVbidfidx?=
 =?us-ascii?Q?iiC5sHC/eMh37jC3zgyIyGv+SCcvw+oSai9zLZGDwTv8Frk8yTTjJrk9bvgM?=
 =?us-ascii?Q?91rIwTql+b1wpZGUy4Z5bR/muHvuCz4M6sRENAFFIPm8GkUW8QKMleOcCjcx?=
 =?us-ascii?Q?ymEIEVu78qx0L8hIrtL7dI3Kifi5wpIxwA6FIZidyUfWGjK6Ebxv1lAstbRv?=
 =?us-ascii?Q?VmcRxjhv9vg7m2019hlYyvOJTGEzay1bvnHT+/UAreja2ghHVKJ8b39Ngt1M?=
 =?us-ascii?Q?Kt0l1FmrYNAZq8K0bqFfvU+qyks8L+kuwm+XwhZn7Dso/Qvp7CqjNMUHMITo?=
 =?us-ascii?Q?d5nMSPtOncf6EH09UaxfVNxny87doew5Gp7oHY6E3BXDQnQrxMOFlwU+QCqH?=
 =?us-ascii?Q?7UC67bwzomgYv8mWnU9qhgj5La7i5xt+jIA8HL2TfGVb5VTwej5L7DhmN3OC?=
 =?us-ascii?Q?k4y+RzJoru9VHebx1XmoR47PTG+nto2LPUkZsqUsuwegdV7FiKwhpztPTky5?=
 =?us-ascii?Q?qpfc3RbD5IKH9UiUWHMwxdgK/yfSEC3UaFgTZhOqUdJdFRnLLs8hYTOx5+Lf?=
 =?us-ascii?Q?8C3k8kj8EmxabWOrzTJtKAz2VfZAE+WcPcapJf7W8BmD361Rd6NbbkuF61nT?=
 =?us-ascii?Q?YX7duWpAsAe6ByyQ/Kf87jiPRAn8Ad8/jna/ZfeqXnx9U+WtXo0F9LCBTykP?=
 =?us-ascii?Q?EM1cCFNrvpDcEtESlBcnzhRWHhsmvGOTer6pGSuyMOrf9zLTEN5lnKd6JJpZ?=
 =?us-ascii?Q?ZlUbxW4vOTP1h60Gc/lwgN5T7V6eu4F8hlSSrWzwuhStscSEIoVqqniJUBnD?=
 =?us-ascii?Q?hDDB3b/7dJMGH5xmOK9PWmpkY0LXNMTsRV+bDx2EXRu6AQlSxbcvd6eheXi8?=
 =?us-ascii?Q?t0l/eLfiiIIpTEaWPcwhu97f2dMGxBau5ruq7iD3kqH3VQ9KUqPL98Dj4axK?=
 =?us-ascii?Q?buyh2lw+Hr62mnz+sGhN0SN4+pspONRC/OvYfZpvuI1k0n3/WSRvxGDeqyHY?=
 =?us-ascii?Q?kYObRXpwUjhMxzgdY1auehvi6Ty4RaF6j/ekl9D9WlcldcI18GO4iFmWW3wr?=
 =?us-ascii?Q?ioncW2Ux8IFnRy4TMUMEfJEwKH9PjJQ9c6OHrtB3NxT7nGb2NiYfFUDTz1eX?=
 =?us-ascii?Q?NFdhlCrhjJn5tkQgwtYUE5I3BxfGFTxsgC5i?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 11:51:19.0188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d9f3b5-b778-4e22-9fe0-08dddfdfe051
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6847

Originally, the 'amd_pmf_get_custom_bios_inputs()' function was written
under the assumption that the BIOS would only send a single pending
request for the driver to process. However, following OEM enablement, it
became clear that multiple pending requests for custom BIOS inputs might
be sent at the same time, a scenario that the current code logic does not
support when it comes to handling multiple custom BIOS inputs.

To address this, the code logic needs to be improved to not only manage
multiple simultaneous custom BIOS inputs but also to ensure it is scalable
for future additional inputs.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 15 +++++-----
 drivers/platform/x86/amd/pmf/spc.c | 48 +++++++++++++++++++++++-------
 2 files changed, 44 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 1a5a8d70c360..79defe2c91e6 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -623,14 +623,14 @@ enum ta_slider {
 	TA_MAX,
 };
 
-enum apmf_smartpc_custom_bios_inputs {
-	APMF_SMARTPC_CUSTOM_BIOS_INPUT1,
-	APMF_SMARTPC_CUSTOM_BIOS_INPUT2,
+struct amd_pmf_pb_bitmap {
+	const char *name;
+	u32 bit_mask;
 };
 
-enum apmf_preq_smartpc {
-	NOTIFY_CUSTOM_BIOS_INPUT1 = 5,
-	NOTIFY_CUSTOM_BIOS_INPUT2,
+static const struct amd_pmf_pb_bitmap custom_bios_inputs[] __used = {
+	{"NOTIFY_CUSTOM_BIOS_INPUT1",     BIT(5)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT2",     BIT(6)},
 };
 
 enum platform_type {
@@ -690,8 +690,7 @@ struct ta_pmf_condition_info {
 	u32 power_slider;
 	u32 lid_state;
 	bool user_present;
-	u32 bios_input1;
-	u32 bios_input2;
+	u32 bios_input_1[2];
 	u32 monitor_count;
 	u32 rsvd2[2];
 	u32 bat_design;
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 1d90f9382024..869b4134513f 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -70,8 +70,20 @@ static const char *ta_slider_as_str(unsigned int state)
 	}
 }
 
+static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
+{
+	switch (index) {
+	case 0 ... 1:
+		return in->ev_info.bios_input_1[index];
+	default:
+		return 0;
+	}
+}
+
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
+	int i;
+
 	dev_dbg(dev->dev, "==== TA inputs START ====\n");
 	dev_dbg(dev->dev, "Slider State: %s\n", ta_slider_as_str(in->ev_info.power_slider));
 	dev_dbg(dev->dev, "Power Source: %s\n", amd_pmf_source_as_str(in->ev_info.power_source));
@@ -90,29 +102,43 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	dev_dbg(dev->dev, "Platform type: %s\n", platform_type_as_str(in->ev_info.platform_type));
 	dev_dbg(dev->dev, "Laptop placement: %s\n",
 		laptop_placement_as_str(in->ev_info.device_state));
-	dev_dbg(dev->dev, "Custom BIOS input1: %u\n", in->ev_info.bios_input1);
-	dev_dbg(dev->dev, "Custom BIOS input2: %u\n", in->ev_info.bios_input2);
+	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
+		dev_dbg(dev->dev, "Custom BIOS input%d: %u\n", i + 1,
+			amd_pmf_get_ta_custom_bios_inputs(in, i));
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
 #else
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
 #endif
 
+/*
+ * This helper function sets the appropriate BIOS input value in the TA enact
+ * table based on the provided index. We need this approach because the custom
+ * BIOS input array is not continuous, due to the existing TA structure layout.
+ */
+static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int index, u32 value)
+{
+	switch (index) {
+	case 0 ... 1:
+		in->ev_info.bios_input_1[index] = value;
+		break;
+	default:
+		return;
+	}
+}
+
 static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 					   struct ta_pmf_enact_table *in)
 {
+	unsigned int i;
+
 	if (!pdev->req.pending_req)
 		return;
 
-	switch (pdev->req.pending_req) {
-	case BIT(NOTIFY_CUSTOM_BIOS_INPUT1):
-		in->ev_info.bios_input1 = pdev->req.custom_policy[APMF_SMARTPC_CUSTOM_BIOS_INPUT1];
-		break;
-	case BIT(NOTIFY_CUSTOM_BIOS_INPUT2):
-		in->ev_info.bios_input2 = pdev->req.custom_policy[APMF_SMARTPC_CUSTOM_BIOS_INPUT2];
-		break;
-	default:
-		dev_dbg(pdev->dev, "Invalid preq for BIOS input: 0x%x\n", pdev->req.pending_req);
+	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
+		if (!(pdev->req.pending_req & custom_bios_inputs[i].bit_mask))
+			continue;
+		amd_pmf_set_ta_custom_bios_input(in, i, pdev->req.custom_policy[i]);
 	}
 
 	/* Clear pending requests after handling */
-- 
2.34.1

