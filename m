Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA0313C81B
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Nov 2024 10:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731322020; cv=fail; b=OLMDrpb3r65Jv1vRJwb86b5i5843qrhE/CTD/OK9Bo6nWpyObyM2ewRH15zxK4m3H6s/ZPBm9wWzrk/2+1bg3OIrpJZdgP5jtQd/F+JsiAzBs8YUJRLTHH82dhqBI3vyeRh336FJXM+555zzW7OfA3xPXMdpCbFkm83O266Kn8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731322020; c=relaxed/simple;
	bh=vWsFYFtRz7ozK2xsUjOuz+QswoVJCTckfi5C3rV/jKU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ad0F8I2t+snM0xoC9BVOWwz5eXo8WsyBzWSA6/1ZoVsTGa1G05l3MGwjVeVQOykdPOqwQD8v126OC5wiptjnaKKL7IhFNC6kC5RLPfwB94FUYwlATs4X2gdQ3OSm5zNIPVk2NIfvarRkfEXr5hNdCMRJhdBHi2fB0y+en6ha4Vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BaYexnFN; arc=fail smtp.client-ip=40.107.220.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BaYexnFN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTooFUmG/JuftQBOJ47bd3A/W+D4PTDbC15DagTAetQt3LuqqlMlezs5xWSqhLMTZY+REiCO3c0z3k7gxbAeynoyp7d40g/ks3MmBED0w24/dNyMP5dERsO/y2inNUPVf7+GplOEUyfnfJIyUTJ8YqFI6oNloC9yL+nC3xD9UUB3T1/rSpnXzFvsWdtMJM4ckA0MaBjJyGURp53QoRuY47V2IHuXV6w8AC39TP76cE9rqaBxl9/r4MJcdFjm1iw9AdQTs2e5o8Omv5CRSQn3skXo9nVOUx1jJ1vYdCHCiS8uXToNKlrOV3zTQnD8I1iDg6iJQRcCFHUa9olU2whcPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfHPUKhY7Rln3JwD5zl6r3DVUg2ip5GfjXRQEESywtw=;
 b=eQL0qJoKJyyiLiLGMoFWJQ8qyVRNC2oIwY4k79la/HffpiJTC5lm/VDI2fL3vO9tp/LiwqALsyjwdp5r9WScNMHqHdt43ugzJEj515Cpsgr7XI9dmP/7TUwr5B8fLUoZLu0VwzQAGq0NiURud6ThptJCqPSois978zzx6DH2bLJt5N/ExMhfIE8MdF7IbH1Hm6fxptiTLNCbBI5e0xa+P8QPYT863ZQ1B4hAk9FlwTPnpH7gW4NP7I1YcKhx67ql8n9/Bjdnlu0mx07UNtYjZkoyNlbaL7zZMqGrY90RIn3EkDkcfOW+qpMDvGi/arxIgwvLuzk6dDMjYcEHvsHDbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfHPUKhY7Rln3JwD5zl6r3DVUg2ip5GfjXRQEESywtw=;
 b=BaYexnFN8MnKBXRPMSmnZ6Ng4gIZvXAwG6OHDJNrbu7Ka+xeP9pAYnxLAUCzVy41zHzdmvvWfg0ExD10EoJy7qLCUVUip/nOfsjSp8CW8EBahOLfC1wQiPDGzYDguaYwuVWr9fQQspTTjbqLwIOiNSwMG4Fu6CBLyw+BVHJKdk8=
Received: from DS7PR03CA0156.namprd03.prod.outlook.com (2603:10b6:5:3b2::11)
 by MN0PR12MB6200.namprd12.prod.outlook.com (2603:10b6:208:3c3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 10:46:55 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:5:3b2:cafe::f1) by DS7PR03CA0156.outlook.office365.com
 (2603:10b6:5:3b2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27 via Frontend
 Transport; Mon, 11 Nov 2024 10:46:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 11 Nov 2024 10:46:55 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 04:46:52 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: <perry.yuan@amd.com>, <mario.limonciello@amd.com>,
	<Shyam-sundar.S-k@amd.com>, <W_Armin@gmx.de>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH v5 0/2] Add support of AMD 3D V-Cache optimizer driver
Date: Mon, 11 Nov 2024 16:16:30 +0530
Message-ID: <20241111104632.2213773-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|MN0PR12MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: 082ac9ba-a5e2-4932-fdef-08dd023e28d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHFha3JCaXJpcW4yVnF5UC95dkNPSGQyOHNrSHlab0tkRmxidko3T2FvK3JL?=
 =?utf-8?B?RE5yRXFOVXpXaHZzd3N1ajdlS0dLMW84Ty81cWJIVTZHQklyUytIaUZ5ZHJT?=
 =?utf-8?B?WTNRcVlmTkRRY2VzQ0I3VDFyWlE0ak1ESmkzdHZURHVhckxQVUFoclZKb2FV?=
 =?utf-8?B?cHBmeEl5RHZLcU9FV1kyZk9UNEVUTzNXQS9KVU93MEhmLzVDVlVNeThuV0NL?=
 =?utf-8?B?YnR5RnloZi9oYXlUWG14aGs5UDhhaEd5OGIrZllVTThCUFRqY0gwSnlDZmVm?=
 =?utf-8?B?TEFHM0ZQVHU5YlZ5eE9qZjZJMThYa0xDeDVrRFBSUjZPVmFrcWxkWU1CMk5h?=
 =?utf-8?B?K2VrbjhTTGxzSU5TRGhxaGRNT1JXNk1PQjhWSFJVN2EvWFV6RzhGNUVkYmEy?=
 =?utf-8?B?Z25CdktPNHR2TnozTkhlTUs4K1MrTGJUS0lQVjJ6Q0lyZlNIclFPTkdtQUVG?=
 =?utf-8?B?cWRVb2dkcm9zSDdoTERjYitpdTdqQk5LeFRZR1hzWnpQM3N1NEloME5lb3NW?=
 =?utf-8?B?TVFkTTQvQ2VkSFV3UFVEU09GMzAzYis4TlgzY0tTQVFNaEhxY3JtSXk5ZDU0?=
 =?utf-8?B?VWxoMG5HMExMNkdmK1BvOWsvbm1DOVN2V3BYRDdLWnpKb0tlQmo1Um1yaWJT?=
 =?utf-8?B?OVVtNmdqVmtOSW1IM0RLNmd2UHArRUpsNXFVcVJaYU4rc0Ftb012WUY4azlI?=
 =?utf-8?B?VEVHL0Y2Uk5ET2lsek4vQjZGQ2g0SUJ4MEhpR3hGYkxwVjFzTGltNTFBR0c3?=
 =?utf-8?B?OUN4YkNMZVdVS2Y5Y09mUzIxd0ZhbUdjemVBK0FRYlZaMVdBWmxWaXp0bzR1?=
 =?utf-8?B?Y0dYOEVCeFVzRDNPbnVtTFlJSmxIOEk1N3oyTU4rako5bGJLZGNGZEdsKzlY?=
 =?utf-8?B?S0xxZDhtcmNUM1hTWC9qamtUa3V5U3JPVFBGZVBMYUIwRnM5WnZTWlltM1Q5?=
 =?utf-8?B?QVBBVUxwTkpJV1RwNWJGcEZuYzVmSDgwNlQwWlg4WHJvY1M4VE9Sa1VMWVoy?=
 =?utf-8?B?ZU9Zc05jYlZUWXA0RGovc1JHTUVWSWpEUm1aWTYyN0hYNTAzc2IwL0xoTEpp?=
 =?utf-8?B?eXhLcER3MjdPY0prZzl0Y1FEK3c1bDBBYzRjL3J6N1MzUllkU1ExR3ZIZXlK?=
 =?utf-8?B?OU5jUUFVRzB2OEZUcWQ0L3ZFbTFEYU5BNEQzNkZBV0I4MWc5SzgxU0VxZUow?=
 =?utf-8?B?c2dwYStuYW1rTVRkcnRCVjlIbk5VdCtFZGdkVnVpaFhyM3pONnFDQzhmZ25r?=
 =?utf-8?B?NnlvQ1JLZXlpcENkVmxhUkZlMWYrR3NsV0N4em9QNE1Bd2N3RmVhQUNPVkNL?=
 =?utf-8?B?YUtwZGZxc0tSTzVEci94eUpwR09JamZRSDVmTHJnaXM2cXZlMi9Vc216aHJS?=
 =?utf-8?B?K0xlMnREUHZvbHcwTjFBd3dQaElsdFMyQ0FTRUk3UnlkMTFPMXY2TUkwYlVK?=
 =?utf-8?B?SGVkRmh0WmNRSEMzeldmYUFrRGJRSjU1WHV1dzdxQi9mMHZjWGlBZlVyOEpX?=
 =?utf-8?B?OUNzeWphTTU2dGFBUjJwZWJ2Mm9NUlFVbUdaQzlkVS83UnNobjV3RDkwcmI3?=
 =?utf-8?B?eURMc3dXMUtwU2JJb05hQXBBT2tDSkw2djZCNERmbk93dDhGUU5NV2dWd1V0?=
 =?utf-8?B?dDMrZkpEOGFYa3JZQ2FEMXhGYzV1c3VnZmx2MGpWZGNiQVBmOUJCOVRSdU1O?=
 =?utf-8?B?cGxGTVhPR3FESU1iOGkrdHNZOFFFTmpqS0tkb2hLMDU0cWJseXVjemtVL1V0?=
 =?utf-8?B?VEFPUHh3amVDSlFrd3QvNHRVSUhBS3VVQ2huYlpxa1FEaElFbWJ5WTFZYXov?=
 =?utf-8?B?ZHBya1lYblMwUVF6T1BDeFdWaXlNazdmdndDVENOOHNHZG1LUHFpZnNtTWdB?=
 =?utf-8?B?V0FnWFQxVkxhK2RNa0t2MWFsSTRCeWFRNkZWWE9jc3pMb1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 10:46:55.1165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 082ac9ba-a5e2-4932-fdef-08dd023e28d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6200

AMD 3D V-Cache Technology significantly enhances per-core performance by
increasing the amount of L3 cache available—up to three times compared
to traditional architectures. This large cache allows for quicker access
to frequently used data, minimizing latency and boosting overall
efficiency in tasks that depend heavily on rapid data retrieval.

To fully leverage this technology, the AMD 3D V-Cache Optimizer has been
developed. This patch series introduces two distinct modes: Frequency
mode and Cache mode.

Frequency Mode: In this setting, the optimizer prioritizes boosting the
clock speed of the cores. This is particularly advantageous for
applications and workloads that benefit from higher clock frequencies,
enabling faster processing of tasks that are less reliant on cache size.

Cache Mode: Conversely, this mode focuses on maximizing the usage of the
expanded L3 cache. For workloads that are cache-sensitive—such as
certain gaming applications, data analytics, and other compute-intensive
processes—this mode allows the system to take full advantage of the
increased cache capacity, improving data throughput and reducing
bottlenecks.

Changes in v5:
	- Removed the extra line.
	- Added the missing #include directives.
	- Modified the splitting of the line.
	- Changed spaces to tabs.

Changes in v4:
	- Directly returned the result of function.

Changes in v3:
	- Changed the module parameter visibility to 0.
	- Removed the error log message.
	- Removed the error condition that will not be triggered.
	- Protected the data read case.
	- Moved the acpi_check_dsm check before allocation.
	- Added PM operations.

Changes in v2:
	- Used kfree() instead of ACPI_FREE(). 
	- Changed the ternary operator to an if statement.
	- Used acpi_check_dsm().
	- Used devm_mutex_init().
	- Removed acpi_match_device().
	- Removed the string format.

Basavaraj Natikar (2):
  platform/x86/amd: amd_3d_vcache: Add AMD 3D V-Cache optimizer driver
  platform/x86/amd: amd_3d_vcache: Add sysfs ABI documentation

 .../sysfs-bus-platform-drivers-amd_x3d_vcache |  12 ++
 MAINTAINERS                                   |   8 +
 drivers/platform/x86/amd/Kconfig              |  12 ++
 drivers/platform/x86/amd/Makefile             |   2 +
 drivers/platform/x86/amd/x3d_vcache.c         | 173 ++++++++++++++++++
 5 files changed, 207 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
 create mode 100644 drivers/platform/x86/amd/x3d_vcache.c

-- 
2.25.1

