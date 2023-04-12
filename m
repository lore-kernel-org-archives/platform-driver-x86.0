Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C42C77B6E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Apr 2023 10:53:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjDLKxK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Apr 2023 06:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjDLKxJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Apr 2023 06:53:09 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2086.outbound.protection.outlook.com [40.107.212.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA4C165B0
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Apr 2023 03:53:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZAFNQERCOs3J1PSHAY4KNj4VCnRpfCQmyZQ0zd77onYw55HGnBaGmutFNm2iC1AbgoKuFUVTJ5hpgYNrXPLj4QTZ8wkjJFNVnjIgzo/DtSz4aQONsBc4lOYi4upjSltLA+tQHBPphkOZpWN23pfGI38iQ1vkkJSjW1LXMx/tdvSbuZAUDsJ30qoQPazcZoiWO3Q+Q0OHUy7J4kenmNhlI/U36CoRDB0KEZZP4IaCp0OVqPRl+6YetnVDriaNxL7LYODozRHylVGSJbgDJ4/MSpZOGkIKXkuEackg3gJ8Lj2rA9DuGAodVvtERqnt+AZCeSJuU5jJRgogDd/jeGrBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNKAdlRfFD2MU3+4YHfms6TWP0RKFQVsDLor/FOJ+nw=;
 b=FjI1kxd7icTsSCqPmawedsd12I6x1uz52DS2Wom4jK0aqylnblXMna+6Du+LgLUFZFqLo0EYnHXBbKI+HPvEZonJhH6tE7pkaNTmQ909AKfy/KfXtvvlPDY8Oeqx71BoSVXR02Hpy/00FX53HYFA20l7ScFigaC5OTuukYxUvEr/9n9VEmIRWNrQvmI/aLEaQBxZUa/TbdjmAE3uXePtdbUw2HUvD43pi/sLNM+/iNxvdZ5+cVWz1YsofnAIBMKOwJHtz1G9omlrWp/sL7zRjwnbVig/ia29pasp/IdqclrF/B4sRpv817npZLo5E+/qi+xhE4pQpNa3sZ2hblZ+9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNKAdlRfFD2MU3+4YHfms6TWP0RKFQVsDLor/FOJ+nw=;
 b=1gJ2DB0LVp1mH+UH65OZWroMl7+zlYcHUSlxHBKe4aMzCxylBFz6UqAy24CaQV81DlXslTv0o9FRfgzSGeSEWlqTLaMbIhPqWaIJT1ABaErOwhKMQMR5o14zcSLvbwkUDX4AZ23W71qJFavIyfOAfVVQfwKY0OTtZPk36cfGjFY=
Received: from BN0PR04CA0029.namprd04.prod.outlook.com (2603:10b6:408:ee::34)
 by SJ2PR12MB8112.namprd12.prod.outlook.com (2603:10b6:a03:4f8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Wed, 12 Apr
 2023 10:53:04 +0000
Received: from BL02EPF000145BB.namprd05.prod.outlook.com
 (2603:10b6:408:ee:cafe::66) by BN0PR04CA0029.outlook.office365.com
 (2603:10b6:408:ee::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30 via Frontend
 Transport; Wed, 12 Apr 2023 10:53:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000145BB.mail.protection.outlook.com (10.167.241.211) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.27 via Frontend Transport; Wed, 12 Apr 2023 10:53:03 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 12 Apr
 2023 05:53:01 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/2] platform/x86/amd/pmf: Add PMF acpi debug support
Date:   Wed, 12 Apr 2023 16:22:41 +0530
Message-ID: <20230412105242.2602148-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000145BB:EE_|SJ2PR12MB8112:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa9a22a-cf9f-4182-b8a4-08db3b44175c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ptv6v9Nn4Q2OUn+W19pV3gJfxzR8rBfOQyb1REr4KypiynnLGT4xehx/f1iahS70diCFjDmVWGASI8GVK8PtY7t2mOLpnMN1SqQuF7OvHoSXd2Jh7eIugO4KnobJJHYQA9cuWdJdLELAdMSWjXMMNLBRLF+EWz8kH7ZgQjTsqbnhm65ZrN1ILb3bcDMURuX+EqtmHIPZ9H5XQ4hUWbndTRCSXHKw3ThZX5hfYkuK7+uN7Yf7h1VJfrLAl5D1/nXZwbHmLX8gf+Mb1ffc86uWcSjTFe5Cd279Br/t4grwZrvdr0MUA2MyqRN3LokZaHf22ReR9kW+j/oJX8JRGKGXxshXPHKaN3kVIZUF9iJ/j81Nje/Q+ljk9jKeMq62o1lh4cOsSEvgQNBEuTFqMpjHE+h1KPhkSL9O3kaKYAXmLqvn8fbwtfOC+2GGLhZga+ivt1c6dDTtcNuflGUnnHTi7ckl/YximoXnLzL9MQRAosqhN6OYecF6admk4nwE+dRryrqBM+qaUTTQ0CMXzw5waPlccGSJRpwAumzYi6yvU+tEwE3LqtuvvkCe/5qar9PLGOsS8DHtCCpkNlt9ovNzZi+Gv6Bf4iiXKwLg0AjQacxfRK1xH6jEghK3xgIOM+Br8O77682ND1M9iMBVybymzjmZq+9lnGpKAvyIu4zI/OK/+KLcenAuX8Fpql/og/2Bdl/4Bnu1vEfxrHGgRFvf4WVTiTEEAv3fCCO4meAxbiY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199021)(46966006)(36840700001)(40470700004)(7696005)(6666004)(478600001)(26005)(110136005)(5660300002)(186003)(54906003)(316002)(30864003)(2906002)(336012)(16526019)(70206006)(70586007)(8676002)(4326008)(82310400005)(41300700001)(8936002)(426003)(356005)(86362001)(82740400003)(81166007)(47076005)(40460700003)(1076003)(40480700001)(36756003)(83380400001)(36860700001)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 10:53:03.8355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa9a22a-cf9f-4182-b8a4-08db3b44175c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000145BB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8112
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PMF driver maintains an internal config store for each PMF feature
after the feature init happens. Having a debug mechanism to triage
in-field issues w.r.t to mode switch not happening based on the OEM
fed values via the ACPI method to PMF driver is becoming the need of
the hour. Add support to get more ACPI debug spew guarded by a CONFIG.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2:
 - Based on review-hans branch
 - use a pointer and not create a local copy while dumping
 - use dummy #else blocks

 drivers/platform/x86/amd/pmf/Kconfig     |  11 +++
 drivers/platform/x86/amd/pmf/auto-mode.c | 118 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/cnqf.c      |  61 +++++++++++-
 drivers/platform/x86/amd/pmf/sps.c       |  55 +++++++++++
 4 files changed, 243 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index d87986adf91e..3064bc8ea167 100644
--- a/drivers/platform/x86/amd/pmf/Kconfig
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -16,3 +16,14 @@ config AMD_PMF
 
 	  To compile this driver as a module, choose M here: the module will
 	  be called amd_pmf.
+
+config AMD_PMF_DEBUG
+	bool "PMF debug information"
+	depends on AMD_PMF
+	help
+	 Enabling this option would give more debug information on the OEM fed
+	 power setting values for each of the PMF feature. PMF driver gets this
+	 information after evaluating a ACPI method and the information is stored
+	 in the PMF config store.
+
+	 Say Y here to enable more debug logs and Say N here if you are not sure.
diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
index 96a8e1832c05..557a962b48f9 100644
--- a/drivers/platform/x86/amd/pmf/auto-mode.c
+++ b/drivers/platform/x86/amd/pmf/auto-mode.c
@@ -15,6 +15,98 @@
 static struct auto_mode_mode_config config_store;
 static const char *state_as_str(unsigned int state);
 
+#ifdef CONFIG_AMD_PMF_DEBUG
+static void amd_pmf_dump_auto_mode_defaults(struct auto_mode_mode_config *data)
+{
+	struct auto_mode_mode_settings *its_mode;
+
+	pr_debug("Auto Mode Data - BEGIN\n");
+
+	/* time constant */
+	pr_debug("balanced_to_perf: %u\n",
+		 data->transition[AUTO_TRANSITION_TO_PERFORMANCE].time_constant);
+	pr_debug("perf_to_balanced: %u\n",
+		 data->transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].time_constant);
+	pr_debug("quiet_to_balanced: %u\n",
+		 data->transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].time_constant);
+	pr_debug("balanced_to_quiet: %u\n",
+		 data->transition[AUTO_TRANSITION_TO_QUIET].time_constant);
+
+	/* power floor */
+	pr_debug("pfloor_perf: %u\n", data->mode_set[AUTO_PERFORMANCE].power_floor);
+	pr_debug("pfloor_balanced: %u\n", data->mode_set[AUTO_BALANCE].power_floor);
+	pr_debug("pfloor_quiet: %u\n", data->mode_set[AUTO_QUIET].power_floor);
+
+	/* Power delta for mode change */
+	pr_debug("pd_balanced_to_perf: %u\n",
+		 data->transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta);
+	pr_debug("pd_perf_to_balanced: %u\n",
+		 data->transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta);
+	pr_debug("pd_quiet_to_balanced: %u\n",
+		 data->transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta);
+	pr_debug("pd_balanced_to_quiet: %u\n",
+		 data->transition[AUTO_TRANSITION_TO_QUIET].power_delta);
+
+	/* skin temperature limits */
+	its_mode = &data->mode_set[AUTO_PERFORMANCE_ON_LAP];
+	pr_debug("stt_apu_perf_on_lap: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
+	pr_debug("stt_hs2_perf_on_lap: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
+	pr_debug("stt_min_limit_perf_on_lap: %u\n", its_mode->power_control.stt_min);
+
+	its_mode = &data->mode_set[AUTO_PERFORMANCE];
+	pr_debug("stt_apu_perf: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
+	pr_debug("stt_hs2_perf: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
+	pr_debug("stt_min_limit_perf: %u\n", its_mode->power_control.stt_min);
+
+	its_mode = &data->mode_set[AUTO_BALANCE];
+	pr_debug("stt_apu_balanced: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
+	pr_debug("stt_hs2_balanced: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
+	pr_debug("stt_min_limit_balanced: %u\n", its_mode->power_control.stt_min);
+
+	its_mode = &data->mode_set[AUTO_QUIET];
+	pr_debug("stt_apu_quiet: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
+	pr_debug("stt_hs2_quiet: %u\n", its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
+	pr_debug("stt_min_limit_quiet: %u\n", its_mode->power_control.stt_min);
+
+	/* SPL based power limits */
+	its_mode = &data->mode_set[AUTO_PERFORMANCE_ON_LAP];
+	pr_debug("fppt_perf_on_lap: %u\n", its_mode->power_control.fppt);
+	pr_debug("sppt_perf_on_lap: %u\n", its_mode->power_control.sppt);
+	pr_debug("spl_perf_on_lap: %u\n", its_mode->power_control.spl);
+	pr_debug("sppt_apu_only_perf_on_lap: %u\n", its_mode->power_control.sppt_apu_only);
+
+	its_mode = &data->mode_set[AUTO_PERFORMANCE];
+	pr_debug("fppt_perf: %u\n", its_mode->power_control.fppt);
+	pr_debug("sppt_perf: %u\n", its_mode->power_control.sppt);
+	pr_debug("spl_perf: %u\n", its_mode->power_control.spl);
+	pr_debug("sppt_apu_only_perf: %u\n", its_mode->power_control.sppt_apu_only);
+
+	its_mode = &data->mode_set[AUTO_BALANCE];
+	pr_debug("fppt_balanced: %u\n", its_mode->power_control.fppt);
+	pr_debug("sppt_balanced: %u\n", its_mode->power_control.sppt);
+	pr_debug("spl_balanced: %u\n", its_mode->power_control.spl);
+	pr_debug("sppt_apu_only_balanced: %u\n", its_mode->power_control.sppt_apu_only);
+
+	its_mode = &data->mode_set[AUTO_QUIET];
+	pr_debug("fppt_quiet: %u\n", its_mode->power_control.fppt);
+	pr_debug("sppt_quiet: %u\n", its_mode->power_control.sppt);
+	pr_debug("spl_quiet: %u\n", its_mode->power_control.spl);
+	pr_debug("sppt_apu_only_quiet: %u\n", its_mode->power_control.sppt_apu_only);
+
+	/* Fan ID */
+	pr_debug("fan_id_perf: %lu\n",
+		 data->mode_set[AUTO_PERFORMANCE].fan_control.fan_id);
+	pr_debug("fan_id_balanced: %lu\n",
+		 data->mode_set[AUTO_BALANCE].fan_control.fan_id);
+	pr_debug("fan_id_quiet: %lu\n",
+		 data->mode_set[AUTO_QUIET].fan_control.fan_id);
+
+	pr_debug("Auto Mode Data - END\n");
+}
+#else
+static void amd_pmf_dump_auto_mode_defaults(struct auto_mode_mode_config *data) {}
+#endif
+
 static void amd_pmf_set_automode(struct amd_pmf_dev *dev, int idx,
 				 struct auto_mode_mode_config *table)
 {
@@ -140,6 +232,30 @@ static void amd_pmf_get_power_threshold(void)
 	config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_threshold =
 		config_store.mode_set[AUTO_PERFORMANCE].power_floor -
 		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta;
+
+#ifdef CONFIG_AMD_PMF_DEBUG
+	pr_debug("[AUTO MODE TO_QUIET] pt:%d pf:%d pd: %u",
+		 config_store.transition[AUTO_TRANSITION_TO_QUIET].power_threshold,
+		 config_store.mode_set[AUTO_BALANCE].power_floor,
+		 config_store.transition[AUTO_TRANSITION_TO_QUIET].power_delta);
+
+	pr_debug("[AUTO MODE TO_PERFORMANCE] pt:%d pf:%d pd: %u",
+		 config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_threshold,
+		 config_store.mode_set[AUTO_BALANCE].power_floor,
+		 config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta);
+
+	pr_debug("[AUTO MODE QUIET_TO_BALANCE] pt:%d pf:%d pd: %u",
+		 config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE]
+		 .power_threshold,
+		 config_store.mode_set[AUTO_QUIET].power_floor,
+		 config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta);
+
+	pr_debug("[AUTO MODE PERFORMANCE_TO_BALANCE] pt:%d pf:%d pd: %u",
+		 config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE]
+		 .power_threshold,
+		 config_store.mode_set[AUTO_PERFORMANCE].power_floor,
+		 config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta);
+#endif
 }
 
 static const char *state_as_str(unsigned int state)
@@ -262,6 +378,8 @@ static void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev)
 	/* set to initial default values */
 	config_store.current_mode = AUTO_BALANCE;
 	dev->socket_power_history_idx = -1;
+
+	amd_pmf_dump_auto_mode_defaults(&config_store);
 }
 
 int amd_pmf_reset_amt(struct amd_pmf_dev *dev)
diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
index 4beb22a19466..371762ce8446 100644
--- a/drivers/platform/x86/amd/pmf/cnqf.c
+++ b/drivers/platform/x86/amd/pmf/cnqf.c
@@ -13,6 +13,59 @@
 
 static struct cnqf_config config_store;
 
+#ifdef CONFIG_AMD_PMF_DEBUG
+static const char *state_as_str_cnqf(unsigned int state)
+{
+	switch (state) {
+	case APMF_CNQF_TURBO:
+		return "turbo";
+	case APMF_CNQF_PERFORMANCE:
+		return "performance";
+	case APMF_CNQF_BALANCE:
+		return "balance";
+	case APMF_CNQF_QUIET:
+		return "quiet";
+	default:
+		return "Unknown CnQF State";
+	}
+}
+
+static void amd_pmf_cnqf_dump_defaults(struct apmf_dyn_slider_output *data, int idx)
+{
+	int i;
+
+	pr_debug("Dynamic Slider %s Defaults - BEGIN\n", idx ? "DC" : "AC");
+	pr_debug("size: %u\n", data->size);
+	pr_debug("flags: %u\n", data->flags);
+
+	/* Time constants */
+	pr_debug("t_perf_to_turbo: %u\n", data->t_perf_to_turbo);
+	pr_debug("t_balanced_to_perf: %u\n", data->t_balanced_to_perf);
+	pr_debug("t_quiet_to_balanced: %u\n", data->t_quiet_to_balanced);
+	pr_debug("t_balanced_to_quiet: %u\n", data->t_balanced_to_quiet);
+	pr_debug("t_perf_to_balanced: %u\n", data->t_perf_to_balanced);
+	pr_debug("t_turbo_to_perf: %u\n", data->t_turbo_to_perf);
+
+	for (i = 0 ; i < CNQF_MODE_MAX ; i++) {
+		pr_debug("pfloor_%s: %u\n", state_as_str_cnqf(i), data->ps[i].pfloor);
+		pr_debug("fppt_%s: %u\n", state_as_str_cnqf(i), data->ps[i].fppt);
+		pr_debug("sppt_%s: %u\n", state_as_str_cnqf(i), data->ps[i].sppt);
+		pr_debug("sppt_apuonly_%s: %u\n", state_as_str_cnqf(i), data->ps[i].sppt_apu_only);
+		pr_debug("spl_%s: %u\n", state_as_str_cnqf(i), data->ps[i].spl);
+		pr_debug("stt_minlimit_%s: %u\n", state_as_str_cnqf(i), data->ps[i].stt_min_limit);
+		pr_debug("stt_skintemp_apu_%s: %u\n", state_as_str_cnqf(i),
+			 data->ps[i].stt_skintemp[STT_TEMP_APU]);
+		pr_debug("stt_skintemp_hs2_%s: %u\n", state_as_str_cnqf(i),
+			 data->ps[i].stt_skintemp[STT_TEMP_HS2]);
+		pr_debug("fan_id_%s: %d\n", state_as_str_cnqf(i), data->ps[i].fan_id);
+	}
+
+	pr_debug("Dynamic Slider %s Defaults - END\n", idx ? "DC" : "AC");
+}
+#else
+static void amd_pmf_cnqf_dump_defaults(struct apmf_dyn_slider_output *data, int idx) {}
+#endif
+
 static int amd_pmf_set_cnqf(struct amd_pmf_dev *dev, int src, int idx,
 			    struct cnqf_config *table)
 {
@@ -275,10 +328,14 @@ static int amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
 		if (!is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC + i))
 			continue;
 
-		if (i == POWER_SOURCE_AC)
+		if (i == POWER_SOURCE_AC) {
 			ret = apmf_get_dyn_slider_def_ac(dev, &out);
-		else
+			amd_pmf_cnqf_dump_defaults(&out, i);
+		} else {
 			ret = apmf_get_dyn_slider_def_dc(dev, &out);
+			amd_pmf_cnqf_dump_defaults(&out, i);
+		}
+
 		if (ret) {
 			dev_err(dev->dev, "APMF apmf_get_dyn_slider_def_dc failed :%d\n", ret);
 			return ret;
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index bed762d47a14..0a4d0549ea03 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -12,6 +12,60 @@
 
 static struct amd_pmf_static_slider_granular config_store;
 
+#ifdef CONFIG_AMD_PMF_DEBUG
+const char *slider_as_str(unsigned int state)
+{
+	switch (state) {
+	case POWER_MODE_PERFORMANCE:
+		return "PERFORMANCE";
+	case POWER_MODE_BALANCED_POWER:
+		return "BALANCED_POWER";
+	case POWER_MODE_POWER_SAVER:
+		return "POWER_SAVER";
+	default:
+		return "Unknown Slider State";
+	}
+}
+
+const char *source_as_str(unsigned int state)
+{
+	switch (state) {
+	case POWER_SOURCE_AC:
+		return "AC";
+	case POWER_SOURCE_DC:
+		return "DC";
+	default:
+		return "Unknown Power State";
+	}
+}
+
+static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *data)
+{
+	int i, j;
+
+	pr_debug("Static Slider Data - BEGIN\n");
+
+	for (i = 0; i < POWER_SOURCE_MAX; i++) {
+		for (j = 0; j < POWER_MODE_MAX; j++) {
+			pr_debug("--- Source:%s Mode:%s ---\n", source_as_str(i), slider_as_str(j));
+			pr_debug("SPL: %u mW\n", data->prop[i][j].spl);
+			pr_debug("SPPT: %u mW\n", data->prop[i][j].sppt);
+			pr_debug("SPPT_ApuOnly: %u mW\n", data->prop[i][j].sppt_apu_only);
+			pr_debug("FPPT: %u mW\n", data->prop[i][j].fppt);
+			pr_debug("STTMinLimit: %u mW\n", data->prop[i][j].stt_min);
+			pr_debug("STT_SkinTempLimit_APU: %u C\n",
+				 data->prop[i][j].stt_skin_temp[STT_TEMP_APU]);
+			pr_debug("STT_SkinTempLimit_HS2: %u C\n",
+				 data->prop[i][j].stt_skin_temp[STT_TEMP_HS2]);
+		}
+	}
+
+	pr_debug("Static Slider Data - END\n");
+}
+#else
+static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *data) {}
+#endif
+
 static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
 {
 	struct apmf_static_slider_granular_output output;
@@ -36,6 +90,7 @@ static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
 			idx++;
 		}
 	}
+	amd_pmf_dump_sps_defaults(&config_store);
 }
 
 void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
-- 
2.25.1

