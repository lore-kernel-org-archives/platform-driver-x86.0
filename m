From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/4] platform/x86: Add Asus Wireless Radio Control driver
Date: Sun, 27 Dec 2015 15:21:52 +0200
Message-ID: <CAHp75VeG9LQ74orxS=P87feoJML11shC_B0HwP3OrA5K45X8Ng@mail.gmail.com>
References: <1451141797-1066-1-git-send-email-jprvita@endlessm.com>
	<1451141797-1066-2-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yk0-f176.google.com ([209.85.160.176]:36161 "EHLO
	mail-yk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752815AbbL0NVx convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 Dec 2015 08:21:53 -0500
In-Reply-To: <1451141797-1066-2-git-send-email-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On Sat, Dec 26, 2015 at 4:56 PM, Jo=C3=A3o Paulo Rechi Vita
<jprvita@gmail.com> wrote:
> Some Asus notebooks like the Asus E202SA and the Asus X555UB have a
> separate ACPI device for notifications from the airplane mode hotkey.
> This device is called "Wireless Radio Control" in Asus websites and A=
SHS
> in the DSDT, and its ACPI _HID is ATK4002 in the two models mentioned
> above.
>
> For these models, when the airplane mode hotkey (Fn+F2) is pressed, a
> query 0x0B is started in the Embedded Controller, and all this query =
does
> is a notify ASHS with the value 0x88 (for acpi_osi >=3D "Windows 2012=
"):
>
>         Scope (_SB.PCI0.SBRG.EC0)
>         {
>                 (...)
>                 Method (_Q0B, 0, NotSerialized)  // _Qxx: EC Query
>                 {
>                         If ((MSOS () >=3D OSW8))
>                         {
>                                 Notify (ASHS, 0x88) // Device-Specifi=
c
>                         }
>                         Else
>                         {
>                                 (...)
>                         }
>                 }
>         }
>
> Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
> ---
>  MAINTAINERS                          |   6 ++
>  drivers/platform/x86/Kconfig         |  15 +++++
>  drivers/platform/x86/Makefile        |   1 +
>  drivers/platform/x86/asus-wireless.c | 105 +++++++++++++++++++++++++=
++++++++++
>  4 files changed, 127 insertions(+)
>  create mode 100644 drivers/platform/x86/asus-wireless.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c984136..e1860f2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1791,6 +1791,12 @@ S:       Maintained
>  F:     drivers/platform/x86/asus*.c
>  F:     drivers/platform/x86/eeepc*.c
>
> +ASUS WIRELESS RADIO CONTROL DRIVER
> +M:     Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.com>
> +L:     platform-driver-x86@vger.kernel.org
> +S:     Maintained
> +F:     drivers/platform/x86/asus-wireless.c
> +
>  ASYNCHRONOUS TRANSFERS/TRANSFORMS (IOAT) API
>  R:     Dan Williams <dan.j.williams@intel.com>
>  W:     http://sourceforge.net/projects/xscaleiop
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
> index d0bfcf8..d3a088b 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -587,6 +587,21 @@ config EEEPC_WMI
>           If you have an ACPI-WMI compatible Eee PC laptop (>=3D 1000=
), say Y or M
>           here.
>
> +config ASUS_WIRELESS
> +       tristate "Asus Wireless Radio Control Driver"
> +       depends on ACPI
> +       depends on INPUT
> +       default m
> +       ---help---
> +         The Asus Wireless Radio Control handles the airplane mode h=
otkey
> +         present on some Asus laptops.
> +
> +         Say Y or M here if you have an ASUS notebook with an airpla=
ne mode
> +         hotkey.
> +
> +         If you choose to compile this driver as a module the module=
 will be
> +         called asus-wireless.
> +
>  config ACPI_WMI
>         tristate "WMI"
>         depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Mak=
efile
> index 4410e91..8b8df29 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -5,6 +5,7 @@
>  obj-$(CONFIG_ASUS_LAPTOP)      +=3D asus-laptop.o
>  obj-$(CONFIG_ASUS_WMI)         +=3D asus-wmi.o
>  obj-$(CONFIG_ASUS_NB_WMI)      +=3D asus-nb-wmi.o
> +obj-$(CONFIG_ASUS_WIRELESS)    +=3D asus-wireless.o
>  obj-$(CONFIG_EEEPC_LAPTOP)     +=3D eeepc-laptop.o
>  obj-$(CONFIG_EEEPC_WMI)                +=3D eeepc-wmi.o
>  obj-$(CONFIG_MSI_LAPTOP)       +=3D msi-laptop.o
> diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/=
x86/asus-wireless.c
> new file mode 100644
> index 0000000..ef7dba5
> --- /dev/null
> +++ b/drivers/platform/x86/asus-wireless.c
> @@ -0,0 +1,105 @@
> +/*
> + * Asus Wireless Radio Control Driver
> + *
> + * Copyright (C) 2015 Endless Mobile, Inc.
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/types.h>
> +#include <linux/acpi.h>
> +#include <linux/input.h>

> +#include <linux/pci_ids.h>

Didn't notice exatcly how this one is used.

> +
> +#define ASUS_WIRELESS_MODULE_NAME "Asus Wireless Radio Control Drive=
r"
> +
> +struct asus_wireless_data {
> +       struct input_dev *inputdev;
> +};
> +
> +static void asus_wireless_notify(struct acpi_device *device, u32 eve=
nt)
> +{
> +       struct asus_wireless_data *data =3D acpi_driver_data(device);
> +
> +       pr_debug("event=3D0x%X\n", event);

dev_, please.

> +       if (event !=3D 0x88) {
> +               pr_info("Unknown ASHS event: 0x%X\n", event);

Ditto. Moreover, this is apparently not an info, I can put it either
to debug or to warn depending how much those I produced in erroneous
state.

> +               return;
> +       }
> +       input_report_key(data->inputdev, KEY_RFKILL, 1);
> +       input_report_key(data->inputdev, KEY_RFKILL, 0);
> +       input_sync(data->inputdev);
> +}
> +
> +static int asus_wireless_add(struct acpi_device *device)
> +{
> +       struct asus_wireless_data *data;
> +       int err =3D -ENOMEM;
> +

> +       pr_info(ASUS_WIRELESS_MODULE_NAME"\n");

Kinda useless,

> +       data =3D kzalloc(sizeof(*data), GFP_KERNEL);

devm_kzalloc();

> +       if (!data)
> +               return -ENOMEM;
> +       device->driver_data =3D data;
> +
> +       data->inputdev =3D input_allocate_device();

Use devm_*

> +       if (!data->inputdev)
> +               goto fail;
> +
> +       data->inputdev->name =3D "Asus Wireless Radio Control";
> +       data->inputdev->phys =3D "asus-wireless/input0";
> +       data->inputdev->id.bustype =3D BUS_HOST;
> +       data->inputdev->id.vendor =3D PCI_VENDOR_ID_ASUSTEK;
> +       data->inputdev->dev.parent =3D &device->dev;
> +       set_bit(EV_REP, data->inputdev->evbit);
> +       set_bit(KEY_RFKILL, data->inputdev->keybit);
> +
> +       err =3D input_register_device(data->inputdev);
> +       if (err)
> +               goto fail;
> +       return 0;
> +
> +fail:
> +       device->driver->ops.remove(device);

Better to show explicitly what you do here. Currently I might say it's
a strange way I've ever seen to express the error path.

> +       return err;
> +}
> +
> +static int asus_wireless_remove(struct acpi_device *device)
> +{
> +       struct asus_wireless_data *data =3D acpi_driver_data(device);
> +

> +       pr_info("Removing "ASUS_WIRELESS_MODULE_NAME"\n");

Kinda useless.

> +       if (data->inputdev)

How is it possible?

> +               input_unregister_device(data->inputdev);

Redundant after switching to devm_

> +       kfree(data);

Ditto.

> +       return 0;
> +}
> +
> +static const struct acpi_device_id device_ids[] =3D {
> +       {"ATK4002", 0},
> +       {"", 0},
> +};
> +MODULE_DEVICE_TABLE(acpi, device_ids);
> +
> +static struct acpi_driver asus_wireless_driver =3D {
> +       .name =3D ASUS_WIRELESS_MODULE_NAME,
> +       .class =3D "hotkey",
> +       .ids =3D device_ids,
> +       .ops =3D {
> +               .add =3D asus_wireless_add,
> +               .remove =3D asus_wireless_remove,
> +               .notify =3D asus_wireless_notify,
> +       },
> +};
> +module_acpi_driver(asus_wireless_driver);
> +
> +MODULE_DESCRIPTION(ASUS_WIRELESS_MODULE_NAME);
> +MODULE_AUTHOR("Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.com>");
> +MODULE_LICENSE("GPL");
> --
> 2.5.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/



--=20
With Best Regards,
Andy Shevchenko
