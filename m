Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF97EE49A3
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 11:36:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235007AbjHVLgz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 07:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234809AbjHVLgz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 07:36:55 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A413E56
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 04:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IyG1hdmYwuv+Mva9D/LQH56TrcdHL4lFB6T1T7hFMYfqf6HWp3JouK/INOHiBpJ6R4bgEXstq1M2inHIQqSkbaFZ5wRLcDtJn1L85Btp6kwke/F5BjiTn+GgneG5eRjFtIN6A34JTsmFoTSvbj2Nx/FmQJUhjrf/t9ebE/vb8cBMfr0lUH+F5IVuLcyUQd86n6FQhbUMqJvJsOfqzEvq8O3DLEKLYHkfh/E7wW8AyBm101yczDAYw8IE54jV/mvR7bNLk8+G06ci7crCqNouxyGTNO3xZB27bq4Cyl0Q/T152d0+habkwSOYsLjhY55O6BS2a220CJKw30aXiWKVZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZ7tEdcS0W7+vtocGTaJY/mgcdAIwdxJgcpY/YRFaoE=;
 b=G3rzrVtQICmfyuD7F/VY5CF5+WEzpdOU2FF+Fo7CN//ulUvSE5UPMM6/i+6EjgE8UeqvbSnc7qO8rxlNda8BqFZeeqYO0vytyF1JTc4sOyIEQ/GVaAIyyZS//2X05wqJ3bAgZG86TY3uXAUW1dJJxSyp5lyNVSNNUU6nhQD/bCGDL1uf3B3S5WVcKXNVJRVEeeGnNI3yij5Kd0j+gZwHGlZsC/NWcbyF+m06Ulpix8HvVAorMurYNvsQWS8ubRD6g9A7kXFLVnOZZzRC8L4oztv438GN2LHp5F/YC4J2epwhlZNduMW2VHwbkCluAL5piwpf1GyTgacr0o1qZNlppQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZ7tEdcS0W7+vtocGTaJY/mgcdAIwdxJgcpY/YRFaoE=;
 b=kTfnHJz7/McOAaX8csG/K4LMeW0BVhoI3aOM7lt0MQth/nxI43mb5HrmPgPc+JkxRfLWRUpDUU+/MvY8Tczos42mtfW0ARnQqfy5cMJzENwVTMXFFg1AvSMmfweHE8zJUArmXqmpmVoMMwnya1TXQBz1jNS9mFCRW6W3GqjSeMktgG4hfvbWi7g4giRfJpCL40qjg74Yw+vQzgA/AMuLLyd4DaI2RnzNVoawBdWGjBBS661AqT1Op1C1lWmHMhTkcAQoOBpB6VyULerb7sDpX5lOKmYregOz6Lj1Il2o3yhfewaM7wu40Z8PDTHfUv9xg6TagcXbd72wTEw0slP1Sg==
Received: from DM6PR21CA0017.namprd21.prod.outlook.com (2603:10b6:5:174::27)
 by MW3PR12MB4490.namprd12.prod.outlook.com (2603:10b6:303:2f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 11:35:37 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:5:174:cafe::e0) by DM6PR21CA0017.outlook.office365.com
 (2603:10b6:5:174::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.9 via Frontend
 Transport; Tue, 22 Aug 2023 11:35:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 11:35:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 04:35:24 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 04:35:22 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v4 04/16] platform: mellanox: mlx-platform: Modify health and power hotplug action
Date:   Tue, 22 Aug 2023 11:34:39 +0000
Message-ID: <20230822113451.13785-5-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230822113451.13785-1-vadimp@nvidia.com>
References: <20230822113451.13785-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|MW3PR12MB4490:EE_
X-MS-Office365-Filtering-Correlation-Id: f4eb0af1-8fd7-4acc-1c00-08dba303e7a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VUbfNsX2T7c1oqHXTtfnRXybwB2qgs5k5Z47W8bdTHsZaWIoX8S1hPBoKEFGJAufxwbj0bQrLqKp/WtuJYqFNVhzC6wf/YeqbzhfSwi7oIUqr2uQY9kX7X4HcQglj4fXrromiiOD+Ao9B98pufWhS1LLxH5R8ZzVlIg5bo85MTAXzozidtMW+F8XfYqaIx8hkpICf6j0bI8hpER/hlbmDn4sw7YT/XAU1sldeiO7vtmi7MU0uXhg4UIxV1Ba8NPrUlfQqguwz3+NGmvVoUNPvdDQKL2tuCZ5xoA3GZ88LrVtKs5BB+ioY3cbAuzUor7Dq6r+W5wbPZZreRNLa6zwtDQKXyyYFWKNv2FevGpOHlvsKzHbHChncOllb6vKn4s24Kl/RLIkHnY2KWIPZqTDKIOnNte9sd8flsHU/tbxrLFex9Co0oNT4/3EHt0EJYq7dBibBiQxp26HXiC7gBmaMnea7mfckHbgMpQUl7INY7qJ7mqV78+WAvmBzhYlXHcUMCBGBA1JD+w70ZUJafwm0p2s0AKN6frf9odJG7mDnBTX/S/eZz+3FY4EaAoiebtYtwV/6NwqRriX0iyuXiZsdZnSu++bY3+/vHgRZhYByqFADzJK46Tou99PdRk2ZUYvqD+3St3auEfVCUMGm8TgDzFcnimokWYfvB4xvPLOltDBYaZY9vQamHl9B7uyrVbUCe2Icf456ELq8R+e/bSOitT4sSasYg4hHW1PHtMg5BY3JSS9OQF0AChLyFI0RDDuk8jBFrF8eRWaSonoKqbFWA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(1800799009)(186009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(54906003)(6916009)(316002)(70586007)(70206006)(8676002)(8936002)(2616005)(107886003)(4326008)(7636003)(36756003)(40460700003)(41300700001)(1076003)(82740400003)(356005)(478600001)(6666004)(40480700001)(83380400001)(66574015)(2906002)(86362001)(47076005)(36860700001)(336012)(426003)(5660300002)(26005)(16526019)(40073004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 11:35:36.8550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4eb0af1-8fd7-4acc-1c00-08dba303e7a5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4490
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Set explicitly hotplug event action for health and power signals for
L1 switch as "MLXREG_HOTPLUG_DEVICE_NO_ACTION" in order to allow
processing of notification callback even I2C parent bus is not
specified.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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

