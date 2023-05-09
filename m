Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50395C7EE22
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 May 2023 14:07:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235750AbjEIOHv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 May 2023 10:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235695AbjEIOHu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2023 10:07:50 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2120F30EC
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 May 2023 07:07:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1jdZkXLLBzzqscghUYAhz7OKYS3mz2QnCz8SazaZP3KSJ1euzRQRHiXU6fI7TXiA79rV/n44MZPVyk6XyUl5nn/FOgSQCwicrRt4faEdx39P+nj2KzoAZVXnwzEQ4YgsT2ns2rabcMzz7Jr2nnp1HioXbC1k8UKq+33lS4ntQ7kAUkuXrQ+k47mZgEcZmQU8dtgz++YszIIMYtSWn9pTYaYzB5+kdjbTCA8ulugxG8D2FRCsTEPibJH6UrwRu82D7Rz92p2S9GyEqTpG/Mm485qUykC23e+IDO5O3b3qnDO1euYG6LQrtOI/EdpsXAYkVqZbzhGYTTkydlEDswO6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYq4Bdx9kWdwFXaexa2gwwpmueELd1OPM1ADAX+vYFU=;
 b=Bxyx8OXHrU1FVk2zY4B4EPo4lcKqVvYd663SRZLXW3QrDqKNEILl0wZlUyZ5ZhHLO1WXEzszm5gy0qB+FJgW5QiVFlbR3I+RHsMgrXj8y6QSFf/1t9/GB7/F4dB1f4vCCEH44+qaOvxSdLOmkc6PE0Mwa/bf1Je3IWkVkPjnpRJrY6xe9/K6CTWZpDXtsvQRlnjqVtC1T9RUg+fNJ3W+KuHpsIp/2D+RnTwyEVjTIwSRukE3uCzxSLdoX1dyiKJsZspfvfem4m5VOAy7axK+YyvlnnR3iMGSbYh1NvDrLGdcRXIoGwstaU85NqC/gugSZ9R/QeontrcY+k+x5TQhzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYq4Bdx9kWdwFXaexa2gwwpmueELd1OPM1ADAX+vYFU=;
 b=e59L8e00nJ0yVibWcfYjPXtP/WLdLXPR8LxRRRmBRjYQpDEdNpupgDqcE2HujO4ajNVQblxGw7AWjavNjHQh7Um3oL5T4xbCPauPPHHtvcSIOLbZdWWiUjwZU3nnUBQ5+NvSPAFPon5/cibymd2a9/D23RzSdVeQoTHRsO0Q+io=
Received: from DM6PR05CA0048.namprd05.prod.outlook.com (2603:10b6:5:335::17)
 by DM6PR12MB4452.namprd12.prod.outlook.com (2603:10b6:5:2a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 14:07:34 +0000
Received: from DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::34) by DM6PR05CA0048.outlook.office365.com
 (2603:10b6:5:335::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18 via Frontend
 Transport; Tue, 9 May 2023 14:07:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT049.mail.protection.outlook.com (10.13.172.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.33 via Frontend Transport; Tue, 9 May 2023 14:07:34 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 9 May
 2023 09:07:18 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 1/2] platform/x86/amd/pmf: Add PMF acpi debug support
Date:   Tue, 9 May 2023 19:36:56 +0530
Message-ID: <20230509140657.27479-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT049:EE_|DM6PR12MB4452:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f09b4c-88fe-4f7c-b621-08db5096bc80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Am15KBEDLGtznsyqxlE1ybnfSkbsL7515REPk41hsO4swnIjsZvrSMto9zswO3RzJRK4qT/Ls49JkvIypFYhvGuVfk2n8Alh0POiE+ui9xMg3sGcr4vdMk84zgN4xEAEFeBCYDYXSCBcAcJ0LH29XfbNxWYQrj49T66n+BwIr+H06kpyOa/jpSAJhMetVbt+hHmAc7dgeuOEaukyKpZ1UKHxM5gTQgWZroMFw0RX5v9+/XrP+yfmN+5SyaVtpz7SXI6ZNWenrFtaOu9xWYEI04CXZ4xb+4O6sIp7jF4rk9YerY8hh+1d3QAj+tayic2wV/D2VJ0TAS1wuaZhfbqHT3htULqT9DmCfkTKlE+rOyiu6vr1R6tfdsLsm1EgjE9OuEwo1rSU5mTrEvuyOKKMNsNC+rwAqZlKj8wwkOQ4wBvprHgmEeFTuehGzoSsqteSxJ+5u+tUjBIYcTksbnJHBJWuLECj09VC5f1OLGyoRNQJYKI4TqK0THipBYnYH9o1z1ZZU73ptheAPnsta+uZH4RZLBun8djmwCNl+uv3cf7lraAYPY8f2XVWdv8fmU2vVkXMydULs/2zShqGr8YVWGRb360n52BU7nJ3k90h5xkX832722ri3bcvAbCd8LCwd0LTr4vUWOBUMP4ZVPLMJrITSWuzRYBsDW31htEK9J1hfh52p+2AuNrf0VEXlouWv3VFkvrUt/lr+0U1FoyDuTD/i7D1We9tGqTiZsBlJI=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199021)(40470700004)(36840700001)(46966006)(2616005)(47076005)(40480700001)(426003)(336012)(40460700003)(6666004)(81166007)(316002)(45080400002)(7696005)(1076003)(186003)(26005)(356005)(16526019)(70206006)(36756003)(82310400005)(70586007)(8936002)(5660300002)(41300700001)(8676002)(4326008)(54906003)(82740400003)(110136005)(478600001)(30864003)(86362001)(2906002)(36860700001)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 14:07:34.0144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f09b4c-88fe-4f7c-b621-08db5096bc80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4452
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
v3:
 - Based on review-hans branch
 - Address Ilpo's review remarks
 - use the right format specifiers while printing the data

v2:
 - Based on review-hans branch
 - use a pointer and not create a local copy while dumping
 - use dummy #else blocks

 drivers/platform/x86/amd/pmf/Kconfig     |  11 +++
 drivers/platform/x86/amd/pmf/auto-mode.c | 120 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/cnqf.c      |  56 +++++++++++
 drivers/platform/x86/amd/pmf/sps.c       |  55 +++++++++++
 4 files changed, 242 insertions(+)

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
index 96a8e1832c05..64425201d353 100644
--- a/drivers/platform/x86/amd/pmf/auto-mode.c
+++ b/drivers/platform/x86/amd/pmf/auto-mode.c
@@ -15,6 +15,100 @@
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
+	pr_debug("balanced_to_perf: %u ms\n",
+		 data->transition[AUTO_TRANSITION_TO_PERFORMANCE].time_constant);
+	pr_debug("perf_to_balanced: %u ms\n",
+		 data->transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].time_constant);
+	pr_debug("quiet_to_balanced: %u ms\n",
+		 data->transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].time_constant);
+	pr_debug("balanced_to_quiet: %u ms\n",
+		 data->transition[AUTO_TRANSITION_TO_QUIET].time_constant);
+
+	/* power floor */
+	pr_debug("pfloor_perf: %u mW\n", data->mode_set[AUTO_PERFORMANCE].power_floor);
+	pr_debug("pfloor_balanced: %u mW\n", data->mode_set[AUTO_BALANCE].power_floor);
+	pr_debug("pfloor_quiet: %u mW\n", data->mode_set[AUTO_QUIET].power_floor);
+
+	/* Power delta for mode change */
+	pr_debug("pd_balanced_to_perf: %u mW\n",
+		 data->transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta);
+	pr_debug("pd_perf_to_balanced: %u mW\n",
+		 data->transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta);
+	pr_debug("pd_quiet_to_balanced: %u mW\n",
+		 data->transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta);
+	pr_debug("pd_balanced_to_quiet: %u mW\n",
+		 data->transition[AUTO_TRANSITION_TO_QUIET].power_delta);
+
+	/* skin temperature limits */
+	its_mode = &data->mode_set[AUTO_PERFORMANCE_ON_LAP];
+	pr_debug("stt_apu_perf_on_lap: %u C\n",
+		 its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
+	pr_debug("stt_hs2_perf_on_lap: %u C\n",
+		 its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
+	pr_debug("stt_min_limit_perf_on_lap: %u mW\n", its_mode->power_control.stt_min);
+
+	its_mode = &data->mode_set[AUTO_PERFORMANCE];
+	pr_debug("stt_apu_perf: %u C\n", its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
+	pr_debug("stt_hs2_perf: %u C\n", its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
+	pr_debug("stt_min_limit_perf: %u mW\n", its_mode->power_control.stt_min);
+
+	its_mode = &data->mode_set[AUTO_BALANCE];
+	pr_debug("stt_apu_balanced: %u C\n", its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
+	pr_debug("stt_hs2_balanced: %u C\n", its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
+	pr_debug("stt_min_limit_balanced: %u mW\n", its_mode->power_control.stt_min);
+
+	its_mode = &data->mode_set[AUTO_QUIET];
+	pr_debug("stt_apu_quiet: %u C\n", its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
+	pr_debug("stt_hs2_quiet: %u C\n", its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
+	pr_debug("stt_min_limit_quiet: %u mW\n", its_mode->power_control.stt_min);
+
+	/* SPL based power limits */
+	its_mode = &data->mode_set[AUTO_PERFORMANCE_ON_LAP];
+	pr_debug("fppt_perf_on_lap: %u mW\n", its_mode->power_control.fppt);
+	pr_debug("sppt_perf_on_lap: %u mW\n", its_mode->power_control.sppt);
+	pr_debug("spl_perf_on_lap: %u mW\n", its_mode->power_control.spl);
+	pr_debug("sppt_apu_only_perf_on_lap: %u mW\n", its_mode->power_control.sppt_apu_only);
+
+	its_mode = &data->mode_set[AUTO_PERFORMANCE];
+	pr_debug("fppt_perf: %u mW\n", its_mode->power_control.fppt);
+	pr_debug("sppt_perf: %u mW\n", its_mode->power_control.sppt);
+	pr_debug("spl_perf: %u mW\n", its_mode->power_control.spl);
+	pr_debug("sppt_apu_only_perf: %u mW\n", its_mode->power_control.sppt_apu_only);
+
+	its_mode = &data->mode_set[AUTO_BALANCE];
+	pr_debug("fppt_balanced: %u mW\n", its_mode->power_control.fppt);
+	pr_debug("sppt_balanced: %u mW\n", its_mode->power_control.sppt);
+	pr_debug("spl_balanced: %u mW\n", its_mode->power_control.spl);
+	pr_debug("sppt_apu_only_balanced: %u mW\n", its_mode->power_control.sppt_apu_only);
+
+	its_mode = &data->mode_set[AUTO_QUIET];
+	pr_debug("fppt_quiet: %u mW\n", its_mode->power_control.fppt);
+	pr_debug("sppt_quiet: %u mW\n", its_mode->power_control.sppt);
+	pr_debug("spl_quiet: %u mW\n", its_mode->power_control.spl);
+	pr_debug("sppt_apu_only_quiet: %u mW\n", its_mode->power_control.sppt_apu_only);
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
@@ -140,6 +234,30 @@ static void amd_pmf_get_power_threshold(void)
 	config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_threshold =
 		config_store.mode_set[AUTO_PERFORMANCE].power_floor -
 		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta;
+
+#ifdef CONFIG_AMD_PMF_DEBUG
+	pr_debug("[AUTO MODE TO_QUIET] pt: %u mW pf: %u mW pd: %u mW\n",
+		 config_store.transition[AUTO_TRANSITION_TO_QUIET].power_threshold,
+		 config_store.mode_set[AUTO_BALANCE].power_floor,
+		 config_store.transition[AUTO_TRANSITION_TO_QUIET].power_delta);
+
+	pr_debug("[AUTO MODE TO_PERFORMANCE] pt: %u mW pf: %u mW pd: %u mW\n",
+		 config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_threshold,
+		 config_store.mode_set[AUTO_BALANCE].power_floor,
+		 config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta);
+
+	pr_debug("[AUTO MODE QUIET_TO_BALANCE] pt: %u mW pf: %u mW pd: %u mW\n",
+		 config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE]
+		 .power_threshold,
+		 config_store.mode_set[AUTO_QUIET].power_floor,
+		 config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta);
+
+	pr_debug("[AUTO MODE PERFORMANCE_TO_BALANCE] pt: %u mW pf: %u mW pd: %u mW\n",
+		 config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE]
+		 .power_threshold,
+		 config_store.mode_set[AUTO_PERFORMANCE].power_floor,
+		 config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta);
+#endif
 }
 
 static const char *state_as_str(unsigned int state)
@@ -262,6 +380,8 @@ static void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev)
 	/* set to initial default values */
 	config_store.current_mode = AUTO_BALANCE;
 	dev->socket_power_history_idx = -1;
+
+	amd_pmf_dump_auto_mode_defaults(&config_store);
 }
 
 int amd_pmf_reset_amt(struct amd_pmf_dev *dev)
diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
index 4beb22a19466..35af7c18f600 100644
--- a/drivers/platform/x86/amd/pmf/cnqf.c
+++ b/drivers/platform/x86/amd/pmf/cnqf.c
@@ -13,6 +13,61 @@
 
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
+	pr_debug("flags: 0x%x\n", data->flags);
+
+	/* Time constants */
+	pr_debug("t_perf_to_turbo: %u ms\n", data->t_perf_to_turbo);
+	pr_debug("t_balanced_to_perf: %u ms\n", data->t_balanced_to_perf);
+	pr_debug("t_quiet_to_balanced: %u ms\n", data->t_quiet_to_balanced);
+	pr_debug("t_balanced_to_quiet: %u ms\n", data->t_balanced_to_quiet);
+	pr_debug("t_perf_to_balanced: %u ms\n", data->t_perf_to_balanced);
+	pr_debug("t_turbo_to_perf: %u ms\n", data->t_turbo_to_perf);
+
+	for (i = 0 ; i < CNQF_MODE_MAX ; i++) {
+		pr_debug("pfloor_%s: %u mW\n", state_as_str_cnqf(i), data->ps[i].pfloor);
+		pr_debug("fppt_%s: %u mW\n", state_as_str_cnqf(i), data->ps[i].fppt);
+		pr_debug("sppt_%s: %u mW\n", state_as_str_cnqf(i), data->ps[i].sppt);
+		pr_debug("sppt_apuonly_%s: %u mW\n",
+			 state_as_str_cnqf(i), data->ps[i].sppt_apu_only);
+		pr_debug("spl_%s: %u mW\n", state_as_str_cnqf(i), data->ps[i].spl);
+		pr_debug("stt_minlimit_%s: %u mW\n",
+			 state_as_str_cnqf(i), data->ps[i].stt_min_limit);
+		pr_debug("stt_skintemp_apu_%s: %u C\n", state_as_str_cnqf(i),
+			 data->ps[i].stt_skintemp[STT_TEMP_APU]);
+		pr_debug("stt_skintemp_hs2_%s: %u C\n", state_as_str_cnqf(i),
+			 data->ps[i].stt_skintemp[STT_TEMP_HS2]);
+		pr_debug("fan_id_%s: %u\n", state_as_str_cnqf(i), data->ps[i].fan_id);
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
@@ -284,6 +339,7 @@ static int amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
 			return ret;
 		}
 
+		amd_pmf_cnqf_dump_defaults(&out, i);
 		amd_pmf_update_mode_set(i, &out);
 		amd_pmf_update_trans_data(i, &out);
 		amd_pmf_update_power_threshold(i);
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

