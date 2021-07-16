Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC96AC07E95
	for <platform-driver-x86@archiver.kernel.org>; Fri, 16 Jul 2021 15:39:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88AE36102A
	for <platform-driver-x86@archiver.kernel.org>; Fri, 16 Jul 2021 15:39:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233195AbhGPPmX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 16 Jul 2021 11:42:23 -0400
Received: from mail-mw2nam10on2085.outbound.protection.outlook.com ([40.107.94.85]:51264
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233204AbhGPPmU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Jul 2021 11:42:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HD+TEYNGPry2DKDo6SZNKgIWxruPwytWT/ec/68B74IPHf8uZX1+G6xWIRr6Fge2yGvFqJVF/n7TbnHIOuTnbPa1/VB12DZrdnKePgsditpETEfohHM8yAea1kldVCiWi1dV/QlTK7HICFxSWi9hPZuZfMnArCAxH9bqQlg8Zg0r+dfg57KzmEf5O9atCbikUNpxBO5fkgH7Mx6/2dkWnquENzMQTSZFMULds67+fUkwqcIVFiFD2M5iXXiYA5I+O2vn5bUG0qvYHcqnke12MGQy+1y76cahzL3rdtPujmc42dr5yH2VmTUCopfXsnrREfHjwRrxSH7AFd/zHxdGwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehBH4GMY8qBWAfh15RPQjRRIPKB4f2MSbAgPPI94nYQ=;
 b=WksfdstfbE2I0YwRj3eR87sPgcLrkHzDqFF7AG/lKeFmKu47DpbHMvJ0Q+5rmyoUbKIiBtw/XhnkdgkM61RF21KyHRXrhMfmnabvkbmtd+nVFGDmbvofcq2hyh30wOUEjVZA0P9VW73rkrxDYImr5U8JWUoY727uOtitOnjn/xPVj8ml6DlUXjUsxFV31wae7QKa2rEBzM5lT+cwWqcCGAL4a1f0THxtc/zblMUj6NM8m3WCyzJkAjpfZoEeXCqsjxy0rMyUNQpGxY1ZSwcRya7MP6XHnMMNslamYUN3cdEHOZxxqtnZyf42/Sa34zSHaYX+kgq49asMR1sz2ThXiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehBH4GMY8qBWAfh15RPQjRRIPKB4f2MSbAgPPI94nYQ=;
 b=0eOYgGHGbxrbmlwzU4v7QmcgOhPiLKBW5Jx3xk7G70PJX97QMkVhN4CyLkyJn0qcIXLBTN4jKWm/P9OwDSudvL7dMvWD1c0vfP6HXZ0Rjw5kXSPaGRzsvpa0hwvFsrEDPclcxu3k91KlUvcRIRzL1hacmIAcGKC4hwo3FcdEMIw=
Received: from BN9PR03CA0526.namprd03.prod.outlook.com (2603:10b6:408:131::21)
 by CH2PR12MB3974.namprd12.prod.outlook.com (2603:10b6:610:2e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Fri, 16 Jul
 2021 15:39:24 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::a8) by BN9PR03CA0526.outlook.office365.com
 (2603:10b6:408:131::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 15:39:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 15:39:23 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 10:39:21 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] platform/x86: amd-pmc: Fix undefined reference to __udivdi3
Date:   Fri, 16 Jul 2021 21:08:02 +0530
Message-ID: <20210716153802.2929670-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa023a07-20c8-43f2-201b-08d9486fe315
X-MS-TrafficTypeDiagnostic: CH2PR12MB3974:
X-Microsoft-Antispam-PRVS: <CH2PR12MB39744733A16B44C8A32D73FF9A119@CH2PR12MB3974.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:619;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Duri2wCgGYFq+mXLuvIF1M+iklL3Qs639czj+tIR8RNJPz3gdPrqVw5Vj5F0fIDdG5tSiKbnapaOHRJUnmLfVSebm/0ZS0yxydTkyLz3/CfqvywZrTgpu8JjyB88XpAKvnkmKIh897aTGYtOGqxEdEyIF85SUMJP1i9DKhW7Lx+Rv4PvduJ1e45EGKiqNLSHm+IVbsd25sYJzvDKid1yKOKuNzGBHKv6g2ARZ0d2yPBJgJmkcT65fM2RMnkgLgxhfprcWdHrl9GPSYf5UdaZOIaKUnXTCbpnu9Vsjgy9TxiNaO0Z51Nv3f+h8s2ZLFhpiJgRjq0KECwdBCecJ/XFIq2xWUbZCXOXhD2ZVnVHNCONfNb8xwdlXJVxqroABM6wC9p94pxkw9/poLmUT3s+f+VkM9XOA311gJGSJYcOBCQHjaNKMJ5KP3nifjxPC13x9v+jSVkjbvyJlhfsdDVjLnFXtkTnT7n2i2cH1vBQ5Un4PJ+wYWWsOrxuWWnPwmTozbImgywwKSi0KI0OMAL726K9hNAfCd6I34V1MDuwM4w7uDG2o1b5gxa7bOAI/qL3GzhNqi5fbA4WtUNrSY6cbyreP9glxT2hxGbWme76QpuYxnrjhoLMfhoOP/ALCzhv4a9BIZUnHHXIrdND2fcRekNr0H8VfKzntP8zX00KadHdOnsNF5XxlIz6b8v8cGWDmzoB9nK2Njlwuvk5zgJpNXFcQWPkw/Ilvwb8TsQoYqo=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(36840700001)(46966006)(26005)(8936002)(82740400003)(82310400003)(2616005)(36860700001)(336012)(54906003)(1076003)(186003)(70586007)(110136005)(426003)(478600001)(81166007)(316002)(70206006)(16526019)(86362001)(356005)(83380400001)(7696005)(4326008)(6666004)(5660300002)(47076005)(2906002)(36756003)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 15:39:23.7488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa023a07-20c8-43f2-201b-08d9486fe315
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3974
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

It was reported that on i386 config

------
on i386:

ld: drivers/platform/x86/amd-pmc.o: in function `s0ix_stats_show':
amd-pmc.c:(.text+0x100): undefined reference to `__udivdi3'
-------

The reason for this is that 64-bit integer division is not supported
on 32-bit architecture. Use do_div macro to fix this.

Fixes: b9a4fa6978be ("platform/x86: amd-pmc: Add support for logging s0ix counters")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd-pmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 680f94c7e075..45ce1d5e1e6d 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -189,7 +189,8 @@ static int s0ix_stats_show(struct seq_file *s, void *unused)
 	exit_time = exit_time << 32 | ioread32(dev->fch_virt_addr + FCH_S0I3_EXIT_TIME_L_OFFSET);
 
 	/* It's in 48MHz. We need to convert it */
-	residency = (exit_time - entry_time) / 48;
+	residency = exit_time - entry_time;
+	do_div(residency, 48);
 
 	seq_puts(s, "=== S0ix statistics ===\n");
 	seq_printf(s, "S0ix Entry Time: %lld\n", entry_time);
-- 
2.25.1

