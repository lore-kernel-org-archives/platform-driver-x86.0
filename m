Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795506762;
	b=I8IJbn3LUoVA05gK5U7t9Uho4YtXd136/EwYTnk0XZz6BdHxlNUhRQZiO2e7voO8wCrC
	 QgSg09N2pUu76OOQ3IFNoKg1jwHW3cY7Ti+cznBRTsDkdCMj/o9lufb2tQsF1GjgLfFnX
	 4xnEYICxZMiZS0c+agf+U4XTeiq1K9D+gaQiV3CHrURhts/Kj5ZG+6jkan9UGXJLKmjDC
	 cHc8PdKkODhB6VGZcvnNcF9K61j0LMQQjBk7D0Ow9EnZ95Rj9j1Z9AmMg92bgYZWFafB8
	 ZIswjgCBBK3gz0ZqfeOKQKhD8N9PoDlQZXnYPjkSIVaqbX+dOt35P7pDLmgxn+7X51Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506762;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=akduhlRLMqFjeZBRyHVOER9u78BJJMv8rxchiruE9h0=;
	b=zA3QOdlav+GvTlJZHIoC419vFuwTgffO+Nkkdr+OMBbwvwJtI1ULjmYRiDgccfZyHYQF
	 3OWBeWrqleQsaswGhoZBQ3k0LGpgLlonim4n+Nbp7X+vg+ty31FUsu5U7psS+AxXZIr3n
	 4wX4k1blnxh51Ds0WTC+84ETrn7TdsLs8UsEkQnm8JHrHRCC48yGprIOWU+QePq/b2G8s
	 3IbocG8e29+I+HAclWq+s3E4MC3/S/6aZrCyIz8cu5NSOMaq0ywW0I/PwZFVjc0blov0E
	 uN1nm0BR9a1ZKGHD40T0hSFiSE1xqbP150typHlu1OrNLyO/F9en7G9NRDTj5IAqufw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hOlYmYAL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.33
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012033.outbound.protection.outlook.com [40.107.209.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF81D606A31E
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 07:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF81D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hOlYmYAL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6HCxIFr6eQyThyFuVW+Dfs12YmRH3v+aNgBtE+IkHTBHS8Py79p40M7BBEgsMrzKyZnGtMd/LEBWZm/qE/KBX72yppsDUzBJQkxgpRzGM1/eBB4/Ne9D5V6x7hRmAA7F/yVMpZrAgCE2LTPRWPjTM/lgeAwy4zgdHVX2TQz9oh2oxNbSt0qwgRvHotmy80Bpm843/oQzO6rg0oyWSWTebnQnG6OQml6HNFfnwGetTgzzxUxAy2ceh/GneZHwCgrpVCG+HMMi6WDMGgHv6n5jGkCZF+KqhYu9ZKqt6nkY7e2dnRKSzpJm4Xmg3+XiRROIqN51pcclUz0cyiH4u4Ytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akduhlRLMqFjeZBRyHVOER9u78BJJMv8rxchiruE9h0=;
 b=wMCwYPIu4cPdEtOK10jk0Apv0GKxK7FOJA4qE/wSahBhu7APRG3fHsB/H6UHhUX7dyZ3UjSGu3UUA0tNM3sgMaT8H5VIxZpryOxoRPBpngEOTwobEXC+kwTAFP8m9gCZQ079gGk2DAkkZCBnZG8oljromIzSPufObFXDyLKr5WLogtnRNfhRvoMpFd+bOdagUKTkjIyI6AhVhp/lR8fvPvgZV9Pds54d/zzsNEl6XadcfONLTxogKY1mYF+2DWwQYcWDMHBRQgwjKZfSiEerNvgmqk0v0EiJLn3f5Pv8sg4J7cFGXcn1kdy9YxRmAacDqwaNjmnZOEJqugaFLyn2fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akduhlRLMqFjeZBRyHVOER9u78BJJMv8rxchiruE9h0=;
 b=hOlYmYALqVL71n1limZf2Wr3QTwFiY4KFU7u2GSVjJoXuXWASfbLiClDrMvYT0OED4WqD7HMxPBL4OhINl0ZtM4cHTSU2WIhaFXen8h2K24BOnAsQ5ixi+gZh7JAjTOozTrPkCk9q3+slkE0h12F3YadHDcBlDYjRpg8Ft/zYTc=
Received: from PH7P220CA0174.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::21)
 by MW6PR12MB9018.namprd12.prod.outlook.com (2603:10b6:303:241::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 07:52:37 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:510:33b:cafe::4) by PH7P220CA0174.outlook.office365.com
 (2603:10b6:510:33b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 07:52:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 07:52:37 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 01:52:34 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 00/11] platform/x86/amd/pmf: Add 1AH_M80H support
Date: Tue, 24 Nov 2026 13:22:02 +0530
Message-ID: <20261124075213.2317127-1-Shyam-sundar.S-k@amd.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|MW6PR12MB9018:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d29ee55-c9e2-47b1-c065-08df49ffe859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|10067099003|261026121527099003|11063799006|260925021311599003|260925021911599003|260925022911599003|261026140227099003|261028144727099003|56012099006|261009223027099003|261021121427099003|261102123227099003|261022105027099003|261021123027099003|18002099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	zPWjoK59u+OHGSSkfQIK2/Ig/p+sOjJbsWbrjaznjDI/5xRzpcOLXla/uQ+Qfe+f4DVM7WsZFfeDmgBe7TsLtWXXyb4iRtM1jQsEnJ4d8sQpZXUyJ4A35vyFf2G9H2stbJsJ2rC/Th4GVP81D4OLkp2N4vWojPThunOZFOGzIOvYqT34yi2extKS0igJPcHMfbjwZ+dv8SwkG4RKfLlD8a2hMZfurKaI8Sg+JkyKwfNdr7kBf+jOB5gemrwx6p0oRdRmZuPzWvOATegu56qDQXjJknjldyhRM+rtQEv8IJ5NXNi0d5K5cz9bDhd2L5MfazK2Ji2gXy703mNWANuv6NL554fvwRY/0ENVTi+S60bzL6VRe0xAQpzlaJjyfWqk6vc+Ym3Hn23d772P/d7WJQciXmxzL3CIdldBmUHzrpepqmHP1+rnh7XIMCd1c/YElcKcCsFgnadxYP6gJD9B9EpA3h8ZTQSk0OPrsfI/7Bj/vPcN+zcUm08PfBlylj8KTjgbfgrX/k79fP89bKdpkgKxr3H7wqck+guPMVZBw9sYtBd7SiMHmVTej5jaNWgtBBzi+3LngA5R2uPdfev4GVxZ4lYuJc5/IxuQV+KaZ2p7vdl52ZVgazCovXZWS891uBZMVvwj20AL/aK/T2RNxkXjMSOJn9Q3F8olWisH27g=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(10067099003)(261026121527099003)(11063799006)(260925021311599003)(260925021911599003)(260925022911599003)(261026140227099003)(261028144727099003)(56012099006)(261009223027099003)(261021121427099003)(261102123227099003)(261022105027099003)(261021123027099003)(18002099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iJ3rwiZADFHv9PRrcGPuGXw7D3yDP2Dw/MW/FeJoU4VCvESuD/KHH0N3FeSLPEIdqwHq2UHMIk9XUHlo6e4zpZO/xPH1PqKs2LA+58c44SNcaQY5/UaIHhZQvcFcLnpOEHmV09cQG4tVecDsmvU5d9pZR89gsik096gAhg97e62icjC60Buq3aDdv+GfZv9q4h6eGjzrw0zI18BETxQtXt1xz5fZ3npEtNzPhyw36u1MkIGQ2mvEoODle3qCdHRU5bxeQhqgHHJ0YINoO8IyDkHfw3qyj3QzoCo3/eSTH7cXapHTjPZ145DA2yeMN10Q/3OfqW7ydunIjWMt0NC+a80ebczO1MI2OxtDNoZO70W8AIFDOID7WPI2b0GvnFON7zzeWUyZnX3p6NY0Sw7b8rw1JCwXYtE4DapiCgl0prMNHLYQR4yPi5N3myZZmM5y
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 07:52:37.2289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d29ee55-c9e2-47b1-c065-08df49ffe859
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9018

This series enables the PMF driver features on the 1AH_M80H platform.

Patch 1 stops sending the legacy DRAM address commands on 1AH_M80H.
Patches 2-3 move the static slider handling to per version ops and add
the 1AH_M80H static slider support as per APMF 2.03.
Patches 4-5 add per-platform TA ops and the signature size handling for
RSA4K and alternatively signed policy binaries.
Patch 6 uses the system state enum in the TA policy action code.
Patch 7 adds the Smart PC builder support for the new TA.
Patch 8 remaps the metrics table on resume.
Patch 9 passes the custom BIOS inputs to the TA on 1AH_M80H.
Patch 10 shares the TA policy apply code between the TA versions.
Patch 11 extends the custom BIOS inputs to 20 on 1AH_M80H (APMF 2.03).

---
v4:
 - Rebase on the latest review-ilpo-next
 - New patch 2: move the static slider handling to per version sps_ops (Ilpo)
 - Patch 3: add the 1AH_M80H static slider support as a new set of sps_ops
 - Patch 11: add apmf_get_custom_policy_ext() and read the SBIOS requests
   through one helper so that the event handler has a single path (Ilpo)
 - Pick Mario's Reviewed-by for patch 5

v3: https://lore.kernel.org/all/20261118143034.3566684-1-Shyam-sundar.S-k@amd.com/
 - Rebase on the latest review-ilpo-next
 - Patch 4: also handle policy binaries signed with the alternative
   signing mechanism
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

Patil Rajesh Reddy (1):
  platform/x86/amd/pmf: Abstract static slider handling through sps_ops

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

 drivers/platform/x86/amd/pmf/acpi.c    |  32 ++-
 drivers/platform/x86/amd/pmf/core.c    |  38 ++-
 drivers/platform/x86/amd/pmf/metrics.c |  16 +-
 drivers/platform/x86/amd/pmf/pmf.h     | 328 ++++++++++++++++++++++++-
 drivers/platform/x86/amd/pmf/spc.c     | 210 ++++++++++++++++
 drivers/platform/x86/amd/pmf/sps.c     | 181 +++++++++++++-
 drivers/platform/x86/amd/pmf/tee-if.c  | 261 +++++++++++++++++---
 drivers/platform/x86/amd/pmf/util.c    |  83 +++++--
 8 files changed, 1057 insertions(+), 92 deletions(-)


base-commit: 61c0dac952b9308884936d05cce97565a5c89af4
-- 
2.34.1

