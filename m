Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B9CC83F11
	for <platform-driver-x86@archiver.kernel.org>; Sat, 26 Aug 2023 16:13:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjHZQNN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 26 Aug 2023 12:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjHZQMt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 26 Aug 2023 12:12:49 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32DAD3
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Aug 2023 09:12:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZpuy5xp8VWC+cKWPJEGiIFNSG+yFmX1ULOo88huS5maDrnmcss+WPM/+k/jZqrrey9+LBfpoMyXy8/PHRMUjMyIb18YH8TdoHRCMHESFreSv+4KK56lQIB4MNibjGdVlpoPy+JVAkCB2neM7eM7BJAbNc9Ju+3bj1VRAHS8JL8Jb/pfGwOM99xU9GbsrQ2FG3u9cEwODTXXgDtNxWNtRfJgqCcwWW80LYtUAmYtM4Vpaebhhk3UOoea8VJTZyMs71bqzqU7jeuasj+sCzXo7kZViYVnhF3HelYlXKhA1D1+qxuIs5UiRId6xBppbU0kLhJYQw2KDA5Pqlp+Ci6x+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTB+XDBcrr5M9J/5+XLCfNS3ViEW0dpgt1a2Z8AkkHU=;
 b=UzxLmWuFWpQIVTjn18UDuJUS57MixbEaXu6og6kNpSkzVSFnoeB1E3Pleb8Vdp8HzMod8SDm7zGO/kUzTeOqJYA0nSiJzH7WdZpTZVsAUBK3LaF3PZ1YFJ9gdxNvYcweMuu/0J5RPvyA0PX7QRy2WhzrMIByL/mGf0ujV//G+n/0DNAiw70RthZRbIwofbQtlb8nF8ViGXcPEX6c0Df81yy+whn+iOf8y/FP8OioCQ/8WbvfyvgtZswfYaJKPNzFir1LtRgo2Xw2VhjrEJgHzu3lnpdOTRZDZCc9dVvZC2aX9cAX0KnuTyQQtJ9b4wM21Vref2dBDZ8vh9/CojllnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTB+XDBcrr5M9J/5+XLCfNS3ViEW0dpgt1a2Z8AkkHU=;
 b=VkrNq+uHQbiSoX6mERXRgP74D2VxZ38pppmMVq7VaifHBFhSc9Iv91W7W4LxY9XBqHD6lQaXk6BEljGdUMNhhbZYz/4bPuHWMT5+NUTw4WFtF/XS/NFHeRWk1hul3T3eQoW2rSX8N5B5RWgCdlDMUW6eXT55eOgwTALt5cnw8yo=
Received: from CYXPR02CA0068.namprd02.prod.outlook.com (2603:10b6:930:cd::28)
 by SN7PR12MB6912.namprd12.prod.outlook.com (2603:10b6:806:26d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Sat, 26 Aug
 2023 16:12:44 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:930:cd:cafe::2a) by CYXPR02CA0068.outlook.office365.com
 (2603:10b6:930:cd::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34 via Frontend
 Transport; Sat, 26 Aug 2023 16:12:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Sat, 26 Aug 2023 16:12:44 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 26 Aug
 2023 11:12:41 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] platform/x86/amd/pmc: Fix build error with randconfig
Date:   Sat, 26 Aug 2023 21:42:13 +0530
Message-ID: <20230826161213.3180194-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|SN7PR12MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d9ed29-3d79-44d7-4578-08dba64f481e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ipNkgyT0/88C6gRFa025oQyjbGzaFRij3Ua22UFTDcc9k8lDr7hgCjKRUWGLXfB6c3I8Tgp9g3KXDmouKXi6XLZjXadLSk0Z8Mz4C8BW4M0ZZHiZ8yBvcivcgMPKDebg/WDkf+cbJSq+hjy3856lKVxycvuCXIbxYxxcGfuwJ+Sp2na1di03SB8saUbAOnM1l+2mO+8Z3F/BHXRxPOwU5wXEaTmavcKlp1yubVnVhZZeOZI2I76GtVG74nifUiWw10nbdgY3+rrG9iFtCJj/2nsd3K+rm9uFAIq5mC2N2WYCAUtyHdNpmKljESvcDn8J58h/XZiVkoZnDlp/SofpA6DVjBv5Ik9sPCXvf9dmn7YtsTZxDlJvZUQOu6VT1C43O/8dZIg/IaqIHCf8wvp746PoSV9X0/w5oYyczFR+PwAA1qorVfTRUFroucQzAkAnx8F24T/NFAH6NtiX00POVWlA5lTjBbtrVgM436co9dvyLQ94EucHqtNXPPaZ2JlrBRf0UFBSvG9L2DripuAsdbO8OUU5IHBY4Fwoj9eZ0zrWzZfLQsSVWUAU4LbI+GhGdLcstqg6QWxHkZswxhEL5/3HWw8D4Ylc7lofm4vsTXuL6owitpOw6luAKPFiwJC7M9HVk/JOzSSpDeIbmVMdipMmPVlNed/icuJqZcSIm9/jwRDzSEaqFnHqSWJkcsuOviuB4W2yZWSdP69a/NiWkd7ysP0m2HKxj44ZPafsQ33KW7voWMVge7LxHUw+Jsoz6VAFdkVQycUpuVt9bXw29g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(1800799009)(186009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(40480700001)(6666004)(7696005)(2616005)(1076003)(40460700003)(2906002)(5660300002)(86362001)(4744005)(110136005)(4326008)(54906003)(8936002)(8676002)(70206006)(36756003)(41300700001)(70586007)(316002)(82740400003)(81166007)(356005)(478600001)(966005)(83380400001)(36860700001)(47076005)(26005)(16526019)(426003)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2023 16:12:44.4690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d9ed29-3d79-44d7-4578-08dba64f481e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6912
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

on x86_64:

CONFIG_SUSPEND is not set
CONFIG_PM is not set

this leads to build failure of the AMD PMC driver. Add a 'depends on'
in the Kconfig.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/lkml/5181685c-29d8-22a4-a2d7-682f26e2e031@infradead.org/
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---

based on 'linux-next'

 drivers/platform/x86/amd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index d9685aef0887..383ae4c1df00 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -8,6 +8,7 @@ source "drivers/platform/x86/amd/pmf/Kconfig"
 config AMD_PMC
 	tristate "AMD SoC PMC driver"
 	depends on ACPI && PCI && RTC_CLASS && AMD_NB
+	depends on X86 && SUSPEND
 	select SERIO
 	help
 	  The driver provides support for AMD Power Management Controller
-- 
2.25.1

