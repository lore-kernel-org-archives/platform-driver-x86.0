Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B4CC00140
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 15:14:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234624AbiHBPOE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 11:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234780AbiHBPOD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 11:14:03 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2053.outbound.protection.outlook.com [40.107.96.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73FB15A3C
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 08:14:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FfUtz2gtJY5LH7yrOTkbOgihw2VFFRK8bgbZ5GsTzFah9m7jtuA6P1eSB/13vmmoWBcDnYOPDdHXe2+3gyRvRQIBkfGUkkq4eVQrdZUUBbRSqfSdmAS8HatumQHCcWZxvv61nN9AWqCHd+4MniNCdNljBXVfdjQdYgD1b70TXopRuoB7EA07LjgFvY0uNae+KeZ4Uc6cgBx4lLxm4+YxNgQ9y9yXky2rucMn+8rf5U5zSnRmalM2dlizqdPugAPcb5Tk1CYTuu0hQ6Ie4oUPekEGm2Od9qwlCV3RBQz2/q01d0nAdXuB1vLbOuqF7HNKvBbSlWRhlqdR286LRhQFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ofW5aSOFfv9LFBelA88WEGf3WZJ/utmX1F3pEdlGPg=;
 b=V088yiPZTXHHLSJDLYZeMYDXEcU+PYLdqcx6jHM9FKxXtFLd+1dWLadFFhHt64QSZKKLicbt4GyaW4TtCOQXiDd5QzBGel8n+UwWpjr87IWURy9rZFEKcxaYZ0++TqzT0K4WCPex6rZQbEqlr17y+1MYekiWmRrGGfzimBBvRy2Abo6zaFtVlEu4t31urhdTPXWJTXZh36kS2Wh8C0KtL0upHE8VCJIKv1oY7Co8l6c0Xqes9BfmnAaP8J+HTkAwpcmi7tq+bQSGcnclYhgHYMbVHeGKEPLa8urntYqjC5b7d7uRosl8s7Wb7a9wZF/y2fFZCTimu5722SzOZGGgzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ofW5aSOFfv9LFBelA88WEGf3WZJ/utmX1F3pEdlGPg=;
 b=XcLx1EY+2a2RySjM73rz8whlxrJbCSiXBpEL3avz3tXwFvM0VYsoNUxSmG3doQnS0ZgXVCELwHB45j1Ns1J1qbRN6X1ygcnphA10YwtuJToL4P1xi6KveE+kjTk7SqVQpCVW99ZBjXpmAqBuTCHhgUCrXEdfbASnLYjKmH1EvbQ=
Received: from BN9PR03CA0142.namprd03.prod.outlook.com (2603:10b6:408:fe::27)
 by SJ1PR12MB6099.namprd12.prod.outlook.com (2603:10b6:a03:45e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.15; Tue, 2 Aug
 2022 15:13:59 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::bb) by BN9PR03CA0142.outlook.office365.com
 (2603:10b6:408:fe::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25 via Frontend
 Transport; Tue, 2 Aug 2022 15:13:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 15:13:59 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 10:13:55 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Mark Pearson <markpearson@lenovo.com>
Subject: [PATCH v4 09/11] platform/x86/amd/pmf: Handle AMT and CQL events for Auto mode
Date:   Tue, 2 Aug 2022 20:41:47 +0530
Message-ID: <20220802151149.2123699-10-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9cbc5eeb-5633-4811-c798-08da7499a06a
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6099:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8xPeNGwFUaGFxEOlgHWCXxtp4LKKMCqbMJgTEPLp74xTh5VAsdlRwPq3nP0RKiSUEbkb3GxvKD19pL0zkYNAZb0yATOTro3/xqPnLlFh7GE9ydQIwlNOpKZcUmZeoSdN4NzFPm0pliDbVf54s7mYG6ZBVViXz5pqcsbO5bSr2bnLAkEv2hW2IgqsE2ESCdKONJX592fBgBwM/TlRZ4x0n6L7wmlHwbBjdUHC2A8w66V3AdHOhXfNAH0ZLaNY8sHIUHfJ3AaMG6XRnNqm896Hbq3j3kDfl8LmBx6t9WfKOjBCeL0VgDLGpSShlttaap/Ejf4uykAw2RWCEffm5CqpEeO7kdZVuFBVGhnl0IyoWZ6oaDv+kecMDK8YcMbb+LHG8gwlkHnu0KYiCPx1dH5zSt1D8BYJG8kfl63U7hOrZhy4QWHK6NrdludR0HwWmY8WwNrPgeoZiY/0FIAvHIdFvqHuXZJNQWd79NeC0VgR+uMC3Enl3VTKnc0bOHPf9jbrVeSV3nR6oZMoaDBHw9g+b5rehRtmklyp1qaI1u5a4GWUYcl0mHTojBp4DohqdgvqJRmC9mpFkrZzW2XqeKILi5KAtN2kWWd5WkJeS83w5gHv4bq/RkWfZc7HGNJwe2K0ZzovEuIukMaeDHNX8nIpBWMq2ww1pJLafdtDPy7JT+Mjs/nRN6qT94T77YcMGChtljaXY4xkNjOPxTERGXBKh4npWctfhu2LTBePK1ZyeeieYlPD60flQeh6ogJE8CbHQo1UL3CA4CgtkQQs8BPCXRbfbqImoQCY+Rw7Mi/1BcKwv5QQohFCKZsrHKFByRQkN/eKa6wJOgQEv7BPVIiRtc7krV1cHyd1fiXhNViH65Qmu0sJY9hPDbxRLnOoru66gO+1L/B0jp+9vcHr+h6FNQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39860400002)(376002)(136003)(46966006)(36840700001)(40470700004)(54906003)(86362001)(2906002)(40460700003)(81166007)(356005)(966005)(478600001)(41300700001)(6666004)(7696005)(82310400005)(110136005)(82740400003)(316002)(70206006)(70586007)(4326008)(8676002)(40480700001)(5660300002)(83380400001)(36860700001)(2616005)(26005)(426003)(336012)(8936002)(47076005)(16526019)(186003)(1076003)(36756003)(36900700001)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 15:13:59.5892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbc5eeb-5633-4811-c798-08da7499a06a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6099
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
 drivers/platform/x86/amd/pmf/acpi.c      | 66 ++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/auto-mode.c | 38 ++++++++++++++
 drivers/platform/x86/amd/pmf/core.c      |  9 ++++
 drivers/platform/x86/amd/pmf/pmf.h       | 22 ++++++++
 4 files changed, 135 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 401fee381e90..24d269bef92b 100644
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
@@ -149,6 +152,47 @@ int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data
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
+
+		if (pmf_dev->amt_enabled)
+			amd_pmf_handle_amt(pmf_dev);
+		else
+			amd_pmf_reset_amt(pmf_dev);
+	}
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
@@ -190,12 +234,20 @@ static int apmf_get_system_params(struct amd_pmf_dev *dev)
 
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
@@ -216,6 +268,20 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
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
+		/* Call the handler once manually to catch up with possibly missed notifies. */
+		apmf_event_handler(ahandle, 0, pmf_dev);
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
index ce092a529261..4078665c8e06 100644
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
@@ -303,5 +321,9 @@ int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data
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

