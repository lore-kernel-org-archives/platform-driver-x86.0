Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010045.outbound.protection.outlook.com [52.101.46.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ADF2C11E4
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Jan 2026 20:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768509478; cv=fail; b=F6RnojZ0beP3PTRynCmPMbx8bSvurr0FhVePeQWCg3lH5QuB6nGhxu+wrSYX5+kKLadGYkgdblXXa0AH4kX9bXQOAebvGfXIeKf+JG/x/qmrzej1NgMsLJ/dpX66LHoYOp/QQZZMTKoShI24B+Sv5OllJe0Oc0DzarDeN/t+gXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768509478; c=relaxed/simple;
	bh=omxPO09mCv8P51iHOfXFXsR004Lp2WYCdi1BDoLCDH0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r1UVIPFMHa623foTBJ/eA9HQjQQ9MNtBFrs26Ru71sx3I2WuRo84YFOHVcTrVTqj1EQZp1uXfxJQGlW+66tkKHNv7Ybn2oxmbS+dXl/HXFSU0LOhkrhDDZ4adXzb21FOyo/a4sRgQMidk2seC+YLPXcwtYaRetRNN6o1yT1MnhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IhUElYn0; arc=fail smtp.client-ip=52.101.46.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IhUElYn0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CsobbvVLQ74JoCIAQX+Xcal2rYiHhDkfPojPmTZAZDkvGOfVEVaUDShwC+igFdk9fTL1KivJwhnokbTm+eeqVLxsMa1lXJjmeffOpslk7nsa3VKnvD1RceG/LEcOFGNxPkxkWqKutBmMs28NVL6lrsBGqb5Y4U4l9l+F6lTIG76rdyQlaqTg3IWwRgeqLPpoVlS9i7It5CCFEPILik+4AhfEIRafHPsdDrwlIZAmHybTBtcBb6UWNodErUZXdoThQW8x2fEG71MLj2+AYVl4bH0QpKZN2lm1WXOiOVzo9WU6JaDQ5wdDgw1/BK9LIKB8lyduDCeXcP0pQswxc/ysAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfsLgN67rVGmGYnRBGK3IUgilmN2Ozr4Kq79ONLNBIA=;
 b=vVWIGCH9TfRjRtLuoOclk9ZnmXc7ao2No9hXREzn38FSE9f8I1WuNjapkWcVaOX/ZtjJ3PAXjHTCGtH5Xlmim7U5x6FL5C2/PFaaAx3+YTAmhf/oEFJPEFosB/wQrujwglvkfaYdBa/QNW52fWf67U4VZmAMzhA6CgZevbV3uFdpxNYc/go2cPYkANXX6Yz0S4RCzpNaKJBWm/b0hviy0vPzndC8uqkheJXeRDTt7Q/nCT0BnkH+d+ZN0tNDuD4BSowKr6Ub/XKW56f5q2DG4NVfh4vqWxALPU1VtqNqLFcX+EyEnXMjXgEMJoo1aTlYB0Wj0jJl1/OjmLRFv5OGSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfsLgN67rVGmGYnRBGK3IUgilmN2Ozr4Kq79ONLNBIA=;
 b=IhUElYn0YUbJby9i2GnGXPqf5Q+XwHi+DBH6Wi1zikiKqnTABNSMRb5gwa6ih4fdfhpwop915O76LFK6SNymJqj2ciwsD4rVi+soyqQlJbpJBK01kv15mrZW5S30OytyYms7dMcuTIJ+wpT9SRi9eVVLjl0wgfPAsNnANkC8jAc=
Received: from SJ0PR05CA0156.namprd05.prod.outlook.com (2603:10b6:a03:339::11)
 by MW4PR12MB7119.namprd12.prod.outlook.com (2603:10b6:303:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 20:37:53 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::8) by SJ0PR05CA0156.outlook.office365.com
 (2603:10b6:a03:339::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Thu,
 15 Jan 2026 20:37:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 20:37:53 +0000
Received: from dogwood-dvt-marlim.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 15 Jan 2026 14:37:52 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <mario.limonciello@amd.com>, <hansg@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <jorge.lopez2@hp.com>,
	<linux@weissschuh.net>
CC: <platform-driver-x86@vger.kernel.org>
Subject: [PATCH v2 0/3] Fixes for hp-bioscfg
Date: Thu, 15 Jan 2026 14:31:09 -0600
Message-ID: <20260115203725.828434-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.52.0
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|MW4PR12MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: 7464186b-b1e8-447a-c80f-08de5475f501
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VvvIN05nDz+NsLgqcTZGjl21vjTCpbX+Ne0rBehBKoRzpNI9JQ7JMKJXhyd6?=
 =?us-ascii?Q?TUe35KVCm6ISGbohPG8Q2T51VhhN8YJ8DRXQx/jzBjd3C1PF9FM+tLqhwWQa?=
 =?us-ascii?Q?7vRlZJmJl5C+sQnW3D7cN6NdTllzRSEtwFNfhmnIjpFN/FW3aNCEF9mjKrO5?=
 =?us-ascii?Q?AwCqj/amiDQpAtHF1oWRSRkIpGzhrV9zDgREwRFt0zzEYkFcRr7ZbaOdVLlK?=
 =?us-ascii?Q?g9fpQAwg0ygbNBJRjxFBZQqedNvWjQJAa8+TlmYHJZ3j3cbCCt6cXyVsfE1e?=
 =?us-ascii?Q?phv2eWgHJFMyXefT89iXXi6xQEP/yjaYc9tgexdPHD+dq1aYw4QYmxxvnk9H?=
 =?us-ascii?Q?HIRZ5uTRyTTVjGxJAdxZqICWBHclfP+fLHFexfv/V70QfYhmK0yvridF2Ase?=
 =?us-ascii?Q?VxBppbV7Z9ARYz2s+h63b4c9puoVzmvz8p598iyUPgzxM60/aMdqCjER0jLZ?=
 =?us-ascii?Q?bIwe3JhYix6EfNJbBmD5NfCLKr203j4rdlbEKGpQqzG4DY2N/JNjDXYeEv15?=
 =?us-ascii?Q?JsCnx6vQg4b65o23PjeH+1PaOAb/Uddkmt0TZ99V82v+7DjaEOgi2P+02XfK?=
 =?us-ascii?Q?0M9kzJievyWb7YstBHjzRSVV1mnQ53oa9QwD0FsO6fIEt5oTIGzNWqN+qiix?=
 =?us-ascii?Q?9uwZo3IaFBOogHoEGqW5568wWs8k1ETasgamMDgSAD9lRUZqZ1+41ujyhOnN?=
 =?us-ascii?Q?IEQGWngOPjsjGxALAopNYwkw6YIOUkSvJt8Qc9M0ZQ7fm3pYwAweFTZX5y1v?=
 =?us-ascii?Q?PeH6utBglv1GAZwCsApQvWS3MqhvvZrCW8s3AeylnpgIJzOgsBC4/+73ZTCH?=
 =?us-ascii?Q?lI31r8DA7aeIFNzbVyou94aaqjwDcpITmAke4S8SJ37gQsrpi9zugKL9HseC?=
 =?us-ascii?Q?ILS1Mq5S5ur1JNq/fRzBYsI76uNMHGGBpjKbFQ7K9EF3UTqPB2p/LtDiaRIC?=
 =?us-ascii?Q?ZedT3jrV0p5e5LcdheomQrf8LJuuw8I8oim11aLBY2uajFBYk4zpQTbGF//O?=
 =?us-ascii?Q?LzR/iA8vswJXjgSNewHBfGs36n4DTOSiJJ3vfeYR0WvouBdhc/Mt59+l0J32?=
 =?us-ascii?Q?1x+Uqb44soAN1yhiq8X443WAGzpXpKkp53WkSj4Rdn/XNWgoA3PqaAKk/4Gw?=
 =?us-ascii?Q?h3IfbZIwLpGs8RvfXa/AYoJ+R2q2xa/j4ih2B20pk/qjV94BLgYhMKpOwDup?=
 =?us-ascii?Q?MQuWv8YF9kaRLKjuawQY9v3WETYV2I9lsowe5FO7gv6ySC+9oqAQOUZDx/Mt?=
 =?us-ascii?Q?Fp4Q0wUkL05z7eGFlRdk4uPOsJc/6cPMjzfjfPaB+R5JFMIki6AaOteUxaR6?=
 =?us-ascii?Q?zIgxsRtbrq4IW+R2hpT2D43xJ9X6BzcMSjWbemKlU4H5gebX2ct9vgr0/fYt?=
 =?us-ascii?Q?yngAko63DSmlee/uMxdoqEmUTl/F2GKP7bWKFC8Rx+ccFEDBBVDC7SInkYEr?=
 =?us-ascii?Q?p/MPkLaUq6j7yF0iPdtKxXDGSWyQc147dZOS+7aq6+NQdUJEF5Wk4yhLtCAL?=
 =?us-ascii?Q?NYkBku0mStS39SqGDychiwCUksxjX4Ei19HtTaMP7TBXNWdVx8TlCUMf+A+2?=
 =?us-ascii?Q?y46wqXSFporxe1bYYdRYY1Do6BBfeVSF9c6lovdNJrvFRTX+kJfgOS6gQz48?=
 =?us-ascii?Q?2Nw2N70N8BGlxd0GF/FUiS3GFlGhTUnPf+4wDxyS8VseYnyk3MjblzZN+SyY?=
 =?us-ascii?Q?ga1Nbw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 20:37:53.0290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7464186b-b1e8-447a-c80f-08de5475f501
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7119

When working on fwupd code on an HP system I noticed that all the BIOS
settings were missing in fwupd.  I thought I forgot to compile the
hp-bioscfg module, but actually it was compiled just not loading.

Once I loaded it, I found various problems with boundary handling and
attributes on an HP Z2 Mini G1a. 

This series fixes automatic loading as well as those boundary problems.

Mario Limonciello (3):
  platform/x86: hp-bioscfg: Fix kobject warnings for empty attribute
    names
  platform/x86: hp-bioscfg: Fix kernel panic in GET_INSTANCE_ID macro
  platform/x86: hp-bioscfg: Fix automatic module loading

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c |  8 ++++++++
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h | 12 +++++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.52.0

