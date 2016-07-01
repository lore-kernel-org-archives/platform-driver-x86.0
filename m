From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] intel-vbtn: new driver for Intel Virtual Button
Date: Fri, 1 Jul 2016 14:49:52 -0700
Message-ID: <20160701214952.GF60048@f23x64.localdomain>
References: <1467337909-20985-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:36548 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752519AbcGAVty (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Jul 2016 17:49:54 -0400
Content-Disposition: inline
In-Reply-To: <1467337909-20985-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, Alex Hung <alex.hung@canonical.com>

On Fri, Jul 01, 2016 at 09:51:49AM +0800, AceLan Kao wrote:
> This driver supports power button event in Intel Virtual Button currently.
> New Dell XPS 13 requires this driver for the power button.

I have a Dell XPS 13 9350 (Skylake), and while a dump and disassembly of the
ACPI tables reveals the intel-hid (INT33D5) device, I do not see the intel-vbtn
(INT33D6) device.

When I press the power button (4.7.0-rc3 + pdx86/testing), the laptop suspends,
pressing it again resumes.

So, what am I missing? Is this dependent on BIOS version?
I'm at BIOS Revision: 1.3
Perhaps a BIOS configuration option?

Regarding the specification for this device, was it in a similar confidential
state as INT33D5? I ask because I have to go swing the clue-bat around
internally if it was.

Thanks,

> 
> This driver is copied/modified from intel-hid.c
> Most credit goes to the author of intel-hid.c,
> Alex Hung <alex.hung@canonical.com>
> 
> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> ---
>  MAINTAINERS                       |   6 ++
>  drivers/platform/x86/Kconfig      |  12 +++
>  drivers/platform/x86/Makefile     |   1 +
>  drivers/platform/x86/intel-vbtn.c | 188 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 207 insertions(+)
>  create mode 100644 drivers/platform/x86/intel-vbtn.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e1b090f..9644280 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5915,6 +5915,12 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/intel-hid.c
>  
> +INTEL VIRTUAL BUTTON DRIVER
> +M:	AceLan Kao <acelan.kao@canonical.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/intel-vbtn.c
> +
>  INTEL IDLE DRIVER
>  M:	Len Brown <lenb@kernel.org>
>  L:	linux-pm@vger.kernel.org
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 3ec0025..727c6af 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -770,6 +770,18 @@ config INTEL_HID_EVENT
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called intel_hid.
>  
> +config INTEL_VBTN
> +	tristate "INTEL VIRTUAL BUTTON"
> +	depends on ACPI
> +	depends on INPUT
> +	select INPUT_SPARSEKMAP
> +	help
> +	  This driver provides support for the Intel Virtual Button interface.
> +	  Some laptops require this driver for power button support.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called intel_vbtn.
> +
>  config INTEL_SCU_IPC
>  	bool "Intel SCU IPC Support"
>  	depends on X86_INTEL_MID
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 9b11b40..2efa86d 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -44,6 +44,7 @@ obj-$(CONFIG_TOSHIBA_BT_RFKILL)	+= toshiba_bluetooth.o
>  obj-$(CONFIG_TOSHIBA_HAPS)	+= toshiba_haps.o
>  obj-$(CONFIG_TOSHIBA_WMI)	+= toshiba-wmi.o
>  obj-$(CONFIG_INTEL_HID_EVENT)	+= intel-hid.o
> +obj-$(CONFIG_INTEL_VBTN)	+= intel-vbtn.o
>  obj-$(CONFIG_INTEL_SCU_IPC)	+= intel_scu_ipc.o
>  obj-$(CONFIG_INTEL_SCU_IPC_UTIL) += intel_scu_ipcutil.o
>  obj-$(CONFIG_INTEL_MFLD_THERMAL) += intel_mid_thermal.o
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
> new file mode 100644
> index 0000000..146d02f
> --- /dev/null
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -0,0 +1,188 @@
> +/*
> + *  Intel Virtual Button driver for Windows 8.1+
> + *
> + *  Copyright (C) 2016 AceLan Kao <acelan.kao@canonical.com>
> + *  Copyright (C) 2016 Alex Hung <alex.hung@canonical.com>
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
> + *
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/input.h>
> +#include <linux/platform_device.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/acpi.h>
> +#include <acpi/acpi_bus.h>
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("AceLan Kao");
> +
> +static const struct acpi_device_id intel_vbtn_ids[] = {
> +	{"INT33D6", 0},
> +	{"", 0},
> +};
> +
> +/* In theory, these are HID usages. */
> +static const struct key_entry intel_vbtn_keymap[] = {
> +	{ KE_IGNORE, 0xC0, { KEY_POWER } },	/* power key press */
> +	{ KE_KEY, 0xC1, { KEY_POWER } },	/* power key release */
> +	{ KE_END },
> +};
> +
> +struct intel_vbtn_priv {
> +	struct input_dev *input_dev;
> +};
> +
> +static int intel_vbtn_input_setup(struct platform_device *device)
> +{
> +	struct intel_vbtn_priv *priv = dev_get_drvdata(&device->dev);
> +	int ret;
> +
> +	priv->input_dev = input_allocate_device();
> +	if (!priv->input_dev)
> +		return -ENOMEM;
> +
> +	ret = sparse_keymap_setup(priv->input_dev, intel_vbtn_keymap, NULL);
> +	if (ret)
> +		goto err_free_device;
> +
> +	priv->input_dev->dev.parent = &device->dev;
> +	priv->input_dev->name = "Intel Virtual Button driver";
> +	priv->input_dev->id.bustype = BUS_HOST;
> +
> +	ret = input_register_device(priv->input_dev);
> +	if (ret)
> +		goto err_free_device;
> +
> +	return 0;
> +
> +err_free_device:
> +	input_free_device(priv->input_dev);
> +	return ret;
> +}
> +
> +static void intel_vbtn_input_destroy(struct platform_device *device)
> +{
> +	struct intel_vbtn_priv *priv = dev_get_drvdata(&device->dev);
> +
> +	input_unregister_device(priv->input_dev);
> +}
> +
> +static void notify_handler(acpi_handle handle, u32 event, void *context)
> +{
> +	struct platform_device *device = context;
> +	struct intel_vbtn_priv *priv = dev_get_drvdata(&device->dev);
> +
> +	if (!sparse_keymap_report_event(priv->input_dev, event, 1, true))
> +		dev_info(&device->dev, "unknown event index 0x%x\n",
> +			 event);
> +}
> +
> +static int intel_vbtn_probe(struct platform_device *device)
> +{
> +	acpi_handle handle = ACPI_HANDLE(&device->dev);
> +	struct intel_vbtn_priv *priv;
> +	acpi_status status;
> +	int err;
> +
> +	status = acpi_evaluate_object(handle, "VBDL", NULL, NULL);
> +	if (!ACPI_SUCCESS(status)) {
> +		dev_warn(&device->dev, "failed to read Intel Virtual Button driver\n");
> +		return -ENODEV;
> +	}
> +
> +	priv = devm_kzalloc(&device->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	dev_set_drvdata(&device->dev, priv);
> +
> +	err = intel_vbtn_input_setup(device);
> +	if (err) {
> +		pr_err("Failed to setup Intel Virtual Button\n");
> +		return err;
> +	}
> +
> +	status = acpi_install_notify_handler(handle,
> +					     ACPI_DEVICE_NOTIFY,
> +					     notify_handler,
> +					     device);
> +	if (ACPI_FAILURE(status)) {
> +		err = -EBUSY;
> +		goto err_remove_input;
> +	}
> +
> +	return 0;
> +
> +err_remove_input:
> +	intel_vbtn_input_destroy(device);
> +
> +	return err;
> +}
> +
> +static int intel_vbtn_remove(struct platform_device *device)
> +{
> +	acpi_handle handle = ACPI_HANDLE(&device->dev);
> +
> +	intel_vbtn_input_destroy(device);
> +	acpi_remove_notify_handler(handle, ACPI_DEVICE_NOTIFY, notify_handler);
> +
> +	/*
> +	 * Even if we failed to shut off the event stream, we can still
> +	 * safely detach from the device.
> +	 */
> +	return 0;
> +}
> +
> +static struct platform_driver intel_vbtn_pl_driver = {
> +	.driver = {
> +		.name = "intel-vbtn",
> +		.acpi_match_table = intel_vbtn_ids,
> +	},
> +	.probe = intel_vbtn_probe,
> +	.remove = intel_vbtn_remove,
> +};
> +MODULE_DEVICE_TABLE(acpi, intel_vbtn_ids);
> +
> +static acpi_status __init
> +check_acpi_dev(acpi_handle handle, u32 lvl, void *context, void **rv)
> +{
> +	const struct acpi_device_id *ids = context;
> +	struct acpi_device *dev;
> +
> +	if (acpi_bus_get_device(handle, &dev) != 0)
> +		return AE_OK;
> +
> +	if (acpi_match_device_ids(dev, ids) == 0)
> +		if (acpi_create_platform_device(dev))
> +			dev_info(&dev->dev,
> +				 "intel-vbtn: created platform device\n");
> +
> +	return AE_OK;
> +}
> +
> +static int __init intel_vbtn_init(void)
> +{
> +	acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
> +			    ACPI_UINT32_MAX, check_acpi_dev, NULL,
> +			    (void *)intel_vbtn_ids, NULL);
> +
> +	return platform_driver_register(&intel_vbtn_pl_driver);
> +}
> +module_init(intel_vbtn_init);
> +
> +static void __exit intel_vbtn_exit(void)
> +{
> +	platform_driver_unregister(&intel_vbtn_pl_driver);
> +}
> +module_exit(intel_vbtn_exit);
> -- 
> 2.7.4
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
