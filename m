Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011066.outbound.protection.outlook.com [40.93.194.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE2F32E129
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jan 2026 08:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769587206; cv=fail; b=ZbkKaxXN4SKtK0P/FpWs9iDWYoUuN8teG1z6RD4/lLOhqjn+INV14rP/u2fZ10360FgX1m+AbHOUVb6zARXt8W8BPvla30SqBRsMoKOMosFXrEfPhyPESp3nXffHqWQYHMtEKsQk8ZeFeCdYtzemOvxyQTO36bQGBqI/To3/WOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769587206; c=relaxed/simple;
	bh=i2s/yATAq5SMdJGHgd5IrmbVKaH3WiFAYDF3uOZe3o4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K7H4IAbGnl2DQCmoF1k5Gptq9LcCwa9CbusrC0Be/tDweLxaIzsEE5458czGKoOgXlEnNZAfpkmwll93hm5HK5V+5riWjLtKr+t0qw4ExYuyPNSptbdWzeebD8fwYI5oumsQV+ifiUokLB8h0KNeoKR3dpi0gMI28CiXx1SZZbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FJNiO8xD; arc=fail smtp.client-ip=40.93.194.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FJNiO8xD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tdra3FXXS2PHrMEp4j6Zuy34TKtIIkLsXF24OsuZFkA6XtFSZhtI6KOFlyayrbiZyv8T2q7yYAsvg2qndby4rmvVRvpfaV2dH8UbIjLyPqpQshYuT9Yb4g7hjQ20/icbN9YUENw+4nrHN+KV6b2xn02ssv0TPjBCvSeZtpYDbQ54tuNfOjn5jVMk/PHRuQu/1g79ozJj2aWwLlED15dEzf7njfrf18UTpE4nWRA+eInHePCM5vUFhfD0fam6dNCzPdeMotLPHuQdbGIcsGmUvtAyncCTfYCh9Ceny2Rhdv/ZMC3zeTonrirEuWFMK4fmJNIdPqkedfSMylgDu1WNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiEWmxTm2S32xoq0uiAhWbyhWZpEj0ubVIS5r2SmwOM=;
 b=tauk1/aGG0FAtgcQZNv8vEOqdTfbBZmGi39qCxNnGVsfAJTHmRkaxdslqwKOtHTYpPaATdtjFcdsan3SCFQvYUc47GmCXpmDuW12kBfb3KSPzebWdpbpCzetnF0ORKJiE9zWRhqbCIrn1ypM9LGskXFlDX+XRgLPJA8LtaHN5Jhe7uUN1PtD7Zjmjk+LCzmY8WAyhP1gc937inChE65O7AqBXyRkcPubuqoXSxz8jhNXrelalUy7J/WRuMatzhJz1p6zuMC9lmAlm/jHFfAclqTsLnVHpryTFEtFJ6SFitV2sIzr794tcG3cACSUoNbr+WNQusaeDmtGKBiPmFPZAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiEWmxTm2S32xoq0uiAhWbyhWZpEj0ubVIS5r2SmwOM=;
 b=FJNiO8xDi/UMvsRKdTyVmgjTVlNcR4NcXQ8w2atmlDMr3tKA/3TsdYZbKv5wikS8tXyMQHhFEW+IKHrrXahY1/pVR7PzUhz3NAGBQJNRTICkQ1bFw4AKE6LpEQ/ZomWPXbiJwSVyfsThiWaDB5YcKZcNAjganmztYGr8oKzx4XBI1PFACwvx2He5M/pSmQ5xj65Ug9cMnQxbzHCrfzTSSUvnYUfxJHlrIYtH5YsBTz6ShzsbRlWLORfx57XSGwZnjLbP304DlksA0HchhBLtoSNqo8GzH0gALOoot9wIM7al347pHv6kV3lzaT3WcWWHstHk5mW6tmq3mpadWTaWBA==
Received: from DS7PR03CA0232.namprd03.prod.outlook.com (2603:10b6:5:3ba::27)
 by DS0PR12MB8575.namprd12.prod.outlook.com (2603:10b6:8:164::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 07:59:59 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:3ba:cafe::32) by DS7PR03CA0232.outlook.office365.com
 (2603:10b6:5:3ba::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 07:59:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 07:59:58 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 23:59:43 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 23:59:43 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 27 Jan 2026 23:59:42 -0800
From: Oleksandr Shamray <oleksandrs@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <vadimp@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Oleksandr
 Shamray" <oleksandrs@nvidia.com>
Subject: [PATCH platform-next v3 0/2] Introduce new Nvidia systems
Date: Wed, 28 Jan 2026 09:59:37 +0200
Message-ID: <20260128075939.2704019-1-oleksandrs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|DS0PR12MB8575:EE_
X-MS-Office365-Filtering-Correlation-Id: c320c958-992b-4545-460e-08de5e433b5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XeaRfXI7cS+2b1OPOLuTlx878DJM4xAchVg418/vGswhcPBI0MaZ9yKPM9QU?=
 =?us-ascii?Q?l7euIBR96bBjUdbHXBRWK+pgSo+66B848wX3stUhN4XRvqGSLWz2Jq7d2U8O?=
 =?us-ascii?Q?TShg03pdXZOiXtGsPWPzKUzcAfGxAeFX0rDTw9BkCGWP9wNjCW8nkZCa0Oxm?=
 =?us-ascii?Q?XGLFFiigvVlYOy1mnC1I83QD2GVeRmr+DkKRDUF8ly0Y9Xyf/Db8Ny2xva0h?=
 =?us-ascii?Q?wdWdAlRviPfPhrB7XxbNsditqvjZ11AxeYq9y3Dxyacvrhi5lKPjQ/IuX53m?=
 =?us-ascii?Q?snTICXZ7U9IqJIICS6rA9rB11UdLYKzNd6D3ydTjcZzm9ByK0nHnmwVOzUVK?=
 =?us-ascii?Q?j9PxYXkuLTEJ5FMnoB2JNKQl/mYIKvMIvnu5KyVglE/l7Dxo0OxBjuKHCtuV?=
 =?us-ascii?Q?f4OEmV+7Px65JorhOEyggBXWwZlLhGBsZ8HYr5mDBta9pROX8bpFOpqWMOt4?=
 =?us-ascii?Q?AOktZOB0hxUoDRb9u5czqt0QXpYPkqRo+y7fvv7vGE4Q5+uF9/V2z7qXCpGX?=
 =?us-ascii?Q?1EbLh9JbuQ0UnN7v/Sb51RqQI7epEv/AjWT0gJmbmr4jG05Xn6wQrhZD0wuC?=
 =?us-ascii?Q?M/C5poE1CqHVIXD1xGrOIr7krPfRMhnE8jdavHUBCXPeta0pcwq1pyJI7KDo?=
 =?us-ascii?Q?vsHgObXo7qIbkOMSdiqI7vzUgNAHfgSLukqXNgFzehT8uh/HAeZgyrGawMm1?=
 =?us-ascii?Q?FO+g2+t1bTmneY7quPfQndQwnDCkWqrdjQjPDnfZdIEh0d3HeMlddNgT1njg?=
 =?us-ascii?Q?DZeKwjRn8pOYqTSuXJ+WEkMK+xPcgZbEsYmy9ChAjX6iF2agMzdRSyjVPrfM?=
 =?us-ascii?Q?yzoGcLHeafVCzkQ7zrMWWyZ8QerYV48FlqoSCAJi8odiYA4VaLGrGycIY2oE?=
 =?us-ascii?Q?NXAvNHd8INszlrs0Tc9ch2bOSvkWz+RqfKaU/rexCRi9Cy/mnSAifn+rQcLm?=
 =?us-ascii?Q?aMiJw+Z0Na6qOtUCuW8nxRLasYT8VxjdL4HyNgyU/zZVb5HAYxEaMrKo66eW?=
 =?us-ascii?Q?XP6nM4b44QeiG9Av+XITh/OD/ZnPzXIad3CHjJ0CBeIfYxgNt9LOe6/K9s/W?=
 =?us-ascii?Q?gKlMJ8aaAeTYRG3ox1JxxZRzwK2RYDD8M74JG/qbyhINKJdJ8p+1w4vDfdSA?=
 =?us-ascii?Q?RObGLJJ8bUgSUfuoOjdMbBUJcIbBzKAKmhawPQ055c1OB+26jWI1mRF7+mun?=
 =?us-ascii?Q?yY+tGh1D5I+m/kmzyUShJixPvWK6uyybSMPZcSYvaoKe2nHNhULalz3rfYnJ?=
 =?us-ascii?Q?L2Kfs/lLhjqRwSoRKHsOgdq7DE13OZ2lz7NGJ3r4tDFOv0DcXxbmqmR1R1lV?=
 =?us-ascii?Q?XQyrsycbSsBQQSI0ixe7+a15PmjvWhQ6VSwGxC3TN/GQzEudsfM+X4FK4qaw?=
 =?us-ascii?Q?2AdOFb23I8+LuHp7VFAXYQ6UKOEuikN3XPSlgWSvOVgYKXgnagcTS+s6yuwE?=
 =?us-ascii?Q?bvtSWoWy3xkE6NmOG6FPCsnhaYB31ctdMaS0DkOLx+14SYV4JEfXdt8vcIe3?=
 =?us-ascii?Q?1waI4qU0d2+hPWQALee1ddIvT2q0v9X32O+whk7/M9zASyVHSIoqobe4qVZT?=
 =?us-ascii?Q?O6cb7P0EmHwpw+CJo5SaL8LIzMM3APn6xjGrQOTBs3g72O5tK4v5W0Ox/vFe?=
 =?us-ascii?Q?FvXqDsdhF/d53JQFtSyVQLfZMWyla2JsCnfM8ipamCuW1Qc4+PNjMpEidujb?=
 =?us-ascii?Q?u2SdZg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 07:59:58.3516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c320c958-992b-4545-460e-08de5e433b5d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8575

Introduce new Nvidia systems:
  platform: mellanox: mlx-platform: Add support for new Nvidia DGX
    system based on class VMOD0010
  platform: mellanox: mlx-platform: Add support DGX flavor of
    next-generation 800GB/s ethernet switch.

 drivers/platform/mellanox/mlx-platform.c | 484 +++++++++++++++++++++++
 1 file changed, 484 insertions(+)

-- 
2.47.3

