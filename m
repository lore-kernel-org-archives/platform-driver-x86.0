Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2082.outbound.protection.outlook.com [40.107.96.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B68E26E6E3
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jul 2025 06:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753252914; cv=fail; b=A0ofy+TBS2c6WI3Yzo/LxHfIJDJROyw+7LQWlZdZvtgGbDRFBSNl4EI2O0Pf5qcm1Paf0fJAUeWnfVcuXgKNIFKU/fjOlnlcZQWM2zGzT/AFRh4QjrpeMAmn0qniTqXw8D/fxXnCl1esEJqRwm7F9hIdXpLfn3/db5kFLa8j7xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753252914; c=relaxed/simple;
	bh=3TCXifCDSxx7cf6vhXdsPNk7Mjw6vyyChk9LJnyaGLo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oTlue+ub2tbPDYO5LlyKjZMbjQ3kH5GxWiK3mYrEl5KvlPE/aFZusmUvDcI5IQglokdwz0CsU7sYqRXkx77Y2Z+3Bn8L+b1+eeGIIz0bRVj8I0bOU30DTyUyT5hW+ns230Y2rFobR23ib1f2I6y9jQffAKGXf8H7yLw/d9pLvCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=enY2FMMZ; arc=fail smtp.client-ip=40.107.96.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="enY2FMMZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqsZHMocRdP9+GTPJLh7BO5AUZme1Cjun50aSF0s8Xpv6+W6dTNIxwHu9HJc75sqm4/Trtvia2G4Yqoe/Y0dSg0jRth+xh/jR5Qr1+/U86v9fZyIjblEd8koCyO5v3rtLoOU6kHPHNfgvH3FguRrIWZqggl2CAa7JZwZ5JIrAhDBdZwVE4Vm7UR7MmplB7lhjPFwCVXptpV03cLkYampbjJWxp4lGIS+QGwSlKVbIo4N6KklVJHbSO1CQh6Xt/e/XuiH6UTXBnmM7OfV2Jljonl2VKD1qywfE6OERtP1wTprHBxB2SfmOohz9ErKQdPmzkvrc/u8CzlYl40dqry3QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBLnfilJSvcta2yOLouLPrI+5bwiUaGH64YLLBpeoWE=;
 b=WUvXyUnZ2j3SYAsvMYeAvc6OuAQkkvJFwKb3WmgD6OJVwp4x4CKPWWY81tF7D/KUuNa3cmBEBsKBpn7nG+Fa+llYQQZA/6Wm+jmsS4ucFivRO8ySXUJO2co860VtPhYpqHbJY5GOUCMo2dxQS32257NpNOPQuhrepfl7RU2qOV68/kkPk7ODhEY4byX7BP5gYTkcUt8URXOj4Oix0U2whIOwV5RjDHrMbwVQ/XQZv7ZqZpEkDOF2mi0MEfL0std+2Bm4cGr+JVpRu/4kEANaZkpo40SCK91KUvZimSW+OIXxLFAilLo+Wh8kAh6OCJLXExVHksoYczaACPq1nBQ2iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBLnfilJSvcta2yOLouLPrI+5bwiUaGH64YLLBpeoWE=;
 b=enY2FMMZDhkkk/nN51V4s0JBbkcDmZC3qHsSESZpUyFhgPSmGNIefl1mJtxwq4240xTk02hVhh4wsrvHkJROZzsDTjveiZbNFoM7nM12LIudWqmZ+/6p8H5NZwnvJnFLiUSFASS+ssiZbiVo88gLvilMp04v4ZXgCDYSfdwkzP0=
Received: from SJ0PR13CA0015.namprd13.prod.outlook.com (2603:10b6:a03:2c0::20)
 by LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 06:41:49 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::18) by SJ0PR13CA0015.outlook.office365.com
 (2603:10b6:a03:2c0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 06:41:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 06:41:49 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 01:41:45 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 0/9] Enhancements to PMF Driver for Improved Custom BIOS Input Handling
Date: Wed, 23 Jul 2025 12:11:12 +0530
Message-ID: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|LV2PR12MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dea4ab1-21fd-46fc-3730-08ddc9b4005c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QUAZL0AT/PuDvlwSdX5O0Vg4d9snHQ/r0EgYizGXPpxx2SR5IzqeQTBeCAPW?=
 =?us-ascii?Q?DHa4+WFWYFCqckBKFYsZ5rGfbS68z9zNJfsyxErbNeMWxfPf6IsgBNSAZ0cO?=
 =?us-ascii?Q?m12PsNQZ+gmJNv04AXymuABLpHPZYtYGD7jYHDrfEkZYNbrOck/EWO09DllM?=
 =?us-ascii?Q?Vg9vKwEaFYOC3CkxmpvZ6gj5KbmwDkMin6wnd0ElwXrsj8XJwH1xxIyxqEvm?=
 =?us-ascii?Q?qk0JFFupG/BY4IJjdMMURkDvco2THG+UBGcA8Gehw0DlzJH+nohczhoZHbJ7?=
 =?us-ascii?Q?zgfdOEyjk4E9LNXz22dFuzTIugAmBoQwzEOz4egfyoP1cvzlx4v6muVNupq7?=
 =?us-ascii?Q?ttD616+vKbepqRMqECEAc73i9JxgARwPMXDq/RuzTP+3QdzFQ059dM7PAX2b?=
 =?us-ascii?Q?Ww3bAlaO408CT3FKDk+2mvruJINVB7ke5Pk+dwwqeo+WJVd5xCi8UMECYrzb?=
 =?us-ascii?Q?sv2GgwNyhW4xG1ppqGvqlNTdCQuEPhB/I5xqYf0w96QMxL2j/r8wrrOlErwj?=
 =?us-ascii?Q?dO0aHYG94X4ypMTBtxirV1aiaEUNV0Pfam4tTPEiFxKJdyVpY6RRpG7UEv0e?=
 =?us-ascii?Q?Qt2xAOwag2clFK+9YlNRyg1tBhWzDH6bFwJQ9a5buFF+heP4+/f6MB5QyYug?=
 =?us-ascii?Q?JMpbFq+8vacyx7xZY2GpHogOqjv5OT3q/0finbw3IV7xFBji2FePIS4cOvjT?=
 =?us-ascii?Q?4El1aPRdJDuS1G0xe7pGODicRNPvrUSEaxiFUM2ZFFgn/s7FCk+kACODaj90?=
 =?us-ascii?Q?TpBSZ9fT35ZdVSc4Yga8z3wxT5U1yTGvl9GnlzQ9+Q2J9Tocm9ls3P9NwhK+?=
 =?us-ascii?Q?NYNVkVpEyQfxDADlkSLIpyM9zedNl9Mo0lj7Qtz1pB5ogxwKeci0Jrl6gBfg?=
 =?us-ascii?Q?gfTXAy5redoQmvpTTPbInBXpwtTfDlWTymeGYGu0UETB9k2KDTWcLBiz7W01?=
 =?us-ascii?Q?5we9pcZxFqqy1Fyg3Ilxna9oZtW8zJ9ifRiVaLFqVq6w3JYdkprkz+ZSjwdQ?=
 =?us-ascii?Q?CR9HA6MBV40tXmu6ICYozXGlZpYpOZHIsRcNQowtPVDhAt7KY6VtAIencdE8?=
 =?us-ascii?Q?mACB3mrpnrxuFqPBfWf/HDJP5OaxhCP7xT0tpWgYlDgKHb4lqZUCIR/TlyGb?=
 =?us-ascii?Q?re80Y4n2R4ZRYPxS+aLi5BD3oMz/X5KKf2YLcIdHDc+o8JaxKsQWPIQ9UKqi?=
 =?us-ascii?Q?ZbuUhDHITCOFWAvrx4L/1AlnfdeISWVY17sohmR3USNxvivl7bj3low3ogel?=
 =?us-ascii?Q?JnKSmFr9GzLa7LffeLu3rOOVjo/zPKdu8F6xRtwnbEoBF1BQBQGXMpUq1GEq?=
 =?us-ascii?Q?G5ZXUdLkDbVelhidtVaqEP70PirVrGE/0Pm5XgUOTz7kh8qlYDQ1AYA7p63P?=
 =?us-ascii?Q?oNSpHeeffS0367xJA5P3oOszC/QqxUVDiWiEb5MvXoRcDmcibAoSiI9Rwqtj?=
 =?us-ascii?Q?YKbKiSqcj2GYRDgL2g5aN89HkkwWN/LM6GLZNme9nPNU973DlXV3Rz3L1qdR?=
 =?us-ascii?Q?qnSG3dZP5mUXHOzBgVxKac/hF/IFbLcqhjLB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 06:41:49.2473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dea4ab1-21fd-46fc-3730-08ddc9b4005c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5968

This patch series includes the following changes to the PMF driver:

- Implement support for modifying PMF PPT and PPT APU thresholds
- Enable custom BIOS input support for AMD_CPU_ID_PS
- Add the is_apmf_bios_input_notifications_supported() helper function
- Correct the handling mechanism for custom BIOS inputs
- Maintain a record of past custom BIOS inputs
- Process early custom BIOS inputs
- Initiate enact() earlier to address the initial custom BIOS input


Changes based on review-ilpo-next with tip
'commit 5a9fffd8a533 ("platform/x86/intel/pmt: fix build dependency for kunit test")'

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

 drivers/platform/x86/amd/pmf/acpi.c   | 62 +++++++++++++++++++-
 drivers/platform/x86/amd/pmf/pmf.h    | 78 ++++++++++++++++++++++---
 drivers/platform/x86/amd/pmf/spc.c    | 82 +++++++++++++++++++++++----
 drivers/platform/x86/amd/pmf/tee-if.c | 22 ++++++-
 4 files changed, 220 insertions(+), 24 deletions(-)

-- 
2.34.1

