Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD9D26E6F2
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jul 2025 06:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753252921; cv=fail; b=mq67DaAeiPt73bu4YtBY1gYY9oLAWjLRXF1mDJvXGVsB1S5WpMYxkEnPznpLIx6EaxjP1EPL63QEtI8Qa/WRhrovoopxIe+GCH20zscObGVbNfyRMoqSqGulVY3QL97vZ2XrWEx7kapNKy3gekPgwbm3ulVCi+ywbAH2DZ8xl+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753252921; c=relaxed/simple;
	bh=3+OdvOOZyaE7xvLOsNSi5Xp7PCBMw2oqI408CvLTvMA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AIgWmFtr/oMO1LwoUY9sLm3DKVxnGfObZdcGsXBYIg/w/4FNMIwztZprNC5bkk2Vx4NWo8FUH2MWINqzxnR125zZnbx03iHQoauQXjutjxnjFaxVZP23HP0ZTe5dvNLlnj26QXjO047M0NGnk78s4iboEDOqrWtSvSexKQNBIvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=reOSW0iK; arc=fail smtp.client-ip=40.107.236.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="reOSW0iK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tx0axghQhYOR2tY2VAmP/JgrtLO3T1IR6ZDmB7S7o5hadM/beGMtaBk4bOm92JWjKazHIihVhS3ceTasQ8yHEtOW6Wyks4Rb7Tq9L1fBWBYmSIjTfmDUKglgFVUeg3w6A/FUwHaY5p3Tc62BBkcJZU6EST6UMqKYvlPgH+OhJ3s2S2ElNMSoOjd5b+CHjW/3zD13ikva/+i5hc2IL7etatY2XcbyyadsY7YKUZgLTLReLuNiD/hoqONf6iCjF363GFXi6bp4DMKb1N4pwBe66XLvc4CButQwO98JGN7jlb/qQo7njqnaw/EbE3mNPH5zejJ4OEK0AUsN8knI3qI4rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DghC7DaeEXjJ3LH8ewCUhAaD6Dw96ckU0oKPHb2P5Q=;
 b=fbKKAULrEQXMmPiBK2bf40oJx7rcvqKusxHE7ylYDPYm2dWluBtKX/bIRmQnbjocBBMbwNgXHsrqWGyTeTH6iLY3S9EluLdmYQwaMA0cY0IMbb0mQYuMxH95G4eJ8mO/9pUEomLUSSqYQNeGKPYK/valN/Tlgdg2BDPfYu26/5uNfOUs1KrK0iLAkHMAr+PWqg1vHrkWZCYDBYBjZlDxDq/JmVaX88fmyb13rAKCdngIGAyCAvuj5UdP6641OYYH/YVQwoSH8GF0mJ1PCoQ7/+x7AyXPfYkX8eIXjRDf6h9Ouu30QpBKAJNjEe7WxBwRHkZuYTtCvFtPpXKFPMWYxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DghC7DaeEXjJ3LH8ewCUhAaD6Dw96ckU0oKPHb2P5Q=;
 b=reOSW0iKNoJMG4JsTvi6zf7R6kHhgZCcbjSs98GeHx1xgVy6srpnoBlZQ6H78xifeylIw8YAVa/Rx0ekcEPmfDZEEWb9V2ULBP4xAB+R1NqAYVfY0kXZ8dbb6yqY/IMA2vmy/FtvFo5pxIr8KT9qWLe8F7MofT7kfEP/MjBQwSU=
Received: from BY3PR03CA0029.namprd03.prod.outlook.com (2603:10b6:a03:39a::34)
 by SJ2PR12MB7896.namprd12.prod.outlook.com (2603:10b6:a03:4c6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 06:41:56 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:a03:39a:cafe::36) by BY3PR03CA0029.outlook.office365.com
 (2603:10b6:a03:39a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 06:41:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 06:41:55 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 01:41:53 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 3/9] platform/x86/amd/pmf: Extend custom BIOS inputs for more policies
Date: Wed, 23 Jul 2025 12:11:15 +0530
Message-ID: <20250723064121.2051232-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|SJ2PR12MB7896:EE_
X-MS-Office365-Filtering-Correlation-Id: b5f93c0f-4e8d-45aa-cd15-08ddc9b4045a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fT/2NeafREEHvLdbBZPC59k2arZiKOdol0gs/H24Qfr/hojvFVg3o4Sbgbhs?=
 =?us-ascii?Q?/iCsnDtZwatkK/n4pdDN7Uwxj60YFJs0rwXviZ/Sr+JgiSij/kCHHEuqgTGH?=
 =?us-ascii?Q?hCWyN9EC7TKUkV7rNUippw0/C2eFmZpYDuq7qQDN+64wEElQEwwGkj1WJ7p2?=
 =?us-ascii?Q?iBOutdMdHiRtGScqrBHTppvHZWAboxH0T5YNcKt+ZolB/CzsjtwKQmqfOwjg?=
 =?us-ascii?Q?VFGreu6ZvdzNXBejQVFZkq/rEZfvOZs4h/69OYaFzwbzLHGlsMd3GZNB1G3I?=
 =?us-ascii?Q?2i1N2y2wOxkJPPxpx1Lw/YHLraFwlbc/bydvR1SmlLVQMY2ytDOnJsGGa2kJ?=
 =?us-ascii?Q?dKkNvdStY2YvouPZ/6pgNZGz17q+8MJ+C06qH96eGH3mvL/IGRQqGKd6Ekgz?=
 =?us-ascii?Q?QiIbfOcYsh0wc63wIkqpPBvvF2P1z7z9Bdc9H/ggMt3DpiNGC3OSRWgxo/Qt?=
 =?us-ascii?Q?VlqL/vW5lJz+yeARfVyQaCfCQKUBhzxeREXScDth69ftFD80dvkAfk+PFbHO?=
 =?us-ascii?Q?D4ffoIzwjzS7ewdGHEQzUyQ1uT6m8Q49EWL4WjVTnx0yguGSUdFSFe+73O7V?=
 =?us-ascii?Q?k9TlewKFTgkW6/+612uFrUMA2ydzCWiNSHRf20lDIMg/wRzorOExkU6Za6EO?=
 =?us-ascii?Q?plccn2X+xG8vpnLl7l0CzJITud96Q/YIKkVdt3HpCncPR+w7xFZSun/0PN62?=
 =?us-ascii?Q?7N9BFM2RJvdq7MfvPN7TxcudUtQDyeLAn/1nrD2sYznmIYZn3p6vDM6u+Rkg?=
 =?us-ascii?Q?noHWESbmSWBtGPEXUCHZ1O0xoNsgM4KBUBGTRY2SnUKp2I/8dTJSm3QZ8lgX?=
 =?us-ascii?Q?w2b5HxROxNr9yqxknMUEMzpU74d5ihTsaQE6ixopchLiF5oepx41Jcqf2dPc?=
 =?us-ascii?Q?s9mgJSsqrxcP4sscRRUXygV57ZrfdkWTM/+4sTY7QjqB5IN1E4g4jniL6EtN?=
 =?us-ascii?Q?M1Mj4AZ/cK1y9Tv45MWlHUUcRkZDtFXyOjsuyZK4Xbu8URwierB7i7t5qArC?=
 =?us-ascii?Q?Q/zOmS8gKH5rGBJrzldQvwR1lULoOqja4y9tinGVRsxsQ/Ut26CBz2NeB2po?=
 =?us-ascii?Q?9PEdpQwjZ8aSLPxWIvL2pu8DhJ/ewZHvEsrxS2b4Js8tz6x7UHlRVrXCtqzU?=
 =?us-ascii?Q?5tLs4MneQ66pKJbiKf528V6p4gDAVwQoBCpsxCxL021RM3F+QUvjr5cfjpfX?=
 =?us-ascii?Q?J7383QtpGrLw3mYoe2iBIH9Qk6N/IJbfjO169K5KgdIsbL9GUdcrO/pgx9ca?=
 =?us-ascii?Q?V7Gc6wwOgBkNfAxXTuNttR3EumhmKwZkOBtVHIrqJfipDciBaC1N8ZMbPHTM?=
 =?us-ascii?Q?aOUEmWZL+yku+aEiKcEJf9OhcdmNVOGEKT9N8U84XRLuzdqZa64T5gHK6BDS?=
 =?us-ascii?Q?jhWO4VfrEiGaEUyAYoFCr8ELSAMQmVvimIEdMEUb7qR4FIr/NtIHJ3s/N+qX?=
 =?us-ascii?Q?EAJvmEZCXwE68xG/H7iUgee0XJLuU0XKU3UgHAlf3+DbTm1CKyT+ZltpQeIo?=
 =?us-ascii?Q?jZbL4EbfGj3e9DbwXKhpVFykWjBC5PE+AW/t?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 06:41:55.9495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f93c0f-4e8d-45aa-cd15-08ddc9b4045a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7896

The existing amd_pmf driver is limited to supporting just two custom BIOS
inputs. However, with the updates to the latest PMF TA, there's a
requirement to broaden this capacity to handle 10 inputs, aligning with
the TA firmware's capabilities.

The necessary logic should be implemented to facilitate this expansion of
functionality.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 14 +++++++++++++-
 drivers/platform/x86/amd/pmf/spc.c | 24 ++++++++++++++++++++++--
 2 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 79defe2c91e6..f6cd7584aaf8 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -119,6 +119,8 @@ struct cookie_header {
 
 #define APTS_MAX_STATES		16
 
+#define CUSTOM_BIOS_INPUT_MAX	10
+
 /* APTS PMF BIOS Interface */
 struct amd_pmf_apts_output {
 	u16 table_version;
@@ -631,6 +633,14 @@ struct amd_pmf_pb_bitmap {
 static const struct amd_pmf_pb_bitmap custom_bios_inputs[] __used = {
 	{"NOTIFY_CUSTOM_BIOS_INPUT1",     BIT(5)},
 	{"NOTIFY_CUSTOM_BIOS_INPUT2",     BIT(6)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT3",     BIT(7)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT4",     BIT(8)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT5",     BIT(9)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT6",     BIT(10)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT7",     BIT(11)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT8",     BIT(12)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT9",     BIT(13)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT10",    BIT(14)},
 };
 
 enum platform_type {
@@ -714,7 +724,9 @@ struct ta_pmf_condition_info {
 	u32 workload_type;
 	u32 display_type;
 	u32 display_state;
-	u32 rsvd5[150];
+	u32 rsvd5_1[17];
+	u32 bios_input[8];
+	u32 rsvd5[125];
 };
 
 struct ta_pmf_load_policy_table {
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 3e3f5a2473bc..5e0218ec8872 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -70,8 +70,24 @@ static const char *ta_slider_as_str(unsigned int state)
 	}
 }
 
+static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
+{
+	switch (index) {
+	case 0:
+		return in->ev_info.bios_input_1[index];
+	case 1:
+		return in->ev_info.bios_input_1[index];
+	case 2 ... 9:
+		return in->ev_info.bios_input[index - 2];
+	default:
+		return 0;
+	}
+}
+
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
+	int i;
+
 	dev_dbg(dev->dev, "==== TA inputs START ====\n");
 	dev_dbg(dev->dev, "Slider State: %s\n", ta_slider_as_str(in->ev_info.power_slider));
 	dev_dbg(dev->dev, "Power Source: %s\n", amd_pmf_source_as_str(in->ev_info.power_source));
@@ -90,8 +106,9 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	dev_dbg(dev->dev, "Platform type: %s\n", platform_type_as_str(in->ev_info.platform_type));
 	dev_dbg(dev->dev, "Laptop placement: %s\n",
 		laptop_placement_as_str(in->ev_info.device_state));
-	dev_dbg(dev->dev, "Custom BIOS input1: %u\n", in->ev_info.bios_input_1[0]);
-	dev_dbg(dev->dev, "Custom BIOS input2: %u\n", in->ev_info.bios_input_1[1]);
+	for (i = 0; i < CUSTOM_BIOS_INPUT_MAX; i++)
+		dev_dbg(dev->dev, "Custom BIOS input%d: %u\n", i + 1,
+			amd_pmf_get_ta_custom_bios_inputs(in, i));
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
 #else
@@ -112,6 +129,9 @@ static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int
 	case 1:
 		in->ev_info.bios_input_1[index] = value;
 		break;
+	case 2 ... 9:
+		in->ev_info.bios_input[index - 2] = value;
+		break;
 	default:
 		return;
 	}
-- 
2.34.1

