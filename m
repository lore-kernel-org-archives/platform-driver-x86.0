Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830362E7631
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Aug 2025 11:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755690701; cv=fail; b=fIQ/t5buoCQjijzAR5MF5i+krJd1gSWBC8Gpz0fHOlae5T5JrD7e9JPPCGgBPA1PowvnpAFbFmYW/Lg5yLtDMylEZ0eCwA7uaSd3hH1HTfKSW74GJdHVT8l8R0kspHheglmPV6x+fRJEMefoUqpl+ijIXTTe8NQ5ljwOY9KB46M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755690701; c=relaxed/simple;
	bh=OwPGnocnkNUddxHQABb7lJ5bZYBpxsY8cNC2DryHIzQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JXFW4a7wmPTpKHIHXRT9o+/3SIRnHST6XEhasq1BJj1H6s5liGbD6i54ZnULK6KghM5gj4cchR+trJzhZjciPyVLNsnoynhSkYl9isSKM44SQjFCYNKXWGqlO8VkGSAV48YUHlcQaltwFc3A2Al9fpEJqxFrA8cKhBleCNxRB1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HvWndB9z; arc=fail smtp.client-ip=40.107.220.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HvWndB9z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhg9LWmvOV9pDWx9KPjRXKCd8sHWs6A6bHiMTpdMZZ2l2/vf7FItqEI77AjZqa1mAaTL75S3tjmnSZ+UtrUOXejMAxy2//AkAYwatgkx9iWl4W5FNa9a72/1W43qHJs0CakaOmYvBlag5dUwZMBvj45DzGvnmQKFoBEmAXBGOwsbFKQ98TIjOnkHPSjsDyT8GQJzwJCh/k+BH1HrrMmttLz9E14tpwYMUK2SsxyZGpBO+pt7JA6l7F3F7NWgk9K7DXObgyfaRtriPEcq5VwnNPdKyeLA3AJtJj8gIdUAJQL0nPKnUOxjWuH74oJIDGrLr5fYNTqOC+L2oJsKzjyOFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49NXRgZ4D1Xwhk9GpofxZ1eS3O/DWeRThPGoHl12Cus=;
 b=NV5vATThIcPsETAK7+XYKPIkqXj79D/flDOXZzzAqxIDd5peN8S2IOTmHDQccYsAxeVfNiLM0GwRzaYLfbJKI3V/WICuwpFKHNMADSR6vKWbSZzDWzamuc2EQKBvbJRQbKwSQMwXNFvYwXEIt6y3IFAAN31dTCqxAxj6jplGAG+dbfjCO0MajXm4EAweh8hC1kiolfMGDEaoyoUo+VMx5PEkYOMLKuWbDpY2w3kzgdQcrdtIm9EgnTGdfjCal3EXqpxwq0QmYwavXa/tNkURqUdkmKX7dzw7gOZexi/s8ASAlAY+NlfMFO3osjx+hzwAJOJXutJvpQKyTl+21fhZjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49NXRgZ4D1Xwhk9GpofxZ1eS3O/DWeRThPGoHl12Cus=;
 b=HvWndB9zRAvcRbzgGhxOBuV+wCaKjeOrZZ2swQ4AfZ8AnxzDtLrX1PMEZI8WQNdf6uIpjngGnbEvJKht/vMEVnmtgbGVq9u+/KrvRYOhVX6O7NnLvnjxKXVk7DX2Ka7JLMYQBiyc7F13LS8SbtQIMrNBD3YxsW0ASkeL/fL1cVI=
Received: from DM6PR11CA0049.namprd11.prod.outlook.com (2603:10b6:5:14c::26)
 by PH8PR12MB7256.namprd12.prod.outlook.com (2603:10b6:510:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.27; Wed, 20 Aug
 2025 11:51:35 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:5:14c:cafe::30) by DM6PR11CA0049.outlook.office365.com
 (2603:10b6:5:14c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.13 via Frontend Transport; Wed,
 20 Aug 2025 11:51:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 20 Aug 2025 11:51:35 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 06:51:32 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v4 8/9] platform/x86/amd/pmf: Call enact function sooner to process early pending requests
Date: Wed, 20 Aug 2025 17:20:10 +0530
Message-ID: <20250820115011.1448026-9-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|PH8PR12MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: 967adbf1-e1b7-4051-abe7-08dddfdfea04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rj0ohLPwvLuNyuGdjLEozXs0m5bji+k71MVliVY5ryfCPZbA4EpII5LBL7xV?=
 =?us-ascii?Q?IxhOjwQqg6AeFVuuvCT2bTsaoijFKwMTOsykbuWXBlfRJjkZhpch/mD2ik4l?=
 =?us-ascii?Q?nN0TolPpPKiErdURnjWR69bUyOauk41ktrGysV9egnoMi5TgEuST1YKT39Su?=
 =?us-ascii?Q?BsxF5aQFk38tbCZse1kiZRrJphE0jPrIZv9oDdt5kfAf1EqlmQtWyRB3QyRv?=
 =?us-ascii?Q?P75AHLbdIvV4zbmn0sWRB+E8eygFTlMEkyfYE0nONlZRqRgMuFCubNd4cJhV?=
 =?us-ascii?Q?DA9Ad49zqcFTEkjc/X2n3fjKvAM66Z3QuCtBnNIaJFXWQfXnzwUv6X0tcrG9?=
 =?us-ascii?Q?DNjc2xZEHK5Nrlh/gl6BqlC4i10ODRXtK02xuuMzNplQd1Ze0BVGB5U9cQbR?=
 =?us-ascii?Q?g+rfEcKV+j6SPVpOE8MW5MZJDp3O8xMG9wu4VHb+uWrliCJSEEfZ39tQKLla?=
 =?us-ascii?Q?meNBWkcP/21DaHlmnWmfhnCUl9sT59wn/nRcU/MR1yEVAQzQGCcKwr6ztfaL?=
 =?us-ascii?Q?J44oQXpnjaVGDxPFimw3eYp/bliYTiAF4WpIHEJiGJy2H9DeDkN0o0j5vCOg?=
 =?us-ascii?Q?WFbiGh79HMc1p7mTkijxPBObvryzzoNvHNmMj9mifb57bJhotUY2fK3ohIYS?=
 =?us-ascii?Q?SPAe89nNGH5wJmJYv/5tAU3F4rji+QTdzwFyRi7tJ+VeH+Ze24GA+eyZixQd?=
 =?us-ascii?Q?UVQJ9gixjod7zAnB6FBiZ8lAeSUI/FCNaBzFgGfRx7P4g23ewyn2CCWRs8eG?=
 =?us-ascii?Q?NY4Qn32SPqIp/eY/mB5KjyAT9l+XEoFcUPrBDcPkft7KO0KXcyvBr8aIWnu+?=
 =?us-ascii?Q?MAV/KDyHJ5hih8VZ8s5yqmZDm0oLZwQcKqScjDTJjO3FwHrC74DN3hxgn7hx?=
 =?us-ascii?Q?xTlfyz5Em91J4JEgYcil6Vk12J+lyjCzbes/PbVrMnWZRUlasLu5lVLJndPK?=
 =?us-ascii?Q?Eo03ODAMED0QhQy/tZm3HUL0IEmUyDio1lrs33+pQ6lb4NSFjKsa9Y3xB77y?=
 =?us-ascii?Q?uPccPEoaDm54kxgJ+8nKTRjS6t75vx9ozdDYNpPyhiglyKJ/n9JPb+slAngY?=
 =?us-ascii?Q?PP4TzijWRbeRWit/ft/29mbNEiAqlwpBiOSXjGzjWn3VJTpDlAYt4Eg+qjFa?=
 =?us-ascii?Q?zE4CmBbUG1yNpk/A4RsN8GcdksYRJvHOasTTBkGgwIL6a/xj5uGiFgUj69C5?=
 =?us-ascii?Q?eNVwjL2+AeA6Fcss9A0e17sPgO0G+tW8tlmlTmmfhmoJYgdX/70Ld0mxqUkc?=
 =?us-ascii?Q?ylzTH6+ea/XJDxqYrVR6fdAX6RHPLjcqVPDQx2oqbLDPMPXoq4ajSYQrX236?=
 =?us-ascii?Q?fB3DRCmVqsd4/np8LyKv3P8Qe4NdKRGTp2wNvJRDwcdQ8+gVAZRwUPCF/+Xg?=
 =?us-ascii?Q?op5sn+ePY5mJ2jQY+QYGhfGp4DOIZ8sXOhsbvzV/yCnz3eJ4Dr5YOwzhVe33?=
 =?us-ascii?Q?dSkYJJzW69IdomWtRkfTZBe29s4xOTbTzVb42UMsG9DeGJFvCLxvXivR+I1V?=
 =?us-ascii?Q?QHP5F0YwTwJuf8OQE2kzZhyB82kU87/HH1u5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 11:51:35.2541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 967adbf1-e1b7-4051-abe7-08dddfdfea04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7256

Call the amd_pmf_invoke_cmd_enact() function to manage early pending
requests and their associated custom BIOS inputs. Add a return statement
for cases of failure.

The PMF driver will adjust power settings according to custom BIOS inputs
after assessing the policy conditions.

Also, add a new common routine amd_pmf_handle_early_preq() to handle early
BIOS pending requests for both v1 and v2 variants.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c   | 21 +++++++++++++++++++--
 drivers/platform/x86/amd/pmf/pmf.h    |  2 ++
 drivers/platform/x86/amd/pmf/tee-if.c |  6 ++++--
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 4b8529c9bdd4..7f95a8b6c1a7 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -331,6 +331,15 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
 									 req, sizeof(*req));
 }
 
+static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)
+{
+	if (!pdev->cb_flag)
+		return;
+
+	amd_pmf_invoke_cmd_enact(pdev);
+	pdev->cb_flag = false;
+}
+
 static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
 {
 	struct amd_pmf_dev *pmf_dev = data;
@@ -339,8 +348,12 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
 	guard(mutex)(&pmf_dev->cb_mutex);
 
 	ret = apmf_get_sbios_requests_v2(pmf_dev, &pmf_dev->req);
-	if (ret)
+	if (ret) {
 		dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", ret);
+		return;
+	}
+
+	amd_pmf_handle_early_preq(pmf_dev);
 }
 
 static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
@@ -351,8 +364,12 @@ static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
 	guard(mutex)(&pmf_dev->cb_mutex);
 
 	ret = apmf_get_sbios_requests_v1(pmf_dev, &pmf_dev->req1);
-	if (ret)
+	if (ret) {
 		dev_err(pmf_dev->dev, "Failed to get v1 SBIOS requests: %d\n", ret);
+		return;
+	}
+
+	amd_pmf_handle_early_preq(pmf_dev);
 }
 
 static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 52538adba5e5..0787077c4896 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -404,6 +404,7 @@ struct amd_pmf_dev {
 	u32 notifications;
 	struct apmf_sbios_req_v1 req1;
 	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
+	bool cb_flag;			     /* To handle first custom BIOS input */
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -884,5 +885,6 @@ int amd_pmf_smartpc_apply_bios_output(struct amd_pmf_dev *dev, u32 val, u32 preq
 /* Smart PC - TA interfaces */
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
+int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev);
 
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index b29f92183b2a..6e8116bef4f6 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -225,7 +225,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 	}
 }
 
-static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
+int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 {
 	struct ta_pmf_shared_memory *ta_sm = NULL;
 	struct ta_pmf_enact_result *out = NULL;
@@ -577,8 +577,10 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 		ret = amd_pmf_start_policy_engine(dev);
 		dev_dbg(dev->dev, "start policy engine ret: %d\n", ret);
 		status = ret == TA_PMF_TYPE_SUCCESS;
-		if (status)
+		if (status) {
+			dev->cb_flag = true;
 			break;
+		}
 		amd_pmf_tee_deinit(dev);
 	}
 
-- 
2.34.1

