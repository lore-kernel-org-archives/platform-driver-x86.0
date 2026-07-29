Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010045.outbound.protection.outlook.com [40.93.198.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759D84A33E9;
	Wed, 29 Jul 2026 16:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785343264; cv=fail; b=Sxhk+SmUwBO4gRqNGTf2wVy6KV5PDoi4MTR0jr1qa2ZePWcqqp5RZb7lQwyvXQBvQBv2+D6dNreJHI5fr4hCE5tcKYYc+K5+SrYYQtYVq/T1qFplYvLz0X1wZJiMOyW5orsJGDctA2dLcTAHPlB2ck3eroOgDu5aCci6GZxtzzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785343264; c=relaxed/simple;
	bh=eI7rVBxCLgzQ7hY2crBnbSedO1lgiueIiVhLhIEG7rA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gSK0qqoqKo8Tx/bFBRjLZy62H6DX8csNhc3NPU2CoEUBT6Xx7F7E7cjSUg3PGTnl3eafCWrA0zSETuVOYxWrOmivXrbwr+36Gi7U42b0J1cP2PbviYbwFqv8B6DEA8kNvMYShdTRCuaAkNinGGFxHmLV0gmq+TK6Q4/KjUIuNSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dhcaFNyD; arc=fail smtp.client-ip=40.93.198.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dhcaFNyD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7H2sF3lzcwjN2q0QDGF8zyDqgwKT4V6lutNGbS99EJ0soJMN/ajqN3SXKvhcy0cyOOVsmn2lm2akGjQQSBYMYy8XHzrsu3TLbF5ulFG63yCj+qhEu0oO3iIChJEYcglaxBoOqnmrToJ+LcJrQvsCvvR/SWvRTJ2N4fgNMAbS7tHjmJEV/NqcWKotsMNYgCwU8d/zUOOl8Xw0Hg0fxpylJ/E9llXOAYxbqxwTVHWFRbN9R4x0H8m2XaSaV6vw/mqY5EkUdm+ws7z+Tl1/fiNA0/EMrf6x5aUHwY7zcJQYNcaGhhIyRG4hkreZd/7RRLNlsaAmFEqIWuc5kuc0jA+aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSxOqozU+lEO03cqcgPEa/49D6t9PGI3bcolJWkG+pw=;
 b=OrOCH01Wij8iaIJG6rq52pBVrCrpSiOxaeHRiaZ3AEQ05U7NKwNpfXBP19PdZWCuahbGhDsBsXjQ7PhqdpHSb6BsE9tdiLAOUJ4GiDaMoBZlju6teGtIgKT8wkdwv5unJL0TWV/XOZiGO2mmschL+Akd+wobQ+P8CfCPTCMyobTmWnvvYEHSbW33S9P9DlfUgcWhkPhKVSt53P8hb+1/u4SD4q6Q7jRgFKvlZ9gbZkBp2RegFcJzztrEQ4T4pP68BGLxCLBh/vNvTToBfZaxb2sCgjuwexhUNXIA5HQqfIcQfiEOtKJwZudr1KclKX0b6kIm7M5JEVepkGRu6OZwwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSxOqozU+lEO03cqcgPEa/49D6t9PGI3bcolJWkG+pw=;
 b=dhcaFNyD77iSW+sBr8u4rBu0cWOXKcDckQq8I7j84gs9pjm2iinFqrLHR2jikhYvxzRLAJ0CWVsXWD9Rr1VUtynboql6q0uc0ob4jWDfgchF7IHy1vLXbPpZfSkSaypY3V0TGfTbC9bHO0wO+QOiwzEuQ1wXSAfmxSHSqfTN9+w=
Received: from SA9PR10CA0014.namprd10.prod.outlook.com (2603:10b6:806:a7::19)
 by CH2PR12MB4085.namprd12.prod.outlook.com (2603:10b6:610:79::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 16:40:59 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:a7:cafe::e) by SA9PR10CA0014.outlook.office365.com
 (2603:10b6:806:a7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 16:40:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 16:40:58 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 29 Jul
 2026 11:40:52 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH 0/7] platform/x86/amd/hsmp: Family 1Ah client support
Date: Wed, 29 Jul 2026 22:10:27 +0530
Message-ID: <20260729164034.1331375-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|CH2PR12MB4085:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a9e966-00ad-4791-211a-08deed902ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|6133799003|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CiKKO+UJUddDftLUusc7FdnSXfheo+lX7ISrZle7DUxWhYQykyo3zAPv7H/JBYpSDXBQstBJ6V0V/yNqc6zmDGr/bdzxE69pokOUfz9qPJy2Xep07YoVNj0RnFOkHHRZoPPo35oPE3eBHd0dSdguR3JQduENSYgNRWaKA/y8//Z2wo398BR1CyAcz1b2H7V8Y2fNJ/IhkF5s6qo95HlLzRlQn11tQghGhB4XwKoeE6iwBwL23Y1gKG7bDzVYh9k/56WpxEAreL0OWUtrVsJjP7UYTJP146sYWxcMWwevaeJ4Rz2PzdtvPNzF1IS2Bnyf3i8mn6aoZ4tp+IkfLLlo0l+VIlz5yHHwVKv5b9Cc0pnS9nu+qbuzSPIBC34XTjwPUYqPd6RLITexXf/gxCp0RsHMaAaPthKTzw4Ykbr8XFXUUGzpHnJufQ8lFE/ot4qSKNg5PN6FyeG8vVKicjZS0JVQV66Q+XIiV4FHmMCzpZwFL3tAyEzXz345cdEeWKYu/tD+BVfjrQ+Df6AZ1sUc39fY2DrMzoI6rTHCr6j9sG3rMuXShtzX+CxKGCgUlt+CcDzN8LEB57vRiLXbZnqb8HErDjqf/RZ0LrjMrtoU/7HWNKNEun4k0BpGN1ZAQBT7txAWNfsxH0vTd+7mdiK4jLt2lUdbmlBAxocQ/hIWIZdFVgkLidk1Tskm+3c7RDzTkUHnjVfJMQNAIrMi14Kx4Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Gp/ICOUplNc7n+0XKmbetWo+OOM7GeOb/5tsyMXFJMYu2SiLU65+87qaGL/C/aUk8JZsNHOe9iIpeq+S5jQQCJaEjc5GFu++4z4gWa71/4vY1mPJFIV9mx2ZK1eD3KI1nAPeiWGROd8XRDaSXZz+zPpFR+LZpr93zJCLpSPmX3hbvRzf/LzyeQxYj+PJllv0XDrNPA9aQSPGsFCV9cJ405kC7xw2xMMShfOdOasM58C7WTbCtyFaXBjziRTiZjccU3gxHdjugBI8nVMtDIm0TArHJbrB1zh1xqOBtou3Sy2sZtqLsqWSUgMduVxb3InXpxmrETzUBWUjMTqL4hXrduuK8B8zNzgFxvL0s3llniT20EBfZqB9DjEXrDhV5h77ZATz8IYKIPnvAj0ntktF73Js41kswgmBmf94Sijyi1LlNPuvgdKiR6crGg3b4nN+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 16:40:58.2548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a9e966-00ad-4791-211a-08deed902ada
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4085

This series enables the HSMP driver on the Family 1Ah client platforms
- Medusa1 (Models 80h-87h), Olympic Ridge (Models 88h-8Fh) and Medusa2
(Models E0h-E3h) - and adds the two read-only ioctls that bring-up on
those parts needs.

The client parts drive a different mailbox from the server HSMP
interface. Its SMN addresses are fixed rather than discoverable through
firmware, and the parts speak the Ryzen Master SMC message set instead
of the server message IDs. Patches 1-4 teach the driver both, leaving
server behaviour unchanged:

  - Patch 1 describes each platform once in struct hsmp_plat_desc,
    which carries the mailbox addresses, the message descriptor table
    and its size, and the IDs of the messages the driver issues itself.
    Every lookup then picks the table matching the running platform
    rather than testing the platform at each site. It also adds the
    client message set to the UAPI header, and lets the client probe
    survive an interface-version query that some client SMU builds
    reject with "invalid message" even though the mailbox works.

  - Patch 2 routes the metric table through the client message IDs,
    which unlike the test and version queries are not numbered alike in
    the two sets: 24h/25h on the server against 05h/06h on the client.

  - Patch 3 handles the ACPI device (HID AMDI0097), which on these
    parts exposes neither a _CRS window nor a _DSD mailbox package and
    carries a bare socket number in _UID rather than the server "IDXX"
    form. Reads go through the read-only SMNR ACPI method, the same
    accessor the AMDHSMP Windows driver uses.

  - Patch 4 leaves the hwmon power sensors unregistered on the client.
    hwmon.c issues the server power message IDs unconditionally, and on
    the client those numbers are metric-table queries that pass
    validate_message(), so power1_input and power1_cap would report a
    table version and the low half of a DRAM address as microwatts.

Patches 5-7 add HSMP_IOCTL_SMN_CMD and HSMP_IOCTL_MSR_CMD and document
them. Bringing a client platform up means reading SMN registers and
core MSRs that the message set does not cover, which today means either
debugfs, absent on production kernels, or an out-of-tree module. Both
ioctls are read-only and require CAP_SYS_RAWIO. Each request struct
carries a @write flag so write support could be added later without
changing the layout, but a request that sets it is refused with -EPERM
regardless of the caller's privilege or open mode.

Each patch builds individually at W=1 and is clean under
checkpatch.pl --strict --codespell.

Muralidhara M K (7):
  platform/x86/amd/hsmp: Add HSMP client support for Family 1Ah
  platform/x86/amd/hsmp: Route metric table through the client messages
  platform/x86/amd/hsmp: Add ACPI client support via the SMNR method
  platform/x86/amd/hsmp: Leave the hwmon power sensors off on client
    platforms
  platform/x86/amd/hsmp: Add SMN read IOCTL support
  platform/x86/amd/hsmp: Add MSR read IOCTL support
  Documentation/arch/x86/amd_hsmp: Document the SMN and MSR IOCTLs

 Documentation/arch/x86/amd_hsmp.rst  |  62 +++++-
 arch/x86/include/uapi/asm/amd_hsmp.h | 210 ++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/acpi.c | 138 +++++++++++--
 drivers/platform/x86/amd/hsmp/hsmp.c | 285 ++++++++++++++++++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.h |  77 ++++++++
 drivers/platform/x86/amd/hsmp/plat.c |  61 +++---
 6 files changed, 774 insertions(+), 59 deletions(-)


base-commit: 775f2078b38ff2121410a35302497a1e81b8e459
-- 
2.34.1

