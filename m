Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBBAC4167B
	for <platform-driver-x86@archiver.kernel.org>; Fri, 30 Dec 2022 18:39:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235274AbiL3Sjj convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 30 Dec 2022 13:39:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231449AbiL3Sjh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 30 Dec 2022 13:39:37 -0500
X-Greylist: delayed 143 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 30 Dec 2022 10:39:37 PST
Received: from mail.redfish-solutions.com (mail.redfish-solutions.com [24.116.100.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548B21929B
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Dec 2022 10:39:37 -0800 (PST)
Received: from smtpclient.apple (macbook3-2.redfish-solutions.com [192.168.8.12])
        (authenticated bits=0)
        by mail.redfish-solutions.com (8.17.1/8.16.1) with ESMTPSA id 2BUIbDv6577529
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Dec 2022 11:37:14 -0700
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: [PATCH 1/1] apu6: add apu6 variation to apu2 driver family
From:   "Philip Prindeville" <philipp@redfish-solutions.com>
Date:   Fri, 30 Dec 2022 11:07:15 -0700
Cc:     Ed Wildgoose <kernel@wildgooses.com>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Philip Prindeville <philipp@redfish-solutions.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <20221230180715.2785959-1-philipp@redfish-solutions.com>
To:     platform-driver-x86@vger.kernel.org, linux-x86_64@vger.kernel.org,
        platform-driver-x86@vger.linux.org
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Scanned-By: MIMEDefang 3.2 on 192.168.8.3
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Philip Prindeville <philipp@redfish-solutions.com>

Add detection of PC Engines "apu6" platform via DMI.

Also, revise leds-apu.c to call out additional platforms
which aren't supported.

Signed-off-by: Philip Prindeville <philipp@redfish-solutions.com>
---
drivers/leds/leds-apu.c                |  2 +-
drivers/platform/x86/Kconfig           |  4 ++--
drivers/platform/x86/pcengines-apuv2.c | 19 ++++++++++++++++---
3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
index c409b80c236d7182c79944225dd4b9e5d32f0a9f..5a71ced5ed3dc850d7355be90f4f7ed14ad4cc47 100644
--- a/drivers/leds/leds-apu.c
+++ b/drivers/leds/leds-apu.c
@@ -183,7 +183,7 @@ static int __init apu_led_init(void)

	if (!(dmi_match(DMI_SYS_VENDOR, "PC Engines") &&
	      (dmi_match(DMI_PRODUCT_NAME, "APU") || dmi_match(DMI_PRODUCT_NAME, "apu1")))) {
-		pr_err("No PC Engines APUv1 board detected. For APUv2,3 support, enable CONFIG_PCENGINES_APU2\n");
+		pr_err("No PC Engines APUv1 board detected. For APUv2,3,4,6 support, enable CONFIG_PCENGINES_APU2\n");
		return -ENODEV;
	}

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 5692385e2d26fed92785488ce1c6e88449c54c78..86bb334a6d4d6a3a7e0319470c16d49cf6a3d9f2 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -698,7 +698,7 @@ config XO1_RFKILL
	  laptop.

config PCENGINES_APU2
-	tristate "PC Engines APUv2/3 front button and LEDs driver"
+	tristate "PC Engines APUv2/3/4/6 front button and LEDs driver"
	depends on INPUT && INPUT_KEYBOARD && GPIOLIB
	depends on LEDS_CLASS
	select GPIO_AMD_FCH
@@ -706,7 +706,7 @@ config PCENGINES_APU2
	select LEDS_GPIO
	help
	  This driver provides support for the front button and LEDs on
-	  PC Engines APUv2/APUv3 board.
+	  PC Engines APUv2/APUv3/APUv4/APUv6 board.

	  To compile this driver as a module, choose M here: the module
	  will be called pcengines-apuv2.
diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
index d063d91db9bcbe5ceb2ac641d3105df37651ac4d..405dea012ab80fa35775c6169b3e659d0a3fb30c 100644
--- a/drivers/platform/x86/pcengines-apuv2.c
+++ b/drivers/platform/x86/pcengines-apuv2.c
@@ -1,10 +1,11 @@
// SPDX-License-Identifier: GPL-2.0+

/*
- * PC-Engines APUv2/APUv3 board platform driver
+ * PC-Engines APUv2/APUv3/APUv4/APUv6 board platform driver
 * for GPIO buttons and LEDs
 *
 * Copyright (C) 2018 metux IT consult
+ * Copyright (C) 2022 Redfish Solutions, LLC
 * Author: Enrico Weigelt <info@metux.net>
 */

@@ -22,7 +23,7 @@
#include <linux/platform_data/gpio/gpio-amd-fch.h>

/*
- * NOTE: this driver only supports APUv2/3 - not APUv1, as this one
+ * NOTE: this driver only supports APUv2/3/4/6 - not APUv1, as this one
 * has completely different register layouts.
 */

@@ -215,6 +216,15 @@ static const struct dmi_system_id apu_gpio_dmi_table[] __initconst = {
		},
		.driver_data = (void *)&board_apu2,
	},
+	/* APU6 w/ legacy BIOS >= 4.12 */
+	{
+		.ident       = "apu6",
+		.matches     = {
+			DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
+			DMI_MATCH(DMI_BOARD_NAME, "apu6")
+		},
+		.driver_data = (void *)&board_apu2,
+	},
	{}
};

@@ -288,8 +298,11 @@ module_init(apu_board_init);
module_exit(apu_board_exit);

MODULE_AUTHOR("Enrico Weigelt, metux IT consult <info@metux.net>");
-MODULE_DESCRIPTION("PC Engines APUv2/APUv3 board GPIO/LEDs/keys driver");
+MODULE_DESCRIPTION("PC Engines APUv2/APUv3/APUv4/APUv6 board GPIO/LEDs/keys driver");
MODULE_LICENSE("GPL");
MODULE_DEVICE_TABLE(dmi, apu_gpio_dmi_table);
MODULE_ALIAS("platform:pcengines-apuv2");
+MODULE_ALIAS("platform:pcengines-apuv3");
+MODULE_ALIAS("platform:pcengines-apuv4");
+MODULE_ALIAS("platform:pcengines-apuv6");
MODULE_SOFTDEP("pre: platform:" AMD_FCH_GPIO_DRIVER_NAME " platform:leds-gpio platform:gpio_keys_polled");
-- 
2.34.1

