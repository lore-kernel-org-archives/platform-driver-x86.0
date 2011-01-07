From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] OLPC XO-1.5 ebook switch driver
Date: Thu, 6 Jan 2011 17:34:50 -0800
Message-ID: <20110107013450.GA28842@core.coreip.homeip.net>
References: <20101229185829.78A669D401D@zog.reactivated.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:45754 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755012Ab1AGBe4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 6 Jan 2011 20:34:56 -0500
Received: by iwn9 with SMTP id 9so16838259iwn.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Jan 2011 17:34:56 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20101229185829.78A669D401D@zog.reactivated.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Daniel Drake <dsd@laptop.org>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, pgf@laptop.org

Hi Daniel,

On Wed, Dec 29, 2010 at 06:58:29PM +0000, Daniel Drake wrote:
> From: Paul Fox <pgf@laptop.org>
> 
> The OLPC XO-1.5 has an ebook switch, triggered when the laptop
> screen is rotated then folding down, converting the device into ebook
> form.
> 
> This switch is exposed through ACPI. Add a driver that exposes it
> to userspace as an input device and sysfs "state" attribute.
> 
> Signed-off-by: Daniel Drake <dsd@laptop.org>
> ---
>  drivers/platform/x86/Kconfig      |    9 ++
>  drivers/platform/x86/Makefile     |    1 +
>  drivers/platform/x86/xo15-ebook.c |  216 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 226 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/platform/x86/xo15-ebook.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index faec777..43dd19d 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -639,4 +639,13 @@ config XO1_RFKILL
>  	  Support for enabling/disabling the WLAN interface on the OLPC XO-1
>  	  laptop.
>  
> +config XO15_EBOOK
> +	tristate "OLPC XO-1.5 ebook switch"
> +	depends on ACPI && INPUT
> +	---help---
> +	  Support for the ebook switch on the OLPC XO-1.5 laptop.
> +
> +	  This switch is triggered as the screen is rotated and folded down to
> +	  convert the device into ebook form.
> +
>  endif # X86_PLATFORM_DEVICES
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 9950ccc..7273a89 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -33,3 +33,4 @@ obj-$(CONFIG_INTEL_IPS)		+= intel_ips.o
>  obj-$(CONFIG_GPIO_INTEL_PMIC)	+= intel_pmic_gpio.o
>  obj-$(CONFIG_XO1_RFKILL)	+= xo1-rfkill.o
>  obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
> +obj-$(CONFIG_XO15_EBOOK)	+= xo15-ebook.o
> diff --git a/drivers/platform/x86/xo15-ebook.c b/drivers/platform/x86/xo15-ebook.c
> new file mode 100644
> index 0000000..1c7f770
> --- /dev/null
> +++ b/drivers/platform/x86/xo15-ebook.c
> @@ -0,0 +1,216 @@
> +/*
> + *  OLPC XO-1.5 ebook switch driver
> + *  (based on generic ACPI button driver)
> + *
> + *  Copyright (C) 2009 Paul Fox <pgf@laptop.org>
> + *  Copyright (C) 2010 One Laptop per Child
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or (at
> + *  your option) any later version.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/types.h>
> +#include <linux/input.h>
> +#include <acpi/acpi_bus.h>
> +#include <acpi/acpi_drivers.h>
> +
> +#define MODULE_NAME "xo15-ebook"
> +#define PREFIX MODULE_NAME ": "
> +
> +#define XO15_EBOOK_CLASS		MODULE_NAME
> +#define XO15_EBOOK_TYPE_UNKNOWN	0x00
> +#define XO15_EBOOK_NOTIFY_STATUS	0x80
> +
> +#define XO15_EBOOK_SUBCLASS		"ebook"
> +#define XO15_EBOOK_HID			"XO15EBK"
> +#define XO15_EBOOK_DEVICE_NAME		"EBook Switch"
> +
> +ACPI_MODULE_NAME(MODULE_NAME);
> +
> +MODULE_DESCRIPTION("OLPC XO-1.5 ebook switch driver");
> +MODULE_LICENSE("GPL");
> +
> +static const struct acpi_device_id ebook_device_ids[] = {
> +	{ XO15_EBOOK_HID, 0 },
> +	{ "", 0 },
> +};
> +MODULE_DEVICE_TABLE(acpi, ebook_device_ids);
> +
> +struct ebook_switch {
> +	struct input_dev *input;
> +	char phys[32];			/* for input device */
> +};
> +
> +/* --------------------------------------------------------------------------
> +                                 /sys Interface
> +   -------------------------------------------------------------------------- */
> +
> +static ssize_t ebook_show_state(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct acpi_device *acpi_dev = to_acpi_device(dev);
> +	const char *state_txt = "unsupported";
> +	unsigned long long state;
> +	acpi_status status;
> +
> +	status = acpi_evaluate_integer(acpi_dev->handle, "EBK", NULL, &state);
> +	if (!ACPI_FAILURE(status))
> +		state_txt = state ? "open" : "closed";
> +
> +	return snprintf(buf, PAGE_SIZE, "%s\n", state_txt);
> +}
> +static DEVICE_ATTR(state, S_IRUGO, ebook_show_state, NULL);

No, instead of adding yet another kernel attribute just use ioctl to get
current switch state. Or write a general purpose utility to query
switch/key state and contribute it to consoletools project - many people
have asked fr it ;)

> +
> +/* --------------------------------------------------------------------------
> +                                Driver Interface
> +   -------------------------------------------------------------------------- */
> +static int ebook_send_state(struct acpi_device *device)
> +{
> +	struct ebook_switch *button = acpi_driver_data(device);
> +	unsigned long long state;
> +	acpi_status status;
> +
> +	status = acpi_evaluate_integer(device->handle, "EBK", NULL, &state);
> +	if (ACPI_FAILURE(status))
> +		return -ENODEV;

ENODEV is really weird here, EIO?

> +
> +	/* input layer checks if event is redundant */
> +	input_report_switch(button->input, SW_TABLET_MODE, !state);
> +	input_sync(button->input);
> +	return 0;
> +}
> +
> +static void ebook_switch_notify(struct acpi_device *device, u32 event)
> +{
> +	struct ebook_switch *button = acpi_driver_data(device);
> +	struct input_dev *input;
> +
> +	switch (event) {
> +	case ACPI_FIXED_HARDWARE_EVENT:
> +	case XO15_EBOOK_NOTIFY_STATUS:
> +		input = button->input;

What is the purpose of this assignment?

> +		ebook_send_state(device);
> +		break;
> +	default:
> +		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
> +				  "Unsupported event [0x%x]\n", event));
> +		break;
> +	}
> +}
> +
> +static int ebook_switch_resume(struct acpi_device *device)
> +{
> +	return ebook_send_state(device);
> +}
> +
> +static int ebook_switch_add(struct acpi_device *device)
> +{
> +	struct ebook_switch *button;
> +	struct input_dev *input;
> +	const char *hid = acpi_device_hid(device);
> +	char *name, *class;
> +	int error;
> +
> +	button = kzalloc(sizeof(struct ebook_switch), GFP_KERNEL);
> +	if (!button)
> +		return -ENOMEM;
> +
> +	device->driver_data = button;
> +
> +	button->input = input = input_allocate_device();
> +	if (!input) {
> +		error = -ENOMEM;
> +		goto err_free_button;
> +	}
> +
> +	name = acpi_device_name(device);
> +	class = acpi_device_class(device);
> +
> +	if (strcmp(hid, XO15_EBOOK_HID)) {
> +		printk(KERN_ERR PREFIX "Unsupported hid [%s]\n", hid);
> +		error = -ENODEV;
> +		goto err_free_input;
> +	}
> +
> +	strcpy(name, XO15_EBOOK_DEVICE_NAME);
> +	sprintf(class, "%s/%s", XO15_EBOOK_CLASS, XO15_EBOOK_SUBCLASS);
> +
> +	error = device_create_file(&device->dev, &dev_attr_state);
> +	if (error)
> +		goto err_free_input;
> +
> +	snprintf(button->phys, sizeof(button->phys), "%s/button/input0", hid);
> +
> +	input->name = name;
> +	input->phys = button->phys;
> +	input->id.bustype = BUS_HOST;
> +	input->dev.parent = &device->dev;
> +
> +	input->evbit[0] = BIT_MASK(EV_SW);
> +	set_bit(SW_TABLET_MODE, input->swbit);
> +
> +	error = input_register_device(input);
> +	if (error)
> +		goto err_remove_fs;
> +
> +	ebook_send_state(device);
> +
> +	if (device->wakeup.flags.valid) {
> +		/* Button's GPE is run-wake GPE */
> +		acpi_enable_gpe(device->wakeup.gpe_device,
> +				device->wakeup.gpe_number);
> +		device->wakeup.run_wake_count++;
> +		device->wakeup.state.enabled = 1;
> +	}
> +
> +	printk(KERN_INFO PREFIX "%s [%s]\n", name, acpi_device_bid(device));

You should already have output from input core, let's not clutter dmesg
any further.

Thanks.

-- 
Dmitry
