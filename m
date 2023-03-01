Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0470CC83002
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 09:26:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbjCAJZp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 04:25:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjCAJZT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 04:25:19 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C1E53525A
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 01:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677662634;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3g60CeJUj9TMPcmrxBn3jH1Cx0EI6ljogdDoFcZc6LY=;
        b=JD9+o5LSVqiUvV04KGi1Ehvu6q5JRW6tVfdsLsg6sMVD0ylBJSUuO62w8q7TMhEObiaLoG
        dxdviP37d2mGP9bAP8kr71yKuT+YOfjUvEKgy8DSncNWgHxhuG3mDGlDIUfjNpRf8JgbEO
        GffEHVs5+aMe80ww1qdtbV1B5o5luLs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-bfgQ2-mKOgma7odYsvSf6A-1; Wed, 01 Mar 2023 04:23:49 -0500
X-MC-Unique: bfgQ2-mKOgma7odYsvSf6A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2062C29AA3B2;
        Wed,  1 Mar 2023 09:23:49 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.30])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 72B6F40B40DF;
        Wed,  1 Mar 2023 09:23:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 12/14] platform/x86: x86-android-tablets: Add backlight ctrl for Lenovo Yoga Tab 3 Pro YT3-X90F
Date:   Wed,  1 Mar 2023 10:23:29 +0100
Message-Id: <20230301092331.7038-13-hdegoede@redhat.com>
In-Reply-To: <20230301092331.7038-1-hdegoede@redhat.com>
References: <20230301092331.7038-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The YT3 uses an TI LP8557 LED backlight controller, the LP8557's PWM input
is connected to a PWM output coming from the LCD panel's controller.

The Android kernel has a hack in the i915 driver to write the non-standard
DSI reg 0x51 with the desired level to set the duty-cycle of the LCD's PWM.

To avoid having to have a similar hack in the mainline kernel program
instantiate an i2c-client for the LP8557 with platform-data to have
the LP8557 to directly set the level (ignoring its PWM input), this allows
backlight brightness control through a backlight device registered by
the lp855x_bl driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/lenovo.c | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 10121fde42da..f8544a4e807d 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -346,6 +346,20 @@ static const struct software_node lenovo_yt3_hideep_ts_node = {
 	.properties = lenovo_yt3_hideep_ts_props,
 };
 
+/*
+ * The YT3 uses an TI LP8557 LED backlight controller, the LP8557's PWM input is
+ * connected to a PWM output coming from the LCD panel's controller. The Android
+ * kernel has a hack in the i915 driver to write the non-standard DSI reg 0x51
+ * with the desired level to set the duty-cycle of the LCD's PWM output.
+ *
+ * To avoid having to have a similar hack in the mainline kernel program the
+ * LP8557 to directly set the level and use the lp855x_bl driver for control.
+ */
+static struct lp855x_platform_data lenovo_yt3_lp8557_pdata = {
+	.device_control = 0x86,
+	.initial_brightness = 128,
+};
+
 static const struct x86_i2c_client_info lenovo_yt3_i2c_clients[] __initconst = {
 	{
 		/* bq27500 fuel-gauge for the flat lipo battery behind the screen */
@@ -397,6 +411,15 @@ static const struct x86_i2c_client_info lenovo_yt3_i2c_clients[] __initconst = {
 			.trigger = ACPI_LEVEL_SENSITIVE,
 			.polarity = ACPI_ACTIVE_LOW,
 		},
+	}, {
+		/* LP8557 Backlight controller */
+		.board_info = {
+			.type = "lp8557",
+			.addr = 0x2c,
+			.dev_name = "lp8557",
+			.platform_data = &lenovo_yt3_lp8557_pdata,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C1",
 	}
 };
 
-- 
2.39.1

