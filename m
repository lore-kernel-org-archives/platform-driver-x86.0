Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52503C001B0
	for <platform-driver-x86@archiver.kernel.org>; Sun, 13 Aug 2023 08:38:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbjHMIiT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 13 Aug 2023 04:38:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjHMIiS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Aug 2023 04:38:18 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C28170C
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Aug 2023 01:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnkSBltOwMj6QHMCX2RSZQeQUhoIwhERzxEd5rFaV4ixQZj2tcAEWwComxI9pwtYHf4defQaTz4zaLJK44BrVdV1j0E5PxsSv9T1mnwytrRKkqyIAFHkt0t8zJT4gi2KieB+bXYCvyXG2slNDoAVaIPRP7lX2y1kxiy2iKgTFatKIRoKXN/0ZbhRrO9ehqYACZnTdly73xbGKSMYs34PtO3oiZl/Md4sN03RoEObo12kVjmLhyGjvfh9cwsx/fqobtRs4QuZn/xOENGKZPLG0Ostd+Y8UcTBvbFOeUobAD7YuGfQP/G1xI9gVo0SyvKNxIQ00MMn4yM6As3ppYCbRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTvvxXuGeo8dWRokMCKT6MAUa7HkbDv33Ee4EwfGhUM=;
 b=ZtuJyT0PrmvHYeqk48EXEh+hTEBtzzxXTBFjFE8exvBxR38FTahXNBZFx1j0ZFQl7z+p6rzBxvoVVMNjyxO5680YfIFUSofmFqXMLyDM76y0cvXveatTJ61HnyGujxGCsVlvbc+CyZ2fKm/AyFXkoRKyfaQWPuCuIEHO8lDOuxu8YIPTULc5suFhvTqhoYqcCJPB/GSH0myU9wazGYr9vkrWxkWRohYpc3gE0k6F3fl6HcSiLhOjbtT9Auqj8OS6t62Kngq2hunIrZTTLXdc8MQsp+th2cd2WV5yC8uudwkcz0Nby9fA8xdl1b6/Ruz7HDtH5cwSyLKVDXGu0yqpzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTvvxXuGeo8dWRokMCKT6MAUa7HkbDv33Ee4EwfGhUM=;
 b=sp2MTFeHYDliSeEGTAY4fq/reeDyAf1UWTuodWkUoMcmncPwEt6rb4hVu68ind0P7h4/wfe8LCDSVQ9GFFxSYILEJgE745pbhLPoc/GtYt9mMOBz0goPYexpvQHm8rn2WjJUbuUXZNgAyKT2JoV3JM9+ANfcxzkbhSsWkTGIhRUn+FG1z43MJRuXu/rFa3A6b9j/11N3K10HJiTnJwXate9qlv2t/dDGVdFoBD61w992JhvsAc2/feYM/Czzgk6nBVLDUsBATqQIPGNGwzjmdcstQjyrdYQ4rzIQEKNYP/zx3vJ+m+DvFexn4rcYrprMZ1e7nNKQH/3NBSHdKsNZTQ==
Received: from MW4PR04CA0039.namprd04.prod.outlook.com (2603:10b6:303:6a::14)
 by SN7PR12MB6862.namprd12.prod.outlook.com (2603:10b6:806:265::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Sun, 13 Aug
 2023 08:38:18 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:303:6a:cafe::80) by MW4PR04CA0039.outlook.office365.com
 (2603:10b6:303:6a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Sun, 13 Aug 2023 08:38:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Sun, 13 Aug 2023 08:38:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Sun, 13 Aug 2023
 01:38:05 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Sun, 13 Aug 2023 01:38:04 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform 4/4] platform: mellanox: Change register offset addresses
Date:   Sun, 13 Aug 2023 08:37:35 +0000
Message-ID: <20230813083735.39090-5-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|SN7PR12MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c951db8-7f72-46d3-1632-08db9bd8a4c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ytur/7kkV+wnRMzR3mnFZvh9PD90LwBMHzNF8mOf7rORE8fhT+NecPjU1VzcuTPReCx4wE2HU7zF6tIDZGgTb3HqUVljTM3NILNimOT2A93O/vOSQoBdoAx436LKi17r2upwP533kNZKU8J1E77XvyF3VnTWGuZKlFeGd8Yh4NofWxQhV3yRzwioHipojvchFkq6dzgP7/Ex+KSTNQcQcRc60minZP3nrcdKpFh/Pp6mJNJwJxI4OTSaZAcb9XvFnTYlB4Q/bW2buLNYntGwFiiuUpmKs92W44ge9waJPfO1ix4Iv7LY1ow74KwN5YUaHE/sQNdnMw8Q1tZP/KbCaqJvEWmHF9nrOl2WOudFyPT2tWDu7MA4Nzj4qsNWMydhi8IIveSZ1vaxWl4HKeT7zkvSIK6gdN9gk0BWioXzUCR9xeVes1rjFF0hWegTOnEAvn/TegwJInbnXvk0pdcIvzbIbZU43YcxWP5754teD80v4Reaexr/i8k19ghhuA32JU2qyL9QVmiZS0TyvYMWJygw4YWfwhIodRoJQhrWUyjCn9a/vsjPK6U5PqwWjgd2x19nsoSQFVzxEtAmB/SmocHR2xeb2Peu3/9ZqHd8HicT5NZMo0OCdnglrIwrSv2baCwhoO1Sek7ePVAFUlvsqFqpYfRG2XvIQt/tfQLsCpAF6MuOqQBxrVn8RdhaPhs7jskfDH+jzGIA9pYNman8pxTrcUpXBrMyAKd5sOIigMYXUbDz9YNXbrDW4y4v2yim
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(346002)(82310400008)(451199021)(186006)(1800799006)(46966006)(40470700004)(36840700001)(40480700001)(40460700003)(6666004)(2906002)(2616005)(86362001)(26005)(16526019)(107886003)(1076003)(6916009)(316002)(70586007)(70206006)(54906003)(41300700001)(478600001)(82740400003)(356005)(7636003)(5660300002)(4326008)(8936002)(8676002)(336012)(426003)(36756003)(83380400001)(47076005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2023 08:38:18.1271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c951db8-7f72-46d3-1632-08db9bd8a4c5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6862
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Move debug register offsets to different location due to hardware changes.

Fixes: dd635e33b5c9 ("platform: mellanox: Introduce support of new Nvidia L1 switch")
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 240bc3174caf..7d33977d9c60 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -62,10 +62,6 @@
 #define MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET	0x37
 #define MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET	0x3a
 #define MLXPLAT_CPLD_LPC_REG_AGGR_MASK_OFFSET	0x3b
-#define MLXPLAT_CPLD_LPC_REG_DBG1_OFFSET	0x3c
-#define MLXPLAT_CPLD_LPC_REG_DBG2_OFFSET	0x3d
-#define MLXPLAT_CPLD_LPC_REG_DBG3_OFFSET	0x3e
-#define MLXPLAT_CPLD_LPC_REG_DBG4_OFFSET	0x3f
 #define MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET	0x40
 #define MLXPLAT_CPLD_LPC_REG_AGGRLO_MASK_OFFSET	0x41
 #define MLXPLAT_CPLD_LPC_REG_AGGRCO_OFFSET	0x42
@@ -126,6 +122,10 @@
 #define MLXPLAT_CPLD_LPC_REG_LC_SD_EVENT_OFFSET	0xaa
 #define MLXPLAT_CPLD_LPC_REG_LC_SD_MASK_OFFSET	0xab
 #define MLXPLAT_CPLD_LPC_REG_LC_PWR_ON		0xb2
+#define MLXPLAT_CPLD_LPC_REG_DBG1_OFFSET	0xb6
+#define MLXPLAT_CPLD_LPC_REG_DBG2_OFFSET	0xb7
+#define MLXPLAT_CPLD_LPC_REG_DBG3_OFFSET	0xb8
+#define MLXPLAT_CPLD_LPC_REG_DBG4_OFFSET	0xb9
 #define MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET	0xc2
 #define MLXPLAT_CPLD_LPC_REG_SPI_CHNL_SELECT	0xc3
 #define MLXPLAT_CPLD_LPC_REG_WD_CLEAR_OFFSET	0xc7
-- 
2.20.1

