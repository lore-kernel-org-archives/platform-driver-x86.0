Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29735C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Mar 2022 15:30:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242543AbiCHPa5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Mar 2022 10:30:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiCHPa4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Mar 2022 10:30:56 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3EEF04E395
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Mar 2022 07:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646753399;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=z6k/FKltXCufc7GDJiYcbKMx6JUSDgA0vmgkjosKb6Y=;
        b=HIiufjtVt9DUGUDnpNx9DeySVufqX/g09vRBSoTPV+HyT27jRNeYvjw0rvbKJQs0hGaTvU
        tlGjQRvxU7YHjFAUuf2dfnBXewTS6AreBpn4ti2oO0qa35ni9mXdPkKGlyD+eR0hYutVtM
        WXXHysS+iFflYeJpQBSGBLECOyoqOu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-bOkGwCkdP56tttQLwUHYlA-1; Tue, 08 Mar 2022 10:29:56 -0500
X-MC-Unique: bOkGwCkdP56tttQLwUHYlA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B106800050;
        Tue,  8 Mar 2022 15:29:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.216])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F10941064166;
        Tue,  8 Mar 2022 15:29:53 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] platform/x86: x86-android-tablets: Depend on EFI and SPI
Date:   Tue,  8 Mar 2022 16:29:42 +0100
Message-Id: <20220308152942.262130-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The recently added support for Lenovo Yoga Tablet 2 tablets uses
symbols from EFI and SPI add "depends on EFI && SPI" to the
X86_ANDROID_TABLETS Kconfig entry.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0d51011d5d90..5d9dd70e4e0f 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1041,7 +1041,7 @@ config TOUCHSCREEN_DMI
 
 config X86_ANDROID_TABLETS
 	tristate "X86 Android tablet support"
-	depends on I2C && SERIAL_DEV_BUS && ACPI && GPIOLIB
+	depends on I2C && SPI && SERIAL_DEV_BUS && ACPI && EFI && GPIOLIB
 	help
 	  X86 tablets which ship with Android as (part of) the factory image
 	  typically have various problems with their DSDTs. The factory kernels
-- 
2.35.1

