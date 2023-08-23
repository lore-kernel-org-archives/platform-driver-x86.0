Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E8AEE4993
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Aug 2023 07:51:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233598AbjHWHvT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Aug 2023 03:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232621AbjHWHvS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Aug 2023 03:51:18 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 195AFCD0
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Aug 2023 00:51:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3q8+rxCiO039c5vPH+H9CZUdObzlI0OVe3rG0vjd+W47NNgQjcKwtXwpBCYq5qbS1PfELBzLx6yEt+SYwLK09Okv9Km32QcCn7UVkNajemM3gwZnWAbYIykVwMa5mHeqDJ0o8fRuWnTo/+KtkW1O3mfizUeb35Ybqs79bCp+3E64G3mV9ixqM8oTtyufZOk2qkkIhtzTIFmGKrtN6Br6LZFffOkAtO6AbBCPs4P45jFY69MYXe1AVMmfrb0UxsRJ8cMSMQ6R+0Iew/bTDVITn/kqkFqotNxc+ObR5KDO9sdkMVPWHbWvexG58kCDMl/sy5rD8CcXtEaWQJRACfz4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tT/n/QZDB/yX6HnnPjK+R4XV+wXmwQby1SJUNgEFu1U=;
 b=hsn/NOcW6mivkeav3RgbBBA9IqqqCEcr1HlvFZzBrVZPnWxBEWtnaPQOQQr5sd7SoN9GOJUeHNH4k7QODiaSZySEiOaGj3/842+2O1HJEpA+1wIK5VQV59WqRvAxtIbIhDvOuOqLhdau6ZH+bwLlHpZQgYrhIjJorjBJMUz8Fb7OMxZKNxkkTWkiKCJIbFb/E63NpF8uIMFNMAjMR4wkcdnIs/4nlmS6OTVBI6XkgtJN45GlUfC0k8c9iscSk6nVH3YAVrvEp7s7AVyK1OuPqgM/3Lei7vID5YOdv560tEZ4sMxGLcg+DnX0gIUZGTLma+ErwAJxdda68LrQpJyC7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tT/n/QZDB/yX6HnnPjK+R4XV+wXmwQby1SJUNgEFu1U=;
 b=V78iz5wLOU/E+vlrpoAeZH4+X31eIewkSHyv9pXO/TGKuL4UP1sYUc3O15CcPTWIdAhMrVUfrEUdSqVbUjLJ1CSVixXUjNjUlr15BATpBM/wpKriovG0sfgXPvqi1MrWJqn/EVekrc64vEqNLMjzBaWkZ/Pr+iMBsb0AofeqD/sUo+EIV/K5708HJdp+MwLPSnqhgdfFyyQg6jnYApLz7UNB0UiDsRIrMH2EAdTnnlif5F4QqGkUJo8WoFsjTbcdcVhzBLtFtloNFrzLMwXJHdijSQQDi2lB8WaAjpS7eJwJ2phoJRiELeTuDDudZlsVmFvGzwJJexQPJIk37c/Usg==
Received: from CY5PR18CA0027.namprd18.prod.outlook.com (2603:10b6:930:5::30)
 by DS7PR12MB5744.namprd12.prod.outlook.com (2603:10b6:8:73::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 07:51:14 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:930:5:cafe::92) by CY5PR18CA0027.outlook.office365.com
 (2603:10b6:930:5::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Wed, 23 Aug 2023 07:51:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Wed, 23 Aug 2023 07:51:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 23 Aug 2023
 00:50:59 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Wed, 23 Aug 2023 00:50:56 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 1/1] platform/x86: mlx-platform: Fix 0-DAY CI warning
Date:   Wed, 23 Aug 2023 07:50:38 +0000
Message-ID: <20230823075038.7129-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|DS7PR12MB5744:EE_
X-MS-Office365-Filtering-Correlation-Id: 420b5169-ceca-4223-cf12-08dba3adb994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pbQAQOS3jlYqFbqOCyU4RfgfbIGN4gYo9SyNX7aJyw0jWbCwoS8miTklDFe28P+dWsHDmoXWxZVjK1ZI/UH22SdhYe5Q8vWNmNVmPMsTuM7/8HYx6MuY2JJFY7swlISxqgM+h/Fx1UyX4W9ptKO7TVnoydYVGo3TeOhyQy2oGuvHP1iUudvQE6M+Xa8rN8xSTXhkItVOiKbrN67higdXq45+hODudq+gsd9Sn5JiEH5D/y/YrhnmjXCqOwknE6ZAH1m5XQmThKP3K0Cg+qdGYSukD4oPBwMVIq6wRuPB4ONfYbPYWfF6pnMrLPLD8t9FaGmmZdmFrR/Y1vlRViS4A3kMJGl6sSLnNxcGMZG6E1CC8YJ2ZWnrPy5dzhMnUBi4qiTK64uHADqti/ZCt24rHT7WCgTQ741tNg4pYMuXHSGvzL5hCMxygfRzSUNM2mSz1uIPxe3W6zZAdJJHm8SDFH6nMbHHuyBHKqE7+Ef0GhIOr+qdih/5KcSA88FAn3Aeuda7jnJjYcN8zeV5D4SmB569YZ9FmkmeL/5EQzq+pwAxP2XsJzt5ya0ONNtvH51Cc5/iqOlO1FNiJf7VnMtPBqf9YYvHN9IpfCwZogEb7zsb8z3JUjorS53KIf47uaxiZP3kAcoSCiiPNFn+tEvN/lXhpzJL/k97bB54s9ccdm7TuQtW4VyK2+YpXtXW4FIQHMR8qorcgtpqjliTHc8FsrWXA+g8mu2H82dSjdyLDiz27SXbOdjCc4AB3Qgdbsjq9gF4qdZ6HMUqC3ySwmmFfA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(1800799009)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(54906003)(70206006)(6916009)(70586007)(316002)(8676002)(4326008)(107886003)(2616005)(8936002)(1076003)(40460700003)(41300700001)(36756003)(7636003)(356005)(82740400003)(966005)(478600001)(6666004)(40480700001)(2906002)(83380400001)(86362001)(36860700001)(47076005)(426003)(5660300002)(26005)(16526019)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 07:51:13.9701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 420b5169-ceca-4223-cf12-08dba3adb994
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5744
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix 0-DAY CI warning: unused variable 'mlxplat_acpi_table'.

Add dependency on "ACPI" to Kconfig file.
Remove "ACPI_PTR", use plain assignment to 'mlxplat_acpi_table'.

Fixes: e2185e8f37ef ("platform: mellanox: mlx-platform: Introduce ACPI init flow")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308231011.pa9xg8sF-lkp@intel.com/
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/x86/Kconfig        | 1 +
 drivers/platform/x86/mlx-platform.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 06b9a5ae5a63..a43db6731f34 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -965,6 +965,7 @@ config SERIAL_MULTI_INSTANTIATE
 
 config MLX_PLATFORM
 	tristate "Mellanox Technologies platform support"
+	depends on ACPI
 	depends on I2C
 	select REGMAP
 	help
diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 44f107965832..3d96dbf79a72 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -6629,7 +6629,7 @@ MODULE_DEVICE_TABLE(acpi, mlxplat_acpi_table);
 static struct platform_driver mlxplat_driver = {
 	.driver		= {
 		.name	= "mlxplat",
-		.acpi_match_table = ACPI_PTR(mlxplat_acpi_table),
+		.acpi_match_table = mlxplat_acpi_table,
 		.probe_type = PROBE_FORCE_SYNCHRONOUS,
 	},
 	.probe		= mlxplat_probe,
-- 
2.20.1

