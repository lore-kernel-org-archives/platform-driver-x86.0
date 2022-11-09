Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F499C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Nov 2022 08:34:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbiKIIef (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Nov 2022 03:34:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiKIIee (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Nov 2022 03:34:34 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A8A13D06
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Nov 2022 00:34:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6kXSGlY5THTwqOhD0pZdIYVC4Q/jvUPtwDN9O0fdLTAQzXCmkldr0hi7HxcGZeHXBz8VjFcO2KMjUEvLc0h+IvhHxvqDS4RHcsnkyZwJdNK2m8M5mYvayx7ZisLdyoh7bvhj61BnsPwx4itIF9Ys3N4NU5iEDi9TxZxXOgzOxJ4RWv8SnNhILuA1x1Jk3p3rQbLiMetFySk4CRABnbpR5nnlvemsT0bY2xyqQJQ9Zi+Qo517nxivhnTfEYgVwFW2ZCBZtw2VyesiyZcSmVmVkdg2jSt/IJcGjkUiLJ7jYrEes7VpDlXttoVRSI05UKgPwtK4p2EBE94bNy0P6XUlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYrZqP3nAnj51jayJTd4HRtGUa5e/L/T3B0N+6EgkrE=;
 b=a1jbOrSv1p7SQW55pNT0C9W/TCNWRVabVcvh/xBB9pAIR000/LT6B9uk2m6uBkPLb1bGf3CARadYHgj1B7oHldYgOQfdNknX2ryUFzu3mGtTuteavRG6NhZ1I9F7kZj1PZetJnG+gRZ/we4e9rWhJo4qc3W28dKBZqS64HP8pjSJMES3dpMhNPpLdmU3uUS8gdhIf/jQnfd7Ivoj34bSYn0EXZwmdSqfyI7lrwGnj4EP/BmgitavuDiUs1DVUPdisnNE4hsy8z19/HK89ysaWrlNlR4AhG7zXhII71dD+vkFf7y4GORe+bAPDyWnGPMoM+d1kF45/H1rzC7e9nAClQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYrZqP3nAnj51jayJTd4HRtGUa5e/L/T3B0N+6EgkrE=;
 b=f0dROuiA3GoFxhSKmBy9Ry2UqP+8VTcCM1pa7juwOmPXdS6+GkAa1CvM3wlrMsP0OARLWCWJp/7gwiiM8ZaAfatBAn0iZ6nWuY1Ch+EGyGQK3z3MNonb4WS4wXT9udnXwv37Fi+nQx21g+Bv5NZTZCtR4/DuhTQV/xSJ5O9oNRo=
Received: from BN8PR15CA0032.namprd15.prod.outlook.com (2603:10b6:408:c0::45)
 by SN7PR12MB6671.namprd12.prod.outlook.com (2603:10b6:806:26d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Wed, 9 Nov
 2022 08:34:30 +0000
Received: from BN8NAM11FT116.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:c0:cafe::ae) by BN8PR15CA0032.outlook.office365.com
 (2603:10b6:408:c0::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Wed, 9 Nov 2022 08:34:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT116.mail.protection.outlook.com (10.13.176.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Wed, 9 Nov 2022 08:34:30 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 9 Nov
 2022 02:34:25 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <mario.limonciello@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86/amd/pmc: Add new ACPI ID AMDI0009
Date:   Wed, 9 Nov 2022 14:03:46 +0530
Message-ID: <20221109083346.361603-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT116:EE_|SN7PR12MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: e01e68ba-e2fc-4611-61ae-08dac22d3878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ed8pnvJkYT8m/8eobEsQPrlv1zwPDdnluqJabtcDJsguLoENFZrsZPNbMyfpOOStuizXYtQrHUShdSasolRwBTl4P/xxS28dvtD557U0DGc6Krb/1J3AljX0dusSP8qKzBI+uVzFVXN+E2w3b1k/jCmkZmQM0d4z2qJhwqKTiqchHHZAvL2hPEEPv20v1RrGxYabMnVejqlBQ7iVCgKIDQXXRY3tulqyzltJkbxkhi9cUowS1kUbPGrMa0HAXS2T/uHDJybdzwHQgK/nnbhuA+3MmuPkAasLDcjJ1/OgEeoxrEhjS52K/G2PRwBYPF63CniPEwbcBbZx0HniRPcS+LLpJahur4Y6jhstDtyvnJdTbNLfAWIdk7EIvqtJ71jbYZ4JoJcD75YUrcp6W6XC1ugeKGdXRy809jyDhzVhzDGI9ABsIBUFYT7dVsmLBQ7bgbfganibD7GPZ/DphWkU5dltN+TYaE9ZpWWtPcQ/wMPLXV64OGAzyF8g7Ziu2pF1gdcbZ4cn1M98QsZVRnA4SclUmoLU3AV5JaYDmmnRJwletNV3hl79wFLexMrG12ovFwKzKJXdkWDAAJviaLdt238hUAP1PlrZH0h5J4YH5VxwLV3CTnjqgjOnfUNfjG8jzzHrruBdzFF5sNCU2zaY4/oxGwM23TrqF+mTKURvkYv2jiF0BGNuwh8suLS522rTElVyb2cr++sWf6IUU0llBhaovkVnISV99BsRq6ihA9lxDCho0FG5JxRF44uFwGTaGhiZ3PFQc7TThrhZD0jMPVW1lLzE/pWfRSbTifGUd2B7zXEGy0jOuVGEwltF64Xh
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199015)(36840700001)(46966006)(40470700004)(316002)(41300700001)(4326008)(8676002)(8936002)(5660300002)(4744005)(2616005)(6666004)(478600001)(26005)(82740400003)(40460700003)(110136005)(1076003)(47076005)(2906002)(186003)(426003)(36756003)(16526019)(336012)(7696005)(36860700001)(70586007)(82310400005)(40480700001)(70206006)(86362001)(54906003)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 08:34:30.2608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e01e68ba-e2fc-4611-61ae-08dac22d3878
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT116.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6671
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add new a new ACPI ID AMDI0009 used by upcoming AMD platform to the pmc
supported list of devices.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 96e790e639a2..febd798d1fa2 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -964,6 +964,7 @@ static const struct acpi_device_id amd_pmc_acpi_ids[] = {
 	{"AMDI0006", 0},
 	{"AMDI0007", 0},
 	{"AMDI0008", 0},
+	{"AMDI0009", 0},
 	{"AMD0004", 0},
 	{"AMD0005", 0},
 	{ }
-- 
2.25.1

