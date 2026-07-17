Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012015.outbound.protection.outlook.com [52.101.43.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0148E400964;
	Fri, 17 Jul 2026 16:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784305291; cv=fail; b=r1H1LhsVwxHJl48smX2s/+qzRhCx8u/y5lHPaXaUsmL25mWi5vAM4SkS4D54/jHIXrYF19Ezv6DYUkFC7QaRgBeKhdwVyqDUCT2dQJ5VDgbv3TfAuvks1Y1650tWTJcgMYnGrNZ/gFTP5H4l1UFFoF4bTbOn8poob6QbIaC4e5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784305291; c=relaxed/simple;
	bh=n3wLit4bTlf62MNWvPXB35D30yNNoHznV21rcar4rLc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fkv66PcoMjJtrJElLYcp1N75hOok2R9IZRbVkwxP9nMH/K0gSuAfI/+mgvepgbOjWaJNI2Xhve4HG1nW5Fmcx0b80u80c8MpfcjtHMu5IHWObnvhA0qVBXSmNBsFF+PHexx9JfvTgkKJe0VnB/+l0AnD13bY6/Lkx4BG8jHtgfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oTZpN9M6; arc=fail smtp.client-ip=52.101.43.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oTZpN9M6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4wm7dMVD6gM2PcYe82CnWSg18QS86miPXOVNpl5LGKWGWXVZevfveSi/ufDFCU/mHE0g7ZfSxRfbHs9Zqg+qXoBtQktru0uoi1nUbj2s+5H1DTgby7luCa01UAa2+JM9QDAjN5XjInTviHYfuskC34g+xMvhd2SrouDXvZv9pPyAxCBElDcRcq+OpqzV0f+qiIAnywJU6c/IPHPT2bm+seB4hbu+GZ7LQFV7rS7KvwY3pK+fdN6IOcAS80BJfeTrKnq+su5MT98aYFAXKVUUN42mP0JS8ljslyPzaqShZPKq67ycCd11KWEulGBL2+EId/wh8ey4uRd1ATiIV83Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOrQge3OJzh16wiH1jghTcpvdkYtm/g7uPHZj879Cas=;
 b=XY2VQ2henpaTIwsIoCHwRHAlNyjsjET462sZwCAcj7NrQ2xx5SVjSV+RQ03kz01OxXPeFtsWQvCFJM3LUk+Un6jhBDmSUKBbiTJXctmyRA196V1khBA5PCWIWLfo+NpaLvruXPE5l+bv43umnRXqXCCAGO3T8HO/OzqJvL33ZBbZfTDlw/qmvj5UB0ThJIglOlejyZPbARt9Ftss58uyxp4PJZLFkKkP7CdJoHDs7vqPbrAuBkTM4VZHQ4tp4IzH47JEJz2iuJZqWEVJyZA/U/fpIQskwsiDgSvpYbuS0qJqVcEE5cRwYmXsdaZkuUEwAZw/yAIL5n/bv8EDaS//YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOrQge3OJzh16wiH1jghTcpvdkYtm/g7uPHZj879Cas=;
 b=oTZpN9M6XDDYkGIueJEs62PERVzR5wyCwFLsqxDOJh5yXQF7yR3xWczHfC2o3jdA9e2AnbcBEKjK07jP2+WwuEwX4CdmvQy8QfFjKbTOQ7EQ96Q2USKdHevAtFg8B2FB4AjhmioYUj6kk7UyrG4Pxy00hxxR9WunTbZ/b4Xk8Uo=
Received: from DSSP220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:3d3::16) by
 CH3PR12MB7522.namprd12.prod.outlook.com (2603:10b6:610:142::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 16:21:18 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:8:3d3:cafe::48) by DSSP220CA0011.outlook.office365.com
 (2603:10b6:8:3d3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 16:21:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 16:21:17 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 17 Jul
 2026 11:20:35 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, open list
	<linux-kernel@vger.kernel.org>, "open list:X86 PLATFORM DRIVERS"
	<platform-driver-x86@vger.kernel.org>, Mario Limonciello
	<mario.limonciello@amd.com>, Francis De Brabandere <francisdb@gmail.com>
Subject: [PATCH 0/4] Some fixes for amd-pmc handling of the STB
Date: Fri, 17 Jul 2026 11:20:19 -0500
Message-ID: <20260717162023.956346-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|CH3PR12MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: cb31de15-5aa0-4539-b062-08dee41f6e54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|10067099003|11063799006|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	luRAUApMnbX2bQHx7Na/vpKZlQVG7cSKCqHc9Hg5Iy+lMIXCEpskllDtPippj/HqDaDfWv834Fr/CDYwNgslUImI79XjgKeplUwaET9plEf9aWi4upUquRO6gQ7Z33GaLu3NT4x8GlglUaT0BinSTYo91dscmACvQDQth9jC5ScIf3Y8mDR0PXCQ3JNcgGDqnjDsJrhAuE+uES8bniO38+s77aYY4OqV2L8zDkcCR7ETmi9veN7MN2FLXDl76xe3IBeR1f9owIhYLJqGPtEdn9XZv4bTkZPp9BRGFnx2mlWiMcAj3+8lJrZBuvU+T4op/QDa5ptl4W9HV/p+otUqX/s+awHkjq2VWr3QNZiiXlXD15xLOVYVjNZNC8mK10cG2QBkG5bDbAvwNYgNiHmqruU5FYL6TWzssks0Wy9b1sNmtxV/qvf7C5amS6nT7dO0veCcJHRlvoq9t0XSS8I/wTZEEaAIqWmtnnb6Qd0CZ4/6QKNp0hVEcldI8pTaXGdgRJhgNUNRhNBrSj+1BEXEWwp9fxuqfwYXVyJUCQQs0UAddjozW0ipxY2BsBUIlnrnFMgdDn/VqsfF7LakKZVvwg9kvRnviw4lhc8Woc77Gr0R6CoxbFFidOfIdK/lhCQB21HE11zNUYJ5Wj9LTbq7sG+PjyPlAxlQ9Q8IlJkED6Tbb2CZjWB0N+J+txMRqacJ8/t8PNsTtprDXog5Hwahsw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(10067099003)(11063799006)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qhfRDskgfmfMJqXT5LYM0Sht7jO4fU331dVrnvjIXpVIU2FFdWv15uy99dTXWEy0c5bTIN5uzBejy8k5k/9NpJFY+CmTl3UcmWYrBd5fNe9WBf/tFZiiKPEG1v1ZFUV01lSfSQzFC/PzF4owhE1LQkf7l8PUnOcekE6JSMngNPH3FaEYvV6nuJlSpM3q5QYerL17SmflAmpFknmMOxHTojck/T1R/LFpnsFnksaBAdTJjLunlyi3pjcMfUv/86/DPHw85fv9mDVkEYIP1m2chZZ/XzI9MtD0vRZ4nZ5BxzXgI3jDZ8zre1+QrUTVxlk+/uDSofgWyggMNAoowyxNBhOPN4NpWcea7YwbcIbInvbLeNIwHqeV9vusqg81q+wyY263UIfHISkHxwXVpSFBX3Xo0gl5pdRscD0OfQV6iYCX5ZoG3l0b8Gx1PGdt89wW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 16:21:17.8567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb31de15-5aa0-4539-b062-08dee41f6e54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7522

Not all platforms support STB, and by activating it on a platform without
support a few bugs were exposed.

This series cleans them up.

Cc: Francis De Brabandere <francisdb@gmail.com>

Mario Limonciello (4):
  platform/x86/amd/pmc: Fix LPS0 and debugfs leaks when STB init fails
  platform/x86/amd/pmc: Fix error handling in amd_stb_s2d_init()
  platform/x86/amd/pmc: Do not fail probe when STB init fails
  platform/x86/amd/pmc: Validate S2D physical address before ioremap

 drivers/platform/x86/amd/pmc/mp1_stb.c | 43 +++++++++++++++++---------
 drivers/platform/x86/amd/pmc/pmc.c     | 11 ++++++-
 2 files changed, 39 insertions(+), 15 deletions(-)

-- 
2.43.0

