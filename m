Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2054.outbound.protection.outlook.com [40.107.102.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53491F12ED
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Feb 2025 09:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265724; cv=fail; b=KpVcsDryT1I7i/MeLA4txLFae+RIU7rWgu1G7aVFUuvLsVfqMQMFBxbYwFF/TuCKuZcumlDm4C+NW+WU3pmBsFMhJK9c7ybVryN6EMc4vOlZyY6D+7XMU9NLjYLNzSsVy2ZRKq6KMGk9UN8RGbUodhpf6Rc/plL4tAY93PfmyvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265724; c=relaxed/simple;
	bh=yFkC7cVi7v4jFn/F4PYgTh7Cn0rd4UJPuvpfNMXe8PA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jSJmKJIE32rFSZjR9WMtpCdnv05p/SQrasSkGO2ozPMv8lyoZzvLoXGcAY8hW923zkWamPpus+VGbdMKgug1Njd0ClC959LQXYiZttsqYwbDYLh33ANE2Ua05fFwQjgDTk42ZFIZTik+HxyVRGfEcn4SwoBSPVYc2NKb4oLmSsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W6EiQoW8; arc=fail smtp.client-ip=40.107.102.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W6EiQoW8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k34wGyUEym+Dbvkz0k+Dl/mpeqsEouXVfZQMUI9cmOv9zezzHuFo9cYi6Ze2wlqWXMRuyYyoR/1e/bmcecKdAe7LUV3tL7Cfn55fd5d8qtZy108e6ToEOpsaZx1U7T4p75pZaUkdEzfXnNHv6fDyf5qflS3k1OnGR+VtGjp1NQmzvbpxdJ2RKAqi/rGY1bgBaGXGmdNtmAe2oYsjmHLoygWRpoXrktw2y0uVVtcYDjQQ1HC8pwHG3YEU7lZvKbPHbHl1vBj8fuGDjbZnbzzN5e+SIY2Fmpizj2lpHrAey9WbUitrPe7Jk1wDw6l/aKFgQqmwp/dgy7PW+BSzKvyzLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6IdSP8U/mBU5Bs0l7AkFc6Z3DDiU3CzUmjXYuMZUBc=;
 b=gD8Be7bPhob7dfQMYFjdXutZkIsmQP1j1H6LsMHH0VNNYx+4GQhFcB+N/kiwlTJMD/n9AmDWHXVaT2FRrHaBzNWCAdhZlUVy8qQdY1egJHs4uuDAGQmTJyLVmyOXgrguXXoiC6AGwKyWfYKxVJCz+SLuViKUks7JScQ7r16eltafrRxIXdhoGlvZvIxi9wcXb/r6t62xSspwgaFmakDvcHf8EbvcmvEcRp+GWp5Dmpo3ICH1OpDj80YiX5mPWp7A7oI5itLYAJLEdpdhhu1G7Ycf2YSD/hYR9lHBEco6bh7ixRCy9U2lyrFafGCPtcgdUq0EHkbOTUa3kGo3qnYtQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6IdSP8U/mBU5Bs0l7AkFc6Z3DDiU3CzUmjXYuMZUBc=;
 b=W6EiQoW87ys+qPn8gnapOMajJ2jsQn6VRRqGVH54hRg5m0wmjyx3Z42K8ZgHwAArxP+Z1uKjSHbXHHdiUhveu1+iETK/eQoTuSrv3VXT/yAIKI9WhryJ44ZrOGdzusg/QF5g/pkx76Hstv/7GROOwGEgTQdge0Trvz5N1PO2CgXyM853raWtU2x8HOu1un80INgrL04S5nhlAwYMl9dfc+t2X3OpO8MVdk5h9ItMQN2aGizuAkNPJVWYOEq97RUaMlBxssTxiL5xss6vLvNyQ3U9HV+J1m6oXrJjb1/Jxh7gRg0WUpYvm69tQ+EtPNwLUFduw/j8alPba9fev8eS+w==
Received: from MN2PR05CA0044.namprd05.prod.outlook.com (2603:10b6:208:236::13)
 by SJ2PR12MB9088.namprd12.prod.outlook.com (2603:10b6:a03:565::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Tue, 11 Feb
 2025 09:21:58 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:236:cafe::7b) by MN2PR05CA0044.outlook.office365.com
 (2603:10b6:208:236::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.25 via Frontend Transport; Tue,
 11 Feb 2025 09:21:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 09:21:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 11 Feb
 2025 01:21:44 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Feb 2025 01:21:42 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v6 9/9] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
Date: Tue, 11 Feb 2025 11:19:12 +0200
Message-ID: <20250211091912.36787-10-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250211091912.36787-1-vadimp@nvidia.com>
References: <20250211091912.36787-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|SJ2PR12MB9088:EE_
X-MS-Office365-Filtering-Correlation-Id: 627801fe-587a-46cd-6d49-08dd4a7d8854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?llmNhBvl8bAtaWdeE9DBzNdW552seiannOw25cg/E+U6zoJNMbtLutrAXiFC?=
 =?us-ascii?Q?s2a8CaSB6nQbakomjZbs32BDELNCodfPFoDYiLad+ACWMXUp8bDkLxZY65On?=
 =?us-ascii?Q?3TYUfB/B+xXzT104pm31WFGawVNtLNSK6KqUqPBAWuQSQ+96xaw+jK9/iYUi?=
 =?us-ascii?Q?BLcZ7tWYvdhi1HrVmkoUsdIBD2XLz1w6UA3WcTpw/UOBAMKCeKdNEs2zJDvn?=
 =?us-ascii?Q?edOCWRn0dCPfofznSSRPdV1Is+V6y0H/YgK2r3X7FF7CdzM1no5uAPEcxRgb?=
 =?us-ascii?Q?tSRyuAqUmTctko88E5AMcDqVdeimnmwNr+F2EnDdRvkELEjTe/IPC7gLWr3s?=
 =?us-ascii?Q?g5ZLI5/ubt4O0vFWzhU5TCSPOVD5xrK8zkExF+Tph7PZEc2KZipWpcCML8Xd?=
 =?us-ascii?Q?qQnIzU+BzOP2Pj8xVaNA4ETiZeBaFLKGD7iug9B7SkbXQn9onG+c91RbGiHY?=
 =?us-ascii?Q?mdwc93DbHG9vZJpsWok+DUCLDKo/qBYPCfuDpy0V9INzxNkqEqOxweXNfzM5?=
 =?us-ascii?Q?OxhaZR+tF3++VvBtQE5Xot/yElXOH9Ct0zr0MM4zwHcCiiZVFxY96kiYD7LK?=
 =?us-ascii?Q?sXgM60xja1FwuHM1wftt5VqV+2apKoxOD+Ye1T2oWTTaWDXx3Lap4djCWHaN?=
 =?us-ascii?Q?cfocEBLP2xwaGK5ISNIttewYIhq8EtOPIqw2l5zgY/SO2szPj2ACMSLM2/bO?=
 =?us-ascii?Q?o1vxhpfGymvaSa0ElPQwhYZd82ZRSX+09HNMLcIDGW7079o0IPjs3DXUArCx?=
 =?us-ascii?Q?AkuhrqVPh3aqkO/q+vBXkS4N20zond9WvUfVfrESuoV8WfL6mbHzlp9BI6Cf?=
 =?us-ascii?Q?H0HzU7UDLsZvEYETIbGiVwR2I0PIK2e1BBrOxPE+PTNcOyCprY5lI+iTdXBl?=
 =?us-ascii?Q?KkmsTNcAd1Dha3hB+UiPjUri6R9UzBzRrWGAFtDEh4yCEY6KcpEFGBiyvFpl?=
 =?us-ascii?Q?l3f2C75iMDOzkFIxn3ZaBP9rAyG8lALYTjpC4pVsVtp0S4oX8DPoxXKD379P?=
 =?us-ascii?Q?S0GopLaKV0YP/kn8C6HzRia81STRKvJlfL+Zoy38m8Zs6eMKobw1C9UkQ4L4?=
 =?us-ascii?Q?3M+1OxqKv/WwqNIcM0ipBqEM0XfjmDvfgXIMJLXqjjE2/pTQ6dOu+mJqCXH7?=
 =?us-ascii?Q?MeM59h3y9c+UDBq3REYT9iph99ltSR3Zjs0JIsqsZun0TGvvq7T3uK6znDyf?=
 =?us-ascii?Q?j1EmAb1OMLTKuQLGFwfjDIm/u1Gy5H8FcHDKX5F7cGpyt1srz0O0zZX2SxFZ?=
 =?us-ascii?Q?uBxIHcoAbBmSeTpVdeUj9hAcwaXQTrdnUhzoDfTxleOZK0olE2icVleb5qXc?=
 =?us-ascii?Q?BGi9FOdIqeswnyzVxxtquqfpHWI3fZwnHSzFppaOSa1oFknQpp6mkM5P9gQE?=
 =?us-ascii?Q?D/3NDpF23j7d4C/JRCtNC/bjd42VUF/pV1Ht4R0r7kLovguKRbOjjMUte6zl?=
 =?us-ascii?Q?P465Pqz/GugxmdXBmZbtaTce6dxpubmj8JyuJf1CPj/7QfNyCLVv8MCnL68Y?=
 =?us-ascii?Q?UxCwe4O6uqiE//w=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 09:21:57.3049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 627801fe-587a-46cd-6d49-08dd4a7d8854
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9088

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

