Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C65C4167D
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Nov 2023 20:59:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjKDU7Q (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Nov 2023 16:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjKDU7P (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Nov 2023 16:59:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 106BAD6A
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Nov 2023 13:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699131515;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Kxn/CA8QqqELJZfqiaqUQ4EUf+IVUlLXmqNdlz2zfhw=;
        b=ZCh0I05hVJLLMm3dEhmiMccMXP2eGUYnVsqi9H/yHCbilun1kwTjovFW0rh/8RSKlDuKva
        5HfnaMnMe+t3b+6GALPxNWShk4wpErITPs/8UmnAvpiURD0nLKRgKxwb4Nu7NxyPpYK9Wj
        v6D6pI3EqS1x6XWHYuvV/mgFmaJV9Y0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-4uiq1WNSPFyvrl_hQiKn6A-1; Sat, 04 Nov 2023 16:58:33 -0400
X-MC-Unique: 4uiq1WNSPFyvrl_hQiKn6A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 513A1185A785;
        Sat,  4 Nov 2023 20:58:33 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 889232026D4C;
        Sat,  4 Nov 2023 20:58:32 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 4/4] platform/x86: x86-android-tablets: Fix backlight ctrl for Lenovo Yoga Tab 3 Pro YT3-X90F
Date:   Sat,  4 Nov 2023 21:58:28 +0100
Message-ID: <20231104205828.63139-4-hdegoede@redhat.com>
In-Reply-To: <20231104205828.63139-1-hdegoede@redhat.com>
References: <20231104205828.63139-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix the maximum brightness being much too low on the Yoga Tab 3 Pro.

The LP8557 backlight controller can either be configured to multiply its
PWM input and the I2C register set level (requiring both to be at 100%
for 100% output); or to only take the I2C register set level into account.

Multiplying the 2 levels is useful because this will turn off the backlight
when the panel goes off and turns off its PWM output.

But on the YT3-X90F the panel's PWM output defaults to a duty-cycle of much
less then 100%, severely limiting max brightness. In this case the LP8557
should be configured to only take the I2C register into account and
the i915 driver must turn off the backlight separately using a VBT MIPI
sequence to turn off the backlight.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/lenovo.c | 26 ++++++++++++++++---
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 0bc6a74b8beb..f1c66a61bfc5 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -34,12 +34,30 @@
  *
  * To avoid having to have a similar hack in the mainline kernel program the
  * LP8557 to directly set the level and use the lp855x_bl driver for control.
+ *
+ * The LP8557 can either be configured to multiply its PWM input and
+ * the I2C register set level (requiring both to be at 100% for 100% output);
+ * or to only take the I2C register set level into account.
+ *
+ * Multiplying the 2 levels is useful because this will turn off the backlight
+ * when the panel goes off and turns off its PWM output.
+ *
+ * But on some models the panel's PWM output defaults to a duty-cycle of
+ * much less then 100%, severely limiting max brightness. In this case
+ * the LP8557 should be configured to only take the I2C register into
+ * account and the i915 driver must turn off the panel and the backlight
+ * separately using e.g. VBT MIPI sequences to turn off the backlight.
  */
-static struct lp855x_platform_data lenovo_lp8557_pdata = {
+static struct lp855x_platform_data lenovo_lp8557_pwm_and_reg_pdata = {
 	.device_control = 0x86,
 	.initial_brightness = 128,
 };
 
+static struct lp855x_platform_data lenovo_lp8557_reg_only_pdata = {
+	.device_control = 0x85,
+	.initial_brightness = 128,
+};
+
 /* Lenovo Yoga Book X90F / X90L's Android factory img has everything hardcoded */
 
 static const struct property_entry lenovo_yb1_x90_wacom_props[] = {
@@ -122,7 +140,7 @@ static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst
 			.type = "lp8557",
 			.addr = 0x2c,
 			.dev_name = "lp8557",
-			.platform_data = &lenovo_lp8557_pdata,
+			.platform_data = &lenovo_lp8557_pwm_and_reg_pdata,
 		},
 		.adapter_path = "\\_SB_.PCI0.I2C4",
 	}, {
@@ -358,7 +376,7 @@ static struct x86_i2c_client_info lenovo_yoga_tab2_830_1050_i2c_clients[] __init
 			.type = "lp8557",
 			.addr = 0x2c,
 			.dev_name = "lp8557",
-			.platform_data = &lenovo_lp8557_pdata,
+			.platform_data = &lenovo_lp8557_pwm_and_reg_pdata,
 		},
 		.adapter_path = "\\_SB_.I2C3",
 	},
@@ -655,7 +673,7 @@ static const struct x86_i2c_client_info lenovo_yt3_i2c_clients[] __initconst = {
 			.type = "lp8557",
 			.addr = 0x2c,
 			.dev_name = "lp8557",
-			.platform_data = &lenovo_lp8557_pdata,
+			.platform_data = &lenovo_lp8557_reg_only_pdata,
 		},
 		.adapter_path = "\\_SB_.PCI0.I2C1",
 	}
-- 
2.41.0

