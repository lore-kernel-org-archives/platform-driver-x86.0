Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F32CC4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Nov 2022 19:35:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiKOTfe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Nov 2022 14:35:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231965AbiKOTfP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Nov 2022 14:35:15 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7222A189
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 11:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668540852;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=p4d9sL7Hoj7m6Si4mOHWgEDdL+a7D+e6gn5WTkIqzrA=;
        b=ABy7sN55PaLfY8LYN83WpUl7iSwMOJ+zhbTUe/mkiyaKYKEOJIIuRL8wM22+HArfj/LB8j
        dCrE5I6IvRz720vMGDxlrq++AGoLtp7oW1IyUVB6ARow95u7ACrAQbBdBTr3nlrPNcqAJy
        hx1Wtwq79XYNlJ7f9jumnFlHXy9SUF4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-I2P9qMchMpONi5_SFxdaDQ-1; Tue, 15 Nov 2022 14:34:09 -0500
X-MC-Unique: I2P9qMchMpONi5_SFxdaDQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B654D101AA64;
        Tue, 15 Nov 2022 19:34:08 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0E3E0C16932;
        Tue, 15 Nov 2022 19:34:07 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: ideapad-laptop: Add module parameters to match DMI quirk tables
Date:   Tue, 15 Nov 2022 20:34:00 +0100
Message-Id: <20221115193400.376159-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add module parameters to allow setting the hw_rfkill_switch and
set_fn_lock_led feature flags for testing these on laptops which are not
on the DMI-id based allow lists for these 2 flags.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 6c77e34e677e..31c34008fbe8 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -155,7 +155,21 @@ MODULE_PARM_DESC(no_bt_rfkill, "No rfkill for bluetooth.");
 
 static bool allow_v4_dytc;
 module_param(allow_v4_dytc, bool, 0444);
-MODULE_PARM_DESC(allow_v4_dytc, "Enable DYTC version 4 platform-profile support.");
+MODULE_PARM_DESC(allow_v4_dytc,
+	"Enable DYTC version 4 platform-profile support. "
+	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
+
+static bool hw_rfkill_switch;
+module_param(hw_rfkill_switch, bool, 0444);
+MODULE_PARM_DESC(hw_rfkill_switch,
+	"Enable rfkill support for laptops with a hw on/off wifi switch/slider. "
+	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
+
+static bool set_fn_lock_led;
+module_param(set_fn_lock_led, bool, 0444);
+MODULE_PARM_DESC(set_fn_lock_led,
+	"Enable driver based updates of the fn-lock LED on fn-lock changes. "
+	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
 
 /*
  * ACPI Helpers
@@ -1572,8 +1586,10 @@ static void ideapad_check_features(struct ideapad_private *priv)
 	acpi_handle handle = priv->adev->handle;
 	unsigned long val;
 
-	priv->features.set_fn_lock_led = dmi_check_system(set_fn_lock_led_list);
-	priv->features.hw_rfkill_switch = dmi_check_system(hw_rfkill_list);
+	priv->features.set_fn_lock_led =
+		set_fn_lock_led || dmi_check_system(set_fn_lock_led_list);
+	priv->features.hw_rfkill_switch =
+		hw_rfkill_switch || dmi_check_system(hw_rfkill_list);
 
 	/* Most ideapads with ELAN0634 touchpad don't use EC touchpad switch */
 	if (acpi_dev_present("ELAN0634", NULL, -1))
-- 
2.38.1

