Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F337813A265
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jul 2025 05:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753247598; cv=fail; b=gZvVXQ8bGuegWkmDTAV2Vb1Y4ey1r7M9lcsQe0f7Sddb8wAU55Rn2aZ19z7dhuJgxxzSYcDlFRfi6o2t6cexj7ApL2FgOoSSWpclueTRlmI6m7e7DaUdciVJlpnoNn3Iop9Pd1I1+PDSs5rOHFNM2lu4lyKbWEuYztW5so9fuD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753247598; c=relaxed/simple;
	bh=xVoXS9l0Av+QUKPm+hVKGoXKt4qYzYN9ltJiyNp8Cws=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jW+7qeyRmr1nYI/exnB7n698WToVhvAcD5YXQdezX0dZxJNLxuRGnNH/iVVOARp3CyQNZL3xhOV3QtDNtDoAmjnIIPRS1UTi37FF8nbhvFvhP3W5FLefvmGMKXZotrmlYWDYW+CSlkOsXxg2CQLb3e4gURvSKQ2NAuItJ+xNhZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=r23pY1wD; arc=fail smtp.client-ip=40.107.92.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r23pY1wD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQGBoyCHp+e2gEzKAkMzzpYETArAUQnk3J7FmjTlQZD2+nYsqRSQyZsuCosnxZhXL5HbsooP3HYZG3WJHWXEhnA+xHnB8HxXn5s4CC35riiBsgH/2ZFfLESZ1OAmgvkoDDXfmhC3dvztDnEmUCO7rKPfjnFwe9eiMKybl9VohnZImYRQCaU2RDiFw6DylJJDFcFput/SbgJOW24DOD/PULWXnaDOpxYrOE/97kRnc9WGOxqEfvTcEIQS6aByhSyRHPHAZUBrsqBGwAidfjPZ3gJcsomQVKMRVaTunNLAZ7nPI+939X0iYJfIf9Bnjc8trXXChlPKFAhjGkkxLgb83Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LQvwSPpOSDJUKxjAjSwmylS0NuXuOA3F2gHIY++W0c=;
 b=aMHWRxOreMIF77VJ1IvqQ2VuWInwPlMJHfBhsweAJ/+Sw+oIPEDryKc7LQMA/BIsA6PTVtaj5QehSXU++QIbBcQ2aFv+HOjikoErpjQnxT7wABeP/9UXNxtZDB6XBsSm87f+jsSo+dO0O61V2uYsv/vwI/xAM4oXceYRJz0aej/vGYc2aSR+lruyTqLtz9vIUjX09LepCHst0cz4TpP1w398+8N7ssqxSluxLfKeOEtBoCd+Cl6+EctiFI5H2dXAGGOldFCf6+3QA8XtXE72nq1DfQ/wCbyfDtGlf0GPWUJtvbJd98Xk4UqvESPNH0cGLeHJzDBz0wn7Vd07H0ixaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LQvwSPpOSDJUKxjAjSwmylS0NuXuOA3F2gHIY++W0c=;
 b=r23pY1wDEYPwKeX64xEwkK8yWp3KD+cGVr/pFtEc9xegu9yuJKKMWr6xVh7c4h8yRESNsRwr6NcTmdClK7jmMVQS1crJ9vHV3bFG3AjfpvRe320QcEUIOUwyhQ+CTTV6Xbs2VNypu9OblOGhYkJXG8LoU+6ENvFzxDq7T862cn8=
Received: from SJ0PR03CA0168.namprd03.prod.outlook.com (2603:10b6:a03:338::23)
 by LV3PR12MB9258.namprd12.prod.outlook.com (2603:10b6:408:1bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Wed, 23 Jul
 2025 05:13:12 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:a03:338:cafe::59) by SJ0PR03CA0168.outlook.office365.com
 (2603:10b6:a03:338::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Wed,
 23 Jul 2025 05:13:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.1 via Frontend Transport; Wed, 23 Jul 2025 05:13:11 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 00:13:09 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>
Subject: [PATCH v2 0/4] platform/x86/amd/hsmp: Fix potential issues during async probing of ACPI driver
Date: Wed, 23 Jul 2025 05:12:47 +0000
Message-ID: <20250723051251.3009625-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|LV3PR12MB9258:EE_
X-MS-Office365-Filtering-Correlation-Id: 27e4109b-cb7d-479a-7d47-08ddc9a79ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b+Vt4kMTOYQ0rmESlL6PFdEQ72IT7PZ24fjCbsWYWB+9oz46ISR896AhR7zz?=
 =?us-ascii?Q?iYa1+uKiVgoWN5sSEZ9XCXw8XBJnMgevHtT/6JlTioqKSS3YFNo4nes9T5tF?=
 =?us-ascii?Q?tWWpEqpYpmIKwETXN0EfQgQv0qDMlTwnP2ch0n2/TTr/ANt/HuEOBXpJGqrE?=
 =?us-ascii?Q?To1d1x8y0HW/b/mhHqu/yl30GE2SMBHzS9uObqrKbEpnfLZwOqkoE0oiZyRc?=
 =?us-ascii?Q?qlRHa4QR2BpcgfSqrC2DBvz0RV7Wpd1Lhy0FY5T8e3LPurRMbiHgDJqNuGXr?=
 =?us-ascii?Q?xRFbCqZvkIBDkgEwcZtHlP8M3Q/aJTTozsmS8h+7wbP1Rc3d6G5C1pl6linT?=
 =?us-ascii?Q?p6b1Thkg19BnwANhMz6kLHP6tLHhKnIdyQxwmQB6gBltizRHGpx2gJuvlYs+?=
 =?us-ascii?Q?O3WUjeWJ94cfiItVzBYVBHXejO8roylClhF6VqsTOjDX8cE1BtgS84SdbXgW?=
 =?us-ascii?Q?jE5LspcJ9hYIrSoAx7riAp4r0pTXZ32y09s+jNrs/8/vDzX6i/9ctfk9Mcba?=
 =?us-ascii?Q?Ptqi+pXcdMsGdb2QAjZPLfttwuGnpTJmxwAKOYNkjr3WUhBRg4CTjXeQThs7?=
 =?us-ascii?Q?S2idxsz/BFmgx1/9UIIKe0Hz6alvrxiVD+RPEBuNEbSLzfNP2TehOQSGkkJF?=
 =?us-ascii?Q?st6lYyDkPQPHi0gsP0G8ith2jGGQrckYgN0eckGjf+7V7hXkir9yNiIMpHVu?=
 =?us-ascii?Q?sHhxmQ2AFyoxRRdjR2UttKCZ3AzUjnPJrFWNNJoYWj5sTUZd5Z/xrw1ne4+1?=
 =?us-ascii?Q?y67wYTqCJur4/UhetYvqa6SxUqBEYKO4iWxbwI6DlFa1onpLyQr2+zqjdqsY?=
 =?us-ascii?Q?cUC1XDwL0kuGvxk6RrfpGrTXhbPqg1KCvOW7PcoaBPco8sZN7w1TiAL7CG3Z?=
 =?us-ascii?Q?fybhYCb3/oMZwNt6EsuS4v7GqFUxirK1zRmGHw4M7kOifM26CizsXOrzT/FQ?=
 =?us-ascii?Q?eEp4wqM2mEl3uz+/zR45P/VuagcwdVyFpx+ZVRntoc1k5bIK4EnDsKfklISz?=
 =?us-ascii?Q?jGvziC7hAXzuR+ic3fWjDaHlIIpHuhMzxt5NEhhIXGULp8iw8RJM8AaDEIIq?=
 =?us-ascii?Q?OiglWIpEsYGAfAIFGHLpkQFOyJ2K7yf67h+urLV4Fwuf2cFvqAC0ut9LfXt3?=
 =?us-ascii?Q?kI2VSE7ctTExHbfoS+XeVe7d/1BpkOCYhWmmG+NlsDPdLWkrskNBBDpNdEZu?=
 =?us-ascii?Q?nR6vAas+3ph1FgTWV4nK9d9AAViOUtg6Ix5L3LXmcFdSPE5/YMyYRJlRAqqg?=
 =?us-ascii?Q?pN8Mwx1nMOrWAqGZs86GE6JqK8F5SJ1dxLLg/eaGke4/qS4MsVVv+cfbVr1s?=
 =?us-ascii?Q?42cGDnOjPHnbZXvTzS9p7rOHCa3uxH0OJ34+tPZssXYmFAwZVmfZpUv3mfvb?=
 =?us-ascii?Q?ln6+pYbi3eFPqCXguOxxChJmTuLrR4brhEYOIjXFFVDf9zZNRpRzvKMZFsT1?=
 =?us-ascii?Q?lqCMwSBFmICgxwBLxyBKuy8vq/tAvIuReFcqX5YKEH5YAYCG3FmxzWB+0vV1?=
 =?us-ascii?Q?Jxm0H4ppFT0S7zx1Zw5/nPjk+zZyF4Wr+v2p?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 05:13:11.6532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e4109b-cb7d-479a-7d47-08ddc9a79ed3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9258

This patch series aims to resolve potential issues that may occur
when asynchronous probing is enabled in HSMP ACPI driver.

* The first patch introduces a mutex to safeguard shared data across
  multiple ACPI probes and removals.

* The second patch implements reference counting to ensure that
  hsmp_pdev->sock allocation is freed, and the miscellaneous device
  is deregistered only after all socket removal calls are completed.

* The third patch relocates the initialization of hsmp_pdev.num_sockets to
  hsmp.c.

* The fourth patch adds a check for sock->dev in hsmp_send_message() to
  prevent access to the hsmp_pdev->sock structure when it is not yet
  initialized or has been removed, which could occur during partial
  probing or removal.

Suma Hegde (4):
  platform/x86/amd/hsmp: Use mutex to synchronize ACPI based probe
  platform/x86/amd/hsmp: Add reference counter to track ACPI probe and
    removal
  platform/x86/amd/hsmp: Move initialization of num_sockets to
    hsmp_common_init()
  platform/x86/amd/hsmp: Ensure initialization of the sock struct in
    hsmp_send_message()

 drivers/platform/x86/amd/hsmp/acpi.c | 34 +++++++++++++++-------------
 drivers/platform/x86/amd/hsmp/hsmp.c | 33 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.h |  2 +-
 drivers/platform/x86/amd/hsmp/plat.c | 18 ++++-----------
 4 files changed, 56 insertions(+), 31 deletions(-)

-- 
2.25.1

