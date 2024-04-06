Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9C02DF87
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Apr 2024 12:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712407999; cv=none; b=gy4TLy6iaqvlbO4eWs9O3gtSkjTcrPU1OFzvxRvm1rFtW8mnxrd0PMmRP1pcpjzNPKkks8Zmob5XMj6+RX//aV0e9Fw3oQOJeC57a6niFnzbQdX9dnNdJBdoPuTB1CRlHBqOdkTU0xKFqnq3bAp5J/REKWSzkKkkaSw0O+uPDRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712407999; c=relaxed/simple;
	bh=WaCT3d+iM20+DcgwJK9YhyExkJe2kyYNXPKvZZCxMEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q8H594Os+0cNgPb1QM0kpMehTD6wIHgn+UKaIMDwc2SwU/ZiJZeak7u2uQ9FJPhl3mQfOk9UNK3pyHmqH55WfEjMmd/hFhOw0wTInAejP2KbIRC6kAygOvcA4iY8ttB4ebfMqdwxfJ0xmZ62s80BIpLDIC8e36RpQMmFn/O0H60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ckH9YGaz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ckH9YGaz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712407996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uG4RG3k1MZccfa/bMuiUoUbe2Tus9U6tqq2mIqbKbh8=;
	b=ckH9YGazfJF4rgEYFGhOxZs+CQ0DAIxoaGkKMwhflMTDmGXWSSH5T2Lg4GWNBxJb7i9Ii7
	P/UNv/Ohe/XniyFcygmqlFbzMAUGFKv4SJbiiCIRYlRzNmNiNTyn3Q3C6kYyIV5Jt9/h66
	Vvzm/8ouKSLrarLDmPWnznK9XrrU60Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683--8NKWYyhMq6A9RZqsvjEaA-1; Sat, 06 Apr 2024 08:53:13 -0400
X-MC-Unique: -8NKWYyhMq6A9RZqsvjEaA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29B8285A588;
	Sat,  6 Apr 2024 12:53:13 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.50])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E076492BCD;
	Sat,  6 Apr 2024 12:53:12 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/3] platform/x86: Add lenovo-yoga-tab2-pro-1380-fastcharger driver
Date: Sat,  6 Apr 2024 14:50:58 +0200
Message-ID: <20240406125058.13624-3-hdegoede@redhat.com>
In-Reply-To: <20240406125058.13624-1-hdegoede@redhat.com>
References: <20240406125058.13624-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

Add a new driver for the custom fast charging protocol found on Lenovo Yoga
Tablet 2 1380F / 1380L models.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/Kconfig                  |  11 +
 drivers/platform/x86/Makefile                 |   1 +
 .../lenovo-yoga-tab2-pro-1380-fastcharger.c   | 340 ++++++++++++++++++
 3 files changed, 352 insertions(+)
 create mode 100644 drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index ae7ad6360954..a64aab3ed511 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -133,6 +133,17 @@ config YOGABOOK
 	  To compile this driver as a module, choose M here: the module will
 	  be called lenovo-yogabook.
 
+config YT2_1380
+	tristate "Lenovo Yoga Tablet 2 1380 fast charge driver"
+	depends on SERIAL_DEV_BUS
+	depends on ACPI
+	help
+	  Say Y here to enable support for the custom fast charging protocol
+	  found on the Lenovo Yoga Tablet 2 1380F / 1380L models.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called lenovo-yogabook.
+
 config ACERHDF
 	tristate "Acer Aspire One temperature and fan driver"
 	depends on ACPI && THERMAL
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 5521a87f0718..2640475a9f97 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -66,6 +66,7 @@ obj-$(CONFIG_SENSORS_HDAPS)	+= hdaps.o
 obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
 obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
 obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
+obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
 obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
 
 # Intel
diff --git a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
new file mode 100644
index 000000000000..7281cc412193
--- /dev/null
+++ b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
@@ -0,0 +1,340 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Support for the custom fast charging protocol found on the Lenovo Yoga
+ * Tablet 2 1380F / 1380L models.
+ *
+ * Copyright (C) 2024 Hans de Goede <hansg@kernel.org>
+ */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/delay.h>
+#include <linux/extcon.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/machine.h>
+#include <linux/platform_device.h>
+#include <linux/serdev.h>
+#include <linux/workqueue.h>
+#include "serdev_helpers.h"
+
+#define YT2_1380_FC_PDEV_NAME		"lenovo-yoga-tab2-pro-1380-fastcharger"
+#define YT2_1380_FC_SERDEV_CTRL		"serial0"
+#define YT2_1380_FC_SERDEV_NAME		"serial0-0"
+#define YT2_1380_FC_EXTCON_NAME		"i2c-lc824206xa"
+
+#define YT2_1380_FC_MAX_TRIES		5
+#define YT2_1380_FC_PIN_SW_DELAY_US	10000
+#define YT2_1380_FC_UART_DRAIN_DELAY_US	50000
+#define YT2_1380_FC_VOLT_SW_DELAY_US	1000000
+
+struct yt2_1380_fc {
+	struct device *dev;
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *gpio_state;
+	struct pinctrl_state *uart_state;
+	struct gpio_desc *uart3_txd;
+	struct gpio_desc *uart3_rxd;
+	struct extcon_dev *extcon;
+	struct notifier_block nb;
+	struct work_struct work;
+	bool fast_charging;
+};
+
+static int yt2_1380_fc_set_gpio_mode(struct yt2_1380_fc *fc, bool enable)
+{
+	struct pinctrl_state *state = enable ? fc->gpio_state : fc->uart_state;
+	int ret;
+
+	ret = pinctrl_select_state(fc->pinctrl, state);
+	if (ret) {
+		dev_err(fc->dev, "Error %d setting pinctrl state\n", ret);
+		return ret;
+	}
+
+	fsleep(YT2_1380_FC_PIN_SW_DELAY_US);
+	return 0;
+}
+
+static bool yt2_1380_fc_dedicated_charger_connected(struct yt2_1380_fc *fc)
+{
+	int ret;
+
+	ret = extcon_get_state(fc->extcon, EXTCON_CHG_USB_DCP);
+	return ret > 0;
+}
+
+static bool yt2_1380_fc_fast_charger_connected(struct yt2_1380_fc *fc)
+{
+	int ret;
+
+	ret = extcon_get_state(fc->extcon, EXTCON_CHG_USB_FAST);
+	return ret > 0;
+}
+
+static void yt2_1380_fc_worker(struct work_struct *work)
+{
+	struct yt2_1380_fc *fc = container_of(work, struct yt2_1380_fc, work);
+	int i, ret;
+
+	/* Do nothing if already fast charging */
+	if (yt2_1380_fc_fast_charger_connected(fc))
+		return;
+
+	for (i = 0; i < YT2_1380_FC_MAX_TRIES; i++) {
+		/* Set pins to UART mode (for charger disconnect and retries) */
+		ret = yt2_1380_fc_set_gpio_mode(fc, false);
+		if (ret)
+			return;
+
+		/* Only try 12V charging if a dedicated charger is detected */
+		if (!yt2_1380_fc_dedicated_charger_connected(fc))
+			return;
+
+		/* Send the command to switch to 12V charging */
+		ret = serdev_device_write_buf(to_serdev_device(fc->dev), "SC", 2);
+		if (ret != 2) {
+			dev_err(fc->dev, "Error %d writing to uart\n", ret);
+			return;
+		}
+
+		fsleep(YT2_1380_FC_UART_DRAIN_DELAY_US);
+
+		/* Re-check a charger is still connected */
+		if (!yt2_1380_fc_dedicated_charger_connected(fc))
+			return;
+
+		/*
+		 * Now switch the lines to GPIO (output, high). The charger
+		 * expects the lines being driven high after the command.
+		 * Presumably this is used to detect the tablet getting
+		 * unplugged (to switch back to 5V output on unplug).
+		 */
+		ret = yt2_1380_fc_set_gpio_mode(fc, true);
+		if (ret)
+			return;
+
+		fsleep(YT2_1380_FC_VOLT_SW_DELAY_US);
+
+		if (yt2_1380_fc_fast_charger_connected(fc))
+			return; /* Success */
+	}
+
+	dev_dbg(fc->dev, "Failed to switch to 12V charging (not the original charger?)\n");
+	/* Failed to enable 12V fast charging, reset pins to default UART mode */
+	yt2_1380_fc_set_gpio_mode(fc, false);
+}
+
+static int yt2_1380_fc_extcon_evt(struct notifier_block *nb,
+				  unsigned long event, void *param)
+{
+	struct yt2_1380_fc *fc = container_of(nb, struct yt2_1380_fc, nb);
+
+	schedule_work(&fc->work);
+	return NOTIFY_OK;
+}
+
+static size_t yt2_1380_fc_receive(struct serdev_device *serdev, const u8 *data, size_t len)
+{
+	/*
+	 * Since the USB data lines are shorted for DCP detection, echos of
+	 * the "SC" command send in yt2_1380_fc_worker() will be received.
+	 */
+	dev_dbg(&serdev->dev, "recv: %*ph\n", (int)len, data);
+	return len;
+}
+
+static const struct serdev_device_ops yt2_1380_fc_serdev_ops = {
+	.receive_buf = yt2_1380_fc_receive,
+	.write_wakeup = serdev_device_write_wakeup,
+};
+
+static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
+{
+	struct device *dev = &serdev->dev;
+	struct yt2_1380_fc *fc;
+	int ret;
+
+	fc = devm_kzalloc(dev, sizeof(*fc), GFP_KERNEL);
+	if (!fc)
+		return -ENOMEM;
+
+	fc->dev = dev;
+	fc->nb.notifier_call = yt2_1380_fc_extcon_evt;
+	INIT_WORK(&fc->work, yt2_1380_fc_worker);
+
+	/*
+	 * Do this first since it may return -EPROBE_DEFER.
+	 * There is no extcon_put(), so there is no need to free this.
+	 */
+	fc->extcon = extcon_get_extcon_dev(YT2_1380_FC_EXTCON_NAME);
+	if (IS_ERR(fc->extcon))
+		return dev_err_probe(dev, PTR_ERR(fc->extcon), "getting extcon\n");
+
+	fc->pinctrl = devm_pinctrl_get(dev);
+	if (IS_ERR(fc->pinctrl))
+		return dev_err_probe(dev, PTR_ERR(fc->pinctrl), "getting pinctrl\n");
+
+	/*
+	 * To switch the UART3 pins connected to the USB data lines between
+	 * UART and GPIO modes.
+	 */
+	fc->gpio_state = pinctrl_lookup_state(fc->pinctrl, "uart3_gpio");
+	fc->uart_state = pinctrl_lookup_state(fc->pinctrl, "uart3_uart");
+	if (IS_ERR(fc->gpio_state) || IS_ERR(fc->uart_state))
+		return dev_err_probe(dev, -EINVAL, "getting pinctrl states\n");
+
+	ret = yt2_1380_fc_set_gpio_mode(fc, true);
+	if (ret)
+		return ret;
+
+	fc->uart3_txd = devm_gpiod_get(dev, "uart3_txd", GPIOD_OUT_HIGH);
+	if (IS_ERR(fc->uart3_txd))
+		return dev_err_probe(dev, PTR_ERR(fc->uart3_txd), "getting uart3_txd gpio\n");
+
+	fc->uart3_rxd = devm_gpiod_get(dev, "uart3_rxd", GPIOD_OUT_HIGH);
+	if (IS_ERR(fc->uart3_rxd))
+		return dev_err_probe(dev, PTR_ERR(fc->uart3_rxd), "getting uart3_rxd gpio\n");
+
+	ret = yt2_1380_fc_set_gpio_mode(fc, false);
+	if (ret)
+		return ret;
+
+	ret = devm_serdev_device_open(dev, serdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "opening UART device\n");
+
+	serdev_device_set_baudrate(serdev, 600);
+	serdev_device_set_flow_control(serdev, false);
+	serdev_device_set_drvdata(serdev, fc);
+	serdev_device_set_client_ops(serdev, &yt2_1380_fc_serdev_ops);
+
+	ret = devm_extcon_register_notifier_all(dev, fc->extcon, &fc->nb);
+	if (ret)
+		return dev_err_probe(dev, ret, "registering extcon notifier\n");
+
+	/* In case the extcon already has detected a DCP charger */
+	schedule_work(&fc->work);
+
+	return 0;
+}
+
+struct serdev_device_driver yt2_1380_fc_serdev_driver = {
+	.probe = yt2_1380_fc_serdev_probe,
+	.driver = {
+		.name = KBUILD_MODNAME,
+	},
+};
+
+static const struct pinctrl_map yt2_1380_fc_pinctrl_map[] = {
+	PIN_MAP_MUX_GROUP(YT2_1380_FC_SERDEV_NAME, "uart3_uart",
+			  "INT33FC:00", "uart3_grp", "uart"),
+	PIN_MAP_MUX_GROUP(YT2_1380_FC_SERDEV_NAME, "uart3_gpio",
+			  "INT33FC:00", "uart3_grp_gpio", "gpio"),
+};
+
+static int yt2_1380_fc_pdev_probe(struct platform_device *pdev)
+{
+	struct serdev_device *serdev;
+	struct device *ctrl_dev;
+	int ret;
+
+	/* Register pinctrl mappings for setting the UART3 pins mode */
+	ret = pinctrl_register_mappings(yt2_1380_fc_pinctrl_map,
+					ARRAY_SIZE(yt2_1380_fc_pinctrl_map));
+	if (ret)
+		return ret;
+
+	/* And create the serdev to talk to the charger over the UART3 pins */
+	ctrl_dev = get_serdev_controller("PNP0501", "1", 0, YT2_1380_FC_SERDEV_CTRL);
+	if (IS_ERR(ctrl_dev)) {
+		ret = PTR_ERR(ctrl_dev);
+		goto out_pinctrl_unregister_mappings;
+	}
+
+	serdev = serdev_device_alloc(to_serdev_controller(ctrl_dev));
+	put_device(ctrl_dev);
+	if (!serdev) {
+		ret = -ENOMEM;
+		goto out_pinctrl_unregister_mappings;
+	}
+
+	ret = serdev_device_add(serdev);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "adding serdev\n");
+		serdev_device_put(serdev);
+		goto out_pinctrl_unregister_mappings;
+	}
+
+	/*
+	 * serdev device <-> driver matching relies on OF or ACPI matches and
+	 * neither is available here, manually bind the driver.
+	 */
+	ret = device_driver_attach(&yt2_1380_fc_serdev_driver.driver, &serdev->dev);
+	if (ret) {
+		/* device_driver_attach() maps EPROBE_DEFER to EAGAIN, map it back */
+		ret = (ret == -EAGAIN) ? -EPROBE_DEFER : ret;
+		dev_err_probe(&pdev->dev, ret, "attaching serdev driver\n");
+		goto out_serdev_device_remove;
+	}
+
+	/* So that yt2_1380_fc_pdev_remove() can remove the serdev */
+	platform_set_drvdata(pdev, serdev);
+	return 0;
+
+out_serdev_device_remove:
+	serdev_device_remove(serdev);
+out_pinctrl_unregister_mappings:
+	pinctrl_unregister_mappings(yt2_1380_fc_pinctrl_map);
+	return ret;
+}
+
+static void yt2_1380_fc_pdev_remove(struct platform_device *pdev)
+{
+	struct serdev_device *serdev = platform_get_drvdata(pdev);
+
+	serdev_device_remove(serdev);
+	pinctrl_unregister_mappings(yt2_1380_fc_pinctrl_map);
+}
+
+static struct platform_driver yt2_1380_fc_pdev_driver = {
+	.probe = yt2_1380_fc_pdev_probe,
+	.remove_new = yt2_1380_fc_pdev_remove,
+	.driver = {
+		.name = YT2_1380_FC_PDEV_NAME,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+};
+
+static int __init yt2_1380_fc_module_init(void)
+{
+	int ret;
+
+	/*
+	 * serdev driver MUST be registered first because pdev driver calls
+	 * device_driver_attach() on the serdev, serdev-driver pair.
+	 */
+	ret = serdev_device_driver_register(&yt2_1380_fc_serdev_driver);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&yt2_1380_fc_pdev_driver);
+	if (ret)
+		serdev_device_driver_unregister(&yt2_1380_fc_serdev_driver);
+
+	return ret;
+}
+module_init(yt2_1380_fc_module_init);
+
+static void __exit yt2_1380_fc_module_exit(void)
+{
+	platform_driver_unregister(&yt2_1380_fc_pdev_driver);
+	serdev_device_driver_unregister(&yt2_1380_fc_serdev_driver);
+}
+module_exit(yt2_1380_fc_module_exit);
+
+MODULE_ALIAS("platform:" YT2_1380_FC_PDEV_NAME);
+MODULE_DESCRIPTION("Lenovo Yoga Tablet 2 1380 fast charge driver");
+MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
+MODULE_LICENSE("GPL");
-- 
2.44.0

