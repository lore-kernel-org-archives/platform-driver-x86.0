Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48891EBFE8
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 13:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729518444; cv=fail; b=imvL5mCt4RxR7Nczn4R48u033wtHHerFIlH76SR/iaCPQpkiB81q677EenVqmLshPl4fEeyzIUYOnqFkwHm4Pf6KUhW/fTBBgC2eVI2nCMT4WpwEqcHbhD0INve2u/c2MYu/M4q9ldb3RRXJKMKGsalfj0qllu5IX7Eqj16NGjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729518444; c=relaxed/simple;
	bh=GEr5tyBLnIAKOVs6ky8NfXxfo9LTAoOr/2dXzWVYAv8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c7X3Rolg7J1RpF4OAQtB0wwgY/m8LOZ0pvlugRlbIwDsbE75rfW73nLq18m3/4P2FWDgu7b2GITdAJkQ1nhna/JUttxSmgTbOvJLELGpugFcLNLwEgIWHzGkzmgD6DZ2EMFqYbHkZdWiem/Wdx2y+Tl3xtYLU2kJ9MnWtpweysA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kwZ0NSbc; arc=fail smtp.client-ip=40.107.220.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kwZ0NSbc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNSyJ3PKlp0RlsGgQLhPUPmGtjTEj9UdWH6yOtdO1iQYvLZpz9u4V5eHEtm3CNHTIY55d6RmTyU4Z+L4NwyRM9WpugeJcYI7tsyov8lXV6WQoqt8qc8BCma0vOO8EiqV+TpZ4GPOTzr+YfMfHmQu8IyYiUoksnRY0ELKQK4jTH7CIk+gBk773sp/k4rHfBIVGgu8OXST1YK5jnqW2jwZCeBSrYBJkypN1dV9ix5dDL0M41zsxKQy6bAp8Wr8GoBPZq6XwvzwUrI7VFf8rhmW9RnV4iHIgS1ew+AdUhxRe35QTUvkZlbfTSjZf+8e9/bKWa+BbA97JJffY0XNpROXCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S38WOwjPtNS7ZmcupRht8/0yYvDdrE12ELuJR/X4Oew=;
 b=uX2x6sl5RiNkjaFKo0vfsFFega9X2QtLj6ucTCbaG+VB8WO0mEHP548aUqOcw1yVhsDI2HxhSlS3LThEIXRKyuwYjvDWip7YgN9f5yVDuZh5DNjRtZ6t/HQ53GMRjHE6xyGCoEk0ENeVKfrB4G8D9zXxsJ7waJmb4e4kuEqNFz9i/cQwpYZTFMDbSfWGRUQ9T5O5m8A0woZNzebzvJIiaoUrasuXgSN46TJXgV5xCu1xEaEgAx/xh1UFX7uctG4hc6BIMledZ9mis40v2hR+J20JYay5YM8E0DeQLyNz0VuszXesa7TRZOl+hDO34UUhpVG4SKh5KwDuRpsnk5JZ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S38WOwjPtNS7ZmcupRht8/0yYvDdrE12ELuJR/X4Oew=;
 b=kwZ0NSbcRvTHWsWisYkoC0+U+L1vFYmVEfm1BAsvTY1QYW0yA542eHlDyxSqcCM5rKoPOs+v8XuuBmfHe1l/PJklC7Dvib2H03tvMGlpbW8wFX4ewnX+Ce0sKxslVP9EsqEINk1UN6y/MLxycnLnV24n34oqkWMPh+PYh6yFtb8=
Received: from BL1P221CA0022.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::16)
 by SN7PR12MB7911.namprd12.prod.outlook.com (2603:10b6:806:32a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Mon, 21 Oct
 2024 13:47:18 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::b8) by BL1P221CA0022.outlook.office365.com
 (2603:10b6:208:2c5::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29 via Frontend
 Transport; Mon, 21 Oct 2024 13:47:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 13:47:18 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 08:47:14 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: <perry.yuan@amd.com>, <mario.limonciello@amd.com>,
	<Shyam-sundar.S-k@amd.com>, <W_Armin@gmx.de>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH v2 2/2] platform/x86/amd: amd_3d_vcache: Add sysfs ABI documentation
Date: Mon, 21 Oct 2024 19:16:54 +0530
Message-ID: <20241021134654.337368-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241021134654.337368-1-Basavaraj.Natikar@amd.com>
References: <20241021134654.337368-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|SN7PR12MB7911:EE_
X-MS-Office365-Filtering-Correlation-Id: e0697b14-4b5e-4681-38d0-08dcf1d6e10b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jLVeN04XfIko2IaTz4nwMMD7/cbB231rUZJ7AW/nF1zlfnwtoABFvsRznGfm?=
 =?us-ascii?Q?hQQIfLuYenMK/Z88Z52kPLPDaqKbVPvnUHyD4j7NC34tRjfAGrHj5GHRfL+M?=
 =?us-ascii?Q?mODRYNvzfbV3BpDr+usCvLJHfzYr8PWtu2n8r02hgDKM1mUR949ytrQBg8r3?=
 =?us-ascii?Q?DTq5fbuQHdFos5/EMjoxUjYp4cX85yu6lXtd0BJtjZn3cmFwz/Qd/OnAxvPQ?=
 =?us-ascii?Q?3WUIf7wE/uLJkHGbEsBONKj8eHShpQXs4AvhovHhE70sOQwyR9/aiD1vhbhR?=
 =?us-ascii?Q?i037x+/7uM6lyKRd76SwFgxvjEb6Pc9sdR6pDx3JUnW/Qim0d41O4+kJnz9n?=
 =?us-ascii?Q?GSFkRNv5Bncup1m1kxNFlWo7FgggfGcK4z7ZMSlLGc6mbz8bQNpEuQ3LRM5o?=
 =?us-ascii?Q?gb7UyE9sb8ayKgWHs5Aj4En3PqoQ84AzTuiFp5nR5lBSEQsNsD71PJZchis1?=
 =?us-ascii?Q?fmV5TCyWX3rW2He1dIurkJL8sQr19t9926aBQQwiqQS4SGG1CBJC1+OUmvEu?=
 =?us-ascii?Q?sQYYZHkXh4B51c71La6GvPExajHWWM81DiYCoCMlSWChXyKFTso5bONvLwh6?=
 =?us-ascii?Q?fZU1yCMKyul3tuTVtMMutbTKLIHQ0CJVYHWbj/ODWTjTk4qw0OkkWwEHLGvY?=
 =?us-ascii?Q?/Fy5yMTQmHAXyTU1NkXwzar/Sg8WH0WHarzWFmtNJi8j+ICJhLpAx1v9cORT?=
 =?us-ascii?Q?ZEhirU1AWvCs886AxxIOOHT1nESKRoXtSiI5OHH5fhGf5NjCqJXTPGoXbhth?=
 =?us-ascii?Q?Kd2IsXYFmEA6UCfzbco9S/PrTcbtUKvY8qhtmBy/3x5zoRe0EIFC9cYpfJ8g?=
 =?us-ascii?Q?kduPlGyZofk4CAnrFfW2UWWOG0dW9wWUK6vPD0Eg/af57S410iLNt3datuXY?=
 =?us-ascii?Q?s5bYJcA8r/9ZfP4ER8LDGTyF2XlGmxSnbJP5q7e4cCWq5nBoCM/GPel39+fM?=
 =?us-ascii?Q?LyHqz8XmYXqIkS5/CuxNyTZE4L5DlKM84Jqx3FUxVZ6abprKoSuv8WQbFHcA?=
 =?us-ascii?Q?0HPyy8TIAyCEr6RQvvuPxKBw6TGOsUo1mO307HLdI+3w6I1N6l0/DVqR0hvi?=
 =?us-ascii?Q?XAnqLbTXlC7DGoG6G90F2txiK+GL7qt8ZdCEf/TmnAxSnmRSLC5T+cpniMwD?=
 =?us-ascii?Q?572ZDaK3CiDNlYPu6k0KisOJZGhVuJtw/CQRIFMb6TZRF3cDGI4fy/hVaPk3?=
 =?us-ascii?Q?mSEGDPuvbSNDAw9gjKqYBCNSD9WRlsQ3Hh1vsJleVqi+fBxQQjbvkOoUYoez?=
 =?us-ascii?Q?5+nXzbyeR0deW0tcSR76kA2b+sIWZgBspa+JqAej4yKvvCSPomhIncL7ZJJJ?=
 =?us-ascii?Q?ksrvoIHcp3CWAu6FzB2nGrjcXhLqQQprZuLA2C2Hi6HeLmMQAfW8IqPvF3Nt?=
 =?us-ascii?Q?oc1j+EKeiItGNn+/rW6h7RN9BZhzwXkx+N+vQ9bd757lxsIygA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 13:47:18.0047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0697b14-4b5e-4681-38d0-08dcf1d6e10b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7911

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
 .../sysfs-bus-platform-drivers-amd_x3d_vcache        | 12 ++++++++++++
 MAINTAINERS                                          |  1 +
 2 files changed, 13 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache

diff --git a/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache b/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
new file mode 100644
index 000000000000..5ff1f1a8c9b6
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
@@ -0,0 +1,12 @@
+What:		/sys/bus/platform/drivers/amd_x3d_vcache/AMDI0101:00/amd_x3d_mode
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 11b829956499..ca9c666caf7f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -970,6 +970,7 @@ M:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
 R:	Mario Limonciello <mario.limonciello@amd.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Supported
+F:	Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
 F:	drivers/platform/x86/amd/x3d_vcache.c
 
 AMD ADDRESS TRANSLATION LIBRARY (ATL)
-- 
2.25.1

