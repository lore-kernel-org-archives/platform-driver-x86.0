Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905F0C11F64
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 18:04:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75A1D61C3D
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 18:04:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234853AbhF1SHP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 14:07:15 -0400
Received: from mail-bn7nam10on2067.outbound.protection.outlook.com ([40.107.92.67]:23073
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234838AbhF1SHP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 14:07:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1piodIeUjOKQktHTWLnSRLndwhQS0CZPzwIbHuaiayXVN8UIIxIfL6iz6h4eEIZQu7CtgHtDeNNS/d8l0SYTDG6tACJHivOgCAarsZSpT3igSzY16KMgXv33KycjbqqiLfy29TonNA7so9aG2PdKqDXgcDT4/BSfBRoz+zlVZDbtgXOh3SHaKNkmH3ZAYsNcQSkfE7E3gnRcsjz9isPJD1Qsq7OuKVfw6W2ObQfXstDa4nTVr7NXTAZ64k1gKvBP337T6Q7114IPCzVSFAbjFNd9EOhW4rZyUHxoDrrbh1RHijCzYX+nYp9fqheLgJT/Qh2Cz3W22W34Trkxe79dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5825CGhnyAVVZ5nVbgFNu5WBN94IlQpEjcYS9lmzIA=;
 b=YOu08PNZYjuViStyGVr7It2iGOtyE7wqahSKE3vc8Q2aKN/6SZ8p14aO4G8wLKIDZnCOrxy2DJGOZKHGmCiuwZseua2t2vvaoWJjckONP7/DaDuYxrQVOfnemdRuEjxmPCNOxk/Yq7/fEcr25hJNS/5dt8NaEgN9o48xY+f5gNaVp7H+7oHz+PgD1ITYFaUhhQV0FTyX5rXoocV155YURHmgI/tapYthJcHSlY0QoxW7XM6eC1cjSd5CwsiXW5WoB6LmCQ0X7clm+YWjTffrglifLCRZ1QPh9BwuuIzo8ivxDcKw+pYtsCREmmLDqcXlvtbqfmz4MvWVp+H7Oi83pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5825CGhnyAVVZ5nVbgFNu5WBN94IlQpEjcYS9lmzIA=;
 b=3aM/AeG7mgF8uU4UGUwpp9c2OGVaZ6JC4tPcjmD3zNSLu+fXr7RsetQQPonLXwf4yHA0DzCy83Qtben3bei7Z+Bk8lAJs9jccCoGYSj8yd9klyMuTLqEydS0X263ojrjst+UpNYYJiWJag0Dz2j45lf4libDdwHzzF+lXVwYono=
Received: from MW4PR03CA0256.namprd03.prod.outlook.com (2603:10b6:303:b4::21)
 by DM5PR12MB1433.namprd12.prod.outlook.com (2603:10b6:3:73::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 28 Jun
 2021 18:04:48 +0000
Received: from CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::14) by MW4PR03CA0256.outlook.office365.com
 (2603:10b6:303:b4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Mon, 28 Jun 2021 18:04:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT014.mail.protection.outlook.com (10.13.175.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 18:04:47 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 28 Jun
 2021 13:04:45 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 7/7] platform/x86: amd-pmc: Add new acpi id for future PMC controllers
Date:   Mon, 28 Jun 2021 23:34:03 +0530
Message-ID: <20210628180403.236553-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628180403.236553-1-Shyam-sundar.S-k@amd.com>
References: <20210628180403.236553-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d145f63-5132-439b-d7df-08d93a5f379f
X-MS-TrafficTypeDiagnostic: DM5PR12MB1433:
X-Microsoft-Antispam-PRVS: <DM5PR12MB14335B5B3FD8B851CDCBFC839A039@DM5PR12MB1433.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X/nblF3TFFX13XF3SYLoIrStoOzamk8P9UR4p5+uFlp65Z4b2TBVJuApUW9iJdsRQ/pLnLkIH7u28nKv4fWPRUDcwX5fQxjvMzEoVnPQJEchPRHFEpnjeWBMUKxWe1lm9Ro6LEvUpGT1NWQgpNA62l88kwlYDODdBwpXIS7mqL707v/AcaFvkuK2XbaSiDMVFGiR7uk9htahTjut/hsu60xc1rpSrpn0/FLqY6ymGvlH0wgNQkVlU6vEGCvjce5nGoVeY9go6NoCCjd8gTcW838QnR7xuQroumrjOU0gBeOlV98UOKz5xQzv44ed9W5M7dP392u995nXfQWY/wJxh9bWP/cPwCDS182QnwD55fpEAgUKBueeQlgA/DcClHMHdhEw87xp3O8bbpvuIqeKzBOGrnssoUkItufEcpR/fQoVHdq2jVizVhsRBYFBNvmJz27HN2t/6jhE1SwB5iE2dR4I4w4m+FTTit56rko/dO2YCS8QgyGs4BAQV227tEYzJfHBujB89b8Ty05ryPhgq3fFd5To8nUW3BYda/CFL/H4klNqrWSmKlKfmKSbZofq8qQTMb8Jw47Y1cg+tgV+HcekZUqLjDeLZhvMVWmbR2IYRbR54QUyyu8DORw7KhjW/06wJ91+CWVG9sv0DpUWSJRYUpGs/3NpYVQP3dwb4+D+kRbAOMiVb10/84t8GeiDvgbO40SzyYeUPQtDrkZoCEgetTFKggoi3zodtvxPDGw=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(36840700001)(46966006)(5660300002)(2616005)(7696005)(356005)(8936002)(81166007)(16526019)(1076003)(186003)(316002)(86362001)(26005)(82740400003)(110136005)(54906003)(4326008)(6666004)(336012)(70206006)(70586007)(426003)(478600001)(82310400003)(2906002)(36860700001)(8676002)(47076005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 18:04:47.7523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d145f63-5132-439b-d7df-08d93a5f379f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1433
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The upcoming PMC controller would have a newer acpi id, add that to
the supported acpid device list.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v2: No change
v3: No change
v4: No change

 drivers/platform/x86/amd-pmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 901f2212bd39..2761e1398b03 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -68,6 +68,7 @@
 #define AMD_CPU_ID_RN			0x1630
 #define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
 #define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
+#define AMD_CPU_ID_YC			0x14B5
 
 #define PMC_MSG_DELAY_MIN_US		100
 #define RESPONSE_REGISTER_LOOP_MAX	200
@@ -332,6 +333,7 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
 	case AMD_CPU_ID_PCO:
 		return MSG_OS_HINT_PCO;
 	case AMD_CPU_ID_RN:
+	case AMD_CPU_ID_YC:
 		return MSG_OS_HINT_RN;
 	}
 	return -EINVAL;
@@ -377,6 +379,7 @@ static const struct dev_pm_ops amd_pmc_pm_ops = {
 };
 
 static const struct pci_device_id pmc_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_YC) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_CZN) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RN) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PCO) },
@@ -471,6 +474,7 @@ static int amd_pmc_remove(struct platform_device *pdev)
 static const struct acpi_device_id amd_pmc_acpi_ids[] = {
 	{"AMDI0005", 0},
 	{"AMDI0006", 0},
+	{"AMDI0007", 0},
 	{"AMD0004", 0},
 	{ }
 };
-- 
2.25.1

