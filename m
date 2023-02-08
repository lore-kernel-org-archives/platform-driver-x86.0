Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F850C05027
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Feb 2023 06:35:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjBHGfy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Feb 2023 01:35:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbjBHGfx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2023 01:35:53 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E944390D
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Feb 2023 22:35:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByCe19J7uXn1n+hKD7I0hSXP1TtZw50xS9zZkpXDLuZwPwzSlzZv7s5Rf7mRESk5TX3aRL/77JYHD5scAwFEtdY124kyxseI/3euVLRv6w3vBGWev8bOOOpBmdNHI7y4M+C3kc2DiPb8YurqBBZcdTwnkLsKyR7sDX5VWNYSMWJKEHRhYewjVs5kxX26sPOd8m5kdV3oQJKxpWVIuHvrvBbrn5K9VC3KTQvXNVIV+BP7LBkbcRVvtFr4zoMf1N9qpV3TWJi4/3SBT98SYgTz1+eNqwxquPQ+Ws296rOIuMWHL06rFbXeN07iYdjn5x25EYwH4uy/p9f38UecpvrZLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKqpsiQeJKRS/eGw+QclsLe7QM1M3O6CiOt6QKxbd+w=;
 b=Cl/oRyWbuU84FL+ck/bwKaavpxdTynJZWswJqspkGZvW0SbMehM+6vK17KBvrKx56R6WnfeaH70SWzY+lxov5iwLRgUUNZ3B2J9wlnxy/O3cxZH4AaF38bfXBEkGld0fDNg7UVvx0Y6W+Z2f5/MblrSP8Pg+Xvn3f0gmjmnMaTp9O1PKzVcJFRiQ4Aw+Kk/HvrAtoc9BA3q/+MZO9uk/wGBggdwp4OtzdTMg64vC1JjB5nILyFLZ97jFHEbhAKCdIwaWIwLL+A5iXqC5BEqA168fgJ55/CnSzAlOzC/DUHCQRcgjbFJChU2O+oT5wu8CZnka68ePWESFd+qqeN56jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKqpsiQeJKRS/eGw+QclsLe7QM1M3O6CiOt6QKxbd+w=;
 b=cOC1CkIZ3v+l/2bv/olbH3msoUIDlwfyIre/2XnUTS+Iqrtvc3wcfxB0KckHvDqc4VUwKcSaCv8L47/icU8tN0YEWQvDaCKNXDaQpMlvHoml15f+K21XxtTMElsnlcGAavJD+a6fDWy7NoNFHmlrVVtIz3o9V3OYZcwohY91JvgyZ1YVSgMajqfDb443HFVRnKxzJ++Pp5o1qHQr4gjD1bFwqMvbLlq4Bi2302TdTnSkpNJZS0O3gkO9duQeZoRCsPC6XiSPrVOt21GDIg9OuQI1vaTLACGpKlhQZa+blDOuksKemi2Asy42GwZq+jtNFkLTZPFCRFQZzdrrfmVfAQ==
Received: from DS7PR03CA0137.namprd03.prod.outlook.com (2603:10b6:5:3b4::22)
 by DM6PR12MB4863.namprd12.prod.outlook.com (2603:10b6:5:1b9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 06:35:51 +0000
Received: from DM6NAM11FT084.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::78) by DS7PR03CA0137.outlook.office365.com
 (2603:10b6:5:3b4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17 via Frontend
 Transport; Wed, 8 Feb 2023 06:35:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT084.mail.protection.outlook.com (10.13.172.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 06:35:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 22:35:42 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 22:35:40 -0800
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 08/13] platform: mellanox: Extend all systems with I2C notification callback
Date:   Wed, 8 Feb 2023 08:33:25 +0200
Message-ID: <20230208063331.15560-9-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230208063331.15560-1-vadimp@nvidia.com>
References: <20230208063331.15560-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT084:EE_|DM6PR12MB4863:EE_
X-MS-Office365-Filtering-Correlation-Id: 1834782e-1697-49f4-06b9-08db099eb87b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aYflr2gSmpWEb7LsHsOatAo5vdd5tHVrVeRDuWYoYKneulwZBbs0X94YMGeMUKIuW3k08lLb4AiAyCXc6umvdfN2RsnjrvjXioLeCo3dsAx9YHMwK+kuuXQgDqmw+4PuLyTkOrkIuzKGthzvrZ7fgantRPmGSL2LViaV4TOYmxGDnq3It6cVR78q2+k56pNDT6JrPgpQCsbqxE+VpaOyY9k4ZK57mjuy0yfc1Ho1iqZ/YCRmiyr6xtzMGayAtlDJHCJlAoMeFFDQnZplvH1SYQn9Inh9dtWsKDqxQYX/O/SS3YywJVFj6btRT7RqrAKuVnzxBGmfEoClPiJAwPbWFDXxFKpSHVirckX8YifntJ6ti5iu6uClZRQ1q8M0LV5VORnKAxDNFRNWFIS5XJHk+Q4PqWv+MNAMi2ZDhfUPAIGN0gHBmnRF6xUKuvg5dvXCYiwr1Z2MZ7w8uCSeaDb0dNDnHUb0FZvDZsB9cPwCh4oopNiri+YS3A2Ff1pFCUhtSDAKmUPdKW4iPx1QYRx5ndN5ISmE0FnkVwRDoL8JOSMvE979i1bDbcreHPDiSmGQXoNIJR23lojxTOkKoRrm/PTudV47dnM7ZIWdgaf/dDSeZtPScfVTl+ErhsKblLP1kAG8XjUdxAc4MNj2/i+vj/+lPlbObPGD5A72F/sVgd+yRTk/iuuu9dSHddMF1kiy0xU57cVvX+t8N2O3SQXbSw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199018)(36840700001)(40470700004)(46966006)(82310400005)(54906003)(356005)(1076003)(8676002)(40480700001)(16526019)(186003)(316002)(86362001)(6666004)(107886003)(7636003)(82740400003)(26005)(478600001)(426003)(41300700001)(8936002)(336012)(83380400001)(40460700003)(47076005)(5660300002)(36756003)(4326008)(2616005)(70586007)(36860700001)(70206006)(6916009)(15650500001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 06:35:50.6204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1834782e-1697-49f4-06b9-08db099eb87b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT084.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4863
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Motivation is to provide synchronization between I2C main bus and other
platform drivers using this notification callback.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 30998b0a8bc8..d00fe9f3f1dc 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -363,6 +363,11 @@ static const struct resource mlxplat_lpc_resources[] = {
 			       IORESOURCE_IO),
 };
 
+/* Platform systems default i2c data */
+static struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_i2c_default_data = {
+	.completion_notify = mlxplat_i2c_main_complition_notify,
+};
+
 /* Platform i2c next generation systems data */
 static struct mlxreg_core_data mlxplat_mlxcpld_i2c_ng_items_data[] = {
 	{
@@ -5479,6 +5484,7 @@ static int __init mlxplat_dmi_default_matched(const struct dmi_system_id *dmi)
 	mlxplat_led = &mlxplat_default_led_data;
 	mlxplat_regs_io = &mlxplat_default_regs_io_data;
 	mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0];
+	mlxplat_i2c = &mlxplat_mlxcpld_i2c_default_data;
 
 	return 1;
 }
@@ -5501,6 +5507,7 @@ static int __init mlxplat_dmi_default_wc_matched(const struct dmi_system_id *dmi
 	mlxplat_led = &mlxplat_default_led_wc_data;
 	mlxplat_regs_io = &mlxplat_default_regs_io_data;
 	mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0];
+	mlxplat_i2c = &mlxplat_mlxcpld_i2c_default_data;
 
 	return 1;
 }
@@ -5548,6 +5555,7 @@ static int __init mlxplat_dmi_msn21xx_matched(const struct dmi_system_id *dmi)
 	mlxplat_led = &mlxplat_msn21xx_led_data;
 	mlxplat_regs_io = &mlxplat_msn21xx_regs_io_data;
 	mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0];
+	mlxplat_i2c = &mlxplat_mlxcpld_i2c_default_data;
 
 	return 1;
 }
@@ -5570,6 +5578,7 @@ static int __init mlxplat_dmi_msn274x_matched(const struct dmi_system_id *dmi)
 	mlxplat_led = &mlxplat_default_led_data;
 	mlxplat_regs_io = &mlxplat_msn21xx_regs_io_data;
 	mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0];
+	mlxplat_i2c = &mlxplat_mlxcpld_i2c_default_data;
 
 	return 1;
 }
@@ -5592,6 +5601,7 @@ static int __init mlxplat_dmi_msn201x_matched(const struct dmi_system_id *dmi)
 	mlxplat_led = &mlxplat_msn21xx_led_data;
 	mlxplat_regs_io = &mlxplat_msn21xx_regs_io_data;
 	mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0];
+	mlxplat_i2c = &mlxplat_mlxcpld_i2c_default_data;
 
 	return 1;
 }
@@ -5641,6 +5651,7 @@ static int __init mlxplat_dmi_comex_matched(const struct dmi_system_id *dmi)
 	mlxplat_fan = &mlxplat_default_fan_data;
 	for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type2); i++)
 		mlxplat_wd_data[i] = &mlxplat_mlxcpld_wd_set_type2[i];
+	mlxplat_i2c = &mlxplat_mlxcpld_i2c_default_data;
 	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_comex;
 
 	return 1;
-- 
2.20.1

