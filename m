Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD15973451
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 08:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737014519; cv=fail; b=sY9eCc8gtbPq48ot829qp0aB2lnsFQw9BTGayZAoa0hxvgEEW6ElFCw8AGklhmJeBxhuyKhjjSqULm5LJYj7M/Kt8+GfFjDU0TAAhljaye3iMQWdGQgO780VSblkh/zpqJFSXXQifQqt5r6EeytjunshZROai2FYFbwlMdL4U7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737014519; c=relaxed/simple;
	bh=jpgRkvZHWFaOvkOp3LipBeccOCHioe30jgC3EyIBN74=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gvYyzHS7waHPnGT3ILaXi+q7Y1ZA9e8E6UZy+YOrqZk1gysuhNc3D233fpG7tet3fFS4JBuhB1me/TL4dRoz46CEpJn5tVIIzaRzEav1sOucwCHKf0N59gDZZEsoc88sFLVUtD0/vfSe+lK/YGmhMeyb2YPhDXZdV8LhWh+HYZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qvOiLltG; arc=fail smtp.client-ip=40.107.243.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qvOiLltG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDNkf7kSuqgguyyytscD3VyUeHUem99uMCVxoFt1C+Msm01nZK7cjDWAb/3MClPF4HclU0vjuZxWdPI2PsvuU8FD4lDEnMAi//+vncM0DCO6vvS6p0UxXncqwejcxq6kYL7HYBgDXIJb1U9x4z3d7cTyKcMvODkXWbMPzE+TBH4QTwiP7ViYdnjwlKb73BKzg1tYderAho0dy0p2QlxBVxZJtD7/QO3frIkDjtkyKSABX/9YgMu4298L83kCG3b+wjr5471mUrkZqADX94RZTAbDAWi3nz3rXJe8GIj27a3hKJ98fkPIxbjx6mRYINZaNNV/iLQ/nbS80Jjh6u4ivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugpdNoqPemrz4/LI+kLB4b6vqOlEv1J8PKjIwX1hHBs=;
 b=REubibDxIV0x2UrF6B9MVLw/EG2SsyV4bXtWmRKWkn8zk2r6/YcEGaKglcOSjrzO7i7z3qHMf6OyCLXkWcZxmL4tUgZt+0TmnCVYQ7HTI/BaCmquZJnFSpNO6juVswIrEE2tG121MZhI3LL01V1c5KVZqrhqFwCXQFVd7/94HAhfo5ZWcE6AxEtH/BaC5r1Ah0D3jDuaUDbge2pQ4OeZkCXspcumEYyQ6/pBD+infLdDvK5KrFjaR5LQZXWTMYBopeVzKjaKOn8wVR/kEIvytAxlrjZLCsIm/6o+ntxh8G8ctUEGi79WykLby5JNW4lyrKRalcsK8gCf0GOxMDELeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugpdNoqPemrz4/LI+kLB4b6vqOlEv1J8PKjIwX1hHBs=;
 b=qvOiLltGx/nRXZksI/5TxMJW/r7p93G3hFFcwpC9BCMJnYdC8bZEP05Q7tOqhyFM2wRGv3czmx2Mvvr8Ln+RjktqrwdFQkyKRqP4hM5tWAULlGN1qSZNsZ0oDwWp2XPB+XFNcxVn49MlsJXVrMs8bFL7iey9jvk/z4vHzQpMydpAbw5yuJqAqR0iYuAEqP+Sls3CE6gYxL8kuMVnp8tneohK7hL47uOm8S7f9rdm9vsmpsHkOeBcsLKc9JVjElqOJuJdOtNsSiaicYzuN9rZ23/m9njdsxUmG0k7zK7GleaoH3aF0Ft0+2dbJZtdi7HoIvU2TVdqK1MXgLqdlORpEA==
Received: from CH0PR03CA0064.namprd03.prod.outlook.com (2603:10b6:610:cc::9)
 by DM4PR12MB7622.namprd12.prod.outlook.com (2603:10b6:8:109::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 08:01:50 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:cc:cafe::2b) by CH0PR03CA0064.outlook.office365.com
 (2603:10b6:610:cc::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Thu,
 16 Jan 2025 08:01:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.0 via Frontend Transport; Thu, 16 Jan 2025 08:01:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 16 Jan
 2025 00:01:35 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 16 Jan 2025 00:01:33 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v3 07/10] platform: mellanox: Introduce support of Nvidia smart switch
Date: Thu, 16 Jan 2025 09:59:13 +0200
Message-ID: <20250116075919.34270-8-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250116075919.34270-1-vadimp@nvidia.com>
References: <20250116075919.34270-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|DM4PR12MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: a11cf10f-3a36-4574-157a-08dd36040831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NklDK0dVQ1o0bklRQ29IRWMrazZjUE9FS3pLd2s1T0M1THpVUDFMOEIzN1hx?=
 =?utf-8?B?SGZ2QURheUU2Ulo0cnlhQkQ4bTJzM1RncDh2Qjk2REN3V3dHaGh5MXVyV3Y4?=
 =?utf-8?B?U3RiQmRwdHBQVEpkOUc3V1FhcFIwUDVqd0ZoaDYwbjNHdytOeWhGYTB1ZW9u?=
 =?utf-8?B?T0lxNzZud0lobkRpWVdnLzEydjA0UE5IdlFXTnRkT1U2d1krWFZXYTI2L3N6?=
 =?utf-8?B?c3Rhb1VGaFpoOVpvNVFLWTI5RzJlakxSV3prMm5kQlR2TzY4TzFvMU5wREEx?=
 =?utf-8?B?RFptZlZpb2phQm5xMDdVWnI0L0xRdHQxd0xvSWc5QUxvaWcwR0cwdW1mUjZu?=
 =?utf-8?B?bUVXV0dCbitPeTNUNTY4eHlGUXBQY0xIdzV3bU0vVjJJbVBpY3pzT3M5TDdp?=
 =?utf-8?B?VkNQTVNWcWNRc2YrSXltT0pQamIxZWIwdkV1Wm9sdjRMSElnOWc4MzIwQ3ps?=
 =?utf-8?B?YWFHalRzVjg5empxOE5xSGVpT2M4Skw5Wk1acFJabTFRaEhFQ3FYaXJoWm5x?=
 =?utf-8?B?RlJJMzN0N0FnR2wwRk5iR21YNFkrd3pzdGpRKzJCNnE5YWROTmFHMmFzNHh2?=
 =?utf-8?B?MWtHNGlBTFQxVm1zd011ZjNFK0NzRjZiejhYVVFRdTR5b3VtVURPdndxZW5R?=
 =?utf-8?B?NFRjMFl6Njc1QmhtWXJLbjVQdjNOQ0t3ZUlJd2pwdVBIejJMdVBQTlNDUWFR?=
 =?utf-8?B?ZXVmL3NqcFFKU3R1bXdxcFZOMkpGS3JjQTQ3bmE5a2VocE8vbXdwcjlFb0NT?=
 =?utf-8?B?Rno4VGVlTTFOMHJIbG9lRE1QNlRZRFlsSk0xcVJmWWw3UnB5eE9ETkNrc080?=
 =?utf-8?B?WmdERHVoRWFKMnEvMlJHbWJlSjFrdDhodkpwQXFWSGhqQ1NXam5vZWF3anN4?=
 =?utf-8?B?cjQ1c3lXeTJFQmNYYUVkdzJPdmdGMlVzcHJLdWs2OVZGdG95ZXBhQWJPKzNR?=
 =?utf-8?B?cWFiemI4SlRib0NMRTF4YmFuWGhaWTJRSmw3bVpEY0dCOWRuVldFZjNoSGxQ?=
 =?utf-8?B?U20rK0RUMTdueVFmT01LTTVnVWtEbVZoN1lZWHJVY2JwRWYzcnhmZGxYckxt?=
 =?utf-8?B?K1dCU1JwM21EMjA0TFFjVXUvNElSZlRYNWZPTENXT3RmYzRuVGRYazJsc3I4?=
 =?utf-8?B?eHM3aGc4em1SVTRlcWtlVEcxZWJlOUhEUzFqK0JTczlSOHJkcllYTkRTdCtj?=
 =?utf-8?B?aUVOSHZmT2crdVZmYzV5eXRBVGU1NDk0K0xRSlJoSE40ZXZYSCtNa1E4em42?=
 =?utf-8?B?MzBucThJbFRjeVVJemJBdWwyYU43d2paYXlUSG5Bd3pQdldSSk9NV09tU0Rr?=
 =?utf-8?B?YjF5NzRNZm9aSmkrQXRGNm5XQlJDS25lRE9KOG1XY01xd2wvUUV3amE3dEJl?=
 =?utf-8?B?R0taU0VwdGxlTW1Ob2xhcEpZMmxERmJlV2swY21ub0NmcW9JaWtJcXFTQmd3?=
 =?utf-8?B?alRpaTV0b0xHcGY0VXp6cldQRFM3dDlQWVJHZnFTaC8zU0dZbWlFZTZCM3FF?=
 =?utf-8?B?bWFZMUZTWmFKc2pjVkxoMkQ0MUR3RklicVNFaW5WMjF0b2pqVzJZbXZ0c0Nm?=
 =?utf-8?B?KzRwank0Vkd5YjZZNk05MUs1YmE4WDVhRlRlOFlJY051SlNpTzB0d2J1cWxH?=
 =?utf-8?B?clB4dkJBeCtLUDBVVkZORjZ3b1pUM2tkRzQydGZGeDl0ajgrUVJGSXU2cFM1?=
 =?utf-8?B?OW5BUGcvMDRPMi8xTDJ0dDN4cVNNNzVxQ2hKdGk3bXFNaHhMcCtJMTExYVZV?=
 =?utf-8?B?UXEzNHZJS0ZMNmgxWE1JWExiVE54VHRVTkkwMUVrUTJYZHRmZGJ1VzJVY3dx?=
 =?utf-8?B?N1ZvQWtnQUlMMmJYOE1ia3lTVVRnYkEvM3o0VEwvL0VMU0gxcG56cGxLSUti?=
 =?utf-8?B?MUQvb3k5TFg1Vkh4L0FIQjRzSGFqYWhGWkRra3RRa2Z6d0l5enpQMUV3QVFP?=
 =?utf-8?B?TFdwUDNVWFRuU0hLc2FUenhJNzd6ZENWNWpzNSsvZUFyd3NSOEtTdFhNVUpM?=
 =?utf-8?Q?JoeDHuF66BswKBZCxxWpHy5mgZjBGc=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 08:01:49.9963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a11cf10f-3a36-4574-157a-08dd36040831
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7622

Provide platform support for Nvidia Smart Switch SN4280.

The Smart Switch equipped with:
- Nvidia COME module based on AMD EPYC™ Embedded 3451 CPU.
- Nvidia Spectrum-3 ASIC.
- Four DPUs, each equipped with Nvidia BF3 ARM based processor and
  with Lattice LFD2NX-40 FPGA device.
- 28xQSFP-DD external ports.
- Two power supplies.
- Four cooling drawers.

Introduce configuration structures for the new systems to allow proper
activation of the required platform drivers.

Reviewed-by: Ciju Rajan K <crajank@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlx-platform.c | 1965 +++++++++++++++++++---
 1 file changed, 1711 insertions(+), 254 deletions(-)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index bd3bb06ff8f2..9d237852d3e0 100644
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
+	.counter = ARRAY_SIZE(mlxplat_mlxcpld_smart_switch_items),
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
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK
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
@@ -5431,6 +6816,15 @@
 	  MLXPLAT_CPLD_AGGR_MASK_LC_LOW },
 };
 
+static const struct reg_default mlxplat_mlxcpld_regmap_smart_switch[] = {
+	{ MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET, 0x00 },
+	{ MLXPLAT_CPLD_LPC_REG_WD1_ACT_OFFSET, 0x00 },
+	{ MLXPLAT_CPLD_LPC_REG_WD2_ACT_OFFSET, 0x00 },
+	{ MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET, 0x00 },
+	{ MLXPLAT_CPLD_LPC_REG_AGGRCX_MASK_OFFSET,
+	  MLXPLAT_CPLD_LPC_SM_SW_MASK },
+};
+
 struct mlxplat_mlxcpld_regmap_context {
 	void __iomem *base;
 };
@@ -5539,6 +6933,20 @@
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
@@ -5550,6 +6958,7 @@
 static struct mlxreg_core_platform_data *mlxplat_fan;
 static struct mlxreg_core_platform_data
 	*mlxplat_wd_data[MLXPLAT_CPLD_WD_MAX_DEVS];
+static struct mlxreg_core_data *mlxplat_dpu_data[MLXPLAT_CPLD_DPU_MAX_DEVS];
 static const struct regmap_config *mlxplat_regmap_config;
 static struct pci_dev *lpc_bridge;
 static struct pci_dev *i2c_bridge;
@@ -5921,6 +7330,29 @@
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
+	for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type2); i++)
+		mlxplat_wd_data[i] = &mlxplat_mlxcpld_wd_set_type2[i];
+	for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_smart_switch_dpu_data); i++)
+		mlxplat_dpu_data[i] = &mlxplat_mlxcpld_smart_switch_dpu_data[i];
+	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
+	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_smart_switch;
+
+	return mlxplat_register_platform_device();
+}
+
 static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 	{
 		.callback = mlxplat_dmi_default_wc_matched,
@@ -6016,6 +7448,12 @@
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
@@ -6390,8 +7828,25 @@
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
+	while (--i >= 0)
+		platform_device_unregister(priv->pdev_dpu[i]);
 fail_platform_wd_register:
 	while (--i >= 0)
 		platform_device_unregister(priv->pdev_wd[i]);
@@ -6412,6 +7867,8 @@
 {
 	int i;
 
+	for (i = MLXPLAT_CPLD_DPU_MAX_DEVS - 1; i >= 0 ; i--)
+		platform_device_unregister(priv->pdev_dpu[i]);
 	for (i = MLXPLAT_CPLD_WD_MAX_DEVS - 1; i >= 0 ; i--)
 		platform_device_unregister(priv->pdev_wd[i]);
 	if (priv->pdev_fan)
