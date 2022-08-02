Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBEABC19F2C
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 11:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236928AbiHBL2J (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 07:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236927AbiHBL2D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 07:28:03 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C08749B61
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 04:27:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVlP9XQRms8NjMr/Q6Q2l7V6BZnr2ONmdLsXlQ/Er97nAF4b2bZVzOzeuj7Q/Taf5z4lmnWcFO2NXsKDG8h9QEaJNbiZGKCWeSV05ahdFucNVeUfvhupxMEL60A9DGhmwWlp4EQrXnVWk7uQHazqJQyWRbIDdF05NKbZ0M/E5hoVtqOHguCcml586wLyahs3nOCP4Azsdl4jn1S3LENZ6yhg6oDbAj4lQJoJ0j/uThb77HFNFU+QLfqhvhF56WPNocfVK6xD+ofPYM17dUqEkoEu03m8cDemwuMhyApj4h3EPnBUpgZBc3PdowLpV8d4A6Y77lAY/jwiv4yoLF78aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8EEo5cznDw/xsPeLAqw5jaUYMwOniFUnKMK7AIpEXY=;
 b=kMKxMVLqH0QXrbqHECRYGDMnewORKg1QJ+YqlZ9LD71xDkcSOQLu7vfKqzZlQwNPN0Oub1azVRjTsRAetvjo8Ql5kIVi1rETxM/m9TwXlAWBR0D2/rMMUeANE75cKyrhBPKjyE3zTBWatlMPB5BgpmmlpmQizEK5/GMjexdzVfVmkWRe3o7sd6mbz3bd1DNP2mKZoq/HRmueWE2FYbQa4RidkLiuis7ktpX6ytZWW/piF8G5forbKFNio1XDZXzEMkH58mF6Az9/h/u6u91IkZs7RQlmwd3CVYgyijJoogOukzSZw9cpy8YHtAV9lDy4Ub3q65cATgFbDx6XpOIFlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8EEo5cznDw/xsPeLAqw5jaUYMwOniFUnKMK7AIpEXY=;
 b=yiqp0ADcxVjM9tIBwK615zzt0yNngStGpb+941GtehA2sSk5Cr52wO0ysizYzWZOShByle3s+HwNMBaPc4Zgv0t0TmI9XFGI/3V4NZpJUtza3toxYkkSNB4nwvJXPNzUwDuHeqnC43x237l2SxHRIzjw07notjCSKctYbOLCdP8=
Received: from MW4PR04CA0148.namprd04.prod.outlook.com (2603:10b6:303:84::33)
 by IA1PR12MB6212.namprd12.prod.outlook.com (2603:10b6:208:3e4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 11:27:54 +0000
Received: from CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::d9) by MW4PR04CA0148.outlook.office365.com
 (2603:10b6:303:84::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16 via Frontend
 Transport; Tue, 2 Aug 2022 11:27:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT039.mail.protection.outlook.com (10.13.174.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 11:27:53 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 06:27:31 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 08/11] platform/x86/amd/pmf: Add support for Auto mode feature
Date:   Tue, 2 Aug 2022 16:55:42 +0530
Message-ID: <20220802112545.2118632-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
References: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89a8577e-6460-43de-50a3-08da747a0a9c
X-MS-TrafficTypeDiagnostic: IA1PR12MB6212:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2hMPSHBR9qWTxM51siUVkSw3ICKga5xWIPsFzysCOr2jtejT/stgNk1wyvaUcDh6iuQ7fsXPpencKglWqtXtozm8MQu88fR7lcd87iFCsQ9gugc8t+F8bhq07XvS9qEdGWeoy5TazQChak6liZ8sT0rmvoi79AtTcP23PU4gCAeF/UY1CJ11ZW4QJ240lcSBvCRRX+ABXo6X48aphrTTmfr4U5dWDzmnAhAu/2mwuQV1iFJPaRuZwmeIAoD+okJbwVitNO2NCRUlVC7DBVLK7cohJBwEJRj+I3gI18631nmCnTlqopgzwxI6gUwECwFI2qvG+wVtlf2JEAEqb6ABwLCHsBgkIlwokv6vOIpRRP77pBMPmRCEI5N9WM6lFsc88pypWdRBLoNJc3kWa84Y9FDBOmyPGvH1ok+O/oyH6e9hii6Wae30CH0ihBLAw4ZgH9VWGpwM4uONu/GqAUtvfzdxDZrGPxh3brm3L1ebWvuz0B0oYRWQbj2jxXZWge36jgU+y6XxzDNMiliRk+issxgN+uiKRqhzqQuJ4GbjhZQaugIuPf9Qh0r1OMVcfxQtdqXra+8ljA14zvvEgjT1eyjXQeE10jmX/xjt7nd4bt7phE37iwtBgceP8Yxqv3jM5ytBoX0EaXcu/7u7qGWNHAJCZO4Sa9/PfprxdVrj7muR7CGUBW6cEBgXWgoHx0qNvx5DsFjWa152Vv/5AyNuPRLQIVv06LGp1ti3mDB6U/YmzETs4fdQ4lR30ilTIpkOdvJ6WpN/wBKUlBZJLbJdG7bjlbwYjc4SgfTt8FjlTnFUXHzBIra3k7OQzmVfn3uD+VsIM0UqhB2qJcsWqUbbNQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(376002)(39860400002)(40470700004)(36840700001)(46966006)(36756003)(186003)(16526019)(1076003)(70206006)(86362001)(70586007)(2616005)(426003)(336012)(83380400001)(47076005)(7696005)(8676002)(26005)(4326008)(40460700003)(82740400003)(356005)(81166007)(54906003)(2906002)(30864003)(478600001)(41300700001)(6666004)(5660300002)(40480700001)(110136005)(8936002)(36860700001)(316002)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 11:27:53.7476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a8577e-6460-43de-50a3-08da747a0a9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6212
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

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Makefile    |   3 +-
 drivers/platform/x86/amd/pmf/acpi.c      |   5 +
 drivers/platform/x86/amd/pmf/auto-mode.c | 263 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c      |   9 +
 drivers/platform/x86/amd/pmf/pmf.h       | 117 ++++++++++
 5 files changed, 396 insertions(+), 1 deletion(-)
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
index a2246c08694e..200e31033d94 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -149,6 +149,11 @@ int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx)
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
index 42e4a5f512c0..8c92cd6871df 100644
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
@@ -171,6 +175,111 @@ struct fan_table_control {
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
+	bool on_lap;
+	bool better_perf;
+	u32 amt_enabled; /* Auto Mode Transition */
+	u32 avg_power;
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
@@ -191,4 +300,12 @@ void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev);
 
 
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

