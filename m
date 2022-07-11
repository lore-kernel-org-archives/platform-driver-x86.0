Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14EAC43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 08:47:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbiGKIr1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 04:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbiGKIr0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 04:47:26 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2CE6E5
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 01:47:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqVzZpPID1cUfcjro5rZqVSXfe84Os9Py1/5ioreYhhtkkOWGVwI12ekDFAhI1OKOAIQXn5sCh7E39ccLMdLtq9Z1PjE3VAifY2u2PcNUy5OGBI6kUykRtdCRX9B3t5kvNQOzi3UytqFBTSpS3ErHedeZ6MHBEfTqov5az177iyXGyuxdnfCy45j+FP0GcLa5s+Ldnj/XxN2Xihr1gWlTwYgQdMsdthZM2LB68qC3CBfz1HyCqIpbY7Hpt1lUx3cFwLPrMICRFpiPDl93p80RKZqgCcDMI/XDLrKxCUT5xehTAFZFq2WaPEeiuOi1PyIM50jRfKOieIcNZFapc9lwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAtnpIxfRqv/47E38aOC/tPoUs+UXRA2CMdMZKyP2LM=;
 b=JMZEYXmT7CaHr3Xo+1rEXvfaqqo4PccehVf9sBFu8myWgbxG0Qa7kj2ji/7X1O02n0VI4IPm2R2eVF9tyYPAhNKTXN1Gc8c8ucQcjqPtR9KmyQ5y2DLFlKoXmau1LSG6rd8Sg2i448qbF3oc7ZYer+InoBQzO0MbD5+nsdXcEo9Bmypyj2M+Uz2EyWxUY5ahbM8YylS9hIVlVRb6WT3gSflII5dgqdI/5Jd/wczExviv3qyj8YTdZn+sxT21fQMHAn9TEwq4fQwf1po2QGrsnHNeCGZBnZTZKZTTM0F0HpQnGBgMWSDtbfH1Efu+ECu25IwPBKHY7+0R3yiq/4XrVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAtnpIxfRqv/47E38aOC/tPoUs+UXRA2CMdMZKyP2LM=;
 b=LlIHT4P/ml35qaskb9qdMrL5EMwdtQeOiJI58dxhaSRv1m1y34tAH4SMgUeVEnVWKZD97eL58i7EUP9xYwqY5zqaNVckkOx9jD3vZ4i+P9nVTnWiCMVavdGYMI22AlFHew/n56UExcXRUKmsXMzusVUX91eQQFwsw0JdcKC2MWeuuHDAfi/nDMWZP4CiRi/UAcf0JDZPZZAS9p0LSLPEQID7Ilay7Lx8YvSeHM1TtBBnsQvAU/+P+EPo+fxK1ZyljgJvDf5vJftvwnIJeLsC9XKCJwQo3vUBAw32p6VzRCJbywmd4DFbX5rD/+vL+AHOZGF97n5sxXVz3sMuWsF3KQ==
Received: from BN9PR03CA0422.namprd03.prod.outlook.com (2603:10b6:408:113::7)
 by CY4PR12MB1493.namprd12.prod.outlook.com (2603:10b6:910:11::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Mon, 11 Jul
 2022 08:47:23 +0000
Received: from BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::96) by BN9PR03CA0422.outlook.office365.com
 (2603:10b6:408:113::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Mon, 11 Jul 2022 08:47:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.238) by
 BN8NAM11FT054.mail.protection.outlook.com (10.13.177.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Mon, 11 Jul 2022 08:47:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Mon, 11 Jul
 2022 08:46:22 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Mon, 11 Jul 2022 01:46:20 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 1/9] platform/x86: mlx-platform: Make activation of some drivers conditional
Date:   Mon, 11 Jul 2022 11:45:51 +0300
Message-ID: <20220711084559.62447-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220711084559.62447-1-vadimp@nvidia.com>
References: <20220711084559.62447-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0615ef34-2987-4a02-8963-08da6319f946
X-MS-TrafficTypeDiagnostic: CY4PR12MB1493:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bU2LGDWnBntnbgLKGftbKsfWfPlzSojHahKRKGFzG6mozL6H7M9Q1rVzgtQGLRrEMBQJPTjEAsuNXZOzjNXbRABAjoz3I6K8R9vxYzj3HBEvgCLhZ6Vd7y0jSilfmYr7wTh37JGY72BKEQiq39l1WF5ZTQgQ8kp3qeiYa7EgMcgVb2xLsNxrxd4YiR8MGyVF1BZMp6hRwaT82S7qdJXRGQk5RkaCopAd26bKWaYGC9tf5yAvYEY2H0xtK9YKhhm9X6Sf0F0n05CprYQ2akTuAqdt+DMr4Fx+jpziEu2sHT/V6BgPFyJb9dWB/DXa/OYz8/8Dd1+xDFUpbhbbiSEak6RrlsODPGlLIIYu4ANvNKl6/FlsoM/mF3NINS/uJKoPYsAnZu6yWzqBz2zvMzLUIo/bmQMlpXkptZe7p3nxtIESMQynaBxp2XWG+TipdI0709479rK7TQorV9gcoqOQAGjFDB6ZyFH/bYxMIbet0Nh0GNdEkksq1LV8qBlrEkh9sslKDh5R7SuCw5Sn6YAxQ9TTrQEaV0KV0GH/WuVuBt9QS0hDIrwgr3YRYv2EJ0PEmSf9FAt3uAMS+81XjYgeS1c/emqGR8TgVd6dOplDa8Yt+gUC+8YLav4j9YaVxapKCkUSzUoEk/cYWKwMkzx0wlIBtCbh0mB5PAgQFed4Tpy212Jgt/AYXOuEV2azkKi7aAbxwgTlhbMU4bAyFH4ocu8NMFf5Z2xxEq792taTdCNmbyD8mT2gETDStcux+0Le3hyvKh3NYXWubiq2DABoKOoILVkHBvanHSLQAMUKCVnYpo1CiroGJ3PbefNhEgf2cZfOMCSL1Qvim2JocyKGL8bqkYfyhrIiFUaeOXd7hpY=
X-Forefront-Antispam-Report: CIP:12.22.5.238;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(136003)(39860400002)(36840700001)(46966006)(40470700004)(83380400001)(40460700003)(47076005)(81166007)(82310400005)(86362001)(186003)(426003)(82740400003)(16526019)(26005)(41300700001)(36860700001)(336012)(40480700001)(6666004)(2616005)(316002)(70206006)(356005)(1076003)(107886003)(478600001)(36756003)(6916009)(54906003)(70586007)(2906002)(8936002)(8676002)(4326008)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 08:47:23.2109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0615ef34-2987-4a02-8963-08da6319f946
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.238];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1493
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Current assumption in driver that any system is capable of LED,
hotplug or watchdog support. It could be not true for some new coming
systems.
Add validation for LED, hotplug, watchdog configuration and skip
activation of relevant drivers if not configured.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Oleksandr Shamray <oleksandrs@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 62 ++++++++++++++++-------------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 447044fdcb77..54c99f3fde51 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -4853,16 +4853,18 @@ static int __init mlxplat_init(void)
 	}
 
 	/* Add hotplug driver */
-	mlxplat_hotplug->regmap = priv->regmap;
-	priv->pdev_hotplug = platform_device_register_resndata(
-				&mlxplat_dev->dev, "mlxreg-hotplug",
-				PLATFORM_DEVID_NONE,
-				mlxplat_mlxcpld_resources,
-				ARRAY_SIZE(mlxplat_mlxcpld_resources),
-				mlxplat_hotplug, sizeof(*mlxplat_hotplug));
-	if (IS_ERR(priv->pdev_hotplug)) {
-		err = PTR_ERR(priv->pdev_hotplug);
-		goto fail_platform_mux_register;
+	if (mlxplat_hotplug) {
+		mlxplat_hotplug->regmap = priv->regmap;
+		priv->pdev_hotplug =
+		platform_device_register_resndata(&mlxplat_dev->dev,
+						  "mlxreg-hotplug", PLATFORM_DEVID_NONE,
+						  mlxplat_mlxcpld_resources,
+						  ARRAY_SIZE(mlxplat_mlxcpld_resources),
+						  mlxplat_hotplug, sizeof(*mlxplat_hotplug));
+		if (IS_ERR(priv->pdev_hotplug)) {
+			err = PTR_ERR(priv->pdev_hotplug);
+			goto fail_platform_mux_register;
+		}
 	}
 
 	/* Set default registers. */
@@ -4875,24 +4877,26 @@ static int __init mlxplat_init(void)
 	}
 
 	/* Add LED driver. */
-	mlxplat_led->regmap = priv->regmap;
-	priv->pdev_led = platform_device_register_resndata(
-				&mlxplat_dev->dev, "leds-mlxreg",
-				PLATFORM_DEVID_NONE, NULL, 0,
-				mlxplat_led, sizeof(*mlxplat_led));
-	if (IS_ERR(priv->pdev_led)) {
-		err = PTR_ERR(priv->pdev_led);
-		goto fail_platform_hotplug_register;
+	if (mlxplat_led) {
+		mlxplat_led->regmap = priv->regmap;
+		priv->pdev_led =
+		platform_device_register_resndata(&mlxplat_dev->dev, "leds-mlxreg",
+						  PLATFORM_DEVID_NONE, NULL, 0, mlxplat_led,
+						  sizeof(*mlxplat_led));
+		if (IS_ERR(priv->pdev_led)) {
+			err = PTR_ERR(priv->pdev_led);
+			goto fail_platform_hotplug_register;
+		}
 	}
 
 	/* Add registers io access driver. */
 	if (mlxplat_regs_io) {
 		mlxplat_regs_io->regmap = priv->regmap;
-		priv->pdev_io_regs = platform_device_register_resndata(
-					&mlxplat_dev->dev, "mlxreg-io",
-					PLATFORM_DEVID_NONE, NULL, 0,
-					mlxplat_regs_io,
-					sizeof(*mlxplat_regs_io));
+		priv->pdev_io_regs = platform_device_register_resndata(&mlxplat_dev->dev,
+								       "mlxreg-io",
+								       PLATFORM_DEVID_NONE, NULL,
+								       0, mlxplat_regs_io,
+								       sizeof(*mlxplat_regs_io));
 		if (IS_ERR(priv->pdev_io_regs)) {
 			err = PTR_ERR(priv->pdev_io_regs);
 			goto fail_platform_led_register;
@@ -4949,9 +4953,11 @@ static int __init mlxplat_init(void)
 	if (mlxplat_regs_io)
 		platform_device_unregister(priv->pdev_io_regs);
 fail_platform_led_register:
-	platform_device_unregister(priv->pdev_led);
+	if (mlxplat_led)
+		platform_device_unregister(priv->pdev_led);
 fail_platform_hotplug_register:
-	platform_device_unregister(priv->pdev_hotplug);
+	if (mlxplat_hotplug)
+		platform_device_unregister(priv->pdev_hotplug);
 fail_platform_mux_register:
 	while (--i >= 0)
 		platform_device_unregister(priv->pdev_mux[i]);
@@ -4974,8 +4980,10 @@ static void __exit mlxplat_exit(void)
 		platform_device_unregister(priv->pdev_fan);
 	if (priv->pdev_io_regs)
 		platform_device_unregister(priv->pdev_io_regs);
-	platform_device_unregister(priv->pdev_led);
-	platform_device_unregister(priv->pdev_hotplug);
+	if (priv->pdev_led)
+		platform_device_unregister(priv->pdev_led);
+	if (priv->pdev_hotplug)
+		platform_device_unregister(priv->pdev_hotplug);
 
 	for (i = mlxplat_mux_num - 1; i >= 0 ; i--)
 		platform_device_unregister(priv->pdev_mux[i]);
-- 
2.20.1

