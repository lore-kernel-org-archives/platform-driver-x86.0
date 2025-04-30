Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3BB2550B3
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Apr 2025 15:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746028664; cv=fail; b=nUeeLF+6rpg1K7neVLuj+dSZzuXRQFd6kcwSyONNMqghgJO12Q4oHKRmnqBpSJj8Q7uLx8tnJ4j/OMJBAxoOLslpf9eqKy6++etSFJ35XNhUyDnZ/8tHTNOSoI3e6/g1oBpjZORTFwcN/CnHofwDsmbWieCs2enXmrMPWfYoOks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746028664; c=relaxed/simple;
	bh=Et/o86FQuJ8K/qBZhN10h01Ms95x0ZQW4p1OspXCl+Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oBdqop0uqaEPHYI2E8LD2Sty81X+CN7Qg7NWg3rCpBEccIA5HzEd8kWz3pg7Pqg1HzoIw7jTjpuU07w0jtYVNnM5naB3N/S7J8nKIeKvinRkwhWJt3+AX1zhgbpwlh+nXi0EqH1j90JNAoDBU8/MlwDYr3HIG5VXnzPAUtkbuM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DbaelaFT; arc=fail smtp.client-ip=40.107.94.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DbaelaFT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JAEF2NaWAq/c8kq2oGLYG26GhiCkJA9UJ9GkPHtACiCWYuWsfKAde/odjojvYvwYlF0dMM+43KuzRnRuQjpFGniFKzlMRx2S6bqfukcxi+NwRZ6s/N3EgL6Qb67jVMkSb8gfPSTjAE1V4Hug8gLFyggBWky8ni+gq3evtzo7D3dW3FBFq13JXysBpIDYUrVizXsROWpa01jf4kmWz557Ah3xsmXgEpEOX31C44PQUmvB7E3KcBsxblI7/DKiY+3ycmhGLPqYFIhbUxRZsXGI2vE//BtbY7ZYcZA7EL5S5GNLk/0btfvthSFeg+Ib2zSk1yarrWn5x/Cn2lmDKsVmzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmdossM9YQYhMVmNlW8vNIdMatV2pjxHih0Qj4Bq2s8=;
 b=P6IwenD6QhpSxvyqhXoU6tnqey06EmfL0fbPje7Z741LTxjx3lZzeV8QrOQQI+StgWj8gJfycBTxXVSadt3NgldlZe1kDeICDLli4wTSxp+50NpjalYMWhdq7J/10R+oSw3F22L+vBMhu1LogXpI7QxEZ82hZlXElLEjfT4by2JWjfj3/VoPQtek9BRaj0W2DsSpNlkvdSxcfLGd3oCXdhBpjchOgL6brYtVd+dw7P4zZZ5KXd2rpp/Kbka9I4plEGMIoNWZn8NaOgeOE0h4hM7DixCSFjctxOI0Ad6AA00uNP6sSKJQ/7JRSdpR2EyVlD1bIkorxi+SBbNYnLkhAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmdossM9YQYhMVmNlW8vNIdMatV2pjxHih0Qj4Bq2s8=;
 b=DbaelaFT04p29Xr0d3NmfwhQKe1EzyW63Is4hzFo1hxTd7tA/mMmBFdYM4ieGLq1r5RD9657mUScmMW/nul/7hLoWH/9Qjtkrha53hh4Iv+Bf1Jd9BDzcA1DvkYQ02T4gEvBXvKGW8XKH10fcbjROnXZJJfm9s9QnTzMPqXBT6HTeGJQPCi0c1215S2vao1aJdBERbjv28Xw+W//FYA07zRC4Ll+yQrWyLNCwKhinrJdwZB8A/wTWj5uS7SYFgDxX6fXbKdvhP4o+T4MH+RVBc6jMMuzEiXi+P4l6wfJtCsL2mJts+itcsrju2smrHtod4UXgyri8t1SVBOp4usEBQ==
Received: from MN2PR22CA0019.namprd22.prod.outlook.com (2603:10b6:208:238::24)
 by SA3PR12MB9089.namprd12.prod.outlook.com (2603:10b6:806:39f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 15:57:39 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:208:238:cafe::c0) by MN2PR22CA0019.outlook.office365.com
 (2603:10b6:208:238::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Wed,
 30 Apr 2025 15:57:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 15:57:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 30 Apr
 2025 08:57:17 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Apr 2025 08:57:15 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v10 2/2] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
Date: Wed, 30 Apr 2025 18:56:51 +0300
Message-ID: <20250430155651.49732-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250430155651.49732-1-vadimp@nvidia.com>
References: <20250430155651.49732-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|SA3PR12MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: 05c5ab1c-81ba-4c71-9dce-08dd87ffbb5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G+3eyB2newK8Zd5BFH6RRAcsLGx+m9WjTQgU0/CI/bOkTREsi4x7uKHIBp8U?=
 =?us-ascii?Q?FohDPGfZChQVU5q+8wXnwYc3BdKKWpgDPWvjyEfbs86rsy4TcFYSHtjPFC66?=
 =?us-ascii?Q?UgOZpUavvDGGTk1KqJYjMpwEI64ZDZQdx6neGmGZUZyWXv+URRijSGhDHcd9?=
 =?us-ascii?Q?7kzqvrf5LYSgWsiahHKZIajGiIGes2be8m32FS2Nq1R9LrdwEnM2+hqC4Pnz?=
 =?us-ascii?Q?jdspO/ohaxt3IoDwkJQapI0FScjPPdKxV+GSYzdl1kAi9O83oR/A18H66iAp?=
 =?us-ascii?Q?eeVrsXM58Ju1ylEPtSghzotKNrEPJvm95mpre0/TBdrH/pllOcOuTB4x4tvD?=
 =?us-ascii?Q?BTvi3u5QBgcx+5oXhWW7ky1SdU8/yHsvpl/n7snw3d7rPqPwDs1QHGeCIHuT?=
 =?us-ascii?Q?XVjEteJtnnG6I0zYG524YmWDoKK6Fsdq1Teq8m8cjk0wA5L+X5J0nBffCIwi?=
 =?us-ascii?Q?5cFCYV4j8ScLbMueMQy8eKq6jKZ1cKYWuglr4F69Dv7gduxDy8XZ4aazKpuo?=
 =?us-ascii?Q?wRaFHUkzNg8YOws/mRkJ9ScKrwf6Zx7qHY4dLOZVEDmrAKpKKOIFDMh7iWzY?=
 =?us-ascii?Q?TN3nlZYciYDzNGD+zBpgzL5Zp/hcZ6dj7F+2NMFgMXICz5NeY3TabRmPbRSA?=
 =?us-ascii?Q?gcPXt76Ly5qEPQ478y+tqnwUIm24WlN9E4RPeis1AS3f7PqTmZG6eOwJJB5X?=
 =?us-ascii?Q?Ko9QJUJPM7zCQLXSxfj/MdN2DYj70Eb1H0eQMRHwI/pN8Ks4EuHN2N3xEe1P?=
 =?us-ascii?Q?zRjvPNG1J55KZqpDmVeJWodzk3uKU0cTeKjYMju5A204YvdHyAM+5K4axhNR?=
 =?us-ascii?Q?lcBS9xsFAQnYfWhpVMG9BXpCZwYHNImsacd/pUmX8VidZcqrfObYI6Wmonyq?=
 =?us-ascii?Q?d9YbqyLxYYCjC5cygRkmS5JijL2WH3vsArmham6kpQEL+h1mblS68naOyEkP?=
 =?us-ascii?Q?Yqt6rTQqo5OZMJgs6aWl4cOPkh0glO52zNt8ddURI4zodPXT28q7Y5d5pbyn?=
 =?us-ascii?Q?AfZqZR9OtE5SOS0JRLjWRFXztz5QjpeHafM9Xvt8RC9bIOqZo7ve+uTMPcB7?=
 =?us-ascii?Q?+rfksPoNND5TbbtquXzr8JKJ2FpRdQF/O7Ju9yjNioH2SiKTELqXSR0LXJwE?=
 =?us-ascii?Q?ewxbtqUAFiZMbUPXa7AUTvJ8KXvv3WJCu81mftZyj5UpvMS6G6zEtqn85A6A?=
 =?us-ascii?Q?VHvcoBcS7mqcROBOF1q5Ju6i/EPBBtjcCuZtY32xV6YFLVlEia9Qtz/NzRNK?=
 =?us-ascii?Q?wkY9COtCdXgacB4+1VxPJuR+su7nIEJ9OlLfW7Gk1ME95zdvEaRYJpq3z5fZ?=
 =?us-ascii?Q?61zaIauLMhAGtDpbxl/GfV5LUgTjikvqk7Kgo6uXNCv1rovVncBQrx66vRmS?=
 =?us-ascii?Q?RU5wwkhEgDXuONeDTtv2bqLsKi02QmMQsSbZCe+isjz394gcaX1GNlKr+LX2?=
 =?us-ascii?Q?GMieFrCevix0dIPldshFokfW2JTCN6o78bCLjKWhwYRZTkuPwjBhatUie/B1?=
 =?us-ascii?Q?/SDcICIKTKa8fbLVE2VtQ7r/vogrxy4w8lef?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 15:57:38.4439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05c5ab1c-81ba-4c71-9dce-08dd87ffbb5d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9089

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
v8->v9:
Comments pointed out by Ilpo:
- Fix dates.
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
index 2cdfd09123da..6347fdd4b0d0 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -715,3 +715,99 @@ Description:	This file shows 1 in case the system reset happened due to the
 		switch board.
 
 		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/global_wp_request
+Date:		May 2025
+KernelVersion:	6.16
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
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file, when set 1, indicates that access to protected
+		flashes have been granted to host CPU by BMC.
+		Default value is 0.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/shutdown_unlock
+Date:		May 2025
+KernelVersion:	6.16
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
+Date:		May 2025
+KernelVersion:	6.16
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
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file shows hardware Id of Data Process Unit board.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/reset_aux_pwr_or_reload
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/reset_dpu_thermal
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/reset_from_main_board
+Date:		May 2025
+KernelVersion:	6.16
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
+Date:		May 2025
+KernelVersion:	6.16
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
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files show status of Unified Fabric Manager upgrade.
+		state. 0 - means upgrade is done, 1 - otherwise.
+
+		The file is read only.
-- 
2.44.0

