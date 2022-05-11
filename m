Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA07C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 May 2022 19:52:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347223AbiEKTwD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 May 2022 15:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347333AbiEKTwB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 May 2022 15:52:01 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 544955C346
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 May 2022 12:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhWop/3dF9aMMZV9TKBBUpCSyrborj7I26GSXTKQyANWGPaQ6c2FOH176QEb2P1hWM7BnSEEeAyG788JTTsVlfPXl2bB09pvnXw2R89LzR041ao9N46omBy6aFWepueBP5n9ORHNBK1Zhv5d0wfkQGiGPzfS+RBNERYSsXIjBmbdXw38ZBKKiXtE84HltxM9KXSS7GGSDU2ozDN/rzOCFv7n6noJSgfvO2ZpdPPE31NvkvcyGMQxPUcrnU2SFoPSurkghmXMtOE8ifDNMtdfd9DHovf5TrehBMFByYR5N3pAbtoODTN7iJKgzNtCuy50mVXOAObS98m71uJFYDsMzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQqxMqLMz/7Qfl9nH/PnW1Q7X2jAOEXa3se6FItd3fY=;
 b=D864rOWWMZxMoe0mgYIRe3eF3i2EIhbbOE1Du2gClI5Q3a4fZcdzvS4Y2bImdqtFpNe3wz+eOfTccf2wmrr0M77BmciiUHryZE81qwDRwgesMQ/Hr2xPOULmQo2PSRs9DNzWHzUV53Ve49muIJVkGF1+Re5Xv7vGfB7dBGQP3RS3JayQ6MDkBpQG7AO7JTJe1k/YuvjVo8CLtxJLQRaRFLlf2AvHOxBVKa8SvfRYmYwd+Gwl4k9T7G+INAkTkDijzz4sZ4cosfuf7FISpi5XewSwrA4I5UCR8WRyLweY4y0wcligrb1Uvczlz7BwlLiz4tz/mcz2z2zYGEtSwYihzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQqxMqLMz/7Qfl9nH/PnW1Q7X2jAOEXa3se6FItd3fY=;
 b=bVHPy/LYJLMmeDBh5IL1zOQEF5ZW+RrnEfdBthvIOpxPXzBgLjmuSAJAwDbs9P8tyydWP03bBrefHapzq7u77VbvBIz4ED99Wy9avhcdZ+6xnHPa64PyMkT/sjQmY++lPnhMWDlyhF8B7mi+zlGVWZxeulVAk0N8wMGcFxmS9lAVuF6hND9qCvhSkO8x13LsALm3/LXRNw0ZEsFWR+RDdFuLcrkpvNOXWvhpiPhXM8712wNuiQy+Y8AjOOjaZ5md3AnjMn7AlQ/mae5IttuQaWrteHHgKPm0EfBZkWPcLIT66HReL0SRPYdVw0gk7M+aSJqbqiR67RaROhKvSsf+Ag==
Received: from BN8PR07CA0006.namprd07.prod.outlook.com (2603:10b6:408:ac::19)
 by DM5PR12MB1708.namprd12.prod.outlook.com (2603:10b6:3:10e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Wed, 11 May
 2022 19:51:56 +0000
Received: from BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::96) by BN8PR07CA0006.outlook.office365.com
 (2603:10b6:408:ac::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Wed, 11 May 2022 19:51:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT049.mail.protection.outlook.com (10.13.177.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 19:51:55 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Wed, 11 May
 2022 19:50:48 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 11 May
 2022 12:50:47 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Wed, 11 May 2022 12:50:46 -0700
From:   <michaelsh@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>, <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>
Subject: [PATCH 1/1] platform/mellanox: Remove unused variable.
Date:   Wed, 11 May 2022 22:50:43 +0300
Message-ID: <20220511195043.54853-1-michaelsh@nvidia.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: add75457-6bb9-4fc1-5fc7-08da3387b3dc
X-MS-TrafficTypeDiagnostic: DM5PR12MB1708:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1708A53F72F5256C86CBADD9D4C89@DM5PR12MB1708.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fyQeHP6nswx6sqrMS5nl4xiW7uAYaGrS22LmLOtwlXeeWRF8j1qwTBF8na+Jt35u+D5UuGWKUUTMLMgpOVqxD4K35vjCa8uU80GVwNcBWgNBQC/wgF3AJkQVtW4b2SHZxWT7ef95WyoKbUIHCdRh4BoENNR96NG06jKCPltCaD936Yeqcw3JGVSgwpZAvkHoH+xXhKxnIeP/VWn2r6IUhl0Hy5rnnz4qEBsossBEZIj+ibRhdBSIFEdETT1Ae/zmJvh32jT+SLMYUEaD3RcTALimnj2OBt4wXE1PrlfN08l8J+osuKkGwlAQHw/kaI3Q7QINVIU0ZkncPkWH3uRY4dTVtWEwfiuI2CVt34R2e3f6GyIQkxe5wDaUQIZVkOIQv8hjlIMEoSufRJERuo7COBU3GBW625JpMYHcg7JrEqYIzaTWr8Mx9PTDyYNq5RV8gvev6kn4lOI9zqTpMw04UvtDgPZwVt4kNXyL7E/ddEuDs4XOjxveM4A0/Voy8FZo3pyYfVej53iDOs+lQY+t52PE5oUB6rFb9FroQkXSPyoVMQIoKQRzS+EvWN+IBAHodwf+/IQyRmxo6j8W21rFLaiAmIdzIarYCK9gOpj6R5+vthweQL7ThWxQ8zNgT0yHcKLd1p7hjvC/YaNoF/2Wvm4hr4buViCjQUcHRZLvnAoWWGcxZ2H8HiqCqnmvpvA+V1SI4VNeYn1WvW7QGHzv8g==
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(47076005)(186003)(6666004)(336012)(508600001)(86362001)(54906003)(107886003)(2616005)(8676002)(70586007)(4326008)(1076003)(70206006)(8936002)(82310400005)(26005)(316002)(6916009)(426003)(2876002)(36756003)(83380400001)(5660300002)(356005)(2906002)(40460700003)(81166007)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 19:51:55.5793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: add75457-6bb9-4fc1-5fc7-08da3387b3dc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1708
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

Fix problem of set but unused variable.

Fixes: 9e267f050444f ("platform/mellanox: Add support for new SN2201 system")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/mellanox/nvsw-sn2201.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
index 6165e0154424..0bcdc7c75007 100644
--- a/drivers/platform/mellanox/nvsw-sn2201.c
+++ b/drivers/platform/mellanox/nvsw-sn2201.c
@@ -939,7 +939,7 @@ static int nvsw_sn2201_config_post_init(struct nvsw_sn2201 *nvsw_sn2201)
 	struct mlxreg_hotplug_device *sn2201_dev;
 	struct i2c_adapter *adap;
 	struct device *dev;
-	int i, j, err;
+	int i, err;
 
 	dev = nvsw_sn2201->dev;
 	adap = i2c_get_adapter(nvsw_sn2201->main_mux_deferred_nr);
@@ -952,7 +952,7 @@ static int nvsw_sn2201_config_post_init(struct nvsw_sn2201 *nvsw_sn2201)
 
 	/* Update board info. */
 	sn2201_dev = nvsw_sn2201->sn2201_devs;
-	for (i = 0, j = 0; i < nvsw_sn2201->sn2201_devs_num; i++, sn2201_dev++) {
+	for (i = 0; i < nvsw_sn2201->sn2201_devs_num; i++, sn2201_dev++) {
 		sn2201_dev->adapter = i2c_get_adapter(sn2201_dev->nr);
 		if (!sn2201_dev->adapter)
 			return -ENODEV;
-- 
2.14.1

