Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F57C4338F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Aug 2021 15:56:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C97296052B
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Aug 2021 15:56:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244918AbhHFP4Y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Aug 2021 11:56:24 -0400
Received: from mga01.intel.com ([192.55.52.88]:56088 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244860AbhHFP4Y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Aug 2021 11:56:24 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10068"; a="236374873"
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; 
   d="scan'208";a="236374873"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2021 08:56:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,301,1620716400"; 
   d="scan'208";a="502039460"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 06 Aug 2021 08:56:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CEFE0DE; Fri,  6 Aug 2021 18:49:54 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Daniel Scally <djrscally@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] platform/x86/intel: int3472: Use y instead of objs in Makefile
Date:   Fri,  6 Aug 2021 18:49:51 +0300
Message-Id: <20210806154951.4564-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The 'objs' is for user space tools, for the kernel modules
we should use 'y'.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel/int3472/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/int3472/Makefile b/drivers/platform/x86/intel/int3472/Makefile
index 48bd97f0a04e..2362e04db18d 100644
--- a/drivers/platform/x86/intel/int3472/Makefile
+++ b/drivers/platform/x86/intel/int3472/Makefile
@@ -1,5 +1,5 @@
 obj-$(CONFIG_INTEL_SKL_INT3472)		+= intel_skl_int3472.o
-intel_skl_int3472-objs			:= intel_skl_int3472_common.o \
+intel_skl_int3472-y			:= intel_skl_int3472_common.o \
 					   intel_skl_int3472_discrete.o \
 					   intel_skl_int3472_tps68470.o \
 					   intel_skl_int3472_clk_and_regulator.o
-- 
2.30.2

