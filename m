Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C97010E6
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Oct 2024 09:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728553403; cv=fail; b=UBsCCZZrLv7ftUCaCkks7bJvJG4N6A/M2pol7GYGlw3CTsdTNsPjD853agPZsr5zR3rlmfIfPjT8mXogKllFD4NYRYkCki+yowcyne3kMocJgyHMY4EyQmHBRtWEHKZawEF/z8+RjEZYv5NSN7afC53BAiQ17g7WHAI8yOVd8wA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728553403; c=relaxed/simple;
	bh=JYMjQby3JbGtP7tpb29covhxQGWTxzGwmDUn8psj6Sk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qXZkwZ3nKheEHiq0SpPBaTr6hIharf9yPJbPkdluyz++3IxDVzKPm+6J609hvpCTrS2bD7WWrVLIYL0Tc66qYd+mPcQ0Mhx/591sQbmnAasPtSKwMGBKhQYFEmFTPB0l0nIF9WpjjEwemrSU7VejWbrzYLyDsgtr1Ddlo+N+gEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nEBkZsob; arc=fail smtp.client-ip=40.107.237.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nEBkZsob"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFHZmEz0Vf2FzVLLbSKwYvq/4XLgNLQcPWH8HNFsdN1TYe4sdDBv18wnQJqonGDnhQztCNkQWXpjTKMP12ag9ZQHqVa/tzFOtkvdu0+/RuupeX0gI6cbbu2ULmRaXsmYUo/pZOOlIxQ+jRdaOAfQvlnk5eeh45mn73dLAqO43bGo46jyB+Mp2s8stPXtFSkuh3BEHy6u7wAJsHb8S609RLC9E13wAK3NdcFwlaEUTVIjcKUxmgokPBoCNxVO5z8GYJW8Wd/PUJDmeHCujlAaVFhC4XRaYeoGKvcO0/ohXpvp6YqI1xsA0uVbWoWXOQXcDOL6ga/Q0J0FVnNGVLc2zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uk0BEmRyZjPEPg2ijjgYSAISYFpN1TcSYH/+64I2+/0=;
 b=wKwjBSZvy2oIPPsaXYhm1qu3pN4uyL+2MJE+URiFAmrv+gjY1NYl/tFGZoHlTQCGe61+vICpM7AM17SZh8kX53JMMBg1d70aEep75Pou3kItiVnpT0Kgsm0GMy48Qa10uofj5P4A1I+vojA1kBpzK93u/py5fwuuiLJLfSvnTToPHpEDq+cPHi2dIKwEPal+U+hiBDRarR4wSQTIRKY1yClf+Xeaj3Im1ewZpP4K2U8KEEBu5TyNs1px1W+2BlCLoAQqtfOydMNNnMGf71OXSMo+fwnf+NxSuYJVAj2mUsD1CFSGvgsNQTHL+uCPJXU575aRn+OStmgiH8ZJhogOBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uk0BEmRyZjPEPg2ijjgYSAISYFpN1TcSYH/+64I2+/0=;
 b=nEBkZsob7hi9y5RN0tPFcu/i4Xl8ClupU3CWckBKtvrbdGTQmUlM4Q934NnUBkyv7kaBdA+OvP+D+CW4CRDGNOwiiPn0vicqSjRnpuGi2yFyu9TiOwtcoQg0qQrd98gggZH234If7weGD4mSxoarLzKtHjjJiBJPRUxPFzbNxgM=
Received: from BN7PR02CA0001.namprd02.prod.outlook.com (2603:10b6:408:20::14)
 by DM4PR12MB7550.namprd12.prod.outlook.com (2603:10b6:8:10e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 09:43:18 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:20:cafe::d7) by BN7PR02CA0001.outlook.office365.com
 (2603:10b6:408:20::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18 via Frontend
 Transport; Thu, 10 Oct 2024 09:43:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.0 via Frontend Transport; Thu, 10 Oct 2024 09:43:18 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Oct
 2024 04:43:14 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: <perry.yuan@amd.com>, <mario.limonciello@amd.com>,
	<Shyam-sundar.S-k@amd.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 2/2] platform/x86/amd: amd_3d_vcache: Add sysfs ABI documentation
Date: Thu, 10 Oct 2024 15:12:52 +0530
Message-ID: <20241010094252.3892406-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241010094252.3892406-1-Basavaraj.Natikar@amd.com>
References: <20241010094252.3892406-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|DM4PR12MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: a9df1a91-828b-4ee0-0a08-08dce90ff863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0zHhGSqKaxKe9vIrPX8sIIP+1E/wiwDxyfwtmgF260xq7g10W3q9ggDU+3ZU?=
 =?us-ascii?Q?OOhKXp6gNhmMA6vvB0xeROVdjI5P5ek2oQK2r17/A+0yT6C0Gs9fi5s8QleW?=
 =?us-ascii?Q?2Dw+qPB5HHa3lNiEQmzZByX6hg76ZJqIvvkhHjVM5be+yRse69en9du/dirG?=
 =?us-ascii?Q?4xU48OuCiKWifqhvd8Pqp9Pu/Bp5yT+X3elzYlnlI+V5qBePsIaDDXOi7mUv?=
 =?us-ascii?Q?xr0WU5Xam9ay3jD6fH8RZgE8LpUSl8w/m525CsEmzRIOPc1qaGzJnja4YXYR?=
 =?us-ascii?Q?MhLaVN8PMwqKrnl+JjmeRID2GeVjTstgwbt05KgPTRb9qTi+CpmyagkliLtz?=
 =?us-ascii?Q?hB6/BKBc1u3GIcGHU/Ql0UAiL/Yqhp9ZWdItftm0LSTYEluWxhSxv5BDD9z8?=
 =?us-ascii?Q?yi7Vr60JuPf+Vh6ghbDzf8CbiAiPwdYDilp10DBG4Q44fFpcmAwFbnxnGRWS?=
 =?us-ascii?Q?j7/0G9uEzwEPNByXX/sFppS1ZNf8/cl6DVfueJsOgAdyGvrTgvsjb3N7Mj/T?=
 =?us-ascii?Q?kKG886EwdBg+UHby3Tu/1BwRmUDDJpNi9nTCY9bqnyU8CJQhUtco7Q8jw0So?=
 =?us-ascii?Q?2E1vcrPj+xs77mNoRCQUGSnifQ5oIItbEV1V/KE18EzJawR0ImIKK72gSayN?=
 =?us-ascii?Q?Kxcxzp6a+qSXC5iS1QGoT7YMQWSTQ+DO64gNSYG0IJ0cI3iVhTOKlsUlcd6u?=
 =?us-ascii?Q?OGNN2do/UTmq+4h8uy6XTixtLZAz/f1ZQr8cDxAc8Y5WhOYVwDkPpHVxG5ot?=
 =?us-ascii?Q?8dQFGAZ2/oMDTbagwSgQsgBdZO41vP3wv1wN5DDgumYP4+KegqT2oBiFi74S?=
 =?us-ascii?Q?oczZXjHlD66YhKlB0cwKSUlAjgIFX5Tlo1PipSivzXvgOTlzJlxQA35jORbx?=
 =?us-ascii?Q?AnaZDK2hWV0vrm2XCyG5UOOKa6EwcQdUx3sXD2i598HlMyBd7p1W8Nv0aEMs?=
 =?us-ascii?Q?hwKRJoFdswum3ejmRsj0ldYvmNqFUdlJQb9lC93FMRAZjVW4+SKVD+4Z8Cbr?=
 =?us-ascii?Q?Owok7/RkSEoiyNEUd8vVX4zfH5G7bEwOe7CaI2N+Q37sR0HVwy7735m3O7xD?=
 =?us-ascii?Q?xhp9YwWH6/DmEuJ2QeowvGVt5Vp5MNfmaseQ2SWA9GSuVLXkh8yMNWD41Wnt?=
 =?us-ascii?Q?9CIkoCscjVqcoNJ4J99fgoacT9vBTq8JvmSa+4IgKFUe/Ecze8aOtBpdRkV3?=
 =?us-ascii?Q?X9Oj2LfogVkhDPXoZGaYiDvtUabH6jgAl5eK0sBmBdRZQqISfc5Hrskcv6At?=
 =?us-ascii?Q?kvYjDTIZcynpEuv79qKf/cLUF2JmAtQM6RtHyhpis3DKZ9ui8AoExXG9dw0b?=
 =?us-ascii?Q?hZ3+xuzvYKYs1UUcxEigoNchpsU1tz3Yc/G8mknvQuO1++UesH2NYdG/qj4Z?=
 =?us-ascii?Q?VddwCnOjTSy8SVO11/TUwHzSRne0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 09:43:18.0008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9df1a91-828b-4ee0-0a08-08dce90ff863
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7550

Add documentation for the amd_3d_vcache sysfs bus platform driver
interface so that userspace applications can use it to change mode
preferences, either frequency or cache.

Co-developed-by: Perry Yuan <perry.yuan@amd.com>
Signed-off-by: Perry Yuan <perry.yuan@amd.com>
Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 .../sysfs-bus-platform-drivers-amd_x3d_vcache      | 14 ++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 15 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache

diff --git a/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache b/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
new file mode 100644
index 000000000000..1aa6ed0c10d9
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
@@ -0,0 +1,14 @@
+What:		/sys/bus/platform/drivers/amd_x3d_vcache/AMDI0101\:00/amd_x3d_mode
+Date:           October 2024
+KernelVersion:	6.13
+Contact:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
+Description:	(RW) AMD 3D V-Cache optimizer allows users to switch CPU core
+		rankings dynamically.
+
+		This file switches between these two modes:
+		- "frequency" cores within the faster CCD are prioritized before
+		those in the slower CCD.
+		- "cache" cores within the larger L3 CCD are prioritized before
+		those in the smaller L3 CCD.
+
+		Format: %s.
diff --git a/MAINTAINERS b/MAINTAINERS
index 61cb6a294f4c..c7e807770438 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -977,6 +977,7 @@ M:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
 R:	Mario Limonciello <mario.limonciello@amd.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Supported
+F:	Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
 F:	drivers/platform/x86/amd/x3d_vcache.c
 
 AMD ADDRESS TRANSLATION LIBRARY (ATL)
-- 
2.25.1

