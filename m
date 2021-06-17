Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B5FC2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 11:31:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B332A613CE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 11:31:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232371AbhFQLdd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Jun 2021 07:33:33 -0400
Received: from mail-dm6nam08on2073.outbound.protection.outlook.com ([40.107.102.73]:48961
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232308AbhFQLdc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Jun 2021 07:33:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hv265QLxdG9q+HCO5NxSaRuNdDqSwM/b/EoP2BoYq8qFIj5m5A4MYv3RZTrf+e7mYkoYzUT/6Aq7MWKgWJNVqWn8hTMXCoh+xIKPotduqKjLeS0PYmUkOT8IrqVpcQbOHEhjqlgD2ojAF44A3dNZA/0lsHJvJbyzet4LJAWkmWn2ktW1klWNnmx+7814w0SLT9nTSL3sFi16VEBSpbJ1zluJSVUcgu3XqL0TJdMHzQfOX2vZ2a0DfyTKJZmWiHW+OZsTU2E6eBpmfz3atEIyhQL9NTiAX0Gm+UZXl4imxClhM/IZJ3rfXvaJd5upImwzHjMLtrkzbqgjBJrNQ/gs0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FEKeRgkDIOSUlowP0jlbEcSCACxGpJmALRIuvTpq3qs=;
 b=W8YeyjYDWH8dMyIrBh/+tb35J0J9RTwt82SqvUfT5arpfC/I+4D1TY7PRlt8A7VLl3nyK84NeSmf9sARpsk1Wmjr+cdxvOoHDk2r8StOqaFAlUbmK/NsQqvnIW+uhkTiqU8vFhd6jxUQ/ZEQxH7wn9c1j0chdGoCaURbgUAlNfo5Cu2+qhWQssk10UpCZRWzdhwgHh8tp7wYgmj21gofVa2KHYSfNzCe1uwzDMEckFTxO6dL8jtUh0ni8saz3pa11Pn2FmsfWUg8JOZb4eLDNCD/kwWLI2uSCwdcGihblj8YAVJX+DlC2WnTCbHOxpaFpn16naEwyL96Cr4ZMyNWPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FEKeRgkDIOSUlowP0jlbEcSCACxGpJmALRIuvTpq3qs=;
 b=hm2lDY4FYyUo5GHOcuwr+R7dB/VgnZATaOGc5B6kc2SE6RAV956hDkL0sGKX7ryKVRienZZdcVA6KzqbXbLZK4z+eCmv7AEYGLN1aoH2/rd60gDudLMvPhcPSymJH9qtUAU8vtkghOpCZfHDrm2dk4UXXqMymaHYQng5qBQm52A=
Received: from DM5PR11CA0010.namprd11.prod.outlook.com (2603:10b6:3:115::20)
 by DM6PR12MB4697.namprd12.prod.outlook.com (2603:10b6:5:32::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Thu, 17 Jun
 2021 11:31:22 +0000
Received: from DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:115:cafe::9a) by DM5PR11CA0010.outlook.office365.com
 (2603:10b6:3:115::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21 via Frontend
 Transport; Thu, 17 Jun 2021 11:31:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT020.mail.protection.outlook.com (10.13.172.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4242.16 via Frontend Transport; Thu, 17 Jun 2021 11:31:22 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 17 Jun
 2021 06:31:20 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 6/6] platform/x86: amd-pmc: Add new acpi id for future PMC controllers
Date:   Thu, 17 Jun 2021 17:00:40 +0530
Message-ID: <20210617113040.1603970-7-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 448daf44-3164-46d4-546d-08d931836f1e
X-MS-TrafficTypeDiagnostic: DM6PR12MB4697:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4697CA44BAA4CCA27532A1A99A0E9@DM6PR12MB4697.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IIBV36dAqw16uS2a1ehh/A2Ww1KtNHs5dLrdxfUuUEUFEKcVWBw77ntmb4nEKV/3mUBAACexp8Fd6j6TpxYBrCZDwasNgn4B6KpRebxEt1kfCF8jr45dHkgcGIAt1phQv47TN3X0/3MlBxs/6HEKwwzgiBUW5nlHsg8OAHeJrpTyEZVgQ6q3vYb3lCobgWPOHCh9GQJrnG+snRrMm2u87ufmV6UuwuVR0sbreiwe1PuFUHZw+XMTT0PLQFfdUZ2I/ydI3iTJSr8GKlkQxAN7C55LtYG98f+lvxMqiYmYJWoDxXsx7qmc5eaf+eNjt7JqOiES2kjXOhFVcjHU+GMqCoDqw1PeLpdDj2WzNSke8Lff5AvRcg5eL3lr013AFPZwtXBngGdXwt+/WBq99VSx1lw45yyS80tFUexwsfmU43S52JedJAYWO+2IfYfJ/ZUmtT4qe/h77EBW6yt2W1Y5BBQr8/e+lmvRoCxlJOOIB/sj3l/0TT5UZFN7YMjFblTO480L9LYzQit8oXjA3Z3Lfjr7nUjeG17oAXaWzWa4I7lHFZscqvKC2rpL5Z6x4RXRFF2cIvwE4QBi1XIgPTWkmzPSxXKIHzCL6b4zFLGi2yyvmP7l48zucHUuwAu1sjCiQG12xclrWsB+QCg1OdDD5zqUvVI64eu+wYihTvZZ/Qy/TWYuHjhnnbFzojeYt4wn
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(46966006)(36840700001)(478600001)(7696005)(186003)(16526019)(5660300002)(82740400003)(70206006)(4326008)(82310400003)(36756003)(26005)(6666004)(36860700001)(2906002)(426003)(47076005)(2616005)(1076003)(336012)(8676002)(81166007)(316002)(8936002)(86362001)(70586007)(54906003)(110136005)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 11:31:22.3391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 448daf44-3164-46d4-546d-08d931836f1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4697
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The upcoming PMC controller would have a newer acpi id, add that to
the supported acpid device list.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd-pmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index e024fd36bd26..c26ac561c0d4 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -68,6 +68,7 @@
 #define AMD_CPU_ID_RN			0x1630
 #define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
 #define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
+#define AMD_CPU_ID_YC			0x14B5
 
 #define PMC_MSG_DELAY_MIN_US		100
 #define RESPONSE_REGISTER_LOOP_MAX	200
@@ -309,6 +310,7 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
 	case AMD_CPU_ID_PCO:
 		return MSG_OS_HINT_PCO;
 	case AMD_CPU_ID_RN:
+	case AMD_CPU_ID_YC:
 		return MSG_OS_HINT_RN;
 	}
 	return -EINVAL;
@@ -354,6 +356,7 @@ static const struct dev_pm_ops amd_pmc_pm_ops = {
 };
 
 static const struct pci_device_id pmc_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_YC) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_CZN) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RN) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PCO) },
@@ -444,6 +447,7 @@ static int amd_pmc_remove(struct platform_device *pdev)
 static const struct acpi_device_id amd_pmc_acpi_ids[] = {
 	{"AMDI0005", 0},
 	{"AMDI0006", 0},
+	{"AMDI0007", 0},
 	{"AMD0004", 0},
 	{ }
 };
-- 
2.25.1

