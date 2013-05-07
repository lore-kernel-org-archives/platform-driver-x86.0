From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v18] pvpanic: pvpanic device driver
Date: Tue, 07 May 2013 10:10:32 +0200
Message-ID: <5188B6F8.9070209@redhat.com>
References: <5187ADAF.4020103@redhat.com> <1367897958-14126-1-git-send-email-hutao@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:39227 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754068Ab3EGIKt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 May 2013 04:10:49 -0400
In-Reply-To: <1367897958-14126-1-git-send-email-hutao@cn.fujitsu.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hu Tao <hutao@cn.fujitsu.com>
Cc: platform-driver-x86@vger.kernel.org, kvm@vger.kernel.org, Matthew Garrett <matthew.garrett@nebula.com>, Marcelo Tosatti <mtosatti@redhat.com>

Il 07/05/2013 05:39, Hu Tao ha scritto:
> pvpanic device is a qemu simulated device through which guest panic
> event is sent to host.
> 
> Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
> ---
> 
> v17 -> v18:  1. call acpi_walk_resources to get the port, and usb outb instead
>                 of acpi_evaluate_oject in panic notifier callback
>              2. reword help message
> 
>  drivers/platform/x86/Kconfig   |   8 +++
>  drivers/platform/x86/Makefile  |   2 +
>  drivers/platform/x86/pvpanic.c | 122 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 132 insertions(+)
>  create mode 100644 drivers/platform/x86/pvpanic.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 3338437..8577261 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -781,4 +781,12 @@ config APPLE_GMUX
>  	  graphics as well as the backlight. Currently only backlight
>  	  control is supported by the driver.
>  
> +config PVPANIC
> +	tristate "pvpanic device support"
> +	depends on ACPI
> +	---help---
> +	  This driver provides support for the pvpanic device.  pvpanic is
> +	  a paravirtualized device provided by QEMU; it lets a virtual machine
> +	  (guest) communicate panic events to the host.
> +
>  endif # X86_PLATFORM_DEVICES
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index ace2b38..ef0ec74 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -51,3 +51,5 @@ obj-$(CONFIG_INTEL_OAKTRAIL)	+= intel_oaktrail.o
>  obj-$(CONFIG_SAMSUNG_Q10)	+= samsung-q10.o
>  obj-$(CONFIG_APPLE_GMUX)	+= apple-gmux.o
>  obj-$(CONFIG_CHROMEOS_LAPTOP)	+= chromeos_laptop.o
> +
> +obj-$(CONFIG_PVPANIC)           += pvpanic.o
> diff --git a/drivers/platform/x86/pvpanic.c b/drivers/platform/x86/pvpanic.c
> new file mode 100644
> index 0000000..ddec5cb
> --- /dev/null
> +++ b/drivers/platform/x86/pvpanic.c
> @@ -0,0 +1,122 @@
> +/*
> + *  pvpanic.c - pvpanic Device Support
> + *
> + *  Copyright (C) 2013 Fujitsu.
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
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, write to the Free Software
> + *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/types.h>
> +#include <acpi/acpi_bus.h>
> +#include <acpi/acpi_drivers.h>
> +
> +MODULE_AUTHOR("Hu Tao <hutao@cn.fujitsu.com>");
> +MODULE_DESCRIPTION("pvpanic device driver");
> +MODULE_LICENSE("GPL");
> +
> +static int pvpanic_add(struct acpi_device *device);
> +static int pvpanic_remove(struct acpi_device *device);
> +
> +static const struct acpi_device_id pvpanic_device_ids[] = {
> +	{ "QEMU0001", 0},
> +	{ "", 0},
> +};
> +MODULE_DEVICE_TABLE(acpi, pvpanic_device_ids);
> +
> +#define PVPANIC_PANICKED	(1 << 0)
> +
> +static u16 port;
> +
> +static struct acpi_driver pvpanic_driver = {
> +	.name =		"pvpanic",
> +	.class =	"QEMU",
> +	.ids =		pvpanic_device_ids,
> +	.ops =		{
> +				.add =		pvpanic_add,
> +				.remove =	pvpanic_remove,
> +			},
> +	.owner =	THIS_MODULE,
> +};
> +
> +static void
> +pvpanic_send_event(unsigned int event)
> +{
> +	if (port)
> +		outb(event, port);
> +}
> +
> +static int
> +pvpanic_panic_notify(struct notifier_block *nb, unsigned long code,
> +		     void *unused)
> +{
> +	pvpanic_send_event(PVPANIC_PANICKED);
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block pvpanic_panic_nb = {
> +	.notifier_call = pvpanic_panic_notify,
> +};
> +
> +
> +static acpi_status
> +pvpanic_walk_resources(struct acpi_resource *res, void *context)
> +{
> +	switch (res->type) {
> +	case ACPI_RESOURCE_TYPE_END_TAG:
> +		return AE_OK;
> +
> +	case ACPI_RESOURCE_TYPE_IO:
> +		port = res->data.io.minimum;
> +		return AE_OK;
> +
> +	default:
> +		return AE_ERROR;
> +	}
> +}
> +
> +static int pvpanic_add(struct acpi_device *device)
> +{
> +	acpi_status status;
> +	u64 ret;
> +
> +	status = acpi_evaluate_integer(device->handle, "_STA", NULL,
> +				       &ret);
> +
> +	if (ACPI_FAILURE(status) || (ret & 0x0B) != 0x0B)
> +		return -ENODEV;
> +
> +	acpi_walk_resources(device->handle, METHOD_NAME__CRS,
> +			    pvpanic_walk_resources, NULL);
> +

Perhaps ENODEV if port is zero, so you can remove the if from
pvpanic_send_event?

Paolo

> +	atomic_notifier_chain_register(&panic_notifier_list,
> +				       &pvpanic_panic_nb);
> +
> +	return 0;
> +}
> +
> +static int pvpanic_remove(struct acpi_device *device)
> +{
> +
> +	atomic_notifier_chain_unregister(&panic_notifier_list,
> +					 &pvpanic_panic_nb);
> +	return 0;
> +}
> +
> +module_acpi_driver(pvpanic_driver);
> 
