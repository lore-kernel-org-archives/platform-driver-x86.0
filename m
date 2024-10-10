Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4E51BC06E
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Oct 2024 09:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728553400; cv=fail; b=knxTsGfsJRxES1q5HA02VlbJKuWoRBq9pioSla+Ni76fdJZ2UPZg+slTo1f7xyFZIzJbJbmxu5nvZofPAVBYymndEnAQve7kj4dPvaWmgczuBKGsPzb4mesG32/9S/R5dLsV716Qq18Kvahwyq2DtVePC+hVUAWujT3UYYD1FZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728553400; c=relaxed/simple;
	bh=tKys+84anmpSDOv75mTnZYjAbw6wkdKAp3MaRcEJAps=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SiIvz6sKnY0PV19s5KsP5Sqp4stQhWed3dSM8kZVuR5Zqh1DFME5goxJ/mCqMYnf/TTFoFgS66GM0u+9Dj/Fj10ngW3AMs1bVnqxyyAEss7eN7lf4tUTR+Vc35KgBGFdHwy6jwf82ly1bQXj749S3cY1RZ2N1ACS9VVlG5xODhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aSHP2J41; arc=fail smtp.client-ip=40.107.93.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aSHP2J41"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u4qD8u2bhIO69Or6HaLHB3ZwBSNkdMKD58r139IAeFxiLUMxZnfTN5aQsxRprG2pZw3suW4JcKgk5WswCA73rYZMstnonRiWgIV1wLXk/zAGgJNMJFg4tuaPWlhUSZfccYHsNyAPscaLdaR1mZwXLLn4/THxsbHM8CeM7l3ztCG0zCAxDATYrfJ66VgZG0fUxVLuO1OQRf9CgbeLef0mBIhxSH3h5oBdTSYnZiXHhqhlo23yVeQgL0aggqM91FwbLWwUYjafF3KFN3VNXLTLqHOJdzkS/NsI/99z0gqBIzUBkN3b8a0byK4lVPsjU803CYlSfYiPur279uOZwiEkiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niJ1KGlgJdfezy6RObLQdOfoWZztvTe1AvKKj9f5BUo=;
 b=fv7q/czXcZp2tteGkutSXbPx+WuvkY33nQJorGy9nR0fcmMm4Ylnxj1fQ9GJxrkwbLX4E0/dYZD5z0vkOmPntiASOunDX+jciyuWmJwtYGtmMDE+9brU9VHRDsxnXDLb/TF4bAtxQPYYdejss/a1GNJ7OR/IpmDT1YCOjQH3VbeaBCSErdGutuBsUXPOg2TiRP5RpxvfuQmHiQ7lT2CDSq9oba9vX4iSR3LCeyb68IkSLF69Ju2nbY6Js+dpqsf4pxLjQIfQTDWbP6Zb03zmyALpWOTO2qUn7rTjdL4EM4loXd3g/F9N61CnGN0OLtyFf3Gxtt1R5ubrexOKD0C7qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niJ1KGlgJdfezy6RObLQdOfoWZztvTe1AvKKj9f5BUo=;
 b=aSHP2J41wAg+acVhuRlzzQqhntoHzNmEyiqxoue/D6aVjK60bAWDTiqNVg/iTvoidxjkrAk7kyLtZZ2S4VgiOhgAZyDiAHKPB+ifUwcUdznAiIExuO+bsOmf9Z7hBhQe6U0Efhzu4hclNOabjK8GcUhrYL+9GfVGJtrg0dMQ8v8=
Received: from IA1P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::16)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 09:43:13 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:208:461:cafe::6e) by IA1P220CA0012.outlook.office365.com
 (2603:10b6:208:461::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.19 via Frontend
 Transport; Thu, 10 Oct 2024 09:43:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Thu, 10 Oct 2024 09:43:13 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Oct
 2024 04:43:09 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: <perry.yuan@amd.com>, <mario.limonciello@amd.com>,
	<Shyam-sundar.S-k@amd.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/2] Add support of AMD 3D V-Cache optimizer driver
Date: Thu, 10 Oct 2024 15:12:50 +0530
Message-ID: <20241010094252.3892406-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: 9da77818-9e61-45ce-f955-08dce90ff580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MW9VeG9ZaWFWc2Q4WW43RytURTB6cEM2SmVPMkk4UVRnK3VLTC9UZ0cwOVZj?=
 =?utf-8?B?SC9BVkk0MmZuM3V2aXlZSFJZSmIzRHY0QjB4dFROREM2Nmgvb245b2h4cEtM?=
 =?utf-8?B?VUJGRDBjQjZsd2VrQjY4ZHpvalVKK2VHRGdyMkRnR2VkY2RkZW8vNEwxcSti?=
 =?utf-8?B?ZnZyZlBZaERsZnZlMGVQSlN2LzNVVjdKNXZETmkrU0ttSG1rbXM4bU84T2ZW?=
 =?utf-8?B?em4zRi9aZjhLSHlTeWYyTlh4cTV4VGQ5V2cvZ0YxbHMvcWpoM0lPR3d4ZG9y?=
 =?utf-8?B?cElTVDNEK2M4bUY3alphTlMrOWh1THJIZXorV3pxRlFVYVRpejFQMFI2SnI4?=
 =?utf-8?B?aXNRZWk0U1E5YnJGUC96b2ZvdENOUFZXa0o2YUMrNmJnaGFhOUw5MXNGQjVB?=
 =?utf-8?B?WUpFbW9DMDNzM2Mza2twODdnTk9scWk5MERsRHcvSWxmVFZReFVSdVZxbXdk?=
 =?utf-8?B?OFdTazgxZlIzcVVGVmVabVpselI1TVJISWhLb0ZGNVVHQUNJbCsycm5RVlZy?=
 =?utf-8?B?T1I5WGdGWWRqbVBaNytNQnVKN2Q5TmY1NFppeGhmSnVUL21zaFp4VTdrNWFU?=
 =?utf-8?B?d3RVaUNxb3ZQQWVOSHpScSt6VVR4R29MM1o1Y3BKTHBTaGQwb0lnd09oMTg3?=
 =?utf-8?B?RlQrTzBndEpqaDNPMEJySWk5Z3I2NWhUMWQ3TThwY2t1bFI4V3I5RU5GWWph?=
 =?utf-8?B?ajhqWWphUjdKVlUyMmExZktuL0hCMVNXVkUxdC9lZG5CaUVDazMvY1h3cm5J?=
 =?utf-8?B?RlM5YzBGem5aVTVOSVY1TDdiQkFCajNKV3MycWlPTERqSDFEeVhBeGNTUUdy?=
 =?utf-8?B?R3FxSUw0UGVzMmxJZVMyNGw4SlFFZUZrZldOMTVsNS9YUW45Zkpzb25SNFdy?=
 =?utf-8?B?bGRMOVV6MFdsYzVpYnBiZHI2QS9kd0FHME44ak9iU1ZDZWVTNllnVElVazgy?=
 =?utf-8?B?NEJCdkhXenVkRDd3bGt1dFpENE5xVEMxaFdDOWFIVERJSmlQNWpuRVFCWjRB?=
 =?utf-8?B?QlJFQUh4WFowWDdJdkNTd3ZoL1dURzZMNGVxUytPNGRnOVE3VGcvQ0FGamhN?=
 =?utf-8?B?N1hhbzlzaFZrbFpQMmRCSG5ZVE16SGhUWUd0cHZQbWxpRlpKVXdKN3p5Q0JQ?=
 =?utf-8?B?MGxRMWp2MEpUNmpkcUltallRbVZFUG5BVTUwb3U3M1RvbkdSbm0zZTlLQzNz?=
 =?utf-8?B?VitBdHJKQ0VFZXVhckZ3TDFSMnpuUG1obS8vR3hvaU5rUFVXaWRUQnRCbFpM?=
 =?utf-8?B?UkhaWEJqZDYxRDJFRFVXeTVxbWhMTmovMHBFQ3F0c0dWQkQ4T0JpZVZ0N09S?=
 =?utf-8?B?bnIvTUZtUzdrcU4xTm84bVJWdDFLanp0Z2x4ZGp5bkU5UjM0NXRHcldNWjhF?=
 =?utf-8?B?MVBEVUxvZjgvNDVlMnlReWRIVzVjZFhnZW5hTW9TcVNWdU52Ty9icFJHeUV3?=
 =?utf-8?B?dVJhY2sxemVZdnBxQVhCdFdzTmFxOFBsK1YvRyswUTVkaDFGblhkU1p5ZXJ6?=
 =?utf-8?B?aVlEcjU0K2JyZUJsRUNNbXJrQUNFS3EyYlJCYjlBbWFYQ1JhY2ZINkZvclBS?=
 =?utf-8?B?SFRsV0pvUTYvY2NtdUdkWkhsZ0JrSVJsa2hBZi84eGF6eXp2alRrU1ZOTEdQ?=
 =?utf-8?B?Wk9wUVRNRVRTOFpLM0daRXFBVjRsdjRNaERoMjdUUG5tbkY3TTdJV2czOExV?=
 =?utf-8?B?NFl6T05TMFNNUTQzbjlxYUM2RWFsS1IrbjByZ0dWNmxmdEE4Z3c5SEU3ZnlH?=
 =?utf-8?B?YjVUTXNqSHhiMkFhSDYvdzg3NXU0M0RvNzk2enpnUllibkJJQkQzaWpBZkpw?=
 =?utf-8?B?TkhzdEZkYll6SmVKQ2plejFScFhiallwSSszS3VxdHJPdlVCVGIyY0ptZjBZ?=
 =?utf-8?Q?DwdElZ/WbRhSK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 09:43:13.1638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da77818-9e61-45ce-f955-08dce90ff580
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442

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

Basavaraj Natikar (2):
  platform/x86/amd: amd_3d_vcache: Add AMD 3D V-Cache optimizer driver
  platform/x86/amd: amd_3d_vcache: Add sysfs ABI documentation

 .../sysfs-bus-platform-drivers-amd_x3d_vcache |  14 ++
 MAINTAINERS                                   |   8 +
 drivers/platform/x86/amd/Kconfig              |  12 ++
 drivers/platform/x86/amd/Makefile             |   2 +
 drivers/platform/x86/amd/x3d_vcache.c         | 193 ++++++++++++++++++
 5 files changed, 229 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
 create mode 100644 drivers/platform/x86/amd/x3d_vcache.c

-- 
2.25.1

