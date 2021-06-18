Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A46C48BDF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 18 Jun 2021 12:55:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 389C4610CD
	for <platform-driver-x86@archiver.kernel.org>; Fri, 18 Jun 2021 12:55:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232605AbhFRM5K (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 18 Jun 2021 08:57:10 -0400
Received: from mga07.intel.com ([134.134.136.100]:14292 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231744AbhFRM5J (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Jun 2021 08:57:09 -0400
IronPort-SDR: CfzVCoeNP4i7+0hTuQodrMktSLRoLD/94odF51bXs3GPtm+O1BX0+Js+WknMwmioc9yOs3q49g
 bQrN/b88OPew==
X-IronPort-AV: E=McAfee;i="6200,9189,10018"; a="270395764"
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; 
   d="scan'208";a="270395764"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2021 05:54:59 -0700
IronPort-SDR: fxzRZm/N1awtURcO1pTxiZTME1oCwtV4ViR0+693/eeVhUMXtSBg47EhHgTO4ojBC7z4LyriJD
 bMIWYYzluCTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; 
   d="scan'208";a="638149205"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 18 Jun 2021 05:54:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9BBAB636; Fri, 18 Jun 2021 15:55:21 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     Mark Gross <mgross@linux.intel.com>
Subject: [PATCH v2 5/8] platform/x86: intel_skl_int3472: Provide skl_int3472_unregister_regulator()
Date:   Fri, 18 Jun 2021 15:55:13 +0300
Message-Id: <20210618125516.53510-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210618125516.53510-1-andriy.shevchenko@linux.intel.com>
References: <20210618125516.53510-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

For the sake of APIs to be properly layered provide
skl_int3472_unregister_regulator().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: new patch
 .../x86/intel-int3472/intel_skl_int3472_clk_and_regulator.c | 6 ++++++
 .../platform/x86/intel-int3472/intel_skl_int3472_common.h   | 2 ++
 .../platform/x86/intel-int3472/intel_skl_int3472_discrete.c | 4 ++--
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel-int3472/intel_skl_int3472_clk_and_regulator.c b/drivers/platform/x86/intel-int3472/intel_skl_int3472_clk_and_regulator.c
index 49ea1e86c193..60c7128f44ee 100644
--- a/drivers/platform/x86/intel-int3472/intel_skl_int3472_clk_and_regulator.c
+++ b/drivers/platform/x86/intel-int3472/intel_skl_int3472_clk_and_regulator.c
@@ -193,3 +193,9 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 
 	return ret;
 }
+
+void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472)
+{
+	regulator_unregister(int3472->regulator.rdev);
+	gpiod_put(int3472->regulator.gpio);
+}
diff --git a/drivers/platform/x86/intel-int3472/intel_skl_int3472_common.h b/drivers/platform/x86/intel-int3472/intel_skl_int3472_common.h
index 765e01ec1604..50f73c6eab44 100644
--- a/drivers/platform/x86/intel-int3472/intel_skl_int3472_common.h
+++ b/drivers/platform/x86/intel-int3472/intel_skl_int3472_common.h
@@ -112,7 +112,9 @@ union acpi_object *skl_int3472_get_acpi_buffer(struct acpi_device *adev,
 					       char *id);
 int skl_int3472_fill_cldb(struct acpi_device *adev, struct int3472_cldb *cldb);
 int skl_int3472_register_clock(struct int3472_discrete_device *int3472);
+
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 				   struct acpi_resource_gpio *agpio);
+void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
 
 #endif
diff --git a/drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c b/drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c
index fd681d2a73fe..2638d375e226 100644
--- a/drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c
+++ b/drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c
@@ -400,15 +400,15 @@ int skl_int3472_discrete_remove(struct platform_device *pdev)
 	struct int3472_discrete_device *int3472 = platform_get_drvdata(pdev);
 
 	gpiod_remove_lookup_table(&int3472->gpios);
-	regulator_unregister(int3472->regulator.rdev);
 	clk_unregister(int3472->clock.clk);
 
 	if (int3472->clock.cl)
 		clkdev_drop(int3472->clock.cl);
 
-	gpiod_put(int3472->regulator.gpio);
 	gpiod_put(int3472->clock.ena_gpio);
 	gpiod_put(int3472->clock.led_gpio);
 
+	skl_int3472_unregister_regulator(int3472);
+
 	return 0;
 }
-- 
2.30.2

