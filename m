Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2914C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Sat, 11 Feb 2023 06:33:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjBKGdM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 11 Feb 2023 01:33:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjBKGdL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Feb 2023 01:33:11 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03E87BFC0;
        Fri, 10 Feb 2023 22:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676097182; x=1707633182;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aSa0voDbVlQ0oEnSMilPioANkC4qJhTaqENQNtEWsbk=;
  b=VMjpwnEsv0Bptl9t77ZyY3uyzQ+62mqaNoBXCYgtpgAik7mCUfFHswl2
   QKoGP4DXsQ235+KTQTvkUmsCzbxHsn6jZhvOCaY7GZHqJvEKl4T2MEi9M
   mkf0KM7VFSy+1udM9PPTX/BikKznUK/IPLzA06i/HpRhyPZE+wPJlMwPa
   M41GtIsSjXxGRY438naXz6vC/wu2y+INwqegXEv0nqzeEjrigKlZNSc/Q
   RqnGfjV4YXfDMGenJrhbSrU2KRFaarr6OQhdM0iHRzcq711/9/YSDLVub
   k10vMbrAuN6jPVHsQSQvAcvq7V++ERBFCpOPcFrKVpet3dwwH0ArNmFQH
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="310223198"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="310223198"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 22:33:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="997171762"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="997171762"
Received: from spandruv-desk.jf.intel.com ([10.54.75.8])
  by fmsmga005.fm.intel.com with ESMTP; 10 Feb 2023 22:33:00 -0800
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 02/12] platform/x86: ISST: Add TPMI target
Date:   Fri, 10 Feb 2023 22:32:47 -0800
Message-Id: <20230211063257.311746-3-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211063257.311746-1-srinivas.pandruvada@linux.intel.com>
References: <20230211063257.311746-1-srinivas.pandruvada@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add TPMI as one of the device type which can be registered with ISST
common driver.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/platform/x86/intel/speed_select_if/isst_if_common.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.h b/drivers/platform/x86/intel/speed_select_if/isst_if_common.h
index 35ff506b402e..967c338e83c5 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.h
+++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.h
@@ -30,7 +30,8 @@
 
 #define ISST_IF_DEV_MBOX	0
 #define ISST_IF_DEV_MMIO	1
-#define ISST_IF_DEV_MAX		2
+#define ISST_IF_DEV_TPMI	2
+#define ISST_IF_DEV_MAX		3
 
 /**
  * struct isst_if_cmd_cb - Used to register a IOCTL handler
-- 
2.39.1

