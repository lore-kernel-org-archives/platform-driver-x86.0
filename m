Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D9B244685
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Sep 2025 11:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724542; cv=fail; b=CYYKHPeJs+hje8jKAuT+/z9rliImV1/gqkuGlf8rCFAgeZo5aG8icIkzyTiuh3hC7AnqxXGtj53JyUd7pN+7SI8uJBnD93ZyyWlMGTRhxVVvsC/yNZMWNgUO1WwPsRE7Z4z69+6fD9JFmmalLgWBWI8t9ZwfM/xlcmJDfwrwRwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724542; c=relaxed/simple;
	bh=KLPCOlO330i7NmUKOLJ/LYsYApnqicFxJbYoopdNvZ4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nrhKGkXot/6LPl6UrbqfxMzcxxVCnHVs2r8QLMZ5XpzoHVpUUwVgBjPesDMgpOhH7q433CHnJyT+5c9HBIhQ7OcCgI9M78ux08ubOET+XBr1Gz/+dWKpRPL8iQgauu0wZt6xyTYQCDfonzghxicxEves5BUXVW2dlFK54j/J2Cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cPZgCrPS; arc=fail smtp.client-ip=40.107.92.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cPZgCrPS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pofjo7H2SCiG3YbXzv3XAjP8N7EwPfQ88EFNt9YVPynl9lAL/fTHTNQaFePANDKdvqD5A6JwcEQFyiTnwTMOlO0PKpCOc1Lq5txWtaSGQzi6BYrT4S9wi5VpCnYtSfKrMxmzKSEk9XboHrtGHj+uB+5E7WI6a6/EsspCa0kOjqJousHcAZ1luGBDfFABQFVZc5EXoB1LuWBis65HlL88AOGQaxqPBjvH5YaVdvE4mSw/oJahBgXKg7cjlu8wsjhcZurVRfzlPESmpiorrvDlarYMd8FWq9UZ32GKg8PjYLFIa5JMq/HMwFr0pNHvgzGT2IzK6JMwxIzrjrE3I+hSwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGx+CkAnOqhXnuvQ/R9Iwrau7HE34mVV7UAhoT+9qgA=;
 b=fqcexmMYZXMrDTOJ2HMLcFehgxVJ/H1e03iTQo1daNVC8RX3mbr/Bzym0TumdHUHfeJ6w84RleIct3RNEsCAK0v0cJY3iTwW4E1csWYITQ34mubxVBuF8sdPgjp+2gJYNKD+KNDAKfm5BH6Ou2BK7FI1ud3nz+uw+eyk4Z2rnm5LbTbsGSCFxe8UJKcD1z+WIdE+hqt76shnW4QcwqkaKx1uz/dXwgdkY7fNtc40zCVgcAyjOLKCTJAdhqWr4jvKEn2Sy4xaPKoK45vmulMc3FAgVbEIb/3Q3VE5ZHv6ng1A+KYPRRIIcIPIKDuu4+9OkZiFjIWAjXSsowgzvkiwOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGx+CkAnOqhXnuvQ/R9Iwrau7HE34mVV7UAhoT+9qgA=;
 b=cPZgCrPSNDZxbfJEP87B665RXFHARXFdyIZ2dTshwGfPN+iS958hNiKbNecBa76napvV3SeZdkn1oqRD4hq+8IMsIGRU9PROneWK9YSNGAmL72wEg4b90T9PCXQ7p5PEWiWXisbmiVDL2MD+lAmhgJLBn1muwv/4PwskGItO6mE=
Received: from BN9PR03CA0424.namprd03.prod.outlook.com (2603:10b6:408:113::9)
 by PH7PR12MB6787.namprd12.prod.outlook.com (2603:10b6:510:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Mon, 1 Sep
 2025 11:02:15 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:113:cafe::fb) by BN9PR03CA0424.outlook.office365.com
 (2603:10b6:408:113::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Mon,
 1 Sep 2025 11:02:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 11:02:14 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 06:02:14 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 1 Sep
 2025 04:02:11 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v5 RESEND 4/9] platform/x86/amd/pmf: Update ta_pmf_action structure member
Date: Mon, 1 Sep 2025 16:31:35 +0530
Message-ID: <20250901110140.2519072-5-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|PH7PR12MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: 80fcd6f9-83e1-4904-87cd-08dde947023f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yu1GwEQASCRh7V8wn49bN8UOQk6y98cl0AnoeMnBnpYrGl9N79Y1+pt3cUum?=
 =?us-ascii?Q?cy87RJnbQoZ5nTyHUj6yYHWioyvTJfgLQppnRSLMRUjVc9BXIx1fIdgI22eN?=
 =?us-ascii?Q?hB2jUx57dFxR5IdWgHqpeIa2nI34ps/8kEUi4pItxQyDSMQEE79fgoB3xQim?=
 =?us-ascii?Q?EBP/zCvJw9+iLEiPgbn8IB0IVx3f5NLXDSdnOvagcXxugp4ILqPla/NoVa3n?=
 =?us-ascii?Q?J7sz/Ezn25qnEYmxTFCiy9Kg/VhwY0Rkwd4jTCY+QOOcj9ZQBZKinFrcmN/N?=
 =?us-ascii?Q?tGkoLEDKE3VcbioXFyHCjyv/fZtH2zpv/RwgPkU5czZbaRZHAgfqgFylp90G?=
 =?us-ascii?Q?R42l56UPMalLwJdhx4oWa0Xzpk5baqlaIVbdezeUfVSsBeLlyaT1HQj/+M8T?=
 =?us-ascii?Q?y4EU4uqjsndE3MLQIX6UBnAUU1hO7Y73YntqF32GEa9G/oOSIkkWAIOf4cly?=
 =?us-ascii?Q?EodSsrUtOKCZ+OCS+kRcNpeSKgnLdqg7Fk5LHErGJRGsz2hHyYSmRIh6cNwU?=
 =?us-ascii?Q?kty1nzvxWKh/4t1TXpb71tEvMhv+dO7KyEC7Nt1UfyXLd5R3zKJQmaQTq/e8?=
 =?us-ascii?Q?d/uWQNTl5mwQPkacgWYcNgnAr549i4aUi+JmdRHGxhwkrsVmJlbE+2d9LK3U?=
 =?us-ascii?Q?NOxO/w8Y5jbzsGpzOOTfGl2iOzRTwBRooAQNAX0b2wOlOC96wZGhWeH6x3NI?=
 =?us-ascii?Q?RV4wY0sqyv3RLQYDzp7d1DKrdwjcRBPa96YyM+LOTWGRbi7c/oCwZNPpKppC?=
 =?us-ascii?Q?JZMoEPf7CESdfybBysIbFfT1WaoOZ5msVbi4gJKIht50gPy1d54F6DOexvy2?=
 =?us-ascii?Q?rBHgFxbjR8e9AzDbszhcC11bx9dHR2JFwRTOENSOWWgsKPU8nnhH1b02FItj?=
 =?us-ascii?Q?IRAfDQpuypWKsgA6Feu4/GcJB8t1wSZP2t4wB5I6cLpDhs3b+aw4Eq16zEBx?=
 =?us-ascii?Q?XzMTu+ow7c1PdKyFj3Aw5WCqJa8lF5HonvJ+W2WHVDwtmo7Ge0OJXpYRKSOl?=
 =?us-ascii?Q?8qih4j7feqUbmdo+2SenfgWXycPSg2trACoMcifKUMSPnbOMh4toopJOmpGd?=
 =?us-ascii?Q?eiUX/K+7b2ygQr/4IiZvFHptygQmotyQ6U2ccs5g5A+gB8BeGsEaRXsrauQq?=
 =?us-ascii?Q?BxQtFPTmWGdChmGX5cfBOdl7XKZKi0GaIOgCa1rpGAhsPK9npqOQMs2H5mk2?=
 =?us-ascii?Q?WQ+b4pVnzrgYshD/G0Pckd1i8b1ePrZCSyixtRl2u316+SnVQ3b1phKh19VX?=
 =?us-ascii?Q?/VuP6igTDwRUcfGsYZBXDRnt3yiJ1BhmZwDOT4uJLEY9jkzuBkcQFhbpmgKV?=
 =?us-ascii?Q?lZiA7X484DxYqx9Hp/UV1NFdUzHZqQs5Fs1JpGoj+oEI/G+nl/dzEVU8llGF?=
 =?us-ascii?Q?R2TT+BUModK2z8l3SaEXKhclxm7GhxgT5lADrnypfUfxIeEgvgnP2DotWMZJ?=
 =?us-ascii?Q?lEpi5ehyTmub4OYJRsmm41B+3iGom2ltNp22gs3SHmdmi8zcnS8abJKuaHOL?=
 =?us-ascii?Q?1qjyHbpx3Oajjh/Tb4Vbyb8acgZKcal9GEww?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 11:02:14.5718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80fcd6f9-83e1-4904-87cd-08dde947023f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6787

The latest PMF TA has been updated with the additional structure members
for internal evaluation. Since this same structure is utilized in the
driver, it also needs to be updated on the driver side. Otherwise, there
will be a mismatch in the byte sizes when copying data from shared memory.

Suggested-by: Yijun Shen <Yijun.Shen@dell.com>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 2fcdc2493552..f5e874b10f0f 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -750,6 +750,7 @@ struct ta_pmf_enact_table {
 struct ta_pmf_action {
 	u32 action_index;
 	u32 value;
+	u32 spl_arg;
 };
 
 /* Output actions from TA */
-- 
2.34.1

