Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53662E36E6
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Aug 2025 11:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755690693; cv=fail; b=b/hyJJGxqHS2vPjnxNfv0ujo5/TAu4iDWK5b7WfVH0qmulbAbaivX5a5UX/p7dLtVMUormzCGzK0qjJ/j/LbHw/spv1IQavTK5vW6c6basQRMbTAydR1JlTH9bCdf5VnmOLVupMJw6CFVPgfpwpMOf5PQw5lhrQXwJnK0zDFCHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755690693; c=relaxed/simple;
	bh=qZCpLlIhj5PgceGxrJfRAlMzWm+BlzvV5koPArgYHDU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UytzTrL6ijVtxnd3HVTc0fZW+yip6cVZ8riUcDfcpZFzE+6fAJhlVE1BAlboCZmR7EWt5cozMHgiWrNpUBTle7sSbVGvj153toErr4OUlhg+186OebmN23YGsDHiP5Z0QkkpGuPbQzawt1vwvzi1mPSlbjpPyJsZSSptxmkp84k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=arzM0Anq; arc=fail smtp.client-ip=40.107.236.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="arzM0Anq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiktK0QmvCW/t21VHZ+1K/mMGtTgCneC6R6JIszTOs2GCDEWtb1Xg7AJJwmzCv9+315Y8+yX+FhfwvIZ5Pb/x2U75SkHJBbAFFCh0/ZF08/Gi89QINw6UgGJMyHWE6XiLKyPMjJmiT+Vx6qUdkZBAVBfrKZ4gPtBDcfzwrhvxAxh22OB5snZV2mjrIuUztZtZn9Qo/dmEdsufJSgFEPL0TLLUfSu3IjibzZENLDL+toQvS+o61LOQ/rbRT4M1IkOHM2fUBaxBAz9q6n3Cp2DwCW8Pi6G/Mi8k31f35GVhUc5XU+qrJJc71zgPvkDLXPJD8omuZqRcRfMar4D+88qrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJkolEU2d3kPxMModlF6Qi75WstSKTSi6Pc0WNoQ3XY=;
 b=gu232ySqGIAu2ddQH3nLxusM/9IEs829QjULCP5srP0lCTlQnQgqqvYkXO3ndjM0D73A4ujiB1QrkxqatvrcWJkorIKAti0jfG/D5cp4n8iuphJ4Ur435x3NHQkpy/ljogbeO12JTHFb3crBHRMZ0odfr22HIvPJlsinkHAgeru+wzVOedkqICCtw8Y2RPQYAOxzAWbFVcAM0IKBqUESbpKrSeC47IasTAWD65l2M1vegqRyjY4o+HCW6Y72jVZrG2l87biByhgKCkqub+d086adraCMIyCUBa/rRiryMITFCYKcjcj0/gSV1TyXB4LOn2xYwuoGCUymD0Cfgb4V6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJkolEU2d3kPxMModlF6Qi75WstSKTSi6Pc0WNoQ3XY=;
 b=arzM0Anq2+lo8s2ZYm6bvbCO1QowqAfBBrHpTq1HEcaUkBgAdguAB7UBCybJ4Hu8rl5gC9BZka3XAWvHfeYkoA2DBF/VsCNmMCxeTyl8WhS4a2zqj1yacECjyEjBFU8SXzs9LtCKo2wtMmBiPXViSzH4KbExOWWaUkaDU7C7xlE=
Received: from DM6PR08CA0030.namprd08.prod.outlook.com (2603:10b6:5:80::43) by
 DS0PR12MB9448.namprd12.prod.outlook.com (2603:10b6:8:1bb::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.14; Wed, 20 Aug 2025 11:51:28 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:5:80:cafe::81) by DM6PR08CA0030.outlook.office365.com
 (2603:10b6:5:80::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.14 via Frontend Transport; Wed,
 20 Aug 2025 11:51:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 20 Aug 2025 11:51:28 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 06:51:24 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v4 5/9] platform/x86/amd/pmf: Add helper to verify BIOS input notifications are enable/disable
Date: Wed, 20 Aug 2025 17:20:07 +0530
Message-ID: <20250820115011.1448026-6-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|DS0PR12MB9448:EE_
X-MS-Office365-Filtering-Correlation-Id: 336e7873-0458-41f9-1fa3-08dddfdfe5de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8ZaTySiiBMOF4thS8BzLuSAvxZiXCgA148BDuDHHZxdxjXhqizVz8GIsSNtI?=
 =?us-ascii?Q?UIL/S04OsxLSV61yERAIyNOJZht/IWw4UA7VDnilUm7k6MShzP4r4MVVaQKz?=
 =?us-ascii?Q?tfOGpuL/4j94bN+RNTcDLExJeienGxGGAMZTPnEo2Loeo+Wl1jm47ubKxKSF?=
 =?us-ascii?Q?V7JfUJyNqn9TP6SIz/XJcrCtKbX/KhkeRmSXt2UeU8W/HTySoPoF8A/OdNrB?=
 =?us-ascii?Q?8um2r0On6QIYJh1i0kTDYT+Wd8Yd03xWO98ug/Ri9yEb8dpGQuzMDupzRBnY?=
 =?us-ascii?Q?zR55/3w0UYwPvcw8v8nBltVXER0YtJlXMRKti9H8xXJpC1QF2ZMQs2zuP56g?=
 =?us-ascii?Q?zWB/MiF0KZT0BvBYLcY+CLf6khUxxriU03JKfdKVCOEnGiQiiMSR63d5o+cL?=
 =?us-ascii?Q?H8vkeddh94zbXtxdrvNZ9z00LmvMIe54SAlvqACZGediG+TEhhV2zL9CZVKX?=
 =?us-ascii?Q?IvO2b3rzDIFdZYlmDb+m8BtFtDDRnIqK7S1mIeC9o0g5BxsuyLS8VuRtuHy5?=
 =?us-ascii?Q?lvmdhf1h51LZpgm20ChQSh5RXvBZKnzFGPN+D/s10rdCV1SN38Nq97oMPlfs?=
 =?us-ascii?Q?+RAoVsb1xmlZhdyuDTVGzR78Zeni102Bb0dcoc4yInt443kWKTKW3Y7yJotu?=
 =?us-ascii?Q?JV5P1cxHcNTCPJlJ3hIf+QuCNjoosv1hDJ2St8A2XRnKqEn/3CZosFbuqh4X?=
 =?us-ascii?Q?QREH/oaEN64r4O5G95lG5DrV95lF1J4WLeAI6QNOZFLeINgFkuyqTAXMEQ+O?=
 =?us-ascii?Q?+1QzNE/By0fjQV8eqLWkuDn+Ba/7HROz9XEm7iXBQtc38lH4XYH6x2Y2hGMO?=
 =?us-ascii?Q?VyjUv6oKzrIuRKy0OYncMjLluOR8VUP3qtJfI9ayrNB5xOpgmpaXg4XkUjSf?=
 =?us-ascii?Q?RaYGtdHS6dvpjnoSEkHru+mEtpCFmB5ZRp+2ZHMjxFzK/GtX2nE9YR1JFi5O?=
 =?us-ascii?Q?Sh57jFrt79RW9mJ6qk22D/W3orCumP9Sb8cFdqXfSutRCOnAPJs/l4aAiYpT?=
 =?us-ascii?Q?9chjyVnjxinPJtfbEnJFCWalU+ErE6u7aIoQ9mSZQPZ4SwCjMyLrdlFO/2OK?=
 =?us-ascii?Q?I5TKMeWlKYYpVgm+Qd7uc4orPn4/yFsAONRBQw/WON7t7mlq/CbjTF/rETAy?=
 =?us-ascii?Q?CFE5TqWyUChLGqNfpMFnH47UF7jt3Wmk56oq6Mg3tywkaC3EfdlCi8+Wlp3L?=
 =?us-ascii?Q?RnqSEySoeUDxua9boDW6IE3rmTzEt0LLErqu1wj4CAfVm0zTX+jFLqbKsMMw?=
 =?us-ascii?Q?u6sSpF6nyIYQy64n9rmrccn8DjcBpci7Z+DXgpoO4sCNQTKYPjXO+CmSXHuc?=
 =?us-ascii?Q?MV3DB48AulnJWBOmro5KFeNY+GXtW55f8lIQOaGP6guOlvbfQLHAJDd+4LR4?=
 =?us-ascii?Q?dOPfaWTw+whC+PdZiyBMlIknc/Lw8ACS1pr+eJ8AItQrsI7KyP0y5tAg8g7T?=
 =?us-ascii?Q?RcCI3ox+XzRUDsXdOAlvabdW1E5Wcpu2m3j259itz8ze9ahsjTDRvStnMvfE?=
 =?us-ascii?Q?ws1OjbJWLlmK5ZdjUfsOGPQ1emnZvkKqjUSB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 11:51:28.2912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 336e7873-0458-41f9-1fa3-08dddfdfe5de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9448

Implement a helper function to check if BIOS input notifications are
enabled or disabled.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c |  6 ++++++
 drivers/platform/x86/amd/pmf/pmf.h  | 17 +++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index f75f7ecd8cd9..4982311ac045 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -161,6 +161,11 @@ int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index)
 	return !!(pdev->supported_func & BIT(index - 1));
 }
 
+int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev)
+{
+	return !!(pdev->notifications & CUSTOM_BIOS_INPUT_BITS);
+}
+
 int apts_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
 				       struct amd_pmf_apts_granular_output *data, u32 apts_idx)
 {
@@ -385,6 +390,7 @@ static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
 
 	pdev->pmf_if_version = output.version;
 
+	pdev->notifications =  output.notification_mask;
 	return 0;
 }
 
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index f5e874b10f0f..b705461a6ff8 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -118,6 +118,8 @@ struct cookie_header {
 #define PMF_IF_V2		2
 
 #define APTS_MAX_STATES		16
+#define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
+
 
 /* APTS PMF BIOS Interface */
 struct amd_pmf_apts_output {
@@ -377,6 +379,7 @@ struct amd_pmf_dev {
 	struct resource *res;
 	struct apmf_sbios_req_v2 req; /* To get custom bios pending request */
 	struct mutex cb_mutex;
+	u32 notifications;
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -641,6 +644,19 @@ static const struct amd_pmf_pb_bitmap custom_bios_inputs[] __used = {
 	{"NOTIFY_CUSTOM_BIOS_INPUT10",    BIT(14)},
 };
 
+static const struct amd_pmf_pb_bitmap custom_bios_inputs_v1[] __used = {
+	{"NOTIFY_CUSTOM_BIOS_INPUT1",     BIT(7)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT2",     BIT(8)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT3",     BIT(9)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT4",     BIT(10)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT5",     BIT(11)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT6",     BIT(12)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT7",     BIT(13)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT8",     BIT(14)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT9",     BIT(15)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT10",    BIT(16)},
+};
+
 enum platform_type {
 	PTYPE_UNKNOWN = 0,
 	LID_CLOSE,
@@ -792,6 +808,7 @@ int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
 int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer);
 int amd_pmf_notify_sbios_heartbeat_event_v2(struct amd_pmf_dev *dev, u8 flag);
 u32 fixp_q88_fromint(u32 val);
+int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev);
 
 /* SPS Layer */
 int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
-- 
2.34.1

