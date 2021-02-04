Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F3A8C433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 16:24:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDFCE64DEC
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 16:24:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237938AbhBDQXv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 11:23:51 -0500
Received: from mga11.intel.com ([192.55.52.93]:38841 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237116AbhBDPHH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 10:07:07 -0500
IronPort-SDR: p/ccd/7gVesslBWWlfeFcX8c1ndra6J4sFa8/yiAaNgLIruHx6ivvYMKDWhwfdvCvtTdOX7hV0
 AiuSO6nV5i6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="177749898"
X-IronPort-AV: E=Sophos;i="5.79,401,1602572400"; 
   d="scan'208";a="177749898"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2021 07:05:16 -0800
IronPort-SDR: qpFxc4Gs9zVk3fBchzd9P+a398HkNPFxZ2SJNFVz2e8Jf0JWe0A9aN/5by4g8WfBqEDVLFzJo+
 budeJQJ5eAiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,401,1602572400"; 
   d="scan'208";a="359822947"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 04 Feb 2021 07:05:14 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2E4E91EC; Thu,  4 Feb 2021 17:05:14 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v1] platform/x86: intel_scu_wdt: Drop mistakenly added const
Date:   Thu,  4 Feb 2021 17:05:08 +0200
Message-Id: <20210204150508.62659-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Neither original structure nor platform_data is declared with const.
Drop mistakenly added const when assing platform_data.

Fixes: a507e5d90f3d ("platform/x86: intel_scu_wdt: Get rid of custom x86 model comparison")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_scu_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_scu_wdt.c b/drivers/platform/x86/intel_scu_wdt.c
index 85ee85ca2215..c2479777a1d6 100644
--- a/drivers/platform/x86/intel_scu_wdt.c
+++ b/drivers/platform/x86/intel_scu_wdt.c
@@ -63,7 +63,7 @@ static int __init register_mid_wdt(void)
 	if (!id)
 		return -ENODEV;
 
-	wdt_dev.dev.platform_data = (const struct intel_mid_wdt_pdata *)id->driver_data;
+	wdt_dev.dev.platform_data = (struct intel_mid_wdt_pdata *)id->driver_data;
 	return platform_device_register(&wdt_dev);
 }
 arch_initcall(register_mid_wdt);
-- 
2.30.0

