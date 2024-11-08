Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A3F1D07A3
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 Nov 2024 07:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731049733; cv=fail; b=WKscZEDw3XRFnukKe6MWE9xw/cVSN8a7dYpU7nDyX6wnlDIvenVdhQPMAgKgJB3bgvbC0lIfgeCORwvyZfclmtSTgqPfU1KslZvRTtdtswJERf8nqK35ppDU2U+oGK3/7jpBz6Idk7QxWyTpQ4X1+mAwBVOM8DSilL7Tnegbho0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731049733; c=relaxed/simple;
	bh=jSB3qu2AU05gsX2R5QPgCtPhbE/6uEUGDAw5BZQRNWA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d7xhIA8NnMV5b9MimxHKycTmxvszmsSRSsVKdY+8t7h70WKjyclXWHmNVaLufcJgePuSLaAuTavjigQvrcKMRijLxwOe3ddIiyX3HnJI0qW39XwoAtjPeGZISFQrf7r3Ly6gL1vE9qtzmrHQBiVA+FU8u7WroWoQEjMs6qr8eAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=W0tdvXOP; arc=fail smtp.client-ip=40.107.220.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="W0tdvXOP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HONJN28lDHpLf323U7yN+BKoAZLxd0+3M81wIStBpDrCRQ4LHyBJ5Z0wJqtNyEH2SZC2uoOKlCGPD6Ji90jW4Sc5FF+3XPr2Uz2g9Oa+z3DQ9eTlHXJBXUg71VTp5q8XsWK+aM26p9C4chlkTz73ZKJV7DTdrevCiYJjMGng3JPZ6L35hMxNy26QOcw1ytlZGwmORxCQpucK+qVxyu4pkmp56dH6sncgHpuXl00K1sjBczlO4noAmm9mzwV9VfjvBHcZIEIcRO7wwYjVJMS2NF8EahhIOmg4KBSifU+0q1ureJYyUFgiBv9JOb1sSMeh45IQzbkg8ZacVVJXzvHoAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcLZTOnDr130BgX3zf7OqJqnbAfAQHEYbnwokwGToy4=;
 b=YxCzdvy/aYTdoocG7Cbo7OlKoSS16zz0ELckA7sFCQOraETfgZfNUE2I1leryyUbKw1w3DlKd+Q5uR4kBBMcPQrqSbkO1RUyIp2iTTER+ysLcmZTtz2GaMKYGy1ll/9WVtz9LuE1zZW6ZDA7v4vzDVz6VIAFFaqNlaIAjjufRiJVOJXQvWZ9ALzCiyk0UyBJEP2IQ27cm2PwdWljRUPsSi+7xHdU4OOzzrBzKt0Mz7sJb6mR2Y7cIimOjRN9qxwcYq+xXpZ7U7Rcm58L2q8b+WK0lO4X59D+gh8iDDUf0CAE2pw01pTWSjlc6Kezhy1Cx3dXpnJYY7wq/bJzvYoBkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcLZTOnDr130BgX3zf7OqJqnbAfAQHEYbnwokwGToy4=;
 b=W0tdvXOPnpbwk8b53u/hwPKoUMelCXM0XvoEP4t76I7pIrmdvWw+ZGJBqTbQwfzfBFx2iA++CgWdSyXZgr8SSHMv3pjYADUArXHgMmGm1j1sM7bMhneWcbYRb81MzLqes20L2wWaLyPW3qb42XQXpRLMdS0te9AENa91ZOQAYyo=
Received: from CH2PR17CA0006.namprd17.prod.outlook.com (2603:10b6:610:53::16)
 by DS7PR12MB8203.namprd12.prod.outlook.com (2603:10b6:8:e1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 07:08:48 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::45) by CH2PR17CA0006.outlook.office365.com
 (2603:10b6:610:53::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Fri, 8 Nov 2024 07:08:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 07:08:48 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 01:08:46 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 00/10] platform/x86/amd/pmc: Updates to AMD PMC driver
Date: Fri, 8 Nov 2024 12:38:12 +0530
Message-ID: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|DS7PR12MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed15c13-7cb9-4a78-38f6-08dcffc43164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BxQr+TAm/yZ9Mv1cbl4X1vlm2If/FGfinVBAo1M8nKfr1f3UTV5QqdJUgAWX?=
 =?us-ascii?Q?xpBac7YreNudeCNHFmFX0sLitpEPQngKqGFGsif4knDzG8ZH/P9sz50tTltq?=
 =?us-ascii?Q?ywqBpHPk0whqtQZFUEZ3v5/q/brz9dsGk2w+5QVUSe56qj7xXT0gquMMiAbJ?=
 =?us-ascii?Q?MJeHJ+OrbUiL1gc85/7TwflMOefr/IBg5eMzp7eOc2iZ3ZTikD6EGEN1NI6o?=
 =?us-ascii?Q?SRFaz/vMBngmmt/qZydwU2P95/7GIoQRjjBu/uoBTHAB3wSSIda3alHcjKtp?=
 =?us-ascii?Q?COfZdKAzeuAaPZw0+SeuWPOfACbliSk3AORDBioR/3y0swiYwYlaUqq7U6WR?=
 =?us-ascii?Q?7EY1mFkI9ofpf0bxJai+FvgLhLvdu4rEn3AX4ScqezZ8OI+GPRvF+xlXY4L/?=
 =?us-ascii?Q?NZ4vrDlPfrcHg2WWkc1+15AQ7NDrjkPw70yjmAT3sTV0cqFCoMSW0aeDYRMB?=
 =?us-ascii?Q?HBYJrgXxoBAz39aE3OhxanJrS7eSCYub5Uf+XPmCTcWr9AwyBhPP3ymCOdlR?=
 =?us-ascii?Q?kqylB9m5x6L0HVi2RgzNPURLbcaDyhRt0EjrSQX7ubDDRurVxhLVJqpnD4HY?=
 =?us-ascii?Q?46HK3rW1EC5YpD29jE8Ca2MQ2hbulRu300CWcWty7eDCTv9MXKxvZ8tgABgb?=
 =?us-ascii?Q?nISbiyB036nE1amEsOJbzFfQBT6AbgMSryhykCb1lHbSqM3spuC7YdlMIitH?=
 =?us-ascii?Q?+nxRPKfQR3taBQFFRS8tHWZOd9gpPFNDIajv9IlH5CZGAmBIxDqdtdNKSRoN?=
 =?us-ascii?Q?nDjhG6dYheVnhl5crnBsljRt9LyQO6yyqnRi5zIQ7sxg+Vjim8o5PoTeUM7O?=
 =?us-ascii?Q?+R7kFLn4BSohJ+xFpgHK3fUxD5mJQhI7ChVaY4QUmju0okbEPaBIkawyt3fM?=
 =?us-ascii?Q?sd0eK3B45zobpCTnv0Xs9E5vY1slt4dR7bS9Q2BYw9Y9XTQ71NNI3MXVCk++?=
 =?us-ascii?Q?NVG5A/+Na5XUk5y4t1xjrhLw035Lmqa7fD4KsF4fYqDsDFrZOg5JIwGBdPPJ?=
 =?us-ascii?Q?pctVzjTqEQjoS1UrbcjlSnLUJ6hhd7246lMsAButOAl7UkiuEVxOCfm8/9UK?=
 =?us-ascii?Q?IaY7t+9VJQIGl4H5J30zXx3s5MpAbS1uyBifMF58aBe0yadQVGQOoYtJllmO?=
 =?us-ascii?Q?mLwwCI1X0ueCDgvsw7bRsH6O+lXhkhaUtpcL52j0hy6kMrUdHbGnG22updJ3?=
 =?us-ascii?Q?+ta438tCs5bKD74EXgv5AxQnon/vr1dzkXZ8kcpF1RUnou9B90TVNQUyJgmY?=
 =?us-ascii?Q?gfq/q6rtLEjSiJsrET103u/vI2kf7ezI6igmd4JXuhzogInxVIhYmPEx4UPk?=
 =?us-ascii?Q?g5NoIMhLkHE8A/T1qSpWV/4g1/gme5HFSrgMwumRcdt0SrTmUtnMEegktVfZ?=
 =?us-ascii?Q?L8mzt9EcFGbKzoBvczB5U511VAB7ojAhZbW6xly6QX0NBjen2g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 07:08:48.6154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed15c13-7cb9-4a78-38f6-08dcffc43164
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8203

Updates include:
- Rework STB code and move into a separate file
- Update the code with new IP block information for newer SoCs
- Add STB support for new generation
- Add STB support for Ryzen desktop variants
- Updates to MAINTAINERS record.

v5:
----
 - Merge patch1 and 2 of v4
 - Update Ilpo tags
 - drop explicit typecasting.
 - Use switch() for getting the message port
 - Rename function names

v4:
----
  - Reorder patches as suggested by Mario and Ilpo
  - Squash patches
  - Update tags

v3:
----
 - Split patch 1/8 of v2 into two more patches
 - Add helper for printing S2D/PMC ports
 - Use ARRAY_SIZE() for getting the number of IPs
 - Address other remarks from Ilpo.

v2:
----
 - Add Mario's Reviewed-by tags
 - Add amd_stb_update_args() to simplify code handling
 - use cpu_feature_enabled() instead of root port's cpu_id information.

Shyam Sundar S K (10):
  platform/x86/amd/pmc: Move STB block into amd_pmc_s2d_init()
  platform/x86/amd/pmc: Move STB functionality to a new file for better
    code organization
  platform/x86/amd/pmc: Update function names to align with new STB file
  platform/x86/amd/pmc: Define enum for S2D/PMC msg_port and add helper
    function
  platform/x86/amd/pmc: Isolate STB code changes to a new file
  platform/x86/amd/pmc: Use ARRAY_SIZE() to fill num_ips information
  platform/x86/amd/pmc: Update IP information structure for newer SoCs
  platform/x86/amd/pmc: Update S2D message id for 1Ah Family 70h model
  platform/x86/amd/pmc: Add STB support for AMD Desktop variants
  MAINTAINERS: Change AMD PMC driver status to "Supported"

 MAINTAINERS                            |   2 +-
 drivers/platform/x86/amd/pmc/Makefile  |   2 +-
 drivers/platform/x86/amd/pmc/mp1_stb.c | 332 ++++++++++++++++++++++
 drivers/platform/x86/amd/pmc/pmc.c     | 377 +++++--------------------
 drivers/platform/x86/amd/pmc/pmc.h     |  22 +-
 5 files changed, 424 insertions(+), 311 deletions(-)
 create mode 100644 drivers/platform/x86/amd/pmc/mp1_stb.c

-- 
2.34.1

