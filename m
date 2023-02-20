Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052CEC6379F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Feb 2023 22:13:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232640AbjBTWNW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Feb 2023 17:13:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232635AbjBTWNV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Feb 2023 17:13:21 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4493ABBA1
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Feb 2023 14:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676931154;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1wmFjPeBR++Gy2BieIFCcgY1pSkWiBpG6/usJz+hPp8=;
        b=VKXkEjn0iiWaMnifs+Gh28GjWm8rKe4tNECNlUUG7OuSci6Mb/f40IhhX0DqC3hY+1Kw3d
        HtsSWGyeZNXWPq4jRMLrDnIEi9LoIYc/AGb5DYhe0uPRibgSa/18m43LZywm9aDdRaKBAq
        Fu8ZUiyyfeRKDfu2K2VRFWeQwOJCsDA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-UguxO3tiMP-RLXb8-tNuVw-1; Mon, 20 Feb 2023 17:12:29 -0500
X-MC-Unique: UguxO3tiMP-RLXb8-tNuVw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19DE0185A794;
        Mon, 20 Feb 2023 22:12:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.43])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 75AF4140EBF6;
        Mon, 20 Feb 2023 22:12:28 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 9/9] platform/x86: x86-android-tablets: Add support for the Dolby button on Peaq C1010
Date:   Mon, 20 Feb 2023 23:12:12 +0100
Message-Id: <20230220221212.196009-10-hdegoede@redhat.com>
In-Reply-To: <20230220221212.196009-1-hdegoede@redhat.com>
References: <20230220221212.196009-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Peaq C1010 tablet has a special "Dolby" button. This button has
a WMI interface, but this is broken in several ways:

1. It only supports polling
2. The value read on polling goes from 0 -> 1 for one poll on both edges
   of the button, with no way to tell which edge causes the poll to
   return 1.
3. It uses a non unique GUID (it uses the Microsoft docs WMI example GUID).

There currently is a WMI driver for this, but it uses several kludges
to work around these issues and is not entirely reliable due to 2.

Replace the unreliable WMI driver by using the x86-android-tablets code
to instantiate a gpio_keys device for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 MAINTAINERS                                   |   6 -
 drivers/platform/x86/Kconfig                  |   7 -
 drivers/platform/x86/Makefile                 |   1 -
 drivers/platform/x86/peaq-wmi.c               | 128 ------------------
 .../platform/x86/x86-android-tablets/dmi.c    |   9 ++
 .../platform/x86/x86-android-tablets/other.c  |  27 ++++
 6 files changed, 36 insertions(+), 142 deletions(-)
 delete mode 100644 drivers/platform/x86/peaq-wmi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 87cc1e6b37c0..3c86814fc3ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16377,12 +16377,6 @@ S:	Maintained
 F:	crypto/pcrypt.c
 F:	include/crypto/pcrypt.h
 
-PEAQ WMI HOTKEYS DRIVER
-M:	Hans de Goede <hdegoede@redhat.com>
-L:	platform-driver-x86@vger.kernel.org
-S:	Maintained
-F:	drivers/platform/x86/peaq-wmi.c
-
 PECI HARDWARE MONITORING DRIVERS
 M:	Iwona Winiarska <iwona.winiarska@intel.com>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 8b4e03fe5bff..e7166812875a 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -84,13 +84,6 @@ config MXM_WMI
           MXM is a standard for laptop graphics cards, the WMI interface
 	  is required for switchable nvidia graphics machines
 
-config PEAQ_WMI
-	tristate "PEAQ 2-in-1 WMI hotkey driver"
-	depends on ACPI_WMI
-	depends on INPUT
-	help
-	 Say Y here if you want to support WMI-based hotkeys on PEAQ 2-in-1s.
-
 config NVIDIA_WMI_EC_BACKLIGHT
 	tristate "EC Backlight Driver for Hybrid Graphics Notebook Systems"
 	depends on ACPI_VIDEO
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 0d9cc9af6ba7..12407f36d2be 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -12,7 +12,6 @@ obj-$(CONFIG_WMI_BMOF)		+= wmi-bmof.o
 obj-$(CONFIG_HUAWEI_WMI)		+= huawei-wmi.o
 obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
 obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
-obj-$(CONFIG_PEAQ_WMI)			+= peaq-wmi.o
 obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
 obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
 obj-$(CONFIG_YOGABOOK_WMI)		+= lenovo-yogabook-wmi.o
diff --git a/drivers/platform/x86/peaq-wmi.c b/drivers/platform/x86/peaq-wmi.c
deleted file mode 100644
index cf9c44c20a82..000000000000
--- a/drivers/platform/x86/peaq-wmi.c
+++ /dev/null
@@ -1,128 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * PEAQ 2-in-1 WMI hotkey driver
- * Copyright (C) 2017 Hans de Goede <hdegoede@redhat.com>
- */
-
-#include <linux/acpi.h>
-#include <linux/dmi.h>
-#include <linux/input.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-#define PEAQ_DOLBY_BUTTON_GUID		"ABBC0F6F-8EA1-11D1-00A0-C90629100000"
-#define PEAQ_DOLBY_BUTTON_METHOD_ID	5
-#define PEAQ_POLL_INTERVAL_MS		250
-#define PEAQ_POLL_IGNORE_MS		500
-#define PEAQ_POLL_MAX_MS		1000
-
-MODULE_ALIAS("wmi:"PEAQ_DOLBY_BUTTON_GUID);
-
-static struct input_dev *peaq_poll_dev;
-
-/*
- * The Dolby button (yes really a Dolby button) causes an ACPI variable to get
- * set on both press and release. The WMI method checks and clears that flag.
- * So for a press + release we will get back One from the WMI method either once
- * (if polling after the release) or twice (polling between press and release).
- * We ignore events for 0.5s after the first event to avoid reporting 2 presses.
- */
-static void peaq_wmi_poll(struct input_dev *input_dev)
-{
-	static unsigned long last_event_time;
-	static bool had_events;
-	union acpi_object obj;
-	acpi_status status;
-	u32 dummy = 0;
-
-	struct acpi_buffer input = { sizeof(dummy), &dummy };
-	struct acpi_buffer output = { sizeof(obj), &obj };
-
-	status = wmi_evaluate_method(PEAQ_DOLBY_BUTTON_GUID, 0,
-				     PEAQ_DOLBY_BUTTON_METHOD_ID,
-				     &input, &output);
-	if (ACPI_FAILURE(status))
-		return;
-
-	if (obj.type != ACPI_TYPE_INTEGER) {
-		dev_err(&input_dev->dev,
-			"Error WMBC did not return an integer\n");
-		return;
-	}
-
-	if (!obj.integer.value)
-		return;
-
-	if (had_events && time_before(jiffies, last_event_time +
-					msecs_to_jiffies(PEAQ_POLL_IGNORE_MS)))
-		return;
-
-	input_event(input_dev, EV_KEY, KEY_SOUND, 1);
-	input_sync(input_dev);
-	input_event(input_dev, EV_KEY, KEY_SOUND, 0);
-	input_sync(input_dev);
-
-	last_event_time = jiffies;
-	had_events = true;
-}
-
-/* Some other devices (Shuttle XS35) use the same WMI GUID for other purposes */
-static const struct dmi_system_id peaq_dmi_table[] __initconst = {
-	{
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "PEAQ"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "PEAQ PMM C1010 MD99187"),
-		},
-	},
-	{}
-};
-
-static int __init peaq_wmi_init(void)
-{
-	int err;
-
-	/* WMI GUID is not unique, also check for a DMI match */
-	if (!dmi_check_system(peaq_dmi_table))
-		return -ENODEV;
-
-	if (!wmi_has_guid(PEAQ_DOLBY_BUTTON_GUID))
-		return -ENODEV;
-
-	peaq_poll_dev = input_allocate_device();
-	if (!peaq_poll_dev)
-		return -ENOMEM;
-
-	peaq_poll_dev->name = "PEAQ WMI hotkeys";
-	peaq_poll_dev->phys = "wmi/input0";
-	peaq_poll_dev->id.bustype = BUS_HOST;
-	input_set_capability(peaq_poll_dev, EV_KEY, KEY_SOUND);
-
-	err = input_setup_polling(peaq_poll_dev, peaq_wmi_poll);
-	if (err)
-		goto err_out;
-
-	input_set_poll_interval(peaq_poll_dev, PEAQ_POLL_INTERVAL_MS);
-	input_set_max_poll_interval(peaq_poll_dev, PEAQ_POLL_MAX_MS);
-
-	err = input_register_device(peaq_poll_dev);
-	if (err)
-		goto err_out;
-
-	return 0;
-
-err_out:
-	input_free_device(peaq_poll_dev);
-	return err;
-}
-
-static void __exit peaq_wmi_exit(void)
-{
-	input_unregister_device(peaq_poll_dev);
-}
-
-module_init(peaq_wmi_init);
-module_exit(peaq_wmi_exit);
-
-MODULE_DESCRIPTION("PEAQ 2-in-1 WMI hotkey driver");
-MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
-MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/x86-android-tablets/dmi.c b/drivers/platform/x86/x86-android-tablets/dmi.c
index ec7c0af8d73d..9a236bcd9728 100644
--- a/drivers/platform/x86/x86-android-tablets/dmi.c
+++ b/drivers/platform/x86/x86-android-tablets/dmi.c
@@ -30,6 +30,7 @@ extern struct x86_dev_info lenovo_yoga_tab2_830_1050_info;
 extern const struct x86_dev_info lenovo_yt3_info;
 extern const struct x86_dev_info medion_lifetab_s10346_info;
 extern const struct x86_dev_info nextbook_ares8_info;
+extern const struct x86_dev_info peaq_c1010_info;
 extern const struct x86_dev_info whitelabel_tm800a550l_info;
 extern const struct x86_dev_info xiaomi_mipad2_info;
 
@@ -143,6 +144,14 @@ const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
 		},
 		.driver_data = (void *)&nextbook_ares8_info,
 	},
+	{
+		/* Peaq C1010 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "PEAQ"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "PEAQ PMM C1010 MD99187"),
+		},
+		.driver_data = (void *)&peaq_c1010_info,
+	},
 	{
 		/* Whitelabel (sold as various brands) TM800A550L */
 		.matches = {
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index e4b3ad2ce7c1..e09d3baff677 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -377,6 +377,33 @@ const struct x86_dev_info nextbook_ares8_info __initconst = {
 	.invalid_aei_gpiochip = "INT33FC:02",
 };
 
+/*
+ * Peaq C1010
+ * This is a standard Windows tablet, but it has a special Dolby button.
+ * This button has a WMI interface, but that is broken. Instead of trying to
+ * use the broken WMI interface, instantiate a gpio_keys device for this.
+ */
+static struct gpio_keys_button peaq_c1010_button = {
+	.code = KEY_SOUND,
+	/* .gpio gets filled in by x86_android_tablet_init() */
+	.active_low = true,
+	.desc = "dolby_key",
+	.type = EV_KEY,
+	.wakeup = false,
+	.debounce_interval = 50,
+};
+
+const struct x86_dev_info peaq_c1010_info __initconst = {
+	.gpio_keys_button = &peaq_c1010_button,
+	.gpio_keys_gpiochip = "INT33FC:00",
+	.gpio_keys_pin = 3,
+	/*
+	 * Move the ACPI event handler used by the broken WMI interface out of
+	 * the way. This is the only event handler on INT33FC:00.
+	 */
+	.invalid_aei_gpiochip = "INT33FC:00",
+};
+
 /*
  * Whitelabel (sold as various brands) TM800A550L tablets.
  * These tablet's DSDT contains a whole bunch of bogus ACPI I2C devices
-- 
2.39.1

