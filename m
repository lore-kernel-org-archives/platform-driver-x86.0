Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011022.outbound.protection.outlook.com [40.93.194.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A6823B638;
	Wed,  8 Jul 2026 04:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783484676; cv=fail; b=lNBhZeNT4eM5eHymdtsL52lGvUWhKf2Qw74npHEQ+6YdLoJoK+YioxNpydekQ0IiAT/MelKbOFPWi6yd3AhMcA29hoVd2FIhR5rOaO0mOM5ksKYLpsPZ1YIF1Yhn9TA+LQzHno/Z/D8GQ5qtRzmVO6vLoYJqgHtl/ppJylm4Yto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783484676; c=relaxed/simple;
	bh=s0iikXrRQjhyv3U5kepyTvE+F0EUvmP+UdOfSExjhBc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qAiEFIsSjQQhsP2OMRM/GzaGDJYNhQX8hx8zMfpbHriegF2V2rCJV/okMTQKq5Ac8WpgW527GvklWXCCBi4zab0A88YtitlUVUgqFHjE+uBzqfYEpGkTDmhFlPO+7sQGqqvTDUvM1DbOSNjGp6fUm1esDvt/ITmO+9IZsGIvTmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nFNFOSIN; arc=fail smtp.client-ip=40.93.194.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nFNFOSIN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMYTXBJwjJN8UJ8N2mk66WOUF28bHUkq7QrT5YUw7p9rzCd8Qgc3hzkay3k87/RbBhhF9kAdMqgveagHsPmjtPureNHiMXqMnlWyuPNOao18XR8aYaMVpT2fthqa906M0FYNNNMM9hPlZVfwr5HuqpPCRod0V6/J7aCYIeSvHZWT4h++8YEwLQxZAn3qOs1rFFHRWTkQ9REJOPrh4wmt93os5pPkD5uMbGYVW5dpuBKhu026ZAzdRnLIH3Jvy7jh9wrpLiS9tMOlVxGJayTQlcjNpqCKxy0W+nw/sAys2LPiIdiLXWtSdJgj3R9zgdUTJ6Q5EUmIIQWqPjB0uGhntA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUZbikrMWHOra+bdxq1pxSGqvQ7HiooZpeIoOw3bKfs=;
 b=xLgibRGhD5Nrj/LAQYsI5zfbWTpqoQnXIR+XEy0M9LvJfBFVrFZiWfHTD9kCMecyB9Ahir10ANmIzNL9BapaW1dRUHjS/mlD6PgD+ePhdjHdDqR9mgPu11jsb6yCjxTbP33b8cAthV4E8t9TaK42ilcHsi9OXIkRWaQSGRc7ytNm55q4AjLR/rBeZlBDiRH56S4lbM3RkIbVTh+Fpop1vlRXvoHoS907ynAwxle17FN/bUKORHgR/Qnz0uYySo0PjA/PGLRZXKP+jWUPP4H1iuBueZ2/a2wZKf/xd9zJZhwEk7hXKd7PB3PGf1rsBHXwrpGVXEXXvtNJ6cnPirZLCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUZbikrMWHOra+bdxq1pxSGqvQ7HiooZpeIoOw3bKfs=;
 b=nFNFOSINPphuUSSZjaaEl1etYUgdOHhYWOMscsRRBfsFJ7BbAxZQKD20b/HkoItgjRy1Yx+VlJtEY93ibPTdeZITCJqUrd8cSLYHALOmnO9FIzgILVwrAQqz10klQUdzZn23Qv/CbEUiqaJId+gye0zHcAnLYwWUfVp61RaP5Nw=
Received: from CH3P221CA0030.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::31)
 by BY5PR12MB4193.namprd12.prod.outlook.com (2603:10b6:a03:20c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 04:24:30 +0000
Received: from DM2PEPF00003FC6.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::4e) by CH3P221CA0030.outlook.office365.com
 (2603:10b6:610:1e7::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 04:24:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC6.mail.protection.outlook.com (10.167.23.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 04:24:29 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 23:24:27 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v4 0/6] platform/x86/amd/hsmp: Serialize the data plane against socket teardown
Date: Wed, 8 Jul 2026 09:53:59 +0530
Message-ID: <20260708042405.3758294-1-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC6:EE_|BY5PR12MB4193:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f98cde-7374-44d2-b344-08dedca8cdcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	eIJt28k8Kvc9X83QbzAgwd+xydJULAfM16+8BiXL/fiPk1j/2PwU5X37fXJpHvP4ecfDv3L91zjFJIoT3+iana8iUqBbw4Wm5YKruhzVDiaaWrvbIhYsx/YUX7OkFgOm9L5tss41D/UWqmO5iB/aLoXComOisNelhmtgdoMgW5/66xnJvUpLZVKy7FHtRrwbrq3kCkYJ37CnhT+S4I+4+BTOGlVjZG/AJifxaCWm3s/Vhl6LgoKSUKpgQMPLVOkiQDPDJpStmwT8PYCb0wHZ65iHLNM/BLEPu6AxIvjp7caA0Kkl1qgqliiAYh1ed8GNIS8ddlTC+cINoizZgM3q6LSgKcrYdubv+75G0pIHFR/KECbQxvoaPIW0tS7A6u9K2nvtUhXj49Vxgj8/UgrYzWKGe7gs2w91jBWi+s1noB94eJSE4xskOjgknv6VxRrjOo7RBiqReaEtYRD1Pl0wU9V36XQR/iZz70k9k57oi+jG+X3NeJCG86B3DriLuJFOVH5sp9wkQkgLpackGTCZe/H9utteZP93ald/GqHG85uFhweldJG7nPoAhV/sdxxnwFDywEFoTqYQFjZh8YM+r0jQVJwCCKo429K6wS5jw+4mJTzOieW/40HhKpeifBZmAiqAigtXM614oplRSh4byImcjkte3rs1241ONX/cR2bHsHxbNRU1dGZdB1ejqVYANjVTAvGqy0i+Vo2l7tSdyQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ARcPCrtdCOTPsNeByyrFlVCwNO+PPzUFN98cProWOa7GW59utuuG31vcUAxwU/J+d2LwBEoLU4sO+kvYUe1ReSDatm4MFU7qcj0ekRlsu+pVUX3YIkXpU/0WI3RqELdaKIINTpjiSeB7uWYP+oWnja7LbvEeONVyvhD6DyDWE1aJoSDgs2eiJ0KvZUm01ngZhlQQryGIz80inweqBfhq55nM/5QLMZiwrT4NjLp7HUaqxif/OcmtE7hip9SUUO+6zpfIuYBTt1n6SLlB5ES0BFywc55xxa9OvHg9HIcxZdTBmSrkMJrz+LfNF1h7bbSc6x3AwbHTkIIyprj64XRAvx3Ljsrht48zDkkLThu5Io1EsRTdozdR+XCh1xfu+RtWrLC+n5079w2UgAh/aRQH5IiBLvbGP98nnGJuPX4etQyEADxdZSrSHdYrY3ibsq3G
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 04:24:29.7808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f98cde-7374-44d2-b344-08dedca8cdcc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4193

This series makes the AMD HSMP driver safe against concurrent probe/remove
of its per-socket devices and against the lock-free data plane (open
/dev/hsmp fds and hwmon/sysfs reads) racing socket teardown.

The ACPI front-end binds one platform device per socket but shares a single
socket array and a single /dev/hsmp misc device across them, while the data
plane issues mailbox messages with no coordination with driver teardown.
misc_deregister() does not drain already-open fds, so an in-flight message
can touch a freed socket array or an unmapped mailbox on unbind.

The fix is built up in small, bisectable steps:

 1. Serialize the ACPI probe/remove handshake with a dedicated mutex.
 2. Map the metric table with ioremap() and release it via a devres action,
    so its lifetime is no longer pinned to a single per-socket devres scope.
 3. Serialize the per-socket metric-table fill-and-copy with a mutex.
 4. Clear mdev.this_device on deregister (independent hygiene fix that the
    next patch relies on to track /dev/hsmp registration).
 5. Track shared socket ownership with a refcount and a single coordinated
    release helper, drop the is_probed flag and unparent /dev/hsmp.
 6. Add hsmp_sock_rwsem: the data plane holds it for read, a teardown path
    holds it for write to drain in-flight messages before freeing the socket
    array or unmapping the mailbox.

Each patch builds on its own and the series is checkpatch --strict clean.

Changes since v3:
 - Use guard()/scoped locking consistently for both the probe mutex and the
   data-plane rwsem, from the first patch that introduces each lock.
 - Platform teardown now uses devm_add_action_or_reset(): the metric-table
   unmap and the per-socket mutex destroy run from a single devres action
   instead of explicit remove()/probe-failure code. The ACPI array is shared
   across per-socket devices and must outlive an individual unbind, so it
   stays on explicit teardown.
 - Split the mdev.this_device clear into its own patch (new patch 4).
 - Drop dead defensive checks: the !sock guard in hsmp_unmap_metric_tbls()
   and the if (sock) in hsmp_acpi_remove(). Keep and document the one in the
   probe-failure path, where sock can legitimately be NULL.
 - Replace the !--refs construct with a plain decrement-then-test.
 - Explain why the probe path uses a separate mutex rather than the rwsem
   write side: the probe path itself drives the data plane via hsmp_test(),
   which takes the rwsem for read, so holding it for write across probe
   would deadlock.
 - Comment cleanups: drop history and "patch N" references, drop
   parenthetical function asides, single space after periods.

Muralidhara M K (6):
  platform/x86/amd/hsmp: Serialize ACPI HSMP is_probed with a probe
    mutex
  platform/x86/amd/hsmp: Map the metric table with ioremap() and unmap
    it explicitly
  platform/x86/amd/hsmp: Serialize per-socket metric table reads with a
    mutex
  platform/x86/amd/hsmp: Clear mdev.this_device on deregister
  platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinated
    release
  platform/x86/amd/hsmp: Serialize the data plane against socket
    teardown

 drivers/platform/x86/amd/hsmp/acpi.c | 135 ++++++++++++++++++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.c | 107 ++++++++++++++++++++-
 drivers/platform/x86/amd/hsmp/hsmp.h |  15 ++-
 drivers/platform/x86/amd/hsmp/plat.c |  26 ++++++
 4 files changed, 265 insertions(+), 18 deletions(-)


base-commit: ff7836fa850c2f815bc219f1e48f6ec8699f4ae7
-- 
2.34.1

