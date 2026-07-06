Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010048.outbound.protection.outlook.com [52.101.61.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945C6258EDA;
	Mon,  6 Jul 2026 14:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347702; cv=fail; b=W9Ys8swjXUKYRvL2LVNeJQ6WSyPySPDwfyzm+CAm7pODm5ckxyhzLhFYj2DEa1cxlKKv/jpTDu37bZHDD92xYO+SJ+n/ZWguWaLDpRz60ji9dcrTZG8ZsDkcYUPPkDGBcT7o1Mzo1fiOtbXE3nkps15EizJ5964IN9waJLCUKuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347702; c=relaxed/simple;
	bh=/s7u8oERo71iLksWf3lVkFD5R1lJU4lo1Y/NpLuMIY0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YrNETT57USMjJcUTuZSUEK7xNjmKShGpTsozZjkqZjRuQKOaxeKs+eTvkimqOz4eWI8+6BegpLjIkx1ltjTCeRWo3XgA86KcsjoGRz58lPC1m17KhS6CEo5nK4nobXnr3b2DvuL4fDZhryOlPoqd46OSnySHjesiD5IjR3GPz20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TAfijvFB; arc=fail smtp.client-ip=52.101.61.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TAfijvFB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMS1b6vfXRRrrT0WHHxGw+Guz6Zq96qgdl0qoeSp7JCkPUhmvq8QAFoNyfg9fOXag7eYJP3w/eLq8Kd+1ENbvcX4x0KMSe0s5Ia8MfyJVfKlsPh/v9D0z526TfH8h5geN7MXJCr5rwZSHBBGR1Jl8DMNof2Z+ZvdkxKN5b3ccj1iquy1TY6tGalFmvaTQyrG1bcKhVI+TOJ6iW3QUt6bD+XO9f6Uhx6P6BgASftBrYGarRhkeXB1oBfUmLw0GjL2Mztr0aegSTUql/QVSPgBcHTR78dcTIjEvQUB7H1IBWJJgVF2GCBb8C7Od6cW5ywtnwwSonKNJ0zpVEANQOQarg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hoXzjLvoYKIWrm0YFUqKxl24VDM+FwVHsQVosRxRds=;
 b=KljAcVjfdoqoj01oNAORRRz11Z/5FVpPh5NwnkYSTogVrudFQUZs8+2zMDxEl5o0MQICBVOzxjEzSkk0Bfb8ahjvU9+3gxcwqGwMtbCwmCyc3PQxov4PvU/AgDiwrc68tZ13hI9sH7hUmwneVvWWZ0VXSLcrTJ3TbQDNZsLwunMlLISttU28v67Gjazs5CoIjubHKwkLpfleak+WaEpP/zoTjSH9h2/pqQ0fq+tnTrqi0Mla0s6wzKD6v41huk6tBqfbxHi1dVyKGmJsdV4J2ljA/JxB7GCOpI/GXxWqPT6Vk8p9yGqpPiI6yJqqS7IrVIgXu2KzY+j06SB3fItIjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hoXzjLvoYKIWrm0YFUqKxl24VDM+FwVHsQVosRxRds=;
 b=TAfijvFB4rw5Z+McylGgd+LfB51uru+Y47JK2csSJ/3nlMRXWsn6IW8mx/pLmSr7Hp8uq9XvnbD1oBKmikaMFjcpLFpjRsgikksXC5tHazMtidcvy5v94xJSjqntczwake4+FQi4nqZJslQmUQHDI7LMr4ZIG2jsLr057dJgEWY=
Received: from SJ0PR05CA0134.namprd05.prod.outlook.com (2603:10b6:a03:33d::19)
 by LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 14:21:33 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::1e) by SJ0PR05CA0134.outlook.office365.com
 (2603:10b6:a03:33d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.6 via Frontend Transport; Mon, 6
 Jul 2026 14:21:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 14:21:32 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 6 Jul
 2026 09:21:29 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v3 0/5] platform/x86/amd/hsmp: ACPI/platform HSMP concurrency and lifecycle hardening
Date: Mon, 6 Jul 2026 19:51:09 +0530
Message-ID: <20260706142114.3202259-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|LV9PR12MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d0cc5c-2ead-4a07-39a0-08dedb69e12b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|11063799006|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	crrLnJC60B102TBsDYgzlK0/7sfZ1bnJM+GCENBOPjgFzkOM6wsWC0QN/RcW/HRdgF/uQNsHbefwXAoL2jSkoIjbmcXcveppYuUuNsCCtW0CSAVB045LWUHp1jpI/5kD1C54NheNrLYQ6wCwRPYE/oCSt4nBm0DHnLOY7jOQPam6KPzSq8f+60PY5kYC7v6pt/CUd8D7etelhFK9YIRgK23nU5yryx+Q3lGyXpR6HdFVYa/7Qq2l/wv7vn9Nm6RrbUdsCzQKIlnyAUjavJhDAp2nVOqS/xzxxF5aaAY14HreQ37/HP3DnyW8/xpjcJSzi8bEmCUPevRaWFWdBIxIvlsINiloA9dgAJq1Cc8iK9b35j3+bzkwbDd3ZsvEex8X73mtcXJ3LkHyYaXFi9yWvQJGHWkoLc8V8eC9VuUM93GmbehT6hyozoMKKtojbsD+wN8lVWYDYl9wfl7SIr5VuvzrAh3YKZTqPCoe0R1TnDAKBXAX0919WZXIO2KobrHOyVbYtw25bkhDI0G/HpnIui6EZrdi4ZCx9m0sgHL7jesEr/Ux2nVkRJm3occ/KtuACfWOVxKj3yw5EJ2AiJDOvpMs5gaYY/vO/w3dK/I//WwJYSUD09LMl+6RKOtlPQ7CitMyhXMp6gdMROqHGA2B7+xLQdhV70Ew0CLQ+OVZzfc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(11063799006)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7bFuJX0Ckbbdw/hGUauByzcLjGDQNEhGgvMB+W6klHi0vSA+rky1dNalrguj1ntD1uKsddT407M3gHGhuLTZjOtcDLg2ghJtYE5YsGig6thy6SNLVAuUBZCwEVc45uCK1cfBgdRTFm67pIJM28sRRvI8z8i/ZFiyDLkaHZsig1dkSDFLcGnF3eOTEwYW2gc1Q3YAvyAq+jAmtoXBRXzBHYVJ1YSkV5cgjO6HkC3slFyiq6OGAONPmKSNvd/D5c/J23zx/n6vEAeYZKFcSiV7QZbrZyBQi3u6/ka3SJDaNxYsbNCIVnHNWFKJkz1k8ZUW16ksQPF1ADK4CmHBW4Qcprr/BD1b6UsqPBFeR9wxHDN//G3s3rEd9PCBTYLpgSnxesEfPUv1VKwD9jfWjnvir9pLt+6Ig1++JhadbXUYEShyfxDES/oU4udD4+t9Mbfy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 14:21:32.7690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d0cc5c-2ead-4a07-39a0-08dedb69e12b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9758

This series hardens the AMD HSMP ACPI and platform drivers against
probe/remove concurrency, use-after-free of the per-socket state, and
resource leaks across unbind/rebind cycles.

On multi-socket systems several ACPI platform devices are probed and
removed independently while a single /dev/hsmp (and the hwmon sysfs
attributes) drive a lock-free data plane.  The existing code raced the
global is_probed handshake and the one-time socket allocation, freed the
socket array from under in-flight hsmp_send_message() callers, and leaked
metric-table mappings on rebind.

The patches, in order:

  1. Serialize ACPI probe/remove/init_acpi() with a dedicated mutex so
     the is_probed handshake and the one-time socket allocation cannot
     race across per-socket platform devices.
  2. Map the metric-table DRAM explicitly and add per-socket mutexes.
  3. Add hsmp_sock_rwsem so the lock-free data plane is drained and kept
     out while a socket is torn down; wire the non-ACPI platform path
     into it.
  4. Refcount the ACPI socket platform devices with struct kref and run a
     coordinated release on the final put (deregister /dev/hsmp, unmap
     metric DRAM, free the socket array); clear the per-socket dev under
     the teardown write lock on both remove and probe failure.
  5. Drop any stale metric-table mapping before remapping on rebind.

Testing:
  - Each patch builds individually (W=1) with no new warnings; the series
    is bisectable.
  - checkpatch.pl --strict is clean on every patch.

Changes since v2:
  - This revision covers only the five ACPI/platform probe, teardown, and
    lifecycle patches.  The ACPI UID / _DSD mailbox validation and the
    sock->dev readiness-gate changes from v2 are accepted in maintainer branch.
  - Reworded the teardown rwsem comments in "Serialize the data plane
    against socket teardown" so they describe the drain contract in terms
    of a generic teardown path (a teardown path takes the write side)
    rather than attributing it to the ACPI path, which is wired into the
    drain in the following patch.

v2: https://patch.msgid.link/20260625123337.886435-1-muralidhara.mk@amd.com

Muralidhara M K (5):
  platform/x86/amd/hsmp: Serialize ACPI HSMP is_probed with a probe
    mutex
  platform/x86/amd/hsmp: Add explicit metric DRAM mapping and per-socket
    mutexes
  platform/x86/amd/hsmp: Serialize the data plane against socket
    teardown
  platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinated
    release
  platform/x86/amd/hsmp: Drop stale metric table mapping on rebind

 drivers/platform/x86/amd/hsmp/acpi.c | 147 ++++++++++++++++++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.c | 112 ++++++++++++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.h |  11 +-
 drivers/platform/x86/amd/hsmp/plat.c |  39 ++++++-
 4 files changed, 285 insertions(+), 24 deletions(-)


base-commit: ff7836fa850c2f815bc219f1e48f6ec8699f4ae7
-- 
2.34.1

