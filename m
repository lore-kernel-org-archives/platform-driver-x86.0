Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D1A242D66
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jul 2025 05:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753247603; cv=fail; b=th84+L3FbAtm0R28lIdlnGD7iyVko+ra3HjwHhiQWE2TJy4IkM720D3AQFYUSVVzVmbSSwEtnZPFzPrcm5XsLSu+l3BsQRl6W2OyfyxqW0I3Zmy04vByDCxNOJ0DASSIW+56qj3R/kPVdaqHWtNV/h3gwh3MjEhgx0YRpx9vWaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753247603; c=relaxed/simple;
	bh=C+dQt6Oh9Zg8A1fIsyVfvuN/2NPsTz05fli+xaTgG4U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nmxad+jY/zNzYqFRT5k/R/ZBJAHvIooD8vqbXPufidJseGJU2bDd1ULmennysqMYF/jhKBTvyjrFZseGgf9vV14THsXnJSIu9zwhcFzTIfMim8zAmcTxYZpJ3op7v7B/KNvwcJI8jVTVCJ62+hOmayF5ZDy+dfaoUL1icTNztWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GzkHLDKj; arc=fail smtp.client-ip=40.107.237.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GzkHLDKj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gk3A1kPol0zlHmsdICgG2m5vrlCq1kjwugeaIzyIJJ7n70VqF3a6vNccSexgCCEuTsKFYFXeG8Rsdxs2LUo6LXYcxS0E6Yi2vCQQhzUT35YyRX2h0VqQ0kNqBHv/6oktCmueIRRIZxJqpg0ksE3He+i04jf4zGRfL9u1pS2a8OxNLaGmACAt46yWV2k76clry+WZqzjMis6yihYLCwWkg4Q4Wbf9p17y/GqIqarI784129JoL0JheR0Fi50hW2CHGgZZWxINKbhvMAMZcxV+g56L6hFc1+xSec7JrR/8EPCgJN//WgyPVBDr5x0Ec4TdjggLiPwQeANrYstfHQtsyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QJccPl2vXDyb/uTGVapNcD+lV1iDo37nQKN7l8Lo1M=;
 b=kcdzlALojqcHZmL09gu7iRaihJ9n4v2tCnRLUe/0tY5tCrxfFYmEItbacH5M2iKZ4dj/g7OkFAGNdpc7lOpO2t8cpGo6Ebfky7UHaxPUp827HENRu3Xj7COEiyg1K6ndk+Vvr6Lb50ZBp8p0X7CN0MqdbSoTjnqOLm2ynsc8DWXapPdyd/199QaSM3izjEoz63op1iR9sxiM1mo0Qio5H66oZXCUU7voxokBAGBGDjcuA1KCHQbRPtfrU7nuY60zo8uuydJxF9I3+TERGJEFDr8PJT3SrMXXSLu1f5A4zVMAeFflyLfoS2HvtsjF8jofVVIEOEG5yiQczFUwN876VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QJccPl2vXDyb/uTGVapNcD+lV1iDo37nQKN7l8Lo1M=;
 b=GzkHLDKj6yEhFaRnAJ2cv6wzjBxUyngoZ/fru9eOt9gSrDvJYiikUWVaeeLPDk1irxUMSnJGvM8/4Sctkj7QuepMEFKucYghz3WXwWTyYuVqPQ1qdOgOdq1Rn5dtIpwIwtZpLnabCTVSO2dUS3QyAynY6P+AdvbsD+eYOvrBOsc=
Received: from SJ0PR03CA0155.namprd03.prod.outlook.com (2603:10b6:a03:338::10)
 by DS0PR12MB8453.namprd12.prod.outlook.com (2603:10b6:8:157::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 05:13:14 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:a03:338:cafe::4d) by SJ0PR03CA0155.outlook.office365.com
 (2603:10b6:a03:338::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 05:13:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.1 via Frontend Transport; Wed, 23 Jul 2025 05:13:13 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 00:13:11 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH v2 1/4] platform/x86/amd/hsmp: Use mutex to synchronize ACPI based probe
Date: Wed, 23 Jul 2025 05:12:48 +0000
Message-ID: <20250723051251.3009625-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250723051251.3009625-1-suma.hegde@amd.com>
References: <20250723051251.3009625-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|DS0PR12MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: 98204a71-7c80-4846-d45e-08ddc9a7a00b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?usu+e98eYq9/Wc3Ets2y/mg9Nli5XZPrqCBh75ALn9/jF0k2Gw9ScyFZIJp1?=
 =?us-ascii?Q?VHhgtAksWIiULk3D+iB7nKanpB4XUwY19ig4l0eJI8+c4xOi1Z+o8nUDOaIb?=
 =?us-ascii?Q?L9M9Y20RalrwjOjwOn0gmZ7NYLTSxb2PxmTF7EzDuczcztZL6pgADOtNWFGI?=
 =?us-ascii?Q?NqoIALYSJaQFEcAZD5nW90DJkpEEhk4dFGPeOcnPOPq1oe6KqJ9/dcLQJz1W?=
 =?us-ascii?Q?sOdrBFVwz6wn6vFPMYo3+E5P12OXsUElOCAPb81LY0V2jXb0v6qTYgwYt2Kg?=
 =?us-ascii?Q?GSjYNxIILDBvlbvJunH6QJURNtBw4KYob5750RZJMvEi+kTaiUqRNyzd4wI/?=
 =?us-ascii?Q?kqDqzxeNR528mIXFpHHyTCSAyq5MuwQ9M6kq836c7LJotsz7O1f0WC4voKJn?=
 =?us-ascii?Q?Es3r8s46CTP8K+BZhjdzxWwnzmiw8pcOl7Q/D8XWSgjMdQWKSIPTYdMNbf2R?=
 =?us-ascii?Q?pPR10yaaVVLCoahe0dXmGj/wtUVVnFVVLBiKr6QE19im+tYHMQgErX+cvbYY?=
 =?us-ascii?Q?LSpi79n1fjbHCdKotcfpDF4zY9WnO77h4+oL1xvB0KccQUcYJvT1tFJe/P7A?=
 =?us-ascii?Q?tCfiZDvAgrHI1XCYq8vNNLSUCkCtLa6uz4xkuIqCXM3iNy756IBGwK6e/L9+?=
 =?us-ascii?Q?irBrcFdXtB9WFDE3dgkOUUvY1uYb4Ix+8N6FHjKlHtGrQ4CdP4MNOZYY+XrN?=
 =?us-ascii?Q?u1S1Fxamb/0TJjlFvu6OI1H+wNT3u21M1QngO40KqzJ+l7XRi5jlKSLmUvI/?=
 =?us-ascii?Q?U/hAM5llzkTmwKE0pQhUsNfjjrzcVBydK8iTyttJXLGHbdHQQxuY/xCypuPm?=
 =?us-ascii?Q?JNtlcnzDQbuvfG7VuayfZRb6qTK4M6rmH9ULqZ5SmVlPJ2x5tGRCUM6Fowto?=
 =?us-ascii?Q?0dr5o4vOmccrZfEZFUYHhnT8LCI34ZyJ0mbUxvTdNnzje1z6vL3vaJiduRAm?=
 =?us-ascii?Q?1R/1nnmrKS55m4vVDZYudjyyNTBXYHLxO7IItdomuG0trfSUNoIvSYnKaOGc?=
 =?us-ascii?Q?YwJAbXSA+cMOAymiCfIkQrtI+KYUsC+QOgDLrOlpG6w1NH8/Pe/20CCmGhvS?=
 =?us-ascii?Q?oJxT2/Vsfbq45rIS540ncAOXN+MzZNTuH8IkSYCnbTsdHLY1iUULFuO5IgeI?=
 =?us-ascii?Q?Cvq9XFjkXLDwhsagLkHKslvBvMSS1Xe5tI0tATKr87O4JVMhl8C5udH7acZp?=
 =?us-ascii?Q?b42bNf9lf3/tvS7yrdcK22cdtc0pn65URtchz/nrxCr7jciS0KsDp8AeQjy6?=
 =?us-ascii?Q?D1y8R5HvmTaChg/xN46IrL7C+FKHzMN9UJHp04X+MufwgVrNDqZ/Q0laJBKq?=
 =?us-ascii?Q?XfYugZfNbaSL0t0pQ52dYk/Be67LztvrBs3sZl0zSaAy5AN3Qi3DxYXgzJj4?=
 =?us-ascii?Q?zvg9I+K5QCj818X3DDR7Nujb6qt4wkC4Bva8T5XrabIvUavD0KAyjIGXPYeS?=
 =?us-ascii?Q?qlpNg5pl/YrkWNckTq2S8WdWjUAt3eDqS26TmxLgKMHI2erNen+cBLYW2EPw?=
 =?us-ascii?Q?3aqBcqHx3N+X57a8Y6FnU6Ebwuzk+urdLu9f?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 05:13:13.6993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98204a71-7c80-4846-d45e-08ddc9a7a00b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8453

The hsmp_acpi_probe() function is called for each socket. When
asynchronous probing is enabled, it can lead to race conditions
due to multiple probes accessing shared data (hsmp_pdev->sock
and the hsmp_pdev->is_probed variable), which may cause potential
issues.

To resolve these issues, a guard mutex has been introduced to ensure
synchronized execution.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v1:
1. Guard the remove() also
2. Update commit description

 drivers/platform/x86/amd/hsmp/acpi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index d974c2289f5a..b981ae3157ea 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -13,6 +13,7 @@
 
 #include <linux/acpi.h>
 #include <linux/array_size.h>
+#include <linux/cleanup.h>
 #include <linux/bits.h>
 #include <linux/bitfield.h>
 #include <linux/device.h>
@@ -20,6 +21,7 @@
 #include <linux/ioport.h>
 #include <linux/kstrtox.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/sysfs.h>
 #include <linux/uuid.h>
@@ -44,6 +46,8 @@ struct hsmp_sys_attr {
 	u32 msg_id;
 };
 
+static DEFINE_MUTEX(hsmp_lock);
+
 static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
 			      u32 *value, bool write)
 {
@@ -584,6 +588,7 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 	hsmp_pdev = get_hsmp_pdev();
 	if (!hsmp_pdev)
 		return -ENOMEM;
+	guard(mutex)(&hsmp_lock);
 
 	if (!hsmp_pdev->is_probed) {
 		hsmp_pdev->num_sockets = amd_num_nodes();
@@ -620,6 +625,7 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 
 static void hsmp_acpi_remove(struct platform_device *pdev)
 {
+	guard(mutex)(&hsmp_lock);
 	/*
 	 * We register only one misc_device even on multi-socket system.
 	 * So, deregister should happen only once.
-- 
2.25.1

