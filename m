Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E08EE4996
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 08:14:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233716AbjHVIOk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 04:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233753AbjHVIO0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 04:14:26 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA616CF3
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 01:14:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cc2BZSvAX0Y0X8Fypf6C6cfp3w2J9ub+sNUVd1qtrUUwXUu/hAXYtiJiX+Y3Q22xTyNzo38wLkzBNf217uSL92Zo1kh3UQ5wDKadgTy2ksGKHMZf+sK/ui2+qNDX1UWMXYRHFlae/gMljczF8w8vdBGEjFY5Edbi3N40GSqDHDjnGonNjEtQwL7LzHNWLhAeOL4Tuh9T63Mvn98jYT3aGyABQkbSgO4twcaN/RvyFiXHX6P3o1X/CNu8eIm8O781SoyNMKy+uW32ML5A6c1ccLN2JwFxlLVKI42eY77ngMsEV347wdIFeBT2hhtf5CT6xolUqgON3ah/x1sR6toEOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLFg3Srs+amfX5Ias26CS0Q8pmtoQ1AC/8eFDwVKMzg=;
 b=dXkfvJl1HMbGENt7PENUW1EoNZfUnmvPjh1riP4hLqI1ZmgvJPhNvzyZMkXJlfjqG/R2xVbV5FhGtSrlqi1af8FicY4fAkLB+eWGse89DUFvQ4fxzR7p3Qs+iWqy2NVPLhi+SjC1Hap/Iio0lpQLvp7zPF/4ftbg5LW9mwIJhrpCssnemrISt8rjqNc7DN0FzJT3+WuhUvpScRX93fVI0NHFMirCR9wlXGFQQkrawRiYPDXywPl1Jrs0r167Z7TjtIZU9UC/PD4B2o49mpKscD1JHcIl44DBUBVVIBuxglyDOyLc1onKegFt/PEPY+GRG8P9fuL1He2qVJAoj9wU/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLFg3Srs+amfX5Ias26CS0Q8pmtoQ1AC/8eFDwVKMzg=;
 b=ZU9JfPRKz3fqdwqAXfFTFq3bgsF/tBTK0hXUDZL91bE090jTruDqlILC1jVcFHqaZrsbx646zHtp2Q2Q+al7pP69Llod+/8+BAHYe2utks2hGG0Qeb7aBLWyasNDbWAl6Gpk7aIw71x0ySznbhKCeP5EbwEyZV9inQca90mg1cuWWrgHDsFQhjwYGsa/2ZlWu5+ZotRrSr8K+68TtUPiiBcvkqqP12gbYiQz2gszpqK4aq7zRTh4kuadHM2F510u9yfHfSAEFCcPKyndh7PGlloB/Dq7EtFHFfWCWnRULESGsMK4Ct1h96K783YvdRei2Xy0lXoM+3UMYRWkrpP2vg==
Received: from DM6PR03CA0017.namprd03.prod.outlook.com (2603:10b6:5:40::30) by
 CH3PR12MB8481.namprd12.prod.outlook.com (2603:10b6:610:157::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 08:14:15 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:5:40:cafe::72) by DM6PR03CA0017.outlook.office365.com
 (2603:10b6:5:40::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 08:14:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 08:14:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 01:14:05 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 01:14:03 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v3 04/16] platform: mellanox: mlx-platform: Modify health and power hotplug action
Date:   Tue, 22 Aug 2023 08:13:23 +0000
Message-ID: <20230822081335.64344-5-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230822081335.64344-1-vadimp@nvidia.com>
References: <20230822081335.64344-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|CH3PR12MB8481:EE_
X-MS-Office365-Filtering-Correlation-Id: fefcd0fa-d726-4447-d4a4-08dba2e7c680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: piJ29cvqbcghZ0UI5pK4WGXJMCubrlxDi9B5rs5bgnHpuesvQSN9at9Nczf0+U7XxiDc46Eeg3SdutLMnDPT48phCh0fiJdzG+snzt+Wg8tJjAfr1156y6m3cse9zjJgwp6/zxow/RAhrvB+hUWy6Og9sUzFQ1bqpiki8SeEYbVS+lyhYtZR0+H4/iH8kjJarmpx5aBIBDDSsaayOXVcjUSQoxFvERufsbqbwZM1qtZZqM86ixwf5Yr5HhtDlZhOw+rXzmjR8y3pK0rjPlmwSkcuCtpfwbNwKyQC/uLblCPGaZsKo3FJ/gz5ZxNNt3HRMH4zZ1N63GegUuEr3MSaWqpWybrDP8zrf6vC6i5SK4KJn7x/ZSzr3oURv3irYS3eZQ0zsZ5D/iBtGR5seHRsrLMxHiPGCmJnvEzbQuJuopgaXLURyNXMKyTrt9nqrraVDzausH4oA9mZWfhXVODTnEFZrz5PNXiKrr7IJMDODH3HDrdG314Ej7AUu25AhpFS0GzU3q85Fitfc4CV5AW6gMqUJD+JH9fQqGSyhX5LOuZTedtF6MVH9jN+rF8BYmPQvQ/tuxkBQG02gcdDtv1gTCTJBwTx2aVeIX7jXMhRreweEAuQ1QQf4oJkY43ADY8gqxYrMh2Xe6pkI7ZjPFMH8H8bfeUC7X5WL9WdCYVLG3puuw8bhd6A95XI0eUNLpqhiw+2/g3bJaaARENmpcMfl9Rhws+NUmO/4QBHVTjIwncoKTgkmCeHyVBD9YitrLtcOcT0GNyJ6JBLmltgao3CeA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(82310400011)(451199024)(186009)(1800799009)(46966006)(36840700001)(40470700004)(83380400001)(2906002)(40480700001)(5660300002)(426003)(336012)(26005)(16526019)(86362001)(36860700001)(47076005)(8676002)(8936002)(2616005)(4326008)(107886003)(70206006)(316002)(70586007)(6916009)(54906003)(478600001)(82740400003)(356005)(6666004)(40460700003)(36756003)(41300700001)(7636003)(1076003)(40073004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:14:15.3440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fefcd0fa-d726-4447-d4a4-08dba2e7c680
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8481
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

