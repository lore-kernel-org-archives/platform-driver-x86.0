Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C890C11F66
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Jun 2021 08:48:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AEDA61D4D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Jun 2021 08:48:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232604AbhF2IvP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Jun 2021 04:51:15 -0400
Received: from mail-bn7nam10on2053.outbound.protection.outlook.com ([40.107.92.53]:56160
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232599AbhF2IvP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Jun 2021 04:51:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WugPqSi6aOSe3Kj75BtyeUG2RKPV8jeQhf8RIEYQEzqzmkF/IR/+MhR3tG2JaZAj6k0CfKExCTMMAacDs8cFhTLNlqBzkCIpR3GD/vX5GsLwvZMNmL4/uD/mgkJOhcVO5YY4Oq18D62uHEFSesJocUHGTNFd59Syx16EBD4efqi0SyfPYo+spbhHI13N19gn9UTaLI7LkfcRE95QHe58bej7PTH7LWhgTi6qzBNGso2hW1/bhK7UAoPi+ZW9Ip1UDA4nOq9UP2XdTjtXScqJ4J+8kUhJI5+RQ4+dCf4l58WSdeRSjOcKJC/YjFHdEvZlliozL5fcpH251SB+G70WFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXhwKvrqvRwDRQ/cCUBW5CPa7ipzyEdRwAmmBlfCkLA=;
 b=ZNJ0xtdiqlDwEqgHmuCXk/Du2uuTKYTGHrZkdtIpb4V3EEJ9JNrbxPPX6izb/AQ1qvLgWij+Xjjyyb+gjDAKhPZgXaSQbZmLWor/MhsfIAZbKjRUUwppIxWdxDYeTmCz9acMw3HfDIEXNX9AmEbae4h0asntRiuZxOCDDnptcoKMfYrkdn4QB3amyojkfwk0kjs5Lqn28oZk6VNh5ijg89SntbiJ4ssagWVO7XoODDcABV4+l1tYyLbS/yxutIQnyG1CAmF7JNsnYyNaupay9wbqyREQ/J803dtOuTdNEz9M+eh2WSxXTkTGUUyzi+jy1o0agmG+CwvpsjS+5t8fkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXhwKvrqvRwDRQ/cCUBW5CPa7ipzyEdRwAmmBlfCkLA=;
 b=diI8iYLAdtizBrZY1kofVwndJ6H04tIVNNUsN1U44UzgzXjz9vRDLTMHxqv4HbMtfjrPrqBNwuv3/leGGD3R9Nrlt9xkSo2M4Qk0t/nq/vuBEpQQGvl2pC2wCTqH7OBNhlehoOff//2nuFqc/2L4DKBkDFbWVkPAoDDkhWxbNF4=
Received: from MW4PR04CA0307.namprd04.prod.outlook.com (2603:10b6:303:82::12)
 by MN2PR12MB4143.namprd12.prod.outlook.com (2603:10b6:208:1d0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Tue, 29 Jun
 2021 08:48:45 +0000
Received: from CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::47) by MW4PR04CA0307.outlook.office365.com
 (2603:10b6:303:82::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Tue, 29 Jun 2021 08:48:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT044.mail.protection.outlook.com (10.13.175.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 08:48:45 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 29 Jun
 2021 03:48:42 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 6/7] platform/x86: amd-pmc: Add support for ACPI ID AMDI0006
Date:   Tue, 29 Jun 2021 14:18:02 +0530
Message-ID: <20210629084803.248498-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629084803.248498-1-Shyam-sundar.S-k@amd.com>
References: <20210629084803.248498-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c1ab666-f9c9-4203-d4b2-08d93adab46c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4143:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4143273B8C5220663950C32A9A029@MN2PR12MB4143.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HPkUf480bUINEUks3iyYXr9ZEKFbKXYDODXh/KDcZTGW8Csc74obThYxlFH1cXayMq88HN3KgMLYarI8DUcwUi8bgC7PT2yJHEthz1FhVcqX3P6DNMetFcxB9OpOamIDc1gkBYZgTr5K/DURm4zY2FrRewDieiOiMhoaO2WE0icxCmIgvUA5H5TTuqCwukCIrYr+0Cc+Szq1SKptNP68aQ8BtlVYuEGDgNyudU/37FbD2pPiKQ0+cS+OK5pZYK+3XrJwFR6hFmlVdm4Z8TniCTF4mz6H/qL4vXSczF7Wx0B6KXb5jEkkbHPhpP9+SM7uB7SeGU05bRf4J2JExVUyghhvcwP78ugU7DPwPK0JBtF2zXsYfxVZpfPyDJUhyUmgR03g9XVCWK2psmxIhjGu3EVto/87hKkxENQsyOs7UYtMx1jqAwE3Sfe8fwNhATqqOFYbuRxwqTrSj8GvbvqzkLNV5SiDeABem0SSa0kZAVY3YG0fkLFSV++yWZUiiUEjiJb0gDbJXNosTRIFJ4iPhbm+dT5LSoxN1p7/rxjE7XF7bKthjwUD7XAg9JaU3Nrv5yaFicK4hwSeK+wlpZ6+hzbhBZsDaChSQjcolaqb5NA+V2YaLHMrrk6PBtH4qc4bAJzFL/YO6tptwd4DLbRci+8xu+5Sr9OGBhJ4q1GeYbjlpCd93PAAXI+0lzwsXJI5ZAm78uD3Plr65bYa2QOQUE4KfhqyhflsafljAupx1fk=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(46966006)(36840700001)(82310400003)(7696005)(8676002)(16526019)(1076003)(8936002)(81166007)(478600001)(186003)(336012)(2616005)(110136005)(6666004)(36860700001)(356005)(4326008)(86362001)(70586007)(36756003)(316002)(4744005)(5660300002)(2906002)(47076005)(70206006)(54906003)(426003)(82740400003)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 08:48:45.2309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1ab666-f9c9-4203-d4b2-08d93adab46c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4143
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some newer BIOSes have added another ACPI ID for the uPEP device.
SMU statistics behave identically on this device.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v2: No change
v3: No change
v4: No change
v5: No change

 drivers/platform/x86/amd-pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 7f011c3f60f2..c5054fa2aed9 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -469,6 +469,7 @@ static int amd_pmc_remove(struct platform_device *pdev)
 
 static const struct acpi_device_id amd_pmc_acpi_ids[] = {
 	{"AMDI0005", 0},
+	{"AMDI0006", 0},
 	{"AMD0004", 0},
 	{ }
 };
-- 
2.25.1

