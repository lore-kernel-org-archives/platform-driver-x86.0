Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9013C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Apr 2022 21:27:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235821AbiDFV3s (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Apr 2022 17:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236960AbiDFV2j (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Apr 2022 17:28:39 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F6A2325D3
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 Apr 2022 13:27:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euWp25nOrGm1rX6SRo/LC+0w3d20maIWKK2Yhb8QXqy8f06RXIjgH33A2ppw04jFCAImt0kDr3QVTRqi3sgdvUdiJvIGXxApGZzyahKai81ajbeWc4LqH1wdHDtUNvA0fpKQoSaZcOGz1mgkDlMUORn/xVaignnHR70n6k5NHozPLOwNHxRkvbmGbap70xsPDUSQ8KRNZjBxfSRF/CLTtrQHp6PWm0YVtAizyKB1lOH9cY7iHPBkjjagN+vf7D8Ezd6LSNESd/Vp5KjDyfMd6wn3yZXilNUXUfH9NR1SYjIz1r+1wm2Eoch7ZeNIhPe1Sw3EgUt8XSu0C+N4ecq2OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fELFJCsUrh+9SKmDTwfdJevaDFUrFAwPthkrM7eUiHg=;
 b=XRfoliX0NQAFaA2oS1S39dsCGiq/qcoiLDrhA+ZmMQ3tXUkd8euoMr1gfKzntouIxi4f15qBPfZxv7w8IQj0y2BB4ZF2vEugPUTX3JSYEahQRW8RSH15pF8UZ/080+t/Fk6pA7Z7Woi3epJFfjuVvArJxDBklgHc0D0sDBC89IWmlQBp5FPxPH/YMeb9KBDgU+9sSQaUTOq0ycx3R3Fk6Ibjr70C9G7wFVCA0emv92hiP7VI+XzsFehDDXwcqBrjA6NxP2CYFG3SMS7bfvna2ggDisn+OsCCcVSTqWUlZUysLV99w2LwVhRjCtWG3olcQcGvjZkWElJyMLbicel35A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fELFJCsUrh+9SKmDTwfdJevaDFUrFAwPthkrM7eUiHg=;
 b=IshDoytzMwUW4HkprKQhNROaex/uP4nj6GRm5Cq8gHW07EBY2Y7SWVaeoZjdu9hGtY4qCw5/fgNPhKwMoWhAt42cUIOtPnppZ79g6qrg0W9OpfGbGpopoEGUlQNEwn9BPdQ4m9ATIWHwDo33uG6Tcty2062hdtyBD+Z6/Aakdzc=
Received: from DM5PR12CA0065.namprd12.prod.outlook.com (2603:10b6:3:103::27)
 by DM5PR12MB1308.namprd12.prod.outlook.com (2603:10b6:3:76::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.31; Wed, 6 Apr 2022 20:27:07 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:103:cafe::7f) by DM5PR12CA0065.outlook.office365.com
 (2603:10b6:3:103::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21 via Frontend
 Transport; Wed, 6 Apr 2022 20:27:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.20 via Frontend Transport; Wed, 6 Apr 2022 20:27:07 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 6 Apr
 2022 15:27:05 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
CC:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>,
        <rrangel@chromium.org>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 3/3] platform/x86: amd-pmc: Avoid reading SMU version at probe time
Date:   Wed, 6 Apr 2022 15:26:55 -0500
Message-ID: <20220406202655.10710-4-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406202655.10710-1-mario.limonciello@amd.com>
References: <20220406202655.10710-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da824613-ff60-4a44-9f42-08da180bd216
X-MS-TrafficTypeDiagnostic: DM5PR12MB1308:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1308D88C9B0CC1056AE77D8EE2E79@DM5PR12MB1308.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N5lWKPfnNaEPGPLh+F2pfkgKZDprItZjqFuYegkRJfpqdL2AOr2YB2QrhB5HT4xlWu7BcSfIGbypf6wJ3fgWbk1OlvVAFa8OkGukHV73nuJoCAZHrhTkRZyI/KXfdTm0Q8bO/dSdbRC5orgbG7V2lRhJX/gLaaIanLBPLwEYjtlgB2xBXXspaXFGkohu3bFfNLb7EoYy3PD8+v4XpRv/CT1k/ENYExazyk+Sd7v2Vy+/eNSWpE8BunQMnKvIyslN+zpjnfonuoWGn3i2SN0REGr/FWGi0oSs0YKyudtb565k01l/MLEIyDXvcrqRQf5aKmx+TDGbhgR7eX8PlZo4QkjTrb8ds+Ls89ikV2QkgbOe/YLZQ3JWdBsSLQzFa4hbHbLamV4adDci1h2wtZohSNaV/Jm2++bBAz/pYVdSj2RTB0M5ALJxn3vTw0te1YLMW2uyLRCnUlN4POV5y6h2HPqY2wz2WrwHFGkytsaDrGtibX2gsdtk8SIHVY2cNecxYqZeZDnGefXTZI6mpJiTA0YbxIN01Ml6Se32uwOTvZo1iBAaE9YCAruSCHTAOHT8jucrrb/vbVxGClZb0U27u9YmG3yQ6I5VSEp7jje0Nz2t4UoCIr1ghtULWvS9m3egRnpKN82BjjG+GGM2+Yk4RTMj/VAFerdKPYfOANW6U4gebWVGNHbL3MzodG2jGjPXskIZhaNrNRo8xAH3cwZhdQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(81166007)(40460700003)(83380400001)(70206006)(70586007)(1076003)(7696005)(6666004)(508600001)(8676002)(4326008)(316002)(36756003)(2906002)(54906003)(44832011)(356005)(47076005)(2616005)(336012)(86362001)(426003)(82310400005)(110136005)(36860700001)(26005)(5660300002)(8936002)(186003)(16526019)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 20:27:07.3813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da824613-ff60-4a44-9f42-08da180bd216
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1308
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently the SMU version only used to determine whether the SMU supports
reading the idle mask. To speed up startup, move it to the first time
the idle mask is read.

This decreases the startup time from ~28500us to 100us.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd-pmc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 66be2601866b..177c0fe0bae8 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -425,6 +425,13 @@ static int amd_pmc_idlemask_show(struct seq_file *s, void *unused)
 	struct amd_pmc_dev *dev = s->private;
 	int rc;
 
+	/* we haven't yet read SMU version */
+	if (!dev->major) {
+		rc = amd_pmc_get_smu_version(dev);
+		if (rc)
+			return rc;
+	}
+
 	if (dev->major > 56 || (dev->major >= 55 && dev->minor >= 37)) {
 		rc = amd_pmc_idlemask_read(dev, NULL, s);
 		if (rc)
@@ -874,7 +881,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	amd_pmc_get_smu_version(dev);
 	platform_set_drvdata(pdev, dev);
 	err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
 	if (err)
-- 
2.34.1

