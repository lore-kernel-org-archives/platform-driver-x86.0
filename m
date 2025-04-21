Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2D820FA8B
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2025 09:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745227313; cv=fail; b=BOmLg9JHbKtCpcqnOBFTE5MQt6QAJkW29EiJk8RkcyWQf20plO34lY4hXS9CA0x+O4Zsmfsx4LMxOw4+w7eXRNJV5UGCHdUn8R18uvNflmXkzcwuQ+O2zUjGgYXDW1I5d6yzuiiP2x+Jsz90Sekzs9wsng5sM1HwHM+5kBwG54g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745227313; c=relaxed/simple;
	bh=qWg17KH0C2NG8DmZzqDDxVO+8xvoHCYycmOrXh9k/ic=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bmGP8FNu1oZ0YYwp2M5XkMc60tpyg+8DkIft0Tc7o3eE6V6UYgbhDIBFE85TbGx7moSKfKhOoIJzu9RW+pi+7ctEO4tjLG1PIaE46zUC2o/1IXcb4wLm70PWBUoNH3ZJNV950Z63zcNj+Gx7ftan0m4dJV1OpWbLxWUReNyb1g8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F4gdCBMA; arc=fail smtp.client-ip=40.107.243.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F4gdCBMA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1p63j3ebwat448Mw0Vkh9455F0vRsRXNpnCil3C+ISnnpOB5vx4uBGVcWTLE3bi+xTfI3FpJeeFN/BwuT4gEqAxXsaFk16+o2aq7pbuhJC8OT1p0GJYdo1VAghGGyTNQ2YdqreEZ2RXLMMytH4maZLQmaLxahopQ4Ps6m+YIyH3KrWDGlbX4ZCcoORRlDl31LN2PQBgcltReQUla23ygSffxnCmdckDKR7GEVX3qyPelB8Gr/9YCHiR52VXcpL9L+DeR/0iQSw0+EqTBoHbubhXInDxKpZ4WNsu2JP2t4gUQzbeON279u95y0zRN19IpuOOWLWDVYId1dEL2vg5ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwlmUDt/4epw7o0c+zwfdYoDf/GIWKSz1I3D9aEJbCU=;
 b=nlc6OQF4yRWb3/G6/z5oyLs6wR5fp12FzhROzLfG3T5fgVqwKNNIE8piy/ngytoku4WsczIRII/fzk4W3PhmPD9J/YK8Y/j1pWF06S23HB3kEJFAAvP7xQGy9wmlqpmgT/wNO7K77f+Sgp3xix90RK+BrsUG2Pw0tkg02I0+hoL2Jnown6Unvkk7bNmK9qMi6ouFmfFCnkAqBznPv62jHM+pmb7DnnvgKWd6RVhz+gOyZ7oPTGuKswIIvLEPt5xxzjZGY11PyT1qUaKPNN8x6L3fc83F4h+rwZX7iX8ogeV15h17fgszYkluGdsU0uvAv1Ut4ouKh4Efoy/NxCh9kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwlmUDt/4epw7o0c+zwfdYoDf/GIWKSz1I3D9aEJbCU=;
 b=F4gdCBMA3Jelodf1Q+iI39G1xLQGISfGQoIklbmhiXYRnB/ttioqVhbrmim1hxxNv8iLw4S1diAkU9wOhoC4pn1lES9MJGCgXDM9C50jOwuI2yu7arvBpFBLiEeLjZW5hjsjre94q/cAk6k3wDax7Wq/0sBrmavHia8wMha6Q99m+Ty+w3R9vsFqTwW2vbtuYcpwVu8iyRZJSZDree1UZxwIT+kDNHyc1ML5I8ExGZfChFdlKXlHqEhysPJvZ7sGEZWv6ns3pqgMgR9UJKIX1LiCt6x+FM5PbCKx6KE4BH/Fhft3hneuKhHC20cTHiVP+nceKajuxliB+zn3BcJmoA==
Received: from CH0PR04CA0020.namprd04.prod.outlook.com (2603:10b6:610:76::25)
 by BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Mon, 21 Apr
 2025 09:21:47 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::a1) by CH0PR04CA0020.outlook.office365.com
 (2603:10b6:610:76::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 21 Apr 2025 09:21:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 09:21:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 21 Apr
 2025 02:21:31 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 02:21:29 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v9 3/6] platform: mellanox: Cosmetic changes to improve code style
Date: Mon, 21 Apr 2025 12:20:48 +0300
Message-ID: <20250421092051.7687-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250421092051.7687-1-vadimp@nvidia.com>
References: <20250421092051.7687-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|BL1PR12MB5849:EE_
X-MS-Office365-Filtering-Correlation-Id: d7445588-2d22-48fc-629c-08dd80b5f0fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UU1oY0QwZkRhZmxtNVdQKzhTTW55UnppNzNTOHE5ejgyQTdqZjJvUE9qQzl5?=
 =?utf-8?B?Z0dtVDh1VHVkaklSSlo0UmVvMnBKdU1hY3FacmY1L1o1VWdnZk8xMXVGK09i?=
 =?utf-8?B?WjA4QnBLZC9lYm0yVGNaUWYydFBWRGdLRStXdXM1ZUdMQzNCa3NsNDVoazRp?=
 =?utf-8?B?ejB0TW54QWNENkF3M2tlV0o1dUlUVmxOYTBrMC9VWW1HSGJrc3hya0pYSmhs?=
 =?utf-8?B?RFN4c255RXRpWS82M3J6YVQxb0d5bEhXNG5uVS9VNDExS2FCNU1nY09GVlNY?=
 =?utf-8?B?SWo2cDUwQUxBeWdIckpsbTB4dEliQ0xRQzg5dmk0ZDlkSHVLTDFabjV0TStl?=
 =?utf-8?B?S0FBcVd5bzVRdVVxUzJaRHZRaDFxcml2TSs1QkJrVUVoeldVMkhBVndwWDA4?=
 =?utf-8?B?SUxZNDF6U0NicmFCQlhIMHhIcFBVWGxjOTk1eUQrZ094ZE1zV3diWitYZkE1?=
 =?utf-8?B?cTVQa1JMbldvU1ZmbURQUG8wMXJYMkJJSWJ3UXlMSGRLL2orWnY3TUQwb21Q?=
 =?utf-8?B?MkIvdi9DVnkwc0daOEdkMmxjN2FSZ2Y2SDRrYXhIR0dPYnZOdHlickhIWEts?=
 =?utf-8?B?YVVoeFRtaVF5eXZNUFk0dVoweU1ZZFQ4MkJuNFo5OVIyTHAxUmo4bURnR0Zj?=
 =?utf-8?B?ai91Vk5mOEROMUowNEVMWUdwV2t6SXZ0b2toaG1WRzRIZVM2ZXFBYzBld2Va?=
 =?utf-8?B?VHBmVEFyanFoNTBTZ0doQ2NnMEFKR3dOdFgwN1FHTjFLRmpIQkdKY0s1Nks4?=
 =?utf-8?B?M2c0UjU4SmpIM0hTY1hWbCtiMjFTcklnMDEydFd1TUlmYSs2QmNLWWNmbmcx?=
 =?utf-8?B?djd0QVRIanF4ekpDb21CVUlieitrMWVVdGZXeWM4YzcwWTIxOGNaZHhkRjJM?=
 =?utf-8?B?blJoWVVHKzRVKzNDUk5Vemhyang4VFA3eExrN1l2U2JJSUtuNGZ6azlyejFm?=
 =?utf-8?B?RmRybzlQQ0NxM3dodFFvTTk0RW9VYUN2RTh3Z2J3RDRZUDF6N3VLSFEzcE1n?=
 =?utf-8?B?OHlnWDZqOWVTbDlUOVVhY2pOZWlmd1F4ajkzK1kyNzdZNGpwL3QxempHdUFx?=
 =?utf-8?B?USsxdE9mQ29iRlljbWdhMy9lbnlHc2JLOE1nWXV3RzgzU2xFYWpkNnNwRXN2?=
 =?utf-8?B?S0FDdmFaMzdwd1FvaDdHTHd3QlBDZk5mSzJNYngwMTREbWI5MG5WREQ2UHlE?=
 =?utf-8?B?RTdJeTBaWmNUejRSNjJhZ25GcjdmQ3ZaWjBGUEFlR2xWekhnRzY1UjlEYzkw?=
 =?utf-8?B?dFA3eHA0MVlrNThQNFNOUU8rdmxtUnpSS1RGclBRckF6M2pUMXhjNXhTSGtJ?=
 =?utf-8?B?Tzdoa0U2V1ZqbjRRbHJLVXlDamk4REJ0ZnBVeGpZU0xKMldUYjAzZDYzQU1Q?=
 =?utf-8?B?QlRyNUtqb0FvMjhnL0FMY2wyUGswZlJuU242UUVNdm94NHhKMS9sR3cyanJt?=
 =?utf-8?B?OVdSbWpJUFRmbkplbjlpbWtrVWtYbDc1WTYybjFjbU4wdmlPMWIyWS9rbUha?=
 =?utf-8?B?QlJaYjl6bGlwTDgyNXFENEJjN1FaaERJVWJtcUtUMXVhV01hL3EwT0NlVGlK?=
 =?utf-8?B?dU1rSWZ5WVFOU3ZWNm9MR1hCUnIxWUE2VVpXM1lZcERuSjhLTDBZOUtFdTho?=
 =?utf-8?B?NFNnOVZKb1dheVNQRjRGTFFNQVF5c3Q5SXM4Q2x2Q0xvMTJhd2htMG5oMnF2?=
 =?utf-8?B?VitCYkRaczdoUFBIbUtiNSs4TnhuczdobUtNdUlUS05uR0hUOUZJWllGazUv?=
 =?utf-8?B?YVovaFlydkluQ0tZQnY4dnMwMDEwdEp5SFZxaEdBbkoycWRPWEVpQmlzUTFY?=
 =?utf-8?B?RE04cWhuYk5nSkp4RUZtcWhaMDU1cUdxMm1VMlg5VUZWZU5YSEFZUXdQbUd6?=
 =?utf-8?B?L3FrYjBzUzZnekNIUzJiWlpuNWNnbitMdzBRVWVYSWtNU2NmZjVRcU8xWHdn?=
 =?utf-8?B?Rk0rMWZCdFhtZHJRcnhLdjV0U056SlA1NWNhV0Jub0hhOCtJTi9mNWl2Y1Nx?=
 =?utf-8?B?SjUzK2lEMzNzWWxoUlg4dGV0ZXRDR1dEUnZvU0ZUaDV2Mit3MXpoZXZxb0hk?=
 =?utf-8?Q?g32Uti?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 09:21:47.5449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7445588-2d22-48fc-629c-08dd80b5f0fa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5849

Replace in 'for' loop - /i >= 0 ; i--/i >= 0 ;i--/.
Replace in 'while' loop - /(--i >= 0)/(--i)/.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
v5->v6
Comments pointed out by Ilpo:
- Fix 'while' loop in erro flow.
---
 drivers/platform/mellanox/mlx-platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index eb5dc272168f..4c2ad2472f35 100644
--- a/drivers/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/mellanox/mlx-platform.c
@@ -7807,7 +7807,7 @@ static int mlxplat_platdevs_init(struct mlxplat_priv *priv)
 	while (i--)
 		platform_device_unregister(priv->pdev_dpu[i]);
 fail_platform_wd_register:
-	while (--i >= 0)
+	while (i--)
 		platform_device_unregister(priv->pdev_wd[i]);
 fail_platform_fan_register:
 	if (mlxplat_regs_io)
@@ -7828,7 +7828,7 @@ static void mlxplat_platdevs_exit(struct mlxplat_priv *priv)
 
 	for (i = MLXPLAT_CPLD_DPU_MAX_DEVS - 1; i >= 0; i--)
 		platform_device_unregister(priv->pdev_dpu[i]);
-	for (i = MLXPLAT_CPLD_WD_MAX_DEVS - 1; i >= 0 ; i--)
+	for (i = MLXPLAT_CPLD_WD_MAX_DEVS - 1; i >= 0; i--)
 		platform_device_unregister(priv->pdev_wd[i]);
 	if (priv->pdev_fan)
 		platform_device_unregister(priv->pdev_fan);
@@ -7873,7 +7873,7 @@ static int mlxplat_i2c_mux_topology_init(struct mlxplat_priv *priv)
 	return mlxplat_i2c_mux_complition_notify(priv, NULL, NULL);
 
 fail_platform_mux_register:
-	while (--i >= 0)
+	while (i--)
 		platform_device_unregister(priv->pdev_mux[i]);
 	return err;
 }
@@ -7882,7 +7882,7 @@ static void mlxplat_i2c_mux_topology_exit(struct mlxplat_priv *priv)
 {
 	int i;
 
-	for (i = mlxplat_mux_num - 1; i >= 0 ; i--) {
+	for (i = mlxplat_mux_num - 1; i >= 0; i--) {
 		if (priv->pdev_mux[i])
 			platform_device_unregister(priv->pdev_mux[i]);
 	}
-- 
2.44.0

