Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A317C761A6
	for <platform-driver-x86@archiver.kernel.org>; Thu, 30 Mar 2023 14:59:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232607AbjC3O75 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 30 Mar 2023 10:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232720AbjC3O74 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 30 Mar 2023 10:59:56 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8C2C1BC;
        Thu, 30 Mar 2023 07:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680188387; x=1711724387;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wAx1RbbU2lhx3HRgHK8oyu8lZK7aEcdm3MlmqjpZIBw=;
  b=bhJ/taQYD+UGj3CosRpKrIbomRbTVcnoiS2LEQAApEjMyNjiY2Bi/SHY
   8tnFKzL8aAoJoOZOM5qapfRwe5hljXCAj7On/0SUgFRqocNZNgOsO/2lS
   AFQ7nkasQD3I8VuMfgAibDuHQa37BqYTtudTwrRp+uOFeUKMQeemqcw+A
   gMI/PBZ4IgawgE4V83lQJSpEmy1aEhqp6bT/O+gQ8zmPWND0RMnlZqhON
   aPQ+RfoHOpYijpIuuy6t4aGJmnxwMessOfIc92aoU5+yHnrHUBtOsstGA
   mnkHV9gbtZANRisg5PTa2FSLHhhUSFvwjQzYj+c9e+gKcDd76rPCYI9in
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="368971303"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="368971303"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 07:59:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="678224001"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="678224001"
Received: from spandruv-desk.jf.intel.com ([10.54.75.8])
  by orsmga007.jf.intel.com with ESMTP; 30 Mar 2023 07:59:47 -0700
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] platform/x86: intel-uncore-freq: Add client processors
Date:   Thu, 30 Mar 2023 07:59:39 -0700
Message-Id: <20230330145939.1022261-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Make Intel uncore frequency driver support to client processor starting
from Alder Lake.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../platform/x86/intel/uncore-frequency/uncore-frequency.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
index 00ac7e381441..32e2515ee366 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
@@ -204,6 +204,13 @@ static const struct x86_cpu_id intel_uncore_cpu_ids[] = {
 	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_D,	NULL),
 	X86_MATCH_INTEL_FAM6_MODEL(SAPPHIRERAPIDS_X, NULL),
 	X86_MATCH_INTEL_FAM6_MODEL(EMERALDRAPIDS_X, NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE, NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE_L, NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE, NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_P, NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_S, NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(METEORLAKE, NULL),
+	X86_MATCH_INTEL_FAM6_MODEL(METEORLAKE_L, NULL),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, intel_uncore_cpu_ids);
-- 
2.39.1

