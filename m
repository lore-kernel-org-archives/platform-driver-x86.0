Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010059.outbound.protection.outlook.com [52.101.46.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FCB2848AE
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Oct 2025 10:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760696778; cv=fail; b=k5UzIzuRKg0fF/tAarhmovOgbEQtGTIDVFkHrvf/yseJOKPK7iSbhWkPaK7LyvDn57fSgxJpivxKCzkMWtxVhGCW5f9o8rvcmMPxBfE/YsusyafyHVTzodgz52JOgfLFIXlOsdQMC4pG4kYCoUNKD6AqhyFHnshpjRvsbkJyWts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760696778; c=relaxed/simple;
	bh=d4TildbNapmO/bsE8hDyfkvCcAlOcYOUA5wRc/+MtvQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NX0V0VMgXzu+ksZL62ESHejvJZHjJ8wOSXw0Lg4aG1/bafi4Vm0I+2JgYaPVn7NWl2WaepgEgnZlmhpMDf1Im004b/EaL+yYRFJR6MhqRpECu7inKcgkxBV1dprxhfrtiwRqqoD8Ps69+wLbceafeoneTvo8CDBJg50a2OzYuhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Itl8p8rS; arc=fail smtp.client-ip=52.101.46.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Itl8p8rS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUhHJ1abvGHG89M07ytSD0E/K8vguTQ1ir5jOSnBE6ACyEqZug4SUvm8u9qsEZkmc+ZoQZGGXoqo5LaXjI5FKukYm1PZS1I3u1+CnQ/PYInbAxF4+ct3GB/Y2XMCmAkHov75dgyx0yvRgR+V3yhnJeT8lplY1IaxgEIhBnwXm10035IzgeQuYb1wdPlvL55TEXrqEfSDcEFObYgk4D45ZQfhTKpT+wXMqEqUg5IrIsTyRjg0jJgoPX9HzIHWFoptizAq12B38ySWy6uIGw54CXbqLctcWuZq2Rjo1EN93XAnBTs3zuSWh0/kHL+BTOMvRvv6RnvFI61hVfQOPLlcNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=811uOaM7SOLU4DxkzpOz8/j3hSMOPu479l6Aed7R8j4=;
 b=heeYanXflRWDtg1E2VWfNaOCngAj+CqJZAsOP5drl9blInaKI60Aa66Bzxhx0sRK1MYS7J53BFoKfVhdFNi2f3WYb1GCNlhMVqwESd3ofdI2snbowEJNGEQk8gxwxKBxZYlhN1KW071ls0aIJgFof2WYfnpgcYPdxND+aqfEe2YL5931T4TJcyG5TMkWwMx4ZgaY7WPWtCwjpCX3/wSEdLWjZ7x1qU2CYkFGm1JeiMZlto1ZRP2FX93GaYDQSxUX7S6gFkI79mKe3USc1TLudHT5LHHQfYSqNjbvsXzFDUpiwkGfhnTsglk2aKzxPrqUD8CY3ej7VlpR+wRKsTFscg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=811uOaM7SOLU4DxkzpOz8/j3hSMOPu479l6Aed7R8j4=;
 b=Itl8p8rSv8mBuVcxYunTSq+RecYZ5rKHfDVQMbX/voSXbM0ZTKgR0UDcZerU0HwyKPv5seINcPI5+JngIMsEiQx8DaX5itIa0bHHq6u3CfzN5Pb/4jQLSLCGk6hsR+k/ooDoQLJ+PeC7eziLRSvtIqUHe7ufNS9bFSiQlBpE/F0=
Received: from SN6PR01CA0029.prod.exchangelabs.com (2603:10b6:805:b6::42) by
 CH3PR12MB8995.namprd12.prod.outlook.com (2603:10b6:610:17e::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.12; Fri, 17 Oct 2025 10:26:12 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:805:b6:cafe::37) by SN6PR01CA0029.outlook.office365.com
 (2603:10b6:805:b6::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 10:26:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 10:26:11 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 17 Oct
 2025 03:26:08 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@Dell.com>, <Sanket.Goswami@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 0/3] platform/x86/amd/pmf: introduce AMD PMF util layer and user-space interface for SystemDeck
Date: Fri, 17 Oct 2025 15:55:41 +0530
Message-ID: <20251017102544.1470934-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|CH3PR12MB8995:EE_
X-MS-Office365-Filtering-Correlation-Id: 452846f3-4733-4d7f-1853-08de0d6797e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?102YrqLw5pOJz1plekIY817HmT+iVaKuOUB0asuGz7UzvZ9n9vow0jLENk+K?=
 =?us-ascii?Q?k1wxuKdTL1a+Rma7nqUQZCX+XngSVrD9gr04s6vbv+P+iaomLusLaolFbw0I?=
 =?us-ascii?Q?QOmYcVVGwmk9zDru04Wfntr2CzEDNXSpZ1FvcmZa5Lp+5MxHDahN/91G/KfK?=
 =?us-ascii?Q?IyJvNWLka1LwIFFSJ9MEDkualJxNe1MM9RoalGNL0Xo4q2DOp7IFMJO8BPLX?=
 =?us-ascii?Q?b+O1wB2VJgbx03ZEwW6OTe3QTI9MGYQ9w5lR6f1RoKkg8+R64Nmg98j9syUc?=
 =?us-ascii?Q?FZ+50S1nmYOplwcQSckqsITav+1H9u9UjTubGcLhistb+2ERI+Ynl1pUUOQv?=
 =?us-ascii?Q?lwYQRQTHgo0TUz3gPR1QnfoLrnH9g9IdOF/4XT0QbGujQxJXXpGE9TkslNSy?=
 =?us-ascii?Q?i4kGh7loVz5Dd5Gt1RtLDWrq7n8AnsyBuD9ZIVZwFL+RoeDxsRdk7arNLvXM?=
 =?us-ascii?Q?HRtZJpZWLa0xRgedr2rC978ntOVEmFa6pLloD9ayLxCFJ6j9/h5TA7LKEG1l?=
 =?us-ascii?Q?X2M+GfVNLcEDL2p5cKNQ47EUvzDKPMIQkDzkmN6K0SK9P31G3xHyFBMq0dDN?=
 =?us-ascii?Q?qdb1vIX18leMY87tiS44h8RGvNRRuFxmSZfd29tisLuzEAERlp1/4RT0YSzf?=
 =?us-ascii?Q?vDtrgqQqWj2ibpghJ26VI6xx1ew5Ucr6hB0gWB2q17tDaS7X8dL8TGSt/cey?=
 =?us-ascii?Q?j3PBs1yNyYuvtCgcKEsSvay7eTVe7t6HWSS3UK5r1bUpGnlkDGlWQoabIIfW?=
 =?us-ascii?Q?AXLeguf3vJFifH6+lRiaoqKG2FELJjRkvQ3JLq/Mc2aKud/c9ItKQH5YAI11?=
 =?us-ascii?Q?oJY08kZbGT2wJ0VV7th9doCi1ZCDOmJA3SIupbCQHWEFWYi+kZX3BBsV0Y+z?=
 =?us-ascii?Q?Oa0QwI6c/b91iUo4evKiJIlW7cCk6JDVv43N1R7I0+HMLz7J+99OBNk+HT6R?=
 =?us-ascii?Q?yWGEcUAZHISCtcrcezuegMWni7l26E/qThiRIDo7oI+IVxeXqBbB08HMPV/0?=
 =?us-ascii?Q?tq1mVIcj1Jg4awiTiNe9Mk6pPoZTnhuIGcFt0aCEdn5nrLj7z6hwKITMgD0U?=
 =?us-ascii?Q?tpwCDueJEzz5OsWN4ZDGQqzauv7PcGjN7WV9lCM6Oqs6o4NrRv7gFdSgI33X?=
 =?us-ascii?Q?hCqrU4iVx3/RbjOg10fZyeB4DYe1sOabRQB7RG7a+LXz96YVIShw/5FxPQ+g?=
 =?us-ascii?Q?nt6rD5ARCGzGnpPKOLYwAphZALF7pDsb/nTMhyZraEAWL42yvERGA6kVyzHd?=
 =?us-ascii?Q?OdeWpCdOhoZycR+v8oC5yqSbPHhYQ6dw9eNfgLyVyTyHDqOQzMJ4eug0i1/m?=
 =?us-ascii?Q?0ScAtmWDkRqck31x6nz9YcRnQCHJroCL0Dio3mKFwlxz2ti024fb7kcFbSoK?=
 =?us-ascii?Q?37cLs0HrOTQP+w3FVBEGZrhKeMnOiO7NB3XE1+g9saXcGXwRQi5G0k6ExPKN?=
 =?us-ascii?Q?/HqzO5EUmhoGUEBU71o3YhK4oXj/EUq+A26900g7nSFgOzhaerW09zsBSCSe?=
 =?us-ascii?Q?uLnyr6pI+bU6DTQcLu+bcKxJ7m91MAb9v17uXNS2bmnPCZ/gDnWRsG42yjeB?=
 =?us-ascii?Q?0/FPlCu+bQAvRFF3Umc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 10:26:11.3511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 452846f3-4733-4d7f-1853-08de0d6797e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8995

This series introduces a util layer to the AMD Platform Management
Framework (PMF) and a minimal user-space interface via a misc character
device, enabling feature discovery and smoother integration with
user-space tools. It also adds caching of BIOS output policy values to
prepare for user-space telemetry reporting via IOCTLs.

The motivation is to provide a stable interface for user-space tools to
discover PMF features and consume selected metrics. Enable smoother
integration with AMD SystemDeck, a widely used tool for monitoring and
controlling power and thermal behavior, helping designers keep components
within thermal limits to ensure proper operation and improve system
stability and reliability.

Shyam Sundar S K (3):
  platform/x86/amd/pmf: add util layer and user-space misc device
    interface
  platform/x86/amd/pmf: cache BIOS output values for user-space
    telemetry via util IOCTL
  Documentation/ABI: add testing entry for AMD PMF misc device interface

 .../ABI/testing/misc-amdpmf_interface         |  55 ++++
 MAINTAINERS                                   |   1 +
 drivers/platform/x86/amd/pmf/Kconfig          |  10 +
 drivers/platform/x86/amd/pmf/Makefile         |   2 +
 drivers/platform/x86/amd/pmf/core.c           |  19 ++
 drivers/platform/x86/amd/pmf/pmf.h            |  11 +
 drivers/platform/x86/amd/pmf/tee-if.c         |  10 +
 drivers/platform/x86/amd/pmf/util.c           | 305 ++++++++++++++++++
 8 files changed, 413 insertions(+)
 create mode 100644 Documentation/ABI/testing/misc-amdpmf_interface
 create mode 100644 drivers/platform/x86/amd/pmf/util.c

-- 
2.34.1

