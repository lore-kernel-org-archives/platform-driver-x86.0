Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1B418D622
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Dec 2024 10:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733394021; cv=fail; b=MbStPPyzWLqjrBdl/YYzhOeOPaxI5Eoks3Z98EPEYuvzcTFd0I71gvcFo8SNbjzG8Mi2xw4C8W/dzhjdJShnK9A/ALPSsVvgJNvVw2ikchpAiParHKQOgAaA4ktmswQHYJa59jCZGLH/MT92W78B02fuBTcjdahXA3EtWax9sic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733394021; c=relaxed/simple;
	bh=ninc6BOvO8Sl9mduw4JyMhu28lbCwT6ybhiB+MRIvMs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lNbS1bGsNNWYfNUQaJoZSVFM032EPmyCjuMNblJH3xM35lhloag3Ruh4kxxV2Mn+8LuItSeopW69ccAsSccZrEoN2vYxVehtsifFjIw80dpfXg7D8oYkYZsvDvrWmXCiIqEZaXguA0XhoQZulrKCrN1tWI5cqCBZv7/7AuicOlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=J/GBcmOr; arc=fail smtp.client-ip=40.107.92.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="J/GBcmOr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzeSfPLksWIozK4f/ywLc5vt0XlnFIKv+smqoJidfHvaXPQ0IZvlnScA/19dr/eyjhJLGh91H8vQh3DAOJ3ndeyKsPakCfd6FIu0gHZGuu98wn1zC8qMXElAaqvS/oQCZTmvxds4Hg7F26NFU7of10dFnmmASjFgLb24W6mswQN8CLnNxrNxIeJX/0DjjdgsnsLhQ/P8DYxVJhdU6RxndrpWG5aD2rkLx+NYVvAy5d6EJ0q4LOtSELFofIP3nFciQCShXPKALDxtuWw5CEtqODyQYvvUwJjNwdkteEEzhpue3zZjHMTeSCJq83zJShqLdbJ/t/AtdiAVpVOAm/u5sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXh201nkBJTSGWQiOppsTlt/eP7YJqvVRq+a1RwB34o=;
 b=pkM7SankUBlichmrKVb5Ug1A9ZWMl6ZKWJZjmYQ4Bswi6F5lEvEyY8A5WpSOuen6HhrDHuIQPECS3rcJT4cj36h+qtb7gk+QANFpiSWS+g+j7s8qYa+WZVtniI67erNNuZ0K/zTAtxF+5K7BRSeAUiBrde6P2Z2nbiJm+I/EOCr+D1a5Vl97YBqRtdoeLHcgwRhjwP4PcWcDREMWW4Ibg6QPCShfBPq+AAwRl2sF2QEub+x0zULJ2ndo1W5NnPq8Vk/sPSqy+Au444hUa7nQGwtaWMlk/eAlAZs8ZuKQi/b2AJq5a9eEuNjc/DB5j0LS25CMErXJknJeo41WtFMvvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXh201nkBJTSGWQiOppsTlt/eP7YJqvVRq+a1RwB34o=;
 b=J/GBcmOrbgxDKGE6n5//os1Zq8XqCiTPTrfkMgN5pAfNjcfefu+WAL/+wxAqt+xA9BUeK24h4cLR4f9hEUwuaLvwEM3RWmpWRCCkKf28rxBJ5lqS+gomNVtH4tq8JDCuw/lNecsj3iHFdq1g/t4VX7quAXgtL4H/j5xXOhsaqWk=
Received: from BY5PR13CA0023.namprd13.prod.outlook.com (2603:10b6:a03:180::36)
 by DM3PR12MB9389.namprd12.prod.outlook.com (2603:10b6:0:46::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.11; Thu, 5 Dec 2024 10:20:13 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::2) by BY5PR13CA0023.outlook.office365.com
 (2603:10b6:a03:180::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.9 via Frontend Transport; Thu, 5
 Dec 2024 10:20:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Thu, 5 Dec 2024 10:20:12 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Dec
 2024 04:20:09 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86/amd/pmf: Enable Custom BIOS Inputs for PMF-TA
Date: Thu, 5 Dec 2024 15:49:37 +0530
Message-ID: <20241205101937.2547351-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|DM3PR12MB9389:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c1fab12-1923-4495-38c0-08dd15166790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8eVZF9EiqMy3ChPoCjDgRy9svO8z/ogBHXpmYHbWTIp3iHDzFguIQ0JaP8yG?=
 =?us-ascii?Q?2aEt7kKHLE/3hk1URF51Yoqg8b+FInn5ft+OBlRCDEivd09T48MM3WXj4Wum?=
 =?us-ascii?Q?0kXnO86lIz1WTxR+1dJwriiteaLQ+/r2NJz/nvKog01AJWg0XCN9Efm6aNHE?=
 =?us-ascii?Q?htNWucJmFBC2tvMqSXNb5ov5EoVBkYRegYLLXPfV66N8lczQc8U4fsBb+Rfy?=
 =?us-ascii?Q?ZZffhoVuYKCCENYMvD1UcfbD8eZMkWvDpeUKLabQlZRLInekQEESKiGe2/gh?=
 =?us-ascii?Q?qcYnuaKH3wjKT7jwflMHp1TDFy4e1xgiWt1RBJbvlA7Futop840s+afAehck?=
 =?us-ascii?Q?zwFTNNv+MlJNNi/qzBukILSmgGsPYgRB+D9GGvZOM4XvuOLSyR8Zu71JCj0X?=
 =?us-ascii?Q?0Cj5OFF53gOZ7D11Ih6zfhi8Vt2KMjjcV3N+GtlQmTrOo6cWn8jKCW5c/yrJ?=
 =?us-ascii?Q?alGgWAe0QaLH9Qpx848M6zh/3EHYfF/0yb6j2IDquDeIxGCE7/9BCYyJkeQB?=
 =?us-ascii?Q?SeLoRfJZAQdyf5jTss9YcbyPZvM+K05URsA/Y5Asqfzy8l8HnNUqHC/QpnO6?=
 =?us-ascii?Q?+FgYNyjzNEgNXTPqp6wI4v+vlHjC0/dUIISPVBTaL192G3tsSeJSNFTF80X2?=
 =?us-ascii?Q?MGnLw8/uuUB/1gqLjNF6dySDf42jyE3oBP5jiprYAp0KPplzUU/pLmWQNuUY?=
 =?us-ascii?Q?QfnydJDF6Ut+WaYByQbb7ezcc0+fibA6nrZOHdD2X9i0v51y6YVw1Dtr1AUw?=
 =?us-ascii?Q?eskNLEhbvTARJPSz0hzC7Oxzjj0c0yzYoIyQdSlzw+l2TKAvOUXr0uxB5YcM?=
 =?us-ascii?Q?Io8zEKTAlN4XsWaZnwGDBKA2PeoSMN0fo3i2jSbSJyU+GIULwbBEpUMPvjJD?=
 =?us-ascii?Q?91Z2srfYVFue20/Oqnfh24IgFhxjyFzCSRCRVcF7p+v7YySXSwgyjWH49XfM?=
 =?us-ascii?Q?HG5iM55g8QXqTnGbuDTEqTarJEEbzt4GxsAW0RKKTiE1UEGsiJ5JvnU4UaS9?=
 =?us-ascii?Q?+eRqA7+5D/bmQBdFDKAiiwSw+qn6ppN6ArpZDrHWB2NU24OjcjS55cUI0jRS?=
 =?us-ascii?Q?KPjC4Y2e6yEz7JQxg0KGqcB7BCcducxtod0tJzZUxSaFtcprQ+FO2Zhp53Sp?=
 =?us-ascii?Q?LTTaJoEUtswsGC3Azwex37KoqMhNXxzWNr4TXKPhYctz8ZZTTGMlfXbDPaTj?=
 =?us-ascii?Q?0/Xc5BI3vPOGWZOMLAD11XynL6kn/EV6WLDF/KGTtcUZzVupokskqruPwt+O?=
 =?us-ascii?Q?CyPvk94wWBqg+NNGfUaxJCoDhO1lSCpnvfKrASO/Y5A9FeVJbgpu5wZNU2tg?=
 =?us-ascii?Q?RSKDYHrNxZqKy20tajg8NEfaK0IfB0rNA/ZvIAp10gT9TL2YJhjZt29CVpUg?=
 =?us-ascii?Q?daZsmeML7DGlwyofQT7kihHXe37bYShT427vM3JGw/z6F0IylcZ/aQyXEkkB?=
 =?us-ascii?Q?Knm3JK9ZIOC0gaOGsx+AdCUJ2Bx7DQsA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 10:20:12.5884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1fab12-1923-4495-38c0-08dd15166790
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9389

Introduce support for passing custom BIOS inputs to the PMF-TA to assess
BIOS input policy conditions. The PMF driver will adjust system settings
based on these BIOS input conditions and their corresponding output
actions.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 24 ++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h  | 15 ++++++++++++++-
 drivers/platform/x86/amd/pmf/spc.c  | 24 ++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 1b9c7acf0ddf..21ccd677ffa4 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -321,6 +321,18 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
 									 req, sizeof(*req));
 }
 
+static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
+{
+	struct amd_pmf_dev *pmf_dev = data;
+	int ret;
+
+	guard(mutex)(&pmf_dev->cb_mutex);
+
+	ret = apmf_get_sbios_requests_v2(pmf_dev, &pmf_dev->req);
+	if (ret)
+		dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", ret);
+}
+
 static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
 {
 	struct amd_pmf_dev *pmf_dev = data;
@@ -430,6 +442,15 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
 		apmf_event_handler(ahandle, 0, pmf_dev);
 	}
 
+	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V2) {
+		status = acpi_install_notify_handler(ahandle, ACPI_ALL_NOTIFY,
+						     apmf_event_handler_v2, pmf_dev);
+		if (ACPI_FAILURE(status)) {
+			dev_err(pmf_dev->dev, "failed to install notify handler for custom BIOS inputs\n");
+			return -ENODEV;
+		}
+	}
+
 	return 0;
 }
 
@@ -480,6 +501,9 @@ void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
 	if (is_apmf_func_supported(pmf_dev, APMF_FUNC_AUTO_MODE) &&
 	    is_apmf_func_supported(pmf_dev, APMF_FUNC_SBIOS_REQUESTS))
 		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY, apmf_event_handler);
+
+	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V2)
+		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY, apmf_event_handler_v2);
 }
 
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index a79808fda1d8..255c5ad2300e 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -370,6 +370,8 @@ struct amd_pmf_dev {
 	struct input_dev *pmf_idev;
 	size_t mtable_size;
 	struct resource *res;
+	struct apmf_sbios_req_v2 req; /* To get custom bios pending request */
+	struct mutex cb_mutex;
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -616,6 +618,16 @@ enum ta_slider {
 	TA_MAX,
 };
 
+enum apmf_smartpc_custom_bios_inputs {
+	APMF_SMARTPC_CUSTOM_BIOS_INPUT1,
+	APMF_SMARTPC_CUSTOM_BIOS_INPUT2,
+};
+
+enum apmf_preq_smartpc {
+	NOTIFY_CUSTOM_BIOS_INPUT1 = 5,
+	NOTIFY_CUSTOM_BIOS_INPUT2,
+};
+
 /* Command ids for TA communication */
 enum ta_pmf_command {
 	TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
@@ -657,7 +669,8 @@ struct ta_pmf_condition_info {
 	u32 power_slider;
 	u32 lid_state;
 	bool user_present;
-	u32 rsvd1[2];
+	u32 bios_input1;
+	u32 bios_input2;
 	u32 monitor_count;
 	u32 rsvd2[2];
 	u32 bat_design;
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 06226eb0eab3..05bed8206365 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -47,12 +47,35 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
 	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
 	dev_dbg(dev->dev, "Ambient Light: %d\n", in->ev_info.ambient_light);
+	dev_dbg(dev->dev, "Custom BIOS input1: %u\n", in->ev_info.bios_input1);
+	dev_dbg(dev->dev, "Custom BIOS input2: %u\n", in->ev_info.bios_input2);
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
 #else
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
 #endif
 
+static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
+					   struct ta_pmf_enact_table *in)
+{
+	if (!pdev->req.pending_req)
+		return;
+
+	switch (pdev->req.pending_req) {
+	case BIT(NOTIFY_CUSTOM_BIOS_INPUT1):
+		in->ev_info.bios_input1 = pdev->req.custom_policy[APMF_SMARTPC_CUSTOM_BIOS_INPUT1];
+		break;
+	case BIT(NOTIFY_CUSTOM_BIOS_INPUT2):
+		in->ev_info.bios_input2 = pdev->req.custom_policy[APMF_SMARTPC_CUSTOM_BIOS_INPUT2];
+		break;
+	default:
+		dev_dbg(pdev->dev, "Invalid preq for BIOS input: 0x%x\n", pdev->req.pending_req);
+	}
+
+	/* Clear pending requests after handling */
+	memset(&pdev->req, 0, sizeof(pdev->req));
+}
+
 static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_enact_table *in)
 {
 	u16 max, avg = 0;
@@ -201,4 +224,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
 	amd_pmf_get_battery_info(dev, in);
 	amd_pmf_get_slider_info(dev, in);
 	amd_pmf_get_sensor_info(dev, in);
+	amd_pmf_get_custom_bios_inputs(dev, in);
 }
-- 
2.34.1

