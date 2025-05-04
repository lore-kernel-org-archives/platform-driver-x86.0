Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEA41531D5
	for <platform-driver-x86@vger.kernel.org>; Sun,  4 May 2025 16:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746377680; cv=fail; b=avz7c0wJM2t8B0WIbZVzJwnaizcvsTbhQmOGviz/HW41Jn/QOHligSOH1i5s61irZCGVTDAo7rizWhqPBbWRm3M/3NA3JIycqJly+9aPAXc4YKc0Hvly+LJ+Q4IoyeMAsjztBxJyoBpamtKJgBQa81b/uJBNu+SV8yh9d6Eujlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746377680; c=relaxed/simple;
	bh=n/WyyrWKPBPTOpSg09Kqk3iWVDk5NpiGwLisHW7+OnE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s3IchgQKKFrb8VaxeW8/YfmYoNiHve6ICtebjip9WoDOi8u5xfhMjvw31S448wearTL2qpLEqO6WNyWXFazHpY00fRUoClSBresX4JzJanrvzaabpq3sPx5Jx2L4YPj4SgGmUcfATitGT9c+8Dqckw+DTnMdveAnO36DCsS3cWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VU0cPHtN; arc=fail smtp.client-ip=40.107.244.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VU0cPHtN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIlj0fHMo3fj3h+29XH697RchEJeN20ae/GaX6a5DKlJIuph0H3HCn9J/b3LoM4reTRZd1I7u98+xLhYyhSLP1/l3uKr4a3l2/cVTy41wFer2Ezbl/7s/bPfktTyQLxRIa8azEsj/nihLV+EBuutCBtVbWsUZoQMypDhfop9To1xp3A7yNlgzJogZ9LTK+JACtOHyBZa5/M1z2Bqfv5RFjHyz9+sI6tewtLsaqIPCC+PYWDP0joYVw9JhE7pc1ezss1UItrNImQwbRn72BQLYlCQXOtrm2ZijMjC/UNdz3AB9ER+bP+nnYcpDOklwnhHnMJnLexrvz3wj79p8Ip8TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VWh+6Fwkqhb3TeUdfTwIzN5u9CLjuELsjlprNlGAsg=;
 b=WxzD7Tp2hQR2TnRTRD86fvjyDDNSIwk2AmFDew2MToOb8dWLJjW1wGDzHM9ltC+eGmQ3bu4JnJmcf9b9nCgeDv3EbwEsWs8G2DAPZzQzbC6II/SPzhyq3dzVJ6HwONOTJBa+nfVsAXElnZ4ULPoYxHsnKB9qgD1gWKSDPjhUJhns+QtW7+/pMHrZVYg0CfvKY1Vt4TRbCBnQoT7J28RypRt5oUE/x3Rc50xgvTA1G2S+kXKXnApFaZbuiP3ibmESrtXI0OfZ8TpwuDEXO+QgfBihk7p6oviEsVgcdUcQPVqkrdvqwcguy5r3cnGNCQZKpbuWl7fNr8IM0vxA9i6uhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VWh+6Fwkqhb3TeUdfTwIzN5u9CLjuELsjlprNlGAsg=;
 b=VU0cPHtNiosN2usJPxJb5PnmI6JP1UAbYnSZjj4J3XImYQEFjYino9obgzdN6U3LOR/SZizmQ02vp9ZYrwVQb3w4qSYeskEsBJ8C8iBwwdhphVLNFE9cHnho0RmVhsIY0W/VnkAkfsRXMB02WZlXQ4HUVeZAeg3ha4t5K3LRjI2LFEfkMPsCTh8Xp67we7t1+ctLO6O0jki+R+T4I98MUI/moFqsmKjhJJxnC9bokrxKBPxVFgZpvxn24VQtfMCbgF+NApLmDQF5xhXRE6A7YN3N/E+/MbyITgj5i55oiWsyfnbu0ybsbv4BUcRlX8nNbeWd/GL2LayA5+k28lw35Q==
Received: from PH7P223CA0006.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::27)
 by SA1PR12MB7101.namprd12.prod.outlook.com (2603:10b6:806:29d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Sun, 4 May
 2025 16:54:35 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:510:338:cafe::5a) by PH7P223CA0006.outlook.office365.com
 (2603:10b6:510:338::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.27 via Frontend Transport; Sun,
 4 May 2025 16:54:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 4 May 2025 16:54:35 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 4 May 2025
 09:54:25 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by drhqmail203.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 4 May
 2025 09:54:24 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 4 May 2025 09:54:22 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <dan.carpenter@linaro.org>,
	<platform-driver-x86@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 1/1] platform/mellanox: mlxreg-dpu: Fix smatch warnings
Date: Sun, 4 May 2025 19:54:04 +0300
Message-ID: <20250504165404.6877-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|SA1PR12MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b5b8370-2a66-4fae-7152-08dd8b2c596b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nLZsFv7H4vBeXNDfkW+eaQtNHeF5s22o06JFrDs5TBSs+pYbhfZeAEOziBz5?=
 =?us-ascii?Q?TDEaTHQK+hEq8Uuf1DRjJu4lNYG8mTIrdQD3NPOekQOYPDLuPPnIvlmR2Ofn?=
 =?us-ascii?Q?MpKw8R5Kpu7G3DgTTpK7g381qnSucLioSgYEKG9Awtczep07RzKROdk959BD?=
 =?us-ascii?Q?IouNWiIoB0ORHOrqvmDc7QFgWcdwMXzjweUJ7D/uZX8M/YeSlyUngvWJrA2t?=
 =?us-ascii?Q?LnkUL08TdEB0d8dPZltfEVStusl6TdE9vvbH+GMGhKBvnOlUyuc9F7d8e3nk?=
 =?us-ascii?Q?90BMCtCKZtgFrOBlG0/oOp8+ZdfpsRz5VCwVEg29neFQif4SAswxOs9YaNf3?=
 =?us-ascii?Q?pMhviyP1Pl8kVmMu2OwAg6zcs9x3NtnZGWQ1NRmBoysEcny17uMnVUw2O3Wo?=
 =?us-ascii?Q?bG2v1zg1TMK4hGSVMtm7zbmlOOcLsGpXPP2k2B3/stXxF6JSNQNQsMtkLydd?=
 =?us-ascii?Q?fcu7/Cx1g6ppZWqO4imzQpCXBD2EjwFiW6z+IdEteGM1fCrIMK5J/6CuW0tk?=
 =?us-ascii?Q?ZijJrA69HkQSnOJc4SXC4MO9KOj2WUQsuUor3NAYtCflfb0xOEkyuf1/tz5r?=
 =?us-ascii?Q?ZdUlPva71L42FaE/m/gfMMKXljK2uKm0+6Vhk7VyrLO6x6Q/eLQWvdvYUHCz?=
 =?us-ascii?Q?H4ibmFHwNzm0R7nzKCIyta/H9bbk81FuoLV77ZDI4bZrv3asL++7Wy31VDeH?=
 =?us-ascii?Q?XZ2i4A7srUFfQYzthNyJkQS6fGxHH/gZGjxmLryZH+RjOnXZBKMLfQQ9lQ19?=
 =?us-ascii?Q?32WCpcqFq6BjF0NjX8nJuE75PDvntGLBhgiUbLmEKkYDHHZ8PgGC7L1ctCCi?=
 =?us-ascii?Q?UHugT0tsElz/lncGVsN96dvGD/eTBFK26BtsJXPigZVGE8XqGIvgjvkjysGA?=
 =?us-ascii?Q?2BlhyuEakEBha+0qRVBc0pZrAHnWgKxUrstiO0GOCzoibuyRDTxiA3OsX0LX?=
 =?us-ascii?Q?IFA1Zjffz8pAu6WAjwQC4tUnPgMNaTt6tnc6bCdnwJdT/1isnaqQHgj70WW9?=
 =?us-ascii?Q?BUp/FkS7BxhKmxsRACiXgxkl8BvOpU5dReMQPPYkmlzBx7ajSiKcOJ++cHFI?=
 =?us-ascii?Q?jgTQ9DpMWJuvr7jz7IZ5hv+U0dXpzlu2AxiY+OWiD+xOzPuVUw6VmmWmPvu1?=
 =?us-ascii?Q?CpHEJy8JLyTek2S/lTdqoqQnoKHlzJsrUDgO8okwgwqDzlhkTsQIGhaA1GZm?=
 =?us-ascii?Q?42Ocot+ioZ4nv2gz7jox+mSQrlX6wFa0FTzyWx+U7E2q8TglEBLV8WdXSuu7?=
 =?us-ascii?Q?2ic2V8h/VDKOMgwELndMxU+04l9oe2dHg7c2RR9PzkIalVqqIM3Gwd2d0vNh?=
 =?us-ascii?Q?UO20uZkX4gr9lZVPTohytGnemPtclfsPBEYYPG24AsYfIlydES+It6dLAeT7?=
 =?us-ascii?Q?ppenPrRj+/VYMxFsmHf+B9wLM8OOUsMV89eGN0zNA17TyqZe7NYyBNrhNGw3?=
 =?us-ascii?Q?4dKXkhf2rEzefeMan6GkM3KBhBoR52un2+zCFFSVtQ2hFWX9az1pwdetsgPn?=
 =?us-ascii?Q?lyIRAe3Hqu911kWIYIKw7sL7rVxsg5tujnQ7?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2025 16:54:35.0457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5b8370-2a66-4fae-7152-08dd8b2c596b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7101

Add missed call to release adapter.
Remove wrong error pointer conversion.

Fixes: 3e75f2954116 ("platform/mellanox: mlxreg-dpu: Add initial support for Nvidia DPU")
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlxreg-dpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-dpu.c b/drivers/platform/mellanox/mlxreg-dpu.c
index 277e4b8cc5cb..805b9bfbc85f 100644
--- a/drivers/platform/mellanox/mlxreg-dpu.c
+++ b/drivers/platform/mellanox/mlxreg-dpu.c
@@ -535,8 +535,10 @@ static int mlxreg_dpu_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 
 	mlxreg_dpu = devm_kzalloc(&pdev->dev, sizeof(*mlxreg_dpu), GFP_KERNEL);
-	if (!mlxreg_dpu)
+	if (!mlxreg_dpu) {
+		i2c_put_adapter(data->hpdev.adapter);
 		return -ENOMEM;
+	}
 
 	/* Create device at the top of DPU I2C tree. */
 	data->hpdev.client = i2c_new_client_device(data->hpdev.adapter,
@@ -562,7 +564,6 @@ static int mlxreg_dpu_probe(struct platform_device *pdev)
 	if (err) {
 		dev_err(&pdev->dev, "Failed to sync regmap for client %s at bus %d at addr 0x%02x\n",
 			data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo->addr);
-		err = PTR_ERR(regmap);
 		goto regcache_sync_fail;
 	}
 
-- 
2.44.0

