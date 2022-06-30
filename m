Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A74FC43334
	for <platform-driver-x86@archiver.kernel.org>; Thu, 30 Jun 2022 05:04:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiF3FED (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 30 Jun 2022 01:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiF3FEC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 30 Jun 2022 01:04:02 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6EEA13E8A
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jun 2022 22:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cia33tFACV8fu3YAWK4FL9iyiB9WQPuF2r3BQGYtLqvP/mpwNfu4VAni+Qnvvv6NoqiGc8driSryHamJ3Z1g4bVuo2DLZUXm085wssp3Sbn4SYtLMfcbYb3lPAmnWqkzosdZkdPwAQeQ5z6wWiynby4gzQjgGmfEq3g5gUZLD4Rh2i6e497KjavvLjfYX2xv46hXGYbPSDLFuax1+ruQj4dLgfLOCP1NyiurKQXBOOarrr7boXv/PEQIUdhCPIYkwOYpl7c9tqmSLcFISZuI9JH6FMSfZWikF6AEWNNUnBry5Sc16BXDl86HOzVujBNpF2na3aT1B4WXkylJ0Rma4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RszwbkvyG4cSvxHvnPrVAY9rqapSQW4/wwPLJCXbT0o=;
 b=PH6feBu1iK4K+KPtMiEL3Q3seLv3N1e38chy8EgnZwMc5aH/00WxG9SYrffzKQWgkeWcqzzxnMwQtv6i2CQg14pX7eOeXctueGwC3nxKc3sQP/hvi9Xi17gozzVP7N1V9FQUaxVsizWBWz+tC0Ge1jm7a3oY5HaOupceEi8DByaAYSjJKtdpmbfzp4UqlKZqHmEFyFN/P3zGXkmb1d2yCEBiQ3zLvSS4/3+r1mD+19mrSz7deBVjsc//N7rOz/NTucc01i0DkGOlJlEOHnuExCWGm742AkXRyX1b+iOr4u30LrKyOvVEm3MT8nDXNN9gJU9NuS4sfOKURNPLLtZpmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RszwbkvyG4cSvxHvnPrVAY9rqapSQW4/wwPLJCXbT0o=;
 b=kuUHdB3LhSOrpmG/nhPfWADSxfAVgStC7dIqHk0XAQy9fIia+jbUq5DnCPTvsvuLymahk221yTNABjaa/biQ4Tjq/Koo7TIMBHL6DY4msbbKBF+1w94Oukzw4deJeTTp8Cvypgxp8+vhvHzDHqzOffJddlHOilPmnjnDbdWluYo=
Received: from DM6PR08CA0019.namprd08.prod.outlook.com (2603:10b6:5:80::32) by
 BN6PR12MB1364.namprd12.prod.outlook.com (2603:10b6:404:1e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.17; Thu, 30 Jun 2022 05:03:58 +0000
Received: from DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::57) by DM6PR08CA0019.outlook.office365.com
 (2603:10b6:5:80::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16 via Frontend
 Transport; Thu, 30 Jun 2022 05:03:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT059.mail.protection.outlook.com (10.13.172.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Thu, 30 Jun 2022 05:03:58 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 30 Jun
 2022 00:03:55 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/2] platform/x86/amd/pmc: Add new acpi id for PMC controller
Date:   Thu, 30 Jun 2022 10:33:23 +0530
Message-ID: <20220630050324.3780654-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a9978f7-436b-4eab-ae66-08da5a55f0d9
X-MS-TrafficTypeDiagnostic: BN6PR12MB1364:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 48uge2Lp8H7K5C4iUVuBdcdnnBrJEGMJ+S7MfaOT99F60KRYiHu0OhMtBkmdr+BHQ4ufjwvheGqU1FTYs0Hpw4i62jI4BYYBngenz8n7P4zcNtgkZwoNStGhdxWeFyRbpaY5tlUOyKzOGLfOOO4EBAXpL3piZIO5VHN8Y/2lL89aSR+dwAp5K/iNEqj1PkLLq8hNlZgJgC+r/WUGNbaI0VYfaOrvkZAvQDqqcTXjQ0gaF9dr0uq6NVVLs1QquK26IcXdeq44ohWtxMRcghfZCYUMqkOqIqScfN4NfSsimOjauwuTGEOUVCkxvbhsJ1fRUrsqZtyWbe7S5F5G6qBj5m6dsYGTsxxcxi4VuGI3UE0jgHUpy3T/QCLfCy68oxjeCwKOrxHWhKkeAA/mG8xifpX8ftoeAi387ymHVFVJ/yo59euNaeyQiayAHFA3Y6qlbp+9W4hDptyRr5VGgVeRzQdONqqVCa5/XtTaZ6SYHKwuTH42+Cmdl+lAeB+kdtgvo4vzHQa3MBOrLUisPl1QcTsjrhSIcvUN/KDKoTorWF3V+qhK6ix85uaydqQOVMoC6UQ9RfDF6LPvNerKHf8zoY79J8ingfb55LwJ3irwYHw2zTOKMqYwpfjAtSi120SQGi7nU5wqlVXsAFzMFEXFdM5jYGiXfCAeN9Mf7UqBee6OcXPfgGJLwZaWTNs+QFmJ3HsFc7pd+hHOnckDWGFMgZfT8crZUubi8a+TcmcUXatbDzG87a2qo/9LriHUDCDUDW4hjfFQWM6wqBZFoGAgloc4XNHB+S1EWA98vMguz7dR9qx2hWG2YrclcYFk8Dd/Yf9Np/1mKQAd7XQuQzO8vPkFDriFIxAINy69RrzuW/g=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39860400002)(136003)(396003)(36840700001)(40470700004)(46966006)(5660300002)(2906002)(36756003)(26005)(8936002)(4326008)(41300700001)(356005)(8676002)(336012)(81166007)(2616005)(70206006)(82740400003)(478600001)(86362001)(70586007)(54906003)(7696005)(6666004)(40460700003)(16526019)(47076005)(40480700001)(316002)(426003)(36860700001)(1076003)(83380400001)(186003)(110136005)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 05:03:58.4926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9978f7-436b-4eab-ae66-08da5a55f0d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1364
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

New version of PMC controller will have a separate ACPI id, add that
to the support list.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
Based on "review-hans" branch.

 drivers/platform/x86/amd/pmc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index f11d18beac18..73d6867cc20b 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -91,6 +91,7 @@
 #define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
 #define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
 #define AMD_CPU_ID_YC			0x14B5
+#define AMD_CPU_ID_CB			0x14D8
 
 #define PMC_MSG_DELAY_MIN_US		50
 #define RESPONSE_REGISTER_LOOP_MAX	20000
@@ -318,6 +319,7 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
 		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_CZN);
 		break;
 	case AMD_CPU_ID_YC:
+	case AMD_CPU_ID_CB:
 		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
 		break;
 	default:
@@ -491,7 +493,7 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 			    &amd_pmc_idlemask_fops);
 	/* Enable STB only when the module_param is set */
 	if (enable_stb) {
-		if (dev->cpu_id == AMD_CPU_ID_YC)
+		if (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB)
 			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
 					    &amd_pmc_stb_debugfs_fops_v2);
 		else
@@ -615,6 +617,7 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
 		return MSG_OS_HINT_PCO;
 	case AMD_CPU_ID_RN:
 	case AMD_CPU_ID_YC:
+	case AMD_CPU_ID_CB:
 		return MSG_OS_HINT_RN;
 	}
 	return -EINVAL;
@@ -735,6 +738,7 @@ static struct acpi_s2idle_dev_ops amd_pmc_s2idle_dev_ops = {
 #endif
 
 static const struct pci_device_id pmc_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_CB) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_YC) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_CZN) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RN) },
@@ -877,7 +881,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->lock);
 
-	if (enable_stb && dev->cpu_id == AMD_CPU_ID_YC) {
+	if (enable_stb && (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB)) {
 		err = amd_pmc_s2d_init(dev);
 		if (err)
 			return err;
@@ -915,6 +919,7 @@ static const struct acpi_device_id amd_pmc_acpi_ids[] = {
 	{"AMDI0005", 0},
 	{"AMDI0006", 0},
 	{"AMDI0007", 0},
+	{"AMDI0008", 0},
 	{"AMD0004", 0},
 	{"AMD0005", 0},
 	{ }
-- 
2.25.1

