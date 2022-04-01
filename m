Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B94C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  1 Apr 2022 16:22:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349509AbiDAQYp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 1 Apr 2022 12:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352807AbiDAQXe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 1 Apr 2022 12:23:34 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B158312AD2
        for <platform-driver-x86@vger.kernel.org>; Fri,  1 Apr 2022 08:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPreP2/7RxLWFzm5dZoRz2bqJPgEVsGZ7X1Eft4NmxmIUJMa5J3CiwyGCChborIIvVBokY/dvS/gwFwsyc2CnXG+6OV2+QKODWpLuZqb0CfgSs8Ep5pviZwLqQsSV/q5+ST041SXrHYfae5nV+ESA5MC30kfR+FQqYImayLEgUU+Eky6LCf7cfLmSXlmMf3wrYn2c1AhF1q5ryRIPlxRQVyu5q36ngUAuZOcnHNB9O7r2DNCM70jIdx01XfvxzW3BLS9mFKE0vNhzTspUKCNqooeXUN3zlM1WggLnxmLS3zv+1dBZKeO+rPsE7XMQnz9S9v/F2C/BtzM9nv6iPEwRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKZKu2HxXW/DtOh798+A6TGQmzJSaDj8P8jkiA4sJ1A=;
 b=RHR4NgmIyfqGhM8RUbNQLCdSnSA7Bu5NAM199JE+j/GRS64HeRIg6jx4Dlz5Glpe3U+K958q5viQNhFQ6fz1uH/uCwH8c58URR7KjbneknDM9Ix2sql0Sut4la8Y2kvAOXf3elFVmVx1lgApK0P/1+fHXXenN/a1dIl8K0Y7FzvHVflOvqepz74A2wljPEWOWJifX2Zl1w5mH4+OUvS0pM0FUzyAjqJcA2AJnVwiW6jA+mBVuCqJkE6No0pbHdKQFt8Utencov9kquOM5EQPoOikzclmIwBDPObczDmOfcQ+V6FfX9UqU6vXMyHWXuU/pEAc8Yhr/6/54z/+//iqjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKZKu2HxXW/DtOh798+A6TGQmzJSaDj8P8jkiA4sJ1A=;
 b=2JtPog2vj9GT8i09DURaXhl+2Ly/eaOrUfwD5xEf3eSy7hgihPavm7LuBNtFOnRJdvlPJScfXdhpgwn7BtuzNBsXw9czJdbzgD3lh6xJiLSiGXgE/qWHQAR6tcHnvIUibMSC9TguaV+Kb33Aesa9pKxsPYYqBAwS+Cu0+mXMxnA=
Received: from BN9PR03CA0253.namprd03.prod.outlook.com (2603:10b6:408:ff::18)
 by BY5PR12MB4034.namprd12.prod.outlook.com (2603:10b6:a03:205::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.29; Fri, 1 Apr
 2022 15:53:17 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::8f) by BN9PR03CA0253.outlook.office365.com
 (2603:10b6:408:ff::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.25 via Frontend
 Transport; Fri, 1 Apr 2022 15:53:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.19 via Frontend Transport; Fri, 1 Apr 2022 15:53:16 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 1 Apr
 2022 10:53:15 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
CC:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] platform/x86: amd-pmc: Fix compilation without CONFIG_SUSPEND
Date:   Fri, 1 Apr 2022 10:53:29 -0500
Message-ID: <20220401155329.3467-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6098f73d-0aa2-4006-f113-08da13f7bc92
X-MS-TrafficTypeDiagnostic: BY5PR12MB4034:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4034F2FB46264446D4877827E2E09@BY5PR12MB4034.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bwFtDYot8RLYMolmCRuNP7beiBIlR4p+XpmyQsjPyjDkAXkMLo7W4mXsNcBuxPG9li+8GvUWERW8GbbXxYDTrCLVKua/zWbkd+zVdeDEwNl5TZDgjrEOU4bbcr+f6wpqxzDa3QG0PSDPUFI4hE2S+ywTjDnTNN4rrx8DRmRuuZtVt0Ztb0ELdeut5C9kt0T0BRmKSrYhg2aLKJhvYgUMNP36PECy8KKnhrl+VVyzrGbHBNSH0IiJ9BPze5+8uPbxv4h7yOKPxbxfk4ap1IxzZ16xDmjNnI9VFi4QoiBCy0uuvEx5RH7PAGJNUgeiaG5A5XRewK9OM5oqxVp8yKlWOtOj9zUKDKMHARH5ByJ+/4N/4P01YEnBGqSaXk/FY9gQ534y0uGLcoGwyBMdGygcJTIV8wdEEvYp3Qd8+YpfhZsazEt8vN2eM7dVOCR2gZnRN1OxilcAbLVszDIDSkjUDjl/7msD0odbKkdJcIt9jGlFCBsFSVOQyCNkFzJJBzsTCD+KQlbGW3inSxhX4T2gv86jjcinXpfBRCdLBVpp4qvk/7lHrlr1JvMJXdkAvMlcjKIL6jDrcnpQdFxmmdZdOb5CeKJtoxN9U8TSeox5kbCM8iOSq+U+Hxsjqs/Q4b9ewp6qFNzHNwmfXDdAp1VExXopuxwgFF0CFF36QMoSSlsMeuigtrmH3KmNEY9opbAYUNCUyxzw8alBtZWU5jb+Ow==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(26005)(16526019)(508600001)(186003)(1076003)(426003)(2616005)(336012)(6666004)(44832011)(40460700003)(70206006)(86362001)(70586007)(8936002)(7696005)(8676002)(47076005)(36756003)(4326008)(316002)(5660300002)(2906002)(36860700001)(54906003)(81166007)(356005)(110136005)(82310400004)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 15:53:16.7161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6098f73d-0aa2-4006-f113-08da13f7bc92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4034
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Since commit b1f66033cd4e ("platform/x86: amd-pmc: Move to later in the
suspend process") amd-pmc doesn't use traditional suspend resume
callback anymore but relies on functions only created declared when
CONFIG_SUSPEND is set.

Check for CONFIG_SUSPEND and only use those functions in those
circumstances.

Fixes: commit b1f66033cd4e ("platform/x86: amd-pmc: Move to later in the suspend process")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd-pmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index e9d0dbbb2887..b121686407ff 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -859,9 +859,11 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	amd_pmc_get_smu_version(dev);
 	platform_set_drvdata(pdev, dev);
+#ifdef CONFIG_SUSPEND
 	err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
 	if (err)
 		dev_warn(dev->dev, "failed to register LPS0 sleep handler, expect increased power consumption\n");
+#endif
 
 	amd_pmc_dbgfs_register(dev);
 	return 0;
@@ -875,7 +877,9 @@ static int amd_pmc_remove(struct platform_device *pdev)
 {
 	struct amd_pmc_dev *dev = platform_get_drvdata(pdev);
 
+#ifdef CONFIG_SUSPEND
 	acpi_unregister_lps0_dev(&amd_pmc_s2idle_dev_ops);
+#endif
 	amd_pmc_dbgfs_unregister(dev);
 	pci_dev_put(dev->rdev);
 	mutex_destroy(&dev->lock);
-- 
2.34.1

