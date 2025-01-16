Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2048.outbound.protection.outlook.com [40.107.236.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2DE381AA
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 08:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737014607; cv=fail; b=IxbToihXBG5Y9YH25QQt44r5DY82q3xIq+52qz9SSVIPxhqD6fvwJ1/gMzCq20pI4J0LrMCXKXqnPlY3FnHKR7cFfzFc9G68DFqEqO9rlUdT6pezjAfwQsxTp0o0BJHfL1Ru+8LARedNw0o4efrCEb6xbiHPkoL+it+LUXXoaaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737014607; c=relaxed/simple;
	bh=29E62jaDXqCKIB0V/AFpPgsc2C+LlZ3Oe3hOmXkDBJM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lbPB3A0JNsqGVWjo5wAFiMUlkhBlnSeaf0lZpgpfhpOMtQxd4dO4w07L0mYILVwXVLvrGjSPNRn0oAlBgnaXX/Qo7GwMb6+WEoBl4ic765dzyq/eCIKXW81wSnQSF5Hxq6djoCvSV6SEeCCxtoxAMmjFkG1Nx7tF22QuzMkrRoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EjhADf9W; arc=fail smtp.client-ip=40.107.236.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EjhADf9W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cb1zmLjFpzSa5h+QLdQY/VWTqcPJOO1pYv4BNkcoSLNnSnM9wM/j5yIR2N2zaVudyZPNQCTXm1kM6xj1iQAVEW7PHNDFdqr1xS1TJ5kQgKvnoPAS5ggocijjTTM1RbPi9rRqCrWIPe/kMG4JJ2TezeIYOm44yK+CCRzNbZrb69tWVuWR4IskCwqnZlekreomwjiwIs/U8R6J8fM9XBABrNqsPkv9m+oZjeouqU1f24oe/AabkknBrJDBPd+nRNFhvfnTDWNTREpIC8Cvbqe9dMR9KR0FIchIqStU4K9gA0wN4NaCR2Lz4h1aj+uNBBnP1FcCleXRUQQHed+VA+fr4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6S2fwU+ji8u6GbAPz/hXm4Hcdcs6F56f7Dpiog+3EE=;
 b=Q6H1hjCL9kl4l9xt9a9XzmpzIuC1TqEChsdmIyEsUDZNw1ZRTDnodxq+IX8Ckueg6/dsYnFvcUQt8FYIoIM5w/Hg5wuaIGChxRn6Ebl82OyXNjFKF3rXblcGjr9TLuGtcRKbfm6c6KtDlQMLGbyT7ZtCidMtt6zJR/sS0AA2TkKE4XGHd8TbGkwPJVPF4yjpo6WQMhrFPhIOQdPPkOW5OIc8kUiwIJm7hkFdTPgTpwcLI4mlOLwFxZUngQIXIDyZio7V19PURJs/Tiybp1w5s51u+8WHz/povc7HGRnC3FbvPirBEo8NhD+Gt3q7uVbQ4687EmldiMkrQVo+a33vnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6S2fwU+ji8u6GbAPz/hXm4Hcdcs6F56f7Dpiog+3EE=;
 b=EjhADf9WxHg7kXs3Ow5Q4daHisJ5FMUrMl8XK3OMR0beSoZqPoPClmeKyCJCJ53XVnYo8j1wrPetDudIgVEQ49Imib1JyPlSs7fOcuA4LHuY7ht7wu/TRJ9c9N4NcmXi+ziimNyZo7XO/EitYKB5r6ZLfMfha4dVA9ukuApjB+ZelQOpCvoS1jiIxPRoCJ1PwJ7raVfcw5ABRTIwr/39BlggarGyb0ptw0S/w2Hx5xNhA9IhdcerzMQ0Va9SnDpdV5Sw6HHC5nYhDoO17r2gaZ85+trCuUF67yQ25lZqeB7vGe8yTlyGQwR864xNsHj0Pc3wKPChyrIaW0IAjkUrlQ==
Received: from CH5PR03CA0012.namprd03.prod.outlook.com (2603:10b6:610:1f1::9)
 by LV3PR12MB9355.namprd12.prod.outlook.com (2603:10b6:408:216::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 08:03:20 +0000
Received: from CH3PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:610:1f1:cafe::76) by CH5PR03CA0012.outlook.office365.com
 (2603:10b6:610:1f1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.14 via Frontend Transport; Thu,
 16 Jan 2025 08:03:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF00000016.mail.protection.outlook.com (10.167.244.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.0 via Frontend Transport; Thu, 16 Jan 2025 08:03:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 16 Jan
 2025 00:03:07 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 16 Jan 2025 00:03:05 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v3 10/10] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
Date: Thu, 16 Jan 2025 09:59:16 +0200
Message-ID: <20250116075919.34270-11-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000016:EE_|LV3PR12MB9355:EE_
X-MS-Office365-Filtering-Correlation-Id: c383909b-30cf-40ba-127f-08dd36043de4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bQHEX3j97jcpAIpTIj2WIYwsBaHG3JZGh1ZiDRmn4Y6NSlSzDKmTR08U7yq9?=
 =?us-ascii?Q?Nd+ZxIXRcP3QIZbuTY8IMvtBAk2qEWsOKhBSk7DjJ67o92Al0DaiDkOPrtlo?=
 =?us-ascii?Q?sEfrveUAJ58Vbb7kR9Q+rwGXkjdvQfzGbBBWGgd96P9nWnmjSdjkvRvm2mzI?=
 =?us-ascii?Q?kM0c8xAoYi8+pT2qEmiGeFy0GH0RvpcQusz1kTjVr49bKooRlyqoOplUb5LY?=
 =?us-ascii?Q?VqzvZtjt99StBPtBORCcnq5jifE1JEjkC9nHt5JW6S72vMGKGnbvp57ik0qy?=
 =?us-ascii?Q?KGfMxPXKyHhqv2v/Uy2Oqa4YUf82qon2p7mj87B1zOLRLUHSCwTLLP9CUwXg?=
 =?us-ascii?Q?YPzKcZx13okJHJ+JeUH1Y4IsL0iud7U1FnRioNSv+VqsS2bp4zVTl1y//qbB?=
 =?us-ascii?Q?Tc4LjGnhYaFsftPJRHhfM6ro65+Z6Zqpz3tgwITUzVUG1xAy+d9qpC/o/Adg?=
 =?us-ascii?Q?Ety2yhGtvVfIQH/MiZuy5CJDfHOzvXxVdREgqR5MAunFpRloC4I5BvBTPQ1W?=
 =?us-ascii?Q?8YW7DKvQOPJ/Kvm+S2WmNzYmEafkUZ2TVBSnZOXxL0LQ4OPoS6z8cVif5tvp?=
 =?us-ascii?Q?jTv8aJte7BkhUpKIpoM1Ixoj7lN9b89X8C6ygvfXQphBCeP+PaRZ5So/JhIZ?=
 =?us-ascii?Q?BwEyuBvXlPhJbsdUo8X1PlOtpEXdlJRLWTv7XrO0wfJR+WLValWGJZ7/r9Fj?=
 =?us-ascii?Q?4MTzlNBcDBXSPT4dO1b/u1GNJum6OIcSRRBTfQjZz0Vz1XdZxrLVbXYRrC6+?=
 =?us-ascii?Q?3fLaV5c5KKhJGFQhH/OkQ/sYjYN1kvnuKDOU0rd1vkGbfq//rDGkEEE++W7+?=
 =?us-ascii?Q?/kmctdYPaV+7O1QXT9Ze3hoS1u/cVqYYV62V2bHfFM8sSznBvOXCxysDkHKg?=
 =?us-ascii?Q?VwH0D99hQyyD9OtWTOOnkfQWNPqxI1mGqHTXgcszxsX83WkvGeX92LCbG1e8?=
 =?us-ascii?Q?PNFSVNvKZDvMUjEboem1kua5bsDzP9ZueiJVxDr09AXg9fBzDzlPTpR082Q+?=
 =?us-ascii?Q?aggDT76C+Ade/k9L6MqwVeWDngtQkTGcYbK6LiHXGuHTuDOvEE61d4okFqhI?=
 =?us-ascii?Q?RLEqtZiRoQpw/T27by5M4+81H1VaJlbZrLsYG9a4kir1tZpziyfjjrbE64oo?=
 =?us-ascii?Q?nu5NLJJNGIVKPHTEFjnEukz4CUsKQLrLElf0e1tgU++61j++iiP9mT4aD9er?=
 =?us-ascii?Q?nCUog4J6gfqvTSNGISALVY9qS1soOeHweM11gJ8hAT4rXGollZy/j/ugD0zH?=
 =?us-ascii?Q?nhj4usefNSw1ITye847GNK1ggjHqcMEzNsSA3TyaDDoUFnHahgGQe+WMyMpP?=
 =?us-ascii?Q?lRfpDSjqyKPdk/If2VTNaZTUKo2B2V06G98qRKnErR8NwsbK683GWpKNXfm4?=
 =?us-ascii?Q?fDZz9wb5bRsCLBvN1rjfeuGF1ESSGLN00unYsMEsQNBSL+sMd4vIU+vu9h5U?=
 =?us-ascii?Q?OlCzuaPILgFWM/YxqpIzOZliA2ZFgDD9v07pHy+MYw1I8NqrRsd/8/xJ15xE?=
 =?us-ascii?Q?ZK+hzO1yr10uJi4=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 08:03:20.1042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c383909b-30cf-40ba-127f-08dd36043de4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9355

Add documentation for the new attributes:
- Request and response for access to protetced flashes:
  "global_wp_request", "global_wp_response".
  Only for systems equipped with BMC - grant can be provided only by
  BMC in case its security policy allows to grant access.
- Request to unlock ASICs, which has been shutdown due-to ASIC thermal
  event: "shutdown_unlock".
- Data processor Units (DPU) boot progress: "boot_progress".
- DPU reset causes: "reset_aux_pwr_or_reload", "reset_dpu_thermal",
  "reset_from_main_board".
- Reset control for DPU components: "perst_rst", "phy_rst", "tpm_rst",
  "usbphy_rst".
- DPU Unified Fabric Manager upgrade - "ufm_upgrade".
- Hardware Id of Data Process Unit board - "dpu_id".

Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 .../ABI/stable/sysfs-driver-mlxreg-io         | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index 2cdfd09123da..ef6526a6de55 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -715,3 +715,99 @@ Description:	This file shows 1 in case the system reset happened due to the
 		switch board.
 
 		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/global_wp_request
+Date:		January 2025
+KernelVersion:	6.14
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file when written 1 activates request to allow access to
+		the write protected flashes. Such request can be performed only
+		for system equipped with BMC (Board Management Controller),
+		which can grant access to protected flashes. In case BMC allows
+		access - it will respond with "global_wp_response". BMC decides
+		regarding time window of granted access. After granted window is
+		expired, BMC will change value back to 0.
+		Default value is 0.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/global_wp_response
+Date:		January 2025
+KernelVersion:	6.14
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file, when set 1, indicates that access to protected
+		flashes have been granted to host CPU by BMC.
+		Default value is 0.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/shutdown_unlock
+Date:		January 2025
+KernelVersion:	6.14
+Contact:	Vadim Pasternak vadimp@nvidia.com
+Description:	When ASICs are getting overheated, system protection
+		hardware mechanism enforces system reboot. After system
+		reboot ASICs come up in locked state. To unlock ASICs,
+		this file should be written 1
+		Default value is 0.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/boot_progress
+Date:		January 2025
+KernelVersion:	6.14
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files show the Data Process Unit board boot progress
+		state. Valid states are:
+		- 4 : OS starting.
+		- 5 : OS running.
+		- 6 : Low-Power Standby.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/dpu_id
+Date:		January 2025
+KernelVersion:	6.14
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file shows hardware Id of Data Process Unit board.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/reset_aux_pwr_or_reload
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/reset_dpu_thermal
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/reset_from_main_board
+Date:		January 2025
+KernelVersion:	6.14
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files show the Data Process Unit board reset cause, as
+		following: reset due to power auxiliary outage or power reload, reset
+		due to thermal shutdown, reset due to request from main board.
+		Value 1 in file means this is reset cause, 0 - otherwise. Only one of
+		the above causes could be 1 at the same time, representing only last
+		reset cause.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/perst_rst
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/phy_rst
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/tpm_rst
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/usbphy_rst
+Date:		January 2025
+KernelVersion:	6.14
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files allow to reset hardware components of Data Process
+		Unit board. Respectively PCI, Ethernet PHY, TPM and USB PHY
+		resets.
+		Default values for all the attributes is 1. Writing 0 will
+		cause reset of the related component.
+
+		The files are read/write.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/ufm_upgrade
+Date:		January 2025
+KernelVersion:	6.14
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files show status of Unified Fabric Manager upgrade.
+		state. 0 - means upgrade is done, 1 - otherwise.
+
+		The file is read only.
-- 
2.44.0

