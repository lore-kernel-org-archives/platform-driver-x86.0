Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEDD26E16A
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 May 2025 07:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775685; cv=fail; b=MZWgtt1pNFn9YkYNlsmu8ykOivEorczOT/9bZ/vr38tqSoilZmPyJeRE4U6zOLQogn+TRqoqLL7Ms75lHa1bw2M6IYc7OQGkBuCvvC+Tw4EzIxn5ZyluyVatDlHDkiRCuI6Vd+UJQd1LGPExX2JR7/Mj9Hyh6e0SGshJ6QOygyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775685; c=relaxed/simple;
	bh=B0WcWq1zj7Hmd3daOh6SldtlJs2gz8X9Zh6cORdRcrs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dOsziT8UPz9SXS7SHexzNp2V6Pu3szZK69Sml/gzufVPcphRxBm+cxAkzWEaCclNjiZ1bLyPcXTW6W5xQXSlYY/rQFKYb/+NJ1t7Ej+5TDSGg74vub1kViJWfnlRa3J1M5a8kkUcoevg4YlZpQ117PV8OzABAmcKCWzWS5AOlVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iUoSscY4; arc=fail smtp.client-ip=40.107.223.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iUoSscY4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xK+s76Oh0qnWueEgMljx8yb6+w//qo8tsdDMIv1meSEwmDbI2j/3+EvyCU2BiZTm+F/PbTe8xB68x0J/bdglHhzdM3H5ISk3gfTkdWzsGXbrJQuLLj2RjpTBpb6QIY26SuN+wltbOgXedw8gXDiuiJy8+4xPjzKM3qmPTrLFDFWnjxai+JHZZeGGNgwJWSvQJuQYtGYYMvUJ5y2WqPOppAkE1LFClLLXPQf8/OZVI2PmA1FxLj37QOB+93PgqBphIaYi0n90MuPm9DS+ruH5j8edAdlwCMVN4+Nt9doPwQmenNq+RjE24LBRNk5AIGnunGtbs+N4qTiqh1HxauO2qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KItcgHKhewYD67Kh50EVWOXlXvgIZi1LN82oH6eas1U=;
 b=vr0yg6QF+rPoMW3nBYGCr7Qw+anfzpfLGkd3HTtu1Na791rFTeI8nmROaqDRMN/UggarLIljCGpN+8Eg+VqhLUSER4zafzJT9wwOfcEWxpdqKOUzbgFkYCfVMuy3qAgjo3SskggpD+UKmYI27W9zRoifELiXciUubnlTrTVhiYTUoLdLBpxqUXuIOSarivuQUm/yC+cViPEsommuWEtntoa6oKa0M5fSOZeuqmbqWl6a0b1PKXG397kjc1YrLlHLljCioG9PgqrWtRfxg4eMzl9LdwWskT0lFn+Q95dkHjSZe0dJL9C6i9BnXbeneM+MV4ggYGcLhJjQrqLKC3LLSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KItcgHKhewYD67Kh50EVWOXlXvgIZi1LN82oH6eas1U=;
 b=iUoSscY48d630Btyv8jIQBLFUAUspy5vVTjhxXXKwdvQZs8r+8C0tEQA3/lWWg/T7xWMjXJ/weCNI1GQknV4tW7NVyOAQts8s5U4BgIUJYeig0fwFllAJNYNOaufDcai9Xjwty2OFVxza7XaeeBS8WBrsCe9LRKw05aPREwRp/4=
Received: from CH2PR08CA0005.namprd08.prod.outlook.com (2603:10b6:610:5a::15)
 by SN7PR12MB6837.namprd12.prod.outlook.com (2603:10b6:806:267::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Fri, 9 May
 2025 07:27:56 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::ab) by CH2PR08CA0005.outlook.office365.com
 (2603:10b6:610:5a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Fri,
 9 May 2025 07:27:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 07:27:56 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 02:27:54 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 07/10] platform/x86/amd/pmf: Use amd_pmf_update_bios_inputs() helper
Date: Fri, 9 May 2025 12:56:51 +0530
Message-ID: <20250509072654.713629-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
References: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|SN7PR12MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fef0140-9322-4a31-61f6-08dd8ecb04db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?olEQoXTM1OLTRQCkeGQ3EZ5x65bOlCdo2gFdAMBnTUY6w+Q7jytYSwGeILqm?=
 =?us-ascii?Q?LkHokCow2DQG24RxMeAulkrfDg5E1BY7q4FmL0z51P5JLzDDoxgYd4LehrGU?=
 =?us-ascii?Q?K0zJwJmZCaBHU/dPLCjLHWHDSI05m/hOObJH4AznGZ/IHm4BrgwsMCtY/vSk?=
 =?us-ascii?Q?p4JpDfUIAWx6KQuJYw12Id7s0NghMA5VjwQp/JuZ4IIDogCJWg/9eeNty8wp?=
 =?us-ascii?Q?K+XCI9nZW0wkeVPbbP0j3KBd9LOZ+0Fn4PcF9vjeTnR1L+/QkOmP4TgHwpdL?=
 =?us-ascii?Q?Zmoe2OYRrcC/HApGBzGjwX5J+y56L4dY9Fhb0Rcvhz4HJL9BNRj+efZwpuHR?=
 =?us-ascii?Q?8riK7JAyNi2L8BSAlsZzgf9Bw9r3zX4bvqd/Nq+TFPl+o+tzsONjUQxEZC2S?=
 =?us-ascii?Q?DdXHw2DJqp0NyPQFJaxK8sRD0CYJvS2OUl/WzmqzmDrdEbeu/J47yX/06e6v?=
 =?us-ascii?Q?zxH5dE6eYrmViTbYfeqMEAlT4WDaXOHMXZ232d7y9RtTGmGsBFR5Ix7v0B+f?=
 =?us-ascii?Q?gD8+nH2Sj6kwnTyKd77ERji2tZy/sfNWhIq55Rfjtny0KU6QR13rxxN0toHZ?=
 =?us-ascii?Q?SuJrHHNsU5k6RDWsLSbTZfPkVPtObDTd1z4ot0DW9a/YMZ+pGcEhWRRQvWFU?=
 =?us-ascii?Q?j5ltcR/A7j6YsuweexR3pdS9lGaU+/oN8WTZw8lOQJz3oZv1ti5VWbtTeAbe?=
 =?us-ascii?Q?omyGk3Zmq50f6bMAlWRhRfY5CcVIP68WN6rCI+UPyqxXTpH90zNsj6dTZPAj?=
 =?us-ascii?Q?C1s0BEHLveSltSn66Aau9Ezi7wcSMX2W0VCUOWrR8AsEDyz3qzEoGUIAUeeM?=
 =?us-ascii?Q?CkOWPVaQ5XMTe+yFBuazOdKnw+D8UqG0peoxC4lHV7k0c3+CbkyEAo744Rp7?=
 =?us-ascii?Q?8D17RkphSprhRPsA3S3urioXh/1V1+jVxHh3dAByknydtkzyWFRhxS6VZ15c?=
 =?us-ascii?Q?tUgBuYSQkRzZrDqjD2jT72z8UuKcC/6XQ7jcGH0K3x2uo+y9zcWbmur31umZ?=
 =?us-ascii?Q?CloSjdVCOkok6GpSA5Kq/+XYK7OU0lfW/SDhRCRJ68hRH6Fx+V+b+vk9SARA?=
 =?us-ascii?Q?zHNg1cuZkG+Hb07k8vk1y6EDGJpL5y8ZrHekDHvTPtETLUiE892rIjr7tADL?=
 =?us-ascii?Q?Bh5p4NF8TJHFaJ2GAd+5iTncR0zlVnvYlr8MUzFozTQT4lfAwnJz8XHeidcQ?=
 =?us-ascii?Q?1aTat4scPuTiEvxXFgbTttUMliJr25D8Z8KtumeajEnQDLMlw+fvJuVlI41J?=
 =?us-ascii?Q?9eXptgLqNi8FKZpPNOv4Fsrh7zBU3facjwxQrBDmxAHzy8eNe7BEtWUqFsQJ?=
 =?us-ascii?Q?1fcp8MXN+NiCZ+/IEh1rl8HEpyBWEV1OKJZedGL4Oi/7oxomwoHeJJUBKmEf?=
 =?us-ascii?Q?v5YuBWsnj4G7/MlnTrBA8RVWR2T3ONybb0+vseIkeYRIfharW9KgzW7DB1gB?=
 =?us-ascii?Q?teOp0Bf5jr9rQipcoaMe3+dFLsgy1WCiWqkZ8NGMI57I6P2/2mgKbLL6GO8+?=
 =?us-ascii?Q?8Y9edsaJM3+EwwXjdq0CLmQACJkYSOb2CK7P?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 07:27:56.6942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fef0140-9322-4a31-61f6-08dd8ecb04db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6837

Use amd_pmf_update_bios_inputs() helper function to update the custom
BIOS inputs.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/spc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index be6ffb823efc..0cd50d342b11 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -125,15 +125,12 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 		&in->ev_info.bios_input3, &in->ev_info.bios_input4, &in->ev_info.bios_input5,
 		&in->ev_info.bios_input6, &in->ev_info.bios_input7, &in->ev_info.bios_input8,
 		&in->ev_info.bios_input9, &in->ev_info.bios_input10};
-	int i;
 
 	if (!(pdev->req.pending_req || pdev->req1.pending_req))
 		return;
 
-	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
-		if (pdev->req.pending_req & custom_bios_inputs[i].bit_mask)
-			*bios_inputs[i] = pdev->req.custom_policy[i];
-	}
+	amd_pmf_update_bios_inputs(pdev, bios_inputs, custom_bios_inputs, pdev->req.pending_req,
+				   pdev->req.custom_policy);
 
 	if (pdev->smart_pc_enabled && pdev->pmf_if_version == PMF_IF_V1 &&
 	    is_apmf_bios_input_notifications_supported(pdev)) {
-- 
2.34.1

