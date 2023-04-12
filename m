Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7DFC77B71
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Apr 2023 11:17:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbjDLLRL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Apr 2023 07:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbjDLLRF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Apr 2023 07:17:05 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1DD8869B
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Apr 2023 04:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIyeH+LksuxRlOasTbxF3EmkTGbvm5NegOFZKe/B5swxIooxFHHLFuqE2BJBgYLS3jfOzg+bESNRyot3tTdkGa3sVLgnRyUhPKF5FKhy9JDnjpmAHSeg2PerjAneziiQL+whu4sGPQcofoSsP/vVURYiQMFJnZXID+abmhqSK8rzZqsEP1P0KsXlGQNWjh1mkft4y13Urz3Hsmf0L+4GE81eoBpn89vL+UrTwxcsTFQLqX1k15XvdWBhhkn0hv/L/dYU3BcUm1oI8RFhWUaOuY29H/SaDnv000OTnueL4fAdRASZwvgPmdgHfseKx86GcNNO2m79L1u8B/kt7pBj5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztGqx6RQMDIRh2XeY0fHdJao2Chc3b66IU2hAkInIkQ=;
 b=JJfdupxhxuZ94acjb7hsd0dA+V8BZprRGdOS5514SR7JRlJBKw3Ek+8YbVp+O3q1hqnR6XSJE0A+vzVGPNK+huAVWD+gIaP1uAZ4w4IFQJoLMV2aBZk9JFWxEXw0hWNa88cXuaE4rnQln5X5f2bSTxfpGFhd+zaOcLLA+b4PCgm3gJfec3zToKkmM+jKKDA6L6cXwsyRbMidW3tG4koEGy3bJLJUVbqWYpRVRE8PQeG2vUaXwn760IFYx4A2GBMaIJNy/XBP2mCMJ16mgl3tVxOIfv1Wt4iQJUVywJzgDFeg5n4YGaVVPpwhksGPJccVgCoElO2gaUTWuffHgiK7jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztGqx6RQMDIRh2XeY0fHdJao2Chc3b66IU2hAkInIkQ=;
 b=qoHtuH66H9gzzOqJbQHtzYPv1BveAiUGArHcc97tPatrMlz97uNQxB3Sjo264ovP45FVj5rCa2R0WnGTJZXx/ZQ+5K/aysIVdexLYO9b/FWDN99hdWfDXatIpIBRgPD6/3if0RgVBSP8BacFq72krA70A2jqMMg9ScrxonJsMn8=
Received: from DM6PR02CA0091.namprd02.prod.outlook.com (2603:10b6:5:1f4::32)
 by PH0PR12MB7861.namprd12.prod.outlook.com (2603:10b6:510:26e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Wed, 12 Apr
 2023 11:15:46 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::16) by DM6PR02CA0091.outlook.office365.com
 (2603:10b6:5:1f4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30 via Frontend
 Transport; Wed, 12 Apr 2023 11:15:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.31 via Frontend Transport; Wed, 12 Apr 2023 11:15:45 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 12 Apr
 2023 06:15:42 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86: amd: pmc: provide user message where s0ix is not supported
Date:   Wed, 12 Apr 2023 16:45:00 +0530
Message-ID: <20230412111500.2602529-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT039:EE_|PH0PR12MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: 327e7a21-8811-472a-6705-08db3b474329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YEbnYvF9rFgi/iXlpR8KXbGnyPbMSf+vkmDlT3O3ZKtUt93Oklxb4D+tkDbxAQH/3gSIPMgX1vjbisnUQfljwX7QWYBYOCVwK7i/2EySvkzuy6Tv5dxVeYm3EhL0ao2/4O0NiqvNDYldMmPpCf89928zZ1uF4unGTKcyWMboNFxeu1AU1UtRIXfvx4evlrCh98ZlNqeLVjEjh3lH2X3nAiWS5DJAJwlVqOsFOyIFaF5j3UowbkChyh5fEaESSgEWofsXF8A2LsdmJTb0lSAKaHqQ95VDBQ0F8fG/zsZ62GBypVMjnppyRn9fmPo2Png5F+KXCJr6EYL1EfESWiZL9DMIpLPuK0FBnSB8jKj1evXQH0QMf90gmm8XgskuMiax8vKck1INJGvkGR8VJuKeK7/ljqz2Rdu5IzxZWbwHNSG/YTgJaxKJTUIOde050jSGbFtK/c/X12kyRmFtE+TOs6idz8sP1k6TxZ3OxcCO66g/YrAvOsf0k1XMyT1uttdTP3pyKXwuCicl/40pDVC41qYq8vYhCsVOPwOpZQDi0i1HUEs7Nv6v03C7p8j0CHs+BKpxdDtEsXNGbufdpnKTnAqjSxw44mHrsUp2yv3VuvnSmfDoVJ+DO4zfcsRMqZ6/0teNL2LjxnUytaCRarsOCsYjWKB95UTyQZTs5FJf7peFAe6TBPbSBr8sJWEtRi61ILlk8tYIQTCoeW9w9D42kB8M8+C7oI0AXQ+P+EjwpP+OfMbaDfxr7bLYyvNeytELmqWX0Ym5AK2HZljbr1OcmA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199021)(40470700004)(36840700001)(46966006)(2906002)(86362001)(36756003)(82310400005)(40480700001)(6666004)(336012)(7696005)(186003)(426003)(16526019)(83380400001)(47076005)(2616005)(1076003)(36860700001)(26005)(81166007)(70206006)(40460700003)(70586007)(478600001)(4326008)(110136005)(356005)(8936002)(41300700001)(8676002)(82740400003)(54906003)(316002)(5660300002)(15650500001)(32563001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 11:15:45.7779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 327e7a21-8811-472a-6705-08db3b474329
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7861
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some platforms do not support hardware backed s0i3 transitions. When such
CPUs are detected, provide a warning message to the user.

Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
Based on review-hans. Apologies, I missed this change in the earlier
series.

 drivers/platform/x86/amd/pmc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index bb7597ca334f..3d2a377f4424 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -93,6 +93,7 @@
 #define AMD_CPU_ID_YC			0x14B5
 #define AMD_CPU_ID_CB			0x14D8
 #define AMD_CPU_ID_PS			0x14E8
+#define AMD_CPU_ID_SP			0x14A4
 
 #define PMC_MSG_DELAY_MIN_US		50
 #define RESPONSE_REGISTER_LOOP_MAX	20000
@@ -913,6 +914,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RN) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PCO) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
 	{ }
 };
 
@@ -1022,6 +1024,13 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	}
 
 	dev->cpu_id = rdev->device;
+
+	if (dev->cpu_id == AMD_CPU_ID_SP) {
+		dev_warn_once(dev->dev, "S0i3 is not supported on this hardware\n");
+		err = -ENODEV;
+		goto err_pci_dev_put;
+	}
+
 	dev->rdev = rdev;
 	err = amd_smn_read(0, AMD_PMC_BASE_ADDR_LO, &val);
 	if (err) {
-- 
2.25.1

