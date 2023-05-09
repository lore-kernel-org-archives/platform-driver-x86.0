Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79122C77B7C
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 May 2023 14:08:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235742AbjEIOIB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 May 2023 10:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235691AbjEIOIA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2023 10:08:00 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C452030DD
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 May 2023 07:07:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KP3eHrdCPZuiB36LcGpqatRKoIx1Vslc2tNqw1BpoTK8yyqmqFtmpJO+obUdLTE4RugVUzrzr8AHiXyfH2rwDoeTZAFrEJdH/r1af0wd+lAxLQRxtt9fZKiLNSF7UMZiehZR62dAFl2Y9uGoTrUXiJ/F8ZmZebbaZGLy8Uki01QVRJgxzooHTxD9xUENFZ2O2RFBhzlxnKsYR9VopXVXkWLZfN+lV7sBxNT7/PZBkDM8HSZ6+PXY+7qnYR3kotZaoVQFvWxGxKs9XsLYAmtNWtxAmXkcJoRolTmbgIeK8SKZ53twCv1n1/urtLAhLjQeIHJsIT4cYqwXa54fBdfuYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byX8SdNA5fpYtyWqPVrVeyevaLa8TmVlUabDiSXQGlo=;
 b=N6zkPJ0GRSwAJcEtXqFiBqJUu1ADBBWMCHalKflO6b6EzwtyO9ZDXKB3ZGbSKs0Igi2QUrN0e49AeipYfO9Dx1PJxk0qcX5A+UYGcSH3BGiv9iRPY4BF/2H4EiYYZwJi7rkvufIKne8RpHeVnwgyW1UnQbZwOBIK9/H3g58ErVXsV8bOyFXNRoE2/3MGJjERzHE4658PfRLYGbt/nRoecj3Khv260U6BPRG2RKdV/2NaHm85UgApEsG2bJUGbi73IH5U8qT5mAXMiHDe5GQvhhF/45tC3tTYk2P1SUUQYV+MC26PZKrGVao1R1kSWgeXNEMbVeBKo2mho4HeFYFc5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byX8SdNA5fpYtyWqPVrVeyevaLa8TmVlUabDiSXQGlo=;
 b=u+R7IbEWz4AMUgdAaZuqcfvIUZQ8T8j6KMggx+AeQNN/mXYawyRbtRYCEg5mHkEhFNwtVOaf06Nj4hfIWzUVyh5hse0JqdmqwsRtu0mq+niLXMKnmves2SCHvF/atnSs/SEp0o77I3DunrZxZn+G/xB4xdw7QYFQoF18Bn8QHqU=
Received: from DM6PR03CA0035.namprd03.prod.outlook.com (2603:10b6:5:40::48) by
 BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 14:07:51 +0000
Received: from DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::2f) by DM6PR03CA0035.outlook.office365.com
 (2603:10b6:5:40::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33 via Frontend
 Transport; Tue, 9 May 2023 14:07:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT060.mail.protection.outlook.com (10.13.173.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.33 via Frontend Transport; Tue, 9 May 2023 14:07:50 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 9 May
 2023 09:07:48 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 2/2] platform/x86/amd/pmf: Add PMF debug facilities
Date:   Tue, 9 May 2023 19:36:57 +0530
Message-ID: <20230509140657.27479-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230509140657.27479-1-Shyam-sundar.S-k@amd.com>
References: <20230509140657.27479-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT060:EE_|BL1PR12MB5874:EE_
X-MS-Office365-Filtering-Correlation-Id: 08ac949d-342b-43d5-50ff-08db5096c68d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X9LMjEC8EYssYjCApBqkiuRwrzkwJ0A7GuHJ+1zpD6QaEaqEq6kisGEJe3w5lFmZKMkvxCNGNTFQ2ZNJ7eDtmzILtuOBv2ozYmIqPSWsgjsNWofTukk+HK+rbYN0sqfv1cXAR4CAt/S0W6/xtsFVQ1U17ezppb2dDKTQH67CrOem3K+JIjyR4v2WQsZE5jkhDnknqVjFW7QwCbu8rjriE+IpUeBE6JOhKiJVgTVFwbcXdBlABLVNUfQzspbcbU0IhRZsRdPGYAVEVF/18kqT0uNmuh7Yr4sKqOForTNB0qZi/MJBmMU/A96kyZHLeUY2Cb38XGCsziDU03SfPv1oqHmt/G/CN28Oprqr8nAFtm0+fGoQmkyFqhg48qapIFiRKwmBltepJIJeI32IcRDoW8qY/LJ48jKDFlSNNbomgrq4e+HzzVjhm+lVQE2hxskJOgQbRakZZvVkrrPwDHOUAAV3ypZaaRJ2bNN1XZuqnOxJjc1s/hawGSUegkj1RWaaSl7r5C8anP0HmtEW+vxlZLG6GRtwLKtTDJpWmb94eo1fbsAr+D76t8H1m3u//3gf2QEE7GRtAfCLoy0QYOcQ4UGQbeVXDl5gbwtRr9iSoWaZ+5I3XepePYGsqZY8IToK4UBypF7yRYN0xI8sucIhEDfA3tlFC58ZGJzqpcUxEpeEPcng2I4hNoprso/k3+zM1JaBp7auBZO/z8MoFgJs5Yuied7mi6idTN3GueKdMQ4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199021)(40470700004)(46966006)(36840700001)(83380400001)(40460700003)(2616005)(426003)(336012)(186003)(16526019)(2906002)(36756003)(86362001)(82310400005)(81166007)(82740400003)(356005)(36860700001)(47076005)(40480700001)(5660300002)(8936002)(8676002)(70206006)(70586007)(4326008)(478600001)(45080400002)(6666004)(7696005)(41300700001)(316002)(1076003)(26005)(54906003)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 14:07:50.7805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ac949d-342b-43d5-50ff-08db5096c68d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5874
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

At times, when the mode transitions fail to happen, the current
driver does not give enough debug information on why the transition
failed or the default preset values did not load. Having an on-demand
logs guarded by CONFIG would be helpful in such cases.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v3:
 - Based on review-hans branch
 - Address Ilpo's review remarks
 - use the right format specifiers while printing the data

v2:
 - Based on review-hans branch
 - Drop extra CONFIG item based on feedback from Hans

 drivers/platform/x86/amd/pmf/auto-mode.c | 23 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/cnqf.c      | 19 +++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
index 64425201d353..cb2fb4df39e9 100644
--- a/drivers/platform/x86/amd/pmf/auto-mode.c
+++ b/drivers/platform/x86/amd/pmf/auto-mode.c
@@ -179,11 +179,34 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
 			config_store.transition[i].applied = false;
 			update = true;
 		}
+
+#ifdef CONFIG_AMD_PMF_DEBUG
+		dev_dbg(dev->dev, "[AUTO MODE] average_power : %d mW mode: %s\n", avg_power,
+			state_as_str(config_store.current_mode));
+
+		dev_dbg(dev->dev, "[AUTO MODE] time: %lld ms timer: %u ms tc: %u ms\n",
+			time_elapsed_ms, config_store.transition[i].timer,
+			config_store.transition[i].time_constant);
+
+		dev_dbg(dev->dev, "[AUTO MODE] shiftup: %u pt: %u mW pf: %u mW pd: %u mW\n",
+			config_store.transition[i].shifting_up,
+			config_store.transition[i].power_threshold,
+			config_store.mode_set[i].power_floor,
+			config_store.transition[i].power_delta);
+#endif
 	}
 
 	dev_dbg(dev->dev, "[AUTO_MODE] avg power: %u mW mode: %s\n", avg_power,
 		state_as_str(config_store.current_mode));
 
+#ifdef CONFIG_AMD_PMF_DEBUG
+	dev_dbg(dev->dev, "[AUTO MODE] priority1: %u priority2: %u priority3: %u priority4: %u\n",
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
index 35af7c18f600..539b186e9027 100644
--- a/drivers/platform/x86/amd/pmf/cnqf.c
+++ b/drivers/platform/x86/amd/pmf/cnqf.c
@@ -175,6 +175,13 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_l
 		config_store.trans_param[src][i].count++;
 
 		tp = &config_store.trans_param[src][i];
+
+#ifdef CONFIG_AMD_PMF_DEBUG
+		dev_dbg(dev->dev, "avg_power: %u mW total_power: %u mW count: %u timer: %u ms\n",
+			avg_power, config_store.trans_param[src][i].total_power,
+			config_store.trans_param[src][i].count,
+			config_store.trans_param[src][i].timer);
+#endif
 		if (tp->timer >= tp->time_constant && tp->count) {
 			avg_power = tp->total_power / tp->count;
 
@@ -195,6 +202,18 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_l
 	dev_dbg(dev->dev, "[CNQF] Avg power: %u mW socket power: %u mW mode:%s\n",
 		avg_power, socket_power, state_as_str(config_store.current_mode));
 
+#ifdef CONFIG_AMD_PMF_DEBUG
+	dev_dbg(dev->dev, "[CNQF] priority1: %u priority2: %u priority3: %u\n",
+		config_store.trans_param[src][0].priority,
+		config_store.trans_param[src][1].priority,
+		config_store.trans_param[src][2].priority);
+
+	dev_dbg(dev->dev, "[CNQF] priority4: %u priority5: %u priority6: %u\n",
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

