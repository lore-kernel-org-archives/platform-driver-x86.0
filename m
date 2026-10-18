Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010071.outbound.protection.outlook.com [40.93.198.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F9B4582C6
	for <platform-driver-x86@vger.kernel.org>; Sun, 18 Oct 2026 10:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318378; cv=fail; b=JKRaf45E+BKRosCFghkJqTwyuSDgflm7I5cl3Gs0m2KxpCrpXyQTcKoeIsaRksooljwDmqWFtlZr/Ql1MTW/HgKsF/pdcZexWSNSSDKO0AKxLcPtdyI2occat1lv2AZVM17J7IzIOI770PmNKdlDgUbXHM/+hoaX1NQXbITv1Ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318378; c=relaxed/simple;
	bh=tvqaSDTYH1UH7nvwqXrvnxfumki2Ow5L+9oHKnD9xRg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XQJQKfBwkH5/3nhvmEe/RmcF0tHYO1iUpkHX5/g5PTgKzCfDIDIDcnq4tXHruaDMm1vc+E0gI78VNM4v51h5VpCze28YQV1p7RvhF1pSVdqzy+vqEnq/4+u+P7GafUq3K44vP2v8PXovpieqPxZ/2LV1jPT9ecWYPx/8E+u7oyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IvZ4u7F9; arc=fail smtp.client-ip=40.93.198.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IvZ4u7F9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yv0qAFX7cYsg3A3x5vCISWzkE7+u7YlFg5GeyYXoK+XfXbtCaHtuhG3xqz4aZKbyDDNy+d0l4ApzKf4ppo3lqAjIZzWSy6W2jmlHBDpGx2Qd6mj7avLE1him7kDPFX9VS8lLGJAVXKugSMX1c9tBoVGjdgZjN5VjJTOENoVF7EgErHjd/X7uEMj2TmR1ko+fVxbL0wTafuRYO/F4RtyJ5qQaKPAf3i9h/i54xqcXDT4McMk6jJU9HtJWosSMjzekoU+0LsAu/UM/cmrTF/0pUSYtaKzrfVbwLU8iU+5leA4zPcH4ozIp67Ets9t/UnpbhL5MZY/1nWCH9pyxXXvZ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PB1Vrp5gp+y93dQundy4uizNXmudC63r4ONhclLg7u8=;
 b=EVOxPRqaBrKYKFJM0v9nF5pUFR5BXAQYT8X0Sjm6rrU1UkBryHHQs3D5epV8sB2nSj6ClKRtRjD6iPRbslJA4dLb3dT34tQc2l90b71bDRBJya+tH2CdwYKkRaXZokAQ51WvO3K40n6CPXbM2aChhac7jhhOaASVLzRMRUUmPlgPWRUpJFPfQVU/EiKsH9N58/qteEvV9IpZbT47b2LjxLP5x4nQP43d+PsTiP/rnMMcD7qCnMNuCIfc5mOYK7uNLvwY41P9N3oMEkf9B2ph1a5cpL0HkOAZLdXY2+xO1CMpeXh8ycqpQyYrDDHsCbjEaa8zZ71drP7U2YcGRucXuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PB1Vrp5gp+y93dQundy4uizNXmudC63r4ONhclLg7u8=;
 b=IvZ4u7F9po9U9K0F6j5PoyGeasY2df4NYgma52JbdNPwk3pxqzzgGVmFYGzEMfMJ9H230B2vttzEAo3q9RbwW15r48MdQZuBhDyB4H45KPMejQ4ryAaIHJLiXmqQ70mDvDl+O0h3aDPuNY3AYnOCU4fYfZXMT7fOdZJXdVkB443aETaDky0FLIvCexM870QXM+vTcA6EAFLaqETrYWyz98eRT2U3IvgtHmYz8JzP7udmnGfQ/+vMXxxYGlSOccKestpnQTs0GsBTS/3ln84xMtpxz5ekWJBJxlQiQGeet39hu+Sq3eBa1WZt+sgYhTpfTceBnzIVxpxAYpcn2xdE+Q==
Received: from CH0PR03CA0086.namprd03.prod.outlook.com (2603:10b6:610:cc::31)
 by CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Sun, 18 Oct
 2026 10:12:41 +0000
Received: from BN2PEPF0000A803.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::6c) by CH0PR03CA0086.outlook.office365.com
 (2603:10b6:610:cc::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.18 via Frontend Transport; Sun,
 18 Oct 2026 10:12:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF0000A803.mail.protection.outlook.com (10.167.245.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sun, 18 Oct 2026 10:12:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sun, 18 Oct
 2026 03:12:26 -0700
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 18 Oct 2026 03:12:24 -0700
From: Felix Radensky <fradensky@nvidia.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Hans de
 Goede" <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
CC: Felix Radensky <fradensky@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>
Subject: [PATCH platform-next v2 3/3] platform/mellanox: nvsw-host-spc6: Add support for SPC6 air cooled switches
Date: Sun, 18 Oct 2026 13:11:56 +0300
Message-ID: <20261018101156.699575-4-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261018101156.699575-1-fradensky@nvidia.com>
References: <20261018101156.699575-1-fradensky@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A803:EE_|CH2PR12MB4262:EE_
X-MS-Office365-Filtering-Correlation-Id: b69576a0-650a-4deb-a62d-08df2d0057fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	APS93ICtUlso8fbChmEmwVZp1IwOxLOISzN7zIzEdbT5C0Y9i3TbxoOMpaXAAT6EqAnTBr051JyBGJPsNN5zqdcuTv62uNqLgViGCcOPrd4PyPtEK8X/JF5RftF/waIPa98pqK/abZB/INkGtU1ICSiYGpBIEHWPh94kzovKz0h3BkmPgbh968D+IDptOAsiFbrE9HUZSlspCnQj1ImKrwuCFfqhKRk/zZRnfuGApfmylsi2dLlazTd24/s6DVLpaaWVMORNqTCVqAkv+dmOc61Y3hkb0H3U+0864a+nDz/z3dlsZU2yOA2K3KJrvovbHDjuRSSw3hZxxYEsv8j8kxM5lybyJv04c/MqkgtzztyQg4KUt760OLBfAaQWxk6q24HumUEH/OK8UeR+OYVpx4rdhSBchdHNl3SZsVm/V/zW1TC6Coapb3Iitbka+CyzuzgXONu2AnOF5cUnMaaeTSn25yTv7DGx/vj9gXzszPTMP4Yk73gF3MTkvBhvVbwG/7GWpOqABrOg+0cu1iuMGlG39nceJ+KTNJE6J2lXBC9qXm0wHZYfOQ8r45GkOVIXwANQCLugUe8qA7xx3pHJsKJonOJAVXXq9MdMDNLcAvl1/cS1xpqNoNLD6A0D3335L4ol/hO+VzCsRMcrRjnlvGMGPqDq1FcGB51KWFFsLlHXzArgVb4sPKlky4O8kfkVFUsOygtNKDkwR1bY5oFPfg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	B/3qUsxFVWiTvKd00KIwMTXO31dFwdm3Ui74Xui29lFbdUEEotvpd/Gz1YHWH3Rz0lFCRpxclZiinLbLXa68PACRcJ5CuP80yjkgT8RDhzs8z+XRRAKkiNu+MY6Fqc5e8W0/fHZxHvCJE97AIw25f8sN3xwtI2+PLKNUu0yN7AcNxYaCbtXEGhk/gtiUENZHePOaqs2U3TmDL34iHQ65CVJvbw+tlbEKC8iyw0K/Yve6BEd11xBda9i18Tyq04BDN5TTiiXlQMbYVgEbYFU0jFok1KrGI0SLR3MCnpUhXqK+rYgHc87T2oAAVl6FcaByVC5jIA2htSeQ1trxqKwCptj+d4QigXv1Mn2XCyA6kX9ZyYYj49Mv8fBy/MAficLztWStT7NnvUiE5OLl1TvM8YjGbiNMvZ4fqNcRW2BTt9pSzYnZ6+D6qB7D/ES0kWqy
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2026 10:12:40.7508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b69576a0-650a-4deb-a62d-08df2d0057fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A803.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4262

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
v1->v2
- No change. The hunk offsets moved because of the include additions
  in patches 1 and 2.

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
index 623b44df7688..3fcdb8c7b0ef 100644
--- a/drivers/platform/mellanox/nvsw-core.c
+++ b/drivers/platform/mellanox/nvsw-core.c
@@ -47,6 +47,9 @@ static bool nvsw_writeable_reg(struct device *dev, unsigned int reg)
 	case NVSW_REG_GP5_OFFSET:
 	case NVSW_REG_GP6_OFFSET:
 	case NVSW_REG_LED1_OFFSET:
+	case NVSW_REG_LED2_OFFSET:
+	case NVSW_REG_LED3_OFFSET:
+	case NVSW_REG_LED4_OFFSET:
 	case NVSW_REG_LED5_OFFSET:
 	case NVSW_REG_LED6_OFFSET:
 	case NVSW_REG_LED7_OFFSET:
@@ -74,8 +77,14 @@ static bool nvsw_writeable_reg(struct device *dev, unsigned int reg)
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
@@ -149,6 +158,9 @@ static bool nvsw_readable_reg(struct device *dev, unsigned int reg)
 	case NVSW_REG_RESET_CAUSE1_OFFSET:
 	case NVSW_REG_RESET_CAUSE2_OFFSET:
 	case NVSW_REG_LED1_OFFSET:
+	case NVSW_REG_LED2_OFFSET:
+	case NVSW_REG_LED3_OFFSET:
+	case NVSW_REG_LED4_OFFSET:
 	case NVSW_REG_LED5_OFFSET:
 	case NVSW_REG_LED6_OFFSET:
 	case NVSW_REG_LED7_OFFSET:
@@ -206,9 +218,18 @@ static bool nvsw_readable_reg(struct device *dev, unsigned int reg)
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
@@ -250,6 +271,16 @@ static bool nvsw_readable_reg(struct device *dev, unsigned int reg)
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
@@ -327,6 +358,9 @@ static bool nvsw_volatile_reg(struct device *dev, unsigned int reg)
 	case NVSW_REG_RESET_CAUSE1_OFFSET:
 	case NVSW_REG_RESET_CAUSE2_OFFSET:
 	case NVSW_REG_LED1_OFFSET:
+	case NVSW_REG_LED2_OFFSET:
+	case NVSW_REG_LED3_OFFSET:
+	case NVSW_REG_LED4_OFFSET:
 	case NVSW_REG_LED5_OFFSET:
 	case NVSW_REG_LED6_OFFSET:
 	case NVSW_REG_LED7_OFFSET:
@@ -382,9 +416,18 @@ static bool nvsw_volatile_reg(struct device *dev, unsigned int reg)
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
@@ -411,6 +454,8 @@ static bool nvsw_volatile_reg(struct device *dev, unsigned int reg)
 	case NVSW_REG_LEAK_MASK_OFFSET:
 	case NVSW_REG_GP4_RO_OFFSET:
 	case NVSW_REG_GP5_RO_OFFSET:
+	case NVSW_REG_CURRENT_TEMP_RO:
+	case NVSW_REG_SWITCH_IC_QTY:
 	case NVSW_REG_CPLD1_MVER_OFFSET:
 	case NVSW_REG_CPLD2_MVER_OFFSET:
 	case NVSW_REG_CPLD3_MVER_OFFSET:
@@ -428,6 +473,14 @@ static bool nvsw_volatile_reg(struct device *dev, unsigned int reg)
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
index 8b7f47a76cd4..d3e8c55dd654 100644
--- a/drivers/platform/mellanox/nvsw-host-spc6.c
+++ b/drivers/platform/mellanox/nvsw-host-spc6.c
@@ -33,10 +33,12 @@
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
@@ -69,6 +71,7 @@ static struct mlxcpld_mux_plat_data *nvsw_host_mux_data[NVSW_MUX_MAX];
 static struct i2c_board_info *nvsw_host_mux_brdinfo;
 static struct mlxreg_core_platform_data *nvsw_led_data;
 static struct mlxreg_core_platform_data *nvsw_regs_io_data;
+static struct mlxreg_core_platform_data *nvsw_fan_data;
 static struct mlxreg_core_platform_data *nvsw_wd_data[NVSW_WD_MAX];
 static int nvsw_host_mux_num;
 static struct platform_device *nvsw_host_dev;
@@ -569,6 +572,365 @@ static struct mlxreg_core_platform_data nvsw_host_spc6_lc_regs_io = {
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
@@ -603,6 +965,219 @@ static struct mlxreg_core_platform_data nvsw_host_spc6_lc_led = {
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
@@ -720,6 +1295,13 @@ static const struct nvsw_host_spc6_cfg nvsw_host_spc6_cfg_lc = {
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
@@ -732,6 +1314,7 @@ static int __init nvsw_host_dmi_spc6_switch_matched(const struct dmi_system_id *
 	nvsw_host_mux_brdinfo = &nvsw_host_spc6_mux_brdinfo;
 	nvsw_regs_io_data = cfg->regs_io;
 	nvsw_led_data = cfg->led;
+	nvsw_fan_data = cfg->fan;
 	for (i = 0; i < ARRAY_SIZE(nvsw_host_spc6_wd_set); i++)
 		nvsw_wd_data[i] = &nvsw_host_spc6_wd_set[i];
 
@@ -739,6 +1322,14 @@ static int __init nvsw_host_dmi_spc6_switch_matched(const struct dmi_system_id *
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
@@ -831,6 +1422,7 @@ static int nvsw_host_probe(struct platform_device *pdev)
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

