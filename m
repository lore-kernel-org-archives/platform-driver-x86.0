Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012007.outbound.protection.outlook.com [52.101.43.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5CE360EEE;
	Thu, 23 Jul 2026 09:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800042; cv=fail; b=LmuUkF7HX+wDo4EgGUHffEqVlu1MLXawPa5Fe4SGOYhy1EjtqtQCjTlF28z2Hr3cZnp+Kuy4LLwOng8uujaPkIiaDqDFsmFFcGbXlBWsltzgv8pzsg4M5k1DJXlO/aVvnPKZOhsiN0cTTZNTbGHA179hMymZ/eCO5USlMNaWMcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800042; c=relaxed/simple;
	bh=7RZY9QgxPc0trq606Y5mLOVyg8DhAm9zJmPH+jMe5Gg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W8Hho+mHiQEkDLQgaabrJ/1qpm1jWioD1Oe7bmK1RSYASMP93w9EGa+UOxlHk6RsDJSiVg5ts390sfwI+lQUOGxkGjymNX5/eYoyNpfATIB+EdrNs88zvhxkVWbX+5h3zNx6Tf9cmg7am4nvqqsi/N0y8KWoorp8Lj7ZnTNlZJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JfU0YVrQ; arc=fail smtp.client-ip=52.101.43.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JfU0YVrQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGz395R+taiulZkZODQKxigyJ2wiT7gq6gVXwLGcbYT1VBYx5oHwOHDj0GB4rCu9PhQX1o+yfFv2q9D1bEBL/4GH85mikf3GXB1Gmlq/kKhmBDW+gzDZP7ByU4ogJ/Tv0X94yCUB8teelp6umiJ+aRNDWkcG09vmZM2/xZ/vX+zH7aNK1SRxa7KAEnP0r9mMzW7HL029pGDzfpMN1vV7H3nsj0iKjDKVlnxzzlkhslsEufBFXr/yrM5KOUzfGxeWLf9u8iVeS0ZA3/d3gnUkbCL/ewd9JG526FYFk8eJNJ7CH9+d50dPlwc17fEJHeg4OyTYdQQk8uA8m9vBIn6+eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kegfuxj/qFbpS53fmgb88P4JjdwScy/QwQxpt8iP2Dw=;
 b=wgOv6hgxyIx4P4qaz8xb2tKwACqrbZgqqBu94o4jweyEgqmkjFuiw7grUsRKVltyEN8KZhy/m34LuhxQFAQmlCb1fhi7JHQI41WhnGP1doIF98SgFWq1BIo5RcFQIsCa8BiCda5UMoKlS/l+x9xwQB4nprnERcxuS2lAVLVaOhsuBLH7GhiZVD+enTmAMnmDMDuIkZL3nNSdS9Iba/6bB5pmQfCXCosZe/Jr2UBOTwsxQv4lhiFAMF89LOXBwwq6tGQxhN4sBstBiCKLQXodYlHaZmtV26yG0sH0+ba193gVBM2ToCZPCBotu3RlJJivx6jwEx5mK00hpqnSitPVHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kegfuxj/qFbpS53fmgb88P4JjdwScy/QwQxpt8iP2Dw=;
 b=JfU0YVrQYpp/1Ft2Hh8ak4Zf/5SCu4XgDID3VGyVPmXvKERQ2X7hfAwGJfZ6HyJYFSDBVgaswtos5PG4wMZoNOnYrzzSBEU9fMJwGq2Na95xMpNjAI3RB+/X6+jdyBvVuaVMk3D9do9Bco+9wcctKTvZYJsvZKkCUkxclBhb9Jo=
Received: from SA1PR04CA0017.namprd04.prod.outlook.com (2603:10b6:806:2ce::22)
 by SJ0PR12MB7035.namprd12.prod.outlook.com (2603:10b6:a03:47c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:47:15 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::58) by SA1PR04CA0017.outlook.office365.com
 (2603:10b6:806:2ce::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 09:47:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 09:47:14 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 04:47:11 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v7 0/6] platform/x86/amd/hsmp: Serialize the data plane against socket teardown
Date: Thu, 23 Jul 2026 15:16:50 +0530
Message-ID: <20260723094656.3806028-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|SJ0PR12MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: a8001e11-ab3a-48cf-2024-08dee89f6064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	z1sWfsGYs1esnVwYtYsr916D/PXXti87MYP67BLRblI/Azh5d/2AMh18lnjS80PhXetrIq9oDpCremz95crHpXNCdhHnQALI0VEa7TGiHTozc43B8EgvXJyBTeyoesSHNLjg7ARQ3q8dMpP+Ai2fIMsHBYnBA+gStmLjhAzHtU4RPuS6GYL+sMERXfTxhX90qq3nZDqW3jmBXs1H0klgbrR1Y4/Tz+48zg0QfAdK1cB31aprlG4jNh+wNssnXp9G3rMR9/jkjN84fzNvqhLimMeUlDsSXP3HlptnccXsPcRwv/JPNmShcX7Ouay5z3Uoox46UuB3UirGdQQu8IyLiVO03Lkh7d/5ycLrvKbgJPAIJcIHoLu9UmcdYHEn0WT1/fzRA4lhXvDpz7lw9545zGuxgystnWJsYOWC5EGLsUsjODJAqWjWpWsc5qs3zD1ETl7+ciKRZRP3iHHbUYIB9I/i+E8KRY9QcoUgUh8r9/p+9xEsyLrLh6OmdFky1wi0V5IBAtllmU5tkyvnufTbDSIaXAOueHNkrS5okR1RQ6QGWfFNhHjLtsC0IKcmVooUSKBFdr3BIT4vTR9o5n9HLSUayKh2KQIO3TlBHjWJvofRIDMYbl5lcHUk5/35+SooG4dVI2cOCFFyzy/5rz6Qc8rnL3gfsfxFTDszaOhGstOrx0s/EbwbBSx+cyYSSx7c6QLiD+8FIkgfjsSDK8WlrA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9kCHtZeOPOgjuNlFl4ojoHz+M6qYL4IJCBrBwXeAJja1Hw7mccwWTu6wsd2/l8RX3IpnkacUVsmBwrcZlXmne9Rkv+YNjuX82Cm9YFhMlLk/fMvEox9ATW2OXxLTPHDZ2Qfg5TP9o3e33qflimLH8RRJ5n70EriLYiggfwx9eYppE+DmjEjw3Bh5F+CJCBV8uoYpUxnPgbhfrxTT/stsUNoOhiZq+vrp0FBNQQpaZ3/LG9i/IdaM79hMq6kjs8z9ldaht/kG7G9b1MF8CZ6cjO1d5abOCyCVQTjcUcE2W6FrylXJJkW9gvn017pGLzB/WelyFpCxwFZc4C3TF7bWlvbz8b5xPt4CPCjKIbVgPtU0b+N/gsz5b51WyVve+WJJ5svidkKqqcPjgYTzIIYhF/Vi81XWTfySH/ovAXTeNzUKdVxkNbZu6T7jHcCpU0UG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:47:14.7195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8001e11-ab3a-48cf-2024-08dee89f6064
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7035

This series makes the AMD HSMP driver safe against concurrent probe/remove
of its per-socket devices and against the data plane (open /dev/hsmp fds and
hwmon/sysfs reads) racing socket teardown.

The ACPI front-end binds one platform device per socket but shares a single
socket array and a single /dev/hsmp misc device across them, while the data
plane issues mailbox messages with no coordination with driver teardown.
misc_deregister() does not drain already-open fds, so an in-flight message
can touch a freed socket array or an unmapped mailbox on unbind.

A single rw_semaphore, hsmp_sock_rwsem, serializes everything: the data
plane takes it for read so messages run concurrently with each other, and
probe and remove take it for write to bring sockets up and tear them down
while excluding and draining the data plane. The fix is built up in small,
bisectable steps:

 1. Introduce hsmp_sock_rwsem and hold it for write across ACPI probe/remove
    so concurrent per-socket probes cannot race the bring-up handshake or
    the one-time socket-array allocation.
 2. Map the metric table with ioremap() and release it via a devres action,
    so its lifetime is no longer pinned to a single per-socket devres scope.
 3. Serialize the per-socket metric-table fill-and-copy with a mutex.
 4. Clear mdev.this_device on deregister (independent hygiene fix that the
    next patch relies on to track /dev/hsmp registration).
 5. Track shared socket ownership with a kref and a single coordinated
    release helper, drop the is_probed flag and unparent /dev/hsmp on the
    ACPI path.
 6. Add the read side of hsmp_sock_rwsem to the data plane: split the send
    into hsmp_send_message_locked() (asserts the rwsem is held) and
    hsmp_send_message() (wraps it in guard(rwsem_read)). Route the probe-only
    senders through the locked variant so probe, holding the write lock, does
    not recurse on the rwsem.

Each patch builds on its own and the series is checkpatch --strict clean.

Changes since v6:
 - Comment-only fixes addressing review feedback on patch 6: the code
   comments no longer describe the data plane as "lock-free". After this
   series hsmp_send_message() takes hsmp_sock_rwsem for read, so the data
   plane is gated by a lock (the read side simply does not exclude other
   readers); calling it lock-free contradicted the rwsem documentation and
   was misleading. Reworded hsmp_send_message() (patch 6, hsmp.c) and the
   kref-release / probe / remove teardown comments (patch 5, acpi.c), and
   dropped the "lock-free" wording from the patch 1 and patch 6 changelogs.
   No functional change.

Changes since v5:
 - Track the shared ACPI sockets with a kref instead of a hand-rolled
   unsigned int counter (patch 5), as suggested on v5. The first probe
   kref_init()s it, each further probe kref_get()s and every remove or
   probe failure kref_put()s; the last put runs hsmp_acpi_sock_release() as
   the kref release callback. get/put still happen under hsmp_sock_rwsem
   held for write, so the atomic is not strictly needed, but kref gives the
   clearer interface.
 - Keep the rwsem read side for the data plane rather than switching it to
   kref_get_unless_zero(). The kref tracks the shared socket array, but each
   socket's mailbox is a per-device devm_ioremap_uc() mapping that devres
   unmaps on that socket's individual (non-final) unbind while the array and
   the kref are still alive. An array-level kref would keep the array from
   being freed but would not stop that per-socket mailbox unmap, so the read
   side is what serializes the sock->dev gate and the MMIO access against a
   concurrent per-socket teardown. A kref_get_unless_zero() data plane would
   need a per-socket reference tied to each mailbox's lifetime, a larger
   redesign; noted for a possible follow-up.

Muralidhara M K (6):
  platform/x86/amd/hsmp: Serialize ACPI HSMP probe and remove with an
    rwsem
  platform/x86/amd/hsmp: Map the metric table with ioremap() and unmap
    it explicitly
  platform/x86/amd/hsmp: Serialize per-socket metric table reads with a
    mutex
  platform/x86/amd/hsmp: Clear mdev.this_device on deregister
  platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinated
    release
  platform/x86/amd/hsmp: Serialize the data plane against socket
    teardown

 drivers/platform/x86/amd/hsmp/acpi.c | 146 +++++++++++++++++++++++++++++++----
 drivers/platform/x86/amd/hsmp/hsmp.c | 112 +++++++++++++++++++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.h |  14 +++-
 drivers/platform/x86/amd/hsmp/plat.c |  38 ++++++++-
 4 files changed, 287 insertions(+), 23 deletions(-)


base-commit: ff7836fa850c2f815bc219f1e48f6ec8699f4ae7
-- 
2.34.1

