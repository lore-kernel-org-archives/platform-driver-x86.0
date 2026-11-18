Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795012359;
	b=i6ZTHB6WTFEaGVaEgIAYcpY01BGO0JXxJkSpqbzRhq2Bg5lIs8bF710A9r2Z3ZDqt3EY
	 26z4bi7imVTeyGZ6KRtbDRGcC49Sy9bYTBGw0NqTixF+fuPZO9mU8v0SizF3a+8bQQFXe
	 HVpbP6kjpmFJWPqmK/+SutCkHA6rj9m5X9uq3NLA1PYyQnqbtSa0Ox70aj7CsQyQzDt7N
	 LRPoeqNghplnXUgfsUg+2TYUXZEEwUbbN249KOJ2jOVN+/k+mcdst3iLiEeUx6icrIkFB
	 sf2ERMbM8i+T30SByQi6o1ARfgL7V6k6g6PXAdZ4EMj50UnYLlIXk4QG6Cq6vF4qT8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012359;
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
	bh=44isRdAuJpTESXuzCGLG0TtmXTmS0FOmVTV7yic+JRw=;
	b=bZy9jKe4IaakIX6vrMSxhSHhes1DGxdJavFE2UNLenw2WV5hGl+x/dBmUvkNg1MSmqZD
	 RrF6/3AyWfsq/fGrV9nR+ezrfB8fxs9cAPXS6xjupxz6pQzpLqdtCYAOr3F0L/juFNlNt
	 sTuOem2NAWSgrwuxTkFZj/HbbAFqidWFC9MMrk1zU0zw3eJWK+xYD43dImAFYTjTUPbvA
	 9/iar7MVIte+OFQCdCmjz0TI2xhLSulSh/sj9I2XlD/d9UV82l1gTwkxer5xx8PrjSO1o
	 PO78HgIs2OpDCxWbrd//wofdSItadgY5U0kdBoJrPA2axE3MQaHQK0W8NvxQqoH4oLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=eTF8EiPl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.18
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013018.outbound.protection.outlook.com [40.93.196.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425E9606A330
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 14:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 425E9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=eTF8EiPl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiuXDaugHkWECQn8AnFfIpR7r4M259WqEIcza/+IVx9pQ6Mo21E32jyJoB6uA9tgnZkfqqT79NgxAo1o6xNUdnSJbtby1xZqnylpA8KpyphZhBFYuBC34kTg0meF60BeE/3gYND4i1kJNhi6+sdXghy8gzD/nMfRD/6YfOZtl6LLX44G4NyzPmdDmo6MHsbE6Om7HIXt3GEV7S2gnJtbI3oqasB1mzu5MiFksJfyloEHRAAtARnu+MJVFeFViHiTK4IE9N570C/PzL0EoQl+vsOyE4eQC5DxFl6EckJlckLMjDe0zg5geYJY23zYvFT+vmqpziEA62gdWRnIvNsmXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44isRdAuJpTESXuzCGLG0TtmXTmS0FOmVTV7yic+JRw=;
 b=WBRzF2JhAD2QIsKGflPDxxiQ74QaJcm/Ox0VxiQrTgBBqBMP7aPNgmnY2SeD479y7lp9NzK0D5iet8fKN/P2qqVm+S6Cp2w1FKZwSsRMSdDg4MoyrXBORs4ZWAhReOtYCXAi+WMDmkkdpMINwiH9XJwrK07/py+0eBvEfOyICGpMWG/2LIN0ZxQGbZw0rTbwV44HMuEsO8TmltkkTjYkwF+VLN9cZfY2hETWKe484tC5CvajtNPrBtpcmgOnKThLBAtXMkinkqsooz9rPIa5grYFamEOJe0KUcisoXjB5hYaosBuV5aush1lcXtdt7mUTpIlLouE3QM0BOXMNrJBWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44isRdAuJpTESXuzCGLG0TtmXTmS0FOmVTV7yic+JRw=;
 b=eTF8EiPl+kB/75nyCqk2ZqGKU6y0n39YaGrYYTaYz9n7ASZ6aqk99bYAeoMDhARXLhGEZRVIODmrFxvAyAc99bMpYXFDPyJ6MybRnZLfndRQzt21L9FbpyfQgdaXMMIzP9KtpAk0BY//bY6LN4j5E1fgtDXmRRqCfmt9rhEgUCE=
Received: from CY8PR10CA0048.namprd10.prod.outlook.com (2603:10b6:930:4b::14)
 by IA5PR12MB999302.namprd12.prod.outlook.com (2603:10b6:208:605::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:32:34 +0000
Received: from PH3PEPF00059618.namprd05.prod.outlook.com
 (2603:10b6:930:4b:cafe::58) by CY8PR10CA0048.outlook.office365.com
 (2603:10b6:930:4b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 18
 Nov 2026 14:32:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF00059618.mail.protection.outlook.com (10.167.243.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:32:34 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:32:31 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v3 03/10] platform/x86/amd/pmf: Abstract TA dispatch through ta_ops table
Date: Wed, 18 Nov 2026 20:00:27 +0530
Message-ID: <20261118143034.3566684-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118143034.3566684-1-Shyam-sundar.S-k@amd.com>
References: <20261118143034.3566684-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH3PEPF00059618:EE_|IA5PR12MB999302:EE_
X-MS-Office365-Filtering-Correlation-Id: e3599cd8-4b5f-43ec-6e36-08df4580c911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|5023799004|261021123027099003|261022075727099003|11063799006|56012099006|261026140227099003|261028144727099003|10067099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ZJDrA7qmHyw3o7UcSxY51Gw3a44i1CSScfZ2K64nsBj+2TBE5dR0LqeZPRcoDUX8MwctIJjEP1/i4nSVKkUgoLrdfGOQuwZOsIvoilb2zPYV4OI6mk6syw8pR6VR1SClg9MKzmcD0mnTgcYeDQfbYDhTdbM1zULtFz0RcrR1izgdnKddAzXLArqEziVVnJxhWCaRZaHy4BYyefY02KkxXo0LQH/IHlbw2OLAdFc5rieiZWp8YxrnJVa0ebbK8sXBWDk4HPXrXpR6S9M1STfMZ/oxCMhpj6BQLDAIANAed1aKlUg0YCZ0coQMbKWiPWeKJkYSls67VXpcmUYJHbnz6jcbrUr5AqBc0viQURBZVc9+05xgVv/8q+2mbfdXtl/UkwW5aLWjI6S+JrbegMcG6NpyLCEzWmu0TIE3nfWjKnHbFhZxQn8eBoK7a57YE/xABNVCH11n9T5f0bbuFYdNDUf3ZXjYAuKmbNc81RyYWdUFsaBnFMDRwEYHdYnCS4D6P2kxoDdaegJrA7lymUWMxQCiL5O0lMTvvRBgraIT4WnIe8aTui4+e3JUUVdjLCXGO+j24+gs7jffuyKP7+SBKeK77gZC8Z5T+aMwvTjgzw9f6/KGsj1/soA9sCTB3FMyfhNLBKxdInOQl/m/xsmIiRk0ADlVh/As6d0RO06hXthpZiDu2GVsHN3IgxYA9ppNx1ERxBfyhH/T98UeMMg7gQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(5023799004)(261021123027099003)(261022075727099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(10067099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k8PRQrfJAvdQqB5+aeWLaY4clV8A1zmLlejoAoP5nF836SfahiZLfNfb0Z/z5vsSpzkbLy4HY+GIpzCt0nQWxl489D8dofNCzcQPbsLx1/fOYBYdfbDGuZGR5QoApbqSzQwWcFMwJ7bdCFwf1R7n1ZETCkvaDsD67Z6+5xcQeuli/hA61jB5xpCKq+gI8h7XGIX/1Ed9puqll16UBFdZgguAfIrck7gC7SrI+l76sBoJku27kPl2heQzsaRfwva+WaSHG1yGrlNOtZkLW+NFJWuULF/BRB49WFky9YSy6WotmB3GHCkFy2SbpKgee+zBlKpKLScFCkXHI/3G7uyZdcQj5ZTNKR4Wt6cNy7f1pvrNco16tpVF077aZnIM7pCG0bU4G/p+QZABLH4BGUouB2by7XkpwjOL9C2oN1KJ4UllPf5SY9zjWIb81jgd08z7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:32:34.0603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3599cd8-4b5f-43ec-6e36-08df4580c911
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF00059618.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR12MB999302

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
index 19b75609f554..55c893552050 100644
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
index 2ed2ea4abeb6..a0f2b4be1369 100644
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

