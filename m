Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011045.outbound.protection.outlook.com [40.93.194.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25314D598C
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 17:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751036; cv=fail; b=qqVAwHMBRFphG6/Oq/5TMsS5pz9MQcDbxG+YOeR42ZNHM5p6q4Nf6M+3dhtqmJ20+G/O23ZjdFaQYjSZrLXHwpPlBigrRs3sDX2ZxPieWrO0qwEyyF5VcGPdwiuWf85udpwDOJRnThO5s2BgDI0JLolxX3tdvAvsoGQ6XQcQEB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751036; c=relaxed/simple;
	bh=1o6FnpUZf/15JuY9VoKvTH5NuyQAZh4wldsA8+56WzQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lnwUYgO2HOcxGj/nq1vhmlnraykLKFcWINeT5FOfcPR1dhGTWLgjBgVhSPm1cmn2HU4DF91dQpMdGuvl5TNmhE+iX+yKN/MvVVxKUjHzDqIrGamXX+grgqxlnzg8L0b9cuQx/npM/2huB+5spLFt/NiNeMfFaBvBHFhq0j0BEaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ThDwTZZH; arc=fail smtp.client-ip=40.93.194.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ThDwTZZH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLshOFzgBT1V0zaKgrT6EbZT61CpchLdR8ehoyf43hxaYIfjiE8KLmGNBSKaWLRg1ogeielQrZBtoqfVf7CFVCKe6E0FgfYNY183tOQQbH09uZ2WO64hKzcelKQ8nA6fUGukGW1ixoiUXdYKh1Mq4L490ijyZJIn/es7u+xWarss36gttji1S78hztI/LY8Om0Z5M/mkHKlMsOOhn6RdzW5zlfiH6xpDt//DGQhcLGAP2eFEjxWXKS/j/4xD3T4gPrBoKDz4svi1BDVarUrpTbmx5AsK8PArG4XWTKHAvdblZj5CckhKl1BKRV/y8a3C1YR9YauMIYmU2lWBg78M3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XNgYUYzsd1Of/Zc7q4gGzvl8oW+/hFjPtWSp9jl6IM=;
 b=R+jGvOGdYPULtrINzYMqMMcY4LqdTUDCnG5O2mVOOKr+2pXgBSZTQ19t8GR1Ve/wzODUk9G7yrnpgOACq71gxTTZs30bSGxFP4ifULnnc5D7h6yFQ1iPhrO9cpWXiEgBIFA71AOinSqxW+Ndyb2DfxGJxyLVehhH4L7xx8AtBYjBahcRYvy31Jmo4r4ZuZw1UozJ4MqOqaL5iK4MoeW56MKOuUHDsKTjQT5NNZshygzNf1U+hwGJbc8O87JVINs30j5ezI4TGYWzx1nue+EmnKqB/ghO4EeV4RL6L7wFXcK0fHA2zMJzOLNzvxCrlgVar8YJszhA13vOkkwG3kvjfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XNgYUYzsd1Of/Zc7q4gGzvl8oW+/hFjPtWSp9jl6IM=;
 b=ThDwTZZHYyjOt/ulWbtU8u4pB0XIWdSDrzQ74prV95jKkOMhibmglfsYr7HvHkRqu/onzVfA1iondE/HhLuO7P1Fkx0qcdkN8rZo/qeCra7tr5bXI6r+KFWiYJo139xmso2kXxDmNZhdw+ZFcXqboeZ+O7thd5MTMStg6Rtkcjg=
Received: from BN0PR10CA0026.namprd10.prod.outlook.com (2603:10b6:408:143::21)
 by CH3PR12MB8260.namprd12.prod.outlook.com (2603:10b6:610:12a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 17:03:50 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:143:cafe::81) by BN0PR10CA0026.outlook.office365.com
 (2603:10b6:408:143::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 17:03:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 17:03:49 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 18 Sep
 2026 12:03:48 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <Shyam-sundar.S-k@amd.com>, <hansg@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <superm1@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>
Subject: [PATCH 0/2] Drop scratch register for 0x1a/0x80
Date: Fri, 18 Sep 2026 12:02:14 -0500
Message-ID: <20260918170302.352054-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|CH3PR12MB8260:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ab66b0e-5032-40bf-2afb-08df15a6cf75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|56012099006|18002099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	nmqNgP/ON81PnkbiO7c7WgVHH2ZeKv3JGB1+22Ieu6zw0WJuopxz3SHJJfW2djF1sMJPOSUFcJpmG6lenpS8y+RlE4CXeI8XJHsjPl+QZyVq7iONTPbYtyzZdYtay5iylBNu36briI1Ie0d5Tj6K0J4x1Wc7g27k80zFnMXpxgAvodZpTBgo5gY/4m5OqltL/x64L16WTHj+TypgijzijXlVBj8+Hlfnxs5ldnUdKbRKW/VYUJJWqe4PzkiyQpeceOvwpQkYPkP/YXNOVWgk8msAcvYlGTxjgWNUKFSdis58dhqU8EgQ0s7IsbjGWcJpEQPHsAyoGUyJUocYjg/jXzyUJfYSYRiAUD3mh2NV56JmkJxZfr5s/L6kBCbqahYC4NsB70o9VfZwaWfESKlK2cdM0TkrOqeneYAS03u0aBmIzb5jZ1c1KeRQA6TRz7viPas2BPOBKpOPhW3oji9Km65D8ozK2lXmw6n3GutsAQkixf/qj11lbyBQ4BZ8gL0w4L13pywOnrR5zGf3Ma0t8r+/xG1HLtYebmQvL8tUudR8wOsI0Y+NLWWmDE+xAoWvWolFmoRcntlAb7dDCiLkQYDNAP2Ol8rptjcLHoRUOQgWWA5uQn3DXA8y9z3nNFk/QbGJR/ARMhuFbgQChT0umfCe6jeKg3GZgOmbhuF6U8CE20hQN7eCJY7YaATXaRmqbRt5LbdREUX2jHqL800jrQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(56012099006)(18002099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j1fHIWsF/BsjSSe9tIQSdobew37r7zZMfdn3YRxF6Oag4EH3Q0T/P69YZ2Op/p5CWlFbOwS5cACarxwrcTsc6mprW1W+N5j7rBYX3TSb3dlYt0lMU70g7aezhfRGMS4sLzjjj1MCkUeVOFyUyTZ+0OYQBI8X40c0HMfRh0cASZYmq/+T8WYURwrDqLFQL4mTXyHNq98/uU/w4aM3/S2yPKsha2HQ8zzFqFEqKvN5dJ9xYNjVPULOHsPeBuXsW8DSrTtA9k2fNPki+axIwddED8ITN81UzrgPJQknkahMLrUCjZk1/C/8LUm7R4aYZiREkAWgvmxugQ2rc1ugU/KX16+qhAzUuSjeeVCRICLSXBzdcGoyaYd/HaFiTq2OqM/A8K3mA6OidkMzSnozGBByyZol+ylrAP+fX02q7v3nsEhXaU5joLG/5gjEc7o8mBIb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 17:03:49.8104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab66b0e-5032-40bf-2afb-08df15a6cf75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8260

This platform doesn't support idle mask in scratch register.  Drop it and
make sure matching debugfs doesn't show up to return an error.

Mario Limonciello (2):
  platform/x86/amd: pmc: Only create amd_pmc_idlemask if scratch defined
  platform/x86/amd: pmc: Drop scratch_reg from amd_1ah_m80_cpu_info

 drivers/platform/x86/amd/pmc/pmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.43.0

