Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4802BC7618D
	for <platform-driver-x86@archiver.kernel.org>; Thu,  6 Apr 2023 16:49:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239807AbjDFQtQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 6 Apr 2023 12:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239830AbjDFQtE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Apr 2023 12:49:04 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7829AD1A
        for <platform-driver-x86@vger.kernel.org>; Thu,  6 Apr 2023 09:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVzCnZgl2hRgH9vZ7JOFWxYBte/AvwINTiovUuwwKfFMitU+m2ZTpcIOf88QxLfVvjx3CF0YjzxYcPPsSrD9hOAiY2nPpouhbHwsa5vJhZ2oz80VsNSWyGqguvfqIDdN9bjzrd14uPBT1VzSLIfajrdVExWVqP8hBErsag+DQ5wmKQtnUzk7vkQgT6I8TtbZTgRZp7meg6jGKDkUPgVHKPUMllENPRbc0ORJ9wplG2RIce0yRGU9mVENv+18SSuvCFgH9qTp5mMDw0227DYrNVhOl59x/0tWUtbt/wSm6PSrPW/ca9JedJRLBLka+1uYrn7Jzel894VjJfiw4JB/sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQ+6OUgBav4SH7J+VUWtSwyypRBfRbcQwhjqlFKvzQQ=;
 b=KHejOxPPjBXktQMNnenhH3qeEKJbadJ73X7YCEkrqW12HkAWf9Eh/PRYFTM6zoFd291N+QB4WPPy1Hkr8EnjljFB0KaSmczKl7pBa5f1WZdTe3au1IqM8yhqfw+TR9iZSqGqHOvVyXwJV9T6YrHjabdVHjZ8bwbICIqK0x4tjIlqXGfVZg72PraIiJPxk7pE68eQN9NVTkzzQnwGUClRASxpDo8j2oFvWuu2llg1w2lDM3ZbInk3lIVU1N+KgUwWZHoZd7WCeIfD5qCbj2Lh9+qgHmE9iyuhoHwyA0YGc5Z0J98eSuMgldgh52eAd+Wxu/za+0ibupBoQ46QLExt9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQ+6OUgBav4SH7J+VUWtSwyypRBfRbcQwhjqlFKvzQQ=;
 b=kz6G7S1IOnbzcnIVHSWNk56RuVRcF0/nAq9bMZ/AqPQ457I5lT4bLbitPI6QijgYN3UYhIS9OGrmPnv83SJV/OkraAbFHFC7bat/+2ZLP4TrU6+wHh8UWzvkEqVKedQ+KIsD0rJXV1Lx6bA0fbaTzhlhvIg6OqqWpkaDpHwaOHk=
Received: from MW4P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::8)
 by DS7PR12MB5864.namprd12.prod.outlook.com (2603:10b6:8:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Thu, 6 Apr
 2023 16:48:57 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::78) by MW4P220CA0003.outlook.office365.com
 (2603:10b6:303:115::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31 via Frontend
 Transport; Thu, 6 Apr 2023 16:48:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.31 via Frontend Transport; Thu, 6 Apr 2023 16:48:56 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 6 Apr
 2023 11:48:50 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/3] platform/x86/amd/pmf: Add PMF acpi debug support
Date:   Thu, 6 Apr 2023 22:18:05 +0530
Message-ID: <20230406164807.50969-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230406164807.50969-1-Shyam-sundar.S-k@amd.com>
References: <20230406164807.50969-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT048:EE_|DS7PR12MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a1110a3-e536-4848-90b6-08db36bed042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jw+pcIFDAOfAbG6fJ4ECi4WZi6Cit4KtZp9Z4XpDopkFEOj5g1K3/w3YHwZSy0HXnxnmTO0mwrrN2GEsav7Oe318POPIYalwgf1SnxrgNPrwnnMNpasBwgK/KeO2OQVQXsSzcj5vbcwEjLJzjqs7ZrdMixdBGNOHUAERUn1GlPZm4gJ8vYie7q7ByBzXui7I+Y0XooqFXyR8MjiyluhCgkbqCYpqOkVCdNxJa0+Usb2y/7N/XgvCwjb+mPslp6EdfdaiahRyusGKYDqXu05I9gQRNyMXKTy7zej5vn90l+aCVwPm0xNbJ9ZGmxMIa2EBtNi8zdS99uXz0jEh7c7gZOXCCHkXepqmXEWsJqkOuUA+Toi3XqNYSWjQmHL3zYThjcz0mm4q43ptc+U1AJnS0bYz3CC5hguAxH18AI77cvMH+RDHMAeB4n60gPN2tD4/7T2mgBoIsgbQNbz8Cwb5EIZqSXeVAFKt2i5E/RThekULEj/CPglp43v6QC8A1vAwCAUs7lcTqC7mItwnA+w+GfSGipTXETrO6wKESwgB5IQYkmyzke0TApGx2JtFzWw9YS+VN8//I2RSA+EwYO1cq42JXJf3p/Ci7GbEs6wifattBqMorSnOdIKFku2UFUOveGp/WYR6BfeZeFXxgab4IIZpGYaBb3ZHkBggxaBh+RSBjNrka0/q1Ppfp1lbn52zrvK14yrmBE/FcDS9KalU1dRBVnfNXyAOPTorkj9PNUY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199021)(40470700004)(46966006)(36840700001)(40480700001)(41300700001)(356005)(70206006)(70586007)(5660300002)(316002)(110136005)(81166007)(8936002)(8676002)(4326008)(54906003)(82740400003)(426003)(336012)(36860700001)(16526019)(186003)(47076005)(6666004)(478600001)(7696005)(40460700003)(26005)(1076003)(2616005)(86362001)(30864003)(36756003)(82310400005)(2906002)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 16:48:56.7048
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1110a3-e536-4848-90b6-08db36bed042
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5864
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PMF driver maintains an internal config store for each PMF feature
after the feature init happens. Having a debug mechanism to triage
in-field issues w.r.t to mode switch not happening based on the OEM
fed values via the ACPI method to PMF driver is becoming the need of
the hour. Add support to get more ACPI debug spew guarded by a CONFIG.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Kconfig     |  11 +++
 drivers/platform/x86/amd/pmf/auto-mode.c | 120 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/cnqf.c      |  66 ++++++++++++-
 drivers/platform/x86/amd/pmf/sps.c       |  55 +++++++++++
 4 files changed, 250 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index 6d89528c3177..f4fd764e55a6 100644
--- a/drivers/platform/x86/amd/pmf/Kconfig
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -15,3 +15,14 @@ config AMD_PMF
 
 	  To compile this driver as a module, choose M here: the module will
 	  be called amd_pmf.
+
+config AMD_PMF_ACPI_DEBUG
+	bool "AMD PMF acpi debug"
+	depends on AMD_PMF
+	help
+	 Enabling this option would give more debug information on the OEM fed
+	 power setting values for each of the PMF feature. PMF driver gets this
+	 information after evaluating a ACPI method and the information is stored
+	 in the PMF config store.
+
+	 Say Y here to enable more debug logs and Say N here if you are not sure.
diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
index 96a8e1832c05..777490fcf8b9 100644
--- a/drivers/platform/x86/amd/pmf/auto-mode.c
+++ b/drivers/platform/x86/amd/pmf/auto-mode.c
@@ -15,6 +15,98 @@
 static struct auto_mode_mode_config config_store;
 static const char *state_as_str(unsigned int state);
 
+#ifdef CONFIG_AMD_PMF_ACPI_DEBUG
+static void amd_pmf_dump_auto_mode_defaults(struct auto_mode_mode_config data)
+{
+	struct auto_mode_mode_settings *auto_mode;
+
+	pr_debug("Auto Mode Data - BEGIN\n");
+
+	/* time constant */
+	pr_debug("balanced_to_perf: %u\n",
+		 config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE]
+		 .time_constant);
+	pr_debug("perf_to_balanced: %u\n",
+		 config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE]
+		 .time_constant);
+	pr_debug("quiet_to_balanced: %u\n",
+		 config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].time_constant);
+	pr_debug("balanced_to_quiet: %u\n",
+		 config_store.transition[AUTO_TRANSITION_TO_QUIET].time_constant);
+
+	/* power floor */
+	pr_debug("pfloor_perf: %u\n", config_store.mode_set[AUTO_PERFORMANCE].power_floor);
+	pr_debug("pfloor_balanced: %u\n", config_store.mode_set[AUTO_BALANCE].power_floor);
+	pr_debug("pfloor_quiet: %u\n", config_store.mode_set[AUTO_QUIET].power_floor);
+
+	/* Power delta for mode change */
+	pr_debug("pd_balanced_to_perf: %u\n",
+		 config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta);
+	pr_debug("pd_perf_to_balanced: %u\n",
+		 config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta);
+	pr_debug("pd_quiet_to_balanced: %u\n",
+		 config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta);
+	pr_debug("pd_balanced_to_quiet: %u\n",
+		 config_store.transition[AUTO_TRANSITION_TO_QUIET].power_delta);
+
+	/* skin temperature limits */
+	auto_mode = &config_store.mode_set[AUTO_PERFORMANCE_ON_LAP];
+	pr_debug("stt_apu_perf_on_lap: %u\n", auto_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
+	pr_debug("stt_hs2_perf_on_lap: %u\n", auto_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
+	pr_debug("stt_min_limit_perf_on_lap: %u\n", auto_mode->power_control.stt_min);
+
+	auto_mode = &config_store.mode_set[AUTO_PERFORMANCE];
+	pr_debug("stt_apu_perf: %u\n", auto_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
+	pr_debug("stt_hs2_perf: %u\n", auto_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
+	pr_debug("stt_min_limit_perf: %u\n", auto_mode->power_control.stt_min);
+
+	auto_mode = &config_store.mode_set[AUTO_BALANCE];
+	pr_debug("stt_apu_balanced: %u\n", auto_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
+	pr_debug("stt_hs2_balanced: %u\n", auto_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
+	pr_debug("stt_min_limit_balanced: %u\n", auto_mode->power_control.stt_min);
+
+	auto_mode = &config_store.mode_set[AUTO_QUIET];
+	pr_debug("stt_apu_quiet: %u\n", auto_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
+	pr_debug("stt_hs2_quiet: %u\n", auto_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
+	pr_debug("stt_min_limit_quiet: %u\n", auto_mode->power_control.stt_min);
+
+	/* SPL based power limits */
+	auto_mode = &config_store.mode_set[AUTO_PERFORMANCE_ON_LAP];
+	pr_debug("fppt_perf_on_lap: %u\n", auto_mode->power_control.fppt);
+	pr_debug("sppt_perf_on_lap: %u\n", auto_mode->power_control.sppt);
+	pr_debug("spl_perf_on_lap: %u\n", auto_mode->power_control.spl);
+	pr_debug("sppt_apu_only_perf_on_lap: %u\n", auto_mode->power_control.sppt_apu_only);
+
+	auto_mode = &config_store.mode_set[AUTO_PERFORMANCE];
+	pr_debug("fppt_perf: %u\n", auto_mode->power_control.fppt);
+	pr_debug("sppt_perf: %u\n", auto_mode->power_control.sppt);
+	pr_debug("spl_perf: %u\n", auto_mode->power_control.spl);
+	pr_debug("sppt_apu_only_perf: %u\n", auto_mode->power_control.sppt_apu_only);
+
+	auto_mode = &config_store.mode_set[AUTO_BALANCE];
+	pr_debug("fppt_balanced: %u\n", auto_mode->power_control.fppt);
+	pr_debug("sppt_balanced: %u\n", auto_mode->power_control.sppt);
+	pr_debug("spl_balanced: %u\n", auto_mode->power_control.spl);
+	pr_debug("sppt_apu_only_balanced: %u\n", auto_mode->power_control.sppt_apu_only);
+
+	auto_mode = &config_store.mode_set[AUTO_QUIET];
+	pr_debug("fppt_quiet: %u\n", auto_mode->power_control.fppt);
+	pr_debug("sppt_quiet: %u\n", auto_mode->power_control.sppt);
+	pr_debug("spl_quiet: %u\n", auto_mode->power_control.spl);
+	pr_debug("sppt_apu_only_quiet: %u\n", auto_mode->power_control.sppt_apu_only);
+
+	/* Fan ID */
+	pr_debug("fan_id_perf: %lu\n",
+		 config_store.mode_set[AUTO_PERFORMANCE].fan_control.fan_id);
+	pr_debug("fan_id_balanced: %lu\n",
+		 config_store.mode_set[AUTO_BALANCE].fan_control.fan_id);
+	pr_debug("fan_id_quiet: %lu\n",
+		 config_store.mode_set[AUTO_QUIET].fan_control.fan_id);
+
+	pr_debug("Auto Mode Data - END\n");
+}
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
+#ifdef CONFIG_AMD_PMF_ACPI_DEBUG
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
@@ -262,6 +378,10 @@ static void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev)
 	/* set to initial default values */
 	config_store.current_mode = AUTO_BALANCE;
 	dev->socket_power_history_idx = -1;
+
+#ifdef CONFIG_AMD_PMF_ACPI_DEBUG
+	amd_pmf_dump_auto_mode_defaults(config_store);
+#endif
 }
 
 int amd_pmf_reset_amt(struct amd_pmf_dev *dev)
diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
index 4beb22a19466..4b9691cd592a 100644
--- a/drivers/platform/x86/amd/pmf/cnqf.c
+++ b/drivers/platform/x86/amd/pmf/cnqf.c
@@ -13,6 +13,60 @@
 
 static struct cnqf_config config_store;
 
+#ifdef CONFIG_AMD_PMF_ACPI_DEBUG
+static const char *amd_pmf_cnqf_state_as_str(unsigned int state)
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
+static void amd_pmf_cnqf_dump_defaults(struct apmf_dyn_slider_output data, int idx)
+{
+	int i;
+
+	pr_debug("CnQF %s Defaults - BEGIN\n", idx ? "DC" : "AC");
+	pr_debug("size: %u\n", data.size);
+	pr_debug("flags: %u\n", data.flags);
+
+	/* Time constants */
+	pr_debug("t_perf_to_turbo: %u\n", data.t_perf_to_turbo);
+	pr_debug("t_balanced_to_perf: %u\n", data.t_balanced_to_perf);
+	pr_debug("t_quiet_to_balanced: %u\n", data.t_quiet_to_balanced);
+	pr_debug("t_balanced_to_quiet: %u\n", data.t_balanced_to_quiet);
+	pr_debug("t_perf_to_balanced: %u\n", data.t_perf_to_balanced);
+	pr_debug("t_turbo_to_perf: %u\n", data.t_turbo_to_perf);
+
+	for (i = 0 ; i < CNQF_MODE_MAX ; i++) {
+		pr_debug("pfloor_%s: %u\n", amd_pmf_cnqf_state_as_str(i), data.ps[i].pfloor);
+		pr_debug("fppt_%s: %u\n", amd_pmf_cnqf_state_as_str(i), data.ps[i].fppt);
+		pr_debug("sppt_%s: %u\n", amd_pmf_cnqf_state_as_str(i), data.ps[i].sppt);
+		pr_debug("sppt_apuonly_%s: %u\n", amd_pmf_cnqf_state_as_str(i),
+			 data.ps[i].sppt_apu_only);
+		pr_debug("spl_%s: %u\n", amd_pmf_cnqf_state_as_str(i),
+			 data.ps[i].spl);
+		pr_debug("stt_minlimit_%s: %u\n", amd_pmf_cnqf_state_as_str(i),
+			 data.ps[i].stt_min_limit);
+		pr_debug("stt_skintemp_apu_%s: %u\n", amd_pmf_cnqf_state_as_str(i),
+			 data.ps[i].stt_skintemp[STT_TEMP_APU]);
+		pr_debug("stt_skintemp_hs2_%s: %u\n", amd_pmf_cnqf_state_as_str(i),
+			 data.ps[i].stt_skintemp[STT_TEMP_HS2]);
+		pr_debug("fan_id_%s: %d\n", amd_pmf_cnqf_state_as_str(i), data.ps[i].fan_id);
+	}
+
+	pr_debug("CnQF %s Defaults - END\n", idx ? "DC" : "AC");
+}
+#endif
+
 static int amd_pmf_set_cnqf(struct amd_pmf_dev *dev, int src, int idx,
 			    struct cnqf_config *table)
 {
@@ -275,10 +329,18 @@ static int amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
 		if (!is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC + i))
 			continue;
 
-		if (i == POWER_SOURCE_AC)
+		if (i == POWER_SOURCE_AC) {
 			ret = apmf_get_dyn_slider_def_ac(dev, &out);
-		else
+#ifdef CONFIG_AMD_PMF_ACPI_DEBUG
+			amd_pmf_cnqf_dump_defaults(out, i);
+#endif
+		} else {
 			ret = apmf_get_dyn_slider_def_dc(dev, &out);
+#ifdef CONFIG_AMD_PMF_ACPI_DEBUG
+			amd_pmf_cnqf_dump_defaults(out, i);
+#endif
+		}
+
 		if (ret) {
 			dev_err(dev->dev, "APMF apmf_get_dyn_slider_def_dc failed :%d\n", ret);
 			return ret;
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index bed762d47a14..affb8ef4f203 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -12,6 +12,58 @@
 
 static struct amd_pmf_static_slider_granular config_store;
 
+#ifdef CONFIG_AMD_PMF_ACPI_DEBUG
+static const char *slider_as_str(unsigned int state)
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
+static const char *source_as_str(unsigned int state)
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
+static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular data)
+{
+	int i, j;
+
+	pr_debug("Static Slider Data - BEGIN\n");
+
+	for (i = 0; i < POWER_SOURCE_MAX; i++) {
+		for (j = 0; j < POWER_MODE_MAX; j++) {
+			pr_debug("--- Source:%s Mode:%s ---\n", source_as_str(i), slider_as_str(j));
+			pr_debug("SPL: %u mW\n", data.prop[i][j].spl);
+			pr_debug("SPPT: %u mW\n", data.prop[i][j].sppt);
+			pr_debug("SPPT_ApuOnly: %u mW\n", data.prop[i][j].sppt_apu_only);
+			pr_debug("FPPT: %u mW\n", data.prop[i][j].fppt);
+			pr_debug("STTMinLimit: %u mW\n", data.prop[i][j].stt_min);
+			pr_debug("STT_SkinTempLimit_APU: %u C\n",
+				 data.prop[i][j].stt_skin_temp[STT_TEMP_APU]);
+			pr_debug("STT_SkinTempLimit_HS2: %u C\n",
+				 data.prop[i][j].stt_skin_temp[STT_TEMP_HS2]);
+		}
+	}
+
+	pr_debug("Static Slider Data - END\n");
+}
+#endif
+
 static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
 {
 	struct apmf_static_slider_granular_output output;
@@ -36,6 +88,9 @@ static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
 			idx++;
 		}
 	}
+#ifdef CONFIG_AMD_PMF_ACPI_DEBUG
+	amd_pmf_dump_sps_defaults(config_store);
+#endif
 }
 
 void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
-- 
2.25.1

