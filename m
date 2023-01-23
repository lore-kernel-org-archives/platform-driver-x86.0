Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B25C38142
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Jan 2023 15:46:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232873AbjAWPqH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Jan 2023 10:46:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232358AbjAWPqG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Jan 2023 10:46:06 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C37185592
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 07:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674488720;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=3XvCKMjzBtw7orSrRswwNOhRiRgMiXyyNcyVCT/bWhU=;
        b=ELXLmnfaVpN83yi5++KJMTr1b85bJAB7SUk9EFKaIn3NQJuDI3TCJ34KeYnqluVNkb+Cst
        aEHHBDC6UAH9Rl7OV8P74RXpWSosFGWCPrzcvHIkimpU5rUmclVOh8IU2Z8i+tuiIwoVWZ
        gZncJzXBv5LNnNwetB3LnTk2Bc1sc1g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-KiM1HKHxOGOuxocfp8IK7w-1; Mon, 23 Jan 2023 10:45:16 -0500
X-MC-Unique: KiM1HKHxOGOuxocfp8IK7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C6DD1991C44;
        Mon, 23 Jan 2023 15:45:15 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 946241121330;
        Mon, 23 Jan 2023 15:45:13 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Lukas Wunner <lukas@wunner.de>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: apple_gmux: Drop no longer used ACPI_VIDEO Kconfig dependency
Date:   Mon, 23 Jan 2023 16:45:12 +0100
Message-Id: <20230123154512.852921-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The apple_gmux code no longer uses any symbols from the ACPI_VIDEO code,
so that dependency can be dropped.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 5692385e2d26..ec7c2b4e1721 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -214,7 +214,6 @@ config APPLE_GMUX
 	depends on PNP
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on BACKLIGHT_APPLE=n || BACKLIGHT_APPLE
-	depends on ACPI_VIDEO=n || ACPI_VIDEO
 	help
 	  This driver provides support for the gmux device found on many
 	  Apple laptops, which controls the display mux for the hybrid
-- 
2.39.0

