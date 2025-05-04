Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264051E1DF2
	for <platform-driver-x86@vger.kernel.org>; Sun,  4 May 2025 16:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746377759; cv=fail; b=fNYpgvvK9GJV7ngwJJVjH5Y2YBZ0gcNe0SYqes060hgtpEBzbK1Z0iTxagojVQZnV/WV9bSk8ZaHP4DVOdeXgzGYeAzDiW4qXiPcAb5Ga1dEwLrkjuO0HTJAHoPT+ju0rHwh/RMCHR/kQapuMp/tc6T4g7ww/mUsoXJIm/4Dvks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746377759; c=relaxed/simple;
	bh=D3UQiTT45bbfcLwopEIJ58xnuuex/EGBb9dPOTFaTmk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YiqlP/V/bVzXp114PbOoYtCciVn6ksVlyCkJYCV/C9R/Sdz1l1L4141KqwJElm4/DLAZdtZknRAkd1z5Je8Z9gra2BhaA779N3+YXfIlzmP/lUCC4/5SqnNeZXKN6LgTgIFZUnqk3CC2Bu1NxubTKBH9GIGLdrtpshZk0C6B8AU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=czBtg/3I; arc=fail smtp.client-ip=40.107.244.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="czBtg/3I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=df9lqtpp2AHGb3fBhvK1K7ju6BjfRyqaaqSrd+9vlTIzd8IBy7MRdAQt7r6bHgcBq9DXuccT4IDMFhuyTX6MXLlDGM2JtN63oQQnMFfY4wAtElsQH4BkvuCDWvUhrJOqbjP889BX9dlSFsKnTFT4deDnsve0C304nM/WBYWTeGd61sMSdBnfR7TRkAv3Y+vglAKJOrAsh/ULRhn2/6/y0+cARKWCnvquIrzuVCtV9g2VIccz1jaDfmBp4SHungZ6/pkR/HZtZK6wukYY1WZiEFRd7VhskP94JMfqRLSyVcrrLf0k2isJ1o9nKJrsYZiJJT9aAdcS5D6eS9QQ0Hlj/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1a85hXetGYNtaQ4g/oh8qTfmr5Gq90vqLn7zFLebk0=;
 b=IFFRJTlSK0CkwIl0G1O/wHyRWvTQGhekPLDEKUBuUcawzgtMByPIBYSyGuXUWoUT6sDGr9wmT5RuHYfOGsX8KPou1FEGSVqhVNMQ9g5zbZkUk8xQmgcArJu3Xw82DgbpLEWLraqcQj2jePAmVqadEqsbahk/vWQALSIpRT6X7S9aaLIZ3cjIBCRNYZiiVAzlKo4TtQFZD9Yn2MQhif+PKTMLdT1/7PNUZ9whP+/w0XVBm83NFOnPNFlxjRggTN8Iol1ONz9javLJNjvB+h3qZlDTl/BUHMIb+lrSRnHABgZVVsPv6jaFe9icbRH0M0wyUKnqQukFOK+uNbJpc0PMKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1a85hXetGYNtaQ4g/oh8qTfmr5Gq90vqLn7zFLebk0=;
 b=czBtg/3IGd9Oytb5TJ8oS5OzVnV608/JjTnyFwwE+A3lbEMm9kw+JGRhkyx84v8YlOCm6JTLjWlvtixVro6rjcsxjJ2Rhdz7uFl4w8U652rFoujO2RIGZFAzerLwGzlee9CA1abDxoSxDYIBPbnsr+Sa2mwWOQOskrVFZK2Md2jCo7fKDoUvya86CiJda3WZF/F7iLsbtnUVwIYUdtkQg+egawX7YRPLlanY/jsT3b5zqs2lDcBMq4HzdKlcWssWaooCqNaPWtgzPx+O0dlGKyf9McpsYR4ue4gE5RBJy2nrW2FmkjzNBVx0h+TEcLorcSMMJVMiVRa8mWlyt05/sw==
Received: from DM6PR02CA0164.namprd02.prod.outlook.com (2603:10b6:5:332::31)
 by SJ1PR12MB6338.namprd12.prod.outlook.com (2603:10b6:a03:455::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Sun, 4 May
 2025 16:55:51 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:5:332:cafe::7c) by DM6PR02CA0164.outlook.office365.com
 (2603:10b6:5:332::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Sun,
 4 May 2025 16:55:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 4 May 2025 16:55:50 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 4 May 2025
 09:55:38 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by drhqmail203.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 4 May
 2025 09:55:38 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 4 May 2025 09:55:35 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <alok.a.tiwari@oracle.com>,
	<platform-driver-x86@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v11 2/2] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
Date: Sun, 4 May 2025 19:55:07 +0300
Message-ID: <20250504165507.9003-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250504165507.9003-1-vadimp@nvidia.com>
References: <20250504165507.9003-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|SJ1PR12MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: 843ad303-c643-41ef-067f-08dd8b2c86a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RQohArIcu/y4P12wbpSdRykHq4VMbkJZd51zJ3k/F2b94V2u+eA6jaj3ZcQ2?=
 =?us-ascii?Q?zs/dTwoO6JyFygy1XPGKuDidWEU5D2E9JO2lILjmkYHRNIliGitOPg9JVKEH?=
 =?us-ascii?Q?bW17Kzc7+ySYYIhjoeXsRxev1g8wfppQZzkIxjYwhg2DX0CFkEZ0FFdjfjwE?=
 =?us-ascii?Q?72DrgVQXcKWXWbXhvT2DeoO+dX18MVpAVgxOoppLEreRDbY4T5dqQi6Eq938?=
 =?us-ascii?Q?5SNW4rGZD8uSUvbYFUf9PjcGPce804+8C5pdudLPnCCT4t2fEIZzFOz74aNN?=
 =?us-ascii?Q?bcZ84+RfsksM8hoxBPZ+6nSzeg/SgbhVRGqUCjNE7K51EERG3Zo+E7WS4vgI?=
 =?us-ascii?Q?nCpbENnJwYkAVM8mJ7+TUYeAoltcblKF/yjHSDFswIyKnJvnzUbTj3bBchC4?=
 =?us-ascii?Q?xXLq0oRdjqXEU+hIiBaohHUI+luJoCKKP+GtxquR/HIsi7XTWE8mQ6we4y1F?=
 =?us-ascii?Q?3c8/5W0J/LeS+JLV4GlfBL5dXl211MiGuiU4g7wfxD2uPIGHk8MLczsHUyiN?=
 =?us-ascii?Q?4FFqY/BvWAJAERvYPzJdb7/c/wNUX7WYHPEbvZUCKjHtku+2Dgc81ifSURnO?=
 =?us-ascii?Q?IW328AYL/FEI5CNDfcyQnFaMpu+DX8hiM0smzIEy/t2/QC+ypDIVrJhXx3za?=
 =?us-ascii?Q?57gujeiWHe0GkT7oTgfy5PBrfhlc77ejSBCLCXdO1o8jRBKqPN+7t2SwQ4jq?=
 =?us-ascii?Q?uRgRJA6rIYjvXrfeL3/k4DsV11dJ1op01+4baxUx7UjB9QX2/jcHxTEnrvC8?=
 =?us-ascii?Q?Uu7GuUUx0TMXtLJStFXYCtZqYEELuKoZ7XLPVxwLIIvejHZ7d4BpIz0l5zfv?=
 =?us-ascii?Q?fSkBbrhOatZ2p0th6urorp/Q+kSp05rt1cnYc1uempJUC1456M8yGyUT5Drt?=
 =?us-ascii?Q?NHUa0zF+o8fL10hMWS4oJxXKkkXr5qFrMGP2WmXHS4F9KRq8A0Y1IXWb6WOa?=
 =?us-ascii?Q?eh4sjpA4g5NaNzfcrC5b5cQKM64UaBpTpPu5JrlQTf+ofhvN3maQOqhzidhh?=
 =?us-ascii?Q?hdcRIcXz35u81k052yB7tXZECNX2Duoswutgt6+lXb1B0JN2Fp5nSjzrpMp6?=
 =?us-ascii?Q?d6a1R8DYQlBuVwgsF6ZVeYiiqW1Y2PUgnxzeYEaIP6VFRH1kcs/oKJ3pi4XQ?=
 =?us-ascii?Q?7CzqoUcaZo2BWXgcf8rK6YKkdq0mA2jjNLNWg1Nj0RRCQ0SMlkPs40hCCBW4?=
 =?us-ascii?Q?Z1jZ/L6cz0/N1sTWUxXl9w3Cv+F8mdl0sWRSgE3iBZU9UEsMStgzr8yc9ICR?=
 =?us-ascii?Q?eaJnk65d/cHlffmlYMewoVt71aKA1dF/45XXGlauwrvSfxE1h0qu/SPDXX+n?=
 =?us-ascii?Q?o3GTdVrjOsrDonyOgyC/tQBAL+o10QzeWd3/sSqhuvQzTzPg8zQ5haE7EQGT?=
 =?us-ascii?Q?8lSnSIQunSeMJ4BBxAsPX2tqnqyE6CMweGRs45wlc53C4tsEY3ZwS01il3Vj?=
 =?us-ascii?Q?1B2tGCefIHHrxxhrngqQT9oGYRhnwfVDskOlBB5JtSH/W/bNwkgACB+OzkJ6?=
 =?us-ascii?Q?sEuN/i+UqGuXCTv94QssNfGg+tW9W7MsscZq?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2025 16:55:50.9330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 843ad303-c643-41ef-067f-08dd8b2c86a1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6338

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
v10->v11:
Comments pointed out by Alok:
- Add angle brackets for e-mail contact.
- Break big sentence for reset cause description.
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
 .../ABI/stable/sysfs-driver-mlxreg-io         | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index 2cdfd09123da..f59461111221 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -715,3 +715,101 @@ Description:	This file shows 1 in case the system reset happened due to the
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
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
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
+Description:	These files expose the cause of the most recent reset of the Data
+		Processing Unit (DPU) board. The possible causes are:
+		- Power auxiliary outage or power reload.
+		- Thermal shutdown.
+		- Reset request from the main board.
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

