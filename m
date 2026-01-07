Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012045.outbound.protection.outlook.com [40.93.195.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496DA34A3DA
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Jan 2026 14:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795977; cv=fail; b=sqKktpZKZk6nXZXAN/xP6dEXA5yT9bWquMuqQYmDZtGYWRXH72nIz7oLbG6ClNY2H1jVEQ6ofBlbhY/6/h6W/+DNc3c+d6NcKfaqoQyI/GMl0SJ3XOdw8FnshrD/5K6Uqx2bAGKCiJ0nlrrHESW+zUL2mGGgRVFnyX8qJVREK/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795977; c=relaxed/simple;
	bh=JyIIDr2WkGhFtaMDYy0XS7n/IujdrxSoRPWMHJ4r6Q0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lUK5jMhKMiT5KVNpBJ01VoWh70wgZJnTYpbxx71SiXYmibjmRBpvxxvAht4azUuwfRCK5IbLvzXgHPAv+l/pP1U7s825qBvJX9WSQOkOVGBrzwy3/1W92shC5RRjRuWtg6EVfMXb3aDnzNr6Of/36RJ6ZLKDmEcC8VYsjvLvgVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AREHMQyj; arc=fail smtp.client-ip=40.93.195.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AREHMQyj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKCG57xmCrXtyEpkIyydfBzNW7z3f00WHbhH6qelHKhSYhBremfdY3nRolxohraSVFAQLJv4yCpvivAA5KwFVMNPlgkuLTUSTttLPLszQW4hQ0DISt/+mID46Zp/rpoG1yfWADBobRE6/U1t84cIku8VL3OZMW4x71gjdjaD7mMC3+JqGENfnMXfYkQFS5ULMveWct3Jw5tvLelF3scww4y+FGD36yDUSH0cECMIYjQISRYki6jnjJ32TUWh/Kwbly/2Uji+NvmvXlhkMzVLf8GpuO20wGZL8BJOFvSED8cpLmqnTSmhR0MGb4WJvCq6CM7PyQ6sSVRW4H5DQYNw/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWVVrYKpmn1hS/gg7SibFGJ6L6jbCy6wmFSUWRawc6U=;
 b=fHJNTH5jlMZ4NlC5pKlzsScQxcCSPPNBf1u97ngwPtTw+9A/BSWKrVGIew2lTOWA0YGV9hLrSHA44rX6g99ZL8hfSul35SRYBLzWxKurV/15lX7g7qYYX7zCkAdffQHmABfCxNYJHqRUJISPTq7GmbcgiKtxVeYWdC6UZo44TpiYMh65sxUD4j8XGZVpQqNrDOIIhesusADO20FiTep5/29DgvtATjW2v3GXOuH2Iq3nhlb+UxKkN3skEZLoUT6iB8+iSq0LqtOUVvVNsOuqaw2Zu5M3AZSPA3JCiz+qz85arq1gprar7zm//ZP59ypXeJPr4cUTxgwQn4fGrER4qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWVVrYKpmn1hS/gg7SibFGJ6L6jbCy6wmFSUWRawc6U=;
 b=AREHMQyjcQ3T9y4Qlrm35nEqVI/muLTBWJAr0ty4h6u0f84RWLrmZiXZ+iqwCH7NPef0xnVaRSA2/wkQoFwScPTxry9VwRNZwmNqDK/U7mfXktEovCDhJEtd6h9uKik59Ydt58Bw3y4OG9FRM1HSoVKkl5Wg+mM8VG8bETfThM5AHadH44qtPzvg8LcdK0GK2GwX0DO8JwW7iD8/CJ7k411Z4vaE7gICj7wm9Vu+8Gy9yO8JHHaKZeAsARoHjU7yfyPB/y8WQxkCMZgPrd6cPZOuHjbWcq9T9+YBv9LuZ2mPksHv1lQkRpq/CaMjyU0ZFPH9iPfVVhCXvtKSUJP/4g==
Received: from MW4PR03CA0332.namprd03.prod.outlook.com (2603:10b6:303:dc::7)
 by PH0PR12MB8127.namprd12.prod.outlook.com (2603:10b6:510:292::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 14:26:11 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::db) by MW4PR03CA0332.outlook.office365.com
 (2603:10b6:303:dc::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 14:25:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 14:26:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 06:25:53 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 06:25:52 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 7 Jan 2026 06:25:51 -0800
From: Oleksandr Shamray <oleksandrs@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <vadimp@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Oleksandr
 Shamray" <oleksandrs@nvidia.com>
Subject: [PATCH 1/1] platform/mellanox: Fix SN5640/SN5610 LED platform data
Date: Wed, 7 Jan 2026 16:25:48 +0200
Message-ID: <20260107142548.916556-1-oleksandrs@nvidia.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|PH0PR12MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b26dda1-ff4e-4590-a29e-08de4df8b463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qNSHu4qjmbvFxmF0rI4TppfHM0XYhsjZxW7MxwOgJKdInFj+7oNO5p9aV9sz?=
 =?us-ascii?Q?qEA1DT0JJbqXtqQ6C698VRGOCTGWw2/7jWHOQvfHayUPkLPw8pLtPoc2BpTv?=
 =?us-ascii?Q?+KdZlCR5F7qQ0X0ylRwzNTugOZowYat2ZbY/cTB4trT/e/6weSgJn7ipimhw?=
 =?us-ascii?Q?jUxQjv/pFTOQipepLWaOhpn7YGePRHU/5QtDb6jMJZ+6GD4Tw3zGFEuBs57F?=
 =?us-ascii?Q?y0nj8wnNm3kg3TqcOzT2WddT1yfiCyX+ycRAHoIr91wSWUYBgw5xIuYpQq1D?=
 =?us-ascii?Q?9kTfxZZJao6qOS1ZT4tEbl5g+ON+z3DSjVbmGw7kpmdqg+cXfaM3zlsRrF0Y?=
 =?us-ascii?Q?V9vuUzjfaLnuwewn1dN9CK8D7T0myBmwpsJ+2QBU/hhDrOOy9P+T2xZMb/pa?=
 =?us-ascii?Q?6v7aoyqId5CuzpTJGlaPfrJDbIjTQMtoSRd5pp/8ovMhRJMUP3XIZzRlqEjc?=
 =?us-ascii?Q?VJbV3AXfxUFTnfqlKMtLJmRkQJu1kpyzLXReRbvE1HFveL/PAvzyRKjTVnKy?=
 =?us-ascii?Q?qtKAW3JyNcLjJ1ovsUfTlgfdlk2nbWo36NyB5o8kdGJaIBL9pL3SuhqhkkSi?=
 =?us-ascii?Q?av8/ULCrdLp8By/pvJ435iFrA7lH6lGFv9goIaEpqaQMSL6fJSjcHSEVBpwD?=
 =?us-ascii?Q?DDQ98nQvMXoN8XUktaqQw3ZZGgDki3xLpz26loC4pCdC6Vvle6jjTQ/rYIWi?=
 =?us-ascii?Q?b+rc+TXh1yr0WksoBY0q/Kmh4mAMSwbTQ75psb3LGS8SmpRS2q+dS6QVubLG?=
 =?us-ascii?Q?5520I2EX3ny6eGTLz805X67x9pnJ/nJgZ21KgCUntT/kuQUmWD5Ko0K3kEF5?=
 =?us-ascii?Q?EcpyvuCGGM7PFDenEprf3E0rok2ZZoaOqog1u9G8Exkk6Wr1g89FQDwFcgRF?=
 =?us-ascii?Q?ruHC5sSMAZAOM75bIXUj3LLoi5NnjXz40myHpIVlsExfJKRaZ+DIPF5+r/7s?=
 =?us-ascii?Q?bSwxyKAoP9DrEahwdbnD8B+Lo+yZTH1OYzgLMcDw3Vwsul8QIirChik4Lftg?=
 =?us-ascii?Q?7c/Ef4BKddm0VLxo32Fap+wMU9ekFHt33FUDiwEJn8Uzy1agWo78Ot7VcxxP?=
 =?us-ascii?Q?U1EnwPkDz933uVHQtmWm/uFZ4jkfA5UlIfSb+U5+gaZ2lv01xNSkdGEnM9di?=
 =?us-ascii?Q?aFl2abSfeGRjbk3V3RFCB/QVm3Re9jhcX/AP3etMwf5wiMDzcggnyZm4kUGI?=
 =?us-ascii?Q?VxaSxSF+oKNGsYi/Sni/gcgo5s6lBKVsC64zLzla+14f/Z/pFwxhfW4Qe6nR?=
 =?us-ascii?Q?YLJij0B7+NBd4Kygl1NnnGafBcqaIdyCmrmvno+AUEiuimKY3Pz+U1WQ7nF3?=
 =?us-ascii?Q?6AhkAXoYhtEQcWTW7iLBunj9iRxbeRnXbYte5HjiTvaCTcQV/L6h8D0v88/G?=
 =?us-ascii?Q?mwuQPqrmqtS/XqIEFu4M7UQ895VWEqJvCMl+SOCZRXtTsYhZ7DhQBoOj8HSw?=
 =?us-ascii?Q?acbzvDI90SJVw+xJP+bDpLt6BpcsRzlH4xJOzHYx1/Aki+znBuoiFMw7BgrH?=
 =?us-ascii?Q?D3aeUIOC2sPHe3pADU9V3E08xEYsYrN4Bsj5BcXxBS7YuxDLuCJu6NcNiZhg?=
 =?us-ascii?Q?VefAb1FbVljpCdhYKvg=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 14:26:10.5833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b26dda1-ff4e-4590-a29e-08de4df8b463
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8127

In SN5640/SN5610 platforms should be used XDR style LED data with
predefined slot index per led_fan.

Fixes: 317bbe169c46 ("platform: mellanox: mlx-platform: Add support for new Nvidia system")

Signed-off-by: Oleksandr Shamray <oleksandrs@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlx-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index b117c04379cd..b00e7490411e 100644
--- a/drivers/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/mellanox/mlx-platform.c
@@ -7849,7 +7849,7 @@ static int __init mlxplat_dmi_ng400_hi171_matched(const struct dmi_system_id *dm
 	mlxplat_hotplug = &mlxplat_mlxcpld_ng800_hi171_data;
 	mlxplat_hotplug->deferred_nr =
 		mlxplat_msn21xx_channels[MLXPLAT_CPLD_GRP_CHNL_NUM - 1];
-	mlxplat_led = &mlxplat_default_ng_led_data;
+	mlxplat_led = &mlxplat_xdr_led_data;
 	mlxplat_regs_io = &mlxplat_default_ng_regs_io_data;
 	mlxplat_fan = &mlxplat_xdr_fan_data;
 
-- 
2.47.3

