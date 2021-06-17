Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCD7C49EA3
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 18:30:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34AAF613AA
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 18:30:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233176AbhFQSdC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Jun 2021 14:33:02 -0400
Received: from mga17.intel.com ([192.55.52.151]:17452 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233149AbhFQSdB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Jun 2021 14:33:01 -0400
IronPort-SDR: YtJaaXpDXaAJyClg4CZ0Y4PqYQQbBMAsJ5+J0pVK5cqCa9SD8cayNIAG3SSV8cWbocLLNQl30/
 qgxigTCgqDwQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10018"; a="186807546"
X-IronPort-AV: E=Sophos;i="5.83,281,1616482800"; 
   d="scan'208";a="186807546"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 11:30:50 -0700
IronPort-SDR: +iXi/ZHyLbdkBYnEeZSRtHbHRTYwrStw7bsae02tiWsGPX1UQpp4azQtasjbBEMZwe5uC/9pcy
 b+6Rmb36iluw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,281,1616482800"; 
   d="scan'208";a="479549183"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2021 11:30:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E4C2423A; Thu, 17 Jun 2021 21:31:12 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     Mark Gross <mgross@linux.intel.com>
Subject: [PATCH v1 2/4] platform/x86: intel_skl_int3472: Fix dependencies (drop CLKDEV_LOOKUP)
Date:   Thu, 17 Jun 2021 21:30:29 +0300
Message-Id: <20210617183031.70685-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210617183031.70685-1-andriy.shevchenko@linux.intel.com>
References: <20210617183031.70685-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Besides the fact that COMMON_CLK selects CLKDEV_LOOKUP, the latter
is going to be removed from clock framework.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel-int3472/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel-int3472/Kconfig b/drivers/platform/x86/intel-int3472/Kconfig
index c112878e833b..62e5d4cf9ee5 100644
--- a/drivers/platform/x86/intel-int3472/Kconfig
+++ b/drivers/platform/x86/intel-int3472/Kconfig
@@ -1,7 +1,7 @@
 config INTEL_SKL_INT3472
 	tristate "Intel SkyLake ACPI INT3472 Driver"
 	depends on ACPI
-	depends on COMMON_CLK && CLKDEV_LOOKUP
+	depends on COMMON_CLK
 	depends on I2C
 	depends on GPIOLIB
 	depends on REGULATOR
-- 
2.30.2

