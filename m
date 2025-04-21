Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F50144C63
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2025 09:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745227422; cv=fail; b=mDM/XWsUivcOi/hC5sQJXPT0EZPnamlJ9m83/JupcYoOjKSIDn7rsRmxDZevaFOF+c9T949tpv7B1Uy7oBiXMZk6KuMP8vYCLdUVLefMAbbTAfHvP0WAEqEO1HevgvycgL3RW5GmhtD0J8TBnWlegzdAcCWpAQ5XmFA4KcKfTjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745227422; c=relaxed/simple;
	bh=Et/o86FQuJ8K/qBZhN10h01Ms95x0ZQW4p1OspXCl+Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vl+CGjGS0WxNvgAsiEIpLVCi3gBQFcRwGhyDPJ5ME6XDR1eQTs2xI9oiWgZ3Hcha8b1LfI5yjGMTe7wL4bmoL5rFManHkPsvOKIezn/X977OTdfMZuONCEiGHBHvIFPn8KrL2jpAECRtvg2/h3RJ/8GODih+bdVnvT0iV9tCSTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Nvxf0t3i; arc=fail smtp.client-ip=40.107.236.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nvxf0t3i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjSuVRm5eHxE2tl5bbsSAH7j6ucn1B9H+oyMDuQqu2EWMX2rQYHjqBSpOn3/2wr2IKNIBWCLaXYulax3V9AzFmNrj0OI2XCJCF/R4JmtwBXQjL/J1VXpUN0Q35vz82X/m0lcRNkSWyUQBbi4vXgpArjUQOrs6mz8df4DOo0IV9jQq0FrmqmiDfKsdEOxWOmUKi37ullcq5BGsqL8lnqPC7QJDnLFfuGQQjDg9VMxiT6VIGfPhwaHUQDsm5KJkkgK7Houo8vc6hYxSZ0UN0GqE60X7jDWngnhutiEoq+ONKkA6oJAH5EajpKgOxIzeig2AKX06H85TzKV6bs5w8al+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmdossM9YQYhMVmNlW8vNIdMatV2pjxHih0Qj4Bq2s8=;
 b=V0pA/HSY2OwJHjLO/4Io/l/apfc+NYqxYblxc0DJ1yzkYmJEcfG/WnrC79pOu+nco7qZrQqnT/Z6BBh1YMa93H1EQzyBApiV/oNPad6eHwPK7b193EtpE0l+I/xZq/H1jY7PfpFfKtjnXZm3OBTdNApo8RFRDRfJ+ZodZo2ZmkMvhFgQJzW+91FQAO3oTSlB/Fe9e0ZQ30+/onQHrH1NLXDgr5KKtujXtAgitsvbpYIPMn1H4f66Dl2Ay1gDh0ydTuIw4YD3dTrcj7XGzkv7kX1f1MYyhwNd2w7vEFfAnIHvKxWWcgIZXmvEDc7QcYsTdhOAGn4kv2AYCFJgOn8pxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmdossM9YQYhMVmNlW8vNIdMatV2pjxHih0Qj4Bq2s8=;
 b=Nvxf0t3iEsnnUK7Xs6qawLPKe9ZHhdiG594IJdVpXGqzhzDN+VWGrLgAcuMnfujAD/PScm93ok6chsuK4t6slrgyoNy2/r513J0miqO5FEWoGDl/DiK54m0oK1YzrYEHaIBxYyPNxq4iiJyPkr1BgqD4fTOERHSm908VfaUN4yVThDSFUMS2YM3TyxA4Ok3jPES1O7o3UgYE1LmXmFneX5moQwipQEXEhsnMgWG3tVDQQg6ezukrhU3qWeChcO1dk9k+yqUvaktz2ugf7pjlm21pINOJd9yTqAr90s6bhMQKwETtTZvhVIVZxElhFHg1l5P1MKM/fPr1Rwx0Gyb0tw==
Received: from CH0PR13CA0008.namprd13.prod.outlook.com (2603:10b6:610:b1::13)
 by PH7PR12MB7306.namprd12.prod.outlook.com (2603:10b6:510:20a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 09:23:34 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::ea) by CH0PR13CA0008.outlook.office365.com
 (2603:10b6:610:b1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12 via Frontend Transport; Mon,
 21 Apr 2025 09:23:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 09:23:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 21 Apr
 2025 02:23:18 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 02:23:15 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v9 6/6] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
Date: Mon, 21 Apr 2025 12:20:51 +0300
Message-ID: <20250421092051.7687-7-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250421092051.7687-1-vadimp@nvidia.com>
References: <20250421092051.7687-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|PH7PR12MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d7b98c6-43b1-4deb-f084-08dd80b6302f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iyDmvN8JA7mjxKaWGcPrWAjq5JG7t+I9htAp6GISNcOatQWNYaQNnSphaZem?=
 =?us-ascii?Q?5NrdTG04s1ra0iDXigBH8PgF7+Z9NqsDr35AmlCtRqWie6qXBDaSkZgUiJTo?=
 =?us-ascii?Q?ZmvOs0LsvtZ4Nzmuvf++KbFcQZqxzmDy6SiZfqMH5De66ABpVGC8qWI0quJF?=
 =?us-ascii?Q?O2Yy1VSj6diQVU0DfPYM8C8Q3bL1TzPNpF1irODwTLYmrmScAjPO8auuqZvp?=
 =?us-ascii?Q?5wpHE93qiqvoJvT4f7ZKE+HxjZJ99hgs0FZsSiuWwLmuhIjVVW6bL7P2NR2G?=
 =?us-ascii?Q?hfHNphy1YSW3cdUAwS9CNyXlt4vHWKjO5WRNMW48uaaxAl2lcw90pJwEtY6T?=
 =?us-ascii?Q?LzWL/GWz/BosFrRDuAPDENyKrlCcDzdAvdDvGyzxaqOLx+Su1yLHZSFM53xt?=
 =?us-ascii?Q?pC3E2xJhVAg1rWaloUJKdTdLWR7o1uuS9iFxExVCV4ma2sW3YQsHN+20Wkr9?=
 =?us-ascii?Q?QwHfZhABeMl9FTVE5dbpZUeWgIVYDRZqIhx3rJ4/i7VuCb93Wm5ktpiVFFgX?=
 =?us-ascii?Q?CtqDyMzT/EtVIbXec+rmCgj7EIXXI51HRiLVmMVj0NznPuxKosqh2rWT6/Ik?=
 =?us-ascii?Q?QEfr7rj2a99nVK89nC61RulcDG1M71QB8lmniBp8h2iPjPCpWMGCm0aZ025K?=
 =?us-ascii?Q?mp7Zyq9m/e6uIqLh9EJ65GkCelnlUo0gXumKutyX+Vr+tzo1amZQRtcKtL/o?=
 =?us-ascii?Q?6aC8UqbTvJdl3SM28pVQHSGz+kfAUF3Tg7ZRQBgwsUSv2GEpaenghEepL7os?=
 =?us-ascii?Q?9aeP2i3ruUu/uZ2X6SySRb5aznuoLHAvufLnlvVyOOARGuhjQ/Fq/d0BSegO?=
 =?us-ascii?Q?eou+WYCbFhXOoqtLGJ6Taf07bD39IXuvwTqSIYUXBoxXDtYbqHKyFPwNQj7C?=
 =?us-ascii?Q?TbMpjcJOzI9rX5MZBAW8Slz1D6twRmDBU6d6rodnrjrXY2qnRxKUKYOcawzv?=
 =?us-ascii?Q?aX7jm3PSmPyKvsNgPqD+EkBAPFs2TCXiUjKuUI7UbBiMbsyZQh3iya0T7ZtL?=
 =?us-ascii?Q?27cBt3IOu+3ggwhCxr/mqxAEdnWSs2F5Cya/6UiGZqFZLudRVvNthTcze74f?=
 =?us-ascii?Q?cZOUVoiBR43pYrPq2ZlSMuyhlBBXNmGhr0f9jmyxBh9RXLShNKPWoQFqiKta?=
 =?us-ascii?Q?n/II3SK8ZCRAlV6rtGvua2AfoV2/Oj5FlZVdWg1xoncVSpoMrr6ubEhtRH8b?=
 =?us-ascii?Q?b//AetnI7HZFXckfpbM23nwgHX5qbyQ1oUETj/10baEBp0Fry9csA73RKwgC?=
 =?us-ascii?Q?ZpCo4TKOk45xI5ifmfABzsJWMOLHa/5Us3kv3EaEXu/W+ke145HMIiiFAUuV?=
 =?us-ascii?Q?GzBrzZteqLyGhgk4LVBmDKFBNPz34j4ikWSTWG7Y0LgAaMw4YFRYfUmxH9o5?=
 =?us-ascii?Q?P/XfX7ltVA253+rlkEa6wn6M71mHWpHzcpTtdUhpYR13iQjtLqMFy29sb4b9?=
 =?us-ascii?Q?DsB5ZKMVrOicm2bcbP/Pr/1nH56644ocBqMmO4qLJlwQxiGYHjapf6qw7rng?=
 =?us-ascii?Q?gQntvc6bqNxakR0JC1kROGkLPA9CXljWf7KN?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 09:23:33.6079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7b98c6-43b1-4deb-f084-08dd80b6302f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7306

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

