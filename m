Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C7EC61DA4
	for <platform-driver-x86@archiver.kernel.org>; Thu,  9 Mar 2023 09:40:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjCIJkT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 9 Mar 2023 04:40:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbjCIJjs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Mar 2023 04:39:48 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF1FE0608
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Mar 2023 01:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678354738;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=qNEp2StRmiUH+Zkp/TFDzviO8/yeDbenPeySy/ZqZNg=;
        b=NK96ogK0ddXND00+lrw9K2DEqXHMfyULkawirUw8x1Iy9Hj2MbMHTBTOsnhE4ABV17uRPD
        JxZHSmrAAdpIH5okS2vmnblLnstOEw6a6mMTeRNZ/Ymff2DlUxEnG/XGk/o8f8aDQzisWy
        eLv95mmN3vICsmpcFULvFG6afdwMMjw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-U-fZ47gOPf6xiYQUa9aK0w-1; Thu, 09 Mar 2023 04:38:54 -0500
X-MC-Unique: U-fZ47gOPf6xiYQUa9aK0w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C1FF80280D;
        Thu,  9 Mar 2023 09:38:52 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.206])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 673882026D4B;
        Thu,  9 Mar 2023 09:38:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] platform/x86: x86-android-tablets: Add depends on PMIC_OPREGION
Date:   Thu,  9 Mar 2023 10:38:50 +0100
Message-Id: <20230309093850.18523-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a depends on PMIC_OPREGION to x86-android-tablets Kconfig to fix
the following build error:

ERROR: modpost: "intel_soc_pmic_exec_mipi_pmic_seq_element"
 [drivers/platform/x86/x86-android-tablets/x86-android-tablets.ko] undefined!

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202303091711.howZNrIY-lkp@intel.com/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/x86-android-tablets/Kconfig b/drivers/platform/x86/x86-android-tablets/Kconfig
index 2b3daca5380b..6603461d4273 100644
--- a/drivers/platform/x86/x86-android-tablets/Kconfig
+++ b/drivers/platform/x86/x86-android-tablets/Kconfig
@@ -5,7 +5,7 @@
 
 config X86_ANDROID_TABLETS
 	tristate "X86 Android tablet support"
-	depends on I2C && SPI && SERIAL_DEV_BUS && ACPI && EFI && GPIOLIB
+	depends on I2C && SPI && SERIAL_DEV_BUS && ACPI && EFI && GPIOLIB && PMIC_OPREGION
 	help
 	  X86 tablets which ship with Android as (part of) the factory image
 	  typically have various problems with their DSDTs. The factory kernels
-- 
2.39.1

