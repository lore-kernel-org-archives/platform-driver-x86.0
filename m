From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: Re: [PATCH 6/6] Add MSI Wind WMI support
Date: Wed, 28 Nov 2012 20:03:10 +0200
Message-ID: <CAKErNvp3FptBG_XeEoevnB=158t5thxPDNkw6UztbWXxRgmRJA@mail.gmail.com>
References: <1353796141-1470-1-git-send-email-maxtram95@gmail.com>
 <1353796141-1470-7-git-send-email-maxtram95@gmail.com> <1354004064.21227.867.camel@linux-s257.site>
 <CAHR064g9oe4C+GswHYcq-Fr-WFnnxjLiHFKdtCEWuKYAs1tRfw@mail.gmail.com>
 <CAKErNvrmXTarBEZeXFwHOn6zD+Tg43sGhf3OwTGqVMFfyJ9SVg@mail.gmail.com> <1354058414.21227.933.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=Big5
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ia0-f174.google.com ([209.85.210.174]:57090 "EHLO
	mail-ia0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754443Ab2K1SDb convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 28 Nov 2012 13:03:31 -0500
Received: by mail-ia0-f174.google.com with SMTP id y25so10106481iay.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Nov 2012 10:03:31 -0800 (PST)
In-Reply-To: <1354058414.21227.933.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Lee, Chun-Yi" <jlee@novell.com>, Matthew Garrett <mjg@redhat.com>

2012/11/28 joeyli <jlee@suse.com>:
> =A9=F3 =A4G=A1A2012-11-27 =A9=F3 17:55 +0200=A1AMaxim Mikityanskiy =B4=
=A3=A8=EC=A1G
>> 2012/11/27 Corentin Chary <corentin.chary@gmail.com>:
>> > On Tue, Nov 27, 2012 at 8:14 AM, joeyli <jlee@suse.com> wrote:
>> >> Hi Maxim,
>> >>
>> >> =A9=F3 =A4=E9=A1A2012-11-25 =A9=F3 00:29 +0200=A1AMaxim Mikityans=
kiy =B4=A3=A8=EC=A1G
>> >>> Create a driver to support WMI found on MSI Wind laptops. This d=
river
>> >>> allows us to receive some additional keycodes for keys that are =
not
>> >>> handled without this driver.
>> >>>
>> >>> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
>> >>
>> >> I simply review this patch and looks there have many code the sam=
e with
>> >> msi-wmi.c. Does there have any reason didn't direct patch msi-wmi=
 but
>> >> need generate a new driver?
>> >
>> > Right, if it's only a keymap and guid change, plus 1 or 2 quirks, =
it
>> > may makes sense to be in msi-wind.c
>>
>> Compare msi-wind-wmi.c and dell-wmi-aio.c. They look very similar,
>> even more similar than msi-wind-wmi.c and msi-wmi.c. Why do you
>> recommend to merge msi-wind-wmi features into msi-wmi, but not
>> dell-wmi-aio?
>
> Because MSI and DELL are different manufacturers. For the similar cod=
e
> between different manufacturers we should extract those similar code =
to
> acpi wmi or platform framework.
>
>>
>> Look at dell-wmi.c, dell-wmi-aio.c and msi-wmi.c. They have lots of
>> common code and they differ only in GUIDs, keymap tables and some
>> quirks, but they are still different modules.
>
> Yes, because different manufacturers. For those common code need extr=
act
> to framework.
>
>>
>> msi-wind-wmi is WMI driver that only supports hotkey handling. Each
>> WMI driver providing this feature contains such code, so there is
>> nothing strange in that msi-wmi driver also contains such code.
>> msi-wmi is a driver for fully different laptop with fully different
>> WMI. It also handles backlight brightness and needs a quirk for hotk=
ey
>> handling. MSI Wind WMI does not send brightness change events and do=
es
>> not need that quirk.
>>
>> Do you still think I should merge msi-wind-wmi code into msi-wmi?
>
> Yes, your contribution is very good for MSI wind user, but I still th=
ink
> it's not worth to create a new driver for a small series.
>
> In Kconfig, it separate different platform driver by manufacturers, t=
hen
> the drivers of the same manufacturer are separate to different interf=
ace
> type (platform or wmi), or different hardware series like Laptop and
> AIO.
>
> Current help of MSI_WMI in Kconfig is:
>   help
>    Say Y here if you want to support WMI-based hotkeys on MSI laptops=
=2E
>
> Per this define, MSI wind series is undoubted a subset of MSI laptops=
=2E
>
> We can say the MSI wind is a series that should separate to different=
 driver,
> but I don't think MSI wind series is a big and complex series that wo=
rth to do that.

Okay, okay, if you really want to preserve one vendor - one driver
logic, I can make a patch for msi-wmi, but I think it will lead to
complication of code, lots of ifs and lots of code unused by U90/U100
but loaded in RAM.

>
> Thanks a lot!
> Joey Lee
>
>>
>> >
>> >>
>> >> Thanks a lot!
>> >> Joey Lee
>> >>
>> >>> ---
>> >>>  drivers/platform/x86/Kconfig        |  13 +++
>> >>>  drivers/platform/x86/Makefile       |   1 +
>> >>>  drivers/platform/x86/msi-wind-wmi.c | 169 +++++++++++++++++++++=
+++++++++++++++
>> >>>  3 files changed, 183 insertions(+)
>> >>>  create mode 100644 drivers/platform/x86/msi-wind-wmi.c
>> >>>
>> >>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86=
/Kconfig
>> >>> index c86bae8..46f269e5 100644
>> >>> --- a/drivers/platform/x86/Kconfig
>> >>> +++ b/drivers/platform/x86/Kconfig
>> >>> @@ -561,6 +561,19 @@ config MSI_WMI
>> >>>        To compile this driver as a module, choose M here: the mo=
dule will
>> >>>        be called msi-wmi.
>> >>>
>> >>> +config MSI_WIND_WMI
>> >>> +     tristate "MSI Wind WMI Driver"
>> >>> +     depends on ACPI_WMI
>> >>> +     depends on INPUT
>> >>> +     select INPUT_SPARSEKMAP
>> >>> +     ---help---
>> >>> +      Say Y here if you want to support WMI-based hotkeys on MS=
I Wind
>> >>> +      laptops. MSI Wind WMI differs from WMI found on other MSI=
 laptops, so
>> >>> +      say Y here if you have MSI Wind, otherwise select "MSI WM=
I extras".
>> >>> +
>> >>> +      To compile this driver as a module, choose M here: the mo=
dule will
>> >>> +      be called msi-wind-wmi.
>> >>> +
>> >>>  config TOPSTAR_LAPTOP
>> >>>       tristate "Topstar Laptop Extras"
>> >>>       depends on ACPI
>> >>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x8=
6/Makefile
>> >>> index bf7e4f9..44389c0 100644
>> >>> --- a/drivers/platform/x86/Makefile
>> >>> +++ b/drivers/platform/x86/Makefile
>> >>> @@ -30,6 +30,7 @@ obj-$(CONFIG_INTEL_MENLOW)  +=3D intel_menlow.=
o
>> >>>  obj-$(CONFIG_ACPI_WMI)               +=3D wmi.o
>> >>>  obj-$(CONFIG_MSI_WMI)                +=3D msi-wmi.o
>> >>>  obj-$(CONFIG_TOPSTAR_LAPTOP) +=3D topstar-laptop.o
>> >>> +obj-$(CONFIG_MSI_WIND_WMI)   +=3D msi-wind-wmi.o
>> >>>
>> >>>  # toshiba_acpi must link after wmi to ensure that wmi devices a=
re found
>> >>>  # before toshiba_acpi initializes
>> >>> diff --git a/drivers/platform/x86/msi-wind-wmi.c b/drivers/platf=
orm/x86/msi-wind-wmi.c
>> >>> new file mode 100644
>> >>> index 0000000..4f19434
>> >>> --- /dev/null
>> >>> +++ b/drivers/platform/x86/msi-wind-wmi.c
>> >>> @@ -0,0 +1,169 @@
>> >>> +/*
>> >>> + * MSI Wind WMI hotkeys
>> >>> + *
>> >>> + * Copyright (C) 2012 Maxim Mikityanskiy <maxtram95@gmail.com>
>> >>> + *
>> >>> + *  This program is free software; you can redistribute it and/=
or modify
>> >>> + *  it under the terms of the GNU General Public License as pub=
lished by
>> >>> + *  the Free Software Foundation; either version 2 of the Licen=
se, or
>> >>> + *  (at your option) any later version.
>> >>> + *
>> >>> + *  This program is distributed in the hope that it will be use=
ful,
>> >>> + *  but WITHOUT ANY WARRANTY; without even the implied warranty=
 of
>> >>> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See t=
he
>> >>> + *  GNU General Public License for more details.
>> >>> + *
>> >>> + *  You should have received a copy of the GNU General Public L=
icense
>> >>> + *  along with this program; if not, write to the Free Software
>> >>> + *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  0=
2111-1307  USA
>> >>> + */
>> >>> +
>> >>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> >>> +
>> >>> +#include <linux/module.h>
>> >>> +#include <linux/input.h>
>> >>> +#include <linux/input/sparse-keymap.h>
>> >>> +#include <linux/acpi.h>
>> >>> +
>> >>> +MODULE_AUTHOR("Maxim Mikityanskiy <maxtram95@gmail.com>");
>> >>> +MODULE_DESCRIPTION("MSI Wind laptop WMI hotkeys driver");
>> >>> +MODULE_LICENSE("GPL");
>> >>> +
>> >>> +#define WMI_EVENT_GUID "5B3CC38A-40D9-7245-8AE6-1145B751BE3F"
>> >>> +
>> >>> +MODULE_ALIAS("wmi:" WMI_EVENT_GUID);
>> >>> +
>> >>> +/* Fn+F3 touchpad toggle */
>> >>> +#define WIND_KEY_TOUCHPAD    0x08
>> >>> +/* Fn+F11 Bluetooth toggle */
>> >>> +#define WIND_KEY_BLUETOOTH   0x56
>> >>> +/* Fn+F6 webcam toggle */
>> >>> +#define WIND_KEY_CAMERA              0x57
>> >>> +/* Fn+F11 Wi-Fi toggle */
>> >>> +#define WIND_KEY_WLAN                0x5f
>> >>> +/* Fn+F10 turbo mode toggle */
>> >>> +#define WIND_KEY_TURBO               0x60
>> >>> +/* Fn+F10 ECO mode toggle */
>> >>> +#define WIND_KEY_ECO         0x69
>> >>> +
>> >>> +static struct key_entry wind_keymap[] =3D {
>> >>> +     /* These keys work without WMI. Ignore them to avoid doubl=
e keycodes */
>> >>> +     { KE_IGNORE, WIND_KEY_TOUCHPAD,         { KEY_TOUCHPAD_TOG=
GLE } },
>> >>> +     { KE_IGNORE, WIND_KEY_BLUETOOTH,        { KEY_BLUETOOTH } =
},
>> >>> +     { KE_IGNORE, WIND_KEY_CAMERA,           { KEY_CAMERA } },
>> >>> +     { KE_IGNORE, WIND_KEY_WLAN,             { KEY_WLAN } },
>> >>> +     /* These are keys that should be handled via WMI */
>> >>> +     { KE_KEY,    WIND_KEY_TURBO,            { KEY_PROG1 } },
>> >>> +     { KE_KEY,    WIND_KEY_ECO,              { KEY_PROG2 } },
>> >>> +     { KE_END, 0 }
>> >>> +};
>> >>> +
>> >>> +static struct input_dev *wind_input_dev;
>> >>> +
>> >>> +static void wind_wmi_notify(u32 value, void *context)
>> >>> +{
>> >>> +     struct acpi_buffer response =3D {
>> >>> +             .length         =3D ACPI_ALLOCATE_BUFFER,
>> >>> +             .pointer        =3D NULL
>> >>> +     };
>> >>> +     acpi_status status =3D wmi_get_event_data(value, &response=
);
>> >>> +     union acpi_object *obj =3D response.pointer;
>> >>> +     int code;
>> >>> +
>> >>> +     if (status !=3D AE_OK) {
>> >>> +             pr_warn("Bad event status %#x\n", status);
>> >>> +             return;
>> >>> +     }
>> >>> +
>> >>> +     if (!obj || obj->type !=3D ACPI_TYPE_INTEGER) {
>> >>> +             pr_warn("Unknown event received\n");
>> >>> +             goto wind_wmi_notify_free;
>> >>> +     }
>> >>> +
>> >>> +     code =3D obj->integer.value;
>> >>> +     pr_debug("Event code: %#x\n", code);
>> >>> +
>> >>> +     if (code =3D=3D 0x00 || code =3D=3D 0x62 || code =3D=3D 0x=
63) {
>> >>> +             /* Unknown events - drop them for now */
>> >>> +             goto wind_wmi_notify_free;
>> >>> +     }
>> >>> +
>> >>> +     if (!sparse_keymap_report_event(wind_input_dev, code, 1, t=
rue))
>> >>> +             pr_warn("Unknown key %#x pressed\n", code);
>> >>> +
>> >>> +wind_wmi_notify_free:
>> >>> +     kfree(response.pointer);
>> >>> +}
>> >>> +
>> >>> +static int __init wind_input_setup(void)
>> >>> +{
>> >>> +     int err;
>> >>> +
>> >>> +     wind_input_dev =3D input_allocate_device();
>> >>> +     if (!wind_input_dev)
>> >>> +             return -ENOMEM;
>> >>> +
>> >>> +     wind_input_dev->name =3D "MSI WMI hotkeys";
>> >>> +     wind_input_dev->phys =3D "wmi/input0";
>> >>> +     wind_input_dev->id.bustype =3D BUS_HOST;
>> >>> +
>> >>> +     err =3D sparse_keymap_setup(wind_input_dev, wind_keymap, N=
ULL);
>> >>> +     if (err)
>> >>> +             goto wind_input_setup_free_dev;
>> >>> +
>> >>> +     err =3D input_register_device(wind_input_dev);
>> >>> +     if (err)
>> >>> +             goto wind_input_setup_free_keymap;
>> >>> +
>> >>> +     return 0;
>> >>> +
>> >>> +wind_input_setup_free_keymap:
>> >>> +     sparse_keymap_free(wind_input_dev);
>> >>> +wind_input_setup_free_dev:
>> >>> +     input_free_device(wind_input_dev);
>> >>> +     return err;
>> >>> +}
>> >>> +
>> >>> +static int __init wind_wmi_init(void)
>> >>> +{
>> >>> +     int err;
>> >>> +
>> >>> +     if (!wmi_has_guid(WMI_EVENT_GUID)) {
>> >>> +             pr_err("No MSI Wind WMI found\n");
>> >>> +             return -ENODEV;
>> >>> +     }
>> >>> +
>> >>> +     err =3D wind_input_setup();
>> >>> +     if (err) {
>> >>> +             pr_err("Unable to setup input device\n");
>> >>> +             return err;
>> >>> +     }
>> >>> +
>> >>> +     if (ACPI_FAILURE(wmi_install_notify_handler(WMI_EVENT_GUID=
,
>> >>> +             wind_wmi_notify, NULL))) {
>> >>> +             pr_err("Unable to install WMI notify handler\n");
>> >>> +             err =3D -EIO;
>> >>> +             goto wind_wmi_init_unregister_input;
>> >>> +     }
>> >>> +
>> >>> +     pr_debug("Event handler installed\n");
>> >>> +
>> >>> +     return 0;
>> >>> +
>> >>> +wind_wmi_init_unregister_input:
>> >>> +     input_unregister_device(wind_input_dev);
>> >>> +     sparse_keymap_free(wind_input_dev);
>> >>> +     input_free_device(wind_input_dev);
>> >>> +     return err;
>> >>> +}
>> >>> +
>> >>> +static void __exit wind_wmi_exit(void)
>> >>> +{
>> >>> +     wmi_remove_notify_handler(WMI_EVENT_GUID);
>> >>> +     input_unregister_device(wind_input_dev);
>> >>> +     sparse_keymap_free(wind_input_dev);
>> >>> +     input_free_device(wind_input_dev);
>> >>> +}
>> >>> +
>> >>> +module_init(wind_wmi_init);
>> >>> +module_exit(wind_wmi_exit);
>> >>
>> >>
>> >> --
>> >> To unsubscribe from this list: send the line "unsubscribe platfor=
m-driver-x86" in
>> >> the body of a message to majordomo@vger.kernel.org
>> >> More majordomo info at  http://vger.kernel.org/majordomo-info.htm=
l
>> >
>> >
>> >
>> > --
>> > Corentin Chary
>> > http://xf.iksaif.net
>>
>
>
