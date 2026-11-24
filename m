Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.182.83.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524994;
	b=ZNLMC8brFw5KSWU+h2T+0od1X4GdcxQfclquSjgx78QDrRgqIF4QrCf0F1clre0tdY5j
	 Usvn2dEh/kWGFc6vyHLxdDWtN5ODviOZY6TtqCwTbv9xIrWShtoVAXcYXQ/CtfZOf9OMs
	 9+/6/3Fmk0pPEEIkVyHbYX6YBGY5i+MqV0aJM9mjJg2YSuZSbVJKpPrtyn/Lk945LGnaB
	 BtWNVHODHLN1Iq6y6dPvUE2Pq6VUphOl1COhhj61Q9XIFrcuyv4L7X0ZkOrxlnrl3BUzq
	 hQQ0VBXL772XZ8NB4Sn0io0i3bdesvPwggPWig8TbKeNWrld4/cFXY45JA9zPSFj7nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524994;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Fc6/Aj70bJjzS9bSxyUc4nuIaC8a0sX90OrL6p0fXz0=;
	b=VuI2wW5S2735/KD7DgHyei3bMwS4EPvaV3tnVJHGEbMmFMVB6yrf931xEV93FaCVa9d4
	 tnZxREjoKCaTDGxBDCh52pA/0Lpcy/UnH26/Pof5apurwUbjVJ6qRiowvRdVFkLFRD+Fq
	 fF2l7KAsC4BqYXLJD2zM6spHFTF0FOlxVTa8/kWcDl8CrK/GVXmsLvbEnrdEgtEBkjAdj
	 0H62Wp77RCszUAEbsPraUmLT8tV31xXTbkOX+LE8tnyaYW6+tAGtLtwkqW6HANrcuuKVK
	 361W6CjotI1fYx7ky5APuG1onmoptgA++47lvinWsBxvoD1W0WeWOsFwNwW9S+aVvzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zary.sk;
	spf=pass smtp.mailfrom=zary.sk;
	dkim=pass header.d=zary.sk header.i=@zary.sk header.a=rsa-sha256 header.s=key1 header.b=QqtjITzc;
	arc=none smtp.remote-ip=194.182.83.82
Received: from mail.zary.sk (mail.zary.sk [194.182.83.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DDC606A321;
	Tue, 24 Nov 2026 12:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59DDC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zary.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zary.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zary.sk header.i=@zary.sk header.a=rsa-sha256 header.s=key1 header.b=QqtjITzc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zary.sk; s=key1;
	t=1795524984; bh=+U/oKW92CtpyCtq4wZt8KsScF9HzB7L03ulzr5m/EQI=;
	h=From:To:Cc:Subject:Date:From;
	b=QqtjITzc4VkON5NDAlDJoekU3AQUOMZqR2MPWDNoo/lZky3QrQ0l33lp/Podsv/H8
	 VSe/uCtZUmf2xpYF1pPLsYU4ihicPSdWY6fFy50kYVstC6v5ZRhoFVmlc/46cvCNPH
	 i4lkL17PeVgXIkcDBc43f/Tj29cLoMd6la+2y8iisxN1VKHQv8BUFlaHTysQQ9bhc6
	 FBPgx6A/nLzCeviQ11APmAIXeUF2jbxAfOWIQEOvXqA3aINXxeMAfTCOqElxA/A2Iq
	 63iyslZ1gfNkzLw8O6MaT1M7BCBcW+O/jzjkk8pwGKxG1csRSWc/L1JSi1pPOnAFCm
	 U4mFhEN/yp67w==
Received: from gweb1.ggedos.sk (off-7.infotel.telecom.sk [212.5.213.7])
	by mail.zary.sk (Postfix) with ESMTPSA id BF4B1BED91;
	Tue, 24 Nov 2026 13:56:24 +0100 (CET)
From: Ondrej Zary <linux@zary.sk>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] Introduce Synology x86 NAS LEDs driver
Date: Tue, 24 Nov 2026 13:45:46 +0100
Message-ID: <20261124125616.1168560-1-linux@zary.sk>
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
controlled by ICH9 GPIO pins.

Only DS411+II is supported for now (DS411+ should be the same except CPU).

Unfortunately, the DMI data in BIOS is not very helpful to identify the
device as almost all strings are "To be filled by O.E.M.". Match also the
BIOS date and then check presence of PCI devices (host bridge, LPC bridge,
onboard SiI3531 SATA controller and i82574L ethernet controller) to avoid
activation on other systems.

Buttons and other LEDs are not supported by this driver because they're
controlled by a PIC MCU (connected through serial port).

Signed-off-by: Ondrej Zary <linux@zary.sk>
---
Changes in v3:
 - descriptions changed to mention LEDs
 - GPIO swnodes are used instead of gpiod
 - improved PCI device presence checking

Changes in v2:
 - fixed includes (order, added missing, removed kernel.h)
 - added missing DMI and PCI dependencies to Kconfig
 - added PCI device presence check details to changelog
 - used %pe for error message

---
 drivers/platform/x86/Kconfig        |  16 ++
 drivers/platform/x86/Makefile       |   3 +
 drivers/platform/x86/synology-x86.c | 253 ++++++++++++++++++++++++++++
 3 files changed, 272 insertions(+)
 create mode 100644 drivers/platform/x86/synology-x86.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 9ce384e0475e..64aa44c7f239 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1059,6 +1059,22 @@ config OXP_EC
 
 source "drivers/platform/x86/tuxedo/Kconfig"
 
+config SYNOLOGY_X86
+	tristate "Synology x86 NAS LEDs driver"
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
index 000000000000..6f07a7038166
--- /dev/null
+++ b/drivers/platform/x86/synology-x86.c
@@ -0,0 +1,253 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Synology x86 NAS LEDs driver
+ *
+ * Inspired by platform/x86/meraki-mx100.c
+ *
+ * Copyright (C) 2026 Ondrej Zary <linux@zary.sk>
+ */
+
+#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+
+#include <linux/dmi.h>
+#include <linux/err.h>
+#include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
+#include <linux/mfd/lpc_ich.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/printk.h>
+#include <linux/property.h>
+#include <linux/string.h>
+
+static const struct software_node synology_gpio_leds_node = {
+	.name = "synology-leds",
+};
+
+static const struct property_entry synology_hdd1_green_led_props[] = {
+	PROPERTY_ENTRY_STRING("label", "synology:green:hdd1"),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 16, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node synology_hdd1_green_led_node = {
+	.name = "hdd1-green-led",
+	.parent = &synology_gpio_leds_node,
+	.properties = synology_hdd1_green_led_props,
+};
+
+static const struct property_entry synology_hdd1_amber_led_props[] = {
+	PROPERTY_ENTRY_STRING("label", "synology:amber:hdd1"),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 18, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node synology_hdd1_amber_led_node = {
+	.name = "hdd1-amber-led",
+	.parent = &synology_gpio_leds_node,
+	.properties = synology_hdd1_amber_led_props,
+};
+
+static const struct property_entry synology_hdd2_green_led_props[] = {
+	PROPERTY_ENTRY_STRING("label", "synology:green:hdd2"),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 20, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node synology_hdd2_green_led_node = {
+	.name = "hdd2-green-led",
+	.parent = &synology_gpio_leds_node,
+	.properties = synology_hdd2_green_led_props,
+};
+
+static const struct property_entry synology_hdd2_amber_led_props[] = {
+	PROPERTY_ENTRY_STRING("label", "synology:amber:hdd2"),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 32, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node synology_hdd2_amber_led_node = {
+	.name = "hdd2-amber-led",
+	.parent = &synology_gpio_leds_node,
+	.properties = synology_hdd2_amber_led_props,
+};
+
+static const struct property_entry synology_hdd3_green_led_props[] = {
+	PROPERTY_ENTRY_STRING("label", "synology:green:hdd3"),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 33, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node synology_hdd3_green_led_node = {
+	.name = "hdd3-green-led",
+	.parent = &synology_gpio_leds_node,
+	.properties = synology_hdd3_green_led_props,
+};
+
+static const struct property_entry synology_hdd3_amber_led_props[] = {
+	PROPERTY_ENTRY_STRING("label", "synology:amber:hdd3"),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 34, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node synology_hdd3_amber_led_node = {
+	.name = "hdd3-amber-led",
+	.parent = &synology_gpio_leds_node,
+	.properties = synology_hdd3_amber_led_props,
+};
+
+static const struct property_entry synology_hdd4_green_led_props[] = {
+	PROPERTY_ENTRY_STRING("label", "synology:green:hdd4"),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 49, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node synology_hdd4_green_led_node = {
+	.name = "hdd4-green-led",
+	.parent = &synology_gpio_leds_node,
+	.properties = synology_hdd4_green_led_props,
+};
+
+static const struct property_entry synology_hdd4_amber_led_props[] = {
+	PROPERTY_ENTRY_STRING("label", "synology:amber:hdd4"),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 55, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node synology_hdd4_amber_led_node = {
+	.name = "hdd4-amber-led",
+	.parent = &synology_gpio_leds_node,
+	.properties = synology_hdd4_amber_led_props,
+};
+
+static const struct software_node *synology_swnodes[] = {
+	&synology_gpio_leds_node,
+	&synology_hdd1_green_led_node,
+	&synology_hdd1_amber_led_node,
+	&synology_hdd2_green_led_node,
+	&synology_hdd2_amber_led_node,
+	&synology_hdd3_green_led_node,
+	&synology_hdd3_amber_led_node,
+	&synology_hdd4_green_led_node,
+	&synology_hdd4_amber_led_node,
+	NULL
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
+			/* match the BIOS date and then confirm by onboard devices during init */
+			DMI_EXACT_MATCH(DMI_BIOS_DATE, "05/21/2012"),
+		},
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(dmi, synology_systems);
+
+struct synology_pci_dev {
+	unsigned int bus;
+	unsigned int devfn;
+	struct pci_device_id id;
+};
+
+/* onboard PCI devices found in DS411+ to confirm the machine type (after DMI match) */
+static const struct synology_pci_dev ds411plus_pci_devices[] __initconst = {
+	/* 00:00.0 Host bridge: Intel Corporation Atom Processor D4xx/D5xx/N4xx/N5xx DMI Bridge */
+	{ 0, PCI_DEVFN(0, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0xa000,
+					       PCI_VENDOR_ID_INTEL, 0xa000) } },
+	/* 00:1f.0 ISA bridge: Intel Corporation 82801IR (ICH9R) LPC Interface Controller */
+	{ 0, PCI_DEVFN(0x1f, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0x2916,
+						  PCI_VENDOR_ID_INTEL, 0x2916) } },
+	/* 02:00.0 Mass storage controller: Silicon Image, Inc. SiI 3531 Serial ATA Controller */
+	{ 2, PCI_DEVFN(0x00, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_CMD, 0x3531,
+						  PCI_VENDOR_ID_CMD, 0x3531) } },
+	/* 03:00.0 Ethernet controller: Intel Corporation 82574L Gigabit Network Connection */
+	{ 3, PCI_DEVFN(0x00, 0), { PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0x10d3,
+						  PCI_VENDOR_ID_INTEL, 0x0000) } },
+	{}
+};
+
+/* check if all PCI devices in the list are present at specified locations */
+static bool __init synology_pci_devices_present(const struct synology_pci_dev *list)
+{
+	const struct synology_pci_dev *d;
+
+	for (d = list; d->id.vendor; d++) {
+		struct pci_dev *pdev = pci_get_domain_bus_and_slot(0, d->bus, d->devfn);
+
+		if (!pdev)
+			return false;
+
+		bool matched = d->id.vendor == pdev->vendor &&
+			       d->id.device == pdev->device &&
+			       d->id.subvendor == pdev->subsystem_vendor &&
+			       d->id.subdevice == pdev->subsystem_device;
+
+		pci_dev_put(pdev);
+		if (!matched)
+			return false;
+	}
+
+	return true;
+}
+
+static struct platform_device *synology_leds_pdev;
+
+static int __init synology_init(void)
+{
+	struct platform_device_info leds_info = {
+		.name = "leds-gpio",
+		.id = PLATFORM_DEVID_NONE,
+	};
+	int err;
+
+	const struct dmi_system_id *dmi = dmi_first_match(synology_systems);
+
+	if (!dmi)
+		return -ENODEV;
+
+	/* DS411+ DMI match is too generic, confirm by onboard PCI devices */
+	if (!strcmp(dmi->ident, "DS411+") && !synology_pci_devices_present(ds411plus_pci_devices))
+		return -ENODEV;
+
+	pr_info("Detected Synology NAS %s\n", dmi->ident);
+
+	err = software_node_register_node_group(synology_swnodes);
+	if (err) {
+		pr_err("failed to register software nodes: %d\n", err);
+		return err;
+	}
+
+	leds_info.fwnode = software_node_fwnode(&synology_gpio_leds_node);
+	synology_leds_pdev = platform_device_register_full(&leds_info);
+	err = PTR_ERR_OR_ZERO(synology_leds_pdev);
+	if (err) {
+		pr_err("error registering platform device: %pe\n", synology_leds_pdev);
+		goto err_unregister;
+	}
+
+	return 0;
+
+err_unregister:
+	software_node_unregister_node_group(synology_swnodes);
+	return err;
+}
+module_init(synology_init);
+
+static void __exit synology_exit(void)
+{
+	platform_device_unregister(synology_leds_pdev);
+	software_node_unregister_node_group(synology_swnodes);
+}
+module_exit(synology_exit);
+
+MODULE_AUTHOR("Ondrej Zary <linux@zary.sk>");
+MODULE_DESCRIPTION("Synology x86 NAS Platform Driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("LPC_ICH");
-- 
Ondrej Zary

