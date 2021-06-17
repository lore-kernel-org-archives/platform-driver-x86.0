Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D607DC2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 11:31:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3417613CB
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 11:31:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbhFQLdP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Jun 2021 07:33:15 -0400
Received: from mail-bn1nam07on2081.outbound.protection.outlook.com ([40.107.212.81]:36260
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232332AbhFQLdO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Jun 2021 07:33:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQ1nQEyk9WLz9CO19yJ05sbxuPeeLN6qryLVHLeZAwq8+Zo+hTv2zHzCpGSpRBo6dUg6qTnTCERgglnbKOk/vaZ/yJsW0om/zKbiv3v4BNdBSvSsQKd0f/FmLefYf2Uh9+Z+nv/fJsu3I7ykTD9e/xZr0FWcgUG9VRNUiJgXH67gkn88uUMgubkU5KrxS8roOMXiCbMnAqnOLrdvAgKeMFE6lD8FeUfPYHxEtjpFKi7WjrmwAoXvlN/DifKzhRWOtI1pvj4X9F9SLuPqlkO3Ege5U0GfB2olcqS6DDhbdDtKCkkCQGbJyQkZW+75lSm0O55YNDc4ocYO42NkFlERMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8ynnj6swLoRaMsjHJS/VNYVt/LU9n37ABXo0wLmkv0=;
 b=JNR5lUmKt0YF5b0iNlxnY/dM8L7kw1G0jKcAcRnoql4IiA6moT3+2br+m6+zVF8+Vvg0pKUUClA/QBSOdq4InDUoRjvBKrtmJft3XZGillJWlP4qeYgom+bawYXnzgxCehPuagg8mWbjMXMfcXHBH4lSfxTq/6m5AXSOFBUW/JetfcUxs9qJHdPMUPtdspqXVQ3fCZrYYeYBO0OgNzw1cdwt/4rsQxZQWm/Zzy1YtKgaWz6xTOowuS6UPXu29V9vbmvQIoQ/K35IOBXYnPPpGnJmkXf22USmaHUdzzmwWq2fcMELnpUC7WKQKwLtnclBpk2jqB37vZrk3xH19IdubA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8ynnj6swLoRaMsjHJS/VNYVt/LU9n37ABXo0wLmkv0=;
 b=F81ydtWg4qAPw63cDOIWIaWQADgEwUa5boZqyFHOJv+EPJ0/gH0E0iTN9+yVbLz611YMTVtgtYyQM14wAm3apt1AgfhBZa9fQULhlbHU7Vy8R2NECo0wTnkD17AeUMYZLmeDKdJE3MI428efa5+8MFJWG60DDrbLgSMHDwNGJjY=
Received: from DM5PR13CA0055.namprd13.prod.outlook.com (2603:10b6:3:117::17)
 by SN6PR12MB2752.namprd12.prod.outlook.com (2603:10b6:805:78::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 17 Jun
 2021 11:31:05 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:117:cafe::61) by DM5PR13CA0055.outlook.office365.com
 (2603:10b6:3:117::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.7 via Frontend
 Transport; Thu, 17 Jun 2021 11:31:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4242.16 via Frontend Transport; Thu, 17 Jun 2021 11:31:04 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 17 Jun
 2021 06:31:02 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/6] platform/x86: amd-pmc: Fix command completion code
Date:   Thu, 17 Jun 2021 17:00:35 +0530
Message-ID: <20210617113040.1603970-2-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: a9fbc58d-1210-4a5b-3242-08d93183649e
X-MS-TrafficTypeDiagnostic: SN6PR12MB2752:
X-Microsoft-Antispam-PRVS: <SN6PR12MB275266924AF936652AEDC1559A0E9@SN6PR12MB2752.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GRAA+YMVksG6JAmcpra7wgK4c0JFXkgjIeBga7zcv1oknMH2jaehjESAKUi7URwuOAflIbHZFn1y02jTt2a77IQlKdGat8wu+eoK54xlvhnFzqqtvotyCRKWeVYxyRJZcTwjaW/sxnY/Zg5Pbca2svzt81fYRMwUjpOA+qokmJehA1YugEbIP0lQ9pzZLvrSzmP4LRaQQb0QWuZuQJFgtgPSCtFQ3hHQi/SyNocRHkBlrz5BCuOEZvJ8kZ8h6D3OJLRuFwduYlUFlwEtmtw5T9zJ1aztyQqCMDHPE+fJfb1/0de1+GLKuuYcJ5O/MZw444MXN4Y+DQg6m/yS5E3gP8FQOJBT2KQOL1gIfCiQCZDLpPSIgOTqG13p22NXAq5V+QOD2lNlUfpNIR8G4JH61h2xqRHU5YLvCZo/Wl1h/S2QHeEqbNL9vTZfUsLRkRai3TiNYtUdbgxMpQaVn42MaxF+ZBQyC9tqSDu2fpDfjjKskrMs3nrlWKZXia9tgEJboCQLh/OKWnIMBtXdyeIJtP6MVIxBTkTFZSv1kMfiPXPwnyK5V2dEZYmI5tG3FaqZdEizJVkf1pSwCunaKZ6qZvXC8M2vEr9wyoziRjkYpnsIE6k7d34WKtFAsyv3e98ecTl/qzlYkL5HEW8/tGCGzO0co1O+lsH/1T14UKUGm3GCHXXEyGIoU1CNWCsLBpma
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(36840700001)(46966006)(7696005)(81166007)(5660300002)(83380400001)(356005)(86362001)(54906003)(70206006)(2906002)(478600001)(70586007)(82740400003)(1076003)(6666004)(110136005)(82310400003)(8676002)(4326008)(47076005)(36756003)(26005)(36860700001)(8936002)(316002)(2616005)(336012)(186003)(426003)(16526019)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 11:31:04.7232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9fbc58d-1210-4a5b-3242-08d93183649e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2752
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The protocol to submit a job request to SMU is to wait for
AMD_PMC_REGISTER_RESPONSE to return 1,meaning SMU is ready to take
requests. PMC driver has to make sure that the response code is always
AMD_PMC_RESULT_OK before making any command submissions.

Also, when we submit a message to SMU, we have to wait until it processes
the request. Adding a read_poll_timeout() check as this was missing in
the existing code.

Fixes: 156ec4731cb2 ("platform/x86: amd-pmc: Add AMD platform support for S2Idle")
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd-pmc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index b9da58ee9b1e..9c8a53120767 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -140,7 +140,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
 
 	/* Wait until we get a valid response */
 	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
-				val, val > 0, PMC_MSG_DELAY_MIN_US,
+				val, val == AMD_PMC_RESULT_OK, PMC_MSG_DELAY_MIN_US,
 				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
 	if (rc) {
 		dev_err(dev->dev, "failed to talk to SMU\n");
@@ -156,6 +156,14 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
 	/* Write message ID to message ID register */
 	msg = (dev->cpu_id == AMD_CPU_ID_RN) ? MSG_OS_HINT_RN : MSG_OS_HINT_PCO;
 	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
+	/* Wait until we get a valid response */
+	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
+				val, val == AMD_PMC_RESULT_OK, PMC_MSG_DELAY_MIN_US,
+				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
+	if (rc) {
+		dev_err(dev->dev, "SMU response timed out\n");
+		return rc;
+	}
 	return 0;
 }
 
-- 
2.25.1

