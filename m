Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6F1C76196
	for <platform-driver-x86@archiver.kernel.org>; Thu,  6 Apr 2023 16:49:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239716AbjDFQtO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 6 Apr 2023 12:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239682AbjDFQtE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Apr 2023 12:49:04 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D47BA5F4
        for <platform-driver-x86@vger.kernel.org>; Thu,  6 Apr 2023 09:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hj2oT46sd78833QCHjoaHfyfMhfBS+7Pu9v7cHSfU/bd+m7xehg5gd0SRJivl7wFupAgTjgQ9IEVQ/LFbCznsQKl4oCm1sNN0NGC/H/0Y/PYR1URYbfmvBlHxPO8ck6IQakXiYDv7tl2D8p/tQRuyU8zqGyugHX1a35UxHbk5BSZKPb2+ZiaSLcBnracElrgNs2E7YGQ+xpewSHgpolpZ3F+bECQwIlnar2ZqUK9UZLV/z/M0EPuJWdbTygl3Ih1Errt6961gwfl1ozp28dWqRejIudzwnVuFzPdWLUTwPzs1Y9P4mpsh16XI7fMCIadV3KxkgMGgmA9wGj6j5ELRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jz/zKSon0XF+z3AcHZ5Wk6Y1YJM36xpELq4uSskV0Vs=;
 b=hwRW3YfLwLODH43orIM/e/R0HLknWa2b9ovi2ivc9ioyxIzO98oDRCy3Xi164KLFsDfsGBqJVbGWRtbwRpEA1qrXGuKOlVqZCVJwlDJwKgM4bvzfBtDStZxV/OX6KXFagXjn+MV0+imZ2UlziV8rA95r4ZB9S+ykz6x+Vm9v5S8A6o8Of6FeBJDrFlWe9nQHydTrH7YyHR1IzIkR77GLdsNTzy46LL6RHOWOgmrGyzTUtB1FKevxkfPWHgLdgHOv0RGfQyK/zhfDKEzWqOf0hXztbuUXiyvnoQuLF0nXXmNu8O82Hl0To/XMYIIRqEGAJSRpU1sZ+B5gX8DacifAFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jz/zKSon0XF+z3AcHZ5Wk6Y1YJM36xpELq4uSskV0Vs=;
 b=NMb55MqhctGVQYuQ5dfojmN5hU087ROf+mZgmaF3cjuLFg2Z7DB3OlrFCegb9tsW+c7BsFGS4lqyPfBrQdmwQJDjj6HXymJvEE/fHyGUMmSPhh3+XScdeEnmdl6RPJUWYrLPOwhMavYLNNkZ0ExsJdiXOWgDhAklVETLk+nE6V8=
Received: from MW4P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::16)
 by DS7PR12MB5766.namprd12.prod.outlook.com (2603:10b6:8:75::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 16:48:58 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::28) by MW4P220CA0011.outlook.office365.com
 (2603:10b6:303:115::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31 via Frontend
 Transport; Thu, 6 Apr 2023 16:48:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.31 via Frontend Transport; Thu, 6 Apr 2023 16:48:57 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 6 Apr
 2023 11:48:53 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/3] platform/x86/amd/pmf: Add PMF debug facilities
Date:   Thu, 6 Apr 2023 22:18:06 +0530
Message-ID: <20230406164807.50969-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230406164807.50969-1-Shyam-sundar.S-k@amd.com>
References: <20230406164807.50969-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT048:EE_|DS7PR12MB5766:EE_
X-MS-Office365-Filtering-Correlation-Id: 823c4d60-f540-4953-88c0-08db36bed0be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5CU5y+87ap2zKKDbaRMgGkpxrOLLXFzgM5zsS2Fw6llcLRM8U5STGC269VPgxvVqe3F1/7ZenmwW5r2jSW0mTTJEccMxXuRqXvhTWDd966/Hg2XMkuexuprY0AhwmepSuQ59e515X0CISz+rqR5tGjsmMfQCj5xhcF5lcN9Y4IjIRKzL9Q1zdy8Eh14aHmUQo/FEaKCKQEaecdcofaNLYpCwWEOEuRbMfeLDwUGdtAVW6vNmJQoUqWwrepckLd5BDHvQdDdnR4Ring56TPLea9APDd5+h+ASECh83HLkGugSaVVq0yQdy6gHSyV65bJkXYiz9/jLL9GG5F8FWanIF8OgOA6ITtLKXVW0Q/hG609q5E/zYH/IkK8WEmiFBPA69pXRZw+VU+9rnAsaKdEwrgz9S7bXLDXkYgJnUNd5xsFUKHmQON8yAI/QemFBCwx9V680e9RfYrSf+GvNRR4ktjjjMyWuEpDCZyfyiM4Gfp3jlgGbcFvLYZIfQi9FXA1uU/ewt+Gq7Wf6lEgc2VQxkWT8YtMkVachpnMgfemXAdFXLizdv/8BhpfbWbDdf2npawAf19FhuYdHfgk2CS4r7bq//cJ5BWLrKtT1d36Vc/WJ85x18ejcTEPCIqUl9TcnFhkCURd2OwaEpO/+iU64TRi4FfYQfQxGLGyLa4fVI1L6LnE3n8JjLEACgsRP0k+lBJw9KnxmTUv3nzXUdtniRd9FaZL8Zjy3tBNHvMejafQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(40470700004)(36840700001)(46966006)(40460700003)(36756003)(5660300002)(2906002)(82310400005)(86362001)(40480700001)(8936002)(70206006)(70586007)(8676002)(4326008)(81166007)(41300700001)(356005)(82740400003)(47076005)(83380400001)(426003)(336012)(2616005)(36860700001)(6666004)(186003)(110136005)(1076003)(54906003)(26005)(316002)(478600001)(16526019)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 16:48:57.5172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 823c4d60-f540-4953-88c0-08db36bed0be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5766
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

At times, when the mode transitions fail to happen, the current
driver does not give enough debug information on why the transition
failed or the default preset values did not load. Having an on-demand
logs guarded by CONFIG would be helpful in such cases.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Kconfig     | 10 ++++++++++
 drivers/platform/x86/amd/pmf/auto-mode.c | 22 ++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/cnqf.c      | 19 +++++++++++++++++++
 3 files changed, 51 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index f4fd764e55a6..7129de0fb9fb 100644
--- a/drivers/platform/x86/amd/pmf/Kconfig
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -26,3 +26,13 @@ config AMD_PMF_ACPI_DEBUG
 	 in the PMF config store.
 
 	 Say Y here to enable more debug logs and Say N here if you are not sure.
+
+config AMD_PMF_DEBUG_FACILITIES
+	bool "PMF debug facilities"
+	depends on AMD_PMF
+	help
+	 Enabling this option would give more debug information on the PMF interna
+	 counters such as time constants, power thresholds, target modes and
+	 power mode transitions of auto mode and CnQF features.
+
+	 Say Y here to enable logs and Say N here if you are not sure.
diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
index 777490fcf8b9..560379b5cda7 100644
--- a/drivers/platform/x86/amd/pmf/auto-mode.c
+++ b/drivers/platform/x86/amd/pmf/auto-mode.c
@@ -177,11 +177,33 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
 			config_store.transition[i].applied = false;
 			update = true;
 		}
+
+#ifdef CONFIG_AMD_PMF_DEBUG_FACILITIES
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
 
+#ifdef CONFIG_AMD_PMF_DEBUG_FACILITIES
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
index 4b9691cd592a..1f25016b3865 100644
--- a/drivers/platform/x86/amd/pmf/cnqf.c
+++ b/drivers/platform/x86/amd/pmf/cnqf.c
@@ -174,6 +174,13 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_l
 		config_store.trans_param[src][i].count++;
 
 		tp = &config_store.trans_param[src][i];
+
+#ifdef CONFIG_AMD_PMF_DEBUG_FACILITIES
+		dev_dbg(dev->dev, "avg_power:%d total_power:%d count:%d timer:%d\n", avg_power,
+			config_store.trans_param[src][i].total_power,
+			config_store.trans_param[src][i].count,
+			config_store.trans_param[src][i].timer);
+#endif
 		if (tp->timer >= tp->time_constant && tp->count) {
 			avg_power = tp->total_power / tp->count;
 
@@ -194,6 +201,18 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_l
 	dev_dbg(dev->dev, "[CNQF] Avg power: %u mW socket power: %u mW mode:%s\n",
 		avg_power, socket_power, state_as_str(config_store.current_mode));
 
+#ifdef AMD_PMF_DEBUG_FACILITIES
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

