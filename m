Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2068.outbound.protection.outlook.com [40.107.96.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56F426E6E9
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jul 2025 06:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753252925; cv=fail; b=st1E38YfuUa9LuBsCoR/uj85bTLa7KoAfAKnA0WaxFe6b4b825Mm1MqAL+E9oQLs2VZWiVQxYw0MpJuc90OtPYD4vxNfZ1k2xfeco/was+bI49vWSH08gibNezEE/EVDEJnA75gopdQp6Ghc8L66IG228bAq8GuDhqvZI/6eAY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753252925; c=relaxed/simple;
	bh=M1wC5aJ/76UAQMSkSbPQBGyVc8GwOQPksBUtRg+iZz8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oL9AGfsBYy8NaORxZTA7z24anJiLM420psRyq4sj1pC3KwxEZn9JGcOTcQESr5/KBAFKTOtrEopP91EnoCTinC7SeXI6qyLwsZwZnKVYRFrlEJQVXvJK6TPxeZUqTPN8YXFRMHOuYSmXWBnDp6GnLAPAGQrjNGOy8B6khgxV9Xk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cbl0wfIH; arc=fail smtp.client-ip=40.107.96.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cbl0wfIH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1ZXWkxjVvu7Rp4VDcKc/fY6uLAnh7zzZe7ePIM8kSRwfGtL848zNE9+HxPStQfn9BR2YXkEak2cTM87H8s3+Dyor2skdrjnv+7stsJ9fSDK67zSIW4FTohyntPs/AU0XLAjhJJF6kPmPsktcu8ySdGwtHaD9rO4Rfmh5XKRKztTsUjYlX/ul/DvRG8M6uJ5GEbaHwhwiie9AaaDpMflHKwIrIzG00q6vwKLZuZTUohfAdOC9rfJnow0JUnYnyFXLM/ZbJzcmImKQPdF+D1NqpFizEysRLDKAjcVireslDe8hR6U02SyFFLgT3nBfX7eqx5Eqni8p9ta4U1k5Nfs7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4hcuTPb0RLnw1r3wcAqQplKkT/jZtAIe3+EbOM59zY=;
 b=GeYg34yShRjkC9ofdeWRyfb3u4figIyLN8NlZA8gTFtnGwmC/7e144JP6c/B62EvFN7DEXNfo/3wdMk2UY7+0pN91BXA92LPRdUWbZTwrr9YrQfaFrkdE1lxqD4sxNj931P0D0aj75OyCWERZ09jxaLi9/je1KIcKtVw7E7jE8+tvGwCXIpG9exje9PjWhDr1EohhsXawmEjjkGVOghRgGEx9LmFEu5bjOj/FEp5dao305MoqRU2T5owFCoFfozd0uP1LDKo2SdJyLkoZJaf2zjaIC3ib4qZRFpD60yYRHiNLHvzfNsZAJrZy4skgUxGqkECTk5ZaBEJ1v29DiUEyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4hcuTPb0RLnw1r3wcAqQplKkT/jZtAIe3+EbOM59zY=;
 b=cbl0wfIHrtgurdHm+v4bH3VuCtJ19tkiI31jrBdjPbqXJ2b/d0WWaB2S0OTk/Y4pfCrGVf1cTBgvTi9+fim7xJLG6hBCsLtsL0DYXWDLgs9r6HuMUNOJmJ0ajhhVR2Wc1Y33ybN37LLfIfnX9X6xdjNbY0PirvlmQPKhiUcZo4w=
Received: from SJ0PR05CA0199.namprd05.prod.outlook.com (2603:10b6:a03:330::24)
 by PH8PR12MB6986.namprd12.prod.outlook.com (2603:10b6:510:1bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Wed, 23 Jul
 2025 06:41:58 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:330:cafe::e6) by SJ0PR05CA0199.outlook.office365.com
 (2603:10b6:a03:330::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 06:41:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 06:41:58 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 01:41:55 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 4/9] platform/x86/amd/pmf: Update ta_pmf_action structure member
Date: Wed, 23 Jul 2025 12:11:16 +0530
Message-ID: <20250723064121.2051232-5-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|PH8PR12MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c2520b3-d0c5-4e9f-5ad5-08ddc9b405e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GC9T31+x4PIinCjj9o/ZnJvfC2NkDJqIf6HHHPfQ0Xo9U44zDYAXcR+DKKam?=
 =?us-ascii?Q?NhzR652Ud3fdZ6OUl/53/EUtbDob7HV5IexZU59JeW99awl+9xN3jx7qH6Sv?=
 =?us-ascii?Q?Sp/E/XbD4s6+eGlhSzkIR1GGtK1IoOqgj/tDsPITEWAYPfwWe4tgAOjnDkUM?=
 =?us-ascii?Q?VfLVN+cH9MFukuagyi7k6Yby0PJeLb7PtOoqE4kxi60Vw4TfVrB8ZXsaLzne?=
 =?us-ascii?Q?h3MvGs24iZUK8UUhKCnq3FWwqvw7VOt2lM6hCeGyomQd8VfjlRw5HKD8zrTc?=
 =?us-ascii?Q?0lYpNGYtRdmsP+2OrqLRbgfnLKZF3RsgpPuo8OGOBImxwNVqlzeYLakU42tZ?=
 =?us-ascii?Q?g4b4hFOeyZkyxCUuvwDh1pOTOpK6AmIXl4AmQcUN3Sye9MUoJcEs7hmTPkbM?=
 =?us-ascii?Q?3evkt1Xt34NiUxOvPtDe7ByXrrRw3ulbUIx7n8EVzTj1jNDNU309H68U0/2R?=
 =?us-ascii?Q?3aF+Hyj48PckeiGNgH1YrUJo0UA3dlWcAk+kPdx7h+l642rClyTJLMADxiK2?=
 =?us-ascii?Q?fV72dxq+qUyeSxTkcOGPySlS/rk7zXZFM+1JydYiQ96uWv3n2LyV6UwYLW9p?=
 =?us-ascii?Q?LIpyUnDNfdMHJFCpw6wGHi+juTpGEneq3u4mP4yGtjjeocZfqUaQcVwHaSxA?=
 =?us-ascii?Q?hLw3jVXAKyNm7JVssMQo32zTfG+6TZKxy18Hc6MBNm789DeR8fYQTtqDFTgp?=
 =?us-ascii?Q?pW8sd5u2YMaOtX2kzQ9Qg+HxjWIoKDFAJP69cDtXlMZRWnlaaNl46+zuzAys?=
 =?us-ascii?Q?BtDDSEn2+YymYwhvgZF7SQhxHr0KmArzndg+rjB1xe8ivQnHwXCBnsEsWisW?=
 =?us-ascii?Q?bADdIgwordwKV7WHi1gMkl2GAgCtxnJClJgY1B7Lhz11rXBytZQqYvSqzbZM?=
 =?us-ascii?Q?FkYcYhWMW7x2oYPyhXTJ5ARRTGoOE2ESpfKJ9eFOE8Dq3l1W6dU3A8T4tIUe?=
 =?us-ascii?Q?GwLxVmOfMKLPfwReh3OM2W1SeFGf96izdXnqEG6VGSjoMYBMv+XdlX9uHWGL?=
 =?us-ascii?Q?Zmm2ufOb6Dob9pdjJq7sOmYDWxFGgIM2OYrHwhLu+lz3jfphidzGRzGkPHcu?=
 =?us-ascii?Q?rsgbMmoAxuiFqXThffcEoxePKhAgJcy5AUZv9/nO2HTiYG+CNRO63Y9w33y3?=
 =?us-ascii?Q?D+cIoSaiohxwrvHtd9U4GhkBJaCKUYMMs7QIZiKQX9HZ164QRfIMtvSH5OrX?=
 =?us-ascii?Q?peIQPvrlVZrwy9yLizLIo04vbux8IlV9glyWlWB9asPyOPdZ1rCk9nw7/4Qo?=
 =?us-ascii?Q?0Tki8EpnvC54jxRJY6XRxe8Qfb679R+mcRSaEf78EBuOjhGYPwM85qk8sKj2?=
 =?us-ascii?Q?EHvTYwLHeBh+3PmcrLxvoqrmQen0FT7hI9D0qid1jgjTdB+/HoJj4z5GxdmA?=
 =?us-ascii?Q?lEMAsKM2gEaHsRslNfQp7xJcwZoDkNlZIGgXp6fedKLdb+mYx/FUlYQjNVAK?=
 =?us-ascii?Q?OARwBWvKUGSbrOWfrOYHnVPLrkNs2in2BKFAJjXye3bnqtifQOdo8UcAIyp0?=
 =?us-ascii?Q?WwBvRTFqzxsqtRiL3VTGtVi2sUkilaLRQdDo?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 06:41:58.5412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2520b3-d0c5-4e9f-5ad5-08ddc9b405e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6986

The latest PMF TA has been updated with the additional structure members
for internal evaluation. Since this same structure is utilized in the
driver, it also needs to be updated on the driver side. Otherwise, there
will be a mismatch in the byte sizes when copying data from shared memory.

Suggested-by: Yijun Shen <Yijun.Shen@dell.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index f6cd7584aaf8..957f18cddc71 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -752,6 +752,7 @@ struct ta_pmf_enact_table {
 struct ta_pmf_action {
 	u32 action_index;
 	u32 value;
+	u32 spl_arg;
 };
 
 /* Output actions from TA */
-- 
2.34.1

