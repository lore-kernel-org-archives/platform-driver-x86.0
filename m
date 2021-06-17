Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E03C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 11:31:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BA5E613CB
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 11:31:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232350AbhFQLd3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Jun 2021 07:33:29 -0400
Received: from mail-dm6nam11on2059.outbound.protection.outlook.com ([40.107.223.59]:33760
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232308AbhFQLd2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Jun 2021 07:33:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpxlOvfjC4Q0laeoVmituivTsoYv6r7Bh+CFpcebXbmAKQpbNtxQz83LKwMbdy4jK/Wom9jteI0vHcxgEfzzvNTKjiUjOQw+r4//BnrRfzuis7N01IbAt/XLlO3bPpni9WSSv9yPut97CsovF4aayu3OeYfL6X2O3j8uUIvRBQOh15H3nc+kuRtuvaLO9hoaJ89xfGJDlurMWr8qGXwoMfSIB2sm2rDnuxCorrhoeH7SLbxIvIe5pi16CxZtjyqR8ViGrEmcimOeaOIoBAJYdQLLYg+Vs8xsFCJ9bTsyKzHTFEBY9ZA4eYObs08FAKX1AC4JeYp+yEIDSH2CeaFjgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfBG8LzzLLQInbZbdvB3bOF3WSzWgZPswz+AjCUdi2U=;
 b=W31t6TsCer5a5RYO0yEkaVgM6swkNqDTMOJdWKL/QrAxW768uaal+eU+4Y/QB9DsxOC6SglZlNdXtfdXGj6gtApdJ12aSEyzOilyobceGjmgG0wZyrP2pkBPRX2VfC6HP5arcr84qrr3Pu/vSHFqRNbcW31wF7jfb57ilgJX6A8NVZX3TNFeU/jgiFC+UR96reyBzmHJuGDx2F0cIwfdZUqp9jTsp8rak8RsOfuuXnDLBnhuX6+7f2D8I5hgHOEuLcym+SC9mYfB067jqP4ygp7s00I9b2saWKUjUtSHpz7+eU7WMIk+s2gyoCGLpfvglZxZ+woPGUqPi1/zz3Y7tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfBG8LzzLLQInbZbdvB3bOF3WSzWgZPswz+AjCUdi2U=;
 b=c4G6fgdDZnMuPxV99RgZMq6qgFu9fbo1hvhvBZ6+2th410R5Iyf5NUxi+XdHF8KcF/2dDTprg57nLisiHwZCdryAv0xfwr9TqsZSUOK8MZ1K4a8CZ0feQoPHTvJ1vF0P7zfJoCSy/6BwI0LFp/c7STDKS7N6LFbDkddWmn5ZkUM=
Received: from DM5PR21CA0001.namprd21.prod.outlook.com (2603:10b6:3:ac::11) by
 DM6PR12MB4636.namprd12.prod.outlook.com (2603:10b6:5:161::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18; Thu, 17 Jun 2021 11:31:18 +0000
Received: from DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ac:cafe::c6) by DM5PR21CA0001.outlook.office365.com
 (2603:10b6:3:ac::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.3 via Frontend
 Transport; Thu, 17 Jun 2021 11:31:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT022.mail.protection.outlook.com (10.13.172.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4242.16 via Frontend Transport; Thu, 17 Jun 2021 11:31:18 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 17 Jun
 2021 06:31:16 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 5/6] platform/x86: amd-pmc: Add support for ACPI ID AMDI0006
Date:   Thu, 17 Jun 2021 17:00:39 +0530
Message-ID: <20210617113040.1603970-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617113040.1603970-1-Shyam-sundar.S-k@amd.com>
References: <20210617113040.1603970-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9dd3557f-159d-4885-476a-08d931836ce1
X-MS-TrafficTypeDiagnostic: DM6PR12MB4636:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4636DE71A18B3C28E814DD0F9A0E9@DM6PR12MB4636.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1iXQ1mRKH1g1UooUTiL8NGn3unNGgEAN59iFBhjYA5Hoihl6lae+ObdiPMF+H7u+ySwAnrwWqVFUOCDK36aMynOn/txL9TL/W93P2RSHJPow1XQxiRLQBIPRWbqRAGWgC3lw2eHyYvf2zT/fXen4oBal4Pd0/qIrY811Ox1JCyUwyaPd6+/IwqKJkrcIvcsv50vPGkpHrcR1DRdJ2vfHjEtGrz1/Q0hUlSozyc3sng3cnMiiNC8pw1DKNe3ucvpCeyHW3+buX+iZOwazrR8Z9MqAnrOxD7gcCGCfN1nQ93FlTBTiv0q6zjWqP52sJ8XUaM9Qsb0vz8Ze+AjbfEfN8aPoCbdf5blDHQFTw3wm7LI41glL77sgd7ETH5R3W1YLwkVmzejGvkWwpuEd1Lszrynyf3QuXfxITr1yr3eJ6DvwpJgelhnkLJ7adInaOHejBvUtToXGRi5018iYv+9GXLKjwX5opQnaMMrDNMRKubxce3JEqf8b5Prw9tovrEhKV5SmS30F4EqJ65NAAq55tk/S/0noWKSKfW6gFDZ0POmks9atq1UwEQjLrrRm7uAK+9y8oJHgBSfwFmn0q8BCiM9Xn4Gcypso8Fm/kZoq2GmHy4xfscnPT403g0tanug/NQ2CZIHltVAOjvh141Hf/AwPpFfuLUCxvKNMz5c4T0JdSGBZcVVMA4hPpGhDnMrU
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(376002)(136003)(46966006)(36840700001)(426003)(86362001)(70206006)(4326008)(36860700001)(36756003)(26005)(70586007)(4744005)(82740400003)(316002)(356005)(2616005)(1076003)(7696005)(110136005)(336012)(81166007)(6666004)(47076005)(16526019)(8676002)(2906002)(186003)(8936002)(478600001)(5660300002)(82310400003)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 11:31:18.5846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd3557f-159d-4885-476a-08d931836ce1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4636
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some newer BIOSes have added another ACPI ID for the uPEP device.
SMU statistics behave identically on this device.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd-pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 174f067f0756..e024fd36bd26 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -443,6 +443,7 @@ static int amd_pmc_remove(struct platform_device *pdev)
 
 static const struct acpi_device_id amd_pmc_acpi_ids[] = {
 	{"AMDI0005", 0},
+	{"AMDI0006", 0},
 	{"AMD0004", 0},
 	{ }
 };
-- 
2.25.1

