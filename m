Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B841EBA05
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 16:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729529936; cv=fail; b=ZLFGAt8Wa4rk6fZMAEkOKjf9gnGNbY6k6HPdLJA5ZX63jJtc8Ax0sAAOegLewkg7Nk/oU5akYVQJ1YrL+vt6Zx2m9BnSmhObVnVESD7ixMtJZkUYp+Q2RDG74Q8ZXiJwdbYTqIAI6rfuCqbBcSu9AeHBX/oeUmz/SCrRrhCcMYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729529936; c=relaxed/simple;
	bh=bJ2aAQENj3FspfJ9QfDjQMe9xICWBwKeG6iD3C3JIyY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EaTLYX+S7xYSqaze5gUux0YuSY8Q/AAKiF/qUTH7VI82RWT8HlGXGvuCvqn1qFA/U18+Hc8SX3tYStnzzxWdtwh0VD32qtc2m2GwJPe4DA/onefYg0kvVvnKGQfemGCP/AuPjSaEn44yLOxPF7KGJuU84n6y5JUcr5lgBx54SgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dfsJPqp1; arc=fail smtp.client-ip=40.107.223.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dfsJPqp1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oxei9ftK5LQ0UFLVI99uU+5ED0LvDnjOuatlioN7Cv4mG350R9/lU2ixArf69/GHb9zWkZOKPcoWub1I77czXOi0ReIJo+RbH7xV33HFp2zqjlLhS+RQ4koQPBaTJH7wN30Ky5koKUVslud2bHFTLRd6T2w//Kw7L2Zh2CgQnhz/lO4pk0mPu0Lye+1gt4jjh/I0Qd2AFo0jrQzqBvW0ObrdzF2mLkzKCf/af4YpZMRc7BlF5DWelKK0AsXILOoxVV3KpklPdRZf13whfEfuBqtc2rmxypCT3BwUMcoGA5blVgOMLY1XgXXDXB8GQJjvZdEjFVs8GvG0Oaip/aPPLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCXCVTspDQCZwU72s0zPka8ZFPpZxFlaPQ+lJRAJC2s=;
 b=RwSLPuALA/W3r3UhQ3xZ4dJx3x9MEFBXHFxQVvzSiX0Y9bknElcTD0oIZKaputdMoWaTJqeIsNd9s4hBlV9mquWccYXPYZL0e55dMlfi1VXfgJbkT3UHA/hnKMPZsq8cSVo577LMqFKxtezpgARp2D+PaOqeQkplN1tAEGf5MsmpOlH+5cBZsz2mMA30RLpkJsB4/N9ludsLFkC9/L7Pcf1PliZa5DN8/p67Qu++rLRtFs8lbw6YzfgmGb/s5HWU3ILSlZfonw2FzoUdqKL6BWis1F4e/nV40T1S9NJQsSma2NQRvwa+LHav2CvUfPLerudt/+DczFPIlKY0AlAPXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCXCVTspDQCZwU72s0zPka8ZFPpZxFlaPQ+lJRAJC2s=;
 b=dfsJPqp1r0gJoyxwsPl9hoFg6DrypFMGQ8CHCDmbbrlgVE/0DdaUgvKL6lIf5R2j/29SoLWm0SBAgVMI0M6XR4UwA7FeluasoVpxhsygoVXi0/aBfo27lIp0uhywaZqGtf4rTf8wo0qDcYYr/oRiq1JH3hyEwViVHxBeU7MNcfA=
Received: from BL0PR02CA0051.namprd02.prod.outlook.com (2603:10b6:207:3d::28)
 by SA1PR12MB7198.namprd12.prod.outlook.com (2603:10b6:806:2bf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 16:58:45 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:207:3d:cafe::9c) by BL0PR02CA0051.outlook.office365.com
 (2603:10b6:207:3d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29 via Frontend
 Transport; Mon, 21 Oct 2024 16:58:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 16:58:43 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 11:58:40 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: <perry.yuan@amd.com>, <mario.limonciello@amd.com>,
	<Shyam-sundar.S-k@amd.com>, <W_Armin@gmx.de>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH v3 2/2] platform/x86/amd: amd_3d_vcache: Add sysfs ABI documentation
Date: Mon, 21 Oct 2024 22:28:20 +0530
Message-ID: <20241021165820.339567-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241021165820.339567-1-Basavaraj.Natikar@amd.com>
References: <20241021165820.339567-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|SA1PR12MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 51489789-34ba-43e2-6618-08dcf1f19ef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vQNio8qIChtlF7uBNDQFi+gC0H79NjU6zXFndLi2UHTjrqOoRB865S9wePtH?=
 =?us-ascii?Q?mTvbG6fW8NbCzSZQmxAzm1zWmX/lSjzHeNdbePpZsxCqmS4InXvtcrlV20qz?=
 =?us-ascii?Q?kaT2s9zZqqrvQoI9GJcJOd7L2uHsnjt3e5ayaKGR799ZmNT73E5N8vcxZihg?=
 =?us-ascii?Q?X7CnS2dxP7UpDR8wlFAS+um8qYCTP7pExh2nggyr13W/Kv1Oy0VCepZpbb9/?=
 =?us-ascii?Q?Hu3/92k4oFTWMLd59wZt8GgY8/buCUXxZwIoWVwFfe0+sjQ6HM1KBylgyrp3?=
 =?us-ascii?Q?PSVQx77p9ukKjrIr9woA8hn775IbD4XpTZRzgY1z94sszfbbJLFjpoqHAMhd?=
 =?us-ascii?Q?oVmHhoTXAlbFpFaZVoRv20WWcX4Iztzfz6FZXKb56mNKxZeCAHz68qgdXWZl?=
 =?us-ascii?Q?qAw7uKraxn31j53TidfLluhwHmRNWg5IU9ppFyqUfx91amrjSpRUTpSaxGrs?=
 =?us-ascii?Q?+VOlA4XwtG29//xk2kiqPE4rR9MFSxYWN+REczA70CS8nIoPVCkaoyaiMIxs?=
 =?us-ascii?Q?rHGnecI9unb8zq+igb2hkLc14ctMXhTFoxvdMMhxspXkNzRX7Uh3igt7hg6J?=
 =?us-ascii?Q?QLhQlD9O3kUGOfuRegFRElGZg9gw/yekl/Ou1KSnsOU7dvueRtH9nDjt64OC?=
 =?us-ascii?Q?XNDL9yDyKj8QwI50bzJaAdUHs0U+57BGmtk6nzeYRQ+v90EDl80zGYFMLdjM?=
 =?us-ascii?Q?XFwMHo7urym4YMrs3BAfMffjpdaNlnVRb+4LHnV+uc9zGwlXuhYATPaiBSVf?=
 =?us-ascii?Q?Jy6/XhTf+knAsIrnTUj0Zb3KExei4UCdmOmtyAaQSfziAr3POY1Fzzmqprv4?=
 =?us-ascii?Q?+vzUo8XJdwaNSTnhf54OlpdY5NiXJxG/LSOiy5ObGBwDxU08Xst+VKDzV6bn?=
 =?us-ascii?Q?RZTmlh+fH3Bj1MKqwzICDuEKobZWIGlAgjrQ+EOdMh1N4Ture/6KUMkRezDY?=
 =?us-ascii?Q?uHNUJT1u8/n5/gu2rc5B/7Io2bcpkFQSjPDtWAJwGg43ybet1/5P07vO30Rb?=
 =?us-ascii?Q?+KrYEe7AUVWUz6wOERlKK/cvo+cK5fEu398MgA3swjYAE1KyzYhKAzzxYgaM?=
 =?us-ascii?Q?JkAPRjltxAwXhtiix8leAqbRQ0SfM3ud9Khx3dK3Hj+E4psE3RNV0WCadMRY?=
 =?us-ascii?Q?pFisX/kpTGlD5jQ1x+8x4x2U07TlJZ5+F31FFRI2TgwtCwoXbHYEQXmryE0U?=
 =?us-ascii?Q?1h277I622vCGExv2iakFGQYw0wzcpp2Dm3skEuOHGsmZnAIxvbQYHs/coa1K?=
 =?us-ascii?Q?JD6k9X6QNMNL6Am8dqXLGScx60OgLJZbdkX30R/rJibNXtK864WWgknyyTwD?=
 =?us-ascii?Q?H5FAT73/p+TWY6k3hVpDtcdCi3msKqHWfHe4ShzkLmKQVULju0PZvky1YDDu?=
 =?us-ascii?Q?gLUQl3+XMO1r8h/Twxr6p08eR71MGJQAmojprPZk545n9GBQWA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 16:58:43.5175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51489789-34ba-43e2-6618-08dcf1f19ef1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7198

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

