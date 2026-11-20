Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208499;
	b=rAy9tWkPFEchaGPxlDwF35PBT0N0pnvymK2WF2m8AS+1KRoOqP2cHXiC96kFZ4ZMGWkM
	 h9Ag6w30+uVIiHAhfrM/TJ1CMT5fj+OGI5Clex2UPrZ2tJGhMBpvtzNqakhIx8GHvncXZ
	 zhEtGx5lGfGxoES9VC8qsleSKrMu5PoB7JG8CExmVwh7scSfQ4Fy335do3zVKSuWGIhHY
	 sE+rEza91kS6Jl/W4teUiudgAKr1UlnLnub4HArCwa8BvnhdOy1+6hkLuXTaE5QtU3vUy
	 NrprhAqfZqxZqqmdvuMnuBNplfzKiNgMqsRxpTOrlJmS8j6q11/WDuAbJ7OPg3rKelg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208499;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=EBnO+H7xZqK0qeWWVKiHIXvTaFdbiFOH4V29QtEeAlw=;
	b=W5pa09YxloEU2BBShogumy5rONiHYTZ3ipaqHmP0DKfcpI4TO8xOEgGZRg9pgvqRThhH
	 OSc1adXQjTj6cw8ytKyJp0a1iuMNXAy1DIjwnbtcsHgucQpGUlikf2smgSs0ACO+ll2Wv
	 ONzxjLDnj8CRoguoHBfO2qPGvF6dVA2uKtiViNjET9sZzr3JpiaeabshqgtWsLleAG7hD
	 vUZ5+9sbw9erzUtE2Qkqswb1IZyunywWZDtPYT5KDprUUMlU5gy79wBUp3c+4OLBI+8eY
	 7mDkGlYNqhNJFjlGazUcnnRrb65W87gGPc4A0GOgjKQ2kY2hRdKIoOdCXaFYg1Tdc3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W2aFG3Ou;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1E6606A6B5;
	Fri, 20 Nov 2026 21:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC1E6606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W2aFG3Ou
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795208495; x=1826744495;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fGpmQ5d2dc6tiMz8KyrMGQZrtNUylTF5HqxkZYhPbUs=;
  b=W2aFG3OuX0Bstm+PN2du4c+42oWyiTpEWXPRftW6adrxF2/OUulH2CnG
   8bwr1/SbcHluLrGG8yRyJ7xmEg6MD8gOvu8qqP7PzbShpnzpCADhq+QAf
   ZYYiwz7xl0/U6UBZfLy/If0c5l/OY2z1PdCon7jvclhmGhwv2BEu5EGDw
   IkE/BgT+/k8q4M9nZGRjYd1wJ4c1GAlR5dc1sEL/ftqCv+WI+KFniihMy
   d05EHlVF0h+z43S3Bm98ec6iBWCdLBrrxthbtnRE3mlzADr4DrZtbUZjU
   VaNmqfXF3/i4xBRGCU6V5eCbRuNjc9ASwLaDokUpWLCFgipaLd4wkb/zU
   A==;
X-CSE-ConnectionGUID: csbXL3HrQoiQ4NI8L0LWig==
X-CSE-MsgGUID: ZcLSoAv6R0q50BrjHJp08w==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3979960"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3979960"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 13:01:32 -0800
X-CSE-ConnectionGUID: yKlolyxGQOaRp0t7l3ysyA==
X-CSE-MsgGUID: 3kP5zmj6TqajGGx24HQM9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10862622"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 13:01:28 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 20 Nov 2026 23:01:25 +0200 (EET)
To: Ondrej Zary <linux@zary.sk>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Introduce Synology NAS x86 platform driver
In-Reply-To: <20261120201139.4148644-1-linux@zary.sk>
Message-ID: <bec26cfe-c01e-9050-14da-69287d584fef@linux.intel.com>
References: <20261120201139.4148644-1-linux@zary.sk>
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
> Buttons and other LEDs are not supported by this driver because they're
> controlled by a PIC MCU (connected through serial port).
> 
> Signed-off-by: Ondrej Zary <linux@zary.sk>
> ---
>  drivers/platform/x86/Kconfig        |  14 ++++
>  drivers/platform/x86/Makefile       |   3 +
>  drivers/platform/x86/synology-x86.c | 126 ++++++++++++++++++++++++++++
>  3 files changed, 143 insertions(+)
>  create mode 100644 drivers/platform/x86/synology-x86.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 9ce384e0475e..04f6452b5a32 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1059,6 +1059,20 @@ config OXP_EC
>  
>  source "drivers/platform/x86/tuxedo/Kconfig"
>  
> +config SYNOLOGY_X86
> +	tristate "Synology x86 NAS Platform Driver"
> +	depends on GPIOLIB
> +	depends on LPC_ICH
> +	depends on GPIO_ICH
> +	depends on LEDS_CLASS
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
> index 000000000000..2fcf735ba3be
> --- /dev/null
> +++ b/drivers/platform/x86/synology-x86.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +

Extra empty line.

> +/*
> + * Synology x86 NAS platform driver
> + *
> + * Inspired by platform/x86/meraki-mx100.c
> + *
> + * Copyright (C) 2026 Ondrej Zary <linux@zary.sk>
> + */
> +
> +#include <linux/dmi.h>
> +#include <linux/pci.h>

Please order alphabetically.

> +#include <linux/err.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/kernel.h>

What for is this?

> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
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

Add include.

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

Some include is surely missing.

> +		{ }
> +	};
> +
> +	static const struct pci_device_id pci_i82574l[] = {
> +		{ PCI_DEVICE_SUB(PCI_VENDOR_ID_INTEL, 0x10d3, PCI_VENDOR_ID_INTEL, 0x0000) },
> +		{ }
> +	};
> +
> +	const struct dmi_system_id *dmi = dmi_first_match(synology_systems);

Are you missing DMI dep from Kconfig?

> +
> +	if (!dmi)
> +		return -ENODEV;
> +
> +	/* DS411+ DMI match is too generic, confirm by onboard PCI devices */
> +	if (!strcmp(dmi->ident, "DS411+")) {

Include.

> +		if (!pci_dev_present(pci_sii3531)
> +		 || !pci_dev_present(pci_i82574l))

|| should be on the previous line.

Should this depend on PCI too?

Details missing from the changelog.

> +			return -ENODEV;
> +	}
> +
> +	pr_info("Detected Synology NAS %s\n", dmi->ident);

Missing include.

> +
> +	gpiod_add_lookup_table(&synology_leds_table);
> +
> +	synology_leds_pdev = platform_device_register_data(NULL,
> +		"leds-gpio", PLATFORM_DEVID_NONE, &synology_leds_pdata,
> +		sizeof(synology_leds_pdata));
> +	if (IS_ERR(synology_leds_pdev)) {
> +		pr_err("error registering platform device: %ld\n", PTR_ERR(synology_leds_pdev));

Use %pe

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

