Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A889FC54EED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Jan 2023 11:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235312AbjAYLcK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Jan 2023 06:32:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235372AbjAYLcA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Jan 2023 06:32:00 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A5609EF8
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 03:32:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaGTWlnmNY1nA7Ean4NuG7uLAxp4UzuGNhRlQhAPTd6wv7dk5gv2kESsyVf6aN3cJDdXNlxM0rs8LkqiHMdVkNoRLni6jyoOGCxdeDs5fsSVAIKHOt0e+1DPgsSirZhYhzs0wD99N8VtG9FuZHz2hBk/Lx95suWikmi3KkocPtck/cD91NU2jze+eFGsInbYL6IRuB4EnKLc1IzN8GU8Cz3KDUBetSjF/Ac5SOY3zBdWG8M2zYfkN7ggI60npGgoOrEbFj2apkR+hLec5oxv/s7iH1WsXRenIAcv1aDhosffy4uvjubfiqp+bGYG/jk92s9tqdJFXw+MI5RXOgRnuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6d1G86WM8c9o/4zGg8+FNCn4PrdPhAIDDtTRPkC9YE=;
 b=VOpDdqa+NGA3Wy0Gur+y2+SlWY8nrCfgbOzY6T/4tHeF8z9o8sJ4+SwdxUBsz5KB5CAB9QGqXMQBVh+3C3axgNnpCqkjT4MtUKPHXXBx8Y/DXze0MnOZbsCK9dcW3kojwdbDox/K4YIHkbGf4uMvIpip60NfMRr6WGQVaX2AOXB30NCMzSxFFH2hoYEmFNp4x005q/y+mzPI4YqlkHIRsG11/58vr9du31iCHwoN4Cb/C6CGhGTzMyOgsbfddi5WcdLjn/o+TVrY8B6Bj93DHjEFKZsIngOxJF3ur6pWAz5LqgWPUI3copGSb9zmdhF+5e5tbhiGBq5S3mKgiIo52A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6d1G86WM8c9o/4zGg8+FNCn4PrdPhAIDDtTRPkC9YE=;
 b=ACdQ/LWghLwxuloBJHkf6XlKqA9Dhb0XfFlvPUm2nokex4If/lsZeEBvevykkstFO2CkXie/Zs65JeaVHU1j3cdQv/s33m+f5c145ECIFEpwxb0vqrqorUAtKKWAHkdkio562kreRRdMPyspRY2ZM3qKx7e3fCooddyG9aG35+c=
Received: from DS7PR03CA0132.namprd03.prod.outlook.com (2603:10b6:5:3b4::17)
 by CY5PR12MB6105.namprd12.prod.outlook.com (2603:10b6:930:2a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 11:31:56 +0000
Received: from DS1PEPF0000E635.namprd02.prod.outlook.com
 (2603:10b6:5:3b4:cafe::59) by DS7PR03CA0132.outlook.office365.com
 (2603:10b6:5:3b4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 11:31:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E635.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.10 via Frontend Transport; Wed, 25 Jan 2023 11:31:56 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 05:31:54 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 3/4] platform/x86/amd: pmc: differentiate STB/SMU messaging prints
Date:   Wed, 25 Jan 2023 17:01:26 +0530
Message-ID: <20230125113127.3862898-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125113127.3862898-1-Shyam-sundar.S-k@amd.com>
References: <20230125113127.3862898-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E635:EE_|CY5PR12MB6105:EE_
X-MS-Office365-Filtering-Correlation-Id: 059fdc42-959d-4992-4ca4-08dafec7c3e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gr1BIZrtX7dzF8d4Q3tu6onI3VlcSEFcFc3WmfYWyPuAKISf3Qvjt1UM033C+fQ0VSecmZp1zISD9cr49LZTyIT7ItErR/GqwPRcJmCWWxWA5HzXsmqAc1mm+bpzMC5RTmXEnKfr1VHf+7+cDF5wlkdu1r+rL5MfyucKtXFvdB/QOEsmOFLXQiUTe/3uCaf5jYZsezplAp9CVw6+9XfRR5uqYiJJUsgCpEHojWgiseRU7NpzB4P6hWhU0Pj7ZnFUYE8SbmQ8BSk5His1rBnSOYKzreMne5B1ax0lUBjBQnMyFC60mGxmXq+CBpiEBYsrg1athwqwTuGnVJQjKZn/EZ7UkUmmg4ILkohA4YWZEAholuz6sxYEf69h5I/08p2RCt5zqjElF6GkJzxwGTzsHFQWvgSjHCbKwsQGmKwUz7jPZ2nWGVmaHcsaUsxJuNjpvlqq9jg5Z6xcAHincJ/yQwq6WAjZ5lgelw928JuONBvkSR5a8qY4Ydjfj2tDS+ZK8loMBPHlbRjx4+GIvVI7zcoqjT/PXs0cKEFqwk5mqIS9Mph/k87hQb08GugrnJPt87XHw2GUGHBFb9eNp6joyoxCAZRB7hINJZIPU2pDnI5Cb2WNQV3Opiyv6IEXfe5Aju2Kcg60cnGOpMo/ebWvLZDTHLkqh4SV/AH5MDZfsplnjEK60jgLLQdr4btG9iPj9sz6XALJiEc8ruqmW6eonarlUA5QRvlziuJ3aadlyrw=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199018)(40470700004)(36840700001)(46966006)(36756003)(2616005)(426003)(41300700001)(8936002)(47076005)(336012)(81166007)(356005)(82740400003)(2906002)(5660300002)(83380400001)(1076003)(86362001)(82310400005)(186003)(26005)(478600001)(6666004)(7696005)(70206006)(70586007)(8676002)(4326008)(316002)(16526019)(36860700001)(54906003)(110136005)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 11:31:56.4162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 059fdc42-959d-4992-4ca4-08dafec7c3e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E635.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6105
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Modify the dynamic debug print to differentiate between the regular
and spill to DRAM usage of the SMU message port.

Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 0dd9fb576f09..467b80ad01a1 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -592,13 +592,13 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
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

