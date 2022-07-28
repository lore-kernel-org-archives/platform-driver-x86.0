Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E68C04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 18:21:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232059AbiG1SVU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 14:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231688AbiG1SVR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 14:21:17 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E5121C10C
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 11:21:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMnL/EE6UYYYNQxRFk8PM0upQ3BPuCBQhjP4AoaxCKhXfcryDW1bCFdm3mmp9HJ6N+1u3npw7gnLa/V8tqLsa8ElvNhO3qns5Sw3TxT3sjyU+6/lLTJrvIYB1l1CjYGIJkytFsgdtxa7QIm88skQBJLBttxoCYeDQN4W8GiqlHza55IOYrfiUMDutNygN8s+0JCOrFuT5XJEFHAzelbtZ/U/tvU0H5BChqkOBVmKezUCEFJ4YkCZDd6haY+MzSDWNBjl9kRuyVK3EzkL8pQfucYBMvyW23NyznC8h5V1hL4YM+OBteXLeyJzBH7twveeAUo1McLORsDTNoTITx7FJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyNGrQeIcKge7ThhnUvr5gb7tKsTz/W0hH2cVwoME7o=;
 b=FbOI4W6vIdsIYTgVwamBMlfs2qohMna5JPFux9K1B2Feu9zfNdqH1hm+9TeJXx6BQwBviLpMIys3WI5LC7o3uVyKOU/ND7CYjayq6FJJXu/5Tnc1LGesuQolPCuPVDFkhKiypX+XuZRA5pZZMycEonYWaCvmtQTFKyyQMErlf7LEbKGaW+JV0+0VC7Py+BcfmM9jyxrfrEOEXUnrxCPLn7UImI7yD+ZiixhK4TbR7/8VOeVouIC1LbiWwvmWe+tArL9RVLXjViDE+18TeyhnfE7BayHZ3S7QdiTr8fTmPYQWdHTKoTBynAozW7iF81Znpba6PkUykecP2ZUy+dsN5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyNGrQeIcKge7ThhnUvr5gb7tKsTz/W0hH2cVwoME7o=;
 b=w/GRAhCkS0DxbT+ZXHc4uMQjNGCElLcAYTWViyjUVgBd3bsPq5x8HtE0x/BNHvvHKUIRaNS+2xybzlpXj47mCCim1308T9mF3R1OGMpG0FW7lfFFePdi81dLLY/0vpJFbJZVVH0x5JCPAh5pIGkvHoW7xI7WBaaDtf3EAweSCOg=
Received: from BN9P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::23)
 by CY4PR1201MB0071.namprd12.prod.outlook.com (2603:10b6:910:1f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 18:21:13 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::67) by BN9P222CA0018.outlook.office365.com
 (2603:10b6:408:10c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.7 via Frontend
 Transport; Thu, 28 Jul 2022 18:21:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 18:21:12 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 13:21:09 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Mark Pearson <markpearson@lenovo.com>
Subject: [PATCH v2 RESEND 09/11] platform/x86/amd/pmf: Handle AMT and CQL events for Auto mode
Date:   Thu, 28 Jul 2022 23:50:26 +0530
Message-ID: <20220728182028.2082096-10-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36cd4f50-256e-41b9-51a5-08da70c5f3d6
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0071:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tmcsX6FIYZzLx/97ACQj9lFDqvz9hX2WIDW+QuRh5zwqKuqrthNqQO19v2G/mN2a+No0G+J4HHZMsNWgWns5SZku0P93EMY+g7cJk7YvJSorKNKIQSgcn7EJ0zoTQZsryBHwLGdvexVAlu5gm11mP3bTb+WjbvnmQqHsjxGDMCzCOlMuHnqnxJf+j1nR7rTj7empG3nGvqEY//STpV04A0idGylTydLlXnDUcy3r0nsV+A56Uh+5nPgpCSlEdNzz4KnSevmFhq7v0ZGtmmZhcScahrg2imLlruV3HQ11QcyxK4IZUIGYt24Vm0Qs+e0acMHNvh3VwK15v5WDV1FOEJp9NBhuJZLyYQOOAYe5cpBYqMwjz9snl1xuML9f0qugSzVD5JVsG53iveb9Wc68EW49KroymnlKdr+lIj9kK077mlBSdK8Q+CZAAxlI8LywbueickclOniB2IrOvbuU8LZ7vQvbY1loKey8Jhan+jni9CThxORmG2dhldGieo9Javk7kW25OCJ7eoTNqxQOqZtGAPBV4Go4p6spNW7sVkzkqxTQww+T0Y6666p7M2TtVd6WDPvwHEANM9v1hXGeckVJ7RbFo/xeNxh2XpwqvT/4fO3UYn4QpzuTNpdes6ld6tmMZN0xGlaEMWvQj1ALxUBoB8g8D+NF+dBC/VdQFQU/J6km5k7pLFog1hqzEC5Mrc7ES56/empo/bEs3i8n5Z7UbE9qgM6HGsxvlmSTygxX7PpPTGuNKJtdUo3CuVHrAaxpQc8J2GaL5oryssrtf70DMJ3UN8JdC271MIF52EIzXb8/WhSzP2dpKyV652SG4jAXJOaP2hANSiIzsE0LnYZz/EcJpnV5JWfT209/O1UnwHnjm16dLg3VDzIsHtKfJ1eawGvCpSqhUjZUwGLIsQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(136003)(346002)(36840700001)(46966006)(40470700004)(70206006)(70586007)(4326008)(47076005)(8936002)(5660300002)(26005)(8676002)(426003)(40460700003)(966005)(336012)(40480700001)(478600001)(316002)(82740400003)(16526019)(86362001)(6666004)(36756003)(41300700001)(54906003)(2616005)(81166007)(1076003)(186003)(2906002)(83380400001)(82310400005)(36860700001)(7696005)(356005)(110136005)(36900700001)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 18:21:12.7342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36cd4f50-256e-41b9-51a5-08da70c5f3d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0071
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
 drivers/platform/x86/amd/pmf/acpi.c      | 59 ++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/auto-mode.c | 22 +++++++++
 drivers/platform/x86/amd/pmf/core.c      | 32 +++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h       | 22 +++++++++
 4 files changed, 135 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 724150ec58fb..dedaebf18d88 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -12,6 +12,8 @@
 #include "pmf.h"
 
 #define APMF_METHOD "\\_SB_.PMF_.APMF"
+#define APMF_CQL_NOTIFICATION	2
+#define APMF_AMT_NOTIFICATION	3
 
 static unsigned long supported_func;
 
@@ -99,6 +101,7 @@ static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
 {
 	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
 	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
+	func->sbios_requests = mask & APMF_FUNC_SBIOS_REQUESTS;
 	func->auto_mode_def = mask & APMF_FUNC_AUTO_MODE;
 	func->fan_table_idx = mask & APMF_FUNC_SET_FAN_IDX;
 }
@@ -167,6 +170,44 @@ int apmf_get_auto_mode_def(struct apmf_if *apmf_if, struct apmf_auto_mode *data)
 					 data, sizeof(*data));
 }
 
+int apmf_get_sbios_requests(struct apmf_if *apmf_if, struct apmf_sbios_req *req)
+{
+	return apmf_if_call_store_buffer(apmf_if, APMF_FUNC_SBIOS_REQUESTS,
+									 req, sizeof(*req));
+}
+
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
+
+		if (req.pending_req & BIT(APMF_AMT_NOTIFICATION)) {
+			pr_debug("PMF: AMT is supported and notifications %s\n",
+				 req.amt_event ? "Enabled" : "Disabled");
+			pmf_dev->is_amt_event = !!req.amt_event;
+		}
+
+		if (req.pending_req & BIT(APMF_CQL_NOTIFICATION)) {
+			pr_debug("PMF: CQL is supported and notifications %s\n",
+				 req.cql_event ? "Enabled" : "Disabled");
+			pmf_dev->is_cql_event = !!req.cql_event;
+
+			/* update the target mode information */
+			amd_pmf_update_2_cql(pmf_dev);
+		}
+	}
+}
+
 static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *apmf_if)
 {
 	struct apmf_verify_interface output;
@@ -211,12 +252,19 @@ static int apmf_get_system_params(struct apmf_if *apmf_if)
 
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
@@ -256,6 +304,17 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
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
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index ef71f8326248..bfae779ccc23 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -93,6 +93,27 @@ int amd_pmf_get_power_source(void)
 		return POWER_SOURCE_DC;
 }
 
+static void amd_pmf_reset_amt(struct amd_pmf_dev *dev)
+{
+	pr_debug("resetting AMT thermals\n");
+	dev->amt_running = false;
+
+	/*
+	 * OEM BIOS implementation guide says that if the auto mode is enabled
+	 * the platform_profile registration shall be done by the OEM driver.
+	 * There could be cases where both static slider and auto mode BIOS
+	 * functions are enabled and we could end up in a race. To avoid that
+	 * add a protection and touch the static slider only if that's enabled
+	 * from the BIOS side.
+	 */
+
+	if (is_apmf_func_supported(APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
+		u8 mode = amd_pmf_get_pprof_modes(dev);
+
+		amd_pmf_update_slider(dev, SLIDER_OP_SET, mode, NULL);
+	}
+}
+
 static void amd_pmf_get_metrics(struct work_struct *work)
 {
 	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, work_buffer.work);
@@ -103,6 +124,9 @@ static void amd_pmf_get_metrics(struct work_struct *work)
 	/* Get the current profile information */
 	current_profile = READ_ONCE(dev->current_profile);
 
+	if (!dev->is_amt_event)
+		dev_dbg(dev->dev, "amt event: %s\n", dev->is_amt_event ? "Enabled" : "Disabled");
+
 	/* Transfer table contents */
 	memset(&dev->m_table, 0, sizeof(dev->m_table));
 	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
@@ -112,6 +136,14 @@ static void amd_pmf_get_metrics(struct work_struct *work)
 	/* Calculate the avg SoC power consumption */
 	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
 
+	if (dev->is_amt_event) {
+		/* Apply the Auto Mode transition */
+		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
+	} else if (!dev->is_amt_event && dev->amt_running) {
+		/* reset to other mode if we receive a AMT disable event */
+		amd_pmf_reset_amt(dev);
+	}
+
 	dev->start_time = ktime_to_ms(ktime_get());
 	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
 }
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 4618ddc5a662..0f8b25524845 100644
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
@@ -49,6 +50,7 @@
 /* AMD PMF BIOS interfaces */
 struct apmf_if_functions {
 	bool system_params;
+	bool sbios_requests;
 	bool sbios_heartbeat;
 	bool auto_mode_def;
 	bool fan_table_idx;
@@ -80,6 +82,21 @@ struct apmf_system_params {
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
@@ -161,6 +178,9 @@ struct amd_pmf_dev {
 	struct smu_pmf_metrics m_table;
 	struct delayed_work work_buffer;
 	ktime_t start_time;
+	bool is_amt_event;
+	bool is_cql_event;
+	bool amt_running;
 };
 
 struct apmf_sps_prop_granular {
@@ -320,5 +340,7 @@ int apmf_get_auto_mode_def(struct apmf_if *ampf_if, struct apmf_auto_mode *data)
 void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
+int apmf_get_sbios_requests(struct apmf_if *ampf_if, struct apmf_sbios_req *req);
+void amd_pmf_update_2_cql(struct amd_pmf_dev *dev);
 
 #endif /* PMF_H */
-- 
2.25.1

