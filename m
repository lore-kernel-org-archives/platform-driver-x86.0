Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9B5C11F66
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Jun 2021 08:48:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C631D61D4D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Jun 2021 08:48:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232599AbhF2IvV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Jun 2021 04:51:21 -0400
Received: from mail-dm6nam08on2084.outbound.protection.outlook.com ([40.107.102.84]:27008
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232518AbhF2IvV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Jun 2021 04:51:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtXY59C5hCf8LoCyhlZsHKUNo0I7Rz6qLM8kauBgyZyQJCjZNryahPyDLP84Jp47JFjvuibabYC0aBBG18hgdM4888Buw2B9TwrdK62BJydKey87su5epkOweXkpCPhlJHI2Rvx7V9Q9gA80jrA8T3/xeR3eaBSTyjyWNMLC8V5WBEKkW+2udms+Ogwnx+ntakAVIaiIDPFPfs2wI5BBZJO/tBdfNxfKnM8KlczUW1jDV1U87tinqseapfSkWUccsXTJG3aOpFsEm2RCUUTVoxnci4YjKFlO1TTORnI+wTyAH1qTd9IrpnX4UlpkIhEkMI/0J4tkV90p6o0sH8Vqng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TsQfrUz5n1DQjKSjeMpgdYdCtiqZfRlTrnRjUenuFBo=;
 b=P7VG96raGb1d3YMhezlQ+IrPFacPSNTRt+y/rMC4wKlQhnoWdeZ3bV4H1GJnnO+hfpwkgKBRpYDPnJyMHl04d5fGHRE/HbMMWuWPYX9WKGM3C510Dy/pbSeEIGNbx9WabImYDGCqGZ1zKnoqFGnh4DsQmoLBeiPSBPrADDB9POUB6VPqkDjBJx0U0kUm2ZVTDlOuwNgeCH/PRQc79HkmY6tWuLR9FnCvupYQSScVYsJsq8v9sWGm33IwRdfEKpgvrdvO5JEvp301kKhomnJze7GmLPjrX4TcatJBzpvMbJ2Mp3pdm4elbTsbcuuhH9TN8STKwnATTLyWCC64ybRgIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TsQfrUz5n1DQjKSjeMpgdYdCtiqZfRlTrnRjUenuFBo=;
 b=b9wsi1ExOgMIzO9+UVjV/3X/0wqVosf9w9+9axZtT4PnoIZzqfke7vDY91qZIjRBesstdVS3YoSNQ/9I3SlcXSdx24ARksfnMlExBB2Rp+Nwi/J7J3j/ZfAFAla8hCmPmEpU7vMEYclzgDvYwHHzLG56XAdQs/FYaBSdLKoy/ww=
Received: from MWHPR12CA0048.namprd12.prod.outlook.com (2603:10b6:301:2::34)
 by MN2PR12MB4318.namprd12.prod.outlook.com (2603:10b6:208:1d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 29 Jun
 2021 08:48:51 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:2:cafe::36) by MWHPR12CA0048.outlook.office365.com
 (2603:10b6:301:2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Tue, 29 Jun 2021 08:48:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 08:48:51 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 29 Jun
 2021 03:48:48 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 7/7] platform/x86: amd-pmc: Add new acpi id for future PMC controllers
Date:   Tue, 29 Jun 2021 14:18:03 +0530
Message-ID: <20210629084803.248498-8-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 86e5716d-7813-4fc0-7d25-08d93adab7f6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4318:
X-Microsoft-Antispam-PRVS: <MN2PR12MB431891E8A00393D957568D5B9A029@MN2PR12MB4318.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Py++Y56JLTtMTP7TrRBl1scGKu4hFi8HpZbRIvftXVs6ikJnssUdGucvhucBWSDp2RN8WFpdu2uREIGAFqQoVCsARjGFK7iH/Dw+FoClFSVB5kIsaN7hxVWpyittL7XAUk59N9Jh/KwjssKkf0L4HDQkE0VQ7Cf6zMxKzoBXCmJDLaqGx9EsnFr7EuQR/tegvFSXV22Qn9u/5/qri+5ghkeWb5FGkEI4KHBeMID64JGPbRucXIiIwWWI3qVbVFiok+n+3bzedQmS/Fqv2fFdPuSOnLTlDBThAHsRDcVdOAwvzNscv4++++OoOwWuRcniGvaj266RVxU3xxHt+Wi6BZONAHZdqcADUH3LEJFXLlJQYOInmtulUxp+/Ntx68bfgovMCr+H19KrjJE/jzJAqDt0sHtwYUYzDCYyfHEL9cQQJI5+Slq1aeOeWku8Djrkfc1X36DehRm4sNxSoL0bewzYJnQBcBgziZxTter68rGxa2yZ8wMSltD6hviyZd6DD0ET4/Prx0jAs4Vak2EEpmxcJrwxIvR9HUVM32OLpkUZLQw0xnBtBUkIToBbVOL5/qVIP7XTHCksSGs5Jhl2sYlT/BHh1X0I4w3Wcn/z57lSMBsjC4+bRy65LuHM8EK8x3nF1V2EfUf4EH5IymnLFB0LELxH2nchaTveP7370tHO2y7E4b1mxghVg4eKjeMK+xGCRiS/P3fkBr1yMDFUE9Edw5BucPpwlL1wRpKejsQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966006)(36840700001)(70206006)(356005)(2906002)(8676002)(81166007)(82740400003)(110136005)(2616005)(47076005)(4326008)(7696005)(478600001)(5660300002)(36860700001)(36756003)(54906003)(16526019)(82310400003)(336012)(186003)(8936002)(426003)(86362001)(26005)(6666004)(70586007)(316002)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 08:48:51.1602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e5716d-7813-4fc0-7d25-08d93adab7f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4318
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
v5: No change

 drivers/platform/x86/amd-pmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index c5054fa2aed9..d2f9a62e1166 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -68,6 +68,7 @@
 #define AMD_CPU_ID_RN			0x1630
 #define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
 #define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
+#define AMD_CPU_ID_YC			0x14B5
 
 #define PMC_MSG_DELAY_MIN_US		100
 #define RESPONSE_REGISTER_LOOP_MAX	200
@@ -331,6 +332,7 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
 	case AMD_CPU_ID_PCO:
 		return MSG_OS_HINT_PCO;
 	case AMD_CPU_ID_RN:
+	case AMD_CPU_ID_YC:
 		return MSG_OS_HINT_RN;
 	}
 	return -EINVAL;
@@ -376,6 +378,7 @@ static const struct dev_pm_ops amd_pmc_pm_ops = {
 };
 
 static const struct pci_device_id pmc_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_YC) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_CZN) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RN) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PCO) },
@@ -470,6 +473,7 @@ static int amd_pmc_remove(struct platform_device *pdev)
 static const struct acpi_device_id amd_pmc_acpi_ids[] = {
 	{"AMDI0005", 0},
 	{"AMDI0006", 0},
+	{"AMDI0007", 0},
 	{"AMD0004", 0},
 	{ }
 };
-- 
2.25.1

