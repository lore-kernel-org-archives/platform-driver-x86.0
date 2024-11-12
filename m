Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618E12123ED
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2024 17:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731431014; cv=fail; b=CxYtz7A7NHAvnqM5PaHsCoDOp+I0HEZ1h0jxJT+jb2Xb+l8EsFT8q0Yi2GQXyFmNxxj7JRr1vkpxzhP1Seb5YViI4kZHExrc8EZYjV81C/B6tI/63uTIdGvb8tBPKrlji3q7sjZVhN22F2lgvNCNEXqT0FcoJA4kfG6uJbDEqdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731431014; c=relaxed/simple;
	bh=af4CeV1vE4gXAPAlecNc2J6Ladgj4uND9UkVph8SYPg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EV/U2WPtU5xeGmPbjTIIvnw1lmqmiBgxPK5zsGEOnUvFKNety1/4nmyDey5vdWBdodLzlQIvk1Q6raz3P5DtEV1up1Arnn15IfmWmLw5n7F8K4AGc6EAmwwsSvC78VvkDxfcSbofy04rjoXrzoXIhQ0jVi8ttbV1by4FyMs7KzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DY77G6Lv; arc=fail smtp.client-ip=40.107.236.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DY77G6Lv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJVQmFr6AnwBbp12XRdyOUsfVS07tTE+Dgfgwf0/d2QwvFY1n9XgLj/ygIDlhezcc9O3jzRJJxhTy2olOuJM986Mttk9RA9dl5fo44QufphfqfMElwa9W2jg6PLWpC+1QCX5ESyns7+R6o4CLDmb5GcWbB7bSH1QaUSJ2jlE1G8TBLX9I4C2w/3AaDKsuJfzmkalV1h/mTI2cJplPlHb7nt5gFq7SpYyXkToAoojyMtsEqHFXLlUT62D/irkMU7++09icMekjSLQA00d7ntD/1YFE4d8vT0dYwaMpcTrxAVn0BLrZc79wiucDRZo/YSVmhFOe78HYEaDc4Ml2996dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcyAUsGp0OUS28O+kt+I7NrGn4qnF6vEmOnVyFe/f6k=;
 b=FMul+IuuR6Uw5f+k15XAMPF+TuYPxK03BWdHznisMukDft3Xp9lAMypstAJ0u9u7PCMvGCuUO00jNY/tW9Kd2cHpx+rkMsg7eUe174OpW+X3GGJm8mSkW50LpQM4Vg9xT/YyQv8ygm2Xy9uFnaEniNQzVuhB8zOgANCf4Jv80NdefVSuEZHV6opZ+UqMM9INvzeP/biTpQXe1/CEr9rr36kKGPU18+RuUcUPQlMuREz0E2gm856xuLk/S5w38CdyUJW6zGu406f3FKZPNFpWnwijsYh1+gUCJpxwS0VWyX5B/tg92vlfl5bozYdCnptBwMoVfRFhCMLG15SdQyIeLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcyAUsGp0OUS28O+kt+I7NrGn4qnF6vEmOnVyFe/f6k=;
 b=DY77G6LvBSRqJOMhoAglk9NoXNxm0DGcGFywshQG5yPT3zU+Zz8kR5qMwE1tyMyY1fX4KrveHhJPJOwZJXOtfxfubSH57xM5z5ff/YzeQKfu9csUxZ5suIf7zXfsK0aZcAT4P2F72hJw9109AKu4pclUiQtBRZmAYFtJN1aD1sM=
Received: from CH0PR03CA0385.namprd03.prod.outlook.com (2603:10b6:610:119::20)
 by CH3PR12MB7761.namprd12.prod.outlook.com (2603:10b6:610:153::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Tue, 12 Nov
 2024 17:03:25 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::44) by CH0PR03CA0385.outlook.office365.com
 (2603:10b6:610:119::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Tue, 12 Nov 2024 17:03:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 12 Nov 2024 17:03:25 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 11:03:22 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: <perry.yuan@amd.com>, <mario.limonciello@amd.com>,
	<Shyam-sundar.S-k@amd.com>, <W_Armin@gmx.de>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH v6 0/2] Add support of AMD 3D V-Cache optimizer driver
Date: Tue, 12 Nov 2024 22:33:05 +0530
Message-ID: <20241112170307.3745777-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|CH3PR12MB7761:EE_
X-MS-Office365-Filtering-Correlation-Id: aaefc1d9-db09-48b3-c9d0-08dd033bec1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T05UNTJhUTlQNUMyRGhEaTVIcS9kNFR5Uko0cE5qV2EwdlJLblI1aVdkWmxO?=
 =?utf-8?B?UGMyWEpWbW0vYWk0QTJIeXJyeXU0SHpxdmtUOUttcnFZVWUrSmZnZ1UvbG5z?=
 =?utf-8?B?dVRCRWVDeUYybjlwV3FTbTNoWUZmTnVWbzlGeGMzVWl0UldHY1hQci9pNDNu?=
 =?utf-8?B?R1EyNGZEQUJNZXVqemxWL3UweUV6WHY0eHFCMXhEUnc0cG5vdC94MjBhYXMr?=
 =?utf-8?B?MUMwNkErQlF0NlhnamlWMGgxc1ptckcyWTJtbFpmUmdXbEsxMk4xdjFDdXow?=
 =?utf-8?B?a2gxS0xIUzZYU0Jpazl5Z01SYURaS3g1UVB2cDFVTG9iY0g4bE9NMHFROXBs?=
 =?utf-8?B?U0hCS0wvSWdraFVCbEJYMG9ONEpHc05LUXh6ZFdONUZlb01pMUNhcHp2Rk1n?=
 =?utf-8?B?TS8zQXRPR0ZySWVPMGFYWFlYM2VlTTc1ZzV6UmFwMGpMa1RNVWdKVThQbXo2?=
 =?utf-8?B?NDFGbjVlTmNYd1NMT0JQazBZaGpVWis3Y1RVQVFGMVRpbkxDN1RIdTNNaGlQ?=
 =?utf-8?B?cEdRaStoRGFJNkhEay93dW9GZi9SeHhQWjJMTWM0aXRXMHBRWEVIVGREaWRt?=
 =?utf-8?B?a1pjYVJVL1RIQWQ0eHpCWk5TaFJkUk4rVEJsaVhveDZGVmVBY0lRN0R5ZG9U?=
 =?utf-8?B?Q2FPWW5YTUYzWGpidTBUNFpXeVpKTWwzczBmVmEyUEEveTFEWEIwdFdZMVBl?=
 =?utf-8?B?SStkRHN4dGo4N2haSGlKYmtpcGdGbDNCb09GSUFtdzFMQmcxcTNBTHh4VkhU?=
 =?utf-8?B?eUlYRU5QMy92WnRoSk8xQVp4WUxtaWJwMzI2TjBVUW5vbHpzY2k5akcybDRQ?=
 =?utf-8?B?QTh4Vkh5QVhhcTBuQ1RROXlrSGZkN1Z2UStPd2dPZ2xMQ0J6Y0wrSXVHTHdn?=
 =?utf-8?B?Y2I4YytSYVRENUJSMDR4OWxWUFZ0T2JiOTZFU2tGZ3VOTmw2L0VRbGF0ejFh?=
 =?utf-8?B?akxsN0Z1RHFIc3d1ZFJEQ1pDclFMd1RiV014TkRUWW1WUmtvZkhRVER3UjJP?=
 =?utf-8?B?Q0dMaWNnQ2xVOE9tQVdQczcxdDMwWWJKUkxTdWRQOXRXMWx2Sm5haFZVSjda?=
 =?utf-8?B?SGZ0TTBxTngzVUpXbzJNakwycS94VkdGWGlmRThSQkFuSVY3amFXYkFIUTBP?=
 =?utf-8?B?UjhiUnNJN0YwYVBnaktpRWE4M3M1cmV0SVRuMW5jQkEzV2xTSm90MU1oVnJr?=
 =?utf-8?B?SVcrdVFBTzNYbnZ6WHZiRWljVENWWFpMVURwQWRKdnMvdGQ3RWQ1a2JxQkJE?=
 =?utf-8?B?eUtIQVVtUUl0TDhneHFzcnhkY2EzVEN3V3hkTjN4NC9iT2pYaitpVUJ1cGl5?=
 =?utf-8?B?NnRncVNhOXhoNk1NVTNQNTNaZjJnVkhRNklnNjZzd1lMZFA2OFNMRGVLQUhH?=
 =?utf-8?B?MU5nNC9GbTlCU2VMSWcwSDZYelV4RUVyVzFCUjhIYmdCUDU4NWU1VGRUOWhW?=
 =?utf-8?B?STZXMFZ3Rjc2dGNiK1M5a1VNVW5LcjdQRktmYXBDNDBGRGJxNlJ2eDhTSm0w?=
 =?utf-8?B?MGNMc0xRcjhiaDQyNy81QUJ0WURDdXJpL09CMk9MVVhESGIvZGQ2SjNnaFhH?=
 =?utf-8?B?b1hXNXRBc2laUHhKU3Y3Mjh3ZjgxSFZpb3VuN2RUYlR2UkVyUFUzanc5YUVB?=
 =?utf-8?B?blIvSmdaejVWSys3clZhQlBKVDBJeDhBV3RvUE9aSW1rRWFMOFBEOFNMV2NU?=
 =?utf-8?B?WkdOVGRsS2xnV2RnUWMwSkQxWHBJRlJubVJoMVFDTjVHSWxTNVI2ZHpTMU1q?=
 =?utf-8?B?RGZab3NSRlNqMk52Rm13bGFNR3cxYUlUZVZsT0xjU21VeDkwVE1FYXhaWVNv?=
 =?utf-8?B?RXltaTg2MWcyVTBvVm1UaDc1NmZPdktGcGpJMVBWaDJ0Z0l4N2FUa1h4YU94?=
 =?utf-8?B?Ull4Nnd2Rno5NmVLUENPTi9ueEtSMEtMbElvYmhoUkRwanc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 17:03:25.5000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaefc1d9-db09-48b3-c9d0-08dd033bec1f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7761

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

Changes in v6:
	- Added error checking for devm_mutex_init.
	- Rebased onto the pxd86/for-next branch.

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
 drivers/platform/x86/amd/x3d_vcache.c         | 176 ++++++++++++++++++
 5 files changed, 210 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
 create mode 100644 drivers/platform/x86/amd/x3d_vcache.c

-- 
2.25.1

