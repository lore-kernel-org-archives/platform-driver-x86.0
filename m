Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D988D20E6FD
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jan 2025 13:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516957; cv=fail; b=XHPNc0htA8EyfwuktlEBU1f3L3cQDicfxzVttEV7K8qH8tYkfHm9s61A33x8lFsnC4k9Zw4Qj5dcqKARvQvTzZ9lFhmkci4xQwjuFBBpkrWVPpXFdRUKipoGIbgpaHJoqFx86tb3GmrjOw9rUBPFhYIjFCgZonBH77OD2OngWcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516957; c=relaxed/simple;
	bh=6fuMBwfL/myHnMXhCPVMoMr9WAlYnZSo9SDkhSgXWOg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p6dydlYfKcUZ9Bz/z323MLP6oYwyNRlwxA8diFcyawDCJhRuymr/qgJpDcjBDjlZR1Q/BDdHxaRxwqWj9wPX2iwiySzIM0PO+x8h5ScgdvaDA7nBUZQfpDgpWXPKLasIyqO+54EygQ+J7oELGO1fCxAx8vbehanedvlBOiXL9jA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b57KRM+T; arc=fail smtp.client-ip=40.107.223.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b57KRM+T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOjAwFyjY+NPReO5Lge2zuFVCeTSONpbrkgKMFQW09AJOeDeR/axd0vqPTYwZpT23iSqyjeqEI9Vvpa53EExYxGM4pyQsFYA9j+7ZJlEbce+ww+WE8sMB+OuDC3ANZibcj9bu3t+bQTNz4OztN/VjXvqoc8UTH07cQD+ypVW5YzJGXzlrds7g1figovhavM0o4bOTVjTMGj0Dcy9bSbDXuUBjOaTN150qOhe0AABoioW9l8z4Q5O6r/r9ln8gK33dY8NeDkGk534FH3VZscKptqYb1iTiZ7EYLS1J4Qf2DwHnfWrQcWoPRK0EJiKO+82aNDpRF/XwENNoflEm+09/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TiujHycaMxrjW7CZtGt53TYMSDvQJZ4Tey+Nm6+UVEw=;
 b=chqxRa1jxM/3ag1V22QfqMJhc+fi3/43RAbnXffcoa0XXchsim4Wf7SbqdIiX6WWHAgd4ilwG10IZWKLDVcTuo4P2OeYMrirxcGqNuLH03e5XWqEQbWYuKGGHfGHFbW+i3aXGd0oCnW4nQXvoQPQciU0Ila6hJcXbXYyEyRQVlU4sNVKBsbjk5toNCSs5ZFTxcWQGu2+cA/Dc5s2MNiJs9HA2p7GVrpmeUKoHEB923g01cH2xGE5vWOLAl5iSbStArgMH7izZt5QbJP/XNFzfr+/T+Zwe1jWP5hFyUdwfSpk4mF/NftFqPxfJq16bqlm9VdyTkLl+hDIs6YfsmICVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TiujHycaMxrjW7CZtGt53TYMSDvQJZ4Tey+Nm6+UVEw=;
 b=b57KRM+TRdbFXfXz07GgF2/yvII0cj5HcngMvvvlaqN87Ub4bV+/m3u6D1L0rgQQGbuNBjKBp1LM2bM4kW22tR1AE8THbGRsJKiMRvyDkXpmm8MLwSaKssYW7JLvOk9xb/dmHJRNmzgcYp7W0Q6k6KkTFaQiadj5HxXRIfxIWWARzOHDlkhueD2NlBZkFNUbmNWYmE8z3vIOj0Igg8XJ096K9xrJmvuC4o504zZrZosgzRzwqZx26h5UXeVkYsAdFDgDKK3SKDlk/xocFmVHQtLLWBifsXXYjFfdDsmg7Bx8xp+t+DaiHriT6uzhlvHozXcIjO39RnKTcCKH3v6oqQ==
Received: from BN0PR07CA0010.namprd07.prod.outlook.com (2603:10b6:408:141::10)
 by DM6PR12MB4419.namprd12.prod.outlook.com (2603:10b6:5:2aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 13:49:06 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::bf) by BN0PR07CA0010.outlook.office365.com
 (2603:10b6:408:141::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.15 via Frontend Transport; Fri,
 10 Jan 2025 13:49:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 13:49:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 10 Jan
 2025 05:48:56 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 10 Jan 2025 05:48:54 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 10/11] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
Date: Fri, 10 Jan 2025 15:45:08 +0200
Message-ID: <20250110134515.8164-11-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250110134515.8164-1-vadimp@nvidia.com>
References: <20250110134515.8164-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|DM6PR12MB4419:EE_
X-MS-Office365-Filtering-Correlation-Id: 7813219d-f4bd-41df-821e-08dd317d8d46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QXztDXOREyvj+naUf4Uy55TwbgP1vOri3VlB6mVjF+xNy8AdCyWR33UnJr2V?=
 =?us-ascii?Q?u/IomSbNBDUDLY6gxeegdMMOi8sEOdWfr0BdnbP5cCkt/u0sUZbi8++Ebezl?=
 =?us-ascii?Q?XaPCWCvbZVLsqZfzZhK8WJlk/cvIfVmCzx2WaKv08/XxmnoK6CsEAY+t/8WN?=
 =?us-ascii?Q?z58nakrpgbg5rTTWtYaZd2UQRC5MqJIucg2yDjlbBQ8zX4t2/ejaOLTavba2?=
 =?us-ascii?Q?ZEfGeOH36a3KqsGbWOwugh5/sAnn+UpwZWaOHy3FgMRYeXyDrJiaCS7SgPW5?=
 =?us-ascii?Q?7Q8VI5knT6i9PbiQMd4mGZ0ICMAm/rpC+1lz+u8USwT4NCbIXC9GnxH3xH44?=
 =?us-ascii?Q?xniA8oBIzbicl0Pw/f5xOuGqvcflRBuQVLo3BlH5/+/w1mot8xgB6mYfuGVl?=
 =?us-ascii?Q?fSCK48rfIhHKAgrP4Jq5/Q1zWxLydVCcmWuiXBAlL1GOtw1EJNaBUAu48Jql?=
 =?us-ascii?Q?UUByzRwx+VbxOQX8ICpZpkkZ/BkN3mPzn6R5FxHoIWQEdrQJbnVnyDy728r4?=
 =?us-ascii?Q?0RtYqvxUN4SxfCyCMJrt2ODMUD1wiWfa2ArxJgwBjL//I4+XBMIQIJFUNYki?=
 =?us-ascii?Q?BkyNc6SXf2SFMo8O3ZClSjbxB3WDn92h/Z9l5N5FqybWLPZTr/YWBLX+nllb?=
 =?us-ascii?Q?1UepA2mVsFlaPlsvl/cAtM5PsgIRWTUzw1mgNp5En0P/Rgbuafplj7pkAbQK?=
 =?us-ascii?Q?Xx6JWq2lP1EjM8r/+BcEZsoCnhpG6cdfCpkk4+wI4O8CRQkGrWmJrxl4m4a0?=
 =?us-ascii?Q?WiSPfBx2LDJrWUWtgM7fG8//JrpVkv8X3GZoQ7OB3DFdCSPBcUXNWYxknQFT?=
 =?us-ascii?Q?2Xjj744lbij86TX8tR/cve4iHK94vE4SJEnu0TIk3DPOcouM5UPfmNBgxWTp?=
 =?us-ascii?Q?uy/e9K3VFscLNuSYfgCqwSCFQJKMosDrce5X/HuFx68KqaGrnU+mcc2mioWj?=
 =?us-ascii?Q?Nq4JEDdMVQHsuzgHH/2tOtu7NVU0ihIdtTf6XSI88mzdB6ERRrEwcoNayip/?=
 =?us-ascii?Q?vrlbsV9O1wmWZCEvdnIBmGKue65g5AOLSWxl+5XEMGlLSlogQ4RnN8cGAzuy?=
 =?us-ascii?Q?1HUNzMejalcdqXp6pkz+aPIyjngxe8OeDXIDQq4IQEy0Ap+7p6/acw2lWfbe?=
 =?us-ascii?Q?EScKs+SC2l7ykT1fDMC4IHLDC9Vb2iD2wgwM4R0c9VYGmRObrN5pGBwLaL5+?=
 =?us-ascii?Q?tRQaESS6GJSz2ng0GwWH2NjhUx+G1iGs9SO7nyoiPAn9+roPF9zL7Jr0qY2Q?=
 =?us-ascii?Q?NruK0zydPBI6XCIq69ypO8Y8KIUP1Rt05PS/57Rt9N4JI8l+u462qehah5lE?=
 =?us-ascii?Q?iSft1n+eAjUnj7PETue/6mlgz73DB/Csh+31+PjyrGxWr+BhNI+4BjS7Bs0z?=
 =?us-ascii?Q?0V73iO0riyq7TsYDX3MIEVkh2E1pamYTCqjXj1F3kh+VK012i6oLIlQ9mxE3?=
 =?us-ascii?Q?T4cYhkeYn1EYxkagmJtiFQYfTTXw7T2pMcETRark3R17iWjvGMPlaQsJStw8?=
 =?us-ascii?Q?6a1ASwaWsUwV7i8=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 13:49:06.5328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7813219d-f4bd-41df-821e-08dd317d8d46
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4419

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

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
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

