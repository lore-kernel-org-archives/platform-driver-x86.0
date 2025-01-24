Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0131591EA
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jan 2025 17:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737739845; cv=fail; b=DTvBc1TECSZpwZsKZxxaGD0/2VyYasA8EIGxBpACc6u2kRUflq1U/zjK3u6uTYsUdxugpxA26ctv1DLujtB+r06VdZoMCFZXc+EQWIeBjuN9q5CosL4tb87BpzOO7kEs5L5jQpJBMaCzxwskJs5rGIZmi5HjHpZ8sASPGn2hJoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737739845; c=relaxed/simple;
	bh=29E62jaDXqCKIB0V/AFpPgsc2C+LlZ3Oe3hOmXkDBJM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YqVwwIsATE+ZQtYdcq6bubUkYHRMKD9/vH8bSK8jmkgb6NVCsvXJS7oQXDFxo3TQy2ekxyEF57hn4vpbx6unpWCq+u6+y6EPpbEb+Sk0BreP4A7N/rF5heiNScsGrCJc0ZcP4Jvz0ifZZpukvbT60g6hrs1O3qf0ZOrvHnD6BKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XFXXbRjn; arc=fail smtp.client-ip=40.107.92.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XFXXbRjn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2h8ZCsIAbGatKk9RSB4o1vOx1XFQ1p3k8lhT1Yx6Yqj9Z+taYpO88lEW6SuZResuWZ9xyo5dj9uwENYzp/LqFAzjUae9bqXbn85JBrxKjKHWpGzZKhMq6ddaVDAIgfzfiPQEll0+/HR10v0dRnaZInzYhiuGlfpRLYc/EJauUDOP72VuUFTZoWU1NSNNM3iP6owhvLYDdoB9KlpaoEiS1DmGkEjzkmMN2crGHr1DPQhOnbv5yoqTgzF6WBo05oYDX48OUrxZac7AnXwRqjdekf3kHKlmeer9KKrW2tvP2IAhSGgVbLr8xporyrlc0ybFPqfMJFlc1YYw1S+Oqfu9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6S2fwU+ji8u6GbAPz/hXm4Hcdcs6F56f7Dpiog+3EE=;
 b=csvOnAZvQEzpndmYGtvn2y41epGtij6qgIIjMEXs/fa76XTKyyem28THWwzLdTCs3IoaL2czJKDY9UScjmtYPZ0PaxBSaOS+20PzD/ziWqqkW4gL0hogxIjGZ2pRui3kaxyX/KOU0jkcnyDIFtzWz+CKcaqix7dpcp4AB61Bg40slP7XQAAfd2UDPeXG8IVdnepZLE9sXdVAT5Qf/lB1Wp6gsEGzgEerOu+CYkYzy5goHwMf2+vM2IaD9jJzxSkaFht4OHo8pmLi2pQKJvFsE3oxfjS5+Q4VRuIhwjegTz9qsyfdzC0vyS4TPfosfrKcr7/w6ui/QobH/1+9lpqj3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6S2fwU+ji8u6GbAPz/hXm4Hcdcs6F56f7Dpiog+3EE=;
 b=XFXXbRjn2al/q8u1GUQJvEhTTADTowdifl8O4Bho8Zc4C9kYprCtL7Ji/qdwbFwwNAMPGfGU3OhToSTACQxGgJ3wBiaaC5a+z9NqoM3YBoAtc2AB0niN6MK0un+0H1FILLUgPcemTaeEXLZFuhzyL2byQI2eEDce1XsisJDNfZl3ulUE1yh2BbHcjfDx/yxovra5g1ve7XOslmRoYoUXcHN+bCVVqrHGiSyiqkYCbkfZsPL8WjPqWapk0hPkcMo+Xh7RDlNuUlqtUE4IOw4Q9O/g0gYawl1BoXT2QimiKJvedMard35wyCsWj7zK8PXGzb2FegroqdYRSISWhrl9dw==
Received: from BN9PR03CA0366.namprd03.prod.outlook.com (2603:10b6:408:f7::11)
 by SN7PR12MB6714.namprd12.prod.outlook.com (2603:10b6:806:272::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Fri, 24 Jan
 2025 17:30:38 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:f7:cafe::5f) by BN9PR03CA0366.outlook.office365.com
 (2603:10b6:408:f7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.19 via Frontend Transport; Fri,
 24 Jan 2025 17:30:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.0 via Frontend Transport; Fri, 24 Jan 2025 17:30:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 09:30:18 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 24 Jan 2025 09:30:15 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v5 12/12] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
Date: Fri, 24 Jan 2025 19:26:30 +0200
Message-ID: <20250124172632.22437-13-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250124172632.22437-1-vadimp@nvidia.com>
References: <20250124172632.22437-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|SN7PR12MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: 94202b9c-464a-4ad9-12e7-08dd3c9cd13e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KBxgJ8mHfwocB+VK4amrjhthft4znt7gqRtgWbYAiRumon7JXSW0VzUDKRKI?=
 =?us-ascii?Q?c/Wn3gvdyFKVFMZsO3wo7fX9AatJBum/MjatiO01g5o7TkX83xaHeqiUsuY6?=
 =?us-ascii?Q?PRjPM1Hub/meaKyvyJuGu4usGo4iIioKDuiZqBmbfdSa5RNxuavFFOWBzXXh?=
 =?us-ascii?Q?IsGVAiKc5BR4Dhz8CL6InNSBo4Jyo4DT0N8RBj47Myhb11O1rVAzNYcLtRr9?=
 =?us-ascii?Q?5gkuBtgAbq0o5xZ1i2BMKNWpyDNo9Z1BeKXeKCn6PdModekKt3wVql8tp8JL?=
 =?us-ascii?Q?GxrtYQFndcQosGhf/k4qaSJX+eth4Ih9bRbNpTtfd93Skp63gMVA5VechgJS?=
 =?us-ascii?Q?boY8JQdeGGoOqhe+lwFPTrrmrzTDlq2fnDvZ7inEPGEWTfD+wDTl+7xonVXt?=
 =?us-ascii?Q?XawnA4rpikCfYKT8KUNtyd12ThtZtEwJgHfyo2ePa7V2kdfevYC/syltL/l9?=
 =?us-ascii?Q?u+Ina26TJdHPEJmob2TpE4ot/gVIU3vRrT8Zt1pzTOOMI03mhPVTFt5EcfAd?=
 =?us-ascii?Q?qqLsHe2pB7/fT9j3arMc8csatKu2BfBCKv3pVPvEtg7z49HOjI9mGeV9hKVb?=
 =?us-ascii?Q?sT6Kl+jdl2KoceQznUVXaPmmIHbyg+qEFX8z37dmFC5cmUezh1lpfKv1v8bw?=
 =?us-ascii?Q?1lDT21FUEmY4GCYo4Y2nAekuh+Y8X6CdZD9zNewUPa4bnNfjd8CT8oW7k3ag?=
 =?us-ascii?Q?dhFNOCh64Lda+baARzOjhMzWl+NosSBvlWIey/Ktvwr4Ap3z9R9cCq1KdZVm?=
 =?us-ascii?Q?oc+c7203IdTxFFjt39vCyxNjq6oLOnvM5gw1XBQZnyMRdWV+FFmSq0vxHo7Q?=
 =?us-ascii?Q?+1WzOZMMVfWdW1rXpwHvvExRPiOpXMsXT7JfdarHN8GI9azB55z4gcqJo5o3?=
 =?us-ascii?Q?nvOcKGBD/LzsXfJQVDyW5CVFhJNrnN1MH5gTHPelKrm/FxTV4Cj0Hqo9A9ot?=
 =?us-ascii?Q?ZoXY0KhDzB/nAyfr6wMNveQoXr/sfUjiQxOOlLP1gelQmz7iLn5SmvzSNcTF?=
 =?us-ascii?Q?RTfKnJY9NSWLXINLWHWt9ajBReap0JXP+V2FZx1EnWl+RfKHXeHeRELRWLv9?=
 =?us-ascii?Q?9HXRRNQ2j5HJsGqjrFssvBxGj0zP4I/s94RCvJ8yWs3p0dtdmZeG85CwEgF4?=
 =?us-ascii?Q?5UvywGP4mnXXQ8QvgFGyMsjDEKgA9UC8rWCvQz1XnMmrj/bR9cfx/COaqm/y?=
 =?us-ascii?Q?yCa+BLHgp6XA6pczuuFJf4RUscWbrmmz1uxIRyFY8G9fsNosolJzY0A+cTP/?=
 =?us-ascii?Q?CvL3ex4xig0lPjeltTd1PYI8WTqV82sza+7I690LxKyKnnAbYbEtlFaB/xHx?=
 =?us-ascii?Q?+zuRTY9tOFxG9hieXLmCv9WUmq1vCqG3usJg5kRM8holf0e3p1QTBl2J7lcL?=
 =?us-ascii?Q?UMGICDObHc63jPZgLsbrcSyTQiW/nOKrcwpfI4WDoZlaO0XYng19e8S8fqEU?=
 =?us-ascii?Q?Jp8gYk+XkCf6z5HfmseTwqnuQ5MxfTRXWxgE8TGaOXD87MJzAWnToF7z0yeR?=
 =?us-ascii?Q?e9wyAjzsVvJc+0A=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 17:30:37.7361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94202b9c-464a-4ad9-12e7-08dd3c9cd13e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6714

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

