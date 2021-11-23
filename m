Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C66C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Nov 2021 21:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233885AbhKWVIm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Nov 2021 16:08:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49220 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234024AbhKWVIj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Nov 2021 16:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637701530;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Ug/8+pQowgBsasa0fMF1yQM/PvCfKF7u8O3HqBvuqz0=;
        b=WIw4Uo7EEVzz0ebt7pvqvzRKLG+PLUS3xgJY7f6+ukWclhm8D5wAn27jqn3IEWteidmIiV
        njAXYp7zHUQBVeFmcT6hAxPnfbfvD6GB/KIJc0jrN2dVKWZq1zGqKcBRxUvPCZLefnsq/v
        ajYHGAttRDnuLQta32eiR8t06i1pWPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-uMviOJufMr6z5e9N_xKfSA-1; Tue, 23 Nov 2021 16:05:27 -0500
X-MC-Unique: uMviOJufMr6z5e9N_xKfSA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DB0A8066F9;
        Tue, 23 Nov 2021 21:05:26 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.41])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 50A063AA2;
        Tue, 23 Nov 2021 21:05:25 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: thinkpad_acpi: Add LED_RETAIN_AT_SHUTDOWN to led_class_devs
Date:   Tue, 23 Nov 2021 22:05:23 +0100
Message-Id: <20211123210524.266705-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add the LED_RETAIN_AT_SHUTDOWN flag to the registered led_class_devs so
that the LEDs do not get turned-off when reloading the driver and thus so
that they also stay under default EC control when reloading the driver,
unless explicitly overridden by the user.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index a4ef57ddcc90..49fdf16b2db9 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -5827,6 +5827,7 @@ static int __init tpacpi_init_led(unsigned int led)
 		tpacpi_leds[led].led_classdev.brightness_get = &led_sysfs_get;
 
 	tpacpi_leds[led].led_classdev.name = tpacpi_led_names[led];
+	tpacpi_leds[led].led_classdev.flags = LED_RETAIN_AT_SHUTDOWN;
 	tpacpi_leds[led].led = led;
 
 	return led_classdev_register(&tpacpi_pdev->dev, &tpacpi_leds[led].led_classdev);
-- 
2.33.1

