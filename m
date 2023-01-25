Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DFE8C54E94
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Jan 2023 10:00:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235090AbjAYKAT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Jan 2023 05:00:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235467AbjAYKAP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Jan 2023 05:00:15 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D0A53B2C
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 02:00:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZXanfMBFWfVQsajef6AjgrNCnTcHkEWZzvDBbezve15bCrWa6tiXLNNmInpGWsc32M8Le8ln/MHOD/YSIliKkt2/q9msZer+nwJ9Qrjz7sbOZ8lJFSCECorZ+MDRZno3FqPy+v3qTKShbh9XvOrtJ0/YlbQrPi2Bt04lD0iC3O/ShYWb3Ecl+N1ddNg5LYzt/Ywer9DnW6DsUwbgsvRdRR3rtuXKm0pmI45kDazL60bwiH5x4e0edsyHMKyHh9ygGbIK6nfNqRgtZEDdcASg2Lhx5rQjatEn3sPF0UIFqE6Iuja0MzBKmiHb9QmLvQxnsrG9K2pzr4DG4/Q2zwlpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgqgZnBvR/NrUiq13MMrTs+ihoG7/CMoNt+8y6tr6kU=;
 b=eLhoD9N9aXC3GvV+e0C5k7eFSmYr9UjDS2dbzWHEdZw6dqvKFpgG40LnbyK6LQHLgvZcfhaNcG8dV4PcK374aQFe/Hiym8ysVT943iTY+mJmE33WtClL8lWVj3qdOxzowJHc9eYmDY0D919KTGiFOdO/l9LAOivCoK7/9dlch4jN52FFSgJq1D8cmHTD7u+b2g8TStA7IsrNgJmw4aJEeaaqjGUySIGf5EgNdwEKQ1Tq+tz+fZxZViJYlFcHi80FU3dZMA594qtY+vGQv02HaUieGvpF43u4T/JWgkXqeesMhffKNWQWSq2scpwLETxyMS0fwYb8pWJTuBnxAGhZXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgqgZnBvR/NrUiq13MMrTs+ihoG7/CMoNt+8y6tr6kU=;
 b=I9QCzMqXjh8MZbtHBCs/ZMWtdcAH81nYlJMwZO58vGgB6ZKq1w/JnFidVk+5eHU247XYF6Z0SIk3CQLYyHq7Sx5uYe5sLv3WCkQsRv5oQ9sFlgieJRhkeDSrGx6Y9/Rwm1siTnK+00NJsUtyfx5gzBV8MBQ/Ql1NVRsNIPom25c=
Received: from MW2PR2101CA0035.namprd21.prod.outlook.com (2603:10b6:302:1::48)
 by CH3PR12MB8308.namprd12.prod.outlook.com (2603:10b6:610:131::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.17; Wed, 25 Jan
 2023 10:00:09 +0000
Received: from CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::c) by MW2PR2101CA0035.outlook.office365.com
 (2603:10b6:302:1::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.4 via Frontend
 Transport; Wed, 25 Jan 2023 10:00:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT103.mail.protection.outlook.com (10.13.174.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 10:00:08 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 04:00:06 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/5] platform/x86/amd/pmf: Add helper routine to check pprof is balanced
Date:   Wed, 25 Jan 2023 15:29:33 +0530
Message-ID: <20230125095936.3292883-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125095936.3292883-1-Shyam-sundar.S-k@amd.com>
References: <20230125095936.3292883-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT103:EE_|CH3PR12MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 8139495d-5ce6-40d4-5b9a-08dafebaf142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cigTokpbci5XJXaXitBvGAbZlNLM3IqKi3UHjwuBZ4VY9eMnxHrbXKTqss5tiFiLugaeFqT7uGYsaoIDIfela1IAYCCjJfEqP8sBAbXhDOs+8e6BA8k9b7ls7YFbbvWbEHXBVZk5K/q+AAeWLWWQVTrzbw1ZPMna/oazDf0Kn9ZFLQuLCC6rG98K8AFweUKbELFiSHhSFAcbNX26yr9u98O/4z1vE5tzjkJ0+5WORUo2u0ne4D1VAX/yV7TIYlqawkGuOxx6PztrmuugBBkgoJL4/CqxoldmZ8r8xT5a4Jd2Vqeb7lDuIk5uwQPE6+qK9hpPSAnZ7iVfVuRqPWkuEIiDlkdvrkF4PFbXs0hTzEdxUKlpkkI0VYf03M0eeIVZiBhpKfdVlh5VXUbirs9QPlVklbDcMXG9GcnRwlBVuosboaI3fugLGgHDOqjKVUjUWT90gh5LM3dLS3tBc99JETxfUGVBrWhlaA80sBCXlopEqerDD07EHdt3z5BDbIPjBDKDJDdvMerRgYmm7SpBfhCrrZWa8kdk8p6tq/voYdgrSmBQvnqSa2J+tXBUs3BKkEk9z8r0key5QbdXrYAj9LzjZymwHdKShcqMz3buM2iblaE2hDzYPwoXNRMoQT3lT1SIp9EGhIIm2Qj3x5UxxWRjfGfhTyBF1votu3eeoKfeF/mft9r6BjtGS97eL+zF3PDkS6XvGK2qrUMxpZ+lEfgoeyaCKKxfSvUikatQwHI=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(47076005)(16526019)(36756003)(8676002)(40460700003)(40480700001)(81166007)(36860700001)(356005)(54906003)(2616005)(426003)(83380400001)(336012)(86362001)(26005)(82310400005)(186003)(478600001)(5660300002)(6666004)(316002)(7696005)(1076003)(82740400003)(70206006)(41300700001)(8936002)(70586007)(2906002)(4326008)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 10:00:08.9970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8139495d-5ce6-40d4-5b9a-08dafebaf142
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8308
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add helper routine to check if the current platform profile
is balanced mode and remove duplicate code occurrences.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/cnqf.c | 6 +++---
 drivers/platform/x86/amd/pmf/pmf.h  | 1 +
 drivers/platform/x86/amd/pmf/sps.c  | 5 +++++
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
index 21e00ba39f19..4beb22a19466 100644
--- a/drivers/platform/x86/amd/pmf/cnqf.c
+++ b/drivers/platform/x86/amd/pmf/cnqf.c
@@ -103,7 +103,7 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_l
 
 	src = amd_pmf_cnqf_get_power_source(dev);
 
-	if (dev->current_profile == PLATFORM_PROFILE_BALANCED) {
+	if (is_pprof_balanced(dev)) {
 		amd_pmf_set_cnqf(dev, src, config_store.current_mode, NULL);
 	} else {
 		/*
@@ -317,7 +317,7 @@ static ssize_t cnqf_enable_store(struct device *dev,
 	src = amd_pmf_cnqf_get_power_source(pdev);
 	pdev->cnqf_enabled = input;
 
-	if (pdev->cnqf_enabled && pdev->current_profile == PLATFORM_PROFILE_BALANCED) {
+	if (pdev->cnqf_enabled && is_pprof_balanced(pdev)) {
 		amd_pmf_set_cnqf(pdev, src, config_store.current_mode, NULL);
 	} else {
 		if (is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
@@ -382,7 +382,7 @@ int amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
 	dev->cnqf_enabled = amd_pmf_check_flags(dev);
 
 	/* update the thermal for CnQF */
-	if (dev->cnqf_enabled && dev->current_profile == PLATFORM_PROFILE_BALANCED) {
+	if (dev->cnqf_enabled && is_pprof_balanced(dev)) {
 		src = amd_pmf_cnqf_get_power_source(dev);
 		amd_pmf_set_cnqf(dev, src, config_store.current_mode, NULL);
 	}
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index b5b77a353b96..b94e1a9030f8 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -391,6 +391,7 @@ int amd_pmf_init_sps(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_sps(struct amd_pmf_dev *dev);
 int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
 				    struct apmf_static_slider_granular_output *output);
+bool is_pprof_balanced(struct amd_pmf_dev *pmf);
 
 
 int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index 5f842d6e6db2..3b4a09a84c29 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -83,6 +83,11 @@ int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf)
 	return 0;
 }
 
+bool is_pprof_balanced(struct amd_pmf_dev *pmf)
+{
+	return (pmf->current_profile == PLATFORM_PROFILE_BALANCED) ? true : false;
+}
+
 static int amd_pmf_profile_get(struct platform_profile_handler *pprof,
 			       enum platform_profile_option *profile)
 {
-- 
2.25.1

