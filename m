Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.182.83.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618192;
	b=O38yVWPGr1FIYxMABWiELPIZQZy5BJGcxNGoP1DismrDd+gb3YTXCeo3qsdUZZ7CV+vr
	 ckVHmKv7NTzO92Z+8id7AtljrdetFkwfmkvCQQUJB90yTFwKxGuBIrzL71f9kJHYUsCjY
	 Ln2BoC7LUOooiDI2wkHCPeMQxFWBnHP/aN6c9elsYYHz9s2cXS5iGg0iUlBWl9E/cEo2j
	 LxjRvUPz+aLueL8mXzUMaTU9aOrgmBzzqEPjaKG6Q0Gd23gaL9Xjtj7iSrJzXbiPSTlt9
	 giZvHCYBfNhBr40dZSyD6ePzMquX8RRtKFsZ1QZVKFXuxNpVCpa9ev4z2X8Fzp7UCKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618192;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=PSYhMPPaL25zkyEFRSC0G+Y0s0EZao0UlPw7sGjAeYI=;
	b=ibhout+S6hEvuhiR6ad2a50bZOU0r/OQvMggCgd1cr9yIgB1qMoVUzYvyFWJtAPmgG/y
	 aOfM+LQGsX3Osk5DQMbafWifXQ+IzUDw2xit8zDmq1y0Gzqw60UBHfjX1qIv+87kMGvRy
	 VfPbDU+6ncpwXihua1rs4gpDcxebhdqgtoF9/fpZyOgh9vuYHFxG+e4J4IP1Ee6N+er21
	 Bi70xzV6SeGOgq/rDFU4v0WVplUQbhDLW3yfbkkPt53V6A9gpZMbaU3u1DAnxmjk+2bg2
	 /pDr8ReBd6+LI9y1s1dOgQMxAJ9r0EeMJY7T72irVSLOQKfkN2dZjvvOsZEoVYDZCYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zary.sk;
	spf=pass smtp.mailfrom=zary.sk;
	dkim=pass header.d=zary.sk header.i=@zary.sk header.a=rsa-sha256 header.s=key1 header.b=knRXjlOw;
	arc=none smtp.remote-ip=194.182.83.82
Received: from mail.zary.sk (mail.zary.sk [194.182.83.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7734C606A31E;
	Wed, 25 Nov 2026 14:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7734C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zary.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zary.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zary.sk header.i=@zary.sk header.a=rsa-sha256 header.s=key1 header.b=knRXjlOw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zary.sk; s=key1;
	t=1795618182; bh=5opMLMUVE+CMapgYryb9t+WhoESFgiMBzdhvj2m+zPY=;
	h=From:To:Cc:Subject:Date:From;
	b=knRXjlOwAHp6kI6UdVjpzEd0przfGylspPZuzHDMPpLhv9pm6CZ5fLR4ddkqfwITF
	 ZCgjAQphwQJTHLK9gZGApIdEhMOHFLUDr9N9d5TU3FZ0mr2L+CU9UguwaPbbEAJgWJ
	 tiwrHhVYY8r3JqVzt3OtdTsHhwndk2sHIA8/xMv45vD1n3n2g65koPWT/k/U3c90XV
	 kohL1fH/oT0cFEF/Nkq6dlqX9LM/wuacIh/w1INQygr8Rym5eS5LpgyjeeQLto9nf/
	 Y9QpR8rZ2HV0AGSDv/kLcn4Wc9N+mo+fv0FkUjaqhTpRBw2j7JycKCsR9zpPEER256
	 5xFgGMC5B1nbA==
Received: from gweb1.ggedos.sk (off-7.infotel.telecom.sk [212.5.213.7])
	by mail.zary.sk (Postfix) with ESMTPSA id 136BEBED51;
	Wed, 25 Nov 2026 15:49:42 +0100 (CET)
From: Ondrej Zary <linux@zary.sk>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] Introduce Synology x86 NAS LEDs driver
Date: Wed, 25 Nov 2026 15:47:34 +0100
Message-ID: <20261125144936.1967956-1-linux@zary.sk>
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

Buttons and other LEDs are not supported by this driver because they're
controlled by a PIC MCU (connected through serial port).

Signed-off-by: Ondrej Zary <linux@zary.sk>
---
Changes in v4:
 - added DMI match for BIOS vendor and version
 - removed PCI device presence checking

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
 drivers/platform/x86/Kconfig        |  16 +++
 drivers/platform/x86/Makefile       |   3 +
 drivers/platform/x86/synology-x86.c | 200 ++++++++++++++++++++++++++++
 3 files changed, 219 insertions(+)
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
index 000000000000..a3a42a4b2109
--- /dev/null
+++ b/drivers/platform/x86/synology-x86.c
@@ -0,0 +1,200 @@
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
+#include <linux/platform_device.h>
+#include <linux/printk.h>
+#include <linux/property.h>
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
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "To be filled by O.E.M."),
+			/* so match BIOS version and date */
+			DMI_EXACT_MATCH(DMI_BIOS_VENDOR, "American Megatrends Inc."),
+			DMI_EXACT_MATCH(DMI_BIOS_VERSION, "080016 "),
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
+	struct platform_device_info leds_info = {
+		.name = "leds-gpio",
+		.id = PLATFORM_DEVID_NONE,
+	};
+	const struct dmi_system_id *dmi;
+	int err;
+
+	dmi = dmi_first_match(synology_systems);
+	if (!dmi)
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

