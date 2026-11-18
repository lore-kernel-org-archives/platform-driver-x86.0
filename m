Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795012351;
	b=0p3L9DXZmoBdW5t856yBMnEwkGvhc0dvzFbRjbblRlo63baOhDY4F013lpM24WtaqpW7
	 6FQsn6YhNkTzyJDSkAN7VFjJxCQ8McCxBVJfEPO8NEb9Wsu+yIkc7m+Xkq4w138l1mVPz
	 LnoL025wUGTEwJlM/8aDngst7XfKfrJpRNaeYNfJkYTfEfDjuFmTOvaZxwbIUud5sA7Xc
	 g4atH7/O2paoPJ/+loxqbAyanJiCPvS/eQSFRF7eY4JFRZN+SFESnziPZOerWdQfCNK5v
	 UOY6WF0U71eyLo/kQ94SG6h11e1QvO8jmB8nDna7sMQ7NIaeGk+mo9B5aI8tKAbPBeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012351;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=FvWntlUrWq8exN+v3BNENI8hzuUvPM1IFWWB6AT6j0I=;
	b=eUSkGrI397xp7IVEBZ5O9bh03EZ0YEm960y9jboP8G3jKxqFyW9pF35pWhBiBM80Uj6f
	 cLMO6yD/MTv7jHAfous0M0MX3qtBJRYlRMCtEL3QC9KHi1Kg2rnKDoacGllFJCKRgbXPm
	 Lk35oE+N0YS2+r+ANgKI/vQvhKov5ZS3dYG1fZcNe59/eQb0wQUYBdBG1OIMZpegT9V5T
	 aqwMQYoL1L5D9ldE+bgPJdXQrHOErDyaR2SkTNOAgT8DQLvt/NugiOR5u5QY1PHIReqb4
	 xHV2OtC2iP3Cd0+aFY770tEZ9Bc8SKeH8xhjrhZ2ZDAMOOQAndKP15DbdiuvJPUUuWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CscEPSeY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.33
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012033.outbound.protection.outlook.com [40.93.195.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A2C606A320
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 14:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29A2C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CscEPSeY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GiCRSq/VoeXltrPRaqc2VODqku3xhyBqkPflIgOz9lnlS6ChqyM+1nWrrtnZ6saKmFvF+th4qM/YpOor5wGmJcUhjJjWCLHm0HWQQrxKyuLebu9QB49MnBgicCRsKyPRWnJXWsWzdsrbmyY/orheRerX4E9WquSrtbdGIMYd+0dVBYNvl/+O+c9cpySJ9K+y3KAiDyORlxPJIG+HrSbzE5sRGCF/XnKLnoTLy/Pk+MoNYcoKPRJzH0g5CT93KUCe7171zj0l7tWi1aWx0ZCDjknn0Quh78WnwN6zRI8JvDzZyGcHpVeHOI20mXvlNdGy1ySlC1qOyggj0an5K2r+Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvWntlUrWq8exN+v3BNENI8hzuUvPM1IFWWB6AT6j0I=;
 b=wpOChucAtVMuU/W6uHi50qDUq0Xjop3Nrs8o9EjHGAZ2ZSmuDUETH9FVcCa6XAbsZYXDiUNSyQO8iJa4ssmoVsewMK3thFqHy8BfaC650yO9k8XBXhVKzr5xePrBKF6cMKj2IJVnI38YVNsjxasB847kudQqrqplkfF9MmUU6Nsrby/n0Ysodg7Oc6a33GCGHgviKxpbx/UKzA3kDLvOdI/Bj2M/eqw2ldFEEsU1RLkaTZa4oiNHxb/PGr+Z1jilzvJqU+hXc8vNDh5ZBeDInPd+gZ++nCEN6OMd+7tX55uz5p+SxK8I0ndLYpS1slIjSUri2e8xfJkBX0JTBYG2jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvWntlUrWq8exN+v3BNENI8hzuUvPM1IFWWB6AT6j0I=;
 b=CscEPSeYHVJ6d0RFYt/V+Z8Scg7WKv2LB+Ge0PrUcUOPXzc/h5Le657EpqQL/Yy/2CmmIuMX3KDs1e8fY/DnlpJE2mQ7UAIkqXwHxBSDuxhnqusXixO4FDpNqVa/rKOjwZx7ZmqsBF4mDnqQNIj0BJIP6jAymEfWtOxfGxsNDeU=
Received: from PH7P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::26)
 by MW4PR12MB7118.namprd12.prod.outlook.com (2603:10b6:303:213::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:32:27 +0000
Received: from PH3PEPF0005961D.namprd05.prod.outlook.com
 (2603:10b6:510:32a:cafe::4e) by PH7P221CA0008.outlook.office365.com
 (2603:10b6:510:32a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 14:32:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF0005961D.mail.protection.outlook.com (10.167.243.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:32:26 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:32:23 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 00/10] platform/x86/amd/pmf: Add 1AH_M80H support
Date: Wed, 18 Nov 2026 20:00:24 +0530
Message-ID: <20261118143034.3566684-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961D:EE_|MW4PR12MB7118:EE_
X-MS-Office365-Filtering-Correlation-Id: b089dad3-9c9f-4f86-9f60-08df4580c4e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|18002099003|3023799007|11063799006|56012099006|261026140227099003|261026121527099003|261021123027099003|10067099003|261102123227099003|261021121427099003|261009223027099003|261028144727099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	LTdjlI/tFTkFZNT3gXfdPvR99psQbqhRLLna8fKWLwGVZwtQFmiMNY0nz3UN7eYUJHKcgXZzmlG+MIJyv5XxjAbCOV6V0VESt2sLg2OldKuveHLgSuR/C9u8d/oBhaT+dKY2FX0ozrLp76Li5AzB8fAmo/wcptXomEERYodO5dp9k/CpN37hrL5veMS5PgLLgNpJcD6OgZQHa+hDLCgtXfFZo+hfWYRO/CRm/DNFTsMFNUqctFE5CNmnylxVLN4QormpdGwkk7v5F2xGYgBthYfAwqHNthZrRTxSO/8I+PJ/DYKG+acJVq9xJEVaDHD7tNY7ZYIFA2S7fibgL17c5BPtHfCb+V+ixUOLvWqt/ikno+YzuDSp4PhabKthGXYwbuc48bhQtVtnn/cMsFB7YGpZsRnUd+rcB+yM6bO7yHJsC5lEDgeKmHaDwdyYJoXxs4fDNiSm6oMUOmEFrhUjmaDIPH9oGhx30Uud4y9k14fnzRb6gOBpnou0PAEFVyo+PwPs3r5QlUI6vM1DToT2/Fbb2LeIqDG+peOsODdJ1qeeQcdkwrwLyuVMr2OaXxCIRTREQw8zn3BRO5deJ0rRdzIgrAIQNqG7tiqRbwzorB8AFK9Ktj+NpMZEhmYwaMRh/q0RprUejNH8ca0joQ504MwhcgNetZEcCodh6LdyQ4w=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(18002099003)(3023799007)(11063799006)(56012099006)(261026140227099003)(261026121527099003)(261021123027099003)(10067099003)(261102123227099003)(261021121427099003)(261009223027099003)(261028144727099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QQWghBX798W878UH3a7ysO9kYgIgJUMEK0h/VQlj3tb2jPtisDKTFqQZ9JZAMP8jBQUvPGCvd2QfT2mjk/HdVidVB7s/NGiqipR4ISEDqNKd5y30jTxcoxbhqZPwdmHhsopuEFVZlW0I433MHy9uqrfUis2BWGjZ6zFRgpkuOMQFE1qbizxN5cLqtf0umQsbsZi5mMi4V0pPPdIimXPsHWjUl+tMWP8v6KKLFNrU5/jMgrtuVyK6epdU4WsjIweT3hX1MJYslOx+VA7/+LFv5pv4+bLii4AazKAXuRzGSMKJ5diSd1meQb5CSmETyXJchSz59J9nwP97b6j+ABbRakYF3182vkNdnSH1S5RitGbYm4vw26tcQhv+kY2mxfj5q0RJh2IaTtauzLrcZ/FVISp39CiIJQhNIEMkRd6nblchG0ElCmFRs+BmhVZ9Mwzl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:32:26.9959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b089dad3-9c9f-4f86-9f60-08df4580c4e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF0005961D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7118

This series enables the PMF driver features on the 1AH_M80H platform.

Patch 1 stops sending the legacy DRAM address commands on 1AH_M80H.
Patch 2 adds the static slider support as per APMF 2.03.
Patches 3-4 add per-platform TA ops and the signature size handling for
RSA4K and alternatively signed policy binaries.
Patch 5 uses the system state enum in the TA policy action code.
Patch 6 adds the Smart PC builder support for the new TA.
Patch 7 remaps the metrics table on resume.
Patch 8 passes the custom BIOS inputs to the TA on 1AH_M80H.
Patch 9 shares the TA policy apply code between the TA versions.
Patch 10 extends the custom BIOS inputs to 20 on 1AH_M80H (APMF 2.03).

v2 had no review comments apart from tags, v3 only extends patch 4 so
please review v3 instead of v2.

---
v3:
 - Rebase on the latest review-ilpo-next
 - Patch 4: also handle policy binaries signed with the alternative
   signing mechanism; dropped Mario's Reviewed-by because of this change
 - Pick Mario's Reviewed-by for patches 5 and 10

v2: https://lore.kernel.org/all/20261106164429.30738-1-Shyam-sundar.S-k@amd.com/
 - Rebase on the latest review-ilpo-next
 - Pick Mario's Reviewed-by
 - Use ARRAY_SIZE() and rename the APTS state array to states[] (Ilpo)
 - Use SZ_256/SZ_512 for the PSP header and signature sizes (Ilpo)
 - Use max(), sizeof() of the destination, and a single update of the
   previous sample in amd_pmf_get_smu_info_v2() (Ilpo)
 - New patch 5: use enum system_state instead of literals (Ilpo)
 - Keep allocating the metrics buffer on 1AH_M80H and only skip the
   SET_DRAM_ADDR commands, the existing metrics paths still use it
 - Keep the power source notifier registration unchanged, skip the
   1AH_M80H slider update instead when the APTS defaults were not read
 - Read the v2 TA layout in the util interface on 1AH_M80H
 - Do not fail resume/restore when the metrics table remap fails
 - New patch 10: add the custom BIOS inputs 11-20 of APMF 2.03

v1: https://lore.kernel.org/all/20261011100554.1841309-1-Shyam-sundar.S-k@amd.com/

Shyam Sundar S K (10):
  platform/x86/amd/pmf: Skip legacy DRAM address commands on 1AH_M80H
  platform/x86/amd/pmf: Add 1AH_M80H static slider support
  platform/x86/amd/pmf: Abstract TA dispatch through ta_ops table
  platform/x86/amd/pmf: Get policy binary signature size from PSP header
  platform/x86/amd/pmf: Use enum system_state for the TA system state
    action
  platform/x86/amd/pmf: Add Smart PC builder support for 1AH_M80H
  platform/x86/amd/pmf: Remap metrics table on resume for 1AH_M80H
  platform/x86/amd/pmf: Add custom BIOS input support for 1AH_M80H
  platform/x86/amd/pmf: Share TA policy apply code between TA versions
  platform/x86/amd/pmf: Add extended custom BIOS inputs for 1AH_M80H

 drivers/platform/x86/amd/pmf/acpi.c    |  33 ++-
 drivers/platform/x86/amd/pmf/core.c    |  38 +++-
 drivers/platform/x86/amd/pmf/metrics.c |  16 +-
 drivers/platform/x86/amd/pmf/pmf.h     | 301 ++++++++++++++++++++++++-
 drivers/platform/x86/amd/pmf/spc.c     | 210 +++++++++++++++++
 drivers/platform/x86/amd/pmf/sps.c     |  97 +++++++-
 drivers/platform/x86/amd/pmf/tee-if.c  | 261 ++++++++++++++++++---
 drivers/platform/x86/amd/pmf/util.c    |  83 +++++--
 8 files changed, 954 insertions(+), 85 deletions(-)


base-commit: 9c82959c37bf69c2ace8a0f975cf2129ec1fd982
-- 
2.34.1

