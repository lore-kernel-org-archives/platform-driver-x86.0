Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DD419B3E1
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Aug 2024 13:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723556172; cv=fail; b=f/ALQDdMzcdrTBpSvaUlv/AYPoXkdyO8LCu23PfQ+GTgX6pJn+gAzwOkSZdVPGBnVX/kpLTvGVNs3j4u3dU/szXl74zRndRPIV8LZXymP4bxhib5X+cphh/ajGd6Aeukti5WrCXJ65dPRujdsNwz7g12FYFtw6o91zl3NYkXADQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723556172; c=relaxed/simple;
	bh=P5oxh/3j6vxpmmiFrvzgLlrrG7Bcp10QlOKZbeCquJY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kl479tJ+7vfHUxlGblR+NfYTLGtjsGQK7b3l/A9yJLfZDkW7bq3ibdfFXLkYHBsQ2f/XVsst8sdxw5grYoOfr0WQ0zOHSK2TxaUkKuI3l/CjIUyn6SQ95XjYJ8gyTMjdYCzsyZTpQbxlm4cNbeP2NMfiWbt6uNtU55rcwYB7CC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3eQadiGO; arc=fail smtp.client-ip=40.107.244.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3eQadiGO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcsra9KTDDLshwq1782VcPtP1MYlwUkM3Q7TI3G9WCTa27cTUbe4JOrzYHBqa2dD2IAIOBxRjIgs/onaWdK9zTtx4d8fTTjLASgAoVJmkiD02wTgWO4QVrZRyURklqt9Wr5BiToEw0NVyiSFandfSAHufLd4TUZDGHbTa9Pe1XaVN4UokM0rEYH0I8ORkhR0zXZfFRf/pEmKUcjLPHrTuxnWsUFhTC+zVhNVxGlk58OJlpxb82sw44pCT5oXGpjTXYdlZaz6w0iaZNl+c7SPmvdUNvWmzcAeF7vSjIjcqxV5VoAojl1xipfMzApAEjm7QejQzuDr+8y90MMueJfv9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nv/OcL0Idf/9S/SKBJe1y6aqi0NFFu6UzB5e1Hu5GI=;
 b=YfnYo5kD0kM7EiSBeuwYnDeBi/+BJk2Xozk/nwSo0szEv/DyQ1s0zMii63JClSIj7yrOGvmB43nOD98jy7hnjFcglL/KgwGIDNYZhhBcfT0tc94+Q4Khb4Jg4hCoyehLqh4WXEtwIJjSvdUqJw84XIYblVEysBD7qTBpxUKtm7ZiW4tGKs0ivFHOjWX20gUhq7zXCkumf3kW384spJdtJR22CQV7d9sQM9XdWLrgYoB+ei/epujfd37szuQqa+kCo5pjTOa2SBBa7rwPm9315S75hVTl7CiCEe5De3awr4QYM6+9CLQhjrclPEitYnOqcxLJ/vd7p91T1xN/kVtpcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nv/OcL0Idf/9S/SKBJe1y6aqi0NFFu6UzB5e1Hu5GI=;
 b=3eQadiGOE5lviENnDBGUqekKzM9ehAhGmkI5niisa3Unk2jILtVzqOERKK952gAY17dm3yuMhirsnHBwlILU322EzXfM7E2YXVurmxCuUAx4nZZ3ligbs7a0+lJODjYqYOl6AiwIroVAg2/DgMOAIpPkRt8n5rtSt7iAhNd5/IE=
Received: from BN9PR03CA0988.namprd03.prod.outlook.com (2603:10b6:408:109::33)
 by MW3PR12MB4427.namprd12.prod.outlook.com (2603:10b6:303:52::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 13:36:08 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:109:cafe::2d) by BN9PR03CA0988.outlook.office365.com
 (2603:10b6:408:109::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33 via Frontend
 Transport; Tue, 13 Aug 2024 13:36:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 13 Aug 2024 13:36:08 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 Aug
 2024 08:36:05 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 1/2] platform/x86/amd/pmf: Relocate CPU ID macros to the PMF header
Date: Tue, 13 Aug 2024 19:05:39 +0530
Message-ID: <20240813133540.367384-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|MW3PR12MB4427:EE_
X-MS-Office365-Filtering-Correlation-Id: 85949806-e667-47a8-7b93-08dcbb9ce339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vt+0taAVHaNCCGfvfuEmxbXOIewt+MdUhG8SaUgBqHXZI/zOlLFswvA0qTnL?=
 =?us-ascii?Q?c2EXyGr2ZLeruICJQML404e+l9nHYJE893nthr8B7eN1IX1rfna5eucdNCzp?=
 =?us-ascii?Q?y3kxpJ9QQagMKstocN6OHUbSIqUFp//JOGiGX18682JXQrtxieyhlozTfpTr?=
 =?us-ascii?Q?Xg4cO263qelakAG218R6NEkNLn0o0KjqYGnJ3lgsOgcUX/kvUXfSF6pq1gHP?=
 =?us-ascii?Q?HaOlpBoWTNKL+CK+gjkjDEud8OAZZKrAqp7EG8QB67+TvdPtrR+S0hlyXCp5?=
 =?us-ascii?Q?G5OoEtYOj4JX1w4Xg9m7o0RBT4R7OyOO7YgLiJX+iUS8samDifWBQt4UoUrz?=
 =?us-ascii?Q?wGXuCDeDVOTL7xw3MShleQkBE87JV2DHx5B2GfBTzGeeryxHbfH0kij/8glu?=
 =?us-ascii?Q?GmISodnlknlc+MPZurgWoE0eB5SDGQH106C/of/Oyzb/jGpndLyBqfIU+K6R?=
 =?us-ascii?Q?wEU3AFx9/Kc2yA1IrTfgI9B90b3/qXTXkYdJTZr/P9eWDg6Ip7IYYNZ3c1ZM?=
 =?us-ascii?Q?xmMmgzui0sfOe95ztlQdIgKB/WSQBXkIOX78C2Uqws6z+HXnHal0AhfKaTox?=
 =?us-ascii?Q?p43ufyZPTClp6HlNSusBp21+Fj9HJLE1W609izomhgu4m2qMXJAPXPbNeAe3?=
 =?us-ascii?Q?boFVJvSQdYcZCi2KQhzkY9y25ooYoKzkryJfkVUGSQcs6ZurEBE+Se2fWYHY?=
 =?us-ascii?Q?i4Ss/B5kr55ICQLQPa30673wo+e1ENHFX6DoKvL8hZzUdVP5SJp25fkXcV09?=
 =?us-ascii?Q?BxoqnNXPiOZvrxLUNF625NJ2u/RBXbuzbtoCYaoDpyWK8WbvY9ErvgrF2IHw?=
 =?us-ascii?Q?z4YlCLZGxocPUCuINfnExYwqJnI2X4J0FlM+tZ7AOsBtbTLq6TwclUNvgj3S?=
 =?us-ascii?Q?bswP++HeCvOpjj+BuJtfxhnjwJL8bzosIVkcMhsUf4P/FRh2hTdOPjNf6UyO?=
 =?us-ascii?Q?foYEWMbl9odCKjpz9rDvrqvg0hoHdEg+9XAWx8adoPrz3RlUpRlXau2qa1U4?=
 =?us-ascii?Q?5jPGF0Z3VgjtwM8Ac+8HtaNdgii4OrfCSQ/WDWXBFuyEWJaOMCtX22mFbbxZ?=
 =?us-ascii?Q?nl0v1hxjKRS49fopX3kXauQKY4Ckoa7zig0XXWGXfNWtErU+86kBeuJdbkb1?=
 =?us-ascii?Q?H7VjplJFN/tOT5hy2sYaE21vYO/zElqJtYqSX+bM/v6QonYYAdirecla9/RZ?=
 =?us-ascii?Q?avRqi1YHizq9KjzvbFQVrf5ecT7soh/KF6XnU6qgBjTxnFp3DH0Aexf0nzUr?=
 =?us-ascii?Q?fKh57kCojHQMLMFkPVwD50qayCV1fxFXpJYs3t/lwGCTQrF8TVodAKXtvN2f?=
 =?us-ascii?Q?bhyCXVG3Xe/k0k/K7ws6wlxHXhfx/LFntY9VnlyB1TY3VJV6TP6QSZwp/LRJ?=
 =?us-ascii?Q?uQedWVhUFiLwCS0RRFn7fCPS4ZS5kJb9TQdEmoFEP3f4xZex5Fp5VkB/TGKg?=
 =?us-ascii?Q?6ZrnjZOM1oU+Tn5YddgMP8AnoezZ+sy+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 13:36:08.0630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85949806-e667-47a8-7b93-08dcbb9ce339
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4427

The CPU ID macros are needed by the Smart PC builder. Therefore, transfer
the CPU ID macros from core.c to the common PMF header file.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v3:
 - No change

v2:
 - No change

 drivers/platform/x86/amd/pmf/core.c | 6 ------
 drivers/platform/x86/amd/pmf/pmf.h  | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 8f1f719befa3..88314b0277a3 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -37,12 +37,6 @@
 #define AMD_PMF_RESULT_CMD_UNKNOWN           0xFE
 #define AMD_PMF_RESULT_FAILED                0xFF
 
-/* List of supported CPU ids */
-#define AMD_CPU_ID_RMB			0x14b5
-#define AMD_CPU_ID_PS			0x14e8
-#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT	0x1507
-#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT	0x1122
-
 #define PMF_MSG_DELAY_MIN_US		50
 #define RESPONSE_REGISTER_LOOP_MAX	20000
 
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 9bf4326d06c3..9fc26f672f12 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -19,6 +19,12 @@
 #define POLICY_SIGN_COOKIE		0x31535024
 #define POLICY_COOKIE_OFFSET		0x10
 
+/* List of supported CPU ids */
+#define AMD_CPU_ID_RMB                  0x14b5
+#define AMD_CPU_ID_PS                   0x14e8
+#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
+#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
+
 struct cookie_header {
 	u32 sign;
 	u32 length;
-- 
2.25.1

