Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6854C11F65
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 18:04:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8F2D6195B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 18:04:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233028AbhF1SHN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 14:07:13 -0400
Received: from mail-dm3nam07on2052.outbound.protection.outlook.com ([40.107.95.52]:37153
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234838AbhF1SHM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 14:07:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+0JT9eppd+NLJhEUa7tECLKxCP1Uo2hIBabYdZg2rSoTau/P+ME+G4IP4j7VrV4O3lEJL2KbAgiol56qSxX7TOT1Wf/2adXhP11N4F47NbzbrMIULiQQOjN8PtftRM6mz6xR0OlevJB0oenOp+G3eyNvH5RCknPGPTMSFgbtfE1lkVzaswDzLtdsBc+irWAOclMLL7TuKnqwcqHAcqbb6jMafIXRRbUhcyDOS12Wga5XDCV6whgqmfLXlfJQRGrVwauECfx2yqhGo0rGw65pgtuukE+H91BRFQZlZek3Sq6Dmr3nnm1hw6iIooNcNFZjfKG41EQCn5r9dd+wnBNLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSm7OdBXaAIhagYTKXIB8d9/tOLEU0cCdZTXny8tywE=;
 b=kjdEterv4BmzsIWxKB8XsGenAdKr5Fgwa7ir9fVxDxBIjpAVDrx5PR4ueejcEKww0AbVtfwG/VkiHct1TaSymDxIpcG7PXwtA+SPJO12gh+ljqO9pCipN2GTBoF2rpCd1qGM0qDnjtkF45aehygnJmWhaSa8uDLuSip5DSfsYppwOsLqZ/SPE9F+UzPHpZYY+RPzeljTCcvXoyQaoDysG0MZUmlOLs10JKdi2ookb1F6P7iQRltUonNgTNaeurfEi/gVyDJvU72P6llRodFO00lMCU2y8UYJ4KRX9UmkI3bcubyrFCxwRBdByJ2+33+9myxRFRVanminSyn0FGIY3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSm7OdBXaAIhagYTKXIB8d9/tOLEU0cCdZTXny8tywE=;
 b=nLFnPRU7Ioolt9j+C1uzePpodPuB1u1Q4lTe/ITLrbzaUQaq+YnEq5f2b8LlIcEMECLZHy2+l5ZZzojWxqcvlIf8YOiSbELMwtZiBH1sJRU3m4z18EM6BnhuVMd14zo7HTG3oMAtnJkKd7wx3oxmDzmPsaZDyiZ1p0EChVeEyog=
Received: from MW4PR04CA0315.namprd04.prod.outlook.com (2603:10b6:303:82::20)
 by DM6PR12MB2698.namprd12.prod.outlook.com (2603:10b6:5:42::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 28 Jun
 2021 18:04:44 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::39) by MW4PR04CA0315.outlook.office365.com
 (2603:10b6:303:82::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20 via Frontend
 Transport; Mon, 28 Jun 2021 18:04:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 18:04:44 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 28 Jun
 2021 13:04:42 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 6/7] platform/x86: amd-pmc: Add support for ACPI ID AMDI0006
Date:   Mon, 28 Jun 2021 23:34:02 +0530
Message-ID: <20210628180403.236553-7-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: ed4342df-360c-4b53-dcf5-08d93a5f35be
X-MS-TrafficTypeDiagnostic: DM6PR12MB2698:
X-Microsoft-Antispam-PRVS: <DM6PR12MB269818D4AB6CB86377B2483C9A039@DM6PR12MB2698.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 44nbbApZBKXU05eJbs9DKmHpdoaruuCO1VehvMl11nQaDqn11gJQeexH82eq7X9A7OSn9KsPvj73MgSgLjLrh4IKWha67FPLRqNPVfHORJvLLDaKABXN561OzPediv7qCIUhHBmlrSEQ3CHGTrB5nXZs+XTroAxV1Po8vrT9b7iDwts1N8DVhJ4cLWvyNChxenMTrfAysNvM1pmlGfM1i2oOUgRu1RDre2WA3BVxspxto4GAQePAG4WN6vMl7eDL04B41n/h4bFepEOfxTP5Iq94+Rht2ufnic/rePKqN7X2vC3G7oblCpxAiLz4RQJLmdyLxNbsW8ImNaSwpEI2dwcwSaT5v262EyjbC77xChBviIx/M/fGd9L1XqJn6cQUymeYEn8Hse/tiR1l/9MCcYtgQEgzPlxKUCQC+CTneCjI6/55wA49PgYP8Xf0OyWQinyS1mOEWl0hl0nX6av3DWgt4Uc+vWxO6V6vikMGPwsVBBezcyxlySPY7JvsSk3Sp/nFbDGw/NiNtSUosl0HlO7NLMV+P6uBYm9Zwzof2hqm/GvT4k6XebCCQLJ09ME/9QK4Mqo7UD78hGGo/0sni+le5aCCYfCHlCBu9P/um/0B3moEFfbtaGIycoX5CtCDsBAIfPsl6RL5u2vHK4l5Flh1REtzjD0Mh1qn7eRnaFbqnTUK3ydC/cFRP5qPpZCC1H7mHJuJgoUaJrLRMkS2fU71a9FDH0e0PpU5BiQn+b4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(46966006)(36840700001)(8936002)(47076005)(8676002)(4326008)(70586007)(70206006)(5660300002)(336012)(36860700001)(426003)(6666004)(1076003)(2616005)(4744005)(86362001)(82310400003)(110136005)(82740400003)(2906002)(316002)(81166007)(26005)(36756003)(356005)(186003)(478600001)(16526019)(54906003)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 18:04:44.5931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4342df-360c-4b53-dcf5-08d93a5f35be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2698
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

 drivers/platform/x86/amd-pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 65dc4753b1d4..901f2212bd39 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -470,6 +470,7 @@ static int amd_pmc_remove(struct platform_device *pdev)
 
 static const struct acpi_device_id amd_pmc_acpi_ids[] = {
 	{"AMDI0005", 0},
+	{"AMDI0006", 0},
 	{"AMD0004", 0},
 	{ }
 };
-- 
2.25.1

