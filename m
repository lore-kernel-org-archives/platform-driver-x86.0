Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDD8EE49A4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 12:11:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235585AbjHVMLr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 08:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235555AbjHVMLq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 08:11:46 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A7D91
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 05:11:44 -0700 (PDT)
Received: from IA0PR12MB7698.namprd12.prod.outlook.com (2603:10b6:208:432::19)
 by CY5PR12MB9055.namprd12.prod.outlook.com (2603:10b6:930:35::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 12:11:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OnUp128l8uHudwDHQ43Mo9qQP1y1epcO48Y+vnoBwqrjvmRnCGhFn7PkV/5edDcU2rVLL5vzWvCCsiy6s3HeRoT8qN/yR1j4bo94pKlC/ya1n+z7ODO2x1pyGoj0aZUciNAJiiwifXWnvDG1MnLENs/bfVPzHggNwCghOIoN0QVuM87f2YHkJ5Drn0R+i6pzHItXPPA9QRx4HDrK6UFudXfBYaPE9bTcUOoguHgnIQYxj3CeMnLXbx/HAvvb8s8cTRKdBYbXqiGUH1nSgRuxJSCpD2aMNSCFOdjDmu2GFwFg0IdcHHN0fSPH6xJADEtNNYEnffMfwvW7hLZJaSr4JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvpr2IDc59hz0gQH2/iltbvadC4ESEnI6NqVW7siIxc=;
 b=RQmZYiFg0QLcg9o3GOSDT74r4Tv0rxqth+ZkuRMdjxs5dP4vGnUN9bYrp727Rru4ixSeXt6fBAtDkoC9d+3B+HDzFG2TOdSTBFhjax639SK4Ne5UA5MipsNHN0Ek1U2/Du3uwN47Crplbzn+tomGEJ3AAmaJ+XzWyxOtW3KdSl9r/t3ZIQ9svyWlGFDJVIEx89aML1yVL8bWQH84WWwLpyVSdAIC0z1mgz8lw7S0W8L1GajHvGOCBFvv7qwwT/3kBshXJdsAc98KCUFYstm5d3nI+rwBrjciekb7ZrMG7cLOMNHn/qnb2URaC9sLQ0pU+UyXHzJvislLGb9f85ZpTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvpr2IDc59hz0gQH2/iltbvadC4ESEnI6NqVW7siIxc=;
 b=KLNBJgg6MrjTsSfYan0hY6oK1yYFJZ37BLianwmfw+Er6ebtAYfnl7IjauGtJjDl79bDr19voLqNJzEa0dXpnTJAo/fR5JVfx3/EDMpotyaNwOU78YPRXx6g+TuVJBM2d/Skl6hLlQzyReaG0k+ZmdS/glNn7PQ/CmYf/Bp6D0JNlB0N2yjv1PtnBZPjpAhAAfOiEZqJze38pCaKLfchG8aRTH8tRqIQ1+Axo8H9SLJk3qxqzbXZlbqO7M4myQlKGfP+4Ruzo9bJrKoI79JLSnT8pvMKd1PANaqahROWl6Af77RF9jf2bHT150vLZPq9WIErL2C+6Kd1WeYfQFCbng==
Received: from CYXPR03CA0056.namprd03.prod.outlook.com (2603:10b6:930:d1::29)
 by IA0PR12MB7698.namprd12.prod.outlook.com (2603:10b6:208:432::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 11:37:02 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:930:d1:cafe::c0) by CYXPR03CA0056.outlook.office365.com
 (2603:10b6:930:d1::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 11:37:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 11:37:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 04:36:51 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 04:36:50 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v4 07/16] platform: mellanox: mlx-platform: Modify power off callback
Date:   Tue, 22 Aug 2023 11:34:42 +0000
Message-ID: <20230822113451.13785-8-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230822113451.13785-1-vadimp@nvidia.com>
References: <20230822113451.13785-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|IA0PR12MB7698:EE_|CY5PR12MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a705bbc-8453-443e-42ed-08dba3041a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qs1IXz/ApY939ahbbD5C/baRhQ9jD6kuFm3RHVrA4fY3RRsaHlWn4R5HiD7FhiZ2ZW7FsOOBcmthBC4UDU9pDtK7hvbfu57H0TBi+QHjVaEZgv+7q6ooMFV5F/fifXjofbVZa/G4vVUE9HGyfhzGzqsg2mCLL9EJK8+Wwa2pW4ja+T8s4qQqbwwhNW4Fgme0Nv3tKBNLxkKtnrVtbCd/Sye/M9k+mWtp5KVsP63w8E66MmnyC1pe+GeKvEr44Bnhnp4sAxZdD2K5AZhFgfUmMJbMiev5y+npqnPAt0omJQqGrtJIQpIwNmlHE4i2R4SKnLqu0wHktlXOnW42b0R/LxgUGb/n1CmqYXEouHPwQG0d2ExjrF09kzT1mx865+K9ztzixt26zCQW/6S93yz2TcZMxfCKnLyBNPp5k2CLMUnHHjViDJV9SX3KFAZWNWmsaZMB55ma1zookXVn3G0k5KHmmuXZ9gQ65ewDz3ohHshIFD1SIa+42H12DCl+EkNwi3tmR5SmZrOJtkYCrsQSY3zZFBCMq6GB/jH7dDva7+xpr+vdTqv+7rblDqDm7Y56UmMyor6I1RTgMwM/XWRMxO70GJP4q+IkI85X4SeL6C1LYUfmQ5HqNUA2WDhJ2jB2zO5H3OxMF79C4JN4ggcrWu+AzRZrFYlgQ78yvN6DkfRCyj5f+QsNcbCnDKckLfscaumXirY5inRrqdZIEdE86h0aMol/azujq8H6mgk/JkdRrfYmgEPiTnAic7e/XiNR
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(186009)(1800799009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(36756003)(86362001)(40480700001)(7636003)(40460700003)(356005)(316002)(478600001)(70206006)(41300700001)(6916009)(70586007)(82740400003)(54906003)(26005)(2906002)(6666004)(107886003)(16526019)(426003)(336012)(47076005)(36860700001)(1076003)(8936002)(8676002)(4326008)(2616005)(83380400001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 11:37:02.0649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a705bbc-8453-443e-42ed-08dba3041a76
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7698
X-OriginatorOrg: Nvidia.com
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
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
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

