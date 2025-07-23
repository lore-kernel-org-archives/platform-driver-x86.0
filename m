Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2389C26E6F7
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jul 2025 06:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753252935; cv=fail; b=l7tsKzWs+pikGoVuFYQKj4CzWRLUyR1+VSAqKoSpvTiF1zcuFh6bQ/aX5C5MdQc8oO14VbvEOrRgAF61mgc0SS0oabtJWjfgqHBFZJshhmRjs/0uAD3Vvvx20ODjYLmBKsV62aiLNJq9FsrIzkoaDImwcsvdv867CPp2x7wNJEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753252935; c=relaxed/simple;
	bh=FgWmzEoO5l5bLldOFqv+DOMk8wmpyin6YCsCLOSi1wo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z7APAxWCKFULuUEpPyFU/tdvwQ/XNh95xDfLLfWZSs9xG6TkqwdJyXYtLG8wI1xWIkXsYCrWQVJu9RG2F66P/Wog6GWQWjzt15Ws9gYoQyd7o9jMmoLl2w6ZxRqI5KLhEY4Xcx2JBpVyZQbHfwIakcw3d6+DguflN2OSKI4nx6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XZkm0AZt; arc=fail smtp.client-ip=40.107.220.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XZkm0AZt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGQbt+O64mYelzo0DWQGRtEcbvOiFMJoqKYtSp6fjFlMfps0ZQLeIxEx28rFQTgamS4tPBPqAR2KrwNRleNX2geex6SB4MIDF2Hc+U/jEGUYFRdowXZXYy1FDKC2QqP/CVgN4v3xgbjEWpshWkD2BpB+OH0VYfVQrdyNgTmoSr2jj3pQMTtfGshp0lxvs/JzYx9L76e/aEksIZts3CwlhtHoOgaJVSobM6i0zbQcn5tccMsQsrgRyczWF3hXJfGg9m1uSvN5DFvTQ4wxr3nV9NmaoBsGMH633oIKefuBcdQGYcyW8LSGtEN71UUqdJ5zIf6D7htXaSEfrXIX7sn1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dA7ZwoFxz5Gq/nhaLB2WNHom7I2nlQ1jJ1bhUq5GR4=;
 b=JoycyT9DLRchP1c/hWliuXWyTHaz+AReZuhCUAxDJc5dhZIaQAGNpFqPTsAF58TwyxT1WpmuiKatVfasGZaxdS/aMKHubGmui6+hyiVw/1YPVbBHOdMluvnktTMcR8mco0Y6qe428nmp0Vc2u/h6QVpVGcBYIKgwv897a4e5AN0CyuqTvnlyW+vEWAcOVCN+MRBbMvZPyJU5HF1pGiariJNjtqZmDlEWtCi+J2VnhIrJqcopZhnvMSwvLTxC2uW3wEbMx4T5v/Uezfvi4U7P5NKyGG5ubUEvPgzmHMQRd//J1fi9W4g4kwbXmCeka+3nvEbEmx/zC06OIRahSWJAcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dA7ZwoFxz5Gq/nhaLB2WNHom7I2nlQ1jJ1bhUq5GR4=;
 b=XZkm0AZtpav5tpyJ5s3FFPHtNwyUodRHf78z9l6p6U/kUy3RifwsxVALveSXyAobq+2j/pMiXi0d9cu03j/oWcHhYjV05babeOXfUViUVyH9LdtZ3vWqRNSVlrm/d3SiyimVgp4a5G5s1RCTIINmmCwwcz6cyD/NsCFVrmfOQ20=
Received: from BY3PR03CA0022.namprd03.prod.outlook.com (2603:10b6:a03:39a::27)
 by CH2PR12MB4184.namprd12.prod.outlook.com (2603:10b6:610:a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 06:42:11 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:a03:39a:cafe::58) by BY3PR03CA0022.outlook.office365.com
 (2603:10b6:a03:39a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 06:42:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 06:42:10 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 01:42:05 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 8/9] platform/x86/amd/pmf: Call enact function sooner to process early pending requests
Date: Wed, 23 Jul 2025 12:11:20 +0530
Message-ID: <20250723064121.2051232-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com>
References: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|CH2PR12MB4184:EE_
X-MS-Office365-Filtering-Correlation-Id: 625756b1-37ba-43d1-d3f0-08ddc9b40d4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RYZIiiUPA9WFc0Tduf7+wuoqye8He8TrjJdn7h0AtK/RusRfw5U3EbSS06d4?=
 =?us-ascii?Q?nI0hKafSfTqelDzwS8vgNO9gCXOnTaSwO52XCiwWo4jFuuRP/yHupGCfSBAI?=
 =?us-ascii?Q?OraYawTV83K9bq9JaiY8fi/pW39VOULM7kAQPBm9s7Vh+/2vEdKgYZPxT+N8?=
 =?us-ascii?Q?0ultJnYOrPaTvgcR+BANHUszKM3FqrUwAYAFiNyhPEAfg9bEAvo32gohnGoT?=
 =?us-ascii?Q?jbiQlLaypFdEJcBuIP4b7u0zb8A1W4szQTl8D0FR75POMXkC7N8IduktGYQw?=
 =?us-ascii?Q?4D7xkM8TtoFsDGJaLfa6FBDHinuQPEg3w3AEy4ADyy+9vTVoi0WRX43yH84Y?=
 =?us-ascii?Q?AHBWvK8ZkdpgQEsqnXp5IaTZENFmGvBS9G/gve3zLRnIVloI03JJIAD4fweF?=
 =?us-ascii?Q?qIazWJYfX6KNPTuGHyE5V+7amLVy7qYnOiFR5oUdRhR8eICl3CKVQ5fG36iV?=
 =?us-ascii?Q?A+c0ES050v+LW1eofnd14gMdawKlw3MvTpwWt1xHaVwWDP/TBJFUfGjsZ0U1?=
 =?us-ascii?Q?boBIeMf0SsGJK51SSQOWqRCfmQ1S6adJu9+ou4H56J1RVPDnaSGzbxF1Ir5A?=
 =?us-ascii?Q?/9k9t69RviUpRz1yE0gqudgC3aouiXImmwUXnSiSPypDVJzw11q4l6mxPgQ1?=
 =?us-ascii?Q?T+FapPOYdOcUxcIxihrQnzEbuY1iwlwUNTodXe5/I1FV/D29e1JAQ3iEa8Mv?=
 =?us-ascii?Q?8hDPB+BlAIl1V12SqDXcVOgdT0UEhd95Cx4AA2CuWj6DbqO8nkDgMNx8Zab/?=
 =?us-ascii?Q?I2kxe5oqz1qpciyowyCdU9M4/9iC3BoisRtomYVTfFAFnnWOUAQ6hPwhTu6e?=
 =?us-ascii?Q?jafxpW51zjQHv7WlgBPYAYQf9+o4ep0Xs/JElYx3/BbIURRvwgv3JO9jFtQM?=
 =?us-ascii?Q?Lf+QFTsgAg3AG77SeV3uo3+9W4F9lV3GMfRzub2NMXS9W77hGk4hI/R6rjcA?=
 =?us-ascii?Q?rzNjZnH+wVyf1ruE/ezMtmACP7HMjwtQt6wmJ3IHcR27c0AsJs02hfiSpAZ5?=
 =?us-ascii?Q?uEhUQVZAvFPbjykyUcOsI/VjGCkP8HYM9QcSWl0yUTK9htL4VoX6ITkMjdAz?=
 =?us-ascii?Q?+eQ1fv3GFvD5NKPkUcc1leSSOV9ceKhRb9p7iivjm48H7xKwHRTHSkNmnbB6?=
 =?us-ascii?Q?TPVZk9pRyV87qX7FSV0PHHlqJjJqUNcHWsROMcZwnsUyhH8G+BLFNHiQ1sGH?=
 =?us-ascii?Q?VE8f/+bX8Kr6e4/UqfbqZEt8r5+8hDhX51SZDCT1EdaIieNQxuufg+UJqYXF?=
 =?us-ascii?Q?4pXU1l5ztI2FWEy2OrP6AZ1M2HyMcEDYVmW5k7X2ckQ7ue9Srm8GVxaprpmh?=
 =?us-ascii?Q?BK987kNGBt+Px6isHIFVkkK255cw57VA7qIHlVXjbzsplflnrOCIbGWmmLwn?=
 =?us-ascii?Q?TQ6sQKNc5bMgxZ9N5SYnFn21W24hZ9w311DNEqxKbyhdexi0PJms8ZWZ5ewP?=
 =?us-ascii?Q?bkpCM2MYkMQKcq35czDxza7zkxHmyNDlLCMbhq0q+NsAZ+h1uQHNT0c+DtKy?=
 =?us-ascii?Q?kIx1pE3L5xrpSe1IJCns9tbGwuFS3fv5TeD0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 06:42:10.9446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 625756b1-37ba-43d1-d3f0-08ddc9b40d4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4184

Call the amd_pmf_invoke_cmd_enact() function to manage early pending
requests and their associated custom BIOS inputs. Additionally, add a
return statement for cases of failure.

The PMF driver will adjust power settings according to custom BIOS inputs
after assessing the policy conditions.

Additionally, add a new common routine amd_pmf_handle_early_preq() to
handle early bios pending requests for both v1 and v2 variants.

Cc: Yijun Shen <Yijun.Shen@dell.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
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
index c1b2bcc22acf..5a86a71a9a70 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -406,6 +406,7 @@ struct amd_pmf_dev {
 	u32 notifications;
 	struct apmf_sbios_req_v1 req1;
 	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
+	bool cb_flag;			     /* To handle first custom BIOS input */
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -886,5 +887,6 @@ int amd_pmf_smartpc_apply_bios_output(struct amd_pmf_dev *dev, u32 val, u32 preq
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

