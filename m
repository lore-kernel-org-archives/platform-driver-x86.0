Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010043.outbound.protection.outlook.com [52.101.61.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEA933A9FF;
	Mon, 29 Jun 2026 07:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718786; cv=fail; b=hlX1KpULksW406A3N1uLjQX31h2NMuNgqKVun4JvNtOBqc78Vessw3W7qGwmGYwHn3Xjz76sn20UFN2Sjn8quTQnEukmbVm0eHLv9G2i/V1Sm/lTl/E5ba55WV4z3zThkLd9LRQ+wk2aOiD+I28xm0AAowEeF0d5AE/srOa9+N0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718786; c=relaxed/simple;
	bh=obWIdI5kepmePvrJKXPgMpOY49s7KHLK1E8eh+vSQZ8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KxIQbgN4FeuHfOsskfP4+s3S2Ef7H/6o2PH+pC9GXWekNstLcCb9tcQX5HdFEVOOkLs77eSGODoZtlrFpUnYCkAewAUH6A+D896MJsjDeKgkAS0ONandPv1pMgaJJMUDSv59EnnloUDY1DusQgFJtDj9pynTJKj1FkR9YK40uOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=T4hoVb0i; arc=fail smtp.client-ip=52.101.61.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="T4hoVb0i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KChPYQJNZkkjIZdw1jVHBxv0A4CdspHVS4rY2hiDW9W52Tenw2BkjJ9cqiZmSch8cHvl1DgXFkZdGhhuorDhPTZgN3BxduN9H5LcJlPZUmakCxl7iFBs6RbNUGGIbo/i/OyUAWGyw0QWp/5dyay4AQzk5YbzFDtOxf+FQi8cTGJL9/cEaPtWy0H26m4Oekq7VAMguJZ45ck0rNbkReW2WLHQAavL3NkDaA/5APPW/Sb7yUmwgQLm4CKsGgUBV3Hto0NlhHf1BkOIfV9vMjbjPPfq5oXZoovw0itP5Ujy4Rg6zTigpdhd2L8dMRddxkN4kEovKWd2IIqFEhGwYDlaxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmpFApYzdROc0g9AYOAcm7n6rx4/yRBuyXVfp3gMhTc=;
 b=Sr1sgPzAZ2oDwVIaNKva4AIV19GoajOoNKKL24q0FX/ExeWFjOnv3GP77W5dFn3O4Ho/0x0Pq9cj37vsXAYI7q0YWEDhRRvWm1aWC2olEEkwXBIsQUE/6AZim5+y25qoUrCC0cvbb5QuUXfIlq8fmHMLYhrWoc8R3+niad7AbmEfmsqejBIC2zR4MGTZltHewN8/KxJRTLxtt5VdQSK1iKe9l7f8yD+j7qSjXuRL2MZy6FvAxwf+H/r2KhiizWHMW7Qp2mmybG5vFNXWzileHstdyrPpA2SOSiS7ia+VPyAfYBvFaocnLiM/03neK2Ral6olqgpoNBLItQaXJ1ZTDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmpFApYzdROc0g9AYOAcm7n6rx4/yRBuyXVfp3gMhTc=;
 b=T4hoVb0i4NUejm46I17PPCAQJqUtjQqx9O4igfx0honb2K/73H+mjuB97pYX1Zwq8hTQNamrDzGmjaazSs++JR+hApVpfxhBIL9dsc+gQrn5qK6AbL7nypmUsVsNT5gnVT4UcB/y/0SIBrmnUuLuCjndch7B377G+TDrYC/EA78=
Received: from BN0PR04CA0116.namprd04.prod.outlook.com (2603:10b6:408:ec::31)
 by DS7PR12MB5814.namprd12.prod.outlook.com (2603:10b6:8:76::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.19; Mon, 29 Jun 2026 07:39:39 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:ec:cafe::78) by BN0PR04CA0116.outlook.office365.com
 (2603:10b6:408:ec::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 07:39:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 07:39:38 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 02:39:36 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH 0/4] platform/x86/amd/hsmp: ACPI input hardening and data-plane readiness gating
Date: Mon, 29 Jun 2026 13:09:19 +0530
Message-ID: <20260629073923.1595696-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|DS7PR12MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: 488e496b-f7a8-46b7-3a3f-08ded5b192f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|6133799003|11063799006|56012099006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	Z9TbAwx2ByL/NJeWlyk6VD8Cr80BBaDCY358mL47zeFnqWQF/geX0dPbTIa7PDdWt+tXVfFARGSE3MnrPkoleSvkKbfqJHeK9uLtrsoAK6IC/G7rPvKMDhak1NxGb/6kShopFbzQVF8tVF22nNw8VTAD9VVyZXWOP5aiPq2Qkp4Mym32btH0iKbyFHOucds3HuqAV4lQyvRWQWNq7Jztm7XFu1gdx43rYdpZKm6pZ7KDn44eXbDhn2l5itmJtlgb9bJedyRvgsZ1AuFaKcVZF8JO9ygM85hZNNXyzz20xHGpii8X8POJ9uxrUn3pK0Eln3CKs0HXyf5WUXctWs8WwhQxmVhLssrumaHY9HbXvHMEHJr7Kmpo+KgBnXeQK+EiuL+JBpKG8BS5eaIdOmZ0aPdM3p9KWZymfUx4daIrp2byCHAL828T6chI1eehG4M/rXdxb4dYdEbVsZfbrvLMkJOwCaLP2v+pUgl9jdoY875HfVxOEsKvikjnp7PJ7khzuhbU3Dpv4pfLb8MgAOfj2T6HUDC0H1Qe/z/szfKuzOiX4vm5Q82eYmlJiL3EvkO7zJ11CeiggBAkbYOIn6yTr+JzBB0XeRgnPoUlzudZSunmM3MYfQUrxudzhw0uO5pHblRWkXUI6pZMr1i8QDOwUrmGeLuuG2RFlT9ZZdBjv0+uRALDLuk1R4hNtLR6PwPLdDGLieVIp4LB/LNBVdR0cA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(6133799003)(11063799006)(56012099006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QFcuOdzftGK9gXEJbdKabTIC8cVsJQGgX7RPFab0NSavrahfMBHQ31udVOcE3H+E8gffFab/BwMoXPk0BHS53WaT/MTsDM14RufS7CAlLdReLPeUqSgx67R21rvCS7hyDUa1zFbqnxNOfaAJYa5NW8kkBv1cYYE8JiU9017ifiQkxNgSs93+JJzW4dqQzaLQTTPyDvpGUeiSnEsqyAibE6CW0xFcYoqo6DtEkzFxZZe+DIXqfqpifJN8rElEESPIU7GRW9pYhoI5vTE2VdO+Osi/N6pmILQd+PWWWvzr3DyPn+nMw1mTEWLVRLY0RyPF7WqQsNclR/fxAKOz0MTKRsyrOi+L+y8gblGiWDiIg/WMKaqPauFABELVFWsjfDl34FBRNTaeUEtdjNWaePmI6odDi9A+/vxThyidhaTM54vudl9yLq3L+/0bVq7hzf0m
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:39:38.4336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 488e496b-f7a8-46b7-3a3f-08ded5b192f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5814

This series hardens the AMD HSMP ACPI driver against malformed firmware
and fixes a data-plane readiness race on multi-socket systems.  It is
split out and reworked from the larger HSMP concurrency series.

Patches 1-2 validate ACPI input before it is used:

  - hsmp_get_uid() passed the device UID straight to kstrtou16(uid + 2)
    without checking it; a NULL or too-short UID could dereference NULL
    or read past the end of the string.

  - hsmp_read_acpi_dsd() dereferenced elements[0] and elements[1] of each
    mailbox sub-package before confirming the package held two elements,
    allowing an out-of-bounds read on a malformed _DSD.

These two are based on the review discussion at [1].

Patches 3-4 close a startup race on the lock-free data plane.  On a
multi-socket system socket 0 exposes /dev/hsmp before later sockets
finish probing, so a message aimed at a socket still in bring-up could
pass the sock->dev readiness gate and dereference a NULL virt_base_addr:

  - Patch 3 is a pure refactor that threads struct device explicitly
    through the ACPI mailbox parsers so they no longer depend on sock->dev
    being set early.

  - Patch 4 publishes sock->dev last with smp_store_release() once the
    mailbox and semaphore are initialized, and consumes it with
    smp_load_acquire() in hsmp_send_message().

These two are based on the earlier submission at [2].

Each patch was built individually with W=1 (no new warnings) and passes
checkpatch.pl --strict and codespell.

[1] https://lore.kernel.org/platform-driver-x86/b723da76-6309-0cd4-59e0-5931231f585d@linux.intel.com/T/#u
[2] https://lore.kernel.org/platform-driver-x86/20260625123337.886435-5-muralidhara.mk@amd.com/T/#u

Muralidhara M K (4):
  platform/x86/amd/hsmp: Validate ACPI UID before parsing socket index
  platform/x86/amd/hsmp: Validate _DSD mailbox sub-package element count
  platform/x86/amd/hsmp: Pass struct device explicitly to ACPI mailbox
    parsers
  platform/x86/amd/hsmp: Gate the data plane on a fully initialized
    socket

 drivers/platform/x86/amd/hsmp/acpi.c | 53 ++++++++++++++++++++--------
 drivers/platform/x86/amd/hsmp/hsmp.c | 12 +++++++
 2 files changed, 50 insertions(+), 15 deletions(-)

-- 
2.43.0

