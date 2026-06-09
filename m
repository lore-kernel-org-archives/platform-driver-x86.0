Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012041.outbound.protection.outlook.com [40.107.209.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888DB3EA97B
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 08:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992713; cv=fail; b=USNsYrzjoxzf6GZqWlJAYWY5D4vpjDag46gtTehHEBwER5AkhcWZWYGIvUrpdbgmFSVfAZgTLtDF5BqZCkK7/8ty4ALnum0kGvkY3yHuVqpXDBJig08bTdAI7Ok1m/BHmzR4kvV/2oIoQn+tA0579L9owg72K13u9iOMC1eShJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992713; c=relaxed/simple;
	bh=C6/lQJoxEtW9K4nzX8VOUGaa38n7GRwEW4gow8e6W+M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BaXPmpan6TmfiY8rHy8LjDJrey/qGmZsCgEvULYdAkh82Fhv0bvPvj+CAhwxtwQkaxKNP0tl6tmL7FAR5QzACKQK4tEEeeHQhR6NBiYLPtz+azlvwm4cJRQWlArQSGdO75gxQv+kJjiRgDkPzmeaiKaAVJJYTH3QtPgP8uUdh3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vRkYJwqL; arc=fail smtp.client-ip=40.107.209.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vRkYJwqL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZqDetWVgy6D0b0XiZuArSKOxKbl+GJEOVdP1IPkSgbRV5u8mqJzhmpYczYxrN9Dfh1mXx+DQk7ROWNLfRMD0dfmrREBsW85vbox3v913mRPnYfx/nLB/hbx0Sesl+ergdW/4a3nu135KazlQN24kWTefj7LOw/RHiFfvbBpfGwuOOtkNsoRNQnYvg4dc7py4RrNEWb1qu60YYrGbB0ZL/1vdltKpzDVpV9jlTH1v5f9iUWWF9i12dBEhCuAyTfHOZTbpHszDuxl5Ikpr0doK/7aXAxqjl1UyofqCADzuOtkYh540HE3mtjHj7VcrI/w27IfNrNVxxvKDuitseTJqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnybiWl9sBqCGHsxCZDk+DT6CLbSckkpKOEyQUW9IwE=;
 b=UHYlmrjTK/SoC4bk86iclsqgPICS2elJ6zswElQ3cfBB2EnhxQWKE+ys0QIJ1viMDiByzcLCcQqUhc7XLEi/EUyXnTC5kSMxy/qiGW6KQEugveRv81FMEq9Sn0rOi7BCsxwSmtIpokJMrVBJpq2tVtO2ll1vGmZgkgFHNotw02QjfvDeIUN7p6BQMmMVh+NmizBPnFfM8ZuyvHhtwkKPlkk4WuwRfRp3ZBYH2R721O/3pqQGZFWO7R8A5u6bLalOYqtQUl73lrzuK+3wSrUuPb8vmyIvsMoaC+YyuiXxIKexlX0VVgRty28pcbJwsCgCUv4AZstCxUS4BzVBALJnOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnybiWl9sBqCGHsxCZDk+DT6CLbSckkpKOEyQUW9IwE=;
 b=vRkYJwqLhxq3B922tFuQg9CcIK2S5OEpaRTf9zCLndbVbb4wJbSEjQVrUFZcfhlZkIgntsj4rJjluYj7KVfBWqvaM3kBhJCejNdhVIZ1xw7h2d3SzFqWt0Z+8rnunfjp4d+vc6DlKZ3WbOJDZ8pt+/ibVXK217LtwAhnLU+q9xc=
Received: from LV3P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::15)
 by SJ2PR12MB8009.namprd12.prod.outlook.com (2603:10b6:a03:4c7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 9 Jun 2026
 08:11:46 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:234:cafe::25) by LV3P220CA0002.outlook.office365.com
 (2603:10b6:408:234::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 08:11:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.1 via Frontend Transport; Tue, 9 Jun 2026 08:11:46 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 03:11:43 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 2/7] platform/x86/amd/pmf: store BIOS output values for user-space metrics via util IOCTL
Date: Tue, 9 Jun 2026 13:40:39 +0530
Message-ID: <20260609081044.2416731-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|SJ2PR12MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: 20503cec-947e-438c-6ef3-08dec5febfb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|6133799003|22082099003|3023799007|5023799004|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ylmVBOm+U3C0yQLHprGtpNVPG2lv9+Hv9taMxPN/KGv1jruzpNV9q87DiL+3WVBtgsuaCxiXF9+L3iG3xFRqAtQnI73eDHcM7+QWJzLoOgm/EURMVIX1PAw4uf/y/ZteMro58sWKRqRzNNKH/M484bu58yQ8K0kEBqWcWN9amBLIoDrZhUY2hm7KfBPycB64DQgVeQ0Xviqky3/V7FxYSCPfrvKtaPeZ2k89yT+69Px+hIePP1/69oYmS7tP0zS12RBq4XJY70YMxwTHgSNOW90u2VbfmM+UrR5kioducjBNCTCyFnK5jzPad6ALsc2M7X83t8R32TBd7BklaFKd2PpaJ97U3/I9hyiYEtFeqCnde7tSmJUkId0eeqRcUBKmqySK9iXXxCnadKqeIYMzypHxAdr/ctUGKhyi5+ZuI56lA3xGTNc++ein5Fn5D9eEx4n/MLb91xZ1ABPESYOR63NbzI2q3vi5mFzzjjCP8eDZB0QwoCRV5kl8aj7EFgYKOWh7VyHG1FnbiwFMkknYbwwBEq8nXPPO3xRBGxBhV1mFLl6r+Or/Q2imDNG1eK9bo6GNrsRID+5MZaZlSOtA9F8v91G9X8if4gm93+iCxXX8yMWusXWu1LOyNhbYgpGkpl43EKAtCWMZ7HA/woesynitUIrkKK4uj2Z7idccX6bOo8cyioBQbMWET9I3r3rMpjIOrE073i6r/FKZnXI9UMf8ON2xeWPpqpTU5VKaKXM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(6133799003)(22082099003)(3023799007)(5023799004)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	g/yzXMneDzglFaEkJgzR31o9GQt9CDOwT1ok6YPIfumNl33+WT95WsaFGI3fbTm2HwtT4UXSkjo8mnLao2z+odj3MKy7cTR2saTnPOYzR5zHbBlgYelqQpjbQt0Jew7rHsh2ZGVV/3PYlZSaluTv5zgWGeloIahMjidC+SY21bo+ljgRvtXbjV16Hxo2FRvk70O6CnI3JA44Sc2fwjYVxEaUppmJjVqrid3Kzc8sBEwseMou74vzzU3nLrMp2SRXY6kqCWZRAuUHj6JIwxFgoHjEjW+1FgSYZGK+X6pqpNJKkK+lkbmI2HMYT7p6qbCQ4jwCUKLWsQ1tej456cvvP9vbA3/5Z44J3dfgq2nhQrr3kx0dAGaFzR3uGhBBIByO61wktoHH+TLueeqZvXmkqoCM+ixleIMEIFTf68fGHeQ20I0vvcR22jJWgDpSA2Nu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:11:46.1207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20503cec-947e-438c-6ef3-08dec5febfb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8009

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
index bbbd39b2ce15..90bc2970665d 100644
--- a/include/uapi/linux/amd-pmf.h
+++ b/include/uapi/linux/amd-pmf.h
@@ -66,6 +66,7 @@ struct amd_pmf_info {
 
 	/* BIOS parameters */
 	__u32 bios_input[AMD_PMF_BIOS_PARAMS_MAX];
+	__u32 bios_output[AMD_PMF_BIOS_PARAMS_MAX];
 };
 
 #endif /* _UAPI_LINUX_AMD_PMF_H */
-- 
2.34.1

