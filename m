Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648475DF18
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 Feb 2024 19:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707681196; cv=none; b=cgGirZbLWxiOeTfKAxnEAVM4ORa5iAy9WWmh4aLkTCPOMUNUl3bCB8F6St7IjfajDgslfB7AbOuHTW+4QLu4TFr0f4l6eEL8ds1IINnUdQJItgddkpsw2okljedwYS1gC4uF/lQF5/SgDSoULTbmRG5OmhTAjTNbbcLVhYRxjj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707681196; c=relaxed/simple;
	bh=PgtDglXaC4B+gRsFxrg9/dbd4fKpBISkYAZ0jRUv4Rs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YfFi+qh1HBCv55isSQEMeeWp7xnbzJUzi2q+6NSokwW2uABeZH/iYIVHSO/lUYQwmzAkaMoCJHaui6yb+Oku0bX9vJmukqFQfDkNtLH8ErVEW0G7070uIeJyJVGlUZH3oR89MparvNfK5qK918Pe8Ni3L/raY1TmwadDaiuwnr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L4ZBagUn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L4ZBagUn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707681193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iIW0cH/D35yhx2e3x4nWUadPl2x2tmsi83yh7eQYdaI=;
	b=L4ZBagUnvgeua4FesDIBYnooRjP4tgusHTW1T86NtSIz/Ny8QRw92BeKCFd6hPttveR93a
	h9d5+aPg7Lq+6KtcNktuGgUJoowtnJzs4ZWFEWbzCYWnljCDDUd6WKPjUNYZiZ2rRc1gfq
	666e09VWja+h7pw1jdY++WUYPvsZ9HQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-510-B4yFQTPXPS2s_kUMxTz_4Q-1; Sun,
 11 Feb 2024 14:53:09 -0500
X-MC-Unique: B4yFQTPXPS2s_kUMxTz_4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2496538143AE;
	Sun, 11 Feb 2024 19:53:09 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C9AEC185C0;
	Sun, 11 Feb 2024 19:53:08 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] platform/x86: Add new MeeGoPad ANX7428 Type-C Cross Switch driver
Date: Sun, 11 Feb 2024 20:53:07 +0100
Message-ID: <20240211195307.158956-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Some MeeGoPad top-set boxes have an ANX7428 Type-C Switch for USB3.1 Gen 1
and DisplayPort over Type-C alternate mode support.

The ANX7428 has a microcontroller which takes care of the PD negotiation
and automatically sets the builtin Crosspoint Switch to send the right
signal to the 4 highspeed pairs of the Type-C connector. It also takes
care of HPD and AUX channel routing for DP alternate mode.

IOW the ANX7428 operates fully autonomous and to the x5-Z8350 SoC
things look like there simple is a USB-3 Type-A connector and a
separate DipslayPort connector. Except that the BIOS does not
power on the ANX7428 at boot (meh).

Add a driver to power on the ANX7428. This driver is added under
drivers/platform/x86 rather then under drivers/usb/typec for 2 reasons:

1. This driver is specificly written to work with how the ANX7428 is
described in the ACPI tables of the MeeGoPad x86 (Cherry Trail) devices.

2. This driver only powers on the ANX7428 and does not do anything wrt
its Type-C functionality. It should be possible to tell the controller
which data- and/or power-role to negotiate and to swap the role(s) after
negotiation but the MeeGoPad top-set boxes always draw their power from
a separate power-connector and they only support USB host-mode. So this
functionality is unnecessary and due to lack of documenation this
is tricky to support.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/Kconfig            |  11 ++
 drivers/platform/x86/Makefile           |   3 +
 drivers/platform/x86/meegopad_anx7428.c | 155 ++++++++++++++++++++++++
 3 files changed, 169 insertions(+)
 create mode 100644 drivers/platform/x86/meegopad_anx7428.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 6dbd40e2aeda..87946a7a51fe 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -641,6 +641,17 @@ config THINKPAD_LMI
 
 source "drivers/platform/x86/intel/Kconfig"
 
+config MEEGOPAD_ANX7428
+	tristate "MeeGoPad ANX7428 Type-C Switch"
+	depends on ACPI && GPIOLIB && I2C
+	help
+	  Some MeeGoPad top-set boxes have an ANX7428 Type-C Switch for
+	  USB3.1 Gen 1 and DisplayPort over Type-C alternate mode support.
+
+	  This driver takes care of powering on the ANX7428 on supported
+	  MeeGoPad top-set boxes. After this the ANX7428 takes care of Type-C
+	  connector orientation and PD alternate mode switching autonomously.
+
 config MSI_EC
 	tristate "MSI EC Extras"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 1de432e8861e..e05b9eb280b1 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -70,6 +70,9 @@ obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
 # Intel
 obj-y				+= intel/
 
+# MeeGoPad
+obj-$(CONFIG_MEEGOPAD_ANX7428)	+= meegopad_anx7428.o
+
 # MSI
 obj-$(CONFIG_MSI_EC)		+= msi-ec.o
 obj-$(CONFIG_MSI_LAPTOP)	+= msi-laptop.o
diff --git a/drivers/platform/x86/meegopad_anx7428.c b/drivers/platform/x86/meegopad_anx7428.c
new file mode 100644
index 000000000000..b4cd5f8317fa
--- /dev/null
+++ b/drivers/platform/x86/meegopad_anx7428.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * meegopad_anx7428.c - Driver to power on the Analogix ANX7428
+ * USB Type-C crosspoint switch on MeeGoPad top-set boxes.
+ *
+ * The MeeGoPad T8 and T9 are Cherry Trail top-set boxes which
+ * use an ANX7428 to provide a Type-C port with USB3.1 Gen 1 and
+ * DisplayPort over Type-C alternate mode support.
+ *
+ * The ANX7428 has a microcontroller which takes care of the PD
+ * negotiation and automatically sets the builtin Crosspoint Switch
+ * to send the right signal to the 4 highspeed pairs of the Type-C
+ * connector. It also takes care of HPD and AUX channel routing for
+ * DP alternate mode.
+ *
+ * IOW the ANX7428 operates fully autonomous and to the x5-Z8350 SoC
+ * things look like there simple is a USB-3 Type-A connector and a
+ * separate DipslayPort connector. Except that the BIOS does not
+ * power on the ANX7428 at boot. This driver takes care of powering
+ * on the ANX7428.
+ *
+ * It should be possible to tell the micro-controller which data- and/or
+ * power-role to negotiate and to swap the role(s) after negotiation
+ * but the MeeGoPad top-set boxes always draw their power from a separate
+ * power-connector and they only support USB host-mode. So this functionality
+ * is unnecessary and due to lack of documenation this is tricky to support.
+ *
+ * For a more complete ANX7428 driver see drivers/usb/misc/anx7418/ of
+ * the LineageOS kernel for the LG G5 (International) aka the LG H850:
+ * https://github.com/LineageOS/android_kernel_lge_msm8996/
+ *
+ * (C) Copyright 2024 Hans de Goede <hansg@kernel.org>
+ */
+
+#include <linux/acpi.h>
+#include <linux/delay.h>
+#include <linux/dmi.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+
+/* Register addresses and fields */
+#define VENDOR_ID_L			0x00
+#define VENDOR_ID_H			0x01
+#define DEVICE_ID_L			0x02
+#define DEVICE_ID_H			0x03
+
+#define TX_STATUS			0x16
+#define STATUS_SUCCESS			BIT(0)
+#define STATUS_ERROR			BIT(1)
+#define OCM_STARTUP			BIT(7)
+
+static bool force;
+module_param(force, bool, 0444);
+MODULE_PARM_DESC(force, "Force the driver to probe on unknown boards");
+
+static const struct acpi_gpio_params enable_gpio = { 0, 0, false };
+static const struct acpi_gpio_params reset_gpio = { 1, 0, true };
+
+static const struct acpi_gpio_mapping meegopad_anx7428_gpios[] = {
+	{ "enable-gpios", &enable_gpio, 1 },
+	{ "reset-gpios", &reset_gpio, 1 },
+	{ }
+};
+
+static const struct dmi_system_id meegopad_anx7428_ids[] = {
+	{
+		/* Meegopad T08 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Default string"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Default string"),
+			DMI_MATCH(DMI_BOARD_NAME, "T3 MRD"),
+			DMI_MATCH(DMI_BOARD_VERSION, "V1.1"),
+		},
+	},
+	{ }
+};
+
+static int anx7428_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	const int max_tries = 10;
+	struct gpio_desc *gpio;
+	int i, ret, vendor;
+
+	if (!dmi_check_system(meegopad_anx7428_ids) && !force) {
+		dev_warn(dev, "Not probing unknown board, pass meegopad_anx7428.force=1 to probe");
+		return -ENODEV;
+	}
+
+	ret = devm_acpi_dev_add_driver_gpios(dev, meegopad_anx7428_gpios);
+	if (ret)
+		return ret;
+
+	/*
+	 * Set GPIOs to desired values while getting them, they are not needed
+	 * afterwards. Ordering and delays come from android_kernel_lge_msm8996.
+	 */
+	gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(gpio))
+		return dev_err_probe(dev, PTR_ERR(gpio), "getting enable GPIO\n");
+
+	usleep_range(10000, 15000);
+
+	gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(gpio))
+		return dev_err_probe(dev, PTR_ERR(gpio), "getting reset GPIO\n");
+
+	/* Wait for the OCM (On Chip Microcontroller) to start */
+	for (i = 0; i < max_tries; i++) {
+		usleep_range(5000, 10000);
+
+		ret = i2c_smbus_read_byte_data(client, TX_STATUS);
+		if (ret < 0)
+			dev_err_probe(dev, ret, "reading status register\n");
+		else if (ret & OCM_STARTUP)
+			break;
+	}
+	if (i == max_tries)
+		return dev_err_probe(dev, -EIO,
+				     "On Chip Microcontroller did not start, status: 0x%02x\n",
+				     ret);
+
+	ret = i2c_smbus_read_word_data(client, VENDOR_ID_L);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "reading vendor-id register\n");
+	vendor = ret;
+
+	ret = i2c_smbus_read_word_data(client, DEVICE_ID_L);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "reading device-id register\n");
+
+	dev_info(dev, "Powered on ANX7428 id %04x:%04x\n", vendor, ret);
+	return 0;
+}
+
+static const struct acpi_device_id anx7428_acpi_match[] = {
+	{ "ANXO7418" }, /* ACPI says 7418 (max 2 DP lanes version) but HW is 7428 */
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, anx7428_acpi_match);
+
+static struct i2c_driver anx7428_driver = {
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.acpi_match_table = anx7428_acpi_match,
+	},
+	.probe = anx7428_probe,
+};
+
+module_i2c_driver(anx7428_driver);
+
+MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
+MODULE_DESCRIPTION("MeeGoPad ANX7428 driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

