Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D6AC11F64
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 18:04:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1E8E6195B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 18:04:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234829AbhF1SHD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 14:07:03 -0400
Received: from mail-dm6nam10on2075.outbound.protection.outlook.com ([40.107.93.75]:55260
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233028AbhF1SHC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 14:07:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkzMUdgxK2RUQ+JNCE/doOPCiK/Oqn/9VRt3jMQlJwcDdmt/Z7dNrB7F9UQ5NFt0TSDKm0MYEAuH3aGvQc4rbqyV54AVwvfRIaOI4AeubAagCaG1yoapnyyUTJq4tHXLqsiB42zKo0k9aCQtspH9sTx2ayE2KE29d6LXpR5Xfr7Rn1hiI2F6kwwJ5RfaByH6ubhvJ7uCwULwAc1J3Md+16r6Qq8s/bIW5tF4wcJbhch1H8LnTIlxlD3a0HFm3ZSqVDMQYDaCdjGlV2BT+klPrfscUtk6JAx49VLhvNbbprE5+HpSC45TjOeGsr7M9i9cQSQm/KuAlJSI3/Ti0gN96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqwSuag26XvVtC82ZQ2oEIs31cDpY0DTWQsx8slsRgM=;
 b=Wu5EQ33iKg9cDw+EpuzpOVZqC+PkiDti9sm0VfdHQ5C8UA/wS1eCZqO62p3AOIkQpUKFRptB5+uINA9loGSmkh0MwHAhpCFS7WuFyexwhC54RinSVY2OnpPdSAxbkPOJphTMK4eTRe+nE2TrRUwbICG71uUJd4JUhV61nqMUX4IBkrOEQnz0ZEF5HnXEd4BjlOoUisMAGoN6TeGKEOYpApGxV4C6x5YHCaWsGdfXO5K0VVUFuwjWV3ykDo8PKyeAxonlOlGRfvVXm9bjp5pX7qY2jT7i2YcPAqwbb7GPArIdWnyyDScHIbYUIQU8OM8BqBG6t9N6nDiiGRj7TS3vNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqwSuag26XvVtC82ZQ2oEIs31cDpY0DTWQsx8slsRgM=;
 b=2zA3q8Wh+kbkIrRW2g9qPT0w/g/lurTkUrhHsT5K25APGodjj/5/ONrrCZYhr+dadeY4BKk2lSWzk+bjeb8nyGiKvg7xjq/AdS7YWUDAwepjVVo3yMR3kOj0Kg7izAh8QAewFMe/8PoRGOa7ePWXfYd/RaUfbPpsmNWKdPLZhOk=
Received: from MW4PR04CA0308.namprd04.prod.outlook.com (2603:10b6:303:82::13)
 by MN2PR12MB3616.namprd12.prod.outlook.com (2603:10b6:208:cc::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 28 Jun
 2021 18:04:35 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::8a) by MW4PR04CA0308.outlook.office365.com
 (2603:10b6:303:82::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Mon, 28 Jun 2021 18:04:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 18:04:34 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 28 Jun
 2021 13:04:32 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 3/7] platform/x86: amd-pmc: call dump registers only once
Date:   Mon, 28 Jun 2021 23:33:59 +0530
Message-ID: <20210628180403.236553-4-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6ecebdc8-f458-4a1e-e862-08d93a5f2fce
X-MS-TrafficTypeDiagnostic: MN2PR12MB3616:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3616326D97E9AC6A7B9DA6D49A039@MN2PR12MB3616.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JeLtxax58v1ZHuEik91Nj0psRHydxfj3JCp17lvgj5Ua5FpKZ9buhDX4J5qdbt1SbY1s7hPxECFbuPCIaUCGVFhugjDjybdCq3qx+cnXcm9B+sSytkwtExIN7cd6Rk5BWlwICtiTBnQ42maZEcynS8ZdU984BYeGurrL3Bw5Sbo7aqPF+NIvzbU90a60+J29s2TUJWqZ59yLiR+VkEes9aRX/dTi/58nesodQZ7SVAtadPFQMuQsFuY6YzLz9DsHf6uHLQEDBixF10tbyYRkDSScu7JvM1uAq6N4iLkMYfl99cQmMLawYTFaY+iWNNcjAcgrNGxBrDHOCpZgNiEHNu7ILXFxUeekXB/25fhTzdC/aS6iCoNwEZ1kBNspSkNufT843pjr8lLzWRiy28JOYngMk4GDDqRqM9+6IeiuFhHks/p+OUpYdU265JaVd1WWUETxx3dgH6ePYZrN7APRm0oTABkHoc4g32g4DeAOjZgiIcDY0Ylpdcg8D+fmU3Ayb+7xOumoIcq5P3RphhDU4jilWga43McNkryMHZGv553aFEE67l5iZi7i6aMOwmBntN4avc1ozlKyEb4V8eKJO0Jn9pmcQ4iSTAfTKsgo6pm+8A4DI9R08RukWxFst4V2qivq4saXwmyoRJCpHw2MUNQH1qjsz1HUVnDq6H9ITvJNmHEJZbanhZFS0ARJtfZKQoYS3bmm5GKxY20OOCRp9JXvXorzuymQ5ECKQ8hxFWQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966006)(36840700001)(4326008)(7696005)(8936002)(8676002)(186003)(2906002)(316002)(16526019)(26005)(478600001)(54906003)(110136005)(82310400003)(36756003)(82740400003)(1076003)(86362001)(81166007)(336012)(6666004)(5660300002)(356005)(70586007)(83380400001)(426003)(47076005)(70206006)(36860700001)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 18:04:34.6310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ecebdc8-f458-4a1e-e862-08d93a5f2fce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3616
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently amd_pmc_dump_registers() routine is being called at
multiple places. The best to call it is after command submission
to SMU.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2: split into multiple patches as suggested by Hans
v3: No change
v4: No change

 drivers/platform/x86/amd-pmc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 227efd7ce174..391c071b9a85 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -183,6 +183,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
 
 out_unlock:
 	mutex_unlock(&dev->lock);
+	amd_pmc_dump_registers(dev);
 	return rc;
 }
 
@@ -195,7 +196,6 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
 	if (rc)
 		dev_err(pdev->dev, "suspend failed\n");
 
-	amd_pmc_dump_registers(pdev);
 	return 0;
 }
 
@@ -208,7 +208,6 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
 	if (rc)
 		dev_err(pdev->dev, "resume failed\n");
 
-	amd_pmc_dump_registers(pdev);
 	return 0;
 }
 
@@ -280,8 +279,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	if (!dev->regbase)
 		return -ENOMEM;
 
-	amd_pmc_dump_registers(dev);
-
 	mutex_init(&dev->lock);
 	platform_set_drvdata(pdev, dev);
 	amd_pmc_dbgfs_register(dev);
-- 
2.25.1

