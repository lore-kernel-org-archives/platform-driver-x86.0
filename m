Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C041F4E56
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Mar 2025 16:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093696; cv=fail; b=M/l/MjThGCzJ34nBm/1DZA69MBkunmiAMsiCSbAlMllGWuvm+ZwF/GIUFCP/CPtIEpJv58IuoAzpQMrhRrhfHbH4WMn8LnJn+VdA5phFPQM08bsiuComqC5qt8uvNPS7MIRiJ9pLZ22YiN0xN1ZPr7jpa3+mDPIy4h1Qcz/0h/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093696; c=relaxed/simple;
	bh=yFkC7cVi7v4jFn/F4PYgTh7Cn0rd4UJPuvpfNMXe8PA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U2h+cADmnHfpiSaeE//v1YpjtOq0BiXddRTqQ1BCBTzpmTAzCFl3J0l4RvytFOLadvEQHM8oHM5gj0YkSs4GkFbfnDHXE0lrI5mQIpGai+T4OCtdyUyaFKE4etREXzLEznpW+NMqSgfP6xORU4InToIv9R2NYaDwL/zMButDvtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Eri3D+Tr; arc=fail smtp.client-ip=40.107.220.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Eri3D+Tr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnkRIdMDp7hta1GaFPo1PEYgaWBOEI550iB9d9N/NG1HPKRDJz82omy8i5FIIVp8mQZ5v6ZNsal1PRF76xiwvx9u4s2LeNaZd6qJ8PpSDeYk14cTFoVLhtXQDJAF8Q2PiGfyN0BvzWQI372XH3oCMVDGzLhmNcIePM1kxlQa9NbjIc9JHQnDEEOwH77VUKVpr3zWIyUY9HwpFVL6k1pn2m2sHBNmoisjdIhhj9l2+Rd7fgFJaGsQ0DITvahVyiZeSw2rhWFAO7CLKRumRJ5SYwOQopHBd57HwUPQL9/HhjbADrmoHQvO6zLp1l35SLhlp/4LWjQ5eer8H8wTXiI6jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6IdSP8U/mBU5Bs0l7AkFc6Z3DDiU3CzUmjXYuMZUBc=;
 b=VP67u2RUSnTixpeP1D/Ysnxw6eNO8HtjPO7AMw9eJbt5aGBJpm24G5/GfIk7VyZWfKbflFqMPguBfc1tRQtRfbHWj4Mow6a9RZ4IhU/WRy0p+poaWiSnVVxYx3F1KGtTom9SiITjUO1XGNxBw099kHZ22eEIA+KBeFCH+0i8j9rjqCORY/r1YYqo76MYJ5ou1EDis7UJXeC3e1QtYsVQwyVYw4WocFZGxAhKkLW/kqXpwxG/4/QJrDvufYxaeQFWD8SnhNTgflk6xamJpfEybjP6clquQL/b+6ntz/ugODzyltKtzxRxOAH0EJHEHWldsnyPMWCDNN07wS4uBwfSHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6IdSP8U/mBU5Bs0l7AkFc6Z3DDiU3CzUmjXYuMZUBc=;
 b=Eri3D+TrEhGcKkuDAdzd9U3318PkD/yBZ8Vj1R3J3L80HqPMtw1Poq0nV30ce+RObAX4b16Dn82xraUc7M+KLv9BeepLfV3FEXWPWZd0wYOXqsmQnXVq5S/oQ7R/Udvm8q9Yr+UfgNj9eiS13I4KnKGi3DvwRWEK710XxcH1xaImbdcKPigPDWd/HWGyTGhAPlD5FqumqPgM0JxFQNp2MydXvtOw7WvIhlcRDAUWDI0bNSvqPA5x9VBC0lMbwpjxKmE6IVy8M5WSnbY/ieLSsldxbTJARSdXf4RZ9uF285xF8sWz09UbDDzV4efN37vPZvdRPpBfVkS4DyOh7t1NaQ==
Received: from PH3PEPF000040AD.namprd05.prod.outlook.com (2603:10b6:518:1::58)
 by IA1PR12MB6601.namprd12.prod.outlook.com (2603:10b6:208:3a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 16:41:32 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2a01:111:f403:f90f::2) by PH3PEPF000040AD.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Thu,
 27 Mar 2025 16:41:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 16:41:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 27 Mar
 2025 09:41:16 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 09:41:13 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v7 8/8] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
Date: Thu, 27 Mar 2025 18:38:55 +0200
Message-ID: <20250327163855.48294-9-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250327163855.48294-1-vadimp@nvidia.com>
References: <20250327163855.48294-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|IA1PR12MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: 496820eb-df82-4df0-3243-08dd6d4e3a91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6IAse7Vvc2aCttbBn9et3nO+9JeqYJOymN9SUUZsmpS4COsA2NPNa1aEsJ/V?=
 =?us-ascii?Q?1aeSryElm5+WnMVb/iDNU+3UePcCRFLHkDPYr7tvwiFCCzHrWXH6Hau4qtcX?=
 =?us-ascii?Q?VD2mG/mO3EiY1FFANjAINwoQn2NIVjyY2U0xTNUFIv0IYv2nGMWzSDtqVYxU?=
 =?us-ascii?Q?oW2hVYnZ39pp+zydC4bngP5YBTooL8wg6R5hyLfBKuJr98h5XCqo0wUk9aQa?=
 =?us-ascii?Q?5wQ//g0JlY46XwbgeY+LciFOPoe4MmfgY/Zv3ivsx3ssL5rP4dPU3B+fHQnR?=
 =?us-ascii?Q?NVG5rVzosAnJqmIdKOGpqosi3k6mC/1vjmIE8LeUxXnjiTecxFUzpskdt3fL?=
 =?us-ascii?Q?foXi3YLQOTN7Ic2Bqok6TskzriMdEzDhCrL05nR35E9XGWV/i3u6IAEK8ZqL?=
 =?us-ascii?Q?bX8TLbx0BiLEWw9GGjlW53sTH2+SC64xByN2yUjQXEdbejXjUWVo35K5WuWB?=
 =?us-ascii?Q?sjkA8HaBk0+I9bHIiifltBM9onVUTm4EQ2RxkZmPR7FjHsE2nNXA52tj0aKT?=
 =?us-ascii?Q?Ht+yNYNZ/6fk4ZfgobyMQpppkFIJyoyeor4B2a8bsmaKXIi8B1meIOYyuSAF?=
 =?us-ascii?Q?BXZ6UzIRXOvObZpExXKUA/nHY/z9IjtTN9AjDWLMPmEb4AS/xWQgSwGOBQE9?=
 =?us-ascii?Q?k8mfx/mTe9jui/ioUr4QghoGBKcyyixqdTrCbZq3OMWJmf2RRqyzen30BTFX?=
 =?us-ascii?Q?fE7efpEyKAOBR7A9WYaHF4kz5TG2tyIb+WmhO+vdlI1JtXLryqxFY/wOFYp2?=
 =?us-ascii?Q?UlTFWvnnD0j7xNbTSES/NvrZ2CC+2dIcmSxP9+0Gj4yeorugSrXTjCuLPPJE?=
 =?us-ascii?Q?S7hePe+JqrADiEvHLoqa+ZoVS+9hrGMrYm2jQoZi7MuqQMDWsnmXKBYAlSXL?=
 =?us-ascii?Q?meZ58MV2EfxGyafeJeLIVF8ir8imZJFFVrY67tZvvRVbhfBG0A6ISSnswA2u?=
 =?us-ascii?Q?Y2Q+80jsKlCnS2SAqjH/HJRGf8GNqt7ipZw9Z3T3mX2jxguHVVD32t5SGWsu?=
 =?us-ascii?Q?Q1kWsgL6inFoZM7T/MT6E8t2RRtSgOJ1a7lzKxo6mvpgPuCiY8zL+SqU1u6a?=
 =?us-ascii?Q?2h/2afrV5aFqkdPTpRL6RsnB+ZCeOIu81K0tASs4H+bJ72Jc/RXVX6P5gYlz?=
 =?us-ascii?Q?x4H8tNJXVOi4rUiAtVF52vRUO/O6SLcjDpHfqs9ClwjG02Hv+kAy4StAEwR8?=
 =?us-ascii?Q?crsA40QQmpHZZJnNdvDqG792Qy9PUuhMnqkP2GGOXDiOFUefM8T988CkYCz+?=
 =?us-ascii?Q?gOghUe28p5bm8wl4r/JzyXKE3igv7eHFvm16zSCHjDb2TsKpNhZo/YvKlbbn?=
 =?us-ascii?Q?VZD6M5vFxEL/jqXJxQfSrwXJdEo4ziolGqtc3B8ibPrDr91IAk2wWECapvNf?=
 =?us-ascii?Q?gzadXEqsswOMI861pOgbs9rrnzpoDMemcgLqnS8Ld98AXBnFzAOePwuiKVii?=
 =?us-ascii?Q?IwUJwtAehXJ7G2yhmSS3/ZokmGMUVTdn9UNrqRT/KhADrhvYCHSVPfV2NSR8?=
 =?us-ascii?Q?nf6aJqmbxxheRM0=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 16:41:31.2542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 496820eb-df82-4df0-3243-08dd6d4e3a91
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6601

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

