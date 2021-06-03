Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37777C47082
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Jun 2021 17:28:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12AA961359
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Jun 2021 17:28:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbhFCRal (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Jun 2021 13:30:41 -0400
Received: from mail-dm6nam11on2064.outbound.protection.outlook.com ([40.107.223.64]:12921
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229789AbhFCRal (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Jun 2021 13:30:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQZJM2wqGv7QVFJjq4vjEX0fMmvXzG5v/aB2SfURKYVdO46ddM1yOR3Z4bK6tPqU/1lfqEzaxZ61Gv5NXCqUVRekuEOjZ3S0nf4KHyNx6MBcqdpbMJ3jmQSrOXlzrrjJGZM4l0kQQaplGGH1JMvs0H1Iz/B9T2iwzKIuNIWiBVz/pSJTwSz7hKOUjIYqbE9A0TxT3Z59vjyY6eGnYEnzyPxOaHAjD8rsqLCkRY1sdtZvOV+Pib2GyMgoKI6V38TZSyz3UkbMxlzeNGc0MG50LDhU5lL2eyt4ALIUwddj2Tt8UJcvyAHRwVfHECQ62bTMkBj0JcDsBvSelg8oLgx90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aML/nMZrIqqqnYVc6pkwPgoFF1Lj96P3wVojpjLBiz4=;
 b=EXLc/PZ+nq0L/P4XwNiZDZ/bgP/qnM5FfEhhjEJSXO+ahchhzxjevc+qSRPs0Ap1Ji2OUWr/hI/PIls0uWFRUTo/wn5Qyft4yb0BWKoWvCg7NRVJXxshSKhVaccXy9EWD++FiCAqDTjzwxkTzhTkHpOk/wJj7Q6N3clvGJoGtHjg7EorQWyHpfycZ6D+yjvGvxtN5WzrJ15ufodSlUgHLjKC7NL8C8F/4nE9Vss4+lmLAlS131z3dH+CtbopkiXAf9+AK1Qg+4zHCctcZwZb6j22raW0ApD7zfvQ+ei4WhykER9IBP24nmTebT9LQQJyid75sSVUgnw7m8ovgk8Ajw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aML/nMZrIqqqnYVc6pkwPgoFF1Lj96P3wVojpjLBiz4=;
 b=DJXNHhkIk25nbwt7m73/DO1KG+Ntx8Bwr+D1O7iQlRUg3CwaEStft0Qu+hJQ3SSQjpLxxvxJDAJ7JcjuLbDMRQYz++YtBFdxWV/hlNq3ie29m0Ffwt1wlt9/JANDGL2JIH5cYViK7uH4wIb4VwEkAaCIoydZHR7/fxYc/6dEBaARbnD8RLi1+NJ2yD0nsYNXHzqSrYtdpi0P0FDban2lUeSVAgd3Ic8QkfbZ0TaUClqJHwVbKMCG2gDHZi2zuCjJUcI0RHPJDx5r1Yj1aVucdt5bb3Nhaiskmk+9m/7gZgTK9hX2yga58uKTJ3mlzgLe+P8trP3ivyB0fJeGR7Ta4g==
Received: from DM5PR19CA0050.namprd19.prod.outlook.com (2603:10b6:3:116::12)
 by MN2PR12MB4456.namprd12.prod.outlook.com (2603:10b6:208:266::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Thu, 3 Jun
 2021 17:28:55 +0000
Received: from DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:116:cafe::ee) by DM5PR19CA0050.outlook.office365.com
 (2603:10b6:3:116::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Thu, 3 Jun 2021 17:28:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT036.mail.protection.outlook.com (10.13.172.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4195.22 via Frontend Transport; Thu, 3 Jun 2021 17:28:54 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.5) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Jun 2021 17:28:53 +0000
From:   Mykola Kostenok <c_mykolak@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>, <vadimp@nvidia.com>,
        "Mykola Kostenok" <c_mykolak@nvidia.com>
Subject: [PATCH platform] Revert "platform/mellanox: mlxreg-hotplug: move to use request_irq by IRQF_NO_AUTOEN flag"
Date:   Thu, 3 Jun 2021 20:28:27 +0300
Message-ID: <20210603172827.2599908-1-c_mykolak@nvidia.com>
X-Mailer: git-send-email 2.8.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1104a452-044c-496b-536f-08d926b51010
X-MS-TrafficTypeDiagnostic: MN2PR12MB4456:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4456FB297833951AD3A13CACE23C9@MN2PR12MB4456.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:118;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lY2/FfJ05KoiZ4ZoZXpFHZXAL5j4TaLfRI3X5UA9jC/HvsksidWX3V2NEzpPgueOeo/ICEmkiETT521O2wUABkB6SSEj/EJ7QShRKja1tYgDsonCpb/HeFqbOmJX0LwfQTayvgQkc//AazCq/v+58E5FXTtgOH5unh2z5mlsPEzbLdQmtzNVQephYVwlg86fRdcIQ+3gvY7UjnAVSACLr68MQA/1qacwFBnINculG72q3B/34IWFns2/d8Ov7q7pE7VV8M5AfLB6C0BZPvz5fm06PnNiNkiT5PFdUtR7AjLehYpjfYgVUX+P6Fuagj7v00gB+Dg0eV+VikUIOWoqDnRfA7XC9jLnuIzjmUYWxOuW3BPnttODgzmafLZpCrZ5cD4HjZLZJgONo5iX8UsVARaG6Q03cLujvawPt3BAGtm+QLn2zAb+tUhlRLM+cMbHAEc+f8p9Sgx/06OnnICW0E5gttKksJyHtjNGOcxz4QsF9IM/vgP1jznLHXjHSTesweFmMlD1zc3VY25WLuyV8B4DBrIGg88DBKUog86W+En4Nz1atISJz7x4UMBJ7tdFrLSqEnT6UHCvl79WQWcl55HEndFpF+4+j0rgauHyFHJ/RV9KXMmjI9N5MF8khHDt2/+28KfIHvhM/7/I3IzKM1lBu42TlKy5NSK9hXfk76o=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(46966006)(36840700001)(426003)(86362001)(70206006)(54906003)(6916009)(7636003)(70586007)(8676002)(36906005)(2906002)(8936002)(316002)(356005)(478600001)(26005)(36756003)(5660300002)(36860700001)(2616005)(47076005)(6666004)(4326008)(107886003)(82310400003)(82740400003)(16526019)(186003)(336012)(1076003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 17:28:54.9079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1104a452-044c-496b-536f-08d926b51010
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4456
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

It causes mlxreg-hotplug probing failure: request_threaded_irq()
 returns -EINVAL due to true value of condition:
((irqflags & IRQF_SHARED) && (irqflags & IRQF_NO_AUTOEN))
after flag "IRQF_NO_AUTOEN" has been added to:
	err = devm_request_irq(&pdev->dev, priv->irq,
			       mlxreg_hotplug_irq_handler, IRQF_TRIGGER_FALLING
			       | IRQF_SHARED | IRQF_NO_AUTOEN,
			       "mlxreg-hotplug", priv);

This reverts commit bee3ecfed0fc9ad104722c501aac1e892b53d1e3.

Signed-off-by: Mykola Kostenok <c_mykolak@nvidia.com>
Acked-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index a9db2f32658f..b013445147dd 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -683,13 +683,13 @@ static int mlxreg_hotplug_probe(struct platform_device *pdev)
 
 	err = devm_request_irq(&pdev->dev, priv->irq,
 			       mlxreg_hotplug_irq_handler, IRQF_TRIGGER_FALLING
-			       | IRQF_SHARED | IRQF_NO_AUTOEN,
-			       "mlxreg-hotplug", priv);
+			       | IRQF_SHARED, "mlxreg-hotplug", priv);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to request irq: %d\n", err);
 		return err;
 	}
 
+	disable_irq(priv->irq);
 	spin_lock_init(&priv->lock);
 	INIT_DELAYED_WORK(&priv->dwork_irq, mlxreg_hotplug_work_handler);
 	dev_set_drvdata(&pdev->dev, priv);
-- 
2.20.1

