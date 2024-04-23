Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A81321345
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Apr 2024 09:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713863712; cv=fail; b=burbAokMOA+FN3ZDXF61IZ9Z5/3KJqankfmHlRNrcnn9XeAO4GaVWbAYGn16UtMdGrbdouTr1hGZrN0X2yg1Z9zXfi3w8hgRL7PvBLqxrsqQl4lc3r/xfbHG8KgBNaIYrLALZ9/k8ECo2RnE6xgzVQ64KLn65jIaHkZ1m5+YjuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713863712; c=relaxed/simple;
	bh=oTTir3atvpNKDKGwzn/6Di0R96NBdiUwgG+rlcUgFm0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NVVfZUTN41MCEVVFVwXjzJZXmFCtIqPycFMPsvBnBwV2/u3eAB1O9QUHqmnmD+0TR6m2/AwSLzMH9oKvbv234YjwyuSa5IWTDQUT0+kgLOExKPwiD4FmXqFMy9tNtSTAHc5X8YXj6x3xdG1H6ANf2pdi1hub/gKFEoFd7MUiVnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UMZOJrJg; arc=fail smtp.client-ip=40.107.236.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UMZOJrJg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQq91/sXUV+PvJQGwnhWL8mTOS4un/w4q7tS7aO/2SjPES/7vX0hOjaxnqYYHIDLE4KPAQhCN/grw7uyhSnkzm5bhQkpzIXFApXVoqFS7ihKlnjZKjEX+LrmGXftobA5TJMMZCGITr7GmwRlcBsESY9aKN6/XrptGZdGjkRzpKlJT3wexM3yYQJblXyZtZVWzzt9nDKYnq+gWfn5LHNK9DKK+BAF8pHEimPQ+AMymtw10DQFfkqlExdzgb5OXEVpXGbMtBkNAgR8DMzk70TNGiYo2Hk86ADM0JdCKeCSsfqnxc2t0Gci3WQZ1Y9Iu3YquTAKS+XUoBBvp2DXngnPiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jj3fOC4y70xiR7j42rNGY0dfh7ZEOSj5CpFVy0ldQKE=;
 b=OG16UJoWx0qj4f4lPSMFC4BbynHEuV2FJ6pR/iLaRjXqwCS5oBNtoXgwr/8JQUoLA+5WxmYo8y13KGGvLEFGoHSw8M1ZVCKv0mhnrtOESpMw10zhJE1wV30RO1bkzHcZ29pLsd796UuXVqoQzH55pP0wyvPcdJBPGrrA0RODFfDZSjQHrS2RTElPgB0YfTgMaMLNJdIBjTOY5Qtx7l73S3x2DfUgADaG5T/36xwW6QTGIXo+OdqjtMTrTjCzN6P2yJexvdgIU7EiqQ2cTjQSpn7NcOytVLUkmItROECTb+xB5V1+AwvLeh91B70y+QZcP/Jt/X6pp617spbDq/4nVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jj3fOC4y70xiR7j42rNGY0dfh7ZEOSj5CpFVy0ldQKE=;
 b=UMZOJrJgtXPW/5RuZUG4JwClzCG2e9rhAGdwCORf5HKl3HaXs+aaKAUI+EvgqSVGkAJ/Oy843npUB+GnSOEBWngG+GA2TuELNjsmIZZlMk9d/iwg1OiSoLRp17HyrN9Wo/a3NT/bCj8I+wVhte4rgK1K/KmzGlYWtOTz0JTJC20=
Received: from SA1PR05CA0006.namprd05.prod.outlook.com (2603:10b6:806:2d2::10)
 by CH3PR12MB8934.namprd12.prod.outlook.com (2603:10b6:610:17a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 09:15:05 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:2d2:cafe::1a) by SA1PR05CA0006.outlook.office365.com
 (2603:10b6:806:2d2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22 via Frontend
 Transport; Tue, 23 Apr 2024 09:15:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Tue, 23 Apr 2024 09:15:05 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 04:15:03 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 3/3] platform/x86/amd/hsmp: Make HSMP as default m
Date: Tue, 23 Apr 2024 09:14:34 +0000
Message-ID: <20240423091434.2063246-4-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240423091434.2063246-1-suma.hegde@amd.com>
References: <20240423091434.2063246-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|CH3PR12MB8934:EE_
X-MS-Office365-Filtering-Correlation-Id: bc4fa76a-4fc8-440f-9242-08dc6375dd55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+XCgwqxx9ZALS8Xf69gC8tMMyMeiXBe43O+vZ2PVATq7EC2LlANmbS5SR2sQ?=
 =?us-ascii?Q?LHimUqtgmsjK5aCGpLSDLxksKuN5g8GJrS6vLJ4orKxwUKHDsT/jZ1m1QQ+n?=
 =?us-ascii?Q?qNPjNU75A6P/Q+69SB9uz5TyR4avhVHdCbjfmmP0WxOS9RSBrNbzLBjPWZR+?=
 =?us-ascii?Q?wigRfmqH0D+fC6K6AxnH1pcERvrecpTAz9FHfQr2b7YO1fNhboLMzTuMQ1E7?=
 =?us-ascii?Q?6n2cAEEyvaqSa+JbEL1v7PkeJp3NQ9Fi8S6wksgdroEAhGQHra6q/0ycziuo?=
 =?us-ascii?Q?iS9Io5nVzkK1ApbQzhTCJm4cjXiWt6zkznqyOFBF0MQwMqY1VlHiTkFu/rEG?=
 =?us-ascii?Q?vnsEnbLkJQGdb83TTBFNOykDQi2ukWWx8vzTB9XjIGGNRzu6BJ0iW2i+af9C?=
 =?us-ascii?Q?lmfSJNDK/QIwW+xhivP47DhzkWLg+lZP4g93iLjy8CqCFEhCyJUpbb6e6wt5?=
 =?us-ascii?Q?6FwHyUr4TGaPc+9iiq+iJfugDOnVCHv4zcF8BHb0dwDE+TH/Hpct++cpH3AJ?=
 =?us-ascii?Q?3wVPJejKYhX3aDnLgpzCvV3BjWlEQnsqv4ygF9HLJdSwsegAoweLeDeToao4?=
 =?us-ascii?Q?4nPCa2dO0jBX2Lbp1KBeNSZbHt1cn7tpf2sY45mwRSUHgy/VR+iFvXbhQmx7?=
 =?us-ascii?Q?57isFJlQi9rouFznw+q1THwuyDx8lTuxFxbZkqROoFcBVT2lW/mRour0ouxS?=
 =?us-ascii?Q?w9QUvPC64aDNkbtXw/Tj6BzsVCG+DG7snkl+HoMuf5YYViqi9AhRoJlm1Gn6?=
 =?us-ascii?Q?iLrDuLNCZnCbeuU84SPoVVtQuaoKSN4x1A6XsMmyYAYFQW8d5IdsH7ci1bxr?=
 =?us-ascii?Q?t3Rbp6qjx1xqhLUBCcClOxl2qfTGfA89sICCIqHq03H99LOFvWEJTkmFZHgN?=
 =?us-ascii?Q?Bbvwr86n7w8fjL87SMYQvSNhQXS1VS2T9N9vD5Ok8mjJkCiQp6svL3QTKNZb?=
 =?us-ascii?Q?hnOOqm4R8F27LYDmzK2jE+bSVhws047l1fmKtkm0JpKduu3uq+V370dxoeZx?=
 =?us-ascii?Q?zOCHO/s5lfKeuXo2FugfIRCp0MJj5wBtzDRWmi6snARc+J7q3PQy9rj/PtIZ?=
 =?us-ascii?Q?erLNa8Tk0SuoDtsQRddTK8hI211ORWTtZBA13l1FJIhqXnTn6c09bEoEX46k?=
 =?us-ascii?Q?qMtmJKBGfVBYpNRvbaTSR8/s4y/cv5d7BAjB3W52VpeHBIB1sThA/dIcllUQ?=
 =?us-ascii?Q?nLcEhyH4txoh10oLQNWYYbsxhhBbGvm8NuNh9y7FwVjMSwAUL9DYjvhIfk5Y?=
 =?us-ascii?Q?nj5o/WdDtrCj/zzgoxV9l03PUmA/ILGDagFaERiZqWv/QskQlJ0xf052BPnU?=
 =?us-ascii?Q?6VU47XOMrzjSoSNBOPuHxn8y/YB4VfgTm/Ylq/VrVnHLSJciUodt50qJVVdv?=
 =?us-ascii?Q?V7eH+kKLufywSjK8ZqPTbGYMuMga?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 09:15:05.4995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4fa76a-4fc8-440f-9242-08dc6375dd55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8934

Making HSMP as "default m" in Kconfig, enables customers
who rely on the standard distros to use the HSMP by dynamically
loading it.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/platform/x86/amd/hsmp/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
index 26096f901c22..9d3f422b3f81 100644
--- a/drivers/platform/x86/amd/hsmp/Kconfig
+++ b/drivers/platform/x86/amd/hsmp/Kconfig
@@ -6,6 +6,7 @@
 config AMD_HSMP
 	tristate "AMD HSMP Driver"
 	depends on AMD_NB && X86_64
+	default m
 	help
 	  The driver provides a way for user space tools to monitor and manage
 	  system management functionality on EPYC server CPUs from AMD.
-- 
2.25.1

