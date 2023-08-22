Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22FDEE49A3
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 11:41:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233476AbjHVLll (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 07:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231960AbjHVLlk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 07:41:40 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A546AE77
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 04:41:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkStmN9bzN/eG/OYo90Aekbnv9f3Cco+nYti6OM3d+r17/pL1qihnP744avyaef52fVu2YNKIzZF0BDnroOKRVR0r9qjQvh0CDhM78x8npPgAnH9zPO7H76ZnUrxcNH8pdCO+/bCb3WrplTeT8KNH3AOLJaj1Iqa75OicbTtwMrM1j7SKxFA3Z2RTS+leXCcKgwjpoz6GPM4oPLLdCywskxX+mkL7v3iyTwq8ANCzDhVZLJRCPJmRvE5gdz/b2ZulxPr+n0MpqU2MleWORmiYG0mXYiOossK4IBK4AWZ+QlZY5TLLUuXIjkKgvYu8w+/FYBsqGc3gQiqZX2KUB6upA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYrzRi3JI4+NSNzYyD/O4BkzfSEbUSdmQXzBr2SXIy0=;
 b=AFVLxk2u1jStXK1qdgKnn9UAclRZzUc7FDYiQAPDCURU1VogxST4ACpJeKybGOGniiSKGYJk6bzcS55NHHraPOpUM7JC1RcgOxUXVqkA57/P7AYmPmL7afAqv5R1CYQQbuljVgqJuLExDCy/RRpLIiqp8bDf48vDmXJZQm+Cj/YxJ0BWrK3IC+foUg3pQmwXd5/KuU7kSQk6Jqf7HLF69RbGFWvQIu3GT6j1yy9qEajFx8XUIxJceEKChB2gtS4SdSyLq7s3RPqF2DR9sOAHSV/5HRIz1WFFi31mM3dRsQUUPWS1DMIB2/oAVw5LVT7hKpii2DkCT2I6y0Aq7mY9/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYrzRi3JI4+NSNzYyD/O4BkzfSEbUSdmQXzBr2SXIy0=;
 b=WXJ/UZdvytRK/xv0fqzTGdJpV7K2MQQSN31ZHTtUhzhIydJQHKnxpdHkIgjY8JjCDB9A9HLkxSDMQgiI9ZsI1Hzae8vzfyTWM6KWg+WaUCAT19bcfL7k5ff41Ork0X4I0jGRx57DnIZxrM5beMUFUt2f6wCdAMINsBKvVnJu6DHbr6BnbqJLdIzPtqh+ZcgOgI5PQlmWfXny14I0M515AoscSTb6qUWtFFJjuNYFY1Y6LLA0kI2epRkm+TEWTKMGZOdQIP75YFHVm7IFLfWsDIHLw7u8MrlTv/6BxLIs3SEfRsnzA0y5E8bZMMJRG6atXNfLtfz+IKBJMZril+EF1w==
Received: from DS7PR05CA0079.namprd05.prod.outlook.com (2603:10b6:8:57::9) by
 DM6PR12MB4864.namprd12.prod.outlook.com (2603:10b6:5:209::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.24; Tue, 22 Aug 2023 11:38:44 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:8:57:cafe::19) by DS7PR05CA0079.outlook.office365.com
 (2603:10b6:8:57::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6723.15 via Frontend
 Transport; Tue, 22 Aug 2023 11:38:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 11:38:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 04:38:31 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 04:38:29 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v4 14/16] platform/mellanox: mlxreg-hotplug: Extend condition for notification callback processing
Date:   Tue, 22 Aug 2023 11:34:49 +0000
Message-ID: <20230822113451.13785-15-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|DM6PR12MB4864:EE_
X-MS-Office365-Filtering-Correlation-Id: f65b4bd5-cfc9-44a1-6bda-08dba3045797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D2Xr1wnaOckC4GqaxkA4YtdCuKjqW1js/0267b+RL5JDCK8j1mqvWe1fF5BuMhWgWTp43ut55cR192rxvxUxCdAQXnXf4xsRy7IT4kyHOzcHY6e+3C5WKjQ2LG1K1tKc4S51iwGTqSHESLj5PZ3lnvY0iOfyXb3efCyKNyHdzGHtwURP9OQLtwsGOzsdSRHZW8iLdXIHdml7QLmyXSODv/GYtTfiGp4jkmj8mTTlPF2uqcEMfw5HrVldA+8vmUYVkQ9GmhhjBLKMTJSiajkUkgK6CYmQu/dwieuHhzx/Kg6hLCmBhG1y5XKp7ySDFO8mluQD9jFtp9kTSXPWHqBgc3ICt4XE7xkUxhGqyw3+1HOFppGfyvkqYlZRMPXnf0UxYV1468ixYjShNbgNZO/pEQpBszKWu41yp1fA84NWdy7Pm79ARFc7nzkbtbKSsj+JNPHPzyGazLoWSoK41z3MF/7xofin8RTc/M1AJXfpc3B9e2Ad5yprCh5WLOt+UgE6L/6bZ4WmkErOdtfLbs1Hf0XsrSah2cNTpN74KuIfwD7dmC8kJy2Mea+87sCMn/1RvVCbtmqWCxQy2RQ0ohB2l/tbzg7hiAh+gbgNuJDgYkrbn+1DQAX1NZkpXsy4kHx1NnAcqsCFTKvSVpQHJpjvdG9qnn3HVoVv/Fhtli+1nMNfThMfjJXoEZrkhkHYWQC9Ug4dzCdLml0WM5IWNT9jZcfR3Ub5DY9yIPU6sGz5wxly1LxYJ70tjZVr0TZqq5cr
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(39860400002)(136003)(82310400011)(451199024)(1800799009)(186009)(40470700004)(46966006)(36840700001)(2906002)(66574015)(83380400001)(40480700001)(15650500001)(5660300002)(336012)(426003)(26005)(16526019)(47076005)(86362001)(36860700001)(8676002)(8936002)(2616005)(107886003)(4326008)(70206006)(316002)(70586007)(54906003)(6916009)(478600001)(82740400003)(356005)(6666004)(36756003)(41300700001)(40460700003)(1076003)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 11:38:44.6701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f65b4bd5-cfc9-44a1-6bda-08dba3045797
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4864
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Allow processing of notification callback in routine
mlxreg_hotplug_device_create() in case hotplug object is configured
with action "MLXREG_HOTPLUG_DEVICE_NO_ACTION" in case no I2C parent bus
is specified.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index 6ddfea0d4c5b..eb5ad35274dd 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -112,7 +112,7 @@ static int mlxreg_hotplug_device_create(struct mlxreg_hotplug_priv_data *priv,
 	 * Return if adapter number is negative. It could be in case hotplug
 	 * event is not associated with hotplug device.
 	 */
-	if (data->hpdev.nr < 0)
+	if (data->hpdev.nr < 0 && data->hpdev.action != MLXREG_HOTPLUG_DEVICE_NO_ACTION)
 		return 0;
 
 	pdata = dev_get_platdata(&priv->pdev->dev);
-- 
2.20.1

