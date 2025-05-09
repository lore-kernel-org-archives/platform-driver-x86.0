Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A0AA55
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 May 2025 07:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775666; cv=fail; b=pbtjhQL3/z4Ng4KT9pIqfgvbd3eXk1VbPs5+Atqx1RLXDH2oyvvvfnCl0PdTRDzwGKkaDFjRs8TYPe9siHvmiy+FKvAWMt03IAVqzIiJKuY3OQH8zj6MH2LgAj+PuyZ06lGJV7yUBqeZ0lPJrZihYaCLMlGjK+lM1qBEID2wkFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775666; c=relaxed/simple;
	bh=oCJJvLhEVYGCJ0a/bVXLkolFoxfyYX4Cwj9a8h684cA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tqpuFTFhQGxG14ZMYyFpaPl6JiGa1Pgc/DJC9mrEf59HCo/Um2JM2WuluudLIXfMx+IjQ7Bs3pxFUxl1iYYbFgtldc+WQIsXHQWmxovmDgtMCFan4d3Ba18XSFIAViQzhDBeJ6oOZVJoxnMW8dwnlEU3TlCqt95FkT3OeIcIAiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=toUWqbxZ; arc=fail smtp.client-ip=40.107.243.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="toUWqbxZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRT7MV4HX/VeDHbAa6hjVj4FsVZArpkAJslL6WvCbMVT+6gWkr/7YI+dBShG1/C+DIQTy/xh1VZehSYJk6ybr0KNBsEVcNfkOZ4fqUhFj4D+7o+nhYqnkM7Es+yJmBAoF1pujXrMN60gjbTaIEBHvU0a9/4fk8RHzexHeXUsF7lVhLBgbye4Osy57AyX9KfMrWwvW+TCKT8BNmAJWB8GLAkq2jIKNkj4lytoHm2bJSpgRRDea9dfnysih2eXAtMuTIVR3atiIxQWBUeK21N2v8r7ppj2hWFh710+h+ePKy/oBGobjCcOicksZHOayaOEzmy0YaB/320DA72zbNJCTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8PxIzD4UmZNg0LhLsxShn8DDQWyXIxIyFwJIlMmi3M=;
 b=wAddM6JRGm+DwjgE56KCjAjvao8TCBF/t4nPYuNKQIz7tFTkT+QU5dbW0KEHmHMeJzILNKQIMim6GPU4tiUZqh8y1frV+fCj00xNaL3xasGftwU7AsViBzz18yIbuk3G76IRHc3tQheRvUcmzOXHo71g1G9eS/I/yw4GdnH+CbOc2uYU0pu8vr0555bfcifdERuxMBfnN/QLBLwqqNhRIgQem74D1fRXrhawDDXYhwpLbzxXONrgphFG9xW1Z2Y639LKZ+ZR3V11q4A6m/wGrgtcWRBuPr9t3iMUHjaLkn22L2nNzDV+NLuHisuVQzpoiWTN7R0lspvjEjyoF0NN6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8PxIzD4UmZNg0LhLsxShn8DDQWyXIxIyFwJIlMmi3M=;
 b=toUWqbxZjeLfWcWmR8NKmjEO96haFvKR66ZHfh4DV4dUJOqXH51tgB2sTnQ0S3dAYRaG6wD59Eh7gG5xI7lFwGwW2pCHrTKnXeGD7ky+9Nht2JThDbQ94sLEbi+I9t7xDArcTmvSmXAbPMRoj1dCNFnjlvUXFzUmEu5xayM2Wno=
Received: from CH3P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::16)
 by DM4PR12MB5724.namprd12.prod.outlook.com (2603:10b6:8:5f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.26; Fri, 9 May 2025 07:27:39 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::66) by CH3P220CA0014.outlook.office365.com
 (2603:10b6:610:1e8::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Fri,
 9 May 2025 07:27:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 07:27:39 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 02:27:36 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 00/10] Enhancements to PMF Driver for Improved Custom BIOS Input Handling
Date: Fri, 9 May 2025 12:56:44 +0530
Message-ID: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|DM4PR12MB5724:EE_
X-MS-Office365-Filtering-Correlation-Id: d88e0978-c32d-4308-ee8a-08dd8ecafab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Iol+sylZEFj9tpoKbZOSzTV2o40t227SEZusXCZ73u1ErHIraT+CO5vawbTt?=
 =?us-ascii?Q?/3550BtXH91FI4Mv1dkL5F0zEy8CP6YQIy/9odVGTYAW/6qzLRfpV7JColc9?=
 =?us-ascii?Q?yG3dmrXvhYGpU2nAbB32t1ETSP0UY9ukcEBjxZoEJxv11w6qwycRJ08ZI7IN?=
 =?us-ascii?Q?MIbSDNc360BQFR9yCznrjV3oNge0hrV6vKitL6JjbT7xiD6epbW0jCS1kziC?=
 =?us-ascii?Q?VSjyOw4PJ0KY52ZaflZUYRJoMV7ISMJ86RiUCt73Ox3vvypb51F+wIcJEPCZ?=
 =?us-ascii?Q?wvFgSnHa0U2zbjB74Hg0aaq4rCly733Y9rfbBLUQZuiMTypGrHmOTYZJmphS?=
 =?us-ascii?Q?mtRdIOcD5mRFIWvPyVdtLqj6EEZlCCeDeBtD3pjkw30Y+KifOGRZ44cWdh9B?=
 =?us-ascii?Q?bFu97HcfHCWC0vTH3MT95jiLxlOEP3FNZB3RBuTyVkHb2whZRzk82unA8A3N?=
 =?us-ascii?Q?4QgCe6VYHzJpUUp3Ph7LMLcYUXvb2c/WX/457At0SBqT102EeTicXaukxX/B?=
 =?us-ascii?Q?Son+zZIITpW4kb2MNu2dZsAPTqA1Ks4qSoMFXXyXIvTKJ8Pang6OVIReEp8A?=
 =?us-ascii?Q?Yr7UhjwPiJteyno77mqU5tZtHvCghn7VNDmpfWdMXHwZaJ8ADpx+vx6P8vxM?=
 =?us-ascii?Q?hW6H9WQ3kpouB4RFigUNSmOYEgC76ZaZuwqQf9IwcYaoSsisvxfTOu+FFFbt?=
 =?us-ascii?Q?9G987JfpH7jdW8uPdGf71ONoM8pS7ijMQtNFr5QerfnEjvkyLXXHzylOCeov?=
 =?us-ascii?Q?WFakerbjSsGb6DjSxLEwKEjWkdBHGOYQMTLJljwCaluDlWVgK93gRGUm8Y7p?=
 =?us-ascii?Q?nyRt5+Gfmil3e2JaBX9VmyfGbre/QClJkWwA72Pr3ciE8iKYkbri1U4Rk/d7?=
 =?us-ascii?Q?LT7o9OKCVboc4FBEIAowlW2rTAKvORzLDZUXAG7p+KRuurDdjfff/ra3gxHL?=
 =?us-ascii?Q?JnHivjAxnoXys1DE2z9WpyMKttbJ6JvgQdvaCs0dP4SjfOzDDC8Vu3/VerzL?=
 =?us-ascii?Q?Ytqd7u9H8WZzAQYzTOfGKeFS7OH00OC4TX2YJ0tPgc8sEVrSCEEg9sf1rk04?=
 =?us-ascii?Q?s3JWp+Hz76LQrpzaMRcuKjcdy8MoJbdfW+P1pqdhWxGAcG5ehZUqPCwoO2z5?=
 =?us-ascii?Q?VmJe0UG4VsU190kuzAtVOu4HyD+a5MdnPb32p0e9p8UaL1Ov8OhqfSBrtSUu?=
 =?us-ascii?Q?2YCMmvyv5ea8bLz3GSdlcgOa0kf3PqaRLdn7in37NQdvBcnV9KE1vNOOYTTw?=
 =?us-ascii?Q?DQNu0GHQoEeuzcSetg8TCFjfU47ZBPaa3Q7QaVOs+di20x0Ewq/Q7bnj5u56?=
 =?us-ascii?Q?o7xj8mVY1gR5rdbFO3+h5SdHLw1xILHFFeeHUkyOafvqo2StcjKpuBCh/SXQ?=
 =?us-ascii?Q?FIpYHPMImZSe31ftDulyVFOYWKiPEAjIAwNQPb1U0yd9XK97+u8SymiIsErw?=
 =?us-ascii?Q?j8ufls6HSRjlfg6TFSkd+XV7I9CDaNQaCWyNhroD9ZQi5WKc8X/vxWkapD3u?=
 =?us-ascii?Q?D85cQXL+iTaFrOrQbA37+YdRLrYWvjZoJ+O0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 07:27:39.6639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d88e0978-c32d-4308-ee8a-08dd8ecafab4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5724

This patch series includes the following changes to the PMF driver:

- Implement support for modifying PMF PPT and PPT APU thresholds
- Enable custom BIOS input support for AMD_CPU_ID_PS
- Add the is_apmf_bios_input_notifications_supported() helper function
- Correct the handling mechanism for custom BIOS inputs
- Maintain a record of past custom BIOS inputs
- Process early custom BIOS inputs
- Initiate enact() earlier to address the initial custom BIOS input


Changes based on review-ilpo-next with tip 
'commit d430124bac58 ("platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices")'

Shyam Sundar S K (10):
  platform/x86/amd/pmf: Add support for adjusting PMF PPT and PPT APU
    thresholds
  platform/x86/amd/pmf: Fix the custom bios input handling mechanism
  platform/x86/amd/pmf: Extend custom BIOS inputs for more policies
  platform/x86/amd/pmf: Update ta_pmf_action structure member
  platform/x86/amd/pmf: Add helper to verify BIOS input notifications
    are enable/disable
  platform/x86/amd/pmf: Add custom BIOS input support for AMD_CPU_ID_PS
  platform/x86/amd/pmf: Use amd_pmf_update_bios_inputs() helper
  platform/x86/amd/pmf: Preserve custom BIOS inputs for evaluating the
    policies
  platform/x86/amd/pmf: Call enact function sooner to process early
    pending requests
  platform/x86/amd/pmf: Add debug logs for pending requests and custom
    BIOS inputs

 drivers/platform/x86/amd/pmf/acpi.c   | 60 +++++++++++++++++++-
 drivers/platform/x86/amd/pmf/pmf.h    | 80 ++++++++++++++++++++++++---
 drivers/platform/x86/amd/pmf/spc.c    | 51 +++++++++++++----
 drivers/platform/x86/amd/pmf/tee-if.c | 19 ++++++-
 4 files changed, 191 insertions(+), 19 deletions(-)

-- 
2.34.1

