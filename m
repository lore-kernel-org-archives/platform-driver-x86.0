Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E78118CC13
	for <platform-driver-x86@vger.kernel.org>; Sat, 12 Apr 2025 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744449676; cv=fail; b=khbFS4F3sihvqJk+A1HXcN3WNtfRAAILwHCqc6L6sDW3/CMwII7HItiQ5Q9hrmwgix+oKxV3Wtw8c7RJuPLybtLbUvlodoMNNpDNMPsKdcoMAxEJ1Xs8eJjDepfQuR0phunzQmkgVgDCTtdEWP4L4gsv7PF3Vh4dcjX7i5DA+GY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744449676; c=relaxed/simple;
	bh=X743D8PuwjfOJ3su3vobj7d1qhoqhriepdDQ6m69xBc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CGdgdYz0Q2B5mpk/iI6TRWVDrAkV35BLzCgXewZ8v+r3req83Hx/6ET1LYBDQzG6UK6x1qNUFP+A7nOsBgZFbJ9N2+AI1gKWO6BlgMpEb2cg9h9LRDMuJxnNw/wgsK9zs0vXJWNsqo7usJoi+wgut13C+aERSNAt4bpHZ4kPJio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bvX+ltiF; arc=fail smtp.client-ip=40.107.100.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bvX+ltiF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7alWc/kap6dRNuBVyEKrVwQxDCG6xoPylFD/oW3jJYrgZFTgOx1COz/IRXpIXMcKo7TDjEhqy1zL5U4p9vH05ocd+72XqC+C2xsylf1jggo4CdpI2njmhZ+S8U1Pirwv1ZnOpxnxqRl0VQZFzRNDaF+LpcZJW9a6fei5YfwEpknhOjY+hrgYoAvp8IOZXYPccpwdLQDn6jWAzGfq8iGSlk83M8T8cGOEB4Kf8+JP/MG+BPrnfUVcYQlnUvyWi2vbfwuXOsf2E/l/6IJ2B14l+qrRZCAe2Ltx5lELpL1yhCWYmAYDttcbID6t336/NkcUBPnss7vNLy8otHeVa1bOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lalo5lgniuqds1/HLDx/LzVeZf6Yh5WWtltPRhojx4o=;
 b=HpJTH2ouZOYS+Qs66XTvltm9G7NVv0z2m4/E8LjmLy0SIAVhsC3crLzr+Gduj/Sp4Nc1JC0mfoTqN1/XHR9sTCkVj66p4seBedV/WpFqHedonn/TSrsNFe8GDtHpPzOWkdI9NEVyWA8MRjqFpnkEiECmoEjVLZRLM5qvgJGYWwNndzPHqwuOQLCx0fOgCAc8kgVDqmcJM5OC7P/ZmDe58qWNObMlCrZcw1mBsLe+BplbhTjlK3F7heK+sNtjJxNeWeDEyO/mojBoCqH2j5sdhXzGcTp/SO2d0iSGHFxwNlc7W1NgJTf9IweBdK+2Da52tVYBWmb3/hotgXyziwK5Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lalo5lgniuqds1/HLDx/LzVeZf6Yh5WWtltPRhojx4o=;
 b=bvX+ltiFwM/pQ6XQJnYdth+EOnWpYkUn7bLdWAZvIogwiRj1YkEUhRSd9MpVM9RfnhnFH1DFcYbQ3I87owiXpvKh/WHs0LYNUbpQVb6vZ+XXkIb/dyRger+MNj+M0fvtRZEQXWUPrxbclbUc9ZuXXr1R55Kqm5f3Ijwi6Wkuo/AkluzrMu96W9vTs1yIRloiF7vGHdTbEDUOvsu6f7H9Sarntmtd6/WF31P8Y4G+nCvbyE2B5M2dh8OlqUv3A64WK5vSosp4ndVEkG0sq+xC69wLiRzNjF1qwppkB46tWTVP/ZGO56gqr5RnMRKbog7jc1sxbmLtzBx1Sa17gcFGnQ==
Received: from SJ2PR07CA0021.namprd07.prod.outlook.com (2603:10b6:a03:505::23)
 by SN7PR12MB6983.namprd12.prod.outlook.com (2603:10b6:806:261::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Sat, 12 Apr
 2025 09:21:09 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::2d) by SJ2PR07CA0021.outlook.office365.com
 (2603:10b6:a03:505::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.30 via Frontend Transport; Sat,
 12 Apr 2025 09:21:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Sat, 12 Apr 2025 09:21:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 12 Apr
 2025 02:20:58 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sat, 12 Apr 2025 02:20:55 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v8 7/7] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
Date: Sat, 12 Apr 2025 12:18:43 +0300
Message-ID: <20250412091843.33943-8-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250412091843.33943-1-vadimp@nvidia.com>
References: <20250412091843.33943-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|SN7PR12MB6983:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a6b4e3-44dd-4350-fe22-08dd79a35c48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YJVPr0VEq+xRvMRzYRoo9/yKyfBHxx1DFHKNzU+CL1O+N9H3tMyLbwxcPMte?=
 =?us-ascii?Q?GhehwWt+SE+7Nndy/KUg98pcUhY+WJW/B/QzR+W77vr0Q2NREM6i9loWrAGi?=
 =?us-ascii?Q?a7SXxG8snVqHuNWEA/nU+gnwXDAvvkwe6gKaL1zksd8n06HgYDGKFNopWYZi?=
 =?us-ascii?Q?oVBjiqK6s9znZCX+j/C1bCaX5ToUkrFazzFoX9J+Tagg6CrfRTUMtSIpLUeR?=
 =?us-ascii?Q?1J2eR8KXExQMSA4LAO9azlSdbrjQEAHOimpwpneGnjFudoDLpchumLbm+a05?=
 =?us-ascii?Q?ikqIPWe2Hoxx0FYgqhxFlbnwg4weaOsRSi7ylsvtMHH5wL1naffwAueXPZtb?=
 =?us-ascii?Q?pAMyFIfdyC9nAdaWrmX/gXjNFBwXFTZ6IbUW5o0rrWHicbMGJIN7r10tZtnC?=
 =?us-ascii?Q?DMMcZc5+bFwYsKGF4yNB88c0QGaiA07yUbEDlAXj6t0AiGcuoWQlKNb0EfiU?=
 =?us-ascii?Q?fNDTilLAX2/vJSKbCQKQUXhtoPhrGMevhaw8vE2MDuCiFbfLmDAz6Qv7kePT?=
 =?us-ascii?Q?UqUDFYi8FB7nsUWOv5MmQOpgeci//i4UCm9jm3N80BsW2gtoSwFZwGEvN9eg?=
 =?us-ascii?Q?fkAc345NXCgZ+CfUZUZcnvB1nO0AanlNgt+dCr6mecbVovQAbttms3O/nIzj?=
 =?us-ascii?Q?cFtEZY0Ok34ykRbgg1AWphIBKo5lGFtyozTEpGAIqYvRBKfa5nVVb2L/eu6D?=
 =?us-ascii?Q?pYa9pNt6fWHyk79lhwfDcvOPkglHBj/oJ5RLkqJbI9iJkOxFu/EAytJEP3pE?=
 =?us-ascii?Q?bIdivh4pDplbES9+NFLUlYKXVy+/Bpq7KlRJa8rK5MSxNCk+9xAHNBchb5dJ?=
 =?us-ascii?Q?FF7wAAnzcEpApaLEjJuoTFvmdYRb0IFbwQnJ1dFJ4TqCVvIQAhUpJ0hthsGg?=
 =?us-ascii?Q?ILmDUQ15e4apGx9SxH3hpcCzAUpvjpCSIOC0LIykGiO2n+8rTQKuTmKtXjxD?=
 =?us-ascii?Q?d5bf6C6tjTjig0D+AJxqJC5EkGRJznjBB6OsapJH8XCHhpvfpyNAZhtMcpdH?=
 =?us-ascii?Q?as5lqa8In3IiXiLwcjew0re0hZjG6IyZl2LmvEIjxGsrKyok6Wspx8HRHM3h?=
 =?us-ascii?Q?M4YP/UT49D9TtJnmbTetVPHXPh9KHDr40nmnCxW3oSJkyQhPVpGNKA5Fz0Tw?=
 =?us-ascii?Q?UtceETSRM6Eh12dKD/Kmd13Hrelg36He5XOZirIr8XYkgXs/1lAD6ANeuYFQ?=
 =?us-ascii?Q?5pDDYlrCC2ItMzBd8BtVlyosQEx1Ln/jzrMsQj/49VFZFAY/EkT2mv+wffGf?=
 =?us-ascii?Q?8goGHV5/6ADo9Z/vVUszKzKWTeH1x2KHeEAkPOUtVnrVYgUMnAeevsmTah26?=
 =?us-ascii?Q?L4ZGMU7Ghlce2kx1I2YXuGVwF0aT7m1B631GQl0ouUOmZrJVZ6KCbaar/Zyo?=
 =?us-ascii?Q?f3boMEshmKV+fSfEGmpWlGAP8O7q1w3i2nWZotpB0PelltukPKKbWss7p+/S?=
 =?us-ascii?Q?gHh3CfyQGCIaLxJZ/wlQ5vw7HU6zT/FgnfsURY/CZBTSmhZLiLTL3riNsrLw?=
 =?us-ascii?Q?NLgEaka46f6NOI2vVSWvuDIZqUfOGBrVN12U?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2025 09:21:09.0146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a6b4e3-44dd-4350-fe22-08dd79a35c48
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6983

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
v7->v8
Added by Vadim:
- Fix dates.
v5->v6
Comments pointed out by Ilpo:
- Fix dates.
---
 .../ABI/stable/sysfs-driver-mlxreg-io         | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index 2cdfd09123da..acc0c9a9ac29 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -715,3 +715,99 @@ Description:	This file shows 1 in case the system reset happened due to the
 		switch board.
 
 		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/global_wp_request
+Date:		April 2025
+KernelVersion:	6.15
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
+Date:		April 2025
+KernelVersion:	6.15
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file, when set 1, indicates that access to protected
+		flashes have been granted to host CPU by BMC.
+		Default value is 0.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/shutdown_unlock
+Date:		April 2025
+KernelVersion:	6.15
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
+Date:		April 2025
+KernelVersion:	6.15
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
+Date:		April 2025
+KernelVersion:	6.15
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file shows hardware Id of Data Process Unit board.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/reset_aux_pwr_or_reload
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/reset_dpu_thermal
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/reset_from_main_board
+Date:		April 2025
+KernelVersion:	6.15
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
+Date:		April 2025
+KernelVersion:	6.15
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
+Date:		April 2025
+KernelVersion:	6.15
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files show status of Unified Fabric Manager upgrade.
+		state. 0 - means upgrade is done, 1 - otherwise.
+
+		The file is read only.
-- 
2.44.0

