Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D52C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 30 Jun 2022 05:04:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbiF3FEE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 30 Jun 2022 01:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiF3FEE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 30 Jun 2022 01:04:04 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D7A713E8A
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jun 2022 22:04:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lit36ByKMyQituHt0nt3HW5G5ZAIbN11YwMqdl+sqg8qz7+KCouO2Xb5XhtaNt8ADPIAIXMeBaFOHYTgIMvzyXAF56hEbGv6PQbaV3/0XsNokexDPlDePiUS0ZNYLwLH3zVQ4XpA33TFvbSszkMnGPaPl5ec8TIo+zzmGRwK4f1PordY3tFXMvqbeJQ71vzpJlOwq6fUiatTFR/Kn8Syg5J7+EgdBOnFUoX+HjYy56z74CI7hhi+P79M821m0TxQzR9TuQRaIhy9imUQjm6vsHW2Qw6U6dfgJyZ/78I3zcuKPRfERsCN9paXdDNuNf67eIHm2pQR1GbRjQPGOVRZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seieaz/wEQB/RYLiZAiNl0iUardr1lYWp52c6WlD+tc=;
 b=SVpq4QL6Drh3lG8ZKXTlSOMVV2eUfgCUsLtHenrVeE6KfpCS3Kq5jMUlnM9/WpWDFuDNZKh14YWi+blfdTNgkH2+NFFqKO5NEjEqyXd7WV8B2ZTx9vN3iDcvp6gy8FPBYNdrt1C7R0zbchCu1C97VGzEPtXOl/wnxjRvFnFwmaRwFwqfyiG+60cp/CM4JAwpik2NvFMJhOgEb4/rcYnO7q6dIb+NWzL5vO3TO9IKl7Z5GvgVQHIiDstll+un5hMaaZwLCtVrZpwwZlg2AHRtnWROeqklW3BMehsH92ae+v1TqcDvR3+yZGi8ShS4g++aU9la5UiEnxw9zGqwQf9NPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=seieaz/wEQB/RYLiZAiNl0iUardr1lYWp52c6WlD+tc=;
 b=TeSjHYGGlpLftOgz5yVaXwH37cbyEeFBjwjOD6kPvmKNyk+grGhFc41Tc/lK/Xicsp6FWqQ0QURAqiK91MeOJ47cy6xFYCjEOn+VD0O1UpPeF1lOsqpdhlB6qrGafrc4D5t5SUcj2g0EcqiUOIPMK1yzdVo6py/jsEXrN0jGr+Y=
Received: from DM6PR08CA0010.namprd08.prod.outlook.com (2603:10b6:5:80::23) by
 MN2PR12MB3293.namprd12.prod.outlook.com (2603:10b6:208:106::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Thu, 30 Jun
 2022 05:04:00 +0000
Received: from DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::6c) by DM6PR08CA0010.outlook.office365.com
 (2603:10b6:5:80::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Thu, 30 Jun 2022 05:03:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT059.mail.protection.outlook.com (10.13.172.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Thu, 30 Jun 2022 05:03:59 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 30 Jun
 2022 00:03:57 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/2] platform/x86/amd/pmc: Add new platform support
Date:   Thu, 30 Jun 2022 10:33:24 +0530
Message-ID: <20220630050324.3780654-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630050324.3780654-1-Shyam-sundar.S-k@amd.com>
References: <20220630050324.3780654-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 407d2eca-f509-4d6f-b838-08da5a55f187
X-MS-TrafficTypeDiagnostic: MN2PR12MB3293:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /bFl71o44l5WhcgyiNiTs0cadIvJHQmvx4QPjG9yElie8md/SFBYJjNGuitdPoI11v2W0cGwS6p3KabIIRDDo8neLVRjrxi9Pg728uP4Sf3WdJD8+pYuineylK7TDqrJ8LcnUNoQK8KOH4c6iQD6ROlMuwXJHs9jWwrTDsKL6OJS1zUSUvcIrXRXhqwT1+IR3XjRBCqCdZ4zYmnaqSHre1baBTn9zG1z7QzzvpbTxgp9A7mQAoWRuTrfEAiHVeD9KFoXMRwfgjQkacHrwP6j2MYlXFkMwBtSKchUGDfduoZ+NI6PcOJ73BlhF/yJRtNPUBc9sgoOoN+C6wDpvBkYqaBR3QH6qhAm8dI3g+HXzkxlRSFDT8o+jXYxrXKtO4ma/MO58cMpXGIc6/XWVdrLrteu7toVVA5koKlE2MnJz3enhy2iI7/tTs0Q21e/ymZ9i4/z/OvIbc9GNpeZYUNZWTWJFUUo03RxfRpk1tXgezIsJ4g/Q2q0fsqrj6M16OY/PGYFwSHo5gckWsRaMGcJSwVHkU/LyRRGKaFfGcgf5h2JkdOIFkrHivHaR6cDGqCw8Q63Q6EpaFfaLxY02fSTmTHEazJS0GZ8MbIYl5uGup5mwbmfIagZ+UYj/cHRFZfC5Acdpxuy2kYcZGGM3szl7Lz1htWngXUDbufK5HzoPRzf75ypVwTluROM/7wyXDMyh9Awbxeo3PMo5hLZZc57Uvfjqv5wT5u1jq0ld3E9t3wMR8oHXvUaiqIadeDBLrPbX3gB6jOq44yn4MKumuCOu6t8CuUnKzHiL0KRXN4bGOQLfXlFfnrOUUGZu4kqHU7hyIWs+ME/tTxbYYrlX+fzlRrQJ5Map0kPPKBkMBrl7gc=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(346002)(396003)(36840700001)(46966006)(40470700004)(426003)(47076005)(16526019)(2616005)(6666004)(41300700001)(82310400005)(336012)(36756003)(1076003)(186003)(83380400001)(40480700001)(40460700003)(36860700001)(2906002)(70586007)(478600001)(5660300002)(110136005)(26005)(8936002)(356005)(316002)(81166007)(54906003)(82740400003)(86362001)(4326008)(8676002)(7696005)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 05:03:59.6332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 407d2eca-f509-4d6f-b838-08da5a55f187
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3293
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PMC driver can be supported on a new upcoming platform.
Add this information to the support list.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
Based on "review-hans" branch.

 drivers/platform/x86/amd/pmc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 73d6867cc20b..700eb19e8450 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -92,6 +92,7 @@
 #define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
 #define AMD_CPU_ID_YC			0x14B5
 #define AMD_CPU_ID_CB			0x14D8
+#define AMD_CPU_ID_PS			0x14E8
 
 #define PMC_MSG_DELAY_MIN_US		50
 #define RESPONSE_REGISTER_LOOP_MAX	20000
@@ -320,6 +321,7 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
 		break;
 	case AMD_CPU_ID_YC:
 	case AMD_CPU_ID_CB:
+	case AMD_CPU_ID_PS:
 		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
 		break;
 	default:
@@ -493,7 +495,8 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 			    &amd_pmc_idlemask_fops);
 	/* Enable STB only when the module_param is set */
 	if (enable_stb) {
-		if (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB)
+		if (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB ||
+		    dev->cpu_id == AMD_CPU_ID_PS)
 			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
 					    &amd_pmc_stb_debugfs_fops_v2);
 		else
@@ -618,6 +621,7 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
 	case AMD_CPU_ID_RN:
 	case AMD_CPU_ID_YC:
 	case AMD_CPU_ID_CB:
+	case AMD_CPU_ID_PS:
 		return MSG_OS_HINT_RN;
 	}
 	return -EINVAL;
@@ -738,6 +742,7 @@ static struct acpi_s2idle_dev_ops amd_pmc_s2idle_dev_ops = {
 #endif
 
 static const struct pci_device_id pmc_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_CB) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_YC) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_CZN) },
-- 
2.25.1

