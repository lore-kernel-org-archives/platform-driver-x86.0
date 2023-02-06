Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15589C636D3
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Feb 2023 15:09:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbjBFPJe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Feb 2023 10:09:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjBFPJd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Feb 2023 10:09:33 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D36AA5D4
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Feb 2023 07:09:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvmLNnfx6PZqrtZdal/GzUocRPTCd+76Dg+/oe2iKuFsGNz9JWjycxRCNOzGlPh0wr3c3aV5K12uPoEyV9IZYtQu5wQjonEieJTkc1rekermsGbumNJiXrDOYaK4nSBFjv/y9j5tLA1s0xn8pt9XrYGprX092hQhhshrReoqjk1qDxfaOA/MwCbQNHc9dlSybEgPaDixbEjmgU8ISBOAZo56/6Gjtj74GZEaPM8GS66HmDCACyO0/N5hyvqThOtuPo6nvSQgkdXCQIByrC7tAPPnShPgxYCaJJN2CZMinUvv/Lz/RJIvkbHMw9lqpLF545y04SaYC4q2DWmTuHOmSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECeYvIKQF7yz9Rw0Oeu+SmJ/mc502bgnj7jYoQ5dM2c=;
 b=UZKvBrQSLqx14MYPSyJjyOXupTEzrtAaNnkC+r6LRKGgnhMxTIbm2CFJHQtE8Tx9LV6XoqO1NhHcj3iPtRG7NC91v6XlujUbOCwHSLXa5sMKIlecOVvdevdfhc/4JoNsISUFbFmmkib4kuNh7H6AgRSssgqIuz8BvWwpwkagKPVP7YNTysM03bAVo7veq5GU/AuIxl5XKsrIaNmXuuix9Y/9HKOLcw5kEkswmdM0gqSrGgIsE/JShdYHxwl82/9JaW+y8ZuywrtIVqHk0zQaOkg+6tg7zSDf6PQSqhWksXSVIzYx3mO05Kda5xByydnaVStFtlEaHd3XbVOJ3k/1bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECeYvIKQF7yz9Rw0Oeu+SmJ/mc502bgnj7jYoQ5dM2c=;
 b=EqxD2euv4Babria68F4TUZt5p1Pq5eUZOG1N9nlojFR5i1XJATJ8RyJRUSHI8GRQ9/pRUIZwwLAPq1n/z1RBK76NionOwGgaNE/EmPULiDX4xSLN28x89df2DPAFuJk1J3W6tG9kCWd883XlS/IHsuFHdCL6KBZZpBQn0S0yS7s=
Received: from MW4PR04CA0224.namprd04.prod.outlook.com (2603:10b6:303:87::19)
 by BL0PR12MB4881.namprd12.prod.outlook.com (2603:10b6:208:1c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 15:09:30 +0000
Received: from CO1NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::9) by MW4PR04CA0224.outlook.office365.com
 (2603:10b6:303:87::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35 via Frontend
 Transport; Mon, 6 Feb 2023 15:09:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT079.mail.protection.outlook.com (10.13.175.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.32 via Frontend Transport; Mon, 6 Feb 2023 15:09:30 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Feb
 2023 09:09:27 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 3/4] platform/x86/amd: pmc: differentiate STB/SMU messaging prints
Date:   Mon, 6 Feb 2023 20:38:54 +0530
Message-ID: <20230206150855.1938810-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230206150855.1938810-1-Shyam-sundar.S-k@amd.com>
References: <20230206150855.1938810-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT079:EE_|BL0PR12MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b55fad3-2c44-47f6-07d3-08db0854258d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4wtR9q+A2Kq9YkuwjXvpZYimK3w12N5yNo6uhfAXMHwhF28V8D3MysOf/sTugRj/4Al4I70xScaBc30S3j8Hq6ouxyQomuuNyAZLHlQ+gQQYz+5JOkHhAbey27J/hxiYiWprpxblJSrSFq2ycBDErTdq9pLq2jtsKIQjRRSSKoK4Szww4TfrOwXdzuj25/jZFoH0Iq02tBTFwBFyoEgE9S9lSUVbIE+pfNgm1VblEKnYVLuHK44Rgzb/YVwtkGkqDay9wzHu6KtTHfEKVcfBn1SY5DaYLmUz8eQ8wSrv9+yB2R6mWQlk0lybcznq2+nZiLofuC4aQ0bmTc/LSIP5z6MXrj+XGXN/aJyDWjOBkgfNUxemuJ38RWauvcOdExLqL6Yl1XQ6MBlbx35bAJYe8ygJZyUJV/5a0YZ2fbeET0BfBBA9Zt9YR8VAToLY9MXRE/e7AHd9pGfuqSYgCkvsIRACNK/RtyGDn3aLlPNx43drKgrPWBbfQlbMebycrd6LrBoy4vhQz3vEdYTlw4RwwQ3Nb0zqbswoSYvByJETMJDn/KfdTgewAvk5+wUyY4h32W+lutY+dg5mQid8MQboBNmvVG0gpkIRF4yHpOTlQZQPTWTECIAK3PND72/pPY6r4cKGZl7vRSrzRPFYB4x5cJNKgks9RpkHiDHffWpklUOoXbr/Uo0UPeQUp5DMDbskLymQttoNgqYn7xJPnGtmZxQzUqYg3TJFZ1Gx5k7gNBU=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199018)(46966006)(36840700001)(40470700004)(2906002)(36756003)(7696005)(16526019)(26005)(186003)(40460700003)(82740400003)(36860700001)(47076005)(83380400001)(426003)(336012)(41300700001)(2616005)(4326008)(70206006)(86362001)(316002)(5660300002)(40480700001)(8936002)(8676002)(70586007)(1076003)(6666004)(110136005)(54906003)(356005)(81166007)(478600001)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 15:09:30.1769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b55fad3-2c44-47f6-07d3-08db0854258d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4881
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Modify the dynamic debug print to differentiate between the regular
and spill to DRAM usage of the SMU message port.

Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 27774020597c..b99fa676d35e 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -589,13 +589,13 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 	}
 
 	value = amd_pmc_reg_read(dev, response);
-	dev_dbg(dev->dev, "AMD_PMC_REGISTER_RESPONSE:%x\n", value);
+	dev_dbg(dev->dev, "AMD_%s_REGISTER_RESPONSE:%x\n", dev->msg_port ? "S2D" : "PMC", value);
 
 	value = amd_pmc_reg_read(dev, argument);
-	dev_dbg(dev->dev, "AMD_PMC_REGISTER_ARGUMENT:%x\n", value);
+	dev_dbg(dev->dev, "AMD_%s_REGISTER_ARGUMENT:%x\n", dev->msg_port ? "S2D" : "PMC", value);
 
 	value = amd_pmc_reg_read(dev, message);
-	dev_dbg(dev->dev, "AMD_PMC_REGISTER_MESSAGE:%x\n", value);
+	dev_dbg(dev->dev, "AMD_%s_REGISTER_MESSAGE:%x\n", dev->msg_port ? "S2D" : "PMC", value);
 }
 
 static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
-- 
2.25.1

