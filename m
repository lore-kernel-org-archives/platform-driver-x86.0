Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5D0C6FA82
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Sep 2022 16:51:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbiIVQv7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Sep 2022 12:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231474AbiIVQv5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Sep 2022 12:51:57 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06242EB124
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Sep 2022 09:51:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaGNd+XbXQzDdpCxZcQGtXLx1exzlBO82o7DehOL+UlQBx3xNqUZloJsC5HRDrU3FLq7bAOyXl0wwB/+Gbldik36fMIDH3YvYib2RwH0jSznn2D7W6eD8lhUd2Bro/yjdO1gHmQltsD2VBdDoRl0mDkzU/4Uub9GCywk4giA7otdM4w8LxTHZuuBwNMQw/ukNSRen7D9km8jqm+TUMlu37c0MsJg2YstHmoatZTCyRh61+OLZQKs/x647iZ4SNSdrN8ruuVkfZw84aQeir2AKYebw9GvFJCSXNJReHJXXCbTyy2M+c0sFZmGL4Tt5WL0ETDxGw6IqgsEtS0gA/QlNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2W1MkPHlR9jNFjMmb/PwX8KVm6TErGLNhXWktaEGTg=;
 b=eW1sjrm14dSb1cSxMyiYgGuXske2jfFHgP/lgOWMLB2dtbzX1wwMV+feEdZvBm2yS3oYGYuLWb1VlYpwKsaPhxLr1C8CP7s5IfE7oHL8P+RxDrNevLeKzd9rIyvDJ0RG7nUJrZD2W57aZuikuCmumZPjoWjWzV3/WztrjSq3o1lGq+LmrXINlpuS5qyU+SYJ7/bILEt8BEKro8nWF2mHDN2L2Uq7jCY6tbDfj67w45eOTQARuuMQBIlyIIcO7JOvCToa+mt3VrxCJLqhWESBcSHdd+P5XdyTwwJvDf4+u7oLU5isbxEj0KE5MiJQ7d3yMi1J/9dS8BnXj7r7eUp/Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2W1MkPHlR9jNFjMmb/PwX8KVm6TErGLNhXWktaEGTg=;
 b=nBjO4YJ90Gmv9TBhqO+gA9XYxiQs+7D+CQDOsMqD5h0Sr7I2oLv1PUewMq/ZYusAMKcflvL8bm4rEjYoeNFcsYeH76UzWd827GHJ5CKHi0uH2ZY7svbhFnNG6iZ/1jCkjWPRbYOET+tRg63QXryYPer/OgFd6aaypK2i29/9SvI=
Received: from BN9PR03CA0521.namprd03.prod.outlook.com (2603:10b6:408:131::16)
 by MN2PR12MB4224.namprd12.prod.outlook.com (2603:10b6:208:1dd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19; Thu, 22 Sep
 2022 16:51:50 +0000
Received: from BN8NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::ed) by BN9PR03CA0521.outlook.office365.com
 (2603:10b6:408:131::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18 via Frontend
 Transport; Thu, 22 Sep 2022 16:51:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT083.mail.protection.outlook.com (10.13.177.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 16:51:50 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 11:51:47 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <mario.limonciello@amd.com>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <bnocera@redhat.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86/amd/pmf: Remove unused power_delta instances
Date:   Thu, 22 Sep 2022 22:21:18 +0530
Message-ID: <20220922165118.163165-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT083:EE_|MN2PR12MB4224:EE_
X-MS-Office365-Filtering-Correlation-Id: 03eade44-e73f-401e-0d35-08da9cbabee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uJQzPwVxOEbqvCpy7u6IXoY7GMnZEgnuG368zIPlOfToEvg/clNmLh4j/fWirjUu2B/4dCuPYrU/Csk9ziXBHmnGdUivDMjBkCDRU5dCPsnp0PsDFqlRpYOkDgVW96EQ+IEmpdSucjGxh6VyaRXGpiwPTpRe6d9JQx+q6tECqJhDN8+Ph48JbAbxmZzvW1XpWvV/HrWZTz0gN8FaPLdzqlczxdo0nKmn615pf/25SPiFYip57tRQZJs1D6876CXeuRG00CLGMemIvtQ7QQXB7PpdEbMyIq60WJkj4SxAmh8RG1urTEFKexJx4ZubzxauF37dB1ubuBm4atTC1dWv5Wc/T9zz5wXj+njhQKYGm1qWwoqQKUBJvIV59B8dNfIFwqcKfpZilIoxg2A+KT8VJPqTvSgdFo1j4F5axmGYZiOViL6Olysguaj9JUlxUQnvPRtsQpgR/DoIGqM+poNezac0L52FuUYJyTW2JJ+KyuQX8fd4V2sJQJtTPVP4DSnoqq1+h2YPMxF0Gim1arhBpanKH+STftu3nuXBmROOHX78C2jYFzeO7t30EVsBBxm0tgOrnwvMku2EakKhl1KSi+/aak8ekV16gC0CM2cpmU3RZbDYFDyJvcJCzJt9TazZwxb6rZlpN6c2RlyNmQKbmPa5QpZ0RhKkjuzR6KBxNDtWPE33f06fZGueBlWNh3gIOdiQyKTaZkvLidMjUsFH+Fdjl4GiYnVRFejvcgdrVXcHJATYgV/kVZUTzXHNFBmnB/s8l3LmQli3mNKJGWrThjwx0vuXT6CagQlbtQGOIkBKjVxMbpC3wXQHz7mfCfwm
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199015)(40470700004)(36840700001)(46966006)(36860700001)(2906002)(82310400005)(356005)(86362001)(81166007)(40460700003)(82740400003)(6666004)(2616005)(26005)(6636002)(54906003)(110136005)(316002)(7696005)(478600001)(336012)(41300700001)(8676002)(4326008)(8936002)(5660300002)(40480700001)(426003)(47076005)(186003)(1076003)(16526019)(70206006)(83380400001)(70586007)(36756003)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 16:51:50.5966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03eade44-e73f-401e-0d35-08da9cbabee3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4224
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Initial version of the PMF ACPI documentation had the concept
of "power_delta" which is removed in the recent revisions.

So the entire cnqf_power_delta structure is never used/updated.
Hence removing it.

Fixes: 1738061c9ec8 ("platform/x86/amd/pmf: Add support for CnQF")
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/cnqf.c | 12 ++++++------
 drivers/platform/x86/amd/pmf/pmf.h  | 11 -----------
 2 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
index 927f3c8cd971..668c7c0fea83 100644
--- a/drivers/platform/x86/amd/pmf/cnqf.c
+++ b/drivers/platform/x86/amd/pmf/cnqf.c
@@ -45,27 +45,27 @@ static void amd_pmf_update_power_threshold(int src)
 
 	tp = &config_store.trans_param[src][CNQF_TRANSITION_TO_QUIET];
 	ts = &config_store.mode_set[src][CNQF_MODE_BALANCE];
-	tp->power_threshold = ts->power_floor - tp->power_delta;
+	tp->power_threshold = ts->power_floor;
 
 	tp = &config_store.trans_param[src][CNQF_TRANSITION_TO_TURBO];
 	ts = &config_store.mode_set[src][CNQF_MODE_PERFORMANCE];
-	tp->power_threshold = ts->power_floor - tp->power_delta;
+	tp->power_threshold = ts->power_floor;
 
 	tp = &config_store.trans_param[src][CNQF_TRANSITION_FROM_BALANCE_TO_PERFORMANCE];
 	ts = &config_store.mode_set[src][CNQF_MODE_BALANCE];
-	tp->power_threshold = ts->power_floor - tp->power_delta;
+	tp->power_threshold = ts->power_floor;
 
 	tp = &config_store.trans_param[src][CNQF_TRANSITION_FROM_PERFORMANCE_TO_BALANCE];
 	ts = &config_store.mode_set[src][CNQF_MODE_PERFORMANCE];
-	tp->power_threshold = ts->power_floor - tp->power_delta;
+	tp->power_threshold = ts->power_floor;
 
 	tp = &config_store.trans_param[src][CNQF_TRANSITION_FROM_QUIET_TO_BALANCE];
 	ts = &config_store.mode_set[src][CNQF_MODE_QUIET];
-	tp->power_threshold = ts->power_floor - tp->power_delta;
+	tp->power_threshold = ts->power_floor;
 
 	tp = &config_store.trans_param[src][CNQF_TRANSITION_FROM_TURBO_TO_PERFORMANCE];
 	ts = &config_store.mode_set[src][CNQF_MODE_TURBO];
-	tp->power_threshold = ts->power_floor - tp->power_delta;
+	tp->power_threshold = ts->power_floor;
 }
 
 static const char *state_as_str(unsigned int state)
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 097f3f5d33a3..e5dc3ae238c7 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -333,7 +333,6 @@ struct cnqf_mode_settings {
 
 struct cnqf_tran_params {
 	u32 time_constant; /* minimum time required to switch to next mode */
-	u32 power_delta; /* minimum power required to switch to next mode */
 	u32 power_threshold;
 	u32 timer; /* elapsed time. if timer > timethreshold, it will move to next mode */
 	u32 total_power;
@@ -343,21 +342,11 @@ struct cnqf_tran_params {
 	enum cnqf_mode target_mode;
 };
 
-struct cnqf_power_delta {
-	u32 to_turbo;
-	u32 balance_to_perf;
-	u32 quiet_to_balance;
-	u32 to_quiet;
-	u32 perf_to_balance;
-	u32 turbo_to_perf;
-};
-
 struct cnqf_config {
 	struct cnqf_tran_params trans_param[POWER_SOURCE_MAX][CNQF_TRANSITION_MAX];
 	struct cnqf_mode_settings mode_set[POWER_SOURCE_MAX][CNQF_MODE_MAX];
 	struct power_table_control defaults;
 	enum cnqf_mode current_mode;
-	struct cnqf_power_delta power_delta[POWER_SOURCE_MAX];
 	u32 power_src;
 	u32 avg_power;
 };
-- 
2.25.1

