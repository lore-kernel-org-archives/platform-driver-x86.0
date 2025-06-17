Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0088B2609C8
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jun 2025 07:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750144476; cv=fail; b=JycS7c+el4QTPxKOVrjvw+iGHN07B5twICUFXunCoNK411DQrJGLsiK7YlFt8Zi2mmegEOt0EAIY69LZm4l+9s248c7w5lmCj3FhHJ++jUTJv2JZXGKOq1FyNgdLwtqadZc7dDLFVntQM+RlfDmJWfVwuxZ+grTTZSnf7h9VMDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750144476; c=relaxed/simple;
	bh=TWNUiuWnhP85E8M2g6TWqj01xExAIlifVxfr6uhH3oQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HBMHdRDgrCks3X/Tcgkxg8y2HsO5aoTqyV030JRSeanAAk4oYM7tbBSmZ+XJlsHsXY4KbbBh3C8Ha5a/6Wu9IJ1qJxxyCBG48NsaWpFnpPNip1zHRYolrKN8okU4tMoUsDbNV2/XnSSkDnavvqie9iJIeaxoKqBQEfG2pRX8kR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dWjTg3iq; arc=fail smtp.client-ip=40.107.220.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dWjTg3iq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZGkrti0YB5f2fEAHX15+fd2rulFOq26PNY5pe1u79YfmyIQShZpg6jgiKT/X15UjJQpY7/e8kjmFPbx6kQ5yinuBfQL0dXzlkSYIOAqttZLu9Kuui1Cyujm7y/M2DnEgVT5zViNqRRMF5X32jf7YJoaa40dAQe7zI3THXMx9kQgropG5zW7L7/vZ7myVpCVMiacGhxARv9Slmi6jkpma3YNMwGIfCDKmRzO2CCCF1HYg0pFoplkreXxJ1MdRa7Eyn9okRbin6VfBErmAV2IsWXbWOG3VhXbZFoJWZmpFTMMBcZxk7C4vCvfz87R21bIe2r01R28Qp2WLeb0eNdJ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjjO4zaqGqHMqBMxoSFDhRcZeYi5x3kv9TUNJb3HG44=;
 b=EMG4GSv7v18oT1IY2KR0sNbn18ytO1qpBDzUhQ7uynn464PNoRkzjMZPRreC2HXRJTvhXT68fDbRBJ/3cAVeTnTneLV5nEJ5+ib1JxIo5mugV7k3K3i40oHfdH13KBiMZmQ8cJm4S4p1FdPi33oYzNRMsZ9/e4lYIQ6uWVhaovGv/qusz3PMwKVY1fdqb087pjzn5N62U0kYQpEo+KoSjyMj8Ha451G8Z6B0YTKPMSVX8K8fRdc1d/jMhVLyImeXjWDTTbcDexKgX5Nf6tyxhzPvipDab1ntIQ7fC4rMT08qNQ5DR0s7Rm0u77SCV5Tqmo8Zqy1CUExunVoBYSjX+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjjO4zaqGqHMqBMxoSFDhRcZeYi5x3kv9TUNJb3HG44=;
 b=dWjTg3iqWa3y01/5OuW0DrwzGnHuwBc/uuW1Cr4QGRmws9SBmkJ19qJ6Wg4UCFvZjEyNYbNela8UzH44wFXyJw17me2FwpBH6woWhrnrKyAE/zsIhKL/PzOBHYvPXO/q7W8QtPgwfJYypNnuVzx6dg80LwaLEKjl101xBZcHR/8=
Received: from DS7PR06CA0007.namprd06.prod.outlook.com (2603:10b6:8:2a::25) by
 SA1PR12MB7343.namprd12.prod.outlook.com (2603:10b6:806:2b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 07:14:31 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:8:2a:cafe::4) by DS7PR06CA0007.outlook.office365.com
 (2603:10b6:8:2a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.29 via Frontend Transport; Tue,
 17 Jun 2025 07:14:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 07:14:31 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 02:14:28 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 0/9] Enhancements to PMF Driver for Improved Custom BIOS Input Handling
Date: Tue, 17 Jun 2025 12:44:03 +0530
Message-ID: <20250617071413.3906284-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|SA1PR12MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c4cdc40-da35-4334-e011-08ddad6e9ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9+ThdiG1v6HyCkdiRA3AfUUJC8OVM0WynmYWKrNOSDm70cWCpxyf37CDueSk?=
 =?us-ascii?Q?rIIwXA3CsmriZ14sjJ83bcCdBMulhzfawhVN7hIeQT4lE5c6dPk/l6NGOojw?=
 =?us-ascii?Q?pjNRSN5LnZHxSWviDXI6YtsnBHfPvIq9t1W7G0zof6+TrCzOsH6qOmO0He/t?=
 =?us-ascii?Q?pPM3sAVl1mTKHCJncMNlncF8hCheQwFYFVO/D12ZL3KmIi82KG46HnL9AFuP?=
 =?us-ascii?Q?tafz6ea5Ipzsnagojc+iwEjrUEB6hNj3grj74PLyRQ2BkNBu3q6RZvYUwJew?=
 =?us-ascii?Q?sC2nci4UKhISd1VicLtStOCzoNcjE+kre+I+K6wH3EvadyAisV4sNxiu+r7t?=
 =?us-ascii?Q?KY8D0RbzTXuX3NoYOaj6y9VOrP8O/hkeBfpaKXalMJPXQ+bJIYzdFHkB9YIK?=
 =?us-ascii?Q?giwMt9/gZSzUk/CDnc+AOn9/tFrOLuetCP3NbzEofEbpJkLVm3utrfwoKGCL?=
 =?us-ascii?Q?44JF5C4KNtS8d3Grf/tsdmUHjx/rIByxwCkHYkl0nvfLRNJ+p6z5NfXNjImc?=
 =?us-ascii?Q?4OefyUhbN+dvlXpPOxpbkapsLKeYiRXxzLELj15KCr2r8pUBPRj3rOOzuaAh?=
 =?us-ascii?Q?vwETVuoIO31R1SHkkLmg13To/avcuK93GDELYWGWls4iH3tCQ3zl7/VOKXgV?=
 =?us-ascii?Q?nR0u2ZmRLAPmx87o8esZ69hi5ljLczxjewSDhCm7za+W6aQNlN2vmi7B+W09?=
 =?us-ascii?Q?fE4QachT477wNpNGc2BQ/s3+3LQjSyzq8yK2J+RT+iabwgCFK2wQ5ccZp6lI?=
 =?us-ascii?Q?SlXbP2RPe7SmO5/Q2u6PTyXDDY+afjuLKapczpyrMphjESs2zA4LBa3LSIsN?=
 =?us-ascii?Q?l180ui8T0Tm70u1aFZ2y3RDW79onm7ex3E5raF8d9T7lBVLT/0+O/9MqlF1d?=
 =?us-ascii?Q?2MRDuEW3IFA/3jxR9TH/5QRVB1hsEDiAh0J5YbIrgAsl0i/VBCyUgZBic2Yr?=
 =?us-ascii?Q?bIx6LII2v5gDPDXHCXt1Dh64YPSMMm12MqXM91ZWaQLwoOBqopSLiuCRqCtG?=
 =?us-ascii?Q?sqOYIUEcyl4MIbv8V3F3AukpRQ9cis1jipsjRswIJe9bmRWeTnoSMWQa4LgZ?=
 =?us-ascii?Q?98E/qRGsG1QbOIQuPw2FRFiI4qtPZN9NV9+2cRsgp12P0FUDNPas7bNU8cEo?=
 =?us-ascii?Q?1TA+YGxKtxjnm6QV6dOzrlkMcUbAM72/gdZxxPIn6APrCgejjpCLW5Zz4O78?=
 =?us-ascii?Q?R3j8DalRF7jfx8vGU4qcOv6KxFNKC8+JQVoSSDEn/5raLhlnqUpT6YAyh0ZY?=
 =?us-ascii?Q?XFVibPHlsg4YH6oETItYtfFmPdfSZCdD7ZEGbd+A8hezYuuSmM5MnjoB8Asz?=
 =?us-ascii?Q?iFhyEeP5FyuCGjT0dygZHB7THx20ts2MMMlWIC5npAWAFdo6QmSRuK1by1iB?=
 =?us-ascii?Q?93fL86pBbWfYpOAWVQ6fZlLsGEX8fJbsBRAtp3YvSgiZ/lhUIrxQRoJ6Lg15?=
 =?us-ascii?Q?WPRxU54cXZsILlmjOIiaIcPdOF6TI33ZR240gdZPJRmYKuCQyx8AxeCuBapB?=
 =?us-ascii?Q?R7cJZS39tcWNqmZCpJPg07pvWApGPsWcnyXK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 07:14:31.1377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4cdc40-da35-4334-e011-08ddad6e9ad1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7343

This patch series includes the following changes to the PMF driver:

- Implement support for modifying PMF PPT and PPT APU thresholds
- Enable custom BIOS input support for AMD_CPU_ID_PS
- Add the is_apmf_bios_input_notifications_supported() helper function
- Correct the handling mechanism for custom BIOS inputs
- Maintain a record of past custom BIOS inputs
- Process early custom BIOS inputs
- Initiate enact() earlier to address the initial custom BIOS input


Changes based on review-ilpo-next with tip 
'commit 73f0f2b52c5e ("platform/x86: wmi: Fix WMI device naming issue")'

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

 drivers/platform/x86/amd/pmf/acpi.c   | 62 +++++++++++++++++++++-
 drivers/platform/x86/amd/pmf/pmf.h    | 75 ++++++++++++++++++++++++---
 drivers/platform/x86/amd/pmf/spc.c    | 52 +++++++++++++++----
 drivers/platform/x86/amd/pmf/tee-if.c | 19 ++++++-
 4 files changed, 189 insertions(+), 19 deletions(-)

-- 
2.34.1

