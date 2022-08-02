Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CC7C00140
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 11:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236942AbiHBL2I (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 07:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236920AbiHBL2D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 07:28:03 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8582048E8E
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 04:27:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nA8GaWgAoS84mam48c77fcP+H+D/tPH5JULiQpM9YRrLGDlru4vkMabiXvV4uFxh+LJCIK2U3Xg/NaU660BKf5URzf1hvldLCzBNTkWKVlHFKLZMtjv722XiaAtnmzmB1xOZfo5iOKP1S6n9igy5WtL30Gn+VjDBpOHPZ9DcPhn6IkaxHBdEg2iR984mrBTg9CwL03jzAlBpDtcUiLf0DbQRP91SOqBkHv05y0Xf4fYZ3Oi+kd/jg8D+iiRYUQ1xGWrZ0O/Xdr6iuHRtWAQihx1LqGuVXGcpu9EbzeDwE/FBlyI4yQiZmLZIrShWIYUAO0LzD9C2vGie5DwqtWXunQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhhfO4oaRcYWE8N7jxLr9p4dCEjiQ4bykUDIMyFkz8U=;
 b=nmOMIxz0vL6AKchjJjkQAeDXA+HR6TEDyN4XIvrjCbc/MBB7qCT+EdT2g3EjUQ9RqUKvEYegvfEd6nanJqnQcs5k/CPmT7BV4aJaWClbTdu9UE1QkCe2Lfg7uoCQJgpfYd7w+jd0zO+V/lwY9pI0vjgi9LFz4meJ/tUo9Og/3uq3dU3rBzAkuvWt52FDOL4RyegP4AmQt0ZzNTOggrWvSuR3QtoVX3l7VuIDpT9ou7I0hhWEX99NMrkwlnuCO6ChowVT4rrURdL9sPeGuZ59BR/HaU/Z+Fc8pWJNAXAyASouGOsJKSO9I3ggDyTIdnNgbNJmyBCTVr/eWlp3wJWU8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhhfO4oaRcYWE8N7jxLr9p4dCEjiQ4bykUDIMyFkz8U=;
 b=QHzdVhc4ekd1Z1hMFkessDzjY1mtybzCjDwoBbrMB7Ft0HVts03ZD3y9TQlajNw68QFaHE2qA5oj1lSiigj7bSiNn48lcdKRApOrLmwAkpY7FTM8tMqeUq9nVg3GGtR11HSs2cg5W3YuWQkUgm0SGD+Mt0cVRmN8zVHZD2eCL0c=
Received: from MW4PR04CA0131.namprd04.prod.outlook.com (2603:10b6:303:84::16)
 by MW4PR12MB6974.namprd12.prod.outlook.com (2603:10b6:303:207::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Tue, 2 Aug
 2022 11:27:55 +0000
Received: from CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::1e) by MW4PR04CA0131.outlook.office365.com
 (2603:10b6:303:84::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Tue, 2 Aug 2022 11:27:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT039.mail.protection.outlook.com (10.13.174.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 11:27:55 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 06:27:51 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Mark Pearson <markpearson@lenovo.com>
Subject: [PATCH v3 09/11] platform/x86/amd/pmf: Handle AMT and CQL events for Auto mode
Date:   Tue, 2 Aug 2022 16:55:43 +0530
Message-ID: <20220802112545.2118632-10-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7315945a-377d-4f91-2fe4-08da747a0b62
X-MS-TrafficTypeDiagnostic: MW4PR12MB6974:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B9ooa46LnWHPuNTPYhlk/A6hSQou81WWyomXjRe6ihcAHwESSXg4njWd1Ui9mVOAQW4wRBHmmQCaLQoKhqOdPssH1pAB0FKyA0XS9bjgFcsmPDiFOIpsPVUE6HZC2rPBVNv5P57kTz4+UF0/z2aZSMqyS8Pmoyj+/Hn78yfCiAHQwUBnn2iKlhFWHxbTL/cgvkl3hpWy2K6yuokNEDVsl12S1VxoLp5L3ZHHr75khPSvJFQ6bjqG5It2f2s8ujoR+ENQ3BnvqQGAUwOMLTVB3tNsBDqrwyRsDD0HnlU7sOwAGjRBZDMYqoBrJTHSojNL+8zmqoha4yvRXwy0PNrSpBO4zrOUKxi9T5UPS/l/AeIuvLatupalhAoDtoqL0/umD8KzIW2HuElz6cwmyzlC0s7A9laj9mJ4MSQuxzJunMGa7RmcHPtbyCNe9+6k8PGTHsv3S3rjFU0VmQJWhlj0dQMhfKI4uAkbs8Cicp6Ryjyaws8ZDkjpgtzHSA170Y/FkUjS0z3YGav6P9NLqGBexg4Z4dqbrAzz+U0qHVgNgHVEnruQpeQF189EuRkyoVLL1lb8qtZz0hyLOee9BJ9iIFXrFcbrv7RcxPRnh6OV8DdhsOlINAXe1lInrUPhu2GKugA4d7BIfI5aWqLv8zor8+nzWieixJRwL8cd8iUPOEbrvrMuGIM0YmfN6nPV9GEyUSG8IYFszpLkeH4hVDpkhV/a4pv7je5Iwri3A9OHF2CLGzdPkHUu/AIZjJM4wk6D93Cn4gdt5pQYhJpHjK3XBlHltnrbI5fmQ2qDjnvAvc6zum6jONywWJfC710MSxVsJ23izfeFF3UUV36siVhJZpGqE2Go4+pEnuH/3EKP+LnqAiOOrr8w4bRoe8eQHscVeN8AO+Gc3Ew8QWVWp4msMA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(346002)(376002)(40470700004)(46966006)(36840700001)(83380400001)(7696005)(26005)(1076003)(2616005)(47076005)(16526019)(336012)(186003)(426003)(81166007)(86362001)(82740400003)(356005)(36860700001)(6666004)(36756003)(8936002)(5660300002)(70206006)(40460700003)(70586007)(8676002)(4326008)(966005)(40480700001)(82310400005)(41300700001)(478600001)(54906003)(2906002)(110136005)(316002)(36900700001)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 11:27:55.0287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7315945a-377d-4f91-2fe4-08da747a0b62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6974
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The transition to auto-mode happens when the PMF driver receives
AMT (Auto Mode transition) event. transition logic will reside in the
PMF driver but the events would come from other supported drivers[1].

The thermal parameters would vary between when a performance "on-lap" mode
is detected and versus when not. The CQL event would get triggered from
other drivers, so that PMF driver would adjust the system thermal config
based on the ACPI inputs.

OEMs can control whether or not to enable AMT or CQL via other supported
drivers[1] but the actual transition logic resides in the AMD PMF driver.
When an AMT event is received the automatic mode transition RAPL algorithm
will run. When a CQL event is received an performance "on-lap" mode will
be enabled and thermal parameters will be adjusted accordingly.

[1]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=review-hans&id=755b249250df1b612d982f3b702c831b26ecdf73

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mark Pearson <markpearson@lenovo.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c      | 64 ++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/auto-mode.c | 38 ++++++++++++++
 drivers/platform/x86/amd/pmf/core.c      |  9 ++++
 drivers/platform/x86/amd/pmf/pmf.h       | 22 ++++++++
 4 files changed, 133 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 200e31033d94..70084807a2e7 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -11,6 +11,9 @@
 #include <linux/acpi.h>
 #include "pmf.h"
 
+#define APMF_CQL_NOTIFICATION  2
+#define APMF_AMT_NOTIFICATION  3
+
 static union acpi_object *apmf_if_call(struct amd_pmf_dev *pdev, int fn, struct acpi_buffer *param)
 {
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
@@ -154,6 +157,47 @@ int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data
 	return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data, sizeof(*data));
 }
 
+int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req)
+{
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
+									 req, sizeof(*req));
+}
+
+static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
+{
+	struct amd_pmf_dev *pmf_dev = data;
+	struct apmf_sbios_req req;
+	int ret;
+
+	mutex_lock(&pmf_dev->update_mutex);
+	ret = apmf_get_sbios_requests(pmf_dev, &req);
+	if (ret) {
+		dev_err(pmf_dev->dev, "Failed to get SBIOS requests:%d\n", ret);
+		return;
+	}
+
+	if (req.pending_req & BIT(APMF_AMT_NOTIFICATION)) {
+		dev_dbg(pmf_dev->dev, "AMT is supported and notifications %s\n",
+			req.amt_event ? "Enabled" : "Disabled");
+		pmf_dev->amt_enabled = !!req.amt_event;
+	}
+
+	if (pmf_dev->amt_enabled)
+		amd_pmf_handle_amt(pmf_dev);
+	else
+		amd_pmf_reset_amt(pmf_dev);
+
+	if (req.pending_req & BIT(APMF_CQL_NOTIFICATION)) {
+		dev_dbg(pmf_dev->dev, "CQL is supported and notifications %s\n",
+			req.cql_event ? "Enabled" : "Disabled");
+
+		/* update the target mode information */
+		if (pmf_dev->amt_enabled)
+			amd_pmf_update_2_cql(pmf_dev, req.cql_event);
+	}
+	mutex_unlock(&pmf_dev->update_mutex);
+}
+
 static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
 {
 	struct apmf_verify_interface output;
@@ -195,12 +239,20 @@ static int apmf_get_system_params(struct amd_pmf_dev *dev)
 
 void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
 {
+	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
+
 	if (pmf_dev->hb_interval)
 		cancel_delayed_work_sync(&pmf_dev->heart_beat);
+
+	if (is_apmf_func_supported(pmf_dev, APMF_FUNC_AUTO_MODE) &&
+	    is_apmf_func_supported(pmf_dev, APMF_FUNC_SBIOS_REQUESTS))
+		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY, apmf_event_handler);
 }
 
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
 {
+	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
+	acpi_status status;
 	int ret;
 
 	ret = apmf_if_verify_interface(pmf_dev);
@@ -221,6 +273,18 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
 		schedule_delayed_work(&pmf_dev->heart_beat, 0);
 	}
 
+	/* Install the APMF Notify handler */
+	if (is_apmf_func_supported(pmf_dev, APMF_FUNC_AUTO_MODE) &&
+	    is_apmf_func_supported(pmf_dev, APMF_FUNC_SBIOS_REQUESTS)) {
+		status = acpi_install_notify_handler(ahandle,
+						     ACPI_ALL_NOTIFY,
+						     apmf_event_handler, pmf_dev);
+		if (ACPI_FAILURE(status)) {
+			dev_err(pmf_dev->dev, "failed to install notify handler\n");
+			return -ENODEV;
+		}
+	}
+
 out:
 	return ret;
 }
diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
index 99f5a2396b0b..4e4ec6023525 100644
--- a/drivers/platform/x86/amd/pmf/auto-mode.c
+++ b/drivers/platform/x86/amd/pmf/auto-mode.c
@@ -108,6 +108,21 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
 	}
 }
 
+void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event)
+{
+	int mode = config_store.current_mode;
+
+	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode =
+				   is_cql_event ? AUTO_PERFORMANCE_ON_LAP : AUTO_PERFORMANCE;
+
+	if ((mode == AUTO_PERFORMANCE || mode == AUTO_PERFORMANCE_ON_LAP) &&
+	    mode != config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode) {
+		mode = config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode;
+		amd_pmf_set_automode(dev, mode, NULL);
+	}
+	dev_dbg(dev->dev, "updated CQL thermals\n");
+}
+
 static void amd_pmf_get_power_threshold(void)
 {
 	config_store.transition[AUTO_TRANSITION_TO_QUIET].power_threshold =
@@ -249,6 +264,29 @@ void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev)
 	dev->socket_power_history_idx = -1;
 }
 
+void amd_pmf_reset_amt(struct amd_pmf_dev *dev)
+{
+	/*
+	 * OEM BIOS implementation guide says that if the auto mode is enabled
+	 * the platform_profile registration shall be done by the OEM driver.
+	 * There could be cases where both static slider and auto mode BIOS
+	 * functions are enabled, in that case enable static slider updates
+	 * only if it advertised as supported.
+	 */
+
+	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
+		u8 mode = amd_pmf_get_pprof_modes(dev);
+
+		dev_dbg(dev->dev, "resetting AMT thermals\n");
+		amd_pmf_update_slider(dev, SLIDER_OP_SET, mode, NULL);
+	}
+}
+
+void amd_pmf_handle_amt(struct amd_pmf_dev *dev)
+{
+	amd_pmf_set_automode(dev, config_store.current_mode, NULL);
+}
+
 void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev)
 {
 	cancel_delayed_work_sync(&dev->work_buffer);
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 42d803b49d97..4467d682cd11 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -99,6 +99,7 @@ static void amd_pmf_get_metrics(struct work_struct *work)
 	ktime_t time_elapsed_ms;
 	int socket_power;
 
+	mutex_lock(&dev->update_mutex);
 	/* Transfer table contents */
 	memset(dev->buf, 0, sizeof(dev->m_table));
 	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
@@ -108,8 +109,14 @@ static void amd_pmf_get_metrics(struct work_struct *work)
 	/* Calculate the avg SoC power consumption */
 	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
 
+	if (dev->amt_enabled) {
+		/* Apply the Auto Mode transition */
+		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
+	}
+
 	dev->start_time = ktime_to_ms(ktime_get());
 	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
+	mutex_unlock(&dev->update_mutex);
 }
 
 static inline u32 amd_pmf_reg_read(struct amd_pmf_dev *dev, int reg_offset)
@@ -329,6 +336,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	amd_pmf_dbgfs_register(dev);
 
 	mutex_init(&dev->lock);
+	mutex_init(&dev->update_mutex);
 	dev_info(dev->dev, "registered PMF device successfully\n");
 
 	return 0;
@@ -339,6 +347,7 @@ static int amd_pmf_remove(struct platform_device *pdev)
 	struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
 
 	mutex_destroy(&dev->lock);
+	mutex_destroy(&dev->update_mutex);
 	amd_pmf_deinit_features(dev);
 	apmf_acpi_deinit(dev);
 	amd_pmf_dbgfs_unregister(dev);
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 8c92cd6871df..cc88a02b488d 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -17,6 +17,7 @@
 /* APMF Functions */
 #define APMF_FUNC_VERIFY_INTERFACE			0
 #define APMF_FUNC_GET_SYS_PARAMS			1
+#define APMF_FUNC_SBIOS_REQUESTS			2
 #define APMF_FUNC_SBIOS_HEARTBEAT			4
 #define APMF_FUNC_AUTO_MODE					5
 #define APMF_FUNC_SET_FAN_IDX				7
@@ -63,6 +64,21 @@ struct apmf_system_params {
 	u32 heartbeat_int;
 } __packed;
 
+struct apmf_sbios_req {
+	u16 size;
+	u32 pending_req;
+	u8 rsd;
+	u8 cql_event;
+	u8 amt_event;
+	u32 fppt;
+	u32 sppt;
+	u32 fppt_apu_only;
+	u32 spl;
+	u32 stt_min_limit;
+	u8 skin_temp_apu;
+	u8 skin_temp_hs2;
+} __packed;
+
 struct apmf_fan_idx {
 	u16 size;
 	u8 fan_ctl_mode;
@@ -147,6 +163,8 @@ struct amd_pmf_dev {
 	ktime_t start_time;
 	int socket_power_history[AVG_SAMPLE_SIZE];
 	int socket_power_history_idx;
+	bool amt_enabled;
+	struct mutex update_mutex; /* protects race between ACPI handler and metrics thread */
 };
 
 struct apmf_sps_prop_granular {
@@ -307,5 +325,9 @@ int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data
 void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
+int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req);
 
+void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
+void amd_pmf_reset_amt(struct amd_pmf_dev *dev);
+void amd_pmf_handle_amt(struct amd_pmf_dev *dev);
 #endif /* PMF_H */
-- 
2.25.1

