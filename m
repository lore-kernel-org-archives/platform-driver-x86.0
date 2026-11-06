Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793983589;
	b=gmjoNKuAWQQt4fbkwCvr3jcDitJrU1W/UVz95LZkUsRu0GqlKVoFx/vX1FZL+TlNF4RH
	 JjNB3TwfJ5UjUv4x23YuEtFBQ4NEK65ZlfTHY05vgA/Lq9lBIoTlnw25tWTz2ko3AEtzx
	 /BzeNoQqfvny7qlxY5HV+ousZCph1dAIyTlj9u/jqDkrX4wOzECZa5wRWBj8SKKaEZCRd
	 AC3vj974p5WYnpztp9yEMnyVmezgPq2dJwrtFXWxWsDOc4QyLYKxTSSnvhVzY4BXzeTT1
	 lucLlUfs1s6wTRhAYPnGiWFBDWTKRvJ0Rq8I8ImqnlI5w+iHP/qCIjP3j2oLX8mpuEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983589;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jqYCC4jOPFE5HkZEK/f7GdDTmmQxrza0wnX/uDwBiko=;
	b=Wj8HHSiNA6JzEx443GrgKPdBGimKXWuOGgCZQQCZ8+C2q20T+MN7jc26Rc9ujPbO3/g9
	 fDYV5Jkjvf5coauticGNP6yCciNOsoU3sK3pa4xjHqwb1dlsoyq/WqtR0uvdEOjRws38r
	 UOxu9wMVKMI9B4PlSPgXbphshgyTRyOsIVS8XI6U/5DMFaEMqaF/SS6P4V9AwUcqYhhev
	 E+Im0m+y6tZv2BrWvCsDFA8fZf3tfBhU78WtGo4GWEHuNCTBhtX6BPqHlswV10swX4T/C
	 k+ga0GKYa5qsszNrTXB+L4GLRSgii2Kj7VDeEGjbqLCaC3J0nr6YDCqk+lcSeoVUf8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0BXCHhhP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.40
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011040.outbound.protection.outlook.com [52.101.57.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4797606A32C
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 16:46:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4797606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0BXCHhhP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzAZPTJsULOMjBw7WNkFB76PJRa8dkxOaKHZKCZplupOneT95B0VNvocx9Npm/xfycXau9tGwkW26wrIgo1R0cYHliLKU9ztXOqXh5uO6uQJOOxWoIroiesjzTsi4GVFUQKWRFmXMB1BaasrxLqC5si2zWepq0pNuCAvPvO/OBaRo/Y1pxLosTiNF07vtS4lRHWLW5BpmqR8cuLXgp+nVYvHhO1UrVMdqIL9tbJ/GKFRhuP27H2yb7YkCc1NFrunqiWOiJDFrpFh0p+YK4BYffAi5lDQFvI7Vf9MdOaTmQaMLipt76yWePl3jJ88eZUq1Dhpnpbjzyexa0KRgbkCJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqYCC4jOPFE5HkZEK/f7GdDTmmQxrza0wnX/uDwBiko=;
 b=OYdvtPQGeshS6zB67Q16Mv60cRX1EKR6DZmLyDiaJEyAgYrcpzhZltKG+co6S4tfLUL1ZYCG7sfKCj76C2OGH8zuxDeajlNBeCpn82rDMv8SSU0GUEBR9/1xp/0Yg6Uo92WWo4KObdMUkK+kftGGvhZBN2OE563bcLmXkcrGuHDyxjZLq83sMzIjPZYPmIOgLq94uE+edhjh3q+bz2lxPVt65qw8tyFCMBF3hWex7n5G420qcQ3ZccPv7ugmkgCS8svXR5Un2maHeFOiAFd/G+A9LN6HyL9wkNzjgjqjPjSaFs3Lq2Inhtth2pCJ7gu/h8+4VKtQuVNgCmCmKvC2Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqYCC4jOPFE5HkZEK/f7GdDTmmQxrza0wnX/uDwBiko=;
 b=0BXCHhhPTp/lgoa62awNiTzH+r3skoqwIG078PhdgFJJCcgDg8zf3qEdkkSIdaphQ3PGMy1Es0SlYVJ2+YceGwWRaooAxrjG1WcKSz1QQ/dW6p+JyPW5PSc/bdbzqFr+YzqQyKxC2niVuByvWDjXy8AqIszMyrKZBbct+2BxVCg=
Received: from MW4PR04CA0314.namprd04.prod.outlook.com (2603:10b6:303:82::19)
 by SJ2PR12MB8806.namprd12.prod.outlook.com (2603:10b6:a03:4d0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 16:46:24 +0000
Received: from BY1PEPF00026959.namprd05.prod.outlook.com
 (2603:10b6:303:82:cafe::85) by MW4PR04CA0314.outlook.office365.com
 (2603:10b6:303:82::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:46:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026959.mail.protection.outlook.com (10.167.244.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:46:24 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 10:46:17 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v2 03/10] platform/x86/amd/pmf: Abstract TA dispatch through ta_ops table
Date: Fri, 6 Nov 2026 22:14:22 +0530
Message-ID: <20261106164429.30738-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106164429.30738-1-Shyam-sundar.S-k@amd.com>
References: <20261106164429.30738-1-Shyam-sundar.S-k@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026959:EE_|SJ2PR12MB8806:EE_
X-MS-Office365-Filtering-Correlation-Id: 762b3129-0a4d-4313-6c9a-08df3c257e96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|6133799003|10067099003|22082099003|18002099003|261026140227099003|56012099006|5023799004|11063799006|261022105027099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	B//ys/uvzc1oyI+Eths5f0KofPOkEfyvhvrX0Y2lUmGSfNCUaRySJw2oIDAfwDWUORCHU9Sucl1TfblCaOzqLz3gdWE2ie8s5bScwbqnk/Rg2rcHS5aezuqfmBQcCMJuiTp6nVRCTDeuSYtYCFUYRRZGKR7WBmWp/RMxJN6oD0/jGr8w5fhhKcFSrrq+q10Xk1CZqjITqsFRn5P0xYnEwkXaMF/5W0CpL6355OnN2y3kJdkEfJN2EilUmqzJGemC9MUnuNcOw1lGTax1X38/PtPRuL5FB/kdfnsWUMf90Z5S+o9S2Gp9fufYKDUwFMDYL1l+3oOpWlcDlyL4+79fuQF/fX19dbaR329hkkEK5khfGhwnpGhYSJX+fpqZQSul9tHUpnHq8fHg+yTI3N0wPnOz/Mt8a+hK7oiaOhioKD7bRAVivXv111IH9hjkEqOaXfY1aQDiTNMXEJgclMQtJ1wpcFNowgim2SN96EtI5vAuMx8LYFsmLtDTuSgdUzpBHpL6GQToIe/p1Wz8wpjohT7c4e8OqwxMJ3u4HA5pXE4fr+cA4+r2LCuqCNAElY0tKALiL9iYBInCslwAp1v78vvbnTagbgVmedwoP9KeBB9yVQmpzdTvc9G5s98TlhoJ4/E6/nxbi+tCUAgBzPQY3aTUl8krnRwE6v0dExhc+EdbQUuVNzTv/k8VkWgNF3Q+xKllMnG2J4RvI9e45jX/RA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(6133799003)(10067099003)(22082099003)(18002099003)(261026140227099003)(56012099006)(5023799004)(11063799006)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+V/tuLQtOe1Ims0JZ1OdmTaBNqZL4LGO5enaRsr5bWnfUOsJ0aseMIDnKi7QbiT+w//cXf80RPZlljlO4ClRepM45rdFi1jS2BsQlSFjnVH+2z4h4l/3AfNkPBXW0OhnUkqJCmw+ekIjZvF7DS8nqzG3krZRfQ1Gunsgyxg6Xm2vgKBgHKfp2xBuDbkGNatoC6RclS7yKXchgbJddd3G3FGlOZI9EoTk2gM++Z8n4SJigaHkhCItYWCVwHPSECApwB22fjopL3h6r4YDzg/5TZxB4VyikLCORdw2uwu74E13Fv8X6sT5UZH59Gi76dghGj0QdOKlpxSRARM/uKPpqNT3vSyYiv/3wXDD3Q/LejIhL/htfSGN9lcEPwMZ+bv2x0lIkBQhNI4YKyvvRYU/Q9o6YwvMjbVpDTZKP6NZYlfAbc0gDutQ2EIaiAfTMuaY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:46:24.4484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 762b3129-0a4d-4313-6c9a-08df3c257e96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026959.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8806

The UUID list, the shared memory size and the init/enact calls of the
PMF Trusted Application (TA) are hardcoded in the driver. Upcoming
platforms use a different TA with its own shared memory layout, so
these need to be selected per platform.

Add struct amd_pmf_ta_ops to hold the per-platform TA details and use
it in place of the direct calls. All existing platforms use the
default ops, which point to the current functions.

No functional changes.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
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
index 96e37eb56591..e6aff9071d07 100644
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
index 226c3aa50500..378798fb3ec9 100644
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

