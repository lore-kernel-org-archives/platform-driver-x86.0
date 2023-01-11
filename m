Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BE4C5479D
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Jan 2023 20:15:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233787AbjAKUP1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 Jan 2023 15:15:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235290AbjAKUPW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Jan 2023 15:15:22 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD61EE85
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2023 12:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673468078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Zk9H2iYFTSNEE2avHrOczCCPdpjZMCywGli1EXBc/Ps=;
        b=bnoOsiR/ZEGLn8IEZpFF7psgsGHjaPx1cqhJUFyyKm9RDRGlWPanBF5FIhYIDu0J/QCnxV
        9EDZFoWN/jwG71/J3DXUDQFlH4FMwXe+TUH71ivXSYB7T0f8ZW54VA7ldS0e9mKJ5ZlKq6
        4gJRvkf5Y37GyGT2GyLxPSdd73C6AXo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-rUp2uWW4NcOZQhHceR5BoQ-1; Wed, 11 Jan 2023 15:14:37 -0500
X-MC-Unique: rUp2uWW4NcOZQhHceR5BoQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 579FD29ABA14;
        Wed, 11 Jan 2023 20:14:36 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.98])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9A38A492B01;
        Wed, 11 Jan 2023 20:14:34 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, linux-media@vger.kernel.org
Subject: [PATCH] platform/x86: int3472/discrete: Ensure the clk/power enable pins are in output mode
Date:   Wed, 11 Jan 2023 21:14:26 +0100
Message-Id: <20230111201426.947853-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

acpi_get_and_request_gpiod() does not take a gpio_lookup_flags argument
specifying that the pins direction should be initialized to a specific
value.

This means that in some cases the pins might be left in input mode, causing
the gpiod_set() calls made to enable the clk / regulator to not work.

One example of this problem is the clk-enable GPIO for the ov01a1s sensor
on a Dell Latitude 9420 being left in input mode causing the clk to
never get enabled.

Explicitly set the direction of the pins to output to fix this.

Fixes: 5de691bffe57 ("platform/x86: Add intel_skl_int3472 driver")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v4:
- Split out of the "int3472/media privacy LED support" series, so
  that this can be applied separately as it really is a bug-fix
---
 drivers/platform/x86/intel/int3472/clk_and_regulator.c | 3 +++
 drivers/platform/x86/intel/int3472/discrete.c          | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index b2342b3d78c7..74dc2cff799e 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -181,6 +181,9 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 		return PTR_ERR(int3472->regulator.gpio);
 	}
 
+	/* Ensure the pin is in output mode and non-active state */
+	gpiod_direction_output(int3472->regulator.gpio, 0);
+
 	cfg.dev = &int3472->adev->dev;
 	cfg.init_data = &init_data;
 	cfg.ena_gpiod = int3472->regulator.gpio;
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 974a132db651..c42c3faa2c32 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -168,6 +168,8 @@ static int skl_int3472_map_gpio_to_clk(struct int3472_discrete_device *int3472,
 			return (PTR_ERR(gpio));
 
 		int3472->clock.ena_gpio = gpio;
+		/* Ensure the pin is in output mode and non-active state */
+		gpiod_direction_output(int3472->clock.ena_gpio, 0);
 		break;
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
 		gpio = acpi_get_and_request_gpiod(path, pin, "int3472,privacy-led");
@@ -175,6 +177,8 @@ static int skl_int3472_map_gpio_to_clk(struct int3472_discrete_device *int3472,
 			return (PTR_ERR(gpio));
 
 		int3472->clock.led_gpio = gpio;
+		/* Ensure the pin is in output mode and non-active state */
+		gpiod_direction_output(int3472->clock.led_gpio, 0);
 		break;
 	default:
 		dev_err(int3472->dev, "Invalid GPIO type 0x%02x for clock\n", type);
-- 
2.39.0

