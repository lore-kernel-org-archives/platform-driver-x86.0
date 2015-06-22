From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] asus-radio: new driver for asus radio button for Windows
 8
Date: Mon, 22 Jun 2015 13:47:45 -0700
Message-ID: <20150622204745.GG58421@vmdeb7>
References: <1434964805-18088-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:33565 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751766AbbFVUrt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 22 Jun 2015 16:47:49 -0400
Content-Disposition: inline
In-Reply-To: <1434964805-18088-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: corentin.chary@gmail.com, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net

On Mon, Jun 22, 2015 at 05:20:05PM +0800, Alex Hung wrote:
> ASUS introduced a new approach to handle wireless hotkey
> since Windows 8.  When the hotkey is pressed, BIOS generates
> a notification 0x88 to a new ACPI device, ATK4001.  This
> new driver not only translates the notification to KEY_RFKILL
> but also toggles its LED accordingly.
> 
> Signed-off-by: Alex Hung <alex.hung@canonical.com>


Hi Alex,

Will you be maintaining this driver? If so, please add it to MAINTAINERS as part
of this patch. If not.... why not? ;-)

Would you object to renaming it to "asus-rbtn.c" and using CONFIG_ASUS_RBTN,
just to keep it similar to the recently added dell-rbtn - also the rbtn suffix
is a bit more descriptive of the driver function in my opinion.

Couple minor things below, otherwise appears to be in pretty good shape. How
many systems have you tested this on?


> ---
>  drivers/platform/x86/Kconfig      |   11 ++
>  drivers/platform/x86/Makefile     |    1 +
>  drivers/platform/x86/asus-radio.c |  238 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 250 insertions(+)
>  create mode 100644 drivers/platform/x86/asus-radio.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 638e7970..d2adc79 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -516,6 +516,17 @@ config EEEPC_LAPTOP
>  	  If you have an Eee PC laptop, say Y or M here. If this driver
>  	  doesn't work on your Eee PC, try eeepc-wmi instead.
>  
> +config ASUS_RADIO
> +	tristate "ASUS radio button"
> +	depends on ACPI
> +	depends on INPUT
> +	help
> +	 This driver provides supports for new ASUS radio button for Windows 8.
> +	 On such systems the driver should load automatically (via ACPI alias).
> +
> +	 To compile this driver as a module, choose M here: the module will
> +	 be called hp-wireless.
> +
>  config ASUS_WMI
>  	tristate "ASUS WMI Driver"
>  	depends on ACPI_WMI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index f82232b..aecd403 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -3,6 +3,7 @@
>  # x86 Platform-Specific Drivers
>  #
>  obj-$(CONFIG_ASUS_LAPTOP)	+= asus-laptop.o
> +obj-$(CONFIG_ASUS_RADIO)	+= asus-radio.o
>  obj-$(CONFIG_ASUS_WMI)		+= asus-wmi.o
>  obj-$(CONFIG_ASUS_NB_WMI)	+= asus-nb-wmi.o
>  obj-$(CONFIG_EEEPC_LAPTOP)	+= eeepc-laptop.o
> diff --git a/drivers/platform/x86/asus-radio.c b/drivers/platform/x86/asus-radio.c
> new file mode 100644
> index 0000000..4d519ce
> --- /dev/null
> +++ b/drivers/platform/x86/asus-radio.c
> @@ -0,0 +1,238 @@
> +/*
> + *  asus-radio button for Windows 8
> + *
> + *  Copyright (C) 2015 Alex Hung <alex.hung@canonical.com>
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/input.h>
> +#include <linux/platform_device.h>
> +#include <linux/acpi.h>
> +#include <acpi/acpi_bus.h>
> +#include <linux/rfkill.h>
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Alex Hung");
> +MODULE_ALIAS("acpi*:ATK4001:*");
> +
> +static struct platform_device *asuspl_dev;
> +static struct input_dev *asusrb_input_dev;
> +static struct rfkill *asus_rfkill;
> +static struct acpi_device *asus_radio_device;
> +static int radio_led_state;
> +
> +static const struct acpi_device_id asusrb_ids[] = {
> +	{"ATK4001", 0},
> +	{"", 0},
> +};
> +
> +static int asus_led_set(bool blocked)
> +{
> +	acpi_status status;
> +	union acpi_object arg0 = { ACPI_TYPE_INTEGER };
> +	struct acpi_object_list args = { 1, &arg0 };
> +	unsigned long long output;
> +
> +	arg0.integer.value = blocked;
> +	status = acpi_evaluate_integer(asus_radio_device->handle, "HSWC",
> +				       &args, &output);
> +	if (!ACPI_SUCCESS(status) || output == 0) {
> +		pr_err("fail to change wireless LED.\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int asus_rfk_set(void *data, bool blocked)

*rfkill_set is more common and is more explicit

> +{
> +	radio_led_state = blocked ? 0 : 1;
> +
> +	return asus_led_set(radio_led_state);
> +}
> +
> +static const struct rfkill_ops asus_rfk_ops = {

asus_rfkill_ops is more common and more explicit (I'd prefer rfkill to rfk
wherever possible).

> +	.set_block = asus_rfk_set,
> +};
> +
> +static int asusrb_rfkill_setup(struct acpi_device *device)
> +{
> +	int err = 0;

err is never used before it is assigned, no need to initialize to 0 here.

> +
> +	asus_rfkill = rfkill_alloc("asus_radio",
> +				   &device->dev,
> +				   RFKILL_TYPE_WLAN,
> +				   &asus_rfk_ops,
> +				   device);
> +	if (!asus_rfkill) {
> +		pr_err("unable to allocate rfkill device\n");
> +		return -ENOMEM;
> +	}
> +
> +	err = rfkill_register(asus_rfkill);
> +	if (err) {
> +		pr_err("unable to register rfkill device\n");
> +		rfkill_destroy(asus_rfkill);
> +	}
> +
> +	return err;
> +}
> +
> +static int asus_radio_input_setup(void)
> +{
> +	int err;
> +
> +	asusrb_input_dev = input_allocate_device();
> +	if (!asusrb_input_dev)
> +		return -ENOMEM;
> +
> +	asusrb_input_dev->name = "ASUS radio hotkeys";
> +	asusrb_input_dev->phys = "atk4001/input0";
> +	asusrb_input_dev->id.bustype = BUS_HOST;
> +	asusrb_input_dev->evbit[0] = BIT(EV_KEY);
> +	set_bit(KEY_RFKILL, asusrb_input_dev->keybit);
> +
> +	err = input_register_device(asusrb_input_dev);
> +	if (err)
> +		goto err_free_dev;
> +
> +	return 0;
> +
> +err_free_dev:
> +	input_free_device(asusrb_input_dev);
> +	return err;
> +}
> +
> +static void asus_radio_input_destroy(void)
> +{
> +	input_unregister_device(asusrb_input_dev);
> +}
> +
> +static void asusrb_notify(struct acpi_device *acpi_dev, u32 event)
> +{
> +	if (event != 0x88) {

Prefer a define to a magic number, even if it is only used the once.

> +		pr_err("received unknown event (0x%x)\n", event);
> +		return;
> +	}
> +
> +	input_report_key(asusrb_input_dev, KEY_RFKILL, 1);
> +	input_sync(asusrb_input_dev);
> +	input_report_key(asusrb_input_dev, KEY_RFKILL, 0);
> +	input_sync(asusrb_input_dev);
> +}
> +
> +static int asusrb_add(struct acpi_device *device)
> +{
> +	int err;
> +
> +	asus_radio_device = device;
> +
> +	err = asus_radio_input_setup();
> +	if (err) {
> +		pr_err("failed to setup asus_radio hotkeys\n");
> +		goto failed;
> +	}
> +
> +	err = asusrb_rfkill_setup(device);
> +	if (err)
> +		pr_err("failed to setup asus_radio rfkill\n");
> + failed:

Please be consistent with your label indentation throughout the driver. I don't
see established precedent for with or without a space. Some argue using a space
improves debugability and patch legibility - but I don't enforce one or the
other - just be consistent in the file.

Also, this label isn't really necessary, just return err in the one location
used above and drop it.

> +	return err;
> +}
> +
> +static int asusrb_remove(struct acpi_device *device)
> +{
> +	asus_radio_input_destroy();
> +
> +	if (asus_rfkill) {
> +		rfkill_unregister(asus_rfkill);
> +		rfkill_destroy(asus_rfkill);
> +	}
> +
> +	return 0;
> +}
> +
> +static struct acpi_driver asusrb_driver = {
> +	.name	= "asus acpi radio",
> +	.owner	= THIS_MODULE,
> +	.ids	= asusrb_ids,
> +	.ops	= {
> +		.add	= asusrb_add,
> +		.remove	= asusrb_remove,
> +		.notify	= asusrb_notify,
> +	},
> +};
> +
> +static int asusrb_resume_handler(struct device *device)
> +{
> +	return asus_led_set(radio_led_state);
> +}
> +
> +static const struct dev_pm_ops asuspl_pm_ops = {
> +	.resume  = asusrb_resume_handler,
> +};
> +
> +static struct platform_driver asuspl_driver = {
> +	.driver = {
> +		.name = "asus-radio",
> +		.pm = &asuspl_pm_ops,
> +	},
> +};
> +
> +static int __init asusrb_init(void)
> +{
> +	int err;
> +
> +	pr_info("Initializing ATK4001 module\n");
> +	err = acpi_bus_register_driver(&asusrb_driver);
> +	if (err)
> +		goto err_driver_reg;
> +
> +	err = platform_driver_register(&asuspl_driver);
> +	if (err)
> +		goto err_driver_reg;
> +
> +	asuspl_dev = platform_device_alloc("asus-radio", -1);
> +	if (!asuspl_dev) {
> +		err = -ENOMEM;
> +		goto err_device_alloc;
> +	}
> +	err = platform_device_add(asuspl_dev);
> +	if (err)
> +		goto err_device_add;
> +
> +	return 0;
> +
> +err_device_add:
> +	platform_device_put(asuspl_dev);
> +err_device_alloc:
> +	platform_driver_unregister(&asuspl_driver);
> +err_driver_reg:
> +	return err;
> +}
> +
> +static void __exit asusrb_exit(void)
> +{
> +	pr_info("Exiting ATK4001 module\n");
> +	acpi_bus_unregister_driver(&asusrb_driver);
> +
> +	if (asuspl_dev) {
> +		platform_device_unregister(asuspl_dev);
> +		platform_driver_unregister(&asuspl_driver);
> +	}
> +}
> +
> +module_init(asusrb_init);
> +module_exit(asusrb_exit);
> -- 
> 1.7.9.5
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
