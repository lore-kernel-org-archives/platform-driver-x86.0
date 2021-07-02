Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66ED5C11F6A
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Jul 2021 02:23:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C7E5613DD
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Jul 2021 02:23:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234699AbhGBCZq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 1 Jul 2021 22:25:46 -0400
Received: from mga02.intel.com ([134.134.136.20]:30676 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230329AbhGBCZp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Jul 2021 22:25:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="195824217"
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; 
   d="scan'208";a="195824217"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2021 19:23:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; 
   d="scan'208";a="426361063"
Received: from otcpl-manager.jf.intel.com (HELO localhost.localdomain) ([10.54.39.234])
  by orsmga002.jf.intel.com with ESMTP; 01 Jul 2021 19:23:14 -0700
From:   Gayatri Kammela <gayatri.kammela@intel.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     mgross@linux.intel.com, hdegoede@redhat.com,
        irenic.rajneesh@gmail.com,
        "David E. Box" <david.e.box@linux.intel.com>
Subject: [PATCH v1 4/4] platform/x86: intel_pmc_core: Add GBE Package C10 fix for Alder Lake PCH
Date:   Thu,  1 Jul 2021 19:20:03 -0700
Message-Id: <bb897d898c060da4bc20d3d866193c53c6fd4ee1.1625191274.git.gayatri.kammela@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625191274.git.gayatri.kammela@intel.com>
References: <cover.1625191274.git.gayatri.kammela@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: "David E. Box" <david.e.box@linux.intel.com>

Alder PCH uses the same Gigabit Ethernet (GBE) device as Tiger Lake PCH
which cannot achieve PC10 without ignoring the PMC GBE LTR. Add this
work around for Alder Lake PCH as well.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 27346ff5a924..84b58b557a49 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -1983,10 +1983,10 @@ static int pmc_core_probe(struct platform_device *pdev)
 		pmc_core_get_tgl_lpm_reqs(pdev);
 
 	/*
-	 * On TGL, due to a hardware limitation, the GBE LTR blocks PC10 when
-	 * a cable is attached. Tell the PMC to ignore it.
+	 * On TGL and ADL, due to a hardware limitation, the GBE LTR blocks PC10
+	 * when a cable is attached. Tell the PMC to ignore it.
 	 */
-	if (pmcdev->map == &tgl_reg_map) {
+	if (pmcdev->map == &tgl_reg_map || pmcdev->map == &adl_reg_map) {
 		dev_dbg(&pdev->dev, "ignoring GBE LTR\n");
 		pmc_core_send_ltr_ignore(pmcdev, 3);
 	}
-- 
2.25.1

