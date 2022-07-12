Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BAE6C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Jul 2022 15:04:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233520AbiGLPET (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Jul 2022 11:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233540AbiGLPDR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Jul 2022 11:03:17 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C8BBE6B1
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2022 08:00:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zfva+PpyDJtK5oZAKIz1k/elDs6NShrti5DdoVjBbAOlnNUdC9qP+NcsZvibK0OQqF7BzqYVz26HD7rV7J8FwuWpEKyYuVJWLHpOPNEY4vGERpN4h4uQwybNSWmlbofgYee7WHJgoy0QdjYMVK2au6QmZKYmNdDqfMC7WqAnbGwJWmSEhC59Ka1X6TZ/jY5STTCDlIghuoTQcGTmGdIzqHTd9S3xb9mtx+6X0NgKb+aCu3E4nSjVl24jklVBS/blo6cw6iBxhAKPXOMOueP1U0PY7mhCJcyYiOC80ntSQi9ntp9FjHqkp2LyrLqyEuVSuh2MDrGDchLM6syK8Lp0Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SVJbaqfv6M7cfiM+kd8YTfMBsewLjGXkf2OQRRFY50=;
 b=ZpPel77LLaR8aDIJQ/pc1hvoyLZhhlLuYLwiael4S6C/b2iVRS7I6xi1tvCmHy9tOl/xmQ7B+bl/GWfotOGrk3lKtZsg0FM/K521zVhkjl1iLkEIOBodpkv93s0V6BU4581qIgCrQFUkvd+j8GAyoYDCrreodOejgM+7p81ukpysuFA3MJc8uBPWfMAUgC8PRG4EOVpm7xtG5Rn54VH0GeX+ISJt+9WUltCo8Nu3IqjJDnbUbwOTLNoVwKok1CpDhGbEH+lA8cy2m6a/w5RUvNTbvh+v1XtAndkUAnUyjvXUZY1pjOQnCf4FhKQGER1EiSniCmu4zl1ImJZ/XF1osg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SVJbaqfv6M7cfiM+kd8YTfMBsewLjGXkf2OQRRFY50=;
 b=fqfRPB2CreVulkjwuE3QZwymyMUIJOxAEOvaBSkPZJq+tUgJJ+MBPm/8di1sRkAoPEHhNPoa6SiqIgrb/4Med5EQQLNOO80U1xYYtiYna1csp1VD8ADTH37p14EQ3VarxYdJ4h/804fSgO35+l6YaWRPC55YhmE03O57PhpXgSg=
Received: from BN0PR04CA0072.namprd04.prod.outlook.com (2603:10b6:408:ea::17)
 by DM5PR12MB1820.namprd12.prod.outlook.com (2603:10b6:3:10d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 14:59:54 +0000
Received: from BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ea:cafe::6) by BN0PR04CA0072.outlook.office365.com
 (2603:10b6:408:ea::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.19 via Frontend
 Transport; Tue, 12 Jul 2022 14:59:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT005.mail.protection.outlook.com (10.13.176.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 14:59:54 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 09:59:51 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v1 12/15] platform/x86/amd/pmf: Add support for Auto mode feature
Date:   Tue, 12 Jul 2022 20:28:44 +0530
Message-ID: <20220712145847.3438544-13-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80ca96d2-955b-4ec9-6e58-08da64172dd7
X-MS-TrafficTypeDiagnostic: DM5PR12MB1820:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 25CyecIEzQ3gxnWHnRbRoNc6t9037Mq6aU7RIg6biYxoC+7HdMrvp5Qel/luYyhBT5pOB5mBuhUjnjGtNbQwZ2Mse6P3d41qKic8RBwfaJc2ZEQpnrN1f7HmILTmw+sch+dJoEDBn5QtLDsLbaOyPAPBkMy4e3UIgwTO1Rz/Qiekt1G7491M2b5Qc1n1dv8nb1jnXkbunBnx94HArwKZ9KHFaFoztjdIwh/O+FDOlkjL7n+cgvQZZ+iGBnPkIVuSUh0/G4xMxKrAB/8XG6ZKTL0UPoIrGlv3duZbebfMBUTCl0b+HUkfrC9shvPqNNiogamnkOkPPpQZknZGu164s+/nvPJDMOfCOto8/W56Ir5Icjy2n+8PyHhHppG9KP7gTtvGYL4N0RBuKLkVKPthOysi9rHhQBMJNPH5V22aVWWkY987VL8nGkOPeykjLzfXL7h1q4s0PlQqYWrKB1CgCSYomor2U8hq0KWGN4KrY2xQS+ojWHuR03lbPdQw6mWSzfGKsuOXl5ouvADh6nA5GEKIdcKEjh4gujh9OcOKZhJr1Y3GA6YykbjN/VqYyLBuU+5aba0jRtXPwbWFtdm8RNGl7sZQ8THc7fR7vNvCgddpzzuQzZ2zzHTjal+QFUQiW0S11+EjqAN4lbKOP+X6oR7UXHJLHTk05p/EvRVOSScd4WytPvrhGSKYXxRdm+OlW2+/dkTEksi2OLBbc66YVhdUsbC+UkXnYQQv2FnS27Z4QGE/gqld00PzwLxV1Tb7EZIRMairdX3fqFiEp2X7cFuxsqUjFhv55Nr48yQRKx20QQYNu0bNL7g668milbT6p0lT65cYk34TIp1roaC8mF0p7bPpil+hwxrWGq00k2k=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(39860400002)(36840700001)(46966006)(40470700004)(83380400001)(426003)(2906002)(336012)(47076005)(40460700003)(30864003)(82310400005)(36756003)(40480700001)(7696005)(41300700001)(5660300002)(110136005)(86362001)(186003)(70206006)(4326008)(8676002)(36860700001)(478600001)(70586007)(356005)(54906003)(81166007)(16526019)(82740400003)(2616005)(6666004)(26005)(316002)(8936002)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 14:59:54.1840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ca96d2-955b-4ec9-6e58-08da64172dd7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1820
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The objective of this feature is to track the moving average of system
power over the time period specified and switch to the subsequent mode.

This feature has 3 modes: quiet, balanced, performance.

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
 drivers/platform/x86/amd/pmf/Makefile    |   2 +-
 drivers/platform/x86/amd/pmf/acpi.c      |  28 ++
 drivers/platform/x86/amd/pmf/auto-mode.c | 317 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/core.c      |  25 +-
 drivers/platform/x86/amd/pmf/pmf.h       | 104 ++++++++
 5 files changed, 473 insertions(+), 3 deletions(-)
 create mode 100644 drivers/platform/x86/amd/pmf/auto-mode.c

diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
index d02a0bdc6429..2a9568bf9064 100644
--- a/drivers/platform/x86/amd/pmf/Makefile
+++ b/drivers/platform/x86/amd/pmf/Makefile
@@ -6,4 +6,4 @@
 
 obj-$(CONFIG_AMD_PMF) += amd-pmf.o
 amd-pmf-objs := core.o acpi.o sps.o \
-		cnqf.o
+		cnqf.o auto-mode.o
diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index a3ff91c605b5..e9f33e61659f 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -55,6 +55,7 @@ static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
 {
 	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
 	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
+	func->auto_mode_def = mask & APMF_FUNC_AUTO_MODE;
 	func->fan_table_idx = mask & APMF_FUNC_SET_FAN_IDX;
 	func->dyn_slider_ac = mask & APMF_FUNC_DYN_SLIDER_GRANULAR_AC;
 	func->dyn_slider_dc = mask & APMF_FUNC_DYN_SLIDER_GRANULAR_DC;
@@ -210,6 +211,33 @@ int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx)
 	return err;
 }
 
+int apmf_get_auto_mode_def(struct apmf_if *ampf_if, struct apmf_auto_mode *data)
+{
+	union acpi_object *info;
+	size_t size;
+	int err = 0;
+
+	info = apmf_if_call(ampf_if, APMF_FUNC_AUTO_MODE, NULL);
+	if (!info)
+		return -EIO;
+
+	size = *(u16 *)info->buffer.pointer;
+
+	if (size < sizeof(*data)) {
+		pr_debug("buffer too small %zu\n", size);
+		err = -EINVAL;
+		goto out;
+	}
+
+	size = min(sizeof(*data), size);
+	memset(data, 0, sizeof(*data));
+	memcpy(data, info->buffer.pointer, size);
+
+out:
+	kfree(info);
+	return err;
+}
+
 int apmf_get_dyn_slider_def_ac(struct apmf_if *ampf_if, struct apmf_dyn_slider_output *data)
 {
 	union acpi_object *info;
diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
new file mode 100644
index 000000000000..954fde25e71e
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/auto-mode.c
@@ -0,0 +1,317 @@
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
+#include <linux/list.h>
+#include <linux/workqueue.h>
+#include "pmf.h"
+
+#define AVG_SAMPLE_SIZE 3
+
+struct power_history {
+	int socket_power;
+	struct list_head list;
+	int avg;
+	int total;
+};
+
+struct list_pdata {
+	int total;
+	int avg;
+};
+
+static struct power_history power_list;
+static struct list_pdata pdata;
+
+static struct auto_mode_mode_config config_store;
+static const char *state_as_str(unsigned int state);
+
+static void amd_pmf_handle_automode(struct amd_pmf_dev *dev, bool op, int idx,
+				    struct auto_mode_mode_config *table)
+{
+	if (op == SLIDER_OP_SET) {
+		struct power_table_control *pwr_ctrl = &config_store.mode_set[idx].power_control;
+
+		amd_pmf_send_cmd(dev, SET_SPL, false, pwr_ctrl->spl, NULL);
+		amd_pmf_send_cmd(dev, SET_FPPT, false, pwr_ctrl->fppt, NULL);
+		amd_pmf_send_cmd(dev, SET_SPPT, false, pwr_ctrl->sppt, NULL);
+		amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, pwr_ctrl->sppt_apu_only, NULL);
+		amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, pwr_ctrl->stt_min, NULL);
+		amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
+				 pwr_ctrl->stt_skin_temp[STT_TEMP_APU], NULL);
+		amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
+				 pwr_ctrl->stt_skin_temp[STT_TEMP_HS2], NULL);
+	} else if (op == SLIDER_OP_GET) {
+		amd_pmf_send_cmd(dev, GET_SPL, true, ARG_NONE,
+				 &table->mode_set[idx].power_control.spl);
+		amd_pmf_send_cmd(dev, GET_FPPT, true, ARG_NONE,
+				 &table->mode_set[idx].power_control.fppt);
+		amd_pmf_send_cmd(dev, GET_SPPT, true, ARG_NONE,
+				 &table->mode_set[idx].power_control.sppt);
+		amd_pmf_send_cmd(dev, GET_SPPT_APU_ONLY, true, ARG_NONE,
+				 &table->mode_set[idx].power_control.sppt_apu_only);
+		amd_pmf_send_cmd(dev, GET_STT_MIN_LIMIT, true, ARG_NONE,
+				 &table->mode_set[idx].power_control.stt_min);
+		amd_pmf_send_cmd(dev, GET_STT_LIMIT_APU, true, ARG_NONE,
+				 &table->mode_set[idx].power_control.stt_skin_temp[STT_TEMP_APU]);
+		amd_pmf_send_cmd(dev, GET_STT_LIMIT_HS2, true, ARG_NONE,
+				 &table->mode_set[idx].power_control.stt_skin_temp[STT_TEMP_HS2]);
+	}
+
+	if (dev->apmf_if->func.fan_table_idx)
+		apmf_update_fan_idx(dev->apmf_if, config_store.mode_set[idx].fan_control.manual,
+				    config_store.mode_set[idx].fan_control.fan_id);
+}
+
+static int amd_pmf_get_moving_avg(int socket_power)
+{
+	struct power_history *tmp;
+	struct list_head *pos, *q;
+	static int count;
+
+	tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
+	tmp->socket_power = socket_power;
+	list_add_tail(&tmp->list, &power_list.list);
+
+	list_for_each_safe(pos, q, &power_list.list) {
+		if (count >= AVG_SAMPLE_SIZE) {
+			tmp = list_first_entry(pos, struct power_history, list);
+			list_del_init(pos);
+			goto next;
+		}
+	}
+
+next:
+	pdata.total = 0;
+	pdata.avg = 0;
+
+	list_for_each(pos, &power_list.list) {
+		tmp = list_entry(pos, struct power_history, list);
+		pdata.total += tmp->socket_power;
+		pdata.avg = pdata.total / AVG_SAMPLE_SIZE;
+	}
+
+	count++;
+	if (count >= AVG_SAMPLE_SIZE)
+		return pdata.avg;
+
+	return 0;
+}
+
+void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms)
+{
+	int avg_power = 0;
+	bool update = false;
+	int i, j;
+
+	/* Get the average moving average computed by auto mode algorithm */
+	avg_power = amd_pmf_get_moving_avg(socket_power);
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
+					amd_pmf_handle_automode(dev, SLIDER_OP_SET,
+								config_store.current_mode, NULL);
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
+	if (dev->apmf_if->func.auto_mode_def) {
+		apmf_get_auto_mode_def(dev->apmf_if, &output);
+		/* time constant */
+		config_store.transition[AUTO_TRANSITION_TO_QUIET].time_constant =
+									output.balanced_to_quiet;
+		config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].time_constant =
+									output.balanced_to_perf;
+		config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].time_constant =
+									output.quiet_to_balanced;
+		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].time_constant =
+									output.perf_to_balanced;
+
+		/* power floor */
+		config_store.mode_set[AUTO_QUIET].power_floor = output.pfloor_quiet;
+		config_store.mode_set[AUTO_BALANCE].power_floor = output.pfloor_balanced;
+		config_store.mode_set[AUTO_PERFORMANCE].power_floor = output.pfloor_perf;
+		config_store.mode_set[AUTO_PERFORMANCE_ON_LAP].power_floor = output.pfloor_perf;
+
+		/* Power delta for mode change */
+		config_store.transition[AUTO_TRANSITION_TO_QUIET].power_delta =
+									output.pd_balanced_to_quiet;
+		config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta =
+									output.pd_balanced_to_perf;
+		config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta =
+									output.pd_quiet_to_balanced;
+		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta =
+									output.pd_perf_to_balanced;
+
+		/* Power threshold */
+		amd_pmf_get_power_threshold();
+
+		/* skin temperature limits */
+		pwr_ctrl = &config_store.mode_set[AUTO_QUIET].power_control;
+		pwr_ctrl->spl = output.spl_quiet;
+		pwr_ctrl->sppt = output.sppt_quiet;
+		pwr_ctrl->fppt = output.fppt_quiet;
+		pwr_ctrl->sppt_apu_only = output.sppt_apu_only_quiet;
+		pwr_ctrl->stt_min = output.stt_min_limit_quiet;
+		pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_quiet;
+		pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_quiet;
+
+		pwr_ctrl = &config_store.mode_set[AUTO_BALANCE].power_control;
+		pwr_ctrl->spl = output.spl_balanced;
+		pwr_ctrl->sppt = output.sppt_balanced;
+		pwr_ctrl->fppt = output.fppt_balanced;
+		pwr_ctrl->sppt_apu_only = output.sppt_apu_only_balanced;
+		pwr_ctrl->stt_min = output.stt_min_limit_balanced;
+		pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_balanced;
+		pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_balanced;
+
+		pwr_ctrl = &config_store.mode_set[AUTO_PERFORMANCE].power_control;
+		pwr_ctrl->spl = output.spl_perf;
+		pwr_ctrl->sppt = output.sppt_perf;
+		pwr_ctrl->fppt = output.fppt_perf;
+		pwr_ctrl->sppt_apu_only = output.sppt_apu_only_perf;
+		pwr_ctrl->stt_min = output.stt_min_limit_perf;
+		pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_perf;
+		pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_perf;
+
+		pwr_ctrl = &config_store.mode_set[AUTO_PERFORMANCE_ON_LAP].power_control;
+		pwr_ctrl->spl = output.spl_perf_on_lap;
+		pwr_ctrl->sppt = output.sppt_perf_on_lap;
+		pwr_ctrl->fppt = output.fppt_perf_on_lap;
+		pwr_ctrl->sppt_apu_only = output.sppt_apu_only_perf_on_lap;
+		pwr_ctrl->stt_min = output.stt_min_limit_perf_on_lap;
+		pwr_ctrl->stt_skin_temp[STT_TEMP_APU] = output.stt_apu_perf_on_lap;
+		pwr_ctrl->stt_skin_temp[STT_TEMP_HS2] = output.stt_hs2_perf_on_lap;
+
+		/* Fan ID */
+		config_store.mode_set[AUTO_QUIET].fan_control.fan_id = output.fan_id_quiet;
+		config_store.mode_set[AUTO_BALANCE].fan_control.fan_id = output.fan_id_balanced;
+		config_store.mode_set[AUTO_PERFORMANCE].fan_control.fan_id = output.fan_id_perf;
+		config_store.mode_set[AUTO_PERFORMANCE_ON_LAP].fan_control.fan_id =
+										output.fan_id_perf;
+
+		config_store.transition[AUTO_TRANSITION_TO_QUIET].target_mode = AUTO_QUIET;
+		config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode =
+									AUTO_PERFORMANCE;
+		config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].target_mode =
+										AUTO_BALANCE;
+		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].target_mode =
+										AUTO_BALANCE;
+
+		config_store.transition[AUTO_TRANSITION_TO_QUIET].shifting_up = false;
+		config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].shifting_up = true;
+		config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].shifting_up = true;
+		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].shifting_up =
+											false;
+
+		for (i = 0 ; i < AUTO_MODE_MAX ; i++) {
+			if (config_store.mode_set[i].fan_control.fan_id == FAN_INDEX_AUTO)
+				config_store.mode_set[i].fan_control.manual = false;
+			else
+				config_store.mode_set[i].fan_control.manual = true;
+		}
+	}
+}
+
+void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev)
+{
+	cancel_delayed_work_sync(&dev->work_buffer);
+}
+
+void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev)
+{
+	INIT_LIST_HEAD(&power_list.list);
+
+	amd_pmf_init_metrics_table(dev);
+	amd_pmf_load_defaults_auto_mode(dev);
+
+	/* update the thermal for Automode */
+	amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
+}
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index bc267d333b76..674ddf599135 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -122,6 +122,11 @@ static void amd_pmf_get_metrics(struct work_struct *work)
 	/* Calculate the avg SoC power consumption */
 	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
 
+	if (current_profile == PLATFORM_PROFILE_BALANCED) {
+		/* Apply the Auto Mode transition */
+		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
+	}
+
 	if (dev->cnqf_feat) {
 		/* Apply the CnQF transition */
 		amd_pmf_trans_cnqf(dev, socket_power, time_elapsed_ms);
@@ -260,9 +265,18 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 		amd_pmf_init_sps(dev);
 		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
 	}
-	/* Enable Cool n Quiet Framework (CnQF) */
-	if (is_apmf_func_supported(APMF_FUNC_DYN_SLIDER_GRANULAR_AC) ||
+
+	/* Enable Auto Mode */
+	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE)) {
+		amd_pmf_init_auto_mode(dev);
+		dev_dbg(dev->dev, "Auto Mode Init done\n");
+		/*
+		 * Auto mode and CnQF cannot co-exist. If auto mode is supported it takes
+		 * higher priority over CnQF.
+		 */
+	} else if (is_apmf_func_supported(APMF_FUNC_DYN_SLIDER_GRANULAR_AC) ||
 	    is_apmf_func_supported(APMF_FUNC_DYN_SLIDER_GRANULAR_DC)) {
+		/* Enable Cool n Quiet Framework (CnQF) */
 		amd_pmf_init_cnqf(dev);
 		dev_dbg(dev->dev, "CnQF Init done\n");
 	}
@@ -272,6 +286,13 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
 {
 	if (is_apmf_func_supported(APMF_FUNC_STATIC_SLIDER_GRANULAR))
 		amd_pmf_deinit_sps(dev);
+
+	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE)) {
+		amd_pmf_deinit_auto_mode(dev);
+		/* If auto mode is supported, there is no need to proceed */
+		return;
+	}
+
 	if (is_apmf_func_supported(APMF_FUNC_DYN_SLIDER_GRANULAR_AC) ||
 	    is_apmf_func_supported(APMF_FUNC_DYN_SLIDER_GRANULAR_DC))
 		amd_pmf_deinit_cnqf(dev);
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 452266809dfa..0532f49e9613 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -18,6 +18,7 @@
 #define APMF_FUNC_VERIFY_INTERFACE			0
 #define APMF_FUNC_GET_SYS_PARAMS			1
 #define APMF_FUNC_SBIOS_HEARTBEAT			4
+#define APMF_FUNC_AUTO_MODE					5
 #define APMF_FUNC_SET_FAN_IDX				7
 #define APMF_FUNC_STATIC_SLIDER_GRANULAR	9
 #define APMF_FUNC_DYN_SLIDER_GRANULAR_AC	11
@@ -51,6 +52,7 @@
 struct apmf_if_functions {
 	bool system_params;
 	bool sbios_heartbeat;
+	bool auto_mode_def;
 	bool fan_table_idx;
 	bool static_slider_granular;
 	bool dyn_slider_ac;
@@ -197,6 +199,33 @@ struct fan_table_control {
 	unsigned long fan_id;
 };
 
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
+	u32	time_constant; /* minimum time required to switch to next mode */
+	u32 power_delta; /* delta power to shift mode */
+	u32 power_threshold;
+	u32	timer; /* elapsed time. if timer > TimeThreshold, it will move to next mode */
+	u32 applied;
+	enum auto_mode_mode target_mode;
+	u32 shifting_up;
+};
+
 struct power_table_control {
 	u32 spl;
 	u32 sppt;
@@ -207,6 +236,74 @@ struct power_table_control {
 	u32 reserved[16];
 };
 
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
 /* CnQF Layer */
 enum cnqf_trans_priority {
 	CNQF_TRANSITION_TO_TURBO, /* Any other mode to Turbo Mode */
@@ -317,6 +414,13 @@ void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev);
 
 int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx);
 
+/* Auto Mode Layer */
+void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev);
+int apmf_get_auto_mode_def(struct apmf_if *ampf_if, struct apmf_auto_mode *data);
+void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
+void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
+void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
+
 /* CnQF Layer */
 int apmf_get_dyn_slider_def_ac(struct apmf_if *ampf_if, struct apmf_dyn_slider_output *data);
 int apmf_get_dyn_slider_def_dc(struct apmf_if *ampf_if, struct apmf_dyn_slider_output *data);
-- 
2.25.1

