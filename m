Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5B5249F9
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jan 2025 08:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736758051; cv=fail; b=NPVDQBEbm6EwGntypM0d13BfuTrNIWblCKnkHxxTaoO8WBzZc/R1m1S4m1/0Ejr1oc/QywhZz4P0XmMk4808xUk1r5FBxswVjKFaKeLxu1FpsKX3ZiLbjJg0OY4VK2yjQVUJFuucO9JZ4aRc0bvT5HnQF1dtr//AjIc5NvaACvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736758051; c=relaxed/simple;
	bh=29E62jaDXqCKIB0V/AFpPgsc2C+LlZ3Oe3hOmXkDBJM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mXspLwAMWD12hzg87LT4eTK49HD6Xr5OfwoqmSZED/X5X5MEDiy/v77KV6p0gbG9DT6nCctisMnBqK+VXRndmsMqDXpX/7mm7U7aDRxEp2jLLNmGvkQ9nUpQMon7K6ts/rKoc8DZzB2XOnIe1+BBoubzQsfQWsYzkhhLnVEPkFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=V9zuUJlv; arc=fail smtp.client-ip=40.107.237.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="V9zuUJlv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H34L9y7YsUwAcso4kGG0CQCWnmuydYLxE/yTDcg88/9qSCP1DmdWAN4owEsGGzQjOxwepna1LNS3zMz17JUcgH7xUfHTIevHRamWml6BO82zKDgApqJczGUbvR2oZQ4nI8ASR80AfSaeogaTb4mLCgiCOOMq6cVKUieErfEQpbV2YFO/2iDhX9kzbaOn/jiLFGJPfPLyvicLolYHW0jpn/H9GUJfafbk0XuMN5oSzWm1tUXuMQdjEH6w0O/QUt+DdOTK8DZZUB/CSHqkX3plCKkhuTuYvTTZh4/L7KObz0EoVpKUmkJ68m076zrq7CQeOsPSyARM8GV78ZVDAD13gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6S2fwU+ji8u6GbAPz/hXm4Hcdcs6F56f7Dpiog+3EE=;
 b=vVuQWk/cPyXJHeq8ZV6l4Jeu97i8DWVCQpIz1t75KdQDezfcGVFccmbZWNQpSVmqAXd4gRczwOVNTSlDf4ouwovOl32YgFgi0NlzjTGZDFshN3h9npDmpM3yvSjFfzKy8ho5k57aPuOCTc5Q5KZJCxnZtJfbxpKrw/TqgQuML0IG/LG90qxmrGcISwQlYuAtULSkywQXXq2LuVEEx0+f50bZcPOm2wgC6zvi5sUUjMtHSLdCzutJH+4jwdUYKxMMtFyAFOFAm6QdDYAk/OTAOPrZassNEamsmlmOvlh4RaivnXP9nzL6nbnkRkGWZpl2XJUFSJY+4YBfPBrwA/xbsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6S2fwU+ji8u6GbAPz/hXm4Hcdcs6F56f7Dpiog+3EE=;
 b=V9zuUJlvy0g7FhrI3z6PocjjCFw+Yt1+sFFTAJHizTnFZIe7CjnQpzPuWG05O9IPB5UUfNwKtAAuLQ+fYc6F+ZPftI2DzSYnW0zIqjIYstKiI3jGBRZQYzuAcBnJb91d59dtk9fFuRl9sZHHA0qCBthx37cvIf7EGKko7rei+rotX+/W488kyYV9f1Rk/6nsV9oKY3JOHK19eYiMtTcPweN6+mRbrN990ZvaSXy5h2Ahoft93KvjO4OWEq+pX7UL1JaQtqpMGQG8ILL0QNiBAPmzwv/LMV3XvMDu3TGLPA6GckZXbBGKuoesUYLtusdN7yfF+Z7xobBp3Csj+ExFcg==
Received: from CH2PR02CA0016.namprd02.prod.outlook.com (2603:10b6:610:4e::26)
 by MW6PR12MB8835.namprd12.prod.outlook.com (2603:10b6:303:240::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:47:25 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:4e:cafe::9c) by CH2PR02CA0016.outlook.office365.com
 (2603:10b6:610:4e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.18 via Frontend Transport; Mon,
 13 Jan 2025 08:47:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 08:47:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 13 Jan
 2025 00:47:15 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 13 Jan 2025 00:47:13 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 10/10] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
Date: Mon, 13 Jan 2025 10:43:32 +0200
Message-ID: <20250113084337.24763-11-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250113084337.24763-1-vadimp@nvidia.com>
References: <20250113084337.24763-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|MW6PR12MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd0765e-8f4d-4d21-36de-08dd33aee75f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?acCDZ8ksNWblNo/aNR7+cozDZGIFUrx59rbY7cZqP6EJhVnsYT1g9A4jmqUV?=
 =?us-ascii?Q?aNR0Q0EGbLQAIOQEwXgASl/aP0RtIlNXb1tJuZygzp7dmn4MGHueBL7c3K19?=
 =?us-ascii?Q?EkOwXaGrawXYt8XewSDS0IZIgEG9HiLKl/GJ+EEShkj3JfI02p42G3ZNwq3E?=
 =?us-ascii?Q?RzqLnCALQ/QvR5G2bez0y/f7oom8WG/bRB2XlCq3tFcgIpIo2AtkjL7W6rZ5?=
 =?us-ascii?Q?YQo+ha+r97DEn8N5Hxat1Xu7FrMU4Gb0Q8Ne6ezKJW4sbX+21RVCil4fAZnY?=
 =?us-ascii?Q?wein2Us8LI6BJOS78Y6h3EKke5NOKy5dalAaCscz31Wlzl5HNAni0dkqqFq+?=
 =?us-ascii?Q?u0wn0klMAAWVQ7ZWBWgmS1jdzbwBkYO+p4KQJY2aZ+wpO8flT8aLJyFTqUFi?=
 =?us-ascii?Q?0gu26QHrCmTjQNmjdr4/PuQDGIL8Un/8KvGdaxe9gYEJs1XVxxj7SD2Ll0x/?=
 =?us-ascii?Q?HOzUw4oXPTQy062ZjzN89HDH5RzPqFe9eNgIXIxnztWQpg7UaUp/92Nidqwc?=
 =?us-ascii?Q?74o8LL6q6m6Og14Bc+0Npe4jaPWSCpx8sA2Mxj3rwNe6aduznqB1iojDhPUz?=
 =?us-ascii?Q?tkGiBF1SsMSAr2tTV2ThIReLDvSOa0706N0tMOC9nlOeCtsng0mXUaQ4i6U8?=
 =?us-ascii?Q?VsoPAxH41dQLM/MaFKAabaUl+IGze0mgHASY4v0R33Ei8iM+Pr2F3cTspZf1?=
 =?us-ascii?Q?p0M5HAQ/sm9HIFooFlAb5ONz969ky07olE0Ygo5kE2t9/cLruQXq1J4Pa71m?=
 =?us-ascii?Q?LWxD3QtDXtzoNTDca0+HlWzeu0nGyvZVfT4NexlcSLsVUqEZsLek1eXVQ7rd?=
 =?us-ascii?Q?VNwvA0mmGcqb8+iLaqoa8gwyFSMHI+sP3c/pFGSemFM0si6oYvUzkb6vbUih?=
 =?us-ascii?Q?FolWpmpI+Gxe97IwP8JLcknUgeGxQcRanX2gNUlRS45aDpqSo+T7z9Yn2RqK?=
 =?us-ascii?Q?by03RmkLM7i37MY0STFCAIqnCxUQVDfNVhE/Rj7L1bbFxub0CrNmUoHf+g3N?=
 =?us-ascii?Q?AB1UwHjuFQ+u4P3zHyE8GpHYO5Bg92CvrsTqCT3oDBYlGGQGvH6kqKAGpLcJ?=
 =?us-ascii?Q?K1qilyEaZ39P+loiMyxxJxfza1g1a/wA6YAOCCzvLEvTQ7p57tU15m9ccdo1?=
 =?us-ascii?Q?7mTTIvDTEw7Sro55MgcOrxefaw3wu2Sa9sqi3y0jBKeE3AvMPEFFkZBKwEL1?=
 =?us-ascii?Q?m6sOBSd+3ztczJgx8ZjKUfxnHuf5FHMMTxJz5jwZjUS14h+Wf/rbE1rgmm+G?=
 =?us-ascii?Q?IyWaTQR+eMnA3pXMqpufbZz7bhaV67WaUMDruqb5MHspuVQOVvLd8MkmF8Pk?=
 =?us-ascii?Q?r4Fuq3pQNQeWE5D+U/ktqnwWRp1IHt5k43Zlj63AQlQlYpmcjbGN06FzWMoO?=
 =?us-ascii?Q?k3hCkdS/U6gwDZ8n/h1cFMKLNfVx66cMw9U8+3x3T/XBoF5HKF0qa/6P8fg2?=
 =?us-ascii?Q?saVVAY4jAckVtbL9fGivXL6/ez3uMT2jy8+cehmt4NblV6MydMdu+LWXO/hA?=
 =?us-ascii?Q?fM8KTEXzH+wW3ck=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:47:25.3862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd0765e-8f4d-4d21-36de-08dd33aee75f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8835

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

