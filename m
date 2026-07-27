Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011051.outbound.protection.outlook.com [52.101.57.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6DE20E023;
	Mon, 27 Jul 2026 14:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161768; cv=fail; b=Lj4Pq2NlsFjrs5dbDXQBEqhqG6gi/IuivFVy1Z0s1lQyVjnFaWOdCHyaAZHuFz3E5fLLTTJB3U5FT25p+7GfRA6xEGIuRWEuvzoFtcjJ/KEy00zy/yytgnniwTKtlGMNDTR7YUNXsTPwkKl4n6itIuAhGoivSGjw/6kXuLUTWoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161768; c=relaxed/simple;
	bh=3AE8aTnd0qBiejAIGI1Vvb6Pb1Of2y2jQhdRvQ0Ge40=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X+1ZyrNI4Nhd63qwdDGA4zbx1yzzqgwxO97keklSzH0umyKXsHt77FRW9DrG6mgs7MSkI9arEwPZ4/bSvXn7W1Ve1+oRAqal3vU+3Cu5EMqprq6b0iXv0EjZL7S7/O1B9Pk6+R3pYelgDQc4CLd5rV98tL9cqNh77JoZvDKcEdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YYRPi1CI; arc=fail smtp.client-ip=52.101.57.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YYRPi1CI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFdfLjpAJ1S0C+huSVUfTEa5Vt3WSj5QYhGI8iL38EFwwLWZUm5Z+rzzKoZlta7/8uX91X01+P1/x+l9lZB+T6rnb2hwjSb8ikfvba6MKYDTmADQxwXOtuRMNWRNmh+osMCxVottSpNSe+78gaYKdy1kib6HEe7pbGl7WxHnBH3/kzjHt0/cSG7fI4p5CtLsljGVSlOWo99xCyitjMeuHB7X8S36niwqsMKtzATshlK7a6l4wfKbMHS32T5+VCClgBAWRHfdouEkLfwXgxHtop7UVVeySkUEdlyYILod8Ndl0xapI9wo9kdwo3NR9FGTZ+TgS8WmslAej8lz1SWf/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgGUvHW+lBAyWM/uw2u9nOJtW2LsAdYK130azd9W2JU=;
 b=O0Lm8skDG7f9P/aW2urYxTUhAHwFtJV1VqsnNl4sqaQDP56bvEoVIiYodzGM10Hn6QmyB8lBFWDz6OXdNMsb2CvR77uC4I6Ge3gr6XjdD1vMhA+rSR6288o0lG6M0JFSAfyk/i21xUfhdsQoNdtLigpoetZP67NFJlBME9E36jGi/lYqntvuu9KBLANbVSpECzJPaN96Ief0x1VSoUVV26jz+vy6ThjknjAg0ZYP4vQy8c5L0iV64t9adO/dHhrh38Q3aYIQltBxW+h+up9lhYaIilFZulKdVbQjfZR2wW3YobsnJErW3o4FqhDVu5Eju9YkTrdn8Jf76cr3MoanUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgGUvHW+lBAyWM/uw2u9nOJtW2LsAdYK130azd9W2JU=;
 b=YYRPi1CIsW53ZB7K+1VDn6Xw20I/RuckzH1ISumYNTJj5akpoenS339D5c3cjpg93yZQ6qAXN3kUTwMgUn8uENhLivnPiD/opoYW0pyPTk4E5yeXX93VKp/tcYf8DxpTl8oKR4+82EieVVFsoSfMPCYC1kaufp0Wvo4eMDsA3Y8=
Received: from SJ0PR13CA0078.namprd13.prod.outlook.com (2603:10b6:a03:2c4::23)
 by CY1PR12MB9560.namprd12.prod.outlook.com (2603:10b6:930:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 14:16:00 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::60) by SJ0PR13CA0078.outlook.office365.com
 (2603:10b6:a03:2c4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Mon,
 27 Jul 2026 14:16:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 14:15:59 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 27 Jul
 2026 09:15:57 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v7 0/5] platform/x86/amd/hsmp: Family 1Ah Model 50h-5Fh HSMP and metrics
Date: Mon, 27 Jul 2026 19:45:37 +0530
Message-ID: <20260727141542.3370108-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|CY1PR12MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: 517b6f99-b9ba-4c07-1bbc-08deebe99563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|11063799006|56012099006|10067099003|6133799003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	bJ+JgcL12Gv5dA+w/HOOUQadgyaz8jXOWVVi4NS8RXkpy1veWOwc16O6AwIsojdnzniWTbcSwgFzwItVdkkluLGDexpUte3jfgS8ZOru74EDVmAucplNQBeMl06IFmI3mx2osJNx5VlmChhFuPkuIjMc37LcPBvib9K3tmwobBtxFe2/CDpUcGAte5xf4ZmBBOEKoJ06drdhfjtFJB90AuGI10ztCQZJuGO6BE9sUlV38VVVbSl3l1XLOamMSGahB358PJlSYIwERcOPK6sgdD4QxoicRGmlwKNokDmlqBvWXzz+xIJ5QNrRE0jtVtHwaPrKtZKKOjpSEsdb7ykjYYoHcnbHSo8RkYHAo+yLXmp9/RooCZT64Mxl6rW31fGP6XxT058oRphSklpzobwsfjZIAMOAntJ0E90n+xo4AIyv/zivyomz4UdmZ43fzQ/nmX68t/w3xy1n3bwd0kf7p8bn0irPyJUojWh9b7ejRcggMUz/jSXVpbrgXhahwEHD5psj/K5Ly5IFpZYR8Kow1p6ufIYY2i9IejCCeHn0WlLfjAHeMZ2iYAnzgjzVsDmnDhRooNHqIfTUiwp5iWjBLK8qdZz8kqq35jmilKBs5bXYTQeAIwuQU7vwg9LRfRgWpTDm1BhBiGXo1lFU3OgjvzzrgFBJrDb+ESIrWwWknoopJ9vO4f5q/dRAoLqbn6RE8W4lwN9x4jY5bd1Xe/qbpg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xLtdY0BxLKkVZh8FrULkwhX7GN/KHfyapcUHj116RxAZlO6J0dkx5lUv+h5KD7ZUe+vEXI2NEMo4xHm5+eudWWmkg+haOCiag3aXRtIpvmtX7hzCERl8NbUQOU8XqlpQgxFyHenALnqQcKN8cORRRoKDt6sDivqGPO1+Bq8BIWLnSZHRDIKSQSgfAHKJ7tySRHFU/cRjWCtbm2MSECvTdhoJXlFFgst5JN6UKyzj9Iq3iNoQcDNicIn0ST2d9DoDKpL4J4ytrzYI9sf3Kxwv+Ye4wC6mNFg1A37fV8wAI/7JF3g1NUxmeZnRZKgb2YvlxnwMth8FqgLULlr6+69QjLxSY0B9kEL8Tso37U8/WdKwQ/pfQZNzC/IbmB9mOfWWgcSvlSM+nKVKyhXvxoGkANKVAVmT0ajH/NTVYPNt1l8oddakXKT/D+S7pDWoO8at
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 14:15:59.8137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 517b6f99-b9ba-4c07-1bbc-08deebe99563
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9560

This series extends the AMD HSMP platform driver and UAPI for Family 1Ah,
Model 50h-5Fh: new HSMP message IDs (including the PQoS-related IDs),
relaxed response_sz handling against the descriptor table,
firmware-reported metric table sizing for ioremap and reads,
HSMP_IOCTL_GET_TELEMETRY_DATA on the existing character device for a
single-shot full-table copy, and ACPI enablement for protocol version 7
tables.  Documentation is updated in Documentation/arch/x86/amd_hsmp.rst.

The motivation for the new ioctl is that the sysfs metrics_bin path
cannot serve the newer tables.  It is a file read, so userspace can read
it in chunks and observe a torn snapshot if an SMU refresh lands between
read() calls, and it is bounded by PAGE_SIZE, so the ~13 KB table used by
protocol version 7 on Family 1Ah Model 50h-5Fh cannot be returned at all.
Rather than extend sysfs to lift both restrictions, the metric table is
exposed through /dev/hsmp with an ioctl that always copies the table in
one shot.

v6 submission (lore.kernel.org)

  https://lore.kernel.org/platform-driver-x86/20260612042610.1629037-2-muralidhara.mk@amd.com/T/#m2fd6e85bd5fda3cf66fbdee3d8e34ccebef64dd3

This series applies on top of the HSMP concurrency series.
The series is bisect-safe: each commit was built with
  make W=1 drivers/platform/x86/amd/hsmp/
on top of the previous commits with no warnings, and
scripts/checkpatch.pl --strict -g <rev> was run on each change
(0 errors / 0 warnings / 0 checks).

Muralidhara M K (5):
  platform/x86/amd/hsmp: Add HSMP messages for Family 1Ah, Model 50h-5Fh
  platform/x86/amd/hsmp: Unify response_sz validation to an upper-bound
    check
  platform/x86/amd/hsmp: Source metric-table size from firmware
  platform/x86/amd/hsmp: Add IOCTL_GET_TELEMETRY_DATA for metric table
    reads
  platform/x86/amd/hsmp: Enable protocol version 7 metric tables on the
    ACPI driver

 Documentation/arch/x86/amd_hsmp.rst  |  35 ++++-
 arch/x86/include/uapi/asm/amd_hsmp.h | 222 +++++++++++++++++++++++++--
 drivers/platform/x86/amd/hsmp/acpi.c |  22 ++-
 drivers/platform/x86/amd/hsmp/hsmp.c | 183 +++++++++++++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.h |   5 +-
 5 files changed, 428 insertions(+), 39 deletions(-)


base-commit: da97ec927e4441fed07044e3fed59763d7e07c3b
-- 
2.34.1

