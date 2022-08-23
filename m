Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DE6C3F6B0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Aug 2022 13:32:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238281AbiHWNb6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Aug 2022 09:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238512AbiHWNbl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Aug 2022 09:31:41 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59636163899
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Aug 2022 03:32:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1BOG7zVx81FesGbVobw6j1hRrpVsV656EwggpgV02y47zsybMGQvNg0wONWvEKkWAXt44DBFlM0PihrI+ZgIpRZc0QW5+2YJXxfq/efWUt00rCbGfykE7XEjUySGyx0AOydkW2RP2FoGdyGuZ+5E66eQQ3lx0lP3FtFmYnctexPCsV/1SLbnJIE/ywhQ8IQjj4bQNApy9fbA8RGQF34s8OoUQ927XhPxhAfAAsuEkzAPgEHsgOaFcDCUVVlj5eHt5SHs86Ozb4THEjMeum8nPvydnytS7COexJLKq7E1meTpmKLiVhfoiHU+EHM1t9GgGsCnf/p8KOzRyC3z42bnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5p1VDKcz1G4QbNe26t5Ya1nrlHJw0Y7p5vmvqpIe+2c=;
 b=TqZLfPxXdhMT623w6tsyopB/roDkalXBUBhiHVWlQiPJ3VBaBlmVJUX/iMQAh4JTv+5eZ49NBbBdPc4OwvnfYLsPHm3VgQFgf1XXQfAjrl158ckBILHxwHid71EOSEF7LPUjlqcF/RiFR8OShPSBnM9zkg49v78woGhErgXTa6BLTtCNO+nLayULGLvLLCq+1tfs5EROkWaxl8mQRhJKRw75NxKW6I7+kjF/pFqL4vYPGSWP4UobljdAIOs/Zwk0mKy6SQcauu5tMiOOaOafIooOBjum7Y02N9jTelu2XwhAQYYZhqokcQxasv59j1zJoz69XO2TwQLOoYN6NBug8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5p1VDKcz1G4QbNe26t5Ya1nrlHJw0Y7p5vmvqpIe+2c=;
 b=mkiTJFiviwsX+hmhXfXaIn/viLC4oL1pPKE3CzmBjV063Taz7IbqH/yadcwH+AWeDBNiqBLbbDPqRkplpoXPPwS3aBD7XOEg3ZtbDEL1RTY9NkOR/uHnpdOFoQ8s11/3PdUKxpU7TKty3Y1wuS9cOI9d5mLpzZaQ7omFustNJKI=
Received: from DS7PR05CA0071.namprd05.prod.outlook.com (2603:10b6:8:57::14) by
 CY5PR12MB6408.namprd12.prod.outlook.com (2603:10b6:930:3b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.19; Tue, 23 Aug 2022 10:29:41 +0000
Received: from DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:57:cafe::a7) by DS7PR05CA0071.outlook.office365.com
 (2603:10b6:8:57::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.4 via Frontend
 Transport; Tue, 23 Aug 2022 10:29:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT037.mail.protection.outlook.com (10.13.172.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 10:29:41 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 23 Aug
 2022 05:29:38 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/4] platform/x86/amd/pmf: Add support for CnQF
Date:   Tue, 23 Aug 2022 15:59:10 +0530
Message-ID: <20220823102913.4181217-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220823102913.4181217-1-Shyam-sundar.S-k@amd.com>
References: <20220823102913.4181217-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab9e3c88-b0dd-4af0-9fa1-08da84f263bb
X-MS-TrafficTypeDiagnostic: CY5PR12MB6408:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IVJDol6CJeD9dd8j1EADyhdvtuHZLaPgPdQbfVh5c2JwjmgYeDC+6S5d8ApmXDpfkiWgd15FKRgElP4qJ67JSrGdoyM0aHdIB7ye0LMGaBO/k6GqDpc/4WMyLd+HHaUZS+zh4af7y9x33yXZyH46vJn3mw/yJDV5tiEwopou52GZ4dQC0XwhzLE8xLSYyW2gza/6Zawo3x3S55EP0wVwDjg5GnSG7OKhb+sTZRd7pkBSFbbdJMOXbp4wKAJQiF8gAE9k6I/jyLkU+OV/oRhjnR42eMK2hbxMXQ1t+LHbHN5hS4sGNI8mgNvr6fLtWmPM5AxYOIuOXBeu9RM0eaZAGU1IVVrKVxrpViq60HriKt93R7PBEij4z4lEQSocH9zs8SLmE2gq/aRgt+XMC8WqOr8XpERKsUWPooaKt6RSJ5AM1WgqLxPWITfXkzRXTgujxBE+sup4DKy39v1ix+6BX1AYB45QU0j3P5dBbuV5efCNTed5MIkEA9AImZv/sV1NoqhD44peKckcYTQ8qKJpyCImLYv5acOyznS3Zdpc32ZKHqWIDCKmX+XOXZfluLpolhEGqxELzjzGibJ5GiyzY2A1ImTRRx7IUEaSwaU7lhtzkCg+OEiVPQdZoSjOMw0kSC7ooAeN/8MQTD2/RguQTEridZuT+JhG8f2FZEYfONLqRxISq7WEuMyyOs4LnEouaI2a3foocxjIXOGV82uQOBCnIG+P7H9jw0N278rplnG/fVxjD9763OA+kXRH5AD9Re0Wl4+uxoxU7b8exj6Q1TVuhD9SvMHi3fhy+1aeJzOQiZ7GMBHf+BwuInr0CeCF
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(39860400002)(376002)(40470700004)(46966006)(36840700001)(26005)(2906002)(4326008)(82310400005)(8676002)(70586007)(40460700003)(6666004)(36756003)(7696005)(30864003)(426003)(2616005)(336012)(1076003)(186003)(83380400001)(16526019)(41300700001)(47076005)(8936002)(36860700001)(5660300002)(86362001)(54906003)(70206006)(478600001)(82740400003)(356005)(316002)(40480700001)(81166007)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 10:29:41.5445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9e3c88-b0dd-4af0-9fa1-08da84f263bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6408
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
due to CnQF dont result in slider position change.

The default OEM values are obtained after evaluating the PMF ACPI function
idx 11 & 12 for AC and DC respectively. Whether to turn ON/OFF by default
is guided by a "flag" passed by the OEM BIOS.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Makefile |   2 +-
 drivers/platform/x86/amd/pmf/acpi.c   |  10 +
 drivers/platform/x86/amd/pmf/cnqf.c   | 314 ++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c   |  16 +-
 drivers/platform/x86/amd/pmf/pmf.h    | 100 ++++++++
 5 files changed, 440 insertions(+), 2 deletions(-)
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
index 000000000000..b8abe0f4447a
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/cnqf.c
@@ -0,0 +1,314 @@
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
+static int amd_pmf_handle_cnqf(struct amd_pmf_dev *dev, int src, int idx,
+			       struct cnqf_config *table)
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
+void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms)
+{
+	struct cnqf_tran_params *tp;
+	int src, i, j, index = 0;
+	u32 avg_power = 0;
+
+	src = amd_pmf_get_power_source();
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
+		index = config_store.trans_prio[j];
+		if (config_store.trans_param[src][index].priority) {
+			if (config_store.current_mode !=
+			    config_store.trans_param[src][index].target_mode) {
+				config_store.current_mode =
+						config_store.trans_param[src][index].target_mode;
+				dev_dbg(dev->dev, "Moving to Mode :%s\n",
+					state_as_str(config_store.current_mode));
+				amd_pmf_handle_cnqf(dev, src,
+						    config_store.current_mode, NULL);
+			}
+			break;
+		}
+	}
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
+void amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
+{
+	struct apmf_dyn_slider_output out;
+	int i, j, ret;
+
+	for (i = 0; i < POWER_SOURCE_MAX; i++) {
+		if (i == POWER_SOURCE_AC && is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC)) {
+			ret = apmf_get_dyn_slider_def_ac(dev, &out);
+			if (ret)
+				dev_err(dev->dev,
+					"APMF apmf_get_dyn_slider_def_ac failed :%d\n", ret);
+		} else if (i == POWER_SOURCE_DC &&
+				is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
+			ret = apmf_get_dyn_slider_def_dc(dev, &out);
+			if (ret)
+				dev_err(dev->dev,
+					"APMF apmf_get_dyn_slider_def_dc failed :%d\n", ret);
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
+
+	for (i = 0; i < CNQF_TRANSITION_MAX; i++)
+		config_store.trans_prio[i] = i;
+}
+
+void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev)
+{
+	cancel_delayed_work_sync(&dev->work_buffer);
+}
+
+void amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
+{
+	int ret, src;
+
+	ret = amd_pmf_check_flags(dev);
+	if (!ret) {
+		dev_dbg(dev->dev, "CnQF bios default_enable flag not set\n");
+		return;
+	}
+
+	dev->cnqf_enabled = true;
+
+	/* Disable SPS if its advertised as supported, giving clear preference
+	 * to user selection choices
+	 */
+	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
+		amd_pmf_deinit_sps(dev);
+
+	amd_pmf_load_defaults_cnqf(dev);
+	amd_pmf_init_metrics_table(dev);
+
+	/* update the thermal for CnQF */
+	src = amd_pmf_get_power_source();
+	amd_pmf_handle_cnqf(dev, src, config_store.current_mode, NULL);
+}
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index a675ca969331..2cb7793d07cf 100644
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
@@ -262,6 +267,11 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
 		amd_pmf_init_auto_mode(dev);
 		dev_dbg(dev->dev, "Auto Mode Init done\n");
+	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
+			  is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
+		/* Enable Cool n Quiet Framework (CnQF) */
+		amd_pmf_init_cnqf(dev);
+		dev_dbg(dev->dev, "CnQF Init done\n");
 	}
 }
 
@@ -270,8 +280,12 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
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
index 0a72a395c2ef..db3c86c2e86f 100644
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
@@ -165,6 +167,7 @@ struct amd_pmf_dev {
 	int socket_power_history_idx;
 	bool amt_enabled;
 	struct mutex update_mutex; /* protects race between ACPI handler and metrics thread */
+	bool cnqf_enabled;
 };
 
 struct apmf_sps_prop_granular {
@@ -294,6 +297,94 @@ struct apmf_auto_mode {
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
+	enum cnqf_trans_priority trans_prio[CNQF_TRANSITION_MAX];
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
@@ -324,4 +415,13 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
 void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
 int amd_pmf_reset_amt(struct amd_pmf_dev *dev);
 void amd_pmf_handle_amt(struct amd_pmf_dev *dev);
+
+/* CnQF Layer */
+int apmf_get_dyn_slider_def_ac(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data);
+int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data);
+void amd_pmf_init_cnqf(struct amd_pmf_dev *dev);
+void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev);
+void amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev);
+void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
+
 #endif /* PMF_H */
-- 
2.25.1

