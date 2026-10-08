Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011052.outbound.protection.outlook.com [40.93.194.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F74934C98C
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 06:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440288; cv=fail; b=u6QKmO2NsWffUXPSOopu03vHJkK/hm74NMt5oJyYyoMw5sVXt7SHf2jEe3RqWDBycF+DJeM950zr9pr3QT1EANYcvxPdNplABjspLJIetlCynbK0VSOTQifm3LA5hGG1N6/s5PG4YqqDjWtSiF/2x8F3x8gA1iOlsv+hSlF4WYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440288; c=relaxed/simple;
	bh=zz4nR96VxYOUJHxjumqum2wa1+4jMov08DqIrwrISqQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tH9pdOpxe4UAg8sHSMd/eGZROcf1lkNx1AzPVrVaGA92v1gPlozFVFAtdU2hBO5H7jCqPiU2VpibDOYdWW5N4cNCoWJV3e6YnEOCyzbMm+fnRs3gwWboMV+pHJb028A3mDrr3f7SVLeSC2LTyFp8HYYsBpSi63B20u5rA3Cr4pE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ogmx026k; arc=fail smtp.client-ip=40.93.194.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ogmx026k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EunVG0jerPcd/q8f5E3w7b+rBCYWNtDaQZJie1ViMjf6Ht2EMpy4N7sg0YxjkuuPCke+eUqWaPU07Byxc6L2Xgoak90d5Cy3aTbH9z9ClyqyTqFDCm64TAAcShbd2UGGkT0tFhk5axfB7jwNXaNfvm6brxq34cgsK76Bfv7j/MhnWif/sjBogvE9egjywjOORdnY4pZclLFDAA2hkP2/BN+85daBul08khZUaua6qs+oFkGslUeFtp3qHFDe/3QZ/wcwBoxiB6jJBZLy9xVtBObDND2nxZPo5PRO3Lbv6X0jEIFo39lW0PTw5RICAiWaVbWkqRo+nGxke1mAiiGMjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NS2JRsD0xA522iiqMIO1HQLTE/oaplIYbgbpDo2JTMs=;
 b=S9ENrIplb6VQ1op142QJrHVvPs8dQ+8iMi8fypixdir/6jiGDjKHaC/0oIrTX1DA373k/aYD7/2P03oEfDGZLSa+S2pp7vGRE1+U8XzvZ4oWWmH8MzKxqg79rv21qK1F7tuGO5eZeXzUYjrkTS93rKPYLRe31C7lLJq4CtRMnxzz4YTJedj9o6FUfYfnMSrmr0Sj01lUQCMc8CGdqF3BRXGEieUSCIokyRZsBZaKjuq0qDAAXyxzQe/kgDfvlcGZ2+FGwLodUXhJ8o0iw/6dMV0aClAvwndStDuO1GHoNwq+wSPOyUNOVam7LW6xMmctDaSJDtXqgi1H1jT8LpERJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NS2JRsD0xA522iiqMIO1HQLTE/oaplIYbgbpDo2JTMs=;
 b=ogmx026k8uDinxzpm+xxVOMtTb0OdtS0+mHHtikdVaGSBBjbzaT1Y5NEWq6zshJw9db6awCVkultDxSFYs4INM8VhouZtblh+rEVf2fFb1lRe9yfeZVK7t4V3TE7WbyhC7aW75Yy2OyYlWLGNOW8fmB7u2fWTPvzUc/sjKUvKDpcXWqFwNniGklUpg/GINUBER1w2VxYgjMbfsLkPyGuD6ZWX3c0/8v1LmC1bUY4ujCIaj6semF4wnN8vTz2DgVCf73CCDmM12EUqvKEVluTHyNwmtztfTuupzeUHOY9SW+vvZokbvJJtm2GAq0p9Q2XWocU4RY/DNHdVs9PxuiwPA==
Received: from SJ2PR07CA0009.namprd07.prod.outlook.com (2603:10b6:a03:505::6)
 by MW4PR12MB6707.namprd12.prod.outlook.com (2603:10b6:303:1ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 8 Oct
 2026 06:18:00 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::a2) by SJ2PR07CA0009.outlook.office365.com
 (2603:10b6:a03:505::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Thu, 8
 Oct 2026 06:18:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 06:18:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 23:17:37 -0700
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 23:17:35 -0700
From: Felix Radensky <fradensky@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
	<vadimp@nvidia.com>
CC: <platform-driver-x86@vger.kernel.org>, <fradensky@nvidia.com>
Subject: [PATCH platform-next 3/3] platform/mellanox: nvsw-host-spc6: Add support for SPC6 air cooled switches
Date: Thu, 8 Oct 2026 09:17:04 +0300
Message-ID: <20261008061704.794379-4-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008061704.794379-1-fradensky@nvidia.com>
References: <20261008061704.794379-1-fradensky@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|MW4PR12MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a61052d-5c12-45d6-793d-08df2503e721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Gvxnr+jX4jvMZhWn5zS0zfiJAUhPH1/vzr14s8w3N3CFrr98tR9LmquxCK4kMKAe+KNCXpIt5Uzy6ZEuyBEcK6hiQWKcBNeljgGvnxxDSLNMmLbSpzojchPPBPcRYmPhBB/OG2C4T0AIUectlqBnmX+ii8U9oFEOOOByIyrCHs5DVMy5VFK+yj8sVYBFXkZzA543javySd4H1ma7yIDqfDdflod01MvEBbjdv4OVk9nyuE7YCy0tWMOcExXek1nwdZedur6Mtl85Fw72J5QkF6JitlqfKg+bbF909VbMWcqNCzICI3bxv575juGGLyf5JFOxY6qCtYUGXAqSo8p5HKCMahMS16pM7/9i8nSZfadTlXSdgB788mFyXLAW7BSiDFQWB0aPxlSFdaMIetiVmT2cL85E7y7UP0ScdfFWsVXZeEKLQqlk4kRnr+TRzUJqyVuNqAOqCzGn7uqWKao9SgB0JijxKBktk6joIHyGObjcBLuOXLVf95yAebZjHJR6LbOJuYsOCZ4mVYGqCRztmy1nJVc6ic7qf4X6tHsGg0odM/m1xmACEgPg7wGLo3T9AgmctOMkJ/KwYsWjGlBILLaSCLkIbjGFM7IRvSGV5WoLj34i9UXwEZce0ehbePb3Il7hcIXYWxbAVopTuUKKYEZ8GZVrmXjtGVZ17tx5i50RtDIi53teLcj2CmAfB001iBCSFZJHnQQ0NUtozwqEeg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4rD1UMb5Rw+34V1QcymXgQmh00/iNziQShHicGAYtcmC1feJbZN0n0fI42kQ4XFztco1vPsBngMD76XqaF7LxvM7iAAW6iuL49kdY7+HNf/e/0MeC58oDZT+CLntDE7GJTthuKrl+PZnfXDml5DHjO88qomXq96lTr1smAoPfEfeEhsuXlMvD1cxuGEeUjsrrRuqwEeZsQTgxAPpTArF5Df3r+qnYEIIm88I6Jqmqrw5QAkuS1SjzwAxlYstATy82DCwzIdWMO1uUVOjnRy45QVzu9vd8ZSbFT9zolYto1ZyhfK4WhmRb6lzng69oenl6PNQweZ/rJXidSGDpKO+bcwtRIqHgzotHWQRevweM5VfFVUK15PuIZM+CWkYcWlynOrA7/BbrG2xIQ5myt4uwLQQm4Sbz3A4DgFMT5xEbu9kTVTUX/bPvjmDBKpbhWiX
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 06:18:00.1455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a61052d-5c12-45d6-793d-08df2503e721
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6707

Add support for air cooled Ethernet switches based on the Nvidia SPC6
ASIC. Unlike the liquid cooled systems already supported by the
driver, these carry their own power supplies and fan drawers.

They therefore expose a different set of register access attributes:
power supply presence, AC and DC status and alarm indications and fan
drawer presence, in place of the coolant leakage detection and power
distribution board status of the liquid cooled systems. They also come
with their own LED layout, adding power supply and per fan drawer
LEDs, and with fan control.

Describe the system and select its description through the driver_data
of the matching DMI entry, so that the board data is chosen by the SKU
that was matched rather than by inspecting DMI again.

Document the power supply and fan drawer attributes the new system
exposes, which are not yet covered by
Documentation/ABI/stable/sysfs-driver-mlxreg-io.

Signed-off-by: Felix Radensky <fradensky@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
 .../ABI/stable/sysfs-driver-mlxreg-io         |  38 ++
 drivers/platform/mellanox/nvsw-core.c         |  53 ++
 drivers/platform/mellanox/nvsw-host-spc6.c    | 592 ++++++++++++++++++
 drivers/platform/mellanox/nvsw.h              |  20 +
 4 files changed, 703 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index 1ed2f071ea62..b114fe95ab43 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -972,3 +972,41 @@ Description:	These files show the system reset cause. Respectively:
 		the last reset.
 
 		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu_status
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu_ac_status
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu_dc_status
+Date:		October 2026
+KernelVersion:	7.4
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	These files show the state of the system power supply units, one
+		bit per unit. Respectively: unit presence, unit AC power good
+		and unit DC power good. In each file bit value 1 means the
+		related unit is present, or its power is good.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/fan_status
+Date:		October 2026
+KernelVersion:	7.4
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	This file shows the presence of the system fan drawers, one bit
+		per drawer. Bit value 1 means the related drawer is present.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu_event
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu_ac_event
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu_dc_event
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/fan_event
+Date:		October 2026
+KernelVersion:	7.4
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	These files show the sticky indication of a change in the
+		matching status file: power supply unit presence, power supply
+		unit AC power, power supply unit DC power and fan drawer
+		presence. Bit value 1 means the related unit changed its state
+		since the indication was last cleared. Writing 0 to a bit
+		clears it.
+
+		The files are read/write.
diff --git a/drivers/platform/mellanox/nvsw-core.c b/drivers/platform/mellanox/nvsw-core.c
index 81b3e60e8358..62055f843232 100644
--- a/drivers/platform/mellanox/nvsw-core.c
+++ b/drivers/platform/mellanox/nvsw-core.c
@@ -40,6 +40,9 @@ static bool nvsw_writeable_reg(struct device *dev, unsigned int reg)
 	case NVSW_REG_GP5_OFFSET:
 	case NVSW_REG_GP6_OFFSET:
 	case NVSW_REG_LED1_OFFSET:
+	case NVSW_REG_LED2_OFFSET:
+	case NVSW_REG_LED3_OFFSET:
+	case NVSW_REG_LED4_OFFSET:
 	case NVSW_REG_LED5_OFFSET:
 	case NVSW_REG_LED6_OFFSET:
 	case NVSW_REG_LED7_OFFSET:
@@ -67,8 +70,14 @@ static bool nvsw_writeable_reg(struct device *dev, unsigned int reg)
 	case NVSW_REG_VR1_ALERT_MASK_OFFSET:
 	case NVSW_REG_VR2_ALERT_EVENT_OFFSET:
 	case NVSW_REG_VR2_ALERT_MASK_OFFSET:
+	case NVSW_REG_PS_AC_2_EVENT_OFFSET:
+	case NVSW_REG_PS_AC_2_MASK_OFFSET:
 	case NVSW_REG_PS_DC_OK_EVENT_OFFSET:
 	case NVSW_REG_PS_DC_OK_MASK_OFFSET:
+	case NVSW_REG_PS_2_EVENT_OFFSET:
+	case NVSW_REG_PS_2_MASK_OFFSET:
+	case NVSW_REG_PS_ALARM_EVENT_OFFSET:
+	case NVSW_REG_PS_ALARM_MASK_OFFSET:
 	case NVSW_REG_FAN_EVENT_OFFSET:
 	case NVSW_REG_FAN_MASK_OFFSET:
 	case NVSW_REG_PWRB_EVENT_OFFSET:
@@ -142,6 +151,9 @@ static bool nvsw_readable_reg(struct device *dev, unsigned int reg)
 	case NVSW_REG_RESET_CAUSE1_OFFSET:
 	case NVSW_REG_RESET_CAUSE2_OFFSET:
 	case NVSW_REG_LED1_OFFSET:
+	case NVSW_REG_LED2_OFFSET:
+	case NVSW_REG_LED3_OFFSET:
+	case NVSW_REG_LED4_OFFSET:
 	case NVSW_REG_LED5_OFFSET:
 	case NVSW_REG_LED6_OFFSET:
 	case NVSW_REG_LED7_OFFSET:
@@ -199,9 +211,18 @@ static bool nvsw_readable_reg(struct device *dev, unsigned int reg)
 	case NVSW_REG_VR2_ALERT_OFFSET:
 	case NVSW_REG_VR2_ALERT_EVENT_OFFSET:
 	case NVSW_REG_VR2_ALERT_MASK_OFFSET:
+	case NVSW_REG_PS_AC_2_OFFSET:
+	case NVSW_REG_PS_AC_2_EVENT_OFFSET:
+	case NVSW_REG_PS_AC_2_MASK_OFFSET:
+	case NVSW_REG_PS_2_OFFSET:
+	case NVSW_REG_PS_2_EVENT_OFFSET:
+	case NVSW_REG_PS_2_MASK_OFFSET:
 	case NVSW_REG_PS_DC_OK_OFFSET:
 	case NVSW_REG_PS_DC_OK_EVENT_OFFSET:
 	case NVSW_REG_PS_DC_OK_MASK_OFFSET:
+	case NVSW_REG_PS_ALARM_OFFSET:
+	case NVSW_REG_PS_ALARM_EVENT_OFFSET:
+	case NVSW_REG_PS_ALARM_MASK_OFFSET:
 	case NVSW_REG_CPLD8_PN_OFFSET:
 	case NVSW_REG_CPLD8_PN1_OFFSET:
 	case NVSW_REG_CPLD8_VER_OFFSET:
@@ -243,6 +264,16 @@ static bool nvsw_readable_reg(struct device *dev, unsigned int reg)
 	case NVSW_REG_TACHO10_OFFSET:
 	case NVSW_REG_TACHO11_OFFSET:
 	case NVSW_REG_TACHO12_OFFSET:
+	case NVSW_REG_TACHO13_OFFSET:
+	case NVSW_REG_TACHO14_OFFSET:
+	case NVSW_REG_TACHO15_OFFSET:
+	case NVSW_REG_TACHO16_OFFSET:
+	case NVSW_REG_TACHO17_OFFSET:
+	case NVSW_REG_TACHO18_OFFSET:
+	case NVSW_REG_TACHO19_OFFSET:
+	case NVSW_REG_TACHO20_OFFSET:
+	case NVSW_REG_CURRENT_TEMP_RO:
+	case NVSW_REG_SWITCH_IC_QTY:
 	case NVSW_REG_FAN_CAP1_OFFSET:
 	case NVSW_REG_FAN_DRW_CAP_OFFSET:
 	case NVSW_REG_TACHO_SPEED_OFFSET:
@@ -320,6 +351,9 @@ static bool nvsw_volatile_reg(struct device *dev, unsigned int reg)
 	case NVSW_REG_RESET_CAUSE1_OFFSET:
 	case NVSW_REG_RESET_CAUSE2_OFFSET:
 	case NVSW_REG_LED1_OFFSET:
+	case NVSW_REG_LED2_OFFSET:
+	case NVSW_REG_LED3_OFFSET:
+	case NVSW_REG_LED4_OFFSET:
 	case NVSW_REG_LED5_OFFSET:
 	case NVSW_REG_LED6_OFFSET:
 	case NVSW_REG_LED7_OFFSET:
@@ -375,9 +409,18 @@ static bool nvsw_volatile_reg(struct device *dev, unsigned int reg)
 	case NVSW_REG_VR2_ALERT_OFFSET:
 	case NVSW_REG_VR2_ALERT_EVENT_OFFSET:
 	case NVSW_REG_VR2_ALERT_MASK_OFFSET:
+	case NVSW_REG_PS_AC_2_OFFSET:
+	case NVSW_REG_PS_AC_2_EVENT_OFFSET:
+	case NVSW_REG_PS_AC_2_MASK_OFFSET:
+	case NVSW_REG_PS_2_OFFSET:
+	case NVSW_REG_PS_2_EVENT_OFFSET:
+	case NVSW_REG_PS_2_MASK_OFFSET:
 	case NVSW_REG_PS_DC_OK_OFFSET:
 	case NVSW_REG_PS_DC_OK_EVENT_OFFSET:
 	case NVSW_REG_PS_DC_OK_MASK_OFFSET:
+	case NVSW_REG_PS_ALARM_OFFSET:
+	case NVSW_REG_PS_ALARM_EVENT_OFFSET:
+	case NVSW_REG_PS_ALARM_MASK_OFFSET:
 	case NVSW_REG_CPLD8_PN_OFFSET:
 	case NVSW_REG_CPLD8_PN1_OFFSET:
 	case NVSW_REG_CPLD8_VER_OFFSET:
@@ -404,6 +447,8 @@ static bool nvsw_volatile_reg(struct device *dev, unsigned int reg)
 	case NVSW_REG_LEAK_MASK_OFFSET:
 	case NVSW_REG_GP4_RO_OFFSET:
 	case NVSW_REG_GP5_RO_OFFSET:
+	case NVSW_REG_CURRENT_TEMP_RO:
+	case NVSW_REG_SWITCH_IC_QTY:
 	case NVSW_REG_CPLD1_MVER_OFFSET:
 	case NVSW_REG_CPLD2_MVER_OFFSET:
 	case NVSW_REG_CPLD3_MVER_OFFSET:
@@ -421,6 +466,14 @@ static bool nvsw_volatile_reg(struct device *dev, unsigned int reg)
 	case NVSW_REG_TACHO10_OFFSET:
 	case NVSW_REG_TACHO11_OFFSET:
 	case NVSW_REG_TACHO12_OFFSET:
+	case NVSW_REG_TACHO13_OFFSET:
+	case NVSW_REG_TACHO14_OFFSET:
+	case NVSW_REG_TACHO15_OFFSET:
+	case NVSW_REG_TACHO16_OFFSET:
+	case NVSW_REG_TACHO17_OFFSET:
+	case NVSW_REG_TACHO18_OFFSET:
+	case NVSW_REG_TACHO19_OFFSET:
+	case NVSW_REG_TACHO20_OFFSET:
 	case NVSW_REG_FAN_CAP1_OFFSET:
 	case NVSW_REG_FAN_DRW_CAP_OFFSET:
 	case NVSW_REG_TACHO_SPEED_OFFSET:
diff --git a/drivers/platform/mellanox/nvsw-host-spc6.c b/drivers/platform/mellanox/nvsw-host-spc6.c
index ac3d42d4c70f..fb07af4d898a 100644
--- a/drivers/platform/mellanox/nvsw-host-spc6.c
+++ b/drivers/platform/mellanox/nvsw-host-spc6.c
@@ -29,10 +29,12 @@
  * struct nvsw_host_spc6_cfg - per SKU board description
  * @regs_io: register access platform data;
  * @led: led platform data;
+ * @fan: fan platform data, NULL on systems without fans;
  */
 struct nvsw_host_spc6_cfg {
 	struct mlxreg_core_platform_data *regs_io;
 	struct mlxreg_core_platform_data *led;
+	struct mlxreg_core_platform_data *fan;
 };
 
 /* Platform mux channels */
@@ -65,6 +67,7 @@ static struct mlxcpld_mux_plat_data *nvsw_host_mux_data[NVSW_MUX_MAX];
 static struct i2c_board_info *nvsw_host_mux_brdinfo;
 static struct mlxreg_core_platform_data *nvsw_led_data;
 static struct mlxreg_core_platform_data *nvsw_regs_io_data;
+static struct mlxreg_core_platform_data *nvsw_fan_data;
 static struct mlxreg_core_platform_data *nvsw_wd_data[NVSW_WD_MAX];
 static int nvsw_host_mux_num;
 static struct platform_device *nvsw_host_dev;
@@ -565,6 +568,365 @@ static struct mlxreg_core_platform_data nvsw_host_spc6_lc_regs_io = {
 	.counter = ARRAY_SIZE(nvsw_host_spc6_lc_regs_io_data),
 };
 
+/* Platform register access data for air cooled system */
+static struct mlxreg_core_data nvsw_host_spc6_ac_regs_io_data[] = {
+	{
+		.label = "cpld1_version",
+		.reg = NVSW_REG_CPLD1_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld1_version_min",
+		.reg = NVSW_REG_CPLD1_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld2_version",
+		.reg = NVSW_REG_CPLD2_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld2_version_min",
+		.reg = NVSW_REG_CPLD2_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld3_version",
+		.reg = NVSW_REG_CPLD3_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld3_version_min",
+		.reg = NVSW_REG_CPLD3_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld4_version",
+		.reg = NVSW_REG_CPLD4_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld4_version_min",
+		.reg = NVSW_REG_CPLD4_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld1_pn",
+		.reg = NVSW_REG_CPLD1_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld2_pn",
+		.reg = NVSW_REG_CPLD2_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld3_pn",
+		.reg = NVSW_REG_CPLD3_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld4_pn",
+		.reg = NVSW_REG_CPLD4_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "asic_reset",
+		.reg = NVSW_REG_RESET_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0644,
+	},
+	{
+		.label = "reset_long_pb",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_short_pb",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_aux_pwr_or_reload",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_swb_dc_dc_pwr_fail",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_platform",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_swb_wd",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_asic_thermal",
+		.reg = NVSW_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_soc",
+		.reg = NVSW_REG_RESET_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_system",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_sw_pwr_off",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_cpu_thermal",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_ac_pwr_fail",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_mgmt_pwr",
+		.reg = NVSW_REG_RESET_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
+	{
+		.label = "fan_dir",
+		.reg = NVSW_REG_GP0_RO_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpu_mctp_ready",
+		.reg = NVSW_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0644,
+	},
+	{
+		.label = "cpu_shutdown_req",
+		.reg = NVSW_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "vpd_wp",
+		.reg = NVSW_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0644,
+		.secured = 1,
+	},
+	{
+		.label = "pcie_asic_reset_dis",
+		.reg = NVSW_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0644,
+	},
+	{
+		.label = "cpu_power_off_ready",
+		.reg = NVSW_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0644,
+	},
+	{
+		.label = "pwr_converter_prog_en",
+		.reg = NVSW_REG_GP7_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0644,
+	},
+	{
+		.label = "graceful_pwr_off",
+		.reg = NVSW_REG_GP7_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0644,
+	},
+	{
+		.label = "pwr_cycle",
+		.reg = NVSW_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0244,
+	},
+	{
+		.label = "pwr_down",
+		.reg = NVSW_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0200,
+	},
+	{
+		.label = "aux_pwr_cycle",
+		.reg = NVSW_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0200,
+	},
+	{
+		.label = "bmc_to_cpu_ctrl",
+		.reg = NVSW_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0644,
+	},
+	{
+		.label = "uart_sel",
+		.reg = NVSW_REG_GP1_OFFSET,
+		.mask = NVSW_UART_SEL_MASK,
+		.bit = 7,
+		.mode = 0644,
+	},
+	{
+		.label = "psu1_on",
+		.reg = NVSW_REG_GP4_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0200,
+	},
+	{
+		.label = "psu2_on",
+		.reg = NVSW_REG_GP4_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0200,
+	},
+	{
+		.label = "psu3_on",
+		.reg = NVSW_REG_GP4_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0200,
+	},
+	{
+		.label = "psu4_on",
+		.reg = NVSW_REG_GP4_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0200,
+	},
+	{
+		.label = "jtag_enable",
+		.reg = NVSW_REG_FIELD_UPGRADE,
+		.mask = GENMASK(1, 0),
+		.bit = 1,
+		.mode = 0644,
+	},
+	{
+		.label = "jtag_cap",
+		.reg = NVSW_REG_FU_CAP_OFFSET,
+		.mask = NVSW_FU_CAP_MASK,
+		.bit = 1,
+		.mode = 0444,
+	},
+	{
+		.label = "asic_health",
+		.reg = NVSW_REG_ASIC1_HEALTH_OFFSET,
+		.mask = NVSW_ASIC_MASK,
+		.bit = 1,
+		.mode = 0444,
+	},
+	{
+		.label = "psu_status",
+		.reg = NVSW_REG_PS_2_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "psu_event",
+		.reg = NVSW_REG_PS_2_EVENT_OFFSET,
+		.mask = GENMASK(7, 0),
+		.bit = 1,
+		.mode = 0644,
+	},
+	{
+		.label = "psu_ac_status",
+		.reg = NVSW_REG_PS_AC_2_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "psu_ac_event",
+		.reg = NVSW_REG_PS_AC_2_EVENT_OFFSET,
+		.mask = GENMASK(7, 0),
+		.bit = 1,
+		.mode = 0644,
+	},
+	{
+		.label = "psu_dc_status",
+		.reg = NVSW_REG_PS_DC_OK_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "psu_dc_event",
+		.reg = NVSW_REG_PS_DC_OK_EVENT_OFFSET,
+		.mask = GENMASK(7, 0),
+		.bit = 1,
+		.mode = 0644,
+	},
+	{
+		.label = "fan_status",
+		.reg = NVSW_REG_FAN_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "fan_event",
+		.reg = NVSW_REG_FAN_EVENT_OFFSET,
+		.mask = GENMASK(7, 0),
+		.bit = 1,
+		.mode = 0644,
+	},
+	{
+		.label = "asic_pg_fail",
+		.reg = NVSW_REG_GP4_RO_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
+	{
+		.label = "spi_chnl_select",
+		.reg = NVSW_REG_SPI_CHNL_SELECT,
+		.mask = GENMASK(7, 0),
+		.bit = 1,
+		.mode = 0644,
+	},
+};
+
+static struct mlxreg_core_platform_data nvsw_host_spc6_ac_regs_io = {
+	.data = nvsw_host_spc6_ac_regs_io_data,
+	.counter = ARRAY_SIZE(nvsw_host_spc6_ac_regs_io_data),
+};
+
 /* Platform led data for liquid cooled system */
 static struct mlxreg_core_data nvsw_host_spc6_lc_led_data[] = {
 	{
@@ -599,6 +961,219 @@ static struct mlxreg_core_platform_data nvsw_host_spc6_lc_led = {
 	.counter = ARRAY_SIZE(nvsw_host_spc6_lc_led_data),
 };
 
+/* Platform led data for air cooled system */
+static struct mlxreg_core_data nvsw_host_spc6_ac_led_data[] = {
+	{
+		.label = "status:green",
+		.reg = NVSW_REG_LED1_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "status:amber",
+		.reg = NVSW_REG_LED1_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "psu:green",
+		.reg = NVSW_REG_LED1_OFFSET,
+		.mask = NVSW_LED_HI_NIBBLE_MASK,
+	},
+	{
+		.label = "psu:amber",
+		.reg = NVSW_REG_LED1_OFFSET,
+		.mask = NVSW_LED_HI_NIBBLE_MASK,
+	},
+	{
+		.label = "fan:green",
+		.reg = NVSW_REG_LED6_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "fan:amber",
+		.reg = NVSW_REG_LED6_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "uid:blue",
+		.reg = NVSW_REG_LED5_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "fan1:green",
+		.reg = NVSW_REG_LED2_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 1,
+	},
+	{
+		.label = "fan1:orange",
+		.reg = NVSW_REG_LED2_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 1,
+	},
+	{
+		.label = "fan2:green",
+		.reg = NVSW_REG_LED2_OFFSET,
+		.mask = NVSW_LED_HI_NIBBLE_MASK,
+		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 2,
+	},
+	{
+		.label = "fan2:orange",
+		.reg = NVSW_REG_LED2_OFFSET,
+		.mask = NVSW_LED_HI_NIBBLE_MASK,
+		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 2,
+	},
+	{
+		.label = "fan3:green",
+		.reg = NVSW_REG_LED3_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 3,
+	},
+	{
+		.label = "fan3:orange",
+		.reg = NVSW_REG_LED3_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 3,
+	},
+	{
+		.label = "fan4:green",
+		.reg = NVSW_REG_LED3_OFFSET,
+		.mask = NVSW_LED_HI_NIBBLE_MASK,
+		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 4,
+	},
+	{
+		.label = "fan4:orange",
+		.reg = NVSW_REG_LED3_OFFSET,
+		.mask = NVSW_LED_HI_NIBBLE_MASK,
+		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 4,
+	},
+	{
+		.label = "fan5:green",
+		.reg = NVSW_REG_LED4_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 5,
+	},
+	{
+		.label = "fan5:orange",
+		.reg = NVSW_REG_LED4_OFFSET,
+		.mask = NVSW_LED_LO_NIBBLE_MASK,
+		.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+		.slot = 5,
+	},
+};
+
+static struct mlxreg_core_platform_data nvsw_host_spc6_ac_led = {
+	.data = nvsw_host_spc6_ac_led_data,
+	.counter = ARRAY_SIZE(nvsw_host_spc6_ac_led_data),
+};
+
+/* Platform fan data for air cooled system */
+static struct mlxreg_core_data nvsw_host_spc6_ac_fan_data[] = {
+	{
+		.label = "pwm1",
+		.reg = NVSW_REG_PWM1_OFFSET,
+	},
+	{
+		.label = "tacho1",
+		.reg = NVSW_REG_TACHO1_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = NVSW_REG_FAN_CAP1_OFFSET,
+		.slot = 1,
+		.reg_prsnt = NVSW_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho2",
+		.reg = NVSW_REG_TACHO2_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = NVSW_REG_FAN_CAP1_OFFSET,
+		.slot = 2,
+		.reg_prsnt = NVSW_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho3",
+		.reg = NVSW_REG_TACHO3_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = NVSW_REG_FAN_CAP1_OFFSET,
+		.slot = 3,
+		.reg_prsnt = NVSW_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho4",
+		.reg = NVSW_REG_TACHO4_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = NVSW_REG_FAN_CAP1_OFFSET,
+		.slot = 4,
+		.reg_prsnt = NVSW_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho5",
+		.reg = NVSW_REG_TACHO5_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = NVSW_REG_FAN_CAP1_OFFSET,
+		.slot = 5,
+		.reg_prsnt = NVSW_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho6",
+		.reg = NVSW_REG_TACHO6_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = NVSW_REG_FAN_CAP1_OFFSET,
+		.slot = 6,
+		.reg_prsnt = NVSW_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho7",
+		.reg = NVSW_REG_TACHO7_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = NVSW_REG_FAN_CAP1_OFFSET,
+		.slot = 7,
+		.reg_prsnt = NVSW_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho8",
+		.reg = NVSW_REG_TACHO8_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = NVSW_REG_FAN_CAP1_OFFSET,
+		.slot = 8,
+		.reg_prsnt = NVSW_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho9",
+		.reg = NVSW_REG_TACHO9_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = NVSW_REG_FAN_CAP1_OFFSET,
+		.slot = 9,
+		.reg_prsnt = NVSW_REG_FAN_OFFSET,
+	},
+	{
+		.label = "tacho10",
+		.reg = NVSW_REG_TACHO10_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = NVSW_REG_FAN_CAP1_OFFSET,
+		.slot = 10,
+		.reg_prsnt = NVSW_REG_FAN_OFFSET,
+	},
+	{
+		.label = "conf",
+		.capability = NVSW_REG_TACHO_SPEED_OFFSET,
+	},
+};
+
+static struct mlxreg_core_platform_data nvsw_host_spc6_ac_fan = {
+	.data = nvsw_host_spc6_ac_fan_data,
+	.counter = ARRAY_SIZE(nvsw_host_spc6_ac_fan_data),
+	.capability = NVSW_REG_FAN_DRW_CAP_OFFSET,
+	.version = 1,
+};
+
 /* Watchdog platform data */
 static struct mlxreg_core_data nvsw_host_spc6_wd_main_regs[] = {
 	{
@@ -722,6 +1297,13 @@ static const struct nvsw_host_spc6_cfg nvsw_host_spc6_cfg_lc = {
 	.led = &nvsw_host_spc6_lc_led,
 };
 
+/* Air cooled system, equipped with power supplies and fan drawers. */
+static const struct nvsw_host_spc6_cfg nvsw_host_spc6_cfg_ac = {
+	.regs_io = &nvsw_host_spc6_ac_regs_io,
+	.led = &nvsw_host_spc6_ac_led,
+	.fan = &nvsw_host_spc6_ac_fan,
+};
+
 static int __init nvsw_host_dmi_spc6_switch_matched(const struct dmi_system_id *dmi)
 {
 	const struct nvsw_host_spc6_cfg *cfg = dmi->driver_data;
@@ -734,6 +1316,7 @@ static int __init nvsw_host_dmi_spc6_switch_matched(const struct dmi_system_id *
 	nvsw_host_mux_brdinfo = &nvsw_host_spc6_mux_brdinfo;
 	nvsw_regs_io_data = cfg->regs_io;
 	nvsw_led_data = cfg->led;
+	nvsw_fan_data = cfg->fan;
 	for (i = 0; i < ARRAY_SIZE(nvsw_host_spc6_wd_set); i++)
 		nvsw_wd_data[i] = &nvsw_host_spc6_wd_set[i];
 
@@ -741,6 +1324,14 @@ static int __init nvsw_host_dmi_spc6_switch_matched(const struct dmi_system_id *
 }
 
 static const struct dmi_system_id nvsw_host_dmi_table[] __initconst = {
+	{
+		.callback = nvsw_host_dmi_spc6_switch_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0025"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI186"),
+		},
+		.driver_data = (void *)&nvsw_host_spc6_cfg_ac,
+	},
 	{
 		.callback = nvsw_host_dmi_spc6_switch_matched,
 		.matches = {
@@ -833,6 +1424,7 @@ static int nvsw_host_probe(struct platform_device *pdev)
 		nvsw_core->wd_data[i] = nvsw_wd_data[i];
 	nvsw_core->regio_data = nvsw_regs_io_data;
 	nvsw_core->led_data = nvsw_led_data;
+	nvsw_core->fan_data = nvsw_fan_data;
 	nvsw_core->mux_init = nvsw_host_spc6_mux_topology_init;
 	nvsw_core->mux_exit = nvsw_host_spc6_mux_topology_exit;
 	platform_set_drvdata(pdev, nvsw_core);
diff --git a/drivers/platform/mellanox/nvsw.h b/drivers/platform/mellanox/nvsw.h
index 88b16d0a36d4..56fac0582b2a 100644
--- a/drivers/platform/mellanox/nvsw.h
+++ b/drivers/platform/mellanox/nvsw.h
@@ -48,6 +48,9 @@ struct regmap;
 #define NVSW_REG_RESET_CAUSE1_OFFSET	0x251e
 #define NVSW_REG_RESET_CAUSE2_OFFSET	0x251f
 #define NVSW_REG_LED1_OFFSET		0x2520
+#define NVSW_REG_LED2_OFFSET		0x2521
+#define NVSW_REG_LED3_OFFSET		0x2522
+#define NVSW_REG_LED4_OFFSET		0x2523
 #define NVSW_REG_LED5_OFFSET		0x2524
 #define NVSW_REG_LED6_OFFSET		0x2525
 #define NVSW_REG_LED7_OFFSET		0x2526
@@ -96,12 +99,21 @@ struct regmap;
 #define NVSW_REG_VR1_ALERT_OFFSET	0x2558
 #define NVSW_REG_VR1_ALERT_EVENT_OFFSET	0x2559
 #define NVSW_REG_VR1_ALERT_MASK_OFFSET	0x255a
+#define NVSW_REG_PS_2_OFFSET		0x255b
+#define NVSW_REG_PS_2_EVENT_OFFSET	0x255c
+#define NVSW_REG_PS_2_MASK_OFFSET	0x255d
 #define NVSW_REG_VR2_ALERT_OFFSET	0x255e
 #define NVSW_REG_VR2_ALERT_EVENT_OFFSET	0x255f
 #define NVSW_REG_VR2_ALERT_MASK_OFFSET	0x2560
+#define NVSW_REG_PS_AC_2_OFFSET		0x2561
+#define NVSW_REG_PS_AC_2_EVENT_OFFSET	0x2562
+#define NVSW_REG_PS_AC_2_MASK_OFFSET	0x2563
 #define NVSW_REG_PS_DC_OK_OFFSET	0x2567
 #define NVSW_REG_PS_DC_OK_EVENT_OFFSET	0x2568
 #define NVSW_REG_PS_DC_OK_MASK_OFFSET	0x2569
+#define NVSW_REG_PS_ALARM_OFFSET	0x256d
+#define NVSW_REG_PS_ALARM_EVENT_OFFSET	0x256e
+#define NVSW_REG_PS_ALARM_MASK_OFFSET	0x256f
 #define NVSW_REG_CPLD8_PN_OFFSET	0x2573
 #define NVSW_REG_CPLD8_PN1_OFFSET	0x2574
 #define NVSW_REG_PG3_OFFSET		0x2576
@@ -142,6 +154,10 @@ struct regmap;
 #define NVSW_REG_LEAK_OFFSET		0x25af
 #define NVSW_REG_LEAK_EVENT_OFFSET	0x25b0
 #define NVSW_REG_LEAK_MASK_OFFSET	0x25b1
+#define NVSW_REG_TACHO19_OFFSET		0x25b4
+#define NVSW_REG_TACHO20_OFFSET		0x25b5
+#define NVSW_REG_TACHO17_OFFSET		0x25ba
+#define NVSW_REG_TACHO18_OFFSET		0x25bb
 #define NVSW_REG_CURRENT_TEMP_RO	0x25c0
 #define NVSW_REG_SWITCH_IC_QTY		0x25c1
 #define NVSW_REG_GP4_RO_OFFSET		0x25c2
@@ -184,6 +200,8 @@ struct regmap;
 #define NVSW_REG_TACHO10_OFFSET		0x25ee
 #define NVSW_REG_TACHO11_OFFSET		0x25ef
 #define NVSW_REG_TACHO12_OFFSET		0x25f0
+#define NVSW_REG_TACHO13_OFFSET		0x25f1
+#define NVSW_REG_TACHO14_OFFSET		0x25f2
 #define NVSW_REG_FAN_CAP1_OFFSET	0x25f5
 #define NVSW_REG_FAN_DRW_CAP_OFFSET	0x25f7
 #define NVSW_REG_TACHO_SPEED_OFFSET	0x25f8
@@ -191,6 +209,8 @@ struct regmap;
 #define NVSW_REG_CONFIG1_OFFSET		0x25fb
 #define NVSW_REG_CONFIG2_OFFSET		0x25fc
 #define NVSW_REG_CONFIG3_OFFSET		0x25fd
+#define NVSW_REG_TACHO15_OFFSET		0x25fe
+#define NVSW_REG_TACHO16_OFFSET		0x25ff
 #define NVSW_REG_MIN			0x2500
 #define NVSW_REG_MAX			0x26ff
 
-- 
2.34.1

