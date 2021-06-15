Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B8AC48BE5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Jun 2021 22:19:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0400461246
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Jun 2021 22:19:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhFOWV6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Jun 2021 18:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbhFOWV5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Jun 2021 18:21:57 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A5E5C061574
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jun 2021 15:19:52 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id r7so294500qta.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jun 2021 15:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=60228.dev; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HhEYR53mxeSEicafboiKfU/WAcKsmYkB+CiJ3j88yuk=;
        b=wbM7JefaOX4OobhvtWmZrzyjxlIZp5iW0mqRGF8PXPNIIAJlq/wZVxb4Zd1Tl2eakQ
         M/ykHTGfXysFraHC4dcfeHwTN2zApbN78SLoh72nkYWk5U2jbM5Th581iV1EF+lddB4A
         694vZ6oeWIeaXbDO/STtDhEByITD7nItEBMIkOh+qnkOf7BRId0V5TNo4Bc52sKCgFjT
         N3SKDOnaFypWdPHMcM6dv3ZB+dWqrMGXAyMyop0Zn44bG/MmazCC2RZ1E4pzURaW8gaN
         BRgWe/92NmOIHHkzZezYOAPEph7HLfJidBWlyoOqgC0EhWPd6ILURHQ036dFXU4nUY0b
         /pFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HhEYR53mxeSEicafboiKfU/WAcKsmYkB+CiJ3j88yuk=;
        b=bm+l5dJslO0+4B+wO/FJbccXcFVEjY+vk0u+9bgsZt5i61/uOKZBufaxPWLpZCq6Mo
         RK7FRuUy7R2LFpMq8Lq6VQGSz3baE1PxBIVPIukicwNjPNDQOwGyhh8P5jKatsn+rWDt
         9bxFOE0s93rcsdCIZrQCBwA1ub06izAFC2S6Ko1hDD5ZW0bTnnGNF+pqs9BEmEuBWWRi
         WCEdaWcEzxM6rmvq1zZWEmNgQ5d+s9eHEPiKeVvOLN//fpZvJfHnf1E/oddgRK18LOpq
         BolJe3T0pFFOxY6yu6YWSxVzvq7tM4uDp103e1d74qEPkUftkwbHChr6lmGG0TN/6bpo
         KE3Q==
X-Gm-Message-State: AOAM533p7B49dh56f+gQKUu7oCC/Z27MZ3gXNKRJYv8zK+Xn34rxXcmB
        1bEA++qkX5E/IZJrKLibclNHvfJi/syvSk8u0H8=
X-Google-Smtp-Source: ABdhPJyWHvfjOsyosSzCyqdqISRxmaiFHowf02CUlfUPS2aFOO0b3afQ2yvG8MocTMuuBwD+CYrHgQ==
X-Received: by 2002:ac8:568b:: with SMTP id h11mr1949616qta.206.1623795591603;
        Tue, 15 Jun 2021 15:19:51 -0700 (PDT)
Received: from leotop.60228.dev.beta.tailscale.net (cpe-158-222-150-74.nyc.res.rr.com. [158.222.150.74])
        by smtp.gmail.com with ESMTPSA id w2sm83763qto.50.2021.06.15.15.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 15:19:51 -0700 (PDT)
From:   leo60228 <leo@60228.dev>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Cc:     leo60228 <leo@60228.dev>
Subject: [PATCH] platform/x86: add support for Acer Predator LEDs
Date:   Tue, 15 Jun 2021 18:19:31 -0400
Message-Id: <20210615221931.18148-1-leo@60228.dev>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Acer Predator Helios 500's keyboard has four zones of RGB LEDs.

This driver allows them to be controlled from Linux.

Signed-off-by: leo60228 <leo@60228.dev>
---
 MAINTAINERS                     |   6 ++
 drivers/platform/x86/Kconfig    |  13 +++
 drivers/platform/x86/Makefile   |   1 +
 drivers/platform/x86/acer-led.c | 156 ++++++++++++++++++++++++++++++++
 4 files changed, 176 insertions(+)
 create mode 100644 drivers/platform/x86/acer-led.c

diff --git a/MAINTAINERS b/MAINTAINERS
index bc0ceef87..f647ea81c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -327,6 +327,12 @@ S:	Maintained
 W:	http://piie.net/?section=acerhdf
 F:	drivers/platform/x86/acerhdf.c
 
+ACER PREDATOR LAPTOP LEDS
+M:	leo60228 <leo@60228.dev>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/acer-led.c
+
 ACER WMI LAPTOP EXTRAS
 M:	"Lee, Chun-Yi" <jlee@suse.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 60592fb88..7dc4fd1ef 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -190,6 +190,19 @@ config ACER_WMI
 	  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
 	  here.
 
+config ACER_LED
+	tristate "Acer Predator Laptop LEDs"
+	depends on ACPI
+	depends on ACPI_WMI
+	depends on LEDS_CLASS
+	depends on NEW_LEDS
+	help
+	  This is a driver for the RGB keyboard LEDs in Acer Predator laptops.
+	  It was designed for the Acer Predator Helios 500.
+
+	  If you choose to compile this driver as a module the module will be
+	  called acer-led.
+
 config AMD_PMC
 	tristate "AMD SoC PMC driver"
 	depends on ACPI && PCI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index dcc8cdb95..36722207b 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
 obj-$(CONFIG_ACERHDF)		+= acerhdf.o
 obj-$(CONFIG_ACER_WIRELESS)	+= acer-wireless.o
 obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
+obj-$(CONFIG_ACER_LED)		+= acer-led.o
 
 # AMD
 obj-$(CONFIG_AMD_PMC)		+= amd-pmc.o
diff --git a/drivers/platform/x86/acer-led.c b/drivers/platform/x86/acer-led.c
new file mode 100644
index 000000000..82a7b099a
--- /dev/null
+++ b/drivers/platform/x86/acer-led.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Acer LED Driver
+ *
+ * Copyright (C) 2021 leo60228
+ */
+
+#include <linux/acpi.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/leds.h>
+#include <linux/wmi.h>
+
+MODULE_AUTHOR("leo60228");
+MODULE_DESCRIPTION("Acer LED Driver");
+MODULE_LICENSE("GPL");
+
+#define ACER_LED_METHOD_GUID "7A4DDFE7-5B5D-40B4-8595-4408E0CC7F56"
+
+struct acer_led {
+	char name[32];
+	struct led_classdev cdev;
+	struct acer_led_zone *zone;
+};
+
+struct acer_led_zone {
+	int id;
+	struct acer_led red;
+	struct acer_led green;
+	struct acer_led blue;
+};
+
+struct acer_led_priv {
+	struct acer_led_zone zones[4];
+};
+
+struct led_zone_set_param {
+	u8 zone;
+	u8 red;
+	u8 green;
+	u8 blue;
+} __packed;
+
+static int acer_led_update_zone(struct acer_led_zone *zone)
+{
+	int status;
+
+	struct led_zone_set_param set_params = {
+		.zone = 1 << zone->id,
+		.red = zone->red.cdev.brightness,
+		.green = zone->green.cdev.brightness,
+		.blue = zone->blue.cdev.brightness,
+	};
+	struct acpi_buffer set_input = {
+		sizeof(struct led_zone_set_param),
+		&set_params
+	};
+
+	status = wmi_evaluate_method(
+		ACER_LED_METHOD_GUID, 0, 0x6, &set_input, NULL);
+	if (ACPI_FAILURE(status))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int acer_led_set(struct led_classdev *cdev,
+			 enum led_brightness value)
+{
+	struct acer_led *led = container_of(cdev, struct acer_led, cdev);
+
+	return acer_led_update_zone(led->zone);
+}
+
+static int acer_led_setup_led(struct wmi_device *wdev,
+			       struct acer_led *led,
+			       struct acer_led_zone *zone,
+			       const char *color)
+{
+	snprintf(led->name, sizeof(led->name), "%s:kbd_backlight-%d",
+		 color, zone->id + 1);
+	led->cdev.name = led->name;
+	led->cdev.max_brightness = 255;
+	led->cdev.brightness_set_blocking = acer_led_set;
+	led->zone = zone;
+
+	return devm_led_classdev_register(&wdev->dev, &led->cdev);
+}
+
+static int acer_led_setup(struct wmi_device *wdev)
+{
+	struct acer_led_priv *priv = dev_get_drvdata(&wdev->dev);
+	int i, err = 0;
+
+	for (i = 0; i < 4; i++) {
+		priv->zones[i].id = i;
+
+		err = acer_led_setup_led(wdev, &priv->zones[i].red,
+					 &priv->zones[i], "red");
+		if (err)
+			return err;
+
+		err = acer_led_setup_led(wdev, &priv->zones[i].green,
+					 &priv->zones[i], "green");
+		if (err)
+			return err;
+
+		err = acer_led_setup_led(wdev, &priv->zones[i].blue,
+					 &priv->zones[i], "blue");
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static int acer_led_probe(struct wmi_device *wdev, const void *context)
+{
+	struct acer_led_priv *priv;
+
+	priv = devm_kzalloc(
+		&wdev->dev, sizeof(struct acer_led_priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	dev_set_drvdata(&wdev->dev, priv);
+
+	return acer_led_setup(wdev);
+}
+
+static const struct wmi_device_id acer_led_id_table[] = {
+	{ .guid_string = ACER_LED_METHOD_GUID },
+	{ },
+};
+
+static struct wmi_driver acer_led_driver = {
+	.driver = {
+		.name = "acer-led",
+	},
+	.id_table = acer_led_id_table,
+	.probe = acer_led_probe,
+};
+
+static int __init acer_led_init(void)
+{
+	return wmi_driver_register(&acer_led_driver);
+}
+late_initcall(acer_led_init);
+
+static void __exit acer_led_exit(void)
+{
+	wmi_driver_unregister(&acer_led_driver);
+}
+module_exit(acer_led_exit);
+
+MODULE_DEVICE_TABLE(wmi, acer_led_id_table);

base-commit: 009c9aa5be652675a06d5211e1640e02bbb1c33d
-- 
2.28.0

