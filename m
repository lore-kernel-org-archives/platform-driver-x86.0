Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 186CBC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 Oct 2022 12:24:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbiJDMYp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 Oct 2022 08:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbiJDMYn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Oct 2022 08:24:43 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 436FE6342;
        Tue,  4 Oct 2022 05:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664886282; x=1696422282;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SJ09/JMn8unIFQin7GqhIUUde5CDgaLhkNu2ObIMw2E=;
  b=NWx8t1W21MBfp/ZCkKWBxwlkZOnq/557tLPJ3BDPS+D7qDxyfe2ndl0+
   chtJtuQWGZ+9Vm9AyjxEEH33HBLIilktdlnuPVqkwpIp3KZbEEZhvD0y6
   vJoYE6v2j4yiRybn8kaoA0lktjUvsx9AuNRGhHZ/uTDnxfAPIMU8lxwpK
   Htt/V4aqEd7Qi+7ej/kergWJJrEjLEuD+Tq1lNAX1ltAPnuddZffNn+Dv
   kXsmO8Wc3iWxVV8j72I4xlQv25nbHMmQuWswRAzD/w8GJxGz2O9qY5j4b
   6JhwYko9pA/vwnquiC1+tdn3KmiTC6qQJ6pdpTL5dGLupY8Ou0VmU03JQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="301616166"
X-IronPort-AV: E=Sophos;i="5.93,157,1654585200"; 
   d="scan'208";a="301616166"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 05:24:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="686528640"
X-IronPort-AV: E=Sophos;i="5.93,157,1654585200"; 
   d="scan'208";a="686528640"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 04 Oct 2022 05:24:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 89E3C155; Tue,  4 Oct 2022 15:24:59 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Subject: [PATCH v1 1/1] platform/x86: int3472: Don't leak reference on error
Date:   Tue,  4 Oct 2022 15:24:58 +0300
Message-Id: <20221004122458.61703-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The for_each_acpi_consumer_dev() takes a reference to the iterator
and if we break a loop we must drop that reference. This usually
happens when error handling is involved. However it's not the case
for skl_int3472_fill_clk_pdata().

Don't leak reference on error by dropping it properly.

Fixes: 43cf36974d76 ("platform/x86: int3472: Support multiple clock consumers")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index f83e9c393f31..5b8d1a9620a5 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -128,15 +128,15 @@ skl_int3472_fill_clk_pdata(struct device *dev, struct tps68470_clk_platform_data
 	for_each_acpi_consumer_dev(adev, consumer) {
 		sensor_name = devm_kasprintf(dev, GFP_KERNEL, I2C_DEV_NAME_FORMAT,
 					     acpi_dev_name(consumer));
-		if (!sensor_name)
+		if (!sensor_name) {
+			acpi_dev_put(consumer);
 			return -ENOMEM;
+		}
 
 		(*clk_pdata)->consumers[i].consumer_dev_name = sensor_name;
 		i++;
 	}
 
-	acpi_dev_put(consumer);
-
 	return n_consumers;
 }
 
-- 
2.35.1

