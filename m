Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70519CCA47C
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Jul 2022 15:06:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233784AbiGLPGD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Jul 2022 11:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233985AbiGLPFe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Jul 2022 11:05:34 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFCC8C25A9
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2022 08:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0LKqTWFZ8yXTe5fchT6b386bPWb+E4SSGFZEaxjZ+vTDedQbFpY21quZgnTlInuaniVxNCGOwjlm/Hv6Sde3FpZcUAx9DoVATrNUuuPbMNqte/4OYr8mOtMqC2t5+hXr2RWB62eor4/YbcZXw2bmREkCkowETwdO4pry0y9vYlwX8lA5pozL6PVaquHuLC27lJodRu7O7GsDHbOE6850/57s1yoI1VYBwkwhQOWpBv069D74wgEU0lvLhqm4l+sc6NHGcQtT4DGYFvqfUFI91MdhOeJdCa0Tfz2vpmgLqSLw6INMjpqR5YNhLPfiSFIwGiebixKob5ssjhgdom5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vu+HuF67IG4JAfVJx9Zv+xylNLNEVAbYjE+3VYeTBjY=;
 b=GAV4fyZ0dJLQ5AsLQ93sthcMeC+QFXGeJ4IuFbe8a2lf6YGrtGR67RmiAoxSCVqBOdoqlEO0j4aS+IlB7nmDywmOblhnjgEGs7hq8RljjocsXIhFFZ9EX3D2chZRH8vrAlSIBraY0TNskPKWCD3NvlNrPHdo8Bk7PnUaNa0vycoYj7n88BF77axKlvYdUB8z+ZenWnG6EVGymw2q+siK+TrHQ8ivNwk7bmQEKdqE+1V0XdSiXakBfrpFZRqbGtGPOIJkSGoKkfkqdAggS1atsjJyurwQFqqvIFHahaFNwB6pT+O+wC89UATjyS5/qJw29ooU4vD87iax07BRAd+gSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vu+HuF67IG4JAfVJx9Zv+xylNLNEVAbYjE+3VYeTBjY=;
 b=B/PuIve2WE05Tkx9wrdBOKnJ6PTKz3D5hL1HRLcVUyVRBTwGmKndeQFnIT3rkSU0A+wXR+iGGxy3/5bbrtrxMXBRbf/Gd1LXoar9ZgQsmfFv6VydBW3X9VSKUbsIuZDfRMXxocgggXytt4mI9V/ovE6fKHFEdzAyq/S5DkHgMrw=
Received: from BN9PR03CA0713.namprd03.prod.outlook.com (2603:10b6:408:ef::28)
 by BY5PR12MB4260.namprd12.prod.outlook.com (2603:10b6:a03:206::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 15:00:17 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::e8) by BN9PR03CA0713.outlook.office365.com
 (2603:10b6:408:ef::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Tue, 12 Jul 2022 15:00:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 15:00:11 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 09:59:53 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v1 13/15] platform/x86/amd/pmf: Handle AMT and CQL events for Auto mode
Date:   Tue, 12 Jul 2022 20:28:45 +0530
Message-ID: <20220712145847.3438544-14-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: b5206451-0621-419a-d8e2-08da641738cd
X-MS-TrafficTypeDiagnostic: BY5PR12MB4260:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y2FVxBdnY4R1Y7Rerw2d3wrLM6hgb0GxmkYxVt2gYnZU2sIBq/V7jjyRBPeX5ckYYcsqZFHYszmRjPHt9HjZco8QMPITpfY999a0mVeBVblQ5x7+fHKxzLJGMQ3ZOwPrnbxRXPIZ6DRygRJtW3BRn6Nayf9EyzSqhOvh8xEZjcGgp49Ee8+ib/V/SwRJ+Rpotl/GO0Lr4GmBHN9jXtj54IWeoKIjXEgr2k7VzazUHXU9aJB9Xchc1wpd61y7Y1ijDMGH0uSEN0dwtmcA9PS/Ca0wcDxmBeW1qNqbTQkXIpNKByx9/l6SsLtGgM1B6SBkHbgBkfqfV8UJypw6kTR8mFBTbfA2VsgDJkCLdSWN2hqWaJqZrfoKJSUur0Neqm3nnt0t6af7ZcxgBVT/7mDaO1Pvm1xGuMGhHvj/qkW5HtItsSTOtV/TRMzlxR89m4pUgdODVSOM/Kis9Ux1neiNCshcNaisP+2PY1FfsvblzoiQ0egDU1FKzgmwmVHJvsgONryF9fsO2DyFcHmVRMbjtm3QcwA09G4hmqZjlFKEAJZiw5w2RFDpMW4BUE6ERuxdnPCWhfEj/1uN3YhwLuzxILKokJWwyLscbaZF3QaGZB/+Qf3vLTcV+Hau8IBM8L9JsBvmaMPfdjiIGrNvw+cED0WibdrB0ldnAP7jGLKEJZFQEgOoLGkmyaZGkIIG6aB3O7PI2hYeC/uoCyIIaLIU47O1RiEMtPzMYDNw8p7LoDR7yHUlFLnTg9kV1tmx26TpWz2B6D1Js7o48jkQqxNsaYFoPSzDo4vy5Nv2utUeCgNXOeiWPp5xtE9kvZdXCcY/lwaskTr0+QQet5qAgYrM5w61iXZmx7zpuL6AainZF23tEukpXFVY/PehWxjo8OiO1OqO5b4VnKmA+0CnK/R2Y+ebaaYC3K8DS8MPVQjvFc0=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(346002)(39860400002)(40470700004)(46966006)(36840700001)(30864003)(36860700001)(86362001)(83380400001)(8936002)(5660300002)(8676002)(82310400005)(4326008)(356005)(70586007)(70206006)(40460700003)(26005)(81166007)(186003)(316002)(7696005)(36756003)(110136005)(2906002)(478600001)(426003)(47076005)(336012)(1076003)(41300700001)(16526019)(40480700001)(966005)(6666004)(2616005)(54906003)(82740400003)(36900700001)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 15:00:11.8730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5206451-0621-419a-d8e2-08da641738cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4260
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

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c      | 90 +++++++++++++++++++++++-
 drivers/platform/x86/amd/pmf/auto-mode.c | 22 ++++++
 drivers/platform/x86/amd/pmf/cnqf.c      |  4 +-
 drivers/platform/x86/amd/pmf/core.c      | 18 ++++-
 drivers/platform/x86/amd/pmf/pmf.h       | 29 +++++++-
 5 files changed, 156 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index e9f33e61659f..4bde86aeafa0 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -12,6 +12,8 @@
 #include "pmf.h"
 
 #define APMF_METHOD "\\_SB_.PMF_.APMF"
+#define APMF_CQL_NOTIFICATION	2
+#define APMF_AMT_NOTIFICATION	3
 
 static unsigned long supported_func;
 
@@ -55,6 +57,7 @@ static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
 {
 	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
 	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
+	func->sbios_requests = mask & APMF_FUNC_SBIOS_REQUESTS;
 	func->auto_mode_def = mask & APMF_FUNC_AUTO_MODE;
 	func->fan_table_idx = mask & APMF_FUNC_SET_FAN_IDX;
 	func->dyn_slider_ac = mask & APMF_FUNC_DYN_SLIDER_GRANULAR_AC;
@@ -292,6 +295,36 @@ int apmf_get_dyn_slider_def_dc(struct apmf_if *ampf_if, struct apmf_dyn_slider_o
 	return err;
 }
 
+int apmf_get_sbios_requests(struct apmf_if *ampf_if, struct apmf_sbios_req *req)
+{
+	union acpi_object *info;
+	size_t size;
+	int err = 0;
+
+	info = apmf_if_call(ampf_if, APMF_FUNC_SBIOS_REQUESTS, NULL);
+	if (!info)
+		return -EIO;
+
+	size = *(u16 *)info->buffer.pointer;
+
+	if (size < sizeof(union acpi_object)) {
+		pr_err("PMF: buffer too small %zu\n", size);
+		err = -EINVAL;
+		goto out;
+	}
+
+	size = min(sizeof(*req), size);
+	memset(req, 0, sizeof(*req));
+	memcpy(req, info->buffer.pointer, size);
+
+	pr_debug("PMF: %s: pending_req:%d cql:%d amt:%d\n", __func__,
+		 req->pending_req, req->cql_event, req->amt_event);
+
+out:
+	kfree(info);
+	return err;
+}
+
 static acpi_handle apmf_if_probe_handle(void)
 {
 	acpi_handle handle = NULL;
@@ -312,18 +345,62 @@ static acpi_handle apmf_if_probe_handle(void)
 	return handle;
 }
 
+static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
+{
+	struct amd_pmf_dev *pmf_dev = data;
+	struct apmf_if *apmf_if = pmf_dev->apmf_if;
+	int ret;
+
+	if (apmf_if->func.sbios_requests) {
+		struct apmf_sbios_req req;
+
+		ret = apmf_get_sbios_requests(apmf_if, &req);
+		if (ret) {
+			dev_err(pmf_dev->dev, "Failed to get SBIOS requests:%d\n", ret);
+			return;
+		}
+		if (req.pending_req & BIT(APMF_AMT_NOTIFICATION)) {
+			pr_debug("PMF: AMT is supported and notifications %s\n",
+				 req.amt_event ? "Enabled" : "Disabled");
+			if (req.amt_event)
+				pmf_dev->is_amt_event = true;
+			else
+				pmf_dev->is_amt_event = !!req.amt_event;
+		}
+
+		if (req.pending_req & BIT(APMF_CQL_NOTIFICATION)) {
+			pr_debug("PMF: CQL is supported and notifications %s\n",
+				 req.cql_event ? "Enabled" : "Disabled");
+			if (req.cql_event)
+				pmf_dev->is_cql_event = true;
+			else
+				pmf_dev->is_cql_event = !!req.cql_event;
+
+			/* update the target mode information */
+			amd_pmf_update_2_cql(pmf_dev);
+		}
+	}
+}
+
 void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
 {
+	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
+
 	if (pmf_dev->apmf_if->func.sbios_heartbeat)
 		cancel_delayed_work_sync(&pmf_dev->heart_beat);
+
+	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE))
+		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY,
+					   apmf_event_handler);
 }
 
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
 {
+	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
 	struct apmf_notification_cfg *n;
 	acpi_handle apmf_if_handle;
 	struct apmf_if *apmf_if;
-	int ret;
+	int ret, status;
 
 	apmf_if_handle = apmf_if_probe_handle();
 	if (!apmf_if_handle)
@@ -360,6 +437,17 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
 		schedule_delayed_work(&pmf_dev->heart_beat, 0);
 	}
 
+	/* Install the APMF Notify handler */
+	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE)) {
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
index 954fde25e71e..a85ef4b95cdb 100644
--- a/drivers/platform/x86/amd/pmf/auto-mode.c
+++ b/drivers/platform/x86/amd/pmf/auto-mode.c
@@ -111,6 +111,13 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
 	bool update = false;
 	int i, j;
 
+	if (!dev->amt_running && dev->is_amt_event) {
+		dev_dbg(dev->dev, "setting AMT thermals\n");
+		amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
+		dev->amt_running = true;
+		return;
+	}
+
 	/* Get the average moving average computed by auto mode algorithm */
 	avg_power = amd_pmf_get_moving_avg(socket_power);
 
@@ -161,6 +168,21 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
 	}
 }
 
+void amd_pmf_update_2_cql(struct amd_pmf_dev *dev)
+{
+	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode =
+			dev->is_cql_event ? AUTO_PERFORMANCE_ON_LAP : AUTO_PERFORMANCE;
+	if ((config_store.current_mode == AUTO_PERFORMANCE ||
+	     config_store.current_mode == AUTO_PERFORMANCE_ON_LAP) &&
+	    config_store.current_mode !=
+	    config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode) {
+		config_store.current_mode =
+				config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode;
+		amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
+	}
+	dev_dbg(dev->dev, "updated CQL thermals\n");
+}
+
 static void amd_pmf_get_power_threshold(void)
 {
 	config_store.transition[AUTO_TRANSITION_TO_QUIET].power_threshold =
diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
index 2b03ae1ad37f..eba8f0d79a62 100644
--- a/drivers/platform/x86/amd/pmf/cnqf.c
+++ b/drivers/platform/x86/amd/pmf/cnqf.c
@@ -101,7 +101,7 @@ static const char *state_as_str(unsigned int state)
 	}
 }
 
-void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms)
+void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms)
 {
 	struct cnqf_tran_params *tp;
 	int src, i, j, index = 0;
@@ -117,7 +117,7 @@ void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_
 	}
 
 	for (i = 0; i < CNQF_TRANSITION_MAX; i++) {
-		config_store.trans_param[src][i].timer += time_lapsed_ms;
+		config_store.trans_param[src][i].timer += time_elapsed_ms;
 		config_store.trans_param[src][i].total_power += socket_power;
 		config_store.trans_param[src][i].count++;
 
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 674ddf599135..2a3dacfb2005 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -109,10 +109,15 @@ static void amd_pmf_get_metrics(struct work_struct *work)
 	enum platform_profile_option current_profile;
 	ktime_t time_elapsed_ms;
 	int socket_power;
+	u8 mode;
 
 	/* Get the current profile information */
 	platform_profile_get(&current_profile);
 
+	if (!dev->is_amt_event)
+		dev_dbg(dev->dev, "%s amt event: %s\n", __func__,
+			dev->is_amt_event ? "Enabled" : "Disabled");
+
 	/* Transfer table contents */
 	memset(&dev->m_table, 0, sizeof(dev->m_table));
 	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
@@ -123,8 +128,17 @@ static void amd_pmf_get_metrics(struct work_struct *work)
 	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
 
 	if (current_profile == PLATFORM_PROFILE_BALANCED) {
-		/* Apply the Auto Mode transition */
-		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
+		if (dev->is_amt_event) {
+			/* Apply the Auto Mode transition */
+			amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
+		} else if (!dev->is_amt_event && dev->amt_running) {
+			pr_debug("resetting AMT thermals\n");
+			mode = amd_pmf_get_pprof_modes(dev);
+			amd_pmf_update_slider(dev, SLIDER_OP_SET, mode, NULL);
+			dev->amt_running = false;
+		}
+	} else {
+		dev->amt_running = false;
 	}
 
 	if (dev->cnqf_feat) {
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 0532f49e9613..9ae9812353cd 100644
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
@@ -51,6 +52,7 @@
 /* AMD PMF BIOS interfaces */
 struct apmf_if_functions {
 	bool system_params;
+	bool sbios_requests;
 	bool sbios_heartbeat;
 	bool auto_mode_def;
 	bool fan_table_idx;
@@ -84,6 +86,24 @@ struct apmf_system_params {
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
+	u8 dps_enable;
+	u32 custom_policy_1;
+	u32 custom_policy_2;
+} __packed;
+
 struct apmf_fan_idx {
 	u16 size;
 	u8 fan_ctl_mode;
@@ -171,6 +191,9 @@ struct amd_pmf_dev {
 #endif /* CONFIG_DEBUG_FS */
 	bool cnqf_feat;
 	bool cnqf_running;
+	bool is_amt_event;
+	bool is_cql_event;
+	bool amt_running;
 };
 
 struct apmf_sps_prop_granular {
@@ -417,9 +440,11 @@ int apmf_update_fan_idx(struct apmf_if *ampf_if, bool manual, u32 idx);
 /* Auto Mode Layer */
 void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev);
 int apmf_get_auto_mode_def(struct apmf_if *ampf_if, struct apmf_auto_mode *data);
+int apmf_get_sbios_requests(struct apmf_if *ampf_if, struct apmf_sbios_req *req);
 void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
-void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
+void amd_pmf_update_2_cql(struct amd_pmf_dev *dev);
+void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
 
 /* CnQF Layer */
 int apmf_get_dyn_slider_def_ac(struct apmf_if *ampf_if, struct apmf_dyn_slider_output *data);
@@ -427,6 +452,6 @@ int apmf_get_dyn_slider_def_dc(struct apmf_if *ampf_if, struct apmf_dyn_slider_o
 void amd_pmf_init_cnqf(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev);
 void amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev);
-void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
+void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
 
 #endif /* PMF_H */
-- 
2.25.1

