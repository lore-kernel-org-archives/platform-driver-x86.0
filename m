Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD271C04E69
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 09:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235352AbjHNJCK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 05:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235552AbjHNJBu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 05:01:50 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2043.outbound.protection.outlook.com [40.107.102.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C48E010F
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 02:01:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3FArqBTHEI5gjCOCgUjvAJorthfuETeX0cILuAKwjTjqsMQtM3vqWRXKR2C/LTouL3vhgRE1npzbMTQYbRcDzpZNjVP9Kl+RqjeWThDsqj3TODF0XL8vdftNIkDhKUx4WsaB09n606uomN1l1T4WVbMBnzZqKIRZWVWGliA2SWPeZO2V/YkUjeWUUBWA0qLeGByBwQ4CJKkjo9MAcKUj5i8TAtaCeW5UGa87lCl0qTfwBo/xzMkKhS06L6eH8/53zyhDsh/4m1hfAAmrM1CbRV89fwbmPViueZdNRCoffP9JfFedW2zNyXw1Q49TR3NZAnx2SW2N/8oWeyByANAmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRPRuHKy69xKVC3vvzzbQwo2p99wQlVnTiACdBT3+K0=;
 b=CX6cM3VTMMe5ZnxhFfyeNMDND3bDPP+Y80XHgZKaTwCKKay1iFvRkiDPF+VybC8aDHjG/aJGRIW7O6P4TGUjCpI6LZkKttYmvS+OcNB+E4gJrYRFxWSUoh/9aJiGbqMfEeYVrieAwdEpUZao19ws4WkZ7NygalfEaMwzSjhqz23BNx3whDU2KChgzaC/belF7llVrVvFyklyx/w5wjPCm2DUP3aEbGP67zl7FqNbFgMuN5tzrv4HlqtETHAfTpK6wP46JXp9an1FiarNZU+47XALk1dYJdOBo1SmWw5F62B5OOuSD2QCpYL/E+bmqHGcOmETpk+/hLh52myLx1dvnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRPRuHKy69xKVC3vvzzbQwo2p99wQlVnTiACdBT3+K0=;
 b=q+ytKzpXJhGd6BQJUSyCbBv5S8tPpRonM+L6wNyG6W+PGYYBAkyRnx8rf5tiCPUXUOu88DJtPTQg+SNpLbrvVKTE2fQeKWH2xeqE7Lg7vLRysb3wCLtSGLoin3l9j+VnBCAKvxT0YdEZtCH8RZhd/KNOnTH4oUpdjoWMOyJRaDygaDVnFOdBjd+IlFF5SeRMF39fkutcT9NeZnUFl2MV+Ica5pD1T5+/aN/GfW++BEgjFiKHgKejBr4dSxtUgIGmU9pyp5SawQV/MJGP9LZR5ckepIntWmpjc7xEYeuvJ4pTgTzFCQ/x5vEcsWTSletQiqZ1J8aUssGqf9qaHC0k6A==
Received: from SJ0PR03CA0357.namprd03.prod.outlook.com (2603:10b6:a03:39c::32)
 by DM6PR12MB4482.namprd12.prod.outlook.com (2603:10b6:5:2a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 09:01:27 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::15) by SJ0PR03CA0357.outlook.office365.com
 (2603:10b6:a03:39c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 09:01:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 09:01:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 02:01:11 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 02:01:09 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 07/16] platform: mellanox: mlx-platform: Modify power off callback
Date:   Mon, 14 Aug 2023 08:59:01 +0000
Message-ID: <20230814085910.56069-8-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230814085910.56069-1-vadimp@nvidia.com>
References: <20230814085910.56069-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|DM6PR12MB4482:EE_
X-MS-Office365-Filtering-Correlation-Id: c9faf09c-d3a9-434f-82eb-08db9ca50acd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ckAx9N7CAbd62y4bnwxBZCC70jCtq+xQuS/yxTSY5xIx1A+zRTFG9XZfNWPXcTUUVbUFJOh7l1OqnCVoIOW9VQSMNm5eJtKXldm++Fg6KW7cS0aflnq0Ev+onfv2kxZR0G+ClyPsCYTZ8sIbB6DE/SYNGckJxwubalMjtSWM+5wTvILzt1pj0YdQGM+ZquUcDW/hJRWM6nGvOHizo+Jz+Iq3TFaryd9g/0sOWUmMRt8XVN5JBpvyUQHRZyiqGLaAPs8+g7B3kQ6Mm2Pbi1utahOakkqHPdScTU85l7njYlDXsQQODFQ0WbkvKRUhD+nTKzcmHnpO74bz8K+dmphOFNDC+ndKWFpU8sOO/qN5yhvynEsaBH7+/VJW0LS7iIobKGQUqGaFLqS/p/zRzkY4Lt5YA6yDrRunjEsUBPk66wHAROVmpHKySy4bUilHrS13jIE734iVvnEjDVP0xZwLqHiqtd++O95hS1HDoZlQJkNoB92lIg9Gs0MluV6y5oB1kO42dhKxdtHybKeTCYdRw0YSvYEplhG4zO/Jzc15YVAQ7LKn8qAPfx3rJOsoXVBfgsCHTvdV8zqkLNNaCLZR85NqMiq2lB3QwIGlUzS3ZjN/bhs1MOB8uyhKT3OFCRChQWaGydNL3O4CCO/oRNYObpBI6EJuYc8GIHizqnx6hEixdsohp1JU8+tzaAMgaWp7tK/SKsm3Syemu8xy6rHL8HCcLBAnFdJdH71HYo6C0KbHh23t0Ybm3P3M8pMAiYF
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(82310400008)(451199021)(1800799006)(186006)(46966006)(40470700004)(36840700001)(40480700001)(54906003)(6666004)(40460700003)(478600001)(7636003)(356005)(82740400003)(5660300002)(2906002)(36756003)(4744005)(86362001)(6916009)(4326008)(70586007)(70206006)(41300700001)(8936002)(336012)(8676002)(316002)(16526019)(107886003)(1076003)(26005)(36860700001)(47076005)(2616005)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 09:01:26.6896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9faf09c-d3a9-434f-82eb-08db9ca50acd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4482
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Extend platform power off callback with kernel_halt() call.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index dce35934cc37..a505f619f337 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -5539,6 +5539,7 @@ static void mlxplat_poweroff(void)
 	struct mlxplat_priv *priv = platform_get_drvdata(mlxplat_dev);
 
 	regmap_write(priv->regmap, MLXPLAT_CPLD_LPC_REG_GP1_OFFSET, MLXPLAT_CPLD_HALT_MASK);
+	kernel_halt();
 }
 
 static int __init mlxplat_dmi_default_matched(const struct dmi_system_id *dmi)
-- 
2.20.1

