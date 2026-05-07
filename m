Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011029.outbound.protection.outlook.com [40.107.208.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4712F3AC0E7
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165153; cv=fail; b=YdH7aZKg4YZ6kExzleUj8CGT2QCoLn/VwidtB8uORge7hN/oGkmPCE4pyTb+MAUNEsGvDt8DRRm+I/AW7AcvZd2xLBm3uaAtJ4+ODbc+WZJTrcsMLa8z7P0BOz4ogJZuqb/01Q52N1FXlAiBlnpaUmjsWFtmqicG98cw4/dsaTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165153; c=relaxed/simple;
	bh=yQDakMl3iNDn+QIpqrMk8/oW6LvN47ujvkHYlKISjic=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ebNT9PY5jC3RXcIG7fKnKVy0FtmozUwOQCYcfwj7TfmPyKtu3rg0Ahy5vs5VW9fO69IPIaZVfBP98IE5qXKaio34VOGpLzg1UhsYtXLStJPdPo7GMoG/BDN/Q5Rtg07YtmtO4kwE39/x2viUjIjPw/SP7Xm9BHGFFbDvo4Y2Kac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=brr76lxh; arc=fail smtp.client-ip=40.107.208.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="brr76lxh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycXwBL3BkdAdDWsvPA0UYk5Tmv5ggNlqSG/AjWKrgZYSYA4ZR2Cz10fXLm/TpLSPF5qGlHhnmtRitbtOAS5gQzX8JxRUSjGsBKIo+abIRNF0zV/HSj2e1NDPS+G60P/6oWKn9M3tzx+AtgfkxTlrmfOUHKnZbqW+/+e50UGMNu6Lfe/6tOfgTRmkca5E/6Gzr2yJC/I1Rsz8YA6207kTljDaQFiLfiYsiDIPN4yUJJvPoZRGZ3USjQIwMEiE9G0WJnf6xXdmFDXD0G6fEncQvh1krbSmcbbOUeK3GmwkMsiyEuN//dsmbPYl3OPFrU5nh1/phqmY7WdWsFxN2Lmy7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qQe6PucNI1k0Dkly8ZKbl8oZGSaYsR/TC/eoe9scSs=;
 b=vL6bwML5Vn1582/AuJ3YyY7mugekaCEgDiq4v+VM7ZeGZU2CndgG49PdgitPHytHZ+kxX3etSnQnjoi4o4USCjatv/7NueCM9c3eEyKOTbSLYhifI5vRU46JFrvUOxCW60zWhg8aA3f/nuIReDObZKhR5QMtN1YJSpgDkyV1bjflXq30Ejr0XIyNswBqestYuvic0szvLBDtts2tWK1KV/hTtdTEAjuFNbt3miihnMzcEj3xNLGV13b+rUYMFTZf7JfVQkPBqd8UV2DgytoM3jbM2Rot++TJGJ/whqZWRWx02j9nnxymfvIgPqrBdk7LFTlJdzvGy1eH+29d7jR7XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qQe6PucNI1k0Dkly8ZKbl8oZGSaYsR/TC/eoe9scSs=;
 b=brr76lxh4Ki0GoWO4tjI76ps/J01h5cHo07SmdeYSzk0thTJJYffvVIyVAiQhSTUI9TzzON89A8F0vKBmG87XmgPC9nfqP6JMWwtiJFsk1x+s9pox7ajQZJwVuqwunTtEsoamYIo0oLv2NPfVPIrpifJzL5YQCk+PffBrEObEbc=
Received: from BN9PR03CA0576.namprd03.prod.outlook.com (2603:10b6:408:10d::11)
 by SN7PR12MB6813.namprd12.prod.outlook.com (2603:10b6:806:267::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Thu, 7 May
 2026 14:45:48 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:408:10d:cafe::4f) by BN9PR03CA0576.outlook.office365.com
 (2603:10b6:408:10d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Thu,
 7 May 2026 14:45:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 14:45:48 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 7 May
 2026 09:45:43 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 2/7] platform/x86/amd/pmf: store BIOS output values for user-space metrics via util IOCTL
Date: Thu, 7 May 2026 20:15:19 +0530
Message-ID: <20260507144524.664001-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507144524.664001-1-Shyam-sundar.S-k@amd.com>
References: <20260507144524.664001-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|SN7PR12MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cb2b8ac-f76c-44ee-83ef-08deac4753d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099003|22082099003|3023799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JELB6q+q+TamQPxRw5r2yy0roPhAEvYhRNnOhDlAvgLjrwcv7dnYyM1ImHM5LDDyic4RePhWyXyNQGE3ov71wFb4k67948RI8GmPSGu1pzt76NOaWRtJBCuX7/g4Fc33WUCTDDblVYoBH+jEC/qBRIyMPji3KlxKgshonnZc2SqxLH6jq9PTu9Nzop5HvU97OSgvJYvFHpv5tvlkrSW95LyOxTQm8BSLrIoKfQhbKsQlbv+1h7HYekgglkxgYiiQms4m/7cxsy2CXRUB8A1roGv6fn7KvGl7xg6zJ9wwLF8dHg1RoDx+v2yyaEm4+y37wHkdmn4cGzPiHlKbPy9Gv48U03AJ0Y4YpWZIG+GKSGpsqimBPewwZRGCHGW8Y1BwKGP306CZO+W1zwxjR4pT5R+tY+suBPfLTDsbCp1km5QfnzhIx+7V7amoPDuz7gtu6ivOAV2OZoPY1bVpypVt+6feGq/OSM4JkpgHNMu3yaZpsRQrCokUpsOGob4zNaA+cS2HiCb/FIxzU68/cKFxQP0y4CfOD8AutTTAalCCwhJy6vd4o7g8kgy9bi6D6TPfJI/MZLLJQQy8UnUQGS0KzfvCq7FGhrFJzcqjDyoKgBO64r0b9Er6uyJ9W4CF0G/HXtOpOi1qdj6X/LxdjPyEvdTjcRWBlyeZ38pCHOhdn9od/TO4oAkFcBZwOH2ktTD93j/FoVEaiepwdscP7WaQe0bE2cbCzhcoCzR1/LyLaGA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(22082099003)(3023799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8PAOX11FI4hNQbM5jsi8e5Qii0Oy9VFohopd8M6rOP7qanIduqjAwG6XEuPVPqps1UBKVb9CPwhYriaETsCTNJFH2XY1HaDNDAzXCDteATqUjOi877SqwjWUnXiL6Bd4ezyRfdI0GUs8me9YhSOoocar+3As1BrTx+kpI7aeh0kMne20K8FHn5bhMBVoxoOdCIa6ZAwH4+V89DF7K1v+8CIuEW4u9whA6oWo+fzmO6PocL7/jSP6cWVir+RKDMiiv0Uttf5lSNhAErhsbxG9QbojeihvO8Wso39GL6GC3OeD3NWBJILZLTrI06TqmCLiTlrFeh2N7llv9i188DfLBH94L6PA3MuZNsrwAYflV+pmZnFJoCWJVw3FKS+zZLrrx9MVioJ04LFLnjjiATu4rU52EabKmd/+txLdE/i+P5mN03AbjpbcSN/8YHMU97Z+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 14:45:48.1584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb2b8ac-f76c-44ee-83ef-08deac4753d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6813

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
 drivers/platform/x86/amd/pmf/util.c   |  4 ++++
 include/uapi/linux/amd-pmf.h          |  1 +
 4 files changed, 17 insertions(+), 1 deletion(-)

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
diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
index 6682aadfea2c..3a30fd4f063f 100644
--- a/drivers/platform/x86/amd/pmf/util.c
+++ b/drivers/platform/x86/amd/pmf/util.c
@@ -58,6 +58,10 @@ static int amd_pmf_populate_data(struct amd_pmf_dev *pdev, struct amd_pmf_info *
 			info->bios_input[idx] = in->ev_info.bios_input_2[idx - 2];
 	}
 
+	/* BIOS output parameters */
+	for (idx = 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++)
+		info->bios_output[idx] = pdev->bios_output[idx];
+
 	return 0;
 }
 
diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
index fa6aeea38c22..54b5cf08f3fb 100644
--- a/include/uapi/linux/amd-pmf.h
+++ b/include/uapi/linux/amd-pmf.h
@@ -55,6 +55,7 @@ struct amd_pmf_info {
 
 	/* BIOS parameters */
 	__u32 bios_input[AMD_PMF_BIOS_PARAMS_MAX];
+	__u32 bios_output[AMD_PMF_BIOS_PARAMS_MAX];
 
 	/* Reserved for future expansion */
 	__u32 rsvd[8];
-- 
2.34.1

