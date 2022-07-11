Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05BFACCA47B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 08:48:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbiGKIs1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 04:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbiGKIsT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 04:48:19 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB9613DCB
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 01:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEm7C5kxARdSipYLzV2aFxay0RZYncgv0ztGGEJ/IVhvOVPK3WG39ZGa/9vYsAqYolmZoRvOPRi+7C9Kf+tE3NY/ds0qCds+iedo2xs+GHOosRi4N0qaw1tSwCoeE2SB0vSDWc1nGrtl/96PEkPCmyW4Vz1A5DIdrdvJEqIeq18918KMlrbvsmMzwGSj/aN8irsLept6Y+zduOvkGBHH0KACg2TaSiaW68qBV+gz48ZAK5y/LG4tLRcL1WlHVhtINlKNltAnfd4WYau7eXH2spmDbrSyABZRPQH7CnKX677x44jpHLe5O7y//qwFo3NJHE6pFeZO2IbCsk5YbrQt4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6QieKwO8ffZyB42x7wkIjcGCZ1CIuzAJuve1kcw54g=;
 b=AUlkfxukvg04QdJga79J1VtQiK+0bstTpIkBf9Yrb1FQLSd4Z8HvqbNvGrVYAdpjio8Sk4ls9d2j/vD+/ScK5gu+jErrw3YS1Y4mu4oc4bPT+SmYkAd8FqhwvOPT6jnuju4Q9y69zzkEt7eIsuECL/lKBCqY8PzZB1MCqh1kr430vKEtREB9j4GMaoC9WE/Iy47JnYq08lSd2VJCsFlMbRktg5Ui9Ty9HkNdO8bINtBfVznnb0004Q6md4K3Fh2vVUqKmykIaQIffzQ2iNIFlK0oPGsw0D4zPAHasnBSOjEA2CCA+yzgN2HfoGh410y5vrL4aNvZSpWgJ5ZY5Obing==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6QieKwO8ffZyB42x7wkIjcGCZ1CIuzAJuve1kcw54g=;
 b=o7tZyd72fRmhEiUZAQbLlIj8mi3uUpsJLgKvj69T+YhYgAvn/nX8PGurv+cdkhp4WLJLvdruC3mg3BSoScvsr17d0uzjY5P3Uj6qPdgHjZthxO2CVOx4ukBttsRfrOjjWbLiZTuJswXmKfP6HB0yD6HpHvklgt/Wu1wqDpM3iUUjAeNZg1Ee+pC0kivIRyoNB21kADGx76iylOzSoOHGSVNJkW/9ds+d+TvdYIzeu4icW5SxMZdzhCNsLoZYXItaGT22vO2lVtzNyyAE0JDzAenT/d1eU3epE9oxKyOPpNMaHUFgO2ffVHjiYmxTEuxuFuudUPiXENFg4oCPTVcvZg==
Received: from MW4PR03CA0046.namprd03.prod.outlook.com (2603:10b6:303:8e::21)
 by SA0PR12MB4511.namprd12.prod.outlook.com (2603:10b6:806:95::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Mon, 11 Jul
 2022 08:47:59 +0000
Received: from CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::52) by MW4PR03CA0046.outlook.office365.com
 (2603:10b6:303:8e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20 via Frontend
 Transport; Mon, 11 Jul 2022 08:47:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT028.mail.protection.outlook.com (10.13.175.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Mon, 11 Jul 2022 08:47:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Mon, 11 Jul
 2022 08:47:58 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Mon, 11 Jul 2022 01:47:57 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 7/9] platform/mellanox: mlxreg-io: Add locking for io operations
Date:   Mon, 11 Jul 2022 11:45:57 +0300
Message-ID: <20220711084559.62447-8-vadimp@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4a33e783-85e0-4daa-b8ad-08da631a0eb2
X-MS-TrafficTypeDiagnostic: SA0PR12MB4511:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ALvsMQMWrJHU8wBhHE6f/iRp/s7riOq3NUygM5SFc2olF2hfGsdmSXhpWgiFr/flmKnjx3+Ca8u/5MTRnQheA+MIMSHCPeM2gh2GUbBheuZxjVjA6tv1FS5Y+TXYMgWbdjQ8hwrDOLGrwJ27eUSlBaC5B8bmTKLz2Bz1Xz0QtyNvHb76tEFxzQVQjztfd274Uv/2+uYIXCV7UvyRX/lPVEkI7ZE2DL8FNs/wYmOeAy8be/ETAL+sk99EocXJhDxnXVZn7+28HvWBLRYeYXkNxwXzhVJvj13KtBgFT+K+R8c/HZjSE5fW6wT/72rUJF6yOwJnxvrHAE8nCsohRFr84y4RYWZBHgFQeNMy5jVWYSnIo/fkXPL+JBOYzOZLKtju/37IJCrsVBG0fRXzh7Y3or8lRS8B6c9LQ8cmPdr8CO2+HQyslgPmkvk/itLfAaGFJbVP8Cf/8NbNHXYH6XxrYRPh+dOrNiYLPzfwcAUs67llBPolmQ1lThTAl3X03SB/5BUp6u2B+2AthMQpvGNp2U8j6h/1r1RJQfIPNMWaynk65wgbLGeR3Rte5plt8ss2oVWLaf7PAqYsdec2+vVd5hzikSSeVM6wf/XuqmQ5m3u1MMSOweabjmyWJAsfrCPJjmB7+ZP8vczWOIoTD+eGXx5UXowuwwooc4F67nReVBXrfB5coUJFPeATsYzW4yBvFQ7hNHa0+qcuyxgioTz/7v4M7g3gbjXSBUOopPOCtVRIapSBZrZcEG5sMfjpPqB8vASIumMRyai0g+6vHcfrUl2owoTXt1cAtIUd+SaODe8Bbnz/4ytAvcMMMp6xyvQhNWsFRgTFFNZ6pe9k8fx0n6GfhlmbCgAdibmpnfhy/gA=
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966006)(40470700004)(36840700001)(83380400001)(81166007)(1076003)(86362001)(316002)(2906002)(82310400005)(82740400003)(356005)(40480700001)(36756003)(70586007)(5660300002)(426003)(41300700001)(8936002)(54906003)(478600001)(36860700001)(8676002)(26005)(70206006)(336012)(47076005)(6916009)(4326008)(2616005)(107886003)(186003)(40460700003)(16526019)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 08:47:59.1989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a33e783-85e0-4daa-b8ad-08da631a0eb2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4511
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add lock to protect user read/write access to the registers.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlxreg-io.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/platform/mellanox/mlxreg-io.c b/drivers/platform/mellanox/mlxreg-io.c
index 2c2686d5c2fc..ddc08abf398c 100644
--- a/drivers/platform/mellanox/mlxreg-io.c
+++ b/drivers/platform/mellanox/mlxreg-io.c
@@ -31,6 +31,7 @@
  * @group: sysfs attribute group;
  * @groups: list of sysfs attribute group for hwmon registration;
  * @regsize: size of a register value;
+ * @io_lock: user access locking;
  */
 struct mlxreg_io_priv_data {
 	struct platform_device *pdev;
@@ -41,6 +42,7 @@ struct mlxreg_io_priv_data {
 	struct attribute_group group;
 	const struct attribute_group *groups[2];
 	int regsize;
+	struct mutex io_lock; /* Protects user access. */
 };
 
 static int
@@ -116,14 +118,19 @@ mlxreg_io_attr_show(struct device *dev, struct device_attribute *attr,
 	u32 regval = 0;
 	int ret;
 
+	mutex_lock(&priv->io_lock);
+
 	ret = mlxreg_io_get_reg(priv->pdata->regmap, data, 0, true,
 				priv->regsize, &regval);
 	if (ret)
 		goto access_error;
 
+	mutex_unlock(&priv->io_lock);
+
 	return sprintf(buf, "%u\n", regval);
 
 access_error:
+	mutex_unlock(&priv->io_lock);
 	return ret;
 }
 
@@ -145,6 +152,8 @@ mlxreg_io_attr_store(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		return ret;
 
+	mutex_lock(&priv->io_lock);
+
 	ret = mlxreg_io_get_reg(priv->pdata->regmap, data, input_val, false,
 				priv->regsize, &regval);
 	if (ret)
@@ -154,9 +163,12 @@ mlxreg_io_attr_store(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		goto access_error;
 
+	mutex_unlock(&priv->io_lock);
+
 	return len;
 
 access_error:
+	mutex_unlock(&priv->io_lock);
 	dev_err(&priv->pdev->dev, "Bus access error\n");
 	return ret;
 }
@@ -246,16 +258,27 @@ static int mlxreg_io_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->hwmon);
 	}
 
+	mutex_init(&priv->io_lock);
 	dev_set_drvdata(&pdev->dev, priv);
 
 	return 0;
 }
 
+static int mlxreg_io_remove(struct platform_device *pdev)
+{
+	struct mlxreg_io_priv_data *priv = dev_get_drvdata(&pdev->dev);
+
+	mutex_destroy(&priv->io_lock);
+
+	return 0;
+}
+
 static struct platform_driver mlxreg_io_driver = {
 	.driver = {
 	    .name = "mlxreg-io",
 	},
 	.probe = mlxreg_io_probe,
+	.remove = mlxreg_io_remove,
 };
 
 module_platform_driver(mlxreg_io_driver);
-- 
2.20.1

