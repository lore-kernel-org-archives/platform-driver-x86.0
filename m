Return-Path: <SRS0=FuY/=EL=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD74C4742C
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Nov 2020 11:05:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D61B2072E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Nov 2020 11:05:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730114AbgKELFf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Nov 2020 06:05:35 -0500
Received: from mga06.intel.com ([134.134.136.31]:25375 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726400AbgKELFf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Nov 2020 06:05:35 -0500
IronPort-SDR: WhHrKdU3x3vOizcvAuIoRgGGLnt9OOADOGEP3Y9VyC6OIgDW026ZDuTaJHMSxri1Mxv2AwyFZ5
 3eVOPyQf50Uw==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="230990809"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="230990809"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 03:05:35 -0800
IronPort-SDR: 37ZzMUHaEdfOz45WQsOCnZRRi9iumzL81EFETAQjVynriufKTOOkOSqqkvM/2snWc/LSdXBxsy
 vBuwNZPlLogQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="358387978"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 05 Nov 2020 03:05:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 07EA4252; Thu,  5 Nov 2020 13:05:30 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/4] platform/x86: i2c-multi-instantiate: Drop redundant ACPI_PTR()
Date:   Thu,  5 Nov 2020 13:05:27 +0200
Message-Id: <20201105110530.27888-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The driver depends on ACPI, ACPI_PTR() resolution is always the same.
Otherwise a compiler may produce a warning.

That said, the rule of thumb either ugly ifdeffery with ACPI_PTR or
none should be used in a driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/i2c-multi-instantiate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
index 6acc8457866e..d92d9a98ec8f 100644
--- a/drivers/platform/x86/i2c-multi-instantiate.c
+++ b/drivers/platform/x86/i2c-multi-instantiate.c
@@ -189,7 +189,7 @@ MODULE_DEVICE_TABLE(acpi, i2c_multi_inst_acpi_ids);
 static struct platform_driver i2c_multi_inst_driver = {
 	.driver	= {
 		.name = "I2C multi instantiate pseudo device driver",
-		.acpi_match_table = ACPI_PTR(i2c_multi_inst_acpi_ids),
+		.acpi_match_table = i2c_multi_inst_acpi_ids,
 	},
 	.probe = i2c_multi_inst_probe,
 	.remove = i2c_multi_inst_remove,
-- 
2.28.0

