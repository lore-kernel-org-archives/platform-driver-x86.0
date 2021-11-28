Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E6EC4167D
	for <platform-driver-x86@archiver.kernel.org>; Sun, 28 Nov 2021 19:02:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235652AbhK1TF7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 28 Nov 2021 14:05:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30087 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236767AbhK1TD7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 28 Nov 2021 14:03:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638126042;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GEfCmQI1DOfUz+r2SPdLoOxGAgWpW528VfqmzC86BA0=;
        b=Wsvhz9+QCHzvZkTfvIsD5WZ37yPOHKHrjBDV4RxJIIW7ca6yAcWIq60EbC6/dHMq8HyUwp
        qyyl/dBcOVEnAtylqEi0IoQ+Vf7v3yBQSS9IL43T7evLMm54C4z3SJ+K6yg3NUtaufyyr3
        z++iI9cg2QhNkPq3RQxgRXDcYkO8qT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-234-rK8MfWSjMeC3U0RvWSYZDw-1; Sun, 28 Nov 2021 14:00:38 -0500
X-MC-Unique: rK8MfWSjMeC3U0RvWSYZDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D47058042E2;
        Sun, 28 Nov 2021 19:00:37 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.65])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BD1DF60BF1;
        Sun, 28 Nov 2021 19:00:36 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 4/5] platform/x86: lenovo-yogabook-wmi: Add driver for Lenovo Yoga Book
Date:   Sun, 28 Nov 2021 20:00:30 +0100
Message-Id: <20211128190031.405620-4-hdegoede@redhat.com>
In-Reply-To: <20211128190031.405620-1-hdegoede@redhat.com>
References: <20211128190031.405620-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Yauhen Kharuzhy <jekhor@gmail.com>

Add driver to handle WMI events, control the keyboard backlight and
bind/unbind the keyboard-touch / digitizer driver so that only one
is active at a time.

It may seem a bit weird to handle the toggling of the modes in the
kernel, but the hw actually expects only 1 device to be active
at a time.

Changes by Hans de Goede:
- Whole bunch of cleanups
- Make the kernel do the driver bind/unbind itself instead of
  sending events to userspace and requiring a special userspace
  daemon to deal with this

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
Co-developed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/Kconfig               |  13 +
 drivers/platform/x86/Makefile              |   1 +
 drivers/platform/x86/lenovo-yogabook-wmi.c | 339 +++++++++++++++++++++
 3 files changed, 353 insertions(+)
 create mode 100644 drivers/platform/x86/lenovo-yogabook-wmi.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index ad1c45682f0e..a1dd5e0676d1 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -127,6 +127,19 @@ config GIGABYTE_WMI
 	  To compile this driver as a module, choose M here: the module will
 	  be called gigabyte-wmi.
 
+config YOGABOOK_WMI
+	tristate "Lenovo Yoga Book tablet WMI key driver"
+	depends on ACPI_WMI
+	depends on INPUT
+	select LEDS_CLASS
+	select NEW_LEDS
+	help
+	  Say Y here if you want to support the 'Pen' key and keyboard backlight
+	  control on the Lenovo Yoga Book tablets.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called lenovo-yogabook-wmi.
+
 config ACERHDF
 	tristate "Acer Aspire One temperature and fan driver"
 	depends on ACPI && THERMAL
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index d6bd2ff5f76d..30047df8f701 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
 obj-$(CONFIG_PEAQ_WMI)			+= peaq-wmi.o
 obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
 obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
+obj-$(CONFIG_YOGABOOK_WMI)		+= lenovo-yogabook-wmi.o
 
 # Acer
 obj-$(CONFIG_ACERHDF)		+= acerhdf.o
diff --git a/drivers/platform/x86/lenovo-yogabook-wmi.c b/drivers/platform/x86/lenovo-yogabook-wmi.c
new file mode 100644
index 000000000000..ecd624d9108f
--- /dev/null
+++ b/drivers/platform/x86/lenovo-yogabook-wmi.c
@@ -0,0 +1,339 @@
+// SPDX-License-Identifier: GPL-2.0
+/* WMI driver for Lenovo Yoga Book YB1-X90* / -X91* tablets */
+
+#include <linux/acpi.h>
+#include <linux/devm-helpers.h>
+#include <linux/module.h>
+#include <linux/leds.h>
+#include <linux/wmi.h>
+#include <linux/workqueue.h>
+
+#define YB_MBTN_EVENT_GUID	"243FEC1D-1963-41C1-8100-06A9D82A94B4"
+#define YB_MBTN_METHOD_GUID	"742B0CA1-0B20-404B-9CAA-AEFCABF30CE0"
+
+#define YB_PAD_ENABLE	1
+#define YB_PAD_DISABLE	2
+#define YB_LIGHTUP_BTN	3
+
+#define YB_KBD_BL_DEFAULT 128
+
+/* flags */
+enum {
+	YB_KBD_IS_ON,
+	YB_DIGITIZER_IS_ON,
+	YB_DIGITIZER_MODE,
+	YB_SUSPENDED,
+};
+
+struct yogabook_wmi {
+	struct wmi_device *wdev;
+	struct acpi_device *kbd_adev;
+	struct acpi_device *dig_adev;
+	struct device *kbd_dev;
+	struct device *dig_dev;
+	struct work_struct work;
+	struct led_classdev kbd_bl_led;
+	unsigned long flags;
+	uint8_t brightness;
+};
+
+static int yogabook_wmi_do_action(struct wmi_device *wdev, int action)
+{
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer input;
+	acpi_status status;
+	u32 dummy_arg = 0;
+
+	dev_dbg(&wdev->dev, "Do action: %d\n", action);
+
+	input.pointer = &dummy_arg;
+	input.length = sizeof(dummy_arg);
+
+	status = wmi_evaluate_method(YB_MBTN_METHOD_GUID, 0, action, &input,
+				     &output);
+	if (ACPI_FAILURE(status)) {
+		dev_err(&wdev->dev, "Calling WMI method failure: 0x%x\n",
+			status);
+		return status;
+	}
+
+	kfree(output.pointer);
+
+	return 0;
+}
+
+/*
+ * To control keyboard backlight, call the method KBLC() of the TCS1 ACPI
+ * device (Goodix touchpad acts as virtual sensor keyboard).
+ */
+static int yogabook_wmi_set_kbd_backlight(struct wmi_device *wdev,
+					  uint8_t level)
+{
+	struct yogabook_wmi *data = dev_get_drvdata(&wdev->dev);
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_object_list input;
+	union acpi_object param;
+	acpi_status status;
+
+	if (data->kbd_adev->power.state != ACPI_STATE_D0) {
+		dev_warn(&wdev->dev, "keyboard touchscreen not in D0, cannot set brightness\n");
+		return -ENXIO;
+	}
+
+	dev_dbg(&wdev->dev, "Set KBLC level to %u\n", level);
+
+	input.count = 1;
+	input.pointer = &param;
+
+	param.type = ACPI_TYPE_INTEGER;
+	param.integer.value = 255 - level;
+
+	status = acpi_evaluate_object(acpi_device_handle(data->kbd_adev), "KBLC",
+				      &input, &output);
+	if (ACPI_FAILURE(status)) {
+		dev_err(&wdev->dev, "Failed to call KBLC method: 0x%x\n", status);
+		return status;
+	}
+
+	kfree(output.pointer);
+	return 0;
+}
+
+static void yogabook_wmi_work(struct work_struct *work)
+{
+	struct yogabook_wmi *data = container_of(work, struct yogabook_wmi, work);
+	struct device *dev = &data->wdev->dev;
+	bool kbd_on, digitizer_on;
+	int r;
+
+	if (test_bit(YB_SUSPENDED, &data->flags))
+		return;
+
+	if (test_bit(YB_DIGITIZER_MODE, &data->flags)) {
+		digitizer_on = true;
+		kbd_on = false;
+	} else {
+		kbd_on = true;
+		digitizer_on = false;
+	}
+
+	if (!kbd_on && test_bit(YB_KBD_IS_ON, &data->flags)) {
+		/*
+		 * Must be done before releasing the keyboard touchscreen driver,
+		 * so that the keyboard touchscreen dev is still in D0.
+		 */
+		yogabook_wmi_set_kbd_backlight(data->wdev, 0);
+		device_release_driver(data->kbd_dev);
+		clear_bit(YB_KBD_IS_ON, &data->flags);
+	}
+
+	if (!digitizer_on && test_bit(YB_DIGITIZER_IS_ON, &data->flags)) {
+		yogabook_wmi_do_action(data->wdev, YB_PAD_DISABLE);
+		device_release_driver(data->dig_dev);
+		clear_bit(YB_DIGITIZER_IS_ON, &data->flags);
+	}
+
+	if (kbd_on && !test_bit(YB_KBD_IS_ON, &data->flags)) {
+		r = device_reprobe(data->kbd_dev);
+		if (r)
+			dev_warn(dev, "Reprobe of keyboard touchscreen failed: %d\n", r);
+
+		yogabook_wmi_set_kbd_backlight(data->wdev, data->brightness);
+		set_bit(YB_KBD_IS_ON, &data->flags);
+	}
+
+	if (digitizer_on && !test_bit(YB_DIGITIZER_IS_ON, &data->flags)) {
+		r = device_reprobe(data->dig_dev);
+		if (r)
+			dev_warn(dev, "Reprobe of digitizer failed: %d\n", r);
+
+		yogabook_wmi_do_action(data->wdev, YB_PAD_ENABLE);
+		set_bit(YB_DIGITIZER_IS_ON, &data->flags);
+	}
+}
+
+static void yogabook_wmi_notify(struct wmi_device *wdev, union acpi_object *dummy)
+{
+	struct yogabook_wmi *data = dev_get_drvdata(&wdev->dev);
+
+	if (test_bit(YB_SUSPENDED, &data->flags))
+		return;
+
+	if (test_bit(YB_DIGITIZER_MODE, &data->flags))
+		clear_bit(YB_DIGITIZER_MODE, &data->flags);
+	else
+		set_bit(YB_DIGITIZER_MODE, &data->flags);
+
+	/*
+	 * We are called from the ACPI core and the driver [un]binding which is
+	 * done also needs ACPI functions, use a workqueue to avoid deadlocking.
+	 */
+	schedule_work(&data->work);
+}
+
+static enum led_brightness kbd_brightness_get(struct led_classdev *cdev)
+{
+	struct yogabook_wmi *data =
+		container_of(cdev, struct yogabook_wmi, kbd_bl_led);
+
+	return data->brightness;
+}
+
+static int kbd_brightness_set(struct led_classdev *cdev,
+			      enum led_brightness value)
+{
+	struct yogabook_wmi *data =
+		container_of(cdev, struct yogabook_wmi, kbd_bl_led);
+	struct wmi_device *wdev = data->wdev;
+
+	if ((value < 0) || (value > 255))
+		return -EINVAL;
+
+	data->brightness = value;
+
+	if (data->kbd_adev->power.state != ACPI_STATE_D0)
+		return 0;
+
+	return yogabook_wmi_set_kbd_backlight(wdev, data->brightness);
+}
+
+static int yogabook_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct yogabook_wmi *data;
+	int r;
+
+	data = devm_kzalloc(&wdev->dev, sizeof(struct yogabook_wmi), GFP_KERNEL);
+	if (data == NULL)
+		return -ENOMEM;
+
+	dev_set_drvdata(&wdev->dev, data);
+
+	data->wdev = wdev;
+	data->brightness = YB_KBD_BL_DEFAULT;
+	set_bit(YB_KBD_IS_ON, &data->flags);
+	set_bit(YB_DIGITIZER_IS_ON, &data->flags);
+
+	r = devm_work_autocancel(&wdev->dev, &data->work, yogabook_wmi_work);
+	if (r)
+		return r;
+
+	data->kbd_adev = acpi_dev_get_first_match_dev("GDIX1001", NULL, -1);
+	if (!data->kbd_adev) {
+		dev_err(&wdev->dev, "Cannot find the touchpad device in ACPI tables\n");
+		return -ENODEV;
+	}
+
+	data->dig_adev = acpi_dev_get_first_match_dev("WCOM0019", NULL, -1);
+	if (!data->dig_adev) {
+		dev_err(&wdev->dev, "Cannot find the digitizer device in ACPI tables\n");
+		r = -ENODEV;
+		goto error_put_devs;
+	}
+
+	data->kbd_dev = get_device(acpi_get_first_physical_node(data->kbd_adev));
+	if (!data->kbd_dev || !data->kbd_dev->driver) {
+		r = -EPROBE_DEFER;
+		goto error_put_devs;
+	}
+
+	data->dig_dev = get_device(acpi_get_first_physical_node(data->dig_adev));
+	if (!data->dig_dev || !data->dig_dev->driver) {
+		r = -EPROBE_DEFER;
+		goto error_put_devs;
+	}
+
+	schedule_work(&data->work);
+
+	data->kbd_bl_led.name = "ybwmi::kbd_backlight";
+	data->kbd_bl_led.brightness_set_blocking = kbd_brightness_set;
+	data->kbd_bl_led.brightness_get = kbd_brightness_get;
+	data->kbd_bl_led.max_brightness = 255;
+
+	r = devm_led_classdev_register(&wdev->dev, &data->kbd_bl_led);
+	if (r < 0) {
+		dev_err_probe(&wdev->dev, r, "Registering backlight LED device\n");
+		goto error_put_devs;
+	}
+
+	return 0;
+
+error_put_devs:
+	put_device(data->dig_dev);
+	put_device(data->kbd_dev);
+	acpi_dev_put(data->dig_adev);
+	acpi_dev_put(data->kbd_adev);
+	return r;
+}
+
+static void yogabook_wmi_remove(struct wmi_device *wdev)
+{
+	struct yogabook_wmi *data = dev_get_drvdata(&wdev->dev);
+
+	put_device(data->dig_dev);
+	put_device(data->kbd_dev);
+	acpi_dev_put(data->dig_adev);
+	acpi_dev_put(data->kbd_adev);
+}
+
+__maybe_unused int yogabook_wmi_suspend(struct device *dev)
+{
+	struct wmi_device *wdev = container_of(dev, struct wmi_device, dev);
+	struct yogabook_wmi *data = dev_get_drvdata(dev);
+
+	set_bit(YB_SUSPENDED, &data->flags);
+
+	flush_work(&data->work);
+
+	/* Turn off the pen button at sleep */
+	if (test_bit(YB_DIGITIZER_IS_ON, &data->flags))
+		yogabook_wmi_do_action(wdev, YB_PAD_DISABLE);
+
+	return 0;
+}
+
+__maybe_unused int yogabook_wmi_resume(struct device *dev)
+{
+	struct wmi_device *wdev = container_of(dev, struct wmi_device, dev);
+	struct yogabook_wmi *data = dev_get_drvdata(dev);
+
+	if (test_bit(YB_KBD_IS_ON, &data->flags)) {
+		/* Ensure keyboard touchpad is on before we call KBLC() */
+		acpi_device_set_power(data->kbd_adev, ACPI_STATE_D0);
+		yogabook_wmi_set_kbd_backlight(wdev, data->brightness);
+	}
+
+	if (test_bit(YB_DIGITIZER_IS_ON, &data->flags))
+		yogabook_wmi_do_action(wdev, YB_PAD_ENABLE);
+
+	clear_bit(YB_SUSPENDED, &data->flags);
+
+	return 0;
+}
+
+static const struct wmi_device_id yogabook_wmi_id_table[] = {
+	{
+		.guid_string = YB_MBTN_EVENT_GUID,
+	},
+	{ } /* Terminating entry */
+};
+
+static SIMPLE_DEV_PM_OPS(yogabook_wmi_pm_ops,
+			 yogabook_wmi_suspend, yogabook_wmi_resume);
+
+static struct wmi_driver yogabook_wmi_driver = {
+	.driver = {
+		.name = "yogabook-wmi",
+		.pm = &yogabook_wmi_pm_ops,
+	},
+	.no_notify_data = true,
+	.id_table = yogabook_wmi_id_table,
+	.probe = yogabook_wmi_probe,
+	.remove = yogabook_wmi_remove,
+	.notify = yogabook_wmi_notify,
+};
+module_wmi_driver(yogabook_wmi_driver);
+
+MODULE_DEVICE_TABLE(wmi, yogabook_wmi_id_table);
+MODULE_AUTHOR("Yauhen Kharuzhy");
+MODULE_DESCRIPTION("Lenovo Yoga Book WMI driver");
+MODULE_LICENSE("GPL v2");
-- 
2.33.1

