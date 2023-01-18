Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F19C32793
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Jan 2023 10:34:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjARKeG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Jan 2023 05:34:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbjARKck (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Jan 2023 05:32:40 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AFF4BFF5D;
        Wed, 18 Jan 2023 01:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674034788; x=1705570788;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OMiVPWb529ClNy6BN+8kKxsiDppRN30QiyN94p7GEAk=;
  b=RQvUNhhTe4VkwqheKCe64YaQlTv6Ttp4ShYH3DCluGJgpJTZlOP8DW8b
   RPPqI2uiWRWk0zHyrFdePGy1qmqiOcKoQ4t5524B7JlfDqjD6R++VoO/h
   7lHaRFAWgowxMwf7E1PdzycnArRXwtN29lo2x0DAoahXB7mnRHDzz9cPc
   M3cED6TFDWhAX9TjnpBVXZQi94qZjz4C2X/VXCbVF8ajiQ/DAuXyhA9ya
   yJprOCUbYuvzafCZkIgiVAsPi06Ps7lnqdbuKsdAjVOKLcbnphN/ECGxv
   DZZSsAhlIwBDEiIBZt/CnE+sbGL7bDCTkDFlfiFGQXRAZf6VEsADj9wdb
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="322631760"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="322631760"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 01:37:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="609580387"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="609580387"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 18 Jan 2023 01:37:50 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4C916368; Wed, 18 Jan 2023 11:38:25 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <markgross@kernel.org>
Subject: [PATCH v1 1/1] platform/surface: Switch to use acpi_evaluate_dsm_typed()
Date:   Wed, 18 Jan 2023 11:38:23 +0200
Message-Id: <20230118093823.39679-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The acpi_evaluate_dsm_typed() provides a way to check the type of the
object evaluated by _DSM call. Use it instead of open coded variant.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/surface/surface_hotplug.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/surface/surface_hotplug.c b/drivers/platform/surface/surface_hotplug.c
index f004a2495201..7b6d887dccdb 100644
--- a/drivers/platform/surface/surface_hotplug.c
+++ b/drivers/platform/surface/surface_hotplug.c
@@ -101,18 +101,12 @@ static void shps_dsm_notify_irq(struct platform_device *pdev, enum shps_irq_type
 	param.type = ACPI_TYPE_INTEGER;
 	param.integer.value = value;
 
-	result = acpi_evaluate_dsm(handle, &shps_dsm_guid, SHPS_DSM_REVISION,
-				   shps_dsm_fn_for_irq(type), &param);
-
+	result = acpi_evaluate_dsm_typed(handle, &shps_dsm_guid, SHPS_DSM_REVISION,
+					 shps_dsm_fn_for_irq(type), &param, ACPI_TYPE_BUFFER);
 	if (!result) {
 		dev_err(&pdev->dev, "IRQ notification via DSM failed (irq=%d, gpio=%d)\n",
 			type, value);
 
-	} else if (result->type != ACPI_TYPE_BUFFER) {
-		dev_err(&pdev->dev,
-			"IRQ notification via DSM failed: unexpected result type (irq=%d, gpio=%d)\n",
-			type, value);
-
 	} else if (result->buffer.length != 1 || result->buffer.pointer[0] != 0) {
 		dev_err(&pdev->dev,
 			"IRQ notification via DSM failed: unexpected result value (irq=%d, gpio=%d)\n",
@@ -121,8 +115,7 @@ static void shps_dsm_notify_irq(struct platform_device *pdev, enum shps_irq_type
 
 	mutex_unlock(&sdev->lock[type]);
 
-	if (result)
-		ACPI_FREE(result);
+	ACPI_FREE(result);
 }
 
 static irqreturn_t shps_handle_irq(int irq, void *data)
-- 
2.39.0

