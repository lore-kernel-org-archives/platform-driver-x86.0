Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E54FC48BC2
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 20:02:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E853361166
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 20:02:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbhFWUEm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Jun 2021 16:04:42 -0400
Received: from mail-dm6nam11on2083.outbound.protection.outlook.com ([40.107.223.83]:53025
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230083AbhFWUEl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Jun 2021 16:04:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqXHJJvAOB7pivww73gB1cWLR+R6ZsO0FYvwrVMACxpCBDezI7EBLllBidxhnNGtbcQ63YNcuxrV4tqtTXB7tO6nVl2609/GewsndLwL+v92EoO+v8kV/uIivhtVYIA2wfHF5tT0YL8OIiFGQU2X0GbgzCkuVYh0mliTdufZL00wUeqgZ2GBFMLsJpvynNBO98/MpuO9z2nb6aBWDPfuqaTViiACJGPuvyuVXMrVVfaRCQVknaQhJq4sjodfWpZeDt7vV1BM48BGUPtOiB4sEkalOK4bF6zHOd51OU8jaJPQf5vPlVCs9mtX77XY4wD95XIwyyF/krJ7rH1NSFeC8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66TNaR0MJV5lHGhJlped4v/z703dDd6Ixkpn21pzJHg=;
 b=eNzr1/7BND1v4dXRW24QquZzUtvlMVIKG9SvFmCNaTu28uePYjR97TWCuDuCX2ir38N3+rmUymaqp1rgLORkE4dz9vWkxGY1nCtjW1o+gegNkxzAcsDQnYhMzkQkaDdhxKuhi1eyjLBvmna6t61u9vwgifO53VORkzM9idqhwQBWRR6AIzUPqJmzFTb+ToHHn26k96kgAFnsYamlpJKu4VcBwE32+6fZfRAL72cESb3msoP6cQDtc6bxSkl28K5oR5K/xccDm5LglsKfRSbiJ0OAh+Cdpi+I7LN0zLPMm0bfoFM7Ji7y1SJ3KCaHBeaolrVukEg4keYVQMRAwm1ZaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66TNaR0MJV5lHGhJlped4v/z703dDd6Ixkpn21pzJHg=;
 b=k+Q1mDyrOLct1PuJAFzzEPV3ualuLKXP3yIQhqZR+z+nnLdHVv3FrhDc95bSb5hu1a6FZIPelEZCxzQbg48fyZtoxlZXNIJIoY2UdSKoYKvCDFi1JxUpkUPOtT2QoLSBkKuibYJfOUDaRzjaqfLCE42QyTbpLJzQlC5xmj7esVE=
Received: from DS7PR03CA0160.namprd03.prod.outlook.com (2603:10b6:5:3b2::15)
 by BN8PR12MB3265.namprd12.prod.outlook.com (2603:10b6:408:6a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Wed, 23 Jun
 2021 20:02:22 +0000
Received: from DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::db) by DS7PR03CA0160.outlook.office365.com
 (2603:10b6:5:3b2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Wed, 23 Jun 2021 20:02:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT022.mail.protection.outlook.com (10.13.172.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 20:02:22 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 23 Jun
 2021 15:02:20 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 3/7] platform/x86: amd-pmc: call dump registers only once
Date:   Thu, 24 Jun 2021 01:31:45 +0530
Message-ID: <20210623200149.2518885-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623200149.2518885-1-Shyam-sundar.S-k@amd.com>
References: <20210623200149.2518885-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17fcecc6-69b9-476d-80b5-08d93681d035
X-MS-TrafficTypeDiagnostic: BN8PR12MB3265:
X-Microsoft-Antispam-PRVS: <BN8PR12MB326551509BF44D00F95B7E469A089@BN8PR12MB3265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zNYTQEHhvhDR4FJB6AVh53jhUAAC/OKAmI20oSzGDYfPBxLIucc0cBQRMHxHVrZTo+I7TuGEB/gxmdO6L6hPPg6ZsCDyC3CQN7cNMg49Y1MIQTNAtdwN/ocGZgA6E9UJJHVRDZskeFEuDShtNJBGCwkDew5VjWBiiPAp/QkUozYODyPnsaDPXOReh8zMiHSQ+jFF9ApRax7rvgg9uq4yE7j2dBdu+OkWqCx7SpXR7/OSXjwIhnJkiYVMOAEhJTLQy/92bfvhAHtDSHYL6gWo2pSRT6fD2EJKVfhAo3spe50Ww9OYFiRMiWCJ8IBkSiy8z9v+XwCRyyv0DGtNDnlRLsTe58U/mZC9URfTBro2sfrz3VQM2jMH8s8e0PruFe/oqW61OWrBN5+9mcyoEcEUrPW+UGECVe9LCo8VS15rg0JrgodCd3NKjLJ9TtVFvUD44QpjuK1F94EWLWJh1GY5d1bEiR0iVil18sMMBRFFBA/iLrBbT5U44y/Y7w6daYalf0F4EiTu6C9Nd461AqzGiI4AEu58O7cjA+Im7K/PLrcyCdhjfCNXTOKDNjJjbY9FDRxad44T4sX/rXqVG3hIFyu0b1DshIQxs/B8v+6VrNqGwIXZqvs1Mb2Uuoj76DE32PnYe8DRJ39J1i8musMow2+TOiPvu0t6GW8329pquBjI6gYV+wpj59VIvDuHfrJo
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(36840700001)(46966006)(5660300002)(86362001)(7696005)(110136005)(186003)(316002)(54906003)(26005)(16526019)(478600001)(2616005)(70586007)(70206006)(336012)(2906002)(36756003)(8936002)(82310400003)(82740400003)(356005)(83380400001)(4326008)(1076003)(47076005)(81166007)(6666004)(8676002)(426003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 20:02:22.0384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17fcecc6-69b9-476d-80b5-08d93681d035
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3265
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently amd_pmc_dump_registers() routine is being called at
multiple places. The best to call it is after command submission
to SMU.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2: split patch2 into two as suggested by Hans

 drivers/platform/x86/amd-pmc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 1016a3415208..c94708c428b5 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -158,6 +158,8 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
 		dev_err(dev->dev, "SMU response timed out\n");
 		return rc;
 	}
+
+	amd_pmc_dump_registers(dev);
 	return 0;
 }
 
@@ -170,7 +172,6 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
 	if (rc)
 		dev_err(pdev->dev, "suspend failed\n");
 
-	amd_pmc_dump_registers(pdev);
 	return 0;
 }
 
@@ -183,7 +184,6 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
 	if (rc)
 		dev_err(pdev->dev, "resume failed\n");
 
-	amd_pmc_dump_registers(pdev);
 	return 0;
 }
 
@@ -255,7 +255,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	if (!dev->regbase)
 		return -ENOMEM;
 
-	amd_pmc_dump_registers(dev);
 	platform_set_drvdata(pdev, dev);
 	amd_pmc_dbgfs_register(dev);
 	return 0;
-- 
2.25.1

