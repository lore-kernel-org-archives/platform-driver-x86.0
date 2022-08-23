Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD895C32789
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Aug 2022 20:37:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbiHWUhO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Aug 2022 16:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbiHWUg7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Aug 2022 16:36:59 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB25B63
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Aug 2022 13:20:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FG78SP5x0Lt/6+6/vNvUFBnFI+FL/ws8goDC2gyBsyZ7RIwrFvRWinhxLxoE62olEUwFSaayRfB+PUWCCp7MQPNuXz4DlfZEcY4SyDqCPq/T+ie0FryfQcB8xokCgamngi2x++6CP8o3JQTqM/VSz3cU7/86Nk4EGhIGVxL1VDQMOU2rtHGomtF6caM//RDSP4mIq9cjY0FZw9uX1RIe74/2pSkZsFZw8bB8SQB6pCItuXrma3PK9HAjvYwxQTvos683ZqsRYSJ1vt0kqDmVIoKm+/03smRSpa24CBIhbeJp0uQzLcatEHOjLkfA9uyFaYY7+ZyFlKX+yR6Vabbk+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01XDffCwQawe3F3dkuiqniUxGZps5+4y5ipOOJLcrLk=;
 b=aeMIov0SGimwM3R0pb2rKgkGaB1U+av9oBG6AKsVLPfKJz0Gdl2vJWVJOEHvLbt5a/BN6IuM7X2vPnWhsSGlDrbU9Oc45OvAa3QVGzjkkAmjDzH020WdupNCST5+s+5UwShrjGjD5qOvJKxAj8E9I0Wrl27x0bmyNhhe3CwIdDACoqZ0xIv35XQCk0MgPalH6aMLxaHqijNUeIlvJO+bk2iI61dAouZF4wOhZOZhLPo4Qk8aBgAz1BXtRu//RPqG5vqub3lZhwuDle4WW551InQXAk+2ChpO82GU9K3AP3tpoHqI4G924yVf/ZcHS6RYHCqBgeEGYJDcAuZRz7gUaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01XDffCwQawe3F3dkuiqniUxGZps5+4y5ipOOJLcrLk=;
 b=Shr6LOZQ9gonhS8FiAP9C5c97I7xL4ZruiyVK1bfRWHuS5TZts1jcwIuN/3t/dlSwwJAODCeN7RB7CsGbOFIT0IeC+Qu/Mm2QUrqLIdit1VvG/twnKpcra3qgjctnE0V+/ssvq0D71o1Ly153e8G6l4/YfkibCzYlLymR9gQqZxgBz1HQe4UuwESiZDVm7AuvfkMyVSSMCLTrn9rfWEqdDSzQkXgT1FjHX79ns1WGzZitcCbOpQ4pWKXQscj6RNUQbwgsWYVL8OTg+o8Eh2c7EMmef1GqD2c308RXsKV2yBKg7b07EHQ9zurlh68aWvCm/TzLlI6lWJU5JWtCrK0CQ==
Received: from BN9PR03CA0935.namprd03.prod.outlook.com (2603:10b6:408:108::10)
 by MN2PR12MB3935.namprd12.prod.outlook.com (2603:10b6:208:168::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Tue, 23 Aug
 2022 20:20:04 +0000
Received: from BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::76) by BN9PR03CA0935.outlook.office365.com
 (2603:10b6:408:108::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22 via Frontend
 Transport; Tue, 23 Aug 2022 20:20:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT016.mail.protection.outlook.com (10.13.176.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 20:20:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Tue, 23 Aug
 2022 20:20:02 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 23 Aug 2022 13:20:01 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <dan.carpenter@oracle.comq>, <platform-driver-x86@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform 1/4] platform/mellanox: mlxreg-lc: Fix coverity warning
Date:   Tue, 23 Aug 2022 23:19:34 +0300
Message-ID: <20220823201937.46855-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220823201937.46855-1-vadimp@nvidia.com>
References: <20220823201937.46855-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a52fb2b0-b5e8-4ace-1b92-08da8544dd0f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3935:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ogEZozwhr51V65lCh4EyLomNm7wf2E640c3Xpy2BgyplLPdvvsO3GDM9DSR0k0UhUgFM/wG9YfRoBVMJAyFK149iKptfXphu13Mtb4ITbs/+rkOqlb1t+gOWIQOaz31ylj9Cc/EKDvNkVmgn+OQ6VrKyvA9Wv5U2a0PlGVfqJp2ZlXN/DvAzG6LH/DKvcARcZvmhk+YSQvFj8cJJZ5lQ5W8oRVOu/SRdMV7psfRlkhbJR6zc6afhVYkRX+PEvgTzyxFFaVIn7xHClwRgg+jl116mOfQ/ap+wSoane2WMkIacWg0EUHb38ZPcyyZmDj1J74hGlvq5u8kE4A2zRCxJOVYCd8TghbrNuLFvdrntHeZ+e2+y6/C1l25iOxQ262vqyKhxSNHgDU0rP6FGwHAlcc1+kkQh0EgMZtdCj9J60sQyqXYTP2ql3JtHAbWEE0tmf5OzwA/Apc+Y0Hg9Z77o+qvSdI9/Q2ATkaDW/EnYFtp0S2gY2015PKfFXmkvyCWmkAvOMh9JTSUU9y7IiIhlemM9JAn5RJcQBOD/EBABl07zRYn/2Bk2olGVm6nTvwoMU2IjJ//GENyH97LHWekEZu6ixa+43vNaQM5GaS7+VztY/BKm1VCP0VSNsFspq8kM9OwAC8ITQm3KWcG08SkxESbSn9mwhAp16JW0JHBUMxJtdXx9bgcV0ZIGkwTD61gEiV3KBZFvmOLrIzER7/aDd5ZbsmCdrASpg612h6FKmwDMJkTjVmtLEhbffTeAE/fUOV1yyuUKOi+q55cR2jyN2xefbUGzzwOLdIL7yOZ3nQc=
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(39860400002)(376002)(136003)(46966006)(36840700001)(40470700004)(186003)(1076003)(16526019)(336012)(81166007)(356005)(36860700001)(47076005)(426003)(82740400003)(40460700003)(8936002)(83380400001)(5660300002)(70586007)(70206006)(8676002)(4326008)(82310400005)(40480700001)(4744005)(2906002)(6666004)(41300700001)(107886003)(26005)(54906003)(6916009)(316002)(478600001)(2616005)(86362001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 20:20:03.7653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a52fb2b0-b5e8-4ace-1b92-08da8544dd0f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3935
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix smatch warning:
drivers/platform/mellanox/mlxreg-lc.c:866 mlxreg_lc_probe() warn: passing zero to 'PTR_ERR'
by removing 'err = PTR_ERR(regmap)'.

Fixes: b4b830a34d80 ("platform/mellanox: mlxreg-lc: Fix error flow and extend verbosity")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlxreg-lc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/mellanox/mlxreg-lc.c b/drivers/platform/mellanox/mlxreg-lc.c
index 55834ccb4ac7..9a1bfcd24317 100644
--- a/drivers/platform/mellanox/mlxreg-lc.c
+++ b/drivers/platform/mellanox/mlxreg-lc.c
@@ -863,7 +863,6 @@ static int mlxreg_lc_probe(struct platform_device *pdev)
 	if (err) {
 		dev_err(&pdev->dev, "Failed to sync regmap for client %s at bus %d at addr 0x%02x\n",
 			data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo->addr);
-		err = PTR_ERR(regmap);
 		goto regcache_sync_fail;
 	}
 
-- 
2.20.1

