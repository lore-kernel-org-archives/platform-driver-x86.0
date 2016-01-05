From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] platform/x86: Add Asus Wireless Radio Control driver
Date: Tue, 5 Jan 2016 15:50:48 +0200
Message-ID: <CAHp75VfjbtctO7W7Zge6gNm2QbQHfE=L5ibbM0OFhudh8NZCbg@mail.gmail.com>
References: <1452000361-13640-1-git-send-email-jprvita@endlessm.com>
	<1452000361-13640-2-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yk0-f176.google.com ([209.85.160.176]:35184 "EHLO
	mail-yk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751572AbcAENut convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Jan 2016 08:50:49 -0500
In-Reply-To: <1452000361-13640-2-git-send-email-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On Tue, Jan 5, 2016 at 3:26 PM, Jo=C3=A3o Paulo Rechi Vita <jprvita@gma=
il.com> wrote:
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

=46ew nitpicks below. In any case looks fine to me.

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

Hmm=E2=80=A6 Usually we leave this for OSVs (OS Vendors) to decide. Or,=
 like
you mentioned below, to the user.

> +       ---help---
> +         The Asus Wireless Radio Control handles the airplane mode h=
otkey
> +         present on some Asus laptops.
> +
> +         Say Y or M here if you have an ASUS notebook with an airpla=
ne mode
> +         hotkey.

=E2=80=A6here is inconsistency with default value.

> +
> +         If you choose to compile this driver as a module the module=
 will be
> +         called asus-wireless.
> +


> +++ b/drivers/platform/x86/asus-wireless.c
> @@ -0,0 +1,83 @@
> +/*
> + * Asus Wireless Radio Control Driver
> + *
> + * Copyright (C) 2015-2016 Endless Mobile, Inc.
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/types.h>
> +#include <linux/acpi.h>
> +#include <linux/input.h>
> +#include <linux/pci_ids.h>
> +
> +struct asus_wireless_data {
> +       struct input_dev *inputdev;

I would suggest
*inputdev -> *idev

> +};
> +
> +static void asus_wireless_notify(struct acpi_device *device, u32 eve=
nt)

In ACPI code and drivers we usually use struct acpi_device *adev.

> +{
> +       struct asus_wireless_data *data =3D acpi_driver_data(device);
> +
> +       dev_dbg(&device->dev, "event=3D0x%X\n", event);
> +       if (event !=3D 0x88) {
> +               dev_notice(&device->dev, "Unknown ASHS event: 0x%X\n"=
, event);
> +               return;

I believe %#X will work in both cases instead of 0x%X

> +       }
> +       input_report_key(data->inputdev, KEY_RFKILL, 1);
> +       input_report_key(data->inputdev, KEY_RFKILL, 0);
> +       input_sync(data->inputdev);
> +}
> +
> +static int asus_wireless_add(struct acpi_device *device)
> +{
> +       struct asus_wireless_data *data;
> +
> +       data =3D devm_kzalloc(&device->dev, sizeof(*data), GFP_KERNEL=
);
> +       if (!data)
> +               return -ENOMEM;
> +       device->driver_data =3D data;
> +
> +       data->inputdev =3D devm_input_allocate_device(&device->dev);
> +       if (!data->inputdev)
> +               return -ENOMEM;
> +       data->inputdev->name =3D "Asus Wireless Radio Control";
> +       data->inputdev->phys =3D "asus-wireless/input0";
> +       data->inputdev->id.bustype =3D BUS_HOST;
> +       data->inputdev->id.vendor =3D PCI_VENDOR_ID_ASUSTEK;
> +       set_bit(EV_KEY, data->inputdev->evbit);
> +       set_bit(KEY_RFKILL, data->inputdev->keybit);
> +       return input_register_device(data->inputdev);
> +}
> +
> +static int asus_wireless_remove(struct acpi_device *device)
> +{
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
> +       .name =3D "Asus Wireless Radio Control Driver",
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
> +MODULE_DESCRIPTION("Asus Wireless Radio Control Driver");
> +MODULE_AUTHOR("Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.com>");
> +MODULE_LICENSE("GPL");
> --
> 2.5.0
>



--=20
With Best Regards,
Andy Shevchenko
