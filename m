Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.182.83.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210826;
	b=BvA3DhIEe1Ir+pXi9QUKN3XWH7KlNM+5PwjX6Z4f05k/8Dt82erLYbt4sc9DZni78dOt
	 obZrhKfFINFABV7PzXtIBCp8gzlhCDZjQyQKwlPIpl3oybCqcRYcvvctt0rpVDz43ewnL
	 6cTQhOdkAhL/7dDZnWbicgEgyN4SvOhar4iNW1JfrKqU1EhLEEqok/yGUm9C+O2hZDMsx
	 0P+nt+SdthCbtmYF338f9aZy3TD3inRD5hXwGwbV4OiVCXyHayqPKs4cywBOCWYx1E9ha
	 ZU2nLz2yao33jMVlINjdCXUwZfJl9hxBD8gQXAmLf6542gM98uBDKdrow4hrkUYhzdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210826;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=WFa5WHgpW47vaoVGNUPRaCjoECy3gOkiUbC8bbiOE2o=;
	b=PORIVTFKF3Ja04ZgrzQUgmTc5K5d2dr3+RE/7lkMnd1w2RPSh0X4u9iGGpkEZqhqDO+T
	 0k5VkIP9AzLQP+lyNm2Jam5xNP92ga3TdOG/KqbqJrepajlMbGCuOVsRT8EWV7XffS1s1
	 B7+reQsByhwQ8k6MLFm1K0OprC35XJKMXDedkqUQxIHWK1Fec0W1Ypk+S+gYW9eFp8jU2
	 uIrj+dcpZ/WI/3gJrTUQ+xaCc41P7jaJMrzIBwS53+Okewg5UxKc7NsWmXeIx81noBlMi
	 RA6ystioAS2319cIdwJ02B55kyNvb9l7VETiypxLTYCvmPK0rHHB4cq7s1KYX84kAMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zary.sk;
	spf=pass smtp.mailfrom=zary.sk;
	dkim=pass header.d=zary.sk header.i=@zary.sk header.a=rsa-sha256 header.s=key1 header.b=E4odMl6E;
	arc=none smtp.remote-ip=194.182.83.82
Received: from mail.zary.sk (mail.zary.sk [194.182.83.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC45606A697;
	Fri, 20 Nov 2026 21:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCC45606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zary.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zary.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zary.sk header.i=@zary.sk header.a=rsa-sha256 header.s=key1 header.b=E4odMl6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zary.sk; s=key1;
	t=1795210821; bh=1cU2J+MwOubhU76CnR9RyR5VppbMiZWF/rALIfBoLBc=;
	h=From:To:Cc:Subject:Date:From;
	b=E4odMl6EbhLGzgET/7aa5F2cTAvdIUzQG3Ud01fVY+pBWt/r+Zoo4d45uy4yjWB2w
	 Rw0fJ3C4QBZ+gznyZFD1udohRTEqXG8DpgPAG2CpUhvIMaHRn4gYINQEOtofFnZzUQ
	 O97jCS87y2bjlKjrUSnk154QWcDsucC1ZjfgnQ36DMoTSOpb+A0hUxoaqPxUKc+Y/w
	 KAFKEUgFX8W5z4++tOAar0tyVNObOIRWQ/is5rIbObtCQpT6/yE3mxxIbjO5K9H2ar
	 dIiQ0S9Zs/xsRmW7xFgOVAadAaPfa1O9vXB8D1TdBysXXXHp5yjWAFO+Sj83h5tjGK
	 lycP7Q8IW6Z8A==
Received: from gweb1.ggedos.sk (off-7.infotel.telecom.sk [212.5.213.7])
	by mail.zary.sk (Postfix) with ESMTPSA id 5922EBEDE0;
	Fri, 20 Nov 2026 22:40:21 +0100 (CET)
From: Ondrej Zary <linux@zary.sk>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Introduce Synology NAS x86 platform driver
Date: Fri, 20 Nov 2026 22:33:00 +0100
Message-ID: <20261120214014.4188702-1-linux@zary.sk>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add platform driver for Synology x86-based NAS devices to support HDD LEDs
controller by ICH9 GPIO pins.

Only DS411+II is supported for now (DS411+ should be the same except CPU).

Unfortunately, the DMI data in BIOS is not very helpful to identify the
device as almost all strings are "To be filled by O.E.M.". Match also the
BIOS date and then check presence of the onboard SiI3531 SATA controller
and i82574L ethernet controller to avoid activation on other systems.

Buttons and other LEDs are not supported by this driver because they're
controlled by a PIC MCU (connected through serial port).

Signed-off-by: Ondrej Zary <linux@zary.sk>
---
Changes in v2:
 - fixed includes (order, added missing, removed kernel.h)
 - added missing DMI and PCI dependencies to Kconfig
 - added PCI device presence check details to changelog
 - used %pe for error message

---
 drivers/platform/x86/Kconfig        |  16 ++++
 drivers/platform/x86/Makefile       |   3 +
 drivers/platform/x86/synology-x86.c | 128 ++++++++++++++++++++++++++++
 3 files changed, 147 insertions(+)
 create mode 100644 drivers/platform/x86/synology-x86.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 9ce384e0475e..14b366cca2dd 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1059,6 +1059,22 @@ config OXP_EC
 
 source "drivers/platform/x86/tuxedo/Kconfig"
 
+config SYNOLOGY_X86
+	tristate "Synology x86 NAS Platform Driver"
+	depends on DMI
+	depends on GPIOLIB
+	depends on LPC_ICH
+	depends on GPIO_ICH
+	depends on LEDS_CLASS
+	depends on PCI
+	select LEDS_GPIO
+	help
+	  This driver provides support for the HDD LEDs on Synology x86 NAS
+	  devices.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called synology-x86.
+
 endif # X86_PLATFORM_DEVICES
 
 config P2SB
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 229057234d00..a1806eb0efc9 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -166,3 +166,6 @@ obj-$(CONFIG_SEL3350_PLATFORM)		+= sel3350-platform.o
 
 # OneXPlayer
 obj-$(CONFIG_OXP_EC)			+= oxpec.o
+
+# Synology
+obj-$(CONFIG_SYNOLOGY_X86)		+= synology-x86.o
diff --git a/drivers/platform/x86/synology-x86.c b/drivers/platform/x86/synology-x86.c
new file mode 100644
index 000000000000..80831c8c45d8
--- /dev/null
+++ b/drivers/platform/x86/synology-x86.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Synology x86 NAS platform driver
+ *
+ * Inspired by platform/x86/meraki-mx100.c
+ *
+ * Copyright (C) 2026 Ondrej Zary <linux@zary.sk>
+ */
+
+#include <linux/array_size.h>
+#include <linux/dmi.h>
+#include <linux/err.h>
+#include <linux/gpio/machine.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/pci_ids.h>
+#include <linux/platform_device.h>
+#include <linux/printk.h>
+#include <linux/string.h>
+
+static const struct gpio_led synology_leds[] = {
+	{ .name = "synology:green:hdd1"	},
+	{ .name = "synology:amber:hdd1" },
+	{ .name = "synology:green:hdd2" },
+	{ .name = "synology:amber:hdd2"	},
+	{ .name = "synology:green:hdd3" },
+	{ .name = "synology:amber:hdd3"	},
+	{ .name = "synology:green:hdd4" },
+	{ .name = "synology:amber:hdd4" },
+};
+
+static const struct gpio_led_platform_data synology_leds_pdata = {
+	.num_leds	= ARRAY_SIZE(synology_leds),
+	.leds		= synology_leds,
+};
+
+#define GPIO_ICH_DRIVER_NAME "gpio_ich"
+
+static struct gpiod_lookup_table synology_leds_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 16, NULL, 0, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 18, NULL, 1, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 20, NULL, 2, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 32, NULL, 3, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 33, NULL, 4, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 34, NULL, 5, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 49, NULL, 6, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 55, NULL, 7, GPIO_ACTIVE_HIGH),
+		{}
+	}
+};
+
+static const struct dmi_system_id synology_systems[] __initconst = {
+	{
+		.ident = "DS411+",	/* DS411+II is the same with faster CPU */
+		.matches = {
+			/* Synology did not put anything in DMI strings */
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "To Be Filled By O.E.M."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "To Be Filled By O.E.M."),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "To be filled by O.E.M."),
+			DMI_EXACT_MATCH(DMI_BIOS_DATE, "05/21/2012"),
+		},
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(dmi, synology_systems);
+
+static struct platform_device *synology_leds_pdev;
+
+static int __init synology_init(void)
+{
+	int ret;
+
+	static const struct pci_device_id pci_sii3531[] = {
+		{ PCI_DEVICE_SUB(PCI_VENDOR_ID_CMD, 0x3531, PCI_VENDOR_ID_CMD, 0x3531) },
+		{ }
+	};
+
+	static const struct pci_device_id pci_i82574l[] = {
+		{ PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0x10d3, PCI_VENDOR_ID_INTEL, 0x0000) },
+		{ }
+	};
+
+	const struct dmi_system_id *dmi = dmi_first_match(synology_systems);
+
+	if (!dmi)
+		return -ENODEV;
+
+	/* DS411+ DMI match is too generic, confirm by onboard PCI devices */
+	if (!strcmp(dmi->ident, "DS411+")) {
+		if (!pci_dev_present(pci_sii3531) ||
+		    !pci_dev_present(pci_i82574l))
+			return -ENODEV;
+	}
+
+	pr_info("Detected Synology NAS %s\n", dmi->ident);
+
+	gpiod_add_lookup_table(&synology_leds_table);
+
+	synology_leds_pdev = platform_device_register_data(NULL,
+		"leds-gpio", PLATFORM_DEVID_NONE, &synology_leds_pdata,
+		sizeof(synology_leds_pdata));
+	if (IS_ERR(synology_leds_pdev)) {
+		pr_err("error registering platform device: %pe\n", synology_leds_pdev);
+		ret = PTR_ERR(synology_leds_pdev);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	gpiod_remove_lookup_table(&synology_leds_table);
+	return ret;
+}
+module_init(synology_init);
+
+static void __exit synology_exit(void)
+{
+	platform_device_unregister(synology_leds_pdev);
+	gpiod_remove_lookup_table(&synology_leds_table);
+}
+module_exit(synology_exit);
+
+MODULE_AUTHOR("Ondrej Zary <linux@zary.sk>");
+MODULE_DESCRIPTION("Synology x86 NAS Platform Driver");
+MODULE_LICENSE("GPL");
-- 
Ondrej Zary

