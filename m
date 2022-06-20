Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CABCCA47C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Jun 2022 15:11:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242380AbiFTPLV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Jun 2022 11:11:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242875AbiFTPJz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Jun 2022 11:09:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4B8A42495C
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 07:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655736993;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=zeOaM52n9yn626zmGJRt9KCtFFVlV1VwECI83RVMcPE=;
        b=EGpAcux33l78xC5KJmc8ENIImLeMYm9r/UuKtZ6FlDVQ7MJPuiausaqSrraoFbw3jf79sl
        GfUDT3Qzu1FO04U4OusbRmOQgOgxFStfIrenfiwzBinl6splU21KqqrfGpvYSWnmuN7MsW
        EQBn3pfANgMXTeG8zHUCp+TmA5gkm7Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-2OdGCRGMPPiQoCdlMyZdGQ-1; Mon, 20 Jun 2022 10:56:32 -0400
X-MC-Unique: 2OdGCRGMPPiQoCdlMyZdGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88DCD811E76;
        Mon, 20 Jun 2022 14:56:31 +0000 (UTC)
Received: from x1.nl (unknown [10.39.192.239])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 294E69D63;
        Mon, 20 Jun 2022 14:56:29 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 1/3] platform/x86: acer_wmi: Cleanup Kconfig selects
Date:   Mon, 20 Jun 2022 16:56:26 +0200
Message-Id: <20220620145628.5882-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

ACER_WMI already depends on ACPI_WMI which depends on ACPI
so the "depends on ACPI" is unnecessary.

And since ACER_WMI already depends on ACPI adding an "if ACPI"
to the ACPI_VIDEO select is nonsense.

While at it also group all the selects together.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/Kconfig | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 08852a1cd51d..6e22ac916f7a 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -177,17 +177,15 @@ config ACER_WIRELESS
 
 config ACER_WMI
 	tristate "Acer WMI Laptop Extras"
-	depends on ACPI
-	select LEDS_CLASS
-	select NEW_LEDS
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on SERIO_I8042
 	depends on INPUT
 	depends on RFKILL || RFKILL = n
 	depends on ACPI_WMI
+	select ACPI_VIDEO
 	select INPUT_SPARSEKMAP
-	# Acer WMI depends on ACPI_VIDEO when ACPI is enabled
-        select ACPI_VIDEO if ACPI
+	select LEDS_CLASS
+	select NEW_LEDS
 	help
 	  This is a driver for newer Acer (and Wistron) laptops. It adds
 	  wireless radio and bluetooth control, and on some laptops,
-- 
2.36.0

