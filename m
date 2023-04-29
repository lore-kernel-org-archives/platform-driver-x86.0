Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887F5C7EE23
	for <platform-driver-x86@archiver.kernel.org>; Sat, 29 Apr 2023 18:17:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbjD2SRP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 29 Apr 2023 14:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjD2SRO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 Apr 2023 14:17:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 748BB1711
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Apr 2023 11:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682792182;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z1o8tVnuB54IHSh4GuzdVhDXojagCzRjZtCM0+1oxrw=;
        b=iARUjFT/vmkeFbMaPDy5AcO/FPSm0H36SRmV98Zec4GKvVE2OJjOLeDc2qTGpT5t0XxdUC
        x+zt8zDtWN/lz4+Rt82ZoA3l9Z4dL2rSyplk4EbYBzOLZ1O39lW4OBYUIUXW+JpKIz7wxN
        suEcK99qfvUduNWbQ1XGKkqUL2/PHuU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-0f75cS-xMbOpxbuGMj-_GQ-1; Sat, 29 Apr 2023 14:16:16 -0400
X-MC-Unique: 0f75cS-xMbOpxbuGMj-_GQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94432185A78B;
        Sat, 29 Apr 2023 18:16:15 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7AA802027043;
        Sat, 29 Apr 2023 18:16:14 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH 11/19] platform/x86: lenovo-yogabook: Stop checking adev->power.state
Date:   Sat, 29 Apr 2023 20:15:43 +0200
Message-Id: <20230429181551.98201-12-hdegoede@redhat.com>
In-Reply-To: <20230429181551.98201-1-hdegoede@redhat.com>
References: <20230429181551.98201-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

lenovo-yogabook-wmi: controls the power-state itself and stores
this in data->flags so there is no need to poke inside ACPI device
internals.

This is a preparation patch for making lenovo-yogabook-wmi also work
on the Android version of the Yoga Book 1 which does not have a WMI
interface to deal with toggling the keyboard half between
touch-keyboard and wacom-digitizer mode.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/lenovo-yogabook-wmi.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/lenovo-yogabook-wmi.c b/drivers/platform/x86/lenovo-yogabook-wmi.c
index 4bcbf0f84732..8d461fb8eac3 100644
--- a/drivers/platform/x86/lenovo-yogabook-wmi.c
+++ b/drivers/platform/x86/lenovo-yogabook-wmi.c
@@ -51,13 +51,11 @@ static int yogabook_wmi_set_kbd_backlight(struct yogabook_wmi *data,
 	union acpi_object param;
 	acpi_status status;
 
-	if (data->kbd_adev->power.state != ACPI_STATE_D0) {
-		dev_warn(data->dev, "keyboard touchscreen not in D0, cannot set brightness\n");
-		return -ENXIO;
-	}
-
 	dev_dbg(data->dev, "Set KBLC level to %u\n", level);
 
+	/* Ensure keyboard touchpad is on before we call KBLC() */
+	acpi_device_set_power(data->kbd_adev, ACPI_STATE_D0);
+
 	input.count = 1;
 	input.pointer = &param;
 
@@ -182,7 +180,7 @@ static int kbd_brightness_set(struct led_classdev *cdev,
 
 	data->brightness = value;
 
-	if (data->kbd_adev->power.state != ACPI_STATE_D0)
+	if (!test_bit(YB_KBD_IS_ON, &data->flags))
 		return 0;
 
 	return yogabook_wmi_set_kbd_backlight(data, data->brightness);
@@ -366,11 +364,8 @@ static int yogabook_resume(struct device *dev)
 {
 	struct yogabook_wmi *data = dev_get_drvdata(dev);
 
-	if (test_bit(YB_KBD_IS_ON, &data->flags)) {
-		/* Ensure keyboard touchpad is on before we call KBLC() */
-		acpi_device_set_power(data->kbd_adev, ACPI_STATE_D0);
+	if (test_bit(YB_KBD_IS_ON, &data->flags))
 		yogabook_wmi_set_kbd_backlight(data, data->brightness);
-	}
 
 	clear_bit(YB_SUSPENDED, &data->flags);
 
-- 
2.39.2

