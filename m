Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82510215030
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2024 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731431023; cv=fail; b=qG/vaUtUEzpRO/8MTsxuZotbq7CfRywhc6xpNoaZowLPr3Il9eE1zh3z+mFDvKH3yXc7rGljj4cMYeCgUbI5XLOUFOAL+rbQsHILskq+M0zHlxft4fx7li3muTEmJTg+tQOUc33AGrjOwTvFcwsGdoWF0ERtULyzn7A1+aC2N58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731431023; c=relaxed/simple;
	bh=04lEE5u2QWfJdtWk5iVGLh+Pd96G6deZXFZJxnxvbpE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GVnKcYBVpQ/t9RF4JUqeQfK2/P2zm7SO1wildTx9vNRPPWJGnlAQKQQgszD3W5eYsvxFNdj/nFNc1GgjsOFUJEhhx88kPwylY9NAyAAa0udO0Aefoi59CaKxFTISNTLGXfqJrvFuvGQZHUbtCLof1ScSBIM2llmnIVe97vfVP9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mphTZybN; arc=fail smtp.client-ip=40.107.237.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mphTZybN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nocMZklOg4LRS6O4Cx5RqlgQtxAiWsFGGPzA9279fFBvSSUasE6xfN8mTpj3Gk6RaV+qIAs8y3GH0MMHG1c9KsfO0SnlHLpnl8u1+MA5Iad+zr4xcRWAoeLV63/JlePd/9fqgVKUWF/NuOOOhBJ39MDTEB8VPTQHJFrOqM5/oXpIhWlZJfdDxEGYT8Lo3VtcGNTWRgZYPX6l18S3yxYc++C21xxYCt1P3+JztOpr/ug/X0BNcaitOOfWUqhrNuzOtnTNdrfdy3zAFHH4opRcIxbCaXHTbv0N0mu/785zbaQ8n3J+eWtdndSDrFR4+YdZjP8sPh9WxjgqX7qrR/5tSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iygFCKzvxqLo2LleyW7P0hgILrFA52XeneFbX6YLCNw=;
 b=emEjYk+LEHRkOs2QOuXD+8p2/0fdPokYuCaOXylEfyPEZnWrCxnflvsx1JYZ7Afh1ynNIE0EeRVPCo9rOPEMT1FsI2198xzP2i+hjDj/NwHwEDu60ZNS4xWGfl2hhyqiJhDRF2UgZM+D93prVC9ZTsXgQxVzJOuxvcY2TEhX4d6mZMiIYzh3R2Wirfq8XyvVLxJTlRQAHVatdGtPIhJPolDoUuGg64lUHYD6w6jNgqYEw5m0R7uf1QSLxjFiAwGyPFaEf/G9ReOTS3xKDprBTDs9YEVz8nxomxsDqPNjsgq7rpqQ9h3IxdfsyqQR+Ab7vIOQADLAcWH7MXw5m4zZ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iygFCKzvxqLo2LleyW7P0hgILrFA52XeneFbX6YLCNw=;
 b=mphTZybNLfqnwAUMAyWgHvo4Eo90aEpHCQfoKUWHdd5E9zccvAsjHGkanv7d7tnr/1VECz9GIQRdY77aLJ9I8ssq5ZTuBxJ/CPUmkHbEMaGzVjIEGZ/aWzvBz7eiYNeUOPoswazlwnNi79KEvE3/7FwIyw/O0xfkDqnJ2+JEtIg=
Received: from CH2PR14CA0015.namprd14.prod.outlook.com (2603:10b6:610:60::25)
 by PH7PR12MB6562.namprd12.prod.outlook.com (2603:10b6:510:212::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 17:03:33 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::cc) by CH2PR14CA0015.outlook.office365.com
 (2603:10b6:610:60::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Tue, 12 Nov 2024 17:03:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 12 Nov 2024 17:03:31 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 11:03:27 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: <perry.yuan@amd.com>, <mario.limonciello@amd.com>,
	<Shyam-sundar.S-k@amd.com>, <W_Armin@gmx.de>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH v6 2/2] platform/x86/amd: amd_3d_vcache: Add sysfs ABI documentation
Date: Tue, 12 Nov 2024 22:33:07 +0530
Message-ID: <20241112170307.3745777-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241112170307.3745777-1-Basavaraj.Natikar@amd.com>
References: <20241112170307.3745777-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|PH7PR12MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cbfa524-9868-4fc8-8734-08dd033beffe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHlmUnM0VGplK2MvR2plU2loZXBHMUlPVkFjMmduMld3bm9MRFZUSHpkVVlz?=
 =?utf-8?B?bkt4QnlWd0dDMUkrQnp4bXJpRlVpZEpCUlNpRXpsajh6QlZRSmszV0xLTWM0?=
 =?utf-8?B?VEczaS9BYUZpZVNIaFhLT0pGWWFWdXRHWGJXNHJ3bjVwV25yMUNDZG1YRGZP?=
 =?utf-8?B?VVFrU1JpZHYrVEU1ZHlVbFh2NC9oTDNrbmxrc24zY2FHRDYxb0VLcHlibjJO?=
 =?utf-8?B?KzVjWUVsTUt5RlVwbGlLMFZqTEk0aGFoYXg2UnFoTk5sSDg4akxpclVJN1Ew?=
 =?utf-8?B?dFdmaVh2cHJXTnF1bGdjdEo2VzVySE1pcmFnSmJGbmdCQUVuRHJURnV1YUtO?=
 =?utf-8?B?ME9WQnFZa2Z0ZCtGc1dDbXZnbVFmNE1UYTE1V0tFaHRJV2loODh5Q2ZORHN2?=
 =?utf-8?B?M1gzZUJTb3dUWlB2UUEzRmtxSTNyMlY5Vk1OSE9IekxTME42Ryt6aEZ4c2ZQ?=
 =?utf-8?B?K1RkTTJQZEs1aXhsUUxIUWdld3EydERIQ1Z3NitYcUVhYkljYXI2cmgwQTVu?=
 =?utf-8?B?UkN3VjFNS2VvVHdxWTVsRVJYRitMb3NFa2hwc3BDai9pWmoyR1FGVzVBL0lF?=
 =?utf-8?B?a1BTaWgrMVgyTFBZY0F4Mmc3NDhJdTRKZ08vajdReUhwd0pibjRxc2hJVVho?=
 =?utf-8?B?OGF0RkFkSWZDVjlZOThKaFFxT1ZXZW9EQnZJU01DSjd5dnB4WTFnaXNqSnRF?=
 =?utf-8?B?Vk15a1M2S0dkVzBBN3ZmUm9oeXM4SmxIS1lDQjFrc1gyblc1UUl5QkcyUDRO?=
 =?utf-8?B?ZkpwMjJvQjhQNlZ0TVE5blBxQ2NPc2trRWR6SjVBWCtYRlB0dW5aTm16MDVG?=
 =?utf-8?B?STZSODZMYkh4YjV1R095UkxiRXZZVXRsdFZyUmQva2toSUp5a1JxdVpwTzJw?=
 =?utf-8?B?M09Kb2JybHc5T2RsK2I0d1huRVZ4cUZGa2RjbUNHSS9jd2w2YnBlNXhFTWYy?=
 =?utf-8?B?K1lXcGxWaGNCVmEyYndNeGRkNk94SFNBbzhubUZEY2NuS3VTSTZmRmg0c2oy?=
 =?utf-8?B?MmJsQ1lrdDRwQUZhOGhiSzVON0RFalErL1lTRW1qZ2hhN1NTQVBwTUNQUTFa?=
 =?utf-8?B?dnN1clZmTEY2N3pBZ1g3TTY2c3FtWnUrc0JZMlprcXpES0cxOXpxSCt6MFEz?=
 =?utf-8?B?NXhJZ3UvSWM5TWI3c1paTzFFdWlGVjBjc0t2cEpLdkkwNHl5NWNaclgyVnRZ?=
 =?utf-8?B?RnJ0U2QzSkJVL2xtcjhFdnFKbVQ0K01PZVVkVG1ybnpGdCtuOFRuSEZRYWY4?=
 =?utf-8?B?dnNoa2dRTmR3UG5LTExkTG02RDRlbkI4QlRBaXFPNVZneWJHWVUvM0RrT0VU?=
 =?utf-8?B?OThxSTFHR3JQOTN6OXhXNHVnU1hMOWxKYnY4b3VnYlJNVi9MZTE4YUdGbkJv?=
 =?utf-8?B?OTZEZXBRM1hlUXVndWlocUNYajNhL1lvbnNleUsyYWRybDFGNFNSeGR3QjRL?=
 =?utf-8?B?RnYzdjV3aFNvNzk4UEs2VXJvKyswR0JvSUlMU1lEN1BVdFRBZm9uM3A4K2dV?=
 =?utf-8?B?dmdZVXZhdzdRc3RPNmVIaGtZZVVvRzZ5VkFqZE85T2tDZVpuTm9WazFaR0ZW?=
 =?utf-8?B?UUllNFc3MXpIVWhPYkJCODM1K2hxcXJISzFsUk9iQWdzQlA1bGFUejEvQVZJ?=
 =?utf-8?B?cXNkMG5la1RZYmNyVXA5eDBkTUI0M2Q4cHRqaVlKMmJMUTFSYnl0UkxmTmo0?=
 =?utf-8?B?NGJxSEl4enF5U2ZaSHdYMVZxTmQwVmx5WVBMOTd0L2FZQldtaWNqbXJ4eXlm?=
 =?utf-8?B?RnFHV1ZoQURTUlQ1YVVueDk3d2N2UEtFLzAzQk1td3Y5aVdEbEVld3pyWlI0?=
 =?utf-8?B?Wm00TGF3KzVIV3V4NHk5elN6KzRYdExFVFAyN09EY1owNkFpWEVQSVVtS3Jn?=
 =?utf-8?B?UkZtZ3pVeDJnekQvenRnLytyaGJ0SGpJamM5TS9Vc2k3anc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 17:03:31.9930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbfa524-9868-4fc8-8734-08dd033beffe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6562

Add documentation for the amd_3d_vcache sysfs bus platform driver
interface so that userspace applications can use it to change mode
preferences, either frequency or cache.

Co-developed-by: Perry Yuan <perry.yuan@amd.com>
Signed-off-by: Perry Yuan <perry.yuan@amd.com>
Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 .../sysfs-bus-platform-drivers-amd_x3d_vcache        | 12 ++++++++++++
 MAINTAINERS                                          |  1 +
 2 files changed, 13 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache

diff --git a/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache b/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
new file mode 100644
index 000000000000..ac3431736f5c
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
@@ -0,0 +1,12 @@
+What:		/sys/bus/platform/drivers/amd_x3d_vcache/AMDI0101:00/amd_x3d_mode
+Date:		November 2024
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
index 087d76c1f6bb..d9f3d7fa8db9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -971,6 +971,7 @@ M:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
 R:	Mario Limonciello <mario.limonciello@amd.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Supported
+F:	Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
 F:	drivers/platform/x86/amd/x3d_vcache.c
 
 AMD ADDRESS TRANSLATION LIBRARY (ATL)
-- 
2.25.1

