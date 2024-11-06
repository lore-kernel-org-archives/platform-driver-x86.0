Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE13A57333
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Nov 2024 11:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730892651; cv=fail; b=EpMi/077VjQf/2N/bYM9wNZEcpTblSa25YwemRdVBE0LHhEdSnxrEa4PoGNM+yh5SBmsvXqq9SQirNJkTVLdQ71UsmtMwf7EhAbzN1LZwPx8DMNvkK3gIgU5esMa6tIJdnZp8bGR77C36e27PdGuuGaG/06BkvaqHGNSfsUwCcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730892651; c=relaxed/simple;
	bh=PHNWlNHGKZm7Q2Kg5YGfugL0G775rbeLdv3Fg7MPSf8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ITAjOExtG12DY0yveFybNFPCdrwarsN6Prtx1Tv2ypt3OUWDvWXVbmJ6YEbsuiG02xxnTDhsFpYGF35t+nWlTsDYC8Bh9V1q29nQMLs8HuPKjpcl/G0XuhiHuUlHaLYSQB0ClClfWfiienBrxsVzYBs3yFR/9kc79WMQw52Hx9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lMP3iQat; arc=fail smtp.client-ip=40.107.223.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lMP3iQat"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udGRUi9m+NIYwRvZxKJWMwRzW+qUrYoUkZKGpJ+i+RNe1+vcwxmKdaJeDP+yT+C2q+uQyhjTWFf6M4KdSexzzoCMz2nNhN8MsEfEOM8A0l8MuFYJze9Rho+77r6EJfO9vjT5NzHs3472gpkIQw3KKI5YG+KlCOMK6+aeAn40ihHNCWXkDiCnKpgHxJr9s+PmK1S3PP/1hDiaFSHfPz9Vr8i+wxKOJscu/KqosYZEvkehfedtqVocc6b5/zttxm+9gG96jpEci5JYzx4F39FQXSTqOVenwp93R7Ycou1HRbpDytznvo5xcEa3+A4Ad7CdKcSpvmYHkBPblIv+FU5gKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rg2G3dRTbxdkm9kHUMnLi+gkD7U8U/szxyBuoUIWjx8=;
 b=GTCnOlakexlb7Q1Du6WRbaCRcGtN150yqwIawxO6ab8s0pk7U6siY/prZWmTgDCAP0cgyO1UPAlqAEgRxjMBE+Wq5fzIJgi+8G3sRBR0kf+WNUFyhsOZt4P2EypTPTQOGfISz/bZeX3+0Guo6N9Pm9rtSMR0zWmttQEh7CmZMnGEXsv+9VWYld0Iuj6uQl6274hkcaVyTJtjE97mZprwOYLk+Zj2LsFMDaroOWLXsHnUZOnoGk13bSPw6mCsmpuqcYBkfb+G9vil+5UQdKuIMTG1RVra+/zsBCOyYWpoKPHv/lzCPu5bUnTyOH6ojVlTuAwW/IPCFj7/FR+9Bj803Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rg2G3dRTbxdkm9kHUMnLi+gkD7U8U/szxyBuoUIWjx8=;
 b=lMP3iQattbScVUitWqNN1tPPmA/zSACL9GNSqV7/iSgjHg5bqZs/aL8yBiWgYCu89oBjbi8IY6oL8OJa1YE4AgOepowe48q9hFu1+6nrxu3Ohm7xTtVPjACbsosXsIWc2/kxYMcKlmQYhXfO5jRXDHzGxY5AQzm9bnS9bq1VB4o=
Received: from MW4P221CA0029.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::34)
 by CY5PR12MB6599.namprd12.prod.outlook.com (2603:10b6:930:41::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 11:30:47 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:303:8b:cafe::6c) by MW4P221CA0029.outlook.office365.com
 (2603:10b6:303:8b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30 via Frontend
 Transport; Wed, 6 Nov 2024 11:30:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 11:30:46 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 05:29:49 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: <perry.yuan@amd.com>, <mario.limonciello@amd.com>,
	<Shyam-sundar.S-k@amd.com>, <W_Armin@gmx.de>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH v4 2/2] platform/x86/amd: amd_3d_vcache: Add sysfs ABI documentation
Date: Wed, 6 Nov 2024 16:58:21 +0530
Message-ID: <20241106112821.1012452-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241106112821.1012452-1-Basavaraj.Natikar@amd.com>
References: <20241106112821.1012452-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|CY5PR12MB6599:EE_
X-MS-Office365-Filtering-Correlation-Id: a4e9391f-2e24-4109-2e64-08dcfe56757d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j0xXTjPCuEPHfaDhsP0/KwnbPww3El0gJicuGRV2+znCCjOzP/R623bP8Z7J?=
 =?us-ascii?Q?rD5AMQAjPcLH4G/39GkE9/RnTv+8a2RxSHJ4GlKMftXY9yPTIXF4aY29bHtt?=
 =?us-ascii?Q?3E2EU2wt0OD96ps6DFljo4pLf5lLmgtGiYT3qd4sLqg/OVdUYKxAPCuS64Rb?=
 =?us-ascii?Q?qo+ogkrz+JUGG5vULbNwDM23XEzkx8FOf2xEBb6V8fEIBeAfTfB2FlWUdspf?=
 =?us-ascii?Q?MlWNRSXAdfXijCHW7xM30hddhL1MSKdhUUzZqXNzB8HFdEWBouMYPtpHQn1k?=
 =?us-ascii?Q?eNaTRkOF6DOmmrDLE8snOvw2cE6wKmL0V2v0pBDA2OQFDTv8zVWF1bbElzOm?=
 =?us-ascii?Q?UeV8X2yyOTTE08uy9mI/mQyaBj0qpJtdYvEcYuh8DFkj6ZeZzz+hCS9JIiaC?=
 =?us-ascii?Q?YFVz93zxcRpZQeOG7NicCFP/YjCPa/34ON4w+Gxu7fie1gwEl7QmxfocQ8n0?=
 =?us-ascii?Q?2ngKbqodI9pLPFNWuLwv8pb41w2LJVMh3Cbl7YSIbogAuwK23ACtTXyAFej6?=
 =?us-ascii?Q?UzzenZ49Cldv1NF/ifNWu6ad8QXgOpUuu1mry4oYaU31Q569aM0uK7VfD+Ry?=
 =?us-ascii?Q?y1+TS68GCWovDyowYvHH3FFRtlgusJ5Zyp+r25+Jyf+1NOwXlgM6ZWjsYeZj?=
 =?us-ascii?Q?I862iyA8uqlqcpYQp3yhpZQ9Gj8v782jNg3w16M7jKyMiP+GfZlPmHhbs/Bk?=
 =?us-ascii?Q?v8y1rs+hzO8KXjIpG4JL5r36gwYHNtwUepgKtX/6cOulT2MAUA9wKxs6WvMS?=
 =?us-ascii?Q?H7QAu1/Ru3/QVxPsCxGC+yXAeVDE8oQJsok4Qb3jKPN86YJH7M1dO1N6m8DO?=
 =?us-ascii?Q?pW6hOsxJWUdI+I+2/bgb6aUaKqXO7tQjs4PlK3i2hUp2jEMjvAP+R5M0mY31?=
 =?us-ascii?Q?IgQjezm1LorZOO2MEauMIAyPl1s9znrkyvnokiNnz9QNvHzV1XUKe532U+yK?=
 =?us-ascii?Q?EW3V9PwU9CtKarBYbYqqou1rsGm9ppAAhBDQJQM0PkjgDBSu2zHtyVLN5AYI?=
 =?us-ascii?Q?/c9O1C4BMaesWLMbN88EtU/hyswpKYB8xcat+1aPX+O43oESlmqAd/gO/Ilq?=
 =?us-ascii?Q?dwPJNOsOReEJfnXDGBLsHYj+QSIjCefKKbu69p1IDF9VN09pZiBMRFBWSIAG?=
 =?us-ascii?Q?sapScC82Z3DVdQ0nlw03KwQJzXgCJ8vlqHo0+1SuxFpmNslCuFbShYf6UCBc?=
 =?us-ascii?Q?bQxpMKG8JZk7ZGXexwmi/DVHHsOZmt+ze7594WKNSGUC95ejNhYUZI98I0Vf?=
 =?us-ascii?Q?CtkiVXNIioMX1wQ/JGDGjT3vNeJ+mMeboKgPjzDkWCgQP2z9SJ8pqjBYg/w2?=
 =?us-ascii?Q?a0T82sV4fUbOWg7fgjjzBX3+g6zTP3/ETKnjI9teLmvWJXCNHK8fAMkou/Zn?=
 =?us-ascii?Q?Ct0tEHN/F5O7dn8yJTZOpK5n0tWiy+LNm0cAy8K65H14x6dd7w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 11:30:46.9986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e9391f-2e24-4109-2e64-08dcfe56757d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6599

Add documentation for the amd_3d_vcache sysfs bus platform driver
interface so that userspace applications can use it to change mode
preferences, either frequency or cache.

Co-developed-by: Perry Yuan <perry.yuan@amd.com>
Signed-off-by: Perry Yuan <perry.yuan@amd.com>
Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
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
index 60155effead9..5c29cdc6c1a4 100644
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

