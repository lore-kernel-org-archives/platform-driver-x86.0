From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] platform/x86: Add Acer Wireless Radio Control driver
Date: Tue, 21 Nov 2017 16:21:54 +0200
Message-ID: <CAHp75Vd6EpursnY1O+tO6dB1Zu_dbecbVSUGjWqpSnggHZd9MQ@mail.gmail.com>
References: <20171121053044.2424-1-chiu@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171121053044.2424-1-chiu@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Chiu <chiu@endlessm.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 21, 2017 at 7:30 AM, Chris Chiu <chiu@endlessm.com> wrote:
> New Acer laptops in 2018 will have a separate ACPI device for
> notifications from the airplane mode hotkey. The device name in
> the DSDT is SMKB and its ACPI _HID is 10251229.
>
> For these models, when the airplane mode hotkey (Fn+F3) pressed,
> a query 0x02 is started in the Embedded Controller, and all this
> query does is a notify SMKB with the value 0x80.
>
>         Scope (_SB.PCI0.LPCB.EC0)
>         {
>                 (...)
>                 Method (_Q02, 0, NotSerialized)  // _Qxx: EC Query
>                 {
>                     HKEV (0x2, One)
>                     Notify (SMKB, 0x80) // Status Change
>                 }
>         }
>
> Based on code from asus-wireless
>

Much better.
Pushed to my review and testing queue, thanks!

> Signed-off-by: Chris Chiu <chiu@endlessm.com>
> Reviewed-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
> ---
>
> Notes:
>   v2: less code and no redundant data structure
>
>  drivers/platform/x86/Kconfig         | 14 +++++++
>  drivers/platform/x86/Makefile        |  1 +
>  drivers/platform/x86/acer-wireless.c | 71 ++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 86 insertions(+)
>  create mode 100644 drivers/platform/x86/acer-wireless.c
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 80b87954f6dd..6c8b3eaf35df 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -36,6 +36,20 @@ config ACER_WMI
>           If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y =
or M
>           here.
>
> +config ACER_WIRELESS
> +        tristate "Acer Wireless Radio Control Driver"
> +        depends on ACPI
> +        depends on INPUT
> +        ---help---
> +          The Acer Wireless Radio Control handles the airplane mode hotk=
ey
> +          present on new Acer laptops.
> +
> +          Say Y or M here if you have an Acer notebook with an airplane =
mode
> +          hotkey.
> +
> +          If you choose to compile this driver as a module the module wi=
ll be
> +          called acer-wireless.
> +
>  config ACERHDF
>         tristate "Acer Aspire One temperature and fan driver"
>         depends on ACPI && THERMAL
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index 91cec1751461..4fd15503d842 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_DELL_WMI_LED)    +=3D dell-wmi-led.o
>  obj-$(CONFIG_DELL_SMO8800)     +=3D dell-smo8800.o
>  obj-$(CONFIG_DELL_RBTN)                +=3D dell-rbtn.o
>  obj-$(CONFIG_ACER_WMI)         +=3D acer-wmi.o
> +obj-$(CONFIG_ACER_WIRELESS)    +=3D acer-wireless.o
>  obj-$(CONFIG_ACERHDF)          +=3D acerhdf.o
>  obj-$(CONFIG_HP_ACCEL)         +=3D hp_accel.o
>  obj-$(CONFIG_HP_WIRELESS)      +=3D hp-wireless.o
> diff --git a/drivers/platform/x86/acer-wireless.c b/drivers/platform/x86/=
acer-wireless.c
> new file mode 100644
> index 000000000000..858037987b33
> --- /dev/null
> +++ b/drivers/platform/x86/acer-wireless.c
> @@ -0,0 +1,71 @@
> +/*
> + * Acer Wireless Radio Control Driver
> + *
> + * Copyright (C) 2017 Endless Mobile, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/input.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pci_ids.h>
> +#include <linux/types.h>
> +
> +static const struct acpi_device_id acer_wireless_acpi_ids[] =3D {
> +       {"10251229", 0},
> +       {"", 0},
> +};
> +MODULE_DEVICE_TABLE(acpi, acer_wireless_acpi_ids);
> +
> +static void acer_wireless_notify(struct acpi_device *adev, u32 event)
> +{
> +       struct input_dev *idev =3D acpi_driver_data(adev);
> +
> +       dev_dbg(&adev->dev, "event=3D%#x\n", event);
> +       if (event !=3D 0x80) {
> +               dev_notice(&adev->dev, "Unknown SMKB event: %#x\n", event=
);
> +               return;
> +       }
> +       input_report_key(idev, KEY_RFKILL, 1);
> +       input_report_key(idev, KEY_RFKILL, 0);
> +       input_sync(idev);
> +}
> +
> +static int acer_wireless_add(struct acpi_device *adev)
> +{
> +       struct input_dev *idev;
> +
> +       idev =3D devm_input_allocate_device(&adev->dev);
> +       if (!idev)
> +               return -ENOMEM;
> +
> +       adev->driver_data =3D idev;
> +       idev->name =3D "Acer Wireless Radio Control";
> +       idev->phys =3D "acer-wireless/input0";
> +       idev->id.bustype =3D BUS_HOST;
> +       idev->id.vendor =3D PCI_VENDOR_ID_AI;
> +       idev->id.product =3D 0x1229;
> +       set_bit(EV_KEY, idev->evbit);
> +       set_bit(KEY_RFKILL, idev->keybit);
> +
> +       return input_register_device(idev);
> +}
> +
> +static struct acpi_driver acer_wireless_driver =3D {
> +       .name =3D "Acer Wireless Radio Control Driver",
> +       .class =3D "hotkey",
> +       .ids =3D acer_wireless_acpi_ids,
> +       .ops =3D {
> +               .add =3D acer_wireless_add,
> +               .notify =3D acer_wireless_notify,
> +       },
> +};
> +module_acpi_driver(acer_wireless_driver);
> +
> +MODULE_DESCRIPTION("Acer Wireless Radio Control Driver");
> +MODULE_AUTHOR("Chris Chiu <chiu@gmail.com>");
> +MODULE_LICENSE("GPL v2");
> --
> 2.11.0
>



--=20
With Best Regards,
Andy Shevchenko
