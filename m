Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4121C3D
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 05:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720675291; cv=fail; b=d5qPZVYnIh2wSuPpbCz2Krq8QrDv1RkSnjZ48M2PVY3OnWx9tZQdDg48NKkc3sJouB6lhyrJ6x1lufALYcidvtYukgnoyNnJ074bf096+J1e6sH69cYpOXcNO3c6Bn93F+8CLtJsAXQhCE2pA5kA21poStxz0S58xzSiv4v8pT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720675291; c=relaxed/simple;
	bh=jBk09QS3tciUXEBwPH+/I4ENyQVRUvZiUxI7eJcMnmg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dbiPNvtXQ8lHh/VXAgqBrm638zNc/zHWxAmKUzV7ARQO6k51mxj18vBD5s/wrulSJS/sNE+yxFLRfQniZZVBiS58PiF6LNGsyem9wdBAeU1D3ChPxTf6x++LFipSs5mCvv4klDgoRqHLcLFTuwmTnmzQLNNcHclURhY5TwSvOf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nObajevy; arc=fail smtp.client-ip=40.107.243.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nObajevy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nL+giD7oTG2XalSPJz7zQXlhXFaG2yPik7jtiqTE7uaYvlJC1ZQ1rZQX9/+QzbpHne42SUl9mbyumLQ7baQx1qIk3vkSLc77MwTYtbFI9HVOWnQhGeEbDfrQ10U9J9gBrAHq56NzlT3Z6j6PJb27opDUefBYc9oz+lqYKri3WVpnQZIMZYq5UN1Cf/2YmhiR9eAJS7wtIU2xNeQ8LURaAjt0GpSlaP/2oB6adOfRcyhLVHhfQiUXqI90cRXu52qd4wphxy4AD5bj9eXuk4Lo2Y3dTSELz3jbRt7H9QaZYejAXF+6IWklg5KZfIStfmWFKEpNd1nKDxOxCUVrkwmcDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZdqxg231nqJPs4IbuIx8ClAOUyj/b6i2RMwxmJ4Joo=;
 b=W/j28/ydxTHCKsyFK9oh7xVjMYgM7mewURRqIBS5Ew/kglTCtFZjvQBU4z/84EjTgznh1MXIpGbARUHICZiKFOeC0tHvo9dSi/zIXYMH7q/fPOgaUIQm0KZXG2EI1lxbR3ryfZ9rT6RT0NLyRCQ4v1OI7N2RPcaiJkYeBG7AhXAJO7nXV3jzRu8gMfYf4nz/XKMkz2+LUNWiTdF0/GR68h/T4R5dqTXVtc4PIjxIdSJ5dqGHwbVzdTEzgNvTG4I3WYmVjklZz/fIFLv7Ob3vGPHXof1lq1Ey5nnz7JMoa1J2mZupc4VCXHNGs1iECNmW5yIokyQSTjim6eD3SjoKRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZdqxg231nqJPs4IbuIx8ClAOUyj/b6i2RMwxmJ4Joo=;
 b=nObajevyc+y6XS66bBKHnQuEucouiSCij7xrmewCiAqtd2X5Z5OLfCB6MFocSr7igo+kHkOE5sz6n5UcBP4zDZdkOMORvNgQqs6YHpIZRTGhp8e1czCTWmlm7LmYV4jvhfgWk4aPz1JWr9Jz0RfqeaXmg+emcDEgaMhlUTZPxw0=
Received: from CH5PR03CA0020.namprd03.prod.outlook.com (2603:10b6:610:1f1::10)
 by SA1PR12MB8096.namprd12.prod.outlook.com (2603:10b6:806:326::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 11 Jul
 2024 05:21:25 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::a6) by CH5PR03CA0020.outlook.office365.com
 (2603:10b6:610:1f1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22 via Frontend
 Transport; Thu, 11 Jul 2024 05:21:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 05:21:25 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Jul
 2024 00:21:22 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/2] platform/x86/amd/pmf: Remove update system state document
Date: Thu, 11 Jul 2024 10:50:47 +0530
Message-ID: <20240711052047.1531957-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711052047.1531957-1-Shyam-sundar.S-k@amd.com>
References: <20240711052047.1531957-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|SA1PR12MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: fa7e9c85-8e67-4dea-2ea9-08dca1694f67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?myusjQ5soiGir2ynhkAduLxKoEwSL7QfYlndTHhlpXaBViUVjW7dcaKOxdeX?=
 =?us-ascii?Q?2ppzZEsf9yyF26x2jP2F2ZenwtpId/yQUUT2GjimRyhaNUHnA+mIGWyKhhmy?=
 =?us-ascii?Q?RR4xfbx5Xv629gWOIm53Ho1ztUdfVJhB04CPXFpu2GJDck8V6B6FUN3+DrSb?=
 =?us-ascii?Q?7IuBaTvaHwb0IM17FHEOkte3RusnupNBl8lLFyVhVHDKW5hoZP9kZ3hKtZgc?=
 =?us-ascii?Q?yj4oGglWMF/1JXe3gJ0idYK1GWFp5uR6u0pYewLq3SNwM84gjM3A616AKhlV?=
 =?us-ascii?Q?gMcUdhnzP2IJRG1Ohr6w4xL4Y3BLAtVi3rTC5NiDRoxlN8Tsyo1NHGuUPYTf?=
 =?us-ascii?Q?m9YnlYMxRghqiUOt0eHWhFW+wMLeo1ikzId3dlEHA5H7MF4Z8E4rIwHCDp3R?=
 =?us-ascii?Q?Yd4q9s9GkZ17QILOKcsVeTGbJ9NgpmMwZvf/XVfL0z84+s8anjowM2C+of45?=
 =?us-ascii?Q?CslL+4bUGiqhPQPk+gvzK/5//+IZyAcjI7ZRazpLi9FY+EjZomA89okqAESB?=
 =?us-ascii?Q?TIfUs3cM5LKeJe8XZ+8BSCxrrsNU1ewTG4/04+lKP+eRWO0xAbp47si1MMpY?=
 =?us-ascii?Q?kpi1n36yczuyzKjVR/gA4rEDr9in64pg14dne2tPuh9kGL8Pcm0o2vxTZR3G?=
 =?us-ascii?Q?K9Hq9N8Hox0TXr516Z3scgFBKiAbSksymeF2iBsZjSEb0h9miIZhFo5QeDXo?=
 =?us-ascii?Q?bXA8e4ToIINmZ1NxDYROIiU2c2A5NFfX9cpU2dMv4fxtBsthH+KypewnHcN1?=
 =?us-ascii?Q?dZFRcW5xKv+LeCD5vwsZJgYfQKmu89GSB45nvKvgr9B6Xql1EvIPN7f/EAk4?=
 =?us-ascii?Q?Vk68njbAcHZuSYOZQLsbabxvtGZgOiHOgeYtICvWsYmeUBHtfbMTySixYbtr?=
 =?us-ascii?Q?HtWZTp9i7sGCozquQRYl12kH5Lu1nLVZgu8t/aw+fgonqMt7ocnRsMmnrJn9?=
 =?us-ascii?Q?R6D/xyrWJFZxcB5bf4KlDxKjHxkZpndAO1R6yt+89ut+u5IoUoNKoAgf85My?=
 =?us-ascii?Q?ahibUmSUt8/JTVlmMGgaJg5kfY+F9puJaqVcgU8k5ZGumf+6Ib96p8cyDoZs?=
 =?us-ascii?Q?3vdJL3Fyzul4uyHuvSqh7c5LqEyclALwjb0QzHzNUR7iGtGI2g8P/aLmgZau?=
 =?us-ascii?Q?2C3VEeBICev782Zg88FKNcIKE/OJdfxkVeEd9zldMzmbWmjymEZE4g5EEc60?=
 =?us-ascii?Q?/cvUBTI7u+7vDxQsNLmoNQnLuXae8fSVgJETeoTuwPdjMMbAClarnZ19FlUI?=
 =?us-ascii?Q?i3oUXOaoSH8bl62VdwYaz1yY18iD72VffxC3q7YRZkXF/K3WDywkWmWm7HyM?=
 =?us-ascii?Q?woNN0Kv6CfT6hRKVaxAIuf1Yv2cfCceEEQ2rduTaBz9UVp5edrC7wGDR+f7Z?=
 =?us-ascii?Q?HMe5rtGGGr/WIfo81qCx/66SOpNfANzjFhqiTZljGu34J8vWbC9UWnbE/0tu?=
 =?us-ascii?Q?u07ieEdoV99UEPbVFqg2keUg/litko63?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 05:21:25.3068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7e9c85-8e67-4dea-2ea9-08dca1694f67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8096

This commit removes the "pmf.rst" document, which was associated with
the PMF driver that enabled system state updates based on TA output
actions.

The driver now uses existing input events (KEY_SCREENLOCK, KEY_SLEEP,
and KEY_SUSPEND) instead of defining new udev rules in the
"/etc/udev/rules.d/" directory. Consequently, the pmf.rst document is no
longer necessary. Therefore, the pmf.rst documentation is being removed.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2:
 - NO Change

 Documentation/admin-guide/pmf.rst | 24 ------------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 Documentation/admin-guide/pmf.rst

diff --git a/Documentation/admin-guide/pmf.rst b/Documentation/admin-guide/pmf.rst
deleted file mode 100644
index 9ee729ffc19b..000000000000
--- a/Documentation/admin-guide/pmf.rst
+++ /dev/null
@@ -1,24 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0
-
-Set udev rules for PMF Smart PC Builder
----------------------------------------
-
-AMD PMF(Platform Management Framework) Smart PC Solution builder has to set the system states
-like S0i3, Screen lock, hibernate etc, based on the output actions provided by the PMF
-TA (Trusted Application).
-
-In order for this to work the PMF driver generates a uevent for userspace to react to. Below are
-sample udev rules that can facilitate this experience when a machine has PMF Smart PC solution builder
-enabled.
-
-Please add the following line(s) to
-``/etc/udev/rules.d/99-local.rules``::
-
-        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="0", RUN+="/usr/bin/systemctl suspend"
-        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="1", RUN+="/usr/bin/systemctl hibernate"
-        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="2", RUN+="/bin/loginctl lock-sessions"
-
-EVENT_ID values:
-0= Put the system to S0i3/S2Idle
-1= Put the system to hibernate
-2= Lock the screen
-- 
2.25.1

