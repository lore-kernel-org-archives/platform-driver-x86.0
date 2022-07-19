Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A3B3C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Jul 2022 15:36:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235925AbiGSPgJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 19 Jul 2022 11:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234397AbiGSPgI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Jul 2022 11:36:08 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2062.outbound.protection.outlook.com [40.107.95.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7778F422D5
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Jul 2022 08:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zxbl6q4fHLgZiiV4Qzx+VWtuZvvIKGZCI+03Y5fEVuf92opr9XZ/RXpFA11itr6w0wuwY3QPm/4BejCTZp11ytHGVnet8nBMrjAbcxyUNb2Y9Ht9k1tntM6d+2QMZeZTZMln59EmDSrq7CYUbXNdkjNS17AwOucMcbe+Vhph+jA8EVa6rKtigZnTEIYQn/hXtzCFtqSnfKtlEI1q4q6QI/dAq3bGE6d5CRddGh3ItYh/wzXSgw79vY7worb4JY7DFzFJoZM41p5ABaxSRTkbTlEJfWY+8RTsF1k4e0daZS4Rv0MIwSqpdI8XBRJG7P5TBSSlRzBZnd7nUM0eR/A72A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnRU+u3JHQU3eQMOuY2o6s/P/EE1zsGzFC8EtI+sMDo=;
 b=I2sIYreum554ZrfFdGGgmyrsBR5ncEjIuNkcYTyqMsJINoQ9OkmFHQogeDW/BiKN1V1HC4mcnHkLM4rSTGg2S3IRCZDBIzZUHFU60Aao9B03rkcvMDd4nTJjr5Z5VLESigqkVNi567z6cw5OL0lCiCyVOU8rMZDLmnpXw/mCqdtKdlhRoIrhKBn1+qgTm5rifhANcSWB0NouVLRtyseZiEaic45tMULuyhW8940KfCJ9pGznQ8lZrThduBuSG9/3gZy2zvgBngnsV1kI9BdwO0zhjcSQ2kp8omngmM+gCXXZFRHCDtR5kbczyAVgtn7OW1pn3NfdxBldDS1OZ7myBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnRU+u3JHQU3eQMOuY2o6s/P/EE1zsGzFC8EtI+sMDo=;
 b=ZuNHBc3Dk7x2mEHp8fwF6z2QSLTt3FJnHO6h2VsZqxj8b37hnmizXDVSN0D4CsB27+VxgZFkL6rTTNd3nKI++JZY8G9eV6FcYKtP6GiKPUyIg2YBRcRHJXfPCJIYh68nMyzGPvlQEmQ6+cLsmDT6atsllE/dJKTPDl1FTYJkV+eUylRLsvVcsYgjWG2s5Ia+2GmIQK6B5kn7D8TQhfS8sd09ExPXBrG+moiSpd86Xa3KqVmzU4AjAtuy9uVt/z8RkhnApe01KNUd7EyMlUppjravIEryG7IK5tdM3RElzwRH6cX/uY7tCI/8apTVpT8LpPFOJh/AdZVYTFPVjc8pug==
Received: from MW4PR04CA0096.namprd04.prod.outlook.com (2603:10b6:303:83::11)
 by MW2PR12MB2540.namprd12.prod.outlook.com (2603:10b6:907:7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Tue, 19 Jul
 2022 15:36:05 +0000
Received: from CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::26) by MW4PR04CA0096.outlook.office365.com
 (2603:10b6:303:83::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Tue, 19 Jul 2022 15:36:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT053.mail.protection.outlook.com (10.13.175.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5438.12 via Frontend Transport; Tue, 19 Jul 2022 15:36:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Tue, 19 Jul
 2022 15:36:02 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Tue, 19 Jul 2022 08:36:00 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform 1/1] platform/mellanox: mlxreg-lc: Fix error flow and extend verbosity
Date:   Tue, 19 Jul 2022 18:35:40 +0300
Message-ID: <20220719153540.61304-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab7fa645-c92c-4aa2-13e7-08da699c64f6
X-MS-TrafficTypeDiagnostic: MW2PR12MB2540:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X+mxU7LSSJ0oHLwY18nj/pPWpfm5MaT0q1HheAfl41odXu8KaL7JAp+w9BnDIY5ScwRWEZi4crNskiXb5n0gsFvobL5TXdXRq9AOQQpDbBi9CtFxcs2dU7xi2acpNXBS2VRcrx6/L4Df2zkfrSEcuihQI9sj6Qo+xDPNU5X1rh1D53ZuoI04Is9JY6XKQdb0zZe7oBethYsyg8fNMXThQ2JZN3d7MzP4ltyCLR1P/JWncD9r7a0XegXvsHqd8gvXYIYaUCGkwO9zzkJk0KX6GzLz8d4k00kZu4xdc1FI7NOWrsKPe5EqiJuQgjM7Qr4G0pFWRbLJxn/J5RfqIYUWpGRkvvc9gey0hiBg1UniMaXrDrnjl8KzjG55Io4HGP0GTc4ATKKMGrF0ZxH/fLVmGcl09LS2up1n6POwcl+x9yP3rH1jOnimoEU07UL6CkWebQHSW4YdGfW3Y3SO5toFNJdczfILz5vWliDDqlqgxAQOZP1va/N0gh8cbiWg8anzuoWyQ0vc2MQH5M7euOYaibMTGHNuBPCWQeCwEcRrgUpDcFwsd1+ZUGGB4tRe37y9B4wldL9w/P3VRcmjoc+H6iYb5zejqaLBmPiubYx0UITf3wv7PDElqOJhm3ENAjgdNfOR1YC4GUP2bcYdL68s1uUhA9KDRJvpZTB3qvpoZO5m/oHKAFS7vdTDXGu9UrPlxx7PuQl//tyXDPcx/doebGepImw/XbyHxZ0ROGiEv7W32WsCduAIowIxZfmjcYIRuEWST+OpK85HWOpWLPmP5rkD3KkgjP5f+UIJM2h/LXK9cWLCVg9WrduVbLd/K9JCZAisrtKNgEr/RsGJDjufaA==
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(39860400002)(376002)(46966006)(36840700001)(40470700004)(16526019)(107886003)(83380400001)(86362001)(186003)(316002)(47076005)(426003)(6916009)(1076003)(54906003)(2616005)(478600001)(41300700001)(40480700001)(82310400005)(6666004)(8936002)(336012)(36860700001)(26005)(8676002)(36756003)(70206006)(70586007)(82740400003)(4326008)(81166007)(40460700003)(2906002)(356005)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 15:36:05.4759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7fa645-c92c-4aa2-13e7-08da699c64f6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2540
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix error flow:
- Clean-up client object in case of probing failure.
- Prevent running remove routine in case of probing failure.
  Probing and removing are invoked by hotplug events raised upon line
  card insertion and removing. If probing procedure failed all data is
  cleared and there is nothing to do in remove routine.

Fixes: 62f9529b8d5c ("platform/mellanox: mlxreg-lc: Add initial support for Nvidia line card devices")
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlxreg-lc.c | 82 ++++++++++++++++++++-------
 1 file changed, 63 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-lc.c b/drivers/platform/mellanox/mlxreg-lc.c
index c897a2f15840..55834ccb4ac7 100644
--- a/drivers/platform/mellanox/mlxreg-lc.c
+++ b/drivers/platform/mellanox/mlxreg-lc.c
@@ -716,8 +716,12 @@ mlxreg_lc_config_init(struct mlxreg_lc *mlxreg_lc, void *regmap,
 	switch (regval) {
 	case MLXREG_LC_SN4800_C16:
 		err = mlxreg_lc_sn4800_c16_config_init(mlxreg_lc, regmap, data);
-		if (err)
+		if (err) {
+			dev_err(dev, "Failed to config client %s at bus %d at addr 0x%02x\n",
+				data->hpdev.brdinfo->type, data->hpdev.nr,
+				data->hpdev.brdinfo->addr);
 			return err;
+		}
 		break;
 	default:
 		return -ENODEV;
@@ -730,8 +734,11 @@ mlxreg_lc_config_init(struct mlxreg_lc *mlxreg_lc, void *regmap,
 	mlxreg_lc->mux = platform_device_register_resndata(dev, "i2c-mux-mlxcpld", data->hpdev.nr,
 							   NULL, 0, mlxreg_lc->mux_data,
 							   sizeof(*mlxreg_lc->mux_data));
-	if (IS_ERR(mlxreg_lc->mux))
+	if (IS_ERR(mlxreg_lc->mux)) {
+		dev_err(dev, "Failed to create mux infra for client %s at bus %d at addr 0x%02x\n",
+			data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo->addr);
 		return PTR_ERR(mlxreg_lc->mux);
+	}
 
 	/* Register IO access driver. */
 	if (mlxreg_lc->io_data) {
@@ -740,6 +747,9 @@ mlxreg_lc_config_init(struct mlxreg_lc *mlxreg_lc, void *regmap,
 		platform_device_register_resndata(dev, "mlxreg-io", data->hpdev.nr, NULL, 0,
 						  mlxreg_lc->io_data, sizeof(*mlxreg_lc->io_data));
 		if (IS_ERR(mlxreg_lc->io_regs)) {
+			dev_err(dev, "Failed to create regio for client %s at bus %d at addr 0x%02x\n",
+				data->hpdev.brdinfo->type, data->hpdev.nr,
+				data->hpdev.brdinfo->addr);
 			err = PTR_ERR(mlxreg_lc->io_regs);
 			goto fail_register_io;
 		}
@@ -753,6 +763,9 @@ mlxreg_lc_config_init(struct mlxreg_lc *mlxreg_lc, void *regmap,
 						  mlxreg_lc->led_data,
 						  sizeof(*mlxreg_lc->led_data));
 		if (IS_ERR(mlxreg_lc->led)) {
+			dev_err(dev, "Failed to create LED objects for client %s at bus %d at addr 0x%02x\n",
+				data->hpdev.brdinfo->type, data->hpdev.nr,
+				data->hpdev.brdinfo->addr);
 			err = PTR_ERR(mlxreg_lc->led);
 			goto fail_register_led;
 		}
@@ -809,7 +822,8 @@ static int mlxreg_lc_probe(struct platform_device *pdev)
 	if (!data->hpdev.adapter) {
 		dev_err(&pdev->dev, "Failed to get adapter for bus %d\n",
 			data->hpdev.nr);
-		return -EFAULT;
+		err = -EFAULT;
+		goto i2c_get_adapter_fail;
 	}
 
 	/* Create device at the top of line card I2C tree.*/
@@ -818,32 +832,40 @@ static int mlxreg_lc_probe(struct platform_device *pdev)
 	if (IS_ERR(data->hpdev.client)) {
 		dev_err(&pdev->dev, "Failed to create client %s at bus %d at addr 0x%02x\n",
 			data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo->addr);
-
-		i2c_put_adapter(data->hpdev.adapter);
-		data->hpdev.adapter = NULL;
-		return PTR_ERR(data->hpdev.client);
+		err = PTR_ERR(data->hpdev.client);
+		goto i2c_new_device_fail;
 	}
 
 	regmap = devm_regmap_init_i2c(data->hpdev.client,
 				      &mlxreg_lc_regmap_conf);
 	if (IS_ERR(regmap)) {
+		dev_err(&pdev->dev, "Failed to create regmap for client %s at bus %d at addr 0x%02x\n",
+			data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo->addr);
 		err = PTR_ERR(regmap);
-		goto mlxreg_lc_probe_fail;
+		goto devm_regmap_init_i2c_fail;
 	}
 
 	/* Set default registers. */
 	for (i = 0; i < mlxreg_lc_regmap_conf.num_reg_defaults; i++) {
 		err = regmap_write(regmap, mlxreg_lc_regmap_default[i].reg,
 				   mlxreg_lc_regmap_default[i].def);
-		if (err)
-			goto mlxreg_lc_probe_fail;
+		if (err) {
+			dev_err(&pdev->dev, "Failed to set default regmap %d for client %s at bus %d at addr 0x%02x\n",
+				i, data->hpdev.brdinfo->type, data->hpdev.nr,
+				data->hpdev.brdinfo->addr);
+			goto regmap_write_fail;
+		}
 	}
 
 	/* Sync registers with hardware. */
 	regcache_mark_dirty(regmap);
 	err = regcache_sync(regmap);
-	if (err)
-		goto mlxreg_lc_probe_fail;
+	if (err) {
+		dev_err(&pdev->dev, "Failed to sync regmap for client %s at bus %d at addr 0x%02x\n",
+			data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo->addr);
+		err = PTR_ERR(regmap);
+		goto regcache_sync_fail;
+	}
 
 	par_pdata = data->hpdev.brdinfo->platform_data;
 	mlxreg_lc->par_regmap = par_pdata->regmap;
@@ -854,12 +876,27 @@ static int mlxreg_lc_probe(struct platform_device *pdev)
 	/* Configure line card. */
 	err = mlxreg_lc_config_init(mlxreg_lc, regmap, data);
 	if (err)
-		goto mlxreg_lc_probe_fail;
+		goto mlxreg_lc_config_init_fail;
 
 	return err;
 
-mlxreg_lc_probe_fail:
+mlxreg_lc_config_init_fail:
+regcache_sync_fail:
+regmap_write_fail:
+devm_regmap_init_i2c_fail:
+	if (data->hpdev.client) {
+		i2c_unregister_device(data->hpdev.client);
+		data->hpdev.client = NULL;
+	}
+i2c_new_device_fail:
 	i2c_put_adapter(data->hpdev.adapter);
+	data->hpdev.adapter = NULL;
+i2c_get_adapter_fail:
+	/* Clear event notification callback and handle. */
+	if (data->notifier) {
+		data->notifier->user_handler = NULL;
+		data->notifier->handle = NULL;
+	}
 	return err;
 }
 
@@ -868,11 +905,18 @@ static int mlxreg_lc_remove(struct platform_device *pdev)
 	struct mlxreg_core_data *data = dev_get_platdata(&pdev->dev);
 	struct mlxreg_lc *mlxreg_lc = platform_get_drvdata(pdev);
 
-	/* Clear event notification callback. */
-	if (data->notifier) {
-		data->notifier->user_handler = NULL;
-		data->notifier->handle = NULL;
-	}
+	/*
+	 * Probing and removing are invoked by hotplug events raised upon line card insertion and
+	 * removing. If probing procedure fails all data is cleared. However, hotplug event still
+	 * will be raised on line card removing and activate removing procedure. In this case there
+	 * is nothing to remove.
+	 */
+	if (!data->notifier || !data->notifier->handle)
+		return 0;
+
+	/* Clear event notification callback and handle. */
+	data->notifier->user_handler = NULL;
+	data->notifier->handle = NULL;
 
 	/* Destroy static I2C device feeding by main power. */
 	mlxreg_lc_destroy_static_devices(mlxreg_lc, mlxreg_lc->main_devs,
-- 
2.20.1

