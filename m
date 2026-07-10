Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012060.outbound.protection.outlook.com [40.107.209.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED95C42B31A;
	Fri, 10 Jul 2026 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694826; cv=fail; b=ZLt0Pn+XVm+PGh2rAGLgEKFOkYs9rd8h5MQ5OjDRdpVq2RQ5kiJFsE0WEPBaU1b2gAPFbjBDY23cSZSLTNyfdgcYZeqZOVoS9eiowVzkC0A/unKqcns8yJSUb6rmmui5lIaOQ3MeUu/ALKtH0NiuIIEmAVxVizRdzHjkhyCLtfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694826; c=relaxed/simple;
	bh=/5ZfynE84UUCdqMUSnvuZx5RqBvZ5YIYYYUfmS5RFGY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N2H/YJxLE8gHWClUNpPrve5JsAap2EzD6k+Xz1qGXriiggnG4HrTGh73dU3d/294v/haj+VJceK3dQNt2nuHKG+tT5Nsm6a6JVUWCti5bU9m7VuDZTBrWh+aE+/xRXXG/bn6hZH4vgqtY8uFY4HkqRLWQYdnE3Ucyabl7tzz/ew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=k/V9SruX; arc=fail smtp.client-ip=40.107.209.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="k/V9SruX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rxtzq+pURlV+UVSCj++ro3gdeOcPV73FMCRjvwS9RqWi2phc8Qhwf/n5FqFJL3uy+fjAPc5vv3zOV9Dxw/V3gtApB/rkdKVySGzxd8As33wQEcVDq57pGHHbHQSpfTaMQRKGYI/VTrIsnmFyeqgrVz6w7cquqdYAUQyXFXJI2PB2EK1DgMwbyxWrXKuG3AeblmARhsi8b3baMkmFOaOCGuWdGU5ZC47PpEo4ksXvATplMPe5jgLaAYLMHFciilZPt6F1nYqHllzFMEmTepcwW9OyqflT4+6Uz+gOhaMXAURdqY89KwGd44ZpKWLfTZH+w28oSyC7vb+KVbMRA/CFZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JpaWOpJ2CWw4z4fg0so7cPu9e6dhE56+bh8s52w1J0=;
 b=sX55T75SNAtPyzGE2/f7/jMVb3Cd2WqgtMktBeLw/t9OMc6qEuYlef/5I/vDaBG2ofiVTSuybWNl30xzwWhIZfSXI8owyIWI2yIzTvvAiWURoUFzQ3lIsor4WVvwPnTdse4TLWbAWES1x5GaAKBuXUILDBmN94rr6yoqE4lEtDDE2abu+FhxyR+7QmHxgBV7fBuvZSUmTjjCwwOUiq+GkC590msU30jncQt7f08muSXl8SDFTG+zpTSlPc5kf5DvOv1X2cQ2IY5XPOtoUVAtYxWDg9GH32MAVsv6V//OUtjC6pUan8RkC9n731auifT9FzSNXCfishg/GqS2EKUphA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JpaWOpJ2CWw4z4fg0so7cPu9e6dhE56+bh8s52w1J0=;
 b=k/V9SruX8liUaVHSKNBR9eN0Na14wm8RFMvfx7zLXoDKo00HjasghKwFdHDfztyo9Cru1eZoialEVPbS1dNDMNXJT9GpAG+XYqRicaKpGV5QtgnLOwOi0ZDwwfOWulWCspwmeznQuAC63EuKWY9dZa2SpjHlizoF/0PasW8It5g=
Received: from BN0PR02CA0022.namprd02.prod.outlook.com (2603:10b6:408:e4::27)
 by DS0PR12MB7946.namprd12.prod.outlook.com (2603:10b6:8:151::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 14:46:59 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:408:e4:cafe::78) by BN0PR02CA0022.outlook.office365.com
 (2603:10b6:408:e4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.14 via Frontend Transport; Fri,
 10 Jul 2026 14:46:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 14:46:58 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 09:46:49 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v5 0/6] platform/x86/amd/hsmp: Serialize the data plane against socket teardown
Date: Fri, 10 Jul 2026 20:16:27 +0530
Message-ID: <20260710144633.879018-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|DS0PR12MB7946:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e5f5fcd-1f09-465e-e081-08dede92180c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	DldXpbOq+q5EgYOfv3LGZLzawgmUHirI+2icIRuVg8ScNpNzrGmHsjYMA/hy68PlyRg4+eY0RNgA3LTJ4mbZ8guMTLLvKTM5i8xr7CM7gb7g7LsGaQUqGcMaVqBNwOkBwS0rNEgbwndPt/KmJXSBPyJJVTxX4BN6qqAbElD5QV2dVpJooAjTC4gC67L8cqQkewqUWJvC6DBmjO98YmKSxzNfZxHrF9f745eDcLkDtJY0mZzgKMPYblc6raF3W4XAFz+zrQP4PPZvGRzDLsduXu/YjCwPWXTIZTyXIDnsXZJypYhJLf5z1464BprIFGCNKCtLFZtYo+FtYwxz/gyzEnNmplZeMpCHMWD8Ob0dkK4VMG1vmUyd4aJPUXJVl1aKKACKMDjLCQzwQeIbVYIRbyD82UMPSLbC2x6vDM2p2LTpJRnFyLCmFQmKLQ0d/8SOlRcDVrBOqfJ1puYnt0rEwOzrdRf4oaNTlO+e3/N2eKHPgzIL3vFHIvv5LVmBvaQbEo00/3rPyiwRTjxXAGfl8v4XQnYMKh3YaFQdbdewTdIWRERuDalG2TbSmHxga08rdwxS5pd/KKHKdciw61Y8Tzg3ZryEGaHosWb49quiU3EoMtHWxPmAIitQRuNPDXM7tkBdFTddOhjxvvEM+NzAkJ/OGDAhEUepNhnTgJRIL5CpMObw/VaElBhLvNoRKX4EWSvUAPVWtkNwP+JKcSTkYA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qcFkXk00dq/whBQlQdMJY13PC4D05mnQAWOxdQpxrnRrmU6subtN8tYA4FRApzdX0+NgGgQJYJrNyUZJn+KMr1XdQ7GU3WLa09N9IIwZYvaonQPI5WW1zCUvbitCHqfv6+Vem9IskwqDB+jZx1YI8FiMiEZ9O2x+JyaZ9gxMkbTLADJW9XQ/ByeQOfprB3rPIFnXQFH+BmEQ++8fEIES+BNNvwnnQoCcmGu44hDEzTC2+/jeo9pLhIIpLODo+kEOe8Manvlav45vlOa9M+2taIGJFPanpSgdzNa/gaRWYIPoQ9S8yUKtmCM9R4DUbv3EzFVamSBpX0NDUnD+IG8EIhu3mB/yLlYOD67fRSuGLVRrCSkNPn4+PAFEVRyb2AsXNR86JlxR0lAt04Rl7wXFPs5gTee2pxB6fc3ij8OZTRJ65mN6VPgF5rf5dmwTrLge
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 14:46:58.2851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5f5fcd-1f09-465e-e081-08dede92180c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7946

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
 5. Track shared socket ownership with a refcount and a single coordinated
    release helper, drop the is_probed flag and unparent /dev/hsmp on the
    ACPI path.
 6. Add the read side of hsmp_sock_rwsem to the data plane: split the send
    into hsmp_send_message_locked() (asserts the rwsem is held) and
    hsmp_send_message() (wraps it in guard(rwsem_read)). Route the probe-only
    senders through the locked variant so probe, holding the write lock, does
    not recurse on the rwsem.

Each patch builds on its own and the series is checkpatch --strict clean.

Changes since v4:
 - Collapse the two-lock design onto a single rwsem, as suggested on v4.
   The dedicated ACPI probe mutex is gone; probe and remove take
   hsmp_sock_rwsem for write instead, so there is one lock rather than a
   probe mutex nested outside the data-plane rwsem.
 - Add hsmp_send_message_locked(), the send core that asserts the rwsem is
   held, and reduce hsmp_send_message() to guard(rwsem_read) around it. The
   probe-only senders (hsmp_test(), hsmp_cache_proto_ver(),
   hsmp_get_tbl_dram_base()) call the locked variant, so the probe path can
   hold the rwsem for write across the whole mailbox handshake without
   recursing on it.
 - plat.c takes the rwsem for write around init_platform_device() only, not
   across devm_add_action_or_reset(), so the release action (which also
   takes it for write) cannot deadlock if that registration fails.
 - hsmp_misc_register() now takes the /dev/hsmp parent from its caller: the
   ACPI driver passes NULL (shared singleton, per-socket devices unbind out
   of order), while the platform driver keeps parenting to its single
   device. v4 unparented it unconditionally, which also dropped the parent
   for the platform path.
 - Reword the patch 2 changelog and the devres release comment around the
   "devm-managed" split; minor comment cleanups.

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

 drivers/platform/x86/amd/hsmp/acpi.c | 137 ++++++++++++++++++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.c | 113 ++++++++++++++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.h |  14 ++-
 drivers/platform/x86/amd/hsmp/plat.c |  38 +++++++-
 4 files changed, 279 insertions(+), 23 deletions(-)


base-commit: ff7836fa850c2f815bc219f1e48f6ec8699f4ae7
-- 
2.34.1

