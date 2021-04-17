Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B0BFC433ED
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Apr 2021 03:12:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E35FB610EA
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Apr 2021 03:12:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233892AbhDQDNP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 16 Apr 2021 23:13:15 -0400
Received: from mga17.intel.com ([192.55.52.151]:60959 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231997AbhDQDNP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Apr 2021 23:13:15 -0400
IronPort-SDR: uBeRv2q1JhnO5B7szWdBtrc9vMPomKzNO2fW7LR/qIhF4dNWkUqEb9FDYhIl/X9Or4iSOcbOO0
 rfvo0B3L3xgg==
X-IronPort-AV: E=McAfee;i="6200,9189,9956"; a="175249839"
X-IronPort-AV: E=Sophos;i="5.82,228,1613462400"; 
   d="scan'208";a="175249839"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2021 20:12:49 -0700
IronPort-SDR: e6JiTzwB4wMDi+kb12qqCtrdkwnd505mO7Tz5wt1jvAXWfcjbYIMQZh0LNQZmvrHIfgUDzCBEi
 yA5Mlyu/ld6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,228,1613462400"; 
   d="scan'208";a="612922443"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga006.fm.intel.com with ESMTP; 16 Apr 2021 20:12:49 -0700
Received: from debox1-desk2.jf.intel.com (debox1-desk2.jf.intel.com [10.54.75.16])
        by linux.intel.com (Postfix) with ESMTP id DEDBC58090C;
        Fri, 16 Apr 2021 20:12:48 -0700 (PDT)
From:   "David E. Box" <david.e.box@linux.intel.com>
To:     irenic.rajneesh@gmail.com, david.e.box@linux.intel.com,
        hdegoede@redhat.com, mgross@linux.intel.com,
        gayatri.kammela@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 1/9] platform/x86: intel_pmc_core: Don't use global pmcdev in quirks
Date:   Fri, 16 Apr 2021 20:12:44 -0700
Message-Id: <20210417031252.3020837-2-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210417031252.3020837-1-david.e.box@linux.intel.com>
References: <20210417031252.3020837-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The DMI callbacks, used for quirks, currently access the PMC by getting
the address a global pmc_dev struct. Instead, have the callbacks set a
global quirk specific variable. In probe, after calling dmi_check_system(),
pass pmc_dev to a function that will handle each quirk if its variable
condition is met. This allows removing the global pmc_dev later.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
---

V2: No change

 drivers/platform/x86/intel_pmc_core.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 8fb4e6d1d68d..07657532ccdb 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -1298,9 +1298,15 @@ static const struct pci_device_id pmc_pci_ids[] = {
  * the platform BIOS enforces 24Mhz crystal to shutdown
  * before PMC can assert SLP_S0#.
  */
+static bool xtal_ignore;
 static int quirk_xtal_ignore(const struct dmi_system_id *id)
 {
-	struct pmc_dev *pmcdev = &pmc;
+	xtal_ignore = true;
+	return 0;
+}
+
+static void pmc_core_xtal_ignore(struct pmc_dev *pmcdev)
+{
 	u32 value;
 
 	value = pmc_core_reg_read(pmcdev, pmcdev->map->pm_vric1_offset);
@@ -1309,7 +1315,6 @@ static int quirk_xtal_ignore(const struct dmi_system_id *id)
 	/* Low Voltage Mode Enable */
 	value &= ~SPT_PMC_VRIC1_SLPS0LVEN;
 	pmc_core_reg_write(pmcdev, pmcdev->map->pm_vric1_offset, value);
-	return 0;
 }
 
 static const struct dmi_system_id pmc_core_dmi_table[]  = {
@@ -1324,6 +1329,14 @@ static const struct dmi_system_id pmc_core_dmi_table[]  = {
 	{}
 };
 
+static void pmc_core_do_dmi_quirks(struct pmc_dev *pmcdev)
+{
+	dmi_check_system(pmc_core_dmi_table);
+
+	if (xtal_ignore)
+		pmc_core_xtal_ignore(pmcdev);
+}
+
 static int pmc_core_probe(struct platform_device *pdev)
 {
 	static bool device_initialized;
@@ -1365,7 +1378,7 @@ static int pmc_core_probe(struct platform_device *pdev)
 	mutex_init(&pmcdev->lock);
 	platform_set_drvdata(pdev, pmcdev);
 	pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit();
-	dmi_check_system(pmc_core_dmi_table);
+	pmc_core_do_dmi_quirks(pmcdev);
 
 	/*
 	 * On TGL, due to a hardware limitation, the GBE LTR blocks PC10 when
-- 
2.25.1

