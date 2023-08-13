Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A17C001B0
	for <platform-driver-x86@archiver.kernel.org>; Sun, 13 Aug 2023 08:38:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjHMIiL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 13 Aug 2023 04:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjHMIiK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Aug 2023 04:38:10 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2697E1701
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Aug 2023 01:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RnUaDLl8PdHcpfdInhE+P/6+v06PLt+DAC6t0ioSMTqWXG6eIiK1P0HGDmrWvUdBUofdBUDuif5QVEwE8MUzIuL02He82f/ekE07OVIg6/30czSlQSxyrYg1Zn8OOJCFYXAV4vD9ZV2ZTGgbsNzOYt27fC40Io/pYNPIBAzgBxuAoIwCCNtPWbCWKXBLSCe8BrvLpo1lMGuBQYE97dBr4SIPV2TjAb57tTkH1WWzsGSlIBxC4QVDA+U/kcd8FQg+7PoWwsHGKReNrsvOXhyvqikxezldcPv6H3ac+KvizveI3z8jmoLqWVn9kSh1R22CeWW/DmjVFiTmmBychgweVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oFHW88u+kA7dpFjxjZDVkyTRivsqVKfJ8hHmPWTdRY=;
 b=aXzVPMFdWip2bIdOGFKSbZkxzl62iRJ7oQ3aNtC526e0xQP76FkJ52tcY7sX7W0GZCM1M3pZC3rYOKCnZeuwGsD1fwidD78afC3FyMor81KoJ1g8/kPHFtP/b5p2UoXyrUDUAlZ8iKT2MUfrQTqe23HXC8zCKbxIcEI/HYdnMOStNgLqKxHeEBcnM4Y/lTpoHhlS+6Gi+PELK3RbLeEGSrUXXCqE96YoYygNsSewxmthvMX6t35v3NuV0YwIqOgLT7TtJEuJ/7ZNNxYf4ZMhQ1odsrzW/tyx5fz0JymuJ87uf/8tYcuA0Hb/T51FzgE9uGZ1+x74xPyD4Qt5VB1Wvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oFHW88u+kA7dpFjxjZDVkyTRivsqVKfJ8hHmPWTdRY=;
 b=G77btGk6MlpbblsenBxo3QJuk3CqwhHbVgzg9USrczXQWE096fiGH7gezMxJOt1JeGA8a83byauIvF3eAfh0VWZgZg2Fx+viD1l+ZKKIyM5C6lGIaRDRDamHredyDlk0/0psxGxkg4YuSZt5qSibr+3iJV71q40w+VqyKxrphC+uKjmFww6CcE4rK9802jS4ql9mQpQm1CXjOAwy+5S24XkkdwyBil+7+v/jDfhOGqIBTyrXb3MyWYkAiiIUfMmoT0KpUl/3wDAd/0xPc9J5th4W/dScF0igOILRYP8F9ViK/6NVFQJYvJKoAxtPTcAr8NkmamPwE/S4Yg+eBUYucg==
Received: from BYAPR04CA0021.namprd04.prod.outlook.com (2603:10b6:a03:40::34)
 by DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.23; Sun, 13 Aug
 2023 08:38:09 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:40:cafe::f) by BYAPR04CA0021.outlook.office365.com
 (2603:10b6:a03:40::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Sun, 13 Aug 2023 08:38:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Sun, 13 Aug 2023 08:38:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Sun, 13 Aug 2023
 01:37:58 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Sun, 13 Aug 2023 01:37:57 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform 1/4] platform: mellanox: Fix order in exit flow
Date:   Sun, 13 Aug 2023 08:37:32 +0000
Message-ID: <20230813083735.39090-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230813083735.39090-1-vadimp@nvidia.com>
References: <20230813083735.39090-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|DS0PR12MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: a362bba7-de56-4bef-7e3f-08db9bd89ef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qkuMpC8jYmRqrU9/LDlsN9MYIjghhtnt+oa+xraF7UUBDu6sQyCiGPWqAYDu72UtMwbB9SCBszNgwFs0pRULamgOYiTZuNzgddsdk//Y7XBP97THM5XAE0g/t7QVwXByM3hl3triXLgrLl7bklkDRWnEctM7ob6qw68vke1Pqwph5pG27MqVsR2lbJ+gfmmPz2uVeI1OZ2tNUO8rHhyA3EuPE0H2heWwwsmO4ScfXZwJ9bKw2EP3V4BkklCDlBPPrUOEFn1H2T9kQY/HdsaRZ7yY0WAFFjX6Igxjr2noLh0GhuZUVOAWvbQmcMWmXIyK6pGThViBWk+t6r+5j/6cwxoEgkTny/faXXO2q822QQ+S8IQyRSpNEj4iEitxHqzpMDgKqusPnzYUeTqB8M09QTJob/ykVFLguuveKAAMvGwq3+j4Qnou4uDRMWFNOzses/XKo+VxqNvZGQD6SyvkkxlFY1i1bBP4xkEECcrjhq3sJ5G9EwfbhcpyBVfkjYT6XOq++txRJB80FhG9dAYpwylSlOXcSiJ/fIhHdrquB+A99D0EDQzGVvfGeG+qt34QZh4tHoA6/iq/9ajEE8G95ZkIalPwdxbzboHx4Fp7Z+3mCvskcqMEOHIf332cqgxejrq3QPt0NE4f4hj/GXLyizvarD+bEcggB7LgzjOwnrH+fjx1bkacxZl5qcvL5yQsN2iW9SedaxgV9+dPJ61Q0rVsSGGLB3ldXVaiQyuDGHj8NgP6xkrFcrwEDGzzgH5b
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(186006)(82310400008)(451199021)(1800799006)(40470700004)(36840700001)(46966006)(4326008)(8936002)(8676002)(478600001)(82740400003)(36860700001)(70586007)(70206006)(54906003)(6666004)(6916009)(316002)(41300700001)(86362001)(5660300002)(1076003)(16526019)(26005)(2616005)(107886003)(36756003)(426003)(336012)(2906002)(83380400001)(40460700003)(356005)(47076005)(7636003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2023 08:38:08.4315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a362bba7-de56-4bef-7e3f-08db9bd89ef6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6583
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix exit flow order: call mlxplat_post_exit() after
mlxplat_i2c_main_exit() in order to unregister main i2c driver before
to "mlxplat" driver.

Fixes: 0170f616f496 ("platform: mellanox: Split initialization procedure")
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 67367f010139..5fb3348023a7 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -6238,8 +6238,6 @@ static void mlxplat_i2c_mux_topolgy_exit(struct mlxplat_priv *priv)
 		if (priv->pdev_mux[i])
 			platform_device_unregister(priv->pdev_mux[i]);
 	}
-
-	mlxplat_post_exit();
 }
 
 static int mlxplat_i2c_main_complition_notify(void *handle, int id)
@@ -6369,6 +6367,7 @@ static void __exit mlxplat_exit(void)
 		pm_power_off = NULL;
 	mlxplat_pre_exit(priv);
 	mlxplat_i2c_main_exit(priv);
+	mlxplat_post_exit();
 }
 module_exit(mlxplat_exit);
 
-- 
2.20.1

