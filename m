Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73633EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 20:35:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232410AbjHNUfS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232421AbjHNUfD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 16:35:03 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E197BE5E
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 13:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QM7IEA6OAqt9hq8qc9D0EzNVroHgqCCse1Ab7Tei40yj/wK4/p0H/9NYgZcOlob0CLRUkUJhgW8JUdZyNhV7bIt9Q+Rk8rjZ+lk9c9SWI5JNoyzSkvSv98QIl2jeLhBEnwYBjeSMq+SVzWjGQb7di2hYIZ81R6xSqPNvjeSgFO6R0dIgr9bA+8GkehhM3+6GXmTh0+WNU0mFl2FPITg41poMYNpiVJG1wHhUpGRs+qlTpl6VKm+yhkFM08sqI74ezlrZbsbthWFOFPHUcMB9TxbMZbD9xctiqWwp6HC3lPCsF9IXUcPTRnzu9tnBN0lGgiCRUVrSNahOCwQT7dXDAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAi8Kkdm59FIWxf1eKWymBH92rg7i5TDcMGVZaqsMjg=;
 b=Mu8rLm8WNCe3yey82yRnSeyDm6QC6+XHeBJOwOnlzvMtekVc1o+foAy0a6/VKO31pU1YUwGiNG5t0nGX/MUGwLNzyaX8ywA1rreqqVvtca4aFvYI/cH7va/dfW8OknPdqA5XlNeHKT5z8GRVagHkGpbw4ApAxgUNki/vcZZu/ibW4L8OjLXkZzABVQ0wCU8GrFzF3NDC/1vusPWz8TLovPavU8/yvkjdTAU0Ld2lSaHGyXI49ZoVaNXF3qSbSbNxbqU3LprzeZJ2rRh1oHdXsjK0bFlY8qs4aNaIbVNIQE/iF+ts7gf/pEPKAklNQxIvmE4To1KQ45skSjNRUYbfLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAi8Kkdm59FIWxf1eKWymBH92rg7i5TDcMGVZaqsMjg=;
 b=iflvniwlmJ/uWkt+IhjNUHVcVxUqH2dAdD/qG+yegRpALPR1eJN0gjexK4RNLK+0hPxbRKZuahfuQKUTKwua4V57CM+E53WEZDB04yE+U/g0UBbyJ7XtTYKw16sE31SzfWt7G/h/ryUhti0Zd+PgdurDrzmQT3w2tf+ZtImpEwKWvB28a+hsNorCUT5jINUn8A3gpnA1Qu1JP7sHGiUZGjdzrKiiPG6gtgSsp8gg8/N+PasNBohBfOjJeQ+XWDFzQDf0iX05mtB3PZ9tECar05WTl+bo0wjbwNC4YqsE2ptdjo9J3nMSA9KFoNqsZvxHcOPlzaLgMwHDSbCT1nwxuA==
Received: from MW4PR03CA0333.namprd03.prod.outlook.com (2603:10b6:303:dc::8)
 by SJ1PR12MB6049.namprd12.prod.outlook.com (2603:10b6:a03:48c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 20:34:58 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:303:dc:cafe::ec) by MW4PR03CA0333.outlook.office365.com
 (2603:10b6:303:dc::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 20:34:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 20:34:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 13:34:42 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 13:34:40 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 04/16] platform: mellanox: mlx-platform: Modify health and power hotplug action
Date:   Mon, 14 Aug 2023 20:33:54 +0000
Message-ID: <20230814203406.12399-5-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230814203406.12399-1-vadimp@nvidia.com>
References: <20230814203406.12399-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|SJ1PR12MB6049:EE_
X-MS-Office365-Filtering-Correlation-Id: b5c0d515-b038-480b-4f92-08db9d05ed6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nFjlSem5yeyJYxyGkYMEsUi1e9JsKmhGKlW/pUmXg1nF1/9n3kmw39AdOizr+tKja3Awj0rV9k9TLCj1Foy7hMGwkDpLmCWC7GrBrdJd9ohcCBrO8ZWQ+qnJCAy6HFkiJ/tnIRnp3d6r3lc8IxzAI6TvgTP0TWeAyiCfG4LasqIwhf2lXJ78xUp+nYVtDr75LZrqAtsjCv/qji/LXOqgw1QSBuy5BJ5GnuOlWuPjmbHKG3bBMrn3Pu/GXEbHo+dnROlOLxzhXUGcgqdye/y/+shdfXMO1WNJWLSAMWVBMlkR0VhVyCRgobwjetthxxqD13QX2RFTLxfjfkB+SJ2VYiLqL8cL4G9XoXmVHN2aVCsxZmamqqG1W7hSkr2rDSnNfZG3BXHdgyJ7gZA2sjGm/2xzDu9padTTvK6aRIFUyD4r3ba195ffNx5FVVwvnJqP0yj+2nEN53trLjCMEbr2WDRDajaSfOhlSOIfvT6K6ln3OXuZ1rsgaDn2mLkdPYwgU1p+P6B/I0wsK03TFcOOSW5P9CCmoK3NcPZnfeSxPDW3IHqmXA0gWzdtZ6S+rW4D5puxCfCeMaBR4RpZ0qdwpTmPfkSzGbD/xkBO1h/uc3z90a+QhBqw9f9ocfD2gs3n2iL/B1p0JgNDn4U4oJAuCjcpkwTmxp1nuaLjGqtb0O6Y8B6czTMTEFgRw9X6cRAXj8xHkXOalEpEXwFLnbADN3OFyVlRedyUFVcCCudWTwDvYddJ59+qLmw0J4NDEsx/dHeAO0pLUuM8/upg+4ZOJg==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(82310400008)(186006)(451199021)(1800799006)(46966006)(40470700004)(36840700001)(4326008)(8936002)(86362001)(478600001)(8676002)(316002)(36860700001)(82740400003)(54906003)(70206006)(70586007)(41300700001)(6666004)(6916009)(16526019)(5660300002)(26005)(36756003)(2616005)(107886003)(1076003)(426003)(336012)(83380400001)(2906002)(40460700003)(7636003)(356005)(47076005)(40480700001)(40073004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 20:34:58.5124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c0d515-b038-480b-4f92-08db9d05ed6b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6049
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Set explicitly hotplug event action for health and power signals for
L1 switch as "MLXREG_HOTPLUG_DEVICE_NO_ACTION" in order to allow
processing of notification callback even I2C parent bus is not
specified.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 5b0579752afb..648b27eff0b0 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -2373,6 +2373,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_l1_switch_pwr_events_items_data[]
 		.reg = MLXPLAT_CPLD_LPC_REG_PWRB_OFFSET,
 		.mask = MLXPLAT_CPLD_PWR_BUTTON_MASK,
 		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
 		.hpdev.notifier = &mlxplat_mlxcpld_l1_switch_pwr_events_notifier,
 	},
 };
@@ -2433,6 +2434,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_l1_switch_health_events_items_dat
 		.reg = MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
 		.mask = MLXPLAT_CPLD_INTRUSION_MASK,
 		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
 		.hpdev.notifier = &mlxplat_mlxcpld_l1_switch_intrusion_events_notifier,
 	},
 	{
-- 
2.20.1

