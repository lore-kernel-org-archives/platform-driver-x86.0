Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91E618C91D
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Nov 2024 06:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730700202; cv=fail; b=IdvEjv9nMsPPyzsBPQe2AkqKryuMwG/b3iz2sJzPAcpBsyj0XTiElRKzZ+xAENO1MpcOFtiuF3LBuIxi3eauWAnn2RbdzPBCX7g+phWEzj8HJ7GjFgx2kxbxNU20b3JgxslXaV9w5b20GpBuYacAim1h5i1N25rxa0G+D3PozLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730700202; c=relaxed/simple;
	bh=0gYexpYlGGR6uVhY2UYlTNgk0BXYDfCg2u31JaKlpfI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BaRcoC73LAYg3n5njuL4GHSSYH/Q24pa946dJ219YjDumFffKy6W+qFlx7gEm1wzxC7cTIlIwF0ao0vUfwRoX1O0tsbUsDQxvUIy2zfCI3TfXk/0gSHWTjx63LPWZyoVkP3YPX+GHpeNkAzhQW9SS8aRd2TvnatG1zQJxfpc+v4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=X16N4tHf; arc=fail smtp.client-ip=40.107.92.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="X16N4tHf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxpJ8//QL8LzR15NgW2D7k5dqTRIA7BfRu0qGITWZkeJGXZVJKgifOLNwtJHEOBG2CIS3AgKpQ1nSu8GjHF4yf/Wcms4iSGTfsXqJ4Lqzz6fsExtgx3i8MRkRnFIkgnQcgm9acr3WMd/P7eq171pi26Z4zwJ4p9JtJNSV5SCKqluq7nYhxs/8AUrJq1xMq2Y1RyVjPyZOVHIEXVmtmroDVXPVh7Qqu00oHkkBCYKA6b5YUioRyQ5nfeXGcRl+JjwURAIKKC0FgzxqObdVIyz0lKJ4r1p40RgScJf8rQwKiw1XZfKF1mZr6Keuv5xtOZO2tWJWMYrCSrOW/K1rWXM2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oSKDEjufLUh6Bw4BHnjkBECoqHcNmbqNo/wzxIDHxQ=;
 b=D6lywZgBnhMKRqonW96aDWJAbxpM6qQpm5te9qMIfZvARrasNhyk/RCwT1t2sqspNmzFbmmrFcZiyfhW9/DgjqIk/iV2ELwO1wKJQdH2qxXCMPPUXOoXOf0+B7+v2fBkIeZqANL6jQcd6LfsyPhO7kEDLEE4zw/whcdr8hIRPDH4BxjijKipH9/lMyauym3Tg8wnueg/FvBwhWlLmolXmCq3tyZs70TdwAVCukMswHneDbDEKnGQbthT44NugviLDsVxJ0oLrlcIEgEt4PJ/A+U4uVvOe5HeUVxwxN+5n1+oqZTkHrlIaUzTlc39gx3uK84o8WFS1XAV8vZY642j0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oSKDEjufLUh6Bw4BHnjkBECoqHcNmbqNo/wzxIDHxQ=;
 b=X16N4tHfRTy1IdzLusQqOh9x+AqDyqWknZOtFQnq8u+Zl8CSSNidbpOM42UHcQNgguWUQpsmIjzT0SjFGaE09up/+hKzBBXF41MVFxCJY0nV36HKAKSnAWaXbtSnHtAw0IVuFP8dM56Y7MhmDULnqemqap5iad4D9SBb4pUZhC0=
Received: from MW2PR2101CA0025.namprd21.prod.outlook.com (2603:10b6:302:1::38)
 by CYXPR12MB9426.namprd12.prod.outlook.com (2603:10b6:930:e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Mon, 4 Nov
 2024 06:03:16 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:302:1:cafe::a6) by MW2PR2101CA0025.outlook.office365.com
 (2603:10b6:302:1::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.16 via Frontend
 Transport; Mon, 4 Nov 2024 06:03:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.0 via Frontend Transport; Mon, 4 Nov 2024 06:03:15 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Nov
 2024 00:03:13 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 0/3] platform/x86/amd/pmf: Updates to AMD PMF driver
Date: Mon, 4 Nov 2024 11:18:26 +0530
Message-ID: <20241104054829.620858-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|CYXPR12MB9426:EE_
X-MS-Office365-Filtering-Correlation-Id: 628b9cda-9cbd-46c9-0c1e-08dcfc965fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7j2zggEnL76gmoCGz/Wq525gVX9AW/KCpL9rFa2zTwVt9vVk9NxwjDZggCaF?=
 =?us-ascii?Q?cLY91IWb/++LxpZDWbO8fLoa4bJZl5ugchhO8ci3WBsEqIQzm9SujIro/DfR?=
 =?us-ascii?Q?hBKbdhFRo3PBChh2K7fetPDvBWr9VrUcpxa6+xAwuvYV88c/thaXz/ujWtpv?=
 =?us-ascii?Q?uBMic3s047W3ah8abFMJiujQcE7SLVwJiri+s8xcSUYP03EoU9wOukvTVl3j?=
 =?us-ascii?Q?i/IPrD4wzZws6l4XyxGCes5sDKbn3bELyMyUA25YZS8fDUN3kpTY/utB5yGK?=
 =?us-ascii?Q?gSF4W0dRAIn+1GB03Wqhad1kUSVp02uYNH1kPh/yNOsrUqiBuBf5/BvbfrIP?=
 =?us-ascii?Q?iId593RuHMfQdf2EVTjocWqP/pPs/f47tr4G5QbJGJ8l2uzt+ivNTFwB5C1s?=
 =?us-ascii?Q?uH+yxZzbs+bHIxo573lK64kYnu+ATy6mvqn1+CW28mVwkXs2DdCZspnh7jW8?=
 =?us-ascii?Q?NeiGdCt8qnu8boEyjCzXRGl7Y8BIsb/AdBtEd/jS4e2tmrIdILnwwBLLfBuG?=
 =?us-ascii?Q?HQXxlkq0qFGK/nVN3qf86P7vNVe1q6WQgk4qVI+T6piO2Duw0lROU4PyZjAy?=
 =?us-ascii?Q?MWBC7aihZ31ZWUbXkHFhWdKL7pmg3AfkDqBMqnGu5/NVSLGfsV6xB6VwRmfp?=
 =?us-ascii?Q?EP/X8e1jvbqp09qzVHSwycbMujL8XhBiDGOkl9LOVK8WmBMJIvcrCOL3g091?=
 =?us-ascii?Q?Amc7yacwOkmTFMfFTA8RiwSuQxfxQxUpnJzPvdwTxKLFxvTjdqJAKWVNUFrb?=
 =?us-ascii?Q?V6AUPXcNUuoCKguygcEoa4SQlIDnLxApBUKDVhqSuCopqS2m7gdc/CRx/P2p?=
 =?us-ascii?Q?mSymK6H/Lrde0T3nsSpeG3A47QTOfwmwEXMAxr58RCemQC5c/D7Y6LxjRrq7?=
 =?us-ascii?Q?kPCzOFWyQxdMCUDmeRdMs2uBtUvM8+Rm37/9wEQzlL7Oeh2bgCL3pwyhVuOn?=
 =?us-ascii?Q?RmGp+ViLE6ra0uRuJ0aPC8dagdnGsuUSI/FXd8jg6Tz1BHIwmQ3Wn/akqx0x?=
 =?us-ascii?Q?16/Pu+96n8oT+Ca8gcxxR5b7LH6e8f0NdUWh+GRwvT2nFo45SDO+ArhT+46M?=
 =?us-ascii?Q?HzOWDyqW2AA1OpZyhJ3X1o43qcvysg8M9wP/h2BktrD4ftYkp4ATww/iDWJX?=
 =?us-ascii?Q?xzbFfcCtL/++Hjz3sst2ZoSTLm1f8iWuqFQCbe7v6fWhLxRh2vHsdCvEOJIw?=
 =?us-ascii?Q?SvAi6HpP8DJeGaixMfzxE99OPa9VLl+T9N3zIkV5Ych9Nj+RyZAYj+nZ9rZS?=
 =?us-ascii?Q?YVilVqmoCVGBurmgUSOiTJjvnShSKwlPc1iFiambXjp+Dkg9U8G36/w+1QZ3?=
 =?us-ascii?Q?PzYZfm9Lu3vvvE+TFc1/zbm135o049PMQqmWhJeamKwLKHEq0OzQ1upK3vBB?=
 =?us-ascii?Q?Vxf90OsmM2fTB//c8UFwb4b1yayQnI4+QbYWtozAwFmBFwB6og=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 06:03:15.9895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 628b9cda-9cbd-46c9-0c1e-08dcfc965fc2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9426

Updates include:

- Add support for newer platforms
- Update the MAINTAINERS record, and
- Simplify certain code handling.


v4:
----
- Update Reviewed-by tags
- Address Mario comments
- Drop 5/5 of v3 and look for better alternatives for firmware loading.
- Drop 1/5 of v3 as it is already tagged for stable.

v3:
----
- Add a comment to answer "why" resource_size() is not used for getting the
  ACPI resource length.

v2:
----
- drop resource_size() usage
- use right format specifier

Shyam Sundar S K (3):
  platform/x86/amd/pmf: Use dev_err_probe() to simplify error handling
  MAINTAINERS: Change AMD PMF driver status to "Supported"
  platform/x86/amd/pmf: Switch to platform_get_resource() and
    devm_ioremap_resource()

 MAINTAINERS                           |  2 +-
 drivers/platform/x86/amd/pmf/Kconfig  |  1 +
 drivers/platform/x86/amd/pmf/acpi.c   | 46 +++++++++++----------------
 drivers/platform/x86/amd/pmf/core.c   |  8 ++---
 drivers/platform/x86/amd/pmf/pmf.h    |  6 ++--
 drivers/platform/x86/amd/pmf/tee-if.c |  8 ++---
 6 files changed, 33 insertions(+), 38 deletions(-)

-- 
2.34.1

