Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CF2376F1
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 Aug 2025 05:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756530036; cv=fail; b=AyP+tk1TPFEnCMvA634FQEkC9IwXjkrf2ntn8q25V/hz5EkMtZjssyoIeM3lGo1gkLYwOxwVZfNRQSfG2FXKtzndRpQQoQ58I5Aj8waYxME08mQdJsF03kSf8Se1bE7vrnnEvjtMtCaYdHYcrburNJnX8yv+IZupJN6WvaYImN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756530036; c=relaxed/simple;
	bh=nWi01cURTyRe+3rotarIcNdsBmmB72qzBTTXB2cSqgY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ehdUusZhMP1y3q8evHGL+D0JKVhM0F4Y7H3QcP9Ul8R73wTOxZTg4UmsXmr3Nj36Bcnh/IA1DnUHVhhg900bxEVB2bW1cR/8ztooGvE4tuS+tJNVHYlvngmJ5Z8ZpHcP5U4JHSf9w5E53zQtcsISwjQwdrNeLBoVgUYb0UeJxeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NdYY+VMz; arc=fail smtp.client-ip=40.107.244.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NdYY+VMz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUjWHfuS9cnjxrEy/YuSr90BexDhxElZTxEF0tTLmYUdeCBuh5uMJzuWu+EL/X3Yd9NfLfTDpYkVFd1raA0utyby1qlS3wjx3el7mkazC9MYLCwCCGu/zsowlqLZ/FZWZy8dNlmcOg5g8UacKrDRduHgq+RzBvikZoVi4iIMo/WCezKe7Aqm0YuvPktZ36AK0L+OJUbYhl95TBLp7gAfaSXzVZfoYu7pVYgWZPiCcs6O/3PlI8fizdRaL9leEglSJvO1X9bkFPkL4M9r2VLjaNGaPyrs9GtzfAblQsLiCy6wN35S9tRkqeFRa4b1aizLXHxO2XJBMvYNwoLO1USPrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKTF0i3wF/X3HKwcXnOjk166rE7DHvE5j0VyAaoPZcI=;
 b=zIZXRCPL1FH5KiZJfCsZUmdi6ZqlH9N+5C50jRX0bEVlVKhow8E9bU5i7Ue6m6jO2ceqZGWfY517YA5rN4+0gJ4RdSUUhwHglF1oa/sWmnFhwfg8Iy3clETATOm8mz4Ktfc5fKREs8GjdR1F2sqSjsIwoHKfq2d8kK0ybOe0W4IdoNx2ESQEvlTmBRONy54JhwzyFYljaUl12glH8ZSw3N+BgPnmfdy2SElGnUUYwVppfC2xZHNREhPsvnPTITcKuK2bqv1GxussDZ/tjc8/daahgQAgf6Ev0Y4FmrCmWvjevpTJD0c19hnZp0Av9ienbxOrbYx2nZUTISX+OeTU2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKTF0i3wF/X3HKwcXnOjk166rE7DHvE5j0VyAaoPZcI=;
 b=NdYY+VMzSEaH3bJ2axF7JC+MiyudAPX3AdJ/kFJ8hZxI4Mo12BOd4XE8BJAAIYFWFCWTdM6ox2qAcPjrp/meHJ1lNZ7C6xYHS3ALQIkxY93t/6XgClMuLP1wyHx+N+CUQ6UWGqj4BOjr36P1+cuAyNEfvgG5qlzFqqvl4Tyur8o=
Received: from LV3P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::30)
 by DM3PR12MB9285.namprd12.prod.outlook.com (2603:10b6:0:49::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.21; Sat, 30 Aug 2025 05:00:31 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:408:234:cafe::5b) by LV3P220CA0010.outlook.office365.com
 (2603:10b6:408:234::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.20 via Frontend Transport; Sat,
 30 Aug 2025 05:00:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Sat, 30 Aug 2025 05:00:31 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 30 Aug
 2025 00:00:30 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 29 Aug
 2025 22:00:27 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 0/9] Enhancements to PMF Driver for Improved Custom BIOS Input Handling
Date: Sat, 30 Aug 2025 10:30:00 +0530
Message-ID: <20250830050009.454739-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|DM3PR12MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b285eb5-330a-44f9-a536-08dde7822536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Qn0D2WTJviYtv9gzfdxshpBUhj8EUf5LTOK3v8Ym2d1mi/glqvzSi8NQ8xti?=
 =?us-ascii?Q?SWNQEJ37OUxbRLYwA2qBLqzLvn3EHgm/TNiiyhjp17oewiSDHPSro4CfAfFN?=
 =?us-ascii?Q?seP1M5FOdI9g3nIPJ3KzfH+op9ICUrqb1XeDiZ4+NQWBbQgRQXZwIArcKjvj?=
 =?us-ascii?Q?VYcoVm8A6v7ra5/ZytGRYP5ISrfMS+vk7MFWBkDGVl+2GHlx3zZboEhKyyXx?=
 =?us-ascii?Q?akgBmQHEuoyqerfXEh2wdlSp4zGstfKpMmlX87EklT+C0co5NkizTLoOzJTZ?=
 =?us-ascii?Q?YP0vOGqfmmdQLirpmA7TkJFuqgzI1LtlUR5cXLT/TTcNI1pxdbV3dTD1KC/E?=
 =?us-ascii?Q?PWp3oI85GR4Gd81Gu+J0QVvxuBOo9ajJY3L8HIms5pod8c0I+QtZiSBbarMm?=
 =?us-ascii?Q?s5IyVjchV0lso49SYH8bNfezwUQLrK0Vz0Gh2JoxWdUWqmi6Bsf3pCXcm0PV?=
 =?us-ascii?Q?459h2Cwlvc2i7GOLj0LnXEy7zZbfiFp3HG4Dz0HC1weNGFcoyv89f5wBNp/s?=
 =?us-ascii?Q?/QludDyO5hGUYO84CiWeqFj8SHm/jOcn8FEAgfXhZuV2nZFpK1NQaFYX7POa?=
 =?us-ascii?Q?sF6ZYZAGhc9Pm9qACBWxurSZIM3zhaWBzD9n5M7Is7ou1s5Vgt5psoo1R1Zu?=
 =?us-ascii?Q?i/k67WRMtbcupl47i7LkEGGLwAIIMUwNchWpsaqjD2vaXSpZyAAsn26z7CLz?=
 =?us-ascii?Q?CeNRn/reOonzWdSIPkB3NJG6JKPDZ8HfVSL+OH7R8EUwBx2Ooe0zPOTOvqSE?=
 =?us-ascii?Q?jWBnb0IMMPAK+OLut8n9K4Gzy3K7ZWUAb1yKBdS14I9p7waYggzlcVP4sOZN?=
 =?us-ascii?Q?mkkR/OHak5NIiwEJpCN8W03RQpVrhR7ZX4XewHymq6gMN7TlPj2gq8bSBH40?=
 =?us-ascii?Q?D1xxaBnK0Sly/7YiQ9OEzQsqsTdWREUTIRCJ6hrxZShDtpVqVFHQOJsAk1Zb?=
 =?us-ascii?Q?6953vQiTYnahexzxCUsLN4qnsWd6M9iPWrJA8Q2KRn/6b+u8REKWE9kpVsch?=
 =?us-ascii?Q?sTuEWW7s+5R2SYDYxAYZw6KFMg6tWOKJk5CY81SCLT09XVc0fwn4DTOBd/l4?=
 =?us-ascii?Q?1fRrxBbQhaforIvaXV3Zc18X9xFf8aI8OYNfPr8cEVkoLh8YkoHsr5k8E6PA?=
 =?us-ascii?Q?k1OF6sYKQWgrF+qBxAlgIWlQgli7/cnltZuhEJ3F8g3v6UhR/LHreaClQNv6?=
 =?us-ascii?Q?Rf5kycW26zESEpr8AL0v9hv2ae/0pC705E/IheOg8L+HmOpk5Ga59rgCQRnt?=
 =?us-ascii?Q?GSo56hjOVKqBYaNnyVSEGeCZgchHb4iObfxlhwbEthXSQwi9imRge81vAa17?=
 =?us-ascii?Q?8UQXV0YQE4oqJ33M8YV7+oye5ppGSan8F5d2BT9fChOKPWsnH1EWIR+bTxrS?=
 =?us-ascii?Q?ShZQToRSjbeb+rc1hJtLchUoDYMrfWvhs1u7HyDMpRIhBuE5h6iWK1td+NlH?=
 =?us-ascii?Q?Z/KeK6Gk37YXcqsbzf90vdzObz6myRkIu15r9TTeJN1YwKUS44H4S81ALgqA?=
 =?us-ascii?Q?mniTiCPBYUM4g3kVQW0jmSEzJtFxwTFvrgYZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 05:00:31.2143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b285eb5-330a-44f9-a536-08dde7822536
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9285

This patch series includes the following changes to the PMF driver:

- Implement support for modifying PMF PPT and PPT APU thresholds
- Enable custom BIOS input support for AMD_CPU_ID_PS
- Add the is_apmf_bios_input_notifications_supported() helper function
- Correct the handling mechanism for custom BIOS inputs
- Maintain a record of past custom BIOS inputs
- Process early custom BIOS inputs
- Initiate enact() earlier to address the initial custom BIOS input


Changes based on review-ilpo-next with tip
'commit ee1cb9b0e6a8 ("platform/x86/amd/hsmp: Replace dev_err() with dev_info() for non-fatal errors")'

v5:
-----
- Use unsigned int instead of int
- Use switch and fallthrough mechanism for install/uninstall acpi handlers
  v1 and v2. 
- Use a switch case for amd_pmf_update_bios_inputs()

v4:
-----
- Rephrase commit messages
- Simply the code with loop + helper functions
- rename variable names for consistency

v3:
-----
- Add amd_pmf_set_ta_custom_bios_input() and amd_pmf_get_ta_custom_bios_input() to simply handling
- Address other remarks by Ilpo on v2.

v2:
-----
- Use array to store the BIOS inputs instead of individual variables
- Remove additional spaces
- Replace GEN_MASK() with a meaningful macro
- Merge patch6 and 7 into a single one
- add amd_pmf_handle_early_preq() common routine for early pending request

Shyam Sundar S K (9):
  platform/x86/amd/pmf: Add support for adjusting PMF PPT and PPT APU
    thresholds
  platform/x86/amd/pmf: Fix the custom bios input handling mechanism
  platform/x86/amd/pmf: Extend custom BIOS inputs for more policies
  platform/x86/amd/pmf: Update ta_pmf_action structure member
  platform/x86/amd/pmf: Add helper to verify BIOS input notifications
    are enable/disable
  platform/x86/amd/pmf: Add custom BIOS input support for AMD_CPU_ID_PS
  platform/x86/amd/pmf: Preserve custom BIOS inputs for evaluating the
    policies
  platform/x86/amd/pmf: Call enact function sooner to process early
    pending requests
  platform/x86/amd/pmf: Add debug logs for pending requests and custom
    BIOS inputs

 drivers/platform/x86/amd/pmf/acpi.c   | 87 +++++++++++++++++++++++++--
 drivers/platform/x86/amd/pmf/pmf.h    | 77 +++++++++++++++++++++---
 drivers/platform/x86/amd/pmf/spc.c    | 80 +++++++++++++++++++++---
 drivers/platform/x86/amd/pmf/tee-if.c | 22 ++++++-
 4 files changed, 240 insertions(+), 26 deletions(-)

-- 
2.34.1

