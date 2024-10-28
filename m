Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2046.outbound.protection.outlook.com [40.107.101.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31F218FDB2
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 07:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730099119; cv=fail; b=RclF497hcMzNiRqJFiqG1TD4n8tgLI1O7TlNvemhCd3j7St+DXGURKn4uasgmHuWE104nGkZFOlIt55pOnEI50DhamXTc1DLEWXrKXN/eBz7hywAoiIQv1UPf6/QSL27f6XUO4dhzDU4xNUoc66+Z7QdKI6Wv4GDUW66ubQawx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730099119; c=relaxed/simple;
	bh=ZZS4W9VoewGLxhSCaManuN/LEzpURITPpL9uJj26748=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LdDZRNdDqHMoPPYH7fZbUpgMj/2qI+m2AkF2VoTNowYKeG0bTzoiDZtdqerKYvFDFmSGwRFH2D+K6LcZl9fZLjQ9hc96bp1CxleXoFLt4PSXcHx9HRFa1WBOiO2dEoNWv0yGxFXYIKREkFwVnon5/v6plHjuql1c2o3J60WwijY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KkOy6uFl; arc=fail smtp.client-ip=40.107.101.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KkOy6uFl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilQhVHyb/DIcmAOW5q6xK3tE5nEEH7Yoploh/XUTuug8rOp9zTSyV2isWv0RdSMT+uUms4kCzQ4tS5OD2l9l20y2nZwbHs0nNxbbJC5Gh4t5XnNIghd3XeX29HbW0HGyFELOzlSLe2nQemK9A2MootuXpnO5twY5P5OGtEThBaRtw3xwMDmR8A+WU1q9wEaRR8qXF/ui5Zzcoyt12BhQYEts+8ZPtVjHCmgyFAehco4PqXulhQcEFeIfpBSXa2gBJLhPD+8HxBaF+PT2PXGfsHImvh4OA30CHvYlXysVF2sstSKP7SCrIG8nPAZT38cEy+GfYLYToAO5uo6+2Ig4+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJaVMVdC8F71A7WWJI4SOLxVtSQgx/gr8r4gD/2gXPc=;
 b=QQDEamvhDBnKTrSD2rN9Vda1z9kwRfNjs1ctWD2KmtB//mh9QCO+JS9Wz75AOM/LTZIi0GjwMZVyj/8Yn1Ky9hmKsgkI9MxiqylOJZhZr4VGsyW7ge27bOjWwSsQ/IMq1eemZsTnBDjT+AmiQO60U0zXbPbbdsrXL2cEcSDJR8WrIRwnaO9EgT6ax3rBJM1O65xyHcf917XX5AfCrRBmsJd6A0K6SgxfmmLCJ0TMCL7MdbIw8owLcmMkgwrKXL4fsNUl76ZhC2grvSrHRDtAXXwrg9sQc/f4fLs0wyvaaqs4xVAHof39sEV0L81NhaL+mARxvLnfKvOxcTA6mk02Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJaVMVdC8F71A7WWJI4SOLxVtSQgx/gr8r4gD/2gXPc=;
 b=KkOy6uFlldq959Zv6zsB3nKEpsVIuX9SUCymfnRDn1w7hxjyEyZ42O7jhdxBeBL2Hk0cRg9LSB7ZBROSNDpyan+OSyc/QALrgRu1nJYDsVsYfUGUFMrlkcyj/aWh0e6kFmBKgkiHuMHhJrU3R9ylbD/Ia6Fy8mxqqCBe51kO3tg=
Received: from SJ0PR03CA0123.namprd03.prod.outlook.com (2603:10b6:a03:33c::8)
 by DM3PR12MB9326.namprd12.prod.outlook.com (2603:10b6:0:3d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 07:05:14 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::38) by SJ0PR03CA0123.outlook.office365.com
 (2603:10b6:a03:33c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.26 via Frontend
 Transport; Mon, 28 Oct 2024 07:05:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 28 Oct 2024 07:05:14 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 02:05:12 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 6/8] platform/x86/amd/pmc: Update S2D message id for 1Ah Family 70h model
Date: Mon, 28 Oct 2024 12:34:36 +0530
Message-ID: <20241028070438.1548737-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
References: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|DM3PR12MB9326:EE_
X-MS-Office365-Filtering-Correlation-Id: 11276d91-3cf0-4d15-17a2-08dcf71edf43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cvpR7vllcPgHVOx8A2ZIK3Er/NAjoWP55SX58REj43XSGl+LG2tJ2Tu6FEON?=
 =?us-ascii?Q?pxvD6yolG16A/7kWlq8hlwZSVL7OvCx9o3INQXx7899cto6ImA9WDHM3GTcq?=
 =?us-ascii?Q?FxVD1C3dTDabuqsJmhp4Qt2qBz/LjPKsKyVLwl93Zh9wUxQ0OA80xhdQH/CF?=
 =?us-ascii?Q?+0rCFtHt0NOPKbwmV5ZYGv4SnqZsQrzstTun921B8jCGKhXL140vUSh5CZy2?=
 =?us-ascii?Q?fLCSSeoMdlSlBOukEyTV50e+salkPDrzSczveZmJK4MZgMk1Lxo2nwep8cWZ?=
 =?us-ascii?Q?1WJD2DWVhdwIaoUK+ZtYyG5cZ+WAXi3RpCgDoppsSkrWoEbRw8Q5LcrQ3hQX?=
 =?us-ascii?Q?cmxc28X8dLYpcAdaPr6gIcOjNNsWxRg2/PSZU/IQ0V49/X6PORhWqBmhQbqv?=
 =?us-ascii?Q?ddBxJReMNGuD3Sx6HGjaDYVJX30Oa4QK+gRlD2hqE7vUDQsHn+789dGRd1Pl?=
 =?us-ascii?Q?T7YYycTypXchI0dug1dlu9alwmT0tgugtC+javu5S63w/m6UxbneauSYXx7P?=
 =?us-ascii?Q?Wd8EMBSmL7pM/9y0mkgZ3t5rbY+T0lcwviAHWjvMW71193yk/EseMvsIRgA+?=
 =?us-ascii?Q?mrmrQGgWyvEX7XrsG7wQ4HfDtNh5Yimv7tdYbLObFNwZ7OZ5ndIlkA2qAegE?=
 =?us-ascii?Q?439SkL+f5qlBvwh9u+DkTLXWoP6IbS24Cm1rMSGeDC+7mGlues//3lSJk8Ya?=
 =?us-ascii?Q?rG6qmT1K0/Cr4sSfFhaZrkS3QhkZzRiwmrcqH/i5UU0nK+HjWTCoEe+M9uZu?=
 =?us-ascii?Q?oE8rQgSaDWo92TZJbE2R7otXehsDSOgOdiX7kuXgN6j/7DIEZ/P775jgYchA?=
 =?us-ascii?Q?EQ9MzXZ3hZnGL0r9QL0Zzzqt/EsWN8h/RsrKR+DWpqdEDNNKk10DlfFWJg0z?=
 =?us-ascii?Q?Ku16mOdSzldMWAuT6YLgEcfLtLb27GFwyHfRsSBFoff0UVHU78imyNTAcOwR?=
 =?us-ascii?Q?RuMirwW97K6hQKBVP8rAC1il/yb/ovyKMFRotuOoWlxqEHuszMZLqF3xLGhG?=
 =?us-ascii?Q?WTl/nB9fiel88gbbKHBk935EkcbHlbFzsAT02/KYStZJ7aGJZ2+tk3YLZFKl?=
 =?us-ascii?Q?uM5YdP02cEqnxbbOrYonOJD8HaUOSP48aVC0wKg9RKXD/+aEGW2EwXxZDnZw?=
 =?us-ascii?Q?J79XXuaNZoJugF97yISszsuz1QBoCj+xIrxNDOBM5h+VdKoPJiSciyCZ/G5T?=
 =?us-ascii?Q?q+YLh6eMidVI0hUPKdDT1+N5+fSFlT3q1xNVvAScTE58lPAOtKv/YVd9ScPA?=
 =?us-ascii?Q?LHaA4QIZAf4pF6AyxOA3OlSEPg90x91kMnTEkTfLkEpoSoyfYf2MEjgSa2sn?=
 =?us-ascii?Q?NkXWCcFUsnOP53oBXH0zPJhwU+3cTOl5cs6m6E4Ds/p51lrxPgCcLgp5tVXi?=
 =?us-ascii?Q?C7nTSlO2GNO68oEZ81sUA5Qzl0c8OVB7w1HHjfi/XB6nF+fYCA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 07:05:14.5626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11276d91-3cf0-4d15-17a2-08dcf71edf43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9326

AMD's 1Ah family 70h model uses a different S2D (Spill to DRAM) message
ID. Update the driver with this information.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/mp1_stb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index 1501793b9281..917c111b31c9 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -251,7 +251,10 @@ static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
-		dev->stb_arg.s2d_msg_id = 0xDE;
+		if (boot_cpu_data.x86_model == 0x70)
+			dev->stb_arg.s2d_msg_id = 0xF1;
+		else
+			dev->stb_arg.s2d_msg_id = 0xDE;
 		break;
 	default:
 		return false;
-- 
2.34.1

