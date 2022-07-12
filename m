Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B585ECCA47F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Jul 2022 15:06:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234022AbiGLPGC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Jul 2022 11:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233964AbiGLPFd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Jul 2022 11:05:33 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DCC2C25A7
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2022 08:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcRzQhuzNMJ/hEz4c1qVLCNKLTav9cYnFIH7TktOG/OHdJBELrjE/WujZIAu9kcC9DO3ThQPTLkd+5L0Wm/rHemWgsvLQdZZqWqQ4Faxrl59gnlghHLcWBP8zjMPCd8o6PiVPwwUl6HP5c6AcQjJqrBie+Feb4ZtCvB9zPTPhw5fTWVwkQQUrghXS/kYAaWlHgyItLIXHnXeQiKHaqZKoyqdAv22Q7BMYixhxQVgnVaytqy8xZUdRUYDV0orR0RM5Nv/tgq4j5i8m8Pwj0svye+rTSxpk+R1CumEiRCvpIPMcFtcxeJ9y0H7QGdAdp7rZ4MNnNpKAjlw+YvyN2cM1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLMB1QmNa0dnpRj8n4OhI261L8GCynOia2K61WFwVYs=;
 b=I3Kj+rrbGRZVwx3OPllbLti7YTuNbDztk9saIF7nGMsCzoCoy6Bo5C/ksD7glsXKw5+W4GMo7p2xw14p78R648ktXouUCMJxumyvGqs/JoxF0PryTFVVTVpKyLtHsX8hv8g8Tsk0zYlhZON0KV5diRFgQ49eRt7wcg8c+A+VjR+0EmRTN59rouSczT3uBxRp3OUuAXHv+H+HHCQKZonyM+l9FIy1wZ6zGsYWtfOfCrBIG+hpyniezCHzLQLqUCx6dw+eWJDxm5bWbQRWgmKdaAdFE4dIcgbkHtxpSx585ZG6SUbxhQxqb6oyrC9yLmIyVzNXWCkiMxTon1NXkZ+Z+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLMB1QmNa0dnpRj8n4OhI261L8GCynOia2K61WFwVYs=;
 b=1W3fVLpC/qDXg/MDRQTNdR4Sq17KkAjvjYyYm+JH0fVygsA6brht7z+M3OajZe1cKqcyF3njjdVsB4QKpGVy/APTikCS7h1hdZxjqPKhGNyLtoYNKSqEsvdLt/s8CXLjlRQhmpwvxtYDo6kVQvJ6KbJnfiA38qm7tc7AfMENPNY=
Received: from BN9PR03CA0626.namprd03.prod.outlook.com (2603:10b6:408:106::31)
 by DM5PR1201MB0267.namprd12.prod.outlook.com (2603:10b6:4:55::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Tue, 12 Jul
 2022 15:00:17 +0000
Received: from BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::46) by BN9PR03CA0626.outlook.office365.com
 (2603:10b6:408:106::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.22 via Frontend
 Transport; Tue, 12 Jul 2022 15:00:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT009.mail.protection.outlook.com (10.13.176.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 15:00:17 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 09:59:57 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v1 15/15] MAINTAINERS: Add AMD PMF driver entry
Date:   Tue, 12 Jul 2022 20:28:47 +0530
Message-ID: <20220712145847.3438544-16-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dab0b62f-f9fe-4b0c-8024-08da64173b94
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0267:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gMa0YQzjdJyIM/Xa9x+UIKnrSWURw27swryb2hhBNVwNYRDzIfjJJOz5Hu3zX8j8tZg6zfDdlcu/0dF9SGxKveSZNuadaXJOVg6J+mj+RhyfOQ0uhP4DmXxvNRf7z4BezMx448W9cwzDb5rxcQjsxP0JRijYYe+Vh0shc5R6O3DnAvAObFhFY3TDYUnqzFyQh2vatZBG/syQfP2DgjZnrOQ9uQU3RC+p9NFtmsekX2Iy8nq2WALsySYTZOXw4bzK3tBIN37VL+2hlvfQ6v5DRSjHO8Nm9gQ/G9kO6fNwkYk0WU5BMQ9vbDvgH+fOVJ2IzX7ZiCSKPQLKTboPBY13rIgjAqJ6byunXAGu9draXmBbaSDckgzyLCIvwFQ36H2RxxL5EmnPMELMiYtYU/IhUrDY8uwOaWvqc1oxs0pRF2mlDUdGAguLKLiW3R+ehbCQvbh5X2v7Nb+F0Z6tgKuNUFO84WuYPM1d0He6ng3XX6CmRdhdDwh7DkeSf6zyS2YH24Zogg1TFSxOdKegFkNOdu0q02qnpI1omIkfZ/3sOhAlf+G99GZKVHf9CgvYi9P6km8ubA7hKlbc65xA1mDNoIhOXa92LWACe3iR0xoelgQvNlLuXN1DhX+M/6OjDmypfa1OzTPVrj1RCpXQLUN2Im6glGWnAa0gzutiOWldgKzYjzBbnZzMBy20girfhLDscHFPNqXjaFDqz5nVz3v4zd8Y6yxcuhrKZMmqemR8CpPb57CNvIR0iw8b/R7AhlBOTgvJN0gz2zxjkF23hGk5SKkwiUFLL3xJNsv60ss5kabXOuo+01lkzDzUiDgfjoDHtaBRqg/Abxgx8btR2jqb75Ytx4TM82/3iTD6ZepsK8U=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966006)(40470700004)(36840700001)(36756003)(82310400005)(83380400001)(36860700001)(41300700001)(2906002)(8936002)(316002)(4744005)(5660300002)(40460700003)(81166007)(426003)(82740400003)(16526019)(8676002)(86362001)(478600001)(7696005)(356005)(4326008)(70586007)(186003)(54906003)(336012)(2616005)(40480700001)(110136005)(26005)(47076005)(6666004)(1076003)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 15:00:17.2022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dab0b62f-f9fe-4b0c-8024-08da64173b94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0267
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Update the MAINTAINERS file with AMD PMF driver details.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e01478062c56..d3f6cabcaab2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -998,6 +998,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/amd/pmc.c
 
+AMD PMF DRIVER
+M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-amd-pmf
+F:	drivers/platform/x86/amd/pmf/
+
 AMD HSMP DRIVER
 M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
 R:	Carlos Bilbao <carlos.bilbao@amd.com>
-- 
2.25.1

