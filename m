Return-Path: <SRS0=FuY/=EL=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BE6C4741F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Nov 2020 11:05:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 745CD2072E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Nov 2020 11:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730108AbgKELFe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Nov 2020 06:05:34 -0500
Received: from mga01.intel.com ([192.55.52.88]:27115 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726400AbgKELFd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Nov 2020 06:05:33 -0500
IronPort-SDR: Z2dYKKQXFlcpSBXc4Pez/9yzL+UmZd7wgkVjmR17XdyxkD0oArImGtIUvfAYJZD6zHpXrQ1cn/
 7bYnHFWzWYmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="187270545"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="187270545"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 03:05:33 -0800
IronPort-SDR: SQP9MzFv/4UF/kRmEryuTalATWp6NouXC90p7o33m4GPjXM89XjCzAAlcRPEcJsctCUfpbRdqI
 b8z9z2RquZeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="325989208"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 05 Nov 2020 03:05:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 230353BB; Thu,  5 Nov 2020 13:05:31 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/4] platform/x86: i2c-multi-instantiate: Use device_get_match_data() to get driver data
Date:   Thu,  5 Nov 2020 13:05:30 +0200
Message-Id: <20201105110530.27888-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201105110530.27888-1-andriy.shevchenko@linux.intel.com>
References: <20201105110530.27888-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Use device_get_match_data() to get driver data instead of boilerplate code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/i2c-multi-instantiate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
index 422fa88da643..da50e9ec64a8 100644
--- a/drivers/platform/x86/i2c-multi-instantiate.c
+++ b/drivers/platform/x86/i2c-multi-instantiate.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/types.h>
 
 #define IRQ_RESOURCE_TYPE	GENMASK(1, 0)
@@ -59,7 +60,6 @@ static int i2c_multi_inst_count_resources(struct acpi_device *adev)
 static int i2c_multi_inst_probe(struct platform_device *pdev)
 {
 	struct i2c_multi_inst_data *multi;
-	const struct acpi_device_id *match;
 	const struct i2c_inst_data *inst_data;
 	struct i2c_board_info board_info = {};
 	struct device *dev = &pdev->dev;
@@ -68,12 +68,11 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
 	char name[32];
 	int ret;
 
-	match = acpi_match_device(dev->driver->acpi_match_table, dev);
-	if (!match) {
+	inst_data = device_get_match_data(dev);
+	if (!inst_data) {
 		dev_err(dev, "Error ACPI match data is missing\n");
 		return -ENODEV;
 	}
-	inst_data = (const struct i2c_inst_data *)match->driver_data;
 
 	adev = ACPI_COMPANION(dev);
 
-- 
2.28.0

