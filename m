Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F565C4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 16:32:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3823E60F8F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 16:32:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233013AbhHCQcw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Aug 2021 12:32:52 -0400
Received: from mga18.intel.com ([134.134.136.126]:28592 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232739AbhHCQcw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Aug 2021 12:32:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="200921600"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; 
   d="scan'208";a="200921600"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2021 09:32:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; 
   d="scan'208";a="458334938"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 03 Aug 2021 09:32:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E1F1C169; Tue,  3 Aug 2021 19:32:57 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH v1 1/1] platform/surface: surface3_power: Use i2c_acpi_get_i2c_resource() helper
Date:   Tue,  3 Aug 2021 19:32:52 +0300
Message-Id: <20210803163252.60141-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

ACPI provides a generic helper to get I²C Serial Bus resources.
Use it instead of open coded variant.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/surface/surface3_power.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/platform/surface/surface3_power.c b/drivers/platform/surface/surface3_power.c
index dea82aa1abd4..90c1568ea4e0 100644
--- a/drivers/platform/surface/surface3_power.c
+++ b/drivers/platform/surface/surface3_power.c
@@ -384,13 +384,7 @@ mshw0011_space_handler(u32 function, acpi_physical_address command,
 	if (ACPI_FAILURE(ret))
 		return ret;
 
-	if (!value64 || ares->type != ACPI_RESOURCE_TYPE_SERIAL_BUS) {
-		ret = AE_BAD_PARAMETER;
-		goto err;
-	}
-
-	sb = &ares->data.i2c_serial_bus;
-	if (sb->type != ACPI_RESOURCE_SERIAL_TYPE_I2C) {
+	if (!value64 || !i2c_acpi_get_i2c_resource(ares, &sb)) {
 		ret = AE_BAD_PARAMETER;
 		goto err;
 	}
-- 
2.30.2

