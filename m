Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD8B14A4D4
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 06:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729665195; cv=fail; b=GZhBtfUCqgIEj2j9aNl60glSlO+1XDus+2UTyxXQx98uxBEDu2Pqy744rCUo99Ard9Nxmm7Bb2m1PxpaA3kLoxzVoue/zXiTHGzynZ66+673P/MMRUMFfSAGM06BKyfvib682AY9W9u6XEYzLzL4pfSQr1fj7oienjAniOqRi6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729665195; c=relaxed/simple;
	bh=10UHsF9KPT6QogDY5Gx8Jo5hYHVAY2n8OKsNm7TkMdM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=txnnGM2GDo9Mpgz8xf0Q/E7TqrEqMvyLR55Lc0LFJXENPmpyp5a1+oodXySkmWBPYqG1suEyq/J1c1OkAI2Z3RcPXwHO8Ib5nfCEnNx4TMeFAffW9qUgyiJj9nWUEhCvFSEqjLoxnobjdsvAswOueprQNLlTkzXideQYWqXgPU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nFE9bqiF; arc=fail smtp.client-ip=40.107.244.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nFE9bqiF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rAE2GRNNBEoagAWI7gf8C56uPlX4LsNTrP5cmEfXoh6AbqNjFZPJMMSGyV8vo3qYQPG0Nb8E+InoPzPke7eBUgAhqwmjn1nHz3U0LqsCKkcaVnjv5pSfuncP1BVLMVN6a9FUqN23y4pKZP7lBRrx/mYoRkLojzT4jBsASDtdvNcgmxR4/Bn8+WpPokdWWG/blilivvPnXPUWr1EIW9Cd5apaAH46gJ5xhsGuaMelDYGmV8Je6bz3SyQEMXgjIkPjnTJyefKZj4XzkVHWVw3Kljo4ScFAaIW1j/utlUR8cMIuqB93AKAEpaTQmw9ywC3ZtNeGjf75lNm+nmrtAHFF0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLfrlcTQ8rwUkUJw9IbwMkt7bNaWF2XLLWxq1brdVOY=;
 b=Fh8cvpxYzh/hQk4AvTQ1Jm0mkr7tABIpgR0/f3xgIll7gGV0XeB+fQ6IzcVts64uWTQLYHu3s5t3OOHVwYfzI9Y+bOFIFiQCDMjJ1NRBQazxYP/nRTQLreoqeSqzN2LjgycBKtwhn3mNROwe2ZuaLhTpvHEh4trzdzexIMcr8vv2J2iMy7lpE61wZ/IEjSWeGMMqVtj3h2PI3mezDgrkgt7NW4Ir4WWlJ7JKvLv/RnekgvAp+ooCupoGi4OrcOvncPOq9OmXu1svcLm7Clzvd9rSHDU8J03I41C4CJXJLanU/3Rdq9EK2PXOHtfbYxGgy1rkIQAQOJcAKkGmGSU2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLfrlcTQ8rwUkUJw9IbwMkt7bNaWF2XLLWxq1brdVOY=;
 b=nFE9bqiFJ8LIZmreQwwMalXSV+w5Pnwxy4p60LHq+LzhOnDtTUkUL+E1TTE15f/fok759L4fiVpqQprWcmH3SNgsR/8nXql0ww2MWOf8SfFESisElEuH5AErNAQLJFg9cI8a32gN/u/IFWNEcboh6ed6eruJc7uMBg+KZ8N2gPA=
Received: from DS7P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::10) by
 SJ2PR12MB9114.namprd12.prod.outlook.com (2603:10b6:a03:567::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 06:33:11 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:8:1ca:cafe::da) by DS7P220CA0006.outlook.office365.com
 (2603:10b6:8:1ca::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16 via Frontend
 Transport; Wed, 23 Oct 2024 06:33:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Wed, 23 Oct 2024 06:33:10 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Oct
 2024 01:33:07 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 0/5] platform/x86/amd/pmf: Updates to AMD PMF driver
Date: Wed, 23 Oct 2024 12:02:40 +0530
Message-ID: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|SJ2PR12MB9114:EE_
X-MS-Office365-Filtering-Correlation-Id: 107a3de5-260d-41ef-270b-08dcf32c9063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w4P1v2/5So9IGF0hjf9070JDiki9+8aTZxOVZfQNiv5TpPvl3ymPO8Trjtaf?=
 =?us-ascii?Q?AoppX11rGLWMByf5Sg/8WCxaYQ+2as6c3wdhg8ZoRwesIF7p3XB3lA7Ds8Vj?=
 =?us-ascii?Q?ehaeAULnflS6s+QVzbyPSJGqt8/z2vu5H+rkggNTb0aesAh8ro9HSKyPOyy/?=
 =?us-ascii?Q?hvbIVa4W2Bb8yn70KDrw0AcZwhjfbGFY3+4W3FlKKUQ/PUPlww00rHvxo5Zv?=
 =?us-ascii?Q?64J/TRdphS6alzImz9zROwoNs2gq0lgCAmbgDEsaQtf3oaDFwmSVyfjqLwA6?=
 =?us-ascii?Q?jGBxbLhQqLuT/+nKQ6jNfQFO0Gfmoq5tO9n7w5HsbZB3WPDi5p8tH//B9SQP?=
 =?us-ascii?Q?V8jSzM7n4AOmPm4UWnh0XA2quVguuRXdaAjjTdsJZOd4gJdjq/kheR/zPE5n?=
 =?us-ascii?Q?fD0J5V4aGovgG8Kyfd//k/95Mq2KsXNJbETWOsl5pZHB1IXMSq9lej4MhXky?=
 =?us-ascii?Q?45VlSSmx3xB1M1Bxuubv+F/zDLSi/mPWa+RYVvNxyxTMnCaX5GXWN22947MJ?=
 =?us-ascii?Q?DjmEIJugj65Qts7L2RUKPW2LSz8JSUrcYe7Q5srKnp7rVjVOhQAyvfM1mAEz?=
 =?us-ascii?Q?/JzOf6BAARJB0kBO+IMtsdTD9sn1Vi3IbvJ81T4p0msViURPR0+dlvNG8qTx?=
 =?us-ascii?Q?3Q0+P1Fe4um+gyAorI6EE4nJmTN91hlflAjwQqZ9GOX+73noJiDSAbcb4gGD?=
 =?us-ascii?Q?KnKC/6d61kesKrZXkYfIfOE09YctQ2TlwY2X/YAxviF2y+LPdCbkqM6/Cet3?=
 =?us-ascii?Q?5y9jAeoFhbVeCMymFhXXMWuH7GLYFUl9CcT2c0w6prRDuu1Cf2ArktwALerq?=
 =?us-ascii?Q?q3Avmdh6pL14bjWcpJTiTmkaHgAdH4MDZhYpyuid/+ms416hjS1boNZUpI+j?=
 =?us-ascii?Q?EU4zbyebcA4n+J2e6OMhSSWxdZLt6NATUVHJn9L4yK0ao+JJz+cAZb3g03F0?=
 =?us-ascii?Q?YWR4R1i0H1awncFq8T1Et0DY3/gwn/4bXDUFHKanKmAkANih9h9ma609T6HG?=
 =?us-ascii?Q?WHoPnQGrs3Qu3IWoe21S2HvZEOTLXW0e2vv1CLKV1AHpfwhQu9uWIHVwot+s?=
 =?us-ascii?Q?50w3imk2G9PvtjxYbC14bpTJY0/QjrMW0DdM/gCh1QOXSC5JjbEj9DlKfI1U?=
 =?us-ascii?Q?4E0vb9tyi7K2W+X6iUvH9YOuTPCNvG9+z3Gwso4ZnNzalasMwoXa9PNC2YCA?=
 =?us-ascii?Q?EKdhpQ0Jtdfyu9cl0ZKxBRH2nhOtFOIRIl42rs/ShSp6H0eWjcLYeghf7hOk?=
 =?us-ascii?Q?HElIGBGJDTV33QONG5VD66PDDs+iuAe/xwpgykmDQ+hjJHjWTPRdapFIyAR+?=
 =?us-ascii?Q?boXbWNGfe47rvhZzijiFyuQQgLlU1jEpJhyuz2QSh3PTEQJ2iXzT6cIFnOXZ?=
 =?us-ascii?Q?nvocrvQHfmwM7BkF0kZ+cOlVxxANYAlC2diyKXEPsK/uBKhyvg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 06:33:10.4733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 107a3de5-260d-41ef-270b-08dcf32c9063
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9114

Updates include:

- Add support for newer platforms
- Enhance the TA shared memory size to adapt to the updated TA
- Update the MAINTAINERS record, and
- Simplify certain code handling.


v3:
----
- Add a comment to answer "why" resource_size() is not used for getting the
  ACPI resource length.

v2:
----
- drop resource_size() usage
- use right format specifier

Shyam Sundar S K (5):
  platform/x86/amd/pmf: Add SMU metrics table support for 1Ah family 60h
    model
  platform/x86/amd/pmf: Use dev_err_probe() to simplify error handling
  MAINTAINERS: Change AMD PMF driver status to "Supported"
  platform/x86/amd/pmf: Switch to platform_get_resource() and
    devm_ioremap_resource()
  platform/x86/amd/pmf: Add PMF driver changes to make compatible with
    PMF-TA

 MAINTAINERS                           |  2 +-
 drivers/platform/x86/amd/pmf/Kconfig  |  1 +
 drivers/platform/x86/amd/pmf/acpi.c   | 46 +++++++++++----------------
 drivers/platform/x86/amd/pmf/core.c   |  9 +++---
 drivers/platform/x86/amd/pmf/pmf.h    |  8 +++--
 drivers/platform/x86/amd/pmf/spc.c    |  1 +
 drivers/platform/x86/amd/pmf/tee-if.c |  8 ++---
 7 files changed, 36 insertions(+), 39 deletions(-)

-- 
2.34.1

