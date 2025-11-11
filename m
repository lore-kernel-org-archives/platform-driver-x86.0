Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010041.outbound.protection.outlook.com [52.101.193.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13B02D7DFB
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Nov 2025 06:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762843103; cv=fail; b=SBm038ytItshM38FN5NEQDR0JPsrWDtZdRQ+4Qbtaxa021szq26ffMmKEhRCdqEg7pmBcwql22oa1ya8oDRknP812iN4+Gkr5CrPYDILviVGEZl4PqCN2PYqSoj8oeRGp6bazpCTfPsEbZdqnStbhdhr+Sj0Sv9pyMdYuwezNTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762843103; c=relaxed/simple;
	bh=ldTcHH/NW8hmy0jNLNbj48r1OtO/Ci0kVHR6CynH9sk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qRARvfqxD+faNZzg7XhUO7yhhmLrdxra9vCbHJxFvHp9LDNAen1CC3GhJ0xofA7wgSXsRZEayBrw3UjslkRP+BXwcXi4UXb91PdKfO2CQ+HVzx4WpOdgeEs6IMEoM1WP8ULOL+ECwGp6vEVO6LKtGDOmcJfNf7q9mObRu4XqAXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0xvR3euJ; arc=fail smtp.client-ip=52.101.193.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0xvR3euJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8w84YlTm4gaqmmYC1CreBUu8sjKKyOL3rfNuMZ5mH3obnrhsbxFHYoJxXgxUucALVK32AwJwms5NRmpO82hrg6hyq5awsiaXSjB4oKtpfb7VHB6OeT5qSqZKvKd7hf89dlar7AK7swWpdWiXyt3/jV/RDrQVgsrvV02GhK9PRvoXX4Po9pmpzPYhTdAqeoW69ru2aoa7NkcSVuKvfcVl3aTEbFjwiaR3a1nF38PWADtLCYjSO6mWOeVPVNyJW3mls1jREHGtRh1HSLcMuKetgrAaoXcS1a7qphC3eXnIODd5vRH3J12iXJEoFMnbdZNMWBfiPXj9Fv7+VTSK76tJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BG2KyPVAdP8s4nnwJtygDfjU2tu4aSVOlMFh+hB9/+k=;
 b=QexTA8rpWc87t9Z4oHJAILB6kjmOBRkHG4qkRq1H1kEGvSRxFjV2lgwl6RhD3w8gDB08CLxwD/yTE9UBineVoMrSQDTAHcSuYLyMdQPGnxYnBHfVqiaJFABZxEL6DRfaTALO0eTMnlF1PO7Dn3efLqqN+lJYim+rtqmfc/d7igtEPKZndlCfeQZfOU5e2eLs78Tb1siryxUbSTjCfDkmAwgiIq090LPtCcsRLXBO68q9xUX+iIN4CaiB9SCAVH2jCMCBKBtY8lHsKE3ACY8Y7RTTXi34Ih+6dR0icHZckCELpBEQj/w9YbDm2+UuTNsQu+FVLy0T3mSTiNl23nBYhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BG2KyPVAdP8s4nnwJtygDfjU2tu4aSVOlMFh+hB9/+k=;
 b=0xvR3euJ57TvWMI2ey5egKZWFlm6WMn5QCg37E8oVYBsMYBBRMwmf6jlTr36QBRL2ueOXz8V2+5lO3q75N6AQICVtIsxK+dbtN1C5vq22PBYkhlak+23HfPoPNBu9xf61VJ8AbmDdtragk1iN9K3MQCeOhJmEffHsmxXRYbNq9Y=
Received: from CH0P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::12)
 by PH7PR12MB9073.namprd12.prod.outlook.com (2603:10b6:510:2eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 06:38:17 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::e6) by CH0P221CA0014.outlook.office365.com
 (2603:10b6:610:11c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Tue,
 11 Nov 2025 06:38:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 06:38:16 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 10 Nov
 2025 22:38:13 -0800
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <lizhi.hou@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 0/5] PMF NPU metrics cleanup, command flag cleanup, and amdxdna integration
Date: Tue, 11 Nov 2025 12:07:32 +0530
Message-ID: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|PH7PR12MB9073:EE_
X-MS-Office365-Filtering-Correlation-Id: 801aecc3-76f4-4cdc-8f6b-08de20ece588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5ihDnc+zMXVmRt4N5tL4iO9f9cyq9Y86Ap2nOI/2uvnnZokFhH/dQ3xavqxh?=
 =?us-ascii?Q?bdbZSfYBzUIUWF7GGrukvjS8ADJ4jHat8zaOMvThlCFCLfVRHt5RYDxuApOO?=
 =?us-ascii?Q?/20v6AclWbXrX79TqMAYg3XC7Dk2bdAWovOGUsNu0RvzildwPcDP2XdixaFp?=
 =?us-ascii?Q?hac5rq3W+HHsVia9yLF5I5ryqrUlAveps7zGcNhL3PC8X15oTJEhKIrHv5hE?=
 =?us-ascii?Q?gamiA+KyaXdY+a66wOAV5kvaVTYoXG1TAEmn7sxu18KqnfykRS8ARqkQlq49?=
 =?us-ascii?Q?TOa9DPhUpQY5ktuvaXCZ5Eap8Khfcdyghd4Z02EI1yZ26i4xXbBgCYw6PR2P?=
 =?us-ascii?Q?Tsq97fZUB4S94zr/0hq2BNtQOUlzh9uMFMUPXpJguPONau4y31bvgWsmxyvu?=
 =?us-ascii?Q?jmRyhLEMjDeXNbydiiMYKeN54wY+Gnrzy4cRMsYaF66bd0/fXdnBEhHuPq0j?=
 =?us-ascii?Q?3HZxbvLyMU0PkwEMXm8o/bOilN9PuXzEABKzlustudbUdh5cXe94nnYXSwPh?=
 =?us-ascii?Q?kjUV+Wyn4gYt6GvqTvCtZK56i3E1qeBurzxqOTh8EuNusnXPiHiZfepBWprz?=
 =?us-ascii?Q?O0bbuzTX3BFAYufCZXxvwD7o4nXZJ4Us86ngPHbXtt1rt3WiKvNC2e/ymtVZ?=
 =?us-ascii?Q?HctZo8cEDmfK4P/zgcRMcjcR8g8MFhEa6bP7LCZM75wQyQ2laZpxKJIUa9sg?=
 =?us-ascii?Q?tP2eZwJtkWtHpWOLdYVesunzr48J4BdqFT2YZbiDx+sxW1RqQ1OTmYHaRIz8?=
 =?us-ascii?Q?O6Il4ABIcCNHkeln32dAlARa4ujo3OP7TVH8MGZzuTclifVVrSiWCQ+71Csa?=
 =?us-ascii?Q?Q1Jdq9Q37zGqnRBSq045Jvx/yp69bxQ/BiBpE2O9iw6ygYr4PK7VnB/IHPez?=
 =?us-ascii?Q?JecP5aNW/AvH10rCNHo3+4tbXR0gZEnBwMJHS6P6RbYfb5UCD+mOmMeewxHn?=
 =?us-ascii?Q?GP9/ZPwtLPZqSksd/SArox8qu87H6ASYzPGMFWhdFf1vmOP4+A2QVO/Mr21M?=
 =?us-ascii?Q?Qy2kxRstM9TKKzWQupdYE2ATxdPTDiI+pYJeSGH6JnyIzDcKhzlngDI4DuSP?=
 =?us-ascii?Q?MQcuzCfjyKkSGumnx4H4zuUMTokd6QEfOikmBB+Hc30JIvuD2egItcgVujSz?=
 =?us-ascii?Q?Ndzdm0X5g9uCfkQ8AB9c7oVoiSUC7qscead42poQWbI+FVjbbIDQPKxLLc3G?=
 =?us-ascii?Q?Y96vvwnVt/v19rJYbGZrYazBmPknl4g8mFw/cvmqfLx16jQPHrGKYDW5SO+2?=
 =?us-ascii?Q?+lh09KigsvIQWV/IlfYxqjYQ68Xi6MWbGmUys4ashg/hsvpKTNJe9+Tml3Zu?=
 =?us-ascii?Q?xxMwjC28QkGV6mNGQjxoJOqRHPq66P4zmLSgdwzsWqCm9EB9g1OK9cMmxZNP?=
 =?us-ascii?Q?qR/VQt9frKxryXKnvMq3SiiGgfOvsguVNDgwi1a6fVzTcgQIXnmoGw4kWN6e?=
 =?us-ascii?Q?ngJQhClQOhHe5cJd95HiwuHKYKhvjsq133dLBQ4+84sCZiuQkVFHdNelleb6?=
 =?us-ascii?Q?Mhl6U1Taq+osCgRtGb61SVe6nRQ1HrPda+bVFpnhJwFVJZ/VivWk46DEQmEq?=
 =?us-ascii?Q?YWs5tMO+Blfr85o/pr8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 06:38:16.7952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 801aecc3-76f4-4cdc-8f6b-08de20ece588
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9073

This series streamlines NPU-related handling in AMD PMF, adds a
lightweight in-kernel interface for fetching NPU metrics from PMF, and
hooks AMD XDNA to that interface to expose real-time NPU power data to
user space.

Changes include renaming legacy IPU fields to NPU in the metrics structure
replacing ambiguous booleans and magic values with explicit
SET_CMD/GET_CMD and METRICS_TABLE_ID constants, introducing an exported
amd_pmf_get_npu_data() API (guarded by a mutex and platform checks) to
pull NPU metrics from the SMU, and wiring those metrics into the amdxdna
driver.

v2:
----
 - Split the series into multiple patches per v1 feedback
 - Added preliminary PMF driver cleanups as preparatory patches
 - Introduced an initial amd_xdna patch that consumes PMF-provided data to
   establish the plumbing; additional logic can be layered on in future
   patches as more PMF metrics are utilized.

Shyam Sundar S K (4):
  platform/x86/amd/pmf: Rename IPU metrics fields to NPU for consistency
  platform/x86/amd/pmf: Use explicit SET_CMD/GET_CMD flags in
    amd_pmf_send_cmd()
  platform/x86/amd/pmf: replace magic table id with METRICS_TABLE_ID
  platform/x86/amd/pmf: Introduce new interface to export NPU metrics

VinitKumar Shukla (1):
  accel/amdxdna: Provide real-time NPU power estimate via AMD PMF

 drivers/accel/amdxdna/aie2_pci.h         |  2 +
 drivers/accel/amdxdna/aie2_smu.c         | 12 ++++
 drivers/platform/x86/amd/pmf/auto-mode.c | 14 ++---
 drivers/platform/x86/amd/pmf/cnqf.c      | 14 ++---
 drivers/platform/x86/amd/pmf/core.c      | 71 +++++++++++++++++++++++-
 drivers/platform/x86/amd/pmf/pmf.h       | 18 ++++--
 drivers/platform/x86/amd/pmf/spc.c       |  2 +-
 drivers/platform/x86/amd/pmf/sps.c       | 38 ++++++-------
 drivers/platform/x86/amd/pmf/tee-if.c    | 20 +++----
 include/linux/amd-pmf-io.h               | 21 +++++++
 10 files changed, 159 insertions(+), 53 deletions(-)

-- 
2.34.1

