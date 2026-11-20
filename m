Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.182.83.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205518;
	b=dl00FwrvqVi7ZUvR37XkGvP30m32PnVOPhkm0BJ6vZZxm5U6KwaU9wXb/sUxPzjSPu+O
	 wMohQe0h2r48rFN9HAYP8CL9nafyJksf1lezgRjMlAbgDgil6bZ7Yj0MaK33FZhrYSpjX
	 LxXfvMuBWgVbaZuLjjtprQTjglIeCgVSd7uNLdrQowMc5Q7BfShMSa6JH2lXaR4jOH9cw
	 bnj6ruiay7E7DDEx6OwHyJpCNrMzXWFWpqQfjvS3KxwjjgOPIxPBO7k+5klrPgBPzhqg8
	 kggRNAJM2/rTwUMl0Ptb5URFetgKBkt8uzmEDAyZOrB7Dhn9sWFvwMGxOEjvOTbO5oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205518;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=T7df/NbA/pH4uMZH2+dJUdzElRmyueibNg5Chc0lZjc=;
	b=XJ3loqkXf6gzKh0gRlt7fIooB1MMIWZjRQTVUTKCXixjqImJBWapTHCe4EECwysQhzHP
	 8ycSdmqOKMN90bW1Z48iB02RcEmZS5xzib9Ol3moxRPdhIfZ2g4sLRxWSaW/VXxV8Ic6M
	 rlJLxlI+IWuCKRBNSB5tQU/uodD07f6YXS0PVMxqobIhgOw85gfdL3u2SYjirclan2iE+
	 MRFd0zIFwDsa/Q2UDn3NpSi4kktNLmwZa3m7q3QDEguTxAET4Tq79/tCLZJFE+JIXAE4p
	 v88zxMJOWPOeHIOuLizxmSw2WomDF6Ga7bftpAZyziXOQvxGNAXjIAjewpPbiSysV9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zary.sk;
	spf=pass smtp.mailfrom=zary.sk;
	dkim=pass header.d=zary.sk header.i=@zary.sk header.a=rsa-sha256 header.s=key1 header.b=mHMgp+aH;
	arc=none smtp.remote-ip=194.182.83.82
Received: from mail.zary.sk (mail.zary.sk [194.182.83.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AE560A2627;
	Fri, 20 Nov 2026 20:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34AE560A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zary.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zary.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zary.sk header.i=@zary.sk header.a=rsa-sha256 header.s=key1 header.b=mHMgp+aH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zary.sk; s=key1;
	t=1795205505; bh=quc9PquDmEXJG37zWwsHHi8epgIjmjgG5PFHJHx9RO4=;
	h=From:To:Cc:Subject:Date:From;
	b=mHMgp+aHxjYYCafEheb5c9hXR4pzHp95LugkHhc3BxWkITx7nkV/IJrQYveHN4oTX
	 Sl3aLJU9Su35Xn/SqrWBNqgogNU0cRiKiO3pu10MdUBLzZJqRiYzu8Dz0doVWe/j/1
	 mVR47CzVl2KROi49c6su3F1lFMyMWog2v/BM/jKjh2ODZFv2S8Ua9IyB4B9lTFYV2y
	 h+Vl1xeQCBVCzcS37HXnmMvPXeqsMK6iXH2mkmUogBB01VRObv9TJ38LkNaBEdtn/D
	 wG4G9oMqomclOGABxRQjWRGNd8XGtw1VCyMhaZMw4f4qMoJTtzYjU5tWCkwULIdsgL
	 cilwPe2wkO7Rg==
Received: from gweb1.ggedos.sk (off-7.infotel.telecom.sk [212.5.213.7])
	by mail.zary.sk (Postfix) with ESMTPSA id C0B0EBEDE0;
	Fri, 20 Nov 2026 21:11:45 +0100 (CET)
From: Ondrej Zary <linux@zary.sk>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Introduce Synology NAS x86 platform driver
Date: Fri, 20 Nov 2026 21:11:38 +0100
Message-ID: <20261120201139.4148644-1-linux@zary.sk>
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

Buttons and other LEDs are not supported by this driver because they're
controlled by a PIC MCU (connected through serial port).

Signed-off-by: Ondrej Zary <linux@zary.sk>
---
 drivers/platform/x86/Kconfig        |  14 ++++
 drivers/platform/x86/Makefile       |   3 +
 drivers/platform/x86/synology-x86.c | 126 ++++++++++++++++++++++++++++
 3 files changed, 143 insertions(+)
 create mode 100644 drivers/platform/x86/synology-x86.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 9ce384e0475e..04f6452b5a32 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1059,6 +1059,20 @@ config OXP_EC
 
 source "drivers/platform/x86/tuxedo/Kconfig"
 
+config SYNOLOGY_X86
+	tristate "Synology x86 NAS Platform Driver"
+	depends on GPIOLIB
+	depends on LPC_ICH
+	depends on GPIO_ICH
+	depends on LEDS_CLASS
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
index 000000000000..2fcf735ba3be
--- /dev/null
+++ b/drivers/platform/x86/synology-x86.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Synology x86 NAS platform driver
+ *
+ * Inspired by platform/x86/meraki-mx100.c
+ *
+ * Copyright (C) 2026 Ondrej Zary <linux@zary.sk>
+ */
+
+#include <linux/dmi.h>
+#include <linux/pci.h>
+#include <linux/err.h>
+#include <linux/gpio/machine.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
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
+		if (!pci_dev_present(pci_sii3531)
+		 || !pci_dev_present(pci_i82574l))
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
+		pr_err("error registering platform device: %ld\n", PTR_ERR(synology_leds_pdev));
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

