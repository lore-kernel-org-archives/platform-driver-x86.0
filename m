Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010062.outbound.protection.outlook.com [52.101.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354B21DF736;
	Wed, 19 Aug 2026 07:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787124739; cv=fail; b=jOVpW6aUqfYRqXrG92/D+JCwpzKG+UGzX9zdiHma9lnmL/R+tmYf1BcNufcdAuIsAw8n08Sp4C1TReXheJ0W+Ta/+kTEHz2uV1+sFS+BtxKv166oBKde+c2ZGHGggGDva/8iAeTJbOtdKJRJaLL+tZukifgvkMP7rdiAvp83z6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787124739; c=relaxed/simple;
	bh=8wnzZfy/FKzH4rqRQiXZrR6i21UNg2YMNXeh575Od4k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WYJfqYGtTeIfOvjQ9c1YVJ9MAMHN++znA7IuzKOXKCIHQDlNwX8uPEvBrf9Ai7BrRkR+sZKJbaesbR6/FD5ILiZMzpkInS7rNp3eViJvIUvFUIlfecLv07Q68abRHczyHvVwNDaB/3d8fhY5puLWSSZ1QF1ULkCMTrH+jun03AM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=g1G+jwda; arc=fail smtp.client-ip=52.101.201.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="g1G+jwda"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCmUK33VASbfPbzM/fWF0ld5E/bIume5HcB828bnfjeHwto/3epOm3isx5cGCOZXVVP9gkAk6+Lq5FPPbJ093YgxUaVTHVS2pwBIPD24uri0aSuiurpYywZkeo06jaMwKD51lcvezk1eWbYRA70XiwJGE2GKb9aX1UmQ5q4bDUW85Dtj8iVtmwNiK8JXdrx/np7sTmcjpeRcx6MliT5u4lEagxYEy1yIobnq9VX6EcBhA9J+MFfCFhjVFMxo4c/GU33jJJpHtoI1O1GMPrYZQWMk2VkiKsQVT7/zIN1MBwLU85zY7Fd/gYy7zn3Yh0VGZGjxBGj+C3xPP1gejb6a3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdR/j5uMeLfvppKAueIPwlWtoUjXDGcFTo6KlorbeLE=;
 b=GuR4wztCeCo03KLA90Q61BOBN9NlDnLnRW/buVzw5qtZy481bRaSBI9nJvgz8PMBkvHJpn4E3B0p2BhzGT40s+JIDBzuiO1AFGDEGuzNoJ7+Ebr2sMqvIBfIYSLyNOH43vuLQu1I5tDEx8ZbT/g8G8W2lfBKDs8QGqghf+cNVzD2La0jdpvMK8E2GtsHV1CUblrIVXwq88FhXgiz0ZFZS9VGbf+dtYNZw5XpUQHqQbwWvD8ri2H6nTwptZRHQNSZ5fxpdnsAtf3SVnaLlszRdINnF6zI6eFMpvCSTVaC8ngP/oJPSQHsXpsgq65oWQ3dvGQH+mAipqoY87747x8wYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdR/j5uMeLfvppKAueIPwlWtoUjXDGcFTo6KlorbeLE=;
 b=g1G+jwdadVkEzWMvHc2O+11DMjgNjVcdKkUcCNYrHWak0eqF2tRj1pOIgLzjNAWoTe20yNcNPovP0PxSZO2Hc/juBkaAuznM2KX/2tg+ywz5VR7lCs406TyttDIZakM5c59Gul5iCO/9C3ShH+JtxHCAVQULG4uNn29iMVxO+eQ=
Received: from CH0PR04CA0038.namprd04.prod.outlook.com (2603:10b6:610:77::13)
 by SA3PR12MB7860.namprd12.prod.outlook.com (2603:10b6:806:307::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 07:32:14 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:77:cafe::4f) by CH0PR04CA0038.outlook.office365.com
 (2603:10b6:610:77::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 07:32:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 19 Aug 2026 07:32:12 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 02:32:10 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <Mario.Limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v3 0/4] platform/x86/amd/hsmp: Family 1Ah client support
Date: Wed, 19 Aug 2026 13:01:53 +0530
Message-ID: <20260819073157.2426504-1-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|SA3PR12MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: f7adaa01-44b6-4b9f-0c69-08defdc3fc64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|23010399003|10067099003|56012099006|6133799003|3023799007|18002099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	9me0G/uGpwRd6CJ9MnUjgHw5oqi+FVKeAYUSEDan69NBaUsohA3jPXHAI2JkzaJlmVt/VnuC1JgPt2tKiDKN/6SfzhKbanyUs+/wZkRwygoLYqRm81pchyIz2/QXV3Op3Qg70oRSyFEJwyhzyyADjK3K7cUzX0U5zYFWvKR/jxIfQYGndrvla+UVqPW0qmOWMRfO7KwlmZzwN4z7lzPEJt0njw9VT9/kK5ZgufADZrwja5YjXMbzQ2PHBtQveY2EbZxq9JiEj2hqdRhpDt+cYEQbl6/7N1UA2nj0lYkQH0qJJq1TeFrnUJD2BkapH4fo2tKPSiBYI4gSmEREYEqWggBQAvgZUqUBjNhNDGyYfqGRdK/bgF0Df/q+WSNI1JxNf28n9/ntGIsff7fiPTPqkK4LhIyzeOfl3Gu4iUYMGCc3oMJJ6v+bCT4/7jGjQm8fSafLVaGkwrdzq0PfT8pPG1YYAMpvKDtontn4ym0gCYu6CZOcBjGEdch3DreKNTns/HT3M66QoCUn/ZFVgREVj7rKYnhyQVic8sQM4mnotYAZD5Jv8cXaPR2MhHf98A6j8ODs0zNraFIw4X7/jPN9hKTuujlr+zHe6ndKiuiFMsEknKDNQLI1GLTFsYQTvcquRMTlIIeQ4DPI9eaR2RCqIQAbcUT+YdLilWRLZ2ur9Mjtm6q7d6s+i6vLRvcEfBR9ijUI1BogF/F8/xFWEYXGcA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(23010399003)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b/aa59twAzgAQcYwNqBfHWFl/faOpSd/LINEHDuJmlJqUs7wTE6soLiPGZ6zO6CcMT61eT668YLYJ9D2sBmt7WilZF3dvpHA31efhMHixe7L/Os0WaYbLFLXwrz2nDFkNKHUHnxyYnPEMAWDiciYfe2KPkON40pMQsdlmcGBV/jYfsQwl8evKcIcsCTAlQsL4Z3lRdzX4+tLC+at8XFSgHsa8xCVcTFcwzL/smitJFWxH2OzaW0kgBYgHnqi7KnRasfzWu63BcBeH2jpaIkzHZyyHBv+MrIM3kFDsQGa0gOrbIJXAzhU9hcYQsISoTowrH6PfcDUgG3xq3E8irBlG4V4YM3MEUVEWj1H6kbTjgXcL91VgaqJZOUAZ0Ko+DKC8vaNns+BfiVo7OYKq1dFuBynSUsUPKOF51z2ydDtFWCJaBsD8y88cCttuujXEeml
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 07:32:12.7770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7adaa01-44b6-4b9f-0c69-08defdc3fc64
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7860

This series enables the HSMP driver on the Family 1Ah client platforms,
Models 80h-8Fh and E0h-E3h.

The client parts drive a different mailbox from the server HSMP
interface, but the latest BIOS describes it through ACPI _CRS/_DSD the
same way a server socket's mailbox is described, and the parts speak
the Ryzen Master SMC message set instead of the server message IDs.
Patches 1-3 teach the driver the message set and let the client reach
its mailbox through the existing _CRS/_DSD-driven MMIO path, leaving
server behaviour unchanged, and patch 4 includes the telemetry table
those parts return. Only the ACPI driver probes them.

Changes in v3:

  - is_client_platform() now tells client and server apart through the
    ACPI-reported PM profile (FADT preferred_profile: PM_DESKTOP,
    PM_MOBILE, PM_WORKSTATION, PM_TABLET) instead of a hardcoded Family
    1Ah model range, the same signal amd-pstate already keys off of.
    Future client generations are recognised as long as firmware
    reports the right PM profile, with no driver update needed.
  - hsmp_desc() now resolves the running platform's descriptor once and
    caches the pointer behind READ_ONCE()/WRITE_ONCE() instead of
    recomputing it on every call. Concurrent first callers are benign,
    since every one of them computes and stores that same pointer, so
    the pair only needs to keep the load/store from being torn or
    reordered by the compiler, not order it against anything else.
  - The client message enum in amd_hsmp.h is now documented with
    kernel-doc, one @member entry per message describing its inputs
    and outputs, rather than a block comment plus a same-line comment
    per enumerator. Noted there that not every platform supports every
    message and that an unsupported one returns -ENOMSG.
  - Patch 4: the Telemetry Table RM layout moved out of the .rst and
    into amd_hsmp.h as real kernel-doc'd struct/enum declarations,
    giving userspace one authoritative definition of the byte layout.
    The .rst now just points at struct hsmp_telemetry_table_rm. The
    structs are now also packed to a 4-byte boundary to match
    firmware's actual layout, and the trailing NPU/PMF counters and
    spare padding firmware carries after the overclocking fields are
    no longer missing. Verified field-by-field against AMD's internal
    metrics table header and end-to-end against a live snapshot off
    Family 1Ah client hardware.

Each patch builds individually at W=1 and is clean under
checkpatch.pl --strict, kernel-doc, codespell and the htmldocs build.

Muralidhara M K (4):
  platform/x86/amd/hsmp: Add HSMP client support for Family 1Ah
  platform/x86/amd/hsmp: Route metric table through the client messages
  platform/x86/amd/hsmp: Add ACPI client support for Family 1Ah
  platform/x86/amd/hsmp: Document the client telemetry table

 Documentation/arch/x86/amd_hsmp.rst  |  24 ++-
 arch/x86/include/uapi/asm/amd_hsmp.h | 398 +++++++++++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/acpi.c |   2 +-
 drivers/platform/x86/amd/hsmp/hsmp.c | 273 +++++++++++++++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.h |  25 +++
 5 files changed, 688 insertions(+), 34 deletions(-)


base-commit: 775f2078b38ff2121410a35302497a1e81b8e459
-- 
2.34.1

