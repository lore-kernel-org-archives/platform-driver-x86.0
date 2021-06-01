Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBABC47080
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Jun 2021 11:22:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 740426124B
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Jun 2021 11:22:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232084AbhFALYO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Jun 2021 07:24:14 -0400
Received: from mail-dm3nam07on2061.outbound.protection.outlook.com ([40.107.95.61]:43488
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230308AbhFALYN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Jun 2021 07:24:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMKhL+1LVNfO2uC3SdJFq0xpmUDsRa+zCMLaMgLJG0rsdSaFLYhQMNrW8ZO00GavzZ+NwPOjd6ER4UYzqUY0J2hDdJ0kZk+XCJhBzRxliyttRdhrEUH+oa8SzRDW5I07e0crWOu09t4RqnBg9nkkUGkYCWXCFv0+8jN03Ztrp8Otzg8C0yC2xJuSvL8lV6/M4NCfRqHgqQw5q+jmuMx+syA+YltmckO0yb5w3hvuIRjO4JVHrUHU0Y9YPUp1/M5GbAc1BEAFL22KvYPiWB+DLWnfzwZXVLyryFhz3c2Vj8MJ3cIDTt60aXeQeHiYtB3uqnjItkfcteGX8TUiUBPlpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ma0ZlVFJ9bY+Qx91eZlFFfZTML8piZTnCCWxkNrVaxo=;
 b=iqpPUsquF2food14ZfZTjHiWYbuLZSMGoJFbR41xaXYycPvessYrTnPd6XXOpDqcEn/VWo5wNo1iC2ocYWwyTePc02ZEA7rgrngU7nEyLV8AO+pxoWNgPdDWmnNSiGSAjIud3ea2BfZnNbCl7+YbMQxYPS4Q/lu2GJ8+3YZL21gCMX/oUCEeu6VQiLG/1SqXL9vAxCO+GmECZ0HLGL18MPoTtVTJ1OOR8Wpg7A+xnBLRNRJdXyv1UHOloIh0jg48KrnDSfxiRUgkTaQ++rcFwBAgKdVtvF+fiyQQkzX8eweQwvximd693mmL9Mznx930DzJdAA0JIWCjyEFAeuxh6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ma0ZlVFJ9bY+Qx91eZlFFfZTML8piZTnCCWxkNrVaxo=;
 b=MJyTyr8r47QqHpgsgQzC6RLnm1TPbTFNHV3X0MSfNLmJFnQqSRxToq1j2ryO+WxvOXwCWqvS2MrxyaRj0fjpZ8DGa3y7ojc8rMM4/MgnbFGXqXh03gJitqW+JKiuqLubMYi6t22jWlEmlgAoEgBlAQVEOANFv6gUoQxkqkveAIhfeP8gMZl5Hcl9KDd5kbyo1mNMTkvYWLqeBNsGeWo5sWjKZGinS24EqiJzPrrhXe4QirOy3G0SUAq8FPNSKPboBW6pWQ7ltw6ygHlz79H92Aq0NO8C9QsZk4Z3SGV7iSQ+ogg6m3bgmPWrsYklCthICQC1p8ayDG6s8rwYmG9icw==
Received: from DM5PR06CA0025.namprd06.prod.outlook.com (2603:10b6:3:5d::11) by
 BY5PR12MB4164.namprd12.prod.outlook.com (2603:10b6:a03:207::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Tue, 1 Jun
 2021 11:22:31 +0000
Received: from DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:5d:cafe::f6) by DM5PR06CA0025.outlook.office365.com
 (2603:10b6:3:5d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Tue, 1 Jun 2021 11:22:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT036.mail.protection.outlook.com (10.13.172.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4150.30 via Frontend Transport; Tue, 1 Jun 2021 11:22:31 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.5) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Jun 2021 11:22:29 +0000
From:   Mykola Kostenok <c_mykolak@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Mykola Kostenok <c_mykolak@nvidia.com>
Subject: [PATCH platform] platform/mellanox: mlxreg-hotplug: remove IRQF_NO_AUTOEN flag from request_irq
Date:   Tue, 1 Jun 2021 14:17:44 +0300
Message-ID: <20210601111744.2247071-1-c_mykolak@nvidia.com>
X-Mailer: git-send-email 2.8.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24c4f00a-f5b5-4bfb-2880-08d924ef8bf9
X-MS-TrafficTypeDiagnostic: BY5PR12MB4164:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4164A3A3EEC7E29BF2AA19CDE23E9@BY5PR12MB4164.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3T0rSwqbsIAtp89eJUbjz+XlPHN68y1XRjVwYQuOtIfV9jrhF/XUdajSND1so3Gh1/A665IwRTg2sumIwyUHMBiRVJObmYC30IsUHVoXInTkO/8NuBeCCxLbAGk5KDrnAqxzEFvmaPbcP6fRhN3urfoAlAMpGUT5ksJiJcoChGfLX1CmQ+l0ov82hAyzQ0g0gRkULrp4TMA0z0Q6FKU4CkoE7A44RpPGlSgKPX5mRRTq6IG+Ka82HBBtKrnsRuj3w1SQ1op9O55paRxlFgYyffYhUEYYIxXxsi9XIxnI2U9583a7+XauFKBcMpiPp7Zxf8lDzSz6YiiHlJnDYKSogez/SKFilfUuueGs2tHAYL5vjw++QBcvIUWu7pHl9wX0KCwMTzwSSETU3QSdIlnQuwT63tTALYNunUk3f65ZldFYDtvCPrAJNXAZACGkTcaCzMwW6/HZ1qvNRuNQ2lIFI/paLmxq5UgY3GKWsNYRXX3VxhgCgygIjqL1iUvSTiLmMIUqUDyoEpb2wcCthiE4JeJ4eiuHydNE3bihbvCr8MBii+C2WEKMiq11UUdi9Lmj8fhaDDC9B+jvrlm7yRZ6OZX9mcZYMuUJjiNskNxVQDNT9Coo/GjC+DetW7kWdqArgNvbXzw2pDcLvFwntZbPIk220GChbIJ+No8lK6EWgX4=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(46966006)(36840700001)(7636003)(6666004)(83380400001)(4326008)(36860700001)(86362001)(26005)(478600001)(47076005)(8676002)(8936002)(36756003)(36906005)(5660300002)(2906002)(426003)(82740400003)(186003)(16526019)(70206006)(316002)(336012)(107886003)(2616005)(1076003)(54906003)(356005)(70586007)(82310400003)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 11:22:31.2422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c4f00a-f5b5-4bfb-2880-08d924ef8bf9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4164
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This flag causes mlxreg-hotplug probing failure after flag "IRQF_NO_AUTOEN"
has been added to:
	err = devm_request_irq(&pdev->dev, priv->irq,
			       mlxreg_hotplug_irq_handler, IRQF_TRIGGER_FALLING
			       | IRQF_SHARED | IRQF_NO_AUTOEN,
			       "mlxreg-hotplug", priv);

This is because request_threaded_irq() returns EINVAL due to true value of
condition:
((irqflags & IRQF_SHARED) && (irqflags & IRQF_NO_AUTOEN))

Fixes: bee3ecfed0fc9 ("platform/mellanox: mlxreg-hotplug: move to use request_irq by IRQF_NO_AUTOEN flag")
Signed-off-by: Mykola Kostenok <c_mykolak@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index a9db2f32658f..07706f0a6d77 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -683,8 +683,7 @@ static int mlxreg_hotplug_probe(struct platform_device *pdev)
 
 	err = devm_request_irq(&pdev->dev, priv->irq,
 			       mlxreg_hotplug_irq_handler, IRQF_TRIGGER_FALLING
-			       | IRQF_SHARED | IRQF_NO_AUTOEN,
-			       "mlxreg-hotplug", priv);
+			       | IRQF_SHARED, "mlxreg-hotplug", priv);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to request irq: %d\n", err);
 		return err;
-- 
2.20.1

