Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 680B4C7619A
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Apr 2023 10:53:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjDLKxK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Apr 2023 06:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjDLKxJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Apr 2023 06:53:09 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85FA56A62
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Apr 2023 03:53:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BP2/b2KZe7g4N/66jN0ZqdV5Y9jLvWRMxzWwZHn091HgDxkmOPSbeYTjPKCWYSCtLwX20T9pGl4E+ckcFPzlvYhNHBWOktPmJLiHFNGatTTqihTairLVqhhBjG5yULspPoOD1kyX4l7Lo/l4Fv128J5ykG1TVo77uxJoZCGHfU7UFAdYXGRgXhZ+TqPYP8FRDFgZC5esugx4anwkgy6QR0udoogR6Sf0+GQaT1w07hXPOmSapuvk2AyuqXfXNqPemgX2HuF/T7y2k9K5YSsL1e6BGGL2k6rQr/1erl+Z1cMbe3hKOn3NkMPMXBZhUc69ri05zCHYqdvVaVm6aVSMqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTg2L0idbm4RMbNX/VTWRLdd8QO+IcjHmye3HRAjJmg=;
 b=O6UlDWq7H3xWu7LZl9Vb9hn/LUv/t+sxDmICUfpAqw5xYLz1MlFQqCR/a7RIkDMuJX3MaH1jxqk6P7bxvBF1L/KBOR3d3FiQt/6jjJPxr8/7gKNNsGeLoMFb3B9O64fSIgsxDK6pv9HPGkkVvye+E/c/OzdcIKOT3RZCkbwMiwAsBYTO/nf14RdxEixkbzPsGM3ERWluR19L+ZRfc3TaKS+9SiFvUnUFm+xtuKmODvoORU7Et4n1kTya+09cIV8FIew4BHB7wC6O8zGNbsXZD6PxgH+bLSUVYsL1Bgy+NjmCrPmugqYDdwQ8gZ4OiWLBZdwpywcr52R4vp9YSzDDxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTg2L0idbm4RMbNX/VTWRLdd8QO+IcjHmye3HRAjJmg=;
 b=KkDB8vGO49bn0bjM/2DdF0/9H4qL/XGe1+rHU39BnQnt4CIPOg2b4J5s9dchKxAXUYrrdsO/EGt33nA9RlVII7hEaKPBjN4BlFyThSvIYtPE6mL93NaLDpqv+TKv2QE168904hU+Kj6GI+IYuGIG4BugNexpj6PDzRjgkCzyOBE=
Received: from BN0PR04CA0007.namprd04.prod.outlook.com (2603:10b6:408:ee::12)
 by PH0PR12MB7907.namprd12.prod.outlook.com (2603:10b6:510:28d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 12 Apr
 2023 10:53:06 +0000
Received: from BL02EPF000145BB.namprd05.prod.outlook.com
 (2603:10b6:408:ee:cafe::fc) by BN0PR04CA0007.outlook.office365.com
 (2603:10b6:408:ee::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30 via Frontend
 Transport; Wed, 12 Apr 2023 10:53:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000145BB.mail.protection.outlook.com (10.167.241.211) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.27 via Frontend Transport; Wed, 12 Apr 2023 10:53:05 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 12 Apr
 2023 05:53:03 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/2] platform/x86/amd/pmf: Add PMF debug facilities
Date:   Wed, 12 Apr 2023 16:22:42 +0530
Message-ID: <20230412105242.2602148-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230412105242.2602148-1-Shyam-sundar.S-k@amd.com>
References: <20230412105242.2602148-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000145BB:EE_|PH0PR12MB7907:EE_
X-MS-Office365-Filtering-Correlation-Id: 420e982c-d303-4b25-6f89-08db3b441897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kvYMNVQxxRYqxCF3Hi1So/zkKOcVKLqf2pO1jCgZaLvJOz8+R2OHgIt1g8Zl1T3fG0xPSUIQOt1NdtSjBv0aHHj66NNohpUsBXKF0aA0nv3odLEumIpOt8mWOmmLtwK+cScKwXwmKKbKbj54B3h/GtDijHdD4kA8/ohVoi3FGsCOeQqnv8YP5jdYcTNg9TcxQ046A+Rk/UgtxAQ1gMcH+ge4O9HT5H/VN3qg/BEVG37o3cEhKvgp3CVlBppRRrEU6VLB92cdKD+VxIA6ZMUen2V6iAWmvUzARpGuJzVLsIiKhenOjLvnLCe02rDwZlacsCWoNKBewtxMWgP2p1+iJyNHEK6YBZ2t6rw01Xea+X38YjiHQO0mxpdaNjzWuCyTtF21J2QcEn5npm1eoAPizM41BqEPMFSONV2O74bAXCDnJRltw4EAqD5eEXaOzAGGvm4w8WuErp+iaoNYJoTzuwj2hi4tmQyCpVO8+2CbhMwDQxr7S0QzBtnPiE7deocFWNk6qrDrKYIMMT31sjPCjywKFNA+NQdtUeVBwIFLPAv86jJW/bUQJWfVYv0KVdrszhrWn0bA425Ix5RPI0Uyk0i9/bXauQplayWRr9SYqdTsQQUYBWvqUsOO8SwuyPFXOF5+csc1r5Y4ZkKevz3QeId1llgUPOa/vSkrx7RGGdt8MWVlRqOafL73Mfw78snefhyEL6uJIwkmAU27a/ljY+hineegNCbbUwNxMY9TbEM=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199021)(36840700001)(46966006)(40470700004)(86362001)(36860700001)(40460700003)(36756003)(5660300002)(2906002)(316002)(8676002)(8936002)(40480700001)(81166007)(356005)(82310400005)(41300700001)(82740400003)(4326008)(47076005)(2616005)(83380400001)(426003)(336012)(70206006)(70586007)(54906003)(1076003)(110136005)(186003)(26005)(478600001)(7696005)(16526019)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 10:53:05.8980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 420e982c-d303-4b25-6f89-08db3b441897
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000145BB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7907
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

At times, when the mode transitions fail to happen, the current
driver does not give enough debug information on why the transition
failed or the default preset values did not load. Having an on-demand
logs guarded by CONFIG would be helpful in such cases.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2:
 - Based on review-hans branch
 - Drop extra CONFIG item based on feedback from Hans

 drivers/platform/x86/amd/pmf/auto-mode.c | 22 ++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/cnqf.c      | 19 +++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
index 557a962b48f9..c3c1621b9833 100644
--- a/drivers/platform/x86/amd/pmf/auto-mode.c
+++ b/drivers/platform/x86/amd/pmf/auto-mode.c
@@ -177,11 +177,33 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
 			config_store.transition[i].applied = false;
 			update = true;
 		}
+
+#ifdef CONFIG_AMD_PMF_DEBUG
+		dev_dbg(dev->dev, "[AUTO MODE] time_ms:%lld avg_power:%d mode:%s timer:%u tc:%d\n",
+			time_elapsed_ms, avg_power,
+			state_as_str(config_store.current_mode),
+			config_store.transition[i].timer,
+			config_store.transition[i].time_constant);
+
+		dev_dbg(dev->dev, "[AUTO MODE] shiftup:%d pt:%d pf:%d pd:%u\n",
+			config_store.transition[i].shifting_up,
+			config_store.transition[i].power_threshold,
+			config_store.mode_set[i].power_floor,
+			config_store.transition[i].power_delta);
+#endif
 	}
 
 	dev_dbg(dev->dev, "[AUTO_MODE] avg power: %u mW mode: %s\n", avg_power,
 		state_as_str(config_store.current_mode));
 
+#ifdef CONFIG_AMD_PMF_DEBUG
+	dev_dbg(dev->dev, "[AUTO MODE] priority1: %u, priority2: %u, priority3: %u, priority4: %u",
+		config_store.transition[0].applied,
+		config_store.transition[1].applied,
+		config_store.transition[2].applied,
+		config_store. transition[3].applied);
+#endif
+
 	if (update) {
 		for (j = 0; j < AUTO_TRANSITION_MAX; j++) {
 			/* Apply the mode with highest priority indentified */
diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
index 371762ce8446..6146875dcc44 100644
--- a/drivers/platform/x86/amd/pmf/cnqf.c
+++ b/drivers/platform/x86/amd/pmf/cnqf.c
@@ -173,6 +173,13 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_l
 		config_store.trans_param[src][i].count++;
 
 		tp = &config_store.trans_param[src][i];
+
+#ifdef CONFIG_AMD_PMF_DEBUG
+		dev_dbg(dev->dev, "avg_power:%d total_power:%d count:%d timer:%d\n", avg_power,
+			config_store.trans_param[src][i].total_power,
+			config_store.trans_param[src][i].count,
+			config_store.trans_param[src][i].timer);
+#endif
 		if (tp->timer >= tp->time_constant && tp->count) {
 			avg_power = tp->total_power / tp->count;
 
@@ -193,6 +200,18 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_l
 	dev_dbg(dev->dev, "[CNQF] Avg power: %u mW socket power: %u mW mode:%s\n",
 		avg_power, socket_power, state_as_str(config_store.current_mode));
 
+#ifdef CONFIG_AMD_PMF_DEBUG
+	dev_dbg(dev->dev, "[CNQF] priority 1: %u, priority 2: %u, priority 3: %u",
+		config_store.trans_param[src][0].priority,
+		config_store.trans_param[src][1].priority,
+		config_store.trans_param[src][2].priority);
+
+	dev_dbg(dev->dev, "[CNQF] priority 4: %u, priority 5: %u, priority 6: %u",
+		config_store.trans_param[src][3].priority,
+		config_store.trans_param[src][4].priority,
+		config_store.trans_param[src][5].priority);
+#endif
+
 	for (j = 0; j < CNQF_TRANSITION_MAX; j++) {
 		/* apply the highest priority */
 		if (config_store.trans_param[src][j].priority) {
-- 
2.25.1

