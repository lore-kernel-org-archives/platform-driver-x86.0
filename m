Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820DA13A24E
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Feb 2024 12:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709038560; cv=fail; b=oItVU09fGRXtej4JOGnYgomFNxyZC6BEWSTYPDpEtem/nXTh1hNg6setnFO1sv51qn6zAqa0vQfMeO0kFQNdumvOf7uIvlJCPFhp8jx+52xtT74oXDHTvZqSSkNS6N5gBWdHj7VEs4p4e9a+9kSRAz9dM0XiFlQ4YT2S5WJiDWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709038560; c=relaxed/simple;
	bh=44hiOUomQ/5fRocm06oGsOsSYIOTutLZqsBhhiOjyT0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RleSW4c2yZ0Sqb6zfwm9Cu0pqBtZcwlVXY8aosBujmuFelFIFgwsiqmtEjicJGHKaQYrZ34CAguVi4m8r7tGPdNeG7tUNEKghHbmEWW32xSeHVSUWuaxgzAxajnjS8FVgE+g66s47Q6ZZ+q+MYj/X51s2oYtN6SIlg1BYbmeOyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JeuD1x2x; arc=fail smtp.client-ip=40.107.237.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JeuD1x2x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lX/79EELQK9Vm6DYOxpmddMLmATo8IWy7f9bVplMGnQuGFdC/S9WxR0585vj2W3AVYrohnk7aICu0Bg2udf1Ca4RMFB6JBPnjVBCk1IUuTDqGXEf5SalEKzzAp9kT8G0BX1o++webcshhCeA6PqM3Un/dAqJKAFrTeeKVDns7DIp+pPsU5l25Z1sDqHNNjj+D4QqKxfDXHlxXJlNy6H89tdSQhtvu4jaDzBbWhU6xXLgFUfqflTz/5YpG2hDQGB2ecV0d659/g7m3kIdpLL7jW2m5sN8QZ8SclI5sTLs+PZwPDXaA3AKv4OSczbbzNrrElNkSTkVN4p/buZ3Lzr5eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4pre8U0MuDZyIkzFl/fNRTJxW0Qk1GQR4Cco1loGgw=;
 b=ULgh8p+uayze5lbRvBDZ3JrVQomhG1wPapo46cujiAU/IkA6KrHS8WSPvSU57Yafm3Nlx4tkkUAbVpL9Fa2qhyE6dPuMEFZ5iCEGmn0GBJE9EPw8AoonYmWUPoKDB40LEWur13+Aab9U3+SX/CBQsB/UB3k14dp2aIzK1KquKpFil8NxEIOea+4VufLT4yz22LtuMS/7ncpfMH6ZwUJwzMmiVXlK761CNK0JOQPsAUbGoQatolHslySXYzi3zHj1LVsDHMWHjw1ce0nga+Sh/6u+adbt5pA4eJn63cqsbcQv4NatF4fYIXSLIC4po72bz4KlOGmt5sQJfzAmrevCbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4pre8U0MuDZyIkzFl/fNRTJxW0Qk1GQR4Cco1loGgw=;
 b=JeuD1x2xordzqeAlftCHRSqYzX20ycj/9wQG3+ShH+e3BjFEnWLBTmfk3B49MDFIhCt+eTQzLfbaypGJQHDMLJ7gQICq/k1wZdqmT5SUvLYYH21sEcKYNx+B+7vxOAxCOVH4VHl95/OAOMXl21hRFdUy2Lqm0OjIJOMuB4Xd6Ls=
Received: from CY5PR04CA0025.namprd04.prod.outlook.com (2603:10b6:930:1e::28)
 by MW3PR12MB4555.namprd12.prod.outlook.com (2603:10b6:303:59::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Tue, 27 Feb
 2024 12:55:56 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:930:1e:cafe::fc) by CY5PR04CA0025.outlook.office365.com
 (2603:10b6:930:1e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.50 via Frontend
 Transport; Tue, 27 Feb 2024 12:55:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 27 Feb 2024 12:55:56 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 27 Feb
 2024 06:55:52 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 0/7] platform/x86/amd/pmf: Updates to amd-pmf driver
Date: Tue, 27 Feb 2024 18:25:13 +0530
Message-ID: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|MW3PR12MB4555:EE_
X-MS-Office365-Filtering-Correlation-Id: f2c63eac-71f3-4bc9-bcbc-08dc3793702b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2kxE4SwfeHnFFx/RR1tWgq2nz48wSKnF6/aG7qTGsAqB/0bwstvvloXDiDwWzSaWZtEtDuVBNxKHGuSeXErxO2WzM3Ypmf36rfqEGFDy0Oh61CUbCRhBrIkLyQbMi+AJM+LShMRlScTvzOSxcpDVAxe7BdvDOBk9CD9m+je7Yqf8k91k/0EweiFfaXzm3edg3esXCImdlEFAMats8Gu7zyMS4+w4YdtSiZPr9cUY1AEeg1cSUAYF03g23ayx5YzvEUYN1kBoojTdblKglejCeOh/t3lngFmX9zDABbYP7iDTVTtwBQx+OAwJdHV+EZptABWjvRRtL5fY5tBe6uV4VYYl0KsT05DhebPtuh1md0eym53Ft6oL3PKWRQVRTplFqkgsPFTMuoDWxNutj8Q93riC0MKkuetLjoe0NYlDwwQYxTSU+EIa5S5RmhuKT3F/Hal2n/wK8+e1CPeitEfs0m+fNrCz10Z60or0IRK1jpr3HToF+Rk3oHNHaU3PaqfwDTOYGwWfrj8Y3FSJYldkwLNNvLER1/i72GNw5NgtxXbmJCSuwUj1OBZqbDcvukdY+CCv2Q9uM6i0JPhWhSLdd0ZbluawGRJfe8zMQBIKWD/NS+haWv/NP/J14bN68o9V6FnwLfzzQkkkanVqR9obIAYtm2VkTbQr4W5nlD+ZiAbr82dLG4u8WQ/w6LUK0HQ+5eVDN8PXNMid0orqV/E9hAh2KjrodKr9rZPY5eQXkabCIXzdvqQhFNLd4DN9540b
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 12:55:56.0308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c63eac-71f3-4bc9-bcbc-08dc3793702b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4555

This patch series includes:
-Add support to get sbios requests and static slider as per new APMF
specification
-Add support for the APTS (AMD Performance & Thermal State) method
-Disable debugfs support for 1AH family series
-Add support for heartbeat notify event to OEM BIOS

Shyam Sundar S K (7):
  platform/x86/amd/pmf: Differentiate PMF ACPI versions
  platform/x86/amd/pmf: Disable debugfs support for querying power
    thermals
  platform/x86/amd/pmf: Add support to get sbios requests in PMF driver
  platform/x86/amd/pmf: Add support to notify sbios heart beat event
  platform/x86/amd/pmf: Add support to get APTS index numbers for static
    slider
  platform/x86/amd/pmf: Add support to get sps default APTS index values
  platform/x86/amd/pmf: Update sps power thermals according to the
    platform-profiles

 drivers/platform/x86/amd/pmf/acpi.c | 138 +++++++++++++++++++++++++-
 drivers/platform/x86/amd/pmf/core.c |  15 ++-
 drivers/platform/x86/amd/pmf/pmf.h  |  86 ++++++++++++++++-
 drivers/platform/x86/amd/pmf/sps.c  | 144 +++++++++++++++++++++++++++-
 4 files changed, 375 insertions(+), 8 deletions(-)

-- 
2.25.1

