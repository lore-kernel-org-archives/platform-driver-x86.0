Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17992CE79A1
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Sep 2023 19:46:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233320AbjIYTqI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Sep 2023 15:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233296AbjIYTqG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Sep 2023 15:46:06 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FDA510C;
        Mon, 25 Sep 2023 12:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695671160; x=1727207160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iN3fQmnFkelTRYjRoB7okJVo4cjl4KcrIYSO1I1EF78=;
  b=Me/JigntKOShlBpmUXO1X9PIrlQefMkBCHmLLQzsqBoZvUIrUzlU+dcK
   wPNwwsaMO5IlueTdHMMuZM67faE7GTvDCgNI/aHDWs82TJqVTlAsTfcuS
   xHTgfw1qoXgULZSgTFQoWXXJUwPuTmWx/UIvXorT4JOwmGXxqhJX7/3s3
   cZJAA3nnE0NHpL3nNKTEDN5KlmEtkW0Pifs0W5AOIeawtQbrVkDOtdvhb
   3GO+3nNq/DOgj/Bk10l8AV4yOW9NAjSvguSTi8Pz1Hek1RLxcrtJckt1t
   N5Xd9ji/3kRD3jnow26etdIm1yUahI7aQ/aMiggzQkoJ2nBrOc7gUijEi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="380233037"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="380233037"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 12:45:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="814114297"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="814114297"
Received: from spandruv-desk.jf.intel.com ([10.54.75.14])
  by fmsmga008.fm.intel.com with ESMTP; 25 Sep 2023 12:45:57 -0700
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     hdegoede@redhat.com, markgross@kernel.org,
        ilpo.jarvinen@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 2/3] platform/x86: ISST: Allow level 0 to be not present
Date:   Mon, 25 Sep 2023 12:45:54 -0700
Message-Id: <20230925194555.966743-3-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230925194555.966743-1-srinivas.pandruvada@linux.intel.com>
References: <20230925194555.966743-1-srinivas.pandruvada@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

It is possible that SST level 0 or base level is not present in some
configurations. So don't set level 0 mask in level_en_mask by default.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index 48465636aadb..e6d84ce0e7a5 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -372,9 +372,6 @@ static int sst_main(struct auxiliary_device *auxdev, struct tpmi_per_power_domai
 	/* Read PP header */
 	*((u64 *)&pd_info->pp_header) = readq(pd_info->sst_base + pd_info->sst_header.pp_offset);
 
-	/* Force level_en_mask level 0 */
-	pd_info->pp_header.level_en_mask |= 0x01;
-
 	mask = 0x01;
 	levels = 0;
 	for (i = 0; i < 8; ++i) {
-- 
2.41.0

