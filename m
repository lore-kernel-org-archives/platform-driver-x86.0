Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F5FC3DA78
	for <platform-driver-x86@archiver.kernel.org>; Fri, 13 Jan 2023 23:12:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbjAMXME (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 13 Jan 2023 18:12:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbjAMXL5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Jan 2023 18:11:57 -0500
Received: from mail.redfish-solutions.com (mail.redfish-solutions.com [24.116.100.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A8E140B7;
        Fri, 13 Jan 2023 15:11:52 -0800 (PST)
Received: from ubuntu22.redfish-solutions.com (ubuntu22.redfish-solutions.com [192.168.8.33])
        (authenticated bits=0)
        by mail.redfish-solutions.com (8.17.1/8.16.1) with ESMTPSA id 30DNBeFD669450
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Fri, 13 Jan 2023 16:11:40 -0700
From:   "Philip Prindeville" <philipp@redfish-solutions.com>
To:     platform-driver-x86@vger.kernel.org, linux-x86_64@vger.kernel.org
Cc:     Ed Wildgoose <lists@wildgooses.com>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>,
        Philip Prindeville <philipp@redfish-solutions.com>
Subject: [PATCH v4 2/2] x86: Further PCEngines APU4/5/6 cleanup
Date:   Fri, 13 Jan 2023 16:11:40 -0700
Message-Id: <20230113231140.437040-1-philipp@redfish-solutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.2 on 192.168.8.3
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Philip Prindeville <philipp@redfish-solutions.com>

Updated exclusionary warning in leds-apu.c about unsupported models.

Updated list of supported modules in Kconfig.

Updated copyright and module aliases to cover more models.

Signed-off-by: Philip Prindeville <philipp@redfish-solutions.com>
Reviewed-by: Paul Spooren <paul@spooren.de>
---
 drivers/leds/leds-apu.c                | 2 +-
 drivers/platform/x86/Kconfig           | 4 ++--
 drivers/platform/x86/pcengines-apuv2.c | 5 +++++
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
index c409b80c236d7182c79944225dd4b9e5d32f0a9f..fb3332863c36241e4b7f75f89213171ec0c0dd04 100644
--- a/drivers/leds/leds-apu.c
+++ b/drivers/leds/leds-apu.c
@@ -183,7 +183,7 @@ static int __init apu_led_init(void)
 
 	if (!(dmi_match(DMI_SYS_VENDOR, "PC Engines") &&
 	      (dmi_match(DMI_PRODUCT_NAME, "APU") || dmi_match(DMI_PRODUCT_NAME, "apu1")))) {
-		pr_err("No PC Engines APUv1 board detected. For APUv2,3 support, enable CONFIG_PCENGINES_APU2\n");
+		pr_err("No PC Engines APUv1 board detected. For APUv2,3,4,5,6 support, enable CONFIG_PCENGINES_APU2\n");
 		return -ENODEV;
 	}
 
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 5692385e2d26fed92785488ce1c6e88449c54c78..f930d5dd3efee11fbad4ad9508eb288bb4181bab 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -698,7 +698,7 @@ config XO1_RFKILL
 	  laptop.
 
 config PCENGINES_APU2
-	tristate "PC Engines APUv2/3 front button and LEDs driver"
+	tristate "PC Engines APUv2/3/4/5/6 front button and LEDs driver"
 	depends on INPUT && INPUT_KEYBOARD && GPIOLIB
 	depends on LEDS_CLASS
 	select GPIO_AMD_FCH
@@ -706,7 +706,7 @@ config PCENGINES_APU2
 	select LEDS_GPIO
 	help
 	  This driver provides support for the front button and LEDs on
-	  PC Engines APUv2/APUv3 board.
+	  PC Engines APUv2/APUv3/APUv4/APUv5/APUv6 board.
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called pcengines-apuv2.
diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
index 8731564bab62c1e47e99adb6ec23b3de81b09069..bd58d5294f0146088d435f1c9df83eb218b67b0c 100644
--- a/drivers/platform/x86/pcengines-apuv2.c
+++ b/drivers/platform/x86/pcengines-apuv2.c
@@ -6,6 +6,7 @@
  *
  * Copyright (C) 2018 metux IT consult
  * Copyright (C) 2022 Ed Wildgoose <lists@wildgooses.com>
+ * Copyright (C) 2022 Philip Prindeville <philipp@redfish-solutions.com>
  * Author: Enrico Weigelt <info@metux.net>
  */
 
@@ -377,4 +378,8 @@ MODULE_DESCRIPTION("PC Engines APUv2-6 board GPIO/LEDs/keys driver");
 MODULE_LICENSE("GPL");
 MODULE_DEVICE_TABLE(dmi, apu_gpio_dmi_table);
 MODULE_ALIAS("platform:pcengines-apuv2");
+MODULE_ALIAS("platform:pcengines-apuv3");
+MODULE_ALIAS("platform:pcengines-apuv4");
+MODULE_ALIAS("platform:pcengines-apuv5");
+MODULE_ALIAS("platform:pcengines-apuv6");
 MODULE_SOFTDEP("pre: platform:" AMD_FCH_GPIO_DRIVER_NAME " platform:leds-gpio platform:gpio_keys_polled");
-- 
2.34.1

