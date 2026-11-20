Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795211510;
	b=mPxpbhPp2FsOHOorQr9Votvg/Km40dL1HnZuuCK+ij9N2Z6TPkFGLVPOdPJJ9FNX0+ku
	 CqC9WHGKudSTKVpURMCcuumRR3RAQZ9A3MPSYyOFz3gljAjcgWdCIcYNnLWz5ZQAZvcOq
	 fZVxTLgaPNODd9AXs9OK7qDGLgyk21tXFYWZZjNAU+2lL5d9eLp/C0jXKOKeHP7c+Y3KK
	 z/gtGmtvSETk4HCkWUlj21RNBzS38c2tgy5xAQOiojGzj7/xt2GMUnsHsaE4qELm8WsIY
	 +nIEdHrTSBCIWXY4WiYgUpipY48390cqrjN85xfA6FY3ALW/gEy4AK48b7FE94U0Orw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795211510;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=vb0BtL0SwPfR29AbCMJeyoaWqzNe8n8+/BbGnf3liw8=;
	b=ZSe7V1jNdpZGIF+7vH9dJoznrshd/UImeeljI4GE6Tem5WIgmDd//Vd0pVPegPtLNMYL
	 jeQjeEF1v57wm7XCFCMOeFMcyDs8Grt5Hs2VC+EtjLoJNQuyZZlzTZismxrg7Nw3vphEe
	 3O1RxwwVMFfFGxASmhCTUEVArhikorRaBMjurEwY6s/8bO2b4woMU67tFW4zjY/CYAY0p
	 zhIF/GFtr6ekLEyvy5nQlqDlJj5TdtMrWMMRkFpU595e2X4oxtZ08oXIfuqKiYeAs3RdQ
	 tGe2f81fQw0hrfu9HwI33AsQUmr7Q9E/uelzdVSFpptXzC95uuWbqpo62O0X5FD4z6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lCMP2b9Q;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEC9606A6B6;
	Fri, 20 Nov 2026 21:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AEC9606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lCMP2b9Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795211508; x=1826747508;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BSy9VGRSNIwqBEbRYwLTCL5barbmZqz/wRpxdNRBijs=;
  b=lCMP2b9Qxag15Rwwq/Twx2vyMHMZpuzDRaRubtqrjiHBnU1i6y4jxhbh
   rnYC8r0h5BDhVOK0dxHA9E86uV1oJDDs0tWl8NItJ+/0xMWhTFXyRHnli
   tEG/+QH3wf7iSFI6ANvCpUWpvcSv7ZxfwbvQlGV5SBXNj/ug31efhCMWZ
   HGQyQQZfEwJKu7xNQ2HDmTnwBE2s4R30M898l4nm+BsPrb7aB2/9r6bbe
   1g1zpyPbFgZNJcVkspDPNyNXjPhYfHuEMmfNeNJQyIuVREeXGeicgxpEL
   f7ckQjFXAFWxMCaRX8NuIUDdgPBB2cLTdzfJlVS8c+Kacv7XGpOGazwIe
   g==;
X-CSE-ConnectionGUID: zRne1lBvQoenms+bpjyfsQ==
X-CSE-MsgGUID: DEEJKLWdTp+5jaW3SAqTqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3988988"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3988988"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 13:51:47 -0800
X-CSE-ConnectionGUID: yi0fD+64SXaM/L/OYLziGQ==
X-CSE-MsgGUID: e4z9353ITQSEpBwhCh+aIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11009868"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 13:50:11 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 20 Nov 2026 23:50:08 +0200 (EET)
To: Ondrej Zary <linux@zary.sk>, Hans de Goede <hansg@kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Introduce Synology NAS x86 platform driver
In-Reply-To: <20261120214014.4188702-1-linux@zary.sk>
Message-ID: <b3be68b5-b363-85bb-513a-733ab31cf1b7@linux.intel.com>
References: <20261120214014.4188702-1-linux@zary.sk>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Nov 2026, Ondrej Zary wrote:

> Add platform driver for Synology x86-based NAS devices to support HDD LEDs
> controller by ICH9 GPIO pins.
> 
> Only DS411+II is supported for now (DS411+ should be the same except CPU).
> 
> Unfortunately, the DMI data in BIOS is not very helpful to identify the
> device as almost all strings are "To be filled by O.E.M.". Match also the
> BIOS date and then check presence of the onboard SiI3531 SATA controller
> and i82574L ethernet controller to avoid activation on other systems.

Hans, Andy,

Do you have an opinion on the selected approach?

> Buttons and other LEDs are not supported by this driver because they're
> controlled by a PIC MCU (connected through serial port).
> 
> Signed-off-by: Ondrej Zary <linux@zary.sk>
> ---
> Changes in v2:
>  - fixed includes (order, added missing, removed kernel.h)
>  - added missing DMI and PCI dependencies to Kconfig
>  - added PCI device presence check details to changelog
>  - used %pe for error message
> 
> ---
>  drivers/platform/x86/Kconfig        |  16 ++++
>  drivers/platform/x86/Makefile       |   3 +
>  drivers/platform/x86/synology-x86.c | 128 ++++++++++++++++++++++++++++
>  3 files changed, 147 insertions(+)
>  create mode 100644 drivers/platform/x86/synology-x86.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 9ce384e0475e..14b366cca2dd 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1059,6 +1059,22 @@ config OXP_EC
>  
>  source "drivers/platform/x86/tuxedo/Kconfig"
>  
> +config SYNOLOGY_X86
> +	tristate "Synology x86 NAS Platform Driver"
> +	depends on DMI
> +	depends on GPIOLIB
> +	depends on LPC_ICH
> +	depends on GPIO_ICH
> +	depends on LEDS_CLASS
> +	depends on PCI
> +	select LEDS_GPIO
> +	help
> +	  This driver provides support for the HDD LEDs on Synology x86 NAS
> +	  devices.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called synology-x86.
> +
>  endif # X86_PLATFORM_DEVICES
>  
>  config P2SB
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 229057234d00..a1806eb0efc9 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -166,3 +166,6 @@ obj-$(CONFIG_SEL3350_PLATFORM)		+= sel3350-platform.o
>  
>  # OneXPlayer
>  obj-$(CONFIG_OXP_EC)			+= oxpec.o
> +
> +# Synology
> +obj-$(CONFIG_SYNOLOGY_X86)		+= synology-x86.o
> diff --git a/drivers/platform/x86/synology-x86.c b/drivers/platform/x86/synology-x86.c
> new file mode 100644
> index 000000000000..80831c8c45d8
> --- /dev/null
> +++ b/drivers/platform/x86/synology-x86.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Synology x86 NAS platform driver
> + *
> + * Inspired by platform/x86/meraki-mx100.c
> + *
> + * Copyright (C) 2026 Ondrej Zary <linux@zary.sk>
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/pci_ids.h>
> +#include <linux/platform_device.h>
> +#include <linux/printk.h>
> +#include <linux/string.h>
> +
> +static const struct gpio_led synology_leds[] = {
> +	{ .name = "synology:green:hdd1"	},
> +	{ .name = "synology:amber:hdd1" },
> +	{ .name = "synology:green:hdd2" },
> +	{ .name = "synology:amber:hdd2"	},
> +	{ .name = "synology:green:hdd3" },
> +	{ .name = "synology:amber:hdd3"	},
> +	{ .name = "synology:green:hdd4" },
> +	{ .name = "synology:amber:hdd4" },
> +};
> +
> +static const struct gpio_led_platform_data synology_leds_pdata = {
> +	.num_leds	= ARRAY_SIZE(synology_leds),
> +	.leds		= synology_leds,
> +};
> +
> +#define GPIO_ICH_DRIVER_NAME "gpio_ich"
> +
> +static struct gpiod_lookup_table synology_leds_table = {
> +	.dev_id = "leds-gpio",
> +	.table = {
> +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 16, NULL, 0, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 18, NULL, 1, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 20, NULL, 2, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 32, NULL, 3, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 33, NULL, 4, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 34, NULL, 5, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 49, NULL, 6, GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP_IDX(GPIO_ICH_DRIVER_NAME, 55, NULL, 7, GPIO_ACTIVE_HIGH),
> +		{}
> +	}
> +};
> +
> +static const struct dmi_system_id synology_systems[] __initconst = {
> +	{
> +		.ident = "DS411+",	/* DS411+II is the same with faster CPU */
> +		.matches = {
> +			/* Synology did not put anything in DMI strings */
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "To Be Filled By O.E.M."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "To Be Filled By O.E.M."),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "To be filled by O.E.M."),
> +			DMI_EXACT_MATCH(DMI_BIOS_DATE, "05/21/2012"),
> +		},
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(dmi, synology_systems);
> +
> +static struct platform_device *synology_leds_pdev;
> +
> +static int __init synology_init(void)
> +{
> +	int ret;
> +
> +	static const struct pci_device_id pci_sii3531[] = {
> +		{ PCI_DEVICE_SUB(PCI_VENDOR_ID_CMD, 0x3531, PCI_VENDOR_ID_CMD, 0x3531) },
> +		{ }
> +	};
> +
> +	static const struct pci_device_id pci_i82574l[] = {
> +		{ PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0x10d3, PCI_VENDOR_ID_INTEL, 0x0000) },
> +		{ }
> +	};
> +
> +	const struct dmi_system_id *dmi = dmi_first_match(synology_systems);
> +
> +	if (!dmi)
> +		return -ENODEV;
> +
> +	/* DS411+ DMI match is too generic, confirm by onboard PCI devices */
> +	if (!strcmp(dmi->ident, "DS411+")) {
> +		if (!pci_dev_present(pci_sii3531) ||
> +		    !pci_dev_present(pci_i82574l))
> +			return -ENODEV;
> +	}
> +
> +	pr_info("Detected Synology NAS %s\n", dmi->ident);
> +
> +	gpiod_add_lookup_table(&synology_leds_table);
> +
> +	synology_leds_pdev = platform_device_register_data(NULL,
> +		"leds-gpio", PLATFORM_DEVID_NONE, &synology_leds_pdata,
> +		sizeof(synology_leds_pdata));
> +	if (IS_ERR(synology_leds_pdev)) {
> +		pr_err("error registering platform device: %pe\n", synology_leds_pdev);

Won't these be prefixless and you should add the usual pr_fmt line?

> +		ret = PTR_ERR(synology_leds_pdev);
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	gpiod_remove_lookup_table(&synology_leds_table);
> +	return ret;
> +}
> +module_init(synology_init);
> +
> +static void __exit synology_exit(void)
> +{
> +	platform_device_unregister(synology_leds_pdev);
> +	gpiod_remove_lookup_table(&synology_leds_table);
> +}
> +module_exit(synology_exit);
> +
> +MODULE_AUTHOR("Ondrej Zary <linux@zary.sk>");
> +MODULE_DESCRIPTION("Synology x86 NAS Platform Driver");
> +MODULE_LICENSE("GPL");
> 

-- 
 i.

