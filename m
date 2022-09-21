Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC1AC32771
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Sep 2022 10:25:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbiIUKZz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Sep 2022 06:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbiIUKZn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Sep 2022 06:25:43 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F012788DF7
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Sep 2022 03:25:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HF+noNaLZvZV0l9CVD5K6wL0g0L1S4EthGz5A9hGC9EaeCxPu0+9pF2/dbte8fuAFZUdxMkxEdhvQ6eht7ml2+48MG3MgjAVqdv8b7w7FtTMB4j+lD4PNVpc8JqFO8Me7vKHfJaLaH1ML4yJLpS9uApkzJGNaRrwA1ZDUJcBHwMHpaWUY+XOQUZCVH7KGOe4Yp253rtioUKSclQ5mEefxHryviPqnM9eDxv+j7+UX/VnrWia8Et+gANtUq65QsSjh2U+lngd7WJaFugdjI4OBKAdRRIyCkhRR2De6UWsbP8++E8BqPRBrNQ8xc3FI2yTS/N+TWAD6Hz11ExoikaP/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTBmHl4D8jpyPEJt/Ug8qydfp+3c8uiVVUS1RoI/eTU=;
 b=EW30XqHoXzLrG1bnD9qBM0yqIwPp6CV8tDe9NLr3GVXjiZafEXM7dLALSgJucdSrWtjzcaDNb3FDFWmJr4ZhQgSSJGwbJRQsUCltVNgvrFOKVoAfElcBdPsB0E4dPlxR1aFOU30Hq+zBK9r30mGHHQn0f3GERfDq+K396hsVl2iL5FNd1bYix96ves8oPXu4GLImQVV68gwweq+GZwZwW4wStpbK+9Y7I2ARtxlcHctN1DCtBiWZ8OhfRo/3TYQQ1IPeRHDycYs1g/hzkRvoQw05wMnKAbg+CUw3mfxLO52DfX9HXQr/YH6IQTKqEYZKPDCXayiGm5G8Havm6zHaUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTBmHl4D8jpyPEJt/Ug8qydfp+3c8uiVVUS1RoI/eTU=;
 b=FBCPd6JMMD39l5EaAPXlsyHkSYvMrT5Lgseqjnq3sGRnnU0pEiVTciCX7w7xn+qIP0vQmRz9TbHctvLXOHYHXEYFrFO0JT/E4ur/s1wpjfi2GaMGBbps7aLHsqxZGh1PuyotsZyzcv0gJ67p5kvnUcFcAwKZelKnZtoKu7dhzck=
Received: from BN9PR03CA0653.namprd03.prod.outlook.com (2603:10b6:408:13b::28)
 by BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Wed, 21 Sep
 2022 10:25:37 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::d2) by BN9PR03CA0653.outlook.office365.com
 (2603:10b6:408:13b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.15 via Frontend
 Transport; Wed, 21 Sep 2022 10:25:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Wed, 21 Sep 2022 10:25:37 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 21 Sep
 2022 05:25:21 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <mario.limonciello@amd.com>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <bnocera@redhat.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 1/3] platform/x86/amd/pmf: Add support for CnQF
Date:   Wed, 21 Sep 2022 15:54:53 +0530
Message-ID: <20220921102455.1792336-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921102455.1792336-1-Shyam-sundar.S-k@amd.com>
References: <20220921102455.1792336-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT067:EE_|BN9PR12MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: 87763104-2687-40ac-6954-08da9bbba007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hc3ziJZEU7tqHpofUMHJPXIZQMoSbki88A2GIluTWUOtE67os/VS1mIqhxitotgn4E3S0Bt+nB0FMbc3lElPus16+BfT0zCO1R9Mfbl5oqUtToaSMw0jwjizZP4hjvvWdl85qyPguP9BzWk2dkC2CVJeHLlMA+JY8NGG+dYuCumYDX1gVFQKqnyNlDeOxGWi/zk3/KgQGDmBYJ3yoNHQrglqZY5QX3/d9JAxzyKvqlMhcTa4OYTCQsxCa8T7vHaSnJCyCMP8pnMRiQiP/JHz+VsKuH3HOvhQ1w/Fp5Ix5HVJU5YwrH3onpHNB40mxr8ocjRdO8T/wYfi3ctkFj2av2huj8TEslbbKn5QOMkshhcjXU695WXjPJPC3KPUnXNMg+y1bZC17/Ud7OT90umB5dzm+NsdgiwfAnnKePU8bnnZ/pmW/vJCBvjjax9taA9tuPNjAOmd9WRAfenLIv4ciG3glFVgVQlwqsnIJTH6v9spTSbbvElCQsaZHmV6SeV0jZM78bgD4arGCG8xnEZh17C0ERvgizU51t8AJD2UlfEjbQJcDhVoEYMspLifw+LsWr2UDbje0MyRl1AE796swnUzIZQTWfBqRX/zuHeRdaTPjSAkW1qZ5C+hbo/VuUMR5ASLqtWxLstPYeVE9O9x8UfpCn9q8EW+GD4a7KYG8FONdD23aIJ5pUUiFalJPHBnCM9jWxA7ek/k07eRiJ0pd3PhNCS6X8IidwgUDe63uJpg5sgai8Ju3Y4r5ARMQ8UONshAV9bEajuNd76oU7x/GvK6gLJTdIGG2je5cWHeduNOf/qp5Dh2JakFC9j3wTL1Fze3Ozj/Yq0VxFvW0QVYKA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(2616005)(83380400001)(16526019)(336012)(426003)(82740400003)(356005)(81166007)(1076003)(36860700001)(5660300002)(30864003)(2906002)(41300700001)(8936002)(82310400005)(40480700001)(186003)(70586007)(478600001)(40460700003)(7696005)(47076005)(26005)(6666004)(8676002)(4326008)(70206006)(6636002)(316002)(54906003)(110136005)(36756003)(86362001)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 10:25:37.1438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87763104-2687-40ac-6954-08da9bbba007
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5129
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

CnQF (a.k.a Cool and Quiet Framework) extends the static slider concept.
PMF dynamically manages system power limits and fan policy based on system
power trends which is representative of workload trend.

Static slider and CnQF controls are mutually exclusive for system power
budget adjustments. CnQF supports configurable number of modes which can
be unique for AC and DC. Every mode is representative of a system state
characterized by unique steady state and boost behavior.

OEMs can configure the different modes/system states and how the
transition to a mode happens. Whether to have CnQF manage system power
budget dynamically in AC or DC or both is also configurable. Mode changes
due to CnQF don't result in slider position change.

The default OEM values are obtained after evaluating the PMF ACPI function
idx 11 & 12 for AC and DC respectively. Whether to turn ON/OFF by default
is guided by a "flag" passed by the OEM BIOS.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Makefile |   2 +-
 drivers/platform/x86/amd/pmf/acpi.c   |  10 +
 drivers/platform/x86/amd/pmf/cnqf.c   | 331 ++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c   |  19 +-
 drivers/platform/x86/amd/pmf/pmf.h    |  99 ++++++++
 5 files changed, 459 insertions(+), 2 deletions(-)
 create mode 100644 drivers/platform/x86/amd/pmf/cnqf.c

diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
index ef2b08c9174d..fdededf54392 100644
--- a/drivers/platform/x86/amd/pmf/Makefile
+++ b/drivers/platform/x86/amd/pmf/Makefile
@@ -6,4 +6,4 @@
 
 obj-$(CONFIG_AMD_PMF) += amd-pmf.o
 amd-pmf-objs := core.o acpi.o sps.o \
-		auto-mode.o
+		auto-mode.o cnqf.o
diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index cb46a7252414..05a2b8a056fc 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -233,6 +233,16 @@ static int apmf_get_system_params(struct amd_pmf_dev *dev)
 	return 0;
 }
 
+int apmf_get_dyn_slider_def_ac(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data)
+{
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_AC, data, sizeof(*data));
+}
+
+int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data)
+{
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_DC, data, sizeof(*data));
+}
+
 void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
 {
 	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
new file mode 100644
index 000000000000..fa994800692a
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/cnqf.c
@@ -0,0 +1,331 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD Platform Management Framework Driver
+ *
+ * Copyright (c) 2022, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ */
+
+#include <linux/workqueue.h>
+#include "pmf.h"
+
+static struct cnqf_config config_store;
+
+static int amd_pmf_set_cnqf(struct amd_pmf_dev *dev, int src, int idx,
+			    struct cnqf_config *table)
+{
+	struct power_table_control *pc;
+
+	pc = &config_store.mode_set[src][idx].power_control;
+
+	amd_pmf_send_cmd(dev, SET_SPL, false, pc->spl, NULL);
+	amd_pmf_send_cmd(dev, SET_FPPT, false, pc->fppt, NULL);
+	amd_pmf_send_cmd(dev, SET_SPPT, false, pc->sppt, NULL);
+	amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, pc->sppt_apu_only, NULL);
+	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, pc->stt_min, NULL);
+	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false, pc->stt_skin_temp[STT_TEMP_APU],
+			 NULL);
+	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false, pc->stt_skin_temp[STT_TEMP_HS2],
+			 NULL);
+
+	if (is_apmf_func_supported(dev, APMF_FUNC_SET_FAN_IDX))
+		apmf_update_fan_idx(dev,
+				    config_store.mode_set[src][idx].fan_control.manual,
+				    config_store.mode_set[src][idx].fan_control.fan_id);
+
+	return 0;
+}
+
+static void amd_pmf_update_power_threshold(void)
+{
+	struct cnqf_mode_settings *ts;
+	struct cnqf_tran_params *tp;
+	int i;
+
+	for (i = 0; i < POWER_SOURCE_MAX; i++) {
+		tp = &config_store.trans_param[i][CNQF_TRANSITION_TO_QUIET];
+		ts = &config_store.mode_set[i][CNQF_MODE_BALANCE];
+		tp->power_threshold = ts->power_floor - tp->power_delta;
+
+		tp = &config_store.trans_param[i][CNQF_TRANSITION_TO_TURBO];
+		ts = &config_store.mode_set[i][CNQF_MODE_PERFORMANCE];
+		tp->power_threshold = ts->power_floor - tp->power_delta;
+
+		tp = &config_store.trans_param[i][CNQF_TRANSITION_FROM_BALANCE_TO_PERFORMANCE];
+		ts = &config_store.mode_set[i][CNQF_MODE_BALANCE];
+		tp->power_threshold = ts->power_floor - tp->power_delta;
+
+		tp = &config_store.trans_param[i][CNQF_TRANSITION_FROM_PERFORMANCE_TO_BALANCE];
+		ts = &config_store.mode_set[i][CNQF_MODE_PERFORMANCE];
+		tp->power_threshold = ts->power_floor - tp->power_delta;
+
+		tp = &config_store.trans_param[i][CNQF_TRANSITION_FROM_QUIET_TO_BALANCE];
+		ts = &config_store.mode_set[i][CNQF_MODE_QUIET];
+		tp->power_threshold = ts->power_floor - tp->power_delta;
+
+		tp = &config_store.trans_param[i][CNQF_TRANSITION_FROM_TURBO_TO_PERFORMANCE];
+		ts = &config_store.mode_set[i][CNQF_MODE_TURBO];
+		tp->power_threshold = ts->power_floor - tp->power_delta;
+	}
+}
+
+static const char *state_as_str(unsigned int state)
+{
+	switch (state) {
+	case CNQF_MODE_QUIET:
+		return "QUIET";
+	case CNQF_MODE_BALANCE:
+		return "BALANCED";
+	case CNQF_MODE_TURBO:
+		return "TURBO";
+	case CNQF_MODE_PERFORMANCE:
+		return "PERFORMANCE";
+	default:
+		return "Unknown CnQF mode";
+	}
+}
+
+int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms)
+{
+	struct cnqf_tran_params *tp;
+	int src, i, j;
+	u32 avg_power = 0;
+
+	src = amd_pmf_get_power_source();
+
+	if (dev->current_profile == PLATFORM_PROFILE_BALANCED) {
+		amd_pmf_set_cnqf(dev, src, config_store.current_mode, NULL);
+	} else {
+		/*
+		 * Return from here if the platform_profile is not balanced
+		 * so that preference is given to user mode selection, rather
+		 * than enforcing CnQF to run all the time (if enabled)
+		 */
+		return -EINVAL;
+	}
+
+	for (i = 0; i < CNQF_TRANSITION_MAX; i++) {
+		config_store.trans_param[src][i].timer += time_lapsed_ms;
+		config_store.trans_param[src][i].total_power += socket_power;
+		config_store.trans_param[src][i].count++;
+
+		tp = &config_store.trans_param[src][i];
+		if (tp->timer >= tp->time_constant && tp->count) {
+			avg_power = tp->total_power / tp->count;
+
+			/* Reset the indices */
+			tp->timer = 0;
+			tp->total_power = 0;
+			tp->count = 0;
+
+			if ((tp->shifting_up && avg_power >= tp->power_threshold) ||
+			    (!tp->shifting_up && avg_power <= tp->power_threshold)) {
+				tp->priority = true;
+			} else {
+				tp->priority = false;
+			}
+		}
+	}
+
+	dev_dbg(dev->dev, "[CNQF] Avg power: %u mW socket power: %u mW mode:%s\n",
+		avg_power, socket_power, state_as_str(config_store.current_mode));
+
+	for (j = 0; j < CNQF_TRANSITION_MAX; j++) {
+		/* apply the highest priority */
+		if (config_store.trans_param[src][j].priority) {
+			if (config_store.current_mode !=
+			    config_store.trans_param[src][j].target_mode) {
+				config_store.current_mode =
+						config_store.trans_param[src][j].target_mode;
+				dev_dbg(dev->dev, "Moving to Mode :%s\n",
+					state_as_str(config_store.current_mode));
+				amd_pmf_set_cnqf(dev, src,
+						 config_store.current_mode, NULL);
+			}
+			break;
+		}
+	}
+	return 0;
+}
+
+static void amd_pmf_update_trans_data(int idx, struct apmf_dyn_slider_output out)
+{
+	struct cnqf_tran_params *tp;
+
+	tp = &config_store.trans_param[idx][CNQF_TRANSITION_TO_QUIET];
+	tp->time_constant = out.t_balanced_to_quiet;
+	tp->target_mode = CNQF_MODE_QUIET;
+	tp->shifting_up = false;
+
+	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_BALANCE_TO_PERFORMANCE];
+	tp->time_constant = out.t_balanced_to_perf;
+	tp->target_mode = CNQF_MODE_PERFORMANCE;
+	tp->shifting_up = true;
+
+	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_QUIET_TO_BALANCE];
+	tp->time_constant = out.t_quiet_to_balanced;
+	tp->target_mode = CNQF_MODE_BALANCE;
+	tp->shifting_up = true;
+
+	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_PERFORMANCE_TO_BALANCE];
+	tp->time_constant = out.t_perf_to_balanced;
+	tp->target_mode = CNQF_MODE_BALANCE;
+	tp->shifting_up = false;
+
+	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_TURBO_TO_PERFORMANCE];
+	tp->time_constant = out.t_turbo_to_perf;
+	tp->target_mode = CNQF_MODE_PERFORMANCE;
+	tp->shifting_up = false;
+
+	tp = &config_store.trans_param[idx][CNQF_TRANSITION_TO_TURBO];
+	tp->time_constant = out.t_perf_to_turbo;
+	tp->target_mode = CNQF_MODE_TURBO;
+	tp->shifting_up = true;
+}
+
+static void amd_pmf_update_mode_set(int idx, struct apmf_dyn_slider_output out)
+{
+	struct cnqf_mode_settings *ms;
+
+	/* Quiet Mode */
+	ms = &config_store.mode_set[idx][CNQF_MODE_QUIET];
+	ms->power_floor = out.ps[APMF_CNQF_QUIET].pfloor;
+	ms->power_control.fppt = out.ps[APMF_CNQF_QUIET].fppt;
+	ms->power_control.sppt = out.ps[APMF_CNQF_QUIET].sppt;
+	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_QUIET].sppt_apu_only;
+	ms->power_control.spl = out.ps[APMF_CNQF_QUIET].spl;
+	ms->power_control.stt_min = out.ps[APMF_CNQF_QUIET].stt_min_limit;
+	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
+		out.ps[APMF_CNQF_QUIET].stt_skintemp[STT_TEMP_APU];
+	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
+		out.ps[APMF_CNQF_QUIET].stt_skintemp[STT_TEMP_HS2];
+	ms->fan_control.fan_id = out.ps[APMF_CNQF_QUIET].fan_id;
+
+	/* Balance Mode */
+	ms = &config_store.mode_set[idx][CNQF_MODE_BALANCE];
+	ms->power_floor = out.ps[APMF_CNQF_BALANCE].pfloor;
+	ms->power_control.fppt = out.ps[APMF_CNQF_BALANCE].fppt;
+	ms->power_control.sppt = out.ps[APMF_CNQF_BALANCE].sppt;
+	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_BALANCE].sppt_apu_only;
+	ms->power_control.spl = out.ps[APMF_CNQF_BALANCE].spl;
+	ms->power_control.stt_min = out.ps[APMF_CNQF_BALANCE].stt_min_limit;
+	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
+		out.ps[APMF_CNQF_BALANCE].stt_skintemp[STT_TEMP_APU];
+	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
+		out.ps[APMF_CNQF_BALANCE].stt_skintemp[STT_TEMP_HS2];
+	ms->fan_control.fan_id = out.ps[APMF_CNQF_BALANCE].fan_id;
+
+	/* Performance Mode */
+	ms = &config_store.mode_set[idx][CNQF_MODE_PERFORMANCE];
+	ms->power_floor = out.ps[APMF_CNQF_PERFORMANCE].pfloor;
+	ms->power_control.fppt = out.ps[APMF_CNQF_PERFORMANCE].fppt;
+	ms->power_control.sppt = out.ps[APMF_CNQF_PERFORMANCE].sppt;
+	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_PERFORMANCE].sppt_apu_only;
+	ms->power_control.spl = out.ps[APMF_CNQF_PERFORMANCE].spl;
+	ms->power_control.stt_min = out.ps[APMF_CNQF_PERFORMANCE].stt_min_limit;
+	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
+		out.ps[APMF_CNQF_PERFORMANCE].stt_skintemp[STT_TEMP_APU];
+	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
+		out.ps[APMF_CNQF_PERFORMANCE].stt_skintemp[STT_TEMP_HS2];
+	ms->fan_control.fan_id = out.ps[APMF_CNQF_PERFORMANCE].fan_id;
+
+	/* Turbo Mode */
+	ms = &config_store.mode_set[idx][CNQF_MODE_TURBO];
+	ms->power_floor = out.ps[APMF_CNQF_TURBO].pfloor;
+	ms->power_control.fppt = out.ps[APMF_CNQF_TURBO].fppt;
+	ms->power_control.sppt = out.ps[APMF_CNQF_TURBO].sppt;
+	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_TURBO].sppt_apu_only;
+	ms->power_control.spl = out.ps[APMF_CNQF_TURBO].spl;
+	ms->power_control.stt_min = out.ps[APMF_CNQF_TURBO].stt_min_limit;
+	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
+		out.ps[APMF_CNQF_TURBO].stt_skintemp[STT_TEMP_APU];
+	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
+		out.ps[APMF_CNQF_TURBO].stt_skintemp[STT_TEMP_HS2];
+	ms->fan_control.fan_id = out.ps[APMF_CNQF_TURBO].fan_id;
+}
+
+static int amd_pmf_check_flags(struct amd_pmf_dev *dev)
+{
+	struct apmf_dyn_slider_output out = {};
+
+	if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC))
+		apmf_get_dyn_slider_def_ac(dev, &out);
+	else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC))
+		apmf_get_dyn_slider_def_dc(dev, &out);
+
+	return out.flags;
+}
+
+static int amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
+{
+	struct apmf_dyn_slider_output out;
+	int i, j, ret;
+
+	for (i = 0; i < POWER_SOURCE_MAX; i++) {
+		if (i == POWER_SOURCE_AC && is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC)) {
+			ret = apmf_get_dyn_slider_def_ac(dev, &out);
+			if (ret) {
+				dev_err(dev->dev,
+					"APMF apmf_get_dyn_slider_def_ac failed :%d\n", ret);
+				return -EIO;
+			}
+		} else if (i == POWER_SOURCE_DC &&
+				is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
+			ret = apmf_get_dyn_slider_def_dc(dev, &out);
+			if (ret) {
+				dev_err(dev->dev,
+					"APMF apmf_get_dyn_slider_def_dc failed :%d\n", ret);
+				return -EIO;
+			}
+		}
+
+		amd_pmf_update_mode_set(i, out);
+		amd_pmf_update_trans_data(i, out);
+
+		for (j = 0; j < CNQF_MODE_MAX; j++) {
+			if (config_store.mode_set[i][j].fan_control.fan_id == FAN_INDEX_AUTO)
+				config_store.mode_set[i][j].fan_control.manual = false;
+			else
+				config_store.mode_set[i][j].fan_control.manual = true;
+		}
+	}
+	amd_pmf_update_power_threshold();
+	/* set to initial default values */
+	config_store.current_mode = CNQF_MODE_BALANCE;
+
+	return 0;
+}
+
+void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev)
+{
+	cancel_delayed_work_sync(&dev->work_buffer);
+}
+
+int amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
+{
+	int ret, src;
+
+	ret = amd_pmf_check_flags(dev);
+	if (!ret) {
+		dev_dbg(dev->dev, "CnQF bios default_enable flag not set\n");
+		return ret;
+	}
+
+	ret = amd_pmf_load_defaults_cnqf(dev);
+	if (ret < 0)
+		return ret;
+
+	amd_pmf_init_metrics_table(dev);
+	dev->cnqf_supported = true;
+
+	/* update the thermal for CnQF */
+	if (dev->cnqf_supported && dev->current_profile == PLATFORM_PROFILE_BALANCED) {
+		src = amd_pmf_get_power_source();
+		amd_pmf_set_cnqf(dev, src, config_store.current_mode, NULL);
+		dev->cnqf_enabled = true;
+	}
+
+	return 0;
+}
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index a675ca969331..99be1e6d57d3 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -123,6 +123,11 @@ static void amd_pmf_get_metrics(struct work_struct *work)
 		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
 	}
 
+	if (dev->cnqf_enabled) {
+		/* Apply the CnQF transition */
+		amd_pmf_trans_cnqf(dev, socket_power, time_elapsed_ms);
+	}
+
 	dev->start_time = ktime_to_ms(ktime_get());
 	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
 	mutex_unlock(&dev->update_mutex);
@@ -252,6 +257,8 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
 
 static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 {
+	int ret;
+
 	/* Enable Static Slider */
 	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
 		amd_pmf_init_sps(dev);
@@ -262,6 +269,12 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
 		amd_pmf_init_auto_mode(dev);
 		dev_dbg(dev->dev, "Auto Mode Init done\n");
+	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
+			  is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
+		/* Enable Cool n Quiet Framework (CnQF) */
+		ret = amd_pmf_init_cnqf(dev);
+		if (ret)
+			dev_warn(dev->dev, "CnQF Init failed\n");
 	}
 }
 
@@ -270,8 +283,12 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
 	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
 		amd_pmf_deinit_sps(dev);
 
-	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE))
+	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
 		amd_pmf_deinit_auto_mode(dev);
+	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
+			  is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
+		amd_pmf_deinit_cnqf(dev);
+	}
 }
 
 static const struct acpi_device_id amd_pmf_acpi_ids[] = {
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 0a72a395c2ef..24dd6fbff24c 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -22,6 +22,8 @@
 #define APMF_FUNC_AUTO_MODE					5
 #define APMF_FUNC_SET_FAN_IDX				7
 #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
+#define APMF_FUNC_DYN_SLIDER_AC				11
+#define APMF_FUNC_DYN_SLIDER_DC				12
 
 /* Message Definitions */
 #define SET_SPL				0x03 /* SPL: Sustained Power Limit */
@@ -165,6 +167,8 @@ struct amd_pmf_dev {
 	int socket_power_history_idx;
 	bool amt_enabled;
 	struct mutex update_mutex; /* protects race between ACPI handler and metrics thread */
+	bool cnqf_enabled;
+	bool cnqf_supported;
 };
 
 struct apmf_sps_prop_granular {
@@ -294,6 +298,93 @@ struct apmf_auto_mode {
 	u32 fan_id_quiet;
 } __packed;
 
+/* CnQF Layer */
+enum cnqf_trans_priority {
+	CNQF_TRANSITION_TO_TURBO, /* Any other mode to Turbo Mode */
+	CNQF_TRANSITION_FROM_BALANCE_TO_PERFORMANCE, /* quiet/balance to Performance Mode */
+	CNQF_TRANSITION_FROM_QUIET_TO_BALANCE, /* Quiet Mode to Balance Mode */
+	CNQF_TRANSITION_TO_QUIET, /* Any other mode to Quiet Mode */
+	CNQF_TRANSITION_FROM_PERFORMANCE_TO_BALANCE, /* Performance/Turbo to Balance Mode */
+	CNQF_TRANSITION_FROM_TURBO_TO_PERFORMANCE, /* Turbo mode to Performance Mode */
+	CNQF_TRANSITION_MAX,
+};
+
+enum cnqf_mode {
+	CNQF_MODE_QUIET,
+	CNQF_MODE_BALANCE,
+	CNQF_MODE_PERFORMANCE,
+	CNQF_MODE_TURBO,
+	CNQF_MODE_MAX,
+};
+
+enum apmf_cnqf_pos {
+	APMF_CNQF_TURBO,
+	APMF_CNQF_PERFORMANCE,
+	APMF_CNQF_BALANCE,
+	APMF_CNQF_QUIET,
+	APMF_CNQF_MAX,
+};
+
+struct cnqf_mode_settings {
+	struct power_table_control power_control;
+	struct fan_table_control fan_control;
+	u32 power_floor;
+};
+
+struct cnqf_tran_params {
+	u32 time_constant; /* minimum time required to switch to next mode */
+	u32 power_delta; /* minimum power required to switch to next mode */
+	u32 power_threshold;
+	u32 timer; /* elapsed time. if timer > timethreshold, it will move to next mode */
+	u32 total_power;
+	u32 count;
+	bool priority;
+	bool shifting_up;
+	enum cnqf_mode target_mode;
+};
+
+struct cnqf_power_delta {
+	u32 to_turbo;
+	u32 balance_to_perf;
+	u32 quiet_to_balance;
+	u32 to_quiet;
+	u32 perf_to_balance;
+	u32 turbo_to_perf;
+};
+
+struct cnqf_config {
+	struct cnqf_tran_params trans_param[POWER_SOURCE_MAX][CNQF_TRANSITION_MAX];
+	struct cnqf_mode_settings mode_set[POWER_SOURCE_MAX][CNQF_MODE_MAX];
+	struct power_table_control defaults;
+	enum cnqf_mode current_mode;
+	struct cnqf_power_delta power_delta[POWER_SOURCE_MAX];
+	u32 power_src;
+	u32 avg_power;
+};
+
+struct apmf_cnqf_power_set {
+	u32 pfloor;
+	u32 fppt;
+	u32 sppt;
+	u32 sppt_apu_only;
+	u32 spl;
+	u32 stt_min_limit;
+	u8 stt_skintemp[STT_TEMP_COUNT];
+	u32 fan_id;
+} __packed;
+
+struct apmf_dyn_slider_output {
+	u16 size;
+	u16 flags;
+	u32 t_perf_to_turbo;
+	u32 t_balanced_to_perf;
+	u32 t_quiet_to_balanced;
+	u32 t_balanced_to_quiet;
+	u32 t_perf_to_balanced;
+	u32 t_turbo_to_perf;
+	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
+} __packed;
+
 /* Core Layer */
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
 void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
@@ -324,4 +415,12 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
 void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
 int amd_pmf_reset_amt(struct amd_pmf_dev *dev);
 void amd_pmf_handle_amt(struct amd_pmf_dev *dev);
+
+/* CnQF Layer */
+int apmf_get_dyn_slider_def_ac(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data);
+int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data);
+int amd_pmf_init_cnqf(struct amd_pmf_dev *dev);
+void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev);
+int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
+
 #endif /* PMF_H */
-- 
2.25.1

