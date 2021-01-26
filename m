Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC96FC433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jan 2021 07:01:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C4DF2072C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jan 2021 07:01:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S316450AbhA0BDc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Jan 2021 20:03:32 -0500
Received: from mga06.intel.com ([134.134.136.31]:22403 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732138AbhAZU5A (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Jan 2021 15:57:00 -0500
IronPort-SDR: EXCIfKYWc7SHDoBrYAPOeqXZHTHsRHNpem80Gop2kxodePOjWqvfK7idC3glqI1jJX1vMdM0pl
 gFq6s8ofLIwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="241500151"
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; 
   d="scan'208";a="241500151"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 12:55:10 -0800
IronPort-SDR: sKEk9XZ9yGG7sQiEwrN0nAXAf/bO7EQ3NfIU3eVoQdjlJ/ye0W+ocQ77Ht97K4yYPYuR6XJB/G
 UyjnbzZSTf8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; 
   d="scan'208";a="472877740"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga001.fm.intel.com with ESMTP; 26 Jan 2021 12:55:09 -0800
Received: from debox1-desk2.jf.intel.com (debox1-desk2.jf.intel.com [10.54.75.16])
        by linux.intel.com (Postfix) with ESMTP id B58C65807C8;
        Tue, 26 Jan 2021 12:55:09 -0800 (PST)
From:   "David E. Box" <david.e.box@linux.intel.com>
To:     mark.gross@intel.com, hdegoede@redhat.com, lee.jones@linaro.org,
        torvalds@linux-foundation.org
Cc:     "David E. Box" <david.e.box@linux.intel.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/3] platform/x86: intel_pmt_telemetry: Add dependency on MFD_INTEL_PMT
Date:   Tue, 26 Jan 2021 12:55:07 -0800
Message-Id: <20210126205508.30907-2-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210126205508.30907-1-david.e.box@linux.intel.com>
References: <20210126205508.30907-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

All devices that expose Intel Platform Monitoring Technology (PMT)
telemetry are currently owned by the intel_pmt MFD driver. Therefore make
the telemetry driver depend on the MFD driver for build.

Fixes: 68fe8e6e2c4b ("platform/x86: Intel PMT Telemetry capability driver")
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index af75c3342c06..9948c5f4928d 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1382,6 +1382,7 @@ config INTEL_PMT_CLASS
 
 config INTEL_PMT_TELEMETRY
 	tristate "Intel Platform Monitoring Technology (PMT) Telemetry driver"
+	depends on MFD_INTEL_PMT
 	select INTEL_PMT_CLASS
 	help
 	  The Intel Platform Monitory Technology (PMT) Telemetry driver provides
-- 
2.20.1

