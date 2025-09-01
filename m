Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22EB244685
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Sep 2025 11:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724550; cv=fail; b=u6ySgyWjuDPpx2imSjopLPbm7yr7AchrbWvjyCKHZFnvovppILz+shH5YrQVM0cpiMSBVsW7AXinHt7VMHEYcpezGtgr/GmGC8OghTAjlnnnFiv1QOzcGDY289eMMJ6YUfY5C/mFXSK80mZa/wSyiZPSOH9bMAiApKwV/njhl/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724550; c=relaxed/simple;
	bh=qBR6vL3EopHD8goMniQ5nO1MFivxwuwaI6l8AyFgAiQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RzMG4jyE+Kqfne5JLJdeokocOWRW5ZJPLX16DiOcUUYfK8Rg11idBtVgwlxTIR4ahGoHfneoFrqSIT+tE3Fo9+xBpBD856/meI8A+XaaRk4YpqK8rirNlZbKc2OOAlLrwDcTm6iqxu9LLDMTqmVpmd3kSIc7ibEyNpQdZ4j8BQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dyJKFlJP; arc=fail smtp.client-ip=40.107.94.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dyJKFlJP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKJ61G/tznQf3bm6GNaOte1gvzyeNIL4uqQlFGzOwd63YlmLJgNYPxcNvkVpKfOFak4eKqDITt6UJGQb+ExZGTCZ1pOkE0Zc9GO9jSehUfok68xGIUaVdpu4sdOXS/fwilL5R0Bjs4Y0c3mlcXcfXzhbYLe7GqnichZgoYL2wJckA8NMqqO1P6y9V9+VO08xZ1K9x0xNrevlX3PVy1MHj3iSyZgzVsoYHxc9TnbvPP+IdWYNBVEERJQEHg5MPLsC3oXg62g3nUpbM9ojzRBMkC4E0p/bozXvwP8Gjq+zDT0SrHRCNKrdotRSAr3qHZCBGFe3TGUlDHd0cZE3VjjP0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wg7ka1iFLmAAEvokSGZJzMDmrowya78xmLLWEJXjpU=;
 b=xFmE9criXfaxJChgOh3YbeSgkvW3+ldbA6SOX21YQi9LWynYxFQPllgEAoNRAdqZGfmA+gYolQESe/MwvXY+kCIzT9UWJ2Uk2lmfXT8PKHlGrIlI7mm5eBflIb3XhiOZZrI5T1/h4fVEf8pZN+2uzc72p/CpecTDS6rfzdx3/dIEKqOuVYEaoy4JVVl23UkgZRglAX0N52vNA/kKQFAGfDzeQ/JHM9eeboR7DfSpVF3bwmuzzmp89RNDpCp76+rwxyBD0q463giOJTPzB5iaJSOBcEjbSw7noBkIX/kR44r8i+l5qYazXRPpvaU4y3/VUtpRsqp0u7Iwdxt7MAo1og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wg7ka1iFLmAAEvokSGZJzMDmrowya78xmLLWEJXjpU=;
 b=dyJKFlJPGxoyQk/fOkSkkaEOBLnMooga3rBAOhvQ9PDf8kRKYR6Q4Dd6MyuY+JCyw3hdpSLnQX//OLTRXFR5b7vknDRS+a9LFVvUqjwYFdBYGMsNOHHl7pZ0xXOIjVMe/mFvT2Vd6266/HifOD/28oEEsckDxQ6C/h+eY98pcwE=
Received: from MN2PR18CA0001.namprd18.prod.outlook.com (2603:10b6:208:23c::6)
 by DM4PR12MB6207.namprd12.prod.outlook.com (2603:10b6:8:a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.26; Mon, 1 Sep
 2025 11:02:25 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:23c:cafe::57) by MN2PR18CA0001.outlook.office365.com
 (2603:10b6:208:23c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Mon,
 1 Sep 2025 11:02:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 11:02:25 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 06:02:24 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 1 Sep
 2025 04:02:22 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v5 RESEND 8/9] platform/x86/amd/pmf: Call enact function sooner to process early pending requests
Date: Mon, 1 Sep 2025 16:31:39 +0530
Message-ID: <20250901110140.2519072-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901110140.2519072-1-Shyam-sundar.S-k@amd.com>
References: <20250901110140.2519072-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|DM4PR12MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: cad51ea2-31e6-446e-fc00-08dde9470889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3onIKnqBYBDToz3DXkjWBef9ogxgPJPPHg+lAxozICVakeEB3RNO9wP0PfTa?=
 =?us-ascii?Q?sAj3K0FRGyXGANqHUKQSZQktYtiDYmT00IKANZtOzIxmYbyqg3Ix0EvXZbJX?=
 =?us-ascii?Q?ElVzpqI0vUxmDN1r0KBMJwHbhhYqj4YZVvPajnKibe5yKV5NdS52F6E/lIfj?=
 =?us-ascii?Q?FdFpsWVobwHBwigDyn0hL2jNV2Z5BJm3cv2OUVXoU3nDzpmHvuupBUAVQM24?=
 =?us-ascii?Q?RcHVszc82rLqWVqoWFxMXRYRJVLMvPBJsU8hB5fJgFj4D3V4Oe6/7EDF7gh/?=
 =?us-ascii?Q?wb30eSD/7HsCbowiMnHLPtNqDftIXtNDVIuhsXzrr9iCwOfoVkdr1ng3xWrK?=
 =?us-ascii?Q?/4+LxtBDCznTZ81Kju286pQL6bGGnyYQoR9ftgUrzhz9dmedwEE8sAxyqL1P?=
 =?us-ascii?Q?R1GUXmvX77dvp5VDcYZTV3tLR1FQqpfroeAr2R620bk92PDPKluTfQy8zSfn?=
 =?us-ascii?Q?tJVDhfnW64HEkbavXBiD+cGcWnVEsaLzr5GH+ITzkixCuoQrZr7yRWX8JuSh?=
 =?us-ascii?Q?MXV7sZuTssUDJYolw4ZgeZOtMHd+eAvn7OJzUS46wHw0puYxRZn0vK92WcOu?=
 =?us-ascii?Q?dCJ+izVBmRvyurssGz4CDiYUu2uMXpj9hb4f7SIcxMrpp3NEniuTeC9ZjawT?=
 =?us-ascii?Q?EXxbMlGOlvyrODYr3vf2GJwp/14kvxHlh3k9dObX5YHzDsca4U7Caf5+jKZ5?=
 =?us-ascii?Q?mEz1VUX7czEdBXRMQrMFfw1Yb8Jj3dkjb4EU+o2dYbd1EcjXe1VvcdeYuzVe?=
 =?us-ascii?Q?OI+VFekaB1OkEO5ZvZMV/WA6cP3y3Mhc04hjC1b6lDvWdBG4ioATadgxBm7u?=
 =?us-ascii?Q?Bu3RZuZVveyR1rLBMM6fXd8MCVaEfbFghclZbZCv/sw9dP2YpXmQdC5Jjv7e?=
 =?us-ascii?Q?m6YPQH0iFd7X/CQ+D8+N6y8HxbI8no9Mqq2wfKFw3V8YSLHWsNtSTRTgrxwO?=
 =?us-ascii?Q?FYbV6c2y2q+Cpvg+iWp5gaIlpHLx0e/uMbck0cIQRkvbaltnyg0AYSUOw0wa?=
 =?us-ascii?Q?BUuTQiPRncJwkiHjfGAjm2dsuj/aHhWENngxe4xbztaathWvNVpWtEH7LF1+?=
 =?us-ascii?Q?pcsz8xJ4if9RoJXGLHTFcBz6oqL4E4m9pWA+HADkB2kReCuXaQyY7j3PMmMP?=
 =?us-ascii?Q?MvG2BFiLc0JYbFGEhFdRJ8p3qfq+JE1babCYInGbPPVVBWPPl9rl+g07AhOG?=
 =?us-ascii?Q?mjbvnf86oEH7ySUhM8qw35sZsJ+i1hSQppsN6YAEg4U9dWZ4XJqSlBmKmjj+?=
 =?us-ascii?Q?Lc7eqpNGGwNaojDLjAF7ZhtkZ/msB14y6MGyrK76vcQ9o3tAud+1DE6lgmRD?=
 =?us-ascii?Q?yg0z1lyrFgepguBr2zQXMI0W2YONaxzE5BgXMbbMvykk8ylbgtpQZYCXxan+?=
 =?us-ascii?Q?lVkFoOxWkBCE0+1g8pYPnA2nk+PTsXYcLqEcqeJ0JbG5YGe5vtzlzxnfBFJL?=
 =?us-ascii?Q?qYq2SL+8mz3T7qeF/ZBU4F6RY+t5ZeX0yDM0d85PrVV5qiLW6IurDx934SUO?=
 =?us-ascii?Q?Hg3qHzQsHrgSJK1bwc8i1nQcpoeYnUjv2DHx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 11:02:25.1251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cad51ea2-31e6-446e-fc00-08dde9470889
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6207

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
index 41c34c26ceec..1ae2323f3197 100644
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
index 6d2579f8cff4..bd19f2a6bc78 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -405,6 +405,7 @@ struct amd_pmf_dev {
 	u32 notifications;
 	struct apmf_sbios_req_v1 req1;
 	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
+	bool cb_flag;			     /* To handle first custom BIOS input */
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -885,5 +886,6 @@ int amd_pmf_smartpc_apply_bios_output(struct amd_pmf_dev *dev, u32 val, u32 preq
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

