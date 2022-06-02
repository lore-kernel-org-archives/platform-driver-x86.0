Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14FDC43334
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Jun 2022 01:26:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233182AbiFBB0W (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Jun 2022 21:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233176AbiFBB0V (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Jun 2022 21:26:21 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D51552A5D6C
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Jun 2022 18:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654133179; x=1685669179;
  h=from:to:cc:subject:date:message-id;
  bh=g96Hb8i5gLRe62w8Pmn27xlTs9mAsprcfcUPyyq2+tQ=;
  b=Q5inpLClp/KV8tEpVELMxzyVAj81gEpzV53Mi5if/+FnmYQ2jwCC83PA
   pwbOW0UOOfA1rWj9fen1I2NAltuufuqFCcpZTBtOGZc1yKeuYHCknlE8A
   QHRymWWsTSvLdWfInCqQJ6Gk7suEqyEljrXFE6FNgKQWDj03KfynEK0ig
   /pu7z5UnRK2bCzmoHCTHyqGdycZrPxEeabegO5qs84z7SrEGsmZ2oe8MU
   3wYUejpvbExHqSm6Pv3Jfkl3IZPIvfa2+jXSb7ihRoyve21t5oebJrMAX
   siJiqErlBi5ducx3B5zCoIHc8oyY2jKt4WVkY40GoVdWEO1VQBrKdD6Zl
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="273353533"
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; 
   d="scan'208";a="273353533"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 18:26:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; 
   d="scan'208";a="577235571"
Received: from otc-chromeosbuild-5.ostc.intel.com (HELO otc-chromeosbuild-5.intel.com) ([10.54.29.149])
  by orsmga007.jf.intel.com with ESMTP; 01 Jun 2022 18:26:19 -0700
From:   george.d.sworo@intel.com
To:     david.e.box@intel.com
Cc:     platform-driver-x86@vger.kernel.org,
        George D Sworo <george.d.sworo@intel.com>
Subject: [PATCH] platform/x86/intel: pmc: Support Intel Raptorlake P
Date:   Wed,  1 Jun 2022 18:26:17 -0700
Message-Id: <20220602012617.20100-1-george.d.sworo@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: George D Sworo <george.d.sworo@intel.com>

Add Raptorlake P to the list of the platforms that intel_pmc_core driver
supports for pmc_core device. Raptorlake P PCH is based on Alderlake P
PCH.

Signed-off-by: George D Sworo <george.d.sworo@intel.com>
---
 drivers/platform/x86/intel/pmc/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index edaf22e5ae98..40183bda7894 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1912,6 +1912,7 @@ static const struct x86_cpu_id intel_pmc_core_ids[] = {
 	X86_MATCH_INTEL_FAM6_MODEL(ROCKETLAKE,		&tgl_reg_map),
 	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE_L,		&tgl_reg_map),
 	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE,		&adl_reg_map),
+	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_P,        &tgl_reg_map),
 	{}
 };
 
-- 
2.17.1

