Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DE2C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 11:05:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CC9D61879
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 11:05:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232755AbhF1LHo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 07:07:44 -0400
Received: from mail-mw2nam10on2062.outbound.protection.outlook.com ([40.107.94.62]:9591
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232617AbhF1LHn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 07:07:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jo3pceI9USiLSrjARQAi/eOBpAQaB98oIpFM0LF/fP30idlUS/4gbdwkfEMgFc//ZZOI0vpAxCO+w3EQ3FOwu2cUxAKWPVvp7fjJZhvSOU0gkGeMwUGzVOFA3UnpWTqsiLxrMCXQtg/24nrvBzobvPk4I8w2FIjlzBDLmYuD8BDzmW/PDWy6vN3YMjv4pqZZNz5oI7LDzcfxRleDIDecijpLOiTQVDqRp8QJ3I+BtNrazFc2iNiYwHPUKo/8CMv6RxCKpZa7O0M2wLPnBr2AK6v9X3THrhARiBRNZdZClZUO50fTm70fOlJgQH8FfCFfMH1xcIOndPg16Vh/0XDB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nsw9kMWZc1YjU44zrzBIkb3CWEqV/5xSxU2RKceZPro=;
 b=JJGuw7HnZjHJlzaba4z088R7T8imOORvcRjv2ehL3h3cwPQlL5qg5b9+TSEb3dgP3XDFvoeSKoT/0ShCLjg8FOHVIZdkaXuHH9LERjNrMFCz1OKtHgUmN2UOxfyg4Ud6lR4dOiYn7x5eg7arrLlzrOye45hhXH5SwORvWDX9Mt+IcD1SitB0UWPuBjCRnLD79JhMs26vI+C4Wzo1lKWHZoqNq32qe3oIUByD1MwoM/fFLjjZxC0/8XJDPmtTdas1u2VBoYFXyAfjfF68tmfK9pfYzZosBnxKVtlXcTTMduyU7qThH/xKwwJpWSKaMU6HN3XpBBwl03NOBwUhy2uQQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nsw9kMWZc1YjU44zrzBIkb3CWEqV/5xSxU2RKceZPro=;
 b=BuaH0Kasoylm1P4jlvFp+y1mNUkZzsrvqOaaEUzvGHopPU4lr+JHWuf0XVPjd6X3z58260V6rBydaQx8EZYODYa2ukApu7d+uAcyJNkuy67M+MqAYo28oM8xWwRZEMisI2XYdmX6HUctuq6IIdtSYPl9+CUL7yCtkiTQxxlZ7cg=
Received: from MWHPR15CA0041.namprd15.prod.outlook.com (2603:10b6:300:ad::27)
 by DM6PR12MB4601.namprd12.prod.outlook.com (2603:10b6:5:163::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Mon, 28 Jun
 2021 11:05:16 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ad:cafe::ee) by MWHPR15CA0041.outlook.office365.com
 (2603:10b6:300:ad::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Mon, 28 Jun 2021 11:05:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 11:05:16 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 28 Jun
 2021 06:05:13 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 2/7] platform/x86: amd-pmc: Fix SMU firmware reporting mechanism
Date:   Mon, 28 Jun 2021 16:34:46 +0530
Message-ID: <20210628110451.4047142-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628110451.4047142-1-Shyam-sundar.S-k@amd.com>
References: <20210628110451.4047142-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7decb38-ec83-4c15-5235-08d93a249c6f
X-MS-TrafficTypeDiagnostic: DM6PR12MB4601:
X-Microsoft-Antispam-PRVS: <DM6PR12MB460101173B24478C76A8A7269A039@DM6PR12MB4601.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9eroRdAF0YwfA89EZVOMjzKTDDzCJowBUXSMXjnTjnuF0Qku2VNkkk8QiM4Zy0oodipsQAbg4hGDTs7xBDdA1vDo/iImAQDE72LlCnD/tJPYX6yX3OhKMdhLGOMbkZ+2x1/I+QkyYr7UtYid0r7QBJNmA0qMqjviVKsUXz9u2j4L1FZcerc4Wkcdr1+PlWqPSXWx9K5mEllwUXNKdpXjnEM/uPFjWeMHgFgi0T1e3jnUO2ImbaUXsT8FVwc12qwKM/rDc0rwX0zkslvsuhTDJV5/i/RsMhvV9f8kSNiqakMSmJC1CLbnLdJ8Pp1GeQV+YDJZg3UddxU7KiM5nIF19v4Ll7TyM6ljBcHRjNshgrXROGskdcuvL8YzL7k+Xe+mcjeFBejzfFIPTvUtADK7F+XzqyH4KfS0XZmnk3CqIwyBoH8Tg2ZRqeB26aONQXPEhAHi0ucfZwufUSb9+j/3J2bejN61PXzwhrZC8lMEYd5GrT6zTGiiV135Gj6poTVjWOk+FCJsdsugK0V3tIA1WOm3UPOgTjWJFdmYSiuQuiwJOebLFvCkXnAPUPyTsI4dshW6MJRvCCOJ2IkhlGb2Aw29fJaMLnTdPvMYiBiJqVJ1H4nOYEH5pYFRgqOKGymuA+2ooa4a0g9EV4MXQ6tokOV+XhIKWNDINVY5IoROvsoiWQN1oZCjP57sXgWMtQisibL67tEmevmOBidZypGq8hUBNWEksObHAOJyB8DhC78=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966006)(36840700001)(47076005)(478600001)(356005)(36860700001)(83380400001)(4326008)(82310400003)(5660300002)(70586007)(82740400003)(70206006)(6666004)(26005)(110136005)(186003)(81166007)(2616005)(8936002)(316002)(54906003)(8676002)(7696005)(16526019)(1076003)(86362001)(426003)(2906002)(336012)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 11:05:16.5731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7decb38-ec83-4c15-5235-08d93a249c6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4601
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

It was lately understood that the current mechanism available in the
driver to get SMU firmware info works only on internal SMU builds and
there is a separate way to get all the SMU logging counters (addressed
in the next patch). Hence remove all the smu info shown via debugfs as it
is no more useful.

Fixes: 156ec4731cb2 ("platform/x86: amd-pmc: Add AMD platform support for S2Idle")
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2: split into multiple patches as suggested by Hans
v3: No change

 drivers/platform/x86/amd-pmc.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index f3f5f754f75c..c0c8f950033d 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -52,7 +52,6 @@
 #define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
 #define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
 
-#define AMD_SMU_FW_VERSION		0x0
 #define PMC_MSG_DELAY_MIN_US		100
 #define RESPONSE_REGISTER_LOOP_MAX	200
 
@@ -89,11 +88,6 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
 #ifdef CONFIG_DEBUG_FS
 static int smu_fw_info_show(struct seq_file *s, void *unused)
 {
-	struct amd_pmc_dev *dev = s->private;
-	u32 value;
-
-	value = ioread32(dev->smu_base + AMD_SMU_FW_VERSION);
-	seq_printf(s, "SMU FW Info: %x\n", value);
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(smu_fw_info);
@@ -271,10 +265,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	pci_dev_put(rdev);
 	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
 
-	dev->smu_base = devm_ioremap(dev->dev, base_addr, AMD_PMC_MAPPING_SIZE);
-	if (!dev->smu_base)
-		return -ENOMEM;
-
 	dev->regbase = devm_ioremap(dev->dev, base_addr + AMD_PMC_BASE_ADDR_OFFSET,
 				    AMD_PMC_MAPPING_SIZE);
 	if (!dev->regbase)
-- 
2.25.1

