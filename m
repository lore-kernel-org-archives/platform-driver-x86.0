Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86196C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 08:46:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiGKIq3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 04:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbiGKIq2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 04:46:28 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF299E1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 01:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATfGvssa7FKE44HUV5vKbxsMgSQN4ZbCXY7JPnnhkrTtHzR1Qlv0OZzK1qRNrWNjvVSxbdRZRCyOGsVHB+xhf27vKgOhGLMVPq3TLKNnojz7Hwilfj4jWuJAv+E4kqd03GvEm+gU7n8wLuCLDw6LpSzgzwgmOzzWmunDaMyx21rwI9g/312HBe6K1wWq4OjTYRlvnIF8aPM/4x/M2Gppd3MKlxg9+eJ80qSgO009ievOfrRs55erDnURfW/6yhc97tXjzFgS1Zk5oclDsfA2DWSS4felvgpp4Ff1GjcSPFMh3s7/NxNjEku3hFAf0u6aQCMFfjq71NO3e56TrBPBFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W59ItjG2R0b9VJ1GIexR/gkzt6C1Oh08iAS2gVvQVrQ=;
 b=nX0cxl16zfXRr+qzmk2/7/+yCyxWF7ecKsIbOb0YlNJH6Pk2G2pyBnbQ3LwrxB51rGTAbLvH1wN6WwXh7KaKOnHazfA7eVhpOo+AebRol1fw9dMpymA8Gvzb4Egxr8aL/8peLwtCSktjDHvW0b8DCcT1ceeKrWRcUxkqRZnY4bEGr/4nRFVWEs1/DLucmh6by0uG4/He74npNIs8l4jntaIvF4CFypr/EqFPzkE1l4JALX6Xw/Rop62tIvBZ8vG6GMEwFp2ty/4QJ/STmhwkLAgJFVOTA+4YpTn7YXHyRn7h9+EbUr1c0N1jSF2+7jtxgcF3pgOqqCgNSX7UNXWxMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W59ItjG2R0b9VJ1GIexR/gkzt6C1Oh08iAS2gVvQVrQ=;
 b=VuzRbPLlRWxMTyWVxS+5ixwMQqkMB8i6eHU2P+KEFgc81mBqas08jtbVtJkVlg70SszRprk2yQDQI7Th8JGboEQ7ngq2TybVfLJqWC3am9zp+uNGbBB40cdvAUO48+i/X0SN0LV7yaX1FNQqaDoB6FKRAbH/A5g+5fiqLyarBXUBA5V3ecfG6/bqAasdksI6FFW3Jox+OyQheFCiPF67ByEhoqXa3l5zBg2euC9O6nLTsNEhDWW8AGWQvB7Vx8vDvTuZL+zLFfdA3d4AxdOO5W7u8RIdzO6i0PpsIjCaq3zyS4gHqI/g7UDywKhgwXmH6+oklM5ldsqIyNLC2+w04Q==
Received: from BN9PR03CA0124.namprd03.prod.outlook.com (2603:10b6:408:fe::9)
 by BN8PR12MB3011.namprd12.prod.outlook.com (2603:10b6:408:4a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Mon, 11 Jul
 2022 08:46:26 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::45) by BN9PR03CA0124.outlook.office365.com
 (2603:10b6:408:fe::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Mon, 11 Jul 2022 08:46:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Mon, 11 Jul 2022 08:46:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Mon, 11 Jul
 2022 08:46:25 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Mon, 11 Jul 2022 01:46:23 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 2/9] platform/x86: mlx-platform: Add cosmetic changes for alignment
Date:   Mon, 11 Jul 2022 11:45:52 +0300
Message-ID: <20220711084559.62447-3-vadimp@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: d7243c3c-cf0a-415a-2897-08da6319d725
X-MS-TrafficTypeDiagnostic: BN8PR12MB3011:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vrWWYggj8ZIJ4+cty91sEkBKgooAeQfU1mtt/3/jUrLlnQjTMbjqYnZsAeuP9yfmtG3hkyzgmNi1I91T38zeRpReLKLRf7IM1NjcxUfaI7bn9r5mlf1/jd0b3KtbIMj0l05ItIUl78SrxF3PfGz3MvY+IFctkYlb0cSKhu1HKHzOkcq7Wyc8E2wpapvoG602qcAJJYekEPdTuSa7srsBUWO8pMhwX+R0XQSUryEUyaVKBS/2BciLWVS7PvmzkOk/A9LUYUPmz6KpC6MZ9Iii+G8u0U8oSby+/BcHU9u1lNMywfXMMZeF/YjQI4C2A1/jtH84mhQpu+zcPRgY/b72a6bPqR0+2Ty+x1uuhqSbTPE16osxgg+PaS6Pl8JovAe773fYt5iMs3JOmfxHsDYqWzPVROl4pq5vlrusIti4ZBkhCHeOGwz4qs+7Sdx/X/x3l59zqgD1mcXJ/+nh4BQHabrsNNKosqsv5/oA2Cwd9dUqCDWc+xYxC9n6P0QimaXpCiD8mGJ9JZLsxbH9xpACaQWcj7tL4bkoPokBPjoSFK/tMSG+myibwkg4sRvQ0G6BFQ1Jw89oeshWH7hc5NaYvp0m34T7DzYwWWX55YhNJeRqeWfkyKilhRQZQm2Rgb2J8dkHDLOp8+mCk6wBp7WHqz5+/QdYirNHMC+K6t1IV4f7CNbzbtjhzw31Gs+LyRMRc6OvPNzA1TpK5/Ka2vYAlOF/HSQ2+oQaZsvViyXHVBHzpogyPQpdoxx7lbHZT0F/JfgE/PneXKuMUE1saL0PQFv7TpNu7RZriV+i8ys/gR2b5xIkt2E9NrtphdqHdg9qek55HKfSmt55/fEcFRMtuWT6k8klneKW2gM9AruHmec=
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966006)(40470700004)(36840700001)(26005)(6916009)(54906003)(40460700003)(8936002)(1076003)(40480700001)(81166007)(316002)(6666004)(86362001)(356005)(478600001)(82740400003)(70586007)(4326008)(41300700001)(336012)(186003)(8676002)(16526019)(36756003)(83380400001)(5660300002)(2906002)(426003)(36860700001)(82310400005)(47076005)(2616005)(107886003)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 08:46:25.9653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7243c3c-cf0a-415a-2897-08da6319d725
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3011
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Align the first argument with open parenthesis for
platform_device_register_resndata() calls.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Oleksandr Shamray <oleksandrs@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 36 +++++++++++++----------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 54c99f3fde51..12d56d7090f1 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -4830,22 +4830,20 @@ static int __init mlxplat_init(void)
 	nr = (nr == mlxplat_max_adap_num) ? -1 : nr;
 	if (mlxplat_i2c)
 		mlxplat_i2c->regmap = priv->regmap;
-	priv->pdev_i2c = platform_device_register_resndata(
-					&mlxplat_dev->dev, "i2c_mlxcpld",
-					nr, mlxplat_mlxcpld_resources,
-					ARRAY_SIZE(mlxplat_mlxcpld_resources),
-					mlxplat_i2c, sizeof(*mlxplat_i2c));
+	priv->pdev_i2c = platform_device_register_resndata(&mlxplat_dev->dev, "i2c_mlxcpld",
+							   nr, mlxplat_mlxcpld_resources,
+							   ARRAY_SIZE(mlxplat_mlxcpld_resources),
+							   mlxplat_i2c, sizeof(*mlxplat_i2c));
 	if (IS_ERR(priv->pdev_i2c)) {
 		err = PTR_ERR(priv->pdev_i2c);
 		goto fail_alloc;
 	}
 
 	for (i = 0; i < mlxplat_mux_num; i++) {
-		priv->pdev_mux[i] = platform_device_register_resndata(
-						&priv->pdev_i2c->dev,
-						"i2c-mux-reg", i, NULL,
-						0, &mlxplat_mux_data[i],
-						sizeof(mlxplat_mux_data[i]));
+		priv->pdev_mux[i] = platform_device_register_resndata(&priv->pdev_i2c->dev,
+								      "i2c-mux-reg", i, NULL, 0,
+								      &mlxplat_mux_data[i],
+								      sizeof(mlxplat_mux_data[i]));
 		if (IS_ERR(priv->pdev_mux[i])) {
 			err = PTR_ERR(priv->pdev_mux[i]);
 			goto fail_platform_mux_register;
@@ -4906,11 +4904,10 @@ static int __init mlxplat_init(void)
 	/* Add FAN driver. */
 	if (mlxplat_fan) {
 		mlxplat_fan->regmap = priv->regmap;
-		priv->pdev_fan = platform_device_register_resndata(
-					&mlxplat_dev->dev, "mlxreg-fan",
-					PLATFORM_DEVID_NONE, NULL, 0,
-					mlxplat_fan,
-					sizeof(*mlxplat_fan));
+		priv->pdev_fan = platform_device_register_resndata(&mlxplat_dev->dev, "mlxreg-fan",
+								   PLATFORM_DEVID_NONE, NULL, 0,
+								   mlxplat_fan,
+								   sizeof(*mlxplat_fan));
 		if (IS_ERR(priv->pdev_fan)) {
 			err = PTR_ERR(priv->pdev_fan);
 			goto fail_platform_io_regs_register;
@@ -4924,11 +4921,10 @@ static int __init mlxplat_init(void)
 	for (j = 0; j < MLXPLAT_CPLD_WD_MAX_DEVS; j++) {
 		if (mlxplat_wd_data[j]) {
 			mlxplat_wd_data[j]->regmap = priv->regmap;
-			priv->pdev_wd[j] = platform_device_register_resndata(
-						&mlxplat_dev->dev, "mlx-wdt",
-						j, NULL, 0,
-						mlxplat_wd_data[j],
-						sizeof(*mlxplat_wd_data[j]));
+			priv->pdev_wd[j] =
+				platform_device_register_resndata(&mlxplat_dev->dev, "mlx-wdt", j,
+								  NULL, 0, mlxplat_wd_data[j],
+								  sizeof(*mlxplat_wd_data[j]));
 			if (IS_ERR(priv->pdev_wd[j])) {
 				err = PTR_ERR(priv->pdev_wd[j]);
 				goto fail_platform_wd_register;
-- 
2.20.1

