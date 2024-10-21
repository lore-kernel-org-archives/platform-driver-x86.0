Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C391E8841
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 16:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729529924; cv=fail; b=gn2xoTJPJyYK+goz4dMnUOFn+sFnMBwD/TtuvCSb0ozLUnDfLh5Lz6hAJBzTai82ViSZfg1vCMHl+gyI078lB+5NUU1q8cAKQrl227V9/m3ubX74Nql4KLx7JTHXOxjrn18GPncxLPlELvw5vZ3wxgHO3lVRQw7CiqtwjIGAB2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729529924; c=relaxed/simple;
	bh=HFfwCEQyrZsZMQm4D16Lhj48fVRBpNHS4OGFoM1QkmE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i83i+sxMihkNRxNajHJ+Uj/jdWPXS5+uE5/S6lyrZb9Tv4FHT3x0nLilUxHlbXERvEEt5VZMRZ3/4b0mvzVhflE+UX0IJBpDZ/bTJ7kTnhosp9cTibx4343wfYW+kkjjxqsrmRNWUWinm6qm9ICuHSP6U2dpYM6Syn5xstlOWAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CQ2JHr+E; arc=fail smtp.client-ip=40.107.94.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CQ2JHr+E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcw4Jz9CoxYw/n6DFEXyd1YwfXlf/SrHKReJCzpsks7uUVejNDV++fjAkueGmUlWakL2eNIMGueKcI1gKx8RWQPjN/gc15GDMap6OhMhlkAT6Bo4gMXc7xETOlJ8VqDnhECSYfg0lbfwgH1P8dhe0UxycPi4cak/R03fsnc1PB3uviYkzoMJlU57lpkgkny6lbSaLyhsi7fJUMjbo5PKZNo76s9WmzUluE7yRRiZP7ZMuyNJdQYrWoWIIXclSbn9FIS0GY0gLWD+GlKAVpH8mqe5mJJZlHxuIb2IKTZyIImqld41Oclryv9Z1u6DLMDj/lirDUOz3yI33lSjpKjXhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBqtbDdjVLeoNpsCljWIiZPENpWetcjlv05vkRCvXIA=;
 b=QOhMDyMdo5u57bO/FFNeYX78y6qPtk/V9yxQ6Vzm9GubyVL8lJt4khpwbSUFOF70xjdpC3nK7K4kL3wrH0cQI7fwIxCrBLxfTWTfO7G1Gpr8A03lzfBfOkaLqnZAdam1Oh0vj7HT5ncj9CGN264HfgNACBuHXW5ickUNLNP/DkpbNl8U03GySnnDLRUT85nUjZfarSd+sO/Yfp7xqxVXEq6tw8PknyO56161twScSsvde7xgPK4CNmAqxC73nKqo3nLM7ChAXLbEUG/Q7Kzfi1OND/T1+UUDxuvYKR55ef7UMP0NmGGpW0e6xskAoTNa8CwZ0apEY2QgM67QIzBhqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBqtbDdjVLeoNpsCljWIiZPENpWetcjlv05vkRCvXIA=;
 b=CQ2JHr+E4PUcqNljJgzr9hvRtBcZOa9QjeD7jyYFn59wz6kvafBQ7wvNlp/ALvPs2tThHytLU82Zchn5G0RG9MdlUw6Tx+VE22pq4Vh9GlIUGQUdbcOMDeq8nW2aVtT8WhOKrVtqHKGGQH/rbaEGWFwnS1Huq0uBJ5bpbmUL+Qg=
Received: from BN9PR03CA0919.namprd03.prod.outlook.com (2603:10b6:408:107::24)
 by PH7PR12MB6693.namprd12.prod.outlook.com (2603:10b6:510:1b0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Mon, 21 Oct
 2024 16:58:39 +0000
Received: from BL6PEPF00020E5F.namprd04.prod.outlook.com
 (2603:10b6:408:107:cafe::f4) by BN9PR03CA0919.outlook.office365.com
 (2603:10b6:408:107::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29 via Frontend
 Transport; Mon, 21 Oct 2024 16:58:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E5F.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 16:58:38 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 11:58:35 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: <perry.yuan@amd.com>, <mario.limonciello@amd.com>,
	<Shyam-sundar.S-k@amd.com>, <W_Armin@gmx.de>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH v3 0/2] Add support of AMD 3D V-Cache optimizer driver
Date: Mon, 21 Oct 2024 22:28:18 +0530
Message-ID: <20241021165820.339567-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E5F:EE_|PH7PR12MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d75c272-9ee6-420b-c032-08dcf1f19bfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1AyMDQxU0tpNVYxWDRUUFFyQVkzZllCamlVTlpCUTV1WCs4UmthMTU5OTJK?=
 =?utf-8?B?dzFuaVJvYm1xaHd0c2xTTi9xazNzQnhWVWp4M3VKb2JhR1hVTjZPUXZ1NzZu?=
 =?utf-8?B?a0FtRUpwM1EyZFd3NkRLVGs3b0JBdmtlQ3piL1FwS1RhaFQyYWduc1FLTXVx?=
 =?utf-8?B?SzVmd1dVTnpoQ1JpQnNZVCs5UXhDMWtGRm5FQkVOZ0hCTTJ6UGFTVTBET29L?=
 =?utf-8?B?SHhXSCszTFlGTWgrWTE0cDhFRUxQZnpGYVUzcC9QOUFBajk2Vzd2dSt0RjNQ?=
 =?utf-8?B?UXhXL3Y4bnJLS3d1UEZLaW53UExCcVkyUzVtT1BsQVVjNEo1b054RWF3WENx?=
 =?utf-8?B?TFhsVmtFdWE0OXNsWVZrTkdIUDM0bW1Ma2xZZWhQNU5oUUxndnlTYlU4SzJV?=
 =?utf-8?B?TC9NRXo2WkZSVEM0dWlSS1lkajkwdW4zY1QyeURMWHJ3bTMzbzNlbWkydjYr?=
 =?utf-8?B?NndaN1V0UlJ4VGl4eU1yTTVSQXZsTHlUM3lxZ29YZjY0NmZVdkp1WlBjTzN0?=
 =?utf-8?B?VktHZ0JGMGtLQUhJUURIYTZoNTZtdG1yNE8yczB4LzVFWURTRTE1TG9GQ2Rj?=
 =?utf-8?B?UnpOZDI3VWNSR1BZRWhlVVpRd1RsR0N5SktVRFFXbVNsSC9yT1ZxUGo3b1h1?=
 =?utf-8?B?TUYwUWhxVHZkZGZjQ0lYdU5UdUhlTU1KZ1BPNjltNUIyci9ObTRtbzE2YjVy?=
 =?utf-8?B?OFlOMFdlaDNwa0dzKy9kMUQ5YTJ1cHVaVVErWm9nMlZvUFdwcTBlTGlJRjFC?=
 =?utf-8?B?eWljSXAweFhxcnJhYnExV3F2dUF4VXpnb2p3YjZYeC9DQXphTGlzQnNZNXEr?=
 =?utf-8?B?L05iY3ZSaWlNQm9mVnl1aWI0NVA2ejkxZzJ0MmRIZ0VmVHphblFOTmJrdUg2?=
 =?utf-8?B?U1FYbTRFUHBWbEIvdW1nNFFvKzZLckpyRDRhdHJjMWJQbmVWMjVTZXFBVTBy?=
 =?utf-8?B?ZHZmWlgvRERTTW9LTHR0aGxzSndMcW44bEFYOS9DdEltdXlZRjlvbFF1d2pT?=
 =?utf-8?B?T25sQTRpNE8xdDFZTExJOTNGeFozblZKeFJUQUJEL1BmbEdMaXpMMWxPQlp0?=
 =?utf-8?B?K0p3eEl1UUZOelRxSnNMdEdJcElVaTZzVlI3WDI1dVA5U2E1QURVY25qeHFo?=
 =?utf-8?B?ODdBVWpXWmp4VXBHZThWUWpuV2NHbkZCbXlNNkhSWk1CNzF4VnpwOTkwb0Z3?=
 =?utf-8?B?Rjl6OWZKYkxRaWM5ekdRUE9sRUkzTGQvRUlTem1KM1J2MjFyYVJTUkR5VzVY?=
 =?utf-8?B?U3NYdmhMcTRGbHM2UHdqOFczS0tiY3RBM1M1cFhmNFVoT3Fyd1B6c0EzWTly?=
 =?utf-8?B?SlNOOUZnZlJvajJTQ0FEOVNDclZvZ2pMMk9rQTYxZ1FwTHpoNkQvTFVIVjFN?=
 =?utf-8?B?UFNMZ3dLUGhXYjN6K0NGY0xEVS9ublMvUjdzUnN4MHRUUjVhWkxKdWFVeS8x?=
 =?utf-8?B?K05KdDBlRXQyZG92dVJlOFhRcm9sNUY2SzlZRFJrOUZWV09vQ3lsNzFKUHl4?=
 =?utf-8?B?Nm10d0pwbzNHL2dGODhvOTlRelBMRGV3NWRhMXVXTmd1NXh5S2VPT2tEMWNh?=
 =?utf-8?B?UDNFWHJkWm90OXJGQi9qdWFHWkZvQXBGMTJuZGJ1OEo2d20xTUtKRUUzWEl3?=
 =?utf-8?B?ci9RMGo1YnBnMmlEVVhXTlBCZEVwbUNPeGN2bG1LVXp2Y2FJTldidnpvTmlZ?=
 =?utf-8?B?ZWJvRGRBZDU0K1RMMzk5eFhSdWtqb09rVWRxVk9JenprdDR0cUtzS0l1Y1Fu?=
 =?utf-8?B?S1J5bkdIdTJjR3c3UVhKOHFwaGZua3dFV01iK1ZYeGdlaDdvSy85Z2NYckhI?=
 =?utf-8?B?OG1LcDlTMXhxY3lnVVMwRDV1cWJBbmFmeGhEeWM3UXhXOEVTc1BJMm9DcDBs?=
 =?utf-8?B?bEExUVluM0cxdE05MjdUa1Bsb0IrUzFHbUNVZ2E5L3pNTXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 16:58:38.5653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d75c272-9ee6-420b-c032-08dcf1f19bfd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E5F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6693

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
 drivers/platform/x86/amd/x3d_vcache.c         | 174 ++++++++++++++++++
 5 files changed, 208 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
 create mode 100644 drivers/platform/x86/amd/x3d_vcache.c

-- 
2.25.1

