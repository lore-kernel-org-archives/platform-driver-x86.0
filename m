Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48327C7EE2F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Jun 2023 22:40:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238883AbjFLWki (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Jun 2023 18:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238008AbjFLWkh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Jun 2023 18:40:37 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F9D1171F;
        Mon, 12 Jun 2023 15:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686609636; x=1718145636;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W0g3K9LOGENgGUyAE6TRJpAv9/VDpuKKRjJ9zM72D7k=;
  b=cdegRwzGWE9VoAhcMTJCeK+VZMCt6Ff/8GhAenx5zJPkbJJjdA9j/osB
   +FHh9dfSyHYrQh92/g0kuJwpmjwtGGpqvQ1MgnepQbZX26yB1QMWWkOnd
   GOPPACfq0o+pR2Z7dVu4s9wBRWngZRnP+pG7Qi62/IbOFV8ueuD7mOv0U
   bYkWV9YX8cehmWHp60srhdfxfZq2nd21hGS50nUh87WLFWO5a/jsLhO4k
   W9sRCu48FGM0W6qZHFTlwz3y0GLTI8wUlUgtmBRvW/z1DMfGA97VzPbqa
   dOxEkZ643vUDAiGcayMYqdosuoHl9sa/wyttODcFjHhyEoqt4Kc07jq0p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="347829710"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="347829710"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 15:40:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="688805722"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="688805722"
Received: from spandruv-desk.jf.intel.com ([10.54.75.8])
  by orsmga006.jf.intel.com with ESMTP; 12 Jun 2023 15:40:35 -0700
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 1/2] platform/x86: ISST: Reset default callback on unregister
Date:   Mon, 12 Jun 2023 15:40:32 -0700
Message-Id: <20230612224033.2382527-2-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230612224033.2382527-1-srinivas.pandruvada@linux.intel.com>
References: <20230612224033.2382527-1-srinivas.pandruvada@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

When multiple clients are registered and some of those modules are
removed, the default IOCTL callback for those clients are still not
NULL. Calling them will result in crash.

Set the default IOCTL callback pointer to NULL on unregister.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/platform/x86/intel/speed_select_if/isst_if_common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
index e0572a29212e..352bf5118d17 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
@@ -831,6 +831,7 @@ void isst_if_cdev_unregister(int device_type)
 {
 	isst_misc_unreg();
 	mutex_lock(&punit_misc_dev_open_lock);
+	punit_callbacks[device_type].def_ioctl = NULL;
 	punit_callbacks[device_type].registered = 0;
 	if (device_type == ISST_IF_DEV_MBOX)
 		isst_delete_hash();
-- 
2.38.1

