Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FB8C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jan 2021 01:03:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14E11206A1
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jan 2021 01:03:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389514AbhA0BDU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Jan 2021 20:03:20 -0500
Received: from mga09.intel.com ([134.134.136.24]:58498 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405839AbhAZU44 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Jan 2021 15:56:56 -0500
IronPort-SDR: 5iw7a4Jhf+fZcB9vo+s80+zgyfnZ71nFo+STABN5v+LdWlnFu/PL0WNVkf+vl0rHEnMzcuvvly
 hdwswq2GXBmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="180116815"
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; 
   d="scan'208";a="180116815"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 12:55:06 -0800
IronPort-SDR: UNrPRfrk6KTVXEtEVH3GBQe8VZXjI3tr7c/iJe87wgJWMNCjDlc7bymwqYfDwIf835MnoZk8VV
 ZfVMbLyHD59g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; 
   d="scan'208";a="574163567"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga006.fm.intel.com with ESMTP; 26 Jan 2021 12:55:06 -0800
Received: from debox1-desk2.jf.intel.com (debox1-desk2.jf.intel.com [10.54.75.16])
        by linux.intel.com (Postfix) with ESMTP id 0F6625807C8;
        Tue, 26 Jan 2021 12:55:06 -0800 (PST)
From:   "David E. Box" <david.e.box@linux.intel.com>
To:     mark.gross@intel.com, hdegoede@redhat.com, lee.jones@linaro.org,
        torvalds@linux-foundation.org
Cc:     "David E. Box" <david.e.box@linux.intel.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/3] platform/x86: intel_pmt: Make INTEL_PMT_CLASS non-user-selectable
Date:   Tue, 26 Jan 2021 12:55:06 -0800
Message-Id: <20210126205508.30907-1-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix error in Kconfig that exposed INTEL_PMT_CLASS as a user selectable
option. It is already selected by INTEL_PMT_TELEMETRY and
INTEL_PMT_CRASHLOG which are user selectable.

Fixes: e2729113ce66 ("platform/x86: Intel PMT class driver")
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 91e6176cdfbd..af75c3342c06 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1369,7 +1369,7 @@ config INTEL_PMC_CORE
 		- MPHY/PLL gating status (Sunrisepoint PCH only)
 
 config INTEL_PMT_CLASS
-	tristate "Intel Platform Monitoring Technology (PMT) Class driver"
+	tristate
 	help
 	  The Intel Platform Monitoring Technology (PMT) class driver provides
 	  the basic sysfs interface and file hierarchy uses by PMT devices.
-- 
2.20.1

