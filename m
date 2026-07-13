Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011066.outbound.protection.outlook.com [52.101.57.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415DC344DAA;
	Mon, 13 Jul 2026 04:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783917630; cv=fail; b=R5HjSnAdrUgqDJ/m+Lmbk3MGmrCEXdYDXj3hZfjRKvzh1v2EU3uowzMi+kd4R0ZuOIMDwMOtDNMXTrbqK92v2/C9rLpwoxo/umnvmh4d0X2OL4p+NCmSbmHIGPnDgBtu6PuBeYzJzYjzBAzo9soV7yxDTmS5PLyz6i3w+vS0ylE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783917630; c=relaxed/simple;
	bh=Ol/lKBjzBznJCmn5NsPVC/xGE6gDzeO6rI0qqqeZ6II=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J/qRzmp3F2dZQoLkBmzSzCZLGG2sMEOfu+AzDAEVAmwQVoYrQhzWyPoC/nED3aoyymgQjL3oLGVzya5rQrFw6GlZ1De0YQ65kyXJ8puIkrRDjGZxt6aeAObmG+HvMvwgteUQ63+K3hx+YUCY5PwvbsNO02Fs1Q89BZ4Zq8F4N+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bR9Ra9Nq; arc=fail smtp.client-ip=52.101.57.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bR9Ra9Nq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3HkNwB/mNN3xM/lfwVOHAiWnRJcHoqYHN0XFOC/8wKAMQI3SGMtToj6nDr05bqQOg8xO9WNrIAXUnanPez1xEHbGXMePWEde3jQ4mALdVUjxtEtt9/DRwsXiHKNdH+PLPQpJ8YEBxDeIr+VPCSmX35HHuub+DaoOTpkxD/fRMPSYF/ecEdCnJACukkSdzoUAQ5AtvlCZvkQj6sAX06oxUy3eBS1Bpt1rNXm8X/AxPORSHuxmePin52dI6JUWsxYSq6RHaMCQYVFthbYqSbgXXoBbdKIF+fZYizdrshS0P/BBJ4G7gQsW1SwMyoTkbM63eW+aJ/QwRdbKbrfnVbJUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1EeUfMTKoWBR13E16knZaP4luZz/rBlk+nWkbv68rn0=;
 b=do7cf5IZf5P/3pOGAdrMOW8Xx6G3KAgLTgMVeAMPPGweA83LVQw1f0HqoMUX93Lu7MCmDGYud0rTg2hfj22BwSpOvS30X8hRYv1Q7rIzISV0cgLMDp5HvTk3TUdn910nOQtkMWVmP913cEykCYsYY76Sq2pKC2jI7/tU9HFobsA+cceqQcG6O9lbl9WV5J1Q//hmmi0NNZOWkCBSqzOnV8L0Ry6G8O8ArysiB2UZ6yjJybgSCHwJS0WrvyWxu74X88QElR7fHcdoKlhneMFpm5fs4xOQ5zO8ccCXMW3RAa1+yrrz7jUrrpdHdFwbiZGCpPCuw+dYjCH4FlNIxMfP0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1EeUfMTKoWBR13E16knZaP4luZz/rBlk+nWkbv68rn0=;
 b=bR9Ra9Nqv1Qz9vkIGsuJLmhC+x6cLb79OphuGI8UKZ3SKJdpJ7GSRu47996Las0V4RHZy06V9BmdvQMAE3O03jLaexP1OP0fAG8clUZiLi/wHX/7yFL8djfzGrFkCsInpdqs1A2dS4XaINrWY5tg4kuhN8EGa10LqbPpVyhOrd4=
Received: from SJ0PR13CA0075.namprd13.prod.outlook.com (2603:10b6:a03:2c4::20)
 by CY8PR12MB9034.namprd12.prod.outlook.com (2603:10b6:930:76::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Mon, 13 Jul
 2026 04:40:24 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::7c) by SJ0PR13CA0075.outlook.office365.com
 (2603:10b6:a03:2c4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Mon, 13
 Jul 2026 04:40:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 04:40:23 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 12 Jul
 2026 23:40:21 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v6 0/6] platform/x86/amd/hsmp: Serialize the data plane against socket teardown
Date: Mon, 13 Jul 2026 10:09:59 +0530
Message-ID: <20260713044005.1194115-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|CY8PR12MB9034:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5981f3-d6e8-493f-f05e-08dee098da36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	HNNQM0jBdlJfiVS29CkLHNpIomgFtM1X3meoUMyp8KNeGA0om7vWC688PilwiNneTlLkLCjdz/vho0SHjJlVBgZOkFfBL97/tf6e2Orh/xUvjTj+8x4a/PvZefn1Z0EXlQlk/EbV3kvt/ViQ7OCXe6ALvYdyqa5vPcjuOvKeB2YI94gmf6lu0HbGVrBb98l1GYN7MmxGurzlcfuhd7DUXq9LkACF1sZ3xOfflJ2j6qVcM3leAqBOTotMQwXMmPxlgOspGPKrjgTg/75sEEuCiPjbrYWeBK0vpB8yF3G3HJFQ5IdzfrTU4Zr+rSO2iEudvg1pIVK7yzLlXHzoCu5AJnkhFmKos/k8NPum3eRwbJocwYbHR0EnMaaRXMHawyWJDWloWiwgz1KU8/RWq7ecsyE+TgWN6zabM1t1x76txfhN+bIRMZh2XpViK+MZcuwWvoVTzNbQ3WD0lH2ivxhzP/L/KaXNKCU84vbuS/qtj+/8frnZ2bLLUljjX8z7hshJ6VT/Iimht89NkqQj9S/Nelaa7Lt9L8od6y5igwh18frIRYg/cY9swxJXa7Uobp0QNbu8WQoddv8gk7d0NdB2fhpH7BmwcuTe8SbBw3RDDz7hF+/eqRBqydRzlsBRrCI7eVH5Tndy89zHvJ2l6E1P1mkPUXYEMJsMn/4wCE6OXC5c6VtNl5q/UD+aFZc/dTPvyYWdtGdHqY+xa8dUqOETLg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sXO6E3WxFtNvT0xEtX/zThuGcPqNLftaPxca3347O+vLS8MA6n5TSIk9B/tlTxNxWwwDBjkOsTyANk151d8Qfih+IXIaXdpXVRO6lrsDi4kxhEXTc9FoLrd8lZ8mRounvMuofDhEPuwbowrIWJPxewh9aPhqWHY+h0V5i9PtdcWJ0cWp+Edb2r0IWzG94YdRdvtdTuP6EkjsBKfhn1SQYu6h8KtRowpAe8rTDFp5T5ggUEHfG27R3GAWwqstwVh8/VfqLWSIWfCeo4sVI2eIzVe8/haLHqdpWsXNp8G9k4loaE2hdrZb5j3S8G2ePBFvRXZnYFlnJuUQT5ACgWjRR/4L4gQza+oX6c/3yEAD9IO1ZgxMZdwib8p7k4FA7qV8tCq6muAgWmSVME4Vi6gHQAe+5t+FN6p1hwL44DaMQCTJ5wXtYUh3k1B9e/7ymwiH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 04:40:23.2772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5981f3-d6e8-493f-f05e-08dee098da36
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9034

This series makes the AMD HSMP driver safe against concurrent probe/remove
of its per-socket devices and against the lock-free data plane (open
/dev/hsmp fds and hwmon/sysfs reads) racing socket teardown.

The ACPI front-end binds one platform device per socket but shares a single
socket array and a single /dev/hsmp misc device across them, while the data
plane issues mailbox messages with no coordination with driver teardown.
misc_deregister() does not drain already-open fds, so an in-flight message
can touch a freed socket array or an unmapped mailbox on unbind.

A single rw_semaphore, hsmp_sock_rwsem, serializes everything: the data
plane takes it for read so messages run concurrently, and probe and remove
take it for write to bring sockets up and tear them down while excluding and
draining the data plane. The fix is built up in small, bisectable steps:

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

 drivers/platform/x86/amd/hsmp/acpi.c | 146 ++++++++++++++++++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.c | 113 +++++++++++++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.h |  14 ++-
 drivers/platform/x86/amd/hsmp/plat.c |  38 ++++++-
 4 files changed, 288 insertions(+), 23 deletions(-)


base-commit: ff7836fa850c2f815bc219f1e48f6ec8699f4ae7
-- 
2.34.1

