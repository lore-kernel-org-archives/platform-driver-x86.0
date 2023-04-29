Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557E0C77B60
	for <platform-driver-x86@archiver.kernel.org>; Sat, 29 Apr 2023 10:52:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjD2KwA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 29 Apr 2023 06:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjD2Kv7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 Apr 2023 06:51:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 878C610FA
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Apr 2023 03:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682765471;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jZ8GgEwNKkDayR78wl0bTcO9m0TXzL0zNIS3jWhM8aQ=;
        b=LgOBTKI/KpBJBg2LeHcZTnXI1jE9D/qG7btOe+k6aHpzuEqacghqiNZvJ9k164zTeOKr10
        rg0LdzLwr8mzEbRkQeD5iDV/iiEZsRxLqQaY3BC7da36UzWXcX1HmwB0Md7mHIh8QnytVo
        gPRLybxND253ilRod20CkImaOm0P5lg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-8tboWcGjNkuwbIWX8KKOwg-1; Sat, 29 Apr 2023 06:51:08 -0400
X-MC-Unique: 8tboWcGjNkuwbIWX8KKOwg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B445B29AA387;
        Sat, 29 Apr 2023 10:51:07 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 12E51C15BA0;
        Sat, 29 Apr 2023 10:51:06 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/3] platform/x86: x86-android-tablets: Remove unnecessary invalid_aei_gpiochip settings
Date:   Sat, 29 Apr 2023 12:50:56 +0200
Message-Id: <20230429105057.7697-2-hdegoede@redhat.com>
In-Reply-To: <20230429105057.7697-1-hdegoede@redhat.com>
References: <20230429105057.7697-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Since commit 5adc409340b1 ("ACPI: x86: Introduce an
acpi_quirk_skip_gpio_event_handlers() helper") the ACPI GPIO code will
not register any GPIO event handlers at all for devices which have
the ACPI_QUIRK_SKIP_GPIO_EVENT_HANDLERS set in their DMI table entry
in drivers/acpi/x86/utils.c .

This includes the Nextbook Ares 8 and the Asus ME176C and TF103C models,
so x86-android-tablets no longer needs to disable the GPIO event handlers
on these, since they have never been registered at all.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/asus.c  | 2 --
 drivers/platform/x86/x86-android-tablets/other.c | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/asus.c b/drivers/platform/x86/x86-android-tablets/asus.c
index cfa038b44b43..2aca91678219 100644
--- a/drivers/platform/x86/x86-android-tablets/asus.c
+++ b/drivers/platform/x86/x86-android-tablets/asus.c
@@ -178,7 +178,6 @@ const struct x86_dev_info asus_me176c_info __initconst = {
 	.gpiod_lookup_tables = asus_me176c_gpios,
 	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
 	.modules = bq24190_modules,
-	.invalid_aei_gpiochip = "INT33FC:02",
 };
 
 /* Asus TF103C tablets have an Android factory img with everything hardcoded */
@@ -321,5 +320,4 @@ const struct x86_dev_info asus_tf103c_info __initconst = {
 	.gpiod_lookup_tables = asus_tf103c_gpios,
 	.bat_swnode = &asus_tf103c_battery_node,
 	.modules = bq24190_modules,
-	.invalid_aei_gpiochip = "INT33FC:02",
 };
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index 83cd7e16c84c..fb512c084fe9 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -377,7 +377,6 @@ const struct x86_dev_info nextbook_ares8_info __initconst = {
 	.pdev_info = int3496_pdevs,
 	.pdev_count = 1,
 	.gpiod_lookup_tables = nextbook_ares8_gpios,
-	.invalid_aei_gpiochip = "INT33FC:02",
 };
 
 /*
-- 
2.39.2

