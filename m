Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012038.outbound.protection.outlook.com [52.101.53.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACBA2FD69A
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 Oct 2026 10:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791713235; cv=fail; b=EJykKnsJOumwY1q4xt8QaXSGeepWa3gP8Mihnb65PI+Xbd2HqymIBHx92igrWRQXZFCUE9Op8UVKyu0Kk/ApgzWEmzv9aq9YARrCB710YxzssM3MCZdGyckAM47hLx1ppOi3lCeDGI8KukdGNWVSkBrnnTEykPVszEE10BIVs/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791713235; c=relaxed/simple;
	bh=+mX/yebG8mg30+DtnRQpsPWi9N7DlQb9s2kYyPr5OZg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dDLjZC8KcaUlO1qm+KlrXslG0ZEQManlEExtxnPzpI30GUIK0TkgRPYwBgG9r8mjE++IVdYkg4O+M2Ypc5AF7/NfVjlhrygCB8OlApgbirWZQ/ClZHIeYwygWhTSNXZkw8yhYaqa82H8dCpyJd8pcfZ358eL3sO+jP5FUO9FhZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=N1hB/Try; arc=fail smtp.client-ip=52.101.53.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="N1hB/Try"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJUyKvkp8Ht72S2BlvXXzKjWd14EkiuORcOhaU3LeJ98JrL9Angl9Rzp1R4Z+Us9cGtQPl6QEANn5c93n6jKO5Blywwm1E6ye2kKIyIrzgei0Y9s21gPiVX1ZJRFjr/hEv/FUAdBSNW1we9WZpKjkdyDJYPKpz/7EBxv8VYTWaLxINSvcxyE8HvMIFJSxcw5HSCwSaDH8tFDc/FMStwSlW1HCLKIN2vG9ao7owHrUx7U7wvkTbSUXphFHFaocG6di5ZFZg2ZcdjIw1hcMPtq3N153cqqpnU7vNpKky5uulPtF0xR1uvZJLoEecoSSCSYfTkL9x8q0CTsj5LkjVZhZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwyxHCjmuUeBS4+B2OFRRBJqC2hm1jsCGe1Q8cHxVNA=;
 b=MIF6sfa25doEgmsaXZTkOLbiNag+w3Yfkpu6uk7HqcdGKicG/DJl6zfQ/9Md4hSNy8EO37poXbWKvPiUHE61W/PLHxOA0tFQX5xPEWBWtgJogj24M5VQF16G5gfAISTOeIxRunpGNIGAYpKlaK+bUavW+sBluoycnroBfh/hByNvh9/qZw7KMYRyD15WJITsZ+yP+GaziHOGUBOskCCr16EhGotvpX+GOTeZj+DX41+2TSYAsbkk6nsRNlNDv0lZ0uPIBa9i3cvJ8NaThMFMKQ0k4S+3PAXaXVRL3wqLbuveQNAG7LpyS+f5amD7JasOh9nXh39KaJVRxivZ8mnW1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwyxHCjmuUeBS4+B2OFRRBJqC2hm1jsCGe1Q8cHxVNA=;
 b=N1hB/TrytusUdD/nf+kyxSVQHePZOIhlC3yU/MR3lZzc20CZRr4e3L3sT3B9Ymfwy2CPtGg3quf3CdCAyOVmM5Y5SJcqBXGqZeAgbQPm5IY4eJQqbPGk0xkK2qR0GWILddbBtOSygNQktdARkpVOw4mWgNEjF8+xDt2kvJunDPA=
Received: from BN9PR03CA0457.namprd03.prod.outlook.com (2603:10b6:408:139::12)
 by CY5PR12MB6455.namprd12.prod.outlook.com (2603:10b6:930:35::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.19; Sun, 11 Oct
 2026 10:07:10 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:139:cafe::61) by BN9PR03CA0457.outlook.office365.com
 (2603:10b6:408:139::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun,
 11 Oct 2026 10:07:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sun, 11 Oct 2026 10:07:10 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 11 Oct
 2026 05:07:03 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 3/8] platform/x86/amd/pmf: Abstract TA dispatch through ta_ops table
Date: Sun, 11 Oct 2026 15:35:49 +0530
Message-ID: <20261011100554.1841309-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261011100554.1841309-1-Shyam-sundar.S-k@amd.com>
References: <20261011100554.1841309-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|CY5PR12MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: 28fc26b9-158c-4fec-d166-08df277f6a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|10067099003|261009223027099003|11063799006|5023799004|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	APzcAgkKS7n6kvKH5vqej1jIAkmno38sthxJDs78R7XmcXTsrhUXASJbRjNWvo4gGMnesmW8VU85BvCfWjNGePLvQeUMtrE5ofkV6dE1UY+53eRMBPrSvjE0LJfdoUYYWLE/8Zh5jfq3XwNKud7WKm0Q3+xXzek7TtFC60ag4YeWMXKZ4LzbKt3N50SL1zKXBD2971/0nopPd6YNwBtYFrrKzCQgC0DP+6tMCLSEk95QmVlbqVA4Gsnn3UKXjiL99+NPopiid3NqXoXbvn7CcFlOBzXY06H0BPh5T/GQY/OL3yc6iHbXcmZvdJ1VX/F78gwv/Eyu5rZdJ9mgMW2mZgl4eqneqDZRGPvN0mLHfv5UFKdzYSzLjTgJnDD/fT4FMoY6DGp3aYDlgAOmncS575KSEA+O/xRa+tWYMdGc3YKi0AQS6zhMSgHeIoC0mmHLZ1ikFQArWJLKDZEXFp9CBhCoZdnBveJsdsIW3gdvRFGQzw3fbCiShFnoPImPBAC5gaLnHLk7GMHluAK72irsj6Y/V39IfUoJyqK5w6CQx4iGCcgOdjNqmaDwdPTsW63CUmycDopbSuy8l6FoTQ4W+yekNivcA4N0p7IaRMpoI6jF6Bl4aBypgy+b/4pwK8+QAnwjD6SJMp0LNhEPKwPQwzNAjGaKEaBp8nTd0w247T3JzjvXVNxCw0NkGC5a7kFkjVEontkUw/9gixDKzJODlg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(10067099003)(261009223027099003)(11063799006)(5023799004)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2ImyHDiAWLz1p0lLZq7iKxtIlS6NIbB0Bz+2awR+FMqqVT3VlA5gv7/62TvpurX9nq4CneTXaUCOteae9wDNcHX61hmUqmyLooJzzKqdjUaMX2EVuJ0y3OWkIQl0/HO7dHTMyi5Hp0uB6IDrRmeOB1+Rwt/oV2WeywtvCbYn3P4uCiRN0NTeUaPf16R8Yit/SZkQn2wMsezgNihce5qI8EWDX8PjdQ9iX2UFrsJnz5FZ1vt/T8bbFiIp4QqCGTB0gSlxXP2itpS9r7blrirJ7DGQdb5UwHLA5VHkFzBtyqJclQUHmhMeNs6Hf8LXfAyFPvx7CwOxp+jQZEB25XqEP5C9to2Fc2mNQ2L0+ZRkQfb4XI4G6ghaqkZL/2nBSPBr/teded1DkAZLZym4+D+gmSXqoquoInZB7+hc9i6/jEWA4yALmlG3jjx7vuTAMETO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 10:07:10.4761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28fc26b9-158c-4fec-d166-08df277f6a26
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6455

The UUID list, the shared memory size and the init/enact calls of the
PMF Trusted Application (TA) are hardcoded in the driver. Upcoming
platforms use a different TA with its own shared memory layout, so
these need to be selected per platform.

Add struct amd_pmf_ta_ops to hold the per-platform TA details and use
it in place of the direct calls. All existing platforms use the
default ops, which point to the current functions.

No functional changes.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c   |  2 +-
 drivers/platform/x86/amd/pmf/core.c   |  4 ++--
 drivers/platform/x86/amd/pmf/pmf.h    | 11 +++++++++++
 drivers/platform/x86/amd/pmf/tee-if.c | 27 +++++++++++++++++++++------
 4 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 4392bf0bc0bf..24e6dffc608f 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -310,7 +310,7 @@ static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)
 	if (!pdev->cb_flag)
 		return;
 
-	amd_pmf_invoke_cmd_enact(pdev);
+	pdev->ta_ops->invoke_enact(pdev);
 	pdev->cb_flag = false;
 }
 
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index f7df72d3076b..06b7f9f2cda5 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -259,8 +259,8 @@ static int amd_pmf_reinit_ta(struct amd_pmf_dev *pdev)
 	bool status;
 	int ret, i;
 
-	for (i = 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
-		ret = amd_pmf_tee_init(pdev, &amd_pmf_ta_uuid[i]);
+	for (i = 0; i < pdev->ta_ops->num_uuids; i++) {
+		ret = amd_pmf_tee_init(pdev, &pdev->ta_ops->uuids[i]);
 		if (ret) {
 			dev_err(pdev->dev, "TEE init failed for UUID[%d] ret: %d\n", i, ret);
 			return ret;
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 73d981b25b38..d9fa99c2750f 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -650,6 +650,16 @@ struct amd_pmf_arg_data {
 	u32 size;
 };
 
+struct amd_pmf_dev;
+
+struct amd_pmf_ta_ops {
+	const uuid_t *uuids;
+	int num_uuids;
+	size_t shm_size;
+	int (*invoke_init)(struct amd_pmf_dev *dev);
+	int (*invoke_enact)(struct amd_pmf_dev *dev);
+};
+
 struct amd_pmf_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -709,6 +719,7 @@ struct amd_pmf_dev {
 	struct amd_pmf_arg_data dram_addr;
 	struct amd_pmf_metrics_v3 prev_metrics;	/* Previous metrics for delta calculation */
 	bool npu_metrics_have_prev;
+	const struct amd_pmf_ta_ops *ta_ops;
 };
 
 struct apmf_sps_prop_granular_v2 {
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 3fe79f0f37c5..e145eb7b03cd 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -55,7 +55,7 @@ static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
 	arg->num_params = MAX_TEE_PARAM;
 
 	/* Fill invoke cmd params */
-	param[0].u.memref.size = sizeof(struct ta_pmf_shared_memory);
+	param[0].u.memref.size = dev->ta_ops->shm_size;
 	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT;
 	param[0].u.memref.shm = dev->fw_shm_pool;
 	param[0].u.memref.shm_offs = 0;
@@ -323,7 +323,7 @@ static void amd_pmf_invoke_cmd(struct work_struct *work)
 {
 	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, pb_work.work);
 
-	amd_pmf_invoke_cmd_enact(dev);
+	dev->ta_ops->invoke_enact(dev);
 	schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms));
 }
 
@@ -347,7 +347,7 @@ int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
 
 	/* Update the actual length */
 	dev->policy_sz = header->length + 512;
-	res = amd_pmf_invoke_cmd_init(dev);
+	res = dev->ta_ops->invoke_init(dev);
 	if (res == TA_PMF_TYPE_SUCCESS) {
 		/* Now its safe to announce that smart pc is enabled */
 		dev->smart_pc_enabled = true;
@@ -503,7 +503,7 @@ int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid)
 		goto out_ctx;
 	}
 
-	size = sizeof(struct ta_pmf_shared_memory) + dev->policy_sz;
+	size = dev->ta_ops->shm_size + dev->policy_sz;
 	dev->fw_shm_pool = tee_shm_alloc_kernel_buf(dev->tee_ctx, size);
 	if (IS_ERR(dev->fw_shm_pool)) {
 		dev_err(dev->dev, "Failed to alloc TEE shared memory\n");
@@ -541,6 +541,19 @@ void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
 	dev->tee_ctx = NULL;
 }
 
+static const struct amd_pmf_ta_ops amd_pmf_ta_default_ops = {
+	.uuids = amd_pmf_ta_uuid,
+	.num_uuids = ARRAY_SIZE(amd_pmf_ta_uuid),
+	.shm_size = sizeof(struct ta_pmf_shared_memory),
+	.invoke_init = amd_pmf_invoke_cmd_init,
+	.invoke_enact = amd_pmf_invoke_cmd_enact,
+};
+
+static void amd_pmf_select_ta_ops(struct amd_pmf_dev *dev)
+{
+	dev->ta_ops = &amd_pmf_ta_default_ops;
+}
+
 int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 {
 	bool status;
@@ -584,8 +597,10 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 	if (!dev->prev_data)
 		return -ENOMEM;
 
-	for (i = 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
-		ret = amd_pmf_tee_init(dev, &amd_pmf_ta_uuid[i]);
+	amd_pmf_select_ta_ops(dev);
+
+	for (i = 0; i < dev->ta_ops->num_uuids; i++) {
+		ret = amd_pmf_tee_init(dev, &dev->ta_ops->uuids[i]);
 		if (ret)
 			return ret;
 
-- 
2.34.1

