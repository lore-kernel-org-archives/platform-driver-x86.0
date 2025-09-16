Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEBF192D68
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 04:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757997492; cv=fail; b=E3SS3MNC2I7zPdklf4TBq90LjnBIdnbD8BDfE9Mp8SOBJsQxVNJw1fDSvePIZ9q2JKm+cWg64ZZx9c5E1SjOtS4Zmcy4ofQGfRE9isVT8hFUBE7VgrtFBK40/32k9bfL2Zj5p4xE7ZyQjI+1CZBHi0fUi11gcV/p39eb+I5XtwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757997492; c=relaxed/simple;
	bh=dEXalsMB5MieVPxryHhvl6ywTT9pGx7G6H+f80esprc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LIj8MlsggCx06xJ2rFt/VVvo0zQmx1Xi4pnQYA9bpvCwl8W8wM2MwL0Q0JMSeJhzLXLPT24X3wmYcbGy92a6fX8JQFA9ZfcaK2y5ZGMxPZfU9JJX341coirZFJq92KTlcXW9fSFGFL7L9cumDx+Tahn6hoP3YuMTJeAwfGmWhOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dsYZ/t2y; arc=fail smtp.client-ip=52.101.62.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dsYZ/t2y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=js9yVVaG2tgfZipj0YDcFBdG7gE5dAmUaNdq/rtSs5gXVQwTQApLzGDDeB/RVwOjhA6SNFRDRDYUVfpzRHkmuP/xvvkpmZAIJ7fvU3bqjnWLnztVQkM9Q+K1oRfU1KAQNeAAyIBwde3m1ko8oPHoBAVRIJnHAlX8Qcsx67xsGFVDezIGeu20ckv6Oy70J76Z9/EUDWaHpvGP4Yt4mGE65hvZZoEji7f9YijHgqhgKqrJt87v2pSUh1SXQiymFjiUvwMdX+891+PuLdPPvH4plO9rZRbVoPPXV/+Bk7HzAZDi8ShcWbV6uphWjRW3V33kyyAnoYcAZ7dxtgkIV84g0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKOk5cqAql2wRTNrSIMHEYkopWjQldI3lRdYGhGpfq4=;
 b=o7MnZg+oWN37m7v2v6xOynPvcYxswcGadxbGjqdcj/88HjoKP72e5vZKkXye5/QntWEFr71jFndF0FecbTmfiLSwEJFYIv1SdDaimCabdt24z0L5qvmI/z3KT5CsnyVCh+EL+munlAulwoIuxRB4mHq3779fJckktQbSHIWOg2pMbJlFpik9wCm6VdAea4IJQhiieBOnmBwVetevdU4zkrkpYcCfM+cY6IT4Fe5jn2vPGuFGCcKT2FN8pTIXkmqRX1K9wxe/oXK4l8s0SSNJaxlScKYv9d0x4z5O8ecplbKyoAuSx5T9DyAb7Dj/n2RHrQ98tICn3h5Z0aZRwrFQLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKOk5cqAql2wRTNrSIMHEYkopWjQldI3lRdYGhGpfq4=;
 b=dsYZ/t2ym7QmzmcDxtSfssD8b7tstWu3ZC3xTi5wFtBriqlAdtY9eYNeInJR90Vm19vqCIxf+a9Zxid/j3fcMxLo8+icl9EdVbMyXLuglYPalQWLAJjY00YC8HKkuiFZROuHKqzRDfziDod3ivPqOVRRG/aa7h8EBjeM4KXPrAE=
Received: from DM5PR07CA0094.namprd07.prod.outlook.com (2603:10b6:4:ae::23) by
 LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.19; Tue, 16 Sep 2025 04:38:06 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:4:ae:cafe::6d) by DM5PR07CA0094.outlook.office365.com
 (2603:10b6:4:ae::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.22 via Frontend Transport; Tue,
 16 Sep 2025 04:38:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 04:38:06 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Sep
 2025 21:38:00 -0700
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>
Subject: [PATCH] platform/x86/amd/hsmp: Replace amd_num_nodes() with topology_max_packages()
Date: Tue, 16 Sep 2025 04:37:36 +0000
Message-ID: <20250916043736.3279947-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|LV9PR12MB9829:EE_
X-MS-Office365-Filtering-Correlation-Id: c75fd004-b866-4189-af32-08ddf4dad4af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LFc7L0tNA4l7wvUtsvZkTfjeVRfhRdPD1KnVnF2a0lK1YWZZS6zaT26psoAg?=
 =?us-ascii?Q?SziYXnI0Dp7/X7Wy89OHp7FFvGskRUBxznIp/Fqx/2CwFmpFZ4Yu4S9OlkA+?=
 =?us-ascii?Q?o7l54uL0pFR5+4/0TJGO6pVDDcVwvzq3DWPU9B1xMxmDPZE68YM80moOYLZt?=
 =?us-ascii?Q?9cGDFbhct8Vm7CNXIkd5EgE07o3pyBPLCVfAOolFasMuD8AP/fkg9dsBPFd9?=
 =?us-ascii?Q?LtUFzClvrghrZzoixoUu9MuyyW2G10lmML233ztd5RzufIElLH4vCkYGTz+s?=
 =?us-ascii?Q?pM5CPRRVtpUPtfu2mDiiUOSvFDWoDCriVWG5zy4h+yj8H1JAQBVd9geZwaRE?=
 =?us-ascii?Q?ph+Wp4qADL+N8WbQvFE7Ehi+Hq3gBneshJtpLY87vkZLW0R6KxdJ78lc46Or?=
 =?us-ascii?Q?5LNWuAnvIkwumcd1DpEx6sknLlWsojC8LHuTYQICB9XipVCL+RP+90/FfQjc?=
 =?us-ascii?Q?5i3eUUtlcQmQJcD5LT3O7sDOj/UWqcyVnGQPThyEtpDN7mXPvxFaf8/C0pus?=
 =?us-ascii?Q?S4jHFm2V/zgFgsLkostqnCeDZpzP7GYgHBYK8xqrnPQxLivEYc9L/732RWMA?=
 =?us-ascii?Q?4gDQcS67A6SAI3NALOOVMmyrAl7IQ5qLNOz2+vTgPmXMrn/nrPo/MhXHmt5R?=
 =?us-ascii?Q?gOU5tQgBksdUezfspJ5ft+QPT4AwqkVuJqK2lkgP2Z5L8uoc0dXOqQ6HIcGa?=
 =?us-ascii?Q?2+VCqVpyPBA3qFCRTgY0avAOWueKTKiYPu0ADuNPGei5KLnnYhFhGCkFi2cW?=
 =?us-ascii?Q?dc/Arwl9o3dtRthvv6I7sVRp/TOeEQ0pO8eQgVC6ItUIiRcmMR3kR8kGtn/P?=
 =?us-ascii?Q?GkymXuRMiyL1Hzkx696s4PWDzjGOZLowF8MI+7fR9puW1Kjt/7u0Q0Q57gdB?=
 =?us-ascii?Q?fNNw2gfXj/UYI0N7EH2cYHYU4ZuRCenYKCp2iPY2gMyTDigJ9q5mLHrPYJth?=
 =?us-ascii?Q?xzpviXjvIinTwBUuAYAclPnZqTRPLMnqNAgZIYwuXShQo8egJF4wUZOF248z?=
 =?us-ascii?Q?ChUPk0GM83G2ZByCc6c2xKbekGxm9ZYjmvKxYsCGv/Xwh/Ouhz/8AcLAnYum?=
 =?us-ascii?Q?7SVdo6X09LrlIRp6RgvNfThHHxDdVoNdlXNX3LVNMbs4eNxzVi09GFabqY4U?=
 =?us-ascii?Q?6WtG/UFVtmeeFw4zBWTm5jKX7XjVjXsPLneZHYheA6OMfkHr8wIkAeLJI0XW?=
 =?us-ascii?Q?2ygIYoZP5nJa3+Q4adNAcplIhE9+1irTdFvlINKKvHjW/BR5yj45JfzRdUf1?=
 =?us-ascii?Q?Kd7esNtsFzg5SGuxIeFSPPgwVEJ2quBLAuOPrPX79CwnKZhpLVLPH6cc+8XK?=
 =?us-ascii?Q?Y6FRRM+IE2WjoahZemRmLfH5qvHgfd6DWAvffcph2/4b2YV/kCbHXZYR5mS0?=
 =?us-ascii?Q?HwzYeGzs8JthVDMo5Q0Qlko+pKpvtMer2lAtn7fsGXL5YUDuaB934kyTzn4g?=
 =?us-ascii?Q?3O5NUgbYCfwIEXSB8UbjUcoS+I8IBBZgoyOZM2pibtKXj026GCkWxnaFJOwM?=
 =?us-ascii?Q?mjyT6Kg2Fb3rSgOUvNWo6pvhBerd2Aj11awg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 04:38:06.4009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c75fd004-b866-4189-af32-08ddf4dad4af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9829

The amd_num_nodes() function returns the number of data fabrics present.
On older EPYC processors, there was one data fabric per socket.
However, newer EPYC processors have more than one data fabric per
socket, leading to a situation where the number of sockets is not equal
to the number of data fabrics. Therefore, it is appropriate to use
topology_max_packages() to know the number of sockets in the system.

Also remove node.h header inclusion and socket number comparison against
data fabric nodes.

plat.c is supported only for legacy platforms where socket number and
data fabric numbers are same. So it can remain unchanged.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index c2df8b421430..5faa3ce922ee 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -22,12 +22,11 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/sysfs.h>
+#include <linux/topology.h>
 #include <linux/uuid.h>
 
 #include <uapi/asm-generic/errno-base.h>
 
-#include <asm/amd/node.h>
-
 #include "hsmp.h"
 
 #define DRIVER_NAME		"hsmp_acpi"
@@ -586,9 +585,9 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (!hsmp_pdev->is_probed) {
-		hsmp_pdev->num_sockets = amd_num_nodes();
-		if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_NUM_NODES) {
-			dev_err(&pdev->dev, "Wrong number of sockets\n");
+		hsmp_pdev->num_sockets = topology_max_packages();
+		if (!hsmp_pdev->num_sockets) {
+			dev_err(&pdev->dev, "No CPU sockets detected\n");
 			return -ENODEV;
 		}
 
-- 
2.25.1

