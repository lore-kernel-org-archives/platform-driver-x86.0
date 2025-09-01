Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8875422EE5
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Sep 2025 11:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724530; cv=fail; b=KwRRkXg0RtA4IP25QyV6Gjro5qZSA6wxg5wp3qCjlWXuG6gQyf7WB61na94YYSfL1pUfN4FRr/nm2iGV6dmW6ylPJp29my34hjBImjlqGrxNSarRjNWnJ2b4GimvT7R+ZTbTmqr7YTr2UWUawyQkzu9yVRsZvk0Vu7Vr0HC0Taw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724530; c=relaxed/simple;
	bh=nWi01cURTyRe+3rotarIcNdsBmmB72qzBTTXB2cSqgY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HHbt6HwaDzvQoHzvgJ8XoITdNbzAnDh85tUJvyX2ydnsfC7HfIOfPt6ukhMLa4yuBgGkvMgUf0UYXbdxvdpSI5jiWnbyyAPcNj0NtwEj+Dpil+QxMVi70s4yfgerctg5P3vFPlRbgjnOexMYmkqrJFUi1biLEbU8qB398BHYSH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LBlmP1Cn; arc=fail smtp.client-ip=40.107.93.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LBlmP1Cn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cV3ke+5rLZscPQZGXj5xTt9DL2Wr3m1yNo4By/ZBpvdoRbPUkPQGX8x/nsqhfNWwfU20nOz3A32nO4xMbQ4l6Mpi2cPs6EIhbgk5C2cbSER+S2081pve5N2KdS8i2f9qIdPuB2jCME2qM1FhpiBIACz40nz3l4JBsCjf7deOYZkYFaCYIDCZsjlZzkTyM/5qF/OnDUbWjw4lYeCGvNAs++aIHPw2BQPxfLuPukPQGMupwWzS7yyBP0+87essjrGFaUTdisgsFflY0rFNVZn7ehiomj4e8HzT8gx9P9qT6/BN4CDGRjAfWE4UZISJUH8mG4UX8RjwGQ1/+FNUcDO4Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKTF0i3wF/X3HKwcXnOjk166rE7DHvE5j0VyAaoPZcI=;
 b=XPnlYZPmPCC0qaL2xD1FyYK3Zj1yMUSOgyRmWHJyN1Ww26aCkhcqKI5yxp9TFTiELI3+kZfnkWCb4/3LTVndcWHa40HMu4+lSAR49Dcd+MKdnhIlPZYoJjSD5+1cv/arVH2pjofp1W3snepABNsmLW6bwgpROh+CN8dx7EjAjxCCwYblrWhdRjKu0VmyfRA5uLwDYx0V9WKVv+kLU0p7FPzefdLNoY/mrdwjYrawmUPuZpHal1pT5VzuWQWeLW1Su+AHnDcM2oudKvGmeIZeZQyJoqXN/hLHG8174oA3GGAQGmwhbau0pSQxFnVdqz+lLeBS+aVNAQGPgvEGuuncNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKTF0i3wF/X3HKwcXnOjk166rE7DHvE5j0VyAaoPZcI=;
 b=LBlmP1CnAUIejSZaFpPbZS5O5kc3DUlblcgCB5Ia0AOWgZgsyTNVHcyQto1/catzWdpyopZkn+mXWRuI04jifD4EpqQ+JQlpooFrpTxwnH19JkXGKxJ1gWphi3TdukHtJz/xohvKpa1V/GGRX24sZTPSHNl5MedhjxxWqOEnQqY=
Received: from MN0P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::33)
 by IA1PR12MB6601.namprd12.prod.outlook.com (2603:10b6:208:3a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 1 Sep
 2025 11:02:04 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:208:52e:cafe::72) by MN0P220CA0025.outlook.office365.com
 (2603:10b6:208:52e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Mon,
 1 Sep 2025 11:02:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 11:02:04 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 06:02:03 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 1 Sep
 2025 04:02:01 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 RESEND 0/9] Enhancements to PMF Driver for Improved Custom BIOS Input Handling
Date: Mon, 1 Sep 2025 16:31:31 +0530
Message-ID: <20250901110140.2519072-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|IA1PR12MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: 69d64fd8-5da5-478c-7cd0-08dde946fbfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JcgBQJmAp3UiI2EuMZ+eF5xtcqz+zKsLuWDQOtVt7PD+kO4Q9PDAm1CPkrxK?=
 =?us-ascii?Q?P7TqGJwOVqzQuYnmROcNXayRGRJR+qrjdMshXY0DzSwjbi5P9RaChfPTe5X/?=
 =?us-ascii?Q?ZkERCK83KSKIFnwsfJ6B3ju6HNv28zuyR3VqIm/sCyWqJEL4CNygLaa6DGY6?=
 =?us-ascii?Q?beL849ESJoJyQNBTXyG7QaJ5CqSLf72ds2u9k6vrRwTOLC/XdEe36JGJloPJ?=
 =?us-ascii?Q?G1no894xt3sUS03BydCM8VBC3WIcLg6/WkfIzQqGQ5MHwhy27z//0TnQStT2?=
 =?us-ascii?Q?E9Ts+DIDSblrSxay0ZO7bXLP3QM59g1uGjAGBxCLDNRW3tnrJjTJlMKp3Zcf?=
 =?us-ascii?Q?0bWRdx+ifUaaHTImJ0BN5mQZSSFKEdmijv//4GJiqCTAo7fWKVBSHKnM5C7K?=
 =?us-ascii?Q?3+F8K5cjTjG/egbo7UmZEBXrAIVisqN+4oJtDfbACKPhuEfI0NrEf4wMWHps?=
 =?us-ascii?Q?0P9V5kjRimdBJSHjV3YaAz2nqMa56Wi31DPXCoeIlJtdPKtKRB8ySeG0PlzF?=
 =?us-ascii?Q?CmkBQAYUDPVTsokxTsxi1ZXAFN3JqnYonq/DpQQUZ4FNiwcOPFvCGQaqDKM3?=
 =?us-ascii?Q?Isg5z887p2V0pP5pETbLNmFWmS3fK/nv2u9WJi1Ef5yyOT2BW8MUCKiCEgtR?=
 =?us-ascii?Q?vCC4B5ZdVQstQMY53n2pcwBXDIju5UOVoALVH+asAtQm5cQn75FGAUb3E4J9?=
 =?us-ascii?Q?2bul8u8VRvrdE8PZ36HANP49vgZCzVhRJzLf7nP45VH/OwircoF6n62SroJf?=
 =?us-ascii?Q?gV21YeVXG6cGebOPnbko6FDwjjVm7NdIkqSozFfBrZIT9GtL0Xz8YecWSgQj?=
 =?us-ascii?Q?t9mr7Qj88lo75bZ36+NhqmOtBWU4bcZIrCUpALATryl0bolnq9t2IIv4NV7Y?=
 =?us-ascii?Q?a14qPSBBcV/saKk2uIYq6EOD2wNt3fhuaNhu09bfaLE34E+FBFsDt+XQQA1V?=
 =?us-ascii?Q?cblEwa7d+jQ/egc4rBS/e02c7IDDt438Yzu26LQrpXwRqzc78XfeYiIr1dFA?=
 =?us-ascii?Q?x1NeS+CU+E563lcTw/LyGK6RcPK02+R+qKo3+VJCjyCNU304Jb15MFyPk1mt?=
 =?us-ascii?Q?ge+TKr3HmR0JuzJ2Wa0VSYmlmpfpcbDqMnCe7qEiU/LL7r6nQyU6tXSN5AfJ?=
 =?us-ascii?Q?M8G+OnhmI5ncQJRWePK3lyAvK8SjBJsNzo3PouOd5kk9T8trZGJQs8ep5jXq?=
 =?us-ascii?Q?aMau5oA+KxuMMd4N4+/LQMHTQH7ceR0zhc5yHCxxl0WNgUeLSStYyr7J+E7l?=
 =?us-ascii?Q?b8nee9KsCUNU4Hne16gHjlz9yh/Gk7BV6uA53CV5LmJqlGc17qHvqoamZCDm?=
 =?us-ascii?Q?NewZvfmyGmIxA6q/PGOvbIhoXIg2GiqlfOpIs7j/YyZxW3Rab9A+QnE3gnue?=
 =?us-ascii?Q?satMYcSshO5RZrxKUjlxVP0eIlaMEVkKMJ6a/yz97eke3sOyOUyE09F9mUkK?=
 =?us-ascii?Q?m2MONvO/9peAuwXePVI/oj86t4Ys8/JYrncQ1Z9udUb4GfLXRUSmQr7p7S3F?=
 =?us-ascii?Q?6ybeiPtEbDP+DxZerRvD7Bp1bxWVuQvQZsuv?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 11:02:04.0803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d64fd8-5da5-478c-7cd0-08dde946fbfe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6601

This patch series includes the following changes to the PMF driver:

- Implement support for modifying PMF PPT and PPT APU thresholds
- Enable custom BIOS input support for AMD_CPU_ID_PS
- Add the is_apmf_bios_input_notifications_supported() helper function
- Correct the handling mechanism for custom BIOS inputs
- Maintain a record of past custom BIOS inputs
- Process early custom BIOS inputs
- Initiate enact() earlier to address the initial custom BIOS input


Changes based on review-ilpo-next with tip
'commit ee1cb9b0e6a8 ("platform/x86/amd/hsmp: Replace dev_err() with dev_info() for non-fatal errors")'

v5:
-----
- Use unsigned int instead of int
- Use switch and fallthrough mechanism for install/uninstall acpi handlers
  v1 and v2. 
- Use a switch case for amd_pmf_update_bios_inputs()

v4:
-----
- Rephrase commit messages
- Simply the code with loop + helper functions
- rename variable names for consistency

v3:
-----
- Add amd_pmf_set_ta_custom_bios_input() and amd_pmf_get_ta_custom_bios_input() to simply handling
- Address other remarks by Ilpo on v2.

v2:
-----
- Use array to store the BIOS inputs instead of individual variables
- Remove additional spaces
- Replace GEN_MASK() with a meaningful macro
- Merge patch6 and 7 into a single one
- add amd_pmf_handle_early_preq() common routine for early pending request

Shyam Sundar S K (9):
  platform/x86/amd/pmf: Add support for adjusting PMF PPT and PPT APU
    thresholds
  platform/x86/amd/pmf: Fix the custom bios input handling mechanism
  platform/x86/amd/pmf: Extend custom BIOS inputs for more policies
  platform/x86/amd/pmf: Update ta_pmf_action structure member
  platform/x86/amd/pmf: Add helper to verify BIOS input notifications
    are enable/disable
  platform/x86/amd/pmf: Add custom BIOS input support for AMD_CPU_ID_PS
  platform/x86/amd/pmf: Preserve custom BIOS inputs for evaluating the
    policies
  platform/x86/amd/pmf: Call enact function sooner to process early
    pending requests
  platform/x86/amd/pmf: Add debug logs for pending requests and custom
    BIOS inputs

 drivers/platform/x86/amd/pmf/acpi.c   | 87 +++++++++++++++++++++++++--
 drivers/platform/x86/amd/pmf/pmf.h    | 77 +++++++++++++++++++++---
 drivers/platform/x86/amd/pmf/spc.c    | 80 +++++++++++++++++++++---
 drivers/platform/x86/amd/pmf/tee-if.c | 22 ++++++-
 4 files changed, 240 insertions(+), 26 deletions(-)

-- 
2.34.1

