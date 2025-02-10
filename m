Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314541B86F7
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Feb 2025 20:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739219752; cv=fail; b=Tc9u8m7wcwGECIV6pPROo/q7vLGRndeBOuEVCFKdaKIjxRwLoUYKY7Y8H36Kn3K3PHgPiIgj+NYordOy+py421wjqAHPHCRzhqQgr9PVH9aRwGOEdpUkJU9XQy0yUU5npF5IqLXushpdGhdASUSmcA2BG2yepdJDdSR6Xb0IJeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739219752; c=relaxed/simple;
	bh=xVDPldcY3kuxmX2mxWjQXFhzxFAJF4hitjlbVcgs8l8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gKQk0UlzuNeJAzhE8FoDiu3Viwg7DQRc/fTEkUXN4/YxW7DIAhty5o146rd7+VDfSYlO29AbOdIZ6NFI8wzgNofZdTu3ViaY2NR/0zeYN4JFtuWkNAuTKu1aVVboEZ3zEks6Pa5vqSn2JHBYU+8nFwDrsjP1pNAaxZIAsvn9BaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fNcE5ptF; arc=fail smtp.client-ip=40.107.237.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fNcE5ptF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DM6g2B+c3EF909DD0Wo0gQhkUpXrHsBjJaODgwDvJmQ2IPob8BFmHQw1allAdiu5qfvq+OB/Ds5BRAgHOLAJ2rns3VFZRa6pFJ7DCMThlWyCxOu6+8sNf5DM+oWf0n4GxupD+6Xo8F4CoME99hpNiKstu3KmOTomHuf0fN8gthLHocw1qzHJFwWi7XfauKPs8JyJxTfZeVgcRCEisC3tAhFIFBO6D8m7mgc0H7I+yIWz6/MG48iwymaYD+WlyBpII21P4TH7Z6EpBBpuv16SnnlW2PqeKBv8vIAoLpWmLEdJu0y6lIrgXKY60DahFDPInBkV0GC8h4ci7ZS6pFUYew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGuxachURQtj+5SHd1lDgskFgz9W7RBkrjxIl+rnEtA=;
 b=ra4UrOcie1CxqPZoVqgaJf8jHOn77UziJvHGWHWFahEianLKxQLYNP9i+u86VHYq1nDF8oe2f+WW7HV8Bpg34osCsKsvGLMT+Ka4SL6VL8CX8KCluCzlwSzb3NsbsjBxG2DR9QRCMPNfgdz7fuFrK9lbRlGSBRrfztQhojbkfK3j1MdILIvmxPm9++kgyJD9jOpoBwfbNuIgWBFQiRz02EglKrfQCQ+Tzjwr1mI/9kUcYN53pGuqe80zGA5wjdfoEbmVXaAMeJrDRHrlareJ+bGtggYN10jYj+AOmsIqWcEHb7sO5f82d4rnomUKYjXCPqbxCyMYtPFlOehSiIAhTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGuxachURQtj+5SHd1lDgskFgz9W7RBkrjxIl+rnEtA=;
 b=fNcE5ptFGFhAkU/FsRufCkhG+A/bK4b19vDx9Tbf/uL/LTaqp0Zt0tsEYOcqMAh9+NpsN0+S17IkphaXA/f7UYkKJ2MGWAL7U6X+QcoLkhigx1ugOU9TGHBIPtKnbwaGppbNRhvd36UDhqVOWsC9aUx4yXsuGZreGjYoSx0p3C5JtKxjq/5RrOrDDUKUZSEFwrAMKbsZRsj1nbzncuqp8/1dqcT273Ju5VprKv4HipHb8/P8NPpIGfK4Mqhr0yeTi+8hTypPb3CF4E9w7zqZMkuBuu9SA/tr5dllqMaF6aieYbim09B+F+/giLtonJ4Or0muTpRaiXwfGdVXJvEoNQ==
Received: from SJ0PR03CA0153.namprd03.prod.outlook.com (2603:10b6:a03:338::8)
 by SA1PR12MB9470.namprd12.prod.outlook.com (2603:10b6:806:459::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 20:35:47 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::9e) by SJ0PR03CA0153.outlook.office365.com
 (2603:10b6:a03:338::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Mon,
 10 Feb 2025 20:35:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Mon, 10 Feb 2025 20:35:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 10 Feb
 2025 12:35:24 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Feb 2025 12:35:22 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH 1/1] MAINTAINERS: Add documentation reference for Mellanox platform
Date: Mon, 10 Feb 2025 22:34:45 +0200
Message-ID: <20250210203451.29712-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|SA1PR12MB9470:EE_
X-MS-Office365-Filtering-Correlation-Id: c18f3474-0c56-4355-29d0-08dd4a127ffd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWtGYmI5WEJ6aTZJVVVkMk53cXA5azNKTXhCMFBPVnRVOE9OTExGUng1cEVp?=
 =?utf-8?B?b0tYZkQ4ajFXVlVtWU45QmZUSUoyb2JaMjUvOEVsRjJBQWN0QlN5NU5ONm1W?=
 =?utf-8?B?VlRrV005QmlVUjZQck5xdm56QUhBVWJpZGRIWGo1R09jWmorWnEzV2N5Sis5?=
 =?utf-8?B?QkNPdkduRmp0SXZlZEUzMXFJa240WEgrdXZrcHg5ZXZtV1dtVUJ1b1hrdG8r?=
 =?utf-8?B?d0pXcFIxcE52MUd4RHpFZEhjaTdGUnVOVHdGR0YvaGJYQkpLdlFDNDBFS1dE?=
 =?utf-8?B?Q3ZCVzVRRkg2dFFwQ1dzVkRidVpPVXJzMW00Z0FPeDErM3d0a1IrUlhKTHl0?=
 =?utf-8?B?TlhQQUhtQnZKTDZ3UWhEcktwSlRGeGVlMldhZU9CcGxWN0xXOGJSNjFMRFVN?=
 =?utf-8?B?MkhVT1FlVngyYVhHTjlNR2F6Y0hJZmV0MXRpbGN2Q2lwelZkcEFKbll6aGJZ?=
 =?utf-8?B?TWlFL21paXV1NlY1WlUxWkRkdTdPSWNkWlpLRVpQZnNobUVFaDFJa1JpVHE4?=
 =?utf-8?B?N1VIUWpPM2lxYTRhTHZ4UVJpM0ZSemFlUVU1R0pVMyswaHVGV2tjVit5bTdJ?=
 =?utf-8?B?Q0taUDJsTlFUSElUNHN4MnZvMzIweCtBM0s5UkNWZzNvMVRlajdkUHFMQWNz?=
 =?utf-8?B?MHlMbU9VYnpYSGRJbnhycFRRb2U2Qk52ZTdCQ29kaGVSbmZjbnBQWlcxVy9t?=
 =?utf-8?B?UG9uWlNwbzhIc2Jva2xMRk9nc0w2WWZGOHFnNmNNWWR3V1VzZU9BcTU1ZG5n?=
 =?utf-8?B?YkROazdTc2NHRk4rSkx1bWhsTlBlTlpWSzVUM2ZjK2tCamRCUWVwNHBCVHFF?=
 =?utf-8?B?RnhxazFLODg0WTRLSEdlSDZiREE5R2FKcVZLYmxZMTByTnM1Vm1pUWJRbTI2?=
 =?utf-8?B?dGQ2OVhpcWdxWGRjSTZKM2lUYlg5WVZzbXlRcUlrb0hIemtjQzlZelFEVEd2?=
 =?utf-8?B?dXBrQ0V4cUpDcDRocUM4b3hVb3dVWjExTjJKNVJsejZsY2MwV2lUQisxa2VG?=
 =?utf-8?B?ZmFsL1JvWUtqL2d4Y1VDamNlaW00RXJoQ0plNysyM2NZUGpZTGltcXZqWW5u?=
 =?utf-8?B?VnhwNHBwdHVyRG1oUzFuWS9UYjEyMUlrQjNUSlBLWVZQaU5mZ3JleEcvc1lC?=
 =?utf-8?B?UG9tWW1LT3JncGd5ZWhsc01FclFCSmsyT251U0lZZkovYkJTdnBVSzZreEZi?=
 =?utf-8?B?bkd3bmY1dGt5Q0NRcTY0cTljVitvVmNtZm0xZzFUdHJ6WHNWZmpEcUxRZjU3?=
 =?utf-8?B?SzY0TWpFY0ZzZHI0T1VZaDFackxrcDNJSWczdzliaml3S2huWEVzakR5V08v?=
 =?utf-8?B?Nk5NTGVCR1UwekIwMUt0ZWErT0c4cFBaT0VrQjAxeXltcFh5TDE4OFpsMWRj?=
 =?utf-8?B?WnJ2TklXUWx6WC9POEpJbjBON0hPMkQ0VS9FeUZJOWtNb3IvZXBvcUU3V0xM?=
 =?utf-8?B?U2d5dHc5alpQdU1jZXUwcEJFb2NUQk1MSTJaVXFkVGJ4Z3F2eUlkRUV4dFFJ?=
 =?utf-8?B?MGFWcHh6UjB6cytXaDBZcXBmZTRpc0tJVFYyUXkvNFg0NHI1MDBWU2MxL0dt?=
 =?utf-8?B?Rmd0dFBGVWluUmNDR1FmdFpLYTIxSXJ0L3MyS05vMXVZYklyWmdMd2JXNm5n?=
 =?utf-8?B?QjBKcW1mOXlWenBGK0JRVVkydDFDRWVpUUZsS2JuMjVMZ09JUHhaL3IvdEdN?=
 =?utf-8?B?WGlNWm80RkZjRlRMSUVZVUlDaG85dmwwbjE0ZGtSZlhaM1dIVlBITWlraVRm?=
 =?utf-8?B?QU8wS1A2ZEFVbGR4bHkxbXVWTGdhVXVVLzJFdlZyR0RWQmRnK3VraGtLVEt6?=
 =?utf-8?B?bVk2TVpvNCtRaUVVM25TaXJlSERrRWpQVG9CcGc0eW5MVFhCSy9xc0FsdUZO?=
 =?utf-8?B?Nlo1L3BxNXBDMVRjTEYzZm81Q2dncXpmN2ZhTmZINHNEMXUyU1ErRlIrVzNa?=
 =?utf-8?B?U21XZlZTY1FHOW4ySDFYVmdIQWlLaE5KMFI0a01jTVUrTWYyMzhpQkQ2OVdt?=
 =?utf-8?Q?A4V58jxW0RvR4yDFk7G79vJKu0YICE=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 20:35:47.2392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c18f3474-0c56-4355-29d0-08dd4a127ffd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9470

Add reference for Documentation/ABI/stable/sysfs-driver-mlxreg-io
under "MELLANOX HARDWARE PLATFORM SUPPORT".

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502032336.lauIV68J-lkp@intel.com/
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1b1031dfa481..7c8a671f28c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15028,6 +15028,7 @@ M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
 M:	Vadim Pasternak <vadimp@nvidia.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Supported
+F:	Documentation/ABI/stable/sysfs-driver-mlxreg-io
 F:	Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
 F:	drivers/platform/mellanox/
 F:	include/linux/platform_data/mlxreg.h
-- 
2.44.0

