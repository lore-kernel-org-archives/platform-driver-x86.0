Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D95428C5D6
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jun 2025 07:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750144492; cv=fail; b=Lv5Twl7E170Vgfxbj9+XmsDQvScPpDyNNZhxehZsGrLrI6T7cPCb6ngAiDMRi0gGHltA4gRKbIF9DOn5B0xq0HZHCEqrcx4mu98eJPqXSpCDynoUsnN7MVsV78QSAqHnSTPIVQsqs+trqsctcSU/077Q5tNE5W9DkhZ1BiJgoUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750144492; c=relaxed/simple;
	bh=oUWeCiCyrahuvcmMPUdN7vyWz1gnYt8WrXXPc/CS10c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LGdGohY64k4UkXMeehT0Eu78wY93OwKnlLfDIf+1MbcRmvqtEBnsz5tuQJoOz6J+rsI7z1OByAUsb4IcnsznO9ZRAIV1VoIDGf5/8zrPiACwhVFzm9zFHm4Q4JJL2diAjqAnI2+O2r5ZdrPSPqO4uyB1I0pLZqrJLvsmt4elegQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vj56/qMr; arc=fail smtp.client-ip=40.107.223.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vj56/qMr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMCgNxuZPU8ENDF+reez81chqGM9Wo0PjA0AtM/JRqV8HdsTB8UhtXmrb5Gle+V0LiGPcLIrp90FCqCsW/72XQiGpeaEfufoFSG8+2KDH36eC9znz4Bg8wTgEqXc2psgLoYVmoKSySdd+7liHB8nTAtiqJsUWameGybps8v0tyoeRGyCJmak96mxeon8CZeGc71lEArz08OK6/nqMVI2sfLg0oYLJ0TO7nh3y3lHOeb2pimXhZbAsbvYJkpIhXzy7zLj5ZpLxd2WSu02DvR6+nDEyDHIu/1/8JAk6zHZhyXF0e35tAXY7e6S1cz/axZPhE1QPbvq42Zsm8tYO34vXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCLmCB1MO8JLjZ+gDqUqHdPjrz98IAB06dqIVs/Vg+M=;
 b=uObf5kYpFZHXymncd03pTxmSiOOzq+dryiXhdAYPE6A1xXkfSNAXSQaB/NNTyEAEI6BwkHTF7FeNcSBLfd7aSrwT6uD42x+hTTcsa0LlHs7bNtdcnsVNpMHXVEpg/DHBLnyG2DsPlDpxnuBzKhCpnmU7oyaACqqeNy2a4GW5jg5YpMaK0yTahq3BbW53mj8Zu208BbwP0zvzpu8jZJFzOLythJKheTk+BvVzlpumFnZ+pXVO0F5FXGAXSmGtmigbqtZGhZKuawgr5MZqKwBcWvMXjkdJRNcu3LS5iF69bzRmQgLe/jfVC25Hm/iwltZUwzGIKc1BABY3wdQD1sZekw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCLmCB1MO8JLjZ+gDqUqHdPjrz98IAB06dqIVs/Vg+M=;
 b=vj56/qMrJdcQGXJJhr/cBTGAi8K8wp7k5YM97FfgAPkdT7ZyGfb5z3s63Bu3kHyxzZJBDiIGyPyL+DhFTJd0ET1jrjJQng8DrGNLSfscdr3ObjJ8t2KYM+Fjl0WdVkevrnMdeVg0uOjiZZMdMXlY6QWGSECxZQa5IDxa5EE2VSc=
Received: from CH2PR07CA0058.namprd07.prod.outlook.com (2603:10b6:610:5b::32)
 by PH8PR12MB6938.namprd12.prod.outlook.com (2603:10b6:510:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Tue, 17 Jun
 2025 07:14:46 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:5b:cafe::56) by CH2PR07CA0058.outlook.office365.com
 (2603:10b6:610:5b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Tue,
 17 Jun 2025 07:14:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 07:14:46 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 02:14:43 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 6/9] platform/x86/amd/pmf: Add custom BIOS input support for AMD_CPU_ID_PS
Date: Tue, 17 Jun 2025 12:44:09 +0530
Message-ID: <20250617071413.3906284-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617071413.3906284-1-Shyam-sundar.S-k@amd.com>
References: <20250617071413.3906284-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|PH8PR12MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c82927c-8ec9-4583-d0a0-08ddad6ea3b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A4UVn5+BzzZhrCr+sE2w6iUMzIM/PVYMx4Zo0u9P5OmgGXohgVd1fNhfeURD?=
 =?us-ascii?Q?vz29lIJ8Wgj7KfzdiiDwMVvWl3u3uSS4GECkl9/RCQzQYn9x5K8np8K4vAx0?=
 =?us-ascii?Q?Q4ehRMtjKmJA01DHhFtOPK6Ahe/TQagBPaoU6kKuDiGPJpEWYpM+IOTrUC58?=
 =?us-ascii?Q?kzuKqTCXlR5gl6BMwE11fU3JpsHkLP11Qf07200pmDkqEoZ6uc7Dkp6zxB33?=
 =?us-ascii?Q?+zB1ax66vvtR9lWoFZC5DsC1hrAIPqfrVc3efaxGtDUhZSNtAKpv6ltBSpdJ?=
 =?us-ascii?Q?b7uo1XfZoaJNUvvCL2hwQYZEdRJ0QDaeZEfEiAM6CG8O34zJpCIjVX8/r382?=
 =?us-ascii?Q?/acuog6W4AM+omjCZn59PyocoaA1QtA9XJBqz5Kdm5fV0Vc20W7VkOTycYTd?=
 =?us-ascii?Q?J9lqU/OgyusQhJsVCD6RnNm0D0ihDTRTnLLU5rXH2nXVoK4ArhoOzm/82QYf?=
 =?us-ascii?Q?p1HHkP+l5W4lWpADj1Fd9uxgvYQUekYhtKg/WZM+kFcu0AW7dC5IaCTokfx4?=
 =?us-ascii?Q?P+XbexV182zd8METaGBttf2vhuWyzL5jVY3a1GgwWsTGPE4o6cTXtEaykquo?=
 =?us-ascii?Q?POYbTemgN3Kb++UZcaEjr4Xmr9f+ws4enpw9dFqKH2zKw4jDJ77fZrjz1Q8E?=
 =?us-ascii?Q?aCxc9bsYDefe4rBFOHiIw8Dmcmck1e9YplALLBKbOE+ockza6bIgz+4+Js6a?=
 =?us-ascii?Q?uPa1ThH0UURezULXtKD7xnrQS812lhzzENKlRVUyVhCSw2kUH9gQeDLKZj/l?=
 =?us-ascii?Q?rugjy992XDjiV8np0QIvD/a+JYgo9TYmWHxl5WHdjSfOg10lRmFPcgSz38M5?=
 =?us-ascii?Q?mqFgniiWOyjUe7+9sAAL0Qa+xx41x/nDWk2Z4ZLAE9CJE69R+oKtSwSMDdHn?=
 =?us-ascii?Q?hWKqI+64AAcffDSD6zVSnCUrGGjP5DVxTCFtozk4fZTzEcrkbNlpELJgwDkm?=
 =?us-ascii?Q?21rwOsFZFnFG11CRdIJ1gJsh5WzMwke1abVceBvARsm8/1hpF6j/rI+EUmyI?=
 =?us-ascii?Q?XCAc9nSlQBkrHi5lUN3VWk3sm1iZ0LJobUnBCO/N31CICLOVBzvEvdeCXBl/?=
 =?us-ascii?Q?nXseP8UPuHhN1Z2T4f7PRslvudxlP0Up5TVdxs3/B0DFOlIkrwJ1KkWeb2W1?=
 =?us-ascii?Q?1llwrjO850WxGgI/w836Boud6Y8ghchbw3Bg/x4T3bSz4Oq7M3g9lnLvLUbC?=
 =?us-ascii?Q?dwZhROOg4t+ikmzOgKeuSQJ4+ISJv/yDSK9VHVEMeFtkRufvHmEyyVUVcTZ6?=
 =?us-ascii?Q?hNejV0pd5n2/UCT8W06oNFhsF5PKnUQaf3FOSZjXLS3YlnfAF+dYkBk96Tmf?=
 =?us-ascii?Q?NmxvQxWFdA3MiXA7Wdrd+sypYP8yDDc47rxL3NmN5Y1/C5xtgiiSq2+x6Jzi?=
 =?us-ascii?Q?s+hocpMuslIFl3EbVzWWg4rKnX2VwXUvvGJFZ3cFqaXZTj+GBoPPuQeTAG0I?=
 =?us-ascii?Q?UVHaCWooJD3JiROnZwdNsf75b3It4oXMdyG0jBwa19yqVdnZ53uJ5ldacUyi?=
 =?us-ascii?Q?6fzvgYZUB4gPF4pSUNTMduyDD8z7abt6atwk?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 07:14:46.0682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c82927c-8ec9-4583-d0a0-08ddad6ea3b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6938

The PMF ACPI Specification (APMF) has been revised to version 1.3 to allow
for additional custom BIOS inputs, enabling OEMs to have more precise
thermal management of the system. This update includes adding support to
the driver using the new data structure received from the BIOS through the
existing APMF interfaces.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 33 +++++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h  | 22 +++++++++++++++++++
 drivers/platform/x86/amd/pmf/spc.c  | 26 ++++++++++++++++++-----
 3 files changed, 76 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 4982311ac045..4b8529c9bdd4 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -320,6 +320,11 @@ int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v
 	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
 }
 
+int apmf_get_sbios_requests_v1(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v1 *req)
+{
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
+}
+
 int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req)
 {
 	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
@@ -338,6 +343,18 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
 		dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", ret);
 }
 
+static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
+{
+	struct amd_pmf_dev *pmf_dev = data;
+	int ret;
+
+	guard(mutex)(&pmf_dev->cb_mutex);
+
+	ret = apmf_get_sbios_requests_v1(pmf_dev, &pmf_dev->req1);
+	if (ret)
+		dev_err(pmf_dev->dev, "Failed to get v1 SBIOS requests: %d\n", ret);
+}
+
 static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
 {
 	struct amd_pmf_dev *pmf_dev = data;
@@ -446,6 +463,17 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
 		apmf_event_handler(ahandle, 0, pmf_dev);
 	}
 
+	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V1 &&
+	    is_apmf_bios_input_notifications_supported(pmf_dev)) {
+		status = acpi_install_notify_handler(ahandle, ACPI_ALL_NOTIFY,
+						     apmf_event_handler_v1, pmf_dev);
+		if (ACPI_FAILURE(status)) {
+			dev_err(pmf_dev->dev,
+				"failed to install notify handler v1 for custom BIOS inputs\n");
+			return -ENODEV;
+		}
+	}
+
 	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V2) {
 		status = acpi_install_notify_handler(ahandle, ACPI_ALL_NOTIFY,
 						     apmf_event_handler_v2, pmf_dev);
@@ -508,6 +536,11 @@ void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
 
 	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V2)
 		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY, apmf_event_handler_v2);
+
+	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V1 &&
+	    is_apmf_bios_input_notifications_supported(pmf_dev)) {
+		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY, apmf_event_handler_v1);
+	}
 }
 
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 4d612ac02ea9..6f8a275390f9 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -121,6 +121,8 @@ struct cookie_header {
 #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
 
 
+#define CUSTOM_BIOS_INPUT_MAX  10
+
 /* APTS PMF BIOS Interface */
 struct amd_pmf_apts_output {
 	u16 table_version;
@@ -188,6 +190,24 @@ struct apmf_sbios_req {
 	u8 skin_temp_hs2;
 } __packed;
 
+/* As per APMF spec 1.3 */
+struct apmf_sbios_req_v1 {
+	u16 size;
+	u32 pending_req;
+	u8 rsvd;
+	u8 cql_event;
+	u8 amt_event;
+	u32 fppt;
+	u32 sppt;
+	u32 sppt_apu_only;
+	u32 spl;
+	u32 stt_min_limit;
+	u8 skin_temp_apu;
+	u8 skin_temp_hs2;
+	u8 enable_cnqf;
+	u32 custom_policy[10];
+} __packed;
+
 struct apmf_sbios_req_v2 {
 	u16 size;
 	u32 pending_req;
@@ -380,6 +400,7 @@ struct amd_pmf_dev {
 	struct apmf_sbios_req_v2 req; /* To get custom bios pending request */
 	struct mutex cb_mutex;
 	u32 notifications;
+	struct apmf_sbios_req_v1 req1;
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -837,6 +858,7 @@ void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
 int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req);
+int apmf_get_sbios_requests_v1(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v1 *req);
 int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v2 *req);
 
 void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 167b7455d6b0..7179c3cf6280 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -106,6 +106,18 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
 #endif
 
+static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 *bios_inputs[],
+				       const struct amd_pmf_pb_bitmap *inputs, u32 pending_req,
+				       const u32 *custom_policy)
+{
+	int i;
+
+	for (i = 0; i < CUSTOM_BIOS_INPUT_MAX; i++) {
+		if (pending_req & inputs[i].bit_mask)
+			*bios_inputs[i] = custom_policy[i];
+	}
+}
+
 static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 					   struct ta_pmf_enact_table *in)
 {
@@ -113,18 +125,22 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 		&in->ev_info.bios_input[0], &in->ev_info.bios_input[1], &in->ev_info.bios_input[2],
 		&in->ev_info.bios_input[3], &in->ev_info.bios_input[4], &in->ev_info.bios_input[5],
 		&in->ev_info.bios_input[6], &in->ev_info.bios_input[7]};
-	int i;
 
-	if (!pdev->req.pending_req)
+	if (!(pdev->req.pending_req || pdev->req1.pending_req))
 		return;
 
-	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
-		if (pdev->req.pending_req & custom_bios_inputs[i].bit_mask)
-			*bios_inputs[i] = pdev->req.custom_policy[i];
+	 amd_pmf_update_bios_inputs(pdev, bios_inputs, custom_bios_inputs, pdev->req.pending_req,
+				    pdev->req.custom_policy);
+
+	if (pdev->smart_pc_enabled && pdev->pmf_if_version == PMF_IF_V1 &&
+	    is_apmf_bios_input_notifications_supported(pdev)) {
+		amd_pmf_update_bios_inputs(pdev, bios_inputs, custom_bios_inputs_v1,
+					   pdev->req1.pending_req,  pdev->req1.custom_policy);
 	}
 
 	/* Clear pending requests after handling */
 	memset(&pdev->req, 0, sizeof(pdev->req));
+	memset(&pdev->req1, 0, sizeof(pdev->req1));
 }
 
 static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_enact_table *in)
-- 
2.34.1

