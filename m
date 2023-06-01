Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5EFC77B7A
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Jun 2023 00:47:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbjFAAr1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 31 May 2023 20:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjFAArZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 31 May 2023 20:47:25 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E0A124;
        Wed, 31 May 2023 17:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685580445; x=1717116445;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KuKxlPpFKGkuw94zyPg91+OeFgR1NnDh94+/fmldi64=;
  b=TaGmaCme1t9gZjdAlTFcyXkGCy+UUGojJA0DGLNpa15u5Sqmj+x31/xS
   e0vtK4JhpfuexNd4IgTHUcGvPWZHqxunPgwW0uWKJvc9Y+NRIW44EHX7t
   wPUxhWvxJI/aoXsIUdDQ0+T0s7S5PlSPM9UiAvENkHscPujm3dJ86G+gA
   zRKLQuWb2JBN++cz6Lzg8ci+Jm1SkMEV3AgT7oOtgZlTg6ZUXNbB4nzAb
   a44I8KMKUbT2/xhnubni7aFqyLMNSp43LbqT/sKQPMOPF/qcdajLx+g74
   0dYa9/rDSnsENAFjGUJ/XNxrnTd+Md24N9l8KmRw3ykvAJU1ndpem9cVN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="335032782"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="335032782"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 17:47:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="736871987"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="736871987"
Received: from mawhitso-mobl1.amr.corp.intel.com (HELO xpardee-test1.hsd1.or.comcast.net) ([10.212.230.213])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 17:47:24 -0700
From:   Xi Pardee <xi.pardee@intel.com>
To:     hdegoede@redhat.com
Cc:     xi.pardee@intel.com, irenic.rajneesh@gmail.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        rajvi.jingar@intel.com, david.e.box@linux.intel.com
Subject: [PATCH] platform/x86:intel/pmc: Remove Meteor Lake S platform support
Date:   Wed, 31 May 2023 17:47:06 -0700
Message-Id: <20230601004706.871528-1-xi.pardee@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

commit c5ad454a12c6 ("platform/x86: intel/pmc/core: Add Meteor Lake
support to pmc core driver") was supposed to add support for Meter
Lake P/M and mistakenly added support for Meteor Lake S instead. Meteor
Lake P/M support was added later and MTL-S support needs to be removed
since its currently assigned to the wrong register maps.

Fixes: c5ad454a12c6 ("platform/x86: intel/pmc/core: Add Meteor Lake support to pmc core driver")
Signed-off-by: Xi Pardee <xi.pardee@intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/pmc/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index da6e7206d38b..b8711330e411 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1039,7 +1039,6 @@ static const struct x86_cpu_id intel_pmc_core_ids[] = {
 	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_P,        tgl_core_init),
 	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE,		adl_core_init),
 	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_S,	adl_core_init),
-	X86_MATCH_INTEL_FAM6_MODEL(METEORLAKE,          mtl_core_init),
 	X86_MATCH_INTEL_FAM6_MODEL(METEORLAKE_L,	mtl_core_init),
 	{}
 };
-- 
2.25.1

