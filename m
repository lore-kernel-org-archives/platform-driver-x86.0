Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792517408;
	b=cVr7mjTy8k+sAKx4zWVlakG3B2djpIQijZ2B+BhwvfRBbWqdaXoEeJWvsx5IE4CvKGq2
	 58/D0lbyvEVAyarILFITiZOzZfMTvG0VBN3UgkWoQwwlhzzznblEA+skw5peLg9SZIXJC
	 X+a4gTOREHiFjs4SK7Ut70wxn/e024yrqS4vpIZDXMoU1zUCHM/Pb869tkxUOAWzQ9sKA
	 n4yNyO34J+NB5gdWLEkWjo3neOPbxEJJoDsjecFoV31q6mqCn7z+SIcOlGMfZ9iIC0kZX
	 4oDmMhYJp94iHoNNZiS9fqu4uwB3IGWhkMcn8/bGUIRwMX7PbYYqg7Ul8G1xlEJxv3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517408;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=d81ExAxPgB4ho06b2P/f/Sefy0ouK/N3yAQ4UtqKUUw=;
	b=GD1QOSwZNQ7ancACQBiUUDm9o1sfqA0eL/FmkFXF/iIfbm0n7NaffLAByBjuxiTa2323
	 ekW75aksDSAj2qyDTV/N5b7aVJjtv1SjMXJwNhVKneVlCA9LAavi1Tq8oCdipqmjD88DC
	 GHGQ6/1Zw644q7ff2JMGWkGkusRBnEJb2Mcl1OS6cqPs/nqsV1Ejn/DsBG1ppA/FTzbvu
	 nsG9ls9qStrwnAMZhaX5asHcOvx/Uu6sO5qE4zKXsp7s08dCOciKoOIl3lUxs0I9jDsf9
	 6lNwhkup+m2hCry6v6cDecj4/EH/OrsxN9IQG/f+miBJpGDuRECC4TOWg8El+5cyqvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LU4YPKWX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.26
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011026.outbound.protection.outlook.com [52.101.62.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AA4606A31A
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 17:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8AA4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LU4YPKWX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OuqDLBX/NiRYnYoUYEGzWcv/FmpLgWehehtDtb01GAy/JD6tAeuF7XFeErf3sqlBM0DLS7j2mAHchWBH7ltuDv1IJkz0g0QXMkRIGr9Oee12gqF2Ljt75dn83hzn+DzlmJhOAy13zFmicAuESNrqYMog1gsrr6YlBbGMVI8oAsYG4lnLZYnQzNcen+slqYj0ca2iPD4D2P3hqYJc0/DAKIkku+EgSUbPxNVgcytonY8hmZX0W9PYN23FWMVilt6Vhf+G0iFIP63MWWVnqP2eo8IB9GBqcT5f8M8Mxf25ux51ukCczn5HaW1tsga0SpnBtdGNJOAOGHyaEN+PjapKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d81ExAxPgB4ho06b2P/f/Sefy0ouK/N3yAQ4UtqKUUw=;
 b=ymzrSZ2DpXCYxX+u4M7dFakMghwfAC4jozfuiBzrk+n55vM7Y0y4ndq9KPgCS1wMvpF6OihhaUZw1/AeuZymo+JDCwacZ74pueIPpBbYhYxVi25SBH+jHWJIN4fOv6Uqd11v1eDZkjK+eHxt/FfYFFK47EIa1Fj4zL+Uodb1pE25/Qse46UKzhzDicCNgvB7vH0zZzZ2nH/qrk9EeyGD55uzk/i5szFY9osPumZuP7Zxn8dDx9kAByWySxp4s5wGYMhxfeT+xRzT7Jtfctu5EhdsnNMcifZ9dUnKJX8K6RyAFC4LATqPlZsKOb7h3YLvxUuGRaX9Mg7G2M9Y2gPeJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d81ExAxPgB4ho06b2P/f/Sefy0ouK/N3yAQ4UtqKUUw=;
 b=LU4YPKWX81mmhCquqF3ElnCEUVLEYuN8EDtvRdIGgD9biuN183eGviUrf69Tcf5jbv3ysRYob8JUMJKJeD455viFjyY/xaxYZXiYABSedT+3FUFuCKMWblseVJEvjlwndDYCB0WD0xShUX0kt1FzmFxsEkW4kR6AQ0fRskGvvXMASimmj5pQ6bLwViujhPRap/zK9O3YLyaUnY0Sge1/WtKos86Lqs5x9AhP9tDgdk7V7764EghdgLc0Gzu7HD5GnoSGm0wrmR/8A0pp1DNFtSVjwyAbsZASlmx2DsVe0Z0+oMlw5AsQBJEg+KvQVMmXyTTBnryxWZYr/ZCtXNOm8A==
Received: from MN0PR05CA0016.namprd05.prod.outlook.com (2603:10b6:208:52c::15)
 by DS7PR12MB5743.namprd12.prod.outlook.com (2603:10b6:8:72::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 17:28:56 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::a1) by MN0PR05CA0016.outlook.office365.com
 (2603:10b6:208:52c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15 via Frontend Transport; Tue,
 20 Oct 2026 17:28:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 20 Oct 2026 17:28:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 20 Oct
 2026 10:28:31 -0700
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 10:28:29 -0700
From: Felix Radensky <fradensky@nvidia.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Hans de
 Goede" <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
CC: Felix Radensky <fradensky@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>
Subject: [PATCH platform-next v3 3/3] platform/mellanox: nvsw-host-spc6: Add support for SPC6 air cooled switches
Date: Tue, 20 Oct 2026 20:27:56 +0300
Message-ID: <20261020172756.4160946-4-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020172756.4160946-1-fradensky@nvidia.com>
References: <20261020172756.4160946-1-fradensky@nvidia.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|DS7PR12MB5743:EE_
X-MS-Office365-Filtering-Correlation-Id: 17391d9f-0c06-420d-6059-08df2ecf9ecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|261009223027099003|10067099003|3023799007|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	isOxXsX7BUKBWj1L7tyO+JK3U0TODSg0IsgdG7jETcpjjfoT9B/Fx2WGnCSOXhqYeRwN2XHJZNjHLD3uC/qFI6YorjdD+8ZTzpw7R2x4f+zc6ywTITzt0mP8khim0XQPtl8WC51q9AJrU0vZWuTgdzadIWGhY5xnXXMlJZPpeYK/eRzRYtBCJwvzH1fydZrqQO1mt3CqAtKp6J5mL1ta7vmH4O8obw2dXmz58ouyUxhArOjCgrOH8xLbzLA36tJYM64OVnSA8qda8nia/ru6z8am5AHPOrwMaE5y/B1hi+TfKxKlorJFrlsQUE21OkD4OqMGcfN49QCunjTgKGIU0LtM/DSPW1V4aBt1CWxvO9uvKWqDElQFtwj1F8lhat5Dlqzz3+QZR/xyL5hVK9kd0eYPdgT+F1E/u1DBTdqJVStstwBnzyL6P3Cli0P8pbIbpA0VmKZZ3dmYIKVgHqw5izQl3CSYwkoG1kgJcrNTmHlcgjsJrsfTDZjMXF9jZVoO2HwXmzCTQKwlLDOcgecuZ6ZP2u4bqY2vts4jJu+aSCOkhQtKMGw2Y0fGkRaIBzo691q+s/z0FjsoV73cXFCM61s/urc3HDwzLMdcJDz/ANt4PmRXtqjwkG7GReSTLE8Nwb4zalWfhRICrE+AYihcgHQGGTv2x/mS+L0PlOsebWXo7YhiwaXHqdcxLfpHsflnIuxlvx54GyI6HCzDgHngYQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(261009223027099003)(10067099003)(3023799007)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JzaV3Y2cEBjhFVXCOI0ugGH+AaIxvZUHjOrP/E1tp4P4T3SgkmY5Ga38oJbsU41auNJAk2LZJGshwGDUuwBEhC38EJsK5j6v2Ie1NpEPz6ZjCrL3AystGNbgr5Y7n8TUOmhNfiRzfIxZTGg5PgiLtie+h6roISUk3o7pjcAGGDM6LiUqJpOQRkAj5yKaDFUi7yonROTwaJPx86PTkQYI8eaMthpwupZyaY0ZkzwfgvVFo6tddidwqhYbkAkf3/P81UDK1WBUxaE7Ve8NxdzpV5dLTvM5i6nWctnZz4fZWoztPI7cGWSHQeal+t9MGCbZxvkUjToo9kS+RYqwLO8QWKsxPPg+/jc3InytAtpDRpGBzlTNYI4Ybgo9+MM+o5SFMRSaCMoT48pErd6nqjZAq1n2MaKejDFmu4n1AG4K9nK+EcAj8DBhWd2BisIxaw1t
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 17:28:56.5339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17391d9f-0c06-420d-6059-08df2ecf9ecb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5743

Add support for air cooled Ethernet switches based on the Nvidia SPC6
ASIC. Unlike the liquid cooled systems already supported by the
driver, these carry their own power supplies and fan drawers.

They therefore expose a different set of register access attributes:
power supply presence, AC and DC status and fan drawer presence, in
place of the coolant leakage detection and power distribution board
status of the liquid cooled systems. They also come with their own LED
layout, adding power supply and per fan drawer LEDs, and with fan
control.

The CPLD can override the fan PWM and drive the fans at full speed when
it detects a fan fault. Clear the enable bit for that override through
the set_reg_default callback, which runs before the fan device is
registered, leaving the fan speed to the software, as mlx-platform does
for the earlier generations.

Describe the system and select its description through the driver_data
of the matching DMI entry, so that the board data is chosen by the SKU
that was matched rather than by inspecting DMI again.

Document the power supply and fan drawer attributes the new system
exposes, which are not yet covered by
Documentation/ABI/stable/sysfs-driver-mlxreg-io.

Signed-off-by: Felix Radensky <fradensky@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---

v2->v3
Additional fixes added by Felix:
- Describe jtag_enable as the single bit it is, as in patch 2.
- Drop the aux_pwr_cycle attribute, which is not supported on systems
  with power supply units.
- Clear the CPLD fan fault override enable bit, so that the fan speed
  is left to the software. This is done from the board driver through
  the set_reg_default callback, which the core calls before the fan
  device is registered.

Issues reported by the sashiko.dev review:
- Fix the documented polarity of psu_status. The CPLD reports power
  supply presence active low, so bit value 0 means the unit is
  present. psu_ac_status and psu_dc_status share the same
  description block but are active high, so the polarity is now
  spelled out per attribute instead of in one sentence covering all
  three.
- Fix the documented polarity of fan_status. The CPLD reports fan
  drawer presence active low, so bit value 0 means the drawer is
  present, which is what mlxreg_fan_read() already assumes when it
  reads the same register through .reg_prsnt. The ABI text claimed
  the opposite.
- Drop the claim that this system exposes power supply alarm
  indications from the commit message. The alarm registers are
  defined and reachable through the register map, but no attribute is
  described over them.
- Correct the mode of the pwr_cycle attribute, which was 0244 instead
  of the 0200 used by the liquid cooled table and documented in the
  ABI. 0244 denied read access to root while granting it to everyone
  else on a write only attribute.

v1->v2
- No change. The hunk offsets moved because of the include additions
  in patches 1 and 2.

 .../ABI/stable/sysfs-driver-mlxreg-io         |  41 ++
 drivers/platform/mellanox/nvsw-core.c         |  53 ++
 drivers/platform/mellanox/nvsw-host-spc6.c    | 602 ++++++++++++++++++
 drivers/platform/mellanox/nvsw.h              |  21 +
 4 files changed, 717 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index e6128933f343..4c6e5514c59d 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -972,3 +972,44 @@ Description:	These files show the system reset cause. Respectively:
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
+		and unit DC power good. In psu_status bit value 0 means the
+		related unit is present, 1 - otherwise. In psu_ac_status and
+		psu_dc_status bit value 1 means the related power is good,
+		0 - otherwise.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/fan_status
+Date:		October 2026
+KernelVersion:	7.4
+Contact:	Felix Radensky <fradensky@nvidia.com>
+Description:	This file shows the presence of the system fan drawers, one bit
+		per drawer. Bit value 0 means the related drawer is present,
+		1 - otherwise.
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
index 8283a2af0f02..bb5c312e098b 100644
--- a/drivers/platform/mellanox/nvsw-core.c
+++ b/drivers/platform/mellanox/nvsw-core.c
@@ -46,6 +46,9 @@ static bool nvsw_writeable_reg(struct device *dev, unsigned int reg)
 	case NVSW_REG_GP5_OFFSET:
 	case NVSW_REG_GP6_OFFSET:
 	case NVSW_REG_LED1_OFFSET:
+	case NVSW_REG_LED2_OFFSET:
+	case NVSW_REG_LED3_OFFSET:
+	case NVSW_REG_LED4_OFFSET:
 	case NVSW_REG_LED5_OFFSET:
 	case NVSW_REG_LED6_OFFSET:
 	case NVSW_REG_LED7_OFFSET:
@@ -72,8 +75,14 @@ static bool nvsw_writeable_reg(struct device *dev, unsigned int reg)
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
@@ -147,6 +156,9 @@ static bool nvsw_readable_reg(struct device *dev, unsigned int reg)
 	case NVSW_REG_RESET_CAUSE1_OFFSET:
 	case NVSW_REG_RESET_CAUSE2_OFFSET:
 	case NVSW_REG_LED1_OFFSET:
+	case NVSW_REG_LED2_OFFSET:
+	case NVSW_REG_LED3_OFFSET:
+	case NVSW_REG_LED4_OFFSET:
 	case NVSW_REG_LED5_OFFSET:
 	case NVSW_REG_LED6_OFFSET:
 	case NVSW_REG_LED7_OFFSET:
@@ -204,9 +216,18 @@ static bool nvsw_readable_reg(struct device *dev, unsigned int reg)
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
@@ -248,6 +269,16 @@ static bool nvsw_readable_reg(struct device *dev, unsigned int reg)
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
@@ -325,6 +356,9 @@ static bool nvsw_volatile_reg(struct device *dev, unsigned int reg)
 	case NVSW_REG_RESET_CAUSE1_OFFSET:
 	case NVSW_REG_RESET_CAUSE2_OFFSET:
 	case NVSW_REG_LED1_OFFSET:
+	case NVSW_REG_LED2_OFFSET:
+	case NVSW_REG_LED3_OFFSET:
+	case NVSW_REG_LED4_OFFSET:
 	case NVSW_REG_LED5_OFFSET:
 	case NVSW_REG_LED6_OFFSET:
 	case NVSW_REG_LED7_OFFSET:
@@ -380,9 +414,18 @@ static bool nvsw_volatile_reg(struct device *dev, unsigned int reg)
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
@@ -409,6 +452,8 @@ static bool nvsw_volatile_reg(struct device *dev, unsigned int reg)
 	case NVSW_REG_LEAK_MASK_OFFSET:
 	case NVSW_REG_GP4_RO_OFFSET:
 	case NVSW_REG_GP5_RO_OFFSET:
+	case NVSW_REG_CURRENT_TEMP_RO:
+	case NVSW_REG_SWITCH_IC_QTY:
 	case NVSW_REG_CPLD1_MVER_OFFSET:
 	case NVSW_REG_CPLD2_MVER_OFFSET:
 	case NVSW_REG_CPLD3_MVER_OFFSET:
@@ -426,6 +471,14 @@ static bool nvsw_volatile_reg(struct device *dev, unsigned int reg)
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
index a87d796004fa..cce18fd9ad64 100644
--- a/drivers/platform/mellanox/nvsw-host-spc6.c
+++ b/drivers/platform/mellanox/nvsw-host-spc6.c
@@ -33,10 +33,14 @@
  * struct nvsw_host_spc6_cfg - per SKU board description
  * @regs_io: register access platform data;
  * @led: led platform data;
+ * @fan: fan platform data, NULL on systems without fans;
+ * @set_reg_default: set default registers callback, NULL if not required;
  */
 struct nvsw_host_spc6_cfg {
 	struct mlxreg_core_platform_data *regs_io;
 	struct mlxreg_core_platform_data *led;
+	struct mlxreg_core_platform_data *fan;
+	int (*set_reg_default)(struct regmap *regmap);
 };
 
 /* Platform mux channels */
@@ -69,7 +73,9 @@ static struct mlxcpld_mux_plat_data *nvsw_host_mux_data[NVSW_MUX_MAX];
 static struct i2c_board_info *nvsw_host_mux_brdinfo;
 static struct mlxreg_core_platform_data *nvsw_led_data;
 static struct mlxreg_core_platform_data *nvsw_regs_io_data;
+static struct mlxreg_core_platform_data *nvsw_fan_data;
 static struct mlxreg_core_platform_data *nvsw_wd_data[NVSW_WD_MAX];
+static int (*nvsw_set_reg_default)(struct regmap *regmap);
 static int nvsw_host_mux_num;
 static struct platform_device *nvsw_host_dev;
 
@@ -562,6 +568,358 @@ static struct mlxreg_core_platform_data nvsw_host_spc6_lc_regs_io = {
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
+		.mode = 0200,
+	},
+	{
+		.label = "pwr_down",
+		.reg = NVSW_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
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
+		.mask = GENMASK(7, 0) & ~BIT(0),
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
@@ -596,6 +954,219 @@ static struct mlxreg_core_platform_data nvsw_host_spc6_lc_led = {
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
@@ -707,12 +1278,31 @@ static void nvsw_host_spc6_mux_topology_exit(struct nvsw_core *nvsw_core)
 		platform_device_unregister(nvsw_core->mux[i]);
 }
 
+/* Register default values callback. */
+static int nvsw_host_spc6_set_reg_default(struct regmap *regmap)
+{
+	/* The CPLD can override the fan PWM and drive the fans at full speed
+	 * on a fan fault. Clear the enable bit for that override, leaving the
+	 * fan speed to the software.
+	 */
+	return regmap_update_bits(regmap, NVSW_REG_GP0_OFFSET,
+				  NVSW_FAN_CONTROL_EN_MASK, 0);
+}
+
 /* Liquid cooled systems, without power supplies and fans. */
 static const struct nvsw_host_spc6_cfg nvsw_host_spc6_cfg_lc = {
 	.regs_io = &nvsw_host_spc6_lc_regs_io,
 	.led = &nvsw_host_spc6_lc_led,
 };
 
+/* Air cooled system, equipped with power supplies and fan drawers. */
+static const struct nvsw_host_spc6_cfg nvsw_host_spc6_cfg_ac = {
+	.regs_io = &nvsw_host_spc6_ac_regs_io,
+	.led = &nvsw_host_spc6_ac_led,
+	.fan = &nvsw_host_spc6_ac_fan,
+	.set_reg_default = nvsw_host_spc6_set_reg_default,
+};
+
 static int __init nvsw_host_dmi_spc6_switch_matched(const struct dmi_system_id *dmi)
 {
 	const struct nvsw_host_spc6_cfg *cfg = dmi->driver_data;
@@ -725,6 +1315,8 @@ static int __init nvsw_host_dmi_spc6_switch_matched(const struct dmi_system_id *
 	nvsw_host_mux_brdinfo = &nvsw_host_spc6_mux_brdinfo;
 	nvsw_regs_io_data = cfg->regs_io;
 	nvsw_led_data = cfg->led;
+	nvsw_fan_data = cfg->fan;
+	nvsw_set_reg_default = cfg->set_reg_default;
 	for (i = 0; i < ARRAY_SIZE(nvsw_host_spc6_wd_set); i++)
 		nvsw_wd_data[i] = &nvsw_host_spc6_wd_set[i];
 
@@ -732,6 +1324,14 @@ static int __init nvsw_host_dmi_spc6_switch_matched(const struct dmi_system_id *
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
@@ -824,6 +1424,8 @@ static int nvsw_host_probe(struct platform_device *pdev)
 		nvsw_core->wd_data[i] = nvsw_wd_data[i];
 	nvsw_core->regio_data = nvsw_regs_io_data;
 	nvsw_core->led_data = nvsw_led_data;
+	nvsw_core->fan_data = nvsw_fan_data;
+	nvsw_core->set_reg_default = nvsw_set_reg_default;
 	nvsw_core->mux_init = nvsw_host_spc6_mux_topology_init;
 	nvsw_core->mux_exit = nvsw_host_spc6_mux_topology_exit;
 	platform_set_drvdata(pdev, nvsw_core);
diff --git a/drivers/platform/mellanox/nvsw.h b/drivers/platform/mellanox/nvsw.h
index 88b16d0a36d4..e834a36f2d1f 100644
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
 
@@ -210,6 +230,7 @@ struct regmap;
 #define NVSW_LEAK_AGGR_MASK		BIT(7)
 #define NVSW_EROT_MASK			GENMASK(2, 0)
 #define NVSW_FAN_NG_MASK		GENMASK(6, 0)
+#define NVSW_FAN_CONTROL_EN_MASK	BIT(0)
 #define NVSW_ASIC_MASK			GENMASK(1, 0)
 #define NVSW_ASIC2_MASK			GENMASK(3, 2)
 #define NVSW_ASIC3_MASK			GENMASK(5, 4)
-- 
2.34.1

