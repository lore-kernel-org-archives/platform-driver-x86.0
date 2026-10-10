Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011003.outbound.protection.outlook.com [52.101.57.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6777736F905
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 19:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791659180; cv=fail; b=jse6yhtyKAzIv3Q50rruy34nfvn8ms8EY3JjQ15fhDam8izjDX7tDDL9hJVcGBTW9DyeaNZPrNGr/H82kHeXSf0KPHLOat8GLi/+ANuuJIA2nQOxnX1Ztbkx+YmNMjzbEVcaa3WUAWQ/K+jvwQtlirqJRcefFv3tdif18key1to=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791659180; c=relaxed/simple;
	bh=HNK/SRzLI3b+MMNGXFzU9/3BMjz6XDtbhLS+wDtaVIs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qJoj/iFrYuOLpxZy3Y5xrvDRMqp8pzZFXWMPaiST0uZHu3Aq7Bk3tj+Me816CDCInPXitbcTsD/Ls1bTrcoyBj8iFLX64gCsbB2hoNp/LoIllm0Hpbsar/YdRg4++RccdzTOh88sQFdP/t/KJ1oQ56x2eprSgavSuF+eEo99kdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ne9WUSvI; arc=fail smtp.client-ip=52.101.57.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ne9WUSvI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9f/nyUlra+WP/H1qjDEK6mUk5sLqgLg8lTMX/JTr1WiPgSDfa+TJBcDpowDSeSeI+r1lAKrMkF/8Lw2xmZpxvz+Ao1ALFBlub82zq/phJLQuILFxGv7MKismtwmaxWRhabjzJLezfMg8cRAounL6vuO8aLZGcK6e9S9uKSaymWnuIm+YyAElGyu0biiWNJgqf90TTBBsdVd+ajYEUIfUyGKhwLlqVg9JIIGA48/Eob4lXDF/WAz2WzRi/DJif8Fq7zld2mHs/JFlCaL8NxwbdIBmCzmaeEbaRvf4aZ8+Z54hS3sN/U432CnihJlgBpQScRmOffbxXmdn23okzaEhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXmq0Jt3+f8WsbqyVdGI1drHHQc+xVSRUY9pod31cno=;
 b=RSa1/V5q06s377dBGyp39v9/MyWRi7qIu0EGi7zJTalxXP+Rh/mzLPn8DkOhmtknw//nCVWQkIu/A0rvM+zZAXvJhvL4nFpAxN4nlRjPPC0XdE9WCK4Vc2GpMgwbxPU4eEyoDpil5MzQTra0A8gFEI8uzhGPrW/q+Nst+sNHGya8AepvjldgKM7BfHocN/hCTUfXhVM/zWf1Rg8SKFHp1bCfy8UO/wnwK8d6Zz30SFHlflAfLd2W1o58kuE2EgO+m7qNcCyO/sTym0hNK4tuJc5xYtbC0NKP6sEOXg9eabl2bHjBjHeynozm9u+23Iobhy308qYx1uj7itbrEn20kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXmq0Jt3+f8WsbqyVdGI1drHHQc+xVSRUY9pod31cno=;
 b=ne9WUSvIsljUMEUEW3P8d6ZktxbkO2IbLzH7d3uFOF7xLZupW0255WYZj1LArD5l5P7mDlwgDVpbABjdmPJqKkC8whYytonzpyXbMbaJ9XAZlDE8ZeCzCm6SmmI5YHPNqZzxI5vX9rj8hB7oc6XWe7lBnjlk7Uqc0T33CHCHaog=
Received: from MN0PR02CA0006.namprd02.prod.outlook.com (2603:10b6:208:530::24)
 by IA0PR12MB7675.namprd12.prod.outlook.com (2603:10b6:208:433::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Sat, 10 Oct
 2026 19:06:09 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:208:530:cafe::94) by MN0PR02CA0006.outlook.office365.com
 (2603:10b6:208:530::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sat,
 10 Oct 2026 19:06:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 10 Oct 2026 19:06:09 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 10 Oct
 2026 14:06:02 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>, <W_Armin@gmx.de>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 0/3] platform/x86/amd/wmi: Add AMD Overclocking (AOD) WMI driver
Date: Sun, 11 Oct 2026 00:35:40 +0530
Message-ID: <20261010190543.563161-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|IA0PR12MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: f35bd864-ef59-4bfe-2f79-08df27018b49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|56012099006|11063799006|10067099003|18002099003|6133799003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	jTp+jGYMgKsLNRWz+2UYLOCMCBiUAeWpHN4WnuPZod8ozGT91sqmTyysgb1z60mE8ZlJHv69OeLNdFFjgF/lH13OhDEZI86qXoteM/fq4smAVlIu/mZn7LTZdFffBqTLzbPn2m0xbGt4tY5j/NKWdgpN0CwJQ38bGR1mXdpgrprrgXNxeNzqihPk3Q7s1uQBCNxeFQWLfMIKtGk4NOFZIiA3GhCBZAvlIQF+T9ARC2/PlHlDixuzF6+6ZcFBD24Xblx6lz0hBVGzZfvykEKx4gfolNOe52m1ok72XDGArEewu4Ic/NPESxECU+DLHBUhjNpjd1bQD+K80bkbCnSDTIjJdFpy0e++gNPQiCkw+tBjd8+lrM9UjZJhYeBykNuDnyCe+xsM9bYAlMuYKrlDKiiLfkOEFs8X3kcISO8Hb+Zh6iggJCFnhqewqtyVHgnot5qZ7NwJH3raKJfBuWItzdyCdijnAHY9ifo3ekGlGJgf0P/MDlxG7laYogEeiUuogsNqClzRI7fPLUdExc0lyTqAPuYCVTr/OwF0rD/hcUYRI4fwVxBRQ8JifGG1YnDp86I6NH+5093vBsNAQOjSOJTvZWXkO7wzMj2AfpDXroxnx+OlZFgGhjIlYek0OsgmOH+3r49jSheoOoC1qK+0/FF8IS8TKkcdmS+SXZf9F1cbNqqzc5uCli4zojqz50xGPziTBjIxnlDHbWiWg954oQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(56012099006)(11063799006)(10067099003)(18002099003)(6133799003)(261009223027099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RjLAH1VWbHOoC9rzeaO8KKK/WfZzAIZ1UqmX5sa0I6upGvKFTDH3wD1GRu8+n4WPwj1muw3EqEeslCf27ThLcECRRhoVYdiKIY3Pn0y0nghfvOhLRrswDFieDd9JYiIC/2LobuWrLFZVVgZOPo/ED1BmiH1vQ5QS2gxgYJyTk9l6NjqhYCheOKbrqtYaP8UPfKzdhVuuZajl/YfhwLBDlSObqq3j8tgZhxB6tOZCsbcXYhbR9RxfGMOemVit5OD+tGvQH6p3UNwrU4Dv2nJNgJ+ua0fic64xL9isY7/VE+WhOrZo+uTpnXcMmjXeLM7y7dwU2/+b6qVqkqocKGPkMOloJRa9KPE7vkfDx5rsdynMRFgTqd069SlGybBmI3gLpVoWZ3NAfUB+qhxCwtGkTJibCeCB7uQ3DG8DzkLl4EnrSpQCQQO4Imt1leK/ioKW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 19:06:09.4813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f35bd864-ef59-4bfe-2f79-08df27018b49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7675

AMD Ryzen platforms implement the AMD Overclocking (AOD) interface in the
platform firmware and expose it through a WMI device. On Windows, this
interface is used by AMD Ryzen Master to change settings like the CPU
power and current limits.

This series adds a driver for this WMI device. This is an initial version
of the driver that exposes a small set of settings through sysfs:

 - PPT, TDC and EDC limits along with their supported range and step size
 - SMT enable
 - current memory clock (read-only)

The firmware applies new values on the next reboot and does not report
the active PPT, TDC and EDC limits, so these attributes are write-only.

AOD and HSMP both touch the socket power limit, but at different levels.
AOD changes the firmware setup option (the PBO PPT limit), which is stored
and applies on the next boot. HSMP changes the runtime limit in the SMU,
which takes effect immediately and is lost on reboot. This driver only
deals with the former.

The firmware supports many more commands, and the sysfs interface can
grow as needed. The raw WMI methods are made available through debugfs
for debugging and platform bring-up, this is not a stable ABI.

Patch 1 adds the driver with the sysfs interface, patch 2 adds the
debugfs interface and patch 3 documents the WMI interface.

The new drivers/platform/x86/amd/wmi/ directory is meant to collect the
AMD WMI drivers over time, along the lines of drivers/platform/x86/lenovo/:

 - one driver per WMI GUID, with its own Kconfig symbol
 - aod.c (this series) is the first driver in this directory
 - amd_halo_led.c would move here later as a separate series
 - shared code goes into a common helper file once there is a real user
   for it

Shyam Sundar S K (3):
  platform/x86/amd/wmi: Add AMD Overclocking (AOD) WMI driver
  platform/x86/amd/wmi: aod: Add debugfs interface for raw WMI access
  platform/x86/amd/wmi: aod: Document the WMI interface

 .../ABI/testing/sysfs-platform-amd-wmi-aod    |  98 ++
 Documentation/wmi/devices/amd-wmi-aod.rst     | 291 ++++++
 MAINTAINERS                                   |   8 +
 drivers/platform/x86/amd/Kconfig              |   1 +
 drivers/platform/x86/amd/Makefile             |   1 +
 drivers/platform/x86/amd/wmi/Kconfig          |  19 +
 drivers/platform/x86/amd/wmi/Makefile         |   8 +
 drivers/platform/x86/amd/wmi/aod.c            | 916 ++++++++++++++++++
 8 files changed, 1342 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-amd-wmi-aod
 create mode 100644 Documentation/wmi/devices/amd-wmi-aod.rst
 create mode 100644 drivers/platform/x86/amd/wmi/Kconfig
 create mode 100644 drivers/platform/x86/amd/wmi/Makefile
 create mode 100644 drivers/platform/x86/amd/wmi/aod.c


base-commit: 69f80fef3153299d9c72c53d1d71eef6354b6926
-- 
2.34.1

