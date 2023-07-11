Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AD0EB64DC
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jul 2023 10:04:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbjGKKE0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jul 2023 06:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231714AbjGKKEP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jul 2023 06:04:15 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2474170B
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jul 2023 03:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJ/bEDNo4lp1sQr4a/vAxI8e1dj5KUqEv82pLdCWLuh4vGm2MpO/olchkHvdbr6P0ZBMto+LGgFn11jLSCNUBmCMagq9XVBXILLci5tOTwVUC6kmbHbkF8tBD+Si3AhTLf/2KMtO0rAOBDjQTUHae3ryAsjTpBThWry8iL5i7Z8sdsfSYAzlaQs6rtKvCzmWFIL5AeF/meeKM9kc+RAUCKqcEbaEg/6NcBsxDC8fhqDOHJZ6xr1RD6sDbti62JHc5+416OwMh6NE+PgQuRo274B+jNVw/3cJqTQpv7F3gUX324sWtk1JQu1K6BL4TqMNKV965ak+jNcfkeil1FLEvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNea5DIlXY8mxU9PYHN6Utml2bAIz0YEWf1DK6iB3nk=;
 b=MCLa4JEMxh1//+IKOWCziYzLUEWoYpaiD0ie54IM75MazR6uutKnJM5LnrsI8wQWPDOhcNZAHguByxTV+FC0G25Zoi6DirZ7QHkBqNQ7n3SBYYkT44936SKfKpthMwSjNcMBMssXMrHkAIPhyQ4dONoKeps2avA+4PO4j13klk38semgKqgdkbHxuv+X3nDIjtF9j8XRo8COIaYnCJ8a6VK/prQqbCsmc7nefuqLEvYKRtMFoAW8/ZiuneirVRBqPdKa22j7/L4cNVHX151W70bRfQoQNwc5symxgry2QVmmC2u42p1yM2BmIjxdk+LQ5yttYl3kujpN4j0/YQRwTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNea5DIlXY8mxU9PYHN6Utml2bAIz0YEWf1DK6iB3nk=;
 b=l3JmwHP9pQRcAKnzbY4Jz8xKMmH0liQ/Ph9PSxWoEWLVPI3HHej1rnPF5MJceP/JBwz2kB8ocnNKv0iNZKi1XS4xb8CAvGD6VwBCnJsP7n2DRn4Ry1gxfbWNaYLDGjSmQ+1OIMGQlmDlvodcWDptaoROflb4Ep97RhgxWEuZ1/8=
Received: from BN9PR03CA0978.namprd03.prod.outlook.com (2603:10b6:408:109::23)
 by CY5PR12MB6432.namprd12.prod.outlook.com (2603:10b6:930:38::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 10:04:08 +0000
Received: from BN8NAM11FT076.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::38) by BN9PR03CA0978.outlook.office365.com
 (2603:10b6:408:109::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20 via Frontend
 Transport; Tue, 11 Jul 2023 10:04:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT076.mail.protection.outlook.com (10.13.176.174) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.20 via Frontend Transport; Tue, 11 Jul 2023 10:04:08 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 11 Jul
 2023 05:04:05 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86: amd: pmc: Add new ACPI ID AMDI000A
Date:   Tue, 11 Jul 2023 15:33:44 +0530
Message-ID: <20230711100344.383948-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT076:EE_|CY5PR12MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: 12426dfa-85b1-4a56-5fa8-08db81f62ad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XVi1AME4BOPCFZq1vm28i8skgC7lKTUzQSCrS6Apn7tlLGxMFa94xMoS/GhhWcv86iCzvqUyoMIVLUQPBhQ6fu45Ere5GQBdrnIF4rCgeE49YuD47v37yOEcgHyg/i6r0XsO/ColOyzHYdPBC+EEQ3KzcuZGTq8tdu3tPwotV6IiJgYFn3+7vxndcQBGPQz5GhUCvE0UQi79LPHGovCH0JwLk4e4ijK8r9qc/PfZngg7f9RRm3ZcIHaeTB2locB1ElfkLGPxOibtWW8zjcm3wBjUjn5swm7WlqCRJbus7nZQfRqQzBGTllmD1Ky4OjgiCNoiCBKpym2HiOovGiUo0gnTo0xLP/q9PYVJORxforwPKhSCwXybEenijElXVCAUqOPAZYLHoI0QczLSMJjdgepNQbmTYliS2eG4d2HCudBQlW5rJHr5Pcx20AhDV63oQTPOv0juywilsrZMzJNwnCFOvNyXnvhBgTv2bI6vTugZwK9+R/m7KgTM6PqTteoiRhstaNyHYi0gU7VxHX0OPjLwAGphn7fuoaftokt9NMh81f3dzJ0RGDuino93PL+ggGNdOhVJHgxm4U1n82qpyueI9/K8Uuso00w3l5FQkE6ruRZ1gvDknGuBBzu/x/uNplv/x1nXQ0Xxm6BHLxxRL6gXLehyGFTtlHpRpt+gRsq/AZQajrsEiLEn13ZV5XtgjwBVMY6iX6tQQa6ePBfCV7XbXh5vuFiALzd9UgqCQ4+3tmDnk+6EAO87sTlHwOeAQhwFCr40RicSvGjLeJf5rQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(36840700001)(46966006)(40470700004)(7696005)(478600001)(6666004)(110136005)(54906003)(36860700001)(47076005)(426003)(36756003)(40460700003)(86362001)(40480700001)(2616005)(2906002)(70206006)(82310400005)(336012)(16526019)(70586007)(26005)(1076003)(186003)(81166007)(8676002)(82740400003)(356005)(5660300002)(316002)(41300700001)(8936002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 10:04:08.3087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12426dfa-85b1-4a56-5fa8-08db81f62ad4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT076.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6432
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add new ACPI ID AMDI000A used by upcoming AMD platform to the pmc
supported list of devices

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index f7bda8a64c95..22bbd2a4a6b7 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -94,6 +94,7 @@
 #define AMD_CPU_ID_CB			0x14D8
 #define AMD_CPU_ID_PS			0x14E8
 #define AMD_CPU_ID_SP			0x14A4
+#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
 
 #define PMC_MSG_DELAY_MIN_US		50
 #define RESPONSE_REGISTER_LOOP_MAX	20000
@@ -926,6 +927,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PCO) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
 	{ }
 };
 
@@ -1115,6 +1117,7 @@ static const struct acpi_device_id amd_pmc_acpi_ids[] = {
 	{"AMDI0007", 0},
 	{"AMDI0008", 0},
 	{"AMDI0009", 0},
+	{"AMDI000A", 0},
 	{"AMD0004", 0},
 	{"AMD0005", 0},
 	{ }
-- 
2.25.1

