Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3992EE49AB
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 08:15:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233722AbjHVIPw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 04:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233720AbjHVIPu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 04:15:50 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2046.outbound.protection.outlook.com [40.107.102.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0464B12C
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 01:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsAU6Q0RFIozK/TrGVaqdkknwcGcyjA6s8I13pXKrsQRgzYw45oVFIPCTojIb4wiyi4YrqxJatPxP6qAqNafbaHNx9GF7w5Ksm4QuDyAJtW9WVVaga/mnE0HnF9XqKqRUAAlJyJpGA+YEoKrqqYhzdRpKUuJbfqNYcD7smkrcOiafeNSAC/6mDIAWDVbwEwP9YeWS74jX2HkzLyApmP0uvjDwiIKAC2OtlbfCydSgH4syzs8OpTRXFxZ3DQ1jpst+g+qGlBYRkrkGJbzEShpC4Gp79waMkSQmTVZieigZBKUbUGbPqI2/1oDlIETkxu0wwV8vt854FqfZBq6ElrW6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhf70Y+7uHbaKA8h7tzYQl+oxuaR+na5dnDH9e4oOqM=;
 b=foJQHu13reloNqKeD+DI+TgzT1ZvsDf0A0WL+2Ga0sA79wwvnt21OPYTIefhcZoUuP3+OnAThZGv+mnniJTwdneP2zQs3BAGJ1hro79svYSeiIENodChloBi4T+rPfNsPlfjQ36pJEWggxaGeCsNCIQeQ7QWpuPX1hGtr0BX75TBTtDM0HRgeervfV4i7x8F8gWVqTlDbDNN5uY4xYN2MIOgOZweFsc58xfLyL6i2pFAPZHGoUdBtOUOLkgfqtMJVfOeZwALSRNyWy7x4g8jH7mbrDwlKtDmJbKKPu1+0ze6tNIerzuYMvKJM4jFdaKgxdyX6/RVEY4oUNZrE3bHuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhf70Y+7uHbaKA8h7tzYQl+oxuaR+na5dnDH9e4oOqM=;
 b=rfQl7MmL4JGaagmYVSgTVL6wIyVbAOxWjPJ/7p3BSeBHKySPvzpDk0migDSCTndhwIt10e9OJ0n6z+W3Tox9rmKAgSkI1Ni4NMdkx3MzfAJSOTf6hFBm456HbWZZ0+EyMzEogtO+NIShe8VYLp7GzZm8nXrnTHB8IORPGEJ21XzkghwZXO9iDLsN6vWdhjMoT6jKVZ7nYPDnz4ZW0gC2noXQUezYbuqwwO3Fnausf0zqEcdzrPNEFQUj1f5Jc4k0VnFpXaamKpqAnd4vqjD28NeXbfHJThZNKBG/em2zQkuZQJHH4c+AwdtVVgayInv6iQpJisRBsobIqe+kRtoDig==
Received: from SN7PR04CA0053.namprd04.prod.outlook.com (2603:10b6:806:120::28)
 by DM4PR12MB7621.namprd12.prod.outlook.com (2603:10b6:8:10a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 08:15:47 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:806:120:cafe::27) by SN7PR04CA0053.outlook.office365.com
 (2603:10b6:806:120::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 08:15:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 08:15:47 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 01:15:35 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 01:15:33 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v3 07/16] platform: mellanox: mlx-platform: Modify power off callback
Date:   Tue, 22 Aug 2023 08:13:26 +0000
Message-ID: <20230822081335.64344-8-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230822081335.64344-1-vadimp@nvidia.com>
References: <20230822081335.64344-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 drhqmail201.nvidia.com (10.126.190.180)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|DM4PR12MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: 74fb647a-fd30-4e3a-1533-08dba2e7fd29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cY9+IxdHJMJ5uyxwKlxgZzKi5XeTRUM6Ptui+RKnB+NCkaR2ciqVOgEhIGO/i9XA8pRM+2BkpPvpG8mrBRxx060gL7enhf/+i5iAn3MubPR0MobE8lJ/EeIir1oR696X9dW+xL/Qo4fbT/yQXvQmtgdzXAgmnWhNxy2xrSK/ft9XoptTDG/ZxiHgcDT2r6aZ3U4mgGzSB9yWA6fZIpS6b/WOtoAAcbIea2n1Jh3vMgdlSwwbcBl56jHiwwMuyaRXLh1mabxlIkeY4i1zRIAXNL6UG68Cgt+s3jh6LiIW3xthzex0z50kQHG7eyPr+++6T6gx2oXj/diNeRFvVV1VqcQpwH7RyKuNmcqolHqGl3RxyCqzmBfXVkqnQhAqu180xIjuTgc4YJydjdRpnltHmzXh6k05tWYr2MCwuNe0OZbE7ZOZmX6nRm6UejFiYIGUXsbCJVvUa2SSUaK5gshR8bCfopc5UiXVUFrWH4KBjuCn+yP5jtyD9l9kzla6DA32Kljz2W4LiOoewxM47CyWxdgGrQm8N7cGmJv/tvhqF9kVd1rxGx52oJkazh+PsF4qsSOnRbp6G1Fvm6I3iEM8oAc9rrvxDY4Uy3nHzOjccwR244fTcbhbrfMf6UQCc5Lye2dvHr9KjJ3xUJyhQt4H8VYWnP0VoeX9MksDTII0teZq8WMYvAHm812napVazWqYvZxicLQTROdTCBWxmbF5grnFT0aClc+ZltzzAzV7FFH2G+bTevX3cQfY8ekJeoCK
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(376002)(346002)(1800799009)(186009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(54906003)(70586007)(70206006)(6916009)(316002)(8676002)(8936002)(2616005)(107886003)(4326008)(1076003)(41300700001)(36756003)(40460700003)(7636003)(356005)(82740400003)(478600001)(6666004)(40480700001)(2906002)(83380400001)(86362001)(36860700001)(47076005)(336012)(426003)(5660300002)(26005)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:15:47.0280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74fb647a-fd30-4e3a-1533-08dba2e7fd29
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7621
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Extend platform power off callback with kernel_halt() call.

When powering off, the process involves setting a halt bit in the
register space, which is then activated after a certain delay and
power off auxiliary power. By invoking `kernel_halt()` within this
timeframe, the intention is to facilitate a clean system power-off
sequence.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

v1->v2:
- Comments pointed out by Ilpo:
  - Amend commit text.
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

