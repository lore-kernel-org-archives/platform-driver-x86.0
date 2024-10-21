Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4A81D1F4D
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 13:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729518442; cv=fail; b=MpOdYCohYDtSu2Fzgfgieab47VYLsgAF2e56rPJmVfUUIbDLOfDM23lwiU59N3mwJRG8j1uyzOomwrtBpcSustpYgd37zXLPD+4hbuyDTSKO9XCT0wOLRZoCMcCg5aM/sjCuR2J+nS1AAITy7QN9XyItyriLZOsoInjQUAvOYFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729518442; c=relaxed/simple;
	bh=9S8aoG0oEY3z02VTSdao9pSFLcL0h1l75hC3W3bGTlM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zpxr2QH7KhgFsEgNQy+4+eSkAmbRTlMWVez/o2sdty3jJ6YBn72G1FUSJBvgYfU6fMoGq3KvdkKQXa+R4r516pLLt5dCT7qLntgT6Y5ALiBgb7yF18WE/LYAuw9dNRiwSm7twrLEfatWLX+A3/ShZyluK25sAu6ugINIUGsHDWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EK8FMV6w; arc=fail smtp.client-ip=40.107.92.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EK8FMV6w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrNFxVtIFl7jhcP2Yk5p4Zk66g2ceKCm33tL1GBlYYdS87UAvJ9riYDoepIkbVoXmYcXjtkxk6L8z9qb9nuCipeM0KfE3bJVbdmopPPtO67bPJzw2iYfRF26dwvCjWv6TDlDK0ddiOAhKmRT+YisnuYo/4UNHl9J5ZYX67iYhNJifTfwtg0NYlwrTIP41EnvTQ/iZv5NxD/DV18wnAlUV/CuKFujBJHPw6GbjicVHe5fuVCvpcaLgHZQgtjDHG8expvP05ROwMaSUSJp9gJ2JlR8s8mN+hKuX1lMvgiR8GD2yRXWg29n/jBhk33eEraFJznIhoNe3NgRukID2Bfrag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sM2Lr97dLVDSIcahH9loPnrXhmxqpbM8KG3f0sbsiyc=;
 b=QYPubG0mzUqWVfygJ3OG3pPseHFXv4vtgcV0KzkTKSV/yUtyp2GRGgKMRgJGN/7uNk+WNe2V+vCuxbz3JHWYgBpogkeXYgR1yzPwt+ohfvfqYUx81fTMlbYUJ3OY8j7lMsNafn0XiNv0nCdJnUr8c8CpsCNFT+U4IHMZwc8LXNFcy/glGNB37sGINkXyB4NLTelm+2dWKN94ke4lBj0Y9RVzCAtxkludpo4jofehjX6vd1UrbE8BAzvQ8po+mV9o2vuZhJal2z9s7TJlcOoQTqkneZpXJFt9X3L6j04mMRiEtiHUZwYA1R576aGII8VPOsrjDihD8tcYYYDEJ3ar/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sM2Lr97dLVDSIcahH9loPnrXhmxqpbM8KG3f0sbsiyc=;
 b=EK8FMV6wirsQOV1KLP52IwfWJ0SkdhMM8bI4ojmYDeDoW/IYw6Ewh2lS36dj9WgnERohMHBgK2NdfRft+csPxggOS+XA2y4n9BfTH0gXCSCGLbRaCayk0mtdFJ/lhUJomR3p5HkG1iIhzNnjLBWztEuG+9q/YZKNskmkMPz6BT4=
Received: from BN9PR03CA0861.namprd03.prod.outlook.com (2603:10b6:408:13d::26)
 by IA0PR12MB8984.namprd12.prod.outlook.com (2603:10b6:208:492::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Mon, 21 Oct
 2024 13:47:16 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:408:13d:cafe::d4) by BN9PR03CA0861.outlook.office365.com
 (2603:10b6:408:13d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26 via Frontend
 Transport; Mon, 21 Oct 2024 13:47:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 13:47:16 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 08:47:09 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: <perry.yuan@amd.com>, <mario.limonciello@amd.com>,
	<Shyam-sundar.S-k@amd.com>, <W_Armin@gmx.de>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH v2 0/2] Add support of AMD 3D V-Cache optimizer driver
Date: Mon, 21 Oct 2024 19:16:52 +0530
Message-ID: <20241021134654.337368-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|IA0PR12MB8984:EE_
X-MS-Office365-Filtering-Correlation-Id: b843078f-7f82-42dc-ec81-08dcf1d6dffd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDR1dFZXb2hqTmVhK1luM3lVb3pWcCt2QWozR05OTUg4NmhCK3I1cUhpUE1M?=
 =?utf-8?B?elBpa2tmZzB4aDRTRlFWdHZucUtVQmVqRUV5eVNPMTVEOGpCdTN1clJsTkNG?=
 =?utf-8?B?bTdVUnRGRHUvUXJDWUxLVjI1djg3NSsveTMrUUdGU3lyZkQyb3JOc0xvbXVJ?=
 =?utf-8?B?RHo5Z1U0N21Pb2hYMm96alljaWo1eFkyWkZGRHFVRDUvc09kSEhURXpQMDFV?=
 =?utf-8?B?ZjJhY2ZWQ0RHbjZycFJFSnZXR2hYTzlNMnhzVUo3Mm1UV3ZMMldneWZOaFJt?=
 =?utf-8?B?NlBUcW1GaWk2RitSNE94Qm15YWJNWXNwZ055aTIzMFpkMHl3R0xxY094eDhm?=
 =?utf-8?B?NUJlVHM3dUQ0RGJNYy9OQUczcGwzYThuUXJBWFJSdUg2Uk91VkM3SlZaM3Bj?=
 =?utf-8?B?Y2owVHBSaG1zQmJFZ3VCZ2NMVXZQL2duUXRNWEl2Q2pkbU1YUGxLMVRVTTZK?=
 =?utf-8?B?THZtd1gyVXVUand1cHdXLysvcmlyRzJWcXpoNTJlZERNcEdJS2hsZjJIR0sz?=
 =?utf-8?B?d1VoZ2xDRnV3dE5kNzlZc2s2Uk1VSUo1a3ltVitFTXE3endsalJuZlBhMlJj?=
 =?utf-8?B?L3BaLzQzUFlXbTl0N0Z3ZmNPV1o4dzNSWW1ObDNkSHpOSElVMGNyYStrL2JV?=
 =?utf-8?B?V2JVZTlncXVTMVlTdFJsU0dCNmI3Nlc2QjE2YlNCTE5ZbGtoWmRIS0VSQ3Zy?=
 =?utf-8?B?WXUwNFp6MWRYcjQ4d1gzUDIyVXZUL0pCMEpuQ2l6Si9GOGRoNjlaWDB3QSsz?=
 =?utf-8?B?TFZrbWQxb2xKU3BnQm1tZVB1dUt6b2tMOWlNM1I0ZUh5ZlVjZTArVTdSeVI5?=
 =?utf-8?B?NkxkR05NL2dpclNNb0t4VVRTMEZYZHpZNm5WcnBWMVY1cVhIZDZHVDcwVE84?=
 =?utf-8?B?NWl3ZlNOaGozS1lHeTJXWUkxQjdmdk16aFZ6NUtjQ0xkRjhmYXRWbzA3dUVn?=
 =?utf-8?B?OG1wcnh2bldDQjdzZkxZZmJHSStKa0R1Qm94bnNwNnNpOG5jRERPNVNRNEJ2?=
 =?utf-8?B?cXZoTk9IVnZpWWhsQmNCZ3BKSW5rTHRkcWpvSWp4ZEdEN0lCdXlaVTFrbWFH?=
 =?utf-8?B?TzI4bWFaemFhNGZwMXZiMlpIZjR4SXY2M1E1dE1VMEJ0UGhwakVPYWhoN2FY?=
 =?utf-8?B?MjlvWVVYMm5tYUZGcVkxaXVyRmQ4ckU1TU05RENTZXg4cWZ6UTNxZmJOQkVK?=
 =?utf-8?B?RFpDTGd1R0p3Ynd0aWt6Y1Rha2tPbWRpWDlQMGJBZUtVbWxDemhhdVFMSm4y?=
 =?utf-8?B?Y3BVVFdqTUlVZjQyclp2YVdKdVU5U0MxbnBuT3FtSlhWRTJUclROMWpJMHAw?=
 =?utf-8?B?YjhVVVBpenY0c1NvUHNCWWNwbVR1dDNhTVBUZ2JxSVFPQ3dvT0JuVi9LTjkz?=
 =?utf-8?B?eTlGL3ZueWVLTmYxTk4xK2gxdzZLNHFDNHFNL3BDcktPTVJUMk0wUko0R2wx?=
 =?utf-8?B?WDRkY3E0NDViOWhDa0NseFhtZXRoc1B1RnMwMjNrMlhOMnFIU25XT2MrWFU4?=
 =?utf-8?B?RlhGN3NSQW1FVjlrOFh6NEViUVIzU3FrQzV0T3RXTGl6VlArOVNyQXpjUEVk?=
 =?utf-8?B?bEc4NFhDcnlhVmtHdDhTakFqQnBuVktsZ2RLMUpvNSs1TUJ2dnpBM1NQbWVq?=
 =?utf-8?B?K1JLUzQzczNPeW9pRkFSM0hFRnUrSnVxNGEvMFl1WnM4SmhwWmEyNUJZOSt2?=
 =?utf-8?B?Y2pKOVkvdUJwTzdyeWxkYTkzOS9NZXFhNFJTT3VVL25mYXlMZ1JzR1phekVx?=
 =?utf-8?B?RmZlYmNlQjFpdHlsY2E0elB0N1MyRnNJbzRFR2orYk45L2NRbWdSVlROK2Vh?=
 =?utf-8?B?SFJJUXZnZjB0ckZZM1J5dWZPY0UxTG0ra3hCeWo0K1N2VXVIZGZja25IeWEy?=
 =?utf-8?B?ZnFkTmtHZmkxS2ZXTEl2a1NTNUQwUDhMSVdSTW1uNEpNUkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 13:47:16.2398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b843078f-7f82-42dc-ec81-08dcf1d6dffd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8984

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
 drivers/platform/x86/amd/x3d_vcache.c         | 160 ++++++++++++++++++
 5 files changed, 194 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
 create mode 100644 drivers/platform/x86/amd/x3d_vcache.c

-- 
2.25.1

