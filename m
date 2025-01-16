Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512F61990AB
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 08:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737014414; cv=fail; b=GmiIJk1PBk8dKGfXBsPGEVZdBNBHanJU51EL9XN0NsIhEOovE7cZSAFTiUXMszlUj4WamdpL64ymB/BiSV148eubDWBKlgHdV/19uK5rgQi7tleyCD67jRUlI0i3kufGf56iqCzhlCjYujAj9mL5QNPN0Nepp5p/SlvxRXrr8qg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737014414; c=relaxed/simple;
	bh=1UwpzhNQvMCufmER8NgOMZrTt2zm487oYz1f+wtefig=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tymVrDWGDxxWT24c3kFgm5WmtyJLlyI0GQUOdpjOshkieRyGTeOKUKSpz+RHHC9VEyU1BBLJ1/ok9b7cTPhPmQtj/BBCJiCZ8NiXw+RAl/QyN9vt3/9QKVxp6On1YgdkIo09OpkqaV+OV4tG0acMrAYlNNO0cTQYd4BPzkiD25Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MOUw07Tr; arc=fail smtp.client-ip=40.107.93.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MOUw07Tr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFARpIRWbIoCKGnfmeowb80M2iaKGcZvJSrvVCEDVIPbOPBhXrzu80dieWOhQS1JRuEzzM6sSOpSLkX+VKLv4wy3Zn5aGnX0SHom7v1Mub2dnYR5fElSxtQLgEwGCqugotClOKXFZf9vpjJ5JRTMZflF3nNqOV9HUZy/XQb9i4YSszWryAhBTa2KWcAsJAWb6Z56+pBSSbvxaGDRn39xFSeQSyCHuUr5hZu5M5KFfouSN/9+IJ5hnj3CBmu2v+DtiHHW2Qd+P5XMAW7GSpwIWow/Q0Nh9397Y+Rrxm/kaQuRml2UJGkhqMWIiE63VcIa4sa9Ex3e2r8Ri07yBTMGyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NolxlxjhTQwMsO0MIZlMyjZnrOVFHCPAkuGvtlxz1FM=;
 b=Piyya7GgLIf6GwSoiczeLLDLec7VGMbviIfpb1ue8CioGH/G8gpsbLeVRLf7RrDyJZ3O5pXH0iGo+nFWplgij31zI+ZDPCyDCxpskLIxi1y3rUMAQoKCBgNB3Fc0QIbHU2bTnA9/GDExOGfp2Hlo2cvxAEG5N18lrBMmroeXHEZs5+01VR4KEksdH3Z4o03W8pMVfq6Sv1ICQyuMrh3GGNmmcCQlmo4fZUCQB8yDRBV59+pWADFvqPytD875cmiBXELiqzUNIG7XSEu3KyovfDQzcEWVFhEqotdkPP0bHHILNpMKnkchclbKR8OhItoJLO14Ny+K9x2ZhhySxsUfvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NolxlxjhTQwMsO0MIZlMyjZnrOVFHCPAkuGvtlxz1FM=;
 b=MOUw07Tr7ALGWxVGqc9HG8NagIAxz2Nhp5sBb6pVAb3/h1fPdLqZYO/1xCdsVpTYS0ljT0j2EhuIzKlzOtddLbKLOp3g2dEHuVCxveHrA1v5KzzWayzGsanwwhEI4oIW/XhNjbUTAQ98+bU6gXmFuzBopMXJ1NqLxfCfr011pjOV40y2JuRYb6PKrXPLyl4ZPW9Y64QRu4HbjzZu8WZCFNVQv23mSsQNxNZx0jds980JKsHD7zyUPrC+4B7xu5vSaCuwkF8/db18wrDXdExyzPfWWCrSy9t6AKTcvKXW1im3DD7oN+JVAv0MHjeK5kRB74IWD+G8JpEI4iQuIOLeog==
Received: from BL1P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::12)
 by SA1PR12MB6917.namprd12.prod.outlook.com (2603:10b6:806:24c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Thu, 16 Jan
 2025 08:00:07 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::67) by BL1P221CA0001.outlook.office365.com
 (2603:10b6:208:2c5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Thu,
 16 Jan 2025 08:00:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Thu, 16 Jan 2025 08:00:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 15 Jan
 2025 23:59:55 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 15 Jan 2025 23:59:53 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v3 03/10] platform: mellanox: mlx-platform: Change register name
Date: Thu, 16 Jan 2025 09:59:09 +0200
Message-ID: <20250116075919.34270-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250116075919.34270-1-vadimp@nvidia.com>
References: <20250116075919.34270-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|SA1PR12MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 245ae31a-288f-47f5-5c0e-08dd3603cafb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YSYSjMWRgjvt3HwSpoYHfnG+eNTXCoZaFh41riRX5I3jUwNBendRXfzAAgbO?=
 =?us-ascii?Q?1+vQi7W8HldzyxTdpdijVduy5hFEBoC2wZ19fOipmrbhhapsqLwH29pwG8GA?=
 =?us-ascii?Q?Uz9ZOm8TMgvqNaW7yuKsnIly7OWd4AqPbjbDH/G4nosl9NbMJGuKvqP2+FBV?=
 =?us-ascii?Q?be2qRTg34JdkI+oe+4k0KCFtwo/aiVJKZXE4p35vbdqsy3i50aHYScoVuV7B?=
 =?us-ascii?Q?Y8XheYH7XFhBpszTBrH3EqAIfG97IauFe5oH1bnyiXmzQFR5Ug19Yc2dbv1U?=
 =?us-ascii?Q?Bb0m5tPgUR8ozOOPW/oVx6eQxwiHITcHCPcd/CwVFM/MrVFSgoR+/yvLwtw5?=
 =?us-ascii?Q?L+woHcOta6mKA7N4q4Dp13+GG3YwTY6B54Vv/QrEnAI54tL98cy6LTsShClB?=
 =?us-ascii?Q?HrNAJXh4JsvIr/JLMpsrekkz+ktbWRJFMatcsFW5gd367kbOF+cp6Ki1Jgo7?=
 =?us-ascii?Q?xAw/0ubBysSB7NNUU1Bis5vzr0WmyheDB16zUtY7ZIGp95P1KbmMO756LCYR?=
 =?us-ascii?Q?gCdXQ7gp8bkrTQpB+yccnF2hja73ISKY4LfudG1zOjs/Glhz5GXFaSS6WjFf?=
 =?us-ascii?Q?ihP5mL80ZedOrI6wwGBfP4HkGQnsj9fEUU4AA5LL5S/lea/pV/IzXcqvJVrD?=
 =?us-ascii?Q?rg/9nDle81JK31w7EMujISFcAAUeBp2N3YQ/nHO0cRYcI/y2xAcrZ3B/OGZP?=
 =?us-ascii?Q?zyY/kY4VOnZyqOE1fna1fnjPc6RYra98GrlCT2z/I5euhETp4MvYP8a8BxKR?=
 =?us-ascii?Q?UbbU9QzHCtbXpQfL/dEin64WRvmdL6pk9rHgcek90Xz135ZBBo+V4ZWQgDu3?=
 =?us-ascii?Q?epWgSsNdpxx8Kn+WCCScHHlYrbFZgGUFlmbdq5eEeQ3vV+ePOwPCI342R4WD?=
 =?us-ascii?Q?c3Y85ha3WTRai4uALiFfskIeGWeqQ4RiXnPhXszRMlNUaUjG22FjjN+eT6FL?=
 =?us-ascii?Q?5+IB2YZ0KxU7EMIzaWeSSQoFG5fn+g0olPXE7izHp7lXsWvMwOYbmYTZYcV/?=
 =?us-ascii?Q?ySTlY2htahDmrwgk3Z6ntNr0k0W/DUxVim25wLHIHWG33XkpVWMIeFg7F0Uj?=
 =?us-ascii?Q?8V6ErsU//8D/bhLcypKg9cKLuTHUF/e0ZOcQYDzcAjb8DCtjG8dLB0XdOPnU?=
 =?us-ascii?Q?7mMKjyRJoBIyrer029JHaQDHZpBMrG3uH2wv5mpFf8qqkoy8r6QK3LqNsLe/?=
 =?us-ascii?Q?sWNJAGTNuvC7W+sv84/0QOtVyXKvDy//dscWN1p1K80F8hLhqfUE9tNtw4GF?=
 =?us-ascii?Q?Bcb4HoB9sKF89/tXg2vqcKAfETK/JUHEP8wqJ6bZt2RZYIYgXo3vZpvfWSHy?=
 =?us-ascii?Q?SzTo0ZPTKfackg0lBWEicFsJC8dTKA+aC0CjaIU7WZ3/3w1zDqaXAHz5BLYY?=
 =?us-ascii?Q?hIIwKxoAbwVN2Gvsa08Tv+ce9exNwVus/OYw23UKHYKOSEvSK/RSzHTQfkEk?=
 =?us-ascii?Q?WIpEfn2RooKMvXW91qtF3dX//ciJ9PhC+EdZofeismuJBofrM/SA2UPZ1J4L?=
 =?us-ascii?Q?7G2iqJwQWfoO12A=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 08:00:07.3188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 245ae31a-288f-47f5-5c0e-08dd3603cafb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6917

Register 0xd9 was repurposed on new systems. Change its name
to correctly reflect the new functionality.

Reviewed-by: Felix Radensky <fradensky@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlx-platform.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index 8207447aae16..bd3bb06ff8f2 100644
--- a/drivers/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/mellanox/mlx-platform.c
@@ -145,7 +145,7 @@
 #define MLXPLAT_CPLD_LPC_REG_WD3_TMR_OFFSET	0xd1
 #define MLXPLAT_CPLD_LPC_REG_WD3_TLEFT_OFFSET	0xd2
 #define MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET	0xd3
-#define MLXPLAT_CPLD_LPC_REG_DBG_CTRL_OFFSET	0xd9
+#define MLXPLAT_CPLD_LPC_REG_CPLD6_MVER_OFFSET	0xd9
 #define MLXPLAT_CPLD_LPC_REG_I2C_CH1_OFFSET	0xdb
 #define MLXPLAT_CPLD_LPC_REG_I2C_CH2_OFFSET	0xda
 #define MLXPLAT_CPLD_LPC_REG_I2C_CH3_OFFSET	0xdc
@@ -5050,7 +5050,6 @@ static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_WD3_TMR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_TLEFT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET:
-	case MLXPLAT_CPLD_LPC_REG_DBG_CTRL_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_I2C_CH1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_I2C_CH2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_I2C_CH3_OFFSET:
@@ -5186,7 +5185,7 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_WD3_TMR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_TLEFT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET:
-	case MLXPLAT_CPLD_LPC_REG_DBG_CTRL_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CPLD6_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_I2C_CH1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_I2C_CH2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_I2C_CH3_OFFSET:
@@ -5343,7 +5342,7 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_WD2_TLEFT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_TMR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_TLEFT_OFFSET:
-	case MLXPLAT_CPLD_LPC_REG_DBG_CTRL_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CPLD6_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_I2C_CH1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_I2C_CH2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_I2C_CH3_OFFSET:
-- 
2.44.0

