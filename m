Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5637F1F1300
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Feb 2025 09:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265709; cv=fail; b=rUE4Z4CTek1+DhyoG4wkhU89G3xx86fmciXoZvbbIRoVnjlUPeAkEYoK/oIi/xpFXEy4BdXGrAm5oCs4ozwy72pP5C2JQ7CHTmmS6mipge9m0uNQQtCu3B3Mp8f3WsRBI1SLbetH+y85OrKsqqN2PcDOctFykVq3H5KCBqH+Iq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265709; c=relaxed/simple;
	bh=r3+3kzO+ySTCChOP+R6WqsylagWwOoUj7za8LKbZcOs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LWHcKbTDPIyOuo8+R+e0LuapRwKR+RsfUK3XmySFrSeavUzZtSIc37EQdU+pVVl/5IWzNUOmrUDHzHMTTb2m8lZ4qAs+7tvLDP2N0UikA5WQ1ivHokqgZuD8LdDh6vgXzQDD+SH7tRmA36lHATOUmvJhXvc2AOEnFk70fzZWbEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=e5SKpAvU; arc=fail smtp.client-ip=40.107.243.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="e5SKpAvU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3AZZIs7uYE3NLjy70lIfM8sLzi4jXHM25wUxPqgJhr2FAek+BuHY8vXpF4kn0oNWZDMlPkbnatx/4aqfTZHy1V/4Z/cPxf5Euh2scLsqhjCGOzS7CaJtc4MESK+MVRvRR5yoAkzg8Kn6usBnQ44/PTuq4lx74kmg1PlCqYabIOJV1R8xEfHODFWTaO4eqcKaDjx4+TqbNr5n0cCaptL2kjE26N0bKD3kplRcuX4V0ai88B5pYALU7VsMArGmETmtmVVr9Le9XvMT//+ADAnhAYDO8Dl9zztsiaoTOb03ZUQOM6Uld7Z5RGNgrXy7cC5C5da04r8+1tTwTlHxB+iUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3itarsL1wN7Hb/BODcyzciRZcwPANwN/jL7Yjy2kwdc=;
 b=CeSaRtNVxDZD4xeagGeAGTj5rW9+NtRTtdbKNvJ+QYJUKduPAO1DSyBX0bxQ7J6BbzM11eS+qFDkGcLaxVAGogBbtbEBUtBVzGhthebuZvQwnaLQxYBSjavV8Iih3vup6xqi7jIuU3I7vthO/yo0NI9lwda94ZSmOZzlpLuvCoctJ096E7TPiM9vx6IS2F1VDCFy/DqJC7UjuA4TxBskRvvwwJYUpP67JbxWGsUXjo3aXze3iGBlrSecz6TglErFinS53IAs4UUreYFxPq9Z+WQVJhvyUUFczHvCeEAyCmYOcfq/KIvTfS6o8lcBWySyq7Y1ezUl8J4t3GE7/Jv2Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3itarsL1wN7Hb/BODcyzciRZcwPANwN/jL7Yjy2kwdc=;
 b=e5SKpAvUcXwV50hleznRIhJHHNxAinsW+LoQrkOiRiR+Qdd/f4nmM1rk/ozBfHG0CMvRIFgvPMWiw/c+ulTwPn4BMZwJzWMjPKuJ5OJVQPtUKlcJ0bs80eMGHGOpQLEvYkQT2ORaNtXrPrQ+RbIzdA12DWTfQr1ETVJZJLOSSwnqM8tuMQasYhmz9iPYVAE7c2umN8Ru2gJSjr/K69CFpJWbqSNTcNDuqdMuFLfag/Kiy7EsnrN5i3fenEmfOLb+GV2FWa7K70oJVb6IwdudQQT6YBmm1fgIzVQkJ/lUFxCnonYlztJ/ZUtKIWwUyLBxPupA3h+OrkppJeq+wzA0vA==
Received: from SN4PR0501CA0063.namprd05.prod.outlook.com
 (2603:10b6:803:41::40) by DS7PR12MB8289.namprd12.prod.outlook.com
 (2603:10b6:8:d8::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 09:21:40 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:803:41:cafe::51) by SN4PR0501CA0063.outlook.office365.com
 (2603:10b6:803:41::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.12 via Frontend Transport; Tue,
 11 Feb 2025 09:21:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 09:21:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 11 Feb
 2025 01:21:26 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Feb 2025 01:21:23 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v6 5/9] platform: mellanox: Introduce support of Nvidia smart switch
Date: Tue, 11 Feb 2025 11:19:08 +0200
Message-ID: <20250211091912.36787-6-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250211091912.36787-1-vadimp@nvidia.com>
References: <20250211091912.36787-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|DS7PR12MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: 134628da-39a7-4a73-f327-08dd4a7d7e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WStDZ2ZYODhyZlA3d2JTU1BTZCtwRUx6WFh3cFhacFJTMjdzNStTekJVbE9h?=
 =?utf-8?B?Uy83V2lCdTdoZ1dRQldtMnBPOEdiMTdjRWMrb1k2dVd1L1Y0TlprMTUxSDEx?=
 =?utf-8?B?dDlWM3V4dDZ1N0thN01aSzloMmREUzdwK0Q4Y1pwL0pRR2ZySGM3TWFIS2lp?=
 =?utf-8?B?Zkp0YTB4b3d5Q3k4cDJWdnpyV3BKanpUcE9Rbld3QVB2VGp0a2pVQjRBT3pD?=
 =?utf-8?B?VzhDbjlHZHlNL01NKzVxdVRMWm5HQjMrcWhEMW1jc0M4UGlCdVdWL3EvOUxz?=
 =?utf-8?B?bDM5R204cGRWQXNrMUVBOUpXRlA5cituT1h5NDdjRTZPekluQWVEQS9YWlpW?=
 =?utf-8?B?WlJPOEgvYnRHY0JiNVlvN2MwNDMxTzNtdUVFam9BdVd4aU9IMFdrc0x2a2FS?=
 =?utf-8?B?WFF0NzJBMm5PbGNrZjFzbE1FS0ZtN0oyUDRmcnViYWZ3M0ZqbG5sYU56d1FY?=
 =?utf-8?B?bXp5R2ZQbXBKakNZVHBYOWZCcEFMa3VTalhrSXV0M1Z0RmE0Wm8rSHBSUis1?=
 =?utf-8?B?NHEvakkyL2JFZW5TZ0szTnh3OHBucGovNHNyTFR4Zk5rc0h5dlFKbXdUaUJk?=
 =?utf-8?B?cDZtZzFEZjBIWFFvNmZkYS9FZWdTOEFnZVY3eGYyOEk5aERVWHBHbXZLS3hH?=
 =?utf-8?B?QTJUeDlLRFl0SEoxdCs3OE9ySHpxUmdRWURDOFcvZHQ1L25QVDRnSDVmUFdG?=
 =?utf-8?B?ckUwNkRYTzFxM2o0TlZyTmFFeTMrRXd1NE5scG5HaEdCckhMUlQ5dFhoWitZ?=
 =?utf-8?B?SG1KTmJrZFhwVGJwVWo1SXZUWEMwTUJKOVdqcnBiNEswYzh1UHAxQkh1WVNk?=
 =?utf-8?B?SFdvYWFHSVQ5SU5kOTgwRFF0azZZcnNkNDZIT3UxRDFTV1VhSmtyYUtXeWU1?=
 =?utf-8?B?WWRLWG9JTytCa1BzTGllbGhsSWpMcXhjdG5OMVNWSlZvUTRxaFN6VDNHeDcv?=
 =?utf-8?B?Z1hFUUw5NS8wR2dISXNZWjVpRFErNXpJZTBUUHVYRHZtQy9vVzVrblhmV2FM?=
 =?utf-8?B?NnFLZC90c04rKzBLQUJNdnFwMmFQQndXSlMvbk9UZlJZWUFJMTRVMHdrSGR1?=
 =?utf-8?B?UlhnRW1zMWh0cEI4Y3o4YmVTUmVGUzNvdTZ5aUE2S1lsVVpOaW1OWFp2M2Mx?=
 =?utf-8?B?M2JRbmRMRWNxMXN1dkZDbmlaa3ZBMmpxazFkRXg5emNxYTc3ZXJidHdPYlNZ?=
 =?utf-8?B?UDRqL2Y4Q0VKUVFYRVdVUEJTcFpOOE42MUFFM053WkpHd1Y0bFlZUUQ2L2Vw?=
 =?utf-8?B?WEpXQnR1T3ZXenlBSEFkWUdSazJZNU9uK1pUTU9nVWx2Yk9Ga2VjVk96SDZm?=
 =?utf-8?B?SVFlRFNJZnZUeGM2dHR1cXpOTWRGeHVwZTE5Q0lDNXNwQ2lvUjR1cnk3TXk2?=
 =?utf-8?B?UFhTczdRK25HakE1YUlORjJYcFZ1aTlkLzZ4Z3QxZ3pYZTEwQ1lpblJEaVlE?=
 =?utf-8?B?WWFqRXFhRW9hUlZWMWF6dVMyMjJRRDJiWlNUSEgxSXVrdXNOOWwwR2JxaG4r?=
 =?utf-8?B?UWZOZzN5Yis0ZzB4Z3ZUaVplcStBMlJEWHA0clZ6YUpFSnZzWWZ2bThwYmg0?=
 =?utf-8?B?UkFsV0FlRmo0aHJHTndmb1J1Z3Y4VnQ5Q1NpdzJTbWdURENlN1A3eE9aR3hL?=
 =?utf-8?B?TGxndWVzUDVvM1lqU0M3a3hta1RGcURvWEF1THF2U3BRNHpCMU5DQm4vdzEr?=
 =?utf-8?B?NmpYR1VITzlYNmFGeDBlUVBRR0M3NDdDbmJYTmxCbm5kZEZ1dnJrVWRSRVR1?=
 =?utf-8?B?SllLb2lleUtyNTdNZkJIWlk0TDhqOU5DZndLeW1wVE51UThiM1A0M0NadTl5?=
 =?utf-8?B?QWFteVNvSEtabUtqSXB6eFFSenlEakdPVzNLalhYMmlaK2VIeUplU2w1dE9Q?=
 =?utf-8?B?cThjMjI3aHlnOGxQRi9HVkM1b2pmRGRtL3hsV3dyRm5RYzNsNzBmTXcvMlk4?=
 =?utf-8?B?VDNYSmpOd0J6ZkVldlJCMHFPcDN4dUxGK1NkMWZwUEkwL1plVklGU0NQemt4?=
 =?utf-8?Q?ZN+behSq9cgb+rQe9msTt+sqvfhsSc=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 09:21:40.3249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 134628da-39a7-4a73-f327-08dd4a7d7e2b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8289

Provide platform support for Nvidia Smart Switch SN4280.

The Smart Switch equipped with:
- Nvidia COME module based on AMD EPYC™ Embedded 3451 CPU.
- Nvidia Spectrum-3 ASIC.
- Four DPUs, each equipped with Nvidia BF3 ARM based processor and
  with Lattice LFD2NX-40 FPGA device.
- 28xQSFP-DD external ports.
- Two power supplies.
- Four cooling drawers.

Reviewed-by: Ciju Rajan K <crajank@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v5->v6
Comments pointed out by Ilpo:
- Add missing coma in structure 'mlxplat_mlxcpld_xdr_led_data'.
- Merge lines in structure 'mlxplat_mlxcpld_regmap_smart_switch'.
- s/int/unsigned int/ in 'mlxplat_dmi_smart_switch_matched'.

v4->v5
Comments pointed out by Ilpo:
- Add blank lines in mlxplat_dmi_smart_switch_matched().
- Style fixes: remove empty space after the condition fix while() loop.
---
 drivers/platform/mellanox/mlx-platform.c | 1966 +++++++++++++++++++---
 1 file changed, 1712 insertions(+), 254 deletions(-)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index cc19349d301b..5fb6320ad0ef 100644
--- a/drivers/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/mellanox/mlx-platform.c
@@ -38,6 +38,7 @@
 #define MLXPLAT_CPLD_LPC_REG_CPLD4_PN1_OFFSET	0x0b
 #define MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET	0x17
 #define MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET	0x19
+#define MLXPLAT_CPLD_LPC_REG_RESET_GP3_OFFSET	0x1b
 #define MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET	0x1c
 #define MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET	0x1d
 #define MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET	0x1e
@@ -49,9 +50,11 @@
 #define MLXPLAT_CPLD_LPC_REG_LED5_OFFSET	0x24
 #define MLXPLAT_CPLD_LPC_REG_LED6_OFFSET	0x25
 #define MLXPLAT_CPLD_LPC_REG_LED7_OFFSET	0x26
+#define MLXPLAT_CPLD_LPC_REG_LED8_OFFSET	0x27
 #define MLXPLAT_CPLD_LPC_REG_FAN_DIRECTION	0x2a
 #define MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET	0x2b
 #define MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET	0x2d
+#define MLXPLAT_CPLD_LPC_REG_GP1_RO_OFFSET	0x2c
 #define MLXPLAT_CPLD_LPC_REG_GP0_OFFSET		0x2e
 #define MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET	0x2f
 #define MLXPLAT_CPLD_LPC_REG_GP1_OFFSET		0x30
@@ -71,12 +74,14 @@
 #define MLXPLAT_CPLD_LPC_REG_AGGRCO_MASK_OFFSET	0x43
 #define MLXPLAT_CPLD_LPC_REG_AGGRCX_OFFSET	0x44
 #define MLXPLAT_CPLD_LPC_REG_AGGRCX_MASK_OFFSET 0x45
+#define MLXPLAT_CPLD_LPC_REG_GP3_OFFSET		0x46
 #define MLXPLAT_CPLD_LPC_REG_BRD_OFFSET		0x47
 #define MLXPLAT_CPLD_LPC_REG_BRD_EVENT_OFFSET	0x48
 #define MLXPLAT_CPLD_LPC_REG_BRD_MASK_OFFSET	0x49
 #define MLXPLAT_CPLD_LPC_REG_GWP_OFFSET		0x4a
 #define MLXPLAT_CPLD_LPC_REG_GWP_EVENT_OFFSET	0x4b
 #define MLXPLAT_CPLD_LPC_REG_GWP_MASK_OFFSET	0x4c
+#define MLXPLAT_CPLD_LPC_REG_GPI_MASK_OFFSET	0x4e
 #define MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET 0x50
 #define MLXPLAT_CPLD_LPC_REG_ASIC_EVENT_OFFSET	0x51
 #define MLXPLAT_CPLD_LPC_REG_ASIC_MASK_OFFSET	0x52
@@ -88,15 +93,20 @@
 #define MLXPLAT_CPLD_LPC_REG_PSU_OFFSET		0x58
 #define MLXPLAT_CPLD_LPC_REG_PSU_EVENT_OFFSET	0x59
 #define MLXPLAT_CPLD_LPC_REG_PSU_MASK_OFFSET	0x5a
+#define MLXPLAT_CPLD_LPC_REG_PSU_AC_OFFSET	0x5e
 #define MLXPLAT_CPLD_LPC_REG_PWR_OFFSET		0x64
 #define MLXPLAT_CPLD_LPC_REG_PWR_EVENT_OFFSET	0x65
 #define MLXPLAT_CPLD_LPC_REG_PWR_MASK_OFFSET	0x66
+#define MLXPLAT_CPLD_LPC_REG_PSU_ALERT_OFFSET	0x6a
 #define MLXPLAT_CPLD_LPC_REG_LC_IN_OFFSET	0x70
 #define MLXPLAT_CPLD_LPC_REG_LC_IN_EVENT_OFFSET	0x71
 #define MLXPLAT_CPLD_LPC_REG_LC_IN_MASK_OFFSET	0x72
 #define MLXPLAT_CPLD_LPC_REG_FAN_OFFSET		0x88
 #define MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET	0x89
 #define MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET	0x8a
+#define MLXPLAT_CPLD_LPC_REG_FAN2_OFFSET	0x8b
+#define MLXPLAT_CPLD_LPC_REG_FAN2_EVENT_OFFSET	0x8c
+#define MLXPLAT_CPLD_LPC_REG_FAN2_MASK_OFFSET	0x8d
 #define MLXPLAT_CPLD_LPC_REG_CPLD5_VER_OFFSET	0x8e
 #define MLXPLAT_CPLD_LPC_REG_CPLD5_PN_OFFSET	0x8f
 #define MLXPLAT_CPLD_LPC_REG_CPLD5_PN1_OFFSET	0x90
@@ -128,10 +138,15 @@
 #define MLXPLAT_CPLD_LPC_REG_LC_SD_EVENT_OFFSET	0xaa
 #define MLXPLAT_CPLD_LPC_REG_LC_SD_MASK_OFFSET	0xab
 #define MLXPLAT_CPLD_LPC_REG_LC_PWR_ON		0xb2
+#define MLXPLAT_CPLD_LPC_REG_TACHO19_OFFSET	0xb4
+#define MLXPLAT_CPLD_LPC_REG_TACHO20_OFFSET	0xb5
 #define MLXPLAT_CPLD_LPC_REG_DBG1_OFFSET	0xb6
 #define MLXPLAT_CPLD_LPC_REG_DBG2_OFFSET	0xb7
 #define MLXPLAT_CPLD_LPC_REG_DBG3_OFFSET	0xb8
 #define MLXPLAT_CPLD_LPC_REG_DBG4_OFFSET	0xb9
+#define MLXPLAT_CPLD_LPC_REG_TACHO17_OFFSET	0xba
+#define MLXPLAT_CPLD_LPC_REG_TACHO18_OFFSET	0xbb
+#define MLXPLAT_CPLD_LPC_REG_ASIC_CAP_OFFSET	0xc1
 #define MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET	0xc2
 #define MLXPLAT_CPLD_LPC_REG_SPI_CHNL_SELECT	0xc3
 #define MLXPLAT_CPLD_LPC_REG_CPLD5_MVER_OFFSET	0xc4
@@ -182,6 +197,9 @@
 #define MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET	0xfb
 #define MLXPLAT_CPLD_LPC_REG_CONFIG2_OFFSET	0xfc
 #define MLXPLAT_CPLD_LPC_REG_CONFIG3_OFFSET	0xfd
+#define MLXPLAT_CPLD_LPC_REG_TACHO15_OFFSET	0xfe
+#define MLXPLAT_CPLD_LPC_REG_TACHO16_OFFSET	0xff
+
 #define MLXPLAT_CPLD_LPC_IO_RANGE		0x100
 
 #define MLXPLAT_CPLD_LPC_PIO_OFFSET		0x10000UL
@@ -210,9 +228,15 @@
 #define MLXPLAT_CPLD_AGGR_MASK_NG_DEF	0x04
 #define MLXPLAT_CPLD_AGGR_MASK_COMEX	BIT(0)
 #define MLXPLAT_CPLD_AGGR_MASK_LC	BIT(3)
+#define MLXPLAT_CPLD_AGGR_MASK_DPU_BRD	BIT(4)
+#define MLXPLAT_CPLD_AGGR_MASK_DPU_CORE	BIT(5)
 #define MLXPLAT_CPLD_AGGR_MASK_MODULAR	(MLXPLAT_CPLD_AGGR_MASK_NG_DEF | \
 					 MLXPLAT_CPLD_AGGR_MASK_COMEX | \
 					 MLXPLAT_CPLD_AGGR_MASK_LC)
+#define MLXPLAT_CPLD_AGGR_MASK_SMART_SW	(MLXPLAT_CPLD_AGGR_MASK_COMEX | \
+					 MLXPLAT_CPLD_AGGR_MASK_NG_DEF | \
+					 MLXPLAT_CPLD_AGGR_MASK_DPU_BRD | \
+					 MLXPLAT_CPLD_AGGR_MASK_DPU_CORE)
 #define MLXPLAT_CPLD_AGGR_MASK_LC_PRSNT	BIT(0)
 #define MLXPLAT_CPLD_AGGR_MASK_LC_RDY	BIT(1)
 #define MLXPLAT_CPLD_AGGR_MASK_LC_PG	BIT(2)
@@ -235,15 +259,24 @@
 #define MLXPLAT_CPLD_PWR_MASK		GENMASK(1, 0)
 #define MLXPLAT_CPLD_PSU_EXT_MASK	GENMASK(3, 0)
 #define MLXPLAT_CPLD_PWR_EXT_MASK	GENMASK(3, 0)
+#define MLXPLAT_CPLD_PSU_XDR_MASK	GENMASK(7, 0)
+#define MLXPLAT_CPLD_PWR_XDR_MASK	GENMASK(7, 0)
 #define MLXPLAT_CPLD_FAN_MASK		GENMASK(3, 0)
 #define MLXPLAT_CPLD_ASIC_MASK		GENMASK(1, 0)
+#define MLXPLAT_CPLD_ASIC_XDR_MASK	GENMASK(3, 0)
 #define MLXPLAT_CPLD_FAN_NG_MASK	GENMASK(6, 0)
+#define MLXPLAT_CPLD_FAN_XDR_MASK	GENMASK(7, 0)
 #define MLXPLAT_CPLD_LED_LO_NIBBLE_MASK	GENMASK(7, 4)
 #define MLXPLAT_CPLD_LED_HI_NIBBLE_MASK	GENMASK(3, 0)
 #define MLXPLAT_CPLD_VOLTREG_UPD_MASK	GENMASK(5, 4)
 #define MLXPLAT_CPLD_GWP_MASK		GENMASK(0, 0)
 #define MLXPLAT_CPLD_EROT_MASK		GENMASK(1, 0)
 #define MLXPLAT_CPLD_FU_CAP_MASK	GENMASK(1, 0)
+#define MLXPLAT_CPLD_PSU_CAP_MASK	GENMASK(7, 0)
+#define MLXPLAT_CPLD_FAN_CAP_MASK	GENMASK(7, 0)
+#define MLXPLAT_CPLD_ASIC_CAP_MASK	GENMASK(7, 0)
+#define MLXPLAT_CPLD_BIOS_STATUS_MASK	GENMASK(3, 1)
+#define MLXPLAT_CPLD_DPU_MASK		GENMASK(3, 0)
 #define MLXPLAT_CPLD_PWR_BUTTON_MASK	BIT(0)
 #define MLXPLAT_CPLD_LATCH_RST_MASK	BIT(6)
 #define MLXPLAT_CPLD_THERMAL1_PDB_MASK	BIT(3)
@@ -267,6 +300,9 @@
 /* Masks for aggregation for modular systems */
 #define MLXPLAT_CPLD_LPC_LC_MASK	GENMASK(7, 0)
 
+/* Masks for aggregation for smart switch systems */
+#define MLXPLAT_CPLD_LPC_SM_SW_MASK	GENMASK(7, 0)
+
 #define MLXPLAT_CPLD_HALT_MASK		BIT(3)
 #define MLXPLAT_CPLD_RESET_MASK		GENMASK(7, 1)
 
@@ -297,15 +333,18 @@
 #define MLXPLAT_CPLD_NR_NONE			-1
 #define MLXPLAT_CPLD_PSU_DEFAULT_NR		10
 #define MLXPLAT_CPLD_PSU_MSNXXXX_NR		4
+#define MLXPLAT_CPLD_PSU_XDR_NR			3
 #define MLXPLAT_CPLD_FAN1_DEFAULT_NR		11
 #define MLXPLAT_CPLD_FAN2_DEFAULT_NR		12
 #define MLXPLAT_CPLD_FAN3_DEFAULT_NR		13
 #define MLXPLAT_CPLD_FAN4_DEFAULT_NR		14
 #define MLXPLAT_CPLD_NR_ASIC			3
 #define MLXPLAT_CPLD_NR_LC_BASE			34
+#define MLXPLAT_CPLD_NR_DPU_BASE		18
 
 #define MLXPLAT_CPLD_NR_LC_SET(nr)	(MLXPLAT_CPLD_NR_LC_BASE + (nr))
 #define MLXPLAT_CPLD_LC_ADDR		0x32
+#define MLXPLAT_CPLD_DPU_ADDR		0x68
 
 /* Masks and default values for watchdogs */
 #define MLXPLAT_CPLD_WD1_CLEAR_MASK	GENMASK(7, 1)
@@ -320,6 +359,7 @@
 #define MLXPLAT_CPLD_WD_DFLT_TIMEOUT	30
 #define MLXPLAT_CPLD_WD3_DFLT_TIMEOUT	600
 #define MLXPLAT_CPLD_WD_MAX_DEVS	2
+#define MLXPLAT_CPLD_DPU_MAX_DEVS	4
 
 #define MLXPLAT_CPLD_LPC_SYSIRQ		17
 
@@ -346,6 +386,7 @@
  * @pdev_io_regs - register access platform devices
  * @pdev_fan - FAN platform devices
  * @pdev_wd - array of watchdog platform devices
+ * pdev_dpu - array of Data Processor Unit platform devices
  * @regmap: device register map
  * @hotplug_resources: system hotplug resources
  * @hotplug_resources_size: size of system hotplug resources
@@ -360,6 +401,7 @@
 	struct platform_device *pdev_io_regs;
 	struct platform_device *pdev_fan;
 	struct platform_device *pdev_wd[MLXPLAT_CPLD_WD_MAX_DEVS];
+	struct platform_device *pdev_dpu[MLXPLAT_CPLD_DPU_MAX_DEVS];
 	void *regmap;
 	struct resource *hotplug_resources;
 	unsigned int hotplug_resources_size;
@@ -626,6 +668,21 @@
 	},
 };
 
+static struct i2c_board_info mlxplat_mlxcpld_xdr_pwr[] = {
+	{
+		I2C_BOARD_INFO("dps460", 0x5d),
+	},
+	{
+		I2C_BOARD_INFO("dps460", 0x5c),
+	},
+	{
+		I2C_BOARD_INFO("dps460", 0x5e),
+	},
+	{
+		I2C_BOARD_INFO("dps460", 0x5f),
+	},
+};
+
 static struct i2c_board_info mlxplat_mlxcpld_fan[] = {
 	{
 		I2C_BOARD_INFO("24c32", 0x50),
@@ -2370,6 +2427,466 @@
 	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
 };
 
+/* Platform hotplug XDR and smart switch system family data */
+static struct mlxreg_core_data mlxplat_mlxcpld_xdr_psu_items_data[] = {
+	{
+		.label = "psu1",
+		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
+		.mask = BIT(0),
+		.slot = 1,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_PSU_CAP_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "psu2",
+		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
+		.mask = BIT(1),
+		.slot = 2,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_PSU_CAP_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "psu3",
+		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
+		.mask = BIT(2),
+		.slot = 3,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_PSU_CAP_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "psu4",
+		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
+		.mask = BIT(3),
+		.slot = 4,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_PSU_CAP_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "psu5",
+		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
+		.mask = BIT(4),
+		.slot = 5,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_PSU_CAP_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "psu6",
+		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
+		.mask = BIT(5),
+		.slot = 6,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_PSU_CAP_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "psu7",
+		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
+		.mask = BIT(6),
+		.slot = 7,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_PSU_CAP_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "psu8",
+		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
+		.mask = BIT(7),
+		.slot = 8,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_PSU_CAP_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+};
+
+static struct mlxreg_core_data mlxplat_mlxcpld_xdr_pwr_items_data[] = {
+	{
+		.label = "pwr1",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = BIT(0),
+		.slot = 1,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_PSU_CAP_MASK,
+		.hpdev.brdinfo = &mlxplat_mlxcpld_pwr[0],
+		.hpdev.nr = MLXPLAT_CPLD_PSU_MSNXXXX_NR,
+	},
+	{
+		.label = "pwr2",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = BIT(1),
+		.slot = 2,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_PSU_CAP_MASK,
+		.hpdev.brdinfo = &mlxplat_mlxcpld_pwr[1],
+		.hpdev.nr = MLXPLAT_CPLD_PSU_MSNXXXX_NR,
+	},
+	{
+		.label = "pwr3",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = BIT(2),
+		.slot = 3,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_PSU_CAP_MASK,
+		.hpdev.brdinfo = &mlxplat_mlxcpld_ext_pwr[0],
+		.hpdev.nr = MLXPLAT_CPLD_PSU_MSNXXXX_NR,
+	},
+	{
+		.label = "pwr4",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = BIT(3),
+		.slot = 4,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_PSU_CAP_MASK,
+		.hpdev.brdinfo = &mlxplat_mlxcpld_ext_pwr[1],
+		.hpdev.nr = MLXPLAT_CPLD_PSU_MSNXXXX_NR,
+	},
+	{
+		.label = "pwr5",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = BIT(4),
+		.slot = 5,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_PSU_CAP_MASK,
+		.hpdev.brdinfo = &mlxplat_mlxcpld_xdr_pwr[0],
+		.hpdev.nr = MLXPLAT_CPLD_PSU_XDR_NR,
+	},
+	{
+		.label = "pwr6",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = BIT(5),
+		.slot = 6,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_PSU_CAP_MASK,
+		.hpdev.brdinfo = &mlxplat_mlxcpld_xdr_pwr[1],
+		.hpdev.nr = MLXPLAT_CPLD_PSU_XDR_NR,
+	},
+	{
+		.label = "pwr7",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = BIT(6),
+		.slot = 7,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_PSU_CAP_MASK,
+		.hpdev.brdinfo = &mlxplat_mlxcpld_xdr_pwr[2],
+		.hpdev.nr = MLXPLAT_CPLD_PSU_XDR_NR,
+	},
+	{
+		.label = "pwr8",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = BIT(7),
+		.slot = 8,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_PSU_CAP_MASK,
+		.hpdev.brdinfo = &mlxplat_mlxcpld_xdr_pwr[3],
+		.hpdev.nr = MLXPLAT_CPLD_PSU_XDR_NR,
+	},
+};
+
+static struct mlxreg_core_data mlxplat_mlxcpld_xdr_fan_items_data[] = {
+	{
+		.label = "fan1",
+		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+		.mask = BIT(0),
+		.slot = 1,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_FAN_XDR_MASK,
+		.bit = BIT(0),
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "fan2",
+		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+		.mask = BIT(1),
+		.slot = 2,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_FAN_XDR_MASK,
+		.bit = BIT(1),
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "fan3",
+		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+		.mask = BIT(2),
+		.slot = 3,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_FAN_XDR_MASK,
+		.bit = BIT(2),
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "fan4",
+		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+		.mask = BIT(3),
+		.slot = 4,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_FAN_XDR_MASK,
+		.bit = BIT(3),
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "fan5",
+		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+		.mask = BIT(4),
+		.slot = 5,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_FAN_XDR_MASK,
+		.bit = BIT(4),
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "fan6",
+		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+		.mask = BIT(5),
+		.slot = 6,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_FAN_XDR_MASK,
+		.bit = BIT(5),
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "fan7",
+		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+		.mask = BIT(6),
+		.slot = 7,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_FAN_XDR_MASK,
+		.bit = BIT(6),
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "fan8",
+		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+		.mask = BIT(7),
+		.slot = 8,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_FAN_XDR_MASK,
+		.bit = BIT(7),
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+};
+
+static struct mlxreg_core_data mlxplat_mlxcpld_xdr_asic1_items_data[] = {
+	{
+		.label = "asic1",
+		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
+		.mask = MLXPLAT_CPLD_ASIC_MASK,
+		.slot = 1,
+		.capability = MLXPLAT_CPLD_LPC_REG_ASIC_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_ASIC_CAP_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	}
+};
+
+/* Platform hotplug for smart switch systems families data */
+static struct mlxreg_core_data mlxplat_mlxcpld_smart_switch_dpu_ready_data[] = {
+	{
+		.label = "dpu1_ready",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET,
+		.mask = BIT(0),
+		.slot = 1,
+		.capability = MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_DPU_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "dpu2_ready",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET,
+		.mask = BIT(1),
+		.slot = 2,
+		.capability = MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_DPU_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "dpu3_ready",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET,
+		.mask = BIT(2),
+		.slot = 3,
+		.capability = MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_DPU_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "dpu4_ready",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET,
+		.mask = BIT(3),
+		.slot = 4,
+		.capability = MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_DPU_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+};
+
+static struct mlxreg_core_data mlxplat_mlxcpld_smart_switch_dpu_shtdn_ready_data[] = {
+	{
+		.label = "dpu1_shtdn_ready",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET,
+		.mask = BIT(0),
+		.slot = 1,
+		.capability = MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_DPU_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "dpu2_shtdn_ready",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET,
+		.mask = BIT(1),
+		.slot = 2,
+		.capability = MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_DPU_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "dpu3_shtdn_ready",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET,
+		.mask = BIT(2),
+		.slot = 3,
+		.capability = MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_DPU_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "dpu4_shtdn_ready",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET,
+		.mask = BIT(3),
+		.slot = 4,
+		.capability = MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_DPU_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+};
+
+static struct mlxreg_core_item mlxplat_mlxcpld_smart_switch_items[] = {
+	{
+		.data = mlxplat_mlxcpld_xdr_psu_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
+		.mask = MLXPLAT_CPLD_PSU_XDR_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_PSU_CAP_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_xdr_psu_items_data),
+		.inversed = 1,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_xdr_pwr_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = MLXPLAT_CPLD_PWR_XDR_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_PSU_CAP_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_xdr_pwr_items_data),
+		.inversed = 0,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_xdr_fan_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+		.mask = MLXPLAT_CPLD_FAN_XDR_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_FAN_CAP_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_xdr_fan_items_data),
+		.inversed = 1,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_xdr_asic1_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
+		.mask = MLXPLAT_CPLD_ASIC_XDR_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_ASIC_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_ASIC_CAP_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_xdr_asic1_items_data),
+		.inversed = 0,
+		.health = true,
+	},
+	{
+		.data = mlxplat_mlxcpld_smart_switch_dpu_ready_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_DPU_CORE,
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET,
+		.mask = MLXPLAT_CPLD_DPU_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_DPU_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_smart_switch_dpu_ready_data),
+		.inversed = 1,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_smart_switch_dpu_shtdn_ready_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_DPU_CORE,
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET,
+		.mask = MLXPLAT_CPLD_DPU_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_DPU_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_smart_switch_dpu_shtdn_ready_data),
+		.inversed = 1,
+		.health = false,
+	},
+};
+
+static
+struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_smart_switch_data = {
+	.items = mlxplat_mlxcpld_smart_switch_items,
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_smart_switch_items),
+	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
+	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX |
+		MLXPLAT_CPLD_AGGR_MASK_DPU_BRD | MLXPLAT_CPLD_AGGR_MASK_DPU_CORE,
+	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
+	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
+};
+
+/* Smart switch data  processor units data */
+static struct i2c_board_info mlxplat_mlxcpld_smart_switch_dpu_devs[] = {
+	{
+		I2C_BOARD_INFO("mlxreg-dpu", MLXPLAT_CPLD_DPU_ADDR),
+		.irq = MLXPLAT_CPLD_LPC_SYSIRQ,
+	},
+	{
+		I2C_BOARD_INFO("mlxreg-dpu", MLXPLAT_CPLD_DPU_ADDR),
+		.irq = MLXPLAT_CPLD_LPC_SYSIRQ,
+	},
+	{
+		I2C_BOARD_INFO("mlxreg-dpu", MLXPLAT_CPLD_DPU_ADDR),
+		.irq = MLXPLAT_CPLD_LPC_SYSIRQ,
+	},
+	{
+		I2C_BOARD_INFO("mlxreg-dpu", MLXPLAT_CPLD_DPU_ADDR),
+		.irq = MLXPLAT_CPLD_LPC_SYSIRQ,
+	},
+};
+
+static struct mlxreg_core_data mlxplat_mlxcpld_smart_switch_dpu_data[] = {
+	{
+		.label = "dpu1",
+		.hpdev.brdinfo = &mlxplat_mlxcpld_smart_switch_dpu_devs[0],
+		.hpdev.nr = MLXPLAT_CPLD_NR_DPU_BASE,
+		.slot = 1,
+	},
+	{
+		.label = "dpu2",
+		.hpdev.brdinfo = &mlxplat_mlxcpld_smart_switch_dpu_devs[1],
+		.hpdev.nr = MLXPLAT_CPLD_NR_DPU_BASE + 1,
+		.slot = 2,
+	},
+	{
+		.label = "dpu3",
+		.hpdev.brdinfo = &mlxplat_mlxcpld_smart_switch_dpu_devs[2],
+		.hpdev.nr = MLXPLAT_CPLD_NR_DPU_BASE + 2,
+		.slot = 3,
+	},
+	{
+		.label = "dpu4",
+		.hpdev.brdinfo = &mlxplat_mlxcpld_smart_switch_dpu_devs[2],
+		.hpdev.nr = MLXPLAT_CPLD_NR_DPU_BASE + 3,
+		.slot = 4,
+	},
+};
+
 /* Callback performs graceful shutdown after notification about power button event */
 static int
 mlxplat_mlxcpld_l1_switch_pwr_events_handler(void *handle, enum mlxreg_hotplug_kind kind,
@@ -3162,6 +3679,180 @@
 		.counter = ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_led_data),
 };
 
+/* Platform led data for XDR and smart switch systems */
+static struct mlxreg_core_data mlxplat_mlxcpld_xdr_led_data[] = {
+	{
+		.label = "status:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "status:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "psu:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+	},
+	{
+		.label = "psu:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+	},
+	{
+		.label = "fan1:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 1,
+	},
+	{
+		.label = "fan1:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 1,
+	},
+	{
+		.label = "fan2:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 2,
+	},
+	{
+		.label = "fan2:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 2,
+	},
+	{
+		.label = "fan3:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 3,
+	},
+	{
+		.label = "fan3:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 3,
+	},
+	{
+		.label = "fan4:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 4,
+	},
+	{
+		.label = "fan4:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 4,
+	},
+	{
+		.label = "fan5:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 5,
+	},
+	{
+		.label = "fan5:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 5,
+	},
+	{
+		.label = "fan6:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 6,
+	},
+	{
+		.label = "fan6:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 6,
+	},
+	{
+		.label = "fan7:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED6_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 7,
+	},
+	{
+		.label = "fan7:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED6_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 7,
+	},
+	{
+		.label = "fan8:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED7_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 8,
+	},
+	{
+		.label = "fan8:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED7_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 8,
+	},
+	{
+		.label = "fan9:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED7_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 9,
+	},
+	{
+		.label = "fan9:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED7_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 9,
+	},
+	{
+		.label = "fan10:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED8_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 10,
+	},
+	{
+		.label = "fan10:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED8_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 10,
+	},
+	{
+		.label = "uid:blue",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED5_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+	},
+};
+
+static struct mlxreg_core_platform_data mlxplat_xdr_led_data = {
+		.data = mlxplat_mlxcpld_xdr_led_data,
+		.counter = ARRAY_SIZE(mlxplat_mlxcpld_xdr_led_data),
+};
+
 /* Platform register access default */
 static struct mlxreg_core_data mlxplat_mlxcpld_default_regs_io_data[] = {
 	{
@@ -4610,6 +5301,480 @@
 		.counter = ARRAY_SIZE(mlxplat_mlxcpld_chassis_blade_regs_io_data),
 };
 
+/* Platform register access for smart switch systems families data */
+static struct mlxreg_core_data mlxplat_mlxcpld_smart_switch_regs_io_data[] = {
+	{
+		.label = "cpld1_version",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD1_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld2_version",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD2_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld3_version",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD3_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld1_pn",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD1_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld2_pn",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD2_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld3_pn",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD3_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld1_version_min",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD1_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld2_version_min",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD2_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld3_version_min",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD3_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "kexec_activated",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0644,
+	},
+	{
+		.label = "asic_reset",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0644,
+	},
+	{
+		.label = "eth_switch_reset",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0644,
+	},
+	{
+		.label = "dpu1_rst",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP3_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0200,
+	},
+	{
+		.label = "dpu2_rst",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP3_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0200,
+	},
+	{
+		.label = "dpu3_rst",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP3_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0200,
+	},
+	{
+		.label = "dpu4_rst",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP3_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0200,
+	},
+	{
+		.label = "dpu1_pwr",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0200,
+	},
+	{
+		.label = "dpu2_pwr",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0200,
+	},
+	{
+		.label = "dpu3_pwr",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0200,
+	},
+	{
+		.label = "dpu4_pwr",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0200,
+	},
+	{
+		.label = "reset_long_pb",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_short_pb",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_aux_pwr_or_ref",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_swb_dc_dc_pwr_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_swb_wd",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_asic_thermal",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_sw_reset",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_aux_pwr_or_reload",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_comex_pwr_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_platform",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_soc",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_pwr",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_pwr_converter_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_system",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_sw_pwr_off",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_comex_thermal",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_ac_pwr_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "voltreg_update_status",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET,
+		.mask = MLXPLAT_CPLD_VOLTREG_UPD_MASK,
+		.bit = 5,
+		.mode = 0444,
+	},
+	{
+		.label = "port80",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP1_RO_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "bios_status",
+		.reg = MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
+		.mask = MLXPLAT_CPLD_BIOS_STATUS_MASK,
+		.bit = 2,
+		.mode = 0444,
+	},
+	{
+		.label = "bios_start_retry",
+		.reg = MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0444,
+	},
+	{
+		.label = "bios_active_image",
+		.reg = MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "vpd_wp",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0644,
+	},
+	{
+		.label = "pcie_asic_reset_dis",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0644,
+	},
+	{
+		.label = "shutdown_unlock",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0644,
+	},
+	{
+		.label = "fan_dir",
+		.reg = MLXPLAT_CPLD_LPC_REG_FAN_DIRECTION,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "dpu1_rst_en",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0200,
+	},
+	{
+		.label = "dpu2_rst_en",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0200,
+	},
+	{
+		.label = "dpu3_rst_en",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0200,
+	},
+	{
+		.label = "dpu4_rst_en",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0200,
+	},
+	{
+		.label = "psu1_on",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0200,
+	},
+	{
+		.label = "psu2_on",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0200,
+	},
+	{
+		.label = "pwr_cycle",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0200,
+	},
+	{
+		.label = "pwr_down",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0200,
+	},
+	{
+		.label = "jtag_cap",
+		.reg = MLXPLAT_CPLD_LPC_REG_FU_CAP_OFFSET,
+		.mask = MLXPLAT_CPLD_FU_CAP_MASK,
+		.bit = 1,
+		.mode = 0444,
+	},
+	{
+		.label = "jtag_enable",
+		.reg = MLXPLAT_CPLD_LPC_REG_FIELD_UPGRADE,
+		.mask = GENMASK(1, 0),
+		.bit = 1,
+		.mode = 0644,
+	},
+	{
+		.label = "non_active_bios_select",
+		.reg = MLXPLAT_CPLD_LPC_SAFE_BIOS_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0644,
+	},
+	{
+	    .label = "bios_upgrade_fail",
+		.reg = MLXPLAT_CPLD_LPC_SAFE_BIOS_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "bios_image_invert",
+		.reg = MLXPLAT_CPLD_LPC_SAFE_BIOS_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0644,
+	},
+	{
+		.label = "me_reboot",
+		.reg = MLXPLAT_CPLD_LPC_SAFE_BIOS_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0644,
+	},
+	{
+		.label = "dpu1_pwr_force",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP3_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0200,
+	},
+	{
+		.label = "dpu2_pwr_force",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP3_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0200,
+	},
+	{
+		.label = "dpu3_pwr_force",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP3_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0200,
+	},
+	{
+		.label = "dpu4_pwr_force",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP3_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0200,
+	},
+	{
+		.label = "ufm_done",
+		.reg = MLXPLAT_CPLD_LPC_REG_GPI_MASK_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "asic_health",
+		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
+		.mask = MLXPLAT_CPLD_ASIC_MASK,
+		.bit = 1,
+		.mode = 0444,
+	},
+	{
+		.label = "psu1_ac_ok",
+		.reg = MLXPLAT_CPLD_LPC_REG_PSU_AC_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0644,
+	},
+	{
+		.label = "psu2_ac_ok",
+		.reg = MLXPLAT_CPLD_LPC_REG_PSU_AC_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0644,
+	},
+	{
+		.label = "psu1_no_alert",
+		.reg = MLXPLAT_CPLD_LPC_REG_PSU_ALERT_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0644,
+	},
+	{
+		.label = "psu2_no_alert",
+		.reg = MLXPLAT_CPLD_LPC_REG_PSU_ALERT_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0644,
+	},
+	{
+		.label = "asic_pg_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
+	{
+		.label = "spi_chnl_select",
+		.reg = MLXPLAT_CPLD_LPC_REG_SPI_CHNL_SELECT,
+		.mask = GENMASK(7, 0),
+		.bit = 1,
+		.mode = 0644,
+	},
+	{
+		.label = "config1",
+		.reg = MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "config2",
+		.reg = MLXPLAT_CPLD_LPC_REG_CONFIG2_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "config3",
+		.reg = MLXPLAT_CPLD_LPC_REG_CONFIG3_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "ufm_version",
+		.reg = MLXPLAT_CPLD_LPC_REG_UFM_VERSION_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+};
+
+static struct mlxreg_core_platform_data mlxplat_smart_switch_regs_io_data = {
+		.data = mlxplat_mlxcpld_smart_switch_regs_io_data,
+		.counter = ARRAY_SIZE(mlxplat_mlxcpld_smart_switch_regs_io_data),
+};
+
 /* Platform FAN default */
 static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_data[] = {
 	{
@@ -4751,6 +5916,185 @@
 		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
 };
 
+/* XDR and smart switch platform fan data */
+static struct mlxreg_core_data mlxplat_mlxcpld_xdr_fan_data[] = {
+	{
+		.label = "pwm1",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWM1_OFFSET,
+	},
+	{
+		.label = "tacho1",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO1_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
+		.slot = 1,
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho2",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO2_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
+		.slot = 2,
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho3",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO3_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
+		.slot = 3,
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho4",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO4_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
+		.slot = 4,
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho5",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO5_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
+		.slot = 5,
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho6",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO6_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
+		.slot = 6,
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho7",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO7_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
+		.slot = 7,
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho8",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO8_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
+		.slot = 8,
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho9",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO9_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
+		.slot = 9,
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho10",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO10_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
+		.slot = 10,
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho11",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO11_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
+		.slot = 11,
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho12",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO12_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
+		.slot = 12,
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho13",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO13_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
+		.slot = 13,
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho14",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO14_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
+		.slot = 14,
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho15",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO15_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
+		.slot = 15,
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho16",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO16_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
+		.slot = 16,
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho17",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO17_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
+		.slot = 17,
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN2_OFFSET,
+	},
+	{
+		.label = "tacho18",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO18_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
+		.slot = 18,
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN2_OFFSET,
+	},
+	{
+		.label = "tacho19",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO19_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
+		.slot = 19,
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN2_OFFSET,
+	},
+	{
+		.label = "tacho20",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO20_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET,
+		.slot = 20,
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN2_OFFSET,
+	},
+	{
+		.label = "conf",
+		.capability = MLXPLAT_CPLD_LPC_REG_TACHO_SPEED_OFFSET,
+	},
+};
+
+static struct mlxreg_core_platform_data mlxplat_xdr_fan_data = {
+		.data = mlxplat_mlxcpld_xdr_fan_data,
+		.counter = ARRAY_SIZE(mlxplat_mlxcpld_xdr_fan_data),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.version = 1,
+};
+
 /* Watchdog type1: hardware implementation version1
  * (MSN2700, MSN2410, MSN2740, MSN2100 and MSN2140 systems).
  */
@@ -4975,6 +6319,8 @@
 {
 	switch (reg) {
 	case MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_RESET_GP3_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LED1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LED2_OFFSET:
@@ -4983,12 +6329,14 @@
 	case MLXPLAT_CPLD_LPC_REG_LED5_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LED6_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LED7_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LED8_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GP0_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GP1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WP1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GP2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WP2_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_GP3_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FIELD_UPGRADE:
 	case MLXPLAT_CPLD_LPC_SAFE_BIOS_OFFSET:
 	case MLXPLAT_CPLD_LPC_SAFE_BIOS_WP_OFFSET:
@@ -5012,10 +6360,14 @@
 	case MLXPLAT_CPLD_LPC_REG_ASIC2_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PSU_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PSU_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PSU_AC_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWR_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWR_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PSU_ALERT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_FAN2_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_FAN2_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_EROT_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_EROT_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_EROTE_EVENT_OFFSET:
@@ -5083,6 +6435,8 @@
 	case MLXPLAT_CPLD_LPC_REG_CPLD5_PN_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD5_PN1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_RESET_GP3_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET:
@@ -5094,15 +6448,18 @@
 	case MLXPLAT_CPLD_LPC_REG_LED5_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LED6_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LED7_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LED8_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_DIRECTION:
 	case MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_GP1_RO_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GP0_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GP1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WP1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GP2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WP2_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_GP3_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FIELD_UPGRADE:
 	case MLXPLAT_CPLD_LPC_SAFE_BIOS_OFFSET:
 	case MLXPLAT_CPLD_LPC_SAFE_BIOS_WP_OFFSET:
@@ -5122,6 +6479,7 @@
 	case MLXPLAT_CPLD_LPC_REG_GWP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GWP_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GWP_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_GPI_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_BRD_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_BRD_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_BRD_MASK_OFFSET:
@@ -5134,12 +6492,17 @@
 	case MLXPLAT_CPLD_LPC_REG_PSU_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PSU_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PSU_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PSU_AC_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWR_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWR_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PSU_ALERT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_FAN2_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_FAN2_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_FAN2_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_EROT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_EROT_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_EROT_MASK_OFFSET:
@@ -5213,6 +6576,13 @@
 	case MLXPLAT_CPLD_LPC_REG_TACHO12_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_TACHO13_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_TACHO14_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_TACHO15_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_TACHO16_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_TACHO17_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_TACHO18_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_TACHO19_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_TACHO20_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_ASIC_CAP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_CAP2_OFFSET:
@@ -5248,6 +6618,8 @@
 	case MLXPLAT_CPLD_LPC_REG_CPLD5_PN_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD5_PN1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_RESET_GP3_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET:
@@ -5259,13 +6631,16 @@
 	case MLXPLAT_CPLD_LPC_REG_LED5_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LED6_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LED7_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LED8_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_DIRECTION:
 	case MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_GP1_RO_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GP0_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GP1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GP2_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_GP3_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FIELD_UPGRADE:
 	case MLXPLAT_CPLD_LPC_SAFE_BIOS_OFFSET:
 	case MLXPLAT_CPLD_LPC_SAFE_BIOS_WP_OFFSET:
@@ -5285,6 +6660,7 @@
 	case MLXPLAT_CPLD_LPC_REG_GWP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GWP_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GWP_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_GPI_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_BRD_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_BRD_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_BRD_MASK_OFFSET:
@@ -5297,9 +6673,11 @@
 	case MLXPLAT_CPLD_LPC_REG_PSU_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PSU_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PSU_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PSU_AC_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWR_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWR_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PSU_ALERT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET:
@@ -5370,6 +6748,13 @@
 	case MLXPLAT_CPLD_LPC_REG_TACHO12_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_TACHO13_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_TACHO14_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_TACHO15_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_TACHO16_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_TACHO17_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_TACHO18_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_TACHO19_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_TACHO20_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_ASIC_CAP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_CAP2_OFFSET:
@@ -5431,6 +6816,14 @@
 	  MLXPLAT_CPLD_AGGR_MASK_LC_LOW },
 };
 
+static const struct reg_default mlxplat_mlxcpld_regmap_smart_switch[] = {
+	{ MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET, 0x00 },
+	{ MLXPLAT_CPLD_LPC_REG_WD1_ACT_OFFSET, 0x00 },
+	{ MLXPLAT_CPLD_LPC_REG_WD2_ACT_OFFSET, 0x00 },
+	{ MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET, 0x00 },
+	{ MLXPLAT_CPLD_LPC_REG_AGGRCX_MASK_OFFSET, MLXPLAT_CPLD_LPC_SM_SW_MASK },
+};
+
 struct mlxplat_mlxcpld_regmap_context {
 	void __iomem *base;
 };
@@ -5539,6 +6932,20 @@
 	.reg_write = mlxplat_mlxcpld_reg_write,
 };
 
+static const struct regmap_config mlxplat_mlxcpld_regmap_config_smart_switch = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 255,
+	.cache_type = REGCACHE_FLAT,
+	.writeable_reg = mlxplat_mlxcpld_writeable_reg,
+	.readable_reg = mlxplat_mlxcpld_readable_reg,
+	.volatile_reg = mlxplat_mlxcpld_volatile_reg,
+	.reg_defaults = mlxplat_mlxcpld_regmap_smart_switch,
+	.num_reg_defaults = ARRAY_SIZE(mlxplat_mlxcpld_regmap_smart_switch),
+	.reg_read = mlxplat_mlxcpld_reg_read,
+	.reg_write = mlxplat_mlxcpld_reg_write,
+};
+
 static struct resource mlxplat_mlxcpld_resources[] = {
 	[0] = DEFINE_RES_IRQ_NAMED(MLXPLAT_CPLD_LPC_SYSIRQ, "mlxreg-hotplug"),
 };
@@ -5550,6 +6957,7 @@
 static struct mlxreg_core_platform_data *mlxplat_fan;
 static struct mlxreg_core_platform_data
 	*mlxplat_wd_data[MLXPLAT_CPLD_WD_MAX_DEVS];
+static struct mlxreg_core_data *mlxplat_dpu_data[MLXPLAT_CPLD_DPU_MAX_DEVS];
 static const struct regmap_config *mlxplat_regmap_config;
 static struct pci_dev *lpc_bridge;
 static struct pci_dev *i2c_bridge;
@@ -5921,6 +7329,31 @@
 	return mlxplat_register_platform_device();
 }
 
+static int __init mlxplat_dmi_smart_switch_matched(const struct dmi_system_id *dmi)
+{
+	int i;
+
+	mlxplat_max_adap_num = MLXPLAT_CPLD_MAX_PHYS_ADAPTER_NUM;
+	mlxplat_mux_num = ARRAY_SIZE(mlxplat_ng800_mux_data);
+	mlxplat_mux_data = mlxplat_ng800_mux_data;
+	mlxplat_hotplug = &mlxplat_mlxcpld_smart_switch_data;
+	mlxplat_hotplug->deferred_nr =
+		mlxplat_msn21xx_channels[MLXPLAT_CPLD_GRP_CHNL_NUM - 1];
+	mlxplat_led = &mlxplat_xdr_led_data;
+	mlxplat_regs_io = &mlxplat_smart_switch_regs_io_data;
+	mlxplat_fan = &mlxplat_xdr_fan_data;
+
+	for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type2); i++)
+		mlxplat_wd_data[i] = &mlxplat_mlxcpld_wd_set_type2[i];
+	for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_smart_switch_dpu_data); i++)
+		mlxplat_dpu_data[i] = &mlxplat_mlxcpld_smart_switch_dpu_data[i];
+
+	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
+	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_smart_switch;
+
+	return mlxplat_register_platform_device();
+}
+
 static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 	{
 		.callback = mlxplat_dmi_default_wc_matched,
@@ -6016,6 +7449,12 @@
 		},
 	},
 	{
+		.callback = mlxplat_dmi_smart_switch_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0019"),
+		},
+	},
+	{
 		.callback = mlxplat_dmi_msn274x_matched,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "Mellanox Technologies"),
@@ -6390,8 +7829,25 @@
 		}
 	}
 
+	/* Add DPU drivers. */
+	for (i = 0; i < MLXPLAT_CPLD_DPU_MAX_DEVS; i++) {
+		if (mlxplat_dpu_data[i]) {
+			priv->pdev_dpu[i] =
+				platform_device_register_resndata(&mlxplat_dev->dev, "mlxreg-dpu",
+								  i, NULL, 0, mlxplat_dpu_data[i],
+								  sizeof(*mlxplat_dpu_data[i]));
+			if (IS_ERR(priv->pdev_dpu[i])) {
+				err = PTR_ERR(priv->pdev_dpu[i]);
+				goto fail_platform_dpu_register;
+			}
+		}
+	}
+
 	return 0;
 
+fail_platform_dpu_register:
+	while (i--)
+		platform_device_unregister(priv->pdev_dpu[i]);
 fail_platform_wd_register:
 	while (--i >= 0)
 		platform_device_unregister(priv->pdev_wd[i]);
@@ -6412,6 +7868,8 @@
 {
 	int i;
 
+	for (i = MLXPLAT_CPLD_DPU_MAX_DEVS - 1; i >= 0; i--)
+		platform_device_unregister(priv->pdev_dpu[i]);
 	for (i = MLXPLAT_CPLD_WD_MAX_DEVS - 1; i >= 0 ; i--)
 		platform_device_unregister(priv->pdev_wd[i]);
 	if (priv->pdev_fan)
