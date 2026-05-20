Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011048.outbound.protection.outlook.com [40.93.194.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3CE406291
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 18:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779303360; cv=fail; b=VoAcOjpDKLMYIRJOAsSOiVER+TSSW6/FQ6yBaMXjffZlkoxYU1XTKaGdCBSF+lpN7OfTNe4SqDBLxskQ/74EKHfOdS6FYKAzHMMglvX+QD/vIBPsaUJUd2J1TxSpnHUShLl/UYTGBjbkxz6JBh3XMT9cDWegOhGHZ7t18F8a5cA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779303360; c=relaxed/simple;
	bh=MmbR3sA2K/szz51B560kvgqSJX4RywyPywgSBaEVPcc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OPk7Xk8+rZ8Qf/UV+1jdFIC6UUoxDmR5HvbBlyAhU4KUpawUAdkutghqHfryoG/RICTM4s8dzLskZiS0ep24iAglbMW5+daq84Mso9WiO0jlmwXgjT6fJbo81yJwWxDxG+qU286csKGtMmXfS+mqU2pVCTyd2pekd7OBcSnHVmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tvBMfKyM; arc=fail smtp.client-ip=40.93.194.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tvBMfKyM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0DyfOoKvU3UzT4e2EegKrInwwoRHmzOki/UtcbirtiiLlRxhxMInS5AqMoHEtZMTqYI18Puyg/og7g59f/TNnQoIC9Y/sxpyVA7hPmJD4fSPfyQ2eqqr9peuiPXbkVSmuA8aDWJAgiFLvYXE0z7yUv7InB3sJc4+x9VDwRHinH9oKuqKGwjSZtEyT5MCk2eHNR6DZDzKdJNiEcSAbYlNN0ndXfROcYd2haa5+yV6gRNa/uxTwOxY/liw4MEc5MLZQ+ee82BrJAg/Vb+td3ibSUmA7JWNCvTkD9dlhJZb0so48f/shg4yL3RtcbpdElnkHlxGXP+GLXZZbPH8N1txA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvuLa1K5knx/Rm7d1J5XW8AlvbyUYeqFUAIe1ifB9jI=;
 b=UoQySmoYFLbAKHLZQRcHZZSHH632mtFbP7/Ms7wFKpj1Y9Rpm3o+T/0cUfPbIxzH3tqGVD9sUaBpjO8+s4XcQaMk8ysHNF7oEkCaTQf9+YPqOcqfm8v0f1bDJ8bIiLZcX2Zx7XmKnsjmvTJPYHgmjgOTDYI8sa1dXGdD+3xaD19WDcc367LpWbEJlLTxaCFxG0XGPMa3uhpIpLZsSimFilSstjL2VbKSOyUi2oT/GwU++jhufniOUSdTtsFM1JSYFNJ27XuPThitof/gTamqY8j9SdsV+uMk6TO7oj2RYY0i6TP5NVgEM10876b4VOFwFD33hJ3Q6sueR2Ut1ZjX1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvuLa1K5knx/Rm7d1J5XW8AlvbyUYeqFUAIe1ifB9jI=;
 b=tvBMfKyMtV9adI5gmhM6E3jJuqAyEPoNgRhpbZ0tVuLo6+WjHdo4N0CyMUbtQ1Ikg+NyySAVnOzyLo8As34Uk1cqLb2EK+JQfcGJwK8WDwtF5r3d9pBXhCPQEQtyjkXHim2r09QrRgCQgOYcNRPwR9bPDJHrEsyzAYjv5hNp6Do=
Received: from PH7P223CA0018.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::35)
 by LV2PR12MB5749.namprd12.prod.outlook.com (2603:10b6:408:17f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 20 May
 2026 18:55:51 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:510:338:cafe::6a) by PH7P223CA0018.outlook.office365.com
 (2603:10b6:510:338::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 18:55:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 18:55:50 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 13:55:47 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 2/8] platform/x86/amd/pmf: store BIOS output values for user-space metrics via util IOCTL
Date: Thu, 21 May 2026 00:24:18 +0530
Message-ID: <20260520185424.770772-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|LV2PR12MB5749:EE_
X-MS-Office365-Filtering-Correlation-Id: 84a419ff-7e6b-4853-6545-08deb6a1695f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|11063799006|18002099003|22082099003|5023799004|6133799003|56012099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	qZr8O4rd/2Be8RiRU8VU0WSBauVXfsp/9qNWiLrbh/pQGT172Jey5iKf0vXnniZiuaAsmqGAio7mvmK/vcfbnzdyRBuVnKsoa5Y7Hq4euuudu21YhOGSdDPuNMGoE4IYkryb6ZcVJfnb8Yb8RAyQY7j7mlfX7qQKXou8wlgfw+vX2ivS+DOZT6Kfy0Wu2UW4olPKErW0m07bqDsYw4vDrrurP0OmhJGOKdjnIQ7ujmgLw4mqSWSeXgQQlXJirLKZ00oo8aNwgXyqAtjoF7PhOFKkENhmvBsx9W2F8XllgciOvcXGSSpj8R3aeCg0doaMWSBH8WoTszor/LddK/q+vnEZSP2XoBDz8o4lXG5BB4Z61TNWFAOk4Lv55WYCfi3FFFq3sKldVseWAOEPu4GYuYIGWEAGz96EHwCHd0jtX/SRPSNdmkjLTEQC97fpGxILTZh/J+qJD6UNMqktngyGvLIGgHAz2utYe16634eqnOG0v+PbNyGZqvn0Zdn9+RY7w2ZJAHWokBaHsje+YX1X5FYi/bnEEe2WAc9fJOOOT53vFvonALo4WrsLaV5ZfkhCrNd2Hn497S/2RZAhhO4O8ugLuKchWfLEw7zS37vzj8xJadOg8T/9UuyO7RBI5Wb3gP8p7XA8ko7f9ITlnUzeXLkGm7PtLE/dF4Yg/X1zTM7EPSMHV049gvzArtGn+VMK/KczHnNrVYpbN+SyE2zDfdLcyF0Gi9h7Htn8LcPLHOY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(11063799006)(18002099003)(22082099003)(5023799004)(6133799003)(56012099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X0+KFWRQuqUBhU2g0BiZ0L0on0EdTSNLTKA6qJb+VyNVyQmfgF1Pm3tKgeDFYm+AZHgsLQY/4cS3HjxXzCnAgNaOiJuwAbw3QrxPLysLBa8ienJ5SXVHWOmFvAv2Yek0O1DbxSRqe4azyu/MSe40qc9z/xGOcX4hdIqFUXnJWGueq41cYIiKa/B7f04IiDw7w3IEVUW2tHgOcJ05PDYNQwkClTW7M3qlDwA805He5wypyGVDuVT37HguuzwheNa8jCX6wXQl41pJI1+1PV8jCjSZMDu6wPq0MA27yCLCHaZodyReLcB1fiCxNT8EppBGUd4wwu/CKQTeXCX4hYwGzZmg4bsRfdG7VCLwUc1ws1IdyPZMYPQ79anIccZkyQqz11waGzar/4an3rfWo1QqdHAwTKkbzeZskVsn4EC+lHe/5tH8O2EPr5yI7vJ/tmJY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 18:55:50.6144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a419ff-7e6b-4853-6545-08deb6a1695f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5749

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
 drivers/platform/x86/amd/pmf/tee-if.c | 11 ++++++++++-
 include/uapi/linux/amd-pmf.h          |  1 +
 3 files changed, 13 insertions(+), 1 deletion(-)

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
index 7ccd93f506b2..be8062c6691d 100644
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
@@ -98,10 +100,17 @@ static int amd_pmf_get_bios_output_idx(u32 action_idx)
 static void amd_pmf_update_bios_output(struct amd_pmf_dev *pdev, struct ta_pmf_action *action)
 {
 	u32 bios_idx;
+	int ret;
 
 	bios_idx = amd_pmf_get_bios_output_idx(action->action_index);
+	if (bios_idx >= ARRAY_SIZE(pdev->bios_output)) {
+		dev_warn(pdev->dev, "BIOS output index %u out of bounds\n", bios_idx);
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

