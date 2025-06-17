Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3189728C5D7
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jun 2025 07:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750144488; cv=fail; b=OlRzMeLt6fnWgXFCLqScYlLhU2ONnn+AaFPqM8HEaKXN8kzQvHYjT0it12bUmTDcUVlyi48FTYe9rdyxSlTT9J7fIwxYQHmeTiemfQOgI/mkrGrMu+Q/RZ5Z6BccEXhCGQU67VngKpiiG1LOSvoJNMY4r9g0DLKz9TwKj1mB5Vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750144488; c=relaxed/simple;
	bh=s02O7X2R0w6w011oinWFG/kQQGJYN7aQXyziKvPPEpk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z++pO3iWHE2nnj/SWrxOlzIk8bSpLdy71ZwM6IndqvgOh15aomjN5TPLFjkVcfX7kV+juh97iTcJaeTLMMznhfIZ54D1yc2oIswOwKIu77JKhoYRBOGrYun1reWmzoWfU9x6YNT215FfBtT8ZE6p6qdHvEYn5+o1yc3C5DkRFp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cZA/20j4; arc=fail smtp.client-ip=40.107.94.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cZA/20j4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVkg3KEBSeDG03WqxBtEvK0Fzk5kK41H7BBma0TJh7lVGvbRhy6P4MErUzZdkp/Q8n5FJxna4r5/5ftiQyaf6t4JDn9TItvfpvOt9UhuTBERPPXu7bdwzuzzJ4RtGp/m3zT/vFEQ1LTHijOHWn1Q9J0jny+A5ipnu4XUny4fLjPpnKZ87yC/cKvrjbw9qNZk6lIGt6HavdEDCiw6V4OAphZy/iMKoK3xwAE7v5oZ6JiXpMuIy8WWyfUhKXxjDGV2/uPn9GosmYp44pYhBqyro5H4+Gdc4FbsZwW5EeZqIVaVheQr0KE43ikzx0exqYc9R0ygIYm5dW8jDn32iN0MLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9w42KuqKPajLUJ4I17SwBCGzp3VkGbSJI0oXp9mEqvE=;
 b=pSgBEAHcI6XRs3VG1hRSJOBrzOXLuCG3z7UTjMnLY/ULvgfX8mmZnJFn3nY1sBCFKjZ6pFHXI0Ty8fxH36C9LHWBpOhRibmOZudxs7SBOQzQqiBY0XHeppz1iFaSnK8sfU7OBWr8eCxwL/8TdjMoN1GnmerzkEKemjsa4xNfLbl2ruqjsfZjR2AWhHkA35XlWQm6HQSkBjhxdGDSszBosQ/xmPzmjb5FIonzpvh44trflZI0pZ/LKUuitTMzcpmJbTsPjbganzHgioNScqJ7AF8pIU4FO6guVJZLMX7bLxhIdj5T5Da8eMDdCDqWm5kLSipsFZMwnxslE9QKLaEDxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9w42KuqKPajLUJ4I17SwBCGzp3VkGbSJI0oXp9mEqvE=;
 b=cZA/20j4whniW5RChXdiboBM7RImAlANT9KZulMa3p8vUqA4Hdq2Y3dIKnbtLOPcpt9VEfNtu98RTFcjRlNF3qIfhUH1L/cwCHDffZ8qWqYzs8GA5yEr85qirsu/hGgDz+NvEDG8cJfrksHv/9eK1Evn7D/AzxsFKssiB4oFhrg=
Received: from DS7PR03CA0173.namprd03.prod.outlook.com (2603:10b6:5:3b2::28)
 by CY5PR12MB6456.namprd12.prod.outlook.com (2603:10b6:930:34::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 17 Jun
 2025 07:14:43 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:5:3b2:cafe::2c) by DS7PR03CA0173.outlook.office365.com
 (2603:10b6:5:3b2::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Tue,
 17 Jun 2025 07:14:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 07:14:43 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 02:14:41 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 5/9] platform/x86/amd/pmf: Add helper to verify BIOS input notifications are enable/disable
Date: Tue, 17 Jun 2025 12:44:08 +0530
Message-ID: <20250617071413.3906284-6-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|CY5PR12MB6456:EE_
X-MS-Office365-Filtering-Correlation-Id: b6368d68-1315-4f7c-67eb-08ddad6ea246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HcEaKYWCdBKs8Hy9c9yczduk2Brg4eccFO2kKEHJUznlK36tH9jmT2l53BuI?=
 =?us-ascii?Q?c4hXAp8epevBxoFuoy9uY/ZdMS6xeZ16Uvtxe2Fs0Znd3iXgUh+hzhB+tWIO?=
 =?us-ascii?Q?a/K9x4GD4Q0rzZ7ESwEuo1MrWaRR189afKAtz/bCwryAxWSQ8YQ0RjDWOS8w?=
 =?us-ascii?Q?8V4Ae8wIjOQBv/pV4XS15Vwakk0SXLPxo4jFziGSGW18jehK5ycZJJw2TUNU?=
 =?us-ascii?Q?m5ZL+diJX+cvkUaRm5hkrwxn9SP6j5DreM2x7+IYww2VvbfN5wEecOSPalb/?=
 =?us-ascii?Q?9CaG8dhibo/ZzAsnu12BMySZ1BdbbVcoty4MQ72EJj8RZetFwUVWHlixeO8r?=
 =?us-ascii?Q?mLqpUIJGlCg0gxcGZVhum5Q40jr5KTBtNjJnEr1b+Ar7m4sHiZ1rmS3pOGwk?=
 =?us-ascii?Q?/HmPePQmONMqgRY0/wew1/6xxGWH1kerSQw1HwDbB1VmvVxrQkQif9rgax+k?=
 =?us-ascii?Q?p5xWsfOH2XlJRwfIwkmtRVKRZf7RNGo3xEuvYp5yWxxfFFFnYiNqDwgUXdqu?=
 =?us-ascii?Q?EgxMsp7HxLXifavzLPy69k9rL1W/xl5Y+v2qls9EVs0KtIhq5747yjAgj1te?=
 =?us-ascii?Q?33vAE5smSfrTEdrLWfvPpFLUUZDvP7NcdPJWMwPgkNBPDveFOtB3gMIIhxFH?=
 =?us-ascii?Q?rjW/KuI7LW4lY7SwUkr18QiEySu1tocKGiR31F5oN19Fl5tJUXvDkqEa+b7A?=
 =?us-ascii?Q?LNl/V2OlZZ0Xozswb5ow+yDtC218WvKokF8uAItGLekirg6l1QuUpS2GNiW2?=
 =?us-ascii?Q?YGF4zTrt18BKNBaiOxS9QjilkDAhVw/1pgBdRigaEDw9PsAGsisnFfqG8JuH?=
 =?us-ascii?Q?g4Q1QfRUOlNxt5OIdOiVLDxMYlkvW4TxhcSUI/zDL2LC8wUkdhes8XcnwuZa?=
 =?us-ascii?Q?YAf0KCcMfO1j4q20XKtxptZmHT4h+QjAzya5kVCNfMy+1sLd8Bd3kvxn+1iN?=
 =?us-ascii?Q?VhfFjs8mSCXtLWzWdDqkir1etXVa1azsxLaemtCxozsygxqYz/Ogwse62Dax?=
 =?us-ascii?Q?qwPx4TaycZpiKUc3hyr6LzdxRsSu7QX9uFAA0tBxt1iJUOtWfG7yw7Iud3Wl?=
 =?us-ascii?Q?mFgMlzqc7dD3HvNQL1O015YIXSuW+Jr0NBlmHAEuQz2dZgt3rchIhP5+zlEV?=
 =?us-ascii?Q?h1DnCBFQCe86MKooJ4rSZz1pL95hh6CxJgaCS7KQcP8N4VpuEDlNvEP6Ae01?=
 =?us-ascii?Q?PNRlKgT5NRWffS37paMe/4YreJoznHXdqvTkDYbJT9zdbfXThe7YqPoE+DJp?=
 =?us-ascii?Q?bMltA+ICxzYWfj/b+PXjSVKhD6oEsxnWlJprO/0V9Sh5Fr70spKdAM6JOl1u?=
 =?us-ascii?Q?Rj78KLj0Hi2zfb+gR/q2megd07PbN6pbTFStMbjRDElPWMhKVekMIBLURegM?=
 =?us-ascii?Q?CdZpHw2xyROC1LFl7xA/Z/uUiOGL1OJD/kXjvESq/UZF2Dqjd5C0qnQgHrZC?=
 =?us-ascii?Q?qHGlKGIgS2nORc7M+YlDTAAeLhzvOgegvdEk9yU8/OpbLyS+Vii9yn0SmKZT?=
 =?us-ascii?Q?3RzVWoLFT7rO4axCLxp2MB+Rt5chdJnzxGEu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 07:14:43.6470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6368d68-1315-4f7c-67eb-08ddad6ea246
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6456

Implement a helper function to check if BIOS input notifications are
enabled or disabled.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
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
index b65fd5310fe0..4d612ac02ea9 100644
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
@@ -793,6 +809,7 @@ int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
 int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer);
 int amd_pmf_notify_sbios_heartbeat_event_v2(struct amd_pmf_dev *dev, u8 flag);
 u32 fixp_q88_fromint(u32 val);
+int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev);
 
 /* SPS Layer */
 int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
-- 
2.34.1

