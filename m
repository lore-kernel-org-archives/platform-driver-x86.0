Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3423C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Apr 2022 14:38:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242727AbiDKOkb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Apr 2022 10:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245412AbiDKOka (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Apr 2022 10:40:30 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475B7C2D
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 07:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DugvAD4ziHQ1LVR196oYniFMI1r3XcWCon3BJiOgmdLpZ+dus0hg8r6Wj4O+pxNuec1dC5423R3PKBYkqKisSfjaO+gTELJr4B5y9pV9V1HjcWkRWID6kWPPNwEIXojPuu7HbMFgfFOLwZujd+x0hb6GhZvmfOPgrA1itbgFTjey3z1zlzboA/kr1rkzCnIg1gtkkLH6IQc2iQdYp53syy7KZwqxbYYZ846x+axtpBotgvlIQqqZkICDCuLr2NRueSKWEvzaKoIUUpL4zLLWAB0eZNq+8NmVfzKjpy8vKCapPIvXDUguC2tQyK/LszasQo3nyJu+H2QZbReZXFgXgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TafCmvMaeq1H3y4/oDPm+CGtaW/9EjLUZDOD7QdxG+I=;
 b=AvenSgk5kYrTkGEdWhAOUgBxk3omIAe+2EeGCrEShzchkx1Ub0+PVtdsvECwRf1QcM86CMLCq2IeORAiE1u6097VdJ5imAUVPrypyvccQQxgAX1gNOCWXUjMdGRXOmDspHYkZRmzyadxtN2NGI9f+mvVxlDB8TXsmvXKo+rVDaVU7tmGR3XroCl8LA/XvO7ggyX0V7pbU5/oAUkwDKvyqYDZjiUE6aeMmp+UpjWqJvknHd6ZXMYAHoec7jyw7sUXWXYWf8eERFxHOzHM++1UqffhVcvBLC312Af564heuOWa1sahMFd1bJIKZRsOJaV2l+QBmt2cASsd6/VapwDUgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TafCmvMaeq1H3y4/oDPm+CGtaW/9EjLUZDOD7QdxG+I=;
 b=wWvIbXWljJAHAbxgasN5tqwnGGl4QlRyH/+3/r3zC4ud+jLSDTAh3P/7UAd+56/qQwkkxHZVb9iQ8zBcL9LCrGAqFA06Ds8oYM5+8//BiFTiGGVztzqtu9jwzwvkM2QApsuh/G8rFm2+wibpyeC1RhaDBIf/PhzD9FcntNqilG8=
Received: from DS7PR03CA0078.namprd03.prod.outlook.com (2603:10b6:5:3bb::23)
 by BN8PR12MB3092.namprd12.prod.outlook.com (2603:10b6:408:48::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 14:38:10 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::5d) by DS7PR03CA0078.outlook.office365.com
 (2603:10b6:5:3bb::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29 via Frontend
 Transport; Mon, 11 Apr 2022 14:38:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.20 via Frontend Transport; Mon, 11 Apr 2022 14:38:10 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 11 Apr
 2022 09:38:08 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
CC:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>,
        <rrangel@chromium.org>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v2 3/3] platform/x86: amd-pmc: Avoid reading SMU version at probe time
Date:   Mon, 11 Apr 2022 09:38:20 -0500
Message-ID: <20220411143820.13971-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220411143820.13971-1-mario.limonciello@amd.com>
References: <20220411143820.13971-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14ee10b7-54e7-4534-2a8a-08da1bc8e68b
X-MS-TrafficTypeDiagnostic: BN8PR12MB3092:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3092364884D9B15B465E19D7E2EA9@BN8PR12MB3092.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MlzD1S7QYR8WZxGn7bvXnoSr1Y75A3G2A6OXZQBvi+yLZNrJksLvNYyP12evsDAOSpphV5BZb6u8kwFYHyjVuaW27uVpCBdEpW1AY/vbd/FosHP2gYaBqsOxf/1PSXHtVkEbTsKv5KV0D3JyY4N834KD/B0TNVXUhysjsVqc+jT1AoebkjAOdF1/J4MDb+3OyCBmRZPT4cWxQVu/YdR7FRsiQaS2W06sRU7EdwISrrmgwlt+bbaBcPi1uB7oxd87c9kZfzHa5jCKsVeA6X14l1PQ2CmrryZ1gh6SEnz0A0CkYV7dVyRML29+pCmn7gPAukBeBkidnU9WbZqYBBkjCDfFlTHZ2n7vBwFZvBCi+jpFdnX37/fqSo9H0jc39Abo2qi08kSf+xqeR+JmGIqLdN/BkvpxC9rsugeUPFE8Vm8EzyvxIhdXagUumUx0RZm81Kdpyid6BUY42/vSA+XhJvRx4w4xczVgirgbGdjkxgPJUNmZXsQvqGEnsAtQ4Wj+h8uQmcKPqP1wkm4B/D86u3uqj8pQbMTKc79uhDWJim9g7VSb22KLxEoou3GzrkNt6pqbSQx9N9M2RwMav/KzspKiSp6TyTQ4FVdKTl5d7eFbrbIaBeowT84jjTKM+PUNz2qgcvI3gevYRRnp9lukBaVljV+dvhh/RZFZVB8eHqA3KjTZ5w29epGQwBqQbtp1wz9TD+tpCxeVbf27W7BZMA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(186003)(36860700001)(44832011)(47076005)(5660300002)(54906003)(16526019)(356005)(110136005)(86362001)(6666004)(40460700003)(36756003)(1076003)(2616005)(8936002)(81166007)(8676002)(7696005)(316002)(336012)(426003)(4326008)(2906002)(82310400005)(70586007)(70206006)(26005)(508600001)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 14:38:10.0542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ee10b7-54e7-4534-2a8a-08da1bc8e68b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3092
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently the SMU version only used to determine whether the SMU supports
reading the idle mask. To speed up startup, move it to the first time
the idle mask is read.

This decreases the startup time from ~28500us to 100us.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v1->v2:
 * Add tag

 drivers/platform/x86/amd-pmc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 1f68a3cb1973..be781b4e2ce3 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -418,6 +418,13 @@ static int amd_pmc_idlemask_show(struct seq_file *s, void *unused)
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
@@ -867,7 +874,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	amd_pmc_get_smu_version(dev);
 	platform_set_drvdata(pdev, dev);
 	err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
 	if (err)
-- 
2.34.1

