Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AC3C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat, 23 Oct 2021 09:41:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A93460EBB
	for <platform-driver-x86@archiver.kernel.org>; Sat, 23 Oct 2021 09:41:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbhJWJnV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 23 Oct 2021 05:43:21 -0400
Received: from mail-dm3nam07on2075.outbound.protection.outlook.com ([40.107.95.75]:44705
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230121AbhJWJnU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 23 Oct 2021 05:43:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tpav4SZqvFABlnD0NhKKBtG6qW9v7PLBn26kuJIqPy280ig/sRUxvN7u5eVRRR6rjs8N5yDCx7/BfSEjhJyd4+4+XmxyhYWzX3SaKeBIKdt8ppTy4uFodYFIoUwD93jvYBqX+HLbYbYYiiYYWYL4zDQg6zNJqSIkhwiIvOitkCGfcsZlfLWgOoaJkVUzU2YenG5d0IIlcwcMr1YaKy9rjlwiYHzUSPndjZ4E9iM3bqbQDBLEGuye+X3p4KZSnoHiE/8tof0VAHU9Qqp/AR68bZZ6g2zEN6+eQD0g4OVq68lqKpJPT1GeM6WZEgjHhex0+CzgrqmcYTp+NKE2hUe3dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2H5lTyRsD4COt/CRTi0sox/Alem0wBOUvyz+UcYGAE=;
 b=MfM3hNSEqzJaaBtI2NdnbRN5XMgXcmlxrbXJVOfpOZPKnPAhrivR+qFkC9kgufy/U+VbXJFOhlfxELgDxslz0DxfGuhAFMfjrzNja8Wz3OSxyQl8kCSI9VEFO0ZkNCLS80pvuTO6TXHAd98l0oB1TyK7C2oTwlhX4AnXIXKw3k0orGojYT+Swpg6Cg6t+E84iZxXdrBF7uuHFZXJAgLstf/ga+s5/Kmfy7xAEoKUv8DB2+N2h5IVdLvgXHTothFenPDfFExbSV5To6rPFIPsNT2kML3wevjFQkL+gkEEpuWuIQJmAhyAnob6AbR9IvDg0PVbrYypgXImTqCvTXj79g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2H5lTyRsD4COt/CRTi0sox/Alem0wBOUvyz+UcYGAE=;
 b=LwL+6671fogWE3FH3Vq7nOzpUP2qUeH2g8i+ahwVvNchcXVNPRd8KJy3LNTt1uSgVz7FXWE7pI82rQzaBHFmctT0BBubBHWVD/14eA5bMSTR5E8h/rKH1QHGNnrj1EaP0IsIX+YFxqtTNwWcGSJhAoMhoXUsrw1/1sTAA7LR2K7QDE1tPOF+gqvgxKo80E0eTgcfxr/5i7SR0s8nAZQEiR8biHAhmQ8xskrIBVKCn+BfTYTP5yvenwvrcBaDwJhoXk3wwZrDU79ni042RXiHtGMGxQEHxQED5sp9qTDxxXv9mGw9ui7jKW2J2IrzQhlBFXaCJfKBpaR99x/Ytld1Hg==
Received: from MW4PR04CA0278.namprd04.prod.outlook.com (2603:10b6:303:89::13)
 by BL0PR12MB5524.namprd12.prod.outlook.com (2603:10b6:208:1cd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Sat, 23 Oct
 2021 09:40:50 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::8b) by MW4PR04CA0278.outlook.office365.com
 (2603:10b6:303:89::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Sat, 23 Oct 2021 09:40:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4628.16 via Frontend Transport; Sat, 23 Oct 2021 09:40:49 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.5) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 23 Oct 2021 09:40:47 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>, <oleksandrs@nvidia.com>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next 2/3] platform/x86: mlx-platform: Add BIOS attributes for CoffeeLake COMEx based systems
Date:   Sat, 23 Oct 2021 12:40:21 +0300
Message-ID: <20211023094022.4193813-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023094022.4193813-1-vadimp@nvidia.com>
References: <20211023094022.4193813-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80670b65-279f-4264-e1e8-08d99609328b
X-MS-TrafficTypeDiagnostic: BL0PR12MB5524:
X-Microsoft-Antispam-PRVS: <BL0PR12MB5524A8B1E944B0409B9F62B5AF819@BL0PR12MB5524.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uJazLroQTU0vokZgODZcMLyWllJa8vyWsNX//47w9PbgjxWEZqsPEn5g9dqnhfu9ur1CIk4FvbSTDvybY1HvzRV+7pFD/oEFQ1L0A9YKs62tVLNg3q+DNBkk9U46buWnrTLL+tCvEC0tpfur1T20UealpjnkvmU2rW2Fr6EHTTep2WrTLCu7FjMulPS2wJhI5rwK0ffdrazz57IMoWh/iCwtEumtWcAVPzvgxhRpIK61Hf5OcCb0kq5S8bnRQLNsXXu8VfgOhmpt6QDv+xBfy+OCZgBSiEt13ijXmBQKVqUIUmLqq+O1N8cwHWVBmc3OZgfUht9yeHCpUz3fU8XtFL/E8mXWrq7ZGH5qcka7Dd/JnF/GhIY3Vdl/7tDP4HSdiA9eGm7ykrT7+G6ac0FpByWi2w3Q91eLHp037J2u6iFIfQJHCJ/8LAHImcvQr5CIfQdoHVJt8ogKsnHdesQGVXAZF2OjWKvokrUlyaI76vcUDTAw0GEi6CK9mSj0Zl7MQ7URuoiDmKmOU4Mdn1gbzv9Enju/a4k1Q+ppyh6OwzlJ+LDAkRLApRVbfKCOkvWBskQ/aRaEStjB38TBfqzorPFcbLCilvg+4mL7v8NBlKwAzNBSXJVYQZiS7MKguXUhUyGwDEpvJRi264O+UvuwkIT/pjiKLVc+3t1lCVg8aF1j0w3r17hhkWvJdCMA6fP/otHLjgvfLp+YjlTcFBRbhQ==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(4326008)(186003)(16526019)(426003)(336012)(26005)(70586007)(6916009)(70206006)(6666004)(1076003)(2906002)(47076005)(2616005)(36860700001)(107886003)(36756003)(54906003)(8676002)(82310400003)(8936002)(5660300002)(86362001)(316002)(508600001)(7636003)(356005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 09:40:49.5516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80670b65-279f-4264-e1e8-08d99609328b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5524
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Extend systems of class VMOD0010 equipped with CoffeeLake COMEx module
with BIOS related attributes to represent various BIOS statuses.
These attributes "bios_active_image", "bios_auth_fail",
"bios_upgrade_fail", "bios_safe_mode" has been already added to modular
system. This all of them are already documented.
- "bios_active_image" - location of current active BIOS image (0: Top,
  1: Bottom. The reported value should correspond to value expected by
  OS in case of BIOS safe mode is 0. This bit is related to Intel
  top-swap feature of DualBios on the same flash.
- "bios_auth_fail": BIOS upgrade is failed because provided BIOS image
  is not signed correctly.
- "bios_upgrade_fail" BIOS upgrade is failed by some reason not related
  to authentication. For example, due to physical SPI flash problem.
- "bios_safe_mod": - 0 : if BIOS is booted from a supposed active image;
  1 : BIOS safe mechanism was enforced by hardware (CPLD).

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Oleksandr Shamray <oleksandrs@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 06fe58aaa23b..3d017e889ce5 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -2917,6 +2917,30 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.bit = GENMASK(7, 0),
 		.mode = 0444,
 	},
+	{
+		.label = "bios_safe_mode",
+		.reg = MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0444,
+	},
+	{
+		.label = "bios_active_image",
+		.reg = MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "bios_auth_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "bios_upgrade_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
 	{
 		.label = "voltreg_update_status",
 		.reg = MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET,
-- 
2.20.1

