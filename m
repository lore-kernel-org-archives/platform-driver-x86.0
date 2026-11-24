Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795506776;
	b=lSkrjLH+A0ZimeuBAMDBtqtfiwoiId5ytGgVUoGz+9Xn19a/A1EdYFvhJVr0bIWsYova
	 IRrsvDxPbUQo3gm+0e/kXZeEfiZT3nSN/bJkFW+zpFlaKlYaIig+XX8a2wdiAlo1Ka1sJ
	 D0bI/rja4aHWnYb9DugCOTIYOgHayUS1fYzQxcbi1TPQW/Efn9SbJphKbMkjV0n4WAZ29
	 BSKjhRZ5ciqbBCp/LUY9QFeWkgreKTanJ2wOtdUQHhQvPwB7DJb67nvw2baqxAAvf/J85
	 jmeXfbSEPVfTm1308SCCwaDc5ou8sKzuVtLzpNo4fpAi5cV9YiwokOe0NwWlbUcyQbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506776;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=lnTJ58Lmue0jDgrn0Ia87SSjHX/1td9a5nL+4Bss+xY=;
	b=uFDrF56pFbaZYK+xQNbrhWcJqhTMJ9CeB0wybF8H/bm7G6T/me6KpSxN8d3BRn9ZspI4
	 CUB5VHaFXsnnEoVsrmD4bUOx9HMW+w37XsM8WaPTj913q7PRcf3jQffQ8i454Ecf8j39L
	 Vls6Jz8w+36W2N0DIiOFyNj+Lp/8vDwZPe3RzMwkcapyzIzOZgjw86sU/DfsRrUU3FDPg
	 c/uky6A/ZLYaylrHfexSUJGT76rBUZF+xpLDk7LyzNGJ14ajc4HvmHDiC8B2CiEuBLi7G
	 8u5cVHPVhcnCjFF57bOKRbTD1k2UcrohmIQgDFoiUDbTnOa2WvqMQ/UU0li39IRYlhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Qx2MlXjY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.29
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011029.outbound.protection.outlook.com [52.101.52.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A358606A32A
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 07:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A358606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Qx2MlXjY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXGzUF67ocmsiF+GWizJCFpnIwGeNaqdMiyKZObaIRYfSEGVZZEHwGpYb1vmVD1Y74UFRpY2RojAXcC05wZ2YrRiFq/1DRsimLQEpZBFw0jDo4X/k0+85Cn9Nu1AAxrmXZ4NskMb9nZqIviTENxhyVrRP46YufA0FKqf2ARLTylz3EaqtKbSsdkD+XMzs7u0Bd4ka7kd6h4sazAOIxMrtoKqAHtmf6fK8acC7FQHNZiQqNwruM2d5yMm9AQ3faxN9y3y0Jg0YrT2gWFOpjEM0AqIBDXzUe8O6LtWqHCLaQWb9IesQxBuV6+DzhBBPevm/k7b3aT1fGos3yg5OGsRoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnTJ58Lmue0jDgrn0Ia87SSjHX/1td9a5nL+4Bss+xY=;
 b=jnPvW22pl2qgOoHMnL8GeDrbhrVjWFk8Br5qDH9/VbcxX1Ce+4BeH3fSHBY7oCReQSoUIOEDa+iQ11WzylVhS+H61cPMQlRE2MgghViyjpVqm7SLgl4DLLbohnjs3+ZKFj333//IZ1sihzNnFWSxejViM9HoeN4lHdBiDAOTGKVWZKgPGvRzH3b+R4W17XalQmPILLJq8LiV7LJOcBnCdm0dwbGZZlvhtfGEDSyWXTbg/CxDs8SEPij9bTmgYQddyo9jRzgYY0qJSS4SyfXpQtAMrGPgOPHigf9PC5mIB5ymEkpjIaJ/NJrb9GVVSTrdefJzFgi7K3OhKJ2yCDJd5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnTJ58Lmue0jDgrn0Ia87SSjHX/1td9a5nL+4Bss+xY=;
 b=Qx2MlXjYOhuCvp4N4YbfOLbj2/KWMbZksLHOn/wHNFDyTCDX42It4w77mhmlUYntuazRaN8XB98LKdJcJ0kuOcIjnBHDOKq/3cB32xkPfSiMADje8Yq4gBBPWpTpB1UGRW18rrzC/9bEtmi29Ev2QYzA0amg8j1/RmeBat8K388=
Received: from MW4PR04CA0386.namprd04.prod.outlook.com (2603:10b6:303:81::31)
 by SA0PR12MB4413.namprd12.prod.outlook.com (2603:10b6:806:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 24 Nov
 2026 07:52:52 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::22) by MW4PR04CA0386.outlook.office365.com
 (2603:10b6:303:81::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 07:52:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 07:52:51 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 01:52:49 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v4 06/11] platform/x86/amd/pmf: Use enum system_state for the TA system state action
Date: Tue, 24 Nov 2026 13:22:08 +0530
Message-ID: <20261124075213.2317127-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124075213.2317127-1-Shyam-sundar.S-k@amd.com>
References: <20261124075213.2317127-1-Shyam-sundar.S-k@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|SA0PR12MB4413:EE_
X-MS-Office365-Filtering-Correlation-Id: a91f9e55-91c6-4f2e-77df-08df49fff10b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|18002099003|22082099003|261009223027099003|261102123227099003|56012099006|11063799006|261021121427099003|10067099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	Rnm7e6sihAmSEiyATcoFkKFqSV1QF2FbTWyz2RVUmJU0mF4VTp9w90H4Lg89M9MlcxG6490cY/oxi/+tScV2EWlx30X90fGqw9HM6q/fZpc5TdJFntkPlaW/zdP2vkZ6gQe2gR18BtbVAXQtK1Jg6FSsDc1c1CD05brDdYqohsCjZU3RKJUwZfoulUOH1P6TuhfA25y1s9qcUV5WecvGSQ59Wx1SHtGqEzy0FFnFZLKaeH5wr1fzlaUtfjE5v5r1eMU4KlRUCJ6kJZ2NYqdneLSGsSa/RpxLcrI0OrP229nWvWt3AcSxbQvGDGg8/y6rRHbm2zD8pLE6cQTbvWclVinyctd61nZitZW0ubn+a9Cvk8ztTboYlTaVQAyzP5dwjUgrUz5wfjDpsCUhVr9WDPupiWr1sSP+nGI8OAXwQ0RCgiViBA33TzYuWfIvTnSx1Y5bdrKDa3RD8lkxvz0Fu6FieJl3cg6uSU3OLh9wXTSwmTgQLuLsBd0cqziJb5hQFPnaGvzQVTK1dYuTjwRJI0LmsAVMpqF4CBmbL3DxPwC1rrIOo1y/tRbu0DCMXjkVAdFMo7ggNaUQRXIesmRRYIclXIykoPBGHNDrbHHo8QXhScjkAtoGpdHK8XFd+YpgyPxjiGiVBSnus4R9pqPmPYJTirll8rwE/wE7n6RV0hUt4hIsPoXSGdSMzc6DxwoLUvzUOq6SWgRWwoqjE9M3wQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(261102123227099003)(56012099006)(11063799006)(261021121427099003)(10067099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uUOO60BlmArsuLzT0mSXlzEtc/borl7XrtjzRtuWuTypqhyGMuonBev8SoGkTwRvK9zpeTmsPwAtLwTtq2wt6j4wlO8rUx7V0T+UHRovtrvYBubGmXUbY8IjeDN7djil9bj0o70r+pomlpSahyvn7+SNXHkQjAZfT48HHeAOA88QMtm/Cdms0o6JvRrvdr0scOaCEvaI+H/KGFKFB8ho8+JKT7pIbdfaLFyzGBaZ/AXsBwiywUlX5F2n99Jvo6/u8TWSu1ACjvA6ndZGbzIOFNrBu/4+Bbihdc+yjumNph4SbgNAyVMZImhhx2EZfueYjub27JC76RXZCam8PcvJd4xtnaVpqUtanfm/DgeVRETHOe1c/aJdq52PRDYtL8dkqkm4qpiQ1eFiL3AGa24hjR8LPCxDQ5TvzwNFoAOepatKZBmm1+pZXmj4uYzvWrcT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 07:52:51.8177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a91f9e55-91c6-4f2e-77df-08df49fff10b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4413

The TA reports the requested system state as 0, 1 or 2, which are the
values of enum system_state. Use the enum names instead of the literals
when handling PMF_POLICY_SYSTEM_STATE.

No functional changes.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/tee-if.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 3c26296a5815..c0ecfefe0f1d 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -209,13 +209,13 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 
 		case PMF_POLICY_SYSTEM_STATE:
 			switch (val) {
-			case 0:
+			case SYSTEM_STATE_S0i3:
 				amd_pmf_update_uevents(dev, KEY_SLEEP);
 				break;
-			case 1:
+			case SYSTEM_STATE_S4:
 				amd_pmf_update_uevents(dev, KEY_SUSPEND);
 				break;
-			case 2:
+			case SYSTEM_STATE_SCREEN_LOCK:
 				amd_pmf_update_uevents(dev, KEY_SCREENLOCK);
 				break;
 			default:
-- 
2.34.1

