Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793983581;
	b=XkCDjEPBfQspNjOQQNVk4c/S2+fbP+n0JDJr2xRE8VnBt68NPIoF1ZRl+1lWiKTWkihf
	 URcZnlaO9LRwsQ0PCYr0AK1Y4rZExMgCIXBuoyCevg8Wj+aSUMuIYY/DG54pTS7uACA/y
	 aZPoW5TZefXkZ2fDvEGgMMgynYFCefo1T9OoMyYhQvDHO5h5JZT9I2eIElQFwjAOb5kzL
	 6JWOs1Io58XlbQsykkgyajl/YrAsGTYjTOeu1VWOqrfuv/V6qZ7GdLZuS02c31vyZ4yNK
	 pYLgoPZG8ik2NuzLKh7IwVyCJKhgLolRzb/BSXvClsdfoqPE2YQi4ormNp7O05aFNHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983581;
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
	bh=bmGadag1ehTauMNhq2HHq4MI/aUUcEQNYmZmKoq9SBs=;
	b=nQMWM2SIfbgjHaGxC/bMtPgAMezzhnZ7r4SPUE9O2apiGFnDjR0snWcFFrt3N3PPSWCo
	 6TKHnjiflxYpwsyVWXezcLneAjWTP0EhM2cLFIB2YjnY6Qz1UFlYrG0ogUUYYJqy40oRZ
	 oGd2JwkEHdUXi7ILCNP1EfgKjwAHqFT8D/T+Pdwg8teon2hR7B4cxpiAXUZRCq1+DhZMH
	 lsrm0Ch8a5rAV4bh31azqDBC0S0E3JlzLa3DKrrAdc3lc/cNjETMzMoOqr877a7ElBwbs
	 jw6U9578+go5D2KX+h/fyQu0sD84vVEkmnHRfTVHYcEPqyRIgSTkGRrswY3v2B5JXHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qWhGMyPq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.19
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B6B606A330
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 16:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4B6B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qWhGMyPq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atXXflXwdu9T1rIbTz4rbC3tkMUiXX5D6ISF4Eno6wPFZjr4lNGqbx2vtXl6MeAeFSOmCXUXjLyIn6sbK2JbaoF5kwPapq3z8eMtdUUkJlZgVTpiWMmUHFG64S3vnlrWUWo0s5Ze/Hs5h+7hpvuU6oZv+8h8R4VT6q/EYzp9cVWP0NjtDmpSbuVkDkccGrNzCIzO/ed+PmLWc3aq1NCSLtxdIfYETo5cdQinmfGeOgvFjshd+dJH6xjWD3FeTq9HHbLiGZeqZNrN1PZUe0pFHaX9UX8s3ZCV3X9yIOS7LA1ZIBJ/18rh94XB7UvyVkfx2/UCFZdG8ibTXo2DbKysQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmGadag1ehTauMNhq2HHq4MI/aUUcEQNYmZmKoq9SBs=;
 b=N1+ZQLadFYnbELlcWd9WLtVL+ollGGl+/UEoNjKXKDFEF64kFIp1IcV1yjzVNvaPwf1rbX4Dspx8Mfb5eAwPhnSGF89uyMhhL6f8ib5zuH9tovZlNjvZxVXRAYF0ZVgg9KbyzmMniq9itb6uHrFcSSYDuztzkHYvF0K8Cl6+uJzm+l7PmDDCVWD0FUFnFBJulGfeSuFsui+PfuecayDLSoO+kwRwKaHS4UlYgA26KyvbMhxd3qUUfNcCWPF0Usy8RMXDQeFTnaL57t4VfFiGWrjLxlKH5k4wwmBiZHHLxJB9VBdLjGX2r0RNAok6f/BTVLvt9V92gL9hd75yz8TDMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmGadag1ehTauMNhq2HHq4MI/aUUcEQNYmZmKoq9SBs=;
 b=qWhGMyPqxL8gd3dyUcoDFKH3IXZUkJVoyirK7UHkORxZCsCoTw/Eahz4wYXgoGhOJmw4U3Xk+733XS36t6YzDVJEedGqbomSSF/oY9HcUB43bHJqvKR6JdvMOhMZ1P6FmILjX5iVjR53k/O9ztjyZJmHxAOY9D5VWTKW7Z4Et1g=
Received: from SJ0P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::29)
 by DS0PR12MB8368.namprd12.prod.outlook.com (2603:10b6:8:fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 16:46:17 +0000
Received: from BY1PEPF00026956.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::79) by SJ0P220CA0006.outlook.office365.com
 (2603:10b6:a03:41b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:46:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026956.mail.protection.outlook.com (10.167.244.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:46:17 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 10:46:10 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 00/10] platform/x86/amd/pmf: Add 1AH_M80H support
Date: Fri, 6 Nov 2026 22:14:19 +0530
Message-ID: <20261106164429.30738-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF00026956:EE_|DS0PR12MB8368:EE_
X-MS-Office365-Filtering-Correlation-Id: ff47c835-3f53-425f-d6ab-08df3c257a4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|261028144727099003|56012099006|11063799006|261022105027099003|261021123027099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|261021121427099003|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	7bVGKTPMnszlukLn5XbOAdmxHs3rCEtDsXX97rX5r916C5DLQAIrop/Hg0ocESJoaKcoN25bEA9v61Xdjm2p22UpC407XWdj3mYSaj62t2z1jRikKlEBDCzTTSzG02D3zF2LCJavngQxr9D3OVTy7DxydwrC5aWmox1VKo2EgzdCDHhA3efAS2HjKa+gwzHEwFuA4JQ4FA/Hdigs2vUHG9pkHyD+c0aRfEfUOyw7hNYYqR79sORaV5LZyAg6nsPaeObEmJ1NaC8OM4xZ4wfeOdznIjhK4EsoMAX24sjM7NZUNzR6guGSfpGlvLqNnhZwYnI6IjiwdBLLeSLwRC5BdhUUoe1odT3a69vDztiU9fLYC2c/X03hUpuPMgGpDMS2KaI4PK6wkK/AhbaNa+uadEyp/UVIi/iHwv7qCNpTM83PjJT489OSZKWalq9lXh1rQA1c3T+UBL4nHwOktqiHFmQ5O3uaj7O81c3ebF/gCz0i1H7X1H2DHgvD6bxb6LZWSKUpQQmGmSXT1dUBlpqmxw5AnA2rmDwrP+0+Xb1CUBmFDPG1Z5VUBkIcQxZ7l8H+4XVkIIu25JBFDOCmOMRX5cXyC24wmvIN7DMlZrmTzxCC7PhpOi5/ynNP7pI64dDbPRt4+E4AhuO1KVu7XLh2OFK+tceEqvMunJMMD4sccHI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(261028144727099003)(56012099006)(11063799006)(261022105027099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261021121427099003)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qsBublsA7apuqLCbp4fcx+Q7egdnFqjnHSOFx+oR9pJDxcjins74Tx/e66A5BZ28hlb62eQc80bS4QfQHEDSPaXIpF8t+ecW6Zf0viN8txnX8Gx7FoB0neVXMvpQHERLvLzcUV1hsIiN/as1lgwt8J6CPiKnf0+0a+wUm29aUiHXx8vVrU463e5DpRZZq/INr3guo0ilx9w6yURwfQri0CW8iBzUb21lBjxn/PaSs8P+3eEcEPUrG3ddyLF7t1yvh74YOxdVUeMnIalgdXquF++EbdCai3WOCxDASy1bhmJMo2vaKtzW9Nm2O8M/MynuIwbnotuV7VW8VdLcuFwpZEMwUEcQdozG3/lmE9wTHeoFNFKPGx5lkGJxpl8bj6KK1pXCVsYqIOeQ4AwwezqfO8HvpUnWBFzKzR1N3IHbS2TGK2qM1IAZoGIXB5iZ7i+6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:46:17.1910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff47c835-3f53-425f-d6ab-08df3c257a4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026956.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8368

This series enables the PMF driver features on the 1AH_M80H platform.

Patch 1 stops sending the legacy DRAM address commands on 1AH_M80H.
Patch 2 adds the static slider support as per APMF 2.03.
Patches 3-4 add per-platform TA ops and the signature size handling for
RSA4K signed policy binaries.
Patch 5 uses the system state enum in the TA policy action code.
Patch 6 adds the Smart PC builder support for the new TA.
Patch 7 remaps the metrics table on resume.
Patch 8 passes the custom BIOS inputs to the TA on 1AH_M80H.
Patch 9 shares the TA policy apply code between the TA versions.
Patch 10 extends the custom BIOS inputs to 20 on 1AH_M80H (APMF 2.03).

---
v2:
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
 drivers/platform/x86/amd/pmf/pmf.h     | 299 ++++++++++++++++++++++++-
 drivers/platform/x86/amd/pmf/spc.c     | 210 +++++++++++++++++
 drivers/platform/x86/amd/pmf/sps.c     |  97 +++++++-
 drivers/platform/x86/amd/pmf/tee-if.c  | 258 ++++++++++++++++++---
 drivers/platform/x86/amd/pmf/util.c    |  83 +++++--
 8 files changed, 949 insertions(+), 85 deletions(-)


base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.34.1

