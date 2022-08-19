Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908C2C25B0E
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Aug 2022 08:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347182AbiHSIj7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 19 Aug 2022 04:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346731AbiHSIj3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Aug 2022 04:39:29 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2574F2B247
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Aug 2022 01:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8k/+ATgtwsrr7IFlAMCO4yR7ZMe9Iqbm4nn/0yZPSxUu6i9qhDqyh8oMY4+eG84E01QxCDTu69EsP84meNsr658BNyQF8+7T4so7NZvivOMypr7kRItu5T2qUicSocz7IrNaurBnDld7piH2prf9m7tmPTMN2wg9X5oeBkkzvQwy+XUJaBSMqe8OodUJGhwlnR3Tq7Y5GXjKwpIZTZJ79wrzYgYGSkiJbSYiVpwADOiWYwu681ScketeuIuqHTmnMxbNNw4TQJQDIwRBHimTxNRqDhK6wGA7SDeGkeIn7BOawAwwerfjw0IwnzWJPcIFUE9z0Kps2RBuAzJbUr3/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJrH87JsKqDTWwYL9NvXJ6fQXDidcSObmQznXj4rq+g=;
 b=SNIwXAYECR6rJDIjr9duBzS1uQ4jhotKt1fe3btzdZHj5uGa9l435GgCXeb/7SSxPNr/khukVZxBpWEx4LOw/mbsV0+7cUmcIiMZsgIANVOshmbeBQrxVldSxYNxJeSdOq9zwQ+u47dKr+4ui4Wo1kM//0Awyin5nQ4ViRrE67H6OeCBpHm32glGVEa5lKm26xbrZwaP8XMvRn2/7o1OQSnMFHwOM+D13xuZxfB2ONfsPO7Ml2zvWSiczVh1XIlxEQXbkKZiq7VsojYOhWL05dUuWp8GdT8ma4lx5gmdrcuClWWRNTA0EYwC7le0+cwFb8k5pV9OxiJaLLS2KKeARA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJrH87JsKqDTWwYL9NvXJ6fQXDidcSObmQznXj4rq+g=;
 b=lU83yIQ2ibQJwETWhO0Q/Dc86p/jzmfbMh8Z6jR1ijtayc9CyRBlPdZvOi6S4eB0NQYIciD3ufslHLfdJgNVXtaiKWw1e3xPIIkeOmxM50PWS9MuA9vo+2zHAocsGGZS9yWMJMHR299PYY5M9HfywNqBf/3KmNEl7shJgrhkiTc=
Received: from MW4PR03CA0239.namprd03.prod.outlook.com (2603:10b6:303:b9::34)
 by DM6PR12MB2986.namprd12.prod.outlook.com (2603:10b6:5:39::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Fri, 19 Aug
 2022 08:39:22 +0000
Received: from CO1NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::63) by MW4PR03CA0239.outlook.office365.com
 (2603:10b6:303:b9::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17 via Frontend
 Transport; Fri, 19 Aug 2022 08:39:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT108.mail.protection.outlook.com (10.13.175.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.7 via Frontend Transport; Fri, 19 Aug 2022 08:39:22 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 19 Aug
 2022 03:39:19 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] platform/x86/amd/pmf: Fix undefined reference to platform_profile
Date:   Fri, 19 Aug 2022 14:08:58 +0530
Message-ID: <20220819083858.3987590-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e08c9f4-e05a-4351-22fc-08da81be50c4
X-MS-TrafficTypeDiagnostic: DM6PR12MB2986:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k4x91ITJ7jctf0gndn8zu6kKILO53+1N+Jmu8Jt9GXA0PNAuEhPdx3LnjITyP7xh+EuKsgeS5S3p1a0+ctnCKYaCH11SSeC7dleHdYnVdPMefVtPP80bxJ8t7tI59DLMMsAPdKBWdb1q5VK/ioNx1YmuYCiFBFS8A1rDHjG24GjsqyIWQJeccz3iPlUpL73bZMnzP4aG0jIRGLzXmiwKTAsD++JQycW6FAwPrNOldLOpA/bh2bJ/CofkywkKnbXiY42VxGHJGLY44QYR8tVm6UK+Zdp88ygHcU3fHdxPOxf0wCVco1SUN+suZSgxE3BraNnLwhhFrQlXmRwwzimjvh2X4/2MoiYU3G4F5Xo/NFtFwb5+SmT8g6vubzSx/A4QM4Z0QgOutXlXYR4CLherv+dOk6REpVfuSny+OEL1U2sdxIsjWl/OajEy+BUp+AakuzDoMPRgB6ZujI54mPhUpqPn5IHUlxSyGH3Ryud3Ac0Hp9etp5nzHzpi/sSIlKnkrUrA5IRJ2LsmFZCXhvZkVJqdMiIPhnHKjfYlDTidn/QQKp++S0wmmombYZjQM5CT8CB5yhQKSpsr1rNLoOAfskFhshxytdlgHSD978YBCMtAFCEkxnxwsdi1bxsDj/ujINXKvMrER1jmTk0XMDd1GUCdC7dmmDqxN95w7hBXA8GqCu86xiFF3Wii7+vgQnDW8Vodl2Yu6fnbZBTmmM1i88AT9Ef1ZJ0YLymXl/TI+Zhpg7oUF/+A2KJS5QBaZRlpALumyx2upY9jplRuzUWhwgcvV9lOwHy1ogbMBY6LhrWD1rAVN37LGAuUZek+W39L
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(39860400002)(40470700004)(46966006)(36840700001)(36860700001)(356005)(70206006)(40460700003)(54906003)(110136005)(316002)(81166007)(478600001)(82740400003)(8676002)(70586007)(4326008)(40480700001)(82310400005)(8936002)(5660300002)(2906002)(1076003)(86362001)(6666004)(7696005)(41300700001)(26005)(47076005)(336012)(16526019)(426003)(2616005)(186003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 08:39:22.3269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e08c9f4-e05a-4351-22fc-08da81be50c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2986
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Its reported that amd-pmf driver when built with config which does not
have ACPI_PLATFORM_PROFILE set/enabled throws a undefined references to
symbols used.

---
ld: vmlinux.o: in function `amd_pmf_init_sps':
/work/lnx/next/linux-next-20220818/X64/../drivers/platform/x86/amd/pmf/sps.c:132: undefined reference to `platform_profile_register'
ld: vmlinux.o: in function `amd_pmf_deinit_sps':
/work/lnx/next/linux-next-20220818/X64/../drivers/platform/x86/amd/pmf/sps.c:142: undefined reference to `platform_profile_remove'
---

Fix it by adding a "select" to the Kconfig.

Fixes: da5ce22df5fe ("platform/x86/amd/pmf: Add support for PMF core layer")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---

Based on "review-hans" branch.

 drivers/platform/x86/amd/pmf/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index e65ffa52229b..c375498c4071 100644
--- a/drivers/platform/x86/amd/pmf/Kconfig
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -6,6 +6,7 @@
 config AMD_PMF
 	tristate "AMD Platform Management Framework"
 	depends on ACPI && PCI
+	select ACPI_PLATFORM_PROFILE
 	help
 	  This driver provides support for the AMD Platform Management Framework.
 	  The goal is to enhance end user experience by making AMD PCs smarter,
-- 
2.25.1

