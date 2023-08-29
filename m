Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A96C71153
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Aug 2023 13:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbjH2NkH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Aug 2023 09:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbjH2Njj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Aug 2023 09:39:39 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 175DAE45
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Aug 2023 06:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhbT3jrE5WLfLyO8a6wQJiPixKBftTVPmUcs3bh7DXO6svK1XAOkhAryMQXBQEMqLYbM1M8blM6xKPpjSHLiEP/BzHE1qMd4CQeQagan173fmXCl8lt/YYphOp5W9e6PB4jPpoz0HiJYZVOXjT8Yd7/wRHDve3ZUoolL/FuUktnUXCv9tr1wEHDrrWHbfLrd1oph6U8bVqFkxF0pnMiMFxe763/KXaDYxiy1sFA21U6JWqNcBEz+4UZu0hkreEqvVmqqCIZpXqrAVxTt5uOKCdToKLBYWlSHMoXF3ZDadj3uIH8MDP7j8ghvREcTYpDTGU6O+S6G+SXAFyMs65mTQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TB5nOx36O3O86W4EdgiO3yr0j2LN9QtlNd+xBXJqyU0=;
 b=e35KXKRM1FCiAgbz8aUPds5qG/+887cbC0babqzpYdbSR/qK0/iJr8J3GvN5/0nr+LIPCtKtXXJegWOF8ogIHUPd9zbo6O4l04MjBQkWTAyp3LNeJZtYUTlRkRrZ9bhyPLc6mePwkCHDkEE+53CJU3AZ86NpYBC+D62864SftKxyYPZqVXMjtUutKQo+doAJ7KL/qncrSt7clTZyI47cthC+jb8LX0fif2W3eJ4HL8bneqrf1smZ9liz15couP2BP6HhGNP8gqGkagol12xtwJv7c0fp2dWcVnj0qUIHmurWLXQJxg7zADeUVZENKDYO+/yykNiQ91guMGtW6YdPug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TB5nOx36O3O86W4EdgiO3yr0j2LN9QtlNd+xBXJqyU0=;
 b=hrxr5m+atJkf1/1yZXHhjNJpspFTF16VgZSro9tyo4E82GJ+e5I7/CAPCswY/NbIAOdkkZeETnI6UpzbilYTAjGlCakmn17M8sBfr8eE4zMwmNT34wBBaU4BDTt5sK/7vwsf0udSaVT3qLhR0lp1kmh+0l2QpAcEWupcbJRBrjFtSZEUtNO6k6ybugx4trybbzQDU1hesDIJ6JezNCmOjG/lRxfm91YraOxNlLNpXBdlv+xIY6Q6bQEimcxVqEOmO2wl9tM666QP8pYhKcjLyOZ8kIwxA/o9ywxykFHEUipLsEC4/+gWdkBFkYrWp39pkuBs6KyPrwbYn3eum9Kseg==
Received: from MW4PR03CA0029.namprd03.prod.outlook.com (2603:10b6:303:8f::34)
 by MW4PR12MB6684.namprd12.prod.outlook.com (2603:10b6:303:1ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 13:38:23 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:303:8f:cafe::60) by MW4PR03CA0029.outlook.office365.com
 (2603:10b6:303:8f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18 via Frontend
 Transport; Tue, 29 Aug 2023 13:38:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.17 via Frontend Transport; Tue, 29 Aug 2023 13:38:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 29 Aug 2023
 06:38:11 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 29 Aug 2023 06:38:09 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>, <rdunlap@infradead.org>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 1/1] platform/x86: mlx-platform: Add dependency on PCI to Kconfig
Date:   Tue, 29 Aug 2023 13:37:48 +0000
Message-ID: <20230829133748.58208-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230829133748.58208-1-vadimp@nvidia.com>
References: <20230829133748.58208-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|MW4PR12MB6684:EE_
X-MS-Office365-Filtering-Correlation-Id: e49d3932-290a-44b7-43df-08dba8953739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KcXIB5punzFQkWuQTVjB/QErFu0Glvk18XwCZqaPZPed2z/YcHdy+NjVr0EVwfXgDsDwCKFJpbDjxA6H9iK7gUxAgKTRLIKSYId5qNEaG9ctDbOSVAfPL0oovLxNRNwuPkfxhtbEHwW8datLeZSzaw3g5rAKAh7YNMc0/I730HzrBWjYz2Sxh09mA5zY6eYbhoOERbrWAhL7F8uQNbPVSH8W2OTHCXwqL3S1s/2t17DoFPNdErzHZgusdo6JkW+6EDpGOGAFRoLW0nDXGHn25n/OMIxC+s1+M8dVWi/ZY4FZXG5x6OjORg8l0qH0/du5+SzPhziLVP3UPfDl/RKRPyMewMznSiC7xuOijKQrFyJTJnnrqS7O33GTKRJVcMDAP/JynIDE6rKTCSnQrXvm3/TQuWs9FQrpMyHKdY6BhONeBkt5vm/XXjbYnVIAX+iIJQeFR1F8DeqqPlex16AEQMh/8+nRGoVuibAvoO1+mzsAeTaPeYbct+FOak2oMEDDthum+zMJX/Cn9GhFrBJcJyM1wgD6/Q1PBOXL3KBUFpdcp2P30MBS1D+1ThTnQqY5ggC4hV38yOXI6E02+m+NAJO4fQkhxx1TmxdRTPdHbYHecLBn7DX1/kwkv63fhEt2ij0QMcLTeLc/70DUliKf+LdWqvk4VdQSVnSyeVoz2LcgMZ6fXeOqA0Ak+PBz5aPA8S7Yhyuu6KEVp4GZ+kcu92j5aoMITRP/klhGikT6A9DdbRYbPNaM0vGNZigmYkRE
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199024)(1800799009)(82310400011)(186009)(46966006)(36840700001)(40470700004)(82740400003)(6666004)(36756003)(40460700003)(86362001)(356005)(7636003)(40480700001)(36860700001)(47076005)(2616005)(107886003)(478600001)(1076003)(2906002)(426003)(26005)(336012)(16526019)(83380400001)(8936002)(70586007)(41300700001)(54906003)(70206006)(8676002)(4326008)(5660300002)(6916009)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 13:38:23.2212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e49d3932-290a-44b7-43df-08dba8953739
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6684
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add dependency on PCI to avoid 'mlx-platform' compilation error in case
CONFIG_PCI is not set.

Failed on i386:
CONFIG_ACPI=y
CONFIG_ISA=y

Error In function 'mlxplat_pci_fpga_device_init':
implicit declaration of function 'pci_request_region':
 6204 |         err = pci_request_region(pci_dev, 0, res_name);
      |               ^~~~~~~~~~~~~~~~~~
      |               pci_request_regions

Fixes: 1316e0af2dc0 ("platform: mellanox: mlx-platform: Introduce ACPI init flow")
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index a43db6731f34..2a1070543391 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -965,8 +965,7 @@ config SERIAL_MULTI_INSTANTIATE
 
 config MLX_PLATFORM
 	tristate "Mellanox Technologies platform support"
-	depends on ACPI
-	depends on I2C
+	depends on ACPI && I2C && PCI
 	select REGMAP
 	help
 	  This option enables system support for the Mellanox Technologies
-- 
2.20.1

