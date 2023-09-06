Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92EABEB8FA5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Sep 2023 07:13:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbjIFHNm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Sep 2023 03:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230514AbjIFHNm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Sep 2023 03:13:42 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89288E50
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 Sep 2023 00:13:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNIk1K6kdCF8+taB1y1paP2cflB1IgA02NTQiTPOF3cJoR8kWXrNwrHlAcJ5B/PRy2ZMfvrowBjKbf/hGdKwfYivu81cILddW+A3NBx8lOjYqlXmhooLKoWZu8CW/gLzvsCvu3IvNPx7lVK4Or1wB5N8VAmqCQ1Ak95fbk2FxB340rwbokgM483Xc9Z+zgtiuOB4WFGD/x2Y1FsgLhI3TYB0ewoSHYxUaZFpfpOSOKXwTvssNrN8CMh26MtUqkEJZj95lb7kyPPlV0lWgX+cp/Rby7H/WOEmd/QMMnlbRQ+StrEM8W8ZMi+Xf5xMfVbwZxYXTOthx6/hLj2nhp7qJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Sz0HnJjYVLQAs2hI0hyEWsi3tS7GC0zg5rJ/RKHCF4=;
 b=Q4OoQzv4vGGep7onZpL4R3IUrghHzf9fsvQahlA4ZKvr9ubFMko7EhbLSFHeh/QN5BMz84mLgppWFAqL0sSgxXkkbJsgMGPsnDXQtFbxQfVxqmhmF2q6CC/wY9OyY5oCMOO85QxfP0bvbGF+yFW2VcUwRx2B4wvALlsxuIQrAdNMw/LZeqK1cGYVvLEZco16rnhWDIK5GVnVYw2gy/Zh1COTL35IRFExrqw5TyXfhD7sOA5V9kZxt0rV3eYX8ADJYhZmJ60mKaAExM44AfKoivWHLCx9SSOKQhgye67X1bIs8CzKcN0UgGtoP7E2ge24ZvDpQ86lHFlSCAovXZCsPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Sz0HnJjYVLQAs2hI0hyEWsi3tS7GC0zg5rJ/RKHCF4=;
 b=Z+Zik2GbIMQiKJKd3f2CUVJwUq3cTn1HMtoMJ402vKiMWOBRU3Oave0t0ObisKMRB3xdW7tyg/n1QJn4UNonK8pgOmSZcuor5Oo1aW0A0VHlRn6hEc5FUS0SEP36iWnvwVYD4OvX6jFFK4z1ZOcFRKzxl2Y4CxOnnZj4SUBMeP8=
Received: from SA9PR11CA0017.namprd11.prod.outlook.com (2603:10b6:806:6e::22)
 by LV8PR12MB9136.namprd12.prod.outlook.com (2603:10b6:408:18e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 07:13:33 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:6e:cafe::8) by SA9PR11CA0017.outlook.office365.com
 (2603:10b6:806:6e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34 via Frontend
 Transport; Wed, 6 Sep 2023 07:13:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 07:13:33 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 6 Sep
 2023 02:13:31 -0500
From:   Suma Hegde <Suma.Hegde@amd.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Suma Hegde <suma.hegde@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v2 3/4] platform/x86/amd/hsmp: improve the error log
Date:   Wed, 6 Sep 2023 07:13:01 +0000
Message-ID: <20230906071302.291260-3-Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230906071302.291260-1-Suma.Hegde@amd.com>
References: <20230906071302.291260-1-Suma.Hegde@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|LV8PR12MB9136:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ee9cc30-268d-4e80-8e2f-08dbaea8c7c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FfpQ85Lv2QuaCf+lNcnLkn6jsTzhV3rIzbTPpfAKaosvguLugWA9qjMdNifH8R7cgbCKk7gLw3lOlfh+panPOdL8Y8c0PNLWlM78lcznCvIlzrM+b/vno9ykkMj5pS/90gBATO5IBo6mvKT77SLF4hWUuASF1qPHOf3Mf+pA13zuNX3ooanFlR1dCTiVA78UNxnQZMtVziFvvaZe4fitOcYY8hVCZYokIK0jbiQgdjAYoR5wjv1qNDxF9sExF5ZNWRBgHt71Tf5P+R5zv27+aFZGJWLLMbqcohy50SbWrSmdALnhkMOQ0FTxmQS5NrTU0M4SUmt2BM1mE10saKi8zVLkJRwnic7TrxW6W/zgI78QNp2kAkgStnjVvobORznfYSUz/eXXfobF0M+kHaVFTm0z3aFjzc3bsIc3Rs066GIpCO8pcMiLGa0/jKeY0Y9vUI9hxpfO61xBaS3vy9/G2A8mBRM3ybeDEhJMW2f0bLo28Qvj30cwv2Frk3ZLPUTxW6mqJl0eR9Yr3adzCWAvlI2gS6KQGi8eLCwqkSDHCieuF4wYzNehvqOoc0mnPv3LXJF+8/xamK7O5SctUUmSyEqOHLiNMt2FY6YVSt9F/KvtCJIaDhfgvEgS8NKWR+eNC67PJhLDD47Mr48bPFSwaDHCTm0/cjo2FlzzCePr7TSkeuzr2wp6lg+gCHsR237cqMQ19trO834fw53qoqcCgoL9WHoP8L1z+xOugXsVHVZPbpyOy93uQNom6OIxpTGzeeKK45TQGHNGBXlb3PLzVw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(136003)(39860400002)(1800799009)(82310400011)(186009)(451199024)(40470700004)(46966006)(36840700001)(26005)(7696005)(16526019)(40460700003)(1076003)(36860700001)(47076005)(81166007)(82740400003)(86362001)(356005)(36756003)(2616005)(336012)(426003)(83380400001)(40480700001)(8936002)(41300700001)(316002)(4326008)(6916009)(54906003)(5660300002)(8676002)(70586007)(70206006)(2906002)(6666004)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 07:13:33.1980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee9cc30-268d-4e80-8e2f-08dbaea8c7c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9136
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Suma Hegde <suma.hegde@amd.com>

1. Change print message during platform init to a more meaningful
   clear message.
2. Return the error code returned by hsmp_test() itself, rather then
   returning a common EOPNOTSUPP error.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v1:
1. New patch.

 drivers/platform/x86/amd/hsmp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 80c71c6ddeaf..a9c5a36daac1 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -569,10 +569,10 @@ static int __init hsmp_plt_init(void)
 	for (i = 0; i < num_sockets; i++) {
 		ret = hsmp_test(i, 0xDEADBEEF);
 		if (ret) {
-			pr_err("HSMP is not supported on Fam:%x model:%x\n",
+			pr_err("HSMP test message failed on Fam:%x model:%x\n",
 			       boot_cpu_data.x86, boot_cpu_data.x86_model);
-			pr_err("Or Is HSMP disabled in BIOS ?\n");
-			return -EOPNOTSUPP;
+			pr_err("Is HSMP disabled in BIOS ?\n");
+			return ret;
 		}
 	}
 
-- 
2.25.1

