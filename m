Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37614C11F67
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Jul 2021 02:23:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 182C0613F7
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Jul 2021 02:23:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234627AbhGBCZh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 1 Jul 2021 22:25:37 -0400
Received: from mga02.intel.com ([134.134.136.20]:30676 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230329AbhGBCZh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Jul 2021 22:25:37 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="195824192"
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; 
   d="scan'208";a="195824192"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2021 19:23:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; 
   d="scan'208";a="426361035"
Received: from otcpl-manager.jf.intel.com (HELO localhost.localdomain) ([10.54.39.234])
  by orsmga002.jf.intel.com with ESMTP; 01 Jul 2021 19:23:06 -0700
From:   Gayatri Kammela <gayatri.kammela@intel.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     mgross@linux.intel.com, hdegoede@redhat.com,
        irenic.rajneesh@gmail.com,
        Gayatri Kammela <gayatri.kammela@intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        David Box <david.e.box@intel.com>
Subject: [PATCH v1 1/4] platform/x86: intel_pmc_core: Add Alderlake support to pmc_core driver
Date:   Thu,  1 Jul 2021 19:20:00 -0700
Message-Id: <8080c997627d2a1fd8a701e8d8d09c69c8df381d.1625191274.git.gayatri.kammela@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625191274.git.gayatri.kammela@intel.com>
References: <cover.1625191274.git.gayatri.kammela@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add Alder Lake client and mobile support to pmc_core driver.

Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Box <david.e.box@intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 68 +++++++++++++++++++++++++++
 drivers/platform/x86/intel_pmc_core.h |  2 +
 2 files changed, 70 insertions(+)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index b0e486a6bdfb..441018e3ce96 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -645,6 +645,73 @@ static void pmc_core_get_tgl_lpm_reqs(struct platform_device *pdev)
 	ACPI_FREE(out_obj);
 }
 
+/* Alder Lake: PGD PFET Enable Ack Status Register(s) bitmap */
+static const struct pmc_bit_map adl_pfear_map[] = {
+	{"SPI/eSPI",		BIT(2)},
+	{"XHCI",		BIT(3)},
+	{"SPA",			BIT(4)},
+	{"SPB",			BIT(5)},
+	{"SPC",			BIT(6)},
+	{"GBE",			BIT(7)},
+
+	{"SATA",		BIT(0)},
+	{"HDA_PGD0",		BIT(1)},
+	{"HDA_PGD1",		BIT(2)},
+	{"HDA_PGD2",		BIT(3)},
+	{"HDA_PGD3",		BIT(4)},
+	{"SPD",			BIT(5)},
+	{"LPSS",		BIT(6)},
+
+	{"SMB",			BIT(0)},
+	{"ISH",			BIT(1)},
+	{"ITH",			BIT(3)},
+
+	{"XDCI",		BIT(1)},
+	{"DCI",			BIT(2)},
+	{"CSE",			BIT(3)},
+	{"CSME_KVM",		BIT(4)},
+	{"CSME_PMT",		BIT(5)},
+	{"CSME_CLINK",		BIT(6)},
+	{"CSME_PTIO",		BIT(7)},
+
+	{"CSME_USBR",		BIT(0)},
+	{"CSME_SUSRAM",		BIT(1)},
+	{"CSME_SMT1",		BIT(2)},
+	{"CSME_SMS2",		BIT(4)},
+	{"CSME_SMS1",		BIT(5)},
+	{"CSME_RTC",		BIT(6)},
+	{"CSME_PSF",		BIT(7)},
+
+	{"CNVI",		BIT(3)},
+
+	{"HDA_PGD4",		BIT(2)},
+	{"HDA_PGD5",		BIT(3)},
+	{"HDA_PGD6",		BIT(4)},
+	{}
+};
+
+static const struct pmc_bit_map *ext_adl_pfear_map[] = {
+	/*
+	 * Check intel_pmc_core_ids[] users of cnp_reg_map for
+	 * a list of core SoCs using this.
+	 */
+	adl_pfear_map,
+	NULL
+};
+
+static const struct pmc_reg_map adl_reg_map = {
+	.pfear_sts = ext_adl_pfear_map,
+	.slp_s0_offset = ADL_PMC_SLP_S0_RES_COUNTER_OFFSET,
+	.slp_s0_res_counter_step = TGL_PMC_SLP_S0_RES_COUNTER_STEP,
+	.msr_sts = msr_map,
+	.ltr_ignore_offset = CNP_PMC_LTR_IGNORE_OFFSET,
+	.regmap_length = CNP_PMC_MMIO_REG_LEN,
+	.ppfear0_offset = CNP_PMC_HOST_PPFEAR0A,
+	.ppfear_buckets = CNP_PPFEAR_NUM_ENTRIES,
+	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
+	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
+};
+
 static inline u32 pmc_core_reg_read(struct pmc_dev *pmcdev, int reg_offset)
 {
 	return readl(pmcdev->regbase + reg_offset);
@@ -1574,6 +1641,7 @@ static const struct x86_cpu_id intel_pmc_core_ids[] = {
 	X86_MATCH_INTEL_FAM6_MODEL(ATOM_TREMONT_L,	&icl_reg_map),
 	X86_MATCH_INTEL_FAM6_MODEL(ROCKETLAKE,		&tgl_reg_map),
 	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE_L,		&tgl_reg_map),
+	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE,		&adl_reg_map),
 	{}
 };
 
diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
index e8dae9c6c45f..c0ca20b32c6b 100644
--- a/drivers/platform/x86/intel_pmc_core.h
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -197,6 +197,8 @@ enum ppfear_regs {
 #define TGL_NUM_IP_IGN_ALLOWED			23
 #define TGL_PMC_LPM_RES_COUNTER_STEP_X2		61	/* 30.5us * 2 */
 
+#define ADL_PMC_SLP_S0_RES_COUNTER_OFFSET	0x1098
+
 /*
  * Tigerlake Power Management Controller register offsets
  */
-- 
2.25.1

