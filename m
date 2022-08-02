Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473B7C19F28
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 15:14:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234770AbiHBPOB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 11:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234624AbiHBPN7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 11:13:59 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B07317E12
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 08:13:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIqB7mdovrrV/r7n5qTGQPcheNsOouzD+tdwyjoaF3lH7BvhnSAVG9d6nW4n5y+feuGOjh7Gxdmvyh5qcs5+/2sOuOcoMvp2GylnulVpAOiMOM5alAK9z7KkcOkLysPO/qqwbajDGJ6xLpS6FuyapPykhk2jN5N68dfWYPFixGibn6YYAfMXtJQZn4Y4OSLDQG1tk2VBGY4T/Tnqck2Y4hpLF+UcF1pwzVZtc6/Ramq4qtCqTQXaVXDfyAqTlRLjouKhrDH/kPGxlDSl6SFOwRZBMvsVuDjjQnie+QgsRgOBP23v3cA4nGO0i3ZopV+StnbrxoNGFExxFx+cwA5X9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nI6cHWUJw+4RiG0e7yIZ58X/qTKYxXIvSDax1xLZXUE=;
 b=dOs6vArtvuUgjaSecdtJcCMZx/9koipJ5YnLCyegFjp1h3tkhVNomPOkbSJAC0x4qrUCjV2tXMAIFhniHZk1hZiUcMr6kFZps28KksW2BBewuU41A1svq3u5ekM7d21xhIGV1B7/T12QixZD8vEU66Z5euOTMF0IHYSMvRP7r8Oqhaulxcw05xQgFTVMjDV4V7ucaTmlIiZAmf/sH0IpMSWWNy/NIoEX6txVVYhK37AA8ZRAAWYNvxFuFJlrxebDbTWuRXRIRK61VwNlOHDuM6+E96HtOtXTT4U9gcTfXApsQVDCjWUO96ql56NN0eWCvh8cT9+hfiK0zzOfWfmvHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nI6cHWUJw+4RiG0e7yIZ58X/qTKYxXIvSDax1xLZXUE=;
 b=idCIWKzBM+0apuTLB659s2wSNSlmO+Sil7PA+ABZMUtWaKwpe+5+Fn5b2Nl0dvw0xlh+AGQjKgZHqeQ3KioajHwBQq+QAFWTgcsKLjTw1RzvN4fkECXjR3pzYqapCs5ogJgIkvK9r39EPWhcCRO+GCXSFA4X1DvYKGASa+IhNUg=
Received: from BN0PR04CA0172.namprd04.prod.outlook.com (2603:10b6:408:eb::27)
 by IA1PR12MB6161.namprd12.prod.outlook.com (2603:10b6:208:3eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 15:13:55 +0000
Received: from BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::17) by BN0PR04CA0172.outlook.office365.com
 (2603:10b6:408:eb::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16 via Frontend
 Transport; Tue, 2 Aug 2022 15:13:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT036.mail.protection.outlook.com (10.13.177.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 15:13:55 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 10:13:52 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 08/11] platform/x86/amd/pmf: Add support for Auto mode feature
Date:   Tue, 2 Aug 2022 20:41:46 +0530
Message-ID: <20220802151149.2123699-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802151149.2123699-1-Shyam-sundar.S-k@amd.com>
References: <20220802151149.2123699-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69eb26aa-6260-442f-bf33-08da74999e29
X-MS-TrafficTypeDiagnostic: IA1PR12MB6161:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a/ipCyuTvIs42tdpaV4FF1wNz26+AVi3lSrKpul7NQAJtrsM2wUSkppzQVhqECCBC0kJKx1vkqfHRe1drYqLMMPOxs2LYxptZAaJhwF2lB/4JFDoHcyX/gSQfFLRqRpp18FZqMUG1C1uTpkVz9iCoWIyY1NjksO2MrJfnR279iNxROwk3BLz1nTkwvsLPWe5COUoS9eku9/rlDP1l/uM0xEA1fWIn3V9x6XSiUH0TLgd18zZbaHy/v6DmqvKfxZKhFeNbg5bJqJJI65rODDlGMfPhZ7bOGzGz82sGyL+ylDaozZXBOrLu4vBTw06Yto3Uib18AFEyUI+czj9plWU1u3r6W5OGz621tVA00mAxKj0KxQ/AH5u2CZ6LcL7T7jln4mu1gkg1Q0i1za//b1BPClwlaU71ivs7m7GDPLkyeVSghisv5iTd41c2ydNdW/rCHs9tcVPUorC2h9S/u0ohHqZ5UL2YUKCN89Wt1PLipgN9FmuMdhTZau2G2okEAYjphgbJlPAbT/PaMBX38aNsjr6SpAMjHliWFlKkzwW+639ldwYKuYp44P9GtJmHI01Vk8khGDdBbTStOfWsEww4dl0GjwRjGbn04a8wHnJAc72JcYUwjQYDyZmUrOGYEcteMtrv9TxbjvsAdjoz12qkzlKSPcLmuUmopFQUaF6eGYM3aaXcUa28E/yVoZmU8exwsE0A1X+TEbEZsmSHSA0xOmNaZKu2VdkwdSi5lP+wcJibEzJcO2Z9THotQ4S15SWT8uOImivkEn1edB47hTLRgUd6pRwxs8b+11NFAbRcksZpyKXl8BYl2QFbGWHcZ13Ep7GN6ZcXCDe5XOghUp+cw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39860400002)(46966006)(40470700004)(36840700001)(82740400003)(30864003)(40460700003)(86362001)(5660300002)(316002)(70206006)(70586007)(8676002)(4326008)(356005)(8936002)(81166007)(110136005)(54906003)(40480700001)(26005)(36860700001)(336012)(426003)(47076005)(2616005)(36756003)(16526019)(186003)(1076003)(478600001)(83380400001)(82310400005)(6666004)(2906002)(7696005)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 15:13:55.7919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69eb26aa-6260-442f-bf33-08da74999e29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6161
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This feature has 3 modes quiet, balanced, performance

The objective of this feature is to track the moving average of system
power over the time period specified and switch to the subsequent mode.

In order to do this, PMF driver will get the moving average of APU power
from PMFW and power threshold, time constants, system config parameters
from OEM inputs.

System power as read by PMF driver from PMFW is the filtered value over
the sampling window. Every sampling window, moving average of system power
is computed. At the end of the monitoring window, the moving average is
compared against the threshold for mode switch for decision making.

With AMD managing the system config limits, any mode switch within
auto-mode will result in limits of fPPT/sPPT/STAPM or STT being scaled
down.

When "auto mode" is enabled, the static slider control remains out of
the PMF driver, so the platform_profile registration would not
happen in PMF driver.

The transition to auto-mode only happens when the APMF fn5 is enabled
in BIOS, platform_profile set to "balanced" and a AMT
(Auto Mode transition) is received.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Makefile    |   3 +-
 drivers/platform/x86/amd/pmf/acpi.c      |   5 +
 drivers/platform/x86/amd/pmf/auto-mode.c | 263 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c      |   9 +
 drivers/platform/x86/amd/pmf/pmf.h       | 113 ++++++++++
 5 files changed, 392 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/amd/pmf/auto-mode.c

diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
index 557521a80427..ef2b08c9174d 100644
--- a/drivers/platform/x86/amd/pmf/Makefile
+++ b/drivers/platform/x86/amd/pmf/Makefile
@@ -5,4 +5,5 @@
 #
 
 obj-$(CONFIG_AMD_PMF) += amd-pmf.o
-amd-pmf-objs := core.o acpi.o sps.o
+amd-pmf-objs := core.o acpi.o sps.o \
+		auto-mode.o
diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 1fc4d1400364..401fee381e90 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -144,6 +144,11 @@ int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx)
 	return err;
 }
 
+int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data)
+{
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data, sizeof(*data));
+}
+
 static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
 {
 	struct apmf_verify_interface output;
diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
new file mode 100644
index 000000000000..99f5a2396b0b
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/auto-mode.c
@@ -0,0 +1,263 @@
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
+#include <linux/acpi.h>
+#include <linux/workqueue.h>
+#include "pmf.h"
+
+static struct auto_mode_mode_config config_store;
+static const char *state_as_str(unsigned int state);
+
+static void amd_pmf_set_automode(struct amd_pmf_dev *dev, int idx,
+				 struct auto_mode_mode_config *table)
+{
+	struct power_table_control *pwr_ctrl = &config_store.mode_set[idx].power_control;
+
+	amd_pmf_send_cmd(dev, SET_SPL, false, pwr_ctrl->spl, NULL);
+	amd_pmf_send_cmd(dev, SET_FPPT, false, pwr_ctrl->fppt, NULL);
+	amd_pmf_send_cmd(dev, SET_SPPT, false, pwr_ctrl->sppt, NULL);
+	amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, pwr_ctrl->sppt_apu_only, NULL);
+	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, pwr_ctrl->stt_min, NULL);
+	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
+			 pwr_ctrl->stt_skin_temp[STT_TEMP_APU], NULL);
+	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
+			 pwr_ctrl->stt_skin_temp[STT_TEMP_HS2], NULL);
+
+	if (is_apmf_func_supported(dev, APMF_FUNC_SET_FAN_IDX))
+		apmf_update_fan_idx(dev, config_store.mode_set[idx].fan_control.manual,
+				    config_store.mode_set[idx].fan_control.fan_id);
+}
+
+static int amd_pmf_get_moving_avg(struct amd_pmf_dev *pdev, int socket_power)
+{
+	int i, total = 0;
+
+	if (pdev->socket_power_history_idx == -1) {
+		for (i = 0; i < AVG_SAMPLE_SIZE; i++)
+			pdev->socket_power_history[i] = socket_power;
+	}
+
+	pdev->socket_power_history_idx = (pdev->socket_power_history_idx + 1) % AVG_SAMPLE_SIZE;
+	pdev->socket_power_history[pdev->socket_power_history_idx] = socket_power;
+
+	for (i = 0; i < AVG_SAMPLE_SIZE; i++)
+		total += pdev->socket_power_history[i];
+
+	return total / AVG_SAMPLE_SIZE;
+}
+
+void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms)
+{
+	int avg_power = 0;
+	bool update = false;
+	int i, j;
+
+	/* Get the average moving average computed by auto mode algorithm */
+	avg_power = amd_pmf_get_moving_avg(dev, socket_power);
+
+	for (i = 0; i < AUTO_TRANSITION_MAX; i++) {
+		if ((config_store.transition[i].shifting_up && avg_power >=
+		     config_store.transition[i].power_threshold) ||
+		    (!config_store.transition[i].shifting_up && avg_power <=
+		     config_store.transition[i].power_threshold)) {
+			if (config_store.transition[i].timer <
+			    config_store.transition[i].time_constant)
+				config_store.transition[i].timer += time_elapsed_ms;
+		} else {
+			config_store.transition[i].timer = 0;
+		}
+
+		if (config_store.transition[i].timer >=
+		    config_store.transition[i].time_constant &&
+		    !config_store.transition[i].applied) {
+			config_store.transition[i].applied = true;
+			update = true;
+		} else if (config_store.transition[i].timer <=
+			   config_store.transition[i].time_constant &&
+			   config_store.transition[i].applied) {
+			config_store.transition[i].applied = false;
+			update = true;
+		}
+	}
+
+	dev_dbg(dev->dev, "[AUTO_MODE] avg power: %u mW mode: %s\n", avg_power,
+		state_as_str(config_store.current_mode));
+
+	if (update) {
+		for (j = 0; j < AUTO_TRANSITION_MAX; j++) {
+			/* Apply the mode with highest priority indentified */
+			if (config_store.transition[j].applied) {
+				if (config_store.current_mode !=
+				    config_store.transition[j].target_mode) {
+					config_store.current_mode =
+							config_store.transition[j].target_mode;
+					dev_dbg(dev->dev, "[AUTO_MODE] moving to mode:%s\n",
+						state_as_str(config_store.current_mode));
+					amd_pmf_set_automode(dev, config_store.current_mode, NULL);
+				}
+				break;
+			}
+		}
+	}
+}
+
+static void amd_pmf_get_power_threshold(void)
+{
+	config_store.transition[AUTO_TRANSITION_TO_QUIET].power_threshold =
+				config_store.mode_set[AUTO_BALANCE].power_floor -
+				config_store.transition[AUTO_TRANSITION_TO_QUIET].power_delta;
+
+	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_threshold =
+				config_store.mode_set[AUTO_BALANCE].power_floor -
+				config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta;
+
+	config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_threshold =
+			config_store.mode_set[AUTO_QUIET].power_floor -
+			config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta;
+
+	config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_threshold =
+		config_store.mode_set[AUTO_PERFORMANCE].power_floor -
+		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta;
+}
+
+static const char *state_as_str(unsigned int state)
+{
+	switch (state) {
+	case AUTO_QUIET:
+		return "QUIET";
+	case AUTO_BALANCE:
+		return "BALANCED";
+	case AUTO_PERFORMANCE_ON_LAP:
+		return "ON_LAP";
+	case AUTO_PERFORMANCE:
+		return "PERFORMANCE";
+	default:
+		return "Unknown Auto Mode State";
+	}
+}
+
+void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev)
+{
+	struct apmf_auto_mode output;
+	struct power_table_control *pwr_ctrl;
+	int i;
+
+	apmf_get_auto_mode_def(dev, &output);
+	/* time constant */
+	config_store.transition[AUTO_TRANSITION_TO_QUIET].time_constant =
+								output.balanced_to_quiet;
+	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].time_constant =
+								output.balanced_to_perf;
+	config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].time_constant =
+								output.quiet_to_balanced;
+	config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].time_constant =
+								output.perf_to_balanced;
+
+	/* power floor */
+	config_store.mode_set[AUTO_QUIET].power_floor = output.pfloor_quiet;
+	config_store.mode_set[AUTO_BALANCE].power_floor = output.pfloor_balanced;
+	config_store.mode_set[AUTO_PERFORMANCE].power_floor = output.pfloor_perf;
+	config_store.mode_set[AUTO_PERFORMANCE_ON_LAP].power_floor = output.pfloor_perf;
+
+	/* Power delta for mode change */
+	config_store.transition[AUTO_TRANSITION_TO_QUIET].power_delta =
+								output.pd_balanced_to_quiet;
+	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta =
+								output.pd_balanced_to_perf;
+	config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta =
+								output.pd_quiet_to_balanced;
+	config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta =
+								output.pd_perf_to_balanced;
+
+	/* Power threshold */
+	amd_pmf_get_power_threshold();
+
+	/* skin temperature limits */
+	pwr_ctrl = &config_store.mode_set[AUTO_QUIET].power_control;
+	pwr_ctrl->spl = output.spl_quiet;
+	pwr_ctrl->sppt = output.sppt_quiet;
+	pwr_ctrl->fppt = output.fppt_quiet;
+	pwr_ctrl->sppt_apu_only = output.sppt_apu_only_quiet;
+	pwr_ctrl->stt_min = output.stt_min_limit_quiet;
+	pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_quiet;
+	pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_quiet;
+
+	pwr_ctrl = &config_store.mode_set[AUTO_BALANCE].power_control;
+	pwr_ctrl->spl = output.spl_balanced;
+	pwr_ctrl->sppt = output.sppt_balanced;
+	pwr_ctrl->fppt = output.fppt_balanced;
+	pwr_ctrl->sppt_apu_only = output.sppt_apu_only_balanced;
+	pwr_ctrl->stt_min = output.stt_min_limit_balanced;
+	pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_balanced;
+	pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_balanced;
+
+	pwr_ctrl = &config_store.mode_set[AUTO_PERFORMANCE].power_control;
+	pwr_ctrl->spl = output.spl_perf;
+	pwr_ctrl->sppt = output.sppt_perf;
+	pwr_ctrl->fppt = output.fppt_perf;
+	pwr_ctrl->sppt_apu_only = output.sppt_apu_only_perf;
+	pwr_ctrl->stt_min = output.stt_min_limit_perf;
+	pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_perf;
+	pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_perf;
+
+	pwr_ctrl = &config_store.mode_set[AUTO_PERFORMANCE_ON_LAP].power_control;
+	pwr_ctrl->spl = output.spl_perf_on_lap;
+	pwr_ctrl->sppt = output.sppt_perf_on_lap;
+	pwr_ctrl->fppt = output.fppt_perf_on_lap;
+	pwr_ctrl->sppt_apu_only = output.sppt_apu_only_perf_on_lap;
+	pwr_ctrl->stt_min = output.stt_min_limit_perf_on_lap;
+	pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_perf_on_lap;
+	pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_perf_on_lap;
+
+	/* Fan ID */
+	config_store.mode_set[AUTO_QUIET].fan_control.fan_id = output.fan_id_quiet;
+	config_store.mode_set[AUTO_BALANCE].fan_control.fan_id = output.fan_id_balanced;
+	config_store.mode_set[AUTO_PERFORMANCE].fan_control.fan_id = output.fan_id_perf;
+	config_store.mode_set[AUTO_PERFORMANCE_ON_LAP].fan_control.fan_id =
+									output.fan_id_perf;
+
+	config_store.transition[AUTO_TRANSITION_TO_QUIET].target_mode = AUTO_QUIET;
+	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode =
+								AUTO_PERFORMANCE;
+	config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].target_mode =
+									AUTO_BALANCE;
+	config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].target_mode =
+									AUTO_BALANCE;
+
+	config_store.transition[AUTO_TRANSITION_TO_QUIET].shifting_up = false;
+	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].shifting_up = true;
+	config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].shifting_up = true;
+	config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].shifting_up =
+										false;
+
+	for (i = 0 ; i < AUTO_MODE_MAX ; i++) {
+		if (config_store.mode_set[i].fan_control.fan_id == FAN_INDEX_AUTO)
+			config_store.mode_set[i].fan_control.manual = false;
+		else
+			config_store.mode_set[i].fan_control.manual = true;
+	}
+
+	/* set to initial default values */
+	config_store.current_mode = AUTO_BALANCE;
+	dev->socket_power_history_idx = -1;
+}
+
+void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev)
+{
+	cancel_delayed_work_sync(&dev->work_buffer);
+}
+
+void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev)
+{
+	amd_pmf_load_defaults_auto_mode(dev);
+	/* update the thermal limits for Automode */
+	amd_pmf_set_automode(dev, config_store.current_mode, NULL);
+	amd_pmf_init_metrics_table(dev);
+}
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 762f769bf7ee..42d803b49d97 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -240,12 +240,21 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 		amd_pmf_init_sps(dev);
 		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
 	}
+
+	/* Enable Auto Mode */
+	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
+		amd_pmf_init_auto_mode(dev);
+		dev_dbg(dev->dev, "Auto Mode Init done\n");
+	}
 }
 
 static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
 {
 	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
 		amd_pmf_deinit_sps(dev);
+
+	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE))
+		amd_pmf_deinit_auto_mode(dev);
 }
 
 static const struct acpi_device_id amd_pmf_acpi_ids[] = {
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 42e4a5f512c0..ce092a529261 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -18,6 +18,7 @@
 #define APMF_FUNC_VERIFY_INTERFACE			0
 #define APMF_FUNC_GET_SYS_PARAMS			1
 #define APMF_FUNC_SBIOS_HEARTBEAT			4
+#define APMF_FUNC_AUTO_MODE					5
 #define APMF_FUNC_SET_FAN_IDX				7
 #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
 
@@ -44,6 +45,7 @@
 #define FAN_INDEX_AUTO		0xFFFFFFFF
 
 #define ARG_NONE 0
+#define AVG_SAMPLE_SIZE 3
 
 /* AMD PMF BIOS interfaces */
 struct apmf_verify_interface {
@@ -143,6 +145,8 @@ struct amd_pmf_dev {
 	struct smu_pmf_metrics m_table;
 	struct delayed_work work_buffer;
 	ktime_t start_time;
+	int socket_power_history[AVG_SAMPLE_SIZE];
+	int socket_power_history_idx;
 };
 
 struct apmf_sps_prop_granular {
@@ -171,6 +175,107 @@ struct fan_table_control {
 	unsigned long fan_id;
 };
 
+struct power_table_control {
+	u32 spl;
+	u32 sppt;
+	u32 fppt;
+	u32 sppt_apu_only;
+	u32 stt_min;
+	u32 stt_skin_temp[STT_TEMP_COUNT];
+	u32 reserved[16];
+};
+
+/* Auto Mode Layer */
+enum auto_mode_transition_priority {
+	AUTO_TRANSITION_TO_PERFORMANCE, /* Any other mode to Performance Mode */
+	AUTO_TRANSITION_FROM_QUIET_TO_BALANCE, /* Quiet Mode to Balance Mode */
+	AUTO_TRANSITION_TO_QUIET, /* Any other mode to Quiet Mode */
+	AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE, /* Performance Mode to Balance Mode */
+	AUTO_TRANSITION_MAX,
+};
+
+enum auto_mode_mode {
+	AUTO_QUIET,
+	AUTO_BALANCE,
+	AUTO_PERFORMANCE_ON_LAP,
+	AUTO_PERFORMANCE,
+	AUTO_MODE_MAX,
+};
+
+struct auto_mode_trans_params {
+	u32 time_constant; /* minimum time required to switch to next mode */
+	u32 power_delta; /* delta power to shift mode */
+	u32 power_threshold;
+	u32 timer; /* elapsed time. if timer > TimeThreshold, it will move to next mode */
+	u32 applied;
+	enum auto_mode_mode target_mode;
+	u32 shifting_up;
+};
+
+struct auto_mode_mode_settings {
+	struct power_table_control power_control;
+	struct fan_table_control fan_control;
+	u32 power_floor;
+};
+
+struct auto_mode_mode_config {
+	struct auto_mode_trans_params transition[AUTO_TRANSITION_MAX];
+	struct auto_mode_mode_settings mode_set[AUTO_MODE_MAX];
+	enum auto_mode_mode current_mode;
+};
+
+struct apmf_auto_mode {
+	u16 size;
+	/* time constant */
+	u32 balanced_to_perf;
+	u32 perf_to_balanced;
+	u32 quiet_to_balanced;
+	u32 balanced_to_quiet;
+	/* power floor */
+	u32 pfloor_perf;
+	u32 pfloor_balanced;
+	u32 pfloor_quiet;
+	/* Power delta for mode change */
+	u32 pd_balanced_to_perf;
+	u32 pd_perf_to_balanced;
+	u32 pd_quiet_to_balanced;
+	u32 pd_balanced_to_quiet;
+	/* skin temperature limits */
+	u8 stt_apu_perf_on_lap; /* CQL ON */
+	u8 stt_hs2_perf_on_lap; /* CQL ON */
+	u8 stt_apu_perf;
+	u8 stt_hs2_perf;
+	u8 stt_apu_balanced;
+	u8 stt_hs2_balanced;
+	u8 stt_apu_quiet;
+	u8 stt_hs2_quiet;
+	u32 stt_min_limit_perf_on_lap; /* CQL ON */
+	u32 stt_min_limit_perf;
+	u32 stt_min_limit_balanced;
+	u32 stt_min_limit_quiet;
+	/* SPL based */
+	u32 fppt_perf_on_lap; /* CQL ON */
+	u32 sppt_perf_on_lap; /* CQL ON */
+	u32 spl_perf_on_lap; /* CQL ON */
+	u32 sppt_apu_only_perf_on_lap; /* CQL ON */
+	u32 fppt_perf;
+	u32 sppt_perf;
+	u32 spl_perf;
+	u32 sppt_apu_only_perf;
+	u32 fppt_balanced;
+	u32 sppt_balanced;
+	u32 spl_balanced;
+	u32 sppt_apu_only_balanced;
+	u32 fppt_quiet;
+	u32 sppt_quiet;
+	u32 spl_quiet;
+	u32 sppt_apu_only_quiet;
+	/* Fan ID */
+	u32 fan_id_perf;
+	u32 fan_id_balanced;
+	u32 fan_id_quiet;
+} __packed;
+
 /* Core Layer */
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
 void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
@@ -191,4 +296,12 @@ void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev);
 
 
 int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
+
+/* Auto Mode Layer */
+void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev);
+int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data);
+void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
+void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
+void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
+
 #endif /* PMF_H */
-- 
2.25.1

