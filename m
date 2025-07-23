Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DEC26E6E9
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jul 2025 06:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753252929; cv=fail; b=jISTYq0n1yKm82qEI6KVjPwIn0oUIPTDxLyP03NXwhn+xOL+p7qP783Kw7BhOClNDK5MEjCW4kXidfhNcSZNYXjTGdbyA6LfYj91J3tYZ46Lobzm4dYRvhXMEZz9JogbgwOth5ZULG1VeL9U2WUzOZIApEwSJ8htYdUGdwMohmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753252929; c=relaxed/simple;
	bh=PocQFzKjJx0Z1jF0/fQR8ggoWx0qb/bdEiwfqaJgHWs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qav7OE1TuNvvR9GZ0Msaq31Yx8UQ1j5iWqetBu2z0pnLf+LRAJianXZ5lvP/PHF0mckhfZT/r6nwdDHmZ3ks0MGr9xK6FfONjXgVGFJ3FxZ5osRDT0BlnbBEGVJUBdn/c3IDUmK4VlPK0xWOrmFB2v8Yf1FskSRYbxwiD3nErDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ciaNokDJ; arc=fail smtp.client-ip=40.107.243.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ciaNokDJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcJUDwLyKTbRsIREJR5ZypN/oyXOnLCnyRHS7/Gj4/IR5VLB9JWSPLL78YpMyVm0CemkgYOFW9HlhTmJkeN+ixIpylHWZ8p/u2TzuQLXdGFSi8+RUzNJ0vxOysH7Rv2OlkFooDDnSxFRNlqE/X7xqMQfLV4fti8I9YS01Qv5vyBe+pEcz+qp7OPEd9WfBnDORvW8W79vxCUv6AnVKXTAJkL+fc89WOUuy7bbu8owYcHrAkZg3gy/itUww3pyLqqRTbqwal5kRzdqKd1yvekaHiw1+IADFPHLe86sQNUAHi+90Oy+TDPxFUkYGVZGU/hyO97v/qaAlaVZkOmwUAb8HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPRWP6Xs9wi/fRKn7RBZoyS3Hf7IaUeiDtAG/rrPGJA=;
 b=ML7EXWagkAPOoqCQLL4WxNsdktJ5vMuUalIQhAN/5QtMnT6NPHgdd19Y49zdh5lvada3JweyFgOcnbIEVw0vlxHzyCy8Q9EaAw27uwuzcbfdy/gBiPhtFPMgX7Sw5duu7DRdJkPOW6bh1oLcXSiWZRkxjsWqzlXRCCDWnFUm/OfQoPh9Je0/uTzFuNwJmWkmRXDiitmslg2JCzVQhqvibnCsVHJ6OPTR5OODE722WncvD4KVGW1a9N9fQ2rGuFtkRr9nYAFE3MDtAHOVnVCHWvDjdNnAzPPOZKY6/Y46AXDktnTODK0bx2iA8Fb7neJ3ElGAAqcqhT0VTuDsn/ggrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPRWP6Xs9wi/fRKn7RBZoyS3Hf7IaUeiDtAG/rrPGJA=;
 b=ciaNokDJxVrOfEZVUvdhrHmuFjSa3ib9DMa1VIrE4G+L4PSXRZ6TDmh7QEgwHctj26SX5DSjfUZDxQLpeofAOzAyOS+Vb7kMdCpuBvE8IBplV59Q3O14yPRBviYdIvugCBLYfZGusMugl3vNR5xUuxWPqMCqdc3KJTS7W1J09do=
Received: from MW4PR04CA0073.namprd04.prod.outlook.com (2603:10b6:303:6b::18)
 by SJ5PPF6785369A4.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::997) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Wed, 23 Jul
 2025 06:42:04 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:303:6b:cafe::b6) by MW4PR04CA0073.outlook.office365.com
 (2603:10b6:303:6b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 06:42:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 06:42:03 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 01:41:58 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 5/9] platform/x86/amd/pmf: Add helper to verify BIOS input notifications are enable/disable
Date: Wed, 23 Jul 2025 12:11:17 +0530
Message-ID: <20250723064121.2051232-6-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|SJ5PPF6785369A4:EE_
X-MS-Office365-Filtering-Correlation-Id: 0996f470-1258-484f-d5a2-08ddc9b408e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EAE45FcA+kyOGFc61wJ0zKkRPnzQP9jdyoCW4tYnYjFTuRwndxYQ7Q4anQV4?=
 =?us-ascii?Q?CCeZNtyHQDaz/CsD5k2ve1eHiC339edvLGqy5Ijhn8ZaS4vEnYwzhLTArDhM?=
 =?us-ascii?Q?svfhs83VPrIv3E9lykjqNDiygExtEw6HdQF22Gzutt/PEPNqFUlnb7tUYckd?=
 =?us-ascii?Q?dJ3WZAYA/stkWXPJiNGoJ9ilR4POVCSfSmgy0H3n1g5LyT0BsO8lx0vQ51ob?=
 =?us-ascii?Q?imBaFgK6bmgrrOyvKlzyqznWD56MTTqXU3v/7kKfqryDnYC316yod5gAUuGU?=
 =?us-ascii?Q?0W0L/fzfGJ9HKxHpiSSipZ0KVZcSWXSALbQDFfpsy7pVX9PR8eWW36uAl+v2?=
 =?us-ascii?Q?1XOHfg2gfpH5INhBYjP+ob3Eu3z/WQsGrQ/YfaEesKwJizX/mC2AZA60NBme?=
 =?us-ascii?Q?Hx3YtuZoTGDBJebURBcE3ieA2TT+7vVtmstFMwORI8OzGxgoIncfL3ngCAtF?=
 =?us-ascii?Q?If6HhRKftdNoKkyJwxL2UYAt9B6P6s71g1poTFqxL0051Ba+MKmRglrJdfxy?=
 =?us-ascii?Q?lUNA78Q6q7LJDWSxoz/uLxY35/JtaP6cXg/PCXn5VCkkqM63rOvN9dP5WPCc?=
 =?us-ascii?Q?q2ZqV58ja4ma0d8SLsdopjc6IUaRwi0KOxhtG9L567M21lL1WdyodhK7fXHO?=
 =?us-ascii?Q?Y7sylfwRWJLc+dgRpwhFYkQbyLLVsyvEtLpQkeuao5ryRFKCtPmBIauJ/Px4?=
 =?us-ascii?Q?BWxewnf2LpY3xSSi5PcFJYfSB1YDQFgAfXsDks6e+FafHM+FlMy6ilIeLv6h?=
 =?us-ascii?Q?jqLvoIIkpS3VWEuI8zj6sBf4Ad2VPskdYaaTJvd2aVv60H4pCtb5DTVzPQGg?=
 =?us-ascii?Q?0hoOrV1678EwM1kJTu6ejqTj4jA0xCizj6LyDzaAm1N9W/jtLlxh7VluoCMB?=
 =?us-ascii?Q?PqUMI3rwDz31Erh8NEEb/lJEStbka3PYeVp4lUWfVXA+RjQ7MwfHjaOlDtGH?=
 =?us-ascii?Q?rhdVeibF7NQaTYmDta4UpMfTjmHDpDUSJ4ZA8/zA65AuI1/OPab1nLTBa4Vu?=
 =?us-ascii?Q?R3H6HIS4cVxWiLUUW7LQjVvX1YvlWgq+WHensM6cCWXG6p5jxGp4ieUS7lg8?=
 =?us-ascii?Q?pFeuLjts2oAcvno4fMK0YyzOVdPiY+Ka2wo21R8K19XnSloMqVxHECN2caua?=
 =?us-ascii?Q?7ZS7wgz/f1YUEHXXZKdGklUsbGmsrxBlc2vfX+RucUGN0ZYuuBJn5YoCCpva?=
 =?us-ascii?Q?1Roc5wXOFLnUsATDDl1JA3eIN+9QSrc6aA1UdedB7ux4xZcyMLc4IU3+UQjX?=
 =?us-ascii?Q?XEdAKPpHG47WSadWnQu2aZQDC9YL3Z6gcYKlk4vATMxomk8IH3RTRcnItzIj?=
 =?us-ascii?Q?cK2wuEBy2EksUO3Kgq9VG0yNLBo03/3EXE00YNUtVk8PFD74aWuFs406us4J?=
 =?us-ascii?Q?qNLnpV+DXm4Jn1gWeye2JEkfq8X7OGDTRUApMLIZp26huxo1EamBovSBFLpd?=
 =?us-ascii?Q?H2aXujrBlqDZxCBYa57BH/yepRUGat/nbouSwUeUygK4aw42CAxDiSL/rPov?=
 =?us-ascii?Q?s5qK+rNkCAwNCSCHhNroBIsuNGQjo984OWj9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 06:42:03.5764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0996f470-1258-484f-d5a2-08ddc9b408e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6785369A4

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
index 957f18cddc71..d945beeaf30a 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -118,6 +118,8 @@ struct cookie_header {
 #define PMF_IF_V2		2
 
 #define APTS_MAX_STATES		16
+#define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
+
 
 #define CUSTOM_BIOS_INPUT_MAX	10
 
@@ -379,6 +381,7 @@ struct amd_pmf_dev {
 	struct resource *res;
 	struct apmf_sbios_req_v2 req; /* To get custom bios pending request */
 	struct mutex cb_mutex;
+	u32 notifications;
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -643,6 +646,19 @@ static const struct amd_pmf_pb_bitmap custom_bios_inputs[] __used = {
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
@@ -794,6 +810,7 @@ int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
 int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer);
 int amd_pmf_notify_sbios_heartbeat_event_v2(struct amd_pmf_dev *dev, u8 flag);
 u32 fixp_q88_fromint(u32 val);
+int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev);
 
 /* SPS Layer */
 int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
-- 
2.34.1

