Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA48157487
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 19:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737659555; cv=fail; b=m22tsoqDrOzN91D4xCyvRNoRK3sbLCpJs31k/Md+8suZuZwrxhlrIaNStN1qVc0uhKc1LTrwrrPIU5OJGGF5joVYfmqzr4DZHtJRVNJeS8VdA07lkL1eRhrBGbpIOXpLIsw85+V/biaWxdYukDHhUgnLAuKE/xk0lGtenNsnF9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737659555; c=relaxed/simple;
	bh=29E62jaDXqCKIB0V/AFpPgsc2C+LlZ3Oe3hOmXkDBJM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UtwL0C9EOt3LD+VB0gr2Yf73LHnBjv1/nksowsVGsj36yggSg4SM+LAziQlx9koUOwWIK9N8//B2Yo8A5H9bpomzDIdZiWnBYYNqKg4iapp11G8dLVtjlhInglTMK2hq7VBT4lF9MKkO7dRmexhCmbDuCbdnzeJDwAP3O0SBwPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Xuec2gQg; arc=fail smtp.client-ip=40.107.237.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xuec2gQg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIOfMlZGBbvf+M6XE+G53JWg7ZHDl7/2QC/T2umFhOpvNzV9XzsUAcle1METYoTDpCmB9F1+jy9Pzw99N9Rl9XxhSsEHLeoq7L6A5W0C5zw+DmdyQ27CDtDKqcj7UHgGH7xM1/lD2IkmbPUP0Le5ysigLNkpAqAfSHwo9jifrkiT85c3zuRYyZgW8byAdurf4O4csaJ2OwIIsBef9TPqMIYOu34u1KGZ4uTsNX9cAlhbcLzXpkc9Ce3ZeC1Lt+Glm1Nk33uW2233Zc+6OWqzZBR4dAbjkYEOGsRCr/La7MJ3n9gDKRA7QnobX7CxKCM3+Gz2BZmyhxBq4NUhEf4wVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6S2fwU+ji8u6GbAPz/hXm4Hcdcs6F56f7Dpiog+3EE=;
 b=zESaJq5T9P1+fmz/Ils2c0TqJfy8ISsL2rd2XXtTlpQw1RDhnRi1eINKZEsy1Wo/52U57mvIOt+aSp4VZVz96a/R79rB9OJ6gfTPSuW9wtAncaxrDccWjImK51y82mU1gzzRfZHNFKw570j9UlE7Zpgkli5QKZcShIV7lRELbz7Zhm+d5Gk47BgrtoIp/YePXPc+fI9lG6vV0c3U3Sthkr0xVhk4KfqrGf6+dZjnlDEAkwXnoOjucXW0T/n08Gc1ylUF/OYK7K78oiPIGXknUkFW5iDpiNe//sQRrt5XqCQqCrrN0K+BMvhtnPcWQWpNaD2NL2TjfASHoPT65LG3Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6S2fwU+ji8u6GbAPz/hXm4Hcdcs6F56f7Dpiog+3EE=;
 b=Xuec2gQgI2BpUNVdPgTDYB7I/0UqEWG+JJ13za87OHk0Ydvp/8bnUVvupi2ZMstH2IBfO1+evJOmVkStrIJ2Zc8t9YlVbnER2HGc3pEPJ1/lX4XcNSpNMD3h37bdu1NeafycAZ+mbsiMgezP4BzRADAQWD42Z9wgf7fPfU3aLAvzrTjL/vwLXlxrTM7xCH5Xftz9d3LdYOauj93p4Cx3wpXDx+MTL554TjSGr87xv/SfXEQSWvba+6O1UNq6VQd0/aHzRWv24QoBK9h1v0x0pitnOC/ONqdFgtryE1bS4Mof0Rx6W6OZlpC3jLdTnr62eOK5HfIhaTZJIQX+WiI4GQ==
Received: from BN7PR02CA0025.namprd02.prod.outlook.com (2603:10b6:408:20::38)
 by SA0PR12MB7478.namprd12.prod.outlook.com (2603:10b6:806:24b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Thu, 23 Jan
 2025 19:12:28 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:20:cafe::cb) by BN7PR02CA0025.outlook.office365.com
 (2603:10b6:408:20::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Thu,
 23 Jan 2025 19:12:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.0 via Frontend Transport; Thu, 23 Jan 2025 19:12:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 23 Jan
 2025 11:12:11 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 23 Jan 2025 11:12:09 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v4 12/12] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
Date: Thu, 23 Jan 2025 21:08:16 +0200
Message-ID: <20250123190818.3834-13-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250123190818.3834-1-vadimp@nvidia.com>
References: <20250123190818.3834-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|SA0PR12MB7478:EE_
X-MS-Office365-Filtering-Correlation-Id: 01c4b30c-7197-40ac-0fa1-08dd3be1e071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PPecYoNMh6CtrvEqLkRK5WwWl+BDozVzrye9ogt33yk75alcB/dgpWAKmYEq?=
 =?us-ascii?Q?RWG/MtfBQAIjf1AA71dQtbC+hmNGGUST5WK9qzIsVhNtWrX0vuspoiQYPbSX?=
 =?us-ascii?Q?VLhqMg5LxpzQJHDVMfrHCXy1HI7sAD8pbijxXIFt+BPE8lEYDSbx4hUIN0iF?=
 =?us-ascii?Q?GPQiLFv/H7XUomgxmmgwJZdFk3wYQXpP24YKBuCKYqTrjvkzZ3flg3IWaSIY?=
 =?us-ascii?Q?NmrE+6Rq2DyxPm20l95AemGGtoBnOmZDVyCy2QPNr+BthQvKAY44Ye4/kzKm?=
 =?us-ascii?Q?cpJLjS2w1FnUHWRCR718IE/09NtNPOw5E1yv+jWrEOj2CJihp19TMs6cdSIi?=
 =?us-ascii?Q?pAUw+geryIQCFvepuhZeCSu+RMgOrHz1HwdyRXY/53lGKMc9PhjDiKNDTlZ8?=
 =?us-ascii?Q?lrKYCNqQQvTVoAd8raCcw48aWUJhslNE5qdiTjtSad9tpA8Bz8d4F/8lyEXa?=
 =?us-ascii?Q?gaUq5DuqRsB9Me39Z5LpEk0kPS1fVkKHWV5Yq23dtxiDjb9LdWh1Zf1s3Rko?=
 =?us-ascii?Q?59GGZfziMGYjpQiYBDT1tH1mmVembTDSNAn4W2CSAajOdVtvskfP+FPcoLCY?=
 =?us-ascii?Q?tCFupXF3llUBHWmJtXqwA6ZT/xKREIi7ZrYRqFD+fueqcpkjGxr4Tl8IhBPs?=
 =?us-ascii?Q?jXVK/39+1o4e39PXiU/1Tg2V1MDS6llJLaa0W2ALbnI43a1SgqE7cREcEboH?=
 =?us-ascii?Q?BplHG8HhM71pwChR2VIil/MbUgB2tEJoz76Dfyfb8PsJCAPoT9Se+iNrq+my?=
 =?us-ascii?Q?UiU03mtCpEFNb8kJ2yLBwON3D9AMChRpMa9ExZkBs4ADUwOGFJoPz/eB7It7?=
 =?us-ascii?Q?hVrNU2MgMv5a+uUheYPjMH1XjRGfPc/cXwebp7S636E9z/9yq5abzagLHRJH?=
 =?us-ascii?Q?vCB0U1K/1k++yKBjraZMzeQuK12ZWrpF2SrGTRQnL8qTfQYWh5/JTHLp+9YH?=
 =?us-ascii?Q?M+LIjlAWW4rNNnX+n9FE0DTFkre2RLjwpOZxNvZzirtlStxp8BeEe2iY1HHh?=
 =?us-ascii?Q?7wi1iIrWqZ0sFQHLRUL2UxsPc9/CB4WkXIzNh61RwdB0C4BRzkNZdlAAN3fs?=
 =?us-ascii?Q?6GjbO7dpPO5VWnSkEud8krz/nR3QwQ/ru2jEWOBPq9J8+Swc1APqIXqq/XOc?=
 =?us-ascii?Q?0apFubQ1hgHEzdaG511uLiu2ofkfTMyoXUD9dUhuTdicxUK3TSkVLaZDFu4m?=
 =?us-ascii?Q?slRw8RRZYREylHLgzz8VDVeu2QjSh1k9cJT3K4BNNo5AuQiQHeifm/DI/YKJ?=
 =?us-ascii?Q?TX1EaZa9OSoJgY2qqux6UBOaGbZ4yFpOqbAeDZzfjJjdRJpY40JNzg1+ZBoH?=
 =?us-ascii?Q?jgJ1Mfzyh1sM/4GOltNkueiDhV2vHQMQUk5C/CelZpQliIBJOIuYWsZIY0f6?=
 =?us-ascii?Q?UOku4K1eezb2ayXn9WoRAzOGJhN04hbgB5Am67HqBKIluG4BRKKFIgnv96u+?=
 =?us-ascii?Q?+/KK3cwdU/UVDQnZjrwz9/cMMT6Bn9+uh0PbAZlSsoURD/pNcwSg6bcRqizP?=
 =?us-ascii?Q?uEZjEYJeyEVz9ZM=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 19:12:27.3633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c4b30c-7197-40ac-0fa1-08dd3be1e071
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7478

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

