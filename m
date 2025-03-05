Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E7924BBE1
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Mar 2025 14:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741184947; cv=fail; b=GHM6fw3Mgsmlq/yUUwCp5J69nT3Tno7a44OXBMGAc7BRYd7lkzDHCzrjPbQ89zL4uDFYA8/Tnuex7yO6M0aJYc75BHXz6aQPKN9hs+a21SQE51KioS8nvHeUpTgat6oyhXnmvWeMyxZmPpaQTWtH0jfKZ4mpvrkhJ/4p1814s48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741184947; c=relaxed/simple;
	bh=CS9H0sQBCY2sZYAToaO3JDoJSd61+KKv9erz2X53Zu4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oNqWQQAmVxEb/4G+6p4uVB0fTP1WCdpLmFTQ7AdRwyRW9lDIZOFUAs5F0lbFDgwIb+V903pFgBwkvJZXuWDK/E+q/d+FstbnXEEbTxQc/NP9gFgeeT8gXDQ6JbrIEiAuO0cZU2t5V6e3MpzFWXqeL+B14Ubze/9Emyefhhb/zBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ae0/rF+4; arc=fail smtp.client-ip=40.107.92.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ae0/rF+4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3Dse8YzWaogyVFkJ/j32JMejjAPz9eYrpu2KY/IUVJSiC7OqysR2J348YtQ86lgv+kOt37fIsajZ8ngrOJXpX2UDIK6HzY8U4rywouSYUN3VGZV2a49GWflZwLuUAfdhK2+L5Lg/I/Zld5ouuTbXy43CdP+ImincfiUtEZksp3JmeeqdR5EZLll/zn/Lgln8VXQSHQ/knxfSfJfOcAA6rD5G8/cHYxcEKHMQ5pQ9GD4Rwh6ubi0OTKZCFyVZ2/GhLD+ARiQF3pFDL0vuWSI32STEwZUs6ZA6l+GIwRLH72DB5mtyqUM/nDSHaXxdCJwiKd2fmLlWOe9uAINC51Pxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHU4VbNoGnvMEojVeolZvZFzOuY6KwV61Vce1pyD8Uk=;
 b=FPJtpdBDKPX7qo1hVtvM4xXhEpWKZheinz9ayJ9OPE1anbpDMPxv1bUoIrzqljbYnJyT2CaIVpOBQ8i3JGCbxJK70qWmFN+HWpZ0mgIdPe+jtrgCGevohIVn99ldOdXz7zaHtpXHTu34KScz1hioH3Vg19kYum4HAZwRor2Ip3BrEsAfzst9/aStB6zF1JnTeOcI3hOiUk2FzsC9AmDVDQ82srx48pwbNFzymWPq/PPhJKczKUG3OiKOo3U1sRTHmJ9k6mQef6hi8FQ1NkaGSSsJKw2L17H0SNtqBFPMnuoVa1H0+L838dXxrhBTmQCmWXSg47j/Dd0VroqUoUnCLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHU4VbNoGnvMEojVeolZvZFzOuY6KwV61Vce1pyD8Uk=;
 b=Ae0/rF+4lJ38lxfRyumhG96ii66YlQFDxLOEQbREQFh6NBE6hLWiHbq3LVS/OJa5JPwpn9jdRV2Jyu6mGRz+8SnKeXM2/D+G2zue3VxJmyM9vR2vVEIU4Aap8ww8FJh+TDj3b336T71qhg9mfW3ZigIZ88hr/xBWsmH3y4kth/M=
Received: from SJ0PR03CA0222.namprd03.prod.outlook.com (2603:10b6:a03:39f::17)
 by PH7PR12MB5927.namprd12.prod.outlook.com (2603:10b6:510:1da::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Wed, 5 Mar
 2025 14:29:00 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:39f:cafe::48) by SJ0PR03CA0222.outlook.office365.com
 (2603:10b6:a03:39f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Wed,
 5 Mar 2025 14:29:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Wed, 5 Mar 2025 14:28:59 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Mar
 2025 08:28:22 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 4/4] platform/x86/amd/pmc: Use managed APIs for mutex
Date: Wed, 5 Mar 2025 19:56:15 +0530
Message-ID: <20250305142615.410178-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305142615.410178-1-Shyam-sundar.S-k@amd.com>
References: <20250305142615.410178-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|PH7PR12MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: ea46f2dd-3108-41de-b813-08dd5bf211fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YWD6UpUr2E3uxt7xJg1JmeQVu1sY67sVx4WR2zHDtvkfBblrFkCjZNuqWFeg?=
 =?us-ascii?Q?t3UF5EbqTsYzsvWDVDUpKOSWy8K34WAkDZy0xZrLlMRMoCPmYJ2hq8ooiMhI?=
 =?us-ascii?Q?GyE+V8TskPSGE+v7pVLCQmMjwFAycv+kraR1mjWgP8ro2aUXAYDSCF6r/mDX?=
 =?us-ascii?Q?E1mC8HmjYWqMm7+DAUjDcBSLN+P2O3M+Z2E3S6WgzEKaV4nSC27IvlcML4oG?=
 =?us-ascii?Q?ivJf50CefPodG/LkI/1nyObnsufKdMG7a4Iu+qndyfii6e9rRUzJUkp1mujr?=
 =?us-ascii?Q?+K7nCLXUQQ4LEpZgEKRgeRm5y+yv0HJhQeoKXELgMQv8cjaOpaZxmVsLAg1C?=
 =?us-ascii?Q?SMH4iVyTCi6ZXL4gsXCZTsIMgT3Nk1oXJU6zdpapNI/PYSBzUHP3rF0EfcoR?=
 =?us-ascii?Q?o/gxpR+OloW6LtjuG01lZw/ovS5Kz38TRK9sQjFqZA11mXC2/rEgfNfB67yD?=
 =?us-ascii?Q?b+68xZx5tmcWdCa6WSjqhrHR73UZExbCzgRm9nzHB9c9MOdTNsLLHzv9rb9T?=
 =?us-ascii?Q?XjO2jT9m2wK6Va8Toxpujwi1jgV+T/810dg5Mp1fw2saIl9WppDfnH7fvYTE?=
 =?us-ascii?Q?C4IEiGbiq0qWrqwg/+aEDZOiIMNET8jgJIcW+Z0GFwC7eL4X/sKDc4SS+743?=
 =?us-ascii?Q?CSU8UHUWexUJ2riCdYxyGVS1yAV5RGP2lcizClSUu+uhv8y4qXJ+ghqRse0j?=
 =?us-ascii?Q?YGjit6dt/Cn29Z5HSYjxQ1qvU+oGL2i/ovT36Y+VFYy49xwavSmKyiZFQJdu?=
 =?us-ascii?Q?rqySuK9dUhDX0486pxcnwf3dg1INqzM5T0DT8E/UkyKpyosp9ziBNFxbnSqd?=
 =?us-ascii?Q?GYa94a3CBkv2zQWl5Ehb8vjBcbWwp3KbfY30JsM8w2rL4ofjUMYzxjKck0SR?=
 =?us-ascii?Q?Pm82NRCG93ikq8wPU1KSSxDzFjdJGwIVqL30IadWFlnDsUTFw1UFOFW3XGhO?=
 =?us-ascii?Q?kt01x69VfobCUH/roaaxGxKW4O9KCDt8gHk9p2AKbfFUCmLDM4BP0K/vlVwh?=
 =?us-ascii?Q?xZATllptqsaiSoNCCiIZIiO6ovClPWhH09ABTGHwS0H1jhy9fnuCl2IOXpFR?=
 =?us-ascii?Q?yta8fA6O1yAcNGoT7C8EjAsorKrd7D6zqlOJXQQgTbRPIzelpWKmfcuizdVQ?=
 =?us-ascii?Q?uV6B5vDFiaFoVCjJGK8XRZ8tGEyxzC0sRD3aQDP2dC6l4uyc1kpGzXfFfE3e?=
 =?us-ascii?Q?fLb6W0GwCD/OSxmrApNUTPDKHSVxNac8AaY2jKp6NaGexwtwqp585REXyQWO?=
 =?us-ascii?Q?ZisrWvVxBmiRxQuMYC8qjDr10BvOTcVAu3djQGqM2XY+nFyQFNe7j/on3stL?=
 =?us-ascii?Q?rK2fvyI8yEXnDTpx/ih1LYzV0OKzb1xImHsV3td3kW8jwx0bohzae1OEZOb9?=
 =?us-ascii?Q?7pizG5ebQ+PyFLEDkC+yRMfiEXByetHT8D/mQwDzQAo95N6DCvZqXBTrTcdE?=
 =?us-ascii?Q?BOns/UMbwMSoWsYchGdjaij1abrGRE6d511JA/dCHsslxfKNb+5K8Vvu7yuB?=
 =?us-ascii?Q?aciajad/ua2ggRo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 14:28:59.7035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea46f2dd-3108-41de-b813-08dd5bf211fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5927

Adopt managed devm_* APIs for handling mutex creation and deletion,
facilitating automatic resource cleanup.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
based on mainline with tip commit 48a5eed9ad58

v2:
 - add error handling

 drivers/platform/x86/amd/pmc/pmc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 1ad3eb935404..84bc47009e5f 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -783,7 +783,9 @@ static int amd_pmc_probe(struct platform_device *pdev)
 		goto err_pci_dev_put;
 	}
 
-	mutex_init(&dev->lock);
+	err = devm_mutex_init(dev->dev, &dev->lock);
+	if (err)
+		return err;
 
 	/* Get num of IP blocks within the SoC */
 	amd_pmc_get_ip_info(dev);
@@ -822,7 +824,6 @@ static void amd_pmc_remove(struct platform_device *pdev)
 	pci_dev_put(dev->rdev);
 	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
 		amd_mp2_stb_deinit(dev);
-	mutex_destroy(&dev->lock);
 }
 
 static const struct acpi_device_id amd_pmc_acpi_ids[] = {
-- 
2.34.1

