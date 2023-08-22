Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACA4EE49A8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 08:17:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233731AbjHVIRd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 04:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233701AbjHVIRd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 04:17:33 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC20710E
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 01:17:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3bys1s3NdEUogLMI78NbTOLZrJGAwN0zigEACnvV4QoSwHUFEhTr8EizuZTB1rH2wZn6W+nuLrZO+cHYm48lb8IzheWefWBTwKH+4Hl/vUyqGNqN09JwbtwkDLu5mJV3sfL8+8Ceknk5j9LYaqTEFCtSwV2b1sYkMR823C+bBoPXXqotrDxfPWkefguplFwAb+XNxonlPhmV6kW9Wviyxiy1JtedsD9AEecuBdcn8QisVE+2DeTXM5eBLZmxhs4Ot/9xE5Bb49afCjFDOaorv9ao5Nz8SxUkZiftCWp6YVrNlx/w5cBksUcxOawIO7EjqepvaELm5X48zW8Af0lRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhlRwecO+gIQSwIsobGreS+K+cgvj8WNPszsYzvV7Cc=;
 b=M52CU8L1jEY5Eco02xGu9721YauPvEva80NFSQybH6/T1SvemCyKxB+gCT1JVFxlU+9khVx4dkVI6h2Wnijtf4PqrVDV+t/kDdqdU8mu/Ao5Z6RGhKK+dw1ThUSEJbLtDGyQL0lKfcz8xtsjdwH54LG3FM4sfRqqBykprspThDqIdGJP3sHYItCo0SDRqsGJsAkWx63LpQsFqTXbdD9gUgolzsvaEvQktZxEub7zSgvrqk2YD1goZP9E3XHtcz7kU4+h/JdYMJ94k5ldsyMXJe+GwPy1+Ux2k38HazbDA2J7Dx79UnKcykFDNZNeLIGEdzq9jO7+TxSbkkQM5i+vCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhlRwecO+gIQSwIsobGreS+K+cgvj8WNPszsYzvV7Cc=;
 b=KskUpbi5W643v1DPxhfuLPUuW+EuS9jIl9pSfqUj7SMly2OYAw+Yvkqa1hcqLN2MFKZRrhu3XM5rmrAF8aCCb/zQSTDbJHkmpvLdpa8y9alxami8AtpB3euJOk+LhMzyv4vJY6+dFHYJFv3SgyHZBedu67VsjpkUw4sNdo4RyUOpuIeJRjxu81WxL3zz3SUJtCiQLtOTz178SbiRZNsAIO8jXBr/hUr9RB2Bb5SpoSmO/Id9pawfknZlZ69PAG1KNbW9bhmoMXymu5a7sIhAMpKGHDSFfZ5yaBdM4Wu8b2n1vcX3MktDnJUNb61SZdo44c2yy44rNH/yJrpZph021Q==
Received: from SN4PR0501CA0038.namprd05.prod.outlook.com
 (2603:10b6:803:41::15) by CH3PR12MB8995.namprd12.prod.outlook.com
 (2603:10b6:610:17e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 08:17:30 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:803:41:cafe::85) by SN4PR0501CA0038.outlook.office365.com
 (2603:10b6:803:41::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Tue, 22 Aug 2023 08:17:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 08:17:29 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 01:17:22 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 01:17:20 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v3 14/16] platform/mellanox: mlxreg-hotplug: Extend condition for notification callback processing
Date:   Tue, 22 Aug 2023 08:13:33 +0000
Message-ID: <20230822081335.64344-15-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230822081335.64344-1-vadimp@nvidia.com>
References: <20230822081335.64344-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 drhqmail201.nvidia.com (10.126.190.180)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|CH3PR12MB8995:EE_
X-MS-Office365-Filtering-Correlation-Id: 46bf5b82-f638-4219-7122-08dba2e83a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hfBQR6I3jC5w3hXf1AmjZ2o7Ba/fRXoJUHCleLRHz5expgMW8mbc8cS91UB5jSFUJ/nssOpXpcnESu8Dd6S4EEeQzQ4xeDvc7Gtc8IDbt8+4Isf8Oq+FVUgjO9vZcgXjpR/tATJ4Vh03CicsWEABFLIrIWA5vebzi0vaAHZDYDNkITBXfEywEfbHg8IFG57hD2v8DyD5vf4Xi17Ls5Av+1GvZ8uDfKLJA9Uu2NTCDOkevKn+3ogWOUzHUORpEfl/dxuG0bP/CouM1DAIVK8v2ZNnuTxIFzsyn1X9sfxzq6Xh2E2se0vJu2CdvDmGKwn6Le0FQml78ihP+NNUomB+BA0chIqRkOMRtmabMM8dHm2iBS3HkcQJ5nE5rjZ5PXOIcZ/2s9oBw9J4M0vd3rPV1s2xqjRrWDGnb684r1aKGgq1SoZCgBXKtC68OozeYMZ+/6baiROB33e8rnXiLkmJzROJrztgZ+JF02BMm2SHq/cIwaH1turrHnplEcNrBEgyGtTR2Pl+0ApvwyYu9Wy/nXszfB5iJWc9xOSWB9E23lLELGnbikxna8YzJBMryGE6gWoVK67fCVSkAmsfr/4zWOU3PZfV80YXf8nih/Fhx+C/ozuCD5HAdNtoG6noAzJSpjnmrJtpA2vM7bVcUHmcvNHGNUgQ1s8BXeqe+OW6oCk2g8nMp0NdlbYFhRd6Q8YBrFaVlYsv7cd4svdmxHENg3wiRz9F7zyab/GptvNZb53UHVtfKs741HAzJTiKUy5a
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199024)(82310400011)(1800799009)(186009)(36840700001)(40470700004)(46966006)(2906002)(40480700001)(15650500001)(83380400001)(5660300002)(336012)(426003)(16526019)(26005)(86362001)(36860700001)(47076005)(8676002)(2616005)(8936002)(4326008)(107886003)(70206006)(316002)(70586007)(6916009)(54906003)(478600001)(356005)(82740400003)(6666004)(40460700003)(36756003)(1076003)(41300700001)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:17:29.6794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46bf5b82-f638-4219-7122-08dba2e83a58
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8995
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

