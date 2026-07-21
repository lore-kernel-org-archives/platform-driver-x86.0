Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010007.outbound.protection.outlook.com [52.101.61.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC07046C4DA;
	Tue, 21 Jul 2026 18:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657897; cv=fail; b=q2Wkssyie8ja0fmHiRcVBf2UtbbSALCMaA3SuPchrQEeJf9D99zRruRoEifMJsq7dFqkrfbwHLHXZzzoGC2yUkwF7BtyqtliLlNNjLHVv1jL/o/eDyJY1vm/nWFrF+dLnXylk+4h1OSKLGu5bt4JJv+XIDQGsCyUOomWbhadcK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657897; c=relaxed/simple;
	bh=mIa4IlLORfhgoDr4q8/E5vpMX7lTYeAVk9wyNovlRUo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LPk+70JYQDSTfK0+/h3w5epwXUoV7DOZgeRlzmu8ovXsXdjjQKzZk0r2Z14nZpMay31BQI+syO1xexSG7H/EO45aV+yJf1KHK1zzBv67YyZUr/7ax55M/JhS+/pPuueZJwsm7omXcgmp1CbasoxiyiZrwNS47OLR8tEqX9nTFLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cKhVUBne; arc=fail smtp.client-ip=52.101.61.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cKhVUBne"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKT3SvAE611sNRFpVJRLHDZizh4aUQmzpk2Hp+XhtvxIepze4btTZZEVpe3PqDQP2Ma1kO+VvMl/UTW9e11E39jXcijkfBNp1m4eECS4+z94KfdNWVNLFkGB3b+bgvbmcpnDa5lDdZn7vaLsqA3Z3PCeMO/fPZAqKH9rPMkqse7FF2CWiM4YU72pyini4Ko0Ss3xlvhacnmm5WxIjh/FgLY5/QIY0gKYrt54hT+bVEZpV9hO3pQunOVNqj1CMb5LTHcPgqNd7/Bgdxsv2nw2zFoyRHSQy0LPmaZOx2gOTPsuIPYZLz3qzMJjeEO+VywOS1MxImniLe3tFcpnG8X8Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tj+Sep2TEmBBL477zScmE65nV2tvTDCgIV8eYaxbEgg=;
 b=xaZJ2xu8aFF49gMI+TJAx6u7qpZFOmuRHdKTn1cA9N6MDSmKLe/gNL/dpg/6XvXOTbeW/KD35eRhGiZUPFXm7dXa5R20xg5p9kyrxui/vnCr429qfc0coycOvZIdhsIkJsS3osew//m5i/tL4tYF9LDxu6q6FDPsw4To5RnAwUc8S4+uSWAwG89faVE2rgk+7agvdTePT+Jyx1LRzMqHMvL1V3t5uN85yz+YpfXAUh881X77lXdxwTn2ofMjMVcQ5VvbBQ3KJKUkbCZz/0PFHlKIJxPH+aqtPGwxvow2Ujb7yisNczo+LZ16wPv/AiFmLwbCnsbKQ22J/jz46r9hAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tj+Sep2TEmBBL477zScmE65nV2tvTDCgIV8eYaxbEgg=;
 b=cKhVUBneR4+KnvY4saTa029KIcU5wm21NPRj1d1eEeuC/K/46nojFXO4DCLowgFudQvdRw3HOV91thWoT88BsPa406T4fQc7fQrPne4//7zO5hBQfT4BgEa6Qr6Bvz1JCOQcz3EQKiPqxT4LQdUTAQRxcE2Qbp8CrXTzUkWG0Vc=
Received: from MW4PR03CA0235.namprd03.prod.outlook.com (2603:10b6:303:b9::30)
 by CH2PR12MB4085.namprd12.prod.outlook.com (2603:10b6:610:79::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 18:18:09 +0000
Received: from MWH0EPF000C6185.namprd02.prod.outlook.com
 (2603:10b6:303:b9:cafe::84) by MW4PR03CA0235.outlook.office365.com
 (2603:10b6:303:b9::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.18 via Frontend Transport; Tue,
 21 Jul 2026 18:18:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6185.mail.protection.outlook.com (10.167.249.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 18:18:08 +0000
Received: from aus0006770c4n-lx01.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Tue, 21 Jul 2026 13:18:05 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, open list
	<linux-kernel@vger.kernel.org>, "open list:X86 PLATFORM DRIVERS"
	<platform-driver-x86@vger.kernel.org>, Mario Limonciello
	<mario.limonciello@amd.com>, Francis De Brabandere <francisdb@gmail.com>
Subject: [PATCH v2 0/6] Some fixes for amd-pmc handling of the STB
Date: Tue, 21 Jul 2026 13:17:50 -0500
Message-ID: <20260721181756.143084-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6185:EE_|CH2PR12MB4085:EE_
X-MS-Office365-Filtering-Correlation-Id: 55f6b49c-7d31-4e0a-b305-08dee7546a97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|11063799006|56012099006|10067099003|6133799003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	OmtbvjmtZqagg3r0ZLhMha8P15lmfstGVscZS5A4ioD20r6eyjYmDzelbtGjWORLelcx7p2bhphPQ6aG9JhP6SbtKuVwoy4joIbi5tmggq29PwHqe4Xkh8yu/rz0G5HrTU/jXGA/XyJQ0TtcN1dfLvSaAQRrLcu01f5DS8Ej8LqhVMqjMgyEzmN65z0xpvrK4dgbmRNBnmmu5anqukqMWwVvflqKawaD3rGXAQ5qcAbP1w4gf6QrLC0cfsuTZdsRJaMlsyCkf0sVxzP1XiBRTmBoASvwyo2YUFyqbxGBfkvJtwsIV9HRZ6jJV9A3dzl+QO01QUP8yN9AvlyB7PjapemQawTvUuUjJK2HD5IwGCdIlVcExPaFJ0kqQK21UfSnIrFMyWGXW1aZdxIX9+Cjl6nri9swghxuGSQnmV7ahNZvZY5lV/PKOxeAGqUeTwUK5I3/E3mLi7EClzdsOnDocV5qiRcI8fTVrujg2dSX130l1A7/39nxQj/Bw4kMKN4+VPVhivC9Kk6dG67PJERLz/yZr2AWzBG+HMWbLvuQq/m8+y0bx2ec0COAVFHSMRFpMQ9541QI8cqpBHrPejhHsWf3G1kFGeGgGTBSGwasBSr2THOP7Epbs4JVv10y98dvw6R3yIVKr1gfnHvMxEzclg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FqcRXWOZMOh50ZQ5n7Vt8+15VAOHI6PG5uPQu4tqlila/tY7eqjkQu382vsaC0ndwhrpFFlcWitXfhLMdnBNMQatAfSeFA/1m61Y6FHVsrki2/fwy7bKGKRat5K0ai/CbyUge8uwfv3ZIl+Nf70WL0viOM03bmgiQVdiklDlBmRX3UCGrOkGtbkroB0XoUaM7nt+T8bOWMoKs1AkoDkMRYKPwn5LQ0YTJuCMqPpvJTEzhnUlYzNlGjF+RludSSDHGfp/bL1AV/FJP1JojH7Az4WnQc1rh9tDoKCSFQyc6EiezoMspIivadBFIVw0xlLlMxuEoe00VrWJ4CftMyvKLAwOn90UC0QWMbFYSqrSaHYokJmM5QEwIhw7TsUywAUq2Ej0iEMPeDKGM1EO7xhbFkD4ORgzYKbt19j7c709/Sdo01+6A+qOHSjN3IpKVeOJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 18:18:08.3443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f6b49c-7d31-4e0a-b305-08dee7546a97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6185.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4085

Not all platforms support STB, and by activating it on a platform without
support a few bugs were exposed.

This series cleans them up and also cleans up some existing cleanup path
errors.

Cc: Francis De Brabandere <francisdb@gmail.com>

v1->v2:
  Addresses review feedback from Ilpo Järvinen and the Sashiko automated
  review (https://sashiko.dev/).

  - Split the v1 "Fix error handling in amd_stb_s2d_init()" patch into two,
    per Ilpo's request to land the msg_port restoration first and the SMU
    error handling on top:
      * "Restore msg_port on amd_stb_s2d_init() error paths" (msg_port only)
      * "Propagate SMU errors and validate S2D address"      (error handling)

  - Folded the v1 "Validate S2D physical address before ioremap" patch into
    "Propagate SMU errors and validate S2D address" - checking the SMU
    return values and rejecting a zero address are one logical fix.

  - New patch "Fix msg_port restoration in amd_stb_debugfs_open_v2()":
    the same stuck-on-MSG_PORT_S2D bug exists in the debugfs read path
    (Ilpo noted another site needs the same fix; also flagged by Sashiko).

  - New patch "Only expose stb_read after telemetry buffer is mapped":
    fixes a NULL dev->stb_virt_addr dereference on read (Sashiko, HIGH).
    Ordered before "Do not fail probe" so that making STB init non-fatal
    never leaves a readable stb_read node backed by an unmapped buffer.

  - Reordered the series so every patch is correct on its own:
    the msg_port/SMU fixes first, the stb_read hardening before the
    behavioural "Do not fail probe" change, and the LPS0/debugfs leak fix
    kept as a standalone stable backport (its now-unreachable unwind is
    removed by "Do not fail probe", as noted in that patch).

  - No functional change to the v1 "Fix LPS0 and debugfs leaks" and
    "Do not fail probe" patches; only their position in the series.

v1->v2 patch mapping:
  v1 1/4 Fix LPS0 and debugfs leaks          -> v2 5/6 (unchanged)
  v1 2/4 Fix error handling                  -> v2 1/6 + 3/6 (split)
  v1 3/4 Do not fail probe                    -> v2 6/6 (unchanged)
  v1 4/4 Validate S2D physical address        -> v2 3/6 (merged)
  (new)                                       -> v2 2/6 msg_port in debugfs_open_v2
  (new)                                       -> v2 4/6 expose stb_read after map

Mario Limonciello (6):
  platform/x86/amd/pmc: Restore msg_port on amd_stb_s2d_init() error
    paths
  platform/x86/amd/pmc: Fix msg_port restoration in
    amd_stb_debugfs_open_v2()
  platform/x86/amd/pmc: Propagate SMU errors and validate S2D address
  platform/x86/amd/pmc: Only expose stb_read after telemetry buffer is
    mapped
  platform/x86/amd/pmc: Fix LPS0 and debugfs leaks when STB init fails
  platform/x86/amd/pmc: Do not fail probe when STB init fails

 drivers/platform/x86/amd/pmc/mp1_stb.c | 83 +++++++++++++++++---------
 drivers/platform/x86/amd/pmc/pmc.c     |  9 ++-
 2 files changed, 63 insertions(+), 29 deletions(-)

-- 
2.43.0

