Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557AEC0015E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jul 2023 10:09:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbjGKKJj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jul 2023 06:09:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbjGKKJh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jul 2023 06:09:37 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F78BF
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jul 2023 03:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oArD53JegPefYnQ1GCaemd+EBEVwaHILA8ktKZhpLdXZJG/DzpvN18sfhvYAFebptvAB885qxCQbx/6uAqQ0C3bWEMZ/sSAMfjYXTJw+2wnxVAFEEzzxt69uNnwvTgD4zFafzXJenvU9HayY3aLohyt39rmuu1bjwjy9UZktPU8YHmtytEvUx4sOf0FlQG+JbNWgF2KViI5N8Nvoq9hjSejfVzRG3S8bY0HIFtLwUweGUBIQTamy6CFUL1eASe6kv0ny+iNkJFNC+yWTZ+QMD6t5CMvfN1LTkZnUeFRrrSGk8q36CPkXZjpsEQn7lTyLqlqXdxa/1sS6S3Gow6f+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwxyvRTl65khEqFMiMagZIT3py0j1uuI4wYFBMUkrfM=;
 b=MEPL7rB92C9lz/sGvII5t1QiZHepc/2aqi/4S1sDa18kg6HcIJ4WmodM1Aj3274WHG0TrBc9WVZPaaKV1DvOsZ1LokEBbmoGsXtXozKgHLlHpSrq7Q1KQZdQDV8F7ALEnhNkr9xBq0YHOQy9XLZISI1AafiiRuA0zOMjivJDYCkbab+IZNdGXjvkDk/gJE2zUF5CbHUge/CbuiEPbKW4rkLalohgPDTKqguflo1h104JCtTeQn/Fow4fGofibGcujoy64HcqcsCZfXHY94gX3t8lvrSfNYWlUvT7/zz1jPM0xc3qcWZQDROsadXCf1+QKDtKQFEs+JbOyKgMtwe8Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwxyvRTl65khEqFMiMagZIT3py0j1uuI4wYFBMUkrfM=;
 b=bIWiiFIR42mwyejwGtafQWsHYHK5AJiCNmEVGWEWWFZlWsrkPT67Z50L2fh3buyUUE30zXVAu3LVs10EvZ00eMDw7wIxPVS3kkk5nDMEqzZbyIqAXAdT644HsxuOBi83BC0IfQ2pCAQdmb0ww7GnfnkyVxS5OECfG7y9Izjqypw=
Received: from BN9P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::7)
 by IA0PR12MB7579.namprd12.prod.outlook.com (2603:10b6:208:43c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 10:09:33 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::bd) by BN9P221CA0012.outlook.office365.com
 (2603:10b6:408:10a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31 via Frontend
 Transport; Tue, 11 Jul 2023 10:09:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.19 via Frontend Transport; Tue, 11 Jul 2023 10:09:33 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 11 Jul
 2023 05:09:31 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86/amd/pmf: Add new ACPI ID AMDI0103
Date:   Tue, 11 Jul 2023 15:39:03 +0530
Message-ID: <20230711100903.384151-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT017:EE_|IA0PR12MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: f7f3a56e-a546-43ea-f601-08db81f6ecdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CzXoHaiq6yI6lgsK0J25oHFHOvP1X6/lcj5zpa2BXiapAP/ftdvKgfp9lFqv+tHmMr497X9uwE39EODNH4ciqeKckAdqolOFZn6f2pUuJ3VTkcjpuGF4qAw00tvkSAyDZxuFaMf9TccyCwx5fFKWYaa1OxBeQ15aefqud+J5l12xkSKqFnGkkg/3+M9iH0Rnx5v7TyhGsDfvvuHLjrwQMO5tXCJT2uzNbOlrU+dUWM+Wi1KECI9/u6Ofjtq0gljpIoHExXUtSwczLV7Bt7T3s8SMExXvKbV2gSA+UTBkGk40BX8P5Ou79CBIwn9iqMnSDLXnrjAM2evXU3Dw3/hVAPsbluAPQR7Rxrpqs60Rp/jTbltbBaOwD2OhTNHmXJvAeFkBfrHfSDSvbstkUS3hLgpOrys92fb2ybr05fD198Q+/JrYkAVuWrVo0H4MDC6kth0TDSfvJz99LLQI+ulWljwaC1dXw5VsVgM/VNXs3nJbjjBUshFHTOGDBiIqNlQHTGaZKJHOV+te8x4MlmnKcAbjjjBoJvbz4pKLq2HZ/gJUeQ3M+SF5In5ZMUuctssJuyOwC46huwAqaYbVJoqp3C+v7yyzKQbz5u8y6UgKC7LdGQR0/1yuBEp1cfPLxT7jKUMLhx4RiJzYoyxyuy0XjZ/IBmLiLPZMR8kpOg/hLj2OpCZKDfaoalENyccJtZldrDFGrO5MbUTwhuY6CZfsF9vf6EM68o4eFH8BibA7+DQIZ/jGO52syrDjEEn77Z5aH9Ae48IIw1mS8rDI7X8s/A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(186003)(26005)(1076003)(2616005)(36860700001)(478600001)(426003)(336012)(83380400001)(4326008)(41300700001)(47076005)(2906002)(5660300002)(316002)(8936002)(16526019)(8676002)(7696005)(6666004)(110136005)(70586007)(70206006)(54906003)(40480700001)(36756003)(81166007)(356005)(82310400005)(86362001)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 10:09:33.8626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f3a56e-a546-43ea-f601-08db81f6ecdf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7579
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add new ACPI ID AMDI0103 used by upcoming AMD platform to the PMF
supported list of devices.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index d5bb775dadcf..730b22457117 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -40,6 +40,7 @@
 /* List of supported CPU ids */
 #define AMD_CPU_ID_RMB			0x14b5
 #define AMD_CPU_ID_PS			0x14e8
+#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT	0x1507
 
 #define PMF_MSG_DELAY_MIN_US		50
 #define RESPONSE_REGISTER_LOOP_MAX	20000
@@ -242,6 +243,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
 static const struct pci_device_id pmf_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RMB) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
 	{ }
 };
 
@@ -312,6 +314,7 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
 static const struct acpi_device_id amd_pmf_acpi_ids[] = {
 	{"AMDI0100", 0x100},
 	{"AMDI0102", 0},
+	{"AMDI0103", 0},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);
-- 
2.25.1

