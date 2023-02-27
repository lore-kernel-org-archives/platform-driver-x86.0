Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35BEC64ED6
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Feb 2023 05:35:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjB0FfK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Feb 2023 00:35:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjB0FfJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Feb 2023 00:35:09 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F4C1117D;
        Sun, 26 Feb 2023 21:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677476108; x=1709012108;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oQPX7x3IL1Ebsh+DaCSvLlDQcRLVwIDTJDIaEPNaL4w=;
  b=OaLlpvCSlaYDQ8a9R5LCyl1xyAYj75pA8WSAqI58Z+tzx/tFKqj5Nv4J
   erh0x754CJRkXKbrzmJWcEXsnOjff88ON0TUC1yWw6f9u8HOMl6tIZcmu
   noT1AmMHWchucNcvb7TqzHkjgBMmmXKnogg9NDJeSFnNBd4CE/yLm3kEL
   8fXGnjz7t3Tc+vBJXPcB3iPT0tC1rRt4O2ywTFkc15Gqg81ZKekDiqmmM
   sdtDMK4Z0es2K9Wxui+L9nDTvhnM7jLtsivl4hfllnQWf1/T8Ewvb8tuS
   TolE7d9X/KBij+jgZNlqWsdSh7Czjl/TtLBt237F8u4Tu0gBvpOvHux05
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="361339125"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="361339125"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 21:35:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="737517015"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="737517015"
Received: from spandruv-desk.jf.intel.com ([10.54.75.8])
  by fmsmga008.fm.intel.com with ESMTP; 26 Feb 2023 21:35:08 -0800
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] platform/x86: ISST: Increase range of valid mail box commands
Date:   Sun, 26 Feb 2023 21:35:04 -0800
Message-Id: <20230227053504.2734214-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

A new command CONFIG_TDP_GET_RATIO_INFO is added, with sub command type
of 0x0C. The previous range of valid sub commands was from 0x00 to 0x0B.
Change the valid range from 0x00 to 0x0C.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/platform/x86/intel/speed_select_if/isst_if_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
index a7e02b24a87a..0829e793a8fc 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
@@ -47,7 +47,7 @@ struct isst_cmd_set_req_type {
 
 static const struct isst_valid_cmd_ranges isst_valid_cmds[] = {
 	{0xD0, 0x00, 0x03},
-	{0x7F, 0x00, 0x0B},
+	{0x7F, 0x00, 0x0C},
 	{0x7F, 0x10, 0x12},
 	{0x7F, 0x20, 0x23},
 	{0x94, 0x03, 0x03},
-- 
2.39.1

