Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9E9C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Jun 2022 09:36:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232170AbiFTJgo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Jun 2022 05:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232000AbiFTJgn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Jun 2022 05:36:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F1F0E13D67
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 02:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655717802;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=JSZp0yA+KjRoh2VaWCiAsqzkCTe2noZ8GpHX1yIh4cA=;
        b=ZVgwyNJHI9m7yJRhnpxgwe3KkHd1ZL7EYptG/uWXPUtsRKeLe39pCxcprYyzEKGNWiADKR
        RrNG5aRlq8UwgobcGxfQkbHc/emALIWveF4hlh++30drl3fxAo4O9GrbVVvTD8WPoWnmzi
        uhosWm5d5aguo0AMLHC+fvhH7EEo+JA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-8BfnPFfWMyiCPpz8HNM0Kg-1; Mon, 20 Jun 2022 05:36:40 -0400
X-MC-Unique: 8BfnPFfWMyiCPpz8HNM0Kg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E343E101AA45;
        Mon, 20 Jun 2022 09:36:39 +0000 (UTC)
Received: from x1.nl (unknown [10.39.195.183])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 62715C08F22;
        Mon, 20 Jun 2022 09:36:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/3] platform/x86: acer_wmi: Cleanup Kconfig selects
Date:   Mon, 20 Jun 2022 11:36:35 +0200
Message-Id: <20220620093637.9429-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

ACER_WMI already depends on ACPI_WMI which depends on ACPI
so the "depends on ACPI" is unnecessary.

And since ACER_WMI already depends on ACPI adding an "if ACPI"
to the ACPI_VIDEO select is non-sense.

While at it also group all the selects together.

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

