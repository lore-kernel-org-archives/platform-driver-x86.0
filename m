Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010067.outbound.protection.outlook.com [52.101.46.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C413542F6
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 19:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791659180; cv=fail; b=dVQJTBSgoJ8aVFzbYKlBaOdrUDuzFUIgo/9tuacRit4sjFoPM//+I/qKG1koflWyue7JzKeFjIlgOo0dDozafUq51SKd/EAWakbXAh4AbxPHxlmTkH40qkuRcLldNTv8FaNHCuv9H0ipJHqdidE1uk0KweTwXvU7hjLMOzB5V60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791659180; c=relaxed/simple;
	bh=7p8O67IGWe4WAAewoEV2reOp+lTjI4FzZMsPjxigKnk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ieD/xPLoTtho68jUz2zghock2OEvJun+HwcKExqhFQAFXiFZzPkM/PHmSi3c2G+eZP4MglUIh4LS0Ws7vwCRoTpRVH93CWra8w8hJs8m2XuEa67T/iPIrs/B+43aaJDnnoStnNMVlT/VaduaU2JORb9BIuXw+C+KHvKVB8KwnGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HwqsRDmk; arc=fail smtp.client-ip=52.101.46.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HwqsRDmk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1UEtd0OGNBbUYjRrJrpIaOxFTY9AgbxlScpJIaEQIeA0A5bKQi//2MJGSijLz/bvdxSqP/It4gd19zKn7FcHtIGvFBiXEQUWzgFZ3EUxRWuSjkyxLLiICQzQUC1/GsIhCgRlkEJaniraipFp7oXxR74Bhn3M1l30FVuqz415JawvgtkbnCAQCC/Ktcu0oO49bBOp8kM7YuOxurKt7GAUEYc4lFS9Ib4FGn98xLprTeVDvNf+g3EVK+ftImRpxfO7PVJrtduJEy8LokDi516P/w2zexkO0AszcwKKK1wA7ZMu5a0StuelR1xsxUvFLfAVLFK1jo3uXrK3nZzZeNFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6cQNtCN3cVdEbXEioVlY6CjT5YOSd+vt32Fk4kp4cA=;
 b=Q1lX6WPHnFpWZtNvsIZ4VZeId/m0Evbwzx5BnCdbYtRLXTUw7+Os26W03iIPWJXrKXsiUQRdh8WdkwzN6NX5jFdUQhGHFSNRZyWC8EPGYwnUA0zjBKxuqCq7VrckCWnhlJL1SnG5qC1Mlh1WU1OxxkSZJMujW39Yht0R8B79lSKtrmaptY3Bfj971w1DUk/7bPYS+XqNXbf5Mwe+gd7jSoWBwfZBh45zDc/iRFdtvrI6YuwHz0FjNEJ6cROElbcN8f6qUwlrfHTPbb3mp+EyOoY/49nHENnpQapws+hjJNVbd3ZGniBOdemyLLohA3xQmE0Qsm3OXHFqLd728cukoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6cQNtCN3cVdEbXEioVlY6CjT5YOSd+vt32Fk4kp4cA=;
 b=HwqsRDmkjPGvN1HWBpGRgd22JqeGLcazvq8B3vzEPS7ji8HCwbA8mJcnIpzVncpwa0w96Itr7Vl+SCt9WFp9900+wSbsVFpu7ev5iNg/DUEXqLtpUv2nj9Nq8OEzWwdzDX+kyTl6dUoazrZnbey5E2pViM46ACt3nrVuFlGprPc=
Received: from BN1PR10CA0030.namprd10.prod.outlook.com (2603:10b6:408:e0::35)
 by LV1PR12MB147030.namprd12.prod.outlook.com (2603:10b6:408:514::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sat, 10 Oct
 2026 19:06:12 +0000
Received: from BL6PEPF00020E5F.namprd04.prod.outlook.com
 (2603:10b6:408:e0:cafe::aa) by BN1PR10CA0030.outlook.office365.com
 (2603:10b6:408:e0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Sat, 10
 Oct 2026 19:06:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E5F.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 10 Oct 2026 19:06:12 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 10 Oct
 2026 14:06:04 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>, <W_Armin@gmx.de>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/3] platform/x86/amd/wmi: Add AMD Overclocking (AOD) WMI driver
Date: Sun, 11 Oct 2026 00:35:41 +0530
Message-ID: <20261010190543.563161-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261010190543.563161-1-Shyam-sundar.S-k@amd.com>
References: <20261010190543.563161-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E5F:EE_|LV1PR12MB147030:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f4099f2-f293-42a3-4a7f-08df27018ce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|10067099003|3023799007|261009223027099003|11063799006|5023799004|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	39FEtvp8SR+2X31d/OaAAATAArTF9aEJ3H4GfSZLEr4mRqlzn5KmHL0y9CG5hwqBgmlmksM1GrgrPGQjL5sM8qa9s7BgRYZCzpiWEnTdzyXGGlDss/LZt6fVlhnKNZ2je/wBuILuBusJzef5p4/2fcayg2pDg1ADQJsh29Sckkwe2+qfAqsiBPFbmG7q1Ac3caLNEibt1TxcTFFodFgwoPvfeviqPjtocujzxsFuyQ38oMu13OlBWS5uZklkaW4Nn1RsZw/QsDYPUMb1I/gxj3QS4Gx6kd2GuzzU/Expb/PeLob2dCkfuMQcNRvE3zRzNwphZcqQtTFpkKd603zbZqWl/xI6ze689FIUjKOn69s4y8Jgih2G8JkEyICVgBPCFoMNldVC9A6wGGrxR1anJ3zLP2oUhufwi/QQ3aSEHJ0rIiB1QyA991aOMpXMNF77Q0dOTMEkYy/rRimzTpGPOEIWusCYhUipT97g4mZoNLvrKZ8at/JT1igCI/1dCXCAZXpSiWefEp5k0Eq9Jii4I/Obfme9soFGAmFiQWQFPuYavRuiLdJ5qhl4+AN6/gcSNcOQzFL0JkHh/f7q8agf8mOcuIz0zwo/k6PHx0RZ3CRoTfafOisV7XLHSGk9lMmhO5bZ6VIc0l86oca7SxEPFcBMpQgTWcejKiYKRVVWT7FFMfaPtigbbQdMSM5lrfpxNr0kM3Jl3K+X8Q70b3tWrA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(10067099003)(3023799007)(261009223027099003)(11063799006)(5023799004)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ENibvXviM1s1mHwyVBtI11Fdm/ry2l3+I2gu7p+HFSUz5LHgWUpZb8ITZZCLaO+TPT5BWKhpSnAho2jluezKl4K5NfsgSNCGY5gzeFXdccnD55WQgzB1Th0oeHP0U55YNkgUIxo2jOADOFM+lYe4wIdzziNGeYYRP9IigKK1dAKCLBzC+0B7xWwkYvuxMdc6OW+8ACtCA7bPhFdj1V7secnbtxbA1hiAf3k72bfgBR2C9ZvqfLlu5vvBAzV+PIpbU+QotOpD7QFETersJM5BAGdZ0ETWqaqCVUWLDkWtSlta0a09U1zqrdx8wzvE4jguxCpS3o5lWVjXYmrH+GK9oxtf9D51L32DE5kpRsJvdkjNHjuHZbWQkQW+SdfK5surJdHzrYhU1EkZps4GH6pbJnP3+K3g/KMdlBSQw+gCEDUVG1yxR+bYRNl4zGX9O3XK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 19:06:12.1709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4099f2-f293-42a3-4a7f-08df27018ce3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E5F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB147030

AMD Ryzen platforms implement the AMD Overclocking (AOD) interface in the
platform firmware and expose it through a WMI device. The interface is
command based: the firmware lists the commands it supports, and for each
command the supported range or list of values can be queried and a new
value can be applied. On Windows, this interface is used by AMD Ryzen
Master.

Add a driver for this WMI device. As a start, expose the following
settings through sysfs:
 - PPT, TDC and EDC limits (write-only) along with their supported range
   and step size
 - SMT enable
 - current memory clock (read-only)

The firmware stores new values in its setup variables and applies them
on the next reboot. It does not report the active PPT, TDC and EDC
limits, so these attributes are write-only.

The attributes are only created if the firmware lists the matching
command, and the property flag of each command is used to pick between
range and discrete value checks.

The firmware supports many more commands, more attributes can be added
later as needed.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 .../ABI/testing/sysfs-platform-amd-wmi-aod    |  98 +++
 MAINTAINERS                                   |   7 +
 drivers/platform/x86/amd/Kconfig              |   1 +
 drivers/platform/x86/amd/Makefile             |   1 +
 drivers/platform/x86/amd/wmi/Kconfig          |  19 +
 drivers/platform/x86/amd/wmi/Makefile         |   8 +
 drivers/platform/x86/amd/wmi/aod.c            | 604 ++++++++++++++++++
 7 files changed, 738 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-amd-wmi-aod
 create mode 100644 drivers/platform/x86/amd/wmi/Kconfig
 create mode 100644 drivers/platform/x86/amd/wmi/Makefile
 create mode 100644 drivers/platform/x86/amd/wmi/aod.c

diff --git a/Documentation/ABI/testing/sysfs-platform-amd-wmi-aod b/Documentation/ABI/testing/sysfs-platform-amd-wmi-aod
new file mode 100644
index 000000000000..1f7bb5b87434
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-amd-wmi-aod
@@ -0,0 +1,98 @@
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/ppt_limit
+Date:		February 2027
+KernelVersion:	7.5
+Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:
+		(WO) Package Power Tracking (PPT) limit of the CPU in
+		microwatts. This is the maximum power the CPU socket is
+		allowed to draw.
+
+		The value must be within ppt_limit_min and ppt_limit_max and
+		ppt_limit_min plus a multiple of ppt_limit_step, otherwise
+		-EINVAL is returned. The firmware stores the new value and
+		applies it on the next reboot. The firmware does not report
+		the active value, so this attribute cannot be read.
+
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/ppt_limit_min
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/ppt_limit_max
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/ppt_limit_step
+Date:		February 2027
+KernelVersion:	7.5
+Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:
+		(RO) Minimum, maximum and step size of the PPT limit in
+		microwatts supported by the platform.
+
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/tdc_limit
+Date:		February 2027
+KernelVersion:	7.5
+Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:
+		(WO) Thermal Design Current (TDC) limit of the CPU in
+		milliamps. This is the maximum current the voltage regulators
+		can deliver over a sustained period.
+
+		The value must be within tdc_limit_min and tdc_limit_max and
+		tdc_limit_min plus a multiple of tdc_limit_step, otherwise
+		-EINVAL is returned. The firmware stores the new value and
+		applies it on the next reboot. The firmware does not report
+		the active value, so this attribute cannot be read.
+
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/tdc_limit_min
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/tdc_limit_max
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/tdc_limit_step
+Date:		February 2027
+KernelVersion:	7.5
+Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:
+		(RO) Minimum, maximum and step size of the TDC limit in
+		milliamps supported by the platform.
+
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/edc_limit
+Date:		February 2027
+KernelVersion:	7.5
+Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:
+		(WO) Electrical Design Current (EDC) limit of the CPU in
+		milliamps. This is the peak current the voltage regulators
+		can deliver for a short period.
+
+		The value must be within edc_limit_min and edc_limit_max and
+		edc_limit_min plus a multiple of edc_limit_step, otherwise
+		-EINVAL is returned. The firmware stores the new value and
+		applies it on the next reboot. The firmware does not report
+		the active value, so this attribute cannot be read.
+
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/edc_limit_min
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/edc_limit_max
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/edc_limit_step
+Date:		February 2027
+KernelVersion:	7.5
+Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:
+		(RO) Minimum, maximum and step size of the EDC limit in
+		milliamps supported by the platform.
+
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/mem_clock
+Date:		February 2027
+KernelVersion:	7.5
+Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:
+		(RO) Current memory clock (MEMCLK) in MHz. For DDR memory the
+		data rate in MT/s is twice this value, for example 2800 for
+		DDR5-5600.
+
+What:		/sys/bus/wmi/devices/95F20B61-3D44-41F8-87E1-03CBF94C4E8F[-X]/smt_enable
+Date:		February 2027
+KernelVersion:	7.5
+Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:
+		(RW) Simultaneous Multithreading (SMT) setting of the
+		platform firmware. Reading returns 1 if SMT is enabled and 0
+		otherwise.
+
+		Writing 0 or 1 changes the setting. Other values, or a value
+		the firmware does not support, are rejected with -EINVAL. The
+		firmware stores the new value and applies it on the next
+		reboot. Depending on the platform, enabling SMT again may
+		need a power cycle instead of a reboot.
diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90b..d069d02665e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1335,6 +1335,13 @@ F:	drivers/spi/spi-amd-pci.c
 F:	drivers/spi/spi-amd.c
 F:	drivers/spi/spi-amd.h
 
+AMD WMI AOD DRIVER
+M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Supported
+F:	Documentation/ABI/testing/sysfs-platform-amd-wmi-aod
+F:	drivers/platform/x86/amd/wmi/
+
 AMD XDNA DRIVER
 M:	Min Ma <mamin506@gmail.com>
 M:	Lizhi Hou <lizhi.hou@amd.com>
diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index a1a74ef6c859..8f51901f98ca 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -7,6 +7,7 @@ source "drivers/platform/x86/amd/hsmp/Kconfig"
 source "drivers/platform/x86/amd/pmf/Kconfig"
 source "drivers/platform/x86/amd/pmc/Kconfig"
 source "drivers/platform/x86/amd/hfi/Kconfig"
+source "drivers/platform/x86/amd/wmi/Kconfig"
 
 config AMD_3D_VCACHE
 	tristate "AMD 3D V-Cache Performance Optimizer Driver"
diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
index 2f467dbbfc8a..a3415f83cf03 100644
--- a/drivers/platform/x86/amd/Makefile
+++ b/drivers/platform/x86/amd/Makefile
@@ -13,3 +13,4 @@ obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
 obj-$(CONFIG_AMD_HALO_LED)	+= amd_halo_led.o
 obj-$(CONFIG_AMD_ISP_PLATFORM)	+= amd_isp4.o
 obj-$(CONFIG_AMD_HFI)		+= hfi/
+obj-y				+= wmi/
diff --git a/drivers/platform/x86/amd/wmi/Kconfig b/drivers/platform/x86/amd/wmi/Kconfig
new file mode 100644
index 000000000000..a8d2c35ef919
--- /dev/null
+++ b/drivers/platform/x86/amd/wmi/Kconfig
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# AMD WMI drivers
+#
+
+config AMD_WMI_AOD
+	tristate "AMD Overclocking (AOD) WMI driver"
+	depends on ACPI_WMI
+	help
+	  This driver adds support for the AMD Overclocking (AOD) WMI
+	  interface found on AMD Ryzen platforms. It allows to change the
+	  PPT, TDC and EDC limits and the SMT setting of the firmware, and
+	  to read the current memory clock through sysfs.
+
+	  Changing these settings can make the system unstable or damage
+	  the hardware. If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called amd-wmi-aod.
diff --git a/drivers/platform/x86/amd/wmi/Makefile b/drivers/platform/x86/amd/wmi/Makefile
new file mode 100644
index 000000000000..4848193aff88
--- /dev/null
+++ b/drivers/platform/x86/amd/wmi/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for linux/drivers/platform/x86/amd/wmi
+# AMD WMI drivers
+#
+
+obj-$(CONFIG_AMD_WMI_AOD)	+= amd-wmi-aod.o
+amd-wmi-aod-y			:= aod.o
diff --git a/drivers/platform/x86/amd/wmi/aod.c b/drivers/platform/x86/amd/wmi/aod.c
new file mode 100644
index 000000000000..c64a02b5d379
--- /dev/null
+++ b/drivers/platform/x86/amd/wmi/aod.c
@@ -0,0 +1,604 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD Overclocking (AOD) WMI driver
+ *
+ * Copyright (c) 2026, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ */
+
+#include <linux/cleanup.h>
+#include <linux/compiler_attributes.h>
+#include <linux/container_of.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/device/devres.h>
+#include <linux/errno.h>
+#include <linux/gfp_types.h>
+#include <linux/kobject.h>
+#include <linux/kstrtox.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+#include <linux/units.h>
+#include <linux/wmi.h>
+
+#include <linux/byteorder/generic.h>
+
+#define DRIVER_NAME			"amd-wmi-aod"
+#define AMD_AOD_WMI_GUID		"95F20B61-3D44-41F8-87E1-03CBF94C4E8F"
+
+/* WMI method IDs */
+#define AOD_QUERY_VERSION		1
+#define AOD_GET_OBJECT_ID		3
+#define AOD_GET_DVALUES			4
+#define AOD_RUN_COMMAND			5
+#define AOD_GET_MINMAX_STEPPING		6
+#define AOD_GET_OBJECT_ID2		8
+
+/* Command IDs */
+#define AOD_CMD_MEM_CLOCK		0x00020001
+#define AOD_CMD_SMT_ENABLE		0x00020026
+#define AOD_CMD_PPT_LIMIT		0x00050001
+#define AOD_CMD_TDC_LIMIT		0x00050002
+#define AOD_CMD_EDC_LIMIT		0x00050003
+
+#define AOD_MAX_OID_COUNT		64
+#define AOD_DVALUES_COUNT		100
+
+/* Property flag of a command: discrete values or a linear range */
+#define AOD_PROPERTY_LINEAR		1
+
+#define to_amd_aod_attr(_attr)	container_of(_attr, struct amd_aod_attr, dev_attr)
+
+#define AMD_AOD_ATTR(_name, _mode, _show, _store, _setting, _field, _scale)	\
+	static struct amd_aod_attr amd_aod_attr_##_name = {			\
+		.dev_attr = __ATTR(_name, _mode, _show, _store),		\
+		.setting = _setting,						\
+		.field = _field,						\
+		.scale = _scale,						\
+	}
+
+/*
+ * GetObjectID/GetObjectID2 result: the length, followed by the ID and the
+ * property arrays, followed by AOD_MAX_OID_COUNT WMI strings.
+ *
+ * The MOF defines fixed-size arrays for all results, so shorter buffers
+ * are rejected.
+ */
+struct amd_aod_oid_result {
+	__le32 length;
+	__le32 id[AOD_MAX_OID_COUNT];
+	__le32 property[AOD_MAX_OID_COUNT];
+} __packed;
+
+struct amd_aod_dvalues_result {
+	__le32 id;
+	__le32 current_value;
+	__le32 length;
+	__le32 dvalues[AOD_DVALUES_COUNT];
+} __packed;
+
+struct amd_aod_minmax_result {
+	__le32 id;
+	__le32 current_value;
+	__le32 min;
+	__le32 max;
+	__le32 stepping;
+} __packed;
+
+/* Start of the RunCommand result buffer */
+struct amd_aod_run_command_result {
+	__le16 smi_cmd;
+	__le32 smi_status;
+} __packed;
+
+/* Command list returned by GetObjectID/GetObjectID2 */
+struct amd_aod_oid_package {
+	u32 length;
+	u32 id[AOD_MAX_OID_COUNT];
+	u32 property[AOD_MAX_OID_COUNT];
+} __packed;
+
+enum amd_aod_setting {
+	AOD_SETTING_PPT,
+	AOD_SETTING_TDC,
+	AOD_SETTING_EDC,
+	AOD_SETTING_MEM_CLOCK,
+	AOD_SETTING_SMT,
+	AOD_SETTING_MAX,
+};
+
+enum amd_aod_field {
+	AOD_FIELD_CURRENT,
+	AOD_FIELD_MIN,
+	AOD_FIELD_MAX,
+	AOD_FIELD_STEP,
+};
+
+struct amd_aod_data {
+	struct wmi_device *wdev;
+	struct mutex lock;	/* Serializes WMI calls and protects the fields below */
+	bool supported[AOD_SETTING_MAX];
+	bool linear[AOD_SETTING_MAX];
+};
+
+struct amd_aod_attr {
+	struct device_attribute dev_attr;
+	enum amd_aod_setting setting;
+	enum amd_aod_field field;
+	u32 scale;	/* sysfs units per firmware unit */
+};
+
+static const u32 amd_aod_setting_cmd[AOD_SETTING_MAX] = {
+	[AOD_SETTING_PPT] = AOD_CMD_PPT_LIMIT,
+	[AOD_SETTING_TDC] = AOD_CMD_TDC_LIMIT,
+	[AOD_SETTING_EDC] = AOD_CMD_EDC_LIMIT,
+	[AOD_SETTING_MEM_CLOCK] = AOD_CMD_MEM_CLOCK,
+	[AOD_SETTING_SMT] = AOD_CMD_SMT_ENABLE,
+};
+
+static bool amd_aod_is_limit(enum amd_aod_setting setting)
+{
+	switch (setting) {
+	case AOD_SETTING_PPT:
+	case AOD_SETTING_TDC:
+	case AOD_SETTING_EDC:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/*
+ * The firmware reads the input buffer even for methods that take no
+ * arguments, so a dummy 32-bit argument is passed to those methods.
+ */
+static int amd_aod_call(struct amd_aod_data *data, u32 method_id, u32 arg,
+			struct wmi_buffer *out, size_t min_size)
+{
+	__le32 in_arg = cpu_to_le32(arg);
+	const struct wmi_buffer in = {
+		.length = sizeof(in_arg),
+		.data = &in_arg,
+	};
+
+	return wmidev_invoke_method(data->wdev, 0, method_id, &in, out, min_size);
+}
+
+static int amd_aod_query_version(struct amd_aod_data *data, u32 *version)
+{
+	struct wmi_buffer out;
+	int ret;
+
+	ret = amd_aod_call(data, AOD_QUERY_VERSION, 0, &out, sizeof(__le32));
+	if (ret)
+		return ret;
+
+	*version = le32_to_cpup(out.data);
+	kfree(out.data);
+
+	return 0;
+}
+
+static void amd_aod_parse_object_id(const struct wmi_buffer *out,
+				    struct amd_aod_oid_package *pkg)
+{
+	const struct amd_aod_oid_result *res = out->data;
+	int i;
+
+	pkg->length = min(le32_to_cpu(res->length), AOD_MAX_OID_COUNT);
+	for (i = 0; i < AOD_MAX_OID_COUNT; i++) {
+		pkg->id[i] = le32_to_cpu(res->id[i]);
+		pkg->property[i] = le32_to_cpu(res->property[i]);
+	}
+}
+
+static int amd_aod_get_object_id(struct amd_aod_data *data, u32 method_id,
+				 struct amd_aod_oid_package *pkg)
+{
+	struct wmi_buffer out;
+	int ret;
+
+	ret = amd_aod_call(data, method_id, 0, &out, sizeof(struct amd_aod_oid_result));
+	if (ret)
+		return ret;
+
+	amd_aod_parse_object_id(&out, pkg);
+	kfree(out.data);
+
+	return 0;
+}
+
+static int amd_aod_get_dvalues(struct amd_aod_data *data, u32 cmd_id,
+			       struct amd_aod_dvalues_result *res)
+{
+	struct wmi_buffer out;
+	int ret;
+
+	ret = amd_aod_call(data, AOD_GET_DVALUES, cmd_id, &out, sizeof(*res));
+	if (ret)
+		return ret;
+
+	memcpy(res, out.data, sizeof(*res));
+	kfree(out.data);
+
+	return 0;
+}
+
+static int amd_aod_get_minmax_stepping(struct amd_aod_data *data, u32 cmd_id,
+				       struct amd_aod_minmax_result *res)
+{
+	struct wmi_buffer out;
+	int ret;
+
+	ret = amd_aod_call(data, AOD_GET_MINMAX_STEPPING, cmd_id, &out, sizeof(*res));
+	if (ret)
+		return ret;
+
+	memcpy(res, out.data, sizeof(*res));
+	kfree(out.data);
+
+	return 0;
+}
+
+static int amd_aod_run_command(struct amd_aod_data *data, u32 cmd_id, u32 value, u32 *status)
+{
+	__le32 args[2] = { cpu_to_le32(cmd_id), cpu_to_le32(value) };
+	const struct wmi_buffer in = {
+		.length = sizeof(args),
+		.data = args,
+	};
+	const struct amd_aod_run_command_result *res;
+	struct wmi_buffer out;
+	int ret;
+
+	ret = wmidev_invoke_method(data->wdev, 0, AOD_RUN_COMMAND, &in, &out, sizeof(*res));
+	if (ret)
+		return ret;
+
+	res = out.data;
+	*status = le32_to_cpu(res->smi_status);
+	kfree(out.data);
+
+	return 0;
+}
+
+static int amd_aod_set_value(struct amd_aod_data *data, u32 cmd_id, u32 value)
+{
+	u32 status;
+	int ret;
+
+	ret = amd_aod_run_command(data, cmd_id, value, &status);
+	if (ret)
+		return ret;
+
+	return status ? -EIO : 0;
+}
+
+/* Read the current value, using the method that matches the command property */
+static int amd_aod_get_current(struct amd_aod_data *data, enum amd_aod_setting setting,
+			       u32 *value)
+{
+	u32 cmd_id = amd_aod_setting_cmd[setting];
+	struct amd_aod_dvalues_result dres;
+	struct amd_aod_minmax_result mres;
+	int ret;
+
+	if (data->linear[setting]) {
+		ret = amd_aod_get_minmax_stepping(data, cmd_id, &mres);
+		if (ret)
+			return ret;
+
+		if (le32_to_cpu(mres.id) != cmd_id)
+			return -EPROTO;
+
+		*value = le32_to_cpu(mres.current_value);
+		return 0;
+	}
+
+	ret = amd_aod_get_dvalues(data, cmd_id, &dres);
+	if (ret)
+		return ret;
+
+	if (le32_to_cpu(dres.id) != cmd_id)
+		return -EPROTO;
+
+	*value = le32_to_cpu(dres.current_value);
+
+	return 0;
+}
+
+/*
+ * Linear commands accept values within the min/max range in multiples of
+ * the step size, discrete commands only accept the values listed by the
+ * firmware.
+ */
+static int amd_aod_check_value(struct amd_aod_data *data, enum amd_aod_setting setting,
+			       u32 value)
+{
+	u32 cmd_id = amd_aod_setting_cmd[setting];
+	struct amd_aod_dvalues_result dres;
+	struct amd_aod_minmax_result mres;
+	u32 min, max, step, count, i;
+	int ret;
+
+	if (data->linear[setting]) {
+		ret = amd_aod_get_minmax_stepping(data, cmd_id, &mres);
+		if (ret)
+			return ret;
+
+		min = le32_to_cpu(mres.min);
+		max = le32_to_cpu(mres.max);
+		step = le32_to_cpu(mres.stepping);
+
+		if (value < min || value > max)
+			return -EINVAL;
+
+		if (step && (value - min) % step)
+			return -EINVAL;
+
+		return 0;
+	}
+
+	ret = amd_aod_get_dvalues(data, cmd_id, &dres);
+	if (ret)
+		return ret;
+
+	count = min(le32_to_cpu(dres.length), AOD_DVALUES_COUNT);
+	for (i = 0; i < count; i++) {
+		if (le32_to_cpu(dres.dvalues[i]) == value)
+			return 0;
+	}
+
+	return -EINVAL;
+}
+
+static ssize_t amd_aod_value_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct amd_aod_attr *aod_attr = to_amd_aod_attr(attr);
+	struct amd_aod_data *data = dev_get_drvdata(dev);
+	u32 value;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = amd_aod_get_current(data, aod_attr->setting, &value);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%llu\n", (u64)value * aod_attr->scale);
+}
+
+static ssize_t amd_aod_range_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct amd_aod_attr *aod_attr = to_amd_aod_attr(attr);
+	struct amd_aod_data *data = dev_get_drvdata(dev);
+	u32 cmd_id = amd_aod_setting_cmd[aod_attr->setting];
+	struct amd_aod_minmax_result res;
+	u32 value;
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = amd_aod_get_minmax_stepping(data, cmd_id, &res);
+	if (ret)
+		return ret;
+
+	switch (aod_attr->field) {
+	case AOD_FIELD_MIN:
+		value = le32_to_cpu(res.min);
+		break;
+	case AOD_FIELD_MAX:
+		value = le32_to_cpu(res.max);
+		break;
+	default:
+		value = le32_to_cpu(res.stepping);
+		break;
+	}
+
+	return sysfs_emit(buf, "%llu\n", (u64)value * aod_attr->scale);
+}
+
+static ssize_t amd_aod_value_store(struct device *dev, struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct amd_aod_attr *aod_attr = to_amd_aod_attr(attr);
+	struct amd_aod_data *data = dev_get_drvdata(dev);
+	u32 value;
+	int ret;
+
+	ret = kstrtou32(buf, 10, &value);
+	if (ret)
+		return ret;
+
+	if (value % aod_attr->scale)
+		return -EINVAL;
+
+	/* smt_enable only accepts 0 and 1 */
+	if (aod_attr->setting == AOD_SETTING_SMT && value > 1)
+		return -EINVAL;
+
+	value /= aod_attr->scale;
+
+	guard(mutex)(&data->lock);
+
+	ret = amd_aod_check_value(data, aod_attr->setting, value);
+	if (ret)
+		return ret;
+
+	ret = amd_aod_set_value(data, amd_aod_setting_cmd[aod_attr->setting], value);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+AMD_AOD_ATTR(ppt_limit, 0200, NULL, amd_aod_value_store,
+	     AOD_SETTING_PPT, AOD_FIELD_CURRENT, MICROWATT_PER_MILLIWATT);
+AMD_AOD_ATTR(ppt_limit_min, 0400, amd_aod_range_show, NULL,
+	     AOD_SETTING_PPT, AOD_FIELD_MIN, MICROWATT_PER_MILLIWATT);
+AMD_AOD_ATTR(ppt_limit_max, 0400, amd_aod_range_show, NULL,
+	     AOD_SETTING_PPT, AOD_FIELD_MAX, MICROWATT_PER_MILLIWATT);
+AMD_AOD_ATTR(ppt_limit_step, 0400, amd_aod_range_show, NULL,
+	     AOD_SETTING_PPT, AOD_FIELD_STEP, MICROWATT_PER_MILLIWATT);
+AMD_AOD_ATTR(tdc_limit, 0200, NULL, amd_aod_value_store,
+	     AOD_SETTING_TDC, AOD_FIELD_CURRENT, 1);
+AMD_AOD_ATTR(tdc_limit_min, 0400, amd_aod_range_show, NULL,
+	     AOD_SETTING_TDC, AOD_FIELD_MIN, 1);
+AMD_AOD_ATTR(tdc_limit_max, 0400, amd_aod_range_show, NULL,
+	     AOD_SETTING_TDC, AOD_FIELD_MAX, 1);
+AMD_AOD_ATTR(tdc_limit_step, 0400, amd_aod_range_show, NULL,
+	     AOD_SETTING_TDC, AOD_FIELD_STEP, 1);
+AMD_AOD_ATTR(edc_limit, 0200, NULL, amd_aod_value_store,
+	     AOD_SETTING_EDC, AOD_FIELD_CURRENT, 1);
+AMD_AOD_ATTR(edc_limit_min, 0400, amd_aod_range_show, NULL,
+	     AOD_SETTING_EDC, AOD_FIELD_MIN, 1);
+AMD_AOD_ATTR(edc_limit_max, 0400, amd_aod_range_show, NULL,
+	     AOD_SETTING_EDC, AOD_FIELD_MAX, 1);
+AMD_AOD_ATTR(edc_limit_step, 0400, amd_aod_range_show, NULL,
+	     AOD_SETTING_EDC, AOD_FIELD_STEP, 1);
+AMD_AOD_ATTR(mem_clock, 0400, amd_aod_value_show, NULL,
+	     AOD_SETTING_MEM_CLOCK, AOD_FIELD_CURRENT, 1);
+AMD_AOD_ATTR(smt_enable, 0600, amd_aod_value_show, amd_aod_value_store,
+	     AOD_SETTING_SMT, AOD_FIELD_CURRENT, 1);
+
+static struct attribute *amd_aod_attrs[] = {
+	&amd_aod_attr_ppt_limit.dev_attr.attr,
+	&amd_aod_attr_ppt_limit_min.dev_attr.attr,
+	&amd_aod_attr_ppt_limit_max.dev_attr.attr,
+	&amd_aod_attr_ppt_limit_step.dev_attr.attr,
+	&amd_aod_attr_tdc_limit.dev_attr.attr,
+	&amd_aod_attr_tdc_limit_min.dev_attr.attr,
+	&amd_aod_attr_tdc_limit_max.dev_attr.attr,
+	&amd_aod_attr_tdc_limit_step.dev_attr.attr,
+	&amd_aod_attr_edc_limit.dev_attr.attr,
+	&amd_aod_attr_edc_limit_min.dev_attr.attr,
+	&amd_aod_attr_edc_limit_max.dev_attr.attr,
+	&amd_aod_attr_edc_limit_step.dev_attr.attr,
+	&amd_aod_attr_mem_clock.dev_attr.attr,
+	&amd_aod_attr_smt_enable.dev_attr.attr,
+	NULL
+};
+
+static umode_t amd_aod_attr_is_visible(struct kobject *kobj, struct attribute *attr, int n)
+{
+	struct amd_aod_data *data = dev_get_drvdata(kobj_to_dev(kobj));
+	struct device_attribute *dev_attr = container_of(attr, struct device_attribute, attr);
+	enum amd_aod_setting setting = to_amd_aod_attr(dev_attr)->setting;
+
+	if (!data->supported[setting])
+		return 0;
+
+	/* The limits and their range are only supported for linear commands */
+	if (amd_aod_is_limit(setting) && !data->linear[setting])
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group amd_aod_group = {
+	.attrs = amd_aod_attrs,
+	.is_visible = amd_aod_attr_is_visible,
+};
+__ATTRIBUTE_GROUPS(amd_aod);
+
+static void amd_aod_scan_settings(struct amd_aod_data *data,
+				  const struct amd_aod_oid_package *pkg)
+{
+	int i, j;
+
+	for (i = 0; i < pkg->length; i++) {
+		for (j = 0; j < AOD_SETTING_MAX; j++) {
+			if (pkg->id[i] != amd_aod_setting_cmd[j])
+				continue;
+
+			data->supported[j] = true;
+			data->linear[j] = pkg->property[i] == AOD_PROPERTY_LINEAR;
+		}
+	}
+}
+
+static int amd_aod_detect_settings(struct amd_aod_data *data)
+{
+	struct amd_aod_oid_package *pkg;
+	int ret;
+
+	pkg = kzalloc_obj(*pkg);
+	if (!pkg)
+		return -ENOMEM;
+
+	ret = amd_aod_get_object_id(data, AOD_GET_OBJECT_ID, pkg);
+	if (ret)
+		goto out;
+
+	amd_aod_scan_settings(data, pkg);
+
+	/* GetObjectID2 might not be implemented by all firmware versions */
+	if (amd_aod_get_object_id(data, AOD_GET_OBJECT_ID2, pkg))
+		dev_dbg(&data->wdev->dev, "GetObjectID2 not available\n");
+	else
+		amd_aod_scan_settings(data, pkg);
+
+out:
+	kfree(pkg);
+
+	return ret;
+}
+
+static int amd_aod_probe(struct wmi_device *wdev, const void *context)
+{
+	struct device *dev = &wdev->dev;
+	struct amd_aod_data *data;
+	u32 version;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->wdev = wdev;
+
+	ret = devm_mutex_init(dev, &data->lock);
+	if (ret)
+		return ret;
+
+	dev_set_drvdata(dev, data);
+
+	/* Make sure that the firmware interface is functional */
+	ret = amd_aod_query_version(data, &version);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to query AOD interface version\n");
+
+	ret = amd_aod_detect_settings(data);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get the list of supported commands\n");
+
+	return 0;
+}
+
+static const struct wmi_device_id amd_aod_id_table[] = {
+	{ AMD_AOD_WMI_GUID, NULL },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, amd_aod_id_table);
+
+static struct wmi_driver amd_aod_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+		.dev_groups = amd_aod_groups,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = amd_aod_id_table,
+	.probe = amd_aod_probe,
+	.no_singleton = true,
+};
+module_wmi_driver(amd_aod_driver);
+
+MODULE_DESCRIPTION("AMD Overclocking (AOD) WMI driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

